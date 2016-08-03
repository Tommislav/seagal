package se.salomonsson.legacy.core;
import flash.events.Event;
import flash.events.EventDispatcher;
import haxe.ds.HashMap;


/**
 * Creates, stores and manages queries on entities
 * @author Tommislav
 */

class EntityManager {
	private var _entityCounter:Int = 0;
	private var _disposedEntities:Array<Int> = new Array<Int>();

	private var _entities:Array<Int>;
	private var _entityFlags:Array<Int>;
	private var _entityComponents:Array<Array<IComponent>>;
	
	private var _tags:Map<String, Int>;
	
	

	// This really needs to be looked over!
	private var _eventDispatcher:EventDispatcher;

	public function new() {
		_entities = new Array<Int>();
		_entityFlags = new Array<Int>();
		_entityComponents = new Array<Array<IComponent>>();
		_eventDispatcher = new EventDispatcher();
		_tags = new Map<String, Int>();
	}

	public function allocateEntity():EW {
		var entity:Int;
		if (_disposedEntities.length > 0)
			entity = _disposedEntities.shift();
		else {
			entity = _entityCounter++;
		}
		
		_entities.push(entity);
		_entityFlags[entity] = 0;
		_entityComponents[entity] = new Array<IComponent>();
		
		return new EW(entity, this);
	}

	public function destroyEntity(entity:Int):Void {
		if (_entities.remove(entity)) {
			dispatch(new EntityEvent(EntityEvent.ENTITY_DESTROYED, entity, this));
			_entityComponents[entity] = null;
			_entityFlags[entity] = 0;
			for (key in _tags.keys()) {
				if (_tags.get(key) == entity) {
					_tags.remove(key);
					break;
				}
			}
		}
		_disposedEntities.push(entity);
	}

	public function addComponentOn(component:IComponent, entity:Int):Void {
		
		if (_entityFlags[entity] & component._iFlag != 0) {
			throw "Component of type " + component + " already exist on entity";
		}
		
		_entityFlags[entity] |= component._iFlag;
		_entityComponents[entity].push(component);
	}

	public function removeComponentFrom(component:IComponent, entity:Int):Void {
		_entityFlags[entity] &= ~component._iFlag;
		_entityComponents[entity].remove(component);
	}


	public function hasComponent(entity:Int, compClass:Class<IComponent>):Bool { // Remove dynamic?
		var a = _entityFlags[entity];
		var b = (untyped compClass)._sFlag;
		var c = _entityFlags[entity] & (untyped compClass)._sFlag;
		return _entityFlags[entity] & (untyped compClass)._sFlag != 0;
	}

	/**
	 * Get an array of all existing components of a specific type, no matter which Entity it belongs to.
	 */

	public function getComponents<T>(componentClass:Class<T>):Array<T> {
		var ret:Array<T> = new Array<T>();

		var len:Int = _entities.length;
		var flag = (untyped componentClass)._sFlag;

		for (i in 0...len) {
			var e:Int = _entities[i];
			if ( _entityFlags[e] & flag > 0) {
				// TODO: Can we do this without this loop?
				var a = _entityComponents[e];
				for (j in 0...a.length) {
					if (a[j]._iFlag == flag) {
						
						#if cpp
						var comp = a[j];
						ret.push(untyped __cpp__("comp->__GetRealObject()"));
						#else
						//var comp = cast(a[j]);
						(untyped ret).push(a[j]);
						#end
					}
				}
			}
		}
		return ret;
	}

	/**
	 * Get a component of a specific type back from a known Entity.
	 * The component will be casted to the value you ask for, like
	 * getComponentOnEntity(myEntity, PositionComponent).x = 3;
	 */

	public function getComponentOnEntity<T>(entity:Int, componentClass:Class<T>):T {
		var flag:Int = (untyped componentClass)._sFlag;
		var comps = _entityComponents[entity];
		for (i in 0...comps.length) {
			if (comps[i]._iFlag == flag) {
				return cast comps[i]; //TODO: Is it possible to remove this cast?
			}
		}
		
		return null;
	}

	public function getAllComponents(entity:Int):Array<IComponent> {
		var ent = _entityComponents[entity];
		return (ent == null) ? new Array<IComponent>() : ent.copy();
	}

	/**
	 * get Entity With Components. Accepts an array of Component classes and will
	 * return an array of all Entities that contains ALL of those Components
	 * @param	compClasses
	 * @return Array of EW (lightweight EntityWrappers)
	 */

	public function getEWC(compClasses:Array<Dynamic>):Array<EW> { return getEntitiesWithComponents(compClasses); }

	public function getEntitiesWithComponents(compClasses:Array<Dynamic>):Array<EW> {
		var a:Array<EW> = new Array<EW>();
		var combinedFlag:Int = getCombinedFlag(compClasses);
		
		for (i in 0..._entities.length) {
			var e:Int = _entities[i];
			if (_entityFlags[e] & combinedFlag == combinedFlag) { //TODO: Is this really correct??? I think it should be!
				a.push(new EW(e, this));
			}
		}
		
		return a;
	}

	public inline function getCombinedFlag(compClasses:Array<Dynamic>):Int {
		var f:Int = 0;
		for (i in 0...compClasses.length) {
			f |= compClasses[i]._sFlag;
		}
		return f;
	}
	
	/**
	 * Assumes that only one component of this type exists in the entire manager.
	 * If more than one would exist, only the first occurance would be returned.
	 */

	public function getComponent<T>(componentClass:Class<T>):T {
		// TODO: OptIMiZE!!
		for (i in 0..._entities.length) {
			var c = getComponentOnEntity(_entities[i], componentClass);
			if (c != null)
				return c;
		}
		return null;
	}

	public function setTag(entity:Int, tag:String) {
		if (_tags.exists(tag)) {
			throw "Cannot declare tag '" + tag + "' twice";
		}
		_tags.set(tag, entity);
	}
	public function getTag(tag:String):EW {
		if (!_tags.exists(tag)) {
			throw "Entity with tag '" + tag + "' does not exist!";
		}
		return new EW(_tags[tag], this );
	}

	public function destroy() {
		var entityClone = _entities.slice(0, -1);
		for (i in 0...entityClone.length) {
			destroyEntity(entityClone[i]);
		}
		_disposedEntities = new Array<Int>();

	}




	public function dispatch(e:Event) {
		_eventDispatcher.dispatchEvent(e);
	}

	public function addListener(type, listener) {
		_eventDispatcher.addEventListener(type, listener);
	}

	public function removeListener(type, listener) {
		_eventDispatcher.removeEventListener(type, listener);
	}
}
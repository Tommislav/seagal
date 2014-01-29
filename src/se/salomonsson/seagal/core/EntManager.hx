package se.salomonsson.seagal.core;
import flash.events.Event;
import flash.events.EventDispatcher;


/**
 * Creates, stores and manages queries on entities
 * @author Tommislav
 */

class EntManager 
{
	private static var _entityCounter:Int = 0;
	private static var _disposedEntities:Array<Int> = new Array<Int>();
	
	private var _entities:Array<Int>;
	private var _entityHash:Array<Array<IComponent>>;
	
	// This really needs to be looked over!
	private var _eventDispatcher:EventDispatcher;
	
	public function new() 
	{
		_entities = new Array<Int>();
		_entityHash = new Array<Array<IComponent>>();
		_eventDispatcher = new EventDispatcher();
	}
	
	public function allocateEntity():EW
	{
		var entity:Int;
		if (_disposedEntities.length > 0)
			entity = _disposedEntities.shift();
		else
		{
			entity = _entityCounter++;
		}
		
		_entities.push(entity);
		_entityHash[entity] = new Array<IComponent>();
		
		return new EW(entity, this);
	}
	
	public function destroyEntity(entity:Int):Void
	{
		if (_entities.remove(entity))
		{
			dispatch(new EntityEvent(EntityEvent.ENTITY_DESTROYED, entity, this));
			_entityHash[entity] = null;
		}
		_disposedEntities.push(entity);
	}
	
	public function addComponentOn(component:IComponent, entity:Int):Void
	{
		if (_entityHash[entity] == null) {
			#if debug
				throw "No such entity exists";
			#end
			return;
		}
		
		_entityHash[entity].push(component);
	}
	
	public function removeComponentFrom(component:IComponent, entity:Int):Void
	{
		_entityHash[entity].remove(component);
	}
	
	
	public function hasComponent(entity:Int, compClass:Dynamic):Bool { // Remove dynamic?
		var entHash = _entityHash[entity];
		for (i in 0...entHash.length) {
			if (Std.is(entHash[i], compClass))
				return true;
		}
		return false;
	}
	
	/**
	 * Get all arrays of a given type, no matter which Entity it belongs to.
	 */
	public function getComponents<T>(componentClass:Class<T>):Array<T>
	{
		var ret:Array<T> = new Array<T>();
		
		var len:Int = _entities.length;
		
		for (i in 0...len)
		{
			var e:Int = _entities[i];
			var entHash:Array<IComponent> = _entityHash[e];
			for (j in 0...entHash.length)
			{
				if (Std.is(entHash[j], componentClass)) {
					#if cpp	
						var comp = entHash[j];
						ret.push( untyped __cpp__("comp->__GetRealObject()") );
					#else
						var comp = cast(entHash[j]);
						(untyped ret).push(entHash[j]);
					#end
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
	public function getComponentOnEntity<T>(entity:Int, componentClass:Class<T>):T
	{
		var ent = _entityHash[entity];
		
		if (ent == null)
			return null;
		
		for (i in 0...ent.length)
		{
			if (Std.is(ent[i], componentClass))
				return cast ent[i]; // TODO: Is it possible to remove this cast?
		}
		return null;
	}
	
	public function getAllComponents(entity:Int):Array<IComponent>
	{
		var ent = _entityHash[entity];
		return (ent == null) ? new Array<IComponent>() : ent.copy();
	}
	
	/**
	 * get Entity With Components. Accepts an array of Component classes and will
	 * return an array of all Entities that contains ALL of those Components
	 * @param	compClasses
	 * @return Array of EW (lightweight EntityWrappers)
	 */
	public function getEWC(compClasses:Array<Dynamic>):Array<EW>
	{
		var a:Array<EW> = new Array<EW>();
		
		for (i in 0..._entities.length)
		{
			var e:Int = _entities[i];
			var match = true;
			for (j in 0...compClasses.length)
			{
				if (getComponentOnEntity(e, cast compClasses[j]) == null)
				{
					match = false;
					break;
				}
			}
			if (match)
				a.push(new EW(e, this));
		}
		return a;
	}
	
	/**
	 * Assumes that only one component of this type exists in the entire manager.
	 * If more than one would exist, only the first occurance would be returned.
	 */
	public function getComp<T>(componentClass:Class<T>):T
	{
		// TODO: OptIMiZE!!
		for (i in 0..._entities.length)
		{
			var c = getComponentOnEntity(_entities[i], componentClass);
			if (c != null)
				return c;
		}
		return null;
	}
	
	
	public function destroy() {
		var entityClone = _entities.slice(0, -1);
		for (i in 0...entityClone.length)
		{
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
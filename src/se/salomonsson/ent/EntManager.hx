package se.salomonsson.ent;


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
	
	
	public function new() 
	{
		_entities = new Array<Int>();
		_entityHash = new Array<Array<IComponent>>();
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
		
		return new EW().wrap(entity, this);
	}
	
	public function destroyEntity(entity:Int):Void
	{
		if (_entities.remove(entity))
		{
			_entityHash[entity] = null;
		}
		_disposedEntities.push(entity);
	}
	
	public function addComponentOn(component:IComponent, entity:Int):Void
	{
		_entityHash[entity].push(component);
	}
	
	public function removeComponentFrom(component:IComponent, entity:Int):Void
	{
		_entityHash[entity].remove(component);
	}
	
	
	
	public function getComponents<T>(componentClass:Class<T>):Array<T>
	{
		var ret:Array<T> = new Array<T>();
		var len:Int = _entities.length;
		for (i in 0...len)
		{
			var e:Int = _entities[i];
			var entHash = _entityHash[e];
			for (j in 0...entHash.length)
			{
				if (Std.is(entHash[j], componentClass))
					ret.push(cast entHash[j]);
			}
		}
		
		//throw new Error("Failed to find component of type " + Type.getClassName(componentClass));
		return ret;
	}
	
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
				a.push(new EW().wrap(e, this));
		}
		return a;
	}
}
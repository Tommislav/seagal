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
		
	}
	
	public function addComponentOn(component:IComponent, entity:Int):Void
	{
		_entityHash[entity].push(component);
	}
	
	public function removeComponentFrom(component:IComponent, entity:Int):Void
	{
		
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
		for (i in 0...ent.length)
		{
			if (Std.is(ent[i], componentClass))
				return cast ent[i]; // TODO: Is it possible to remove this cast?
		}
		return null;
	}
	
}
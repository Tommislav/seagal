package se.salomonsson.ent;
import nme.errors.Error;

/**
 * Creates, stores and manages queries on entities
 * @author Tommislav
 */

class EntManager 
{
	private static var _entityCounter:Int = 0;
	private static var _disposedEntities:Array<Int> = new Array<Int>();
	
	private var _entities:Array<Int>;
	private var _entityHash:Array<IComponent>;
	
	
	public function new() 
	{
		_entityHash = new Array<IComponent>();
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
		
		return new EW().wrap(entity, this);
	}
	
	public function destroyEntity(entity:Int):Void
	{
		
	}
	
	public function addComponentOn(component:IComponent, entity:Int):Void
	{
		_entityHash.push(component);
	}
	
	public function removeComponentFrom(component:IComponent, entity:Int):Void
	{
		
	}
	
	
	
	public function getComponents<T>(componentClass:Class<T>):T
	{
		var len:Int = _entityHash.length;
		for (i in 0...len)
		{
			if (Std.is(_entityHash[i], componentClass))
				return cast _entityHash[i];
		}
		
		throw new Error("Failed to find component of type " + Type.getClassName(componentClass));
		return null;
	}
	
}
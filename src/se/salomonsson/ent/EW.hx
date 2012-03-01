package se.salomonsson.ent;

/**
 * ...
 * @author Tommislav
 */

class EW 
{

	public function new() 
	{
		
	}
	
	private var _entity:Int;
	private var _manager:EntManager;
	
	public function wrap(entity:Int, manager:EntManager):EW
	{
		_entity = entity;
		_manager = manager;
		return this;
	}
	
	public function addComponent(component:IComponent):EW
	{
		_manager.addComponentOn(component, _entity);
		return this;
	}
	
	/**
	 * Get component of type <T> registred for this entity.
	 */
	public function comp<T>(componentClass:Class<T>):T
	{
		var comp = _manager.getComponentOnEntity(_entity, componentClass);
		//if null, create and register
		return comp;
	}
	
	public function all():Array<IComponent>
	{
		return new Array<IComponent>(); // TODO
	}
	
	public function getEntity():Int { return _entity; }
	public function getManager():EntManager { return _manager; }
}
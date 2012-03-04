package se.salomonsson.ent;

/**
 * Entity Wrapper. Holds a reference to the actual entity (which is just a Int value)
 * and to the EntityManager. Makes it possible to chain method calls in a more
 * convenient way, such as:
 * maganer.allocateEntity().addComponent(new CompA()).addComponent(new CompB());
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
		
		//if null, create, register and return new instance
		if (comp == null)
		{
			var newComp = Type.createEmptyInstance(componentClass);
			addComponent(cast newComp);
			return newComp;
		}
		
		return comp;
	}
	
	public function all():Array<IComponent>
	{
		return _manager.getAllComponents(_entity);
	}
	
	public function getEntity():Int { return _entity; }
	public function getManager():EntManager { return _manager; }
}
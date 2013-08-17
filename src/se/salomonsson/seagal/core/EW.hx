package se.salomonsson.seagal.core;

/**
 * Entity Wrapper. Holds a reference to the actual entity (which is just a Int value)
 * and to the EntityManager. Makes it possible to chain method calls in a more
 * convenient way, such as:
 * maganer.allocateEntity().addComponent(new CompA()).addComponent(new CompB());
 * @author Tommislav
 */

class EW 
{
	private var _entity:Int;
	private var _manager:EntManager;
	
	/**
	 * Initiates a new EntityWrapper with the connectcion between the entityManager and the entity.
	 * @param	entity
	 * @param	manager
	 */
	public function new(entity:Int, manager:EntManager) 
	{
		_entity = entity;
		_manager = manager;
	}
	
	
	
	/**
	 * Will call the entity manager and register the component on the entity
	 * associated with this wrapper. Will return an instance of itself so you
	 * can chain several addComponent()-calls together on one line.
	 * @param	component	The component to be registred
	 * @return	reference of itself
	 */
	public function addComponent(component:IComponent):EW
	{
		_manager.addComponentOn(component, _entity);
		return this;
	}
	
	/**
	 * Will remove the linkage between the component instance to this entity
	 * @param	component	The instance of the component to be removed
	 * @return	reference to itself
	 */
	public function removeComponent(component:IComponent):EW
	{
		_manager.removeComponentFrom(component, _entity);
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
	
	public function hasComponent(compClass:Dynamic):Bool {
		return _manager.hasComponent(_entity, compClass);
	}
	
	
	/**
	 * Will return an array of all components registred to this entity
	 */
	public function all():Array<IComponent>
	{
		return _manager.getAllComponents(_entity);
	}
	
	/**
	 * Will unregister all components to this entity and delete the entity from the
	 * entity manager.
	 */
	public function destroy():Void
	{
		_manager.destroyEntity(_entity);
		//_manager = null;
	}
	
	
	public function getEntity():Int { return _entity; }
	public function getManager():EntManager { return _manager; }
}
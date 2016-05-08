package se.salomonsson.legacy.core;
import flash.events.Event;

/**
 * ...
 * @author Tommislav
 */

class EntityEvent extends Event
{
	public static inline var ENTITY_DESTROYED:String = "EntityEvent.ENTITY_DESTROYED";
	
	public var entity:Int;
	public var entManager:EntityManager;
	
	public function new(type:String, entity:Int, entManager:EntityManager)
	{
		super(type);
		this.entity = entity;
		this.entManager = entManager;
	}
	
}
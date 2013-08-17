package se.salomonsson.seagal.core;
import flash.events.Event;

/**
 * ...
 * @author Tommislav
 */

class EntityEvent extends Event
{
	public static inline var ENTITY_DESTROYED:String = "EntityEvent.ENTITY_DESTROYED";
	
	public var entity:Int;
	public var entManager:EntManager;
	
	public function new(type:String, entity:Int, entManager:EntManager) 
	{
		super(type);
		this.entity = entity;
		this.entManager = entManager;
	}
	
}
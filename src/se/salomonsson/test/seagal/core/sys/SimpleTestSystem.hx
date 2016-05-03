package se.salomonsson.test.seagal.core.sys;
import se.salomonsson.seagal.core.GameTime;
import se.salomonsson.seagal.core.System;

/**
 * ...
 * @author Tommislav
 */

class SimpleTestSystem extends System
{
	public var tickCount:Int;
	
	public function new() 
	{
		super();
		tickCount = 0;
	}
	
	override public function tick(gt:GameTime):Void 
	{
		tickCount++;
	}
	
	public function getSysManager()
	{
		return getManager();
	}
}
package se.salomonsson.test.sys;
import se.salomonsson.ent.GameTime;
import se.salomonsson.ent.Sys;

/**
 * ...
 * @author Tommislav
 */

class SimpleTestSystem extends Sys
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
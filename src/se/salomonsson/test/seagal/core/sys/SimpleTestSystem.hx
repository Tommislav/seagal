package se.salomonsson.test.seagal.core.sys;
import se.salomonsson.seagal.core.GameTime;
import se.salomonsson.seagal.core.Sys;

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
package se.salomonsson.legacy.core;

/**
 * ...
 * @author Tommislav
 */
class GameTimeImpl extends GameTime
{
	private var _tick:Int;
	
	public function new() { super(); }
	
	public function onTick() {
		_tick++;
	}
	
	override public function get_tick():Int { return _tick; }
	
}
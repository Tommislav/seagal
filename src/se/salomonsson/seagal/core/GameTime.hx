package se.salomonsson.seagal.core;

/**
 * Use as interface for concrete GameTime classes (with setters for the data)
 * @author Tommislav
 */

class GameTime
{
	var tick(get, null):Int;
	public function get_tick():Int { return 0; }
	
	public function new() {}
}
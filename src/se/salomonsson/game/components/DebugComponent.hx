package se.salomonsson.game.components;
import se.salomonsson.ent.IComponent;

/**
 * ...
 * @author Tommislav
 */

class DebugComponent implements IComponent
{
	public var debugText:String;
	
	public function new() { debugText = ""; }
	
}
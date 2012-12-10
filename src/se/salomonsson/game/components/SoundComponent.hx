package se.salomonsson.game.components;
import se.salomonsson.ent.IComponent;

/**
 * ...
 * @author Tommislav
 */

class SoundComponent implements IComponent
{

	public var queueSfx:Array<String>;
	
	public function new() {
		queueSfx = new Array<String>();
	}
	
}
package se.salomonsson.game.components;
import se.salomonsson.ent.IComponent;

/**
 * ...
 * @author Tommislav
 */

class KeyboardInputComponent implements IComponent
{

	public var keysDown:Array<UInt>;
	
	public function new()
	{
		keysDown = new Array<UInt>();
	}
	
	// this is not really allowed... =/
	public function getKeyIsDown(key:UInt):Bool {
		for (i in 0...keysDown.length)
			if (keysDown[i] == key)
				return true;
		
		return false;
	}
	
}
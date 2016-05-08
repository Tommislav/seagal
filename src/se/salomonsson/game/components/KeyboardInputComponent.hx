package se.salomonsson.game.components;
import se.salomonsson.legacy.core.IComponent;

/**
 * ...
 * @author Tommislav
 */

class KeyboardInputComponent implements IComponent
{

	public var keysDown:Array<Int>;
	
	public function new()
	{
		keysDown = new Array<Int>();
	}
	
	// this is not really allowed... =/
	public function getKeyIsDown(key:Int):Bool {
		for (i in 0...keysDown.length)
			if (keysDown[i] == key)
				return true;
		
		return false;
	}
	
}
package se.salomonsson.test.legacy.core.comp;
import se.salomonsson.legacy.core.IComponent;

/**
 * ...
 * @author Tommislav
 */

class StringComponent implements IComponent
{
	public var string:String;
	
	public function new(string:String) 
	{
		this.string = string;
	}
	
}
package se.salomonsson.test.comp;
import se.salomonsson.ent.IComponent;

/**
 * ...
 * @author Tommislav
 */

class StringComponent implements IComponent
{
	public var string:String;
	
	public function new(string:String="") 
	{
		this.string = string;
	}
	
}
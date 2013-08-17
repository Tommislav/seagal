package se.salomonsson.test.seagal.core.comp;
import se.salomonsson.seagal.core.IComponent;

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
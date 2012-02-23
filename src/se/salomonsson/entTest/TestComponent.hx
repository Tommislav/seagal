package se.salomonsson.entTest;
import se.salomonsson.ent.IComponent;

/**
 * ...
 * @author Tommislav
 */

class TestComponent implements IComponent
{
	public var value:String;
	
	public function new(value:String) 
	{
		this.value = value;
	}
	
}
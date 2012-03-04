package se.salomonsson.test.comp;
import se.salomonsson.ent.IComponent;

/**
 * Testcomponent holding a integer value
 * @author Tommislav
 */

class NumericComponent implements IComponent
{
	public var value:Int;
	
	public function new(value:Int=0) 
	{
		this.value = value;
	}
	
}
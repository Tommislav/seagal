package se.salomonsson.test.seagal.core.comp;
import se.salomonsson.seagal.core.IComponent;

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
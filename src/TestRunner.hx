package ;
import se.salomonsson.test.CoreTest;
import se.salomonsson.test.EntityManagerTest;
import se.salomonsson.test.SystemManagerTest;

/**
 * ...
 * @author Tommislav
 */

class TestRunner 
{

	
	public static function main() 
	{
		var runner:haxe.unit.TestRunner = new haxe.unit.TestRunner();
		runner.add( new EntityManagerTest() );
		runner.add( new CoreTest() );
		runner.add( new SystemManagerTest() );
		runner.run();
	}
	
}
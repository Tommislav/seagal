package ;
import se.salomonsson.test.legacy.core.CoreTest;
import se.salomonsson.test.legacy.core.EntityCacheTest;
import se.salomonsson.test.legacy.core.EntityManagerTest;
import se.salomonsson.test.legacy.core.SystemManagerTest;
import se.salomonsson.test.game.utils.PixelMapParserTest;

/**
 * ...
 * @author Tommislav
 */

class TestRunner 
{

	
	public function new() 
	{
		var runner:haxe.unit.TestRunner = new haxe.unit.TestRunner();
		runner.add( new EntityManagerTest() );
		runner.add( new CoreTest() );
		runner.add( new SystemManagerTest() );
		runner.add( new PixelMapParserTest() );
		runner.add( new EntityCacheTest() );
		runner.run();
	}
	
}
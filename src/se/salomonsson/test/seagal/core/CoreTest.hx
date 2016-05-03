package se.salomonsson.test.seagal.core;
import haxe.unit.TestCase;
import se.salomonsson.seagal.core.Core;
import se.salomonsson.seagal.core.EntityManager;
import se.salomonsson.seagal.core.SystemManager;

/**
 * ...
 * @author Tommislav
 */

class CoreTest extends TestCase
{

	public function testCoreSetup()
	{
		var core = new Core();
		var sm = Std.is(core.getSystemManager(), SystemManager) ? "sysManager" : "err";
		assertEquals("sysManager", sm);
		
		var em = Std.is(core.getEntManager(), EntityManager) ? "entManager" : "err";
		assertEquals("entManager", em);
	}
	
}
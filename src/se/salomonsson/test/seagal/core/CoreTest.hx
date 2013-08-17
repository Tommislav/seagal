package se.salomonsson.test.seagal.core;
import haxe.unit.TestCase;
import se.salomonsson.seagal.core.Core;
import se.salomonsson.seagal.core.EntManager;
import se.salomonsson.seagal.core.SysManager;

/**
 * ...
 * @author Tommislav
 */

class CoreTest extends TestCase
{

	public function testCoreSetup()
	{
		var core = new Core();
		var sm = Std.is(core.getSystemManager(), SysManager) ? "sysManager" : "err";
		assertEquals("sysManager", sm);
		
		var em = Std.is(core.getEntManager(), EntManager) ? "entManager" : "err";
		assertEquals("entManager", em);
	}
	
}
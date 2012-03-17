package se.salomonsson.test;
import haxe.unit.TestCase;
import se.salomonsson.ent.Core;
import se.salomonsson.ent.EntManager;
import se.salomonsson.ent.SysManager;

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
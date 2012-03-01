package se.salomonsson.test;
import haxe.unit.TestCase;
import se.salomonsson.ent.EntManager;
import se.salomonsson.ent.EW;
import se.salomonsson.test.comp.StringComponent;

/**
 * ...
 * @author Tommislav
 */

class EntityManagerTest extends TestCase
{

	public function testCreateEntity()
	{
		var manager:EntManager = new EntManager();
		var ew:EW = manager.allocateEntity();
		assertTrue( ew != null );
		assertEquals(manager, ew.getManager());
	}
	
	public function testGetOneComponent()
	{
		var manager:EntManager = new EntManager();
		manager.allocateEntity().addComponent(new StringComponent("test"));
		
		var comps:Array<StringComponent> = manager.getComponents(StringComponent);
		assertEquals(1, comps.length);
		assertEquals("test", comps[0].string);
	}
	
	public function testGetComponentFromEntity()
	{
		var manager:EntManager = new EntManager();
		var e1 = manager.allocateEntity().addComponent(new StringComponent("ett"));
		var e2 = manager.allocateEntity().addComponent(new StringComponent("två"));
		
		assertEquals("ett", e1.comp(StringComponent).string);
	}
}
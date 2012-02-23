package se.salomonsson.test;
import haxe.unit.TestCase;
import se.salomonsson.ent.EntManager;
import se.salomonsson.ent.EW;
import se.salomonsson.entTest.TestComponent;

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
		manager.allocateEntity().addComponent(new TestComponent("test"));
		
		assertEquals("test", manager.getComponents(TestComponent).value);
	}
	
}
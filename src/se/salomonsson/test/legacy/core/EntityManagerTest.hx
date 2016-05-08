package se.salomonsson.test.legacy.core;
import haxe.unit.TestCase;
import se.salomonsson.legacy.core.EntityManager;
import se.salomonsson.legacy.core.EW;
import se.salomonsson.test.legacy.core.comp.NumericComponent;
import se.salomonsson.test.legacy.core.comp.StringComponent;

/**
 * Tests on the Entity Manager and Entity Wrapper class.
 * Test the functionality of adding, removing and retrieving components from a
 * entity. Feel free to change the implementation of the EntityManager and EW-class
 * as long as all these test passes =)
 * @author Tommislav
 */

class EntityManagerTest extends TestCase
{

	public function testCreateEntity()
	{
		var manager:EntityManager = new EntityManager();
		var ew:EW = manager.allocateEntity();
		assertTrue( ew != null );
		assertEquals(manager, ew.getManager());
	}
	
	public function testGetOneComponent()
	{
		var manager:EntityManager = new EntityManager();
		manager.allocateEntity().addComponent(new StringComponent("test"));
		
		assertEquals("test", manager.getComponents(StringComponent)[0].string);
		
		var comps = manager.getComponents(StringComponent);
		var comp:StringComponent = comps[0];
		assertEquals(1, comps.length);
		assertTrue(Std.is(comp, StringComponent));
		
		assertEquals("test", comp.string);
		
		var compFromEnt:StringComponent = manager.getComponent(StringComponent);
		assertEquals(compFromEnt, comp);
		assertEquals(compFromEnt.string, comp.string);
		assertEquals("test", compFromEnt.string);
		
	}
	
	
	public function testGetSingleComponent()
	{
		var manager = new EntityManager();
		manager.allocateEntity().addComponent(new StringComponent("ett"));
		assertEquals("ett", manager.getComponent(StringComponent).string);
		
	}
	
	public function testGetComponentFromEntity()
	{
		var manager:EntityManager = new EntityManager();
		var ew1 = manager.allocateEntity().addComponent(new StringComponent("ett"));
		var ew2 = manager.allocateEntity().addComponent(new StringComponent("två"));
		
		assertEquals("ett", ew1.getComponent(StringComponent).string);
		assertEquals("två", ew2.getComponent(StringComponent).string);
	}
	
	public function testGetAllComponents()
	{
		var manager:EntityManager = new EntityManager();
		var e:EW = manager.allocateEntity().addComponent(new StringComponent("text")).addComponent(new NumericComponent(1));
		var all = e.all();
		assertEquals(2, all.length);
	}
	
	public function testCreateNonExistantComponent()
	{
		var manager:EntityManager = new EntityManager();
		var e:EW = manager.allocateEntity();
		
		// set value on non created component
		e.getComponent(StringComponent).string = "abc";
		
		// new component should be registred with the set value
		assertEquals("abc", e.getComponent(StringComponent).string);
	}
	
	public function testGetEntityFromSingleComponent()
	{
		var manager:EntityManager = new EntityManager();
		manager.allocateEntity()
			.addComponent(new StringComponent("ett"))
			.addComponent(new NumericComponent(1));
		
		manager.allocateEntity()
			.addComponent(new StringComponent("två"));
		
		manager.allocateEntity()
			.addComponent(new NumericComponent(3));
		
		manager.allocateEntity()
			.addComponent(new NumericComponent(4));
		
		assertEquals(2, manager.getEntitiesWithComponents([StringComponent]).length);
		assertEquals("ett", manager.getEntitiesWithComponents([StringComponent])[0].getComponent(StringComponent).string);
		assertEquals("två", manager.getEntitiesWithComponents([StringComponent])[1].getComponent(StringComponent).string);
		assertEquals(3, manager.getEntitiesWithComponents([NumericComponent]).length);
	}
	
	public function testGetEntityFromMultipleComponents()
	{
		var manager:EntityManager = new EntityManager();
		manager.allocateEntity()
			.addComponent(new StringComponent("ett"))
			.addComponent(new NumericComponent(1));
		
		manager.allocateEntity()
			.addComponent(new StringComponent("två"));
		
		manager.allocateEntity()
			.addComponent(new NumericComponent(3));
		
		assertEquals(1, manager.getEntitiesWithComponents([StringComponent, NumericComponent]).length);
	}
	
	
	public function testDestroyEntity()
	{
		var manager:EntityManager = new EntityManager();
		var entity:EW = manager.allocateEntity().addComponent(new StringComponent("test"));
		var intEnt:Int = entity.getEntity();
		entity.destroy();
		
		assertEquals(0, manager.getEntitiesWithComponents([StringComponent]).length);
		assertEquals(0, manager.getAllComponents(intEnt).length);
	}
	
	
	public function testRemoveComponentThroughManager()
	{
		var manager 		= new EntityManager();
		var stringComponent = new StringComponent("ett");
		var numComponent 	= new NumericComponent(1);
		var ew 				= manager.allocateEntity().addComponent(stringComponent).addComponent(numComponent);
		
		manager.removeComponentFrom( stringComponent, ew.getEntity() );
		assertEquals(1, ew.all().length);
	}
	
	public function testRemoveComponentThroughEW()
	{
		var manager 		= new EntityManager();
		var stringComponent = new StringComponent("ett");
		var numComponent 	= new NumericComponent(1);
		var ew 				= manager.allocateEntity().addComponent(stringComponent).addComponent(numComponent);
		
		ew.removeComponent(stringComponent);
		assertEquals(1, ew.all().length);
	}
	
	
}
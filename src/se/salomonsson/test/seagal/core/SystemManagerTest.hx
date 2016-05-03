package se.salomonsson.test.seagal.core;
import haxe.unit.TestCase;
import se.salomonsson.seagal.core.Core;
import se.salomonsson.seagal.core.GameTime;
import se.salomonsson.seagal.core.System;
import se.salomonsson.seagal.core.SystemManager;
import se.salomonsson.test.seagal.core.comp.StringComponent;
import se.salomonsson.test.seagal.core.sys.SimpleTestSystem;
import se.salomonsson.test.seagal.core.sys.WriteStringSystem;

/**
 * ...
 * @author Tommislav
 */

class SystemManagerTest extends TestCase {
	public function testAddSystem() {

		var core = new Core();
		var sys = new SimpleTestSystem();

		core.addSystem(sys, 1);
		assertEquals(0, sys.tickCount);


		core.tick();
		assertEquals(1, sys.tickCount);

		core.removeSystem(sys);
		core.tick();
		assertEquals(1, sys.tickCount);

		core.destroy();
	}

	public function testSystemParent() {
		var core = new Core();
		var sys = new SimpleTestSystem();
		core.addSystem(sys, 1);
		assertEquals(core.getSystemManager(), sys.getManager());
		core.destroy();
	}

	public function testSystemEntManager() {
		var core = new Core();
		var sys = new SimpleTestSystem();
		core.addSystem(sys, 1);
		assertEquals(core.getEntManager(), sys.em());
		core.destroy();
	}

	public function testAddSystemsOrderSamePrio() {
		var core = new Core();
		var comp = new StringComponent("");

		core.getEntManager().allocateEntity().addComponent(comp);
		core.addSystem(new WriteStringSystem("ett"), 1);
		core.addSystem(new WriteStringSystem("Två"), 1);
		core.addSystem(new WriteStringSystem("Tre"), 1);

		core.tick();
		assertEquals("ettTvåTre", comp.string);
		core.destroy();
	}

	public function testAddSystemsOrderCorrectPrio() {
		var core = new Core();
		var comp = new StringComponent("");

		core.getEntManager().allocateEntity().addComponent(comp);
		core.addSystem(new WriteStringSystem("ett"), 3);
		core.addSystem(new WriteStringSystem("Två"), 2);
		core.addSystem(new WriteStringSystem("Tre"), 1);

		core.tick();
		assertEquals("ettTvåTre", comp.string);
		core.destroy();
	}

	public function testAddSystemsOrderUnsortedPrio() {
		var core = new Core();
		var comp = new StringComponent("");

		core.getEntManager().allocateEntity().addComponent(comp);
		core.addSystem(new WriteStringSystem("Två"), 2);
		core.addSystem(new WriteStringSystem("ett"), 3);
		core.addSystem(new WriteStringSystem("Tre"), 1);

		core.tick();
		assertEquals("ettTvåTre", comp.string);
		core.destroy();
	}

	public function testPauseSingleSystem() {
		var core = new Core();
		var comp = new StringComponent("");
		
		core.getEntManager().allocateEntity().addComponent(comp);
		var s1 = core.addSystem(new WriteStringSystem("One"), 2);
		var s2 = core.addSystem(new WriteStringSystem("Two"), 1);
		
		core.tick();
		assertEquals("OneTwo", comp.string);
	
		s1.pause();
		
		core.tick();
		assertEquals("OneTwoTwo", comp.string);
		
		s1.resume();
		core.tick();
		assertEquals("OneTwoTwoOneTwo", comp.string);
	
	}
}
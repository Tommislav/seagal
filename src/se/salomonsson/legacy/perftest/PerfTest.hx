package se.salomonsson.legacy.perftest;
import haxe.Timer;
import se.salomonsson.legacy.core.EntityManager;
import se.salomonsson.legacy.core.Core;
class PerfTest {

	/*
	What we need to measure:

	1. Create n entities and add m components to each entity
	2. Let a system iterate over all components of type T
	3. Let a system iterate over all components of type T0, and in each iteration fetch that entities component of type T1
	4. Fetch all Entities which holds component of both T0 and T1
	 */

	public static inline var NUM_ENTITIES = 100000;
	public var log = "\n";

	public function new() {
		caseOne();
		caseTwo();
		caseFour();
		trace(log);
	}



	private inline function buildECS():Core {
		var c:Core = new Core();
		var em:EntityManager = c.getEntManager();
		for (i in 0...NUM_ENTITIES) {
			em.allocateEntity().addComponent(new TestComp1()).addComponent(new TestComp2());
		}
		return c;
	}


	public function caseOne() {
		var start:Float = Timer.stamp();

		var c:Core = buildECS();

		var tot:Float = Timer.stamp() - start;
		log += "* Test 1: Creating " + NUM_ENTITIES + " entities took " + tot + " sec\n";

		c.destroy();
	}

	public function caseTwo() {
		var c:Core = buildECS();
		c.getSystemManager().addSystem(new TestSystem1(), 1);

		var start:Float = Timer.stamp();

		c.tick();

		var tot:Float = Timer.stamp() - start;
		log += "* Test 2: getComponents(t0) took " + tot + " sec\n";
		c.destroy();
	}

	public function caseFour() {
		var c:Core = buildECS();
		c.getSystemManager().addSystem(new TestSystem3(), 1);

		var start:Float = Timer.stamp();
		c.tick();
		var tot:Float = Timer.stamp() - start;

		log += "* Test 3: getEWC([t0, t1])" + tot + " sec\n";
		c.destroy();
	}
}

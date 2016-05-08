package se.salomonsson.legacy.perftest;
import se.salomonsson.legacy.core.EW;
import se.salomonsson.legacy.core.GameTime;
import se.salomonsson.legacy.core.System;
class TestSystem3 extends System {
	public function new() {
		super();
	}

	override public function tick(gt:GameTime):Void {
		var entities:Array<EW> = entityManager.getEWC([TestComp1, TestComp2]);
		for (i in 0...entities.length) {
			var c1 = entities[i].getComponent(TestComp1).s = "hej";
			var c2 = entities[i].getComponent(TestComp2).s = "hopp";
		}
	}

}

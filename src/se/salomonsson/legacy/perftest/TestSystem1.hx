package se.salomonsson.legacy.perftest;
import se.salomonsson.legacy.core.GameTime;
import se.salomonsson.legacy.core.System;
class TestSystem1 extends System {
	public function new() {
		super();
	}

	override public function tick(gt:GameTime):Void {
		var comp1:Array<TestComp1> = entityManager.getComponents(TestComp1);
	}

}

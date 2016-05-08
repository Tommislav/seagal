package se.salomonsson.perftest;
import se.salomonsson.seagal.core.GameTime;
import se.salomonsson.seagal.core.System;
class TestSystem1 extends System {
	public function new() {
		super();
	}

	override public function tick(gt:GameTime):Void {
		var comp1:Array<TestComp1> = entityManager.getComponents(TestComp1);
	}

}

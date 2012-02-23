package;

import haxe.unit.TestRunner;
import nme.display.Bitmap;
import nme.display.StageAlign;
import nme.display.StageScaleMode;
import nme.Lib;
import se.salomonsson.entTest.TestEnt;
import se.salomonsson.iso.IsoGame;
import se.salomonsson.test.DummyTest;

/**
 * ...
 * @author Tommislav
 */

class Main 
{
	
	static public function main() 
	{
		var stage = Lib.current.stage;
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		// entry point
		
		var instance = new IsoGame(stage);
		
		var entTest = new TestEnt(stage);
	}
	
}
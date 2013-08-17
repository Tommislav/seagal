package;

import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.Lib;
import se.salomonsson.iso.IsoGame;

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
		
		trace("trace number 1");
		#if debug
			trace("trace if debug");
		#end
		
		#if unittest
			var instance = new TestRunner();
		#else
			var instance = new Test2dGame(stage);
		#end
	}
}
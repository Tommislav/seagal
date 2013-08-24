package;

import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.Lib;
import pgr.gconsole.GameConsole;
import pgr.gconsole.GCThemes;
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
		
		//#if unittest
			var instance = new TestRunner();
		//#else
			//var instance = new Test2dGame(stage);
			//GameConsole.toFront();
		//#end
		
		
	}
}
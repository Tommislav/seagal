package se.salomonsson.iso;
import nme.display.BitmapData;

/**
 * ...
 * @author Tommislav
 */

interface IRenderer 
{
	function init(map:Array<Array<Int>>, canvas:BitmapData):Void;
	function render():Void;
	
	function getTileAtPixel(x:Int, y:Int):Int;
	function setTileAtPixel(x:Int, y:Int, value:Int):Void;
}
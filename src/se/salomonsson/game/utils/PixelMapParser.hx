package se.salomonsson.game.utils;
import flash.display.BitmapData;

/**
 * saves a 2d bitmap and uses the color values as data
 * @author Tommislav
 */

class PixelMapParser 
{

	public var width (get, null):Int;
	public var height(get, null):Int;
	public var size(get, null):Int;
	
	private var _map:BitmapData;
	private var _originalMap:BitmapData;
	private var _width:Int;
	private var _height:Int;
	private var _size:Int;
	
	private var _hexArr:Array<String>;
	
	public function new(bd:BitmapData) {
		setMap(bd);
		_hexArr = new Array<String>();
		_hexArr = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"];
	}
	
	public function setMap(map:BitmapData):Void {
		_map = map.clone();
		_width = _map.width;
		_height = _map.height;
		_size = _width * _height;
		
		_originalMap = _map.clone();
	}
	
	
	private function get_width():Int {
		return _width;
	}
	
	private function get_height():Int {
		return _height;
	}
	
	private function get_size():Int {
		return _size;
	}
	
	
	public function atCoord(x:Int, y:Int):Int {
		return _map.getPixel(x, y);
	}
	
	public function setOverrideValueAtCoord(x:Int, y:Int, value:Int):Void {
		_map.setPixel(x, y, value);
	}
	
	public function clearOverrideValueAt(x:Int, y:Int):Void {
		var originalColor:Int = _originalMap.getPixel(x, y);
		_map.setPixel(x, y, originalColor);
	}
	
	public function clearAllOverrideValues():Void {
		_map = _originalMap.clone();
	}
	
	
	public function getHex(x:Int, y:Int):String {
		var str:String = "0x";
		var col:Int = atCoord(x, y);
		for (i in 0...6) {
			var indexSixToZero = (5 - i);
			var shiftHex:Int = indexSixToZero * 4;
			var singleHexValue:Int = (col >> shiftHex) & 0xf; // value 0-15
			str += _hexArr[singleHexValue];
		}
		return str;
	}
	
	public function getR(x:Int, y:Int):Int {
		return (atCoord(x, y) >> 16) & 0xFF;
	}
	
	public function getG(x:Int, y:Int):Int {
		return (atCoord(x, y) >> 8) & 0xFF;
	}
	
	public function getB(x:Int, y:Int):Int {
		return atCoord(x, y) & 0xFF;
	}
}
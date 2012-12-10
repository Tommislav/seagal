package se.salomonsson.game.utils;
import nme.display.BitmapData;

/**
 * ...
 * @author Tommislav
 */

class PixelMapParser 
{

	public var width (getWidth, null):Int;
	public var height(getHeight, null):Int;
	public var size(getSize, null):Int;
	
	private var _map:BitmapData;
	private var _width:Int;
	private var _height:Int;
	private var _size:Int;
	
	public function new(bd:BitmapData) {
		setMap(bd);
	}
	
	public function setMap(map:BitmapData):Void {
		_map = map;
		_width = _map.width;
		_height = _map.height;
		_size = _width * _height;
	}
	
	
	private function getWidth():Int {
		return _width;
	}
	
	private function getHeight():Int {
		return _height;
	}
	
	private function getSize():Int {
		return _size;
	}
	
	
	public function atCoord(x:Int, y:Int):Int {
		return _map.getPixel(x, y);
	}
}
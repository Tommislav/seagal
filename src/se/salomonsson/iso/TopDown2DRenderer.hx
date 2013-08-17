package se.salomonsson.iso;
import flash.display.BitmapData;
import flash.geom.Point;
import flash.geom.Rectangle;
import openfl.Assets;

/**
 * ...
 * @author Tommislav
 */

class TopDown2DRenderer implements IRenderer
{
	private var _canvas:BitmapData;
	private var _canvasRect:Rectangle;
	private var _map:Array<Array<Int>>;
	
	private var _tileW:Int;
	private var _tileH:Int;
	
	private var _p:Point;
	private var _r:Rectangle;
	
	private var _floor0:BitmapData;
	private var _floor1:BitmapData;
	private var _floor2:BitmapData;
	private var _tiles:Array<BitmapData>;
	
	public function new() 
	{
		
	}
	
	/* INTERFACE se.salomonsson.ld23.IRenderer */
	
	public function init(map:Array<Array<Int>>, canvas:BitmapData):Void 
	{
		_map = map;
		_canvas = canvas;
		_canvasRect = new Rectangle(0, 0, _canvas.width, _canvas.height);
		
		_floor0 = Assets.getBitmapData("assets/floor_white_32x32.png");
		_floor1 = Assets.getBitmapData("assets/floor_shade_32x32.png");
		_floor2 = Assets.getBitmapData("assets/floor_red_32x32.png");
		
		_tiles = [_floor0, _floor1, _floor2, _floor2];
		
		_tileW = 32;
		_tileH = 32;
		
		_p = new Point();
		_r = new Rectangle(0, 0, _tileW, _tileH);
	}
	
	public function render():Void 
	{
		_canvas.lock();
		_canvas.fillRect(_canvasRect, 0xffffffcc);
		
		var w:Int = _map[0].length;
		var h:Int = _map.length;
		
		for (i in 0...h)
		{
			for (j in 0...w)
			{
				_p.y = i * (_tileH-1);
				_p.x = j * (_tileW - 1);
				var tile:BitmapData = _tiles[_map[i][j]];
				_canvas.copyPixels( tile, _r, _p, null, null, true );
			}
		}
		
		_canvas.unlock();
	}
	
	public function getTileAtPixel(x:Int, y:Int):Int 
	{
		var tileX = Math.floor(x / (_tileW-1));
		var tileY = Math.floor(y / (_tileH-1));
		if (validateCoordsInMap(tileX, tileY))
		{
			return _map[tileY][tileX];
		}
		return -1;
	}
	
	public function setTileAtPixel(x:Int, y:Int, value:Int):Void 
	{
		var tileX = Math.floor(x / (_tileW-1));
		var tileY = Math.floor(y / (_tileH-1));
		if (validateCoordsInMap(tileX, tileY))
		{
			_map[tileY][tileX] = value;
		}
	}
	
	private function validateCoordsInMap(x:Int, y:Int):Bool
	{
		if (x >= 0 && x < _map[0].length)
			if (y >= 0 && y < _map.length)
				return true;
		
		return false;
	}
	
}
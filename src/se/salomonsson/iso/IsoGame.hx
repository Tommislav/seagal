package se.salomonsson.iso;
import nme.display.Bitmap;
import nme.display.BitmapData;
import nme.display.DisplayObjectContainer;
import nme.events.TimerEvent;
import nme.geom.Point;
import nme.geom.Rectangle;
import nme.utils.Timer;

/**
 * ...
 * @author Tommislav
 */

class IsoGame 
{
	
	
	private var _holder:DisplayObjectContainer;
	
	private var _renderer1:IRenderer;
	private var _renderer2:IRenderer;
	
	private var _map:Array<Array<Int>>;
	
	private var _topdownBmp:Bitmap;
	private var _isoBmp:Bitmap;
	
	private var _lastTile:Int;
	private var _lastMouseX:Int;
	private var _lastMouseY:Int;
	
	public function new(holder:DisplayObjectContainer) 
	{
		_holder = holder;
		
		init();
	}
	
	private function init() 
	{
		
		var canvas1:BitmapData = new BitmapData(320, 320, true, 0xffffffff);
		_topdownBmp = new Bitmap(canvas1);
		_holder.addChild(_topdownBmp);
		
		var canvas2:BitmapData = new BitmapData(480, 320, true, 0xffffffff);
		_isoBmp = new Bitmap(canvas2);
		_isoBmp.x = 330;
		_holder.addChild(_isoBmp);
		
		_map = new Array<Array<Int>>();
		
		for (i in 0...10)
		{
			_map[i] = new Array<Int>();
			
			for (j in 0...10)
			{
				_map[i][j] = 0;
			}
		}
		
		_map[4][4] = 3; // 3d-block
		_map[5][4] = 3; // 3d-block
		_map[5][5] = 3; // 3d-block
		
		
		_renderer1 = new TopDown2DRenderer();
		_renderer1.init( _map, canvas1 );
		
		_renderer2 = new IsoRenderer();
		_renderer2.init( _map, canvas2 );
		
		var timer:Timer = new Timer(20, 0);
		timer.addEventListener(TimerEvent.TIMER, tick );
		timer.start();
		
	}
	
	private function tick(e:TimerEvent):Void 
	{
		execute();
		render();
	}
	
	private function execute():Void
	{
		var mX:Int = Std.int(_holder.mouseX);
		var mY:Int = Std.int(_holder.mouseY);
		
		//_renderer1.setTileAtPixel(_lastMouseX, _lastMouseY, _lastTile);
		_renderer2.setTileAtPixel(_lastMouseX, _lastMouseY, _lastTile);
		
		_lastTile = _renderer2.getTileAtPixel(mX, mY);
		
		//_renderer1.setTileAtPixel(mX, mY, 1);
		_renderer2.setTileAtPixel(mX, mY, 1);
		
		_lastMouseX = mX;
		_lastMouseY = mY;
	}
	
	private function render():Void
	{
		_renderer1.render();
		_renderer2.render();
	}
}
package se.salomonsson.game.systems;
import nme.Assets;
import nme.display.BitmapData;
import nme.geom.Point;
import nme.geom.Rectangle;
import se.salomonsson.ent.EW;
import se.salomonsson.ent.GameTime;
import se.salomonsson.ent.Sys;
import se.salomonsson.game.components.CameraComponent;
import se.salomonsson.game.components.CanvasComponent;
import se.salomonsson.game.components.DebugComponent;
import se.salomonsson.game.components.TileLayerComponent;
import se.salomonsson.game.components.ViewPortComponent;

/**
 * Renders a single layer of tiles.
 * @author Tommislav
 */

class RenderViewPortSystem extends Sys
{
	private var _viewport:EW;
	private var _layerId:String;
	private var _cameraId:String;
	private var _layer:TileLayerComponent;
	private var _camera:CameraComponent;
	private var _sheet:BitmapData;
	private var _debug:DebugComponent;
	
	private var _p:Point;
	private var _r:Rectangle;
	
	public function new(viewportId:String) 
	{
		super();
		_layerId = "main";
		
		_p = new Point();
		_r = new Rectangle(0,0,64,64);
		
		_sheet = Assets.getBitmapData("assets/Image1.png");
	}
	
	
	override public function tick(gt:GameTime):Void 
	{
		if (_layer == null)
			_layer = getLayerFromId(_layerId);
		
		if (_viewport == null)
			_viewport = em().getEWC([ViewPortComponent])[0];
			
		if (_debug == null)
			_debug = em().getComp(DebugComponent);
		
		var canvas:BitmapData = _viewport.comp(CanvasComponent).canvas;
		var camera:CameraComponent = _viewport.comp(CameraComponent);
		canvas.fillRect(new Rectangle(0, 0, 640, 480), 0xccaa33);
		
		var w:Int = Math.ceil(camera.width / 64) + 1;
		var h:Int = Math.ceil(camera.height / 64) + 1;
		var tileX:Int = Math.floor(camera.x / 64);
		var tileY:Int = Math.floor(camera.y / 64);
		
		var offX:Int = aboveZero(camera.x % 64, 64);	
		var offY:Int = aboveZero(camera.y % 64, 64);
		
		_debug.debugText = "tileX, tileY: " + tileX + "," + tileY + " : offX/offY: " + offX + "/" + offY;
		
		for (y in 0...h) {
			for (x in 0...w) {
				
				var col:Int = _layer.map.atCoord(x + tileX, y + tileY);
				if (col != 0xffffff) {
					
					if (col == 0x000000)
							_r.x = 0;
					else if(col == 0xff0000)
							_r.x = 64;
					
					_p.x = (x * 64) - offX;
					_p.y = (y * 64) - offY;
					canvas.copyPixels(_sheet, _r, _p);
				}
			}
		}
	}
	
	
	private function aboveZero(val:Int, range:Int):Int {
		if (val < 0)
			val += range;
		return val;
	}
	
	private function getLayerFromId(layerId:String)
	{
		var layerEntities = em().getComponents(TileLayerComponent);
		
		for (layer in layerEntities) {
			if (layer.name == layerId) {
				return layer;
			}
		}
		throw "failed to find tile layer with id '" + layerId + "'";
	}
	
	private function getCameraFromId(cameraId:String) 
	{
		var allCameras = em().getComponents(CameraComponent);
		
		for (camera in allCameras) {
			if (camera.name == cameraId) {
				return camera;
			}
		}
		throw "failed to find camera with id '" + cameraId + "'";
	}
}
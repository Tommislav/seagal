package se.salomonsson.game.systems;
import nme.Assets;
import nme.display.BitmapData;
import nme.geom.Point;
import nme.geom.Rectangle;
import se.salomonsson.ent.EW;
import se.salomonsson.ent.GameTime;
import se.salomonsson.ent.Sys;
import se.salomonsson.game.components.CameraComponent;
import se.salomonsson.game.components.TileLayerComponent;

/**
 * Renders a single layer.
 * @author Tommislav
 */

class TileRender2dSystem extends Sys
{
	private var _canvas:BitmapData;
	private var _layerId:String;
	private var _cameraId:String;
	private var _layer:TileLayerComponent;
	private var _camera:CameraComponent;
	private var _sheet:BitmapData;
	
	private var _p:Point;
	private var _r:Rectangle;
	
	public function new(canvas:BitmapData) 
	{
		super();
		_canvas = canvas;
		_layerId = "main";
		_cameraId = "camera";
		
		_p = new Point();
		_r = new Rectangle(0,0,64,64);
		
		_sheet = Assets.getBitmapData("assets/Image1.png");
	}
	
	
	override public function tick(gt:GameTime):Void 
	{
		if (_layer == null)
			_layer = getLayerFromId(_layerId);
		
		if (_camera == null)
			_camera = getCameraFromId(_cameraId);
		
		
		_canvas.fillRect(new Rectangle(0, 0, 640, 480), 0xccaa33);
		
		var w:Int = Math.floor(_camera.width / 64) + 1;
		var h:Int = Math.floor(_camera.height / 64) + 1;
		var startX:Int = Math.floor(_camera.x / 64);
		var startY:Int = Math.floor(_camera.y / 64);
		
		var offX:Int = startX - (_camera.x % 64);
		var offY:Int = startY - (_camera.y % 64);
		
		for (y in 0...h) {
			for (x in 0...w) {
				
				var col:Int = _layer.map.atCoord(x + startX, y + startY);
				if (col != 0xffffff) {
					
					if (col == 0x000000)
							_r.x = 0;
					else if(col == 0xff0000)
							_r.x = 64;
					
					_p.x = (x * 64) + offX;
					_p.y = (y * 64) + offY;
					_canvas.copyPixels(_sheet, _r, _p);
				}
			}
		}
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
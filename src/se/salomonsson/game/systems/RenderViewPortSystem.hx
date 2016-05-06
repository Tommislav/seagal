package se.salomonsson.game.systems;
import flash.display.Graphics;
import se.salomonsson.game.components.TileSheetComponent;
import openfl.display.Tilesheet;
import pgr.dconsole.DC;
import se.salomonsson.seagal.debug.SLogger;
import openfl.Assets;
import flash.display.BitmapData;
import flash.geom.Point;
import flash.geom.Rectangle;
import se.salomonsson.seagal.core.EW;
import se.salomonsson.seagal.core.GameTime;
import se.salomonsson.seagal.core.System;
import se.salomonsson.game.components.CameraComponent;
import se.salomonsson.game.components.CanvasComponent;
import se.salomonsson.game.components.DebugComponent;
import se.salomonsson.game.components.TileLayerComponent;
import se.salomonsson.game.components.ViewPortComponent;

/**
 * Renders a single layer of tiles.
 * @author Tommislav
 */

class RenderViewPortSystem extends System {
	private var _viewport:EW;
	private var _layerId:String;
	private var _cameraId:String;
	private var _layer:TileLayerComponent;
	private var _sheet:Tilesheet;
	private var _debug:DebugComponent;

	private var _canvas:Graphics;
	private var _camera:CameraComponent;

	public function new(viewportId:String) {
		super();
		_layerId = "main";
	}

	override public function onAdded(sm, em):Void {
		super.onAdded(sm, em);
		_sheet = entityManager.getComponent(TileSheetComponent).sheet;
	}




	override public function tick(gt:GameTime):Void {

		DC.beginProfile("Render");

		if (_layer == null) {
			_layer = getLayerFromId(_layerId);
		}

		if (_canvas == null) {
			_canvas = entityManager.getComponent(CanvasComponent).canvas;
		}

		if (_camera == null) {
			_camera = entityManager.getComponent(CameraComponent);
		}


		var tileData:Array<Float> = new Array<Float>();
		_canvas.clear();

		var camX:Float = _camera.x * _layer.scrollX;
		var camY:Float = _camera.y * _layer.scrollY;

		var w:Int = Math.ceil(_camera.width / 64) + 1;
		var h:Int = Math.ceil(_camera.height / 64) + 1;
		var tileX:Int = Math.floor(camX / 64);
		var tileY:Int = Math.floor(camY / 64);

		var offX = aboveZero(camX % 64, 64);
		var offY = aboveZero(camY % 64, 64);

		for (y in 0...h) {
			for (x in 0...w) {

				var col:Int = _layer.map.atCoord(x + tileX, y + tileY);
				if (col != 0xffffff) {

					var tileId = 0;
					if (col == 0x000000)
						tileId = 0;
					else if (col == 0xff0000)
						tileId = 1;

					var x:Float = (x * 64) - offX;
					var y:Float = (y * 64) - offY;

					tileData.push(x);
					tileData.push(y);
					tileData.push(tileId);
				}
			}
		}

		_sheet.drawTiles(_canvas, tileData);

		DC.endProfile("Render");
	}


	private function aboveZero(val:Float, range:Float):Float {
		if (val < 0)
			val += range;
		return val;
	}

	private function getLayerFromId(layerId:String) {
		var layerEntities = em().getComponents(TileLayerComponent);

		for (layer in layerEntities) {
			if (layer.name == layerId) {
				return layer;
			}
		}
		throw "failed to find tile layer with id '" + layerId + "'";
	}

	private function getCameraFromId(cameraId:String) {
		var allCameras = em().getComponents(CameraComponent);

		for (camera in allCameras) {
			if (camera.name == cameraId) {
				return camera;
			}
		}
		throw "failed to find camera with id '" + cameraId + "'";
	}
}
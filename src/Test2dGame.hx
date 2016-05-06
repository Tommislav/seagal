package ;
import se.salomonsson.game.components.TileSheetComponent;
import flash.display.Sprite;
import openfl.display.Tilesheet;
import pgr.dconsole.DC;
import se.salomonsson.seagal.debug.SLogger;
import flash.geom.Rectangle;
import flash.geom.Point;
import openfl.Assets;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Stage;
import flash.events.Event;
import se.salomonsson.game.systems.MoveCameraWithKeyboardSystem;
import se.salomonsson.seagal.core.Core;
import se.salomonsson.game.components.CameraComponent;
import se.salomonsson.game.components.CanvasComponent;
import se.salomonsson.game.components.DebugComponent;
import se.salomonsson.game.components.SineMoveCameraSystem;
import se.salomonsson.game.components.TileLayerComponent;
import se.salomonsson.game.components.TileModelComponent;
import se.salomonsson.game.components.ViewPortComponent;
import se.salomonsson.game.systems.DebugCameraPositionSystem;
import se.salomonsson.game.systems.KeyboardInputSystem;
import se.salomonsson.game.systems.RenderViewPortSystem;
import se.salomonsson.game.utils.PixelMapParser;

/**
 * ...
 * @author Tommislav
 */

	// TileModel: holds data for tiles
	// Layer: index, tileData, scrollXY



class Test2dGame {
	private var _stage:Stage;
	private var _core:Core;

	public function new(stage:Stage) {
		stage.frameRate = 60;
		_stage = stage;
		_core = new Core();

		var map:PixelMapParser = new PixelMapParser(Assets.getBitmapData("assets/map.png"));
		var tiles:BitmapData = Assets.getBitmapData("assets/Image1.png");

		var sheet:Tilesheet = new Tilesheet(tiles);
		sheet.addTileRect(new Rectangle(0,0,64,64));
		sheet.addTileRect(new Rectangle(64,0,64,64));

		//var canvas:BitmapData = buildCanvas(640, 480);
		var canvas:Sprite = new Sprite();
		canvas.scrollRect = new Rectangle(0,0,600, 480); // don't work on html5 target
		canvas.x = canvas.y = 70;
		_stage.addChild(canvas);


		_core.getEntManager().allocateEntity()
		.addComponent(new ViewPortComponent("main"))
		.addComponent(new CameraComponent("camera"))
		.addComponent(TileSheetComponent.build(sheet))
		.addComponent(CanvasComponent.build(canvas.graphics));

		_core.getEntManager().allocateEntity()
		.addComponent(TileLayerComponent.build("main", 10, map));


		_core.getEntManager().allocateEntity().addComponent(new DebugComponent()); // remove in release build

		_core.addSystem(new KeyboardInputSystem(), 1);
		_core.addSystem(new MoveCameraWithKeyboardSystem(), 2);
		_core.addSystem(new SineMoveCameraSystem("camera"), 2);
		_core.addSystem(new RenderViewPortSystem("main"), 3); // TODO: Change so this uses tilesheet instead of drawPixel http://www.openfl.org/documentation/api/openfl/display/Tilesheet.html
		_core.addSystem(new DebugCameraPositionSystem(_stage), 4);

		SLogger.log(this, "framerate: " + stage.frameRate);

		_stage.addEventListener(Event.ENTER_FRAME, onEf);
	}

	private function onEf(e:Event):Void {
		DC.beginProfile("mainLoop");
		_core.tick();
		DC.endProfile("mainLoop");
	}


	private function buildCanvas(width:Int, height:Int):BitmapData {
		var bd:BitmapData = new BitmapData(width, height, false, 0xffcc00);
		var bmp:Bitmap = new Bitmap(bd);
		bmp.x = bmp.y = 10;
		_stage.addChild(bmp);

		return bd;
	}
}
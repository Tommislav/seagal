package ;
import nme.Assets;
import nme.display.Bitmap;
import nme.display.BitmapData;
import nme.display.Stage;
import nme.events.Event;
import se.salomonsson.ent.Core;
import se.salomonsson.game.components.CameraComponent;
import se.salomonsson.game.components.CanvasComponent;
import se.salomonsson.game.components.DebugComponent;
import se.salomonsson.game.components.SineMoveCameraSystem;
import se.salomonsson.game.components.TileLayerComponent;
import se.salomonsson.game.components.TileModelComponent;
import se.salomonsson.game.components.ViewPortComponent;
import se.salomonsson.game.systems.DebugCameraPositionSystem;
import se.salomonsson.game.systems.KeyboardInputSystem;
import se.salomonsson.game.systems.MoveCameraWithKeyboardSystem;
import se.salomonsson.game.systems.RenderViewPortSystem;
import se.salomonsson.game.utils.PixelMapParser;

/**
 * ...
 * @author Tommislav
 */

class Test2dGame 
{
	private var _stage:Stage;
	private var _core:Core;

	public function new(stage:Stage) 
	{
		_stage = stage;
		_core = new Core();
		
		var map:PixelMapParser = new PixelMapParser(Assets.getBitmapData("assets/map.gif"));
		var tiles:BitmapData = Assets.getBitmapData("assets/Image1.png");
		
		_core.getEntManager().allocateEntity()
			.addComponent(new ViewPortComponent("main"))
			.addComponent(new CameraComponent("camera"))
			.addComponent(TileModelComponent.build([tiles]))
			.addComponent(CanvasComponent.build(buildCanvas(640,480)));
		
		_core.getEntManager().allocateEntity()
			.addComponent(TileLayerComponent.build("main", 10, map));
		
			
		_core.getEntManager().allocateEntity().addComponent(new DebugComponent()); // remove in release build
		
		_core.addSystem(new KeyboardInputSystem(), 1);
		//_core.addSystem(new MoveCameraWithKeyboardSystem(), 2);
		_core.addSystem(new SineMoveCameraSystem("camera"), 2);
		_core.addSystem(new RenderViewPortSystem("main"), 3);
		_core.addSystem(new DebugCameraPositionSystem(_stage),4);
		
		
			
			
		_stage.addEventListener(Event.ENTER_FRAME, onEf);
	}
	
	private function onEf(e:Event):Void 
	{
		_core.tick();
	}
	
	
	private function buildCanvas(width:Int, height:Int):BitmapData {
		var bd:BitmapData = new BitmapData(width, height, false, 0xffcc00);
		var bmp:Bitmap = new Bitmap(bd);
		bmp.x = bmp.y = 10;
		_stage.addChild(bmp);
		
		return bd;
	}
}
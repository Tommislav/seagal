package se.salomonsson.game.systems;
import flash.display.DisplayObjectContainer;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import se.salomonsson.seagal.core.GameTime;
import se.salomonsson.seagal.core.Sys;
import se.salomonsson.game.components.CameraComponent;
import se.salomonsson.game.components.CanvasComponent;
import se.salomonsson.game.components.DebugComponent;

/**
 * ...
 * @author Tommislav
 */

class DebugCameraPositionSystem extends Sys
{
	private var _holder:DisplayObjectContainer;
	private var _tf:TextField;
	private var _camera:CameraComponent;
	
	
	public function new(holder:DisplayObjectContainer)  { 
		_holder = holder;
		super(); 
	}
	
	override public function onAdded(sm, em):Void 
	{
		super.onAdded(sm, em);
		
		_camera = em.getComp(CameraComponent);
		
		_tf = new TextField();
		_tf.x = 250;
		_tf.autoSize = TextFieldAutoSize.LEFT;
		_tf.background = true;
		_holder.addChild(_tf);
		tick(null);
	}
	
	override public function tick(gt:GameTime):Void 
	{
		var str:String = "Camera x=" + Std.int(_camera.x) + ", y=" + Std.int(_camera.y) + "\n";
		_tf.text = str;
	}
}
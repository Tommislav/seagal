package se.salomonsson.game.systems;
import nme.display.DisplayObjectContainer;
import nme.text.TextField;
import nme.text.TextFieldAutoSize;
import se.salomonsson.ent.GameTime;
import se.salomonsson.ent.Sys;
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
		_tf.autoSize = TextFieldAutoSize.LEFT;
		_tf.background = true;
		_holder.addChild(_tf);
		tick(null);
	}
	
	override public function tick(gt:GameTime):Void 
	{
		var debug = em().getComp(DebugComponent);
		var str:String = "Camera x=" + _camera.x + ", y=" + _camera.y + "\n" + debug.debugText;
		_tf.text = str;
	}
}
package se.salomonsson.game.components;
import flash.display.Stage;
import se.salomonsson.seagal.core.GameTime;
import se.salomonsson.seagal.core.Sys;

/**
 * ...
 * @author Tommislav
 */

class SineMoveCameraSystem extends Sys
{
	private var _name:String;
	private var _camera:CameraComponent;
	
	private var _w:Float;
	private var _h:Float;
	private var _cntX:Float;
	private var _cntY:Float;
	
	public function new(cameraName:String) 
	{
		super();
		_name = cameraName;
	}
	
	override public function onAdded(sm, em):Void 
	{
		super.onAdded(sm, em);
		_camera = em.getComp(CameraComponent);
		
		_w = 250;
		_h = 250;
		_cntX = 0;
		_cntY = 0;
	}
	
	override public function tick(gt:GameTime):Void 
	{
		_cntX += 0.05;
		_cntY += 0.01;
		_camera.x = 250 + Std.int(Math.sin(_cntX) * _w);
		_camera.y = 250 + Std.int(Math.cos(_cntY) * _h);
	}
}
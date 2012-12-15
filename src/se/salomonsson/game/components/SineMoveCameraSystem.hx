package se.salomonsson.game.components;
import nme.display.Stage;
import se.salomonsson.ent.GameTime;
import se.salomonsson.ent.Sys;

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
		
		_w = 1500;
		_h = 1500;
		_cntX = 0;
		_cntY = 0;
	}
	
	override public function tick(gt:GameTime):Void 
	{
		_cntX += 0.02;
		_cntY += 0.01;
		_camera.x = 1000 + Std.int(Math.sin(_cntX) * _w);
		_camera.y = 1000 + Std.int(Math.cos(_cntY) * _h);
	}
}
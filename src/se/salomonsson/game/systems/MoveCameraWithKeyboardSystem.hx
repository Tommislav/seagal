package se.salomonsson.game.systems;
import flash.ui.Keyboard;
import se.salomonsson.seagal.core.GameTime;
import se.salomonsson.seagal.core.System;
import se.salomonsson.game.components.CameraComponent;
import se.salomonsson.game.components.KeyboardInputComponent;

/**
 * ...
 * @author Tommislav
 */

class MoveCameraWithKeyboardSystem extends System
{

	public function new() { super(); }
	
	override public function tick(gt:GameTime):Void 
	{
		var speed = 1;
		var key:KeyboardInputComponent = em().getComponent(KeyboardInputComponent);
		var camera:CameraComponent = em().getComponent(CameraComponent);
		
		if (key.getKeyIsDown(Keyboard.LEFT))
			camera.x -= speed;
		if (key.getKeyIsDown(Keyboard.RIGHT))
			camera.x += speed;
			
		if (key.getKeyIsDown(Keyboard.UP))
			camera.y -= speed;
		if (key.getKeyIsDown(Keyboard.DOWN))
			camera.y += speed;
	}
	
}
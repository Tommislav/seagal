package se.salomonsson.game.systems;

import nme.display.Stage;
import nme.events.Event;
import nme.events.KeyboardEvent;
import nme.Lib;
import se.salomonsson.ent.EW;
import se.salomonsson.ent.Sys;
import se.salomonsson.game.components.KeyboardInputComponent;

/**
 * ...
 * @author Tommislav
 */

class KeyboardInputSystem extends Sys
{

	private var _stage:Stage;
	private var _keyboardComponent:EW;
	
	public function new() 
	{
		super();
	}
	
	override public function onAdded(sm, em):Void 
	{
		super.onAdded(sm, em);
		
		_keyboardComponent = em.allocateEntity().addComponent(new KeyboardInputComponent());
		
		
		_stage = Lib.current.stage;
		_stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		_stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
	}
	
	override public function onRemoved():Void 
	{
		super.onRemoved();
		_stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		_stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyUp);
	}
	
	private function onKeyDown(e:KeyboardEvent):Void 
	{
		var comp:KeyboardInputComponent = _keyboardComponent.comp(KeyboardInputComponent);
		var keyIsDown:Bool = false;
		for (i in 0...comp.keysDown.length) {
			if (comp.keysDown[i] == e.keyCode) {
				return;
			}
		}
		
		comp.keysDown.push(e.keyCode);
	}
	
	private function onKeyUp(e:KeyboardEvent):Void 
	{
		var comp:KeyboardInputComponent = _keyboardComponent.comp(KeyboardInputComponent);
		var keyIsDown:Bool = false;
		for (i in 0...comp.keysDown.length) {
			if (comp.keysDown[i] == e.keyCode) {
				comp.keysDown.splice(i, 1);
				return;
			}
		}
	}
	
}
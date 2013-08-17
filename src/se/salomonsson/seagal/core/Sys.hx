package se.salomonsson.seagal.core;
import flash.events.Event;

/**
 * Base class for a System
 * @author Tommislav
 */

class Sys {
	private var _sm:SysManager;
	private var _em:EntManager;
	private var _running:Bool;

	public function new() {
		_running = true;
	}

	public function onAdded(sm, em):Void {
		_sm = sm;
		_em = em;
	}

	public function onRemoved():Void { _sm = null; }
	public function getManager() { return _sm; }
	public function em():EntManager { return _em; } // change to getter method

	public function pause() {_running = false;}
	public function resume() {_running = true;}
	public function getIsRunning() {return _running;}
	
	public function dispatch(e:Event) {
		_sm.getEventDispatcher().dispatchEvent(e);
	}
	
	public function addListener(type, listener) {
		_sm.getEventDispatcher().addEventListener(type, listener);
	}
	
	public function removeListener(type, listener) {
		_sm.getEventDispatcher().removeEventListener(type, listener);
	}
	
	
	public function tick(gt:GameTime):Void {}
}
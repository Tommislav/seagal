package se.salomonsson.legacy.core;
import flash.events.Event;

/**
 * Base class for a System
 * @author Tommislav
 */

class System {
	private var _sm:SystemManager;
	private var _em:EntityManager;
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
	public function em():EntityManager { return _em; } // change to getter method

	public var entityManager(get, null):EntityManager;
	function get_entityManager() {
		return _em;
	}

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
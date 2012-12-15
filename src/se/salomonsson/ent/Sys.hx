package se.salomonsson.ent;

/**
 * ...
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

	public function onRemoved() { _sm = null; }
	public function getManager() { return _sm; }
	public function em():EntManager { return _em; } // change to getter method

	public function pause() {_running = false;}
	public function resume() {_running = true;}
	public function getIsRunning() {return _running;}
	
	public function tick(gt:GameTime):Void {}
}
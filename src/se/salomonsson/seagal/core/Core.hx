package se.salomonsson.seagal.core;
import se.salomonsson.seagal.core.SysManager;

/**
 * ...
 * @author Tommislav
 */

class Core {
	private var _sm:SysManager;
	private var _em:EntManager;

	public function new() {
		_em = new EntManager();
		setSystemManager(new SysManager("::default"));
	}

	public function tick() {
		_sm.tick();
	}

	public function setSystemManager(sm:SysManager):Void {
		_sm = sm;
		_sm.setEntManager(_em);
	}

	public function getSystemManager():SysManager {
		return _sm;
	}

	public function getEntManager():EntManager {
		return _em;
	}

	/**
	* Default priority?
	**/

	public function addSystem(sys:Sys, prio:Int) {
		_sm.addSystem(sys, prio);
		return sys;
	}

	public function removeSystem(sys:Sys) {
		_sm.removeSystem(sys);
	}

	public function destroy() {
		_sm.destroy();
		_em.destroy();
		_sm = null;
		_em = null;
	}
}
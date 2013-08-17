package se.salomonsson.seagal.core;
import pgr.gconsole.GameConsole;
import pgr.gconsole.GCThemes;
import se.salomonsson.seagal.core.SysManager;

/**
 * One core consists of a default SystemManager and a default EntityManager
 * @author Tommislav
 */

class Core {
	private var _sm:SysManager;
	private var _em:EntManager;
	private var _time:GameTimeImpl;

	public function new() {
		
		#if debug
			GameConsole.init(0.5, "DOWN", GCThemes.GREEN_THEME);
			GameConsole.log("Seagal Enitity System...");
		#end
		
		_em = new EntManager();
		setSystemManager(new SysManager("::default"));
		_time = new GameTimeImpl();
	}

	public function tick() {
		_time.onTick();
		
		_sm.tick(_time);
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
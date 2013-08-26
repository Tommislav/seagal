package se.salomonsson.seagal.core;
import flash.events.Event;
import se.salomonsson.seagal.core.SysManager;
import se.salomonsson.seagal.debug.SLogger;

/**
 * One core consists of a default SystemManager and a default EntityManager
 * @author Tommislav
 */

class Core {
	private var _sm:SysManager;
	private var _em:EntManager;
	private var _time:GameTimeImpl;

	public function new() {
		
		SLogger.init();
		
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

	public function dispatch(e:Event) {
		_sm.getEventDispatcher().dispatchEvent(e);
	}
	
	public function destroy() {
		_sm.destroy();
		_em.destroy();
		_sm = null;
		_em = null;
	}
}
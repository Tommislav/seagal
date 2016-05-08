package se.salomonsson.legacy.core;
import flash.events.Event;
import se.salomonsson.legacy.core.SystemManager;
import se.salomonsson.legacy.debug.SLogger;

/**
 * One core consists of a default SystemManager and a default EntityManager
 * @author Tommislav
 */

class Core {
	private var _sm:SystemManager;
	private var _em:EntityManager;
	private var _time:GameTimeImpl;

	public function new() {
		
		SLogger.init();

		_em = new EntityManager();
		setSystemManager(new SystemManager("::default"));
		_time = new GameTimeImpl();
	}

	public function tick() {
		_time.onTick();
		_sm.tick(_time);
	}

	public function setSystemManager(sm:SystemManager):Void {
		_sm = sm;
		_sm.setEntityManager(_em);
	}

	public function getSystemManager():SystemManager {
		return _sm;
	}

	public function getEntManager():EntityManager {
		return _em;
	}

	/**
	* Default priority?
	**/

	public function addSystem(sys:System, prio:Int) {
		_sm.addSystem(sys, prio);
		return sys;
	}

	public function removeSystem(sys:System) {
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
package se.salomonsson.seagal.core;
import flash.events.EventDispatcher;

/**
 * ...
 * @author Tommislav
 */

class SysManager 
{
	private var _id:String;
	private var _systemPriorities:Array<Int>;
	private var _sysHash:Array<Array<Sys>>;
	private var _em:EntManager;
	private var _dispatcher:EventDispatcher;
	private var _running:Bool;
	
	public function getId() { return _id; }
	public function new(id:String) 
	{
		_id = id;
		_systemPriorities = new Array<Int>();
		_sysHash = new Array<Array<Sys>>();
		_dispatcher = new EventDispatcher();
		_running = true;
	}
	
	public function setEntManager(em)
	{
		_em = em;
	}
	
	public function addSystem(sys, prio)
	{
		if (_sysHash[prio] == null)
		{
			_sysHash[prio] = new Array<Sys>();
			_systemPriorities.push(prio);
			_systemPriorities.sort(sortPrio);
		}
		
		_sysHash[prio].push(sys);
		sys.onAdded(this, _em);
	}
	
	private function sortPrio(a:Int, b:Int):Int
	{
		if (a == b)
			return 0;
		
		return (a > b) ? -1 : 1;
	}
	
	public function removeSystem(sys)
	{
		for (prioIndex in 0..._systemPriorities.length)
		{
			var prio = _systemPriorities[prioIndex];
			var s:Array<Sys> = _sysHash[prio];
			for (i in 0...s.length)
			{
				if (s[i] == sys)
				{
					s.remove(sys);
					sys.onRemoved();
					return;
				}
			}
		}
	}
	
	public function tick(gt:GameTime)
	{
		for (prioIndex in 0..._systemPriorities.length)
		{
			if (!_running)
				return;
			
			var prio = _systemPriorities[prioIndex];
			var s:Array<Sys> = _sysHash[prio];
			for (i in 0...s.length)
			{
				if (s[i].getIsRunning()) {
					s[i].tick(gt);
				}
			}
		}
	}
	
	public function pause() {
		_running = false;
	}
	
	public function resume() {
		_running = true;
	}
	
	public function getEventDispatcher():EventDispatcher { return _dispatcher; }
	
	public function destroy() {}
}
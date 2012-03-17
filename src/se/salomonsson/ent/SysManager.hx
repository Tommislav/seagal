package se.salomonsson.ent;

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
	
	
	public function getId() { return _id; }
	public function new(id:String) 
	{
		_id = id;
		_systemPriorities = new Array<Int>();
		_sysHash = new Array<Array<Sys>>();
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
	
	public function tick()
	{
		for (prioIndex in 0..._systemPriorities.length)
		{
			var prio = _systemPriorities[prioIndex];
			var s:Array<Sys> = _sysHash[prio];
			for (i in 0...s.length)
			{
				s[i].tick(null);
			}
		}
	}
	
	public function destroy() {}
}
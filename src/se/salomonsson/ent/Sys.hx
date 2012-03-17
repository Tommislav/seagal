package se.salomonsson.ent;

/**
 * ...
 * @author Tommislav
 */

class Sys 
{
	private var _sm:SysManager;
	private var _em:EntManager;
	
	public function new() 
	{
		
	}
	
	public function onAdded(sm, em) 
	{ 
		_sm = sm; 
		_em = em;
	}
	public function onRemoved() { _sm = null; }
	public function getManager() { return _sm; }
	public function em():EntManager { return _em; } // change to getter method
	
	public function tick(gt:GameTime):Void{}
}
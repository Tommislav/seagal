package se.salomonsson.seagal.core;

/**
 * Stores a lookup procedure for entities based on a number of components.
 * @author Tommislav
 */
class EntityCache
{
	private var _entityCache:Array<EW>;
	
	
	public function new() { }
	
	
	public function putCache(listOfEntities:Array<EW>, listOfComponents:Array<Dynamic>) 
	{
		_entityCache = listOfEntities;
	}
	
	public function hasCache(listOfComponents:Array<Dynamic>):Bool 
	{
		return true;
	}
	
	public function getCache(listOfComponents:Array<Dynamic>):Array<EW> 
	{
		return return _entityCache;
	}
	
	public function markComponentDirty(Class)
	{
		
	}
	
	public function clearCache()
	{
		
	}
}
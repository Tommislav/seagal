package se.salomonsson.seagal.core;

/**
 * Stores a lookup procedure for entities based on a number of components.
 * @author Tommislav
 */
class EntityCache
{
	private var _entityCache:Map<String,Array<EW>>;
	
	
	public function new() 
	{ 
		clearCache(); // Create new empty cache object
	}
	
	
	public function putCache(listOfEntities:Array<EW>, listOfComponents:Array<Dynamic>) 
	{
		var componentHash = hashifyComponents(listOfComponents);
		_entityCache[componentHash] = listOfEntities;
	}
	
	public function hasCache(listOfComponents:Array<Dynamic>):Bool 
	{
		var componentHash = hashifyComponents(listOfComponents);
		return _entityCache[componentHash] != null;
	}
	
	public function getCache(listOfComponents:Array<Dynamic>):Array<EW> 
	{
		var componentHash = hashifyComponents(listOfComponents);
		return _entityCache[componentHash];
	}
	
	public function markComponentDirty(dirtyComponent:Class)
	{
		var partOfComponentHash = hashifyComponents[dirtyComponent];
		for (fullHash in _entityCache.keys()) {
			if (fullHash.indexOf(partOfComponentHash) > -1) {
				_entityCache[fullHash] = null; // clear this hash, the component is part of this lookup
			}
		}
	}
	
	public function clearCache()
	{
		_entityCache = new Map <String, Array<EW>>();
	}
	
	
	
	
	
	// Speed this one up! We could use a map<Class,ReflectedString> if that speeds things up. Investigate!
	function hashifyComponents(listOfComponents:Array<Dynamic>) 
	{
		var hash:String = "";
		for (i in 0...listOfComponents.length) {
			hash += Type.getClassName(listOfComponents[i]);
			hash += ",";
		}
		//trace("componentHash = " + hash);
		return hash;
	}
}
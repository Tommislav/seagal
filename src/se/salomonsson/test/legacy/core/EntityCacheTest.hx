package se.salomonsson.test.legacy.core;
import haxe.PosInfos;
import haxe.unit.TestCase;
import se.salomonsson.legacy.core.EntityCache;
import se.salomonsson.legacy.core.EntityManager;
import se.salomonsson.legacy.core.EW;
import se.salomonsson.test.legacy.core.comp.NumericComponent;
import se.salomonsson.test.legacy.core.comp.StringComponent;

/**
 * Started on a cache for entity lookup based on components. IN PROGRESS!
 * @author Tommislav
 */
class EntityCacheTest extends TestCase
{
	private var _cache:EntityCache;
	private var _em:EntityManager;
	private var _entityListOne:Array<EW>;
	private var _entityListTwo:Array<EW>;
	
	override public function setup():Void 
	{
		_em 			= new EntityManager();
		_entityListOne 	= [new EW(0, _em), new EW(1, _em)];
		_entityListTwo 	= [new EW(2, _em)];
		
		_cache = new EntityCache();
	}
	
	
	
	public function testPutCacheSingleComponent()
	{
		_cache.putCache( _entityListOne, [NumericComponent] );
		
		assertTrue( _cache.hasCache([NumericComponent ]) );
		assertEquals( _entityListOne, _cache.getCache([NumericComponent]) );
	}
	
	public function testClearCache()
	{
		_cache.putCache( _entityListOne, [NumericComponent] );
		_cache.clearCache();
		assertFalse( _cache.hasCache( [NumericComponent] ) );
	}
	
	public function testRetrieveCacheFromTwoDifferentLookups()
	{
		_cache.putCache( _entityListOne, [NumericComponent] );
		_cache.putCache( _entityListTwo, [StringComponent] );
		
		assertTrue( _cache.hasCache([NumericComponent]) );
		assertEquals( _entityListOne, _cache.getCache([NumericComponent]) );
		
		assertTrue( _cache.hasCache([StringComponent]) );
		assertEquals( _entityListTwo, _cache.getCache([StringComponent]) ); 
	}
	
	public function testRetrieveCacheFromTwoComponents()
	{
		_cache.putCache(_entityListOne, [NumericComponent, StringComponent]);
		assertTrue(_cache.hasCache([NumericComponent, StringComponent]));
		assertEquals(_entityListOne, _cache.getCache([NumericComponent, StringComponent]));
	}
	
	public function testMarkComponentDirty() {
		_cache.putCache(_entityListOne, [NumericComponent, StringComponent]);
		
		_cache.markComponentDirty(StringComponent);
		
		// Cache is now invalid because StringComponent has more/fewer entities
		assertFalse(_cache.hasCache([NumericComponent, StringComponent]));
	}
	
	public function testMarkComponentDirtyFromInstance() {
		_cache.putCache(_entityListOne, [NumericComponent, StringComponent]);
		_cache.markComponentDirty(new StringComponent(""));
		assertFalse(_cache.hasCache([NumericComponent, StringComponent]));
	}
}



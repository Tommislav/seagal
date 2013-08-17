package se.salomonsson.test.seagal.core;
import haxe.unit.TestCase;
import se.salomonsson.seagal.core.EntityCache;
import se.salomonsson.seagal.core.EntManager;
import se.salomonsson.seagal.core.EW;
import se.salomonsson.test.seagal.core.comp.NumericComponent;

/**
 * Started on a cache for entity lookup based on components. IN PROGRESS!
 * @author Tommislav
 */
class EntityCacheTest extends TestCase
{
	private var _cache:EntityCache;
	private var _em:EntManager;
	private var _entityListOne:Array<EW>;
	private var _entityListTwo:Array<EW>;
	
	override public function setup():Void 
	{
		_em 			= new EntManager();
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
}
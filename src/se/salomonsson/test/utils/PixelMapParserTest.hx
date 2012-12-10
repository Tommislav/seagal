package se.salomonsson.test.utils;
import haxe.unit.TestCase;
import nme.Assets;
import se.salomonsson.game.utils.PixelMapParser;

/**
 * ...
 * @author Tommislav
 */

class PixelMapParserTest extends TestCase
{

	public function testPixelMapParser()
	{
		var pixMap:PixelMapParser = new PixelMapParser(Assets.getBitmapData("assets/pixelmap_test.png"));
		var size:String = "Size " + pixMap.width + "x" + pixMap.height + ": " + pixMap.size;
		assertEquals(size, "Size 3x2: 6");
		
		assertEquals(0, pixMap.atCoord(0, 0));
		assertEquals(0xff0000, pixMap.atCoord(1, 0));
		//assertEquals(0, pixMap.index(0));
	}
	
}
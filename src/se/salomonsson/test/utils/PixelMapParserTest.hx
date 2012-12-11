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
		var pixMap:PixelMapParser = new PixelMapParser(Assets.getBitmapData("assets/pixelmap_test.gif"));
		var size:String = "Size " + pixMap.width + "x" + pixMap.height + ": " + pixMap.size;
		assertEquals(size, "Size 3x2: 6");
		
		assertEquals("0,0,0", 			colToHex(pixMap.atCoord(0, 0)));
		assertEquals("255,255,255", 	colToHex(pixMap.atCoord(1, 0)));
		assertEquals("255,0,0", 		colToHex(pixMap.atCoord(2, 0)));
		assertEquals("0xFF0000",		pixMap.getHex(2, 0));
		assertEquals("0x000000", 		pixMap.getHex(0, 0));
		assertEquals("0xFFFFFF",		pixMap.getHex(1, 0));
		assertEquals("0x112233",		pixMap.getHex(0, 1));
		
		assertEquals(255, pixMap.getR(2, 0));
		assertEquals(255, pixMap.getG(2, 1));
		assertEquals(255, pixMap.getB(1, 1));
		
		// test out of bounds return 0
		assertEquals(0, pixMap.atCoord( -1, -1));
		assertEquals(0, pixMap.atCoord(pixMap.width + 1, pixMap.height + 1));
	}
	
	private function colToHex(val:Int):String {
		var r:Int = (val >> 16) & 0xff;
		var g:Int = (val >> 8) & 0xff;
		var b:Int = val & 0xff;
		
		return r + "," + g + "," + b;
	}
}
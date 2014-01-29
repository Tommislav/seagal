package se.salomonsson.test.game.utils;
import flash.display.BitmapData;
import haxe.unit.TestCase;
import openfl.Assets;
import se.salomonsson.game.utils.PixelMapParser;

/**
 * ...
 * @author Tommislav
 */

class PixelMapParserTest extends TestCase
{

	public function testPixelMapParser()
	{
		var pixMap:PixelMapParser = new PixelMapParser(getTestBitmapData());
		var size:String = "Size " + pixMap.width + "x" + pixMap.height + ": " + pixMap.size;
		assertEquals("Size 3x2: 6", 	size);
		
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
	
	
	public function testWriteOverrideValues():Void {
		var pixMap:PixelMapParser = new PixelMapParser(getTestBitmapData());
		assertEquals("0x112233", pixMap.getHex(0, 1));
		
		pixMap.setOverrideValueAtCoord(0, 1, 0x001122);
		assertEquals("0x001122", pixMap.getHex(0, 1));
		
		pixMap.clearOverrideValueAt(0, 1);
		assertEquals("0x112233", pixMap.getHex(0, 1));
	}
	
	public function testClearAllOverrideValues():Void {
		var pixMap:PixelMapParser = new PixelMapParser(getTestBitmapData());
		
		pixMap.setOverrideValueAtCoord(0, 1, 0x123456);
		pixMap.setOverrideValueAtCoord(2, 0, 0x123456);
		
		pixMap.clearAllOverrideValues();
		
		assertEquals("0x112233", 		pixMap.getHex(0, 1));
		assertEquals("0xFF0000",		pixMap.getHex(2, 0));
	}
	
	
	
	private function getTestBitmapData() {
		var bd:BitmapData = new BitmapData(3, 2, false, 0xffffff);
		var colors = [
			[0x000000, 0xffffff, 0xff0000],
			[0x112233, 0x0000ff, 0x00ff00]
		];
		
		for (y in 0...colors.length) {
			for (x in 0...colors[y].length) {
				bd.setPixel(x, y, colors[y][x] );
			}
		}
		return bd;
	}
}
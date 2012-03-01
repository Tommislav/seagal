package nme.installer;


import nme.display.BitmapData;
import nme.media.Sound;
import nme.net.URLRequest;
import nme.text.Font;
import nme.utils.ByteArray;
import ApplicationMain;


/**
 * ...
 * @author Joshua Granick
 */

class Assets {

	
	public static function getBitmapData (id:String):BitmapData {
		
		switch (id) {
			
			case "assets/block_32.png": return cast (new NME_assets_block_32_png (), BitmapData);
			case "assets/block_red.png": return cast (new NME_assets_block_red_png (), BitmapData);
			case "assets/block_solidBottom_32.png": return cast (new NME_assets_block_solidbottom_32_png (), BitmapData);
			case "assets/block_transparent.png": return cast (new NME_assets_block_transparent_png (), BitmapData);
			case "assets/block_white.png": return cast (new NME_assets_block_white_png (), BitmapData);
			case "assets/block_white_transparent.png": return cast (new NME_assets_block_white_transparent_png (), BitmapData);
			case "assets/floor_red.png": return cast (new NME_assets_floor_red_png (), BitmapData);
			case "assets/floor_red_32.png": return cast (new NME_assets_floor_red_32_png (), BitmapData);
			case "assets/floor_red_32x32.png": return cast (new NME_assets_floor_red_32x32_png (), BitmapData);
			case "assets/floor_shade_32.png": return cast (new NME_assets_floor_shade_32_png (), BitmapData);
			case "assets/floor_shade_32x32.png": return cast (new NME_assets_floor_shade_32x32_png (), BitmapData);
			case "assets/floor_transparent.png": return cast (new NME_assets_floor_transparent_png (), BitmapData);
			case "assets/floor_white.png": return cast (new NME_assets_floor_white_png (), BitmapData);
			case "assets/floor_white_32.png": return cast (new NME_assets_floor_white_32_png (), BitmapData);
			case "assets/floor_white_32x32.png": return cast (new NME_assets_floor_white_32x32_png (), BitmapData);
			
		}
		
		return null;
		
	}
	
	
	public static function getBytes (id:String):ByteArray {
		
		switch (id) {
			
			case "assets/block_32.png": return cast (new NME_assets_block_32_png (), ByteArray);
			case "assets/block_red.png": return cast (new NME_assets_block_red_png (), ByteArray);
			case "assets/block_solidBottom_32.png": return cast (new NME_assets_block_solidbottom_32_png (), ByteArray);
			case "assets/block_transparent.png": return cast (new NME_assets_block_transparent_png (), ByteArray);
			case "assets/block_white.png": return cast (new NME_assets_block_white_png (), ByteArray);
			case "assets/block_white_transparent.png": return cast (new NME_assets_block_white_transparent_png (), ByteArray);
			case "assets/floor_red.png": return cast (new NME_assets_floor_red_png (), ByteArray);
			case "assets/floor_red_32.png": return cast (new NME_assets_floor_red_32_png (), ByteArray);
			case "assets/floor_red_32x32.png": return cast (new NME_assets_floor_red_32x32_png (), ByteArray);
			case "assets/floor_shade_32.png": return cast (new NME_assets_floor_shade_32_png (), ByteArray);
			case "assets/floor_shade_32x32.png": return cast (new NME_assets_floor_shade_32x32_png (), ByteArray);
			case "assets/floor_transparent.png": return cast (new NME_assets_floor_transparent_png (), ByteArray);
			case "assets/floor_white.png": return cast (new NME_assets_floor_white_png (), ByteArray);
			case "assets/floor_white_32.png": return cast (new NME_assets_floor_white_32_png (), ByteArray);
			case "assets/floor_white_32x32.png": return cast (new NME_assets_floor_white_32x32_png (), ByteArray);
			
		}
		
		return null;
		
	}
	
	
	public static function getFont (id:String):Font {
		
		switch (id) {
			
			
		}
		
		return null;
		
	}
	
	
	public static function getSound (id:String):Sound {
		
		switch (id) {
			
			
		}
		
		return null;
		
	}
	
	
	public static function getText (id:String):String {
		
		var bytes:ByteArray = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
	}
	
	
}
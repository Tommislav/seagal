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

	
	public static var cachedBitmapData:Hash<BitmapData> = new Hash<BitmapData>();
	
	private static var initialized:Bool = false;
	private static var resourceClasses:Hash <Dynamic> = new Hash <Dynamic> ();
	private static var resourceTypes:Hash <String> = new Hash <String> ();
	
	
	private static function initialize ():Void {
		
		if (!initialized) {
			
			resourceClasses.set ("assets/block_32.png", NME_assets_block_32_png);
			resourceTypes.set ("assets/block_32.png", "image");
			resourceClasses.set ("assets/block_red.png", NME_assets_block_red_png);
			resourceTypes.set ("assets/block_red.png", "image");
			resourceClasses.set ("assets/block_solidBottom_32.png", NME_assets_block_solidbottom_32_png);
			resourceTypes.set ("assets/block_solidBottom_32.png", "image");
			resourceClasses.set ("assets/block_transparent.png", NME_assets_block_transparent_png);
			resourceTypes.set ("assets/block_transparent.png", "image");
			resourceClasses.set ("assets/block_white.png", NME_assets_block_white_png);
			resourceTypes.set ("assets/block_white.png", "image");
			resourceClasses.set ("assets/block_white_transparent.png", NME_assets_block_white_transparent_png);
			resourceTypes.set ("assets/block_white_transparent.png", "image");
			resourceClasses.set ("assets/floor_red.png", NME_assets_floor_red_png);
			resourceTypes.set ("assets/floor_red.png", "image");
			resourceClasses.set ("assets/floor_red_32.png", NME_assets_floor_red_32_png);
			resourceTypes.set ("assets/floor_red_32.png", "image");
			resourceClasses.set ("assets/floor_red_32x32.png", NME_assets_floor_red_32x32_png);
			resourceTypes.set ("assets/floor_red_32x32.png", "image");
			resourceClasses.set ("assets/floor_shade_32.png", NME_assets_floor_shade_32_png);
			resourceTypes.set ("assets/floor_shade_32.png", "image");
			resourceClasses.set ("assets/floor_shade_32x32.png", NME_assets_floor_shade_32x32_png);
			resourceTypes.set ("assets/floor_shade_32x32.png", "image");
			resourceClasses.set ("assets/floor_transparent.png", NME_assets_floor_transparent_png);
			resourceTypes.set ("assets/floor_transparent.png", "image");
			resourceClasses.set ("assets/floor_white.png", NME_assets_floor_white_png);
			resourceTypes.set ("assets/floor_white.png", "image");
			resourceClasses.set ("assets/floor_white_32.png", NME_assets_floor_white_32_png);
			resourceTypes.set ("assets/floor_white_32.png", "image");
			resourceClasses.set ("assets/floor_white_32x32.png", NME_assets_floor_white_32x32_png);
			resourceTypes.set ("assets/floor_white_32x32.png", "image");
			
			initialized = true;
			
		}
		
	}
	
	
	public static function getBitmapData (id:String, useCache:Bool = true):BitmapData {
		
		initialize ();
		
		if (resourceTypes.exists (id) && resourceTypes.get (id) == "image") {
			
			if (useCache && cachedBitmapData.exists (id)) {
				
				return cachedBitmapData.get (id);
				
			} else {
				
				var data = cast (Type.createInstance (resourceClasses.get (id), []), BitmapData);
				
				if (useCache) {
					
					cachedBitmapData.set (id, data);
					
				}
				
				return data;
				
			}
			
		} else {
			
			trace ("[nme.Assets] There is no BitmapData asset with an ID of \"" + id + "\"");
			
			return null;
			
		}
		
	}
	
	
	public static function getBytes (id:String):ByteArray {
		
		initialize ();
		
		if (resourceClasses.exists (id)) {
			
			return cast (Type.createInstance (resourceClasses.get (id), []), ByteArray);
			
		} else {
			
			trace ("[nme.Assets] There is no String or ByteArray asset with an ID of \"" + id + "\"");
			
			return null;
			
		}
		
	}
	
	
	public static function getFont (id:String):Font {
		
		initialize ();
		
		if (resourceTypes.exists (id) && resourceTypes.get (id) == "font") {
			
			return cast (Type.createInstance (resourceClasses.get (id), []), Font);
			
		} else {
			
			trace ("[nme.Assets] There is no Font asset with an ID of \"" + id + "\"");
			
			return null;
			
		}
		
	}
	
	
	public static function getSound (id:String):Sound {
		
		initialize ();
		
		if (resourceTypes.exists (id)) {
			
			if (resourceTypes.get (id) == "sound" || resourceTypes.get (id) == "music") {
				
				return cast (Type.createInstance (resourceClasses.get (id), []), Sound);
				
			}
			
		}
		
		trace ("[nme.Assets] There is no Sound asset with an ID of \"" + id + "\"");
		
		return null;
		
	}
	
	
	public static function getText (id:String):String {
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
	}
	
	
}
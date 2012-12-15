import Main;
import nme.Assets;
import nme.events.Event;


class ApplicationMain {
	
	static var mPreloader:NMEPreloader;

	public static function main () {
		
		var call_real = true;
		
		
		var loaded:Int = nme.Lib.current.loaderInfo.bytesLoaded;
		var total:Int = nme.Lib.current.loaderInfo.bytesTotal;
		
		nme.Lib.current.stage.align = nme.display.StageAlign.TOP_LEFT;
		nme.Lib.current.stage.scaleMode = nme.display.StageScaleMode.NO_SCALE;
		
		if (loaded < total || true) /* Always wait for event */ {
			
			call_real = false;
			mPreloader = new NMEPreloader();
			nme.Lib.current.addChild(mPreloader);
			mPreloader.onInit();
			mPreloader.onUpdate(loaded,total);
			nme.Lib.current.addEventListener (nme.events.Event.ENTER_FRAME, onEnter);
			
		}
		
		
		
		haxe.Log.trace = flashTrace; // null
		

		if (call_real)
			begin ();
	}

	
	private static function flashTrace( v : Dynamic, ?pos : haxe.PosInfos ) {
		var className = pos.className.substr(pos.className.lastIndexOf('.') + 1);
		var message = className+"::"+pos.methodName+":"+pos.lineNumber+": " + v;

        if (flash.external.ExternalInterface.available)
			flash.external.ExternalInterface.call("console.log", message);
		else untyped flash.Boot.__trace(v, pos);
    }
	
	
	private static function begin () {
		
		var hasMain = false;
		
		for (methodName in Type.getClassFields(Main))
		{
			if (methodName == "main")
			{
				hasMain = true;
				break;
			}
		}
		
		if (hasMain)
		{
			Reflect.callMethod (Main, Reflect.field (Main, "main"), []);
		}
		else
		{
			nme.Lib.current.addChild(cast (Type.createInstance(Main, []), nme.display.DisplayObject));	
		}
		
	}

	static function onEnter (_) {
		
		var loaded:Int = nme.Lib.current.loaderInfo.bytesLoaded;
		var total:Int = nme.Lib.current.loaderInfo.bytesTotal;
		mPreloader.onUpdate(loaded,total);
		
		if (loaded >= total) {
			
			nme.Lib.current.removeEventListener(nme.events.Event.ENTER_FRAME, onEnter);
			mPreloader.addEventListener (Event.COMPLETE, preloader_onComplete);
			mPreloader.onLoaded();
			
		}
		
	}

	public static function getAsset (inName:String):Dynamic {
		
		
		if (inName=="assets/block_32.png")
			 
            return Assets.getBitmapData ("assets/block_32.png");
         
		
		if (inName=="assets/block_red.png")
			 
            return Assets.getBitmapData ("assets/block_red.png");
         
		
		if (inName=="assets/block_solidBottom_32.png")
			 
            return Assets.getBitmapData ("assets/block_solidBottom_32.png");
         
		
		if (inName=="assets/block_transparent.png")
			 
            return Assets.getBitmapData ("assets/block_transparent.png");
         
		
		if (inName=="assets/block_white.png")
			 
            return Assets.getBitmapData ("assets/block_white.png");
         
		
		if (inName=="assets/block_white_transparent.png")
			 
            return Assets.getBitmapData ("assets/block_white_transparent.png");
         
		
		if (inName=="assets/floor_red.png")
			 
            return Assets.getBitmapData ("assets/floor_red.png");
         
		
		if (inName=="assets/floor_red_32.png")
			 
            return Assets.getBitmapData ("assets/floor_red_32.png");
         
		
		if (inName=="assets/floor_red_32x32.png")
			 
            return Assets.getBitmapData ("assets/floor_red_32x32.png");
         
		
		if (inName=="assets/floor_shade_32.png")
			 
            return Assets.getBitmapData ("assets/floor_shade_32.png");
         
		
		if (inName=="assets/floor_shade_32x32.png")
			 
            return Assets.getBitmapData ("assets/floor_shade_32x32.png");
         
		
		if (inName=="assets/floor_transparent.png")
			 
            return Assets.getBitmapData ("assets/floor_transparent.png");
         
		
		if (inName=="assets/floor_white.png")
			 
            return Assets.getBitmapData ("assets/floor_white.png");
         
		
		if (inName=="assets/floor_white_32.png")
			 
            return Assets.getBitmapData ("assets/floor_white_32.png");
         
		
		if (inName=="assets/floor_white_32x32.png")
			 
            return Assets.getBitmapData ("assets/floor_white_32x32.png");
         
		
		if (inName=="assets/Image1.png")
			 
            return Assets.getBitmapData ("assets/Image1.png");
         
		
		if (inName=="assets/map.bmp")
			 
            return Assets.getBytes ("assets/map.bmp");
         
		
		if (inName=="assets/map.gif")
			 
            return Assets.getBitmapData ("assets/map.gif");
         
		
		if (inName=="assets/pixelmap_test.gif")
			 
            return Assets.getBitmapData ("assets/pixelmap_test.gif");
         
		
		
		return null;
		
	}
	
	
	private static function preloader_onComplete (event:Event):Void {
		
		mPreloader.removeEventListener (Event.COMPLETE, preloader_onComplete);
		
		nme.Lib.current.removeChild(mPreloader);
		mPreloader = null;
		
		begin ();
		
	}
	
}


class NME_assets_block_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_block_red_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_block_solidbottom_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_block_transparent_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_block_white_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_block_white_transparent_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_floor_red_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_floor_red_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_floor_red_32x32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_floor_shade_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_floor_shade_32x32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_floor_transparent_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_floor_white_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_floor_white_32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_floor_white_32x32_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_image1_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_map_bmp extends nme.utils.ByteArray { }
class NME_assets_map_gif extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_pixelmap_test_gif extends nme.display.BitmapData { public function new () { super (0, 0); } }


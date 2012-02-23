import TestRunner
	;
import nme.Assets;
import nme.events.Event;


class ApplicationMain {
	
	static var mPreloader:NMEPreloader;

	public static function main () {
		
		var call_real = true;
		
		
		var loaded:Int = nme.Lib.current.loaderInfo.bytesLoaded;
		var total:Int = nme.Lib.current.loaderInfo.bytesTotal;
		
		if (loaded < total || true) /* Always wait for event */ {
			
			call_real = false;
			mPreloader = new NMEPreloader();
			nme.Lib.current.addChild(mPreloader);
			mPreloader.onInit();
			mPreloader.onUpdate(loaded,total);
			nme.Lib.current.addEventListener (nme.events.Event.ENTER_FRAME, onEnter);
			
		}
		
		
		if (call_real)
			TestRunner
	.main();
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
         
		
		
		return null;
		
	}
	
	
	private static function preloader_onComplete (event:Event):Void {
		
		mPreloader.removeEventListener (Event.COMPLETE, preloader_onComplete);
		
		nme.Lib.current.removeChild(mPreloader);
		mPreloader = null;
		
		TestRunner
	.main ();
		
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
	

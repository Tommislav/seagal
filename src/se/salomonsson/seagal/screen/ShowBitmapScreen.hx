package se.salomonsson.seagal.screen;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.Lib;
import motion.Actuate;
import openfl.Assets;

/**
 * ...
 * @author Tommislav
 */
class ShowBitmapScreen extends Sprite
{

	private var _bitmapId:String;
	private var _dislayTimeMs:Int;
	private var _clickToSkip:Bool;
	
	private var _bitmap:Bitmap;
	private var _countdown:Int;
	private var _lastTime:Int;
	private var _callbackFunc:Dynamic;
	private var _fadeTimeSec:Float;
	private var _showTime:Int;
	
	public function new(bitmapId:String, displayTimeMs:Int, clickToSkip:Bool) 
	{
		super();
		_fadeTimeSec = 2;
		_bitmapId = bitmapId;
		_dislayTimeMs = displayTimeMs;
		_clickToSkip = clickToSkip;
	}
	
	public function setFadeTimeSeconds(time:Float):ShowBitmapScreen {
		_fadeTimeSec = time;
		return this;
	}
	
	public function show(callbackFunc:Dynamic) {
		
		_callbackFunc = callbackFunc;
		
		Lib.current.stage.addChild(this);
		
		if (_bitmap == null) {
			var bd:BitmapData = Assets.getBitmapData(_bitmapId);
			_bitmap = new Bitmap(bd);
			addChild(_bitmap);
		}
		
		this.x = Math.fround(Lib.current.stage.stageWidth / 2 - _bitmap.width / 2);
		this.y = Math.fround(Lib.current.stage.stageHeight / 2 - _bitmap.height / 2);
		
		this.alpha = 0;
		Actuate.tween(this, _fadeTimeSec, { alpha: 1 } );
		
		
		if (_dislayTimeMs <= 0) {
			// skip timer - only click!
		} else {
			addEventListener(Event.ENTER_FRAME, onEF);
		}
		
		
		
		addEventListener(MouseEvent.CLICK, onClick);
		_showTime = Lib.getTimer();
		_lastTime = _showTime;
		
		_countdown = _dislayTimeMs + (Std.int(_fadeTimeSec*1000));
	}
	
	private function onClick(e:MouseEvent):Void 
	{
		if (_clickToSkip) {
			if ((Lib.getTimer() - _showTime) > 5) {
				onScreenFinished();
			}
		}
	}
	
	function onScreenFinished() 
	{
		Actuate.stop(this);
		
		removeEventListener(Event.ENTER_FRAME, onEF);
		removeEventListener(MouseEvent.CLICK, onClick);
		
		if (this.parent != null) {
			this.parent.removeChild(this);
		}
		
		if (_callbackFunc != null) {
			_callbackFunc();
		}
		_callbackFunc = null; // remove reference
	}
	
	private function onEF(e:Event):Void 
	{
		var now = Lib.getTimer();
		var delta = now - _lastTime;
		_countdown -= delta;
		_lastTime = now;
		
		if (_countdown <= 0) {
			removeEventListener(Event.ENTER_FRAME, onEF);
			Actuate.tween(this, _fadeTimeSec, { alpha:0 } ).onComplete(onScreenFinished);
		}
	}
	
	
}
package se.salomonsson.seagal.debug;
import flash.Lib;
import pgr.gconsole.GameConsole;
import pgr.gconsole.GCThemes;

/**
 * ...
 * @author Tommislav
 */
class SLogger
{
	public static function log(obj:Dynamic, msg:String) {
		#if debug
			
			var className = "";
			if (Std.is(obj, Class)) {
				className = Type.getClassName(obj);
			}
			else {
				className = Type.getClassName( Type.getClass(obj) );
			}
		
			GameConsole.log(Lib.getTimer() + " " + className + " :: " + msg);
		#end
	}
	
	public static function init() {
		#if debug 
			GameConsole.init(0.5, "DOWN", GCThemes.GREEN_THEME);
			GameConsole.log("Seagal Enitity System...");
		#end
	}
	
	public static function registerFunction(object:Dynamic, name:String, alias:String, ?monitor:Bool = false) {
		#if debug 
			GameConsole.registerFunction(object, name, alias, monitor);
		#end
	}
	
	public function new() 
	{
		
	}
	
	
	
}
package se.salomonsson.legacy.debug;
import pgr.dconsole.DC;
import flash.Lib;

/**
 * ...
 * @author Tommislav
 */
class SLogger {
    public static function log(obj:Dynamic, msg:String) {
        #if debug

        var className = "";
        if (Std.is(obj, Class)) {
            className = Type.getClassName(obj);
        }
        else {
            className = Type.getClassName(Type.getClass(obj));
        }

        DC.log(Lib.getTimer() + " " + className + " :: " + msg);
        #end
    }

    public static function init() {
        #if debug
        DC.init(0.5, "DOWN");
        DC.log("Seagal Enitity System...");
        #end
    }

    public static function registerFunction(func:Dynamic, alias:String, description:String) {
        #if debug
        DC.registerFunction(func, alias, description);
        #end
    }

    public function new() {

    }



}
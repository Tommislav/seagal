package se.salomonsson.legacy.core;
import haxe.macro.Context;
import haxe.macro.Expr;

/**
 * ...
 * @author Tommislav
 */
class SeagalMacro {

	private static var componentCount:Int = 0;

	
	macro public static function buildComponent():Array<Field> {
		var fields = Context.getBuildFields();
		
		
		// TODO: Support more than 32 components!!! Use several bitfields
		if (componentCount > 31) {
			Context.fatalError("SeagalMacro Error! Component bitflag overflow!", Context.currentPos());
		}
		
		var bitflag:Int = 1 << componentCount++;
		//trace("bitflag: " + bitflag + " for " + Context.getLocalType() + ", " + componentCount);
		
		// TODO: Should be readonly FProp instead of FVar... 
		
		fields.push({
			name: "_sFlag",
			doc: "static bitflag",
			meta: [],
			access: [APublic, AStatic],
			//kind: FVar(macro:Int, macro $v{bitflag}),
			kind: FProp("default", "null", macro:Int, macro $v{bitflag}),
			pos:Context.currentPos()
		});
		
		fields.push({
			name: "_iFlag",
			doc: "instance bitflag",
			meta: [],
			access: [APublic],
			//kind: FVar(macro:Int, macro $v{bitflag}),
			kind: FProp("default", "null", macro:Int, macro $v{bitflag}),
			pos:Context.currentPos()
		});
		
		return fields;
	}
}
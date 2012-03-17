package se.salomonsson.test.sys;
import se.salomonsson.ent.GameTime;
import se.salomonsson.ent.Sys;
import se.salomonsson.test.comp.StringComponent;

/**
 * Requires that one entity has a StringComponent. Adds its predifined string to that components string-property
 * @author Tommislav
 */

class WriteStringSystem extends Sys
{
	private var _str:String;
	public function new(str:String) 
	{
		super();
		_str = str;
	}
	
	override public function tick(gt:GameTime):Void 
	{
		em().getComp(StringComponent).string += _str;
	}
}
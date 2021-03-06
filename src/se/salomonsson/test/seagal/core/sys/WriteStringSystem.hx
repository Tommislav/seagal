package se.salomonsson.test.seagal.core.sys;
import se.salomonsson.seagal.core.GameTime;
import se.salomonsson.seagal.core.System;
import se.salomonsson.test.seagal.core.comp.StringComponent;

/**
 * Requires that one entity has a StringComponent. Adds its predifined string to that components string-property
 * @author Tommislav
 */

class WriteStringSystem extends System
{
	private var _str:String;
	public function new(str:String) 
	{
		super();
		_str = str;
	}
	
	override public function tick(gt:GameTime):Void 
	{
		em().getComponent(StringComponent).string += _str;
	}
}
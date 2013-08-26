package se.salomonsson.seagal.utils;
import flash.system.Capabilities;

/**
 * ...
 * @author Tommislav
 */
class CmToPixels
{

	// pixel=(cm*dpi)/25.4 according to http://easycalculation.com/pixtomm.php
	public static function cmToPixels(cm:Float):Int {
		return Math.round((cm * Capabilities.screenDPI) / 25.4);
	}
	
}
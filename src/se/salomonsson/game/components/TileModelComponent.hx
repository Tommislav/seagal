package se.salomonsson.game.components;
import flash.display.BitmapData;
import se.salomonsson.seagal.core.IComponent;

/**
 * ...
 * @author Tommislav
 */

class TileModelComponent implements IComponent
{
	public function new(){}
	
	public var tileSheets:Array<BitmapData>;
	
	
	public static function build(sheets:Array<BitmapData>):TileModelComponent {
		var tm = new TileModelComponent();
		tm.tileSheets = sheets;
		return tm;
	}
	
}
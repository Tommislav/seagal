package se.salomonsson.game.components;
import nme.display.BitmapData;
import se.salomonsson.ent.IComponent;

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
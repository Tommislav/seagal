package se.salomonsson.game.components;
import openfl.display.Tilesheet;
import se.salomonsson.legacy.core.IComponent;
class TileSheetComponent implements IComponent {

	public var sheet:Tilesheet;

	public function new() {}


	public static function build(sheet:Tilesheet):TileSheetComponent {
		var tsc:TileSheetComponent = new TileSheetComponent();
		tsc.sheet = sheet;
		return tsc;
	}
}

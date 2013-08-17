package se.salomonsson.game.components;
import flash.display.BitmapData;

/**
 * ...
 * @author Tommislav
 */

class SpriteSheetComponent 
{
	public var spriteSheet:BitmapData;
	public var tileSize:Int;
	public var name:String;
	
	public static function build(spriteSheet:BitmapData, tileSize:Int, name:String):SpriteSheetComponent {
		var comp:SpriteSheetComponent = new SpriteSheetComponent();
		comp.spriteSheet = spriteSheet;
		comp.tileSize = tileSize;
		comp.name = name;
		return comp;
	}
}
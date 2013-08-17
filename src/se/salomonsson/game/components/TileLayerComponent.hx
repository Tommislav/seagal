package se.salomonsson.game.components;
import se.salomonsson.seagal.core.IComponent;
import se.salomonsson.game.utils.PixelMapParser;

/**
 * ...
 * @author Tommislav
 */

class TileLayerComponent implements IComponent
{
	public function new(){}
	
	public var name:String;
	public var map:PixelMapParser;
	
	// higher value means further back!
	public var zIndex:Int;
	
	public var scrollX:Float;
	public var scrollY:Float;
	
	
	public static function build(name:String, zIndex:Int, map:PixelMapParser, scrollX:Float=1, scrollY:Float=1):TileLayerComponent {
		var layer = new TileLayerComponent();
		layer.name = name;
		layer.zIndex = zIndex;
		layer.map = map;
		layer.scrollX = scrollX;
		layer.scrollY = scrollY;
		return layer;
	}
}
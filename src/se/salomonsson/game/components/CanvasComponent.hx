package se.salomonsson.game.components;
import nme.display.BitmapData;
import se.salomonsson.ent.IComponent;

/**
 * ...
 * @author Tommislav
 */

class CanvasComponent implements IComponent
{

	public var canvas:BitmapData;
	
	public function new() 
	{
		
	}
	
	public static function build(canvas:BitmapData):CanvasComponent {
		var c:CanvasComponent = new CanvasComponent();
		c.canvas = canvas;
		return c;
	}
}
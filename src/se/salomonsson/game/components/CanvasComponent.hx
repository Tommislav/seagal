package se.salomonsson.game.components;
import flash.display.BitmapData;
import se.salomonsson.seagal.core.IComponent;

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
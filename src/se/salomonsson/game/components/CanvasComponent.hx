package se.salomonsson.game.components;
import openfl.display.Graphics;
import se.salomonsson.legacy.core.IComponent;

/**
 * ...
 * @author Tommislav
 */

class CanvasComponent implements IComponent
{

	public var canvas:Graphics;
	
	public function new() 
	{
		
	}
	
	public static function build(canvas:Graphics):CanvasComponent {
		var c:CanvasComponent = new CanvasComponent();
		c.canvas = canvas;
		return c;
	}
}
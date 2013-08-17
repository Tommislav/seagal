package se.salomonsson.game.components;
//import game.components.CenterPointPositionComponent;
import se.salomonsson.seagal.core.IComponent;

/**
 * ...
 * @author Tommislav
 */

class CameraComponent implements IComponent
{
	public var x:Float;
	public var y:Float;
	public var width:Float;
	public var height:Float;
	public var name:String;
	
	public function new(name:String) 
	{
		this.name = name;
		
		x = 0;
		y = 0;
		width = 800;
		height = 480;
	}
	
	public static function build(name:String, x:Float, y:Float, width:Float, height:Float):CameraComponent {
		var c:CameraComponent = new CameraComponent(name);
		c.x = x;
		c.y = y;
		c.width = width;
		c.height = height;
		return c;
	}
	
	// You shouldn't place logic in component... =/
	/*
	public function inView(pos:CenterPointPositionComponent):Bool {
		var posLeft = pos.x - pos.radius;
		var posRight = pos.x + pos.radius;
		var posTop = pos.y - pos.radius;
		var posBottom = pos.y + pos.radius;
		
		if (posRight > x && posLeft < (x + width)) {
			if (posBottom > y && posTop < (y + height)) {
				return true;
			}
		}
		return false;
	}*/
}
package se.salomonsson.game.components;
import se.salomonsson.ent.IComponent;

/**
 * ...
 * @author Tommislav
 */

class CameraComponent implements IComponent
{
	public var x:Int;
	public var y:Int;
	public var width:Int;
	public var height:Int;
	public var name:String;
	
	public function new(name:String) 
	{
		this.name = name;
		
		x = 0;
		y = 0;
		width = 640;
		height = 480;
	}
	
}
package se.salomonsson.game.components;
import se.salomonsson.ent.IComponent;

/**
 * ...
 * @author Tommislav
 */

class ViewPortComponent implements IComponent
{
	public var viewportId:String;
	
	
	public function new(viewportId:String) 
	{
		this.viewportId = viewportId;
	}
	
}
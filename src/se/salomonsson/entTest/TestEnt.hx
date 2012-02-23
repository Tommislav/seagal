package se.salomonsson.entTest;
import nme.display.Stage;
import nme.text.TextField;
import nme.text.TextFieldAutoSize;
import se.salomonsson.ent.EntManager;

/**
 * ...
 * @author Tommislav
 */

class TestEnt 
{

	private var _tf:TextField;
	
	public function new(stage:Stage) 
	{
		_tf = new TextField();
		_tf.multiline = true;
		_tf.wordWrap = true;
		_tf.autoSize = TextFieldAutoSize.LEFT;
		_tf.selectable = false;
		stage.addChild(_tf);
		
		msg("init test...");
		
		test1();
	}
	
	private function msg(str:String):Void
	{
		_tf.appendText(str + "\n");
	}
	
	private function test1() 
	{
		var manager:EntManager = new EntManager();
		//manager.addComponentOn(new TestComponent("hej"), manager.createEntity());
		
		//var comp:TestComponent = cast manager.getComponents(TestComponent)
		//msg("ja nejlade det: " + cast (manager.getComponents(TestComponent), TestComponent).value);
		//msg("------" + manager.getComponents(TestComponent).value);
		
		//if (comp == null)
			//msg("NO, testComponent was null");
		//else
			//msg(comp.value + "='hej'");
	}
	
}
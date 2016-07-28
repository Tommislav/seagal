package se.salomonsson.test.legacy.core;
import haxe.unit.TestCase;
import se.salomonsson.test.legacy.core.comp.NumericComponent;
import se.salomonsson.test.legacy.core.comp.StringComponent;

/**
 * ...
 * @author Tommislav
 */
class ComponentMacroTest extends TestCase {

	public function testStaticBitflag() {
		var bitflag:Int = NumericComponent._sFlag;
		//trace("bitflag is: " + bitflag);
		assertTrue(bitflag != 0);
	}
	
	public function testInstanceBitflag() {
		assertTrue(new NumericComponent()._iFlag != 0);
	}

	public function testStaticAndInstanceFlagAreEqual() {
		var n1 = NumericComponent._sFlag;
		var n2 = new NumericComponent()._iFlag;
		
		var s1 = StringComponent._sFlag;
		var s2 = new StringComponent("hej")._iFlag;
		
		assertEquals(n1, n2);
		assertEquals(s1, s2);
		assertTrue(s1 != n1); // must be unique!
	}
}
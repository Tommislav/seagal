package se.salomonsson.legacy.core;

/**
 * Marker interface for a component
 * @author Tommislav
 */

@:autoBuild(se.salomonsson.legacy.core.SeagalMacro.buildComponent())
interface IComponent {
	public var _iFlag:Int; // set by macro at compile time
}
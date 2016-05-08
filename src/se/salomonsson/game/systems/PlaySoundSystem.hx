package se.salomonsson.game.systems;
import openfl.Assets;
import se.salomonsson.legacy.core.GameTime;
import se.salomonsson.legacy.core.System;
import se.salomonsson.game.components.SoundComponent;

/**
 * ...
 * @author Tommislav
 */

class PlaySoundSystem extends System
{

	private var _soundComponent:SoundComponent;
	
	override public function onAdded(sm, em):Void 
	{
		super.onAdded(sm, em);
		
		em.allocateEntity().addComponent(new SoundComponent());
		_soundComponent = em.getComp(SoundComponent);
	}
	
	override public function onRemoved():Void 
	{
		super.onRemoved();
		_soundComponent = null;
		em().destroyEntity(em().getEntitiesWithComponents([SoundComponent])[0].getEntity());
	}
	
	override public function tick(gt:GameTime):Void 
	{
		for (i in 0..._soundComponent.queueSfx.length) {
			var sfxId:String = _soundComponent.queueSfx[i];
			Assets.getSound(sfxId).play();
		}
		
		_soundComponent.queueSfx = new Array<String>(); // clear array
	}
}
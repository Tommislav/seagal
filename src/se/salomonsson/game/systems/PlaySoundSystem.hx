package se.salomonsson.game.systems;
import nme.Assets;
import se.salomonsson.ent.GameTime;
import se.salomonsson.ent.Sys;
import se.salomonsson.game.components.SoundComponent;

/**
 * ...
 * @author Tommislav
 */

class PlaySoundSystem extends Sys
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
		em().destroyEntity(em().getEWC([SoundComponent])[0].getEntity());
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
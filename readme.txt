#########################################
Seagal, Kick Ass Entity Framework in HaXe
#########################################

Udate to my comments. Not all that satisfied with that short syntax thing. Better to write out what it actually means. But kind of good since I have such a crappy keyboard on my laptop =)

I'm trying to keep the syntax short, so I'm not always writing the full method names. Like "getEWC" instead of "getEntityWithComponents".
I'm also using a wrapper around each entity to be able to more easily create and work
with entities. Another thing is to be able to chain commands easily.

Syntax looks like this:

// Creates an instance of a manager for all entities
manager = new EntManager();

// Allocate new entity and add components directly on it
manager.allocateEntity().addComponent(new PositionComponent(0,0)).addComponent(new RenderComponent(someBitmap));

// Get all entities which holds a special type of component definition
entities:Array<EW> = manager.getEWC([PositionComponent]);

// The EW-class is an EntityWrapper. You can modify properties directly on it:
_ew = entities[0];
_ew.addComponent(new GravityComponent(3));
_ew.comp(GravityComponent).gravity = 4;

// The comp-method will retrieve an instance of the component class regiestred
// with that entity. If no component of that type exists - a new instance will
// be created, registred and returned
_ew.comp(VelocityComponent).vx = 5;



// The manager can return a list of entities containing a specific component
// through the getEWC (get Entity With Components)
// (note the array bracket)
manager.getEWC([RenderComponent]);

// But you can also get a list of entities which contains a group of components.
// The entity must contain ALL components specified to be included
manager.getEWC([VelocityComponent,PositionComponent]);




Soon to come...
 - destroy all entities from a given component
 - dispatch events through all systems
 - global "singletons" components




Systems.
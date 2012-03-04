Anton, simple Entity Framework in HaXe.

I'm trying to keep the syntax short, so I'm not always writing the full method names.
I'm also using a wrapper around each entity to be able to more easily create and work
with entities. Chaining commands.

Syntax looks like this:

// Creates an instance of a manager for all entities
manager = new EntManager();

// Allocate new entity and add components directly on it
manager.allocateEntity().addComponent(new Component1("args")).addComponent(new Component2("args"));

// Get all entities which holds a special type of component definition
entities:Array<EW> = manager.getEWC([Component1]);

// The EW-class is an EntityWrapper. You can modify properties directly on it:
_ew.addComponent(new Component3("args"));
_ew.comp(Component3).x = 4;

// The comp-method will create the component if it is not declared
_ew.comp(PositionComponent).y = 4;



// The manager can return a list of entities containing a specific component
// through the getEWC (get Event With Component)
// note the array bracket
manager.getEWC([Component1]);

// But you can also get all entities which contains more than one class.
// The entities must contain ALL components specified
manager.getEWC([Component1,PositionComponent]);
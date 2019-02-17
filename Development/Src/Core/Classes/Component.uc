/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 *
 * This class is the base class for any kind of object that wants the following features:
 *  - be a subobject inside a class definition (called the owner class)
 *  - values of the component can be overridden in a subclass of the owner class, by
 *    defining a component in the subclass with the same name as the component in the base class
 *    definition. Note, you CANNOT GIVE IT A CLASS= DEFINITION! (See UDN page for more info)
 *  - Changes to the default values to the component will be propagated to components that are
 *    created inside a map, unless the value was changed away from the default value in the editor.
 */
class Component extends Object
	native
	abstract;

var const native Class	TemplateOwnerClass;
var const native name	TemplateName;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Name="Default__Component"
   ObjectArchetype=Object'Core.Default__Object'
}

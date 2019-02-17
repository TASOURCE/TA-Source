/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class WindDirectionalSourceComponent extends ActorComponent
	native
	collapsecategories
	hidecategories(Object)
	editinlinenew;

var native private	transient noimport const pointer SceneProxy{FWindSourceSceneProxy};

var() interp float Strength;
var() interp float Phase;
var() interp float Frequency;
var() interp float Speed;

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

cpptext
{
protected:
	// UActorComponent interface.
	virtual void Attach();
	virtual void Detach( UBOOL bWillReattach = FALSE );
	virtual void UpdateTransform();
public:
	
	/**
	 * Creates a proxy to represent the wind source to the scene manager in the rendering thread.
	 * @return The proxy object.
	 */
	 virtual class FWindSourceSceneProxy* CreateSceneProxy() const;

}


defaultproperties
{
   Strength=1.000000
   Frequency=1.000000
   Speed=1.000000
   Name="Default__WindDirectionalSourceComponent"
   ObjectArchetype=ActorComponent'Engine.Default__ActorComponent'
}

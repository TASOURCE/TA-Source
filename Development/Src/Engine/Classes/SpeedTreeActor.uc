/*=============================================================================
	Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
=============================================================================*/
 
class SpeedTreeActor extends Actor
	native(SpeedTree)
	placeable;
	
var() const editconst SpeedTreeComponent SpeedTreeComponent;

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
public:
	// AActor interface.
	/**
	* Function that gets called from within Map_Check to allow this actor to check itself
	* for any potential errors and register them with map check dialog.
	*/
#if WITH_EDITOR
	virtual void CheckForErrors();
#endif

}


defaultproperties
{
   Begin Object Class=SpeedTreeComponent Name=SpeedTreeComponent0
      ReplacementPrimitive=None
      bAllowApproximateOcclusion=True
      bForceDirectLightMap=True
      Name="SpeedTreeComponent0"
      ObjectArchetype=SpeedTreeComponent'Engine.Default__SpeedTreeComponent'
   End Object
   SpeedTreeComponent=SpeedTreeComponent0
   Components(0)=SpeedTreeComponent0
   CollisionType=COLLIDE_CustomDefault
   bStatic=True
   bNoDelete=True
   bWorldGeometry=True
   bMovable=False
   bCollideActors=True
   bBlockActors=True
   CollisionComponent=SpeedTreeComponent0
   Name="Default__SpeedTreeActor"
   ObjectArchetype=Actor'Engine.Default__Actor'
}

/**
 * These are useful when you have a space that wasn't explored by a pylon but it safely enclosed in the pylon
 * (e.g. a ledge that a mantle check didn't explore properly but should be able to have jump down edges) but you don't
 * feel it's necessary to add a whole new pylon/navmesh/heavyweight thing it's just an exploration hint for the path generator
 * or mesh generator 
 *
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class PylonSeed extends Actor
	placeable
	native(AI)
	implements(Interface_NavMeshPathObject)
	ClassGroup(Navigation);

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

cpptext
{
	virtual UBOOL Supports( const FNavMeshPathParams& PathParams,
							FNavMeshPolyBase* CurPoly,
							FNavMeshPathObjectEdge* Edge )
	{
		return FALSE;
	}

	virtual void AddAuxSeedPoints( APylon* Py )
	{
		if (Py != NULL && Py->IsPtWithinExpansionBounds(Location,50.f))
		{
			Py->NextPassSeedList.AddItem(Location);
		}
	}

}


defaultproperties
{
   Begin Object Class=CylinderComponent Name=CollisionCylinder
      CollisionHeight=50.000000
      CollisionRadius=50.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__CylinderComponent'
   End Object
   Components(0)=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite
      Sprite=Texture2D'EditorResources.S_NavP'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(1)=Sprite
   CollisionType=COLLIDE_CustomDefault
   CollisionComponent=CollisionCylinder
   Name="Default__PylonSeed"
   ObjectArchetype=Actor'Engine.Default__Actor'
}

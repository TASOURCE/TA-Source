/**
 *  Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class NavMeshObstacle extends Actor
	native(AI)
	implements(Interface_NavMeshPathObstacle)
	placeable;

var() bool bEnabled;
var() bool bPreserveInternalGeo;

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

/**
 * script accessible function that builds the bounding shape for the navmesh obstacle 
 * Note: needs to return a CW wound convex shape!
 * @param shape - array of verts for cutting shape
 * @return TRUE if the shape creation was a success
 */
event bool GetObstacleBoudingShape(out array<vector> Shape)
{
	local float Scale;
	local vector Offset;
	Scale = 200.f * DrawScale;

	// Clockwise!
	// top right corner
	Offset.X = Scale * DrawScale3D.X;
	Offset.Y = Scale * DrawScale3D.Y;	
	Shape.AddItem(Location + (Offset >> Rotation));
	// bottom right corner
	Offset.X = -Scale * DrawScale3D.X;
	Offset.Y = Scale * DrawScale3D.Y;
	Shape.AddItem(Location + (Offset >> Rotation) );
	// bottom left corner
	Offset.X = -Scale * DrawScale3D.X;
	Offset.Y = -Scale * DrawScale3D.Y;
	Shape.AddItem(Location + (Offset >> Rotation) );
	// top left corner
	Offset.X = Scale * DrawScale3D.X;
	Offset.Y = -Scale * DrawScale3D.Y;
	Shape.AddItem(Location + (Offset >> Rotation) );
	
	return TRUE;
}

native function RegisterObstacle();
native function UnRegisterObstacle();

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	if(bEnabled)
	{
		RegisterObstacle();
	}	
}

simulated function OnToggle(SeqAct_Toggle Action)
{
	// Turn ON
	if (Action.InputLinks[0].bHasImpulse)
	{
		bEnabled=true;
	}
	// Turn OFF
	else if (Action.InputLinks[1].bHasImpulse)
	{
		bEnabled=false;
	}
	// Toggle
	else if (Action.InputLinks[2].bHasImpulse)
	{
		bEnabled = !bEnabled;
	}

	SetEnabled(bEnabled);
}

function SetEnabled(bool bInEnabled)
{
	if(bInEnabled)
	{
		RegisterObstacle();
	}
	else
	{
		UnRegisterObstacle();
	}
}

cpptext
{
	/**
	 * this function should populate out_polyshape with a list of verts which describe this object's 
	 * convex bounding shape
	 * @param out_PolyShape - output array which holds the vertex buffer for this obstacle's bounding polyshape
	 * @return TRUE if this object should block things right now (FALSE means this obstacle shouldn't affect the mesh)
	 */
	virtual UBOOL GetBoundingShape(TArray<FVector>& out_PolyShape);

	/**
	 * when TRUE polys internal to this obstacle will be preserved, but still split. (useful for things like cost volumes that 
	 * need to adjust cost but not completely destroy parts of the mesh
	 * @return TRUE if polys should be preserved internal to this obstacle
	 */
	virtual UBOOL PreserveInternalPolys() { return bPreserveInternalGeo; }

	/**
	 * For debugging.  Verifies that this pathobject is still alive and well and not orphaned or deleted
	 * @return - TRUE If this path object is in good working order
	 */
	virtual UBOOL VerifyObstacle()
	{
		return !IsPendingKill();
	}


}


defaultproperties
{
   Begin Object Class=SpriteComponent Name=Sprite
      Sprite=Texture2D'EditorResources.S_Keypoint'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(0)=Sprite
   Begin Object Class=DrawBoxComponent Name=DrawBox0
      BoxColor=(B=255,G=70,R=64,A=255)
      ReplacementPrimitive=None
      Name="DrawBox0"
      ObjectArchetype=DrawBoxComponent'Engine.Default__DrawBoxComponent'
   End Object
   Components(1)=DrawBox0
   CollisionType=COLLIDE_CustomDefault
   Name="Default__NavMeshObstacle"
   ObjectArchetype=Actor'Engine.Default__Actor'
}

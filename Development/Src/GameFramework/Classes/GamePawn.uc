/**
 * GamePawn
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class GamePawn extends Pawn
	config(Game)
	native
	abstract
	notplaceable
	nativereplication;


/** Was the last hit considered a head shot?  Used to see if we need to pop off helmet/head */
var transient bool bLastHitWasHeadShot;

/** Whether pawn responds to explosions or not (ie knocked down from explosions) */
var bool bRespondToExplosions;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)


replication
{
	// Replicated to ALL
	if( Role == Role_Authority )
		bLastHitWasHeadShot;
}

/** This will update the shadow settings for this pawn's mesh **/
simulated event UpdateShadowSettings( bool bInWantShadow )
{
	local bool bNewCastShadow;
	local bool bNewCastDynamicShadow;

	if( Mesh != None )
	{
		bNewCastShadow = default.Mesh.CastShadow && bInWantShadow;
		bNewCastDynamicShadow = default.Mesh.bCastDynamicShadow && bInWantShadow;

		if( (bNewCastShadow != Mesh.CastShadow) || (bNewCastDynamicShadow != Mesh.bCastDynamicShadow) )
		{
			// if there is a pending Attach then this will set the shadow immediately as the flags have changed an a reattached has occurred
			Mesh.CastShadow = bNewCastShadow;
			Mesh.bCastDynamicShadow = bNewCastDynamicShadow;

			// if we are in a poor framerate situation just change the settings even if people are looking at it
			if( WorldInfo.bAggressiveLOD == TRUE )
			{
				ReattachMesh();
			}
			else
			{
				ReattachMeshWithoutBeingSeen();
			}
		}
	}
}

/** reattaches the mesh component **/
simulated function ReattachMesh()
{
	ClearTimer( nameof(ReattachMeshWithoutBeingSeen) );
	ReattachComponent(Mesh);
}

/** reattaches the mesh component without being seen **/
simulated function ReattachMeshWithoutBeingSeen()
{
	// defer so we do not pop from any settings we have changed (e.g. shadow settings)
	if( LastRenderTime > WorldInfo.TimeSeconds - 1.0 )
	{
		SetTimer( 0.5 + FRand() * 0.5, FALSE, nameof(ReattachMeshWithoutBeingSeen) );
	}
	// we have not been rendered for a bit so go ahead and reattach
	else
	{
		ReattachMesh();
	}
}

defaultproperties
{
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'Engine.Default__Pawn:CollisionCylinder'
      CollisionHeight=78.000000
      CollisionRadius=34.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__Pawn:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Pawn:Sprite'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Pawn:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'Engine.Default__Pawn:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'Engine.Default__Pawn:Arrow'
   End Object
   Components(2)=Arrow
   bCanBeAdheredTo=True
   bCanBeFrictionedTo=True
   CollisionComponent=CollisionCylinder
   Name="Default__GamePawn"
   ObjectArchetype=Pawn'Engine.Default__Pawn'
}

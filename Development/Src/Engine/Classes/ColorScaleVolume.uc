/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */


class ColorScaleVolume extends Volume
	hidecategories(Collision,Brush,Attachment,Volume)
	placeable;

/** Desired color scale upon entering volume */
var() vector ColorScale;
/** Interpolation time for the color scale */
var() float	InterpTime;

event Touch(Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal)
{
	local Pawn P;
	local PlayerController PC;
	Super.Touch(Other,OtherComp,HitLocation,HitNormal);
	// check to see if we're touching a player controlled pawn
	P = Pawn(Other);
	if (P != None)
	{
		PC = PlayerController(P.Controller);
		// with a valid camera
		if (PC != None && PC.PlayerCamera != None)
		{
			// apply the entry scale
			PC.PlayerCamera.SetDesiredColorScale(ColorScale,InterpTime);
		}
	}
}

event UnTouch(Actor Other)
{
	local Pawn P;
	local PlayerController PC;
	local vector DesiredColorScale;
	local float DesiredInterpTime;
	local int Idx;
	local ColorScaleVolume CSV;
	Super.UnTouch(Other);
	// check to see if we're touching a player controlled pawn
	P = Pawn(Other);
	if (P != None)
	{
		PC = PlayerController(P.Controller);
		// with a valid camera
		if (PC != None && PC.PlayerCamera != None)
		{
			// defult to the level color scale
			DesiredColorScale = WorldInfo.DefaultColorScale;
			DesiredInterpTime = 1.f;
			if (P.Touching.Length > 0)
			{
				// look for any other color scale volumes
				for (Idx = P.Touching.Length; Idx >= 0; --Idx)
				{
					CSV = ColorScaleVolume(P.Touching[Idx]);
					if (CSV != None && CSV != self)
					{
						// set the desired values based on the CSV's
						DesiredColorScale = CSV.ColorScale;
						DesiredInterpTime = CSV.InterpTime;
						// and stop looking
						break;
					}
				}
			}
			// apply the exit scale
			PC.PlayerCamera.SetDesiredColorScale(DesiredColorScale,DesiredInterpTime);
		}
	}
}

defaultproperties
{
   ColorScale=(X=1.000000,Y=1.000000,Z=1.000000)
   InterpTime=1.000000
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__Volume:BrushComponent0'
      ReplacementPrimitive=None
      bAcceptsLights=True
      CollideActors=True
      BlockNonZeroExtent=True
      bDisableAllRigidBody=True
      AlwaysLoadOnClient=True
      AlwaysLoadOnServer=True
      LightingChannels=(bInitialized=True,Dynamic=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'Engine.Default__Volume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   CollisionType=COLLIDE_CustomDefault
   CollisionComponent=BrushComponent0
   Name="Default__ColorScaleVolume"
   ObjectArchetype=Volume'Engine.Default__Volume'
}

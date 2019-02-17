class TrLaserTarget extends Actor
	native;

var transient byte m_nTeamId;

function SetTeamNum(byte teamId)
{
	m_nTeamId = teamId;
}

simulated native function byte GetTeamNum();

simulated function UpdateLocation(Vector NewLocation)
{
	if (SetLocation(NewLocation))
	{
		bUpdateSimulatedPosition = true;
		bNetDirty = true;
	}
}

simulated function Destroyed()
{
	local PlayerController PC;

	Super.Destroyed();

	// Remove from post rendered actor list.
	foreach LocalPlayerControllers(class'PlayerController', PC)
	{
		// Is our HUD valid and are we on the same team?
		if (PC.MyHUD != None)
			PC.MyHUD.RemovePostRenderedActor(self);
	}
}

simulated function PostBeginPlay()
{
	local PlayerController PC;

	// Add to post rendered actor list.
	foreach LocalPlayerControllers(class'PlayerController', PC)
	{
		// Is our HUD valid and are we on the same team?
		if (PC.MyHUD != None)
			PC.MyHUD.AddPostRenderedActor(self);
	}
}

simulated event PostRenderFor(PlayerController PC, Canvas Canvas, vector CameraPosition, vector CameraDir)
{
	local float Distance;

	// PlayerController and us need to be on the same team.
	if (PC.GetTeamNum() != GetTeamNum())
		return;

	Distance = Round(Abs(VSize(Location - CameraPosition)) / 16.0f);

	if (Pawn(Owner) == PC.Pawn)
		RenderForOwner(PC, Canvas, CameraPosition, CameraDir, Distance);
	// CALL-IN: As part of the call-in code, laser targeters don't provide target acquisition to teammates.
	/*else
		RenderForTeammate(PC, Canvas, CameraPosition, CameraDir, Distance);*/
}

private simulated function RenderForOwner(PlayerController PC, Canvas Canvas, vector CameraPosition, vector CameraDir, float Distance)
{
	local float xl, yl;
	local int posX, posY;
	local string renderText;

	// Offset the location.
	posX = (Canvas.SizeX / 2) + 15;
	posY = (Canvas.SizeY / 2) - 5;

	// The string.
	renderText = string(Round(Distance));

    Canvas.Font = class'UTHUD'.static.GetFontSizeIndex(1);
	Canvas.StrLen(renderText, xl, yl);

	Canvas.DrawColor.R = 0;
	Canvas.DrawColor.G = 190;
	Canvas.DrawColor.B = 0;
	Canvas.DrawColor.A = 255;
	Canvas.SetPos(posX, posY - yl);
	Canvas.DrawText(renderText, true,,, class'UTHUD'.default.TextRenderInfo);
}

private simulated function RenderForTeammate(PlayerController PC, Canvas Canvas, vector CameraPosition, vector CameraDir, float Distance)
{
	local bool bAlongScreenEdges, bAlongScreenEdges2, bIsShotPossible;
	local class<UTProjectile> ProjectileClass;
	local float TargetRange;
	local rotator TargetRot;
	local Texture2D laserAimPointer;
    local Texture2D laserPointer;
	local UTWeapon Weap;
	local vector HitScreenLoc, AimScreenLoc, TargetPos, TargetDir;

	if (UTPawn(PC.Pawn) == none)
		return;

	// Fetch the markers and weapon.
	laserAimPointer = Class'TrHUD'.default.HUDMarkerLaserTargetAimPoint;
	laserPointer = Class'TrHUD'.default.HUDMarkerLaserTarget;
	Weap = UTWeapon(UTPawn(PC.Pawn).Weapon);
	ProjectileClass = class<UTProjectile>(Weap.WeaponProjectiles[Weap.CurrentFireMode]);

	// Fetch screen position.
	bAlongScreenEdges = Class'TrHUD'.static.GetEdgeScreenCoordinates(Canvas, CameraPosition, CameraDir, Location, HitScreenLoc);

	// Don't cover the weapon if on-screen, so render initial contact point.
	if (bAlongScreenEdges || !Weap.CoversScreenSpace(HitScreenLoc, Canvas))
	{
		HitScreenLoc.Z = VSize(CameraPosition - Location);
		TrHUD(PC.myHUD).DrawMarker(laserPointer, HitScreenLoc, Canvas, string(Round(Distance)));
	}

	// No projectile weapon equipped or it isn't affected by gravity, no need to assist aim.
	if (ProjectileClass == none || ProjectileClass.default.Physics != PHYS_Falling)
		return;

	// Determine the toss direction, if possible.
	bIsShotPossible = SuggestTossVelocity(TargetDir, Location, CameraPosition, ProjectileClass.default.Speed, ProjectileClass.default.TossZ,,, ProjectileClass.Default.MaxSpeed, ProjectileClass.default.CustomGravityScaling * WorldInfo.GetGravityZ());

	// Calculate the projection.
	TargetRange = VSize(Location - CameraPosition);
	TargetRot = rotator(TargetDir);
	TargetPos = CameraPosition + vector(TargetRot) * TargetRange;

	// Fetch screen position for aim.
	bAlongScreenEdges2 = Class'TrHUD'.static.GetEdgeScreenCoordinates(Canvas, CameraPosition, CameraDir, TargetPos, AimScreenLoc);

	// Don't cover the weapon if on-screen, so render initial contact point.
	if (bAlongScreenEdges2 || !Weap.CoversScreenSpace(AimScreenLoc, Canvas))
	{
		AimScreenLoc.Z = VSize(CameraPosition - TargetPos);
		TrHUD(PC.myHUD).DrawMarker(laserAimPointer, AimScreenLoc, Canvas, "A");
	}

	// Only draw a line connecting the two points if they are both not along screen edges.
	if (!bAlongScreenEdges || !bAlongScreenEdges2)
	{
		Canvas.Draw2DLine(AimScreenLoc.X, AimScreenLoc.Y, HitScreenLoc.X, HitScreenLoc.Y, bIsShotPossible ? Class'TrHUD'.default.LaserTargetTracePossible : Class'TrHUD'.default.LaserTargetTraceImprobable);
	}
}

replication
{
	if (bNetInitial && Role == ROLE_Authority)
		m_nTeamId;
}

defaultproperties
{
   Begin Object Class=CylinderComponent Name=CollisionCylinder
      CollisionHeight=0.500000
      CollisionRadius=0.500000
      bAlwaysRenderIfSelected=True
      ReplacementPrimitive=None
      CollideActors=True
      BlockZeroExtent=False
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__CylinderComponent'
   End Object
   Components(0)=CollisionCylinder
   RemoteRole=ROLE_SimulatedProxy
   CollisionType=COLLIDE_CustomDefault
   bAlwaysRelevant=True
   bPostRenderIfNotVisible=True
   bGameRelevant=True
   bCollideActors=True
   bProjTarget=True
   CollisionComponent=CollisionCylinder
   Name="Default__TrLaserTarget"
   ObjectArchetype=Actor'Engine.Default__Actor'
}

class TrCollisionProxy_Rage extends TrCollisionProxy
	deprecated;

simulated event Touch(Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal);

simulated event UnTouch(Actor Other);

simulated function ForceProximityScan(optional float Radius)
{
	local TrFlagBase Flag;
	local TrPawn TrP;

	if (Radius == 0.0)
	{
		// Use the collision component radius if none was specified.
		Radius = CylinderComponent(CollisionComponent).CollisionRadius;
	}

	Flag = TrFlagBase(Owner);
	if (Flag == none)
	{
		return;
	}

	// Check for any players in our radius.
	foreach OverlappingActors(class'TrPawn', TrP, Radius)
	{
		// The flag must be on the same team as the player, and they must have LOS to the flag.
		if (TrP.GetTeamNum() == Flag.GetTeamNum())
		{
			TrP.SetRagePerkActive();
		}
	}
}

defaultproperties
{
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrCollisionProxy:CollisionCylinder'
      CollisionHeight=2048.000000
      CollisionRadius=2048.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockZeroExtent=False
      Translation=(X=0.000000,Y=0.000000,Z=35.500000)
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrCollisionProxy:CollisionCylinder'
   End Object
   Components(0)=CollisionCylinder
   CollisionComponent=CollisionCylinder
   Name="Default__TrCollisionProxy_Rage"
   ObjectArchetype=TrCollisionProxy'TribesGame.Default__TrCollisionProxy'
}

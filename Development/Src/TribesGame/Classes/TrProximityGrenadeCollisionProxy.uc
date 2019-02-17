class TrProximityGrenadeCollisionProxy extends TrCollisionProxy
	native;

/** Called when the player is added to the m_NearByPlayers array. */
simulated function OnPawnAdded(Pawn aPawn)
{
	local TrProj_Grenade TrProj;

	if (Role==ROLE_Authority)
	{
		TrProj = TrProj_Grenade(base);
		if( TrProj != none )
		{
			TrProj.PawnEnteredDetonationArea(aPawn);
		}
	}
}

/** Called when the player is removed from the m_NearByPlayers array. */
simulated function OnPawnRemoved(Pawn aPawn)
{
	local TrProj_Grenade TrProj;

	if (Role==ROLE_Authority)
	{
		TrProj = TrProj_Grenade(base);
		if( TrProj != none )
		{
			TrProj.PawnLeftDetonationArea(aPawn);
		}
	}
}

simulated event Touch( Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal )
{
	if( Other == Base || Other.IsA('TrFlagBase') )
	{
		return;
	}
	Super.Touch(Other, Othercomp, HitLocation, HitNormal);
}

defaultproperties
{
   m_bIgnoreStealthPlayers=False
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrCollisionProxy:CollisionCylinder'
      ReplacementPrimitive=None
      CollideActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrCollisionProxy:CollisionCylinder'
   End Object
   Components(0)=CollisionCylinder
   CollisionComponent=CollisionCylinder
   Name="Default__TrProximityGrenadeCollisionProxy"
   ObjectArchetype=TrCollisionProxy'TribesGame.Default__TrCollisionProxy'
}

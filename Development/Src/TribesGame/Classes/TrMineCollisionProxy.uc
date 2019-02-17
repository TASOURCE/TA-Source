class TrMineCollisionProxy extends TrCollisionProxy
	native;

var TrOrientedBoxComponent m_BoxComponent;

/** Called when the player is added to the m_NearByPlayers array. */
simulated function OnPawnAdded(Pawn aPawn)
{
	local TrProj_Mine MineProjectile;

	if (Role==ROLE_Authority)
	{
		MineProjectile = TrProj_Mine(base);
		if( MineProjectile != none )
		{
			MineProjectile.PawnEnteredDetonationArea(aPawn);
		}
	}
}

/** Called when the player is removed from the m_NearByPlayers array. */
simulated function OnPawnRemoved(Pawn aPawn)
{
	local TrProj_Mine MineProjectile;

	if (Role==ROLE_Authority)
	{
		MineProjectile = TrProj_Mine(base);
		if( MineProjectile != none )
		{
			MineProjectile.PawnLeftDetonationArea(aPawn);
		}
	}
}

defaultproperties
{
   Begin Object Class=TrOrientedBoxComponent Name=MineCollisionComponent
      ReplacementPrimitive=None
      CollideActors=True
      BlockNonZeroExtent=True
      Name="MineCollisionComponent"
      ObjectArchetype=TrOrientedBoxComponent'TribesGame.Default__TrOrientedBoxComponent'
   End Object
   m_BoxComponent=MineCollisionComponent
   m_bIgnoreStealthPlayers=False
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrCollisionProxy:CollisionCylinder'
      ReplacementPrimitive=None
      CollideActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrCollisionProxy:CollisionCylinder'
   End Object
   Components(0)=CollisionCylinder
   Components(1)=MineCollisionComponent
   CollisionComponent=MineCollisionComponent
   Name="Default__TrMineCollisionProxy"
   ObjectArchetype=TrCollisionProxy'TribesGame.Default__TrCollisionProxy'
}

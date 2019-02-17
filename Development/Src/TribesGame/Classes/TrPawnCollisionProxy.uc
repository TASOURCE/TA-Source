class TrPawnCollisionProxy extends TrCollisionProxy;

/** Called when the player is added to the m_NearByPlayers array. */
simulated function OnPawnAdded(Pawn aPawn)
{
	local TrPawn p;
	if (Role==ROLE_Authority)
	{
		p = TrPawn(base);
		if (p!=none)
			p.OnPawnDetectedByCollisionProxy(aPawn);
	}
}

/** Called when the player is removed from the m_NearByPlayers array. */
simulated function OnPawnRemoved(Pawn aPawn)
{
	local TrPawn p;
	if (Role==ROLE_Authority)
	{
		p = TrPawn(base);
		if (p!=none)
			p.OnPawnExitedCollisionProxy(aPawn);
	}
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
   Name="Default__TrPawnCollisionProxy"
   ObjectArchetype=TrCollisionProxy'TribesGame.Default__TrCollisionProxy'
}

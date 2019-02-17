class TrCollisionProxy_Flag extends TrCollisionProxy;

var int m_nFlagReachLevel;

simulated event Touch( Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal )
{
	local TrPawn TrP;
	local TrFlagBase Flag;
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier TrVM;

	TrP = TrPawn(Other);
	if (TrP != none)
	{
		TrPRI = TrPlayerReplicationInfo(TrP.PlayerReplicationInfo);
		if (TrPRI != none)
		{
			TrVM = TrPRI.GetCurrentValueModifier();
			Flag = TrFlagBase(Owner);

			// Make sure their flag reach level is ours.
			if (TrVM != none && Flag != none && TrVM.m_bFlagReach && TrVM.m_nFlagReachTier >= m_nFlagReachLevel)
			{
				Flag.OnCollisionProxyTouched(TrP);
			}
		}
	}
}

defaultproperties
{
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrCollisionProxy:CollisionCylinder'
      CollisionHeight=80.000000
      CollisionRadius=45.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockZeroExtent=False
      Translation=(X=0.000000,Y=0.000000,Z=35.500000)
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrCollisionProxy:CollisionCylinder'
   End Object
   Components(0)=CollisionCylinder
   CollisionComponent=CollisionCylinder
   Name="Default__TrCollisionProxy_Flag"
   ObjectArchetype=TrCollisionProxy'TribesGame.Default__TrCollisionProxy'
}

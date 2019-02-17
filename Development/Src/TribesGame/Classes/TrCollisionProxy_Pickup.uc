class TrCollisionProxy_Pickup extends TrCollisionProxy;

simulated event Touch( Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal )
{
	local TrPawn TrP;
	local TrDroppedPickup Pickup;

	TrP = TrPawn(Other);
	if( TrP != none )
	{
		Pickup = TrDroppedPickup(Owner);
		if( Pickup != none )
		{
			Pickup.OnCollisionProxyTouched(TrP);
		}
	}
}

defaultproperties
{
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrCollisionProxy:CollisionCylinder'
      CollisionHeight=80.000000
      CollisionRadius=100.500000
      ReplacementPrimitive=None
      CollideActors=True
      BlockZeroExtent=False
      Translation=(X=0.000000,Y=0.000000,Z=35.500000)
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrCollisionProxy:CollisionCylinder'
   End Object
   Components(0)=CollisionCylinder
   CollisionComponent=CollisionCylinder
   Name="Default__TrCollisionProxy_Pickup"
   ObjectArchetype=TrCollisionProxy'TribesGame.Default__TrCollisionProxy'
}

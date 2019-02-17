class TrInventoryStationCollision extends TrStationCollision;

function bool CheckCanPawnUseStationNow(TrPawn P)
{
	local TrPlayerReplicationInfo TrPRI;
	local float TimeSinceLastVisit;
	local TrPlayerController TrPC;

	if( P != none )
	{
		TrPRI = P.GetTribesReplicationInfo();
		TrPC = TrPlayerController(P.Controller);
		if( TrPRI != none && TrPC != none )
		{
			if( P.m_fLastInventoryStationVisitTime == 0.0 )
			{
				// Pawn has never visited a station before.
				return true;
			}
			
			TimeSinceLastVisit = WorldInfo.TimeSeconds - P.m_fLastInventoryStationVisitTime;
			if( TimeSinceLastVisit < P.m_fInventoryStationLockoutTime )
			{
				TrPC.ReceiveLocalizedMessage(class'TrLockedStationMessage',FCeil(P.m_fInventoryStationLockoutTime - TimeSinceLastVisit));
				return false;
			}
		}
		return true;
	}
	return false;
}

defaultproperties
{
   m_bCanBeUsedDuringWarmupRound=True
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrStationCollision:CollisionCylinder'
      CollisionHeight=50.000000
      CollisionRadius=15.000000
      bAlwaysRenderIfSelected=True
      ReplacementPrimitive=None
      CollideActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrStationCollision:CollisionCylinder'
   End Object
   Components(0)=CollisionCylinder
   CollisionComponent=CollisionCylinder
   Name="Default__TrInventoryStationCollision"
   ObjectArchetype=TrStationCollision'TribesGame.Default__TrStationCollision'
}

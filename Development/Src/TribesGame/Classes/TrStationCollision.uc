class TrStationCollision extends Actor;

var transient bool m_bOccupied;
var transient TrPawn m_OccupiedPawn;
var bool m_bCanBeUsedDuringWarmupRound;

simulated function int GetPawnsInStation() { return m_OccupiedPawn == none ? 0 : 1; }

simulated event Touch(Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal)
{
    local TrPawn P;
    local TrStation Station;
	local TrPlayerController TrPC;
	local TrGameReplicationInfo TrGRI;

    Station = TrStation(Owner);
	if (Station == none)
		return;

	TrGRI = TrGameReplicationInfo(WorldInfo.GRI);
	if( TrGRI != none && TrGRI.bWarmupRound && !m_bCanBeUsedDuringWarmupRound )
	{
		// Can't use this station during a warmup round.
		return;
	}

    Super.Touch(Other,OtherComp,HitLocation,HitNormal);

	P = TrPawn(Other);

	if( P != none )
	{
		TrPC = TrPlayerController(P.Controller);

		if( Station.m_OwningCaHCapturePoint != none && Station.DefenderTeamIndex == 255 && Station.m_OwningCaHCapturePoint.DefenderTeamIndex == 255 )
		{
			// The owning capture point is neutral, so deny access.
			if( WorldInfo.NetMode != NM_DedicatedServer && P.IsLocallyControlled() && TrPC != none )
			{
				TrPC.ReceiveLocalizedMessage(class'TrStationMessage',2);
			}
			return;
		}
		else if( Station.m_OwningCaHCapturePoint != none && !Station.m_OwningCaHCapturePoint.r_bIsHeld )
		{
			// The owning capture point is not held, so deny access.
			if( WorldInfo.NetMode != NM_DedicatedServer && P.IsLocallyControlled() && TrPC != none )
			{
				TrPC.ReceiveLocalizedMessage(class'TrStationMessage',3,,,Station.m_OwningCaHCapturePoint);
			}
			return;
		}
		
		if( Station.DefenderTeamIndex != 255 && P.GetTeamNum() != Station.DefenderTeamIndex )
		{
			// Deny because the station belongs to an enemy.
			if( WorldInfo.NetMode != NM_DedicatedServer && P.IsLocallyControlled() && TrPC != none )
			{
				TrPC.ReceiveLocalizedMessage(class'TrStationMessage',1);
			}
		}
	}

	// If we require power and we aren't powered, abort.
    if( !Station.r_bIsPowered && Station.ReceivesPowerFromGenerator() )
    {
		// Play a 'denied' sound.
		if( WorldInfo.NetMode != NM_DedicatedServer && P != none && P.IsLocallyControlled() && P.GetTeamNum() == Station.DefenderTeamIndex )
		{
			if( TrPC != none )
			{
				TrPC.ReceiveLocalizedMessage(class'TrStationMessage',0);
			}
		}
		return;
    }

	// Do any last checks to see if the pawn is denied for any reason
	if( !CheckCanPawnUseStationNow(P) )
	{
		return;
	}

    if( P != None && m_OccupiedPawn == None && Station != None && (P.GetTeamNum() == Station.DefenderTeamIndex || Station.DefenderTeamIndex == 255) )
    {
		if( Role == ROLE_Authority )
		{
			Station.PawnEnteredStation(P);
		}

        SetCollision(TRUE, TRUE);
        m_OccupiedPawn = P;
    }
}

simulated event UnTouch(Actor Other)
{
    local TrPawn P;
    local TrStation Station;

    Super.UnTouch(Other);

    Station = TrStation(Owner);

    P = TrPawn(Other);
    if( P != None && P == m_OccupiedPawn )
	{
        SetCollision(TRUE, FALSE);
        m_OccupiedPawn = None;
        if( Station != None && Role == ROLE_Authority )
        {
            Station.PawnLeftStation(P);
        }
    }
}

function bool CheckCanPawnUseStationNow(TrPawn P)
{
	return true;
}

defaultproperties
{
   Begin Object Class=CylinderComponent Name=CollisionCylinder
      CollisionHeight=50.000000
      CollisionRadius=15.000000
      bAlwaysRenderIfSelected=True
      ReplacementPrimitive=None
      CollideActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__CylinderComponent'
   End Object
   Components(0)=CollisionCylinder
   RemoteRole=ROLE_SimulatedProxy
   CollisionType=COLLIDE_CustomDefault
   bCollideActors=True
   NetUpdateFrequency=1.000000
   CollisionComponent=CollisionCylinder
   Name="Default__TrStationCollision"
   ObjectArchetype=Actor'Engine.Default__Actor'
}

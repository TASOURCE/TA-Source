///////////////////////////////////////////////////////////////////////////////
//
//
// TgCollisionProxy - Need an non-abstract,non-static actor as a placeholder/proxy
// Unlike TgDummyActor, CollisionProxy will collide with actors but never block
// It is currently used in the server side for TgDeployable with proximity Range
// This allows the actual Deployable keeps its original collision (properly take hits)
// which still support the proximity checking by touching event
//
//
///////////////////////////////////////////////////////////////////////////////
class TrCollisionProxy extends Actor
    native;

var     array<Pawn>             m_NearByPawns;
var     bool                    m_bIgnoreStealthPlayers;
var     bool                    m_bIgnoreNonPlayers;
var     bool                    m_bIgnoreHackedPawns;
var     bool                    m_bIgnoreInvulnerablePlayers;
var     bool                    m_bForwardOwnerOnly;

/** Should we only track local pawns? */
var bool m_bTrackLocallyControlledPawnsOnly;

/** Calls a touch between this and Other.*/
native function TouchOther(Actor Other, PrimitiveComponent OtherComp);

//
//  force a scan of the proximity
//
simulated function ForceProximityScan(optional float radius)
{
	local TrPawn p;

	if( radius == 0.0 )
	{
		// Use the collision component radius if none was specified.
		radius = CylinderComponent(CollisionComponent).CollisionRadius;
	}

	// Since we do not get touched events for encroachers, touch any overlapping pawns.
	foreach OverlappingActors( class'TrPawn',p,radius )
	{
		TouchOther(p, p.Mesh);
	}
}

//player goes into the proxmity
simulated event Touch( Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal )
{
    local Pawn aPawn;

    aPawn = Pawn(Other);

    if(!m_bForwardOwnerOnly && aPawn != None)
    {
        CheckNearByPawns(aPawn, true);
    }

    if(Owner != None)
    {
        Owner.Touch(Other, OtherComp, HitLocation, HitNormal);
    }
}

simulated event UnTouch(Actor Other)
{
    local Pawn aPawn;

    aPawn = Pawn(Other);
  
    if(!m_bForwardOwnerOnly && aPawn != None)
    {
        CheckNearByPawns(aPawn, false);
    }

    if(Owner != None)
    {
        Owner.Untouch(Other);
    }

}

simulated event bool ShouldIgnoreActor(Actor actor)
{
    return false;
}

simulated function ForceClearNearByPawnsList()
{
	local int i;

	for( i=0; i < m_NearByPawns.Length; i++ )
	{
		OnPawnRemoved(m_NearByPawns[i]);
		m_NearByPawns.Remove(i, 1);
	}
}

simulated function Destroyed()
{
	ForceClearNearByPawnsList();
	Super.Destroyed();
}

simulated function CheckNearByPawns(Pawn aPawn, bool bAdd)
{
    local bool bFound;
    local int i;
    local int nLen;

    nLen = m_NearByPawns.Length;

    for(i=0; i<nLen; i++)
    {
        if(aPawn == m_NearByPawns[i])
        {
            bFound = true;
            break;
        }
    }

    if(bAdd)
    {
        if(!bFound)
        {
			if( !m_bTrackLocallyControlledPawnsOnly || (m_bTrackLocallyControlledPawnsOnly && aPawn.IsLocallyControlled()) )
			{
				m_NearByPawns.Insert(nLen,1);
				m_NearByPawns[i] = aPawn;
				OnPawnAdded(aPawn);
			}
        }
    }
    else
    {
        if(bFound)
        {
            m_NearByPawns.Remove(i, 1);
			OnPawnRemoved(aPawn);
        }
    }
    
}

/** Called when the player is added to the m_NearByPlayers array. */
simulated function OnPawnAdded(Pawn aPawn);

/** Called when the player is removed from the m_NearByPlayers array. */
simulated function OnPawnRemoved(Pawn aPawn);

//return the count of nearby players (take consideration of whether ignoring players)
simulated function int GetNearByPawns(optional bool bOnlyValid = true)
{
    local Pawn    P;
    local int       nCount;
    local int       i;

    // Just get the raw value (including stealth and disguise)
    if (!bOnlyValid) return m_NearByPawns.Length;

    // Filter out invalid players
    for (i =0; i<m_NearByPawns.Length; i++)
    {
        P = m_NearByPawns[i];

        if (P==None)
        {
            continue;
        }

        if (ShouldIgnoreActor(P)) continue;

      
        nCount++;
       
    }    

    return nCount;
}

simulated event FellOutOfWorld(class<DamageType> dmgType);

defaultproperties
{
   m_bIgnoreStealthPlayers=True
   m_bIgnoreNonPlayers=True
   m_bIgnoreHackedPawns=True
   m_bIgnoreInvulnerablePlayers=True
   Begin Object Class=CylinderComponent Name=CollisionCylinder
      ReplacementPrimitive=None
      CollideActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__CylinderComponent'
   End Object
   Components(0)=CollisionCylinder
   CollisionType=COLLIDE_CustomDefault
   bCollideActors=True
   CollisionComponent=CollisionCylinder
   Name="Default__TrCollisionProxy"
   ObjectArchetype=Actor'Engine.Default__Actor'
}

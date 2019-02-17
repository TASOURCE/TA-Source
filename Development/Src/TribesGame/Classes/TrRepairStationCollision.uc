class TrRepairStationCollision extends TrStationCollision;

var     array<Pawn>             m_NearByPawns;

simulated function int GetPawnsInStation() { return m_NearByPawns.Length; }

simulated function CheckNearByPawns(TrPawn aPawn, bool bAdd)
{
    local bool bFound;
    local int i;
    local int nLen;
    local TrStation Station;

    Station = TrStation(Owner);
	if (Station == none)
		return;

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
            m_NearByPawns.Insert(nLen,1);
            m_NearByPawns[i] = aPawn;

			Station.PawnEnteredStation(aPawn);
        }
    }
    else
    {
        if(bFound)
        {
            m_NearByPawns.Remove(i, 1);

			Station.PawnLeftStation(aPawn);
        }
    }
    
}

simulated event Touch(Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal)
{
	local TrPawn aPawn;
    local TrStation Station;

    super(Actor).Touch(Other, OtherComp, HitLocation, HitNormal);

	aPawn = TrPawn(Other);
	Station = TrStation(Owner);
	if (aPawn == none || Station == none || aPawn.GetTeamNum() != Station.GetTeamNum())
		return;

	if (Station.IsInLOS_Basic(aPawn))
		CheckNearByPawns(aPawn, true);
}

simulated event UnTouch(Actor Other)
{
    super(Actor).UnTouch(Other);

	if (Other.IsA('TrPawn'))
		CheckNearByPawns(TrPawn(Other), false);
}

defaultproperties
{
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrStationCollision:CollisionCylinder'
      CollisionHeight=100.000000
      CollisionRadius=150.000000
      bAlwaysRenderIfSelected=True
      ReplacementPrimitive=None
      CollideActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrStationCollision:CollisionCylinder'
   End Object
   Components(0)=CollisionCylinder
   Components(1)=CollisionCylinder
   CollisionComponent=CollisionCylinder
   Name="Default__TrRepairStationCollision"
   ObjectArchetype=TrStationCollision'TribesGame.Default__TrStationCollision'
}

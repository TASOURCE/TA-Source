class TrStormControlPointGate extends TrGameObjective
    placeable;

var() TrStormControlPoint m_ControlPoint;

simulated event Touch(Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal)
{
	local TrPawn TrP;

	super.Touch(Other, OtherComp, HitLocation, HitNormal);

	if( Role == ROLE_Authority )
	{
		TrP = TrPawn(Other);
		if( TrP != none && m_ControlPoint != none && TrP.IsAliveAndWell() )
		{
			;
			m_ControlPoint.OnPawnTouched(TrP);
		}
	}
}

simulated event PostRenderFor(PlayerController PC, Canvas Canvas, vector CameraPosition, vector CameraDir)
{
	local string DisplayName, ControlDescription;
	local TrHUD HUD;
	local vector screenLoc, vMarkerOffset, NamePlacement;
	local Color TextColor;

	if( m_ControlPoint == none )
	{
		return;
	}

	HUD = TrHUD(PC.MyHUD);
	if( HUD != none && HUD.bIsMainMenuOpen )
	{
		// Don't draw any markers if the main menu is open because they may intefere with paperdolls.
		return;
	}

	// Do not draw if we aren't facing the objective.
	if ((CameraDir dot (Location - CameraPosition)) <= 0.f)
		return;

	// Calculate positions.
	vMarkerOffset = MarkerOffset * vect(0,0,1);
	screenLoc = Canvas.Project(Location + vMarkerOffset);
	screenLoc.Z = VSize(CameraPosition - Location);

	ControlDescription = "Control:";
	switch( m_ControlPoint.GetControlPointState() )
	{
		case ControlPointState_Neutral:
			ControlDescription = ControlDescription@"Neutral";
			TextColor = class'HUD'.default.WhiteColor;
			break;
		case ControlPointState_FullyOwnedBE:
			ControlDescription = ControlDescription@"Blood Eagle";
			TextColor = PC.GetTeamNum() == 0 ? class'TrHUD'.default.ColorFriend : class'TrHUD'.default.ColorEnemy;
			break;
		case ControlPointState_FullyOwnedDS:
			ControlDescription = ControlDescription@"Diamond Sword";
			TextColor = PC.GetTeamNum() == 1 ? class'TrHUD'.default.ColorFriend : class'TrHUD'.default.ColorEnemy;
			break;
		case ControlPointState_TransitioningToDS:
			ControlDescription = ControlDescription@int(m_ControlPoint.m_fCurrentTransitionAmount*100.0);
			TextColor = class'HUD'.default.WhiteColor;
			break;
		case ControlPointState_TransitioningToBE:
			ControlDescription = ControlDescription@int((1.0 - m_ControlPoint.m_fCurrentTransitionAmount)*100.0);
			TextColor = class'HUD'.default.WhiteColor;
			break;
	}

	// Name.
	DisplayName = m_ControlPoint.GetScreenName(PC);
	NamePlacement = screenLoc;
	NamePlacement.Y += m_fObjectiveNamePlacementY;
	HUD.DrawColoredMarkerText(DisplayName, TextColor, NamePlacement, Canvas);

	// Control Description
	NamePlacement = screenLoc;
	NamePlacement.Y += m_ControlPoint.m_fControlDescriptionPlacementY;
	HUD.DrawColoredMarkerText(ControlDescription, TextColor, NamePlacement, Canvas);
}

defaultproperties
{
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrGameObjective:MyLightEnvironment'
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrGameObjective:MyLightEnvironment'
   End Object
   m_LightEnvironment=MyLightEnvironment
   Begin Object Class=SkeletalMeshComponent Name=ObjectiveMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:ObjectiveMesh'
      Begin Object Class=AnimNodeSequence Name=AnimNodeSeq0 Archetype=AnimNodeSequence'TribesGame.Default__TrGameObjective:AnimNodeSeq0'
         Name="AnimNodeSeq0"
         ObjectArchetype=AnimNodeSequence'TribesGame.Default__TrGameObjective:AnimNodeSeq0'
      End Object
      Animations=AnimNodeSequence'TribesGame.Default__TrStormControlPointGate:ObjectiveMesh.AnimNodeSeq0'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrStormControlPointGate:MyLightEnvironment'
      Name="ObjectiveMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:ObjectiveMesh'
   End Object
   m_Mesh=ObjectiveMesh
   Begin Object Class=SkeletalMeshComponent Name=ShieldMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:ShieldMesh'
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      Name="ShieldMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:ShieldMesh'
   End Object
   m_ShieldMesh=ShieldMesh
   MarkerOffset=96
   m_sScreenName="Control Switch"
   Begin Object Class=AudioComponent Name=OnlineSound Archetype=AudioComponent'TribesGame.Default__TrGameObjective:OnlineSound'
      bShouldRemainActiveIfDropped=True
      Name="OnlineSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrGameObjective:OnlineSound'
   End Object
   m_OnlineSound=OnlineSound
   Begin Object Class=AudioComponent Name=CriticalSound Archetype=AudioComponent'TribesGame.Default__TrGameObjective:CriticalSound'
      bShouldRemainActiveIfDropped=True
      Name="CriticalSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrGameObjective:CriticalSound'
   End Object
   m_CriticalSound=CriticalSound
   Begin Object Class=AudioComponent Name=ShieldHitSound Archetype=AudioComponent'TribesGame.Default__TrGameObjective:ShieldHitSound'
      Name="ShieldHitSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrGameObjective:ShieldHitSound'
   End Object
   m_ShieldHitSound=ShieldHitSound
   Begin Object Class=AudioComponent Name=PowerDownSound Archetype=AudioComponent'TribesGame.Default__TrGameObjective:PowerDownSound'
      Name="PowerDownSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrGameObjective:PowerDownSound'
   End Object
   m_PowerDownSound=PowerDownSound
   Begin Object Class=AudioComponent Name=DestroyedSound Archetype=AudioComponent'TribesGame.Default__TrGameObjective:DestroyedSound'
      bShouldRemainActiveIfDropped=True
      Name="DestroyedSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrGameObjective:DestroyedSound'
   End Object
   m_DestroyedSound=DestroyedSound
   DefenderTeamIndex=255
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrGameObjective:CollisionCylinder'
      CollisionHeight=75.000000
      CollisionRadius=100.000000
      ReplacementPrimitive=None
      CollideActors=True
      Translation=(X=0.000000,Y=0.000000,Z=75.000000)
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrGameObjective:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'TribesGame.Default__TrGameObjective:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      ArrowSize=0.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'TribesGame.Default__TrGameObjective:Arrow'
   End Object
   Components(0)=Arrow
   Components(1)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'TribesGame.Default__TrGameObjective:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'TribesGame.Default__TrGameObjective:PathRenderer'
   End Object
   Components(2)=PathRenderer
   Components(3)=MyLightEnvironment
   Components(4)=ObjectiveMesh
   Begin Object Class=SkeletalMeshComponent Name=CollisionMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:CollisionMesh'
      bHasPhysicsAssetInstance=True
      ReplacementPrimitive=None
      RBChannel=RBCC_GameplayPhysics
      HiddenGame=True
      HiddenEditor=True
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=True
      BlockNonZeroExtent=True
      BlockRigidBody=True
      RBCollideWithChannels=(Default=True,GameplayPhysics=True,EffectPhysics=True,BlockingVolume=True)
      Name="CollisionMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:CollisionMesh'
   End Object
   Components(5)=CollisionMesh
   Components(6)=ShieldMesh
   Components(7)=OnlineSound
   Components(8)=CriticalSound
   Components(9)=ShieldHitSound
   Components(10)=PowerDownSound
   Components(11)=DestroyedSound
   Components(12)=CollisionCylinder
   bAlwaysRelevant=True
   bPostRenderIfNotVisible=True
   CollisionComponent=CollisionCylinder
   Name="Default__TrStormControlPointGate"
   ObjectArchetype=TrGameObjective'TribesGame.Default__TrGameObjective'
}

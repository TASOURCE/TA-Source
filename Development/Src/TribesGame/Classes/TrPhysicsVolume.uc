class TrPhysicsVolume extends PhysicsVolume
	dependson(TrVGSCommandList) 
	placeable;

/** Specifies the location type. */
var() EVGSContextLocation m_ContextLocation;

/** Specifies the defending team index. */
var() byte m_DefenderTeamIndex;

defaultproperties
{
   Priority=1
   BrushColor=(B=30,G=255,R=200,A=0)
   bColored=True
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__PhysicsVolume:BrushComponent0'
      ReplacementPrimitive=None
      bAcceptsLights=True
      CollideActors=True
      BlockZeroExtent=True
      BlockNonZeroExtent=True
      bDisableAllRigidBody=True
      AlwaysLoadOnClient=True
      AlwaysLoadOnServer=True
      LightingChannels=(bInitialized=True,Dynamic=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'Engine.Default__PhysicsVolume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   CollisionType=COLLIDE_CustomDefault
   CollisionComponent=BrushComponent0
   Name="Default__TrPhysicsVolume"
   ObjectArchetype=PhysicsVolume'Engine.Default__PhysicsVolume'
}

class TrEmitCameraEffect_Snow extends TrEmitCameraEffect_Speed;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();

	// render in front of all in world objects
	ParticleSystemComponent.SetDepthPriorityGroup(SDPG_World);
}

defaultproperties
{
   m_bUpdateRotation=False
   m_bUpdateLocationBasedOnVelocity=False
   DistFromCamera=300.000000
   Begin Object Class=ParticleSystemComponent Name=ParticleSystemComponent0 Archetype=ParticleSystemComponent'TribesGame.Default__TrEmitCameraEffect_Speed:ParticleSystemComponent0'
      ReplacementPrimitive=None
      Name="ParticleSystemComponent0"
      ObjectArchetype=ParticleSystemComponent'TribesGame.Default__TrEmitCameraEffect_Speed:ParticleSystemComponent0'
   End Object
   ParticleSystemComponent=ParticleSystemComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'TribesGame.Default__TrEmitCameraEffect_Speed:Sprite'
      Sprite=Texture2D'EditorResources.S_Emitter'
      bIsScreenSizeScaled=True
      ScreenSize=0.002500
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'TribesGame.Default__TrEmitCameraEffect_Speed:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=ParticleSystemComponent0
   Begin Object Class=ArrowComponent Name=ArrowComponent0 Archetype=ArrowComponent'TribesGame.Default__TrEmitCameraEffect_Speed:ArrowComponent0'
      ArrowColor=(B=128,G=255,R=0,A=255)
      ArrowSize=1.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="ArrowComponent0"
      ObjectArchetype=ArrowComponent'TribesGame.Default__TrEmitCameraEffect_Speed:ArrowComponent0'
   End Object
   Components(2)=ArrowComponent0
   Name="Default__TrEmitCameraEffect_Snow"
   ObjectArchetype=TrEmitCameraEffect_Speed'TribesGame.Default__TrEmitCameraEffect_Speed'
}

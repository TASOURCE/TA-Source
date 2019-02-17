class TrEffect_MovableDecal extends DecalActorMovable;

defaultproperties
{
   Begin Object Class=DecalComponent Name=NewDecalComponent Archetype=DecalComponent'Engine.Default__DecalActorMovable:NewDecalComponent'
      bMovableDecal=True
      DecalTransform=DecalTransform_OwnerAbsolute
      ReplacementPrimitive=None
      Name="NewDecalComponent"
      ObjectArchetype=DecalComponent'Engine.Default__DecalActorMovable:NewDecalComponent'
   End Object
   Decal=NewDecalComponent
   Components(0)=NewDecalComponent
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__DecalActorMovable:Sprite'
      Sprite=Texture2D'EditorResources.S_DecalActorIcon'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.150000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__DecalActorMovable:Sprite'
   End Object
   Components(1)=Sprite
   Begin Object Class=ArrowComponent Name=ArrowComponent0 Archetype=ArrowComponent'Engine.Default__DecalActorMovable:ArrowComponent0'
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="ArrowComponent0"
      ObjectArchetype=ArrowComponent'Engine.Default__DecalActorMovable:ArrowComponent0'
   End Object
   Components(2)=ArrowComponent0
   bNoDelete=False
   Name="Default__TrEffect_MovableDecal"
   ObjectArchetype=DecalActorMovable'Engine.Default__DecalActorMovable'
}

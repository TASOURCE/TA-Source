/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTQueuedAnnouncement extends Info;

var UTQueuedAnnouncement nextAnnouncement;

var class<UTLocalMessage> AnnouncementClass;
var int MessageIndex;
var PlayerReplicationInfo PRI;
var Object OptionalObject;

defaultproperties
{
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Info:Sprite'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Info:Sprite'
   End Object
   Components(0)=Sprite
   CollisionType=COLLIDE_CustomDefault
   Name="Default__UTQueuedAnnouncement"
   ObjectArchetype=Info'Engine.Default__Info'
}

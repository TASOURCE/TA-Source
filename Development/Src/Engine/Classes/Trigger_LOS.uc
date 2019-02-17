/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class Trigger_LOS extends Trigger;

var array<PlayerController> PCsWithLOS;

/**
 * Overridden to check for any players looking at this
 * trigger.
 */
simulated event Tick(float DeltaTime)
{
	local array<SequenceEvent> losEvents;
	local SeqEvent_LOS evt;
	local PlayerController Player;
	local int idx;
	local vector cameraLoc;
	local rotator cameraRot;
	local float cameraDist;
	local array<int> ActivateIndices;

	// if any valid los events are attached,
	if (FindEventsOfClass(class'SeqEvent_LOS',losEvents))
	{
		// look through each player
		foreach WorldInfo.AllControllers(class'PlayerController', Player)
		{
			if (Player.Pawn != None)
			{
				player.GetPlayerViewPoint(cameraLoc, cameraRot);
				cameraDist = PointDistToLine(Location,vector(cameraRot),cameraLoc);
				// iterate through each event and see if this meets the activation requirements
				for (idx = 0; idx < losEvents.Length; idx++)
				{
					evt = SeqEvent_LOS(losEvents[idx]);
					if ( cameraDist <= evt.ScreenCenterDistance &&
						VSize(player.Pawn.Location-Location) <= evt.TriggerDistance &&
						Normal(Location - cameraLoc) dot vector(cameraRot) > 0.f &&
						(!evt.bCheckForObstructions || Player.LineOfSightTo(self, cameraLoc)) )
					{
						// attempt to activate the event
						ActivateIndices[0] = 0;
						if ( PCsWithLOS.Find(Player) == INDEX_NONE &&
							losEvents[idx].CheckActivate(self, Player.Pawn, false, ActivateIndices) )
						{
							PCsWithLOS.AddItem(Player);
						}
					}
					else if (PCsWithLOS.Find(Player) != INDEX_NONE)
					{
						ActivateIndices[0] = 1;
						if (losEvents[idx].CheckActivate(self, Player.Pawn, false, ActivateIndices))
						{
							PCsWithLOS.RemoveItem(Player);
						}
					}
				}
			}
		}
	}
}

defaultproperties
{
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'Engine.Default__Trigger:CollisionCylinder'
      CollisionHeight=40.000000
      CollisionRadius=40.000000
      bAlwaysRenderIfSelected=True
      ReplacementPrimitive=None
      CollideActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__Trigger:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Trigger:Sprite'
      Sprite=Texture2D'EditorResources.S_Trigger'
      ReplacementPrimitive=None
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Trigger:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=CollisionCylinder
   CollisionComponent=CollisionCylinder
   SupportedEvents(0)=Class'Engine.SeqEvent_LOS'
   Name="Default__Trigger_LOS"
   ObjectArchetype=Trigger'Engine.Default__Trigger'
}

/**
 *	LensFlare source actor class.
 *	Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class LensFlareSource extends Actor
	native(LensFlare)
	placeable;

var()	editconst const	LensFlareComponent		LensFlareComp;

/** used to update status of toggleable level placed lens flares on clients */
var repnotify bool bCurrentlyActive;

replication
{
	if (bNoDelete)
		bCurrentlyActive;
}

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

//native noexport event SetTemplate(LensFlare NewTemplate);
native final function SetTemplate(LensFlare NewTemplate);

simulated event PostBeginPlay()
{
	bCurrentlyActive = LensFlareComp.bIsActive;
}

/**
 * Handling Toggle event from Kismet.
 */
simulated function OnToggle(SeqAct_Toggle action)
{
	// Turn ON
	if (action.InputLinks[0].bHasImpulse)
	{
		LensFlareComp.SetIsActive(TRUE);
		bCurrentlyActive = TRUE;
	}
	// Turn OFF
	else if (action.InputLinks[1].bHasImpulse)
	{
		LensFlareComp.SetIsActive(FALSE);
		bCurrentlyActive = FALSE;
	}
	// Toggle
	else if (action.InputLinks[2].bHasImpulse)
	{
		// If spawning is suppressed or we aren't turned on at all, activate.
		if (!bCurrentlyActive)
		{
			LensFlareComp.SetIsActive(TRUE);
			bCurrentlyActive = TRUE;
		}
		else
		{
			LensFlareComp.SetIsActive(FALSE);
			bCurrentlyActive = FALSE;
		}
	}
	LensFlareComp.LastRenderTime = WorldInfo.TimeSeconds;
	ForceNetRelevant();
}

simulated event ReplicatedEvent(name VarName)
{
	if (VarName == nameof(bCurrentlyActive))
	{
		LensFlareComp.SetIsActive(bCurrentlyActive);
		LensFlareComp.LastRenderTime = WorldInfo.TimeSeconds;
	}
}

simulated function SetFloatParameter(name ParameterName, float Param)
{
/***
	if (LensFlareComp != none)
	{
		LensFlareComp.SetFloatParameter(ParameterName, Param);
	}
	else
	{
		`log("Warning: Attempting to set a parameter on "$self$" when the PSC does not exist");
	}
***/
}

simulated function SetVectorParameter(name ParameterName, vector Param)
{
/***
	if (LensFlareComp != none)
	{
		LensFlareComp.SetVectorParameter(ParameterName, Param);
	}
	else
	{
		`log("Warning: Attempting to set a parameter on "$self$" when the PSC does not exist");
	}
***/
}

simulated function SetColorParameter(name ParameterName, linearcolor Param)
{
/***
	if (LensFlareComp != none)
	{
		LensFlareComp.SetColorParameter(ParameterName, Param);
	}
	else
	{
		`log("Warning: Attempting to set a parameter on "$self$" when the PSC does not exist");
	}
***/
}

simulated function SetExtColorParameter(name ParameterName, float Red, float Green, float Blue, float Alpha)
{
/***
	local linearcolor c;

	if (LensFlareComp != none)
	{
		c.r = Red;
		c.g = Green;
		c.b = Blue;
		c.a = Alpha;
		LensFlareComp.SetColorParameter(ParameterName, C);
	}
	else
	{
		`log("Warning: Attempting to set a parameter on "$self$" when the PSC does not exist");
	}
***/
}


simulated function SetActorParameter(name ParameterName, actor Param)
{
/***
	if (LensFlareComp != none)
	{
		LensFlareComp.SetActorParameter(ParameterName, Param);
	}
	else
	{
		`log("Warning: Attempting to set a parameter on "$self$" when the PSC does not exist");
	}
***/
}

/**
 * Kismet handler for setting particle instance parameters.
 */
/***
simulated function OnSetLensFlareParam(SeqAct_SetLensFlareParam Action)
{
	local int Idx, ParamIdx;
	if ((LensFlareComp != None) && (Action.InstanceParameters.Length > 0))
	{
		for (Idx = 0; Idx < Action.InstanceParameters.Length; Idx++)
		{
			if (Action.InstanceParameters[Idx].ParamType != PSPT_None)
			{
				// look for an existing entry
				ParamIdx = LensFlareComp.InstanceParameters.Find('Name',Action.InstanceParameters[Idx].Name);
				// create one if necessary
				if (ParamIdx == -1)
				{
					ParamIdx = LensFlareComp.InstanceParameters.Length;
					LensFlareComp.InstanceParameters.Length = ParamIdx + 1;
				}
				// update the instance parm
				LensFlareComp.InstanceParameters[ParamIdx] = Action.InstanceParameters[Idx];
				if (Action.bOverrideScalar)
				{
					LensFlareComp.InstanceParameters[ParamIdx].Scalar = Action.ScalarValue;
				}
			}
		}
	}
}
***/

cpptext
{
	void AutoPopulateInstanceProperties();

	// AActor interface.
	/**
	 * Function that gets called from within Map_Check to allow this actor to check itself
	 * for any potential errors and register them with map check dialog.
	 */
#if WITH_EDITOR
	virtual void CheckForErrors();
#endif

}


defaultproperties
{
   Begin Object Class=LensFlareComponent Name=LensFlareComponent0
      PreviewInnerCone=DrawLightConeComponent'Engine.Default__LensFlareSource:DrawInnerCone0'
      PreviewOuterCone=DrawLightConeComponent'Engine.Default__LensFlareSource:DrawOuterCone0'
      PreviewRadius=DrawLightRadiusComponent'Engine.Default__LensFlareSource:DrawRadius0'
      NextTraceTime=-0.005548
      ReplacementPrimitive=None
      Name="LensFlareComponent0"
      ObjectArchetype=LensFlareComponent'Engine.Default__LensFlareComponent'
   End Object
   LensFlareComp=LensFlareComponent0
   Begin Object Class=SpriteComponent Name=Sprite
      Sprite=Texture2D'EditorResources.S_Emitter'
      bIsScreenSizeScaled=True
      ScreenSize=0.002500
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(0)=Sprite
   Begin Object Class=DrawLightConeComponent Name=DrawInnerCone0
      ReplacementPrimitive=None
      Name="DrawInnerCone0"
      ObjectArchetype=DrawLightConeComponent'Engine.Default__DrawLightConeComponent'
   End Object
   Components(1)=DrawInnerCone0
   Begin Object Class=DrawLightConeComponent Name=DrawOuterCone0
      ConeColor=(B=255,G=255,R=200,A=255)
      ReplacementPrimitive=None
      Name="DrawOuterCone0"
      ObjectArchetype=DrawLightConeComponent'Engine.Default__DrawLightConeComponent'
   End Object
   Components(2)=DrawOuterCone0
   Begin Object Class=DrawLightRadiusComponent Name=DrawRadius0
      ReplacementPrimitive=None
      Name="DrawRadius0"
      ObjectArchetype=DrawLightRadiusComponent'Engine.Default__DrawLightRadiusComponent'
   End Object
   Components(3)=DrawRadius0
   Components(4)=LensFlareComponent0
   Begin Object Class=ArrowComponent Name=ArrowComponent0
      ArrowColor=(B=128,G=255,R=0,A=255)
      ArrowSize=1.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="ArrowComponent0"
      ObjectArchetype=ArrowComponent'Engine.Default__ArrowComponent'
   End Object
   Components(5)=ArrowComponent0
   CollisionType=COLLIDE_CustomDefault
   TickGroup=TG_DuringAsyncWork
   bNoDelete=True
   bHardAttach=True
   bGameRelevant=True
   bEdShouldSnap=True
   Name="Default__LensFlareSource"
   ObjectArchetype=Actor'Engine.Default__Actor'
}

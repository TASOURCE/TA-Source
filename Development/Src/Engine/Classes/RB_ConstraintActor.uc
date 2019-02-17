//=============================================================================
// The Basic constraint actor class.
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================

class RB_ConstraintActor extends RigidBodyBase
    abstract
	placeable
	native(Physics);

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
// (cpptext)
// (cpptext)
// (cpptext)

// Actors joined effected by this constraint (could be NULL for 'World')
var() Actor												ConstraintActor1;

var() Actor												ConstraintActor2;

var() editinline export noclear RB_ConstraintSetup		ConstraintSetup;
var() editinline export noclear RB_ConstraintInstance	ConstraintInstance;

// Disable collision between actors joined by this constraint.
var() const bool						bDisableCollision;

var() bool								bUpdateActor1RefFrame;
var() bool								bUpdateActor2RefFrame;

// Used if joint is a pulley to define pivot locations using actors in the level.
var(Pulley) Actor					PulleyPivotActor1;
var(Pulley) Actor					PulleyPivotActor2;

native final function SetDisableCollision(bool NewDisableCollision);
native final function InitConstraint(Actor Actor1, Actor Actor2, optional name Actor1Bone, optional name Actor2Bone, optional float BreakThreshold);
native final function TermConstraint();

/**
 * When destroyed using Kismet, break the constraint.
 */
simulated function OnDestroy(SeqAct_Destroy Action)
{
	TermConstraint();
}

/**
 * When destroyed using Kismet, break the constraint.
 */
simulated function OnToggle(SeqAct_Toggle Action)
{
	// Turn ON
	if (action.InputLinks[0].bHasImpulse)
	{
		if( Physics != PHYS_RigidBody )
		{
			SetPhysics(PHYS_RigidBody);
			InitConstraint(ConstraintActor1, ConstraintActor2, ConstraintSetup.ConstraintBone1, ConstraintSetup.ConstraintBone2);
		}
	}
	// Turn OFF
	else if (action.InputLinks[1].bHasImpulse)
	{
		if( Physics != PHYS_None )
		{
			SetPhysics(PHYS_None);
			TermConstraint();
		}
	}
	// Toggle
	else if (action.InputLinks[2].bHasImpulse)
	{
		if( Physics != PHYS_None )
		{
			SetPhysics(PHYS_None);
			TermConstraint();
		}
		else
		{
			SetPhysics(PHYS_RigidBody);
			InitConstraint(ConstraintActor1, ConstraintActor2, ConstraintSetup.ConstraintBone1, ConstraintSetup.ConstraintBone2);
		}
	}
}

/** Handle 'Toggle Constraint Drive' kismet action */
simulated function OnToggleConstraintDrive(SeqAct_ToggleConstraintDrive Action)
{
	// Turn specific drive(s) on
	if(Action.InputLinks[0].bHasImpulse)
	{
		if(Action.bEnableLinearPositionDrive)
		{
			ConstraintInstance.SetLinearPositionDrive(TRUE, TRUE, TRUE);
		}
		
		if(Action.bEnableLinearvelocityDrive)
		{
			ConstraintInstance.SetLinearVelocityDrive(TRUE, TRUE, TRUE);
		}
		
		if(Action.bEnableAngularPositionDrive)
		{
			ConstraintInstance.SetAngularPositionDrive(TRUE, TRUE);
		}
		
		if(Action.bEnableAngularVelocityDrive)
		{
			ConstraintInstance.SetAngularVelocityDrive(TRUE, TRUE);
		}
	}
	// Turn all drive off
	else if(Action.InputLinks[1].bHasImpulse)
	{
		ConstraintInstance.SetLinearPositionDrive(FALSE, FALSE, FALSE);
		ConstraintInstance.SetLinearVelocityDrive(FALSE, FALSE, FALSE);
		
		ConstraintInstance.SetAngularPositionDrive(FALSE, FALSE);
		ConstraintInstance.SetAngularVelocityDrive(FALSE, FALSE);
	}
}

cpptext
{
	virtual void physRigidBody(FLOAT DeltaTime) {};
	virtual void PostEditMove(UBOOL bFinished);
	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);
	
	/** Used for checking that this constraint is valid buring map build
	  */
#if WITH_EDITOR
	virtual void CheckForErrors();
#endif
	virtual void InitRBPhys();
	virtual void TermRBPhys(FRBPhysScene* Scene);

	void UpdateConstraintFramesFromActor();

}


defaultproperties
{
   Begin Object Class=RB_ConstraintInstance Name=MyConstraintInstance
      Name="MyConstraintInstance"
      ObjectArchetype=RB_ConstraintInstance'Engine.Default__RB_ConstraintInstance'
   End Object
   ConstraintInstance=RB_ConstraintInstance'Engine.Default__RB_ConstraintActor:MyConstraintInstance'
   bUpdateActor1RefFrame=True
   bUpdateActor2RefFrame=True
   Begin Object Class=SpriteComponent Name=Sprite
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(0)=Sprite
   Begin Object Class=RB_ConstraintDrawComponent Name=MyConDrawComponent
      ReplacementPrimitive=None
      Name="MyConDrawComponent"
      ObjectArchetype=RB_ConstraintDrawComponent'Engine.Default__RB_ConstraintDrawComponent'
   End Object
   Components(1)=MyConDrawComponent
   DrawScale=0.500000
   Physics=PHYS_RigidBody
   TickGroup=TG_PostAsyncWork
   bHidden=True
   bNoDelete=True
   bEdShouldSnap=True
   SupportedEvents(4)=Class'Engine.SeqEvent_ConstraintBroken'
   Name="Default__RB_ConstraintActor"
   ObjectArchetype=RigidBodyBase'Engine.Default__RigidBodyBase'
}

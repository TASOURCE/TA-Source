/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
/** defines a place bots should defend. Bots automatically determine reasonable defending positions in sight of their
 * objective (e.g. flag room), so these should only be used for hard to reach camping spots or choke points far from the objective area
 */
class UTDefensePoint extends UDKScriptedNavigationPoint
	placeable;

var Controller CurrentUser;
var UTDefensePoint NextDefensePoint;	// list of defensepoints for same objective
var() UDKGameObjective DefendedObjective;
var bool bFirstScript;				// first script in list of scripts
var() bool bSniping;				// bots should snipe when using this script as a defense point
var() bool bOnlyOnFoot; 		// bot should not attempt to use this script while in a vehicle
var() bool bOnlySkilled;		// low skill bots shouldn't use this defense point
var() class<Weapon> WeaponPreference;	// bots using this defense point will preferentially use this weapon
/** defensepoint grouping - bots will make sure each group has at least one defender before assigning a second */
var() name DefenseGroup;
var() enum EDefensePriority
{
	/** this point will be used after automatic defensepoints */
	DEFPRI_Low,
	/** this point will be used before automatic defensepoints */
	DEFPRI_High,
} DefensePriority;

/** sprites used for this actor in the editor, depending on which team DefendedObjective is on (if possible to determine in editor) */
var editoronly array<Texture2D> TeamSprites;

/* Reset()
reset actor to initial state - used when restarting level without reloading.
*/
function Reset()
{
	Super.Reset();
	FreePoint();
}

function FreePoint()
{
	CurrentUser = None;
}

function bool CheckForErrors()
{
	if ( DefendedObjective == None )
	{
		;
		return true;
	}

	return Super.CheckForErrors();
}

function PreBeginPlay()
{
	local UTDefensePoint S, Last;

	Super.PreBeginPlay();

	if ( DefendedObjective == None )
	{
		;
	}
	else if ( bFirstScript )
	{
		Last = self;
		// first one initialized - create script list
		ForEach AllActors(class'UTDefensePoint',S)
			if ( (S != self) && (S.DefendedObjective == DefendedObjective) )
			{
				Last.NextDefensePoint = S;
				S.bFirstScript = false;
				Last = S;
			}
	}
}

/** determines if this point is higher priority than the passed in point
 * @param S - the point to check against
 * @param B - the bot that's checking
 * @param bAutoPointsInUse - whether other bot(s) on this team are using the automatic defensepoints (so allow low priority)
 * @param bPrioritizeSameGroup - if true, prefer defensepoints of the same group as current, all else being equal
 * @param NumChecked - the number of usable points so far
 * @return whether this point is a better choice
 */
function bool HigherPriorityThan(UTDefensePoint S, UTBot B, bool bAutoPointsInUse, bool bPrioritizeSameGroup, out int NumChecked)
{
	if ( bBlocked || (bOnlySkilled && B.Skill < 3.0) || (bOnlyOnFoot && Vehicle(B.Pawn) != None) ||
		(!bAutoPointsInUse && DefensePriority < DEFPRI_High) )
	{
		return false;
	}
	if (CurrentUser != None && !CurrentUser.bDeleteMe && CurrentUser != B && WorldInfo.GRI.OnSameTeam(CurrentUser, B))
	{
		if (UTBot(CurrentUser) != None && UTBot(CurrentUser).DefensePoint != self)
		{
			UTBot(CurrentUser).DefensePoint = None;
		}
		else
		{
			return false;
		}
	}
	if (S == None || S.DefensePriority < DefensePriority)
	{
		return true;
	}
	if (S.DefensePriority > DefensePriority)
	{
		return false;
	}
	if (B.FavoriteWeapon != None && ClassIsChildOf(WeaponPreference, B.FavoriteWeapon))
	{
		return true;
	}
	if (bPrioritizeSameGroup && S.DefenseGroup != DefenseGroup)
	{
		return false;
	}
	NumChecked++;
	return (FRand() < 1.0 / float(NumChecked));
}

function Actor GetMoveTarget()
{
	return self;
}

defaultproperties
{
   bFirstScript=True
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'UDKBase.Default__UDKScriptedNavigationPoint:CollisionCylinder'
      CollisionHeight=50.000000
      CollisionRadius=50.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'UDKBase.Default__UDKScriptedNavigationPoint:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'UDKBase.Default__UDKScriptedNavigationPoint:Sprite'
      Sprite=Texture2D'EditorResources.S_NavP'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'UDKBase.Default__UDKScriptedNavigationPoint:Sprite'
   End Object
   Components(0)=Sprite
   Begin Object Class=SpriteComponent Name=Sprite2 Archetype=SpriteComponent'UDKBase.Default__UDKScriptedNavigationPoint:Sprite2'
      Sprite=Texture2D'EditorResources.Bad'
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite2"
      ObjectArchetype=SpriteComponent'UDKBase.Default__UDKScriptedNavigationPoint:Sprite2'
   End Object
   Components(1)=Sprite2
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'UDKBase.Default__UDKScriptedNavigationPoint:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      ArrowSize=0.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'UDKBase.Default__UDKScriptedNavigationPoint:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'UDKBase.Default__UDKScriptedNavigationPoint:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'UDKBase.Default__UDKScriptedNavigationPoint:PathRenderer'
   End Object
   Components(4)=PathRenderer
   CollisionComponent=CollisionCylinder
   Name="Default__UTDefensePoint"
   ObjectArchetype=UDKScriptedNavigationPoint'UDKBase.Default__UDKScriptedNavigationPoint'
}

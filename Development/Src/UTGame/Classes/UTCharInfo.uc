/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 * This object is used as a store for all character profile information.
 */
class UTCharInfo extends Object
	config(CharInfo);

/** information about AI abilities/personality (generally map directly to UTBot properties) */
struct CustomAIData
{
	var float Tactics, StrafingAbility, Accuracy, Aggressiveness, CombatStyle, Jumpiness, ReactionTime;
	/** full path to class of bot's favorite weapon */
	var string FavoriteWeapon;

	structdefaultproperties
	{
		Aggressiveness=0.4
		CombatStyle=0.2
	}
};

/** Structure defining a pre-made character in the game. */
struct CharacterInfo
{
	/** Short unique string . */
	var string CharID;

	/** This defines which 'set' of parts we are drawing from. */
	var string FamilyID;

	/** Friendly name for character. */
	var localized string CharName;

	/** Localized description of the character. */
	var localized string Description;

	/** Preview image markup for the character. */
	var string PreviewImageMarkup;

	/** Faction to which this character belongs (e.g. IronGuard). */
	var string Faction;

	/** AI personality */
	var CustomAIData AIData;
};

/** Aray of all complete character profiles, defined in UTCustomChar.ini file. */
var() config array<CharacterInfo>		Characters;

/** Array of info for each family (eg IRNM) */
var() array< class<UTFamilyInfo> >		Families;

var() config float LOD1DisplayFactor;
var() config float LOD2DisplayFactor;
var() config float LOD3DisplayFactor;

/** Find the info class for a particular family */
static final function class<UTFamilyInfo> FindFamilyInfo(string InFamilyID)
{
	local int i;

	for( i=0; i<default.Families.Length; i++ )
	{
		if( (default.Families[i] != None) && (default.Families[i].default.FamilyID == InFamilyID) )
		{
			return default.Families[i];
		}
	}
	return None;
}

/** Return a random family from the list of all families */
static final function string GetRandomCharClassName()
{
	return "UTGame."$string(default.Families[Rand(default.Families.length - 1)].name);
}

defaultproperties
{
   Characters(0)=(CharID="A",FamilyID="LIAM",CharName="Matrix",Description="<Strings:UTGameUI.CharLocData.Matrix_Description>",PreviewImageMarkup="<Images:UI_Portrait.Character.UI_Portrait_Character_Liandri_Male_Head04>",Faction="Liandri",AIData=(Tactics=1.000000,StrafingAbility=1.000000,Accuracy=0.400000,Jumpiness=0.250000,FavoriteWeapon="UTGameContent.UTWeap_RocketLauncher_Content"))
   Characters(1)=(CharID="C",FamilyID="LIAM",CharName="Aspect",Description="<Strings:UTGameUI.CharLocData.Aspect_Description>",PreviewImageMarkup="<Images:UI_Portrait.Character.UI_Portrait_Character_Liandri_Male_Head02>",Faction="Liandri")
   Characters(2)=(CharID="B",FamilyID="LIAM",CharName="Cathode",Description="<Strings:UTGameUI.CharLocData.Cathode_Description>",PreviewImageMarkup="<Images:UI_Portrait.Character.UI_Portrait_Character_Liandri_Male_Head01>",Faction="Liandri")
   Characters(3)=(CharID="D",FamilyID="LIAM",CharName="Enigma",Description="<Strings:UTGameUI.CharLocData.Enigma_Description>",PreviewImageMarkup="<Images:UI_Portrait.Character.UI_Portrait_Character_Liandri_Male_Head03>",Faction="Liandri")
   Characters(4)=(CharID="F",FamilyID="LIAM",CharName="Collossus",Description="<Strings:UTGameUI.CharLocData.Collossus_Description>",PreviewImageMarkup="<Images:UI_Portrait.Character.UI_Portrait_Character_Liandri_Male_Head02>",Faction="Liandri")
   Characters(5)=(CharID="I",FamilyID="LIAM",CharName="Entropy",Description="<Strings:UTGameUI.CharLocData.Entropy_Description>",PreviewImageMarkup="<Images:UI_Portrait.Character.UI_Portrait_Character_Liandri_Male_Head01>",Faction="Liandri",AIData=(Aggressiveness=0.500000,FavoriteWeapon="UTGame.UTWeap_LinkGun"))
   Characters(6)=(CharID="H",FamilyID="LIAM",CharName="Monarch",Description="<Strings:UTGameUI.CharLocData.Monarch_Description>",PreviewImageMarkup="<Images:UI_Portrait.Character.UI_Portrait_Character_Liandri_Male_Head04>",Faction="Liandri")
   Characters(7)=(CharID="K",FamilyID="LIAM",CharName="OSC",Description="<Strings:UTGameUI.CharLocData.OSC_Description>",PreviewImageMarkup="<Images:UI_Portrait.Character.UI_Portrait_Character_Liandri_Male_Head03>",Faction="Liandri")
   Characters(8)=(CharID="J",FamilyID="LIAM",CharName="Evolution",Description="<Strings:UTGameUI.CharLocData.Evolution_Description>",PreviewImageMarkup="<Images:UI_Portrait.Character.UI_Portrait_Character_Liandri_Male_Head02>",Faction="Liandri")
   Characters(9)=(CharID="G",FamilyID="LIAM",CharName="Mihr",Description="<Strings:UTGameUI.CharLocData.Mihr_Description>",PreviewImageMarkup="<Images:UI_Portrait.Character.UI_Portrait_Character_Liandri_Male_Head03>",Faction="Liandri")
   Characters(10)=(CharID="E",FamilyID="LIAM",CharName="Raptor",Description="<Strings:UTGameUI.CharLocData.Raptor_Description>",PreviewImageMarkup="<Images:UI_Portrait.Character.UI_Portrait_Character_Liandri_Male_Head01>",Faction="Liandri",AIData=(Aggressiveness=0.700000,FavoriteWeapon="UTGameContent.UTWeap_Shockrifle"))
   Characters(11)=(CharID="L",FamilyID="LIAM",CharName="Syntax",Description="<Strings:UTGameUI.CharLocData.Syntax_Description>",PreviewImageMarkup="<Images:UI_Portrait.Character.UI_Portrait_Character_Liandri_Male_Head04>",Faction="Liandri")
   Characters(12)=(CharID="M",FamilyID="LIAM",CharName="Torque",Description="<Strings:UTGameUI.CharLocData.Torque_Description>",PreviewImageMarkup="<Images:UI_Portrait.Character.UI_Portrait_Character_Liandri_Male_Head04>",Faction="Liandri")
   LOD1DisplayFactor=0.400000
   LOD2DisplayFactor=0.200000
   LOD3DisplayFactor=0.075000
   Name="Default__UTCharInfo"
   ObjectArchetype=Object'Core.Default__Object'
}

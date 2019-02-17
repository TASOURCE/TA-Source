/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 * Structure defining information about a particular 'family' (eg. Ironguard Male)
 */

class UTFamilyInfo extends Object
	dependsOn(UTPawn)
	abstract
	native;

/**  @TODO - hookup character portraits   */
var Texture DefaultHeadPortrait;
var array<Texture> DefaultTeamHeadPortrait;

/** Matches the FamilyID in the CustomCharData */
var string FamilyID;

/** Faction that this family belongs to. */
var string Faction;

/************************************************************************/
/*  3P Character Info                                                   */
/************************************************************************/

/** Mesh reference for this character */
var SkeletalMesh CharacterMesh;

/** Material applied to the character head/body in team games */
var array<MaterialInterface> CharacterTeamBodyMaterials;
var array<MaterialInterface> CharacterTeamHeadMaterials;

/************************************************************************/
/*  1P Character Info                                                   */
/************************************************************************/

/** Package to load to find the arm mesh for this char. */
var string	ArmMeshPackageName;

/** Name of mesh within ArmMeshPackageName to use for arms. */
var SkeletalMesh	ArmMesh;

/** Package that contains team-skin materials for first-person arms. */
var		string					ArmSkinPackageName;
/** Name of red team material for first-person arms. */
var		MaterialInterface					RedArmMaterial;
/** Name of blue team material for first-person arms. */
var		MaterialInterface					BlueArmMaterial;

/** Name of 'neck stump' mesh to use if head is enclosed by helmet. */
var		string				NeckStumpName;
/** Extra offset to apply to mesh when rendering portrait for this family. */
var		vector				PortraitExtraOffset;

/** Physics Asset to use  */
var PhysicsAsset		PhysAsset;

/** Animation sets to use for a character in this 'family' */
var	array<AnimSet>		AnimSets;

/** Names for specific bones in the skeleton */
var name			LeftFootBone;
var name			RightFootBone;
var array<name>		TakeHitPhysicsFixedBones;

var class<UTPawnSoundGroup> SoundGroupClass;

var class<UTVoice>	VoiceClass;

var MaterialInstanceConstant	BaseMICParent;
var MaterialInstanceConstant	BioDeathMICParent;

/** This is the blood splatter effect to use on the walls when this pawn is shot @see LeaveABloodSplatterDecal **/
var MaterialInstance			BloodSplatterDecalMaterial;

/** When not in a team game, this is the color to use for glowy bits. */
var	LinearColor					NonTeamEmissiveColor;

/** When not in a team game, this is the color to tint character at a distance. */
var LinearColor					NonTeamTintColor;

/** Set of all emotes for this family. */
var array<EmoteInfo>	FamilyEmotes;

//// Gibs
var array<GibInfo> Gibs;

/** Head gib */
var GibInfo HeadGib;

// NOTE:  this can probably be moved to the DamageType.  As the damage type is probably not going to have different types of mesh per race (???)
/** This is the skeleton skel mesh that will replace the character's mesh for various death effects **/
var SkeletalMesh DeathMeshSkelMesh;
var PhysicsAsset DeathMeshPhysAsset;

/** This is the number of materials on the DeathSkeleton **/
var int DeathMeshNumMaterialsToSetResident;

/** Which joints we can break when applying damage **/
var array<Name> DeathMeshBreakableJoints;

/** These are the materials that the skeleton for this race uses (i.e. some of them have more than one material **/
var array<MaterialInstanceTimeVarying> SkeletonBurnOutMaterials;

/** The visual effect to play when a headshot gibs a head. */
var ParticleSystem HeadShotEffect;

/** Name of the HeadShotGoreSocket **/
var name HeadShotGoreSocketName;

/** 
 * This is attached to the HeadShotGoreSocket on the pawn if there exists one.  Some pawns do no need to have this as their mesh already
 * has gore pieces.  But some do not.
 **/
var StaticMesh HeadShotNeckGoreAttachment;

var class<UTEmit_HitEffect> BloodEmitterClass;
/** Hit impact effects.  Sprays when you get shot **/
var array<DistanceBasedParticleTemplate> BloodEffects;

/** When you are gibbed this is the particle effect to play **/
var ParticleSystem GibExplosionTemplate;

/** scale for meshes in this family when driving a vehicle */
var float DrivingDrawScale;

/** Whether these are female characters */
var bool bIsFemale;

/** Mesh scaling */
var float DefaultMeshScale;
var float BaseTranslationOffset;


/** Return the 1P arm skeletal mesh representation for the class */ 
function static SkeletalMesh GetFirstPersonArms()
{
	if (default.ArmMesh == None)
	{
		;
	}

	return default.ArmMesh;
}

/** Return the material used for the 1P arm skeletal mesh given a team */
function static MaterialInterface GetFirstPersonArmsMaterial(int TeamNum)
{
	local MaterialInterface ArmMaterial;

	if (TeamNum == 0 || TeamNum == 1)
	{
		if (TeamNum == 0)
		{
			ArmMaterial = default.RedArmMaterial;
		}
		else if (TeamNum == 1)
		{
			ArmMaterial = default.BlueArmMaterial;
		}

		if (ArmMaterial == None)
		{
			;
		}

		return ArmMaterial;
	}

   return GetFirstPersonArms().Materials[0];
}

/** Return the appropriate team materails for this character class given a team */
function static GetTeamMaterials(int TeamNum, out MaterialInterface TeamMaterialHead, out MaterialInterface TeamMaterialBody)
{
	TeamMaterialHead = (TeamNum < default.CharacterTeamHeadMaterials.length) ? default.CharacterTeamHeadMaterials[TeamNum] : default.CharacterMesh.Materials[0];
	TeamMaterialBody = (TeamNum < default.CharacterTeamBodyMaterials.length) ? default.CharacterTeamBodyMaterials[TeamNum] : default.CharacterMesh.Materials[1];
}

/** Return the texture portrait stored for this character */
function static Texture GetCharPortrait(int TeamNum)
{
	return (TeamNum < default.DefaultTeamHeadPortrait.length) ? default.DefaultTeamHeadPortrait[TeamNum] : default.DefaultHeadPortrait;
}

/**
 * Returns the # of emotes in a given group
 */
function static int GetEmoteGroupCnt(name Category)
{
	local int i,cnt;
	for (i=0;i<default.FamilyEmotes.length;i++)
	{
		if (default.FamilyEmotes[i].CategoryName == Category )
		{
			cnt++;
		}
	}

	return cnt;
}

static function class<UTVoice> GetVoiceClass()
{
	return Default.VoiceClass;
}

/**
 * returns all the Emotes in a group
 */
function static GetEmotes(name Category, out array<string> Captions, out array<name> EmoteTags)
{
	local int i;
	local int cnt;
	for (i=0;i<default.FamilyEmotes.length;i++)
	{
		if (default.FamilyEmotes[i].CategoryName == Category )
		{
			Captions[cnt] = default.FamilyEmotes[i].EmoteName;
			EmoteTags[cnt] = default.FamilyEmotes[i].EmoteTag;
			cnt++;
		}
	}
}

/**
 * Finds the index of the emote given a tag
 */
function static int GetEmoteIndex(name EmoteTag)
{
	local int i;
	for (i=0;i<default.FamilyEmotes.length;i++)
	{
		if ( default.FamilyEmotes[i].EmoteTag == EmoteTag )
		{
			return i;
		}
	}
	return -1;
}

defaultproperties
{
   LeftFootBone="b_LeftAnkle"
   RightFootBone="b_RightAnkle"
   TakeHitPhysicsFixedBones(0)="b_LeftAnkle"
   TakeHitPhysicsFixedBones(1)="b_RightAnkle"
   SoundGroupClass=Class'UTGame.UTPawnSoundGroup'
   NonTeamEmissiveColor=(R=10.000000,G=0.200000,B=0.200000,A=1.000000)
   NonTeamTintColor=(R=4.000000,G=2.000000,B=0.500000,A=1.000000)
   FamilyEmotes(0)=(CategoryName="TAUNT",EmoteTag="TauntA",EmoteName="Bring It On",EmoteAnim="Taunt_FB_BringItOn")
   FamilyEmotes(1)=(CategoryName="TAUNT",EmoteTag="TauntB",EmoteName="Hoolahoop",EmoteAnim="Taunt_FB_Hoolahoop")
   FamilyEmotes(2)=(CategoryName="TAUNT",EmoteTag="TauntC",EmoteName="Hip Thrust",EmoteAnim="Taunt_FB_Pelvic_Thrust_A")
   FamilyEmotes(3)=(CategoryName="TAUNT",EmoteTag="TauntD",EmoteName="Bullet To Head",EmoteAnim="Taunt_UB_BulletToTheHead",bTopHalfEmote=True)
   FamilyEmotes(4)=(CategoryName="TAUNT",EmoteTag="TauntE",EmoteName="Come Here",EmoteAnim="Taunt_UB_ComeHere",bTopHalfEmote=True)
   FamilyEmotes(5)=(CategoryName="TAUNT",EmoteTag="TauntF",EmoteName="Throat Slit",EmoteAnim="Taunt_UB_Slit_Throat",bTopHalfEmote=True)
   FamilyEmotes(6)=(CategoryName="Order",EmoteTag="OrderA",EmoteName="Attack",EmoteAnim="Taunt_UB_Flag_Pickup",bTopHalfEmote=True,Command="ATTACK",bRequiresPlayer=True)
   FamilyEmotes(7)=(CategoryName="Order",EmoteTag="OrderB",EmoteName="Defend",EmoteAnim="Taunt_UB_Flag_Pickup",bTopHalfEmote=True,Command="Defend",bRequiresPlayer=True)
   FamilyEmotes(8)=(CategoryName="Order",EmoteTag="OrderC",EmoteName="Hold This Position",EmoteAnim="Taunt_UB_Flag_Pickup",bTopHalfEmote=True,Command="Hold",bRequiresPlayer=True)
   FamilyEmotes(9)=(CategoryName="Order",EmoteTag="OrderD",EmoteName="Cover Me",EmoteAnim="Taunt_UB_Flag_Pickup",bTopHalfEmote=True,Command="Follow",bRequiresPlayer=True)
   FamilyEmotes(10)=(CategoryName="Order",EmoteTag="OrderE",EmoteName="Freelance",EmoteAnim="Taunt_UB_Flag_Pickup",bTopHalfEmote=True,Command="Freelance",bRequiresPlayer=True)
   FamilyEmotes(11)=(CategoryName="Order",EmoteTag="OrderF",EmoteName="Drop Flag",EmoteAnim="Taunt_UB_Flag_Pickup",bTopHalfEmote=True,Command="DropFlag")
   FamilyEmotes(12)=(CategoryName="Status",EmoteTag="ENCOURAGEMENT",EmoteAnim="Taunt_UB_Flag_Pickup",bTopHalfEmote=True)
   FamilyEmotes(13)=(CategoryName="Status",EmoteTag="ACK",EmoteAnim="Taunt_UB_Flag_Pickup",bTopHalfEmote=True)
   FamilyEmotes(14)=(CategoryName="Status",EmoteTag="InPosition",EmoteAnim="Taunt_UB_Flag_Pickup",bTopHalfEmote=True)
   FamilyEmotes(15)=(CategoryName="Status",EmoteTag="UnderAttack",EmoteAnim="Taunt_UB_Flag_Pickup",bTopHalfEmote=True)
   FamilyEmotes(16)=(CategoryName="Status",EmoteTag="AreaSecure",EmoteAnim="Taunt_UB_Flag_Pickup",bTopHalfEmote=True)
   FamilyEmotes(17)=(CategoryName="Inventory",EmoteTag="UseArmor",EmoteName="Human Male",EmoteAnim="Taunt_FB_BringItOn",bTopHalfEmote=True)
   FamilyEmotes(18)=(CategoryName="Inventory",EmoteTag="UseHealth",EmoteName="Human Female",EmoteAnim="Taunt_UB_Flag_Pickup",bTopHalfEmote=True)
   FamilyEmotes(19)=(EmoteName="Necris Male")
   FamilyEmotes(20)=(EmoteName="Necris Female")
   FamilyEmotes(21)=(EmoteName="Krall")
   FamilyEmotes(22)=(EmoteName="Corrupt")
   FamilyEmotes(23)=(EmoteName="RAT Team")
   FamilyEmotes(24)=(EmoteName="Skaarj")
   HeadShotGoreSocketName="HeadShotGoreSocket"
   BloodEmitterClass=Class'UTGame.UTEmit_BloodSpray'
   DrivingDrawScale=1.000000
   DefaultMeshScale=1.075000
   BaseTranslationOffset=7.000000
   Name="Default__UTFamilyInfo"
   ObjectArchetype=Object'Core.Default__Object'
}

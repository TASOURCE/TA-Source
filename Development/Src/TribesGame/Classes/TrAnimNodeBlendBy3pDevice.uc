/**
 * TrAnimNodeBlendBy3pDevice.uc
 */

class TrAnimNodeBlendBy3pDevice extends TrAnimNodeBlendList
		native;

/** TrPawn owner */
var		transient   TrPawn	                m_TrPawn;

/** Name of TrSkelCon_SpinControl that controls buildup/fire */
var(Recoil)         array<name>             m_nmRecoilControlNames;

/** GameSkelCtrl_Recoil that recoiling */
var              array<GameSkelCtrl_Recoil> m_RecoilControls;

/** If TRUE, will scale the fire animations by the refire time configured by the device. */
var()               bool                    m_bScaleFireByRefireTime;

/** Plays a fire preview with recoil controls. */
var(Preview)        bool                    m_bFirePreview;
var(Preview)        float                   m_fRefireTimePreview;

/** Scale putaway/retrieve anims? */
var                 bool                    m_bScalePutawayRetrieveAnims;

var transient bool m_bCurrentDeviceSupportsAltSkiFireAnims;
var transient bool m_bCurrentDeviceSupportsAltSkiReloadAnims;

/** If an animation is specified here, this will play when the player is skiing. */
var(AlternateAnims) name                    m_SkiingFireName;

/** Stores the "real" fire animation name in case it has been overrided by a specialty fire anim. */
var transient       name                    m_StandardFireAnimName;


/** If an animation is specified here, this will play when the player is skiing. */
var(AlternateAnims) name                    m_SkiingReloadName;

/** Stores the "real" reload animation name in case it has been overrided by a specialty reload anim. */
var transient       name                    m_StandardReloadAnimName;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

native function PlayIdle();
native function PlayBuildup();
native function PlayFire(float RefireTime);
native function PlayPutaway(float PutAwayTime, float ForcedRateBuff);
native function PlayRetrieve(float RetrieveTime, float ForcedRateBuff);
native function PlayReload(float ReloadTime);
native function PlayOffhand(name OffhandAnimName);

defaultproperties
{
   m_bScaleFireByRefireTime=True
   m_fRefireTimePreview=0.400000
   bPlayActiveChild=True
   Children(0)=(Name="Idle")
   Children(1)=(Name="Buildup")
   Children(2)=(Name="Fire")
   Children(3)=(Name="Putaway")
   Children(4)=(Name="Retrieve")
   Children(5)=(Name="reload")
   Children(6)=(Name="OffHand")
   NodeName="3pDeviceBlendNode"
   Name="Default__TrAnimNodeBlendBy3pDevice"
   ObjectArchetype=TrAnimNodeBlendList'TribesGame.Default__TrAnimNodeBlendList'
}

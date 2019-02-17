/**
 * TrAnimNodeBlendByDeviceAnim.uc
 */

class TrAnimNodeBlendByDeviceAnim extends TrAnimNodeBlendList
		native;

/** TrPawn owner */
var		transient   TrPawn	                m_TrPawn;

/** Device 'owner' */
var     transient   TrDevice                m_Device;

/** Name of TrSkelCon_SpinControl that controls buildup/fire */
var(SpinControl)    name                    m_nmBuildupFireSpinControlName;

/** TrSkelCon_SpinControl that controls buildup/fire */
var             TrSkelControl_SpinControl   m_BuildupFireSpinControl;

/** Name of TrSkelCon_SpinControl that controls buildup/fire */
var(Recoil)         array<name>             m_nmRecoilControlNames;

/** GameSkelCtrl_Recoil that recoiling */
var              array<GameSkelCtrl_Recoil> m_RecoilControls;
var              array<GameSkelCtrl_Recoil> m_TinyWeaponsRecoilControls;

/** If TRUE, will not play the buildup anim when the buildup child is blended to (despite bPlayActiveChild). */
var()               bool                    m_bPlayBuildUp;

/** If TRUE, will not play the fire anim when the fire child is blended to (despite bPlayActiveChild). */
var()               bool                    m_bPlayFire;

/** If TRUE, will scale the fire animations by the refire time configured by the device. */
var()               bool                    m_bScaleFireByRefireTime;

/** If an animation is specified here, this will play when the fire is a final round in a clip. */
var(AlternateAnims) name                    m_FireFinalRoundAnimName;

/** If an animation is specified here, this will play when the fire is dry fire. */
var(AlternateAnims) name                    m_DryFireAnimName;

/** Stores the "real" fire animation name in case it has been overrided by a specialty fire anim. */
var transient       name                    m_StandardFireAnimName;

/** If an animation is specified here, this will play when the reload is called on a partially used clip. */
var(AlternateAnims) name                    m_ReloadPartialClipAnimName;

/** Stores the "real" reload animation name in case it has been overrided by a specialty reload anim. */
var transient       name                    m_StandardReloadAnimName;

/** Name of secondary device blend node, used if dual wielding. */
var(DualWield)      name                    m_SecondaryDeviceBlendNodeName;

/** Secondary device blend node, used if dual wielding. */
var         TrAnimNodeBlendByDeviceAnim     m_SecondaryDeviceBlendNode;

/** Corresponds to the socket index applied in configuration for the device. Typically 0=Right, 1=Left. */
var(DualWield)      int                     m_nSocketIndex;

/** Scale putaway/retrieve anims? */
var                 bool                    m_bScalePutawayRetrieveAnims;

struct native DeviceNodeCameraAnimation
{
	var() int                       ChildIndex;        
    var() CameraAnim                CameraAnim;
    var transient CameraAnimInst    CameraAnimInstance;
    var() float                     Rate;
    var() float                     Scale;
    var() float                     BlendInTime;
    var() float                     BlendOutTime;
    var() bool                      bLoop;
    var() bool                      bRandomStartTime;

    structdefaultproperties
    {
        Rate=1.0
        Scale=1.0
        BlendInTime=0.2
        BlendOutTime=0.2
    }
};

/** List of camera animations used when children are blended to. */
var(Camera) array<DeviceNodeCameraAnimation> m_CameraAnimations;

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
//Animnode interface.
native function StopAnim();
native function SetActiveChild( INT ChildIndex, FLOAT BlendTime );

native function PlayIdle();
native function PlayAltIdle();
native function PlayBuildup(float BuildupTime);
native function PlayFire(int SocketIndex, float RefireTime, int RoundsRemainingInClip);
native function PlayPutaway(float PutAwayTime, float ForcedRateBuff);
native function PlayRetrieve(float RetrieveTime, float ForcedRateBuff);
native function PlayReload(float ReloadTime, int RoundsRemainingInClip);
native function PlayOffhand(float Rate);
native function OnStopFire();
native function PlayDryFire();
native function PlayQuickRetrieve();

defaultproperties
{
   m_bPlayBuildUp=True
   m_bPlayFire=True
   m_bScaleFireByRefireTime=True
   bPlayActiveChild=True
   Children(0)=(Name="Idle")
   Children(1)=(Name="Buildup")
   Children(2)=(Name="Fire")
   Children(3)=(Name="Putaway")
   Children(4)=(Name="Retrieve")
   Children(5)=(Name="reload")
   Children(6)=(Name="QuickRetrieve")
   Children(7)=(Name="AltIdle")
   NodeName="DeviceBlendNode"
   Name="Default__TrAnimNodeBlendByDeviceAnim"
   ObjectArchetype=TrAnimNodeBlendList'TribesGame.Default__TrAnimNodeBlendList'
}

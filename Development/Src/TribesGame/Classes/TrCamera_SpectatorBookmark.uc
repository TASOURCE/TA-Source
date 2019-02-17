class TrCamera_SpectatorBookmark extends CameraActor
	ClassGroup(Common)
	placeable;

/** 
 *  Instructions:
 *  -Add a localized string variable
 *  -Add a corresponding entry in the ESpectatorBookmark enum
 *  -Add a case to GetDescription().
 *  -Define the string in the .int file.
 */

/** General CTF */
var localized string BEBase;
var localized string DSBase;
var localized string CTFBEGeneratorRoom;
var localized string CTFDSGeneratorRoom;
var localized string CTFMapOverhead;
var localized string CTFBEMidfield;
var localized string CTFDSMidfield;
var localized string CTFBEVehiclePad;
var localized string CTFDSVehiclePad;
var localized string CTFBESpawn;
var localized string CTFDSSpawn;
var localized string CTFBESensor;
var localized string CTFDSSensor;
var localized string CTFBETurretA;
var localized string CTFBETurretB;
var localized string CTFBETurretC;
var localized string CTFDSTurretA;
var localized string CTFDSTurretB;
var localized string CTFDSTurretC;
var localized string CTFBEBackRoute;
var localized string CTFDSBackRoute;

/** General TDM */
var localized string TDMEast;
var localized string TDMWest;
var localized string TDMNorth;
var localized string TDMSouth;
var localized string TDMCenter;
var localized string TDMMapOverhead;

/** DRYDOCK_CTF */
var localized string DdDryHigh;
var localized string DdDryLow;
var localized string DdBEWide;
var localized string DdDSWide;
var localized string DdDockHigh;
var localized string DdDockLow;
var localized string DdBEBunker;
var localized string DdDSBunker;
var localized string DdBEBackEntrance;
var localized string DdDSBackEntrance;

/** DRYDOCK_TDM */
var localized string DNFish;

/** CROSSFIRE_CTF */
var localized string XFBSW;
var localized string XFRSW;
var localized string XFBERed;
var localized string XFDSRed;
var localized string XFBEBlue;
var localized string XFDSBlue;
var localized string XFBEBackstop;
var localized string XFDSBackstop;
var localized string XFBECRoom;
var localized string XFDSCRoom;

/** Katabatic_TDM */
var localized string NKTower;
var localized string NKTunnel;
var localized string NKWhalebones;
var localized string NKMountainView;
var localized string NKMountainSide;

/** BellaOmega_TDM */
var localized string BTBase;
var localized string BTBaseInterior;
var localized string BTTunnelEast;
var localized string BTTunnelWest;

/** Generic */
var localized string GenericCamera;

/** These are the entries you'll see in the dropdown menu in the editor. */
enum ESpectatorBookmark
{
	Bookmark_BEBase,
	Bookmark_DSBase,
	Bookmark_CTFBEGeneratorRoom,
	Bookmark_CTFDSGeneratorRoom,
	Bookmark_CTFBEMidfield,
	Bookmark_CTFDSMidfield,
	Bookmark_CTFMapOverhead,
	Bookmark_CTFBEVehiclePad,
	Bookmark_CTFDSVehiclePad,
	Bookmark_CTFBESpawn,
	Bookmark_CTFDSSpawn,
	Bookmark_CTFBESensor,
	Bookmark_CTFDSSensor,
	Bookmark_CTFBETurretA,
	Bookmark_CTFBETurretB,
	Bookmark_CTFBETurretC,
	Bookmark_CTFDSTurretA,
	Bookmark_CTFDSTurretB,
	Bookmark_CTFDSTurretC,
	Bookmark_CTFBEBackRoute,
	Bookmark_CTFDSBackRoute,
	// General TDM
	Bookmark_TDMEast,
	Bookmark_TDMWest,
	Bookmark_TDMNorth,
	Bookmark_TDMSouth,
	Bookmark_TDMCenter,
	Bookmark_TDMMapOverhead,	
	// Drydock_CTF
	Bookmark_DdDryHigh,
	Bookmark_DdDryLow,
	Bookmark_DdBEWide,
	Bookmark_DdDSWide,
	Bookmark_DdDockHigh,
	Bookmark_DdDockLow,
	Bookmark_DdBEBunker,
	Bookmark_DdDSBunker,
	Bookmark_DdBEBackEntrance,
	Bookmark_DdDSBackEntrance,
	// Drydock_TDM
	Bookmark_DNFish,
	// Crossfire_CTF
	Bookmark_XFBSW,
	Bookmark_XFRSW,
	Bookmark_XFBERed,
	Bookmark_XFDSRed,
	Bookmark_XFBEBlue,
	Bookmark_XFDSBlue,
	Bookmark_XFBEBackstop,
	Bookmark_XFDSBackstop,
	Bookmark_XFBECRoom,
	Bookmark_XFDSCRoom,
	// Katabatic_TDM
	Bookmark_NKTower,
	Bookmark_NKTunnel,
	Bookmark_NKWhalebones,
	Bookmark_NKMountainView,
	Bookmark_NKMountainSide,
	// BellaOmega_TDM
	Bookmark_BTBase,
	Bookmark_BTBaseInterior,
	Bookmark_BTTunnelEast,
	Bookmark_BTTunnelWest,
	// Generic
	Bookmark_GenericCamera,
};

var() ESpectatorBookmark m_BookmarkDescription;

/** Returns a description for this camera based on m_BookmarkDescription. */
function string GetDescription()
{
	switch( m_BookmarkDescription )
	{
		case Bookmark_BEBase: return BEBase;
		case Bookmark_DSBase: return DSBase;
		case Bookmark_CTFBEGeneratorRoom: return CTFBEGeneratorRoom;
		case Bookmark_CTFDSGeneratorRoom: return CTFDSGeneratorRoom;
		case Bookmark_CTFBEMidfield: return CTFBEMidfield;
		case Bookmark_CTFDSMidfield: return CTFDSMidfield;
		case Bookmark_CTFMapOverhead: return CTFMapOverhead;
		case Bookmark_CTFBEVehiclePad: return CTFBEVehiclePad;
		case Bookmark_CTFDSVehiclePad: return CTFDSVehiclePad;
		case Bookmark_CTFBESpawn: return CTFBESpawn;
		case Bookmark_CTFDSSpawn: return CTFDSSpawn;
		case Bookmark_CTFBESensor: return CTFBESensor;
		case Bookmark_CTFDSSensor: return CTFDSSensor;
		case Bookmark_CTFBETurretA: return CTFBETurretA;
		case Bookmark_CTFBETurretB: return CTFBETurretB;
		case Bookmark_CTFBETurretC: return CTFBETurretC;
		case Bookmark_CTFDSTurretA: return CTFDSTurretA;
		case Bookmark_CTFDSTurretB: return CTFDSTurretB;
		case Bookmark_CTFDSTurretC: return CTFDSTurretC;
		case Bookmark_CTFBEBackRoute: return CTFBEBackRoute;
		case Bookmark_CTFDSBackRoute: return CTFDSBackRoute;
		case Bookmark_TDMEast: return TDMEast;
		case Bookmark_TDMWest: return TDMWest;
		case Bookmark_TDMNorth: return TDMNorth;
		case Bookmark_TDMSouth: return TDMSouth;
		case Bookmark_TDMCenter: return TDMCenter;
		case Bookmark_TDMMapOverhead: return TDMMapOverhead;
		case Bookmark_DdDryHigh: return DdDryHigh;
		case Bookmark_DdDryLow: return DdDryLow;
		case Bookmark_DdBEWide: return DdBEWide;
		case Bookmark_DdDSWide: return DdDSWide;
		case Bookmark_DdDockHigh: return DdDockHigh;
		case Bookmark_DdDockLow: return DdDockLow;
		case Bookmark_DdBEBunker: return DdBEBunker;
		case Bookmark_DdDSBunker: return DdDSBunker;
		case Bookmark_DdBEBackEntrance: return DdBEBackEntrance;
		case Bookmark_DdDSBackEntrance: return DdDSBackEntrance;
		case Bookmark_DNFish: return DNFish;
		case Bookmark_XFBSW: return XFBSW;
		case Bookmark_XFRSW: return XFRSW;
		case Bookmark_XFBERed: return XFBERed;
		case Bookmark_XFDSRed: return XFDSRed;
		case Bookmark_XFBEBlue: return XFBEBlue;
		case Bookmark_XFDSBlue: return XFDSBlue;
		case Bookmark_XFBEBackstop: return XFBEBackstop;
		case Bookmark_XFDSBackstop: return XFDSBackstop;
		case Bookmark_XFBECRoom: return XFBECRoom;
		case Bookmark_XFDSCRoom: return XFDSCRoom;
		case Bookmark_NKTower: return NKTower;
		case Bookmark_NKTunnel: return NKTunnel;
		case Bookmark_NKWhalebones: return NKWhalebones;
		case Bookmark_NKMountainView: return NKMountainView;
		case Bookmark_NKMountainSide: return NKMountainSide;
		case Bookmark_BTBase: return BTBase;
		case Bookmark_BTBaseInterior: return BTBaseInterior;
		case Bookmark_BTTunnelEast: return BTTunnelEast;
		case Bookmark_BTTunnelWest: return BTTunnelWest;
		case Bookmark_GenericCamera: return GenericCamera;
	}
	return "";
}

simulated function string GetSpectatorName(){ return GetDescription(); }

defaultproperties
{
   BEBase="Blood Eagle Base"
   DSBase="Diamond Sword Base"
   CTFBEGeneratorRoom="Blood Eagle Generator Room"
   CTFDSGeneratorRoom="Diamond Sword Generator Room"
   CTFMapOverhead="Overhead View"
   CTFBEMidfield="Blood Eagle Midfield"
   CTFDSMidfield="Diamond Sword Midfield"
   CTFBEVehiclePad="Blood Eagle Vehicle Pad"
   CTFDSVehiclePad="Diamond Sword Vehicle Pad"
   CTFBESpawn="Blood Eagle Spawn"
   CTFDSSpawn="Diamond Sword Spawn"
   CTFBESensor="Blood Eagle Sensor"
   CTFDSSensor="Diamond Sword Sensor"
   CTFBETurretA="Blood Eagle Turret A"
   CTFBETurretB="Blood Eagle Turret B"
   CTFBETurretC="Blood Eagle Turret C"
   CTFDSTurretA="Diamond Sword Turret A"
   CTFDSTurretB="Diamond Sword Turret B"
   CTFDSTurretC="Diamond Sword Turret C"
   CTFBEBackRoute="Blood Eagle Back Route"
   CTFDSBackRoute="Diamond Sword Back Route"
   TDMEast="East"
   TDMWest="West"
   TDMNorth="North"
   TDMSouth="South"
   TDMCenter="Center"
   TDMMapOverhead="Overhead View"
   DdDryHigh="Dock Side High"
   DdDryLow="Dock Side Low"
   DdBEWide="Blood Eagle Wide"
   DdDSWide="Diamond Sword Wide"
   DdDockHigh="Dock Side High"
   DdDockLow="Dock Side Low"
   DdBEBunker="Blood Eagle Bunker"
   DdDSBunker="Diamond Sword Bunker"
   DdBEBackEntrance="Blood Eagle Back Entrance"
   DdDSBackEntrance="Diamond Sword Back Entrance"
   DNFish="Fish Cam"
   XFBSW="Blue Side Wide"
   XFRSW="Red Side Wide"
   XFBERed="Blood Eagle Red Side Route"
   XFDSRed="Diamond Sword Red Side Route"
   XFBEBlue="Blood Eagle Blue Side Route"
   XFDSBlue="Diamond Sword Blue Side Route"
   XFBEBackstop="Blood Eagle Backstop"
   XFDSBackstop="Diamond Sword Backstop"
   XFBECRoom="Blood Eagle Conduit Room"
   XFDSCRoom="Diamond Sword Conduit Room"
   NKTower="Central Tower"
   NKTunnel="Ice Tunnel"
   NKWhalebones="Infield - Whalebones"
   NKMountainView="Outfield - Mountain View"
   NKMountainSide="Outfield - Mountain Side"
   BTBase="Base Rooftop"
   BTBaseInterior="Base Interior"
   BTTunnelEast="East Tunnel"
   BTTunnelWest="West Tunnel"
   GenericCamera="Spectator Camera"
   bConstrainAspectRatio=False
   Begin Object Class=DrawFrustumComponent Name=DrawFrust0 Archetype=DrawFrustumComponent'Engine.Default__CameraActor:DrawFrust0'
      ReplacementPrimitive=None
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="DrawFrust0"
      ObjectArchetype=DrawFrustumComponent'Engine.Default__CameraActor:DrawFrust0'
   End Object
   DrawFrustum=DrawFrust0
   Begin Object Class=StaticMeshComponent Name=CamMesh0 Archetype=StaticMeshComponent'Engine.Default__CameraActor:CamMesh0'
      ReplacementPrimitive=None
      HiddenGame=True
      CastShadow=False
      CollideActors=False
      BlockRigidBody=False
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="CamMesh0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__CameraActor:CamMesh0'
   End Object
   MeshComp=CamMesh0
   Components(0)=CamMesh0
   Components(1)=DrawFrust0
   Name="Default__TrCamera_SpectatorBookmark"
   ObjectArchetype=CameraActor'Engine.Default__CameraActor'
}

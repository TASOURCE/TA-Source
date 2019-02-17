class TrSkin extends Object
    abstract;

var int ItemId;
var localized string ItemName;
var localized string InfoPanelDescription;

/** The depth this skin uses for translucency sorting. */
var int TranslucencySortPriority;

struct SkinStruct
{
    var int            SkinId;
    var string         SkinContentPath1p;
    var string         SkinContentPath3p;
    var ParticleSystem SkiThrustTemplate;
    var ParticleSystem JetpackRibbonTemplate;
    var ParticleSystem JetpackThrustTemplate;
    var array<name>    JetpackThrustEffectSockets;
};

struct VehicleSkinStruct
{
	var class<TrVehicle> VehicleClass;
	var AnimSet SeatAnimSet;
};

var class<TrDevice>          SkinMeleeDevice;
var array<SkinStruct>        Skins;
var array<VehicleSkinStruct> VehicleSkins;

defaultproperties
{
   ItemName="DEFAULT"
   Name="Default__TrSkin"
   ObjectArchetype=Object'Core.Default__Object'
}

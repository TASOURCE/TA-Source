class TgStructures extends Object
    native;
    
enum CMTargetType
{
    CMTT_Pawn,
    CMTT_Deployable,
};

// Combat message info ids
struct native CombatMessageInfo
{
    var int          nMsgId;
    var int          nSourceId;
    var CMTargetType eSourceType;
    var int          nSourceOwnerId;
    var int          nTargetId;
    var CMTargetType eTargetType;
    var int          nAmount1;
    var int          nAmount2;  
    var int          nSourceItemId;  
};

defaultproperties
{
   Name="Default__TgStructures"
   ObjectArchetype=Object'Core.Default__Object'
}

class TrSensorMessage extends UTLocalMessage;

var localized string MotionSensorDetectedEnemy;
var SoundCue MotionSensorAlarmSound;

static function string GetString(
	optional int Switch,
	optional bool bPRI1HUD,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	switch (Switch)
	{
		case 0:
			return Default.MotionSensorDetectedEnemy;
			break;
	}
	return "";
}

static simulated function ClientReceive(
	PlayerController P,
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	local SoundCue sound;

	switch (Switch)
	{
		case 0: 
		case 1:
			sound = Default.MotionSensorAlarmSound;
			break;
	}

	if (sound!=None)
		P.PlaySound(sound, true);

	Super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
}

defaultproperties
{
   MotionSensorDetectedEnemy="Motion sensor detected hostile"
   MessageArea=2
   Name="Default__TrSensorMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}

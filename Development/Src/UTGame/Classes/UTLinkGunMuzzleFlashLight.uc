/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */


class UTLinkGunMuzzleFlashLight extends UDKExplosionLight;

var array<LightValues> RedTeamTimeShift, BlueTeamTimeShift;

function SetTeam(byte NewTeam)
{
	switch (NewTeam)
	{
		case 0:
			TimeShift = RedTeamTimeShift;
			break;
		case 1:
			TimeShift = BlueTeamTimeShift;
			break;
		default:
			TimeShift = default.TimeShift;
			break;
	}
}

defaultproperties
{
   RedTeamTimeShift(0)=(Radius=96.000000,Brightness=5.000000,LightColor=(B=192,G=192,R=255,A=255))
   RedTeamTimeShift(1)=(StartTime=0.100000,Radius=64.000000,Brightness=5.000000,LightColor=(B=0,G=0,R=128,A=255))
   RedTeamTimeShift(2)=(StartTime=0.150000,Radius=64.000000,LightColor=(B=0,G=0,R=64,A=255))
   BlueTeamTimeShift(0)=(Radius=96.000000,Brightness=5.000000,LightColor=(B=255,G=192,R=192,A=255))
   BlueTeamTimeShift(1)=(StartTime=0.100000,Radius=64.000000,Brightness=5.000000,LightColor=(B=128,G=0,R=0,A=255))
   BlueTeamTimeShift(2)=(StartTime=0.150000,Radius=64.000000,LightColor=(B=64,G=0,R=0,A=255))
   HighDetailFrameTime=0.020000
   TimeShift(0)=(Radius=96.000000,Brightness=5.000000,LightColor=(B=232,G=255,R=184,A=255))
   TimeShift(1)=(StartTime=0.100000,Radius=64.000000,Brightness=5.000000,LightColor=(B=0,G=128,R=0,A=255))
   TimeShift(2)=(StartTime=0.150000,Radius=64.000000,LightColor=(B=0,G=64,R=0,A=255))
   Radius=96.000000
   Name="Default__UTLinkGunMuzzleFlashLight"
   ObjectArchetype=UDKExplosionLight'UDKBase.Default__UDKExplosionLight'
}

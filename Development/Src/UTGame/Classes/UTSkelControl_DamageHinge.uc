/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UTSkelControl_DamageHinge extends UDKSkelControl_DamageHinge;

/**
 * This event is triggered when the spring has decided to break.
 *
 * Network - Called everywhere except on a dedicated server.
 */
simulated event BreakApart(vector PartLocation, bool bIsVisible)
{
	local UTGib Gib;

	if( !bOnDamageActive
		|| ( BreakMesh == none )
		|| ( OwnerVehicle == none )
		|| bIsBroken
		)
	{
		// if this was called these flags should be set even if there is no visual effects
		bIsBreaking = FALSE;
		bIsBroken = TRUE;
		return;
	}

	if ( bIsVisible && (OwnerVehicle.WorldInfo.NetMode != NM_DedicatedServer) )
	{
		Gib = UTVehicle(OwnerVehicle).SpawnGibVehicle(PartLocation, OwnerVehicle.Rotation, BreakMesh, PartLocation, true, DefaultBreakDir, PS_DamageOnBreak, PS_DamageTrail);

		if( Gib != none )
		{
			Gib.SetDrawScale3D( DamageScale );
		}
	}

	BoneScale = DamageBoneScale;
	bIsBreaking = FALSE;
	bIsBroken = TRUE;
}

simulated event BreakApartOnDeath(vector PartLocation, bool bIsVisible)
{
	local UTGib Gib;

	if ( !bOnDeathActive )
	{
		return;
	}
	if ( DeathStaticMesh == None )
	{
		DeathStaticMesh = BreakMesh;
	}
	if( ( DeathStaticMesh == none )
		// if we are not within the percentage to spawn
		|| ( DeathPercentToActuallySpawn < FRand() )
		|| ( OwnerVehicle == none )
		|| bIsBroken )
	{
		// if this was called these flags should be set even if there is no visual effects
		bIsBroken = TRUE;
		return;
	}

	if( bIsVisible && (OwnerVehicle.WorldInfo.NetMode != NM_DedicatedServer) )
	{
		Gib = UTVehicle(OwnerVehicle).SpawnGibVehicle(PartLocation, OwnerVehicle.Rotation, DeathStaticMesh, PartLocation, true, DeathImpulseDir, None, PS_DeathTrail);

		if( Gib != none )
		{
			Gib.SetDrawScale3D( DeathScale );
		}
	}

	BoneScale = DeathBoneScale;
	bIsBroken = TRUE;
}

defaultproperties
{
   Name="Default__UTSkelControl_DamageHinge"
   ObjectArchetype=UDKSkelControl_DamageHinge'UDKBase.Default__UDKSkelControl_DamageHinge'
}

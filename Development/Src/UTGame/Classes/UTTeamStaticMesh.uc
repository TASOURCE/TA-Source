/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */


class UTTeamStaticMesh extends StaticMeshActor;

/** material used when owned by a team */
var() array<MaterialInterface> TeamMaterials;
/** material used when not owned by a team or when the TeamMaterials array doesn't contain an entry for the requested team */
var() Material NeutralMaterial;

simulated event PreBeginPlay()
{
	local UTGameObjective O, Best;
	local float Distance, BestDistance;

	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		BestDistance = 1000000.f;
		foreach WorldInfo.AllNavigationPoints(class'UTGameObjective', O)
		{
			Distance = VSize(Location - O.Location);
			if (Distance < BestDistance)
			{
				BestDistance = Distance;
				Best = O;
			}
		}

		if (Best != None)
		{
			Best.AddTeamStaticMesh(self);
		}
		else
		{
			SetTeamNum(255);
		}
	}
}

simulated function SetTeamNum(byte NewTeam)
{
	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		if (NewTeam < TeamMaterials.length)
		{
			if (TeamMaterials[NewTeam] != None)
			{
				StaticMeshComponent.SetMaterial(0, TeamMaterials[NewTeam]);
			}
		}
		else
		{
			if (NeutralMaterial != None)
			{
				StaticMeshComponent.SetMaterial(0, NeutralMaterial);
			}
		}
	}
}

defaultproperties
{
   TeamMaterials(0)=None
   TeamMaterials(1)=None
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0 Archetype=StaticMeshComponent'Engine.Default__StaticMeshActor:StaticMeshComponent0'
      ReplacementPrimitive=None
      bAllowApproximateOcclusion=True
      bForceDirectLightMap=True
      bUsePrecomputedShadows=True
      Name="StaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshActor:StaticMeshComponent0'
   End Object
   StaticMeshComponent=StaticMeshComponent0
   Components(0)=StaticMeshComponent0
   bStatic=False
   bTickIsDisabled=True
   CollisionComponent=StaticMeshComponent0
   Name="Default__UTTeamStaticMesh"
   ObjectArchetype=StaticMeshActor'Engine.Default__StaticMeshActor'
}

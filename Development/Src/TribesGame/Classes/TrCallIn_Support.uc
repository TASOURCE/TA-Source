class TrCallIn_Support extends TrCallIn;

/** The game objective to playce in the delivery pod */
var class<TrGameObjective> ItemInDeliveryPod;

/** The maximum number a player can have deployed */
var int MaxDeployedLimit;

simulated function bool FireCompletedCallIn(int CallInOffs, vector TargetLocation, vector TargetNormal)
{
	local bool bSpawnRet;

	// Not enough credits, abort.
	if (!super.FireCompletedCallIn(CallInOffs, TargetLocation, TargetNormal))
		return false;

	DestroyOverLimit();

	bSpawnRet = class'TrCallIn_CrashLandInfo'.static.SpawnCrashLandInfo(
		OwningController, 
		CallTime, 
		TargetLocation, 
		-vect(0,0,1),
		ItemInDeliveryPod);

	IsInProgress = false;

	return bSpawnRet;
}

function DestroyOverLimit()
{
	local array<TrCallIn_SupportItemPlatform> OwnedItemPlatforms;
	local TrCallIn_SupportItemPlatform ItemPlatform;

	// Loop through all platforms, destroying any we own.
	foreach DynamicActors(class'TrCallIn_SupportItemPlatform', ItemPlatform)
	{
		// If we own this platform, add it to our array.
		if (ItemPlatform.Owner == OwningController)
		{
			OwnedItemPlatforms.AddItem(ItemPlatform);
		}
	}

	// Loop through all of our owned item platforms destroying any over our limit.
	while (OwnedItemPlatforms.Length >= MaxDeployedLimit && OwnedItemPlatforms.Length >= 1)
	{
		// Destroy the oldest.
		OwnedItemPlatforms[0].r_DeployedItem.r_Health = 0;
		OwnedItemPlatforms[0].r_DeployedItem.OnHealthChanged(true);
		OwnedItemPlatforms.Remove(0, 1);
	}
}

defaultproperties
{
   MaxDeployedLimit=1
   Name="Default__TrCallIn_Support"
   ObjectArchetype=TrCallIn'TribesGame.Default__TrCallIn'
}

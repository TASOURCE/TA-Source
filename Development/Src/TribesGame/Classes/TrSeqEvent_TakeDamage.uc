class TrSeqEvent_TakeDamage extends SeqEvent_TakeDamage;

/**
 * Return the version number for this class.  Child classes should increment this method by calling Super then adding
 * a individual class version to the result.  When a class is first created, the number should be 0; each time one of the
 * link arrays is modified (VariableLinks, OutputLinks, InputLinks, etc.), the number that is added to the result of
 * Super.GetObjClassVersion() should be incremented by 1.
 *
 * @return	the version number for this specific class.
 */
static event int GetObjClassVersion()
{
	return Super.GetObjClassVersion() + 1;
}

function HandleDamage(Actor inOriginator, Actor inInstigator, class<DamageType> inDamageType, int inAmount)
{
	local SeqVar_Float FloatVar;
	local SeqVar_Int IntVar;
	local bool bAlreadyActivatedThisTick;
	local class<TrDmgType_Base> TrDamageType;

	PublishLinkedVariableValues();

	if (inOriginator != None &&
		bEnabled &&
		inAmount >= MinDamageAmount &&
		IsValidDamageType(inDamageType) &&
		(!bPlayerOnly ||
		 (inInstigator!= None && inInstigator.IsPlayerOwned())))
	{
		CurrentDamage += inAmount;

		if (CurrentDamage >= DamageThreshold)
		{
			bAlreadyActivatedThisTick = (bActive && ActivationTime ~= GetWorldInfo().TimeSeconds);
			if (CheckActivate(inOriginator,inInstigator,false))
			{
				// write to any variables that want to know the exact damage taken
				foreach LinkedVariables(class'SeqVar_Float', FloatVar, "Damage Taken")
				{
					//@hack carry over damage from multiple hits in the same tick
					//since Kismet doesn't currently support multiple activations in the same tick
					if (bAlreadyActivatedThisTick)
					{
						FloatVar.FloatValue += CurrentDamage;
					}
					else
					{
						FloatVar.FloatValue = CurrentDamage;
					}
				}

				foreach LinkedVariables(class'SeqVar_Int', IntVar, "Device Id")
				{
					TrDamageType = class<TrDmgType_Base>(inDamageType);
					IntVar.IntValue = TrDamageType.default.DBWeaponId;
				}

				// reset the damage counter on activation
				if (DamageThreshold <= 0.f)
				{
					CurrentDamage = 0.f;
				}
				else
				{
					CurrentDamage -= DamageThreshold;
				}
			}
		}
	}
}

defaultproperties
{
   DamageThreshold=0.000000
   MaxTriggerCount=0
   bPlayerOnly=False
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Int',LinkDesc="Device Id",bWriteable=True)
   ObjName="Tribes Take Damage"
   Name="Default__TrSeqEvent_TakeDamage"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
}

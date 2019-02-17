/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class K2NodeBase extends Object
	native;


/** List of input connectors */
var array<K2Input> Inputs;

/** List of output connectors */
var array<K2Output> Outputs;

/** X position of node in the editor */
var int NodePosX;

/** Y position of node in the editor */
var int NodePosY;


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
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
#if WITH_EDITOR
	void CreateConnector(EK2ConnectorDirection Dir, EK2ConnectorType Type, const FString& ConnName, UClass* ObjConnClass = NULL);

	void BreakAllConnections();

	virtual FString GetDisplayName();

	virtual UBOOL InputDefaultsAreEditable();

	virtual FColor GetBorderColor();

	UK2Input* GetInputFromName(const FString& InputName);
	UK2Output* GetOutputFromName(const FString& OutputName);

	virtual void CreateAutoConnectors() {} // none by default
#endif

}


defaultproperties
{
   Name="Default__K2NodeBase"
   ObjectArchetype=Object'Core.Default__Object'
}

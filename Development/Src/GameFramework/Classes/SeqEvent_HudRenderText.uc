/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 *
 * This is the base class of all Mobile sequence events.  
 */
class SeqEvent_HudRenderText extends SeqEvent_HudRender;

enum ETextDrawMethod
{
	DRAW_CenterText,
	DRAW_WrapText,
};

/** The Font to draw */
var(HUD) font DisplayFont;

/** The Color to draw the text in */
var(HUD) color DisplayColor;

/** The Location to display the text at */
var(HUD) vector DisplayLocation;

/** The text to draw.  NOTE: You can set this via the variable link */
var(HUD) string DisplayText;

/** Whether the text should be centered at the display location */
var(HUD) ETextDrawMethod TextDrawMethod;

/** 
 * Perform the actual rendering
 */
function Render(Canvas TargetCanvas, Hud TargetHud)
{
	local float XL,YL;
	local int VarLinkIdx;
	local float UsedX, UsedY, UsedScaleX, UsedScaleY;
	local float GlobalScaleX, GlobalScaleY;

	if (bIsActive)
	{
		// @todo: Not sure why the PropertyName stuff doesn't just hookup and overwrite the properties, so do it manually for now
		for (VarLinkIdx = 0; VarLinkIdx < VariableLinks.length ; ++VarLinkIdx)
		{
			if (VariableLinks[VarLinkIdx].LinkDesc == "Display Text")
			{
				if (VariableLinks[VarLinkIdx].LinkedVariables.length > 0 && VariableLinks[VarLinkIdx].LinkedVariables[0] != none)
				{
					DisplayText = SeqVar_String(VariableLinks[VarLinkIdx].LinkedVariables[0]).StrValue;
				}
			}
			if (VariableLinks[VarLinkIdx].LinkDesc == "Display Location")
			{
				if (VariableLinks[VarLinkIdx].LinkedVariables.length > 0 && VariableLinks[VarLinkIdx].LinkedVariables[0] != none)
				{
					DisplayLocation = SeqVar_Vector(VariableLinks[VarLinkIdx].LinkedVariables[0]).VectValue;
				}
			}
		}

		if (DisplayFont != none)
		{
			TargetCanvas.Font = DisplayFont;
		}

		// cache the global scales
		GlobalScaleX = class'MobileMenuScene'.static.GetGlobalScaleX() / AuthoredGlobalScale;
		GlobalScaleY = class'MobileMenuScene'.static.GetGlobalScaleY() / AuthoredGlobalScale;

		// for floating point values, just multiply it by the canvas size
		// otherwise, apply GlobalScaleFactor, while undoing the scale factor they author at
		UsedX = (DisplayLocation.X < 1.0f) ? DisplayLocation.X * TargetCanvas.SizeX : (DisplayLocation.X * GlobalScaleX);
		UsedY = (DisplayLocation.Y < 1.0f) ? DisplayLocation.Y * TargetCanvas.SizeY : (DisplayLocation.Y * GlobalScaleY);
		UsedScaleX = GlobalScaleX;
		UsedScaleY = GlobalScaleY;


		TargetCanvas.DrawColor = DisplayColor;
	
		if( TextDrawMethod == DRAW_WrapText )
		{
			TargetCanvas.SetPos(UsedX, USedY);
			TargetCanvas.DrawText(DisplayText,, UsedScaleX, UsedScaleY);
		}
		else if( TextDrawMethod == DRAW_CenterText )
		{
			TargetCanvas.TextSize(DisplayText,XL,YL);
			XL *= UsedScaleX;
			TargetCanvas.SetPos(UsedX - XL / 2, UsedY);
			TargetCanvas.DrawText(DisplayText,, UsedScaleX, UsedScaleY);
		}
	}
}

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

defaultproperties
{
   DisplayColor=(B=255,G=255,R=255,A=255)
   TextDrawMethod=DRAW_WrapText
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Vector',LinkDesc="Display Location",PropertyName="DisplayLocation",MaxVars=1)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_String',LinkDesc="Display Text",PropertyName="DisplayText",MaxVars=1)
   ObjName="Draw Text"
   ObjCategory="HUD"
   Name="Default__SeqEvent_HudRenderText"
   ObjectArchetype=SeqEvent_HudRender'GameFramework.Default__SeqEvent_HudRender'
}

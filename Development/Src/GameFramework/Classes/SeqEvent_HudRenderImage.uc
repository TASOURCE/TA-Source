/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 *
 * This is the base class of all Mobile sequence events.  
 */
class SeqEvent_HudRenderImage extends SeqEvent_HudRender;

/** The color to modulate the text by */
var(HUD) LinearColor DisplayColor;

/** The Location to display the text at */
var(HUD) vector DisplayLocation;

/** The texture to display */
var(HUD) Texture2D DisplayTexture;

/** The Size of the image to display */
var(HUD) float XL, YL;

/** The UVs */
var(HUD) float U,V,UL,VL;

/** 
 * Perform the actual rendering
 */
function Render(Canvas TargetCanvas, Hud TargetHud)
{
	local int VarLinkIdx;
	local float UsedX, UsedY, UsedXL, UsedYL;
	local float GlobalScaleX, GlobalScaleY;

	if (bIsActive)
	{
		// @todo: Not sure why the PropertyName stuff doesn't just hookup and overwrite the properties, so do it manually for now
		for (VarLinkIdx = 0; VarLinkIdx < VariableLinks.length ; ++VarLinkIdx)
		{
			if (VariableLinks[VarLinkIdx].LinkDesc == "Display Location")
			{
				if (VariableLinks[VarLinkIdx].LinkedVariables.length > 0 && VariableLinks[VarLinkIdx].LinkedVariables[0] != none)
				{
					DisplayLocation = SeqVar_Vector(VariableLinks[VarLinkIdx].LinkedVariables[0]).VectValue;
				}
			}
		}

		// cache the global scales
		GlobalScaleX = class'MobileMenuScene'.static.GetGlobalScaleX() / AuthoredGlobalScale;
		GlobalScaleY = class'MobileMenuScene'.static.GetGlobalScaleY() / AuthoredGlobalScale;

		// for floating point values, just multiply it by the canvas size
		// otherwise, apply GlobalScaleFactor, while undoing the scale factor they author at
		UsedX = (DisplayLocation.X < 1.0f) ? DisplayLocation.X * TargetCanvas.SizeX : (DisplayLocation.X * GlobalScaleX);
		UsedY = (DisplayLocation.Y < 1.0f) ? DisplayLocation.Y * TargetCanvas.SizeY : (DisplayLocation.Y * GlobalScaleY);
		UsedXL = (XL <= 1.0f) ? XL * TargetCanvas.SizeX : (XL * GlobalScaleX);
		UsedYL = (YL <= 1.0f) ? YL * TargetCanvas.SizeX : (YL * GlobalScaleY);
		TargetCanvas.SetPos(UsedX, UsedY);
		TargetCanvas.DrawTile(DisplayTexture, UsedXL, UsedYL, U, V, UL, VL, DisplayColor);
	}
}

defaultproperties
{
   DisplayColor=(R=0.000000,G=0.000000,B=0.000000,A=1.000000)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Vector',LinkDesc="Display Location",PropertyName="DisplayLocation",bWriteable=True,MaxVars=1)
   ObjName="Draw Image"
   ObjCategory="HUD"
   Name="Default__SeqEvent_HudRenderImage"
   ObjectArchetype=SeqEvent_HudRender'GameFramework.Default__SeqEvent_HudRender'
}

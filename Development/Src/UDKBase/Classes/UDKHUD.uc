/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UDKHUD extends MobileHUD
	native;

var font GlowFonts[2];	// 0 = the Glow, 1 = Text

/** How long should the pulse take total */
var float PulseDuration;

/** When should the pulse switch from Out to in */
var float PulseSplit;

/** How much should the text pulse - NOTE this will be added to 1.0 (so PulseMultipler 0.5 = 1.5) */
var float PulseMultiplier;

var FontRenderInfo TextRenderInfo;

/** Holds a reference to the font to use for a given console */
var font ConsoleIconFont;

/** Font used to display input binds when they aren't represented by an icon in ConsoleIconFont. */
var font BindTextFont;

/**
 * Draw a glowing string
 */
native function DrawGlowText(string Text, float X, float Y, optional float MaxHeightInPixels=0.0, optional float PulseTime=-100.0, optional bool bRightJustified);

/** Convert a string with potential escape sequenced data in it to a font and the string that should be displayed */
native static function TranslateBindToFont(string InBindStr, out Font DrawFont, out string OutBindStr);

defaultproperties
{
   PulseDuration=0.330000
   PulseSplit=0.250000
   PulseMultiplier=0.500000
   TextRenderInfo=(GlowInfo=(GlowColor=(R=0.000000,G=0.000000,B=0.000000,A=1.000000)))
   Name="Default__UDKHUD"
   ObjectArchetype=MobileHUD'GameFramework.Default__MobileHUD'
}

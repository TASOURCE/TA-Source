//
// Switch is the note.
// RelatedPRI_1 is the player on the spree.
//
class TrKillingSpreeMessage extends UTLocalMessage;

var	localized string EndSpreeNote, EndSelfSpree, MultiKillString;
var	localized string SpreeNote[5];
var	localized string SelfSpreeNote[5];
var SoundNodeWave SpreeSound[5];
var	localized string EndSpreeNoteTrailer;

static function int GetFontSize( int Switch, PlayerReplicationInfo RelatedPRI1, PlayerReplicationInfo RelatedPRI2, PlayerReplicationInfo LocalPlayer )
{
	local Pawn ViewPawn;
	local int Size;

	if ( RelatedPRI2 == None )
	{
		Size = Default.FontSize;

		// If this is regarding the local player, then increase the size to make it more visible
		if ( LocalPlayer == RelatedPRI1 )
		{
			Size = (Switch > 3) ? 4 : 3;
		}
		else if ( (LocalPlayer != None) && LocalPlayer.bOnlySpectator )
		{
			ViewPawn = Pawn(PlayerController(LocalPlayer.Owner).ViewTarget);
			if ( (ViewPawn != None) && (ViewPawn.PlayerReplicationInfo == RelatedPRI1) )
			{
				Size = 3;
			}
		}
		return size;
	}
	return Default.FontSize;
}

static function string GetString(
	optional int Switch,
	optional bool bPRI1HUD,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	if (RelatedPRI_2 == None)
	{
		if ( bPRI1HUD )
			return Default.SelfSpreeNote[Switch];
		if (RelatedPRI_1 == None)
			return "";

		if (RelatedPRI_1.PlayerName != "")
			return RelatedPRI_1.PlayerName@Default.SpreeNote[Switch];
	}
	else
	{
		if (RelatedPRI_1 == None)
		{
			if (RelatedPRI_2.PlayerName != "")
			{
				return RelatedPRI_2.PlayerName@Default.EndSelfSpree;
			}
		}
		else
		{
			return RelatedPRI_1.PlayerName$Default.EndSpreeNote@RelatedPRI_2.PlayerName@Default.EndSpreeNoteTrailer;
		}
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
	Super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);

	if (RelatedPRI_2 != None)
		return;

	if ( (RelatedPRI_1 == P.PlayerReplicationInfo)
		|| (P.PlayerReplicationInfo.bOnlySpectator && (Pawn(P.ViewTarget) != None) && (Pawn(P.ViewTarget).PlayerReplicationInfo == RelatedPRI_1)) )
	{
		UTPlayerController(P).PlayAnnouncement(default.class,Switch );
		if ( Switch == 0 )
			UTPlayerController(P).ClientMusicEvent(8);
		else
			UTPlayerController(P).ClientMusicEvent(10);
	}
	else
		P.PlayBeepSound();
}

static function SoundNodeWave AnnouncementSound(int MessageIndex, Object OptionalObject, PlayerController PC)
{
	return Default.SpreeSound[MessageIndex];
}

defaultproperties
{
   EndSpreeNote="'s streak shut down by"
   EndSelfSpree="died, concluding a streak."
   SpreeNote(0)="is on a Killing Spree"
   SpreeNote(1)="is on a Killing Rampage"
   SpreeNote(2)="is Unstoppable"
   SpreeNote(3)="is Relentless"
   SpreeNote(4)="is The Slayer"
   SelfSpreeNote(0)="You are on a Killing Spree"
   SelfSpreeNote(1)="You are on a Killing Rampage"
   SelfSpreeNote(2)="You are Unstoppable"
   SelfSpreeNote(3)="You are Relentless"
   SelfSpreeNote(4)="You are The Slayer"
   MessageArea=4
   AnnouncementPriority=7
   FontSize=1
   Name="Default__TrKillingSpreeMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}

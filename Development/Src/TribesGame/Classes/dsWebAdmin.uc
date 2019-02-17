class dsWebAdmin extends WebApplication;

function Init()
{
	;
}

event Query(WebRequest Request, WebResponse Response)
{
	local string newMap;
	local string newType;
	local string newUrl;
    local string form;

	;

	if(Request.Username != "test" || Request.Password != "test")
	{
//		Response.FailAuthentication("dsWebAdmin");
//		return;
	}		

	switch(Request.URI)
	{
	case "/submit.html":
        newMap = Request.GetVariable("mapName");
        newType = Request.GetVariable("gameType");
        newUrl = newType$"-"$newMap$"?game=TribesGame.TrGame_"$newType;

        form = Response.LoadParsedUHTM("/MapChange.html");
        form = Repl(form, "@@mapUrl@@", newUrl, false);

		Response.SendText(form);
        WorldInfo.ServerTravel(newUrl);
		break;

	default:
        Response.SendText(Response.LoadParsedUHTM("/WebAdmin.html"));
		break;
	}
}

defaultproperties
{
   Name="Default__dsWebAdmin"
   ObjectArchetype=WebApplication'IpDrv.Default__WebApplication'
}

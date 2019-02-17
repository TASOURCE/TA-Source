/**
 * GFxTrScene_ExperienceSummary
 * 
 */

class GFxTrScene_ExperienceSummary extends GFxTrScene;
    /*native;

var bool      bNewSummary;
var bool      bSummaryData;

var int       GFxDataCount;
var GFxObject GFxDataList;

var int       PlayerId;
var bool      bVIP;
var bool      bBoosted;

struct native XPStruct
{
    var int ClassId;
    var int Base;
    var int VIP;
    var int Boost;
    var int PercentPlayed;
};

var array<XPStruct> DataList;

cpptext
{
    void PopulateSummary(CMarshal* pMarshal);
}

function Initialize()
{
    if (!bSceneCreated)
    {
        super.Initialize();

        bSceneCreated = true;
    }
}

/** Clears out our existing summary page to load new values. */
event ClearSummary()
{
    local int i;

    PlayerId = 0;
    bVIP = false;
    bBoosted = false;
    
    //TrOuter.PlayerSummaryScene.SkillClassId = 0;

    for (i = DataList.Length; i > 0; i--)
    {
        DataList.Remove(i-1, 1);
    }
}

event SummaryReady()
{
    bNewSummary = true;
    bSummaryData = true;

    //TrOuter.ASC_LoadExperienceSummary();
}

function LoadCounters(GFxObject List)
{
    local int i;
    local int totalBase;
    local int totalVIP;
    local int totalBoost;

    GFxDataCount = 0;
    GFxDataList = List;
    
    for (i = 1; i < DataList.Length; i++)
    {
        totalBase  += DataList[i].Base;
        totalVIP   += DataList[i].VIP;
        totalBoost += DataList[i].Boost;
    }
    
    // Index 0 is our Tokens, rest are Classes
    AddCounterData(DataList[0].Base, DataList[0].VIP, DataList[0].Boost);
    AddCounterData(totalBase, totalVIP, totalBoost);
}

function LoadPieGraph(GFxObject List)
{
    local int i;

    GFxDataCount = 0;
    GFxDataList = List;
    
    // Index 0 is our Tokens, rest are Classes
    for (i = 1; i < DataList.Length; i++)
    {
        AddPieGraphData(DataList[i].ClassId, DataList[i].PercentPlayed);
    }

    // Give em something to look at while getting AFK check'd
    if (DataList.Length == 0)
    {
        AddPieGraphData(0, 100);
    }
}

function LoadClasses(GFxObject List)
{
    local int i;

    GFxDataCount = 0;
    GFxDataList = List;
    
    // Index 0 is our Tokens, rest are Classes
    for (i = 1; i < DataList.Length; i++)
    {
        AddClassData(DataList[i]);
    }
}

function AddCounterData(int Base, int VIP, int Boost)
{
    local GFxObject obj;
    
    obj = Outer.CreateObject("Object");
    obj.SetFloat("base", Base);
    obj.SetFloat("vip", VIP);
    obj.SetFloat("boost", Boost);
    obj.SetFloat("bVIP", bVIP ? 1 : 0);
    obj.SetFloat("bBoost", bBoosted ? 1 : 0);

    GFxDataList.SetElementObject(GFxDataCount++, obj);
}

function AddPieGraphData(int ClassId, int PercentPlayed)
{
    /*local GFxObject obj;
    
    obj = Outer.CreateObject("Object");
    obj.SetString("classname", TrOuter.ClassScene.GetClassName(ClassId));
    obj.SetFloat("matchUsePercent", PercentPlayed);
    obj.SetFloat("pColor", TrOuter.ClassScene.GetClassColor(ClassId));

    GFxDataList.SetElementObject(GFxDataCount++, obj);*/
}

function AddClassData(XPStruct ClassData)
{
    /*local int            availableCount;
    local bool           bSentSkill;
    local float          current;
    local float          fillRange;
    local float          startRange;
    local GFxObject      obj;
    local GFxSkillStruct nextSkill;

    current = TrOuter.GetCurrentPoints(ClassData.ClassId);
    startRange = 100;
    fillRange = 100;
    
    if (ClassData.ClassId > 0)
    {
        availableCount = TrOuter.ClassScene.GetUnlocksAvailable(ClassData.ClassId, current);
        nextSkill = TrOuter.ClassScene.GetNextLowestSkill(ClassData.ClassId, current);

        if (nextSkill.Cost > 0)
        {
            startRange = 100 * (current / nextSkill.Cost);
            fillRange  = 100 * (current + ClassData.Base + ClassData.VIP + ClassData.Boost) / nextSkill.Cost;
        }

        if (!bSentSkill && availableCount > 0)
        {
            bSentSkill = true;
            TrOuter.PlayerSummaryScene.SkillClassId = ClassData.ClassId;
        }

        if (startRange > 100)
        {
            startRange = 100;
        }

        if (fillRange > 100)
        {
            fillRange = 100;
        }

        obj = Outer.CreateObject("Object");
        obj.SetString("className", TrOuter.ClassScene.GetClassName(ClassData.ClassId));
        obj.SetFloat("startRange", startRange);
        obj.SetFloat("fillRange", fillRange);
        obj.SetFloat("skillIconIndex", nextSkill.IconId);
        obj.SetFloat("pColor", TrOuter.ClassScene.GetClassColor(ClassData.ClassId));
        obj.SetFloat("numUnlocks", availableCount);
        obj.SetString("skillName", nextSkill.SkillName);
        obj.SetFloat("bHasUnlocks", availableCount > 0 ? 1 : 0);

        GFxDataList.SetElementObject(GFxDataCount++, obj);
    }*/
}*/

defaultproperties
{
   Name="Default__GFxTrScene_ExperienceSummary"
   ObjectArchetype=GFxTrScene'TribesGame.Default__GFxTrScene'
}

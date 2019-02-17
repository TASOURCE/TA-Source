class TrStealthResidue extends Actor
	notplaceable;

/** Mesh */
var UDKSkeletalMeshComponent m_Mesh;

/** Material for the residue mesh. */
var MaterialInstanceConstant m_MeshMaterial;

simulated event PreBeginPlay()
{
    local TrPawn OwnerPawn;
	//local TrAnimNodeSequencePose AnimNodePose;
	//local AnimTree AnimationTree;

	Super.PreBeginPlay();

	// Set up the mesh.
    //`log("*****************Owner"@Owner);
    OwnerPawn = TrPawn(Owner);
    if( OwnerPawn != None )
    {
        m_Mesh.SetSkeletalMesh(OwnerPawn.Mesh.SkeletalMesh);
        m_Mesh.SetMaterial(0, m_MeshMaterial);
        m_Mesh.CreateAndSetMaterialInstanceConstant(0);
        m_Mesh.SetScale(OwnerPawn.Mesh.Scale);

		// Need to figure out how to save the pose from the master mesh
		// and pass it to the stealthed mesh.
		/**
		m_Mesh.SetAnimTreeTemplate(OwnerPawn.Mesh.AnimTreeTemplate);
		m_Mesh.SetParentAnimComponent(OwnerPawn.Mesh);
		AnimationTree = AnimTree(m_Mesh.Animations);
		AnimationTree.SetUseSavedPose(true);
		m_Mesh.SetParentAnimComponent(None);
*/

		/*
		m_Mesh.ForceSkelUpdate();
		AnimNodePose = TrAnimNodeSequencePose(m_Mesh.Animations);
		if( AnimNodePose != none )
		{
			AnimNodePose.FillWithPose(OwnerPawn);
		}
		*/
		//m_Mesh.CopyAnimPose(OwnerPawn.Mesh);
		//m_Mesh.m_bFrozenPose = true;
        //m_Mesh.SetTranslation(OwnerPawn.Mesh.Translation);
        //m_Mesh.SetParentAnimComponent(OwnerPawn.Mesh);
        //m_Mesh.ForceSkelUpdate();
        //m_Mesh.SetParentAnimComponent(None);
        //m_Mesh.bNoSkeletonUpdate = true;

    }
}

defaultproperties
{
   Begin Object Class=UDKSkeletalMeshComponent Name=TheMesh
      bUpdateSkelWhenNotRendered=False
      ReplacementPrimitive=None
      MaxDrawDistance=8000.000000
      CachedMaxDrawDistance=8000.000000
      CastShadow=False
      bCastDynamicShadow=False
      Name="TheMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'UDKBase.Default__UDKSkeletalMeshComponent'
   End Object
   m_Mesh=TheMesh
   Components(0)=TheMesh
   bGameRelevant=True
   bMovable=False
   bNoEncroachCheck=True
   LifeSpan=50.000000
   Name="Default__TrStealthResidue"
   ObjectArchetype=Actor'Engine.Default__Actor'
}

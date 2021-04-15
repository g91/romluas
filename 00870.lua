-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_RecipeList()

	SetSpeakDetail( OwnerID(), GetString("YU_111353_D5")   )--����Ͳ��t��
	AddSpeakOption( OwnerID(), TargetID( ), GetString("YU_STORE_0") , "YUYU_111406_0", 0 ) --�S�����
	AddSpeakOption( OwnerID(), TargetID( ), GetString("YU_STORE_1") , "YUYU_111406_1", 0 ) --�Z��
	AddSpeakOption( OwnerID(), TargetID( ), GetString("YU_STORE_2") , "YUYU_111406_2", 0 ) --����
	AddSpeakOption( OwnerID(), TargetID( ), GetString("YU_STORE_3") , "YUYU_111406_3", 0 ) --�֥�
	AddSpeakOption( OwnerID(), TargetID( ), GetString("YU_STORE_4") , "YUYU_111406_4", 0 ) --���
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111353_0", 0 ) --�^��W�@��
end


function YUYU_111406_0()                                                                                                --�Nowner�൹���å���NPC
	local GAHO0 = LuaFunc_SearchNPCbyOrgID(TargetID(), 111406, 200 , 1) 
	BeginPlot( GAHO0[0],  "YUYU_RecipeList0_Init" , 0 )    
	
end

function YUYU_111406_1()
	local GAHO1 = LuaFunc_SearchNPCbyOrgID(TargetID(), 111407, 200 , 1) 
	BeginPlot( GAHO1[0],  "YUYU_RecipeList1_Init" , 0 )    
	
end

function YUYU_111406_2()
	local GAHO2 = LuaFunc_SearchNPCbyOrgID(TargetID(), 111408, 200 , 1) 
	BeginPlot( GAHO2[0],  "YUYU_RecipeList2_Init" , 0 )    
	
end

function YUYU_111406_3()
	local GAHO3 = LuaFunc_SearchNPCbyOrgID(TargetID(), 111409, 200 , 1) 
	BeginPlot( GAHO3[0],  "YUYU_RecipeList3_Init" , 0 )    
	
end

function YUYU_111406_4()
	local GAHO4 = LuaFunc_SearchNPCbyOrgID(TargetID(), 111410, 200 , 1) 
	BeginPlot( GAHO4[0],  "YUYU_RecipeList4_Init" , 0 )    
	
end

function YUYU_RecipeList0_Touch()

	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	
end

function YUYU_RecipeList0_Init()                                      --�}�t��ө��I�s�@��

	BeginPlot( TargetID(), "YUYU_RecipeList0_Touch" , 0 )    

--�S����ưt��
AddRecipe( OwnerID() , 550952); --��������
AddRecipe( OwnerID() , 550953); --�L�q�]
AddRecipe( OwnerID() , 550954); --�ֶq�]
AddRecipe( OwnerID() , 550955); --�A�q�]
AddRecipe( OwnerID() , 550956); --�L�q��
AddRecipe( OwnerID() , 550957); --�ֶq��
AddRecipe( OwnerID() , 550958); --�A�q��
AddRecipe( OwnerID() , 550959); --���
AddRecipe( OwnerID() , 550960); --�f��
AddRecipe( OwnerID() , 551008); --���
AddRecipe( OwnerID() , 551009); --�f��
end

function YUYU_RecipeList1_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	
end

function YUYU_RecipeList1_Init()

	BeginPlot( TargetID(), "YUYU_RecipeList1_Touch" , 0 )       

--�Z���t��
AddRecipe( OwnerID(), 550961); --�C
AddRecipe( OwnerID(), 550962); --
AddRecipe( OwnerID(), 550963); --�P��
AddRecipe( OwnerID(), 550964); --
AddRecipe( OwnerID(), 550965); --��
AddRecipe( OwnerID(), 550966); --
AddRecipe( OwnerID(), 550967); --�}
AddRecipe( OwnerID(), 550968); --

end

function YUYU_RecipeList2_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	
end

function YUYU_RecipeList2_Init()

	BeginPlot( TargetID(), "YUYU_RecipeList2_Touch" , 0 )       

AddRecipe( OwnerID(), 550969); --��}���Y�a
AddRecipe( OwnerID(), 550970); --
AddRecipe( OwnerID(), 550971); --
AddRecipe( OwnerID(), 550978); --��}���k�T
AddRecipe( OwnerID(), 550979); --
AddRecipe( OwnerID(), 550980); --
AddRecipe( OwnerID(), 550987); --��}������
AddRecipe( OwnerID(), 550988); --
AddRecipe( OwnerID(), 550989); --
AddRecipe( OwnerID(), 550996); --��}���u�u
AddRecipe( OwnerID(), 550997); --
AddRecipe( OwnerID(), 550998); --
AddRecipe( OwnerID(), 551005); --�d�ܺ�����
AddRecipe( OwnerID(), 551006); --
AddRecipe( OwnerID(), 551007); --

end

function YUYU_RecipeList3_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	
end

function YUYU_RecipeList3_Init()

	BeginPlot( TargetID(), "YUYU_RecipeList3_Touch" , 0 )       

AddRecipe( OwnerID(), 550972); --�y���F�Y��
AddRecipe( OwnerID(), 550973); --
AddRecipe( OwnerID(), 550974); --
AddRecipe( OwnerID(), 550981); --�y���F�֥�
AddRecipe( OwnerID(), 550982); --
AddRecipe( OwnerID(), 550983); --
AddRecipe( OwnerID(), 550990); --�y���F����
AddRecipe( OwnerID(), 550991); --
AddRecipe( OwnerID(), 550992); --
AddRecipe( OwnerID(), 550999); --�y���F���u
AddRecipe( OwnerID(), 551000); --
AddRecipe( OwnerID(), 551001); --
AddRecipe( OwnerID(), 551005); --�d�ܺ�����
AddRecipe( OwnerID(), 551006); --
AddRecipe( OwnerID(), 551007); --
end

function YUYU_RecipeList4_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	
end

function YUYU_RecipeList4_Init()

	BeginPlot( TargetID(), "YUYU_RecipeList4_Touch" , 0 )       

AddRecipe( OwnerID(), 550975); --�N�_�̭x��
AddRecipe( OwnerID(), 550976); --
AddRecipe( OwnerID(), 550977); --
AddRecipe( OwnerID(), 550984); --�N�_�̭x��
AddRecipe( OwnerID(), 550985); --
AddRecipe( OwnerID(), 550986); --
AddRecipe( OwnerID(), 550993); --�N�_�̪���
AddRecipe( OwnerID(), 550994); --
AddRecipe( OwnerID(), 550995); --
AddRecipe( OwnerID(), 551002); --�N�_�̭x�u
AddRecipe( OwnerID(), 551003); --
AddRecipe( OwnerID(), 551004); --
AddRecipe( OwnerID(), 551005); --�d�ܺ�����
AddRecipe( OwnerID(), 551006); --
AddRecipe( OwnerID(), 551007); --
end


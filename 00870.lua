-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_RecipeList()

	SetSpeakDetail( OwnerID(), GetString("YU_111353_D5")   )--關於生產配方
	AddSpeakOption( OwnerID(), TargetID( ), GetString("YU_STORE_0") , "YUYU_111406_0", 0 ) --特殊材料
	AddSpeakOption( OwnerID(), TargetID( ), GetString("YU_STORE_1") , "YUYU_111406_1", 0 ) --武器
	AddSpeakOption( OwnerID(), TargetID( ), GetString("YU_STORE_2") , "YUYU_111406_2", 0 ) --布衣
	AddSpeakOption( OwnerID(), TargetID( ), GetString("YU_STORE_3") , "YUYU_111406_3", 0 ) --皮甲
	AddSpeakOption( OwnerID(), TargetID( ), GetString("YU_STORE_4") , "YUYU_111406_4", 0 ) --鎖甲
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111353_0", 0 ) --回到上一頁
end


function YUYU_111406_0()                                                                                                --將owner轉給隱藏任務NPC
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

function YUYU_RecipeList0_Init()                                      --開配方商店呼叫劇情

	BeginPlot( TargetID(), "YUYU_RecipeList0_Touch" , 0 )    

--特殊材料配方
AddRecipe( OwnerID() , 550952); --元素結晶
AddRecipe( OwnerID() , 550953); --微量魔
AddRecipe( OwnerID() , 550954); --少量魔
AddRecipe( OwnerID() , 550955); --適量魔
AddRecipe( OwnerID() , 550956); --微量符
AddRecipe( OwnerID() , 550957); --少量符
AddRecipe( OwnerID() , 550958); --適量符
AddRecipe( OwnerID() , 550959); --精火
AddRecipe( OwnerID() , 550960); --淬火
AddRecipe( OwnerID() , 551008); --精水
AddRecipe( OwnerID() , 551009); --淬水
end

function YUYU_RecipeList1_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	
end

function YUYU_RecipeList1_Init()

	BeginPlot( TargetID(), "YUYU_RecipeList1_Touch" , 0 )       

--武器配方
AddRecipe( OwnerID(), 550961); --劍
AddRecipe( OwnerID(), 550962); --
AddRecipe( OwnerID(), 550963); --匕首
AddRecipe( OwnerID(), 550964); --
AddRecipe( OwnerID(), 550965); --杖
AddRecipe( OwnerID(), 550966); --
AddRecipe( OwnerID(), 550967); --弓
AddRecipe( OwnerID(), 550968); --

end

function YUYU_RecipeList2_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	
end

function YUYU_RecipeList2_Init()

	BeginPlot( TargetID(), "YUYU_RecipeList2_Touch" , 0 )       

AddRecipe( OwnerID(), 550969); --梵迪斯頭冠
AddRecipe( OwnerID(), 550970); --
AddRecipe( OwnerID(), 550971); --
AddRecipe( OwnerID(), 550978); --梵迪斯法袍
AddRecipe( OwnerID(), 550979); --
AddRecipe( OwnerID(), 550980); --
AddRecipe( OwnerID(), 550987); --梵迪斯長褲
AddRecipe( OwnerID(), 550988); --
AddRecipe( OwnerID(), 550989); --
AddRecipe( OwnerID(), 550996); --梵迪斯短靴
AddRecipe( OwnerID(), 550997); --
AddRecipe( OwnerID(), 550998); --
AddRecipe( OwnerID(), 551005); --卡萊爾之戒
AddRecipe( OwnerID(), 551006); --
AddRecipe( OwnerID(), 551007); --

end

function YUYU_RecipeList3_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	
end

function YUYU_RecipeList3_Init()

	BeginPlot( TargetID(), "YUYU_RecipeList3_Touch" , 0 )       

AddRecipe( OwnerID(), 550972); --悠爾達頭盔
AddRecipe( OwnerID(), 550973); --
AddRecipe( OwnerID(), 550974); --
AddRecipe( OwnerID(), 550981); --悠爾達皮甲
AddRecipe( OwnerID(), 550982); --
AddRecipe( OwnerID(), 550983); --
AddRecipe( OwnerID(), 550990); --悠爾達長褲
AddRecipe( OwnerID(), 550991); --
AddRecipe( OwnerID(), 550992); --
AddRecipe( OwnerID(), 550999); --悠爾達長靴
AddRecipe( OwnerID(), 551000); --
AddRecipe( OwnerID(), 551001); --
AddRecipe( OwnerID(), 551005); --卡萊爾之戒
AddRecipe( OwnerID(), 551006); --
AddRecipe( OwnerID(), 551007); --
end

function YUYU_RecipeList4_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	
end

function YUYU_RecipeList4_Init()

	BeginPlot( TargetID(), "YUYU_RecipeList4_Touch" , 0 )       

AddRecipe( OwnerID(), 550975); --霍奇米軍盔
AddRecipe( OwnerID(), 550976); --
AddRecipe( OwnerID(), 550977); --
AddRecipe( OwnerID(), 550984); --霍奇米軍甲
AddRecipe( OwnerID(), 550985); --
AddRecipe( OwnerID(), 550986); --
AddRecipe( OwnerID(), 550993); --霍奇米長褲
AddRecipe( OwnerID(), 550994); --
AddRecipe( OwnerID(), 550995); --
AddRecipe( OwnerID(), 551002); --霍奇米軍靴
AddRecipe( OwnerID(), 551003); --
AddRecipe( OwnerID(), 551004); --
AddRecipe( OwnerID(), 551005); --卡萊爾之戒
AddRecipe( OwnerID(), 551006); --
AddRecipe( OwnerID(), 551007); --
end


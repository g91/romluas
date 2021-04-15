--愛麗絲-羅格鎮採藥導師
function Lua_110471_RecipeList_Init()

	--	SetPlot( OwnerID() , "Touch" , "Lua_110471_RecipeList_Touch" , 60 );
AddRecipe( OwnerID(), 550101 ); --配方-山魔楊草束
AddRecipe( OwnerID(), 550102 ); --配方-野漿草束
AddRecipe( OwnerID(), 550103 ); --配方-苦葉草束
AddRecipe( OwnerID(), 550104 ); --配方-艾爾香草束
AddRecipe( OwnerID(), 550105 ); --配方-暮色蘭束
AddRecipe( OwnerID(), 550106 ); --配方-巴沙石葉草束
AddRecipe( OwnerID(), 550107 ); --配方-月石斛束
AddRecipe( OwnerID(), 550108 ); --配方-罪人掌束
AddRecipe( OwnerID(), 550109 ); --配方-龍葵溶束
--AddRecipe( OwnerID(), 550110 ); --配方-曼陀蘿溶束
AddRecipe( OwnerID(), 550111 ); --配方-山魔楊草汁
AddRecipe( OwnerID(), 550112 ); --配方-野漿草汁
AddRecipe( OwnerID(), 550113 ); --配方-苦葉草汁
AddRecipe( OwnerID(), 550114 ); --配方-艾爾香草汁
AddRecipe( OwnerID(), 550115 ); --配方-暮色蘭汁
AddRecipe( OwnerID(), 550116 ); --配方-巴沙石葉草汁
AddRecipe( OwnerID(), 550117 ); --配方-月石斛汁
AddRecipe( OwnerID(), 550118 ); --配方-罪人掌汁
AddRecipe( OwnerID(), 550119 ); --配方-龍葵汁
--AddRecipe( OwnerID(), 550120 ); --配方-曼陀蘿汁
AddRecipe( OwnerID(), 550221 ); --配方-迷迭香束
AddRecipe( OwnerID(), 550222 ); --配方-迷薰草束
AddRecipe( OwnerID(), 550223 ); --配方-飛凌果醬
AddRecipe( OwnerID(), 550224 ); --配方-綠迷薊束
AddRecipe( OwnerID(), 550225 ); --配方-腐草菇束
--AddRecipe( OwnerID(), 550226 ); --配方-鏡莎花束
--AddRecipe( OwnerID(), 550227 ); --配方-地精靈草束
AddRecipe( OwnerID(), 550228 ); --配方-迷迭香汁
AddRecipe( OwnerID(), 550229 ); --配方-迷薰草汁
AddRecipe( OwnerID(), 550230 ); --配方-飛凌果汁
AddRecipe( OwnerID(), 550231 ); --配方-綠迷薊汁
AddRecipe( OwnerID(), 550232 ); --配方-腐草菇汁
--AddRecipe( OwnerID(), 550233 ); --配方-鏡莎花汁
--AddRecipe( OwnerID(), 550234 ); --配方-地精靈草汁

--2013/03/26 阿準新增配方 至51級

AddRecipe( OwnerID(), 552379    ); --	配方-山魔楊草汁	1
AddRecipe( OwnerID(), 552381    ); --	配方-迷迭香汁	1
AddRecipe( OwnerID(), 552383    ); --	配方-野漿草汁	8
AddRecipe( OwnerID(), 552385    ); --	配方-迷薰草汁	11
AddRecipe( OwnerID(), 552387    ); --	配方-苦葉草汁	14
AddRecipe( OwnerID(), 552389    ); --	配方-艾爾香草汁	20
AddRecipe( OwnerID(), 552391    ); --	配方-飛凌果汁	21
AddRecipe( OwnerID(), 552393    ); --	配方-暮色蘭汁	26
AddRecipe( OwnerID(), 552395    ); --	配方-綠迷薊汁	31
AddRecipe( OwnerID(), 552397    ); --	配方-巴沙石葉草汁	32
AddRecipe( OwnerID(), 552399    ); --	配方-月石斛汁	38
AddRecipe( OwnerID(), 552401    ); --	配方-腐草菇汁	41
AddRecipe( OwnerID(), 552403    ); --	配方-罪人掌汁	44
AddRecipe( OwnerID(), 552405    ); --	配方-龍葵汁	51
	
end

function Lua_110471_RecipeList_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	

end
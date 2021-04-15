--歐路特-Z-2挖礦導師
function Lua_110017_RecipeList_Init()

--	SetPlot( OwnerID() , "Touch" , "Lua_110017_RecipeList_Touch" , 60 );
	
AddRecipe( OwnerID(), 550001 ); --配方-黃銅砂
AddRecipe( OwnerID(), 550002 ); --配方-錫砂
AddRecipe( OwnerID(), 550003 ); --配方-赤鐵砂
AddRecipe( OwnerID(), 550004 ); --配方-紫銅砂
AddRecipe( OwnerID(), 550005 ); --配方-闇晶砂
AddRecipe( OwnerID(), 550006 ); --配方-白銀砂
AddRecipe( OwnerID(), 550007 ); --配方-巫鐵砂
AddRecipe( OwnerID(), 550008 ); --配方-祕銀砂
AddRecipe( OwnerID(), 550009 ); --配方-深淵水銀砂
--AddRecipe( OwnerID(), 550010 ); --配方-符文黑曜砂
AddRecipe( OwnerID(), 550011 ); --配方-黃銅塊
AddRecipe( OwnerID(), 550012 ); --配方-錫塊
AddRecipe( OwnerID(), 550013 ); --配方-赤鐵塊
AddRecipe( OwnerID(), 550014 ); --配方-紫銅塊
AddRecipe( OwnerID(), 550015 ); --配方-闇晶塊
AddRecipe( OwnerID(), 550016 ); --配方-白銀塊
AddRecipe( OwnerID(), 550017 ); --配方-巫鐵塊
AddRecipe( OwnerID(), 550018 ); --配方-祕銀塊
AddRecipe( OwnerID(), 550019 ); --配方-深淵水銀塊
--AddRecipe( OwnerID(), 550020 ); --配方-符文黑曜塊
AddRecipe( OwnerID(), 550151 ); --配方-火焰塵砂
AddRecipe( OwnerID(), 550152 ); --配方-藍冰石砂
AddRecipe( OwnerID(), 550153 ); --配方-大水晶砂
AddRecipe( OwnerID(), 550154 ); --配方-奧利哈爾砂
AddRecipe( OwnerID(), 550155 ); --配方-米斯里魯砂
AddRecipe( OwnerID(), 550156 ); --配方-寒岩結晶砂
--AddRecipe( OwnerID(), 550157 ); --配方-海神雲母砂
AddRecipe( OwnerID(), 550158 ); --配方-火焰塵塊
AddRecipe( OwnerID(), 550159 ); --配方-藍冰石塊
AddRecipe( OwnerID(), 550160 ); --配方-大水晶塊
AddRecipe( OwnerID(), 550161 ); --配方-奧利哈爾塊
AddRecipe( OwnerID(), 550162 ); --配方-米斯里魯塊
AddRecipe( OwnerID(), 550163 ); --配方-寒岩結晶塊
--AddRecipe( OwnerID(), 550164 ); --配方-海神雲母塊

--2013/03/26 阿準新增配方 至51級

AddRecipe( OwnerID(), 552295  ); --	配方-黃銅塊	1
AddRecipe( OwnerID(), 552296  ); --	配方-黃銅錠	1
AddRecipe( OwnerID(), 552323  ); --	配方-火焰塵塊	1
AddRecipe( OwnerID(), 552324  ); --	配方-火焰塵錠	1
AddRecipe( OwnerID(), 552297  ); --	配方-錫塊	8
AddRecipe( OwnerID(), 552298  ); --	配方-錫錠	8
AddRecipe( OwnerID(), 552321  ); --	配方-藍冰石塊	11
AddRecipe( OwnerID(), 552322  ); --	配方-藍冰石錠	11
AddRecipe( OwnerID(), 552299  ); --	配方-赤鐵塊	14
AddRecipe( OwnerID(), 552300  ); --	配方-赤鐵錠	14
AddRecipe( OwnerID(), 552301  ); --	配方-紫銅塊	20
AddRecipe( OwnerID(), 552302  ); --	配方-紫銅錠	20
AddRecipe( OwnerID(), 552311  ); --	配方-大水晶塊	21
AddRecipe( OwnerID(), 552312  ); --	配方-大水晶錠	21
AddRecipe( OwnerID(), 552303  ); --	配方-闇晶塊	26
AddRecipe( OwnerID(), 552304  ); --	配方-闇晶錠	26
AddRecipe( OwnerID(), 552319  ); --	配方-奧利哈爾塊	31
AddRecipe( OwnerID(), 552320  ); --	配方-奧利哈爾錠	31
AddRecipe( OwnerID(), 552305  ); --	配方-白銀塊	32
AddRecipe( OwnerID(), 552306  ); --	配方-白銀錠	32
AddRecipe( OwnerID(), 552307  ); --	配方-巫鐵塊	38
AddRecipe( OwnerID(), 552308  ); --	配方-巫鐵錠	38
AddRecipe( OwnerID(), 552315  ); --	配方-米斯里魯塊	41
AddRecipe( OwnerID(), 552316  ); --	配方-米斯里魯錠	41
AddRecipe( OwnerID(), 552309  ); --	配方-祕銀塊	44
AddRecipe( OwnerID(), 552310  ); --	配方-祕銀錠	44
AddRecipe( OwnerID(), 552313  ); --	配方-深淵水銀塊	51
AddRecipe( OwnerID(), 552314  ); --	配方-深淵水銀錠	51
AddRecipe( OwnerID(), 552325  ); --	配方-寒岩結晶塊	51
AddRecipe( OwnerID(), 552326  ); --	配方-寒岩結晶錠	51
	
end

function Lua_110017_RecipeList_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	

end
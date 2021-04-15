--洛桑-Z-2伐木導師
function Lua_110163_RecipeList_Init()

--	SetPlot( OwnerID() , "Touch" , "Lua_110163_RecipeList_Touch" , 60 );
AddRecipe( OwnerID(), 550051 ); --配方-輕木材
AddRecipe( OwnerID(), 550052 ); --配方-柳木材
AddRecipe( OwnerID(), 550053 ); --配方-楓木材
AddRecipe( OwnerID(), 550054 ); --配方-橡木材
AddRecipe( OwnerID(), 550055 ); --配方-青斑松材
AddRecipe( OwnerID(), 550056 ); --配方-冬青木材
AddRecipe( OwnerID(), 550057 ); --配方-紫杉木材
AddRecipe( OwnerID(), 550058 ); --配方-塔斯林魔木材
AddRecipe( OwnerID(), 550059 ); --配方-龍巢巨木材
--AddRecipe( OwnerID(), 550060 ); --配方-古靈橡樹材
AddRecipe( OwnerID(), 550061 ); --配方-輕木條
AddRecipe( OwnerID(), 550062 ); --配方-柳木條
AddRecipe( OwnerID(), 550063 ); --配方-楓木條
AddRecipe( OwnerID(), 550064 ); --配方-橡木條
AddRecipe( OwnerID(), 550065 ); --配方-青斑松條
AddRecipe( OwnerID(), 550066 ); --配方-冬青木條
AddRecipe( OwnerID(), 550067 ); --配方-紫杉木條
AddRecipe( OwnerID(), 550068 ); --配方-塔斯林魔木條
AddRecipe( OwnerID(), 550069 ); --配方-龍巢巨木條
--AddRecipe( OwnerID(), 550070 ); --配方-古靈橡樹條
AddRecipe( OwnerID(), 550186 ); --配方-風鈴木木材
AddRecipe( OwnerID(), 550187 ); --配方-地藤根木材
AddRecipe( OwnerID(), 550188 ); --配方-千年木木材
AddRecipe( OwnerID(), 550189 ); --配方-龍鬚根木材
AddRecipe( OwnerID(), 550190 ); --配方-聖木木材
AddRecipe( OwnerID(), 550191 ); --配方-妖精木材
--AddRecipe( OwnerID(), 550192 ); --配方-遠古木材
AddRecipe( OwnerID(), 550193 ); --配方-風鈴木木條
AddRecipe( OwnerID(), 550194 ); --配方-地藤根木條
AddRecipe( OwnerID(), 550195 ); --配方-千年木木條
AddRecipe( OwnerID(), 550196 ); --配方-龍鬚根木條
AddRecipe( OwnerID(), 550197 ); --配方-聖木木條
AddRecipe( OwnerID(), 550198 ); --配方-妖精木條
--AddRecipe( OwnerID(), 550199 ); --配方-遠古木條
AddRecipe( OwnerID(), 550200 ); --配方-風鈴木木板
AddRecipe( OwnerID(), 550201 ); --配方-地藤根木板
AddRecipe( OwnerID(), 550202 ); --配方-千年木木板
AddRecipe( OwnerID(), 550203 ); --配方-龍鬚根木板
AddRecipe( OwnerID(), 550204 ); --配方-聖木木板
AddRecipe( OwnerID(), 550205 ); --配方-妖精木板
--AddRecipe( OwnerID(), 550206 ); --配方-遠古木板

--2013/03/26 阿準新增配方 至51級
	
AddRecipe( OwnerID(), 552337   ); --	配方-輕木條	1
AddRecipe( OwnerID(), 552338   ); --	配方-輕木板	1
AddRecipe( OwnerID(), 552339   ); --	配方-風鈴木木條	1
AddRecipe( OwnerID(), 552340   ); --	配方-風鈴木木板	1
AddRecipe( OwnerID(), 552341   ); --	配方-柳木條	8
AddRecipe( OwnerID(), 552342   ); --	配方-柳木板	8
AddRecipe( OwnerID(), 552343   ); --	配方-地藤根木條	11
AddRecipe( OwnerID(), 552344   ); --	配方-地藤根木板	11
AddRecipe( OwnerID(), 552345   ); --	配方-楓木條	14
AddRecipe( OwnerID(), 552346   ); --	配方-楓木板	14
AddRecipe( OwnerID(), 552347   ); --	配方-橡木條	20
AddRecipe( OwnerID(), 552348   ); --	配方-橡木板	20
AddRecipe( OwnerID(), 552349   ); --	配方-千年木木條	21
AddRecipe( OwnerID(), 552350   ); --	配方-千年木木板	21
AddRecipe( OwnerID(), 552351   ); --	配方-青斑松條	26
AddRecipe( OwnerID(), 552352   ); --	配方-青斑松板	26
AddRecipe( OwnerID(), 552353   ); --	配方-龍鬚根木條	31
AddRecipe( OwnerID(), 552354   ); --	配方-龍鬚根木板	31
AddRecipe( OwnerID(), 552355   ); --	配方-冬青木條	32
AddRecipe( OwnerID(), 552356   ); --	配方-冬青木板	32
AddRecipe( OwnerID(), 552357   ); --	配方-紫杉木條	38
AddRecipe( OwnerID(), 552358   ); --	配方-紫杉木板	38
AddRecipe( OwnerID(), 552359   ); --	配方-聖木木條	41
AddRecipe( OwnerID(), 552360   ); --	配方-聖木木板	41
AddRecipe( OwnerID(), 552361   ); --	配方-塔斯林魔木條	44
AddRecipe( OwnerID(), 552362   ); --	配方-塔斯林魔木板	44
AddRecipe( OwnerID(), 552363   ); --	配方-龍巢巨木條	51
AddRecipe( OwnerID(), 552364   ); --	配方-龍巢巨木板	51
AddRecipe( OwnerID(), 552365   ); --	配方-妖精木條	51
AddRecipe( OwnerID(), 552366   ); --	配方-妖精木板	51

end

function Lua_110163_RecipeList_Touch()
	closeSpeak( OwnerID() )
	GetRecipeList( OwnerID(), TargetID() );	 -- GetRecipeList( Player, NPC );
	

end
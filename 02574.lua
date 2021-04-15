--================================================================--
--			一般商店
--================================================================--

--對話劇情統一掛 LuaS_ComShop
--初始劇情掛以下

function Zone22_items()		--雜貨
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600368, "Test_Shop_Close" );
end

function Zone22_HeaveArmor_01()	--重甲_鎧甲
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600369, "Test_Shop_Close" );
end

function Zone22_HeaveArmor_02()	--重甲_鎖甲
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600370, "Test_Shop_Close" );
end

function Zone22_LightArmor()		--輕甲_皮甲
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600371, "Test_Shop_Close" );
end

function Zone22_Cloth()		--服飾
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600372, "Test_Shop_Close" );
end

function Zone22_AllWeapon()		--綜合武器
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600373, "Test_Shop_Close" );
end


--================================================================--
--			配方商店
--================================================================--
--參考ZONE 21，初始劇情掛以下

--Lua_119286_RecipeList_Init --製甲
--Lua_119201_RecipeList_Init --裁縫
--Lua_119200_RecipeList_Init --鐵具
--Lua_119082_RecipeList_Init --木工

--上面4個   PID值填1為白裝、填2為綠裝、填3為藍裝

--Lua_119286_01_RecipeList_Init --製甲白裝
--Lua_119201_01_RecipeList_Init --裁縫白裝
--Lua_119200_01_RecipeList_Init --鐵具白裝
--Lua_119082_01_RecipeList_Init --木工白裝

--Lua_119286_02_RecipeList_Init --製甲綠裝
--Lua_119201_02_RecipeList_Init --裁縫綠裝
--Lua_119200_02_RecipeList_Init --鐵具綠裝
--Lua_119082_02_RecipeList_Init --木工綠裝

--Lua_119286_03_RecipeList_Init --製甲藍裝
--Lua_119201_03_RecipeList_Init --裁縫藍裝
--Lua_119200_03_RecipeList_Init --鐵具藍裝
--Lua_119082_03_RecipeList_Init --木工藍裝

--Lua_119288_RecipeList_Init --採草
--Lua_119289_RecipeList_Init --採礦
--Lua_119290_1_RecipeList_Init--伐木
--Lua_119087_RecipeList_Init --煉金
--Lua_119088_RecipeList_Init --烹飪

--================================================================--
function Zone22_HighReFineStone() --六等精煉石
  	SetMinimapIcon(OwnerID(),EM_MapIconType_Shop)
	SetShop(OwnerID(),600388,"Test_Shop_Close")
end

function Lua_119290_1_RecipeList_Init()	--z22伐木配方商人
	local Recipe = {
			551767	,--配方-諾斯檜木材	66
			551768	,--配方-諾斯檜木條	66
			551769	,--配方-諾斯檜木板	66
			--551770	,--配方-精製諾斯檜木板	66
			--551771	,--配方-頂級諾斯檜木板	66
			551887	,--配方-托多銀杏樹材	75
			551888	,--配方-托多銀杏樹條	75
			551889	,--配方-托多銀杏樹板	75
			--551890	,--配方-精製托多銀杏樹板	75
			--551891	,--配方-頂級托多銀杏樹板	75
			551902	,--配方-石松木材	71
			551903	,--配方-石松木條	71
			551904	,--配方-石松木板	71
			--551905	,--配方-精製石松木板	71
			--551906	--配方-頂級石松木板	71

			--2013/03/26 阿準新增配方 66級後
			552373 , --	配方-諾斯檜木條	66
			552374 , --	配方-諾斯檜木板	66
			552375 , --	配方-石松木條	71
			552376 , --	配方-石松木板	71
			552377 , --	配方-托多銀杏樹條	75
			552378  --	配方-托多銀杏樹板	75
			}
	for RecipeList=1,table.getn(Recipe) do
		AddRecipe( OwnerID(), Recipe[RecipeList] )
	end
end

function Lua_119288_1_RecipeList_Init()	--z22.23採草配方商人
	local Recipe = {
		551757	,--配方-夜燈籠草束	66
		551758	,--配方-夜燈籠草汁	66
		551759	,--配方-夜燈籠草萃取液	66
	--	551760	,--配方-夜燈籠草純化液	66
	--	551761	,--配方-夜燈籠草精華液	66
		551882	,--配方-雷蹄葉草束	75
		551883	,--配方-雷蹄葉草汁	75
		551884	,--配方-雷蹄葉草萃取液	75
	--	551885	,--配方-雷蹄葉草純化液	75
	--	551886	,--配方-雷蹄葉草精華液	75
		551897	,--配方-鳩尾花束	71
		551898	,--配方-鳩尾花汁	71
		551899	,--配方-鳩尾花萃取液	71
	--	551900	,--配方-鳩尾花純化液	71
	--	551901	--配方-鳩尾花精華液	71

		--2013/03/26 阿準新增配方 66級後
		552415   ,--	配方-夜燈籠草汁	66
		552416   ,--	配方-夜燈籠草萃取液	66
		552417   ,--	配方-鳩尾花汁	71
		552418   ,--	配方-鳩尾花萃取液	71
		552419   ,--	配方-雷蹄葉草汁	75
		552420   --	配方-雷蹄葉草萃取液	75
			}
	for RecipeList=1,table.getn(Recipe) do
		AddRecipe( OwnerID(), Recipe[RecipeList] )
	end
end

function Lua_119289_1_RecipeList_Init()	--z22.23採礦配方商人
	local Recipe = {
		551762,--	配方-紫晶瑪瑙砂	66
		551763,--	配方-紫晶瑪瑙塊	66
		551764,--	配方-紫晶瑪瑙錠	66
		--551765,--	配方-淬鍊紫晶瑪瑙錠	66
		--551766,--	配方-符文紫晶瑪瑙錠	66
		551892,--	配方-俄勒岡石砂	75
		551893,--	配方-俄勒岡石塊	75
		551894,--	配方-俄勒岡石錠	75
		--551895,--	配方-淬鍊俄勒岡石錠	75
		--551896,--	配方-符文俄勒岡石錠	75
		551907,--	配方-結勒結晶砂	71
		551908,--	配方-結勒結晶塊	71
		551909,--	配方-結勒結晶錠	71
		--551910,--	配方-淬鍊結勒結晶錠	71
		--551911,--	配方-符文結勒結晶錠	71

		--2013/03/26 阿準新增配方 66級後
		552331  , --	配方-紫晶瑪瑙塊	66
		552332  , --	配方-紫晶瑪瑙錠	66
		552335  , --	配方-結勒結晶塊	71
		552336  , --	配方-結勒結晶錠	71
		552333  , --	配方-俄勒岡石塊	75
		552334   --	配方-俄勒岡石錠	75
			}
	for RecipeList=1,table.getn(Recipe) do
		AddRecipe( OwnerID(), Recipe[RecipeList] )
	end
end

function Lua_119087_1_RecipeList_Init()	--藥水配方
	local Recipe = {
			551737,--	配方-速效治療藥水	70
			551738,--	配方-速效魔力藥水	70
			552031,--	配方-祈靈治療泉水	75
			552032, --	配方-禱念魔力泉水	75
			552293 ,--	配方-鋼膚藥劑	煉金	78
			552294 ,--	配方-神聖藥劑	煉金	78
			552280 ,--	配方-祝福治療藥水	煉金	80
			552281 --	配方-祝福魔力藥水	煉金	80
				}
	for RecipeList=1,table.getn(Recipe) do
		AddRecipe( OwnerID(), Recipe[RecipeList] )
	end
end

function Lua_119088_1_RecipeList_Init()	--烹飪配方
	local Recipe = {
			551739,	--70	配方-醬燒鮮魚
			551740,	--70	配方-鬆軟白麵包
			551741,	--70	配方-醬燒肋排
			551742,	--70	配方-煎蛋三明治
			551743,	--70	配方-奶油蛋糕
			551744,	--70	配方-牛奶巧克力
			552033,	--75	配方-香酥現烤麵包
			552034,	--75	配方-千層三明治
			552035,	--75	配方-煙燻魚乾
			552036,	--75	配方-煙燻肋排
			552037,	--75	配方-貴族巧克力
			552038,	--75	配方-蜂蜜蛋糕
			552282,--	配方-夾心巧克力	烹飪	80
			552283,--	配方-漿果蛋糕	烹飪	80
			552284,--	配方-蒜香麵包	烹飪	80
			552285,--	配方-漿果三明治	烹飪	80
			552286,--	配方-酥炸醃魚	烹飪	80
			552287--	配方-香煎肋排	烹飪	80
				}
	for RecipeList=1,table.getn(Recipe) do
		AddRecipe( OwnerID(), Recipe[RecipeList] )
	end

end
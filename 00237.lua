--================================================================--
--			一般商店
--================================================================--

--對話劇情統一掛 LuaS_ComShop
--初始劇情掛以下

function Zone23_items()		--雜貨
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600417, "Test_Shop_Close" );
end

function Zone23_potion()		--藥水
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600418, "Test_Shop_Close" );
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



--Lua_119288_RecipeList_Init --採草
--Lua_119289_RecipeList_Init --採礦
--Lua_119290_RecipeList_Init --伐木
--Lua_119087_RecipeList_Init --煉金
--Lua_119088_RecipeList_Init --烹飪


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
--Lua_119290_RecipeList_Init --伐木
--Lua_119087_RecipeList_Init --煉金
--Lua_119088_RecipeList_Init --烹飪

--================================================================--

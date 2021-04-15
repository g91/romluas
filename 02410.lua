
--對話劇情統一掛 LuaS_ComShop
--初始劇情掛以下
--鐵製武器
function Zone20_Weapon()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600325, "Test_Shop_Close" );
end
--木製武器
function Zone20_Carpenter()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600326, "Test_Shop_Close" );
end
--消耗性武器
function Zone20_Arrow()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600327, "Test_Shop_Close" );
end
--重甲--鎧、鎖
function Zone20_HeaveArmor()--盔甲
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600328, "Test_Shop_Close" );
end
--輕甲--皮
function Zone20_LightArmor()--盔甲
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600329, "Test_Shop_Close" );
end
--服飾--布
function Zone20_Cloth()--服飾
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600330, "Test_Shop_Close" );
end
--綜合武器
function Zone20_AllWeapon()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600331, "Test_Shop_Close" );
end
--鎧甲商人
function Zone20_HeaveArmor_A() --鎧甲
SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600332, "Test_Shop_Close" );
end
--鎖甲商人
function Zone20_HeaveArmor_B() --鎖甲
SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600333, "Test_Shop_Close" );
end

----SHOP
function Ashley_Zone20_Potion()--藥水
	SetMinimapIcon (OwnerID(),EM_MapIconType_Potion)
	SetShop(OwnerID(),600323,"Test_Shop_Close")
end

function Ashley_Zone20_Other()--雜貨
  	SetMinimapIcon(OwnerID(),EM_MapIconType_Shop)
	SetShop(OwnerID(),600324,"Test_Shop_Close")
end

function Ashley_Zone20_Meat_Shop() --肉品
	SetMinimapIcon(OwnerID(),EM_MapIconType_Mat)
	SetShop(OwnerID(),600322,"Test_Shop_Close")
end
--火靴地下堡壘精煉師
function Zone20_HighReFineStone() --五等精煉石
  	SetMinimapIcon(OwnerID(),EM_MapIconType_Shop)
	SetShop(OwnerID(),600343,"Test_Shop_Close")
end
--前哨站雜貨商，加賣任務道具
function Zone20_Outpost_Other()
  	SetMinimapIcon(OwnerID(),EM_MapIconType_Shop)
	SetShop(OwnerID(),600340,"Test_Shop_Close")
end
--================================================================--

-- 煉金材料商 LuaI_110993_shop()

-- 烹飪材料商 LuaI_110992_shop()

--================================================================--

-- 桌椅類家具商人 LuaFunc_Shop_HomeFT1

-- 床櫃類家具商人 LuaFunc_Shop_HomeFT2

-- 裝飾類家具商人 LuaFunc_Shop_HomeFT3

-- 空間類家具商人 LuaFunc_Shop_HomeFT4

-- 總合類家具商人 LuaFunc_Shop_HomeFT5
--================================================================--
--配方商人
--對話劇情可統一掛
function LuaS_ZONE20_Formula()
	local Obj = OwnerID()
	local Target = TargetID()
	LoadQuestOption(Obj)
	AddSpeakOption( Obj, Target, "[SO_FORMULA_STORE]" , "DW_OpenRecipeList", 0 )--我想看看你賣的配方。
end
--初始劇情掛--以下參考ZONE15
--打鐵--Lua_115954_RecipeList_Init
--木工--Lua_115957_RecipeList_Init
--製甲--Lua_115956_RecipeList_Init
--裁縫--Lua_115959_RecipeList_Init
--烹飪--Lua_115958_RecipeList_Init
--鍊金--Lua_115955_RecipeList_Init
--挖礦--Lua_115960_RecipeList_Init
--伐木--Lua_115961_RecipeList_Init
--採藥--Lua_115962_RecipeList_Init
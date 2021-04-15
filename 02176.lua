
function Zone19_Potion()--藥水
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion);
	SetShop( OwnerID() , 600249, "Test_Shop_Close" )
end

function Zone19_Other()--雜貨
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600261, "Test_Shop_Close" ); 
end

function Zone19_Stone()--精煉石
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600255, "Test_Shop_Close" ); 
end

function Zone19_Green()--蔬果
	SetShop( OwnerID() , 600264, "Test_Shop_Close" );
end

function Zone19_Weapon()--武器
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600251, "Test_Shop_Close" );
end

function Zone19_Armor()--盔甲
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600262, "Test_Shop_Close" );
end

function Zone19_Apparel()--服飾
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600263, "Test_Shop_Close" );
end

function Zone19_Meat_Shop() --肉品
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Mat );
	SetShop( OwnerID() , 600265 , "Test_Shop_Close" );
end
--================================================================--

-- 煉金材料商 LuaI_110993_shop()

-- 製甲材料商 LuaI_110994_shop()

-- 烹飪材料商 LuaI_110992_shop()

-- 打鐵材料商 LuaI_110997_shop()

-- 木工材料商 LuaI_110996_shop()

-- 裁縫材料商 LuaI_110995_shop()

--================================================================--
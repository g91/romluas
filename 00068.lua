--對話劇情統一掛 LuaS_ComShop
--初始劇情掛以下

function Zone_arcane_skill_A()		--初階技能
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600423, "Test_Shop_Close" );
end

function Zone_arcane_skill_B()		--高階技能
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600424, "Test_Shop_Close" );
end

function Zone_arcane_RuneStore_A()		--1.2階符文商店
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600425, "Test_Shop_Close" );
end

function Zone_arcane_RuneStore_B()		--3階符文商店
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600426, "Test_Shop_Close" );
end

function Zone_arcane_RewardStore()		--獎勵商店
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600427, "Test_Shop_Close" );
end

--導覽商店

function Zone_arcane_skill_preview_A()		--初階技能
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600432, "Test_Shop_Close" );
end

function Zone_arcane_skill_preview_B()		--高階技能
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600433, "Test_Shop_Close" );
end

function Zone_arcane_RuneStore_preview_A()		--1.2階符文商店
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600434, "Test_Shop_Close" );
end

function Zone_arcane_RuneStore_preview_B()		--3階符文商店
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600435, "Test_Shop_Close" );
end
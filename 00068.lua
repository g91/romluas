--��ܼ@���Τ@�� LuaS_ComShop
--��l�@�����H�U

function Zone_arcane_skill_A()		--�춥�ޯ�
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600423, "Test_Shop_Close" );
end

function Zone_arcane_skill_B()		--�����ޯ�
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600424, "Test_Shop_Close" );
end

function Zone_arcane_RuneStore_A()		--1.2���Ť�ө�
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600425, "Test_Shop_Close" );
end

function Zone_arcane_RuneStore_B()		--3���Ť�ө�
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600426, "Test_Shop_Close" );
end

function Zone_arcane_RewardStore()		--���y�ө�
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600427, "Test_Shop_Close" );
end

--�����ө�

function Zone_arcane_skill_preview_A()		--�춥�ޯ�
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600432, "Test_Shop_Close" );
end

function Zone_arcane_skill_preview_B()		--�����ޯ�
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600433, "Test_Shop_Close" );
end

function Zone_arcane_RuneStore_preview_A()		--1.2���Ť�ө�
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600434, "Test_Shop_Close" );
end

function Zone_arcane_RuneStore_preview_B()		--3���Ť�ө�
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600435, "Test_Shop_Close" );
end
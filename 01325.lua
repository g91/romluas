------------------------------------------------------------------------------------
-- �Z����
------------------------------------------------------------------------------------
-- ZONE12 �Z���ӤH
function ZONE12_SMITH_NEWBIE()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600144 , "Test_Shop_Close" ); --�X������
end

function ZONE12_SMITH()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600148, "Test_Shop_Close" ); --���椧�I
end

-- ZONE8 �Z���ӤH
function ZONE8_WEAPON_A()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600152 , "Test_Shop_Close" ); --�񤧶�
end

-- ZONE9 �Z���ӤH
function ZONE9_WEAPON_A()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600159 , "Test_Shop_Close" ); --�^����
end

------------------------------------------------------------------------------------
-- ���㩱
------------------------------------------------------------------------------------

-- ZONE12 ����ӤH
function  Zone12_Armor1_NEWBIE() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() ,600146, "Test_Shop_Close" );--�X�����ҪA
end
function  Zone12_Armor2_NEWBIE() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600145, "Test_Shop_Close" );--�X�����ҥ�
end

function  Zone12_Armor() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() ,600149, "Test_Shop_Close" );--���椧�I
end

--ZONE8 ����ӤH
function  Zone8_Armor_A() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() ,600153, "Test_Shop_Close" );--�񤧶��
end
function  Zone8_Armor_B() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() ,600154, "Test_Shop_Close" );--�񤧶�A
end

--ZONE9 ����ӤH
function  Zone9_Armor_A() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() ,600160, "Test_Shop_Close" );--�^������
end
function  Zone9_Armor_B() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() ,600161, "Test_Shop_Close" );--�^�����A
end

------------------------------------------------------------------------------------
-- ���f��
------------------------------------------------------------------------------------

-- ZONE12 ���f�ӤH
function ZONE12_GOODS_NEWBIE()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600143, "Test_Shop_Close" ); --�X������
end
function ZONE12_GOODS()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600147, "Test_Shop_Close" ); --���椧�I
end

-- ZONE8 ���~���Ĥ��ӤH
function ZONE8_GOODS()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion );
	SetShop( OwnerID() , 600151, "Test_Shop_Close" ); --�񤧶�
end
-- ZONE8 ���f�ӤH
function ZONE8_GOODS_WILD()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600155, "Test_Shop_Close" ); --��ͤ��a
end

-- ZONE9 ���~���Ĥ��ӤH
function ZONE9_GOODS()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion );
	SetShop( OwnerID() , 600158, "Test_Shop_Close" ); --�^����
end
-- ZONE9 ���f�ӤH
function ZONE9_GOODS_WILD()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600162, "Test_Shop_Close" ); --���ϩԳǤ��s
end

-- Zone9 �����
function LuaI_113526()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_AuctionHouse );
end
function LuaS_113526()
	LoadQuestOption( OwnerID() )
  	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_OPENAC") , "LuaS_110770_OpenAC" , 0 )	-- �}�ҥ����
end
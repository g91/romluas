------------------------------------------------------------------------------------
-- �Z����
------------------------------------------------------------------------------------
-- ZONE10 �Z���ӤH
function ZONE10_SMITH_SHOP_1()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600115 , "Test_Shop_Close" ); --�祱�S
end
-- ZONE10 �Z���ӤH
function ZONE10_SMITH_SHOP_2()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600123, "Test_Shop_Close" ); --�㺸��
end
-- ZONE10 �Z���ӤH
function ZONE10_SMITH_SHOP_3()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600124 , "Test_Shop_Close" ); --�㺸����
end
-- ZONE3 �Z���ӤH
function ZONE3_SMITH_SHOP_1()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600131, "Test_Shop_Close" );  --�o�󫰹�Z��
end
-- ZONE7 �Z���ӤH
function ZONE7_SMITH_SHOP_1()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() ,600138, "Test_Shop_Close" );  --�������Z��
end

------------------------------------------------------------------------------------
-- ���㩱
------------------------------------------------------------------------------------

-- ZONE10 ����ӤH
function  Zone10_Armor1_Shop() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600116 , "Test_Shop_Close" );--�祱�S��
end

-- ZONE10 ����ӤH
function Zone10_Armor2_Shop() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600117, "Test_Shop_Close" );--�祱�S�A
end

-- ZONE10 ����ӤH
function Zone10_Armor3_Shop() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600126 , "Test_Shop_Close" );--�㺸����
end

-- ZONE10 ����ӤH
function Zone10_Armor4_Shop()
   	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600125, "Test_Shop_Close" );--�㺸���A
end

-- ZONE11 ����ӤH
function Zone11_Armor1_Shop()
   	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600067, "Test_Shop_Close" );--�p�J���
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_SIT_BEGIN,ruFUSION_ACTORSTATE_SIT_LOOP)
	sleep(30)
end
-- ZONE3 ����ӤH
function Zone3_Armor1_Shop()
   	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600132, "Test_Shop_Close" );--�o�󫰹��
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_SIT_BEGIN,ruFUSION_ACTORSTATE_SIT_LOOP)
	sleep(30)
end
-- ZONE3 ����ӤH
function Zone3_Armor2_Shop()
   	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600133, "Test_Shop_Close" );--�o�󫰹�A
end

-- ZONE7 ����ӤH
function Zone7_Armor1_Shop()
   	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600139, "Test_Shop_Close" );--��������
end
-- ZONE7 ����ӤH
function Zone7_Armor2_Shop()
   	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600140, "Test_Shop_Close" );--�������A
end
------------------------------------------------------------------------------------
-- ���f��
------------------------------------------------------------------------------------

-- ZONE10 ���f�ӤH
function ZONE10_GOODS_SHOP_1()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600114, "Test_Shop_Close" ); --�祱�S
end
-- ZONE10 ���f�ӤH
function ZONE10_GOODS_SHOP_2()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600122 , "Test_Shop_Close" ); --�㺸��
end

-- ���`�۫e�W��
function LuaI_111095_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600111 , "Test_Shop_Close" );
end
-- �u�洵���ӫ~
function LuaI_111429_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600118 , "Test_Shop_Close" );
end

-- ZONE 3 
function ZONE3_GOODS_SHOP_1()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600130 , "Test_Shop_Close" ); --�o�󫰹�D��
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_SIT_BEGIN,ruFUSION_ACTORSTATE_SIT_LOOP)
	sleep(30)
end
-- ZONE 3 
function ZONE3_GOODS_SHOP_2()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Food );
	SetShop( OwnerID() , 600129 , "Test_Shop_Close" ); --�o�󫰹�s��
end
-- ZONE 7
function ZONE7_GOODS_SHOP_1()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion  );
	SetShop( OwnerID() , 600137 , "Test_Shop_Close" ); --�������D��
end
-- ZONE 7
function ZONE7_GOODS_SHOP_2()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600141 , "Test_Shop_Close" ); --���[��D��+���Y�Z��
end
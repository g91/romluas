------------------------------------------------------------------------------------
-- �Z����
------------------------------------------------------------------------------------
-- ZONE4 �Z���ӤH
function ZONE4_SMITH_SHOP_1()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600063 , "Test_Shop_Close" ); --���r��
end
-- ZONE4 �Z���ӤH
function ZONE4_SMITH_SHOP_2()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600064 , "Test_Shop_Close" ); --���s�ȩ�
end

-- ZONE5 �Z���ӤH
function ZONE5_SMITH_SHOP_1()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600071 , "Test_Shop_Close" ); --������
end
-- ZONE5 �Z���ӤH
function ZONE5_SMITH_SHOP_2()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600064 , "Test_Shop_Close" ); --�_�Ժ�
end

-- ���`�Z�������өʪZ��
function LuaI_110863_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600095 , "Test_Shop_Close" );
end

-- ���`�Z�����@��ʪZ��
function LuaI_110862_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600096 , "Test_Shop_Close" );
end

------------------------------------------------------------------------------------
-- ���㩱
------------------------------------------------------------------------------------

-- ZONE4����ӤH
function  Zone4_Armor1_Shop() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600067 , "Test_Shop_Close" );--���r����
end

-- ZONE4����ӤH
function Zone4_Armor2_Shop() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600065 , "Test_Shop_Close" );--���r���A
end

-- ZONE4����ӤH
function Zone4_Armor3_Shop() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600068 , "Test_Shop_Close" );--���s��
end

-- ZONE4����ӤH
function Zone4_Armor4_Shop()
   	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600066 , "Test_Shop_Close" );--���s�A
end

-- ZONE5����ӤH
function  Zone5_Armor1_Shop() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600075 , "Test_Shop_Close" );--��������
end

-- ZONE5����ӤH
function Zone5_Armor2_Shop() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600073 , "Test_Shop_Close" );--�����ҪA
end

-- ZONE5����ӤH
function Zone5_Armor3_Shop() 
 	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600076 , "Test_Shop_Close" );--�_�Ժ���
end

-- ZONE5����ӤH
function Zone5_Armor4_Shop()
   	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600074 , "Test_Shop_Close" );--�_�Ժ��A
end
-- ���`���㩱�����
function LuaI_110864_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600097 , "Test_Shop_Close" );
end

-- ���`���㩱�ܭ��P�ް�
function LuaI_110867_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600098 , "Test_Shop_Close" );
end

-- ���`���㩱�k�T��
function LuaI_110871_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600099 , "Test_Shop_Close" );
end

-- ���`���㩱�֥Ұ�
function LuaI_110868_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600100, "Test_Shop_Close" );
end

-- ���`���㩱��Ұ�
function LuaI_110866_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600101, "Test_Shop_Close" );
end

-- ���`���㩱�Z�Ұ�
function LuaI_110865_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor );
	SetShop( OwnerID() , 600102 , "Test_Shop_Close" );
end
------------------------------------------------------------------------------------
-- �Ĥ�
------------------------------------------------------------------------------------
-- ���`�]�k���Ĥ���
function LuaI_110870_shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion );
	SetShop( OwnerID() , 600105 , "Test_Shop_Close" );
end

------------------------------------------------------------------------------------
-- ���f��
------------------------------------------------------------------------------------

-- �_�ԯ���a���f�Ӷ���w
function LuaI_110039_shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop ); --���f��
	SetShop( OwnerID() , 600060 , "Test_Shop_Close" );
end
-- ZONE4 ���f�ӤH
function ZONE4_GOODS_SHOP_1()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600061, "Test_Shop_Close" ); --���r��
end
-- ZONE4 ���f�ӤH
function ZONE4_GOODS_SHOP_2()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600062 , "Test_Shop_Close" ); --���s�ȩ�
end
-- ZONE5 ���f�ӤH
function ZONE5_GOODS_SHOP_1()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600069, "Test_Shop_Close" ); --������
end
-- ZONE5 ���f�ӤH
function ZONE5_GOODS_SHOP_2()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600070 , "Test_Shop_Close" ); --�_�Ժ�
end
--���i�ԥj���ӤH
function HighBora_SHOP()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600128 , "Test_Shop_Close" ); --��O�J�䴩��
end

--���i�ԥj���ӤH
function HighBora_SHOP_2()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop );
	SetShop( OwnerID() , 600150 , "Test_Shop_Close" ); --��O�J�䴩��
end

--ZONE5
function LuaI_110276()
	SetShop( OwnerID() , 600077 , "Test_Shop_Close" ); --���Ԧh
end

--���i���i
function LuaI_110875()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion);
	SetShop( OwnerID() , 600107 , "Test_Shop_Close" )
end
-- �d�F�خ��ӪZ��
function LuaI_110404_shop()
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon );
	SetShop( OwnerID() , 600108 , "Test_Shop_Close" );
end

-- �d�F�خ��ӫ~
function LuaI_110940_shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion);
	SetShop( OwnerID() , 600109 , "Test_Shop_Close" );
end

-- �������p�ӤH
function LuaI_110939_shop()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_SIT_BEGIN,ruFUSION_ACTORSTATE_SIT_LOOP)
	sleep(30)
	SetShop( OwnerID() , 600110 , "Test_Shop_Close" );
end
------------------------------------------------------------------------------------
-- �Ķ����
------------------------------------------------------------------------------------
-- �Ҫ����ư�
function LuaI_110993_shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Mat );
	SetShop( OwnerID() , 600041 , "Test_Shop_Close" );
end

-- �s�ҧ��ư�
function LuaI_110994_shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Mat );
	SetShop( OwnerID() , 600042 , "Test_Shop_Close" );
end

-- �i�����ư�
function LuaI_110992_shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Mat );
	SetShop( OwnerID() , 600045 , "Test_Shop_Close" );
end

-- ���K���ư�
function LuaI_110997_shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Mat );
	SetShop( OwnerID() , 600103, "Test_Shop_Close" );
end

-- ��u���ư�
function LuaI_110996_shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Mat );
	SetShop( OwnerID() , 600104 , "Test_Shop_Close" );
end

-- ���_���ư�
function LuaI_110995_shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Mat );
	SetShop( OwnerID() , 600106 , "Test_Shop_Close" );
end


------------------------------------------------------------------------------------

-- ������a��ӤH
function LuaFunc_Shop_HomeFT1()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop )
   	SetShop( OwnerID() , 600087 , "Test_Shop_Close" );
end
-- ���d���a��ӤH
function LuaFunc_Shop_HomeFT2()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop )
   	SetShop( OwnerID() , 600089 , "Test_Shop_Close" );
end
-- �˹����a��ӤH
function LuaFunc_Shop_HomeFT3()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop )
   	SetShop( OwnerID() , 600090 , "Test_Shop_Close" );
end
-- �Ŷ����a��ӤH
function LuaFunc_Shop_HomeFT4()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop )
   	SetShop( OwnerID() , 600091 , "Test_Shop_Close" );
end
-- �`�X���a��ӤH
function LuaFunc_Shop_HomeFT5()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Shop )
   	SetShop( OwnerID() , 600092 , "Test_Shop_Close" );
end

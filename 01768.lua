function bk_Hsiang_ExchangeStone_shop()-------------------------------------------------�]�w���������
---	SetMinimapIcon ( OwnerID(), 102 );------------------------�]�w���������
	LoadQuestOption( OwnerID() )---------------------�g�J�H���ԭz
	AddSpeakOption( OwnerID(), TargetID(), "[SO_WANTBUY]", "bk_Hsiang_ExchangeStone_open", 0 )
end
function bk_Hsiang_ExchangeStone_open()
	CloseSpeak( OwnerID() )-----------��������
	BeginPlot( OwnerID() ,"bk_Hsiang_ExchangeStone_8_10",0)
end
function bk_Hsiang_ExchangeStone_8_10()--------------�}��8-10��ҫ�
	OpenMagicStoneShop(207004,10, 8000 , 30 )
end
function bk_shop_114821()
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/�ڷQ�ݬݧA�檺�F��
end

function bk_Weapon_Shop_zone7()--------------------------------²������Z��
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600201 , "Test_Shop_Close" )
end
function bk_Goods_Shop_zone7()--------------------------------²��������~
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion )
	SetShop( OwnerID() , 600199 , "Test_Shop_Close" )
end
function bk_Armor_Shop_zone7()--------------------------------²������˳�
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor  )
	SetShop( OwnerID() , 600200 , "Test_Shop_Close" );
end
function bk_food_shop_zone7()--------------------------------²������Ĥ�����
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion )
	SetShop( OwnerID() , 600202 , "Test_Shop_Close" );
end
function bk_insArmor_Shop_zone7()--------------------------------²������M�˸˳�
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor  )
	SetShop( OwnerID() , 600207 , "Test_Shop_Close" );
end

function bk_Weapon_Shop_zone8()--------------------------------²�����Z��	
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600203 , "Test_Shop_Close" )
end
function bk_Goods_Shop_zone8()--------------------------------²�������~
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion )
	SetShop( OwnerID() , 600205 , "Test_Shop_Close" )
end
function bk_Armor_Shop_zone8()--------------------------------²�����˳�
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor  )
	SetShop( OwnerID() , 600204 , "Test_Shop_Close" )
end
function bk_food_shop_zone8()--------------------------------²�����Ĥ�����
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion )
	SetShop( OwnerID() , 600206 , "Test_Shop_Close" )
end
function bk_insArmor_Shop_zone8()--------------------------------²�����˳�
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor  )
	SetShop( OwnerID() , 600208 , "Test_Shop_Close" )
end
function bk_206880_3_5()
	local player=OwnerID()
	local need=1
	local needbag=Check_Bag_Space( player , need  )
	local Luck=DW_Rand(100)
	if (Luck >= 0 and Luck < 33) then
		YOYO_GetTokenValue( 2, 3);--�j�N��
	elseif (Luck >= 33 and Luck < 66) then 
		YOYO_GetTokenValue( 2, 4);--�j�N��
	elseif (Luck >= 66 and Luck < 101) then 
		YOYO_GetTokenValue( 2, 5);--�j�N��
	end
end
function bk_207052_5_8()
	local player=OwnerID()
	local need=1
	local needbag=Check_Bag_Space( player , need  )
	local Luck=DW_Rand(100)
	if (Luck >= 0 and Luck < 25) then
		YOYO_GetTokenValue( 2, 5);--�j�N��
	elseif (Luck >= 25 and Luck < 50) then 
		YOYO_GetTokenValue( 2, 6);--�j�N��
	elseif (Luck >= 50 and Luck < 75) then 
		YOYO_GetTokenValue( 2, 7);--�j�N��
	elseif (Luck >= 75 and Luck < 101) then 
		YOYO_GetTokenValue( 2, 8);--�j�N��
	end
end
function bk_207053_9_12()
	local player=OwnerID()
	local need=1
	local needbag=Check_Bag_Space( player , need  )
	local Luck=DW_Rand(100)
	if (Luck >= 0 and Luck < 25) then
		YOYO_GetTokenValue( 2, 9);--�j�N��
	elseif (Luck >= 25 and Luck < 50) then 
		YOYO_GetTokenValue( 2, 10);--�j�N��
	elseif (Luck >= 50 and Luck < 75) then 
		YOYO_GetTokenValue( 2, 11);--�j�N��
	elseif (Luck >= 75 and Luck < 101) then 
		YOYO_GetTokenValue( 2, 12);--�j�N��
	end
end
function bk_gold1_shop_zone7()-------------------------------�����ӫ����~
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion )
	SetShop( OwnerID() , 600215 , "Test_Shop_Close" )
end
function bk_gold2_shop_zone7()-------------------------------�����ӫ����~
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion )
	SetShop( OwnerID() , 600216 , "Test_Shop_Close" )
end

function bk_Weapon_Shop_zone15()-----15�N���Z��
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600219 , "Test_Shop_Close" )
end
function bk_Goods_Shop_zone15()-----15�˳ƬO�~
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion )
	SetShop( OwnerID() , 600220 , "Test_Shop_Close" )
end
function bk_food_shop_zone15()--------------------------------15�Ĥ�����
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion )
	SetShop( OwnerID() , 600206 , "Test_Shop_Close" )
end
--Zone16
function Az_Armor_Shop_zone16()-----------------------------�v�޳�����
	SetMinimapIcon(OwnerID(),EM_MapIconType_Armor)-------�p�a��ICON�]�w�������
	SetShop(OwnerID(),600221,"Test_Shop_Close");
end

function Az_food_shop_zone16()------------------------------�v�޳��Ĥ�
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion )-------�p�a��ICON�]�w���D���
	SetShop( OwnerID() , 600206 , "Test_Shop_Close" )
end

function Az_Goods_Shop_zone16()------------------------------�v�޳����~
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion )-------�p�a��ICON�]�w���D���
	SetShop( OwnerID() , 600223 , "Test_Shop_Close" )
end

--Zone17

function Az_food_shop_zone17()------------------------------���¯����Ĥ�
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion )-------�p�a��ICON�]�w���D���
	SetShop( OwnerID() , 600242 , "Test_Shop_Close" )
end

function Az_Recipe_shop_zone17()------------------------------���¯����t��
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Potion )-------�p�a��ICON�]�w���D���
	SetShop( OwnerID() , 600241 , "Test_Shop_Close" )
end

function Az_Armor_Shop_Zone17()								--���¯�������
	SetMinimapIcon(OwnerID(),EM_MapIconType_Armor)			--�p�a��ICON�]�w�������
	SetShop(OwnerID(),600243,"Test_Shop_Close")				
end

function Az_Weapon_Shop_Zone17()							--���¯����Z��
	SetMinimapIcon(OwnerID(),EM_MapIconType_Weapon)		--�Z����
	SetShop(OwnerID(),600244,"Test_Shop_Close")		
end
	
function Az_StoneExchange_10_12()								--10~12�����
	OpenMagicStoneShop(207004,12,20000,100)
end

function Az_StoneExchange_open()								--�}�Һ���۵���
	CloseSpeak( OwnerID() )
	BeginPlot( OwnerID() ,"Az_StoneExchange_10_12",0)
end

function Az_StoneExchange_Zone17()								--Zone17�����
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SO_WANTBUY]","Az_StoneExchange_open",0)
end

function Az_Armor_Shop_Zone18()								--�d�U�J���Ө���
	SetMinimapIcon(OwnerID(),EM_MapIconType_Armor)			--�p�a��ICON�]�w�������
	SetShop(OwnerID(),600222,"Test_Shop_Close")				
end
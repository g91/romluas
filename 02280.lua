----------------ZONE19------------------------
function cl_Hsiang_ExchangeStone_shop()-------------------------------------------------�添�ѥ۪�
	LoadQuestOption( OwnerID() )---------------------�g�J�H���ԭz
	AddSpeakOption( OwnerID(), TargetID(), "[SO_WANTBUY]", "cl_Hsiang_ExchangeStone_open", 0 )
end
function cl_Hsiang_ExchangeStone_open()
	CloseSpeak( OwnerID() )-----------��������
	BeginPlot( OwnerID() ,"cl_Hsiang_ExchangeStone_11_13",0)
end
function cl_Hsiang_ExchangeStone_11_13()--------------�}��8-10��ҫ�
	OpenMagicStoneShop(207004,13, 22400 , 140 )
end
function cl_shop_117669() ---��Z����
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/�ڷQ�ݬݧA�檺�F��
end
function cl_Armor_Shop_zone19()--------------------------------²���ԤҸ˳�
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600270 , "Test_Shop_Close" )
end
function cl_shop_117670() ---��t�誺
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/�ڷQ�ݬݧA�檺�F��
end
function cl_Formula_Shop_zone19()--------------------------------�氪�Űt�誺
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600271 , "Test_Shop_Close" )
end
function cl_shop_117668() ---���Ĥ���
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/�ڷQ�ݬݧA�檺�F��
end
function cl_food_Shop_zone19()--------------------------------�氪���Ĥ���
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600272 , "Test_Shop_Close" )
end

function cl_World_warshop_118202() ---��Z����
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/�ڷQ�ݬݧA�檺�F��
end
function cl_World_war_Shop_zone19()--------------------------------²���ԤҸ˳�
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600321 , "Test_Shop_Close" )
end
function cl_shop_120542_NewWeapon() ---��Z����
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/�ڷQ�ݬݧA�檺�F��
end
function cl_Armor_Shop_zone19_NewWeapon()--------------------------------²���ԤҸ˳�
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600224 , "Test_Shop_Close" )
end
---------ZONE20------------------------
function cl_Hsiang20_ExchangeStone_shop()-------------------------------------------------�添�ѥ۪�
	LoadQuestOption( OwnerID() )---------------------�g�J�H���ԭz
	AddSpeakOption( OwnerID(), TargetID(), "[SO_WANTBUY]", "cl_Hsiang20_ExchangeStone_open", 0 )
end
function cl_Hsiang20_ExchangeStone_open()
	CloseSpeak( OwnerID() )-----------��������
	BeginPlot( OwnerID() ,"cl_Hsiang20_ExchangeStone_11_13",0)
end
function cl_Hsiang20_ExchangeStone_11_13()--------------�}��8-10��ҫ�
	OpenMagicStoneShop(207004,13, 22400 , 140 )
end
function cl_shop20_118889() ---�歹���Ĥ���
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/�ڷQ�ݬݧA�檺�F��
end
function cl_food_Shop_zone20()--------------------------------�歹���Ĥ���
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600341 , "Test_Shop_Close" )
end
function cl_shop20_118890() ---��˳ƪ�
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/�ڷQ�ݬݧA�檺�F��
end
function cl_Armor_Shop20_zone20()--------------------------------��˳ƪ�
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600342 , "Test_Shop_Close" )
end
---------------------Z21�¦⬼�y�ө�----------------------------
function cl_Hsiang21_ExchangeStone_shop()-------------------------------------------------�添�ѥ۪�
	LoadQuestOption( OwnerID() )---------------------�g�J�H���ԭz
	AddSpeakOption( OwnerID(), TargetID(), "[SO_WANTBUY]", "cl_Hsiang21_ExchangeStone_open", 0 )
end
function cl_Hsiang21_ExchangeStone_open()
	CloseSpeak( OwnerID() )-----------��������
	BeginPlot( OwnerID() ,"cl_Hsiang21_ExchangeStone_12_14",0)
end
function cl_Hsiang21_ExchangeStone_12_14()--------------�}��8-10��ҫ�
	OpenMagicStoneShop(207004,14, 22400 , 180 )
end
function cl_shop21_119206() ---��˳ƪ�
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/�ڷQ�ݬݧA�檺�F��
end
function cl_Armor_Shop_zone21()--------------------------------��˳ƪ�
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600358 , "Test_Shop_Close" )
end
function cl_shop21_119207() ---��Z����
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/�ڷQ�ݬݧA�檺�F��
end
function cl_Weapon_Shop_zone21()--------------------------------��Z����
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600359 , "Test_Shop_Close" )
end
function cl_shop21_119209() ---���Ĥ���
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/�ڷQ�ݬݧA�檺�F��
end
function cl_food_Shop21_zone19()--------------------------------���Ĥ���
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600357 , "Test_Shop_Close" )
end

function cl_Formula21_119208() ---��t��
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/�ڷQ�ݬݧA�檺�F��
end
function cl_Formula_Shop_zone21()--------------------------------��t��
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600360 , "Test_Shop_Close" )
end
function cl_shop21_120543_NewWeapon() ---��Z����
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/�ڷQ�ݬݧA�檺�F��
end
function cl_Weapon_Shop_zone21_NewWeapon()--------------------------------��Z����
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600389 , "Test_Shop_Close" )
end
-------------------------------------Z22�ë�k�}
function cl_Hsiang22_ExchangeStone_shop()-------------------------------------------------�添�ѥ۪�
	LoadQuestOption( OwnerID() )---------------------�g�J�H���ԭz
	AddSpeakOption( OwnerID(), TargetID(), "[SO_WANTBUY]", "cl_Hsiang22_ExchangeStone_open", 0 )
end
function cl_Hsiang22_ExchangeStone_open()
	CloseSpeak( OwnerID() )-----------��������
	BeginPlot( OwnerID() ,"cl_Hsiang22_ExchangeStone_12_14",0)
end
function cl_Hsiang22_ExchangeStone_12_14()--------------�}��8-10��ҫ�
	OpenMagicStoneShop(207004,14, 22400 , 180 )
end

function cl_shop22_120353() ---��˳ƪ�
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/�ڷQ�ݬݧA�檺�F��
end
function cl_Armor_Shop_zone22()--------------------------------��˳ƪ�
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600379 , "Test_Shop_Close" )
end

function cl_shop22_120354() ---��Z����
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/�ڷQ�ݬݧA�檺�F��
end
function cl_Weapon_Shop_zone22()--------------------------------��Z����
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600380 , "Test_Shop_Close" )
end

function cl_shop22_120355() ---���Ĥ���
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/�ڷQ�ݬݧA�檺�F��
end
function cl_food_Shop22_zone22()--------------------------------���Ĥ���
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600378 , "Test_Shop_Close" )
end
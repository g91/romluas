------------------------------------------------------------------------------------
-- �Ȧ�B�H�c�B����
------------------------------------------------------------------------------------
-- �t_�Ȧ�_�]�w (�b�t�Τ����̭�)
--function Sys_Bank_Auto()
--	SetMinimapIcon ( OwnerID(), EM_MapIconType_Bank );
--	SetPlot( OwnerID() , "Touch" , "Sys_Bank_Open" , 50 );
--end

-- �H�c
function MyOpenMailInit()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_MailBox );
	SetPlot( OwnerID() , "Touch" , "MyOpenMail" , 50 ); 
end
-- �H�c+�ϥ�
function NewMyOpenMailInit()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_MailBox );
	SetPlot( OwnerID() , "Touch" , "MyOpenMail" , 50 );
	AddBuff(  OwnerID()  , 623300, 1, -1)  
end
function LuaI_110771()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_MailBox );
end

-- ����
function MyOpenACInit()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_AuctionHouse );
	SetPlot( OwnerID() , "Touch" , "MyOpenAC" , 50 );
end
function LuaI_110770()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_AuctionHouse );
end
------------------------------------------------------------------------------------
-- �ǰe�����I
------------------------------------------------------------------------------------
-- 110561_�ǰe�v����
function Lua_110561_shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_FlightPoint );
end

-- 110591_�ǰe�v�J�Q����
function Lua_110591_mark()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_FlightPoint );
	SetPlot( OwnerID(),"range","LuaS_110591_Intro" , 25 );
end

-- 110592_�ǰe�v�ک�
function Lua_110592_mark()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_FlightPoint );
end

-- 110710_�ǰe�v�ȯ�
function Lua_110710_mark()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_FlightPoint );
end

-- 110725_�ǰe�v��Ȩ�
function Lua_110725_mark()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_FlightPoint );
end

-- 110726_�ǰe�v�R��
function Lua_110726_mark()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_FlightPoint );
end

-- 110727_�ǰe�v����
function Lua_110727_mark()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_FlightPoint );
end

-- 110728_�ǰe�v����
function Lua_110728_mark()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_FlightPoint );
end

-- 110755_�ǰe�v����
function Lua_110755_mark()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_FlightPoint );
end

-- 110805_�ǰe�v����
function Lua_110805_mark()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_FlightPoint );
end

------------------------------------------------------------------------------------
-- �t��
------------------------------------------------------------------------------------
-- ���q�t��(�Ǯ{/�u�K)
function LuaFunc_Shop_Mine_A()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
	SetShop( OwnerID() , 600052 , "Test_Shop_Close" );
end

-- ���K�t��(�Ǯ{/�u�K)
function LuaFunc_Shop_Smith_A()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
   	SetShop( OwnerID() , 600046 , "Test_Shop_Close" );
end

-- ���t��(�Ǯ{/�u�K)
function LuaFunc_Shop_Lumb_A()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
	SetShop( OwnerID() , 600053, "Test_Shop_Close" );
end

-- ���İt��(�Ǯ{/�u�K)
function LuaFunc_Shop_Herb_A()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
	SetShop( OwnerID() , 600054, "Test_Shop_Close" );
end

-- ��u�t��(�Ǯ{/�u�K)
function LuaFunc_Shop_Carpenter_A()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
   	SetShop( OwnerID() , 600047 , "Test_Shop_Close" );
end

-- �s�Ұt��(�Ǯ{/�u�K)
function LuaFunc_Shop_MakeArmor_A()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
   	SetShop( OwnerID() , 600048 , "Test_Shop_Close" );
end

-- ���_�t��(�Ǯ{/�u�K)
function LuaFunc_Shop_Tailor_A()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
   	SetShop( OwnerID() , 600049 , "Test_Shop_Close" );
end

-- �Ҫ��t��(�Ǯ{/�u�K)
function LuaFunc_Shop_Alchemy_A()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
   	SetShop( OwnerID() , 600051 , "Test_Shop_Close" );
end

-- �i���t��(�Ǯ{/�u�K)
function LuaFunc_Shop_Cook_A()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
   	SetShop( OwnerID() , 600050 , "Test_Shop_Close" );
end
-- ���q�t��(�M��/�j�v)
function LuaFunc_Shop_Mine_B()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
	SetShop( OwnerID() , 600084 , "Test_Shop_Close" );
end

-- ���K�t��(�M��/�j�v)
function LuaFunc_Shop_Smith_B()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
   	SetShop( OwnerID() , 600078 , "Test_Shop_Close" );
end

-- ���t��(�M��/�j�v)
function LuaFunc_Shop_Lumb_B()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
	SetShop( OwnerID() , 600085 , "Test_Shop_Close" );
end

-- ���İt��(�M��/�j�v)
function LuaFunc_Shop_Herb_B()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
	SetShop( OwnerID() , 600086, "Test_Shop_Close" );
end

-- ��u�t��(�M��/�j�v)
function LuaFunc_Shop_Carpenter_B()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
   	SetShop( OwnerID() , 600079 , "Test_Shop_Close" );
end

-- �s�Ұt��(�M��/�j�v)
function LuaFunc_Shop_MakeArmor_B()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
   	SetShop( OwnerID() , 600080, "Test_Shop_Close" );
end

-- ���_�t��(�M��/�j�v)
function LuaFunc_Shop_Tailor_B()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
   	SetShop( OwnerID() , 600081 , "Test_Shop_Close" );
end

-- �Ҫ��t��(�M��/�j�v)
function LuaFunc_Shop_Alchemy_B()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
   	SetShop( OwnerID() , 600083 , "Test_Shop_Close" );
end

-- �i���t��(�M��/�j�v)
function LuaFunc_Shop_Cook_B()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Recipe )
   	SetShop( OwnerID() , 600082, "Test_Shop_Close" );
end

-- �s����q�ɮv
function LuaInit_110469()
	SetMinimapIcon( OwnerID(), EM_MapIconType_Recipe );
	SetShop( OwnerID() , 600020 , "Test_Shop_Close" );
end

-- �s����ɮv
function LuaInit_110470()
	SetMinimapIcon( OwnerID(), EM_MapIconType_Recipe );
	SetShop( OwnerID() , 600022 , "Test_Shop_Close" );
end

-- �s����ľɮv
function LuaInit_110471()
	SetMinimapIcon( OwnerID(), EM_MapIconType_Recipe );
	SetShop( OwnerID() , 600023 , "Test_Shop_Close" );
end

-- �s�⥴�K�ɮv
function LuaInit_110597()
	SetMinimapIcon( OwnerID(), EM_MapIconType_Recipe );
	SetShop( OwnerID() , 600019 , "Test_Shop_Close" );
end

-- �s���u�ɮv
function LuaInit_110598()
	SetMinimapIcon( OwnerID(), EM_MapIconType_Recipe );
	SetShop( OwnerID() , 600024 , "Test_Shop_Close" );
end

-- �s��Ҫ��ɮv
function LuaInit_110599()
	SetMinimapIcon( OwnerID(), EM_MapIconType_Recipe );
	SetShop( OwnerID() , 600027 , "Test_Shop_Close" );
end

------------------------------------------------------------------------------------
-- �e�U����
------------------------------------------------------------------------------------
function LuaI_RepeatQuest()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_TrustQuest );
end
------------------------------------------------------------------------------------
-- ���M����
------------------------------------------------------------------------------------
function LuaI_Mount_Shop()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Bank ); --�N��
	SetShop( OwnerID() , 600056 , "Test_Shop_Close" );
end

function LuaI_Mount_Shop2()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Bank ); --�N��
	SetShop( OwnerID() , 600093 , "Test_Shop_Close" );
end

function LuaI_Mount_Shop3()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Bank ); --�N��
	SetShop( OwnerID() , 600094 , "Test_Shop_Close" );
end
-----------------------------------------------------------------------------------------
--���ѥ۰ө�
-----------------------------------------------------------------------------------------
function LuaI_MeltStone()
	SetShop( OwnerID() ,600113, "Test_Shop_Close" );
end
--��ҥ۰ө�
-----------------------------------------------------------------------------------------
function LuaI_ReFineStone()
	SetShop( OwnerID() ,600058, "Test_Shop_Close" );
end
-----------------------------------------------------------------------------------------
function LuaI_HighReFineStone()
	SetShop( OwnerID() ,600164, "Test_Shop_Close" );
end

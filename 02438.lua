function LuaS_ying_240181_shop() --�����Ŷꨩ�I���S�Ƹ�

	LoadQuestOption( OwnerID() ) --�A�n�A�ڬO�����ūؿv�ӷ|�ҥj�ժ��j�媫�Ǫ̡DXXX
	AddSpeakOption( OwnerID() , TargetID() , "[SC_240181_SHOP_02]", "LuaS_ComShop_1" , 0 ) --�ڷQ�ݬݧI�������~
end
----------------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_ying_shop01() --�Z�ҧI����

	SetMinimapIcon ( OwnerID() , EM_MapIconType_Armor  ) --�p�a�����
	SetShop( OwnerID() , 600347 , "Test_Shop_Close" ) --�Z��
end
----------------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_ying_shop02() --��ҧI����

	SetMinimapIcon ( OwnerID() , EM_MapIconType_Armor  ) --�p�a�����
	SetShop( OwnerID() , 600348 , "Test_Shop_Close" ) --���
end
----------------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_ying_shop03() --�֥ҧI����

	SetMinimapIcon ( OwnerID() , EM_MapIconType_Armor  ) --�p�a�����
	SetShop( OwnerID() , 600349 , "Test_Shop_Close" ) --�֥�
end
----------------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_ying_shop04() --�k�T�I����

	SetMinimapIcon ( OwnerID() , EM_MapIconType_Armor  ) --�p�a�����
	SetShop( OwnerID() , 600350 , "Test_Shop_Close" ) --�k�T
end
----------------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_ying_shop05() --����I����

	SetMinimapIcon ( OwnerID() , EM_MapIconType_Armor  ) --�p�a�����
	SetShop( OwnerID() , 600351 , "Test_Shop_Close" ) --����
end
----------------------------------------------------------------------------------------------------------------------------------------------------
function Hao_Phirius_Shell_Store()	--�@�ɵ��~�I����

	local Player = OwnerID()	-- Player
	local Npc = TargetID()	-- Npc
	AdjustFaceDir( Npc , Player , 0 ) --���V
	CloseShop( Npc )
	CloseSpeak( Player )
	SetSpeakDetail( Player , "[SC_240181_SHOP_01]"   )	-- ��ܼ@��
	AddSpeakOption( Player , Npc , "[AC_ITEMTYPENAME_2]" , "Hao_Phirius_Shell_Store_01", 5 )	-- �ɵ��~�I��
end

function Hao_Phirius_Shell_Store_01()

	local Player = OwnerID()
	local Npc = TargetID()
	SetShop( Npc , 600397 , "" )
	CloseSpeak( Player )
	OpenShop()
end
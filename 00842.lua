
--���Y�t��npc
function lua_mika_relationshop01() -- ���bnpc��l��ܼ@��
	SetSpeakDetail( OwnerID(), "[SC_RELATION_NPC01]" ) -- �Q�n�P�B�ͫإߧ�˱K�����Y�ܡH...
	AddSpeakOption( OwnerID(), TargetID(),"[SC_RELATION_INTRO_01]" , "lua_mika_relationintro_01" , 0 )  --���Y�t�Τ���
	AddSpeakOption( OwnerID(), TargetID(),"[SC_RELATION_NPC02]" , "lua_mika_relationshop02" , 0 )
end

function lua_mika_relationshop02()
	CloseSpeak( OwnerID() )	-- ������ܵ���
	OpenShop()
end

function lua_mika_relationshopset() --���bnpc���󲣥ͼ@��
	SetMinimapIcon( OwnerID(), EM_MapIconType_Shop )
	SetShop( OwnerID() , 600225 , "Test_Shop_Close" )
end

--���Y�t�Τ���
function lua_mika_relationintro_01()
	SetSpeakDetail( OwnerID(), "[SC_RELATION_INTRO_01_1]" ) -- ���Y�������]�A:���͡B�ˤH�B���H�B�v�{�B�ҩd���C
	AddSpeakOption( OwnerID(), TargetID(),"[SC_RELATION_INTRO_02]" , "lua_mika_relationintro_02" , 0 )  --�p��M���a���߯S�����Y�H
	AddSpeakOption( OwnerID(), TargetID(),"[SC_RELATION_INTRO_03]" , "lua_mika_relationintro_03" , 0 )  --�p��M���a���ߤҩd���Y�H
	AddSpeakOption( OwnerID(), TargetID(),"[SC_RELATION_INTRO_04]" , "lua_mika_relationintro_04" , 0 )  --�p�󴣤����Y���šH
end

function lua_mika_relationintro_02()  --�p��M���a���߯S�����Y�H
	SetSpeakDetail( OwnerID(), "[SC_RELATION_INTRO_02_1]" ) -- (1) �Х���n�Q�n�P�A�������Y����H�A�èM�w�������Y�������C...
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_relationintro_01", 0 ) --�^��W�@�h
end

function lua_mika_relationintro_03()  --�p��M���a���ߤҩd���Y�H
	SetSpeakDetail( OwnerID(), "[SC_RELATION_INTRO_03_1]" ) -- (1) �Х���n�Q�n�P�A���ߤҩd���Y����H�C...
	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_112698_34]" , " lua_mika_relationintro_03_2", 0 ) --�U�@��
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_relationintro_01", 0 ) --�^��W�@�h
end

function lua_mika_relationintro_03_2()  --�p��M���a���ߤҩd���Y�H
	SetSpeakDetail( OwnerID(), "[SC_RELATION_INTRO_03_2]" ) -- (4) �����W�z�����A�вզ���H�����B�ú޲z����z�ӽе��B�C...
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_relationintro_01", 0 ) --�^��W�@�h
end

function lua_mika_relationintro_04()  --�p�󴣤����Y���šH
	SetSpeakDetail( OwnerID(), "[SC_RELATION_INTRO_04_1]" ) -- �P�����Y�����a�ն����Ǯɷ|�W�[���Y�g��...
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_relationintro_01", 0 ) --�^��W�@�h
end
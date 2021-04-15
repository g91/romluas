--���@�`����NPC

function Lua_mika_thankday_npc01()
	LoadQuestOption( OwnerID() ) --Ū��npc����
	SetSpeakDetail( OwnerID(), "[SC_THANKSGIVING_2010_NPC06]"   )  
	AddSpeakOption( OwnerID(), TargetID(), "[SC_THANKSGIVING_04]" , "Lua_Hao_thanksday_about1", 0 ) --�ڷQ���D���@�`���ѨӡCok

	local Language = GetServerDataLanguage() 
--	if Language ~= "rw" then  -- �x���M�ݨS�����m�ﶵ  ���ե�
	if Language ~= "tw" then  -- �x���M�ݨS�����m�ﶵ  ������
		AddSpeakOption( OwnerID(), TargetID(), "[SC_THANKSGIVING_2010_NPC04]" , "Lua_mika_thankday_npc03", 0 ) --�ڷQ�I��[208292]  --���@�`���m��
	end
end

function Lua_mika_thankday_npc03() --�ڷQ�I�����@�`���m��
	SetSpeakDetail( OwnerID(), "[SC_THANKSGIVING_2010_NPC05]"   )  --...�I��[208292]�u�ݭn<CB>1��[202904]</CB>...
	AddSpeakOption( OwnerID(), TargetID(), "[SC_0908SEANSON_65]" , "Lua_mika_thankday_npc04", 0 ) --�T�w
--	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_thankday_npc01", 0 ) --�^��W�@�h
end

function Lua_mika_thankday_npc04() --�T�w�I�����m��
	CloseSpeak(OwnerID())
	local item = CountBodyItem(OwnerID(), 202904 )  --�ǰe���Ť�
	if item >= 1 then
		GiveBodyItem(OwnerID(), 208292, 2 ) --���m��x2
		DelBodyItem(OwnerID(), 202904, 1 ) -- �ǰe���Ť�x1
	else
		ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_112503_NO]" , 0 )  --�A�ҫ������~�ƶq������I
		ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_112503_NO]" , 0 )  --�A�ҫ������~�ƶq������I
	end
end

function lua_mika_thankday_npcgive()  --���U���� ����@��
	local getfood = CheckFlag(TargetID(), 544418 ) -- ���ѻ�L�}��
	local box = CountBodyItem(TargetID(), 208288 ) --�Ф򦬶���
	if getfood ==false then -- �p�G�S��getfood flag
		GiveBodyItem(TargetID(), 208289, 10) --�b�k�}��X10
		Setflag(TargetID(), 544418 , 1) --��FLAG
	end
	if box == 0 then -- �p�G�S��box
		GiveBodyItem(TargetID(), 208288, 1) --�Ф򦬶���x1
	end
end

function lua_mika_thankday_reward() --�������� ���������Ĥ�
	GiveBodyItem(TargetID(), 724419, 1) --�������Ĥ�
	Setflag(TargetID(), 544560 , 1) --����������KEYITEM
end
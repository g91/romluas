--��s�`�|��H 
--����c
function Lua_mika_Bearfestval_moon()
	SetFlag( TargetID() , 543324 , 1 ) --�������ȫᵹflag
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_Bearfestval_serve()
	PlayMotion( TargetID(), 118) --Cast��t
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_01]"   )  --�n�ӳܪM��������s�ܡH
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_02]" , "Lua_mika_Beerfestval_about", 0 ) --�ڷQ���D��s�`���ѨӡC
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_03]" , "Lua_mika_Beerfestval_01", 0 ) --���� ����c��sDIY
--	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_04]" , "Lua_mika_Beerfestval_02", 0 ) --���� �@�P�ɥά��s�a
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_05]" , "Lua_mika_Beerfestval_03", 0 ) --���� ��s�j�v
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_06]" , "Lua_mika_Beerfestval_04", 0 ) --���� �A�ȥͪ��@��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_29]" , "Lua_mika_Beerfestval_05", 0 ) --�ڷQ�I�����y

	local Language = GetServerDataLanguage() 
--	if Language ~= "rw" then  -- �x���M�ݨS�����m�ﶵ  ���ե�
	if Language ~= "tw" then  -- �x���M�ݨS�����m�ﶵ  ������
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_53]" , "Lua_mika_Beerfestval_07", 0 ) --�ڷQ�I��[205943]
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_Beerfestval_about() -- �ڷQ���D��s�`���ѨӡC
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_07]"   )  --���ʤ��e����
	AddSpeakOption(OwnerID(), TargetID(), "[SC_111490_DIALOG7_2]" , "Lua_mika_Beerfestval_06", 0 ) --�M��O
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_Beerfestval_06() -- �ڷQ���D��s�`���ѨӡC
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_07_01]"   )  --���ʤ��e����
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Bearfestval_serve", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_Beerfestval_07() -- �ڷQ�I��[205943]
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_54]"   )  --���ʤ��e����
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_55]" , "Lua_mika_Beerfestval_ticket01", 0 ) --�ڭn��<CB>100��[205891]</CB>�P<CB>100��[205892]</CB>�I��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_56]" , "Lua_mika_Beerfestval_ticket02", 0 ) --�ڭn��<CB>1��[202904]</CB>�I��
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Bearfestval_serve", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_Beerfestval_ticket01()  --�ڭn��100�Ӭc�l�P100�Ӱ�s�å����I��
	local item1 = CountBodyItem(OwnerID(), 205891 ) 
	local item2 = CountBodyItem(OwnerID(), 205892 ) 
	if item1 >= 100 and item2 >= 100 then
		DelBodyItem( OwnerID(), 205891, 100)
		DelBodyItem( OwnerID(), 205892, 100)
		GiveBodyItem( OwnerID(), 205943, 2)
		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_57]"   )  --���\�I����
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Beerfestval_07", 0 ) --�^��W�@�h
	else
		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_34]"   )  --����
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Beerfestval_07", 0 ) --�^��W�@�h
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_Beerfestval_ticket02()  --�ڭn��<CB>1��[202904]</CB>�I��
	local item1 = CountBodyItem(OwnerID(), 202904 ) 
	if item1 >= 1 then
		DelBodyItem( OwnerID(), 202904, 1)
		GiveBodyItem( OwnerID(), 205943, 2)
		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_57]"   )  --���\�I����
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Beerfestval_07", 0 ) --�^��W�@�h
	else
		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_34]"   )  --����
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Beerfestval_07", 0 ) --�^��W�@�h
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_Beerfestval_01() --���� ����c��sDIY
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_ACT01]"   )  --���ʤ��e����
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Bearfestval_serve", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_Beerfestval_02() --���� �@�P�ɥά��s�a
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_ACT02]"   )  --���ʤ��e����
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_10]" , "Lua_mika_Beerfestval_beer", 0 ) --�е���5�~�S�հ�s�C
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Bearfestval_serve", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_Beerfestval_03() --���� ��s�j�v
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_ACT03]"   )  --���ʤ��e����
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Bearfestval_serve", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_Beerfestval_04() --���� �A�ȥͪ��@��
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_ACT04]"   )  --���ʤ��e����
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Bearfestval_serve", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_Beerfestval_05() --�ڷQ�I�����y
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_31]"   )  
	AddSpeakOption(OwnerID(), TargetID(), "[SC_BEERDAY_32]" , "Lua_mika_Bearfestval_reward", 0 ) --�ڷQ�I�����y
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Bearfestval_serve", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------------------------------------------------------------------------
--function Lua_mika_Bearfestval_reward()
--	local ticket = CountBodyItem(OwnerID(), 205941) --��s�`���ʰѥ[��
--	local rewardid =  242091  -- 2013 �I�����y���~id	
--	local starpetid = 242520   --  2013 �s�W �g���������ƥ]
--	local starpetid2 = 241459  -- 2013 �s�W �B�k���~����
----	if ticket >= 20 then
--	if ticket >= 15 then	--2013 �קאּ15�i
--	--	GiveBodyItem(OwnerID(), 205942 , 1) --��s�`���§��
--		----------- ���o���~ 1  ----------- 
--		GiveBodyItem(OwnerID(), rewardid , 1)  ----2013�קאּ��s�g�w§��
--		----------- ���o���~ 2  ----------- 
--		GiveBodyItem(OwnerID(), starpetid , 1) 
--		----------- ���o���~ 3  ----------- 
--		local R = Rand(100)+1
--		if R >= 98 then  -- 3%���v
--			GiveBodyItem(OwnerID(), starpetid2 , 1)   -- ���~����
--		end
--		DelBodyItem(OwnerID(), 205941 , 15) --��s�`���ʰѥ[��
--		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_33]"   )  
--		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Beerfestval_05", 0 ) --�^��W�@�h
--	else
--		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_34]"   )   --�ƶq����
--		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Beerfestval_05", 0 ) --�^��W�@�h
--	end
--end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_Beerfestval_beer() -- �е���5�~�S�հ�s
	local Beer = CheckFlag(OwnerID()  , 543321) -- ���ѻ�L
	if Beer == true then --�w�g��L
		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_08]"   )  --���Ѥw�g���L�F
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Beerfestval_02", 0 ) --�^��W�@�h
	else
		GiveBodyItem(OwnerID(), 205894 , 5 ) --�S�հ�sx5
		SetFlag( OwnerID() , 543321 , 1 )
		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_09]"   )  --�֩M�B�̤ͭ@�P�@���g�w�a�C
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Beerfestval_02", 0 ) --�^��W�@�h
	end
end
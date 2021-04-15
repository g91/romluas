--�`�G2012�s�W zone 15/21 ��B���y�I��NPC/���m��I��NPC
function Lua_mika_Bearfestval_serve02()  
	PlayMotion( TargetID(), 118) --Cast��t
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_01]"   )  --�n�ӳܪM��������s�ܡH
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_02]" , "Lua_mika_Beerfestval_about1", 0 ) --�ڷQ���D��s�`���ѨӡC
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_29]" , "Lua_mika_Beerfestval_051", 0 ) --�ڷQ�I�����y
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_53]" , "Lua_mika_Beerfestval_071", 0 ) --�ڷQ�I��[205943]
end

--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_Beerfestval_about1() -- �ڷQ���D��s�`���ѨӡC
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_07]"   )  --���ʤ��e����
	AddSpeakOption(OwnerID(), TargetID(), "[SC_111490_DIALOG7_2]" , "Lua_mika_Beerfestval_061", 0 ) --�M��O
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_Beerfestval_061() -- �ڷQ���D��s�`���ѨӡC
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_07_01]"   )  --���ʤ��e����
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Bearfestval_serve02", 0 ) --�^��W�@�h
end

--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_Beerfestval_051() --�ڷQ�I�����y
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_31]"   )  
	AddSpeakOption(OwnerID(), TargetID(), "[SC_BEERDAY_32]" , "Lua_mika_Bearfestval_reward", 0 ) --�ڷQ�I�����y
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Bearfestval_serve02", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_Beerfestval_071() -- �ڷQ�I��[205943]
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_54]"   )  --���ʤ��e����
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_55]" , "Lua_mika_Beerfestval_ticket011", 0 ) --�ڭn��<CB>100��[205891]</CB>�P<CB>100��[205892]</CB>�I��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_56]" , "Lua_mika_Beerfestval_ticket021", 0 ) --�ڭn��<CB>1��[202904]</CB>�I��
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Bearfestval_serve02", 0 ) --�^��W�@�h
end
--------------------------------------------------------------------------------------------------------------------------------------------

function Lua_mika_Beerfestval_ticket011()  --�ڭn��100�Ӭc�l�P100�Ӱ�s�å����I��
	local item1 = CountBodyItem(OwnerID(), 205891 ) 
	local item2 = CountBodyItem(OwnerID(), 205892 ) 
	if item1 >= 100 and item2 >= 100 then
		DelBodyItem( OwnerID(), 205891, 100)
		DelBodyItem( OwnerID(), 205892, 100)
		GiveBodyItem( OwnerID(), 205943, 2)
		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_57]"   )  --���\�I����
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Beerfestval_071", 0 ) --�^��W�@�h
	else
		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_34]"   )  --����
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Beerfestval_071", 0 ) --�^��W�@�h
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_Beerfestval_ticket021()  --�ڭn��<CB>1��[202904]</CB>�I��
	local item1 = CountBodyItem(OwnerID(), 202904 ) 
	if item1 >= 1 then
		DelBodyItem( OwnerID(), 202904, 1)
		GiveBodyItem( OwnerID(), 205943, 2)
		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_57]"   )  --���\�I����
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Beerfestval_071", 0 ) --�^��W�@�h
	else
		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_34]"   )  --����
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Beerfestval_071", 0 ) --�^��W�@�h
	end
end

--------------------------------------------------------------------------------------------------------------------------------------------

-- 2013 6.0.4 ���y�I���վ�
function Lua_mika_Bearfestval_reward()
	local ticket = CountBodyItem(OwnerID(), 205941) --��s�`���ʰѥ[��
	local need = 15  -- 2013�~�խ��I���ݨD, �쥻�O20��
	local rewardid =  242091  -- 2013 �I�����y���~id	
	local starpetid = 242520   --  2013 �s�W �g���������ƥ]
	local starpetid2 = 241459  -- 2013 �s�W �B�k���~����

	if ticket >= need then
		DelBodyItem(OwnerID(), 205941 , need ) --��s�`���ʰѥ[��
		----------- ���o���~ 1  ----------- 
		GiveBodyItem(OwnerID(), rewardid , 1) 
		----------- ���o���~ 2  ----------- 
		GiveBodyItem(OwnerID(), starpetid , 1) 
		----------- ���o���~ 3  ----------- 
		local R = Rand(100)+1
		if R >= 98 then  -- 3%���v
			GiveBodyItem(OwnerID(), starpetid2 , 1)   -- ���~����
		end

		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_33]"   )  
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Beerfestval_051", 0 ) --�^��W�@�h
	else
		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_34]"   )   --�ƶq����
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Beerfestval_051", 0 ) --�^��W�@�h
	end
end
--�t�Ӭ��� �w��2�P�~ ���y�I��NPC
------------------------------------------------------------------------------
function Lua_mika_de2y_reward01()  --�I��npc��l�@��
	SetSpeakDetail( OwnerID(), "[SC_GE2_2011_REWARD01]" )--��l���
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GE2_2011_REWARD02]" , "Lua_mika_de2y_reward02", 0 ) --�ڷQ�I��[206841]
end

-- 5.0.9 �|�P�~��s���y���_id
function Lua_mika_de2y_reward02()  --�I�����y
	local rewardid = 726943  -- ���y�I�����_id
	local ticketid = 209561  -- �I���ݨD���~ - �w�y�C�����
	local needcount = 7  -- �ݨD���~�ƶq
	local Language = GetServerDataLanguage() --6.0.1 �x���P�~�y�A�s�W�y�t�P�_�P�y�d���������~

	local item = CountBodyItem( OwnerID(), ticketid )  -- �ˬd�O�_�� �w�y�C�����
	if item >= needcount then  --
		CloseSpeak( OwnerID())
		DesignLog( OwnerID() , 114943 , " 4 years event - reward change" )
		GiveBodyItem( OwnerID(), rewardid , 1 )  --���I�����_
		GiveBodyItem(OwnerID(), 241480, 20 )  -- �`������(241480) x20��
		local RR = Rand(100)+1
		if RR >= 98 then 
		--	if Language ~= "rw" then  -- �x���M�ݨS�����m�ﶵ  ���ե�
			if Language ~= "tw" then --���O�x������
				GiveBodyItem( OwnerID(), 241453 , 1 )  --3%���v��o�������~����(241453)
			else
				GiveBodyItem( OwnerID(), 241461 , 1 ) 	 -- �x������ ���Ȥ��~����(241461)
			end
		end
		DelBodyItem( OwnerID(), ticketid , 7 ) --�� �w�y�C�����
	--	Say( OwnerID() , "RR = "..RR)
	else 
		SetSpeakDetail( OwnerID(), "[SC_0908SEANSON_26]" )--�A�ҫ������~�ƶq�����C
		AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_de2y_reward01", 0 ) --�^��W�@�h
	end		
end
-------------------------------------------------------------------------
function Lua_mika_de2y_givekey1()  -- �C����l�l�� �C�鵹��keyitem 
	Setflag(OwnerID(), 544725, 1 )
	AddBuff(OwnerID(), 509656, 0,7200)
--	Say(OwnerID(), "Give key ")
end

function Lua_mika_208739check() -- �C����l�d���Jcheck
	if CheckFlag( OwnerID()  , 544725 ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_PETSP_TODAY]", C_SYSTEM )
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_PETSP_TODAY]", C_SYSTEM )
		return false
	else
		return true
	end
End
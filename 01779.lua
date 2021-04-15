--701779 �I���d���@��

--�s��޾��d�����d���ˬd�@��
function CheckSummon_newPet(MonsterID)
	local Obj
	local Count = SetSearchRangeInfo( OwnerID(), 200 )
	for i = 1 , Count , 1 do
		local ID = GetSearchResult()
		Obj = Role:New( ID )
		if Obj:OrgID() == MonsterID and Obj:RoomID() == ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) and ReadRoleValue( ID , EM_RoleValue_OwnerDBID ) == ReadRoleValue( OwnerID() , EM_RoleValue_DBID ) then
			DelObj(ID)
			CloseSpeak(OwnerID())
			local Name = Obj:OrgID()
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_RETRIEVEPET][$SETVAR1= ".."["..Name.."]".."]" , 0 )	--�A�^���F�d��
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_RETRIEVEPET][$SETVAR1= ".."["..Name.."]".."]" , 0 )	--�A�^���F�d��
			return false
		end
	end
	return true
end

--�s���I����d����� ���b�d��npc��l���
function lua_mika_newpet_speak() 
	local master = ReadRoleValue(TargetID(),EM_RoleValue_OwnerGUID) 
	local Lv = ReadRoleValue( master , EM_RoleValue_LV )
--	Say(OwnerID(), "OwnerID") --���a
--	Say(TargetID(), "TargetID") --�d��
	if ReadRoleValue(TargetID(),EM_RoleValue_OwnerGUID) == OwnerID() then   --�I����H�O�d���D�H
--		Say(TargetID(), "you are my master.") --�d��
--		Say(master, "I am master.")
		SetSpeakDetail( master, "[SC_NEWPLAYERPET_TOUCH02]" )--�A�n�A�˷R���D�H�A�b�_�I���ȳ~�W�ٶ��Q�ܡH
--		AddSpeakOption( master, master, "[SC_NEWPLAYERPET_TOUCH03]" , "lua_mika_newpet_guide", 0 ) --�d�ݥثe���Ŵ���
		AddSpeakOption( master, master, "[SC_NEWPLAYERPET_TOUCH04]" , "lua_mika_newpet_guide2", 0 ) --�d�ݷs��оǴ���
		if Lv >= 11 and Lv <= 30 then
			AddSpeakOption( master, master, "[SC_NEWPLAYERPET_TOUCH05]" , "lua_mika_deptticket_give", 0 ) --���[207082]
		end
	else
		SetSpeakDetail( OwnerID(), "[SC_NEWPLAYERPET_TOUCH01]" )--�A���O�ڪ��D�H��A�ڥu��ڪ��D�H���Ѩ�U�C
	end
end

--�d�ݷs��оǴ���
function lua_mika_newpet_guide2() --�d�ݷs��оǴ���
	local master = ReadRoleValue(TargetID(),EM_RoleValue_OwnerGUID) 
	SetSpeakDetail( master, "[SC_VNMAYDAY_01]" )--�A�Q���D���ǨƱ��O�H 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_NEWPLAYERPET_HINT01]" , "lua_mika_newpet_guide21", 0 ) 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_NEWPLAYERPET_HINT02]" , "lua_mika_newpet_guide22", 0 ) 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_NEWPLAYERPET_HINT03]" , "lua_mika_newpet_guide23", 0 ) 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_NEWPLAYERPET_HINT04]" , "lua_mika_newpet_guide24", 0 ) 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_NEWPLAYERPET_HINT05]" , "lua_mika_newpet_guide25", 0 ) 
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_newpet_speak", 0 ) --�^��W�@�h
end

function lua_mika_newpet_guide21() --
	local master = ReadRoleValue(TargetID(),EM_RoleValue_OwnerGUID) 
	SetSpeakDetail( master, "[SC_NEWPLAYERPET_HINT01_WORD]" )
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_newpet_guide2", 0 ) --�^��W�@�h
end

function lua_mika_newpet_guide22() --
	local master = ReadRoleValue(TargetID(),EM_RoleValue_OwnerGUID) 
	SetSpeakDetail( master, "[SC_NEWPLAYERPET_HINT02_WORD]" )
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_newpet_guide2", 0 ) --�^��W�@�h
end

function lua_mika_newpet_guide23() --
	local master = ReadRoleValue(TargetID(),EM_RoleValue_OwnerGUID) 
	SetSpeakDetail( master, "[SC_NEWPLAYERPET_HINT03_WORD]" )
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_newpet_guide2", 0 ) --�^��W�@�h
end

function lua_mika_newpet_guide24() --
	local master = ReadRoleValue(TargetID(),EM_RoleValue_OwnerGUID) 
	SetSpeakDetail( master, "[SC_NEWPLAYERPET_HINT04_WORD]" )
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_newpet_guide2", 0 ) --�^��W�@�h
end

function lua_mika_newpet_guide25() --
	local master = ReadRoleValue(TargetID(),EM_RoleValue_OwnerGUID) 
	SetSpeakDetail( master, "[SC_NEWPLAYERPET_HINT05_WORD]" )
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_newpet_guide2", 0 ) --�^��W�@�h
end

--�s���d����ū�o��
Function lua_mika_deptticket_give()  --�s���d����ū�o��1
	local master = ReadRoleValue(TargetID(),EM_RoleValue_OwnerGUID) 
	SetSpeakDetail( master, "[SC_NEWPLAYERPET_TOUCH06]" )--�M�Ũ餶��
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_NEWPLAYERPET_TOUCH05]" , "lua_mika_deptticket_give1", 0 ) --���[207082]
end

Function lua_mika_deptticket_give1()  --�s���d����ū�o��2
	local master = ReadRoleValue(TargetID(),EM_RoleValue_OwnerGUID) 
--	Say(OwnerID(), "OwnerID 3") --���a
--	Say(TargetID(), "TargetID 3") --�d��
	CloseSpeak(OwnerID())
	if CheckFlag(OwnerID(), 543840 ) == true then 
		--�A���Ѥw�g����L[207082]�F�C
		ScriptMessage( OwnerID(),OwnerID(),1,"[SC_NEWPLAYERPET_TICKETGET01]" ,0)
	else
		--�ϥΦ����~��A�N��M���A�D¾�Ҧ����g��ȻP�ޯ�t�šC
		ScriptMessage( OwnerID(),OwnerID(),1,"[SC_NEWPLAYERPET_TICKETGET03]" ,C_SYSTEM )
		--�Ʊ洣�Ѫ����~���A�������U�C
		ScriptMessage( OwnerID(),OwnerID(),1,"[SC_NEWPLAYERPET_TICKETGET02]" ,C_SYSTEM )
		GiveBodyItem(OwnerID(), 207082 , 1)
		SetFlag(OwnerID(), 543840  ,1) --�s��C�����M�Ũ�flag
	end	
end

function lua_mika_newpet_delkey()  --�R���Ҧ�����keyitem
	Setflag(OwnerID(), 543840, 0 )
	Setflag(OwnerID(), 543807, 0 )
	Setflag(OwnerID(), 543833, 0 )
	Setflag(OwnerID(), 543834, 0 )
	Setflag(OwnerID(), 543835, 0 )
	Setflag(OwnerID(), 543836, 0 )
	Setflag(OwnerID(), 543837, 0 )
	Setflag(OwnerID(), 543841, 0 )
	Setflag(OwnerID(), 543842, 0 )
	Setflag(OwnerID(), 543843, 0 )
	Setflag(OwnerID(), 543844, 0 )
	Setflag(OwnerID(), 543845, 0 )
	Setflag(OwnerID(), 543846, 0 )
	Setflag(OwnerID(), 543847, 0 )
	Setflag(OwnerID(), 543848, 0 )
	Setflag(OwnerID(), 543849, 0 )
	Say(OwnerID(), "Del newpet all keyitem. ")
end



-- 5.0.0 update
-- �s���d������  
-- �n�J�ɵ���BUFF �b������Ĳ�o�@�� ��ū�o��
function lua_mika_newpet_giveitem()
	local Owner = OwnerID()  -- Player
	local Lv = ReadRoleValue( Owner , EM_RoleValue_LV )

	if Lv >= 11 and Lv <= 30 then
		if CheckFlag( Owner, 543840 ) == false then   -- ����٨S��L
			ScriptMessage( Owner, Owner, 1,"[SC_NEWPLAYERPET_TICKETGET04]" ,C_SYSTEM )
			ScriptMessage( Owner, Owner, 0,"[SC_NEWPLAYERPET_TICKETGET04]" ,C_SYSTEM )
			-- �D�H�A�n�A�Ц��U�ڬ��A�ǳƪ��p§���A�Цb�ݭn���ɭԨϥΧa�I
			GiveBodyItem(Owner, 207082 , 1)
			SetFlag( Owner, 543840  ,1) --�s��C�����M�Ũ�flag
		end
	end
end

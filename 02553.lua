function FN_VALENTINE_2011_GetBackers()	--���a���W�j��
	local Player = OwnerID()
	local Timer = 0

	local KeyTable = {541861, 541862, 541863, 541864}
	for i=1,4 do SetFlag(Player, KeyTable[i], 0) end

	AddBuff(Player, 621880, 0, 900)

	while TRUE do
		if CheckBuff(Player, 509111) == FALSE and CheckBuff(Player, 509114) == FALSE then
			local NPCTable =  ValentineGuardTable
			for i=1,table.getn(NPCTable) do
				if CheckDistance( NPCTable[i], Player, 130 ) == TRUE and CheckBuff(NPCTable[i], 509112) == FALSE and CheckRelation( NPCTable[i], Player, EM_CheckRelationType_CheckLine ) == TRUE then
					--	�j�M��u�èS���n�F���説�A�åB��̤����S������
					if ReadRoleValue(NPCTable[i], EM_RoleValue_Register10) == 0 then
						--	�Ӧu�èS���Q����
						local Guard = Lua_DW_CreateObj( "obj" , 103011 , NPCTable[i] , 1 , 1 )
						SetAttack( Guard , Player )
						SetModeEx( Guard  , EM_SetModeType_Mark, false )--�аO
						SetModeEx( Guard  , EM_SetModeType_ShowRoleHead, false )--�Y����
						SetModeEx( Guard  , EM_SetModeType_Fight , false )--�i�������
						WriteRoleValue(Guard, EM_RoleValue_Register10, Player)
						BeginPlot(Guard,"FN_VALENTINE_2011_GetBackers_Guard",0)
						--
						Hide(NPCTable[i])
						WriteRoleValue(NPCTable[i], EM_RoleValue_Register10, 1)
						BeginPlot(NPCTable[i],"FN_VALENTINE_2011_GetBackers_showNPC",0)
					end
				--elseif ReadRoleValue( NPCTable[i], EM_RoleValue_OrgID ) == 103011 then	--�j�M�쪺�O�Q���R���u��
				--	SetAttack( NPCTable[i] , Player )
				--	BeginPlot(NPCTable[i],"FN_VALENTINE_2011_GetBackers_Guard",0)
				end
			end
		end
		--
		Sleep(30)
--		local MountCheck = Lua_Mounts_Copilot( Player )
--		if MountCheck == true then	--
--			Say(Player, "MountCheck = ".."True")
--		else
--			Say(Player, "MountCheck = ".."False")
--		end
		if Timer >= 900 or CheckBuff(Player, 621880) == false  or Lua_Mounts_Copilot( Player ) == false then	--�ˬd���a����
			if CheckFlag(Player, 541865) == false then	--�P�_���a���ѱ��󪺮ɭԤ��O�]���L�w�g�������Ȼ~�P
				local FlowerTable = {240645, 240646, 240647, 240730}
				CancelBuff(Player, 621880)

				ScriptMessage( Player, Player, 1, "[SC_VALENTINE_2011_FN03_1]", 0 )
				ScriptMessage( Player, Player, 1, "[SC_VALENTINE_2011_FN03_2]", 0 )
				for i=1,4 do
					if CountBodyItem(Player, FlowerTable[i]) >= 1 then DelBodyItem(Player, FlowerTable[i], 1) end
				end
			end
			return
		else
			Timer = Timer + 3
		end
	end
end

function FN_VALENTINE_2011_GetBackers_showNPC()	--Ĳ�o�����æu��
	local NPC = OwnerID()
	Sleep(60)
	--
	Show( NPC, 0 )
	WriteRoleValue(NPC, EM_RoleValue_Register10, 0)
end

function FN_VALENTINE_2011_GetBackers_Guard()	--�Q�R�q���u�ð���@��
	local Guard = OwnerID()
	local Player = ReadRoleValue(Guard, EM_RoleValue_Register10)
	local SearchTime = 0
	--
	Say(Guard, "[SC_VALENTINE_2011_FN01]")
	ScriptMessage( Player, Player, 1, "[SC_VALENTINE_2011_FN02]", 0 )
	--
	while TRUE do
		if CheckDistance( Guard, Player, 160 ) == FALSE or SearchTime >= 15 or CheckBuff(Player, 509114) == TRUE then
			-- ���a�k��
			ScriptMessage( Player, Player, 1, "[SC_VALENTINE_2011_FN04]", C_SYSTEM )
			DelObj(Guard)
			return
		elseif  CheckDistance( Guard, Player, 35 ) == TRUE or CheckBuff(Player, 621880) == FALSE then
			-- ��쪱�a
			CancelBuff(Player, 621880)
			DelObj(Guard)
			return
		end
		--
		Sleep(20)
		SearchTime = SearchTime + 2
	end
end

function FN_VALENTINE_2011_GetBackers_Box()	--���٥ؼЪ��󲣥ͼ@��
	SetPlot( OwnerID() , "touch" , "FN_VALENTINE_2011_TouchBox" , 25 )
end

function FN_VALENTINE_2011_TouchBox()	--���٥ؼа���@��
	local Player = OwnerID()
	if CheckBuff(Player, 621880) == TRUE then
		BeginCastBarEvent( Player, TargetID() , "[SC_VALENTINE_2011_FN05]", 80, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_NORMAL , 0 , "FN_VALENTINE_2011_GetBackers_BoxEvent")
	else
		ScriptMessage( Player, Player, 1, "[SC_VALENTINE_2011_FN07]", C_SYSTEM )
	end
end

function FN_VALENTINE_2011_GetBackers_BoxEvent(ObjID, Result)	--�I�k���ƥ�

	if Result > 0 and CheckBuff(ObjID, 621880) == TRUE then
		local Box = TargetID()
		local Player = ObjID
		local KeyTable = {541861, 541862, 541863, 541864}
		local FlowerTable = {240645, 240646, 240647, 240730}
		local keyNum = ReadRoleValue(Box, EM_RoleValue_PID)

		if CheckFlag(Player, KeyTable[keyNum]) == FALSE then
			SetFlag(Player, KeyTable[keyNum], 1)
			GiveBodyItem(Player, FlowerTable[keyNum], 1)
		else
			ScriptMessage( Player, Player, 1, "[SC_VALENTINE_2011_FN06]", C_SYSTEM )
		end
	end
	EndCastBar( ObjID, Result )
end

function FN_VALENTINE_2011_GetBackers_NPC117022()	--�Ϊ���ܨƥ�
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player, "[SC_VALENTINE_2011_FN11]" )

	if CountBodyItem(Player, 240750) >= 1 then
		--�֦��}���������
		DelBodyItem(Player, 240750, 1)
		GiveBodyItem(Player, 209161, 6)
		SetFlag(Player, 541865, 1)
		CancelBuff(Player, 621880)
	elseif CheckBuff(Player, 621880) == TRUE then
		-- ���b�i�椤
		SetSpeakDetail(Player, "[SC_VALENTINE_2011_FN12]" )
	elseif CheckFlag(Player, 541865) == FALSE then
		-- �٨S���L
		SetSpeakDetail(Player, "[SC_VALENTINE_2011_FN08]" )
		AddSpeakOption( Player, NPC, "[SC_VALENTINE_2011_FN08_OPTION]", "FN_VALENTINE_2011_NPC117022_Option1", 0 )
	end
end

function FN_VALENTINE_2011_NPC117022_Option1()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player, "[SC_VALENTINE_2011_FN09]" )
	AddSpeakOption( Player, NPC, "[SC_VALENTINE_2011_FN09_OPTION]", "FN_VALENTINE_2011_NPC117022_Option2", 0 )
end

function FN_VALENTINE_2011_NPC117022_Option2()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player, "[SC_VALENTINE_2011_FN10]" )
	AddSpeakOption( Player, NPC, "[SC_VALENTINE_2011_FN10_OPTION]", "FN_VALENTINE_2011_plot", 0 )
end

function FN_VALENTINE_2011_plot()	--����̤W�����D�n�ƥ�
	local Player = OwnerID()
	local MountCheck = Lua_Mounts_Copilot( Player )

	if MountCheck == false then
		ScriptMessage( Player, Player, 1, "[SC_GE2_2011EV1_16]", 0 )
	else
		BeginPlot( Player, "FN_VALENTINE_2011_GetBackers", 0 )
	end
	CloseSpeak(Player)
end

function Lua_ItemUse_240730(option,Item)	--�ϥλ}�����ᴫ�}�����֪��
	local Player = OwnerID()
	local FlowerTable = {240645, 240646, 240647, 240730}

	if option == "CHECK" then
		for i=1,4 do
			if CountBodyItem(Player, FlowerTable[i]) == 0 then
				return FALSE
			end
		end
		return TRUE
	elseif option == "USE" then
		GiveBodyItem(Player, 240750, 1)
		UseItemDestroy()
		for i=1,4 do
			if FlowerTable[i] ~= Item then DelBodyItem(Player, FlowerTable[i], 1) end
		end
		--
		local Pos = Lua_BuffPosSearch( Player , 621880 )                      ---------------------��X���W���k�N�N��
		local BuffTime = BuffInfo( Player , Pos , EM_BuffInfoType_Time )  -------------------------��X���k�N�O�֩�

		if BuffTime >= 300 then
			GiveBodyItem( Player, 530792, 1 )
		end
		if BuffTime >= 180 then
			GiveBodyItem( Player, 530791, 1 )			
		end
	end
end

function FN_VALENTINE_2011_GuardTable()	--�����ܼƬ����u��
	if ValentineGuardTable == nil then
		ValentineGuardTable = {}
	end
	table.insert(ValentineGuardTable, OwnerID())
end

function Lua_Spell499055_check()
	local GuardTable = {103012, 100938, 100946, 100947}
	local Guard = TargetID()

	for i=1,4 do
		if ReadRoleValue( Guard, EM_RoleValue_OrgID ) == GuardTable[i] then
			return TRUE
		end
	end
	return FALSE
end


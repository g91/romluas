 function FN_Xmas2012_bonfire_Creat()	--���j꺤������󲣥ͼ@��
	AddBuff(OwnerID(), 504461, 0, -1)
end

function FN_Xmas2012_HideWarm()		--���÷ŷx�ӷ������󲣥ͼ@��
	AddBuff(OwnerID(), 507088, 0, -1)
end

--==================================
--			���Ҿ������
--==================================

function FN_Xmas2012_EnterZone()	--���a�i�J�ϰ�N��i�����ܼƪ��}�C���Y�����ޱ�
	local Player = OwnerID()

	table.insert( Z358_v, Player)

	FN_Xmas2012_DailyKeyCheck( Player )

	local NPC = Z358_Unit[2]
	Tell( Player, NPC, "[FN_XMAS2012_TELL]" )
end

function FN_Xmas2012_DailyKeyCheck( Player )
	if CheckFlag( Player, 547182 ) == false then	
		SetFlag( Player, 547182, 1 )
		-- ���B��Key�аѾ\���H�F�ѦU�O���ǨC��
		local QuestKey = { 547183, 547184, 547185, 547232, 547282, 547197, 547191, 547231, 547202, 547287, 547228, 547283, 547168 }

		for i =1, table.getn( QuestKey ) do
			SetFlag( Player, QuestKey[i], 1 )
		end
	end
end

function FN_Xmas2012_Zone358()	--���ê���W���������Ҽ@��
	local HideUnit = OwnerID()
	local GameTime = 0
	local RoomID = ReadRoleValue(HideUnit, EM_RoleValue_RoomID)
	local SnowTreasureTable = {}

	if Z358_v == nil then
		Z358_v = {}
	end
	if Z358_Treasure == nil then
		Z358_Treasure = {}
	end
	if Z358_Unit == nil then
		Z358_Unit = {}
	end
	Z358_Unit[1] = HideUnit
--	Z358_Unit[2] ���ҥͦs�ɮv
	DebugMsg( 0, RoomID, "Creat" )
	CallPlot( HideUnit, "FN_Xmas2012_WoodContrl" )
	--SnowPoint Creat
	local SnowQuest = { [0]=421649; [1]=421649; [2]=421649; [3]=421649; 
				[4]=421650; [5]=421650; [6]=421650; [7]=421650; 
				[8]=421651; [9]=421651; [10]=421651; [11]=421651 }
	for i = 0, 11 do
		local SnowPoint = CreateObjByFlag( 120881 , 781212 , i , 1 )
		WriteRoleValue( SnowPoint, EM_RoleValue_PID, (547156+i) )
		WriteRoleValue( SnowPoint, EM_RoleValue_Register1, SnowQuest[i] )
		AddToPartition(SnowPoint, RoomID)
	end
	--
	while true do
		if table.getn(Z358_v) > 0 then
			for i = table.getn(Z358_v), 1, -1 do
				local Player = Z358_v[i]
				if CheckID( Player ) == true then
					if CheckBuff( Player, 504457 ) == false and CheckBuff( Player, 504459 ) == false and CheckBuff( Player, 623731 ) == false and CheckBuff( Player, 623747 ) == false then
						-- 504457 �ŷx / 504459 ������� / 623731 �x�N / 623747 �]�~������ �o�Ǫ��A���S���~�|�[�H��G�H
						AddBuff( Player, 504458, 0, -1 )			-- 504458 �H��G�H
						if FN_CountBuffLevel( Player, 504458 ) >= 29 then	-- �|��30�h�N������� 
							CancelBuff( Player, 504458 )
							AddBuff( Player, 504459, 0, -1 )
						end
					elseif CheckBuff( Player, 504457 ) == true or CheckBuff( Player, 623731 ) == true then	--�ŷx���A�U�C���� 504458 �H��G�H ���C5�h
						if FN_CountBuffLevel( Player, 504458 ) >= 0 then	
							local BuffLevel = FN_CountBuffLevel( Player, 504458 )
							CancelBuff( Player, 504458 )
							if ( BuffLevel - 4 ) >= 0 then AddBuff( Player, 504458, ( BuffLevel - 4 ), -1 ) end
						end
					end
					-- ���Լ�
					Lua_Festival_12_All( Player )
					-- �ˬd�C��X��
					FN_Xmas2012_DailyKeyCheck( Player )
				else
					table.remove( Z358_v, i )
				end
			end
		end
		--�г��_�c
		if GameTime % 14400 == 0 then
			Z358_Treasure = {}		--��W�@�Ӥp�ɩҰO���������ܼƪ��F�賣�M��
			--��W�@�Ӥp�ɪ�Treasure���R��
			if table.getn(SnowTreasureTable) > 0 then
				for i = 1, table.getn(SnowTreasureTable) do
					DelObj( SnowTreasureTable[i] )
				end
			end
			--�гy�U�@�Ӥp�ɪ�Treasure
			local RN = DW_Rand( 26 )
			for i = 0, 12 do
				if RN + i > 26 then RN = RN + i - 26 end
				local SnowTreasure = CreateObjByFlag( 117199 , 781247 , (RN+i) , 1 )  
				AddToPartition(SnowTreasure, RoomID)
				table.insert( SnowTreasureTable, SnowTreasure )
				Z358_Treasure[SnowTreasure] = {}
			end
		end
		--
		Sleep(10)
		GameTime = GameTime + 1
	end
end

function FN_Xmas2012_504457effect()	--�ŷx�ĪG���@��
	local Player = TargetID()

	if CheckBuff( Player, 504459) == true then
		CancelBuff( Player, 504459)			--�ŷx���A�U�i�H���� 504459 �������
		DesignLog( Player , 504459 , "Remove Ice!" )
	end
end

function FN_Xmas2012_504460effect()	--��������ɶ���
	local Player = OwnerID()
	
	ScriptMessage( Player, Player, 3, "[FN_XMAS2012_NORMAL_01]", C_SYSTEM )
	AddBuff( Player, 506098, 0, 3 )
	Sleep( 30 )
	CallPlot( Player, "FN_Xmas2012_504460end" )
end

function FN_Xmas2012_504460end()
	local Player = OwnerID()

	SetPos( Player, -12521, 815, -2382, 95 )
	DesignLog( Player , 504460 , "Cold to death" )
end
--==================================
--			�гy�������
--==================================

function FN_Xmas2012_z358_UseOnly()	--���~�ϥμ@��
	local Player = OwnerID()
	local ZoneID = ReadRoleValue( Player, EM_RoleValue_ZoneID )

	if ZoneID ~= 358 then
		ScriptMessage( Player, Player, 1, "[FN_XMAS2012_Z358_USEONLY]", 0 )
		return false
	else
		return true
	end
end

function FN_Xmas2012_SetBonfire_Result()	--���~�ϥμ@��CastBar
	local Player = OwnerID()
	local RoomID = ReadRoleValue( Player, EM_RoleValue_RoomID )
	local x,y,z,dir = DW_Location( Player )

	--if CheckResult > 0 then					--�j��0�O���\
		local Bonfire = CreateObj( 117698, x, y, z, dir, 1 )
		SetDefIdleMotion( Bonfire, ruFUSION_ACTORSTATE_DEAD )
		SetModeEx( Bonfire, EM_SetModeType_Strikback, false )		--����
		SetModeEx( Bonfire, EM_SetModeType_SearchenemyIgnore, false )	--�Q�j�M
		SetModeEx( Bonfire, EM_SetModeType_Obstruct, false )		--����
		SetModeEx( Bonfire, EM_SetModeType_Mark, false )			--�аO
		SetModeEx( Bonfire, EM_SetModeType_Move, false )			--����
		SetModeEx( Bonfire, EM_SetModeType_Searchenemy, false )		--����
		SetModeEx( Bonfire, EM_SetModeType_HideName, false )		--�W��
		SetModeEx( Bonfire, EM_SetModeType_ShowRoleHead, false )		--�Y����
		SetModeEx( Bonfire, EM_SetModeType_Fight , false )			--�i�������
		SetModeEx( Bonfire, EM_SetModeType_Drag , true )			--���O
		AddToPartition(Bonfire , RoomID)
		CallPlot( Bonfire, "FN_Xmas2012_Bonfire_Plot" )
--	elseif CheckResult < 0 then 				--�p��0�O����
--		return
--	end
--	EndCastBar( Player, CheckResult )
end

function FN_Xmas2012_Flintstone_check()	--�����ۨϥΪ�check�@��
	local Player = OwnerID()
	local Unit = TargetID()
	local OrgID = ReadRoleValue( Unit, EM_RoleValue_OrgID )
	local CheckR10 = ReadRoleValue( Unit, EM_RoleValue_Register10 )
	if OrgID == 117698 or (CheckR10 >= 547192 and CheckR10 <= 547196) or OrgID == 107398 or OrgID == 107422 then
		return true
	else
		return false
	end
end

function FN_Xmas2012_Flintstone()		--�����ۨϥμ@��
	local Player = OwnerID()
	local Unit = TargetID()
	local OrgID = ReadRoleValue( Unit, EM_RoleValue_OrgID )
	local CheckR10 = ReadRoleValue( Unit, EM_RoleValue_Register10 )	--�����O�_���F�~���S��N��
--	local CheckR1 = ReadRoleValue( Unit, EM_RoleValue_Register1 )		--�����F�~�O�_�w�g�Q�����L
--	Say(Player, "OwnerID")
--	Say(Bonfire, "TargetID")
--	Say( Unit, "I hit" )
	if OrgID == 117698 then	--������O����~����
		local BonfireStep = ReadRoleValue( Unit, EM_RoleValue_Register1 )	--��������{�b�����A
		if BonfireStep == 0 or BonfireStep == 2 then
			ScriptMessage( Unit, Player, 3, "[FN_XMAS2012_FLINTSTONE01]", C_SYSTEM )
		 	WriteRoleValue( Unit, EM_RoleValue_Register2, 1)			--�g�J1������ۨ����j��P�_�Q�I�U
			AddBuff( Unit, 507088, 0, -1 )
			SetDefIdleMotion( Unit, ruFUSION_MIME_IDLE_STAND )
		elseif BonfireStep == 1 then

		elseif BonfireStep == 3 then
			ScriptMessage( Unit, Player, 3, "[FN_XMAS2012_FLINTSTONE02]", C_SYSTEM )
			DesignLog( Player , 117698 , "Haha look at u!" )
		end
	--elseif CheckR10 >= 547192 and CheckR10 <= 547196 and CheckR1 == 0 then	--���������������F�~
	elseif CheckR10 >= 547192 and CheckR10 <= 547196 and ReadRoleValue( Unit, EM_RoleValue_Register6 ) == 0 then	--���������������F�~
--		Say( Unit, "I Hit!! Hit!! Hit!!" )
		CallPlot( Unit, "FN_Xmas2012_Soul_Hit", Unit )
	elseif OrgID == 107398 or OrgID == 107422 then
		TeaCat_Xmas2012_HitDeer(Player, Unit)
	end
end

function FN_Xmas2012_Bonfire_Plot()		--����W�]���j��@��
	local Bonfire = OwnerID()
	local RoomID = ReadRoleValue( Bonfire, EM_RoleValue_RoomID )
	local BurnTime = 0
	local ExtinguishTime = 15
	local DampTime = 0
	
	-- Register1 �P�_���諸���p
	-- 0 ���`������		ExtinguishTime
	-- 1 �U�N������		BurnTime
	-- 2 �N�L������		ExtinguishTime
	-- 3 �㱼������		DampTime
	-- Register2 �P�_���靈�S���Q�I

	while true do
		local BonfireStep = ReadRoleValue( Bonfire, EM_RoleValue_Register1 )

		if ReadRoleValue( Bonfire, EM_RoleValue_Register2 ) == 1 then	--�T�{�O���O���Q�I�U
			if BonfireStep == 0 then BurnTime = 16 elseif BonfireStep == 2 then BurnTime = 9 end
			WriteRoleValue ( Bonfire, EM_RoleValue_Register1, 1 )	--���Q�I�U�N�⪬�A�g��1�U�N������
			WriteRoleValue ( Bonfire, EM_RoleValue_Register2, 0 )	--�T�{���Q�I�U����N�g��0 �קK���ƶ]�J�o�q�T�{
			AddBuff( Bonfire, 507088, 0, -1 )
			BeginPlot(Bonfire,"Lua_Snowflake_LoopForCheckStatue",0)	--�p���Ұ����ƥ�ݨD���@��
												--�������j�M���񪫥�A�ðw��S�w������椣�P�ʧ@�C(��function�I���ɰ���榸)
			BonfireStep = 1
			ExtinguishTime = -1
--			DebugMsg(0,0,"ExtinguishTime = "..ExtinguishTime)
		end

		if BonfireStep == 0 then
			if ExtinguishTime > 0 then
				ExtinguishTime = ExtinguishTime - 1
--				Say(Bonfire, "----ExtinguishTime="..ExtinguishTime)
			else
				WriteRoleValue ( Bonfire, EM_RoleValue_Register1, 3 )
--				Say(Bonfire, "Become BonfireStep 3")
			end
		elseif BonfireStep == 1 then
			if BurnTime > 0 then
				BurnTime = BurnTime - 1
--				Say(Bonfire, "----BurnTime="..BurnTime)
			else
				SetDefIdleMotion( Bonfire, ruFUSION_MIME_IDLE_DEAD )
				WriteRoleValue ( Bonfire, EM_RoleValue_Register1, 2 )
				CancelBuff( Bonfire, 507088 )
--				ExtinguishTime = 15
--				Say(Bonfire, "Become BonfireStep 2")
			end
		elseif BonfireStep == 2 then
			if ExtinguishTime < 0 then
--				DebugMsg(0,0,"ExtinguishTime < 0")
				ExtinguishTime = 15
				SetDefIdleMotion( Bonfire, ruFUSION_MIME_IDLE_DEAD )
				CancelBuff( Bonfire, 507088 )
				un_Xmas2012_warmwinter_die()
			elseif ExtinguishTime > 0 then
				ExtinguishTime = ExtinguishTime - 1
--				Say(Bonfire, "----ExtinguishTime="..ExtinguishTime)
			elseif ExtinguishTime == 0 then
--				Say(Bonfire, "Become BonfireStep 3")
				WriteRoleValue ( Bonfire, EM_RoleValue_Register1, 3 )
				DampTime = 60
			end	
		elseif BonfireStep == 3 then
			if DampTime > 0 then
				DampTime = DampTime - 1
--				Say(Bonfire, "----DampTime="..DampTime)
			else
				DelObj(Bonfire)
			end
		end
		--
		Sleep(10)
	end
end

--==================================
--			NPC����
--==================================
function FN_Xmas2012_NPC121048_creat()
	local NPC = OwnerID()

	AddBuff(  NPC,  503217, 1, -1) 
	if ReadRoleValue( NPC, EM_RoleValue_ZoneID ) == 358 then
		if Z358_Unit == nil then
			Z358_Unit = {}
		end

		Z358_Unit[2] = NPC
	end
end

function FN_Xmas2012_NPC121048_1()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail( Player, "[FN_XMAS2012_TALK_01]" )

	AddSpeakOption( Player, NPC, "[FN_XMAS2012_TALK_02]", "FN_Xmas2012_NPC121048_2", 0 )
	AddSpeakOption( Player, NPC, "[FN_XMAS2012_TALK_03]", "FN_Xmas2012_NPC121048_3", 0 )

	--
	if CountBodyItem( Player, 205808 ) <= 0 then
		GiveBodyItem( Player, 205808, 1 )
	end
	if CheckFlag( Player, 543381 ) == false then
		SetFlag( Player, 543381, 1 )
		GiveBodyItem( Player, 205807, 10 )
	end
end

function FN_Xmas2012_NPC121048_2()
	local Player = OwnerID()
	SetSpeakDetail( Player, "[FN_XMAS2012_TALK_04]" )
end

function FN_Xmas2012_NPC121048_3()
	local Player = OwnerID()
	SetSpeakDetail( Player, "[FN_XMAS2012_TALK_05]" )
end

function FN_Xmas2012_3NPC_talk()
	local Player = OwnerID()
	local NPC = TargetID()
	local OrgID = ReadRoleValue( NPC, EM_RoleValue_OrgID )

--	if OrgID == 120145 then
--		SetSpeakDetail( Player, "[FN_XMAS2012_3NPC_TALK01]" )
--	elseif OrgID == 120146 then
--		SetSpeakDetail( Player, "[FN_XMAS2012_3NPC_TALK02]" )		
--	elseif OrgID == 120147 then
--		SetSpeakDetail( Player, "[FN_XMAS2012_3NPC_TALK03]" )
--	end
	LoadQuestOption( Player )
end

-----------------
function FN_Xmas2012_NPC119566()
	local Player = OwnerID()
	local NPC = TargetID()
	local ZoneID = ReadRoleValue( NPC, EM_RoleValue_ZoneID )

	if ZoneID == 358 then
		SetSpeakDetail( Player, "[FN_XMAS2012_LEAVE]" )
		AddSpeakOption( Player, NPC, "[FN_XMAS2012_LEAVE_OPTION]", "FN_Xmas2012_NPC119566_Leave", 0 )
	else
		SetSpeakDetail( Player, "[FN_XMAS2012_INVITE]" )
		AddSpeakOption( Player, NPC, "[FN_XMAS2012_INVITE_OPTION]", "FN_Xmas2012_NPC119566_Option", 0 )
	end
end

function FN_Xmas2012_NPC119566_Option()
	local Player = OwnerID()
	local NPC = TargetID()
	
	CloseSpeak( Player )

	AddBuff( Player, 506098, 0, 3 )
	ScriptMessage( Player, Player, 3, "[FN_XMAS2012_PORTAL_SPELL]", C_SYSTEM )
	Sleep( 50 )
	ChangeZone( Player, 358, 0, -12521, 815, -2382, 0 )
end

function FN_Xmas2012_NPC119566_Leave()
	local Player = OwnerID()
	local NPC = TargetID()
	
	CloseSpeak( Player )

	AddBuff( Player, 506098, 0, 3 )
	ScriptMessage( Player, Player, 3, "[FN_XMAS2012_PORTAL_SPELL]", C_SYSTEM )
	Sleep( 50 )
	ChangeZone( Player, 2, 0, 4983, 113, -2304, 53 )
end
-----------------
function FN_Xmas2012_NPC120143_Main()
	local Player = OwnerID()
	local NPC = TargetID()

	if CheckFlag( Player, 547196 ) == true then
		SetSpeakDetail( Player, "[FN_XMAS2012_120143_03]" )
	elseif CheckFlag( Player, 547192 ) == true and CheckFlag( Player, 547193 ) == true and CheckFlag( Player, 547194 ) == true and CheckFlag( Player, 547195 ) == true then
		SetSpeakDetail( Player, "[FN_XMAS2012_120143_02]" )
	else
		SetSpeakDetail( Player, "[FN_XMAS2012_120143_01]" )
	end
end
-----------------
function FN_XMAS2012_120144_Main()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail( Player, "[FN_XMAS2012_TALK_06]" )
	AddSpeakOption( Player, NPC, "[FN_XMAS2012_TALK_06_OPTION1]", "FN_XMAS2012_120144_2", 0 )
	AddSpeakOption( Player, NPC, "[FN_XMAS2012_TALK_06_OPTION2]", "FN_XMAS2012_120144_3", 0 )
end

function FN_XMAS2012_120144_2()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail( Player, "[FN_XMAS2012_TALK_07]" )
end

function FN_XMAS2012_120144_3()
	local Player = OwnerID()
	local NPC = TargetID()

	if CountBodyItem( Player, 203734 ) >= 10 then
		DelBodyItem( Player, 203734, 10 )
--		GiveBodyItem( Player, 201930, 1 )
		GiveBodyItem( Player, 242923, 1 ) --2013 new reward
		SetSpeakDetail( Player, "[FN_XMAS2012_TALK_08]" )
	else
		SetSpeakDetail( Player, "[FN_XMAS2012_TALK_09]" )		
	end
end

function FN_XMAS2012_Reward201930()
	local Owner = OwnerID()
	GiveBodyItem( Owner, 724407, 1 )
end


function NA_XMAS2013_Reward242923()  -- 2013���y
	local Owner = OwnerID()
	GiveBodyItem( Owner , 241481 , 15 ) --15�ӯP������
	if DW_Rand(100) >= 97 then  		--3%�����|�o��g����~����
		GiveBodyItem( Owner , 241462 , 1 )
	end
	GiveBodyItem( Owner, 727050, 1 )
end
--==================================
--			���ҥj��
--==================================

function FN_Xmas2012_WoodContrl()	--������������Y���ͪ��@��
	local HideUnit = OwnerID()
	local RoomID = ReadRoleValue(HideUnit, EM_RoleValue_RoomID)
	local RandTable = {}
	local WoodTable = {}
	local FlagNum = 54		--�`�@�h�ֺX�l�ӿ��m
	local WoodNum = 18		--���W�P�ɦs�b�h�֥j��
	DebugMsg( 0, RoomID, "WoodContrl" )

	while true do
		local WoodCount = 0
		for i = 1, FlagNum do
			if WoodTable[i] ~= nil and CheckID( WoodTable[i] ) == true then
				WoodCount = WoodCount + 1
			end
		end
		--DebugMsg( 0, RoomID, "WoodCount="..WoodCount )
		--
		local RN = DW_Rand( FlagNum )
		while WoodCount < WoodNum do
			if WoodTable[RN] == nil then
				local Wood = CreateObjByFlag( 121170 , 781209 , RN , 1 )
				AddToPartition( Wood, RoomID)
				table.insert( WoodTable, RN, Wood )
				WoodCount = WoodCount + 1
			else
				if RN == FlagNum then RN = 1 else RN = RN + 1 end
			end
			Sleep( 10 )
		end
		--
--		for i = 1, FlagNum do
--			if CheckID( WoodTable[i] ) == false then
--				WoodTable[i] =nil
--			end
--		end
		--
		Sleep( 20 )
	end
end

function FN_Xmas2012_Wood_creat()	--���ҥj�쪺���󲣥ͼ@��
	local Wood = OwnerID()
	SetModeEx( Wood, EM_SetModeType_Mark, true )			--�аO
	SetModeEx( Wood, EM_SetModeType_Obstruct, false )		--����
	SetModeEx( Wood, EM_SetModeType_ShowRoleHead, false )	--�Y����
	SetPlot( Wood, "touch", "FN_Xmas2012_Wood_touch", 50 )
end

function FN_Xmas2012_Wood_touch()	--�Ķ����Y
	local Player = OwnerID()
	local Wood = TargetID()

	BeginCastBarEvent( Player, Wood, "[SC_GERMANY2_CONCERTO_05]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "FN_Xmas2012_Wood_Result" )
end

function FN_Xmas2012_Wood_Result(Obj,CheckResult)	--�Ķ����Y�@��CastBar
	local Player = OwnerID()
	local Wood = TargetID()

	if CheckResult > 0 then					--�j��0�O���\
		local RNum = DW_Rand(4)
		GiveBodyItem( Player, 205807, RNum )
		DelObj( Wood )
--	elseif CheckResult < 0 then 				--�p��0�O����
--		return
	end
	EndCastBar( Player, CheckResult )
end

--==================================
--			���սX
--==================================

function Oh_FN_GiveMeWarm()
	AddBuff(OwnerID(), 507088, 0, -1)
end

function gotoflag781209(num)
	SetPosByFlag( OwnerID() , 781209 , num )
end

function gotoflag781247(num)
	SetPosByFlag( OwnerID() , 781247 , num )
end

function gotoflag781212(num)
	SetPosByFlag( OwnerID() , 781212 , num )
end
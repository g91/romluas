function Lua_Hao_Test_Box00()
	Setplot( OwnerID() , "touch" , "Lua_Hao_Test_Box01" , 50 )	
end

function Lua_Hao_Test_Box01()

	Say( OwnerID() , "3")	-- ���a
	Say( TargetID() , "4")	-- �_�c

	if ReadRoleValue( TargetID() , EM_RoleValue_PID) == 1 then 				-- ����Ƽƪ��a��P�ɶ}���_�c�A����o�쪺���D�C
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)		--���L���A�еy�ԦA�աC
		return										--
	end											--
	WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 )					

	if BeginCastBar( OwnerID(), "[SO_110195_1]", 50 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	--/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)
		while true do
		sleep( 2 )
			local CastBarStatus = CheckCastBar( OwnerID() )
			if ( CastBarStatus ~= 0 ) then 
				if ( CastBarStatus > 0) then -- ���\
					result = "OKOK"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				elseif ( CastBarStatus < 0 ) then -- ����
					Say( OwnerID() , "CastBarStatus ="..CastBarStatus )
					result = "DAME"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				end
			end
		end
--		result = "OKOK"
--		OwnerID = ���a
--		TargetID = �_�c
		
		if ( result == "OKOK" ) then
			if CheckID( TargetID() ) == true then

				if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then --�ˬd�I�]���
					PlayMotionEX( TargetID() , 145 , 146 )  --�_�c���򼽩�145    146
				--	PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )  --�_�c���򼽩�145    146
				--	Say(TargetID(), " treasure 3")
					GiveBodyItem( OwnerID() , 725154 , 1 )
					SetPlot( TargetID(),"touch","",0 )
					sleep(10)
					DelObj(TargetID())  
				else
					ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
					WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )
				--	SetPlot( TargetID(),"touch","Lua_mika_monstersum_treas30_2",50 )
				end	
			end
		elseif ( result == "DAME" ) then
			WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )	-- ����Ƽƪ��a��P�ɶ}���_�c�A����o�쪺���D�C 
			--SetPlot( TargetID(),"touch","Lua_mika_monstersum_treas30_2",50 )
		end
	end
end	

function Lua_Hao_Test_Box02()

	Say( OwnerID()  , "1" )
	Say( TargetID()  , "2" )

	LoadQuestOption(OwnerID())  --���J���ȼҪO

	SetSpeakDetail( OwnerID() , "1234567" )   -- 
	AddSpeakOption( OwnerID() , TargetID() , "Num1" , "Lua_Hao_Test_Box03" , 0 )
--	AddSpeakOption( OwnerID() , TargetID() , "Num2" , "" , 1 )
--	AddSpeakOption( OwnerID() , TargetID() , "Num3" , "" , 2 )
--	AddSpeakOption( OwnerID() , TargetID() , "Num3" , "" , 3 )
--	AddSpeakOption( OwnerID() , TargetID() , "Num3" , "" , 4 )
--	AddSpeakOption( OwnerID() , TargetID() , "Num3" , "" , 5 )
--	AddSpeakOption( OwnerID() , TargetID() , "Num3" , "" , 6 )
end

function Lua_Hao_Test_Box03()

	SetSpeakDetail( OwnerID() , "0000000" )   -- 
	AddSpeakOption( OwnerID() , TargetID() , "Page up" , "Lua_Hao_Test_Box02" , 0 )

end


function Lua_Hao_Test_Rrturn()

	local X , Y , Z , HP

	X = ReadRoleValue( OwnerID() , EM_RoleValue_X )
	Y = ReadRoleValue( OwnerID() , EM_RoleValue_Y )
	Z = ReadRoleValue( OwnerID() , EM_RoleValue_Z )
	HP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )

	return Lua_Hao_Test_Rrturn2( X , Y , Z , HP )
--	Say( OwnerID() , "123" )
end

function Lua_Hao_Test_Rrturn2( X , Y , Z , HP )

--	do
		Say( OwnerID() , X )
	--	return
--	end
--	do
		Say( OwnerID() , Y )
	--	return true
--	end
--	do
		Say( OwnerID() , Z )
	--	return false
--	end
	Say( OwnerID() , HP )
end

function Lua_Hao_Test_Rrturn3()

	local X
	X = Lua_Hao_Test_Rrturn4()	-- X = 55

	if X == true then
		Say( OwnerID() , "1" )
		return false
	elseif X == false then
		Say( OwnerID() , "2" )
	elseif X == nil then
		Say( OwnerID() , "3" )
	else
		Say( OwnerID() , "X ="..X )
	end
end

function Lua_Hao_Test_Rrturn4()

--	Say( OwnerID() , "I am" )
	return true
end

function Lua_Hao_Test_BeginPlot()

	Lua_Hao_Test_BeginPlot01()

	Say( OwnerID() , "2" )

	BeginPlot( OwnerID() , "Lua_Hao_Test_BeginPlot01", 30 )

	Say( OwnerID() , "3" )

end

function Lua_Hao_Test_BeginPlot01()

	Say( OwnerID() , "1" )
	Sleep(100)

end

function Lua_Hao_Test_Workman00()
	local ID ={ 81277, 81278 , 81279 , 81280 , 81281 , 81282 }--���aID
	local Kill = { 5 , 4 , 1 , 3 , 8 , 10 }--���a�W��
	local Item = { 112131 , 112133 , 112135 , 112211 , 112311 }--�̦W��
	local Count  = { 5 , 4 , 3 , 2 , 1 }--�̦W�����P�ƶq

	local NewID , NewKill
	local Step = 0 
--	local Y = 1

	for i = 1 , 100 , 1 do
		if Kill[1] >= Kill[2] then
			NewKill = Kill[2] -- NewKill = Kill[2]
			Kill[2] = Kill[1]	-- Kill[2] = Kill[1]
			Kill[1] = NewKill -- Kill[1] = NewKill
			NewID = ID[2]	-- NewID = ID[2]
			ID[2] = ID[1]	-- ID[2] = ID[1]
			ID[1] = NewID	-- ID[1] = ID[2]
		end

		if Kill[2] >= Kill[3] then
			NewKill = Kill[3] -- NewKill = Kill[2]
			Kill[3] = Kill[2]	-- Kill[2] = Kill[1]
			Kill[2] = NewKill -- Kill[1] = NewKill
			NewID = ID[3]	-- NewID = ID[2]
			ID[3] = ID[2]	-- ID[2] = ID[1]
			ID[2] = NewID	-- ID[1] = ID[2]
		end

		if Kill[3] >= Kill[4] then
			NewKill = Kill[4] -- NewKill = Kill[2]
			Kill[4] = Kill[3]	-- Kill[2] = Kill[1]
			Kill[3] = NewKill -- Kill[1] = NewKill
			NewID = ID[4]	-- NewID = ID[2]
			ID[4] = ID[3]	-- ID[2] = ID[1]
			ID[3] = NewID	-- ID[1] = ID[2]
		end

		if Kill[4] >= Kill[5] then
			NewKill = Kill[5] -- NewKill = Kill[2]
			Kill[5] = Kill[4]	-- Kill[2] = Kill[1]
			Kill[4] = NewKill -- Kill[1] = NewKill
			NewID = ID[5]	-- NewID = ID[2]
			ID[5] = ID[4]	-- ID[2] = ID[1]
			ID[4] = NewID	-- ID[1] = ID[2]
		end

		if Kill[5] >= Kill[6] then
			NewKill = Kill[6]	-- NewKill = Kill[2]
			Kill[6] = Kill[5]	-- Kill[2] = Kill[1]
			Kill[5] = NewKill	-- Kill[1] = NewKill
			NewID = ID[6]	-- NewID = ID[2]
			ID[6] = ID[5]	-- ID[2] = ID[1]
			ID[5] = NewID	-- ID[1] = ID[2]
		end
--		= X + 1		-- X = 2
		if Kill[1] <= Kill[2] and Kill[2] <= Kill[3] and Kill[3] <= Kill[4] and Kill[4]<= Kill[5] and Kill[5] <= Kill[6] then
			Step = 1
		end
	end			

	if Step == 1 then
		for i = 1 , table.getn(Item) , 1 do
		--	Say( OwnerID() , "Kill ="..Kill[1].." "..Kill[2].." "..Kill[3].." "..Kill[4].." "..Kill[5].." "..Kill[6])
		--	Say( OwnerID() , "ID ="..ID[1].." "..ID[2].." "..ID[3].." "..ID[4].." "..ID[5].." "..ID[6])
			Say( OwnerID() , Kill[i].." "..ID[i].." "..Item[i].." "..Count[i] )
		--	Say( OwnerID() , "Item ="..Item[1].." "..Item[2].." "..Item[3].." "..Item[4].." "..Item[5] )
		--	Say( OwnerID() , "Count ="..Count[1].." "..Count[2].." "..Count[3].." "..Count[4].." "..Count[5] )
		--	Say( OwnerID() , "ID = "..ID[i].."Item = "..Item[i].."Count = "..Count[i]  )
		--	GiveBodyItem( OwnerID() , Item[i] , Count[i] )
		end
	end
end

function Lua_Hao_Test_SpringSeason_Buff()

	local Buff = { 507846 , 507847 , 507848 , 507849 , 507850 }
	local Random = Rand(5)+1
	local Count = 10
	local Answer = Random
	local Reg4
	local Step = 0

	for i = 1 , 8 , 1 do
		AddBuff( OwnerID() , Buff[Answer] , 0 , -1 )
	--	if Step == 0 then
	--		Say( OwnerID() , "Answer = " .. Answer )
	--		step = 1
	--	end
	--	Say( OwnerID() , "Random = " .. Random )
	--	Reg4 = WriteRoleValue( OwnerID() , EM_RoleValue_Register+4 , Random )
		Random = ( Rand(5)+1 )*Count + Random
		Answer = math.floor( Random / Count )
		Count = Count*10
	--	if i <= 7 then
	--		Say( OwnerID() , "Answer = " .. Answer )
	--	end
	end
end

function Lua_Hao_Test_SpringSeason_Buff2()

--	local Reg4 = ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 )
	local Reg4 = 12334535
	local Num
	local Answer = { }
	local Count = 10

	for i = 1 , 8 , 1 do
		Num = Reg4%Count
		Reg4 = Math.floor( Reg4 / Count )
		Answer[i] = Num
		Say( OwnerID() , Answer[i] )
	end
end

function Lua_Test_spring_rabbit_01()
--	Say( OwnerID() , "Owner" ) --NPC
--	SetPlot( OwnerID() , "range" , "Lua_Test_spring_rabbit_02" , 50 ) --�d��@��

	local X = 0

	while true do
	--	local Dis = CheckDistance( OwnerID() , TargetID() , 50 ) --�ˬd���a�P�ߤl���Z��
	--	if Dis == true then
			BeginPlot( OwnerID() , "Lua_Test_spring_rabbit_02" , 0 ) --�L������
			sleep(10)
		--	X = X + 1
		--	Say( OwnerID() , "X = "..X )
	--	end
	end
end

function Lua_Test_spring_rabbit_02()

	local Player =SearchRangePlayer( OwnerID() , 50 )

	for i= 0 , table.getn(Player) , 1 do
		local Dis = GetDistance( OwnerID() , Player[i] )
		Say( Player[i] , "Dis = "..Dis )
		AddBuff( Player[i] , 509701 , 0 , 2 ) --�ܯQ�t
	end
end

function Lua_Hao_Test_ReCall_ID()

	SetPlot( OwnerID() , "range" , "Lua_Hao_Test_ReCall_ID_02" , 100 )
end

function Lua_Hao_Test_ReCall_ID_02()

	WriteRoleValue( TargetID() , EM_RoleValue_Register+9 , OwnerID() )
	BeginPlot( TargetID() , "Lua_Hao_Test_ReCall_ID_03" , 0 )
end

function Lua_Hao_Test_ReCall_ID_03()

	while true do
		local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 )
		if CheckID( Player ) == false then
			Say( OwnerID() , "ChangeLife" )
			SetPlot( OwnerID() , "range" , " " , 0 )  
			break
		else
			Say( OwnerID() , "Player = "..Player )
		end
		Sleep(50)
	end
end

function Lua_Hao_Test_Open_Count()	-- �}�Ұӫ�����

	OpenClientMenu( OwnerID() , EM_ClientMenuType_Merchant )

end

function Lua_Hao_Test_Weapon_Change()

	Lua_Hao_NPCofAll_Clear( 118853 , 1000 )
end

function Lua_Hao_Test_Random_Count()	-- ��� Rand(5)+1 �P Rand(100)+1 �϶����G�O�_����

	local Answer , Answer2 = { 0 , 0 , 0 , 0 , 0 } , { 0 , 0 , 0 , 0 , 0 }
	local Value = 1000

	for i = 1 , Value , 1 do
		local R1 , R2 = Rand(5)+1 , Rand(100)+1
	--	DebugMsg( 0 , 0 , "R1 = "..R1 )
	--	DebugMsg( 0 , 0 , "R2 = "..R2 )
		for j = 1 , table.getn(Answer) , 1 do
			if R1 == j then
				Answer[j] = Answer[j]+1
			--	DebugMsg( 0 , 0 , "Answer"..j.." = "..Answer[j] )
			end
		end

		if R2 <= 20 then
			Answer2[1] = Answer2[1]+1
		elseif R2 >= 21 and R2 <= 40 then
			Answer2[2] = Answer2[2]+1
		elseif R2 >= 41 and R2 <= 60 then
			Answer2[3] = Answer2[3]+1
		elseif R2 >= 61 and R2 <= 80 then
			Answer2[4] = Answer2[4]+1
		elseif R2 >= 81 and R2 <= 100 then
			Answer2[5] = Answer2[5]+1
		end
	end

	local Ans1 = Answer[1] + Answer[2] + Answer[3] + Answer[4] + Answer[5]
	local Ans2 = Answer2[1] + Answer2[2] + Answer2[3] + Answer2[4] + Answer2[5]

	DebugMsg( 0 , 0 , "0 = ".."R005".." : ".."R100" )

	if Ans1 == Value and Ans2 == Value then
		for i = 1 , table.getn(Answer) , 1 do
			DebugMsg( 0 , 0 , i.." = "..Answer[i].." : "..Answer2[i] )
		end
	end
end

function Lua_Hao_Test_Dual_TargetDBID()

	local A = ReadRoleValue( OwnerID() , EM_RoleValue_DualTargetDBID )
	local B = ReadRoleValue( OwnerID() , EM_RoleValue_CastingType )
	local C = ReadRoleValue( TargetID() , EM_RoleValue_DualTargetDBID )
	Say( OwnerID() , "A = "..A )
	Say( OwnerID() , "B = "..B )
	Say( OwnerID() , "C = "..C )
end

function Lua_Instance_Bonus_Tester()

	local Obj = Role:new( OwnerID() )
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )	-- �P�_Zone�P���y
	--local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) 
	--local Zone = ZoneID -1000*math.floor( ZoneID / 1000 )

	if ZoneID == 351 then-- ���Ը��R1	-- ���� GameOver
		GiveBodyItem( OwnerID() , 205814 , 1 )
		local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local NPCID = { 101489 , 101269 , 101636 , 101640 , 101644 , 101648 , 101652 , 102982 }
		for i = 1 , table.getn(NPCID) , 1 do
			Lua_Hao_NPCofAll_Clear( NPCID[i] , 500 ) -- �M�������W�d�򤺪��Ҧ�����
		end
		local Count = SetSearchAllNPC( RoomID )
		local Obj
		local NPC , Number = { 111811 , 111812 } , 0

--		Say( OwnerID() , "Count = "..Count )

		if  Count ~= 0 then
			for i=1 , Count , 1 do
				local ID = GetSearchResult()
				Obj=Role:New(ID)
				if Obj:IsNPC() == true then
				local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--�T�{�Ҧ�NPC���s��
					for j = 1 , table.getn( NPC ) , 1 do
						if Name == NPC[j] then  --�Y���}�C������
							WriteRoleValue( ID , EM_RoleValue_Register , 1 )
							Number = Number + 1
						--	Say( ID , "Number = "..Number )
						end
					end
				end
			end
		--	Say( OwnerID() , "Number = "..Number )
		end
		Say( OwnerID() , "GM Mode" )
	elseif ZoneID == 352 then -- �����L�v�ްƥ�
	--	BeginPlot( OwnerID() , "Lua_Hao_Goblinbox_TesT" , 0 )
		local Key = { 542875 , 542876 , 542877 , 542878 , 543557 , 543558 , 543559 , 543560 }
		local Key2 = { 542743 , 542904 , 542905 , 542742 , 542869 , 542870 , 542871 }
		for i = 1 , table.getn(Key) , 1 do
			SetFlag( OwnerID() , Key[i] , 1 )
		end
		for i = 1 , table.getn(Key2) , 1 do
			SetFlag( OwnerID() , Key2[i] , 0 )
		end
		Say( OwnerID() , "GM Mode" )
	elseif ZoneID == 353 then -- ���Ը��R2
		GiveBodyItem( OwnerID() , 203032 , 1 )
		GiveBodyItem( OwnerID() , 205814 , 1 )
		local NPCID = { 113108 , 113109 , 113110 , 113111 , 113113 }
		for i = 1 , table.getn(NPCID) , 1 do
			Lua_Hao_NPCofAll_Clear( NPCID[i] , 500 ) -- �M�������W�d�򤺪��Ҧ�����
		end
		Say( OwnerID() , "GM Mode" )
	elseif ZoneID == 355 then -- �j�N���
		GiveBodyItem( OwnerID() , 206426 , 1 )
		if CheckBuff( OwnerID() , 505590 ) == true then
			CancelBuff( OwnerID() , 505590 )
			AddBuff(OwnerID() , 505590 , 1 , -1 )
		--	SetFlag( OwnerID() , 543406 , 0 )
		end
		Say( OwnerID() , "GM Mode" )
	end
end

function Lua_Hao_Tell_How_to_Remove_Table()

	local Count  = { 1 , 2 , 3 , 4 , 5 }
	local Random , RemoveCount
	local NewCount = { }

	NewCount = Count
	for i = 1 , 2 , 1 do
	--	for j = 1 , table.getn(Count) , 1 do
			Random = Rand(table.getn(NewCount))+1
			RemoveCount = Table.remove( NewCount , Random )
	--		break
			if i == 2 then
				Count = { 1 , 2 , 3 , 4 , 5 }
			end
	--	end
		Say( OwnerID()  , "RemoveCount = "..RemoveCount )
	end

	for i = 1 , Table.getn(Count) , 1 do
		Say( OwnerID()  , "Count = "..Count[i] )
	end

	for i = 1 , Table.getn(NewCount) , 1 do
		Say( OwnerID()  , "NewCount = "..NewCount[i] )
	end

end

function Lua_Hao_Test_Party_ID()

	local Player = LuaFunc_PartyData( OwnerID() )	-- ���o�����T
	local Count = 0
	for i = 1 , Player[0] , 1 do
		DebugMsg( OwnerID() , 0 , Player[i].." = "..Count )
		Count = Count + 1
		AddBuff( Player[i] , 507602 , 0 , 1 )
	end
end

function Lua_Hao_Test_Read_ObjID()

	local Read = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	DebugMsg( OwnerID() , 0 , "Read = "..Read )
end


function Lua_Hao_Tell_DB_Playername()

	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_DBID )
	local Name = GetGUIDByDBID( Player )
--	local Playername = GetName( OwnerID() )
	local Playername = GetName( Name )

	Say( OwnerID() , "Player = "..Player )
	Say( OwnerID() , "Name = "..Name )
	Say( OwnerID() , "PlayerName = "..Playername )
end

function Lua_Hao_Tell_DB_Playername_2()

	if Zone51_Name == nil then
		Zone51_Name = " "
	end

	Zone51_Name = GetName( OwnerID() )

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- ���o���a X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local QBOX = CreateObj( 113105 , BaseX , BaseY , BaseZ , BaseDir , 1 ) --�b���a(�y��)�y�� X.Y.Z.Dir ���W�ǳƳХߪ���

	local DBID = ReadRoleValue( OwnerID() , EM_RoleValue_DBID )
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	WriteRoleValue( QBOX , EM_RoleValue_Register+1 , DBID )
	WriteRoleValue( QBOX , EM_RoleValue_Register+2 , OrgID )
	local Reg1 = ReadRoleValue( QBOX , EM_RoleValue_Register+1 )	-- DBID
	local Reg2 = ReadRoleValue( QBOX , EM_RoleValue_Register+2 )	-- GUID
--	WriteRoleValue( QBOX , EM_RoleValue_Register+2 , GUID )
--	WriteRoleValue( QBOX , EM_RoleValue_Register+3 , Playername )
  
	SetModeEx( QBOX , EM_SetModeType_Mark , true )--�аO
	SetModeEx( QBOX , EM_SetModeType_Show , true )--���
	AddToPartition( QBOX , RoomID )

	CallPlot( QBOX , "Lua_Hao_Tell_DB_Playername_3" , Reg1 , Reg2 )
end

function Lua_Hao_Tell_DB_Playername_3( Reg1 , Reg2 )

	while true do
		local GUID = GetGUIDByDBID( Reg1 )
		local Playername = 0
		if GUID == Nil then
			GUID = 0
	--	else
	--		Playername = GetName( GUID )
		end
		DebugMsg( 0 , 0 , "DBID = "..Reg1 )
		DebugMsg( 0 , 0 , "OrgID = "..Reg2 )
		DebugMsg( 0 , 0 , "GUID = "..GUID )
		DebugMsg( 0 , 0 , "PlayerName = "..Zone51_Name )
		Say( OwnerID() , "PlayerName = "..Zone51_Name )
		Sleep(50)
	end
end

function Lua_Hao_Test_Restore(Check)

	if Check == 0 then
		CancelBuff( OwnerID() , 620774 )
	elseif Check == 1 then
		AddBuff( OwnerID() , 620774 , 0 , -1 )
	end
end

function Lua_Hao_Test_Restore2()

	local Data = {}
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )

	Data[1] = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
	Data[2] = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )
	while true do
		Data[1] = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
		Data[2] = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )
		DebugMsg( OwnerID() , Room , "HP / MaxHP = "..Data[1].." / "..Data[2] )
		WriteRoleValue( OwnerID() , EM_RoleValue_HP , Data[2]*0.01 )
		Sleep(50)
	end
end

function Lua_Hao_Get_Height_Test()

	local Value = {}
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )

	Value[1] = ReadRoleValue ( OwnerID() , EM_RoleValue_X )
	Value[2] = ReadRoleValue ( OwnerID() , EM_RoleValue_Y )
	Value[3] = ReadRoleValue ( OwnerID() , EM_RoleValue_Z )

	Value[4] = GetHeight( Value[1] , Value[2] , Value[3] )

	DebugMsg( OwnerID() , Room , " X = "..Value[1].." Y = "..Value[2].." Z = "..Value[3].." New Y ="..Value[4] )
end

function Lua_Chcek_Answer_1()

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )

	local Count , Value = 0 , 0

	for i = 1 , 10 , 2 do
		Count = Count + i
		DebugMsg( Player , Room , "Value = "..i )
	end
	DebugMsg( Player , Room , "Total = "..Count )
end

function Lua_Chcek_Answer_2()

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )

	local Count = 0

	while Count < 21 do
		local Select = Rand(6)+1
		Count = Count + Select 
		DebugMsg( Player , Room , "Count = "..Count )
	end
	DebugMsg( Player , Room , "The Answer = "..Count )
end

function Lua_Chcek_Answer_3()

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )

	for i = 1 , 3 , 1 do
		for j = 1 , 3 , 1 do
			for k = 1 , 3 , 1 do
				DebugMsg( Player , Room , i.."*"..j.."*"..k.." = "..i*j*k )
			end
		end
	end
end

function Lua_Chcek_Answer_4()

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Lv = ReadRoleValue( Player , EM_RoleValue_LV )
	local Range = { 20 , 40 , 60 , 80 , 100 }

	for i = 1 , table.getn(Range) , 1 do
		if Lv <= Range[i] then
			GiveBodyItem( Player , 207634+i , 1 )
			break
		end
	end
end

function Lua_Hao_Test_Inpairs_Avg()

	local Total = 0
	local Score = {}
		Score["Tom"] = 70
		Score["Ken"] = 65
		Score["Bill"] = 15
		Score["Hank"] = 33

	for Name , Value in pairs(Score) do
		for i = 1 , table.getn(Score) , 1 do
			Total = Total + Score[Name]
			break
		end
	end
	Say( OwnerID() , Total / table.getn(Score) )
end

function Lua_Chcek_Answer_W2_Q3()

	local List = { 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 , 10 }
	local Value = {}
	local Ans

	while true do
		for i = 0 , 2 , 1 do
			local Random = math.Random(table.getn(List)-i)
			Ans = table.remove( List , Random )
			Say( OwnerID() , Ans )
		end
		sleep(10)
	end
end

function Lua_CheckTitleSys_Count( Lv )
-- �j�M���ؼСB���w�j�M���������šA�^�ǫ������������Ū��j�M�ƶq

	local Player = OwnerID()
	local Count = 0
	local Rare
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )

	for i = 530000 , 530999 , 1 do
		if CountBodyItem( Player , i ) == 1 then
			Rare = GameObjInfo_int( i , "Rare" )
			if Rare == Lv then
				Count = Count + 1
			end
		end
	end
	DebugMsg( Player , Room , Count )
	return Count
end

function Lua_CheckTitleSys_data( Obj )

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Lv = ReadRoleValue( Player , EM_RoleValue_TitleSys_Lv )
	local Exp = ReadRoleValue( Player , EM_RoleValue_TitleSys_Exp )

	DebugMsg( Player , Room , "Lv = "..Lv.." Exp = "..Exp )
	return Lv , Exp
end

function Lua_Hao_Test_DirectX()	-- �n��

	local Obj = OwnerID()
	local RoomID = ReadRoleValue( Obj , EM_RoleValue_RoomID )
	local BaseX = ReadRoleValue( Obj , EM_RoleValue_X )
	local BaseY = ReadRoleValue( Obj , EM_RoleValue_Y )
	local BaseZ = ReadRoleValue( Obj , EM_RoleValue_Z )
	local BaseDir = ReadRoleValue( Obj , EM_RoleValue_Dir )
	local Dis = 1
	local CreateID = 101538
	local ObjID = CreateObj( CreateID , BaseX , BaseY , BaseZ , BaseDir , 1 )
	AdjustFaceDir( ObjID , Obj , 180 ) 	-- ���إߪ��󭱦V�ѦҪ���
	AddToPartition( ObjID , RoomID )

	for i = 1 , 1000 , 1 do
	--	local Org = Role:new( Obj )
		local Org = ObjID
		local Pos = {}
	--	local Dir = ReadRoleValue( Obj , EM_RoleValue_Dir )
	--	local Dir = Org:Dir()
		local Dir = ReadRoleValue( Obj , EM_RoleValue_Dir )
		local NewRole
		local Cal
		if face == nil or Type( face) ~= "number" then
			face = 0
		end
	-- ���t�H�����e
	-- �t���H������
	-- Z�b + �����A- ���k
		Cal = (math.pi/180)*(Dir) 
		local X = ReadRoleValue( Obj , EM_RoleValue_X )
		local Y = ReadRoleValue( Obj , EM_RoleValue_Y )
		local Z = ReadRoleValue( Obj , EM_RoleValue_Z )
		 
		Pos["X"] = X + (Dis*math.cos(Cal))*i
		Pos["Z"] = Z - (Dis*math.sin(Cal))*i
		Pos["Y"] = GetHeight( Pos["X"] , Y , Pos["Z"] )
		
	--	Pos["X"] = Org:X() + (Dis*math.cos(Cal))*i
	--	Pos["Z"] = Org:Z() - (Dis*math.sin(Cal))*i
	--	Pos["Y"] = GetHeight( Pos["X"] , Org:Y() , Pos["Z"] )
		for j = 1 , 9 , 1 do
			if CheckLine( ObjID , Pos["X"] , Pos["Y"] , Pos["Z"] ) == false then
		--	if CheckLine( Obj , Pos["X"] , Pos["Y"] , Pos["Z"] ) == false then
				Pos["X"] = X +(Dis*math.cos(Cal))*(10-j)/10
				Pos["Z"] = Z - (Dis*math.sin(Cal))*(10-j)/10
				Pos["Y"] = GetHeight( Pos["X"] , Y , Pos["Z"] )
			else
				break
			end
		end
		if Dis >= 0 then
			Dir = Dir +180
			Dir = Dir +180-face
		else
			Dir = Dir
			Dir = Dir + face
		end
		if Dir > 360 then
			Dir = Dir - 360
		end
		if Dir < 0 then
			Dir = Dir + 360
		end
	--	LuaFunc_WaitMoveTo( ObjID , Pos["X"]  , Pos["Y"] , Pos["Z"] )
		MoveDirect( ObjID , Pos["X"]  , Pos["Y"] , Pos["Z"] )
	--	DebugMsg( Obj , RoomID , "Cal = "..Cal.." X = "..Pos["X"].." Y = "..Pos["Y"].." Z = "..Pos["Z"] )
		sleep(1)
	end
--	local Dir = ReadRoleValue( ObjID , EM_RoleValue_Dir )
--	Say( Obj , "Dir = "..Dir )
end

function Lua_Hao_Test_Table999()

	local Test = { 1 , 2 , 3 , 4 }
	local X = 4
	
	while x>0 do
		for i=1 , table.getn(Test) , 1 do
			Say( OwnerID() , "i ="..Test[i] )
			table.remove( Test , i )
			break
		end
		x = x - 1 
		sleep(1)
	end
end

function Lua_Hao_Test_GetHeight()

	local Player = OwnerID()
	local X , Y , Z = 	ReadRoleValue( Player , EM_RoleValue_X ) , 
			ReadRoleValue( Player , EM_RoleValue_Y ) ,
			ReadRoleValue( Player , EM_RoleValue_Z ) 

	local NewX , NewY , NewZ = X , Y , Z
	local Height
	
	while NewX == X and NewZ == Z do
		NewX = ReadRoleValue( Player , EM_RoleValue_X )
		NewY = ReadRoleValue( Player , EM_RoleValue_Y )
		NewZ = ReadRoleValue( Player , EM_RoleValue_Z )
	--	Height = GetHeight( X , Y , Z )
		DebugMsg( Player , 0 , "NewY = "..NewY )
	--	DebugMsg( Player , 0 , "Height = "..Height )
		Sleep(1)
	end
end

function lua_Hao_2012hallow_obj2_001()
	local OID = OwnerID()
	setplot(OID, "touch", "lua_Hao_2012hallow_obj2_002", 30 )
end

function lua_Hao_2012hallow_obj2_002()
	local OID = OwnerID()  --���a
	local TID = TargetID()  -- ��
--	Say( OID , "1" )
--	Say( TID , "2" )

	-- �ˬd�ʬO�_��cd buff (����A��)

--	while true do
		CastSpell( TID , TID , 498629 ) 
	--	SysCastSpellLv( TID , TID , 496587 , 0 )
--		sleep(5)
--	end
--	WriteRoleValue(OID, EM_RoleValue_Register+9 , TID )
--	AddBuff(OID, 623466, 0, -1)  -- ���ޯ�BUFF

end

function lua_Hao_2012hallow_obj2_003()

	local OID = OwnerID()  -- ��
	local TID = TargetID()  -- ��

	local OrgID = ReadRoleValue( TID , EM_RoleValue_OrgID )
	
	if OrgID == 107346 then
		Say( TID , "Hello" )
	end
end

function Lua_Hao_Test_DesignLog_Reply()-- DesignLog �^�ǬۦP�s���ɡA�r��L�k���P
	
	local Player = OwnerID()
	DesignLog( Player , 168888 , "Step.1 = 1" )
	DesignLog( Player , 168888 , "Step.2 = 2" )
	DebugMsg( Player , 0 , "Ok" )
end

function Lua_Hao_Test_Set_Weapon()	-- ���յ����Y��
 	local Player = OwnerID()
 	SetRoleEq_Player( Player , 0 , 227700 )
 end

function Hao_Test_Table_With_Reg()
	local Player = OwnerID()
	local List = { 1 , 2 }
	WriteRoleValue( Player , EM_RoleValue_Register+1 , List )
	local Answer = ReadRoleValue( Player , EM_RoleValue_Register+1 )
	
	for Number = 1 , #Answer , 1 do
		Say( Player , Number )
	end
end

function Hao_Set_Obj_Test( ObjID )

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local X , Y , Z , Dir = Lua_Hao_Return_Coordinate(Player)
	local Npc = CreateObj( ObjID , X , Y , Z , Dir , 1 )
	CallPlot( Npc , "Hao_Set_Obj_Level_Cap" , Npc , Player , Room )
--	Hao_Set_Obj_Level_Cap(Npc , Player , Room )
	AddToPartition( Npc , Room )
	DebugMsg( Player , Room , "Over" )
end

function Hao_Set_Obj_Level_Cap( ObjID , Player , Room )	-- �]�w���w���󪺵��Ŭ��Ӧ��A���]�w�����ŤW��
	DebugMsg( Player , Room , "ObjID = "..ObjID )
	local LV_Cap = ReadRoleValue( OwnerID() , EM_RoleValue_MaxLv )	-- Ū���Ӧ��A���]�w�����ŤW��
	WriteRoleValue( ObjID , EM_RoleValue_LV , LV_Cap )
	DebugMsg( Player , Room , "LV_Cap = "..LV_Cap )
end
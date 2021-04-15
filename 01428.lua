function LuaZone_DEFEND_ChoseMonster()
	local CampID = GetRoleCampID(OwnerID())
	if CampID == 9 then
		BeginPlot(OwnerID(),"LuaZone_DEFEND_ChoseMonster288",0)
	elseif CampID == 8 then
		BeginPlot(OwnerID(),"LuaZone_DEFEND_ChoseMonster192",0)
	end
end
function LuaZone_DEFEND_ChoseMonster288()
	local BornMonster = LuaFun_BornHideObj(100292)	--�إ����ê���
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local n = 0
	local DialogStatus = 0
	local Temp =  { 102396,102397,102398,102399,102400 }
	local TempMoney = { 40,160,640,2560,10240 }
	local BaseMoney = { 7,25,90,324,1166 }
	local TransferSelect = {}
	TransferSelect[0] = { "[SC_DEFEND_NEEDENGER][$SETVAR1=".."["..Temp[1].."]".."][$SETVAR2="..TempMoney[1].."]" }
	TransferSelect[1] = { "[SC_DEFEND_NEEDENGER][$SETVAR1=".."["..Temp[2].."]".."][$SETVAR2="..TempMoney[2].."]" }
	TransferSelect[2] = { "[SC_DEFEND_NEEDENGER][$SETVAR1=".."["..Temp[3].."]".."][$SETVAR2="..TempMoney[3].."]" }
	TransferSelect[3] = { "[SC_DEFEND_NEEDENGER][$SETVAR1=".."["..Temp[4].."]".."][$SETVAR2="..TempMoney[4].."]" }
	TransferSelect[4] = { "[SC_DEFEND_NEEDENGER][$SETVAR1=".."["..Temp[5].."]".."][$SETVAR2="..TempMoney[5].."]" }
	TransferSelect[5] = { "[SO_EXIT]" }				-- ���}���
	
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		
		DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_DEFEND_BUILDASK]" )	--�аݧA�n�l����@�ةǪ��e�ӧU�}�H
		for i = 0, table.getn( TransferSelect ) do
			DialogSelectStr( OwnerID() , TransferSelect[i][1] )
		end
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--��ưe�X�����D
			return 0
		end

		while 1 do
			sleep( 1 )
			n = n + 1
			DialogStatus = DialogGetResult( OwnerID() )
			--Say( OwnerID() , DialogStatus )
			if n > 600 then -- ���L�a�j��A600 = �@����
				ScriptMessage( OwnerID() , OwnerID() , 0, "�L�a�j��ζ��m�L�[", 0 )
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				DialogClose( OwnerID() )
				break
			else
				--ScriptMessage( OwnerID() , OwnerID() , 0, "�X�k�j��", 0 )
			end

			if ( DialogStatus == 5 ) or ( DialogStatus == -1 ) then
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				DialogClose( OwnerID() )
				break
			elseif  ( DialogStatus ~= -2 ) then
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				DialogClose( OwnerID() )
				if T1Score[RoomID] >= TempMoney[DialogStatus+1] then
					T1BaseScore[RoomID] = T1BaseScore[RoomID] + (BaseMoney[DialogStatus+1])
					WriteRoleValue( BornMonster , EM_RoleValue_PID, Temp[DialogStatus+1] )
					BeginPlot( BornMonster ,"LuaZone_DEFEND_MonsterBorn288",0)
					T1Score[RoomID] = T1Score[RoomID] - TempMoney[DialogStatus+1]
					SetVar(RoomID, 2 , T1Score[RoomID])
					--debugMsg( 0, RoomID ,"SetVar team1 = "..T1Score[RoomID])
				else
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )
					ScriptMessage( OwnerID(),OwnerID(),1,"[SC_DEFEND_TOWERNOENGER]",0)	--�A�S����������q
					DelObj(BornMonster)		
				end
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end
--------B����
function LuaZone_DEFEND_ChoseMonster192()
	local BornMonster = LuaFun_BornHideObj(100292)	--�إ����ê���
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local n = 0
	local DialogStatus = 0
	local Temp =  { 102396,102397,102398,102399,102400 }
	local TempMoney = { 40,160,640,2560,10240 }
	local BaseMoney = { 7,25,90,324,1166 }
	local TransferSelect = {}
	TransferSelect[0] = { "[SC_DEFEND_NEEDENGER][$SETVAR1=".."["..Temp[1].."]".."][$SETVAR2="..TempMoney[1].."]" }
	TransferSelect[1] = { "[SC_DEFEND_NEEDENGER][$SETVAR1=".."["..Temp[2].."]".."][$SETVAR2="..TempMoney[2].."]" }
	TransferSelect[2] = { "[SC_DEFEND_NEEDENGER][$SETVAR1=".."["..Temp[3].."]".."][$SETVAR2="..TempMoney[3].."]" }
	TransferSelect[3] = { "[SC_DEFEND_NEEDENGER][$SETVAR1=".."["..Temp[4].."]".."][$SETVAR2="..TempMoney[4].."]" }
	TransferSelect[4] = { "[SC_DEFEND_NEEDENGER][$SETVAR1=".."["..Temp[5].."]".."][$SETVAR2="..TempMoney[5].."]" }
	TransferSelect[5] = { "[SO_EXIT]" }				-- ���}���
	
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_DEFEND_BUILDASK]" )	--�аݧA�n�l����@�ةǪ��e�ӧU�}�H
		for i = 0, table.getn( TransferSelect ) do
			DialogSelectStr( OwnerID() , TransferSelect[i][1] )
		end
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--��ưe�X�����D
			return 0
		end

		while 1 do
			sleep( 1 )
			n = n + 1
			DialogStatus = DialogGetResult( OwnerID() )
			--Say( OwnerID() , DialogStatus )
			if n > 600 then -- ���L�a�j��A600 = �@����
				ScriptMessage( OwnerID() , OwnerID() , 0, "�L�a�j��ζ��m�L�[", 0 )
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				DialogClose( OwnerID() )
				break
			else
				--ScriptMessage( OwnerID() , OwnerID() , 0, "�X�k�j��", 0 )
			end

			if ( DialogStatus == 5 ) or ( DialogStatus == -1 ) then
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				DialogClose( OwnerID() )
				break
			elseif  ( DialogStatus ~= -2 ) then
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				DialogClose( OwnerID() )
				if T2Score[RoomID] >= TempMoney[DialogStatus+1] then
					T2BaseScore[RoomID] = T2BaseScore[RoomID] + (BaseMoney[DialogStatus+1])
					WriteRoleValue( BornMonster , EM_RoleValue_PID, Temp[DialogStatus+1] )
					BeginPlot( BornMonster ,"LuaZone_DEFEND_MonsterBorn192",0)
					T2Score[RoomID] = T2Score[RoomID] - TempMoney[DialogStatus+1]
					SetVar(RoomID, 1 , T2Score[RoomID])
					--debugMsg( 0, RoomID ,"SetVar team2 = "..T2Score[RoomID])
				else
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )
					ScriptMessage( OwnerID(),OwnerID(),1,"[SC_DEFEND_TOWERNOENGER]",0)	--�A�S����������q
					DelObj(BornMonster)		
				end
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end
function LuaZone_DEFEND_MonsterBorn288()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local MonsterID = ReadRoleValue( OwnerID() , EM_RoleValue_PID)
	local Obj = DavisTest_BornMonster288(MonsterID,5)
	DelObj(OwnerID())
end
function LuaZone_DEFEND_MonsterBorn192()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local MonsterID = ReadRoleValue( OwnerID() , EM_RoleValue_PID)
	local Obj = DavisTest_BornMonster192(MonsterID,5)
	DelObj(OwnerID())
end

function LuaZone_DEFEND_DeadAddMoney()--192
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID)
	Temp =   { 102404,102396,102397,102398,102399,102400 }
	for i = 1, table.getn(Temp) do
		--DebugMsg( 0, RoomID ,"OrgID = "..OrgID.."Temp = "..Temp[i].."i = "..i)
		if OrgID == Temp[i] then
			T1Score[RoomID] = T1Score[RoomID] + 4^(i-1)
			SetVar(RoomID, 2 , T1Score[RoomID])
			--debugMsg( 0, RoomID ,"SetVar team1 = "..T1Score[RoomID])
			if OrgID == 102404 then
				--�ˬd�O�_�����c
				local CountBuff = BuffCount ( OwnerID())
				for j = 0 , CountBuff do
					--DebugMsg( 0, RoomID ,"Red Team SearchBuffing..."..j)
					local BuffID = BuffInfo ( OwnerID() , j , EM_BuffInfoType_BuffID )
					--DebugMsg( 0, RoomID ,"Red Team BuffID="..BuffID)
					if (BuffID == 504336) then
						CancelBuff_NoEvent( OwnerID() , BuffID )
						T1Honor[RoomID] = T1Honor[RoomID] + 1
						local TeamName = "[BG_450_TEAM1_NAME]" 
						ScriptMessage( OwnerID(),  -1, 1, "[SC_DEFEND_EVILMONSTERKILL][$SETVAR1="..TeamName.."]" , C_SYSTEM )	--x�������Q�]�ƪ�[102404]
					end
				end
			end
		end
	end
end
function LuaZone_DEFEND_DeadAddMoney1()--288
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID)
	Temp =  { 102404,102396,102397,102398,102399,102400 }
	for i = 1, table.getn(Temp) do
		--DebugMsg( 0, RoomID ,"OrgID = "..OrgID.."Temp = "..Temp[i].."i = "..i)
		if OrgID == Temp[i] then
			T2Score[RoomID] = T2Score[RoomID] + 4^(i-1)
			SetVar(RoomID, 1 , T2Score[RoomID])
			--debugMsg( 0, RoomID ,"SetVar team2 = "..T2Score[RoomID])
			if OrgID == 102404 then
				--�ˬd�O�_�����c
				local CountBuff = BuffCount ( OwnerID())
				for j = 0 , CountBuff do
					--DebugMsg( 0, RoomID ,"Red Team SearchBuffing..."..j)
					local BuffID = BuffInfo ( OwnerID() , j , EM_BuffInfoType_BuffID )
					--DebugMsg( 0, RoomID ,"Red Team BuffID="..BuffID)
					if (BuffID == 504336) then
						CancelBuff_NoEvent( OwnerID() , BuffID )
						T2Honor[RoomID] = T2Honor[RoomID] + 1
						local TeamName = "[BG_450_TEAM2_NAME]" 
						ScriptMessage( OwnerID(),  -1, 1, "[SC_DEFEND_EVILMONSTERKILL][$SETVAR1="..TeamName.."]" , C_SYSTEM )	--x�������Q�]�ƪ�[102404]
					end
				end
			end
		end
	end
end
function LuaZone_DEFEND_BaseMonsterBorn288()--�Ĥ@���]���^
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local MonsterID = 102404
	local Obj = DavisTest_BornMonster288(MonsterID,10)
end
function LuaZone_DEFEND_BaseMonsterBorn192()--�ĤG���]�š^
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local MonsterID = 102404
	local Obj = DavisTest_BornMonster192(MonsterID,10)
end
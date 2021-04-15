--�g�b106690
--Ctrl,����cl_AC1_WB_ctarlAICheakP
--Ctrl,R1 =>�O���̲�boss�O�_�Q���F�C
--ctarlAI,PID =>�O��Ctrl
function cl_AC1_WB_ctarlAICheakP()
	local Ctrl = OwnerID()
	local RoomID = ReadRoleValue ( Ctrl , EM_RoleValue_RoomID )
	local Npc_X,Npc_Y,Npc_Z = Cl_Read_OwnerXYZ( Ctrl )
	local Door_Open = GetWorldVar( "SC_BLACKWATER_P3_OPENDOOR" )
	local CombatBegin = 0
	local ZoneID = 2
	local XX = 2235
	local YY = 59
	local ZZ = 1849
	local Dir = 69
	local Clock_Npc = Cl_CreateObj_ForHideBall( 102679 , 267 , -150 , -77 , RoomID ) 	--�|�����׽c(�ΨӲ��ͭp�ɪ�npc)
		SetModeEx( Clock_Npc , EM_SetModeType_Show, false) 
		WriteRoleValue ( Clock_Npc , EM_RoleValue_PID , Ctrl ) 
		CallPlot( Clock_Npc, "cl_Open_Clock", 0 )

	local Send_Door = CreateObjByFlag( 106149 , 781061 , 0 , 1 ) 				--�ǰe��150%
		SetModeEx ( Send_Door , EM_SetModeType_Obstruct, false) 
		SetModeEx( Send_Door , EM_SetModeType_Strikback, false) 
		SetModeEx( Send_Door , EM_SetModeType_Move, false) 
		SetModeEx( Send_Door , EM_SetModeType_Searchenemy, false)
		SetModeEx( Send_Door , EM_SetModeType_Mark, false)
		SetModeEx( Send_Door , EM_SetModeType_ShowRoleHead, false) 
		SetModeEx( Send_Door , EM_SetModeType_Fight, false) 
		SetModeEx( Send_Door , EM_SetModeType_NotShowHPMP , false) 
		SetPlot( Send_Door , "collision" , "cl_AC1_WB_OutDoor" , 30 )
		AddToPartition ( Send_Door , RoomID ) 
	local time = 1;
	while 1 do
		--���հT��
		if time%30==0 then 
			if ReadRoleValue( Ctrl,EM_RoleValue_Register9)==1 then
			local PlayNum = SetSearchAllPlayer( RoomID ) 	-----Ū�����ZONE���Ҧ����a�o��Ū���쪺�O�ƶq
				DebugMsg( 0,RoomID,"AC1,RoomID,Close="..RoomID )
				for i = 1 , PlayNum , 1 do ---�⪱�a��J�ж��� Ū���쪺���a�ƶq�U�h�M�wfor�j��]�X��
					local PlayerID = GetSearchResult()  ---�N����ZONE�̪��Ҧ����a�̧Ǧs�J�o�ӼȦs��
					if ReadRoleValue ( PlayerID , EM_RoleValue_VOC ) ~= 0 then
						if ReadRoleValue ( PlayerID , EM_RoleValue_RoomID ) == RoomID then
							ScriptMessage( PlayerID,PlayerID,3,"[SC_BLACKWATER_BUFF]",0 )
							Addbuff (  PlayerID , 622121 , 0 , 300 ) ---�ʦL��ʥ���BUFF	
							ChangeZone( PlayerID , ZoneID , 0 , XX , YY , ZZ , Dir )
						end
					end
				end
			end
		 time=0 
		end
		time = time + 1
		--
		sleep ( 10 )
		Door_Open = GetWorldVar( "SC_BLACKWATER_P3_OPENDOOR" )
		if Door_Open == 1 then
			--���A���ͤ����]ۣ�H
			if CombatBegin == 0 then
				if RoomID ~= 0 then
					local ctarlAI = Cl_CreateObj_ForHideBall( 105305 , Npc_X , Npc_Y , Npc_Z , RoomID ) ----�����]ۣ�H����
						SetModeEx( ctarlAI , EM_SetModeType_Show, false) 
						WriteRoleValue ( ctarlAI , EM_RoleValue_PID , Ctrl )
						BeginPlot( ctarlAI , "cl_Ac1_BW_Z194_ctarlAI" , 0 )
						CombatBegin = 1
				end
			end
		elseif Door_Open ~= 1 then
			if CombatBegin == 1 then
				CombatBegin = 0
			end
		end
		--��Ctrl�AR1�ȰO���O�_�N���a�ǥX
		if ReadRoleValue( Ctrl , EM_RoleValue_Register1 ) == 1 then
			local PlayNum = SetSearchAllPlayer(RoomID) 	-----Ū�����ZONE���Ҧ����a�o��Ū���쪺�O�ƶq
			--DebugMsg(0,RoomID,"Ctrl,AllPlayer="..PlayNum)
			for i = 1 , PlayNum , 1 do
				local PlayerID = GetSearchResult() 
				if ReadRoleValue ( PlayerID , EM_RoleValue_VOC ) ~= 0 then
					ChangeZone( PlayerID , ZoneID , 0 , XX , YY , ZZ , Dir )
				end
			end
			sleep ( 50 )
			WriteRoleValue ( Ctrl , EM_RoleValue_Register1 , 0 )
		end
	end
end
--ctarlAI,����cl_Ac1_BW_Z194_ctarlAI
--ctarlAI,R6 => �O��boss���F�X���A�C���@��+1
--ctarlAI,R5 => �O���p�Ǽƶq
--ctarlAI,R1 => BOSS�O�_�b�԰�
--ctarlAI,PID => Ctrl
function cl_Ac1_BW_Z194_ctarlAI() --�ƥ������
	local ctarlAI = OwnerID()
	local RoomID = ReadRoleValue ( ctarlAI , EM_RoleValue_RoomID )
	local Ctrl = ReadRoleValue ( ctarlAI , EM_RoleValue_PID )
	local Stand_Out = 300
	local Stand_Out_Time = 0
	local ctarlAI_Table = {}
		ctarlAI_Table[1] = 120424
		ctarlAI_Table[2] = 120122 
		ctarlAI_Table[3] = 106571
		ctarlAI_Table[4] = 106549
	local Function_Table = {}
		Function_Table[1] = "AC1_boss1CenterCtrlCreat"  ---BOSS1
		Function_Table[2] = "Lua_kors_ACboss_ctrl"          ---Boss2
		Function_Table[3] = "sasa_106572_Counter"          ---Boss3
		Function_Table[4] = "Cl_ACWB_P3Boss4_CtarlAI"   ---Boss4
		Function_Table[5] = "Cl_ACWB_P3Boss4_KillPolice"	--��u�ƳQ����
		Function_Table[6] = "Cl_ACWB_P3Boss4_GiveWP"	--�[�J��ܼ@��
		Function_Table[7] = "Cl_ACWB_P3Boss4_ThPolice"	--�}��Ĳ�I
	local ZoneID = 2
	local XX = 2235
	local YY = 59
	local ZZ = 1849
	local Dir = 69
	local Flag_Table = {}
		Flag_Table[1] = 781061
	local BossAI_Table = {}
	local BossIsDead = ReadRoleValue( ctarlAI , EM_RoleValue_Register6 )		--ctarlAI,R6
		WriteRoleValue ( ctarlAI , EM_RoleValue_Register6 , 0 ) 			--ctarlAI,R6
	local Door_Open = 0
	local Door_Time = 0
	local BossInFight = 0
	local flagID = 0
	local close_door = 0
	local delAllNPc = 0
		for i = 1 , 4 , 1 do
			BossAI_Table[i] = CreateObjByFlag( ctarlAI_Table[i] , Flag_Table[1] , i , 1 ) ------------BOSS���;�
			SetModeEx( BossAI_Table[i] , EM_SetModeType_Show , false)
			SetModeEx ( BossAI_Table[i] , EM_SetModeType_Obstruct, false) 
			SetModeEx( BossAI_Table[i] , EM_SetModeType_Strikback, false) 
			SetModeEx( BossAI_Table[i] , EM_SetModeType_Move, false) 
			SetModeEx( BossAI_Table[i] , EM_SetModeType_Searchenemy, false)
			SetModeEx( BossAI_Table[i] , EM_SetModeType_Mark, false)
			SetModeEx( BossAI_Table[i] , EM_SetModeType_ShowRoleHead, false) 	
			SetModeEx( BossAI_Table[i] , EM_SetModeType_Fight, false) 
			SetModeEx( BossAI_Table[i] , EM_SetModeType_NotShowHPMP , false) 
			AddToPartition ( BossAI_Table[i] , RoomID )
			WriteRoleValue ( BossAI_Table[i] , EM_RoleValue_PID , ctarlAI ) 
			BeginPlot( BossAI_Table[i] , Function_Table[i] , 0 ) ---��JBOSS���԰����L
			sleep ( 1 )
		end
	local Police_Npc = {}
		Police_Npc[1] = CreateObjByFlag( 106698 , Flag_Table[1] , 11 , 1 ) ------------�گǦN
			--SetModeEx( Police_Npc[1] , EM_SetModeType_Searchenemy, false)--����(�_)
			SetModeEx( Police_Npc[1] , EM_SetModeType_Fight, true ) 
			SetModeEx( Police_Npc[1] , EM_SetModeType_Strikback, true) 
			AddToPartition( Police_Npc[1] , RoomID )
		WriteRoleValue ( Police_Npc[1] , EM_RoleValue_PID , ctarlAI ) 
		BeginPlot( Police_Npc[1] , Function_Table[7] , 0 )
		SetPlot( Police_Npc[1], "dead", Function_Table[5], 0 ) ------PlotType Ĳ�o���� (����"touch"Ĳ�I�B"range"�d��B"dead"���`�B"collision"�I���|��)
		sleep ( 1 )
		for i = 1 , 4 , 1 do
			Police_Npc[i+1] = CreateObjByFlag( 106699 , Flag_Table[1] , 11+i , 1 ) ------------�Z��R��ĵ�ƶ�
				--SetModeEx( Police_Npc[i+1] , EM_SetModeType_Searchenemy, false)--����(�_)
				SetModeEx( Police_Npc[i+1] , EM_SetModeType_Fight, true) 
				SetModeEx( Police_Npc[i+1] , EM_SetModeType_Strikback, true) 
				AddToPartition( Police_Npc[i+1] , RoomID )
		end
		Police_Npc[6] = CreateObjByFlag( 120205 , Flag_Table[1] , 16 , 1 ) ------------���ͪk���[��
		AddToPartition( Police_Npc[6] , RoomID )
		Police_Npc[7] = CreateObjByFlag( 120206 , Flag_Table[1] , 17 , 1 ) ------------���ͬf�ԧJ
		AddToPartition( Police_Npc[7] , RoomID )
	local Monster_Time = 55
	local Monster_Num = ReadRoleValue ( ctarlAI , EM_RoleValue_Register5 )
	local Ctrltime = 0
--		SetWorldVar( "SC_BLACKWATER_P3_MONSTERTIME" , 0 )

	while 1 do
		sleep ( 10 )
		Door_Open = GetWorldVar( "SC_BLACKWATER_P3_OPENDOOR" )	-- �@���ܼ�P-3���q
		Door_Time = GetWorldVar( "SC_BLACKWATER_P3_TIME" )		-- �@���ܼưO�ɾ�
		Door_MONSTER = GetWorldVar( "SC_BLACKWATER_P3_MONSTERTIME" )	-- �@���ܼƥX��

		BossInFight = ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 )
		Monster_Num = ReadRoleValue ( ctarlAI , EM_RoleValue_Register5 )
		--ctarlAI,R9=1 ���ѡA�ƥ󵲧��C
		if ReadRoleValue ( ctarlAI , EM_RoleValue_Register9 ) == 1 then
			WriteRoleValue ( Ctrl , EM_RoleValue_Register9 , 1 ) 
			Cl_ACWB_DELOBJ()
			delobj ( ctarlAI )
		end
		--�ˬdBOSS���F�X��
		for i = 1 , 4 , 1 do
			--boss,R4,�s�O�_���`
			if ReadRoleValue ( BossAI_Table[i] , EM_RoleValue_Register4 ) == 1 then
				BossIsDead = ReadRoleValue( ctarlAI , EM_RoleValue_Register6 )
				WriteRoleValue ( ctarlAI , EM_RoleValue_Register6 , BossIsDead+1 ) 
				WriteRoleValue ( BossAI_Table[i] , EM_RoleValue_Register4 , 2 ) 	--boss���`�O���L��A��g��2
				DebugMsg(0,RoomID,"AC1,Z194,BOSS_IS_DEAD,NUM="..ReadRoleValue( ctarlAI , EM_RoleValue_Register6 ))
			end
		end
		--���]�w�g���˳̲�BOSS�A�����F���A
		if Door_Open == 2 or Door_Open == 3 then
			Stand_Out_Time = 1
			Ctrltime = 1
		end
		--����p��
		if Ctrltime == 1 then
			local PlayNum = SetSearchAllPlayer(RoomID) 	-----Ū�����ZONE���Ҧ����a�o��Ū���쪺�O�ƶq
			--DebugMsg(0,RoomID,"-----ctarlAI,AllPlayer="..PlayNum)
			for i = 1 , PlayNum , 1 do
				local PlayerID = GetSearchResult() 
				if ReadRoleValue ( PlayerID , EM_RoleValue_VOC ) ~= 0 then
					--DebugMsg(0,RoomID,"-----ctarlAI,ClockOpen")
					CallPlot(PlayerID,"lua_ACtestClockOpen",PlayerID )
				end
			end
			Ctrltime = 2
		end
		--�PŪ1800S��A�NCtrl,R1�g��1�A�ǥX�Ҧ����a�C
		if Stand_Out_Time == 1 then
--			if Door_Time <= 1800 then
				close_door = close_door + 1
				if close_door >= 180 then
					WriteRoleValue ( Ctrl , EM_RoleValue_Register1 , 1 )
					sleep ( 10 )
					delobj ( ctarlAI )
				end
--			end
		end
		--��Door_MONSTER�ӱ���O�_�X��
		if BossInFight == 0 then
			if ReadRoleValue ( ctarlAI , EM_RoleValue_Register5 ) < 80 then
				if Door_MONSTER == 0 then
					Monster_Time = Monster_Time + 1
				end
				if Monster_Time >= 60 then
					for i = 1 , 2 , 1 do
						BossIsDead = ReadRoleValue( ctarlAI , EM_RoleValue_Register6 )
						DebugMsg( 0 , RoomID , "AC1,BossIsDead="..BossIsDead )
						cl_Call_MonsterAI( i , BossIsDead )
					end
					Monster_Time = 0
				end
			end
		end
	end
end
--���ͨ�Ӥp�Ǥ�����
function cl_Call_MonsterAI( Flag , FlagID )
	local ctarlAI = OwnerID()
	local RoomID = ReadRoleValue ( ctarlAI , EM_RoleValue_RoomID )
	local Flag_Num = {}
		Flag_Num[0] = 30
		Flag_Num[1] = 20
		Flag_Num[2] = 10
		Flag_Num[3] = 0
	--DebugMsg( 0 , RoomID , "Flag_Num[FlagID]="..Flag_Num[FlagID] )
	local Flag_Table = {}
		Flag_Table[1] = 781071
		Flag_Table[2] = 781072
	--DebugMsg( 0 , RoomID , "FlagID="..Flag_Num[FlagID] )
	local MonsterAI = CreateObjByFlag( 106590 , Flag_Table[Flag] , Flag_Num[FlagID] , 1 ) ------------����"�p��"
		SetModeEx ( MonsterAI , EM_SetModeType_Obstruct, false) 			
		SetModeEx( MonsterAI , EM_SetModeType_Strikback, false)		
		SetModeEx( MonsterAI , EM_SetModeType_Searchenemy, false)	
		SetModeEx( MonsterAI , EM_SetModeType_Mark, false)		
		SetModeEx( MonsterAI , EM_SetModeType_ShowRoleHead, false) 	
		SetModeEx( MonsterAI , EM_SetModeType_Fight, false) 		
		SetModeEx( MonsterAI , EM_SetModeType_NotShowHPMP , false) 	
		AddToPartition ( MonsterAI , RoomID ) ----����[�J����,�Ҧ椽��
	WriteRoleValue ( MonsterAI , EM_RoleValue_Register1 , ctarlAI ) 		---
	WriteRoleValue ( MonsterAI , EM_RoleValue_Register6 , FlagID ) 		---��boss���F�X��
	CallPlot( MonsterAI, "Cl_Monster_WarkInFlag", Flag )
end 
--�Uboss���������A�O���O�_�԰����C
function Cl_ACWB_BossIsDeadFlag(Flag_Tag)  --1=�i�J�԰�  2=�԰����m 3=BOSS���`
	local BossCtrl = OwnerID()
	local RoomID = ReadRoleValue ( BossCtrl , EM_RoleValue_RoomID )
	local ctarlAI = ReadRoleValue ( BossCtrl , EM_RoleValue_PID )

	if Flag_Tag == 1 then
		WriteRoleValue ( ctarlAI , EM_RoleValue_Register1 , 1 ) ---�i�J�԰�
	elseif Flag_Tag == 2 then
		WriteRoleValue ( ctarlAI , EM_RoleValue_Register1 , 0 ) --���a����
	elseif Flag_Tag == 3 then
		WriteRoleValue ( ctarlAI , EM_RoleValue_Register1 , 0 )
		WriteRoleValue ( BossCtrl , EM_RoleValue_Register4 , 1 )
	end
	DebugMsg(0,RoomID,"AC1,Z194,BossStatus_NOW="..Flag_Tag)
end
--��ڦN�ǳQ��...
function Cl_ACWB_P3Boss4_KillPolice()
	local Baneji = OwnerID()
	local RoomID = ReadRoleValue ( Baneji , EM_RoleValue_RoomID )
	local ctarlAI = ReadRoleValue ( Baneji , EM_RoleValue_PID )
	local ZoneID = 2
	local XX = 2235
	local YY = 59
	local ZZ = 1849
	local Dir = 69
	Sleep(30)
	local PlayNum = SetSearchAllPlayer( RoomID ) -----Ū�����ZONE���Ҧ����a�o��Ū���쪺�O�ƶq
	for i = 1 , PlayNum , 1 do ---�⪱�a��J�ж��� Ū���쪺���a�ƶq�U�h�M�wfor�j��]�X��
		local PlayerID = GetSearchResult()  ---�N����ZONE�̪��Ҧ����a�̧Ǧs�J�o�ӼȦs��
		if ReadRoleValue ( PlayerID , EM_RoleValue_VOC ) ~= 0 then
			if ReadRoleValue ( PlayerID , EM_RoleValue_RoomID ) == RoomID then
				ScriptMessage( PlayerID,PlayerID,3,"[SC_BLACKWATER_BUFF]",0 )
				Addbuff (  PlayerID , 622121 , 0 , 3600 ) ---�ʦL��ʥ���BUFF	
				ChangeZone( PlayerID , ZoneID , 0 , XX , YY , ZZ , Dir )
			end
		end
	end
	WriteRoleValue ( ctarlAI , EM_RoleValue_Register9 , 1 )
	delobj ( Baneji )
end
--�F��c��
function Cl_ACWB_P3Boss4_GiveWP()
	local play = OwnerID()
	local Npc = TargetID()
	LoadQuestOption( play )
	AddSpeakOption( play , Npc , "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/�ڷQ�ݬݧA�檺�F��
end

function cl_ACWB_P3_Shop()--------------------------------���Ĥ���
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600381 , "Test_Shop_Close" )
end

--�M���Ҧ�npc
function Cl_ACWB_DELOBJ()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----����Ū���쪺�h�� 
	local PPL = SetSearchAllNPC(RoomID )
	for i = 1 , PPL , 1 do ---�⪱�a��J�ж��� 
		local ID = GetSearchResult()
		if ReadRoleValue ( ID , EM_RoleValue_OrgID ) ~= 106690 and		--�ƥ���AI
			ReadRoleValue ( ID , EM_RoleValue_OrgID ) ~= 103044 and	--�ƥ��Ϊ���
			ReadRoleValue ( ID , EM_RoleValue_OrgID ) ~= 103120 and	--���b��
			ReadRoleValue ( ID , EM_RoleValue_OrgID ) ~= 106149 then	--�ǰe��
			if ReadRoleValue ( ID , EM_RoleValue_RoomID ) == RoomID then
				Delobj (ID)
			end
		end
	end
end
--���ի��O�Avalue�վ㦨0���~���ƴN���X��
function Cl_ACWB_GM_STOPMONSTERTIME(Value)
	Value = Value or 0
	SetWorldVar( "SC_BLACKWATER_P3_MONSTERTIME" , Value )
end
--���ի��O�A���m�ܼƬ�value
function Cl_ACWBRESET(  )
	SetWorldVar( "SC_BLACKWATER_P3_MONSTERTIME" , 0 )
	SetWorldVar( "SC_BLACKWATER_P3_TIME" , 3600 )
	SetWorldVar( "SC_BLACKWATER_P3_OPENDOOR" , 0 )
end
--���ի��O�A���m�U�O�ܼ�,���gP3���ɶ�
function lua_AC1RESET_P3TIME( Value )
	Value = Value or 10	--10�������
	SetWorldVar( "SC_BLACKWATER_P3_TIME" , Value )
end
--���ի��O�A���m�U�O�ܼ�,�}�����q�A0����}�A1���}�A2�M3����
function lua_AC1RESET_OPENDOOR( Value )
	Value = Value or 0	--���a�Ȭ���}
	SetWorldVar( "SC_BLACKWATER_P3_OPENDOOR" , Value )
end
--���ի��O�AŪ�X���q
function Cl_AcTest_ReadWorldVar()
	local Door_Open = GetWorldVar( "SC_BLACKWATER_P3_OPENDOOR" )	-- �@���ܼ�P-3���q
	local Door_Time = GetWorldVar( "SC_BLACKWATER_P3_TIME" )	-- �@���ܼưO�ɾ�
	say ( OwnerID() , "Door_Time="..Door_Time.."___Door_Open="..Door_Open)    
end
--�گǦN����l��t�A��ܼ@��
function Cl_ACWB_P3Boss4_ThPolice()
	SetPlot( OwnerID(), "touch","Cl_ACWB_P3_touchNpc", 20 ) 
end
function Cl_ACWB_P3_touchNpc()
	local Player = OwnerID() ----�ڥs��AI
	local Target = TargetID()
	if ReadRoleValue( Target , EM_RoleValue_AttackTargetID ) == 0 then
		if ReadRoleValue( Target , EM_RoleValue_Register5 ) ~= 1 then
			WriteRoleValue ( Target , EM_RoleValue_Register5 , 1 )
			say ( Target , "[SC_WBP3_SHOWNPC_75]")
			sleep ( 30 )
			say ( Target , "[SC_WBP3_SHOWNPC_76]")
			sleep ( 30 )
			say ( Target , "[SC_WBP3_SHOWNPC_77]")
			sleep ( 30 )
			say ( Target , "[SC_WBP3_SHOWNPC_78]")
			sleep ( 30 )
			WriteRoleValue ( Target , EM_RoleValue_Register5 , 0 )
		end
	end
end

function lua_ACtestClockOpen(PlayerID)
	ClockOpen( PlayerID , EM_ClockCheckValue_25 , 180 , 180 , 0 , "Cl_ACWB_NotTime" , "Cl_ACWB_NotTime" )
end
--function Cl_Test_Open194Door()
--	local OwnerID = OwnerID()
--	SetPlot( OwnerID , "collision" , "cl_AC1_WB_InDoor" , 30 )
--end
--function Cl_test_zone()
--	local ctarlAI = OwnerID()
--	local RoomID = ReadRoleValue ( ctarlAI , EM_RoleValue_RoomID )
--	local ZoneID = 2
--	local XX = 2235
--	local YY = 59
--	local ZZ = 1849
--	local Dir = 69
--	local PlayNum = SetSearchAllPlayer( RoomID ) -----Ū�����ZONE���Ҧ����a�o��Ū���쪺�O�ƶq
--	for i = 1 , PlayNum , 1 do ---�⪱�a��J�ж��� Ū���쪺���a�ƶq�U�h�M�wfor�j��]�X��
--		local PlayerID = GetSearchResult()  ---�N����ZONE�̪��Ҧ����a�̧Ǧs�J�o�ӼȦs��
--		if ReadRoleValue ( PlayerID , EM_RoleValue_VOC ) ~= 0 then
--			ChangeZone( PlayerID , ZoneID , 0 , XX , YY , ZZ , Dir )
--		end
--	end
--end
--function Cl_test_zone_0()
--	local ctarlAI = OwnerID()
--	local RoomID = ReadRoleValue ( ctarlAI , EM_RoleValue_RoomID )
--	local ZoneID = 2
--	local XX = 2235
--	local YY = 59
--	local ZZ = 1849
--	local Dir = 69
--	local PlayNum = SetSearchAllPlayer( 0 ) -----Ū�����ZONE���Ҧ����a�o��Ū���쪺�O�ƶq
--	for i = 1 , PlayNum , 1 do ---�⪱�a��J�ж��� Ū���쪺���a�ƶq�U�h�M�wfor�j��]�X��
--		local PlayerID = GetSearchResult()  ---�N����ZONE�̪��Ҧ����a�̧Ǧs�J�o�ӼȦs��
--		if ReadRoleValue ( PlayerID , EM_RoleValue_VOC ) ~= 0 then
--			ChangeZone( PlayerID , ZoneID , 0 , XX , YY , ZZ , Dir )
--		end
--	end
--end
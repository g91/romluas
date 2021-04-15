function Lua_Hao_Germany_3th_Counter()	-- 3�P�~ Npc - �L��̡E�ʶ�(116477) ���󲣥ͼ@��

	local Self = OwnerID()
	local Room = ReadRoleValue( Self , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue( Self , EM_RoleValue_RealZoneID )
	local Time = { 0 , 3 , 6 , 9 , 12 , 15 , 18 , 21 }	-- �C���}�l�ɶ�
 	local Tornados = {}
	local Hour , Min , Npc , SysHour , SysMin	-- �ɡB���B���ͪ���������
	local EventBuff = 503217			-- �`�y���ʱM�� Buff
	local ObjID , X , Y , Z , Dir , MsgMin
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 )		
	
	if Zone == 2 then
		ObjID , X , Y , Z , Dir = 113105 , 1181.1 , 37.3 , 6919.3 , 330.6		-- ���ͪ����Ϊ���
	elseif Zone == 951 then
		ObjID , X , Y , Z , Dir = 113105 , 443.3 , -257.2 , 164.9 , 338.1		-- ���ͪ����Ϊ���
	end

	AddBuff( Self , EventBuff , 0 , -1 )

	if Germany_3th_Tornado_Time == nil then
		Germany_3th_Tornado_Time = 0 -- �ɶ�
	end

	while true do
		if Germany_3th_Tornado_Time ~= 0 then
			Hour = Math.floor(Germany_3th_Tornado_Time/100)
			Min = Germany_3th_Tornado_Time%100
			if Min > 59 then
				Min = Min%60
				Hour = Hour + 1
			end
			if Hour > 23 then
				Hour = Hour%24
			end
			Germany_3th_Tornado_Time = Hour*100 + Min
			SysHour = GetSystime(1)
			SysMin = GetSystime(2)
		--	DebugMsg( 0 , Room , "De 3th Custom time: "..string.format("%04d", Germany_3th_Tornado_Time ).." System time: "..string.format("%02d", SysHour ).." : "..string.format("%02d", SysMin ) )
			Germany_3th_Tornado_Time = Germany_3th_Tornado_Time + 1
		else
			Hour = GetSystime(1)
			Min = GetSystime(2)
		--	DebugMsg( 0 , Room , "De 3th Custom time: "..string.format("%04d", Germany_3th_Tornado_Time ).." System time: "..string.format("%02d", Hour ).." : "..string.format("%02d", Min ) )
		end
--		DebugMsg( 0 , Room , Hour.." : "..Min )
		for i = 1 , table.getn(Time) , 1 do
			if Hour == Time[i] + 2  then
				if Min == 50 then
				--	if ZoneID <= 999 then
				--		RunningMsgEX( Self , 1 , 3 , "Tornado will come after 10 min." )	-- �Z��R�����j���e���Ʋz�K�H - �w��q�E�ʶץ��b�۶Ҽ��ߪ��_�I�̡̭A�ݨӡA�L�ܻݭn�����C
				--	end
				--	break
				elseif Min == 55 or Min == 59 then
					MsgMin = 60 - Min
					if ZoneID <= 999 then
						RunningMsgEX( Self , 2 , 3 , "[SC_DE_3TH_TORNADO_00][$SETVAR1="..MsgMin.."]" )	-- �@�Ѥ�í�w����q����ۯ��򪺤W�Ŭy«�A�Ѯ�M�a��ܡG5������A�o�ѯ�q�N���ܬ��j�P���s�����C
					end
					break					
				end
			elseif Hour == Time[i] then
				if Min == 0 then
					if ZoneID <= 999 then
						RunningMsgEX( Self , 2 , 3 , "[SC_DE_3TH_TORNADO_01]" )	-- ��ۯ���X�{�F�s�����A�ڻ��٭��U�F�C��B�I�H
					end
					Npc = CreateObj( ObjID , X  , Y , Z , Dir , 1 )	-- �������Ϊ���
					SetModeEx( Npc , EM_SetModeType_ShowRoleHead , false )	-- �Y����
					SetModeEx( Npc , EM_SetModeType_Mark , false )		-- �аO
					SetModeEx( Npc , EM_SetModeType_Show , false )		-- ���
					SetModeEx( Npc , EM_SetModeType_Fight , false )		-- ���
					AddToPartition( Npc , Room )
					BeginPlot( Npc , "Lua_Hao_Germany_3th_Show_Time" , 0 )	-- �����s����
					break
				elseif Min == 20 then
					if ZoneID <= 999 then
						RunningMsgEX( Self , 2 , 3 , "[SC_DE_3TH_TORNADO_02]" )	-- �b�ۯ���v�h���s�������G�����F�C
					end
					for i = 1 , 2 , 1 do
						Tornados[i] = ReadRoleValue( Npc , EM_RoleValue_Register+i )
						DelObj( Tornados[i] )
					end
					DelObj( Npc )
					break
				end 
			end
		end
	--	Hour = GetSystime(1)
	--	Min = GetSystime(2)
		Sleep(600)
	--	sleep(10)
	end
end

function Lua_Hao_Germany_3th_Show_Time()	-- ���Ϊ��󲣤��s����

	local Self = OwnerID()
	local Room = ReadRoleValue( Self , EM_RoleValue_RoomID )
	local X = ReadRoleValue( Self , EM_RoleValue_X )
	local Y = ReadRoleValue( Self , EM_RoleValue_Y )
	local Z = ReadRoleValue( Self , EM_RoleValue_Z )
	local Dir = ReadRoleValue( Self , EM_RoleValue_Dir )
	local TornadoID = 120467
	local Tornados = {}
	local Range = 200
--	local Sec = 300	-- ���Ϊ�����汽�y���ɶ�
	local Buff = { 622162 , 622163 , 507555 }	-- �����ɶ��B���_�Ĥ��B���_�Ĥ��ϥίS��
	local Key = { 545451 , 545452 }	-- �w���W�B�w����
	local ObjID , Count

	for i = 1 , 2 , 1 do
		Tornados[i] = CreateObj( TornadoID , X , Y , Z , Dir , 1 )
		SetModeEx( Tornados[i] , EM_SetModeType_ShowRoleHead , false )	--�Y����
		SetModeEx( Tornados[i] , EM_SetModeType_Mark , false )		--�аO
		SetModeEx( Tornados[i] , EM_SetModeType_Show , true )		--���
		SetModeEx( Tornados[i] , EM_SetModeType_Fight , false )		--���
		MoveToFlagEnabled( Tornados[i] , false )				--�������޼@��
		WriteRoleValue( Self , EM_RoleValue_Register+i , Tornados[i] )
		AddToPartition( Tornados[i] , Room )
	end

	while true do
		Count = SetSearchRangeInfo( Self , Range )
		for i = 1 , Count , 1 do
			ObjID = GetSearchResult()
			if ReadRoleValue( ObjID , EM_RoleValue_IsPlayer ) == 1 and ReadRoleValue( ObjID , EM_RoleValue_RoomID ) == Room then
				 if CheckFlag( ObjID , Key[1] ) == true and CheckFlag( ObjID , Key[2] ) == false then
					SetFlag( ObjID , Key[2] , 1 )
					CancelBuff_NoEvent( ObjID , Buff[2] )
				--	if Sec >= 120 then
				--		Sec = 120
				--		AddBuff( ObjID , Buff[1] , 0 , Sec ) 
				--	else
				--		AddBuff( ObjID , Buff[1] , 0 , Sec )
				--	end
					AddBuff( ObjID , Buff[1] , 0 , 120 )
					AddBuff( ObjID , Buff[3] , 0 , 1 )
				--	ScriptMessage( ObjID , ObjID , 1 , "You have "..Sec .." Sec" , C_SYSTEM )
					ScriptMessage( ObjID , ObjID , 1 , "[SC_DE_3TH_TORNADO_14]" , C_SYSTEM )
					ScriptMessage( ObjID , ObjID , 0 , "[SC_DE_3TH_TORNADO_14]" , C_SYSTEM )
				end
			end
		end
		Sleep(10)
	--	Sec = Sec - 1
	--	if Sec == 0 then
	--		break
	--	end
	end
end

function Lua_Hao_Germany_3th_Check_Time() -- �d�ߥثe�ɶ�

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Hour , Min

	if Germany_3th_Tornado_Time ~= 0 and Germany_3th_Tornado_Time ~= nil then
		Hour = Math.floor(Germany_3th_Tornado_Time/100)
		Min = Germany_3th_Tornado_Time%100
		DebugMsg( 0 , Room , "Custom time: "..string.format("%04d", Germany_3th_Tornado_Time ) )
	else
		Hour = GetSystime(1)
		Min = GetSystime(2)
		DebugMsg( 0 , Room , "System time: "..string.format("%02d", Hour ).." : "..string.format("%02d", Min ) )
	end
end

function Lua_Hao_Germany_3th_Set_Time(Time) -- �ۭq�]�w�ɶ�

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )

	if Time == nil then
		DebugMsg( Player , Room , "I can't understand what you mean." )
		return false
	end

	if Germany_3th_Tornado_Time == nil then
		Germany_3th_Tornado_Time = 0 -- �ɶ�
	end

	local Hour , Min
	Hour = Math.floor(Time/100)
	Min = Time%100

	if Hour > 23 or Min > 59 then
		DebugMsg( Player , Room , "I can't understand what you mean." )
		return false
	else
		Hour = GetSystime(1)
		Min = GetSystime(2)
		Germany_3th_Tornado_Time = Time
	--	DebugMsg( Player , Room , Hour.." : "..Min )
		DebugMsg( 0 , Room , "Custom time: "..string.format("%04d", Germany_3th_Tornado_Time ).." System time: "..string.format("%02d", Hour ).." : "..string.format("%02d", Min ) )
	end
end
			
function Lua_Hao_Germany_3th_Npc_0( Npc , Range , Sec )	-- ��ܶW�L�Z���A������ܼ@��

	local Player = OwnerID()
	local BuffID = 621751	-- �����Z��
--	local BuffIDPos , Npc
	
	while true do
	--	BuffIDPos = Lua_BuffPosSearch( Player , BuffID )			-- �� Buff ����m
	--	Npc = BuffInfo( Player , BuffIDPos , EM_BuffInfoType_OwnerID )	-- �� Buff �I�i��
		if GetDistance( Player , Npc )  >= Range then
			CloseSpeak( Player )
			AdjustFaceDir( Npc , Player , 0 ) -- ���V
			break
		end
		sleep(Sec)
	end
	CancelBuff_NoEvent( Player , BuffID )	
end


function Lua_Hao_Germany_3th_DelKey()	-- �ӤH�C���ɶ������ɡA���檺�@��

	local Player = OwnerID()
	local Key = 545451
	local Buff = 622146
	local Score = Lua_Hao_Return_Buff_Lv( Player , Buff ) + 1
	local String = "[SC_DE_3TH_TORNADO_18][$SETVAR1="..Score.."]"
--	local OrgID = ReadRoleValue( Player , EM_RoleValue_DBID )
--	local Accept = 1024
--	local Over = 888
--	local Reset = 1280
--	local Call = { " , " , "Accept =" , Accept , " , " ,"Over =" , Over , " , " , "Reset =" , Reset }
	
	SetFlag( Player , Key , 0 )
	ScriptMessage( Player , Player , 1 , "[SC_DE_3TH_TORNADO_03]" , C_SYSTEM )
	ScriptMessage( Player , Player , 0 , "[SC_DE_3TH_TORNADO_03]" , C_SYSTEM )
	ScriptMessage( Player , Player , 2 , String , C_SYSTEM )
	ScriptMessage( Player , Player , 0 , String , C_SYSTEM )
--	return Lua_Event_Return_Log(Score)
--	return Lua_Event_Return_Log(Call)
end

function Lua_Hao_Germany_3th_DelKey_Test()	-- �������uĲ�o

	AddBuff( OwnerID() , 622162 , 0 , 100 )
end
-------------------------------------------------------------------------------------------------------------------- �H�W���ɶ��@��
function Lua_Hao_Germany_3th_Npc_1()	-- 3�P�~ Npc -�L��̡E�ʶ�(116477) ��ܼ@��

	local Player = OwnerID()
	local Npc = TargetID()
	local IsBuffed = CheckBuff( Player , 621751 )
	local Key = { 545451 , 545452 , 545463 }	-- �w���W�B�w�����B�w�I�����y
	local Buff = 622146
	local Score = Lua_Hao_Return_Buff_Lv( Player , Buff ) + 1
	local Step = 0
	
	SysCastSpellLv( Npc , Player , 496587 , 0 )
	if IsBuffed== false then
		CallPlot( Player , "Lua_Hao_Germany_3th_Npc_0" , Npc , 50 , 5 )  --�ˬdNPC�P���a���Z��
	end
	AdjustFaceDir( Npc , Player , 0 ) --���V
	if CheckFlag( Player , Key[1] ) == true then
		SetSpeakDetail( Player , "[SC_DE_3TH_TORNADO_05]" ) -- �w���W
		Step = 1
	else	-- �����W�Τw�����C��
		if CheckFlag( Player , Key[2] ) == false then	-- �����W
			SetSpeakDetail( Player , "[SC_DE_3TH_TORNADO_04]" ) -- �D���e
			AddSpeakOption( Player , Npc , "[SC_DE_3TH_TORNADO_17]" , "Lua_Hao_Germany_3th_Npc_2", 0 )-- �ݭn����ܡH
		else	-- �w���������C��
		--	if Score >= 1 then
			if CheckFlag( Player , Key[3] ) == false then	-- ������y
				SetSpeakDetail( Player , "[SC_DE_3TH_TORNADO_07]"  )	-- ���ѯu�O���§A�������C
				AddSpeakOption( Player , Npc , "[SC_FIREDAY_EV1_21]" , "Lua_Hao_Germany_3th_Npc_6" , 0 )-- ������y
			else
				SetSpeakDetail( Player , "[SC_DE_3TH_TORNADO_15]"  )	-- �ݨӧA����ì���ӧ�
				AddSpeakOption( Player , Npc , "[SC_DE_3TH_TORNADO_08]" , "Lua_Hao_Germany_3th_Npc_4" , 0 )-- �ڷQ������h���]�k����
			end
		end
	end
	if Step == 1 then
		AddSpeakOption( Player , Npc , "[SC_DE_3TH_TORNADO_09]" , "Lua_Hao_Germany_3th_Npc_3 " , 0 )-- ����
	end
end

function Lua_Hao_Germany_3th_Npc_2()

	local Player = OwnerID()
	CloseSpeak( Player )
	SetSpeakDetail( Player , "[SC_DE_3TH_TORNADO_16]" ) -- ���e
	AddSpeakOption( Player , Player , "[SC_DE_3TH_TORNADO_06]" , "Lua_Hao_Germany_3th_Npc_2_0", 0 )-- �ڨ����U�A�a�I
	AddSpeakOption( Player , Player , "[SO_BACK]" , "Lua_Hao_Germany_3th_Npc_1 " , 0 )-- �^��W�@��
end

function Lua_Hao_Germany_3th_Npc_2_0()

	local Player = OwnerID()
	local Npc = TargetID()
	CloseSpeak( Player )
	local Key = 545451
	local Buff = 622163
	SetFlag( Player , Key , 1 )
--	AddBuff( Player , Buff , 0 , 86400 )
	AddBuff( Player , Buff , 0 , 604800 )
	AdjustFaceDir( Npc , Player , 0 ) --���V
	PlayMotion( Npc , 112 )
--	BeginPlot( Player , "Lua_Hao_Germany_3th_Npc_7" , 0 )
	AddBuff( Player , 507555 , 0 , 1 )
--	AddBuff( Player , 507555 , 0 , 1 )
	ScriptMessage( Player , Player , 1 , "[SC_DE_3TH_TORNADO_10]" , C_SYSTEM )	-- �@���N���U�A�F�C
	ScriptMessage( Player , Player , 0 , "[SC_DE_3TH_TORNADO_10]" , C_SYSTEM )	-- �@���N���U�A�F�C
	DesignLog( Player , 116477 , "2012 DE 3th Frog Rain Start")	-- ��ܰѥ[�C�����H��
end

function Lua_Hao_Germany_3th_Npc_3()

	local Player = OwnerID()
	SetSpeakDetail( Player , "[SC_DE_3TH_TORNADO_11]" ) -- ���e
	AddSpeakOption( Player , Player , "[SO_BACK]" , "Lua_Hao_Germany_3th_Npc_1 " , 0 )-- �^��W�@��
end

function Lua_Hao_Germany_3th_Npc_4()

	local Player = OwnerID()
	SetSpeakDetail( Player , "[SC_DE_3TH_TORNADO_12]"  )	-- Are you sure that you want to trade 1 [202903] to 1 Magic?
	AddSpeakOption( Player , Player , "[SC_GETTITLE_1]" , "Lua_Hao_Germany_3th_Npc_5" , 0 )	-- Yes , I do.
	AddSpeakOption( Player , Player , "[SO_BACK]" , "Lua_Hao_Germany_3th_Npc_1" , 0 )	-- �^��W�@��
end

function Lua_Hao_Germany_3th_Npc_5()

	local Player = OwnerID()
	local Npc = TargetID()
	local Key = { 545451 , 545452 , 545463 }	-- �w���W�B�w�����B�w�I�����y
	local Item = 202903	-- �ǰe�̲Ť�
	local Ticket = CountBodyItem( Player , Item )
	local Buff = 622163
	
	CloseSpeak( Player )
	
	if Ticket >= 1 then
		DelBodyItem( Player , Item , 1 )
		SetFlag( Player , Key[1] , 1 )
		SetFlag( Player , Key[2] , 0 )
		SetFlag( Player , Key[3] , 0 )
		AddBuff( Player , Buff , 0 , 604800 )
		ScriptMessage( Player , Player , 1 ,  "[SC_DE_3TH_TORNADO_13]" , C_SYSTEM )	-- �ڤw�g���s���A�x�W�F[622163]�A���A�n�B�C
		AdjustFaceDir( Npc , Player , 0 ) --���V
		PlayMotion( Npc , 112 )
	--	BeginPlot( Player , "Lua_Hao_Germany_3th_Npc_7" , 0 )
		AddBuff( Player , 507555 , 0 , 1 )
	--	AddBuff( Player , 507555 , 0 , 1 )
	--	PlayMotion( Npc , ruFUSION_ACTORSTATE_CAST_INSTANT )	-- �I�k�ʧ@
	else
		ScriptMessage( Player , Player , 1 , "[SC_112502_NO]" , C_SYSTEM )	-- �A���������~�ƶq������I 
	end
	DesignLog( Player , 1164771 , "2012 DE 3th Frog Rain Reset")	-- ��ܤ�I 1 �Ӷǰe�̲Ť孫�m���H��
end

function Lua_Hao_Germany_3th_Npc_6()

	local Player = OwnerID()
	local Npc = TargetID()
	local Range = { 25 , 75 , 125 , 99999 }	--�@50�H�U , 51-100 , 101-150 , 150�H�W
	local Buff = 622146
	local Key = 545463	-- �w�I�����y
	local Score = Lua_Hao_Return_Buff_Lv( Player , Buff ) + 1
	local Sapce = { 2 , 3 , 3 , 3 }
	local Gift = {}
		Gift[1] = 209561	-- �w�y�C�����
		Gift[2] = 241114	-- ��o���v�a
		Gift[3] = { 241128 , 241127 , 241126 }
		
	AdjustFaceDir( Npc , Player , 0 )
--	PlayMotion( Npc , 102 )
	CloseSpeak( Player )
	
	for i = 1 , table.getn(Range) , 1 do
		if Score <= Range[i] then
			if Check_Bag_Space( Player , Sapce[i] ) == false then
				ScriptMessage( Player , Player , 1 ,  "[SC_111490_DIALOG10]" , C_SYSTEM )	-- �I�]�Ŷ�����
				return false
			end
			GiveBodyItem( Player , Gift[1] , 1 )
			GiveBodyItem( Player , Gift[2] , 3 )
			if i ~= 1 then
				GiveBodyItem( Player , Gift[3][i-1] , 1 )
			end
			SetFlag( Player , Key , 1 )
			CancelBuff_NoEvent( Player , Buff )
			break
		end
	end
	DesignLog( Player , 1164772 , "2012 DE 3th Frog Rain Score = "..Score )	-- ���������ʪ����a���ƻP�o��
end

function Lua_Hao_Germany_3th_Npc_7()

	local Player = OwnerID()
	local Buff = 507555

	Sleep(20)	
	AddBuff( Player , Buff , 0 , 1 )
end
-------------------------------------------------------------------------------------------------------------------- �H�W��Npc��ܼ@��
function Lua_Hao_Germany_3th_Tornado()	-- �s�������޼@��

	local Self = OwnerID()
	local X = ReadRoleValue( Self , EM_RoleValue_X )
	local Y = ReadRoleValue( Self , EM_RoleValue_Y )
	local Z = ReadRoleValue( Self , EM_RoleValue_Z )
	local Range , NewX , NewZ , NewY
	local Count = 0
	local Buff = { 622107 , 622108 }	-- �w�t�B�[�t
	AddBuff( Self , 621744 , 0 , -1 )	-- ��j	
	MoveToFlagEnabled( Self , false )	--�������޼@��
	BeginPlot( Self , "Lua_Hao_Germany_3th_Produce" , 0 )	-- �ͦ��C��
	while true do
		SysCastSpellLv( Self , Self , 850040 , 0 )
		Range = Math.random(100)+75
		NewX = X+Math.random( -Range , Range )
		NewZ = Z+Math.random( -Range , Range )
		NewY = GetHeight( NewX , Y , NewZ )
	--	DebugMsg( 0 , 0 , "X = "..NewX.." Y = "..Y.." Z = "..NewZ )
	--	DebugMsg( 0 , 0 , " Count = "..Count.." % = "..Count%50 )
		if CheckLine( Self , NewX , NewY , NewZ ) == true and Count%50 == 0 then
			AddBuff( Self , Buff[2] , Rand(5)+10 , 5 )	-- �w�B�[�t
		--	AddBuff( Self , Buff[Math.random(2)] , Rand(10) , 5 )	-- �w�B�[�t
			MoveDirect( Self , NewX , NewY , NewZ )
			Count = 0
		end
	--	DebugMsg( 0 , 0 , "Count = "..Count )
		Sleep(1)
		Count = Count + 1
	end
end 

function Lua_Hao_Germany_3th_Produce( Tornado )	-- �ͦ��C��

	if Tornado == nil then
		Tornado = OwnerID()
	end
	local Room = ReadRoleValue( Tornado , EM_RoleValue_RoomID )
--	local Name = ReadRoleValue( Tornado , EM_RoleValue_PID )
--	local CreateID = 120293	-- ���ͳ���  
	local Limit = 10
	local CreateID = {}
	CreateID[1] = { 20 , 115004 , 1 , 8 }	-- % 1�� �C��s�b��a�������
	CreateID[2] = { 35 , 114993 , 3 , 6 }	-- % 3�� �P�W
	CreateID[3] = { 45 , 115005 , 5 , 4 }	-- % 5�� �P�W
	CreateID[4] = { 55 , 120463 , 10 , 2 }	-- % 10�� �P�W
	CreateID[5] = { 70 , 120464 , 0 , 5 }	-- % ���� 0�� �P�W
	CreateID[6] = { 85 , 120465 , 0 , 1 }	-- % �_�h 0�� �P�W
	CreateID[7] = { 100 , 120466 , 0 , 1 }	-- % �˦a 0�� �P�W	-- 114993
	
	local Pos = {}			-- �y��
	local X , Y , Z , Plane , Dir , Cal , Height , RandDis , ObjID , NpcPlane , Number ,  Percent
	while true do
--	for j = 1 , 1 , 1 do
		Number = ReadRoleValue( Tornado , EM_RoleValue_Register+1 )
	--	DebugMsg( 0 , Room , "ID = "..Name.." Number = "..Number )
		if Number < Limit then
		 	Percent = Rand(100)+1
			X = ReadRoleValue( Tornado , EM_RoleValue_X )
			Y = ReadRoleValue( Tornado , EM_RoleValue_Y )
			Z = ReadRoleValue( Tornado , EM_RoleValue_Z )
			Plane = GetHeight( X , Y , Z )		-- ���a������
			Dir = Rand(360)				-- �H�����V
			Cal = (math.pi/180)*(Dir)		-- ����ͦ��ɪ����� 
			Height = Math.random(100 , 150)+Plane	-- ����ͦ��ɪ�����
			RandDis = Math.random( 1 , 50 )	-- ��b�|
			Pos["X"] = X + (RandDis*math.cos(Cal))	-- ��ߪ��H��X
			Pos["Z"] = Z - (RandDis*math.sin(Cal))	-- ��ߪ��H��Z
		--	DebugMsg( Tornado , Room , "X= "..X.." Y= "..Y.." Z= "..Z.." Dir ="..Dir.." Plane = "..Plane )
			for i = 1 , table.getn(CreateID) , 1 do
				if Percent <= CreateID[i][1] then
					ObjID = CreateObj( CreateID[i][2] , Pos["X"] , Height , Pos["Z"] , Dir , 1 )
					NpcPlane = GetHeight( Pos["X"] , Height , Pos["Z"] )
					Number = Number + 1
					WriteRoleValue( Tornado , EM_RoleValue_Register+1 , Number )
					WriteRoleValue( ObjID , EM_RoleValue_Register+1 , Tornado )		--���ͦ����C��O�_�s����
					WriteRoleValue( ObjID , EM_RoleValue_Register+2 , CreateID[i][3] )		--�N���Ʊa�J�C�줤
					SetModeEx( ObjID , EM_SetModeType_ShowRoleHead , false )		--�Y����
					SetModeEx( ObjID , EM_SetModeType_Mark , false )			--�аO
					SetModeEx( ObjID , EM_SetModeType_Gravity , false )			--���O
					SetModeEx( ObjID , EM_SetModeType_DisableRotate , false )		--�����۰ʭ��V
					SetModeEx( ObjID , EM_SetModeType_Show , true )			--���
					SetModeEx( ObjID , EM_SetModeType_Move , true )			--����
					SetModeEx( ObjID , EM_SetModeType_Drag , true )			--����
					SetModeEx( ObjID , EM_SetModeType_Searchenemy , false )		--����
					SetModeEx( ObjID , EM_SetModeType_Fight , false )			--���
					SetModeEx( ObjID , EM_RoleValue_SetNPCAttackRange , 0 )		--�����Z��
					MoveToFlagEnabled( ObjID , false )					--�������޼@��
					AddToPartition( ObjID , Room )
					SetDefIdleMotion( ObjID , ruFUSION_MIME_JUMP_LOOP )			--���w�ʧ@
					MoveDirect( ObjID , Pos["X"] , NpcPlane , Pos["Z"] )
					CallPlot( ObjID , "Lua_Hao_Germany_3th_Frog" , Pos["X"] , Height , NpcPlane , Pos["Z"] , Dir , Tornado , i , CreateID[i][4] )
					CallPlot( ObjID , "Lua_Hao_Germany_3th_Cast" , i )			--�C��I�k
					break
				end
			end
		end
		sleep(10)
	end
end

function Lua_Hao_Germany_3th_Frog( X , Y , NpcPlane , Z , Dir , Tornado , Choise , Sec )	-- ���ͫC���A�q�Ť� - �a�� - �a���üƲ��ʪ��@��
	-- ���C��O�o ���ͮɪ�  X �y�СBY �y�СB�������BZ �y�СB���V�B�s�����B�h�֮ɶ��üƲ��ʤ@���B���ơB�C��s�b��a�������
	local Npc = OwnerID()
	local Room = ReadRoleValue( Npc , EM_RoleValue_RoomID )
	local RealY , Number , Range , NewX , NewY , NewZ , CastOver , Dis , Speed , RealDis , Key
	local Time , Step = 0 , 0
--	local RandNum = Math.random(10)
	local Buff = { 622107 , 622108 }				-- �w�t�B�[�t
	local MagicID = { [5] = 496597 , [6] = 496598 , [7] = 850039  }	-- ���ߡB�_�h�B�˦a
	local Effect = { 622109 , 622148 , 622147 , 621883 , 622157 , 622158 , 622159 }-- �Ĥ�(��)�B�Ĥ�(��)�B��ĸ�(��)�B�V�áB��ĸ�(��)�B��ĸ�(��)�B�ίv
	local Random = { ["Slow"] = Rand(10) , ["Fast"] = Rand(25)+25 }
--	local NewDir = ReadRoleValue( Npc , EM_RoleValue_Dir )
	local Motion = {}	-- �����ʧ@
	Motion[1] = ruFUSION_MIME_PARRY_UNARMED		-- ����(�¦��� 1��)
	Motion[2] = ruFUSION_MIME_PARRY_UNARMED		-- ����(������ 2��)
	Motion[3] = ruFUSION_MIME_PARRY_UNARMED		-- ����(�¦���� 5��)
	Motion[4] = ruFUSION_MIME_PARRY_UNARMED		-- ����(�C����l 10��)
	Motion[5] = ruFUSION_MIME_PARRY_UNARMED		-- �R��(���߫C��)
	Motion[6] = ruFUSION_MIME_CAST_SP01		-- ��g(�_�h�C��)
	Motion[7] = 0						-- �˦a
	local Rate = {}
	Rate[1] = { Buff[1] , Random["Slow"]+5 }	-- �U�Y�ɽw�t1%�B�U�Y�ɪ��w�t����
	Rate[2] = { Buff[1] , Random["Slow"]+15 }	-- �P�W
	Rate[3] = { Buff[1] , Random["Slow"]+25 }	-- �P�W
	Rate[4] = { Buff[1] , Random["Slow"]+50 }	-- �P�W
	Rate[5] = { Buff[2] , Random["Fast"] }	-- �U�Y�ɥ[�t1%�B�U�Y�ɪ��[�t����
	Rate[6] = { Buff[2] , Random["Fast"] }	-- �P�W
	Rate[7] = { Buff[2] , Random["Fast"] }	-- �P�W
	
	AddBuff( Npc , Rate[Choise][1] , Rate[Choise][2] , -1 )

	While true do
		RealY = ReadRoleValue( Npc , EM_RoleValue_Y )
	--	DebugMsg( 0 , 0 , " Y  = "..Y.." RealY = "..RealY.." Time ="..Time )
	--	if RealY == NpcPlane then	-- ���a��A���檺�@��
		if RealY - NpcPlane <= 5 then	-- ���a��A���檺�@��
		--	WriteRoleValue( Npc , EM_RoleValue_PID , NpcPlane )	-- �N�C���P�_���Z���g�J�C��
			CastOver = ReadRoleValue( Npc , EM_RoleValue_Register+3 )	--�u���C��I�k�@��
			SetModeEx( Npc , EM_SetModeType_Gravity , true )		--���O
			WriteRoleValue( Npc , EM_RoleValue_IsWalk , 0 )
			CancelBuff_NoEvent( Npc , Rate[Choise][1] )
			AddBuff( Npc , Buff[1] , Rand(10)+5 , -1 )
			
			if Motion[Choise] ~= 0 then
				SetDefIdleMotion( Npc , Motion[Choise] )			--�������t�ʧ@
				Sleep(5)
			--	SetDefIdleMotion( Npc , ruFUSION_MIME_RUN_FORWARD )	--��_�]�B���A
			else
				SetDefIdleMotion( Npc , ruFUSION_MIME_CAST_SP01 )		--��g
			end

			if Choise > 5 then
				AddBuff( Npc , Effect[3] , 0 , -1 )
				if CastOver == 0 then
					SysCastSpellLv( Npc , Npc , MagicID[Choise] , 0 )
					WriteRoleValue( Npc ,  EM_RoleValue_Register+3 , 1 )
				end
			else
				for i = 1 , Sec*10 , 1 do
					if i%10 == 0 then
						Range = Math.random(50) + 100
						NewX = X+Math.random( -Range , Range )
						NewZ = Z+Math.random( -Range , Range )
					 	NewY = GetHeight( NewX , RealY , NewZ )
					--	DebugMsg( 0 , 0 , "X = "..NewX.." Y = "..Y.." Z = "..NewZ )
						if CheckLine( Npc , NewX , NewY , NewZ ) == true then
						--	LuaFunc_WaitmoveTo( Npc , NewX , NewY , NewZ )
							MoveDirect( Npc , NewX , NewY , NewZ )
					--		CallPlot( Npc , "DW_MoveRand" , Npc , Range )
						end
					end
					sleep(1)
				end
			end
			sleep(10)
		--	AddBuff( Npc , 622145 , 0 , 1 )  
			if Choise <= 5 then
				Key = ReadRoleValue( Npc , EM_RoleValue_Register+4 )
				if Key ~= 1 then
				--	CancelBuff_NoEvent( Npc , Effect[1] )
					WriteRoleValue( Npc , EM_RoleValue_Register+4 , 1 )	-- �� Npc ���A�i�H�Q�o��
					AddBuff( Npc , Effect[7] , 0 , -1 )
					sleep(5)
				end
			end
			Number = ReadRoleValue( Tornado , EM_RoleValue_Register+1 )
			WriteRoleValue( Tornado , EM_RoleValue_Register+1 , Number-1 )
			DelObj( Npc )
			break
--		else
--			if Y ~= RealY then
--				if Step <= 1 then
--					Dis = Y - RealY
--					Speed = Dis / Time
				--	DebugMsg( 0 , 0 , "Dis = "..Dis.." Time = "..Time.." Speed = "..Speed )
				--	DebugMsg( 0 , 0 , "Y  = "..Y.." RealY = "..RealY )
--					Time = 0 -- �ɶ�
--					Y = RealY -- ����Y����e�w�P��
--					Step = Step + 1
--				end
--			end
		end
	--	DebugMsg( 0 , 0 , "Time = "..Time )
--		if Step > 1 then
--			RealDis = Y - Speed*Time
--		--	DebugMsg( 0 , 0 , "RealDis = "..RealDis.." Y = "..Y )
--			if RealDis - NpcPlane < 40 then
--				RealDis = NpcPlane
--			end
--			WriteRoleValue( Npc , EM_RoleValue_PID , RealDis )	-- �N�C���w�����Z���g�J�C��
--		end
		Sleep(1)
--		Time = Time + 1 -- �ɶ�
	end
end

function Lua_Hao_Germany_3th_Check()	-- �ίv�B�������ơB��򥻪k�N�W���檺�ˬd�@���A�T�{�Q�I�k��H�O�_�O�ۤv�C

	local Self = OwnerID()
	local Target = TargetID()
	local Key = { 545451 , 545452 }	-- �w���W�B�w����
	local Score = 622146		-- ����
	local FeedBack = 496596	-- �^�X�S��
	local DefBuff = { 622165 , 5 }	-- �ϰ��ѱM�a�B����ɶ�
	local TargetScore , AfterScore
	local Random = Math.random( 1 , 5 )
	local SName = GetName( Self )
	local TName = GetName( Target )
	local String_1 , String_2

	if CheckBuff( Target , DefBuff[1] ) == true or CheckBuff( Target , Score ) == false then
		return false
	end

	if Target == Self or CheckFlag( Target , Key[1] ) == false or CheckFlag( Target , Key[2] ) == false then
		return false
	else
		AddBuff( Target , DefBuff[1] , 0 , DefBuff[2] )
		TargetScore = Lua_Hao_Return_Buff_Lv( Target , Score ) + 1
		AfterScore = TargetScore - Random
		if TargetScore > 0 then
			CancelBuff_NoEvent( Target , Score )
			if AfterScore > 0 then
				String_1 = "[SC_DE_3TH_TORNADO_19][$SETVAR1="..SName.."][$SETVAR2="..Random.."]"
				String_2 = "[SC_DE_3TH_TORNADO_20][$SETVAR1="..TName.."][$SETVAR2="..Random.."]"
				ScriptMessage( Target , Target , 0 , String_1 , C_Red )
				ScriptMessage( Self , Self , 0 , String_2 , "0xFF37FF39" )				
				ScriptMessage( Target , Target , 2 , "- "..Random , C_Red )
				ScriptMessage( Self , Self , 1 , "+ "..Random , "0xFF37FF39" )
				AddBuff( Target , Score , AfterScore-1 , -1 )
				AddBuff( Self , Score , Random-1 , -1 )
			else
				String_1 = "[SC_DE_3TH_TORNADO_19][$SETVAR1="..SName.."][$SETVAR2="..TargetScore.."]"
				String_2 = "[SC_DE_3TH_TORNADO_20][$SETVAR1="..TName.."][$SETVAR2="..TargetScore.."]"
				ScriptMessage( Target , Target , 0 , String_1 , C_Red )
				ScriptMessage( Self , Self , 0 , String_2 , "0xFF37FF39" )			
				ScriptMessage( Target , Target , 2 , "- "..TargetScore , C_Red )
				ScriptMessage( Self , Self , 1 , "+ "..TargetScore , "0xFF37FF39" )
				AddBuff( Self , Score , TargetScore-1 , -1 )
			end
			SysCastSpellLv( Target , Self , 499108 , 0 )
		end
		return true
	end
end

function Lua_Hao_Germany_3th_ReCheck()	-- �T�{�Q�I�k��H�O�_�����W

	local Self = OwnerID()
	local Target = TargetID()
	local Key = { 545451 , 545452 }	-- �w���W�B�w����

	if Target == Self or CheckFlag( Target , Key[1] ) == false or CheckFlag( Target , Key[2] ) == false then
		return false
	end
end

function Lua_Hao_Germany_3th_Cast( Choise )	-- �C��w���I�k

	local Npc = OwnerID() 
	local MagicID = { }
	MagicID[1] = 496588	-- �p�����
	MagicID[2] = 496588	-- �P�W 
	MagicID[3] = 496588	-- �P�W 
	MagicID[4] = 496588	-- �P�W 
	MagicID[5] = 496597	-- ����

	if Choise <= 5 then
		while true do
 			SysCastSpellLv( Npc , Npc , MagicID[Choise] , 0 )
 			sleep(1)
		end
	end
end

function Lua_Hao_Germany_3th_Base( Choise )

	local Npc = OwnerID()
	local Player = TargetID()
	local Tornado = ReadRoleValue( Npc , EM_RoleValue_Register+1 )		--���ͦ����C��Q�_�s����
	local Number = ReadRoleValue( Tornado , EM_RoleValue_Register+1 )	--Ū���s�����w�ͦ����C��ƶq
	local Score = ReadRoleValue( Npc , EM_RoleValue_Register+2 )		--Ū���ӫC�쪺����
	local Touch = ReadRoleValue( Npc , EM_RoleValue_Register+4 )		--Ū���C��O�_�w�Q�IĲ
	local Dis = ReadRoleValue( Npc , EM_RoleValue_PID )			--Ū���C�쪺��ڰ���
	local Range , Height = 5 , 20	-- �i�����d�򪺥����B���׻~�t
	local Key = { 545451 , 545452 }	-- �w���W�B�w����
	local N_Pos , P_Pos , Var = {} , {} , {}
	local Random = Math.random(100)
	local Effect = { 622109 , 622148 , 622147 , 621883 , 622157 , 622158 , 622159 }-- �Ĥ�(��)�B�Ĥ�(��)�B��ĸ�(��)�B�V�áB��ĸ�(��)�B��ĸ�(��)�B�ίv
	local ScoreBuff = { 622145 , 622146 }
	local TimeBuff = 622162	-- �����ɶ�
--	local Color = { [1] = C_SYSTEM , [3] = C_SYSTEM , [5] = C_Red , [10] = "0xFF91C7FF" }
	local MagicID = {}
	local Steal = 25		-- ���o���Ѫk�N�����v
	MagicID[1] = { 622126 , 3 }	-- �P�_����
--	MagicID[2] = { 622127 , 1 }	-- �P�_�_�h
	MagicID[3] = { 622128 , 1 }	-- �P�_�˦a

	if CheckFlag( Player , Key[1] ) == false or CheckBuff( Player , TimeBuff ) == false then
		return false
	end

	if Choise == nil then
	--	N_Pos["X"] = ReadRoleValue( Npc , EM_RoleValue_X )
	--	N_Pos["Z"] = ReadRoleValue( Npc , EM_RoleValue_Z )
		N_Pos["Y"] = ReadRoleValue( Npc , EM_RoleValue_Y )

	--	P_Pos["X"] = ReadRoleValue( Player , EM_RoleValue_X )
	--	P_Pos["Z"] = ReadRoleValue( Player , EM_RoleValue_Z )
		P_Pos["Y"] = ReadRoleValue( Player , EM_RoleValue_Y )

	--	Var["X"] = N_Pos["X"] - P_Pos["X"]
	--	Var["Z"] = N_Pos["Z"] - P_Pos["Z"]
		Var["Y"] = N_Pos["Y"] - P_Pos["Y"]
	--	Var["W"] = Dis - P_Pos["Y"]
		
	--	DebugMsg( 0 , 0 , "N_Pos = "..N_Pos["Y"].." P_Pos = "..P_Pos["Y"].." Dis = "..Dis.." Touch = "..Touch )

	--	if Math.abs(Var["W"]) < Height then	-- Server���w�����ʧ@�C
		if Math.abs(Var["Y"]) < Height then	-- Server�ѨC0.3���ܧ󬰨C0.1���d���A�N���ݭnDis���w�����ʧ@�C
		--	DebugMsg( 0 , 0 , "Number = "..Number )
			if Score ~= 0 and Touch == 0 then
				WriteRoleValue( Npc , EM_RoleValue_Register+4 , 1 )	-- �� Npc ���A�i�H�Q�o��
				CancelBuff_NoEvent( Npc , Effect[1] )
				AddBuff( Npc , Effect[2] , 0 , -1 )
				AddBuff( Player , ScoreBuff[1] , 0 , 1 )
				AddBuff( Player , ScoreBuff[2] , Score-1 , -1 )
				ScriptMessage( Player , Player , 1 , "+"..Score , C_SYSTEM )
			--	ScriptMessage( Player , Player , 1 , "+"..Score , Color[Score] )
				if Random <= Steal then
					AddBuff( Player , 622160 , 0 , 2 )
				end
			end
		else
			return false
		end
	else
		AddBuff( Player , MagicID[Choise][1] , 0 , MagicID[Choise][2] )
		if Choise == 1 then   
			AddBuff( Npc , Effect[3] , 0 , 2 )
			AdjustFaceDir( Npc , Player , 0 )
			SetDefIdleMotion( Npc , ruFUSION_ACTORSTATE_ATTACK_POLEARM )	-- �R��
		end
	end
	sleep(5)
--	AddBuff( Npc , 622145 , 0 , 1 )
	WriteRoleValue( Tornado , EM_RoleValue_Register+1 , Number-1 )
	DelObj( Npc )
end
---------------------------------------------------------------------------------------------�H�U�����ե�
function Lua_Hao_Germany_3th_Clear()	-- �M���Ҧ�����

	local CreateID = {}
	CreateID[1] = 114993	-- 1��
	CreateID[2] = 115004	-- 3��
	CreateID[3] = 115005	-- 5��
	CreateID[4] = 120463	-- 10��
	CreateID[5] = 120464	-- ����
	CreateID[6] = 120465	-- �_�h
	CreateID[7] = 120466	-- �˦a
	CreateID[8] = 120467	-- �s����
	CreateID[9] = 113105	-- ���ê���
	
	for i = 1 , table.getn(CreateID) , 1 do
		Lua_Hao_NPCofAll_Clear(CreateID[i])
	end
end

function Lua_Hao_Germany_3th_Reset(Choise)

	local Player = OwnerID()
	local Key = {}
	Key[1] = { 545451 , 1 }	-- �w���W
	Key[2] = { 545452 , 0 }	-- �w����
	Key[3] = { 545463 , 0 }	-- ���w������y
	
	local Buff = { 622146 , 622162 , 622163 }	-- �������ơB�����ɶ��B���_�Ĥ�
	
	if Choise == 0 then
		for i = 1 , table.getn(Key) , 1 do
			SetFlag( Player , Key[i][1] , 0 )
		end
		
		for i = 1 , table.getn(Buff) , 1 do
			if CheckBuff( Player , Buff[i] ) == true then
				CancelBuff_NoEvent( Player , Buff[i] )
			end
		end
		DebugMsg( Player , 0 , "Reset" )
	elseif Choise == 1 then
		for i = 1 , table.getn(Key) , 1 do
			SetFlag( Player , Key[i][1] , Key[i][2] )
		end
		CancelBuff_NoEvent( Player , Buff[1] )
		CancelBuff_NoEvent( Player , Buff[2] )
		AddBuff( Player , Buff[3] , 0 , 604800 )
		DebugMsg( Player , 0 , "Let's go" )
	else
		DebugMsg( Player , 0 , "Entry error" )
	end
end
function Lua_Hao_Germany_3th_GameStart()	-- �C���}�l(���ϥ�)

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Count = SetSearchAllNpc(Room)
	local NpcID = 116477
	local Obj , ObjID

	if Count ~= 0 then
		for i = 1 , Count , 1 Do
			Obj = GetSearchResult()
			ObjID = ReadRoleValue( Obj , EM_RoleValue_OrgID )
			if ObjID == NpcID then
				BeginPlot( ObjID , "" , 0 )
				break
			end
		end
	end
end

function Lua_Hao_Germany_3th_ScriptMsg()

	local Self = OwnerID()
	local Random
	for i = 1 , 10 , 1 do
		Random = Math.Random(1,10)
		ScriptMessage( Self , Self , 0 , "+ "..Random , C_SYSTEM )
	end
end

function Lua_Hao_Test_CheckXYZ(Choise)

	CallPlot( OwnerID() , "Lua_Hao_Test_CheckXYZ_3" , Choise )
end

function Lua_Hao_Test_CheckXYZ_2(Height)

	local Obj = OwnerID()
	local Room = ReadRoleValue( Obj , EM_RoleValue_RoomID )
	DebugMsg( Obj , Room , "Call Height = "..Height )
end

function Lua_Hao_Test_CheckXYZ_3(Choise)

	local Obj = OwnerID()  
	local Room = ReadRoleValue( Obj , EM_RoleValue_RoomID )
	local X , Y , Z , Height
	local Sec = 0
		
	while Sec < 101 do
		X = ReadRoleValue( Obj , EM_RoleValue_X )
		Y = ReadRoleValue( Obj , EM_RoleValue_Y ) 
		Z = ReadRoleValue( Obj , EM_RoleValue_Z )
		Height = GetHeight( X , Y , Z )
	--	DebugMsg( Obj , Room , "X = "..X.." Z = "..Z.." Y = "..Y.." Height = "..Height )
	--	DebugMsg( Obj , Room , "X = "..X.." Z = "..Z )
		if Choise == 0 then
			DebugMsg( Obj , Room , "X = "..X.." Z = "..Z )
		elseif Choise == 1 then
			DebugMsg( Obj , Room , "Y = "..Y.."True Height = "..Height )
		elseif Choise == 2 then
			DebugMsg( Obj , Room , "X = "..X.." Z = "..Z.." Y = "..Y.." Height = "..Height )
		end
	--	CallPlot( Obj , "Lua_Hao_Test_CheckXYZ_2" , Height )
		Sleep(1)
		Sec = Sec + 1
	end
end

function Lua_Hao_Test_RandMove()

	local Npc = OwnerID()

	for i = 1 , 10 , 1 do
		CallPlot( Npc , "DW_MoveRand" , Npc , 25 )
		Sleep(10)
	end
end

function Lua_Hao_Germany_3th_Frog_Test()	-- 105098

	local Self = OwnerID()
	local X = ReadRoleValue( Self , EM_RoleValue_X )
	local Y = ReadRoleValue( Self , EM_RoleValue_Y )
	local Z = ReadRoleValue( Self , EM_RoleValue_Z )
	local Range , NewX , NewY , NewZ
	MoveToFlagEnabled( Self , false )				--�������޼@��
	SetModeEx( Self , EM_SetModeType_DisableRotate , false )	--�����۰ʭ��V
	WriteRoleValue( Self , EM_RoleValue_IsWalk , 0 )
	SetDefIdleMotion( Self , ruFUSION_MIME_RUN_FORWARD )	--��_�]�B���A
	while true do
		Range = Math.random(25) + 25
		NewX = X+Math.random( -Range , Range )
		NewZ = Z+Math.random( -Range , Range )
 		NewY = GetHeight( NewX , Y , NewZ )
	--	DebugMsg( 0 , 0 , "X = "..NewX.." Y = "..Y.." Z = "..NewZ )
		if CheckLine( Self , NewX , NewY , NewZ ) == true then
		--	LuaFunc_WaitmoveTo( Npc , NewX , Y , NewZ )
			MoveDirect( Self , NewX , NewY , NewZ )
		--	CallPlot( Npc , "DW_MoveRand" , Npc , Range )
		end
		sleep(10)
	end
end
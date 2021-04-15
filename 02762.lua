--1. �g�骱�a�n�J��A���ܦb���a��ܵ�
--2. �g��ߤW11�I�A���ܦb�u�W���a��ܵ� (�n�����F)
--3. �g����0�I�A���ܦb�u�W���a��ܵ� (�X�{)

function Lua_Hao_Retrun_Week(Num)	-- �^�ǬP��
--	DebugMsg( 0 , 0 , Num )
	local String = {}
	String[0] = "Sunday"
	String[1] = "Monday"
	String[2] = "Tuesday"
	String[3] = "Wednesday"
	String[4] = "Thursday"
	String[5] = "Friday"
	String[6] = "Saturday"
	return String[Num]
end

function Lua_Hao_TW_Phirius_Check_Time()	-- �T�{�ɶ�

	local Player = OwnerID()
	local Room =ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Hour = GetSystime(1)	-- ��
	local Min = GetSystime(2)	-- ��
	local Week			-- �P��

	if Trading_Phirius_Timer ~= -1 and Trading_Phirius_Timer ~= nil then
		Week = Lua_Hao_Retrun_Week(Math.floor(Trading_Phirius_Timer/10000))
		Hour = Math.floor((Trading_Phirius_Timer%10000)/100)
		Min = Trading_Phirius_Timer%100
		DebugMsg( Player , Room , "Week= "..Week.." ".."Custom time: "..string.format("%02d", Hour ).." : "..string.format("%02d", Min ) )			
	else
		Week = Lua_Hao_Retrun_Week(GetSystime(5))	-- �P�_��e�P��(0 ~ 6)�A�P���鬰 0�A§������ 6
		Hour = GetSystime(1)	-- ��
		Min = GetSystime(2)	-- ��
		DebugMsg( Player , Room , "Week= "..Week.." ".."System time: "..string.format("%02d", Hour ).." : "..string.format("%02d", Min ) )
	end
end

function Lua_Hao_TW_Phirius_Set_Time(Time) -- �ۭq�]�w�ɶ�

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Week , Hour , Min , Set_Hour , Set_Min

	if Time == nil or Type(Time) ~= "number" then
		DebugMsg( Player , Room , "Change to the default Server time." )
		Trading_Phirius_Timer = -1 -- �ŧi�� -1
		Week = Lua_Hao_Retrun_Week(GetSystime(5))	-- �P�_��e�P��(0 ~ 6)�A�P���@�� 0
		Hour = GetSystime(1)	-- ��
		Min = GetSystime(2)	-- ��
		DebugMsg( Player , Room , "Week= "..Week.." ".."System time: "..string.format("%02d", Hour ).." : "..string.format("%02d", Min ) )
		return false
	end

	if Trading_Phirius_Timer == nil then
		Trading_Phirius_Timer = -1 -- �ɶ�
	end

	Week = Math.floor(Time/10000)
--	Hour = Math.floor(Time/100)
	Hour = Math.floor((Time%10000)/100)
	Min = Time%100
	if Week > 6 or Hour > 23 or Min > 59 then
		DebugMsg( Player , Room , "Week= "..Week.." ".."Costom time: "..string.format("%02d", Hour ).." : "..string.format("%02d", Min ) )
		DebugMsg( Player , Room , "I can't understand what you mean. For example , you can enter 01032 , It means Sunday 10:32 AM , 40707 means Thursday 07:07 AM , 62359 means Saturday 23:59 PM" )
		return false
	else
		Week = Lua_Hao_Retrun_Week(Math.floor(Time/10000))	-- �g
		Hour = GetSystime(1)	-- ��
		Min = GetSystime(2)	-- ��
		Trading_Phirius_Timer = Time	-- �N�����ܼƫŧi�� Time
		Set_Hour = Math.floor((Time%10000)/100)
		Set_Min = Time%100
		DebugMsg( Player , Room , Week.." Custom time: "..Set_Hour.." : "..Set_Min.." System time: "..string.format("%02d", Hour ).." : "..string.format("%02d", Min ) )
	--	DebugMsg( Player , Room , "Custom time: "..string.format("%05d", Trading_Phirius_Timer ).." "..Week.." System time: "..string.format("%02d", Hour ).." : "..string.format("%02d", Min ) )
	end
end

function Lua_Hao_TW_Phirius_Login( PlayerLV , Type , Race )

	local Player = OwnerID()
	local MsgBuff = 623521	-- ���ܥήɶ��T��
	-- 2012.10.29 �ױ� 2012.11.21 ���e�|���ͰT�������D --
	local Month = GetSystime(3)+1	-- ��
	local Day = GetSystime(4)	-- ��
	-- 2012.12.18 ���� 2012.11.01 ~ 11.21 �ױ����ܰT�����]�w -- 
--	if Month == 11 and Day <= 18 then
--		return false
--	end
	-- DebugMsg( Player , 0 , "Type = "..Type )
	--
	if Type == 3 then
		AddBuff( Player , MsgBuff , 0 , -1 )
	end
end

function Lua_Hao_TW_Phirius_Login_Msg()	-- �C���n�J�ɡA���檺�@��

	local Week , Hour , Min	-- �g�B�p�ɡB����
	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )

	if Trading_Phirius_Timer ~= -1 and Trading_Phirius_Timer ~= nil then	-- �Ҧp : 61024 (§���馭�W10�I24��)
	--	Week = Math.floor(Trading_Phirius_Timer/10000)
		Week = Lua_Hao_Retrun_Week(Math.floor(Trading_Phirius_Timer/10000))	
		Hour = Math.floor((Trading_Phirius_Timer%10000)/100)
		Min = Trading_Phirius_Timer%100
	--	DebugMsg( Player , Room , "Week= "..Week.." ".."Custom time: "..string.format("%02d", Hour ).." : "..string.format("%02d", Min ) )			
	else
		Week = Lua_Hao_Retrun_Week(GetSystime(5))	-- �g	-- �P�_��e�P��(0 ~ 6)�A�P���@�� 0
		Hour = GetSystime(1)	-- ��
		Min = GetSystime(2)	-- ��
	--	DebugMsg( Player , Room , "Week= "..Week.." ".."System time: "..string.format("%02d", Hour ).." : "..string.format("%02d", Min ) )
	end

	if Week ~= "Sunday" then
--	if Week ~= 0 and (tostring(Week)) ~= "Sunday" then
	--	DebugMsg( Player , Room , "End exchange service" )
		return false
	else
		if Hour >= 23 then	-- �ߤW11�I��h... �g��ߤW11�I�A���ܦb�u�W���a��ܵ� (�n�����F)
			ScriptMessage( Player , Player , 0 , "[SC_TW_PHIRIUS_TRADER_12]", 0 )	-- [200003]�I��[203038]���A�ȱN���� 0 �I 0 ���ɵ����I
		else			-- �ߤW11�I�e�h... �g�骱�a�n�J��A���ܦb���a��ܵ�
			ScriptMessage( Player , Player , 0 , "[SC_TW_PHIRIUS_TRADER_08]", 0 )	-- [200003]�I��[203038]���A�ȶ}�l�ơI�Ա��Ч���[ZONE_VARANAS]��[ZONE_OBSIDIAN BASTION]�Ȧ�e�������ťN���I���ӤH�B�d�߼ڡC
		end
	end
end		

function Lua_Hao_TW_Phirius_Bring()	-- �����ŰӤH ���󲣥ͼ@��

	local Npc = OwnerID()
	local OrgID = ReadRoleValue( Npc , EM_RoleValue_OrgID )	-- Ū�� Npc OrgID
	local NpcID = { 121441 , 121442 }	-- NpcID
	local ZoneID =  ReadRoleValue( Npc , EM_RoleValue_ZoneID ) 	-- Ū�� ZoneID
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 )		-- �P�_���y
	local Room = ReadRoleValue( Npc , EM_RoleValue_RoomID )	-- Ū�� Room
	local Week , Hour , Min , TWWeek	-- �P���B�p�ɡB�����B��ܤ���P��
	local State = 0 -- �{��������
	Hide( Npc )
	if Trading_Phirius_Timer == nil then	-- �]�w��@�ϰ쪺�����ܼơA�ΨӧP�_�P���B�p�ɡB����
		Trading_Phirius_Timer = -1
	end
	AddBuff( Npc , 503217 , 0 , -1 )	-- ���ʼлx
	while true do
		if Trading_Phirius_Timer ~= -1 then	-- �Ҧp : 61024 (§���馭�W10�I24��)
			Week = Math.floor(Trading_Phirius_Timer/10000)
			Hour = Math.floor((Trading_Phirius_Timer%10000)/100)
			Min = Trading_Phirius_Timer%100
			TWWeek = Lua_Hao_Retrun_Week(Math.floor(Trading_Phirius_Timer/10000))
			if  OrgID == NpcID[1] then
		--		DebugMsg( 0 , Room , "Zone 2 Week= "..TWWeek.." ".."Custom time: "..string.format("%02d", Hour ).." : "..string.format("%02d", Min ) )
			else
		--		DebugMsg( 0 , Room , "Zone 6 Week= "..TWWeek.." ".."Custom time: "..string.format("%02d", Hour ).." : "..string.format("%02d", Min ) )
			end
		else
			Week = GetSystime(5)	-- �P�_��e�P��(0 ~ 6)�A�P���@�� 0
			Hour = GetSystime(1)	-- ��
			Min = GetSystime(2)	-- ��
			TWWeek = Lua_Hao_Retrun_Week(GetSystime(5))
			if  OrgID == NpcID[1] then
		--		DebugMsg( 0 , Room , "Zone 2 Week= "..TWWeek.." ".."System time: "..string.format("%02d", Hour ).." : "..string.format("%02d", Min ) )
			else
		--		DebugMsg( 0 , Room , "Zone 6 Week= "..TWWeek.." ".."System time: "..string.format("%02d", Hour ).." : "..string.format("%02d", Min ) )
			end
		end
		
		if Week == 0 then
			if State == 0 then
				Show( Npc , Room )
				State = 1
			end
			if Hour == 23 and Min == 0 and OrgID == NpcID[1] and Zone == 2 then	-- �g��ߤW11�I0���A���ܦb�u�W���a��ܵ�
				ScriptMessage( Npc , -2 , 0 , "[SC_TW_PHIRIUS_TRADER_09]", 0 )
				--[200003]�I��[203038]���A�ȱN�� 1 �p�ɫᵲ���I�I���A�ȱN��U�g�骺��� 0 �I 0 ����[ZONE_VARANAS]��[ZONE_OBSIDIAN BASTION]�Ȧ�e�������ťN���I���ӤH���s�}��A�}��ɶ��N����ܹj�骺��� 0 �I 0 ���A�Чⴤ�I���ɶ��C
			elseif Hour == 0 and Min == 0 and OrgID == NpcID[1] and Zone == 2 then -- �g����0�I�A���ܦb�u�W���a��ܵ� (�X�{)
				ScriptMessage( Npc , -2 , 0 , "[SC_TW_PHIRIUS_TRADER_08]", 0 )
				--[200003]�I��[203038]���A�ȶ}�l�ơI�Ա��Ч���[ZONE_VARANAS]��[ZONE_OBSIDIAN BASTION]�Ȧ�e�������ťN���I���ӤH�d�߼ڡC
			end
		else
			if State == 1 then
				Hide( Npc )
				State = 0
			end
		end
		Sleep(600)
	end
end

function Lua_Hao_TW_Phirius_Talk()	 -- �����ŰӤH��l��ܼ@��

	local Player = OwnerID()
	local Npc = TargetID()
	local IsBuffed = CheckBuff( Player , 621751 )
	SysCastSpellLv( Npc , Player , 496587 , 0 )
	if IsBuffed== false then
		CallPlot( Player , "Lua_Hao_TW_Phirius_Range" , Player , 50 )  --�ˬdNPC�P���a���Z��	
	end
	AdjustFaceDir( Npc , Player , 0 ) --���V
--	PlayMotion( Player , 112 ) -- �͸�
	PlayMotion( Npc , 112 ) -- �͸�
	SetSpeakDetail( Player , "[SC_TW_PHIRIUS_TRADER_10]" )	-- �A�Q�I�������ťN���ܡH
	AddSpeakOption(  Player , Npc , "[SC_TW_PHIRIUS_TRADER_11]" ,  "Lua_Hao_Trading_Phirius_Yes_I_do",  0 )	-- �ڷQ�I��
end

function Lua_Hao_TW_Phirius_Range( Player , dis )	-- �Z���W�L�Y������ܵ���

	local BuffID = 621751
	local BuffIDPos , NpcGuid , Npc
	while true do
		BuffIDPos = Lua_BuffPosSearch( Player , BuffID )			-- �� Buff ����m
		NpcGuid = BuffInfo( Player , BuffIDPos , EM_BuffInfoType_OwnerID )	-- �� Buff �I�i��
		Npc = ReadRoleValue( NpcGuid , EM_RoleValue_OrgID )
	--	DebugMsg( Player , 0 , "Dis = "..GetDistance( Player , NpcGuid ) )
		if GetDistance( Player , NpcGuid )  >= dis then
			CloseSpeak( Player )
			AdjustFaceDir( NpcGuid , Player , 0 ) -- ���V
			PlayMotion( NpcGuid , 116 ) -- �A��
		--	DebugMsg( Player , 0 , "Distance exceeded" )			
			break
		end
		sleep(1)
	end
	CancelBuff_NoEvent( Player , BuffID )
end

function Lua_Hao_Trading_Phirius_Yes_I_do()

	local Player = OwnerID()
	local Npc =TargetID()
	CloseSpeak( Player )
	AdjustFaceDir( Npc , Player , 0 ) --���V
	CallPlot( Player , "Lua_Hao_Trading_Phirius_0" , Npc )
end

-- �H�U���I���@�� -- 
function Lua_Hao_Trading_Phirius_0( Npc )

	local Player = OwnerID()
--	local Npc = TargetID()
	local Diamond = ReadRoleValue( Player , EM_RoleValue_Money_Account )
	local Time = 0
	local Key , DialogStatus
	local inputstring = ""
	local Menu = "[SC_TW_PHIRIUS_TRADER_01][$SETVAR1 ="..Diamond.."]"
	--�z�ثe����<CY>[$VAR1]</CY><CB>[200003]</CB>�A<CY>1</CY><CB>[200003]</CB>�i�I��<CY>10</CY>��<CB>[203038]</CB>�A�C���I���̰����B<CY>2000</CY><CB>[200003]</CB>�C
	AdjustFaceDir( Npc , Player , 0 ) -- ���V
	if CheckBuff( Player , 501570 ) == true then 
		ScriptMessage( Player , Player , 0 , "[SC_WINDOW_OPENED]", 0 )--�����w�g���}�F
		return 0
	end
	local NpcID = ReadRoleValue( Npc , EM_RoleValue_OrgID )	-- DesignLog �^�Ǫ��s��
	AddBuff( Player , 501570 , 0 , -1 )
	DialogCreate( Player , EM_LuaDialogType_Input , Menu )
	DialogSelectStr( Player , "[SC_OKAY]" )	-- �T�w
	DialogSelectStr( Player , "[SC_CANCEL]" )	-- ����

	if ( DialogSendOpen( Player ) == false )  then  --���ϥο��~�A�^�ǿ��~�T��
		ScriptMessage( Player , Player , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 ) 
		return
	end

	while true do
		if Time > 300 then  -- 30��L�ʧ@�A������ܵ���
			ScriptMessage( Player , Player , 0 , "[SC_BUFFNPC_07]" , 0 ) -- ���m�W�L30��,�۰����������C
			Key = 1
		end
		if GetDistance( Player , Npc ) >= 50 then	-- �Z���W�L�Y�����I������
			Key = 1
		end
		DialogStatus = DialogGetResult( Player )  --�ˬd�ϥΪ̿��������
	--	DebugMsg( Player , 0 , "Dialog = "..DialogStatus )
		if DialogStatus ~= -2 and DialogStatus ~= -1 then -- ��l�ơB���_
			inputstring = tonumber(DialogGetInputResult( Player ))
			if DialogStatus == 0 then  -- ����J�r��(��J���e���� String )
				if Type(inputstring)  ~= "number" then
					ScriptMessage( Player , Player , 1 , "[SC_TW_PHIRIUS_TRADER_02]" , 0 )	-- ��J���e�������Ʀr
					Key = 1
				elseif inputstring > 0 then	-- �r����Ʀr
					if inputstring > 2000 then
						ScriptMessage( Player , Player , 1 , "[SC_TW_PHIRIUS_TRADER_06]" , 0 )	-- �W�L�榸�i�I���W���A�C���I���̦h���B2000[200003]�C
						Key = 1
					elseif Diamond < inputstring then
						ScriptMessage( Player , Player , 1 , "[SC_TW_PHIRIUS_TRADER_04]" , 0 )	 -- ���p�l�B�����C
						Key = 1	
					else
						DebugMsg( Player , 0 , inputstring )
						CancelBuff( Player , 501570 )
						DialogClose( Player )
						CallPlot( Player , "Lua_Hao_Trading_Phirius_1" , Player , Npc , inputstring )	-- ���a�BNpc�B�榸���p����q
						return true
					end
				else
					DebugMsg( Player , 0 , inputstring )
					ScriptMessage( Player , Player , 1 , "[SC_TW_PHIRIUS_TRADER_05]" , 0 )	-- ��J���e���~
					Key = 1
				end
			else
			--	DebugMsg( Player , 0 , "Step1_Else" )
				Key = 1
			end
		end
		if Key == 1 then
		--	DebugMsg( Player , 0 , "Step1_return" )
			CancelBuff( Player , 501570 )
			DialogClose( Player )
			return false
		end
		sleep(1)
		Time = Time+1
	end
end

function Lua_Hao_Trading_Phirius_1( Player , Npc , Number )	-- ���a�BNpc�B�榸���p����q

	local Diamond = ReadRoleValue( Player , EM_RoleValue_Money_Account )	-- ���a���������p�ƶq
	local Ratio = 10	-- ���p:�����Ū���v
	local Time = 0
	local Key , DialogStatus
	local inputstring = ""
	local Menu = "[SC_TW_PHIRIUS_TRADER_03][$SETVAR1 ="..Number.."][$SETVAR2 ="..Number*Ratio.."][$SETVAR3 ="..Diamond-Number.."]"
	--�z�T�w�n��<CY>[$VAR1]</CY><CB>[200003]</CB>�I��<CY>[$VAR2]</C>��<CB>[203038]</CB>�ܡH�����I����A�|���l�B<CY>[$VAR3]</CY><CB>[200003]</CB>�C
	AdjustFaceDir( Npc , Player , 0 ) -- ���V
	if CheckBuff( Player , 501570 ) == true then
		ScriptMessage( Player , Player , 0 , "[SC_WINDOW_OPENED]", 0 )--�����w�g���}�F
		return 0
	end
	
	AddBuff( Player , 501570 , 0 , -1 )
	DialogCreate( Player , EM_LuaDialogType_YesNo , Menu )
	DialogSelectStr( Player , "[SC_OKAY]" )	-- �T�w
	DialogSelectStr( Player , "[SC_CANCEL]" )	-- ����

	if( DialogSendOpen( Player ) == false ) then 
		ScriptMessage( Player , Player , 0 , "[SC_WINDOW_OPENED]", 0 )--�����w�g���}�F
		return 0
	end

	while true do
		sleep(1)
		Time = Time+1
		if Time > 300 then  -- 30��L�ʧ@�A������ܵ���
			ScriptMessage( Player , Player , 0 , "[SC_BUFFNPC_07]" , 0 ) -- ���m�W�L30��,�۰����������C
			Key = 1
		end
		if GetDistance( Player , Npc ) >= 50 then	-- �Z���W�L�Y�����I������
			Key = 1
		end
		DialogStatus = DialogGetResult( Player )  --�ˬd�ϥΪ̿��������
		if DialogStatus ~= -2 and DialogStatus ~= -1 then -- ��l�ơB���_
			inputstring = DialogGetInputResult( Player )
			if DialogStatus == 0 then	-- ��ܽT�{
				CancelBuff( Player , 501570 )
				DialogClose( Player )
				CallPlot( Player , "Lua_Hao_Trading_Phirius_2" , Player , Npc , Number*Ratio , Ratio )	-- ���a�BNpc�B�榸�����ťN������q�B���p:�����ťN����v
				return true
			else
			--	DebugMsg( Player , 0 , "Step2_No" )
				Key = 1
			end
		end
		if Key == 1 then
		--	DebugMsg( Player , 0 , "Step2_return" )
			CancelBuff( Player , 501570 )
			DialogClose( Player )
			return false
		end
	end
end

function Lua_Hao_Trading_Phirius_2( Player , Npc , Number , Ratio )	-- ���a�BNpc�B�榸�����ťN������q�B���p:�����ťN����v

	local Trading = 203038
	local MaxHeap = GameObjInfo_Int( Trading ,"MaxHeap" )	-- �������ťN�������|�q
	local Diamond = ReadRoleValue( Player , EM_RoleValue_Money_Account )	-- ���a���������p�ƶq
	local Space = Math.ceil(Number/MaxHeap)	-- �L����i��	�����ݨD�Ŷ�
	local emotion = { 107 , 106 }	-- �n�Y�B�I�Y
	local QueueOfBag = QueuePacketCount( Player )	--�p��I�]�Ȧs�Ϧ��X��
	local SpaceOfBag = EmptyPacketCount( Player )	--�p��I�]���X�ӪŦ�
	local Turnover = ReadRoleValue( Npc , EM_RoleValue_PID )	--���p����q(�HServer���Ҧӭ��m)
	local NpcID = ReadRoleValue( Npc , EM_RoleValue_OrgID )	-- DesignLog �^�Ǫ��s��

	AdjustFaceDir( Npc , Player , 0 )	 -- ���V
	DebugMsg( Player , 0 , "Diamond = "..Diamond.." Number = "..Number.." Space = "..Space.."/"..SpaceOfBag.." NpcID = "..NpcID )

	if Diamond *Ratio < Number then	-- ���p�l�B����
		ScriptMessage( Player , Player , 1 , "[SC_TW_PHIRIUS_TRADER_04]" , 0 ) -- ���p�l�B�����C
		PlayMotion( Npc , emotion[1] )	-- �n�Y
	--	DebugMsg( Player , 0 , "Number = "..Number )
		return false  
	else	-- �l�B����
	--	if Check_Bag_Space( Player , Space ) == false then	-- �I�]�Ŷ�����
		if QueueOfBag ~= 0 then	-- �p�G�I�]�Ȧs�Ϥw�ϥ�
			PlayMotion( Npc , emotion[1] )	-- �n�Y
			ScriptMessage( Player , Player , 1 , "[SC_TW_PHIRIUS_TRADER_07]" , 0 ) -- �е��Ԧ�C���~�i�J�I�]����
			return false
		end
	--	if ( QueueOfBag <= 10 ) then
			if ( SpaceOfBag >= Space ) then	-- �I�]�Ѿl�Ŷ� / �����ݨD�Ŷ�
			--	DebugMsg( Player , 0 , "ItemCount = "..(Number*Ratio - ((Space-1)*MaxHeap)) )	-- ���|�q
				PlayMotion( Player , emotion[2] )	-- �I�Y
			--	2012.10.01 ���p���ڼҦ��ק�
			--	AddRoleValue( Player , EM_RoleValue_Money_Account , -(Number/Ratio) )	-- �����p�ڶ�
				if AddMoneyEx_Account( Player , EM_ActionType_PlotGive , -(Number/Ratio) , true ) == true then
					for i = 1 , Space , 1 do	-- ���������̤j���|�q�����~�A�Y���̫�@���A�h�������w�q
						if i == Space then
							GiveBodyItem( Player , Trading , Number - ((Space-1)*MaxHeap) )
						else	
							GiveBodyItem( Player , Trading , MaxHeap )
						end
					end
					Turnover = Turnover + (Number/Ratio)
					WriteRoleValue( Npc , EM_RoleValue_PID , Turnover )
					DesignLog( Player , NpcID , "Revenue = "..Number/Ratio.." Turnover = "..Turnover )	-- �榸�禬�B�`��~�B
					return true				
				else
					ScriptMessage( Player , Player , 1 , "[SC_EXCHANGE_FAIL]" , 0 ) -- �Э@�ߵ��ԥ����I�������C
					return false
				end
			else
				ScriptMessage( Player , Player , 1 , "[K_08MID_DIALOG8]" , 0 )	-- �z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
				PlayMotion( Npc , emotion[1] )	-- �n�Y
				return false
			end
	--	else
	--		return false		
	--	end	
	end
end
function Lua_dupei_fire_fireman()
	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) 
--	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 ) -- �P�_���y
	local Npc = OwnerID()	--����
	local Hour , Min
	local Fire	-- �����·Q�_���¤W�����K
	local Box

		while true do
		Hour = GetSystime(1) --���o�{�b�ɶ��G��
		Min = GetSystime(2) --���o�{�b�ɶ��G��

			if Hour ==0 or Hour ==4 or Hour ==8 or Hour ==12 or Hour ==16 or Hour ==20 then
				if Min ==20 then
					if ZoneID < 1000 then --(�YZoneID�j��1000�h�����y)
					RunningMsgEx( Npc , 2 , 3 , "[SC_FIREDAY_2012_EV1_1]" )  --��Ѫ̯����Y�N�n�}�l�ɤ���֬��ʡA�Q�������~���³̰������D�Ԫ̧֨Ӳ��¶��X�a
					end			
				local Magic = LuaFunc_CreateObjByObj( 120152 , Npc )	--�]�k�}
				WriteRoleValue( Npc , EM_RoleValue_Register+1 , Magic ) -- �����¦b�O���禡�{�_�]�k�}

				elseif Min ==30 then
					if ZoneID < 1000 then --(�YZoneID�j��1000�h�����y)
					RunningMsgEx( Npc , 2 , 3 , "[SC_FIREDAY_2012_EV1_2]" )  --���ʶ}�l
					end
					BeginPlot( Npc , "Lua_dupei_fire_furemanobj" , 0 ) -- �ͤ�
					BeginPlot( Npc , "Lua_dupei_fire_fireman_born" , 0 ) -- �ͲŤ�

				elseif Min==33 then
					Magic = ReadRoleValue( Npc , EM_RoleValue_Register+1 )   --�Q�_���󰵧R���ʧ@
					Fire= ReadRoleValue( Npc , EM_RoleValue_Register+2 )
					Box=ReadRoleValue( Npc , EM_RoleValue_Register+3 )
					DelObj(Magic)
					DelObj(Fire)
					DelObj(Box)	
					WriteRoleValue( Npc , EM_RoleValue_Register+1 , 0 )
					WriteRoleValue( Npc , EM_RoleValue_Register+2 , 0 )
					WriteRoleValue( Npc , EM_RoleValue_Register+3 , 0 )
					BeginPlot (Npc ,  "Lua_dupei_fire_firemandelrune" , 0)
						if ZoneID < 1000 then --(�YZoneID�j��1000�h�����y)
						RunningMsgEx( Npc , 2 , 3 , "[SC_FIREDAY_2012_EV1_22]" )--�ɶ���A���ɬq�t����֧��Y�֬��ʵ����C
						end
				end
			end
		Sleep(600)
		end
end

--------�ͦ���---------------------------------------

function Lua_dupei_fire_furemanobj()	--���¥ͦ�����
	local Npc = OwnerID()	-- ����
--	local Magic = LuaFunc_CreateObjByObj( 120152 , Npc )	--�]�k�}
	local X = ReadRoleValue( Npc , EM_RoleValue_X )
	local Y = ReadRoleValue( Npc , EM_RoleValue_Y )
	local Z = ReadRoleValue( Npc , EM_RoleValue_Z )
	local Dir = ReadRoleValue( Npc , EM_RoleValue_Dir )
	local Room = ReadRoleValue( Npc , EM_RoleValue_RoomID )
	local Fire = CreateObj( 120156 , X , Y+35 , Z , Dir , 1 )	-- ���¤W����
	SetModeEx(  Fire, EM_SetModeType_Show, true )--���
	SetModeEx( Fire , EM_SetModeType_Gravity , false )	--���O
	SetModeEx( Fire  , EM_SetModeType_Strikback, false )--����
	SetModeEx( Fire  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Fire  , EM_SetModeType_Obstruct, false )--����
	SetModeEx( Fire  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Fire  , EM_SetModeType_Move, false )--����
	AddToPartition( Fire , Room ) 	-- �ͦ����¤W����
	WriteRoleValue( Npc , EM_RoleValue_Register+2 , Fire )	-- �����¦b�O���禡�{�o���¤W����
	local CheckPlayer = {}
	local Player = SearchRangePlayer( Npc , 185) --�j�M���©P��185�Ҧ����a�itable
	local Distance = SetSearchAllPlayer( Room )
	local Gamer = {}

		for i = 0 , table.getn(Player) , 1 do
			if CheckBuff( Player[i] , 621827 ) == true then --���w���WBuff
				AddBuff( Player[i] , 621802 , 0 , 3 ) --���� �ˬd_�X���P�w Buff
				table.insert( CheckPlayer , Player[i] ) --�[�JCheckPlayer��table��
			end
		end

		if Distance > 0 then
			for i = 1 , Distance , 1 do
				Gamer[i] = GetSearchResult()
				if CheckBuff( Gamer[i] , 621827 ) == true and GetDistance( Gamer[i] , Npc ) > 185 then --���w���WBuff
					CancelBuff ( Gamer[i] , 621827 ) --�������W�ҩ�Buff 621827
					CancelBuff ( Gamer[i] , 621779 )--�������W�߰_���Ť� 621779
					CancelBuff ( Gamer[i]  , 621801 )  --�����X�����a���d���z��
					ScriptMessage( Gamer[i]  , Gamer[i]  , 1 , "[SC_FIREDAY_2012_EV1_27]" , 0 ) --�W�X���ʽd��~�A�X���F�I
				end
			end
		end

		for i = 1 , 180 , 1 do --���гo�Ӱʧ@180��,����1�� (�]�N�O�|����180��)
		 	CheckPlayer = Lua_dupei_fire_firemanDis( CheckPlayer ) --�NCheckPlayer��table�a�Jfunction
			local Player = SearchRangePlayer( Npc , 185 ) --�j�MBOX�P��185�Ҧ����a�itable

			for i = 0 , table.getn(Player) , 1 do
				local BuffType = 0
				local Count = BuffCount( Player[i] )

--				if GetDistance( Player[i] , Npc ) > 185 then
--					CancelBuff ( Player[i] , 621827 ) --�������W�ҩ�Buff 621827
--					CancelBuff ( Player[i] , 621779 )--�������W�߰_���Ť� 621779
--					CancelBuff ( Player[i]  , 621801 )  --�����X�����a���d���z��
--					ScriptMessage( Player[i]  , Player[i]  , 1 , "[SC_FIREDAY_2012_EV1_4]" , 0 ) --�W�X���ʽd��~�A�X���F�I
--				end

				for j = 0 , Count  , 1 do
					local BuffID = BuffInfo( Player[i] , j , EM_BuffInfoType_BuffID )
					if GameObjInfo_int( BuffID , "AssistType" ) == 68 then
						BuffType = GameObjInfo_int( BuffID , "AssistType" )
						break
					end
				end

				if BuffType == 68 then --���M�����M
				DW_CancelTypeBuff( 68,  Player[i] ) --�U��
				ScriptMessage( Player[i] , Player[i] , 1 , "[SC_THANKS_2011_12]" , 0 )  --���ʶi�椤�A���B�L�k�M�����M�I0�O����  C_SYSTEM�O����
				end
			end
			Sleep(10)
		end

-- �̫�n���檺�@��--
	if table.getn(CheckPlayer) > 0 then
		for i = 1 , table.getn(CheckPlayer) , 1 do
--		SetFlag (CheckPlayer[i] , 546121 , 0 )
		CancelBuff (CheckPlayer[i] , 621779)
		CancelBuff (CheckPlayer[i] , 621781)
		CancelBuff (CheckPlayer[i] , 621800)
		CancelBuff (CheckPlayer[i] , 621802)
		CancelBuff (CheckPlayer[i] , 621827)
		SetFlag ( CheckPlayer[i] , 546121 , 1 ) --�}�ҧ����C���ҩ�
		ScriptMessage( Checkplayer[i] , Checkplayer[i] , 1 , "[SC_FIREDAY_2012_EV1_7]" , C_SYSTEM ) --�P�§A���ѻP�A�w��U���A�ӬD�ԡI��o�����ƥi�H�V�̵ΧI�����y�C
		end
	end	
end


function Lua_dupei_fire_fireman_born()   -- ������box 
 	local OID = OwnerID() 
	local TID = TargetID()
	local X = ReadRoleValue( OID , EM_RoleValue_X )
	local Y = ReadRoleValue( OID , EM_RoleValue_Y )
	local Z = ReadRoleValue( OID , EM_RoleValue_Z )
	local Dir = ReadRoleValue( OID , EM_RoleValue_Dir )
	local Room = ReadRoleValue( OID , EM_RoleValue_RoomID )
	local Box = CreateObj( 120159 , X , Y , Z+20 , Dir , 1 )	--  box  �n��box��id
	SetModeEx(  Box, EM_SetModeType_Show, false )--���
	SetModeEx( Box , EM_SetModeType_Gravity , false )	--���O
	SetModeEx( Box  , EM_SetModeType_Strikback, false )--����
	SetModeEx( Box  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Box  , EM_SetModeType_Obstruct, false )--����
	SetModeEx( Box  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Box  , EM_SetModeType_Move, false )--����
	SetModeEx( Box  , EM_SetModeType_Searchenemy, false )--����
	WriteRoleValue( OID , EM_RoleValue_Register+3 , Box )	-- �����¦b�O���禡�{�o���¤W����

	-- ����Wnpc���W�H��(register) 
	local npc = LuaFunc_SearchNPCbyOrgID( OID , 120153, 500 , 0)       --����Wnpc
	local playercount = ReadRoleValue( npc, EM_RoleValue_Register )  -- �����W���a�H��
--	say(npc, "playercount  = "..playercount ) --�ثe����ܦ����W���a�H��
	local runecount 	-- �ھڤH�ƨM�w�Ť�ƶq
		if playercount <= 5 then
		runecount = 7
		elseif playercount > 5 and playercount <= 8  then
		runecount = 10
		elseif playercount > 8 and playercount <= 12  then
		runecount = 14
		elseif playercount > 12 and playercount <= 18  then
		runecount = 20
		elseif playercount > 18 then
		runecount = 25		
		end

	CallPlot( Box , "lua_dupei_fire_fireman_rune" , runecount )
	AddToPartition( Box , Room ) 	-- �ͦ����ê���Box

	-- ��H���k�s
	WriteRoleValue( npc , EM_RoleValue_Register , 0 ) 
	local playercount = ReadRoleValue( npc, EM_RoleValue_Register )  -- �����W���a�H��
--	say(npc, "playercount  = "..playercount ) --�ثe����ܦ����W���a�H��
end


function lua_dupei_fire_fireman_rune(runecount) --���ê���Box���ͦ���{��
	local OID = OwnerID()  -- Box
--	say(OID, "count = "..runecount )
	local FlagObjID = 781070  --�X�m����s�� 
	local FlagNum = GetMoveFlagCount( FlagObjID ) --�X�m�ƶq	
	local Obj = 120157 -- �n�ت�����ID
	local ObjNum =  runecount      --math.floor( FlagNum / 4 )   --�شӪ���ƶq 
	local resetTime =  10   -- ���j�ɶ�
	local Range = 10 --����üƽd��
	local Gravity = true --���O
--	say(OID, "ObjNum = "..ObjNum )
	ks_CreateObj( FlagObjID, FlagNum, Obj, ObjNum, resetTime, Range, Gravity )--�o�O�w�ɰ��檺�j��
end

--------�Ť�R����---------------------------------------

function Lua_dupei_fire_firemandelrune()
	local OID=OwnerID()
	local zone=ReadRoleValue (OID , EM_RoleValue_RoomID)
	local rune=SetSearchAllNPC(zone)
		for i = 1 , rune , 1 do
		local NPC = GetSearchResult() 
		local OrgID = ReadRoleValue( NPC ,EM_RoleValue_OrgID )
			if OrgID == 120157 then			
			DelObj(NPC)
			end
		end	
end


--------���ʽd��---------------------------------------

function Lua_dupei_fire_firemanDis( CheckPlayer )
	local Npc = OwnerID()
	local Newplayer ={}
--	for i , player in pairs(CheckPlayer) do
	for i = 1 , table.getn(CheckPlayer) , 1 do
--		if CheckBuff( player , 621802) then
		if CheckBuff( Checkplayer[i] , 621802) then
		local Distance = GetDistance( Npc , Checkplayer[i] ) 
			if Distance <= 185 then --�c�l�P���a�Z��<185
			AddBuff( Checkplayer[i] , 621802 , 0 , 3 ) --�[�ˬd_�{��BUFF,����,���
				if Distance > 170 then --�c�l�P���a�Z�� >170
				ScriptMessage( Checkplayer[i] , Checkplayer[i] , 1 , "[SC_FIREDAY_2012_EV1_3]" , 0 ) --�A�֭n�W�X���ʽd��~�F�I
				end
			end
		table.insert( Newplayer , Checkplayer[i] )
		end
	end
	return Newplayer 
end


--------�X���ʧ@�@��---------------------------------------

function Lua_dupei_fire_firemanout() 
	local Player = OwnerID()
	CancelBuff ( Player , 621827 ) --�������W�ҩ�Buff 621827
	CancelBuff ( Player , 621779 )--�������W�߰_���Ť� 621779
	CancelBuff ( Player , 621801 )  --�����X�����a���d���z��
--	SetFlag ( player , 546121 , 0 ) --�������W�ҩ�Keyitem 546121
	ScriptMessage( Player , Player , 1 , "[SC_FIREDAY_2012_EV1_4]" , 0 ) --�W�X���ʽd��~�A�X���F�I
end

--------�Ť�ʧ@�@��---------------------------------------

function Lua_dupei_fire_fireman01() --�˲Ť�
	SetPlot( OwnerID() , "touch" , "Lua_dupei_fire_firemanstone" , 20 );
end

function Lua_dupei_fire_firemanstone() --�����Ť�BUFF
	SetPlot(TargetID(),"touch","",0)
	local Player = OwnerID()
	local A=CheckBuff( Player , 621827 ) --�ˬd���WBuff 621827 
--	local B=CheckBuff( Player, 621781 ) --�ˬd�˼�Buff 621781 
	local C=CheckBuff( Player, 621779 ) --�ˬd�Ť�Buff 621779 
--	local boom = ReadRoleValue(Player , EM_RoleValue_Register9 )
		if A == false then--���W�S�����W��
		ScriptMessage( Player , Player , 1 ,"[SC_FIREDAY_2012_EV1_5]" , 0 )--�L�k�B���C
		SetPlot( TargetID() , "touch" , "Lua_dupei_fire_firemanstone" , 20 );
		return false
--		elseif B == true then
--		ScriptMessage( Player , Player , 1 ,"[SC_FIREDAY_2012_EV1_8]" , 0 )
--		return false
		elseif C == true then --���W���Ť�
		ScriptMessage( Player , Player , 1 ,"[SC_FIREDAY_2012_EV1_5]" , 0 )--�L�k�B���C
		SetPlot( TargetID() , "touch" , "Lua_dupei_fire_firemanstone" , 20 );
		return false
--		elseif boom ~= 0 then
--		ScriptMessage( Player , Player , 1 ,"[SC_FIREDAY_2012_EV1_8]" , 0 )
--		return false
		else
		AddBuff( Player , 621779 , 0 , -1 )  
		local TID = TargetID()   --�Ť�
		ks_CreateObj_reset( true, TID )-- �i������Box����m�w�M�� 
		end
end

function lua_dupei_fire_fireman02() --���Ť�u��Ჽ��
	local Player = OwnerID() 
	local Target = TargetID()	-- �I�񪺥ؼ�
	local Name = ReadRoleValue( Target , EM_RoleValue_OrgID )
--	DebugMsg( 0 , 0 , "OrgID = "..Name )		
		if Name == 120154 then
--		DebugMsg( 0 , 0 , "OK" )	
		return true
		else
--		DebugMsg( 0 , 0 , "Error" )
		ScriptMessage( Player , Player , 1 ,"[SC_FIREDAY_2012_EV1_8]" , 0 )--���Y�ؼп��~�C
		--�ؼп��~
		return false
		end
end


--------��i���º���@��---------------------------------------

function Lua_dupei_fire_firemanpoint() --��������BUFF
	local Player = OwnerID()
	local Random = Rand(100)+1 --local Random = DW_Rand(100)

	if CheckBuff( player , 621779) == true then
	CancelBuff( Player , 621779 )
		if Random <= 10 then  --10%�[���
		KORS_buffUpDown( Player , 621780 , 0 , 2 ) -- 0�O�[, 1�O��,�̫᪺�Ʀr�O�h��
		ScriptMessage( Player , Player , 1 ,"[SC_FIREDAY_2012_EV1_24]" , C_SYSTEM )--��o�F2���C
 		elseif Random > 10 and Random<=25 then --15%����
 		KORS_buffUpDown( Player , 621780 , 1 , 1  )
		local X = ReadRoleValue( Player , EM_RoleValue_X )	
		local Y = ReadRoleValue( Player , EM_RoleValue_Y )
		local Z = ReadRoleValue( Player , EM_RoleValue_Z )
		local Dir = ReadRoleValue( Player , EM_RoleValue_Dir )
		local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
		local Box = CreateObj( 120158 , X , Y , Z , Dir , 1 )	
		SetModeEx(Box ,EM_SetModeType_Show , FALSE)
		AddToPartition( Box , Room ) -- �ͦ�����
		CallPlot( Box , "Lua_dupei_fire_furemancbuff" , Player , 4 ) --�s�X�˼Ʈ���
		ScriptMessage( Player , Player , 1 ,"[SC_FIREDAY_2012_EV1_25]" , C_SYSTEM )--�ʤƥ��Ѧ�1���A�Ť�}�l���ͿE�P����A�Y�N�z���I
		elseif Random > 25 then
			KORS_buffUpDown( Player , 621780 , 0 , 1 ) --75%�[1��
			ScriptMessage( Player , Player , 1 ,"[SC_FIREDAY_2012_EV1_23]" , C_SYSTEM  )--��o�F1���C
		end
	end
end


--------�˼Ʈ���---------------------------------------

function Lua_dupei_fire_furemancbuff( Player , Sec )
	for i = 1 , 2 , 1 do
	AddBuff ( Player , 621781 , 0 , 1 )	-- �[�� Player 1��buff(621781) , ���� Sec ��
	Sleep(Sec*10/2)
	end
	SysCastSpellLv( Player , Player , 498966 , 0 ) --�����z�}�k�N���X  SysCastSpellLv( �I�k�� , �Q�I�k�� , �k�N���X , �k�N���� )
	DelObj ( OwnerID() )
end


--------����----------------------------------------------

function Lua_dupei_fire_firemanboom() -- �򥻪k�N���榩���@��  
	local Player = OwnerID()
	local Target = TargetID()
	local Ticket = CheckBuff( Player , 621827 )-- �T�{���a�O�_�����W�ҩ�Buff 621827	
		if Player == Target then
		return false
		else
			if Ticket == true then 
			KORS_buffUpDown( Target , 621780 , 1 , 1  )-- ����
			ScriptMessage( Player , Player , 1 ,"[SC_FIREDAY_2012_EV1_26]" , 0 )--�D����Ť�n�X���E�P����v�T�A��1���I
			end	
		end
end


--------�z���ɪ��ת��a�߲Ť�-------------------------------------
function Lua_dupei_fire_FMBoomCheck()
	local Player = OwnerID()
	local time = 0
	WriteRoleValue( Player , EM_RoleValue_Register9 , 1 )
		while TRUE do
		time = time +1
			if time == 3 then
			WriteRoleValue( Player , EM_RoleValue_Register9 , 0 )
			break
			end
		Sleep(10)
		end	
end

--------NPC��ܼ@��----------------------------------------------


function Lua_dupei_fire_firemantalk()
	local oid = OwnerID()
	SetSpeakDetail( oid , "[SC_FIREDAY_2012_EV1_9]") --�������I�����`�Ť�ɤ����ʥ��b���x�i�椤��A���ˡH�n���n�ѥ[�ڡH
	AddSpeakOption(oid , oid , "[SC_FIREDAY_02]" , "Lua_dupei_fire_firemantalk05" , 0) --�ڷQ���D�Ѩ�
	AddSpeakOption(oid , oid , "[SC_RULE]" , "Lua_dupei_fire_firemantalk04" , 0) --�W�h����
	AddSpeakOption(oid , oid , "[SC_111576_YU_03]" , "Lua_dupei_fire_firemantalk02" , 0) --�ڭn���W
	AddSpeakOption(oid , oid , "[SC_FIREDAY_2012_EV1_17]" , "Lua_dupei_fire_firemantalk03" , 0) --�����y
end


function Lua_dupei_fire_firemantalk02() --NPC���W�@��
	local Time = { 0 , 4 , 8 , 12 , 16 , 20 }
	local TID = TargetID()  -- npc
	local OID=OwnerID() --���a
	local Room = ReadRoleValue( OID , EM_RoleValue_RoomID )
	local Ticket=CheckBuff ( OID , 621827 )  
	local Day=CheckFlag ( OID , 546122 )
		if Day==true then
			if Ticket==false then	
			SetSpeakDetail( OID,"[SC_FIREDAY_2012_EV1_11]") --�A���Ѥw�g�ѥ[�L�F��A�Щ��ѦA�ӧa�I
			else 
			SetSpeakDetail( OID,"[SC_FIREDAY_2012_EV1_12]") --�A�w�g���W�F��A���֥h<CP>[120152]</CP>�����ݬ��ʶ}�l�a�I
			end	
		else	
		Hour = GetSystime(1) --���o�{�b�ɶ��G��
		Min = GetSystime(2) --���o�{�b�ɶ��G��
--		DebugMsg( OID , Room , "Data = "..Hour..":"..Min )
			for i = 1 , table.getn(Time) , 1 do
--				DebugMsg( OID , Room , "Time = "..time[i] )
				if Hour ==Time[i] then
					if Min >= 20 and Min < 30 then
--					SetFlag ( OID , 546121 , 1 )
					SetSpeakDetail( OID,"[SC_FIREDAY_2012_EV1_6]") --���W���\�I���֥h<CR>[120152]</CR>�����ݬ��ʶ}�l�a�I�A�|�O�o�����ʪ��̰����ܡH
					AddBuff ( OID , 621827, 0 , -1 )--�������W�ҩ�
					SetFlag ( OID , 546122 , 1 ) --�����C��X��	
	
					local P = ReadRoleValue(TID, EM_RoleValue_Register )
--					Say(TID, "P = "..P )
					AddRoleValue(TID, EM_RoleValue_Register , 1 )
					local P = ReadRoleValue(TID, EM_RoleValue_Register )
--					Say(TID, "P 2= "..P )
					break
					end	
				else
					SetSpeakDetail( OID,"[SC_FIREDAY_2012_EV1_13]") --�ثe������W�A�Цb���ʮɶ��e10���A���W�C
				end
			end
		end
end


function Lua_dupei_fire_firemantalk03() --�����@��
	local oid = OwnerID()
	local CheckPoint = FN_CountBuffLevel( oid , 621780 ) 
 	local CheckA = CheckFlag( oid , 546122 )   --�C��
 	local CheckB = CheckFlag( oid , 546121 )  --�����C���ҩ�
	local CheckC = CheckBuff ( oid , 621827 ) --���W�ҩ�
	local CheckD = CheckBuff ( oid , 621780 ) --����
	if CheckA==true then 
		if CheckB==true then
			if CheckD== true then
				SetSpeakDetail( oid,"[SC_FIREDAY_2012_EV1_15]")
--				if CheckPoint ==0 then
--				GiveBodyItem( oid , 240995 , 1 )
--				GiveBodyItem( oid , 240996 , 1 )			
--				GiveBodyItem( oid , 720310 , 1 )			
--				CancelBuff ( oid , 621780 )--������o����
--				SetFlag ( oid , 546121 , 0 ) --���������C���ҩ�	
				if CheckPoint >=0 and CheckPoint <=9 then
				GiveBodyItem( oid , 240995 , 1 )
				GiveBodyItem( oid , 240996 , 1 )			
				GiveBodyItem( oid , 208918 , 1 )
				CancelBuff ( oid , 621780 )--������o����
				SetFlag ( oid , 546121 , 0 ) --���������C���ҩ�
				elseif CheckPoint >9 and CheckPoint <=14 then
				GiveBodyItem( oid , 240995 , 1 )
				GiveBodyItem( oid , 240996 , 1 )			
 				GiveBodyItem( oid , 208918 , 1 )		
				GiveBodyItem( oid , 240378 , 1 )		
				CancelBuff ( oid , 621780 )--������o����
				SetFlag ( oid , 546121 , 0 ) --���������C���ҩ�
				elseif CheckPoint >14 and CheckPoint <=19 then
				GiveBodyItem( oid , 240995 , 1 )
				GiveBodyItem( oid , 240996 , 1 )
				GiveBodyItem( oid , 208918 , 2 )
				CancelBuff ( oid , 621780 )--������o����
				SetFlag ( oid , 546121 , 0 ) --���������C���ҩ�
				elseif CheckPoint >19 then
				GiveBodyItem( oid , 240995 , 1 )
				GiveBodyItem( oid , 240996 , 1 )
				GiveBodyItem( oid , 208918 , 2 )
					if CountBodyItem(oid , 530868)==0 then --�ˬd���a���W���S���l�����\�Y��530868
					givebodyitem(oid, 530868, 1)  --�����l�����\�ٸ�
					end
				CancelBuff ( oid , 621780 )--������o����
				SetFlag ( OID , 546121 , 0 ) --���������C���ҩ�
				end
			elseif CheckD== false then
			SetSpeakDetail(oid , "[SC_FIREDAY_2012_EV1_14]" )
			GiveBodyItem( oid , 240995 , 1 )
			GiveBodyItem( oid , 240996 , 1 )			
			GiveBodyItem( oid , 720310 , 1 )			
			SetFlag ( oid , 546121 , 0 ) --���������C���ҩ�
			end
		else 
			if  CheckC == true then
			SetSpeakDetail(oid , "[SC_FIREDAY_2012_EV1_12]" )
			elseif CheckPoint > 0 then
			GiveBodyItem( oid , 720310 , 1 ) --�A���P�ŷϤ�
			CancelBuff ( oid , 621780 )			
			SetSpeakDetail(oid , "[SC_FIREDAY_2012_EV1_14]" )
			else 
			SetSpeakDetail(oid , "[SC_FIREDAY_2012_EV1_16]" )
			end
		end		
	else
	SetSpeakDetail(oid , "[SC_FIREDAY_2012_EV1_18]" )
	AddSpeakOption(oid , oid , "[SC_111576_YU_03]" , "Lua_dupei_fire_firemantalk02" , 0) --�ڭn���W
	AddSpeakOption(oid , oid , "[SO_BACK]" , "Lua_dupei_fire_firemantalk" , 0)
	end
end


function Lua_dupei_fire_firemantalk04() --�W�h�����@��
	local oid = OwnerID()
	SetSpeakDetail( oid,"[SC_FIREDAY_2012_EV1_10]")
	AddSpeakOption(oid , oid , "[SO_BACK]" , "Lua_dupei_fire_firemantalk" , 0)
end


function Lua_dupei_fire_firemantalk05() --�����`�ѨӼ@��
	local oid = OwnerID()
	SetSpeakDetail( oid, "[SC_FIREDAY_01]")
	AddSpeakOption(oid , oid , "[SO_BACK]" , "Lua_dupei_fire_firemantalk" , 0)
end


--���ʫŶ�NPC�@��--

function Lua_dupei_fire_firemantalk06() --�����`�Ŷ�Npc���
	local oid = OwnerID()
	SetSpeakDetail( oid,"[SC_FIREDAY_2012_EV1_19]")
	AddSpeakOption(oid , oid , "[SC_FIREDAY_02]" , "Lua_dupei_fire_firemantalk08" , 0) --�ڷQ���D�Ѩ�
	AddSpeakOption(oid , oid , "[SC_FIREDAY_2012_EV1_20]" , "Lua_dupei_fire_firemantalk07" , 0) --�жǰe�ڨ쬡�ʷ|��
end


function Lua_dupei_fire_firemantalk07() --Npc�ǰe�@��
	local oid = OwnerID()
	local CheckE = CheckFlag( oid , 546140 )
		if CheckE ==false then
		ChangeZone(oid , 2, -1, 1586.1, -23.7, 9530.2, 237.4)
		SetFlag ( oid , 546140 , 1 ) --���}�ǰe�ҩ�
		else 
		SetSpeakDetail( oid,"[SC_FIREDAY_2012_EV1_21]")
		end	
end

function Lua_dupei_fire_firemantalk08() --�����`�ѨӼ@��
	local oid = OwnerID()
	SetSpeakDetail( oid, "[SC_FIREDAY_01]")
	AddSpeakOption(oid , oid , "[SO_BACK]" , "Lua_dupei_fire_firemantalk06" , 0)
end
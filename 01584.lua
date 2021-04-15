function event_module(Type) 
--Type���� 
--EM_Event_Module_Type_LevelUp 		= 0	( 0 �����a�ɯ� �^
--EM_Event_Module_Type_PlayerDead 		= 1	( 1 �����a���` �^
--EM_Event_Module_Type_ChangeZone	= 2	( 2 ������ �^
--EM_Event_Module_Type_Login		= 3	( 3 ��login in �^
--EM_Event_Module_Type_NPCDead		= 4	( 4 ��NPC���` �^
--EM_Event_Module_Type_RoleLogin		= 5	( 5 ������n�J �^

	local Language = GetServerDataLanguage() 		           --����ثeserver���y�t
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV ) --Ū�����a���D¾����
	local Race = ReadRoleValue( TargetID()  , EM_RoleValue_RACE )
	local TargetLanguage = {	none="",			--�P�_�ӻy�t�O�_�����w��B�ӡA�̤��P�ݨD�A�]���P���Ƶ{��
						eneu="Germany_1year_FrogPet_give",		-- �ڨt�^�� -- �w�ꤻ�y�t
						enus ="Germany_1year_FrogPet_give",		-- ���w�^�� -- �w�ꤻ�y�t
						fr="Germany_1year_FrogPet_give",		-- �k�� -- �w�ꤻ�y�t
						pl="Germany_1year_FrogPet_give",		-- �i�� -- �w�ꤻ�y�t
						de ="Germany_1year_FrogPet_give",		-- �w�� -- �w�ꤻ�y�t
						es ="Germany_1year_FrogPet_give",		-- ��Z�� -- �w�ꤻ�y�t
						ru ="Germany_1year_FrogPet_give",		-- �Xù��
						kr="Levelup_event","Lua_KR_HelpNewbie_lv30",	-- ����
						tw="Lua_Hao_TW_Phirius_Login",		-- �x�W	-- 2012.09.27 �����ťN���I���ӤH
						tr="Lua_turkeyLvup_event",			-- �g�ը�
						th="Lua_turkeyLvup_event",			-- ����
						ae="Lua_turkeyLvup_event",			-- ���F
						jp ="Lua_JP_1year_anniversary" ,			-- �饻
						ph ="Lua_PH_NewBie_event" ,			-- ��߻�	
						rw="Germany_1year_FrogPet_give"}		-- Dev1 ����	-- 2012.09.27 �����ťN���I���ӤH
	if TargetLanguage[Language] == nil then		          --��server�y�t�����OTargetLanguage�̤��ҫ��w���y�t�ɡA�N�|���w�� none��
		Language = "none"
	end

	
	--Type = 0 , ���a�ɯ�
	if Type == 0 then
		Apon_Suitskill_size_1_levelup();	--�M�˧ޯश���}��ݨD�@��
		Lua_ThridJob_Check(); 	--�ĤT¾�~����
		lua_skill_keyitem_organize();	--2013.08.05 �ư��Ͳ��ޯ��歫�n���~�M�ɶ����Ȩæs�����p
	end
	
	--Type = 1 , ���a���`
	if Type == 1 then
		CallPlot(OwnerID(),"event_module_dead",Type) 	--���a���`�Ƶ{��
	end
	
	--Type = 2 , ���⴫��
	if Type == 2 then
		local Player = OwnerID()
		
		--�ˬd�I�����ֹB�檬�p
		if ReadRoleValue(Player,EM_LuaValueFlag_IsStopBGM)==1 then
			ClientEvent_Range(Player,0,"playmusic");
			WriteRoleValue(Player,EM_LuaValueFlag_IsStopBGM,0);
		end
		
		--�i�Jzone 154, 155, 156�������� by ���B
		local _player = AddyPlayer:new(OwnerID())
		if _player.zone_id == 154 or _player.zone_id == 155 or _player.zone_id == 156 then
			_player:beginPlot("BellatiaDuplication_player_register")
		end
		
		-- 2013.08.01 ���E:���ϮɡA�R���������Key(�����L�q�|�}���_�c���)
		if _player.zone_id ~= 352 and CheckFlag( Player , 542743 ) == true then
			SetFlag( Player , 542743 , 0 )	-- ����_�c���
			SetFlag( Player , 542875 , 0 )	-- ACT3 �����_�cKey		
			SetFlag( Player , 542876 , 0 )	-- ACT3 �����_�cKey
			SetFlag( Player , 542877 , 0 )	-- ACT3 �g���_�cKey
			SetFlag( Player , 542878 , 0 )	-- ACT3 �����_�cKey				
		end
		
		lua_skill_keyitem_organize();	--2013.08.05 �ư��Ͳ��ޯ��歫�n���~�M�ɶ����Ȩæs�����p
	end
	
	--Type = 3 , login in
	if Type == 3 then
		Apon_Suitskill_size_1_login();
		Hsiang_GuildPetProc_PlayerLogin();	--�s���d�� ����n�J�B�z�@��
		Vip_Member_Check();
	end
	
	--Type = 4 , NPC���`
	if Type == 4 then
		CallPlot( OwnerID() , "event_module_NPC_dead" , Type ) --�d���t�ΡA�Ǫ�NPC���`���v�X�{���_��
	end
	
	--Type = 5 , ����n�J
	if Type == 5 then
		DW_SetOccupationFlag();	--�ھڥD¾�������w¾�~���X��
		lua_WrongQuestReset();
		Z32_Q427124MSG_00();	--���ScriptMessage�A�������a�e����������427124�C
		Lua_ThridJob_Check();	--�ĤT¾�~����
		LV60_ES_SendLetter();	--Lv60�׭^�ޯ���ȡA�t�εo�H
		Z23_425217_flagive();	--���F�@�Ϭݤ����N�઺�H��
		--YoYo_Phantom_Remind();	--���F�t�Τ޾ɴ��ܡA6.5.2�}��
		lua_skill_keyitem_organize();	--2013.08.05 �ư��Ͳ��ޯ��歫�n���~�M�ɶ����Ȩæs�����p
	end

	CallPlot( OwnerID() , TargetLanguage[Language] , PlayerLV , Type , Race ) --���ӥi�l�[���`�Ƶ{���B���ϧP�_�]�Ǩ�ӭȹL�h�Ƶ{���^
end

function event_module_dead(Type)	--���a���`�Ƶ{��
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) 
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 )
--	if Zone == 402 or Zone == 31 then	--���|���Ԧ��`�@��
	if Zone == 402 then			--���|���Ԧ��`�@�� 2012.03.16 ���� Zone 31 �vű�G�H�s���
		EndCastBar( OwnerID() , 0 )	--�������a�I�k��
		WriteRoleValue( OwnerID() , EM_RoleValue_PID, 0 ) --�Ѱ���w�i�A����oYUYU�ݨD
		local	RegisterO = ReadRoleValue( OwnerID(), EM_RoleValue_Register1 );
		DebugMsg( 0, RoomID ,"RegisterO = "..RegisterO.." NO 0.")
		if RegisterO ~= 0 then
			WriteRoleValue( RegisterO , EM_RoleValue_Register1, 0 ) --�Ѱ���w�a�A����
			WriteRoleValue( OwnerID() , EM_RoleValue_Register1, 0 )
		end
		local Angel = 0
		local Count = BuffCount ( OwnerID())
		for i = 0 , Count do
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID ) -- �򥻪k�NID
			if BuffID == 501387 then--�j�Ѩ�....
				CancelBuff_NoEvent(OwnerID(),505918)
				CancelBuff_NoEvent(OwnerID(),505919)
				CancelBuff_NoEvent(OwnerID(),505518)
				CancelBuff_NoEvent(OwnerID(),505920)
				CancelBuff_NoEvent(OwnerID(),506136)
				Angel = 1
				break
			end
		end
		if Angel == 0 then
			local AdB = 0
			for i = 0 , Count do
				local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID ) -- �򥻪k�NID
				if BuffID == 505918 then--���˪��A....
					CancelBuff_NoEvent(OwnerID(),505918)
					AddBuff(OwnerID(),505919,0,600)
					AdB = AdB + 1
					break
				elseif BuffID == 505919 then--���˪��A....
					CancelBuff_NoEvent(OwnerID(),505919)
					AddBuff(OwnerID(),505518,0,180)
					AdB = AdB + 1
					break
				elseif BuffID == 505518 then--�j�����....
					CancelBuff_NoEvent(OwnerID(),506136)
					CancelBuff_NoEvent(OwnerID(),505518)
					AddBuff(OwnerID(),505920,0,600)
					AdB = AdB + 1
					break
				elseif BuffID == 505920 then--�a�a�@��....
					AdB = AdB + 1
					break
				end
			end
			if AdB == 0 then
				AddBuff(OwnerID(),505918,0,600)
			end
		end
	end
	if Zone == 446 then	--������Գ��Ԧ��`�@��
		EndCastBar( OwnerID() , 0 )	--�������a�I�k��
		WriteRoleValue( OwnerID() , EM_RoleValue_PID, 0 ) --�Ѱ���w�i�A����oYUYU�ݨD
		local	RegisterO = ReadRoleValue( OwnerID(), EM_RoleValue_Register1 );
		DebugMsg( 0, RoomID ,"RegisterO = "..RegisterO.." NO 0.")
		if RegisterO ~= 0 then
			WriteRoleValue( RegisterO , EM_RoleValue_Register1, 0 ) --�Ѱ���w�a�A����
			WriteRoleValue( OwnerID() , EM_RoleValue_Register1, 0 )
		end
	end
--****"���d���t�ΡA�D�H���`�A���b�l�ꤤ���d�����۫פU���A�����פU��"****--

	if Zone < 400 then	-- 2010/10/07 �ץ��۳��d����A�b����A���Գ��A�D�H���`�ɡA�d�������۫פι����׷|���������D�C
		local Mode = -1
		local ModePet = -1
	
		local Loyal = 3		--���۫�
		local Hunger = 30	--������
	
		for i = 0,5 do
			Mode = ReadPetValue( OwnerID(), i ,EM_CultivatePetStructValueType_EventType ) --�d�����A(���Q�l��(2)�B���b�Ȧ�(4)�B���b�Ͳ�(8)...etc)
			if Mode == 2 then
				ModePet = i	--�g�Ji�����b�l��X�Ӫ��d�����Ǹ�
			end
		end
		if (ModePet ~= -1) then
			local NowHunger = ReadPetValue( OwnerID(), ModePet ,EM_CultivatePetStructValueType_Hunger )--�ثe������
			local NowLoyal = ReadPetValue( OwnerID(), ModePet ,EM_CultivatePetStructValueType_Loyal )--�ثe���۫�
	
			if (NowHunger-Hunger) < 0 then
				WritePetValue( OwnerID() , ModePet , EM_CultivatePetStructValueType_Hunger , 0 )  
			else
				AddPetValue( OwnerID() , ModePet , EM_CultivatePetStructValueType_Hunger , -Hunger )  --���`��ֹ�����
			end
	
			if (NowLoyal-Loyal) < 0 then
				WritePetValue( OwnerID() , ModePet , EM_CultivatePetStructValueType_Loyal , 0 )  
			else
				AddPetValue( OwnerID() , ModePet , EM_CultivatePetStructValueType_Loyal , -Loyal )  --���`��֩��۫�
			end
	
			local Str = "[SC_PETSYS_01][$SETVAR1="..Loyal.."][$SETVAR2="..Hunger.."]"
			ScriptMessage( OwnerID(), OwnerID(), 0 , Str , "0xff00ff00" )
		end
	end
--****"���d���t�� ****--
end

--�d���t�ΡA�Ǫ�NPC���`���v�X�{���_��

function event_module_NPC_dead(Type)	--NPC���`�Ƶ{�� 701584
	local O_ID = OwnerID() 		--NPC
	local T_ID = TargetID()  	--NPC

	local RoomID = ReadRoleValue(O_ID,EM_RoleValue_RoomID) 
	local Zone = ReadRoleValue(O_ID,EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local Npc_SEX = ReadRoleValue( O_ID , EM_RoleValue_SEX  )   --NPC���ʧO,0�k�B1�k�B2��^�B3���ŵ׭^�B4�@�ɤ��ŵ׭^
	local Npc_Camp = ReadRoleValue( O_ID , EM_RoleValue_CampID  )   --NPC���}��,�ݯS�O�P�_�A�ư��ޯ૬�d��(EX�G�˪L���̪�)    3��Monster
	local IsPet = ReadRoleValue(O_ID,EM_RoleValue_Register+6) --�Y�Ȭ�1010�A�h��NPC���d�����i�X���_��
	local NoMouse = CheckFlag(O_ID,544801) --�Y��true�A�h��NPC���@���Τ��i�X���_����NPC
	-- 2013.03.11 ���E�G��s Zone ���� 1 ~ 34 --
	local PlayerID = ReadRoleValue( O_ID , EM_RoleValue_AttackTargetID )	--���a
--	if ReadRoleValue( PlayerID , EM_RoleValue_IsPlayer ) == 1 then
--		if (ZoneID <= 34) and (Npc_SEX < 3) and (IsPet ~= 1010) and (Npc_Camp==3) and (NoMouse == false) then
--			DebugMsg( PlayerID , RoomID ,"O" )
--		else
--			DebugMsg( PlayerID , RoomID ,"X" )
--		end
--	end
	
	if (ZoneID <= 34) and (Npc_SEX < 3) and (IsPet ~= 1010) and (Npc_Camp==3) and (NoMouse == false) then--���a�B��j�ϰ�B�B�өǪ������ź�^�H�U
		local OrgID = ReadRoleValue(O_ID, EM_RoleValue_OrgID  ) 			--�өǦb��Ʈw���Τ@ID
	--	local PlayerID = ReadRoleValue( O_ID , EM_RoleValue_AttackTargetID )	--���a
		local PlayerLV = ReadRoleValue(PlayerID , EM_RoleValue_LV  ) 		--���aLV
		local MonsterLV = ReadRoleValue(O_ID , EM_RoleValue_LV  )			--�Ǫ�LV
		local GMtest =  CountBodyItem( PlayerID , 204512 ) 				--���_���_KEY
		local GMtestSP =  CountBodyItem( PlayerID , 203477 ) 				--�S��@��Ĳ�o�_��
		local Rate = 150								--�X�{���_�������v
--		DebugMsg( 0, RoomID ,"AttackTarget="..AttackTarget)				
--		DebugMsg( 0, RoomID ,"AttackTargetPlayerLV="..PlayerLV)				
--		DebugMsg( 0, RoomID ,"MonsterLV="..MonsterLV)	

		if MonsterLV > PlayerLV then							--�Y�Ǫ����Ťj�󪱮a���šA�h�X�{���_�����v�W�[
			local PlayerX = PlayerLV+5
			local PlayerXX = PlayerLV+10
			if (MonsterLV - PlayerXX) >0 then
				Rate = Rate-50
			elseif (MonsterLV - PlayerX) >0 then
				Rate = Rate-25
			end
		else										--�Y�Ǫ����Ťp�󪱮a����10�šA�h���|�X�{���_��
			local MonsterX = MonsterLV+5
			local MonsterXX = MonsterLV+10
			if (PlayerLV - MonsterXX) >0 then
				Rate = 1000
			end
		end			

		if GMtest >0 then
			Rate = 5
		end

		local PaChiMouse = Rand(Rate)							--���_���X�{�����v

		if (PaChiMouse > 0 and PaChiMouse < 5) or GMtest > 0 or GMtestSP > 0 then	-- 2013.03.14 �վ� gm ����Ĳ�o�@��Key�ɡA�X�{���_�������v
			if Rate == 5 then							--�p�G�O�]�����FGM�_�͡A�~�ʵo�ʤ��A�h�q�T���C
				ScriptMessage(PlayerID, PlayerID , 1 , "You are GM,You Have The Key - ".."[204512]".."!" , 0) 
				ScriptMessage(PlayerID, PlayerID , 0 , "You are GM,You Have The Key - ".."[204512]".."!" , 0) 	
			end

			local Mouse = 103566
			local Chance = Rand(100)

			if Chance > 10 and Chance < 15 then					--5%���v�X�{ �������_��
				Mouse = 103567
			end

			if GMtestSP >0 then							--�p�G�O�]�����FGM�_�͡A�~�X�{�������_���A�h�q�T���C
				Mouse = 103567
				ScriptMessage(PlayerID, PlayerID , 1 , "You are GM,You Have The Key - ".."[203477]".."!" , 0) 
				ScriptMessage(PlayerID, PlayerID , 0 , "You are GM,You Have The Key - ".."[203477]".."!" , 0) 
			end

			local Str = "[SC_PETSYS_28][$SETVAR1=".."["..OrgID.."]".."]"
			--�o�{�F�@���H�ͦbOrgID���W�����_���I[103567]
			ScriptMessage(PlayerID, 0 , 1 , Str , "0xff00ff00") 
			ScriptMessage(PlayerID, 0 , 0 , Str, "0xff00ff00") 

			ScriptMessage(PlayerID, 0 , 2 , "[SC_PETSYS_32]" , "0xff00ff00") 	--����]�m[103565]�a�I
			ScriptMessage(PlayerID, 0 , 0 , "[SC_PETSYS_32]", "0xff00ff00") 

			local OwnerX = ReadRoleValue( O_ID , EM_RoleValue_X ) 
			local OwnerY = ReadRoleValue( O_ID , EM_RoleValue_Y ) 
			local OwnerZ = ReadRoleValue( O_ID , EM_RoleValue_Z ) 
			local OwnerDIR = ReadRoleValue( O_ID , EM_RoleValue_Dir ) 

			local StageNpc = CreateObj( Mouse , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1) --���_��
			AddToPartition( StageNpc , RoomID )  

			AddBuff( StageNpc ,503589 ,1 ,-1 )--�G����
			AddBuff( StageNpc ,502363 ,1 ,-1 )--�G����


			SetModeEx( StageNpc , EM_SetModeType_Fight , false )--�i�������
			SetModeEx( StageNpc , EM_SetModeType_Strikback, false )--����
			SetModeEx( StageNpc , EM_SetModeType_Searchenemy, false )--����
			SetModeEx( StageNpc , EM_SetModeType_NotShowHPMP, true )--����ܦ��
			Beginplot( StageNpc ,"event_module_NPC_dead_00", 0 )

		end
	end
end
function event_module_NPC_dead_00()	--5������A���_������
	sleep(3000)
	ScriptMessage(OwnerID(), 0 , 2 , "[SC_PETSYS_67]", 0) 	--���}�J�D�L�[�A[103566]��z�����ΰ_�ӤF�C
	ScriptMessage(OwnerID(), 0 , 0 , "[SC_PETSYS_67]", 0) 
	sleep(10)
	Delobj(OwnerID())
end
-------- �w�� ENEU --------
function Germany_1year_FrogPet_give(PlayerLV, Type, Race)
	local Language = GetServerDataLanguage() 		           --����ثeserver���y�t
	local month = GetSystime(3)+1
	local day = GetSystime(4)
	local hour = GetSystime(1)
	local min = GetSystime(2)
	local Owner = OwnerID()
	local Target = TargetID()
	local bag = 205036
	local Items = { }
	local DateM = 3   --<< UPDATE��o�� ���
	local DateD = 19  --<<UPDATE��o�� ������
	local Gift = {	
		{ DateD , bag , 1 , 549365, DateM } ,     --���/���~�s��/�ƶq/���n���~/��� �A����
		{ DateD+1 , bag , 1 , 549366, DateM } ,
		{ DateD+2 , bag , 1 , 549367, DateM } ,
		{ DateD+3 , bag , 1 , 549368, DateM } ,
		{ DateD+4 , bag , 1 , 549369, DateM } ,
		{ DateD+5 , bag , 1 , 549370, DateM } ,
		{ DateD+6 , bag , 1 , 549371, DateM }   }--<<�p�G�����A�̫�@�ѥΤU�@��A�Y���϶��A�P����A�i�ϥΦ���C (�`�`)
	--	{ 1 , bag , 1 , 549105, 4 } 	}  -- �����M��

	local SpecialDayKey = 549364 --���w����B�~�ث~��KEYITEM

	if type == EM_Event_Module_Type_Login then
--		if Language == "ru" or Language == "rw" then  -- ���ե�
		Items = { { 19 , 242187 , 1, 3 } }  -- << UPDATE��o�� 2015/3/19���n�J�i�B�~��o ( ���/���~�s��/�ƶq/���n���~/��� )
		DebugMsg(Owner , Owner , month.."/"..day.." "..hour..":"..min)
	--	���ʤG�@�n�J�e��J
		for i = 1,table.getn(Items) do
			if Items[i][4] == month then  -- (RU��)���
				if Items[i][1] == day then
					if ( hour >=00 and min >=0 ) then
						if CheckFlag( Owner , SpecialDayKey ) ~= true then	-- 2015.03.19 ��ѵn�J�������~							
							Givebodyitem( Owner , Items[i][2] , Items[i][3] )	-- �������_�_�d��§��
							SetFlag( Owner , SpecialDayKey , 1 )			-- 2015������~���X��								
						end
					end
				end
			end
		end
--	end --�ܧ�y�t���եΪ�end
	--	���ʤT	�n�J�e3�g�~�y���P§��J
--		if Language == "ru" or Language == "rw" then  -- ���ե�
	 	for i = 1, #Gift do
			if Gift[i][5] == month then  -- ���
	 			if Gift[i][1] == day then  -- ���
	 				if PlayerLV >= 20 then
						if Gift[i][1] == day and hour == 0 and min == 0 then	-- 00:00���٤��|���A�n����01��
							return false
						else
							BeginPlot( Owner , "Lua_Hao_eneu_2year_login" , 0 )		-- �w�� �n�J�ƥ�1
							if CheckFlag( Owner , Gift[i][4] ) ~= true then
								Givebodyitem( Owner , Gift[i][2] , Gift[i][3] )
								SetFlag( Owner , Gift[i][4] , 1 )
							end
						end
	 				end
	 			end
	 		end
	 	end
--	end --�ܧ�y�t���եΪ�end
	elseif type == 0 then				--�ɯŮɧP�_�A���a�ɨ�LV20�ɡA�K�i��o§�]
		local TargetLV = 20						--���w���@�ӵ��Ťɯū�A�|���椰��˪��@��
		local CurrentLV =PlayerLV
--		DebugMsg(OwnerID(),OwnerID(),month.."/"..day )
--		Say( OwnerID() , CurrentLV )
--		if Language == "ru" or Language == "rw" then  -- ���ե�
		for i = 1, #Gift do
			if Gift[i][5] == month then
				if Gift[i][1] == day then
					if CheckFlag( Owner , Gift[i][4] ) == true then
						break
					else
						if Type == EM_Event_Module_Type_LevelUp and  PlayerLV >= TargetLV then --�ɯū�A�p���a�ŦX���w���ūh����U�C�@��
							ScriptMessage( Target , Owner, 1 , "[EVENT_MODULE_0][$SETVAR1="..CurrentLV.."][$SETVAR2=".."["..bag.."]".."]", "0xFFFFF266" )
							ScriptMessage( Target , Owner, 0 , "[EVENT_MODULE_0][$SETVAR1="..CurrentLV.."][$SETVAR2=".."["..bag.."]".."]", "0xFFFFF266" )
							GiveBodyItem( Owner, bag , 1 )	
							setflag( Owner , Gift[i][4] , 1 )
						end
					end
				end
			end
		end
--	end --�ܧ�y�t���եΪ�end
	end
end
-------- ���� KR -------- 
function  Levelup_event(PlayerLV, Type, Race) --For Korea OB

--	if type == EM_Event_Module_Type_Login then
--		local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
--		local Race = ReadRoleValue(OwnerID(),EM_RoleValue_RACE)
--		DebugMsg( 0, RoomID ,"Race = "..Race)
--		if Race == 1 then
--			local TargetLV = {1} 				           --���w���@�ӵ��Ťɯū�A�|���椰��˪��@��
--			local CurrentLV = PlayerLV
--
--			local Bag = {	206630	} 
--
--			local Flag = {	543600	}
--			for i = 1 , table.getn(TargetLV) do
--				if  CheckFlag( OwnerID(), Flag[i]) == true or  PlayerLV ~= TargetLV[i] then
--					break
--				elseif Type == EM_Event_Module_Type_Login and  PlayerLV == TargetLV[i] then --�n�J��A�p���a�ŦX����h����U�C�@��
--					ScriptMessage( TargetID(), OwnerID(), 1 , "[EVENT_MODULE_KR_0][$SETVAR1=".."["..Bag[i].."]".."]", "0xFFFFF266" )
--					ScriptMessage( TargetID(), OwnerID(), 0 , "[EVENT_MODULE_KR_0][$SETVAR1=".."["..Bag[i].."]".."]", "0xFFFFF266" )
--					GiveBodyItem( OwnerID() , Bag[i] , 1)	
--					SetFlag(OwnerID(), Flag[i], 1)
--				end
--			end
--		end
--	end

--	if type == EM_Event_Module_Type_Login then
--		local Buffs = {	{ 10 , 505885 } ,
--				{ 11 , 505885 } ,
--				{ 12 , 505885 } ,
--				{ 17 , 505885 } ,
--				{ 18 , 505885 } ,
--				{ 19 , 505885 }	}
--		
--		local month = GetSystime(3)+1
--		local day = GetSystime(4)
--		local hour = GetSystime(1)
--		local min = GetSystime(2)
		
--		DebugMsg(OwnerID(),OwnerID(),month.."/"..day.." "..hour..":"..min)
		
--		if month == 3 then
--			for i = 1,table.getn(Buffs) do
--				if Buffs[i][1] == day then
--					if ( hour >=23 and hour <24 and min >=0 ) then
--							AddBuff( OwnerID() , Buffs[i][2] , 0 , -1 )
--					end
--				end
--			end
--		end
--	end

--	if type == 3 then -- ���� token Bonus 2010 / 05 / 03
--
--		AddBuff( OwnerID() , 506604 , 0 , 3600 )
--
--	end

	if type == 0 then	--����`�n�@��............�ŧR
		local TargetLV = {10, 15, 20, 25, 40} 				           --���w���@�ӵ��Ťɯū�A�|���椰��˪��@��
		local CurrentLV =PlayerLV

		local Bag = {	206226, --Lv10
			      	206231,  --Lv 15
			           	206244, --Lv20
			           	206245, --Lv25
				208933	--Lv40
				}

		local Flag = {	543458,
				543459,
				543460,
				543461,
				544713}

		for i = 1 , 5 , 1 do

			--local PFlag = CheckFlag(OwnerID()  , Flag[i]) 
			if  CheckFlag( OwnerID(), Flag[i]) == true and  PlayerLV == TargetLV[i] then
				break
			else
				if Type == EM_Event_Module_Type_LevelUp and  PlayerLV == TargetLV[i] then --�ɯū�A�p���a�ŦX���w���ūh����U�C�@��
					ScriptMessage( TargetID(), OwnerID(), 1 , "[EVENT_MODULE_0][$SETVAR1="..CurrentLV.."][$SETVAR2=".."["..Bag[i].."]".."]", "0xFFFFF266" ) --
					ScriptMessage( TargetID(), OwnerID(), 0 , "[EVENT_MODULE_0][$SETVAR1="..CurrentLV.."][$SETVAR2=".."["..Bag[i].."]".."]", "0xFFFFF266" ) --
					GiveBodyItem( OwnerID() , Bag[i] , 1)	
					setflag(OwnerID(), Flag[i], 1)
				end
			end
		end
	end
end

function Lua_KR_HelpNewbie_lv30(PlayerLV, Type)
	if Type == EM_Event_Module_Type_LevelUp and  PlayerLV == 30 then
		GiveBodyItem(OwnerID(),207754,1)
	end
end

--------  �x�W TW -------- 
--��l�ɯ�§�]���� 2010.4
function Lua_TW_2010lvup_package(PlayerLV, Type) 
	local TargetLV = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 20, 25, 30, 35, 40, 45, 50 } 				           --���w���@�ӵ��Ťɯū�A�|���椰��˪��@��
	local CurrentLV =PlayerLV
	--local Player_Race = Race
	local Bag = {       207231, --lv1
			207232, --lv2
			207233, --lv3
			207234, --lv4
			207235, --lv5 
			207236, --lv6
			207237, --lv7
			207238, --lv8
			207239, --lv9
			207240, --lv10
			207241, --lv11
			207242, --lv12
			207243, --lv13
			207244, --lv14
			207245,  --lv15
			207246, --lv20
			207247, --lv25
			207248, --lv30 
			207249, --lv35
			207250, --lv40
			207251, --lv45
			207252 }  --lv50

	local Flag = {     543811,  --lv1
			543812, --lv2
			543813, --lv3
			543814, --lv4
			543815, --lv5
			543816, --lv6
			543817, --lv7
			543818, --lv8
			543819, --lv9
			543820, --lv10
			543821, --lv11
			543822, --lv12
			543823, --lv13
			543824, --lv14
			543825, --lv15
			543826, --lv20
			543827, --lv25
			543828, --lv30
			543829, --lv35
			543830, --lv40
			543831, --lv45
			543832 } --lv50

	local Number = { 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 }

	--if Player_Race == 1 then			
		for i = 1 , 22 , 1 do -- 22��
			--local PFlag = CheckFlag(OwnerID()  , Flag[i]) 
			if  CheckFlag( OwnerID(), Flag[i]) == true and  PlayerLV == TargetLV[i] then
				break
			else
				if ( Type == EM_Event_Module_Type_LevelUp or Type == EM_Event_Module_Type_Login) and  PlayerLV == TargetLV[i] then --�ɯū�A�p���a�ŦX���w���ūh����U�C�@��
					ScriptMessage( TargetID(), OwnerID(), 1 , "[EVENT_MODULE_0][$SETVAR1="..CurrentLV.."][$SETVAR2=".."["..Bag[i].."]".."]", "0xFFFFF266" ) --
					ScriptMessage( TargetID(), OwnerID(), 0 , "[EVENT_MODULE_0][$SETVAR1="..CurrentLV.."][$SETVAR2=".."["..Bag[i].."]".."]", "0xFFFFF266" ) --
					GiveBodyItem( OwnerID() , Bag[i] , Number[i])	
					setflag(OwnerID(), Flag[i], 1)
				
				end
			end
		end
	--end
end

function Lua_Dan_TW_ElfRace_packages(PlayerLV, Type) --For ��l ���F�s��]

	local TargetLV = {1, 3, 5, 10, 15} 				           --���w���@�ӵ��Ťɯū�A�|���椰��˪��@��
	local CurrentLV =PlayerLV
	--local Player_Race = Race
	local Bag = {	201139, --Lv10
		           	201134,  --Lv 15
		           	201610, --Lv20
		           	203324,
		           	203040	} --Lv25

	local Flag = {       543407,
			543408,
			543409,
			543410,
			543562	}

	local Number = {1,3,3,1,5}

	--if Player_Race == 1 then			

		for i = 1 , 5 , 1 do

			--local PFlag = CheckFlag(OwnerID()  , Flag[i]) 

			if  CheckFlag( OwnerID(), Flag[i]) == true and  PlayerLV == TargetLV[i] then
				break
			else
				if ( Type == EM_Event_Module_Type_LevelUp or Type == EM_Event_Module_Type_Login) and  PlayerLV == TargetLV[i] then --�ɯū�A�p���a�ŦX���w���ūh����U�C�@��
					ScriptMessage( TargetID(), OwnerID(), 1 , "[EVENT_MODULE_0][$SETVAR1="..CurrentLV.."][$SETVAR2=".."["..Bag[i].."]".."]", "0xFFFFF266" ) --
					ScriptMessage( TargetID(), OwnerID(), 0 , "[EVENT_MODULE_0][$SETVAR1="..CurrentLV.."][$SETVAR2=".."["..Bag[i].."]".."]", "0xFFFFF266" ) --
					GiveBodyItem( OwnerID() , Bag[i] , Number[i])	
					setflag(OwnerID(), Flag[i], 1)
				end
			end
		end
	--end
end
-- 2010 ��s�K
function Lua_TW_newyear_package(PlayerLV, Type) 

	local TargetLV = {1, 3, 5, 7, 9, 10, 12, 14, 15} 				           --���w���@�ӵ��Ťɯū�A�|���椰��˪��@��
	local CurrentLV =PlayerLV
	--local Player_Race = Race
	local Bag = {   202458, --Lv1
		          201139, --Lv3
		          202903, --Lv5
		          201609, --Lv7
		          201617, --Lv9
	        	          202322, --Lv10
		          206741, --Lv12  --
		          201097, --Lv14
		          201095 } --Lv15

	local Flag = {       543624,
                                           543625,
                                           543626,
                                           543627,
                                           543628,
                                           543629,
                                           543630,
                                           543631,
			 543632 }

	local Number = {1, 2, 30, 2, 2, 2, 1, 20 ,10}

	--if Player_Race == 1 then			

		for i = 1 , 9 , 1 do -- 9��

			--local PFlag = CheckFlag(OwnerID()  , Flag[i]) 

			if  CheckFlag( OwnerID(), Flag[i]) == true and  PlayerLV == TargetLV[i] then

				break

			else
				if ( Type == EM_Event_Module_Type_LevelUp or Type == EM_Event_Module_Type_Login) and  PlayerLV == TargetLV[i] then --�ɯū�A�p���a�ŦX���w���ūh����U�C�@��

					ScriptMessage( TargetID(), OwnerID(), 1 , "[EVENT_MODULE_0][$SETVAR1="..CurrentLV.."][$SETVAR2=".."["..Bag[i].."]".."]", "0xFFFFF266" ) --
					ScriptMessage( TargetID(), OwnerID(), 0 , "[EVENT_MODULE_0][$SETVAR1="..CurrentLV.."][$SETVAR2=".."["..Bag[i].."]".."]", "0xFFFFF266" ) --
					GiveBodyItem( OwnerID() , Bag[i] , Number[i])	
					setflag(OwnerID(), Flag[i], 1)
				
				end
			end
		end
	--end
end
-------- �g�ը� TR -------- 
function Lua_turkeyLvup_event(PlayerLV, Type) --For �g�ը�B����

	local TargetLV = {1, 3, 5, 10, 15, 18 ,20} 				           --���w���@�ӵ��Ťɯū�A�|���椰��˪��@��
	local CurrentLV = PlayerLV
	--local Player_Race = Race
	local Bag = {   201139,
		           201134,
		           201610,
		           202450,
		           203040,
		           201095,
		           201097} 

	local Flag = {       543590,
   			543591,
   			543592,
   			543593,
   			543594,
   			543595,
   			543596 }

	local Number = {1, 3, 3, 1, 5, 5, 5}

	--if Player_Race == 1 then			

		for i = 1 , 7 , 1 do

			--local PFlag = CheckFlag(OwnerID()  , Flag[i]) 

			if  CheckFlag( OwnerID(), Flag[i]) == true and  PlayerLV == TargetLV[i] then

				break

			else
				if ( Type == EM_Event_Module_Type_LevelUp or Type == EM_Event_Module_Type_Login) and  PlayerLV == TargetLV[i] then --�ɯū�A�p���a�ŦX���w���ūh����U�C�@��
					ScriptMessage( TargetID(), OwnerID(), 1 , "[EVENT_MODULE_0][$SETVAR1="..CurrentLV.."][$SETVAR2=".."["..Bag[i].."]".."]", "0xFFFFF266" ) --
					ScriptMessage( TargetID(), OwnerID(), 0 , "[EVENT_MODULE_0][$SETVAR1="..CurrentLV.."][$SETVAR2=".."["..Bag[i].."]".."]", "0xFFFFF266" ) --
					GiveBodyItem( OwnerID() , Bag[i] , Number[i])	
					setflag(OwnerID(), Flag[i], 1)
				
				end
			end
		end
	--end

-------- 2010.08.19 --------- �s�W����s����y
	if CheckFlag( OwnerID() , 544408 ) == false and PlayerLV == 1 then
		BeginPlot( OwnerID() , "Lua_Hao_TH_Newevent" , 0 )
	end
end

function Lua_Hao_TH_Newevent()

	local Language = GetServerDataLanguage()				--����ثeserver���y�t
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
	local Bag2 = 208183
	local Keyitem = CheckFlag( OwnerID() , 544408 )
	local Step = 0

	local Job = { }
		Job[1] = ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Warrior )
		Job[2] = ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Ranger )	
		Job[3] = ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Rogue )
		Job[4] = ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Wizard )
		Job[5] = ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Priest )
		Job[6] = ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Knight )
		Job[7] = ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_RuneDancer )
		Job[8] = ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Druid )

--	Debuglog( 2 , "TH_Event RoomID = "..RoomID )
--	Debuglog( 2 , "TH_Event Language = "..Language )

	if Language == "th" or Language == "rw" then
		for i = 1 , table.getn( Job ) , 1 do
			DebugMsg( 0 , RoomID ,"JobLV ="..Job[i] )
			if Job[i] > 1 then
				Step = 1
			end
		end
		if Step == 0 then
			GiveBodyItem( OwnerID() , Bag2 , 1 )
			SetFlag( OwnerID() , 544408 , 1 )
		elseif Step == 1 then
			DebugMsg( 0 , RoomID , "Player level too high " )
		end
	end
end
--------------------------
-------- ���� TH  -------- 
function  TH_cbevent(PlayerLV, Type) --For TH (����)

	local TargetLV = {1} 				           --���w���@�ӵ��Ťɯū�A�|���椰��˪��@��
	local CurrentLV = PlayerLV

	local Bag = {	206740	} 

	local Flag = {	543601	}
	for i = 1 , table.getn(TargetLV) do

		if  CheckFlag( OwnerID(), Flag[i]) == true or  PlayerLV ~= TargetLV[i] then
			break
		elseif Type == EM_Event_Module_Type_Login and  PlayerLV == TargetLV[i] then --�n�J��A�p���a�ŦX����h����U�C�@��
			ScriptMessage( TargetID(), OwnerID(), 1 , "[EVENT_MODULE_KR_0][$SETVAR1=".."["..Bag[i].."]".."]", "0xFFFFF266" )
			ScriptMessage( TargetID(), OwnerID(), 0 , "[EVENT_MODULE_KR_0][$SETVAR1=".."["..Bag[i].."]".."]", "0xFFFFF266" )
			GiveBodyItem( OwnerID() , Bag[i] , 1)	
			setflag(OwnerID(), Flag[i], 1)
		end
	end
	
end
--------�饻 JP --------
function Lua_JP_1year_anniversary(PlayerLV, Type, Race)

	local month = GetSystime(3)+1
	local day = GetSystime(4)
	local hour = GetSystime(1)
	local min = GetSystime(2)
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )			--���o���a����

	if Type == 3 then	-- �n�J�ɧP�_
		local Items = {	{ 19 , 207010 , 1 }	}	-- ���ʤG�@�������B��J

		local Gift = {	{ 16 , 206997 , 1 , 543643 } ,		-- ���ʤT�@1�P�~�y���P§
				{ 17 , 206997 , 1 , 543792 } ,
				{ 18 , 206997 , 1 , 543793 } ,
				{ 19 , 206997 , 1 , 543794 } ,
				{ 20 , 206997 , 1 , 543795 }	}

--		DebugMsg(OwnerID(),OwnerID(),month.."/"..day.." "..hour..":"..min)
		
		if month == 9 then	-- ���ʤG
			for i = 1,table.getn(Items) do
				if Items[i][1] == day then
					if ( hour >=00 and min >=0 ) then
						if CheckFlag( OwnerID()  , 543642 ) ~= true then
							givebodyitem( OwnerID() , Items[i][2] , Items[i][3] )
							givebodyitem( OwnerID() ,203294,10)
							SetFlag( OwnerID() , 543642 , 1 )
						end
					end
				end
			end
		end

		if month == 9 then	-- ���ʤT
			for i = 1,table.getn(Gift) do
				if Gift[i][1] == day then
					if PlayerLV >= 20 then
						if ( hour >=00 and min >=0 ) then
							if CheckFlag( OwnerID()  , Gift[i][4] ) ~= true then
								givebodyitem( OwnerID() , Gift[i][2] , Gift[i][3] )
								SetFlag( OwnerID() , Gift[i][4] , 1 )
							end
						end
					end
				end
			end
		end			
	end

	if Type == 0 then	--�ɯŮɧP�_

		local days = {	{ 16 , 543643 } ,		--���ʤT
				{ 17 , 543792 } ,
				{ 18 , 543793 } ,
				{ 19 , 543794 } ,
				{ 20 , 543795 }		}
		local TargetLV = 20						--���w���@�ӵ��Ťɯū�A�|���椰��˪��@��
		local CurrentLV =PlayerLV
		local Bag = 206997						--�@�g�~�y���P§

--		DebugMsg(OwnerID(),OwnerID(),month.."/"..day )
--		Say( OwnerID() , CurrentLV )

		if month == 9 then
			for i = 1,table.getn(days) do
				if days[i][1] == day then
					if CheckFlag( OwnerID() , days[i][2] ) == true then
						break
					else
						if PlayerLV >= TargetLV then --�ɯū�A�p���a�ŦX���w���ūh����U�C�@��
							ScriptMessage( TargetID(), OwnerID(), 1 , "[EVENT_MODULE_0][$SETVAR1="..CurrentLV.."][$SETVAR2=".."["..Bag.."]".."]", "0xFFFFF266" )
							ScriptMessage( TargetID(), OwnerID(), 0 , "[EVENT_MODULE_0][$SETVAR1="..CurrentLV.."][$SETVAR2=".."["..Bag.."]".."]", "0xFFFFF266" )
							-- �L�q���_�I�̡I���ߧA���\��F[$VAR1]��[EVENT_MODULE_1][$VAR2]�C 
							GiveBodyItem( OwnerID() , Bag , 1 )	
							setflag(OwnerID() , days[i][2] , 1 )
						end
					end
				end
			end
		end
	end
end

--------��߻� PH --------
function Lua_PH_NewBie_event( PlayerLV , Type )

	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )

	if Type == 3 then
		if CheckFlag( OwnerID() , 542194 ) == false and PlayerLV == 1 then
			BeginPlot( OwnerID() , "Lua_Hao_PH_NewBie_event" , 0 )
		end
	end
end

function Lua_Hao_PH_NewBie_event()

	local Language = GetServerDataLanguage()				--����ثeserver���y�t
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
	local Bag = 208316
	local Keyitem = 542194
	local Step = 0

	local Job = { }
		Job[1] = ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Warrior )
		Job[2] = ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Ranger )	
		Job[3] = ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Rogue )
		Job[4] = ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Wizard )
		Job[5] = ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Priest )
		Job[6] = ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Knight )
		Job[7] = ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_RuneDancer )
		Job[8] = ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Druid )

--	Debuglog( 2 , "TH_Event RoomID = "..RoomID )
--	Debuglog( 2 , "TH_Event Language = "..Language )

	if Language == "ph" or Language == "rw" then
		for i = 1 , table.getn( Job ) , 1 do
			DebugMsg( 0 , RoomID ,"JobLV ="..Job[i] )
			if Job[i] > 1 then
				Step = 1
			end
		end
		if Step == 0 then
			GiveBodyItem( OwnerID() , Bag , 1 )
			SetFlag( OwnerID() , Keyitem , 1 )
		elseif Step == 1 then
			DebugMsg( 0 , RoomID , "Player level too high " )
		end
	end
end
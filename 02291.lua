function Lua_ying_weave_begin()

	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --Ū�����ê��������Zone
	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID() , 119003 , 100 , 0 ) --�H���ê���118969�����ߡA�V�P��100�X�j�MNPC�^���R119003
										       --(�̫᪺0��Type�AType 0 ���ܷ|�b�u���@�ӥؼЮɦ^�ǸӥؼСA�A�Ω�w���ƶq�ؼ�)
										       --(1 ���ܫh�O�L�ק��X�ӡA���^�Ǿ�Ӹs�աA�A�Ω󥼪��ƶq�ؼ�)
	local HR = { 11 , 14 , 17 , 20 } --50���G11�I50�B14�I50�B17�I50�B20�I50
	local HR2 = { 12 , 15 , 18 , 21 } --���I�G12�I�B15�I�B18�I�B21�I
--	local Modelnpc = { {118970 , 118971 , 1 } , { 118987 , 118988 , 2 } , { 118989 , 118990 , 3 } , { 118991 , 118992 , 4 } , { 118993 , 118994 , 5 } , { 118995 , 118996 , 6 } , { 118997 , 118998 , 7 } , { 118999 , 119000 , 8 } , { 119001 , 119002 , 9 } }
	local Modelnpc = { {122452 , 122453 , 1 } , { 122454 , 122455 , 2 } , { 122456 , 122457 , 3 } , { 122458 , 122459 , 4 } , { 122460 , 122461 , 5 } , { 122462 , 122463 , 6 } , { 118989 , 118990 , 7 } , { 118997 , 118998 , 8 } , { 119001 , 119002 , 9 } }   --6.0.2 ��s
	local Flag = { 0 , 4 }
	local Random
	local Model
	-- 118970 = Modelnpc[1][1] , 118901 = Modelnpc[1][2] 
	while true do
--		Say( OwnerID() , "begin" )
--		Say( NPC , "NPC = "..NPC )
		local Hour = GetSystime(1) --���o�{�b�ɶ��G��
		local Min = GetSystime(2) --���o�{�b�ɶ��G��
		local Weave_Hour = ReadRoleValue( NPC , EM_RoleValue_Register+2 )	-- �վ�{�b��
		local Weave_Min = ReadRoleValue( NPC , EM_RoleValue_Register+3 )	-- �վ�{�b��

		if Hour + Weave_Hour >= 24 then
			hour = Weave_Hour + hour - 24
		else
			hour = Weave_Hour + hour
		end

		if Min + Weave_Min >= 60 then
			min = Weave_Min + min  - 60
			hour = hour + 1
			if hour >= 24 then
				hour = hour - 24
			end
		else
			min = Weave_Min + min
		end
--		local Reg
--		Reg = ReadRoleValue( NPC , EM_RoleValue_Register9 ) --Ū��NPC�^���R119003���W��Register9��
--		Say( OwnerID() , "Reg1 = "..Reg)
		if ZoneID < 1000 then --(���y1�G2�B���y2�G1002�B���y3�G2002�A�YZoneID�j��1000�h�����y)
			for i = 1 , table.getn(HR) , 1 do --1 , 4 , 1 do --HR��1~4��m
				if Hour == HR[i] and Min == 50 then --�Y"��=11 , 14 , 17 , 20 & ��=50"
					DebugMsg( 0 , 0 , "Hour ="..Hour.."Min ="..Min.."Weave_Sign" )
					RunningMsgEx( OwnerID() , 2 , 3 , "[SC_WEAVE_2011_01]" ) --��´�`����"�g��^�U�D�A�ˮi"�Y�N�b10������}�l�A�Ыe���Z��R�����M��^���R���W�ѥ[�I
					WriteRoleValue( NPC , EM_RoleValue_Register9 , 1 ) --��NPC�^���R��Register9�ȼg��"1"�A���NPC�}����W
--					Reg = ReadRoleValue( NPC , EM_RoleValue_Register9 ) --Ū��NPC�^���R119003���W��Register9��
--					Say( OwnerID() , "Reg2 = "..Reg)
				elseif Hour == HR2[i] and Min == 0 then
					DebugMsg( 0 , 0 , "Hour ="..Hour.."Min ="..Min.."Weave_Begin" )
					if table.getn(Modelnpc) == 0 then --�� Modelnpc table�`�Ƶ���0�ɡA�h���s�g�JModelnpc table
					--	Modelnpc = { {118970 , 118971 , 1 } , { 118987 , 118988 , 2 } , { 118989 , 118990 , 3 } , { 118991 , 118992 , 4 } , { 118993 , 118994 , 5 } , { 118995 , 118996 , 6 } , { 118997 , 118998 , 7 } , { 118999 , 119000 , 8 } , { 119001 , 119002 , 9 } }
						Modelnpc = { {122452 , 122453 , 1 } , { 122454 , 122455 , 2 } , { 122456 , 122457 , 3 } , { 122458 , 122459 , 4 } , { 122460 , 122461 , 5 } , { 122462 , 122463 , 6 } , { 118989 , 118990 , 7 } , { 118997 , 118998 , 8 } , { 119001 , 119002 , 9 } }   --6.0.2 ��s
					end

					for j = 1 , 3 , 1 do --�`�@�̧ǥX�{�T�ժ�tnpc
						Random = Rand(table.getn(Modelnpc))+1 --�Ĥ@���X��Rand(9)+1 = 1~9 (�ĴX��) --��2���X���hRand(8)+1 = 1~8(�]�����Ĥ@���w�X�����էO)
						SetModeEx( NPC , EM_SetModeType_Mark, false ) --�N�^���R�аO����
						WriteRoleValue( NPC , EM_RoleValue_Register9 , 2 ) --��NPC�^���R��Register9�ȼg��"2"�A��ܬ��ʶi�椤
--						Reg = ReadRoleValue( NPC , EM_RoleValue_Register9 ) --Ū��NPC�^���R119003���W��Register9��
--						Say( OwnerID() , "Reg3 = "..Reg)
						if j == 1 then --�Y���Ĥ@���X���h
							Yell( NPC , "[SC_WEAVE_2011_08_1]" , 2 ) --���o��j�a�n�r�A�����w��U���e�ӰѻP�u�g��^�U�D�A�ˮi�v�K
							PlayMotion( NPC , 116 ) --����
							Sleep(50)
							Yell( NPC , "[SC_WEAVE_2011_08_2]" , 2 ) --���ڥ����j�a�����@�U���ʬy�{�a�I
							PlayMotion( NPC , ruFUSION_ACTORSTATE_EMOTE_CUTE2 ) --���`
							Sleep(50)
							Yell( NPC , "[SC_WEAVE_2011_08_3]" , 2 ) --�����|���үS����O�i�X�T�M���A�ˡA�C��i�ܧ��@�M�A�ˮɡA�|�d��5�����ɶ����j�a�A�Ӥj�a�����b�o5�������A
												      --�ӦV�ڥX�ܦU���W�𮧵��u�A�X�ܮ𮧵��u�̦h���e�T��A�N����o�I���ӪA�˪�����I
							PlayMotion( NPC , ruFUSION_ACTORSTATE_EMOTE_SPEAK ) --���� 
							Sleep(80)
							Yell( NPC , "[SC_WEAVE_2011_08_4]", 2 ) --�C�ӤH�C�ѥu�����o�@�����I�����A�ҥH�j�a�@�w�n�J�ӬݲM���Q�n���A�˫�A�A�ӦV�ڥX�ܮ𮧵��u�A�����դF�ܡH
							PlayMotion( NPC , ruFUSION_ACTORSTATE_EMOTE_SPEAK ) --���� 
						Sleep(50)
							Yell( NPC , "[SC_WEAVE_2011_08_5]", 2 ) --���򱵤U�ӪA�ˮi�Y�N�n�}�l�o�A���j�a�n�B�I
						else
							Yell( NPC , "[SC_WEAVE_2011_10]" , 2 ) --�e�T�W���B�ͳ�����I���A�˸���ҩ��F�ܡH�S��o���B�ͧO�Ǥ߭�A�U�@�����A�ˮi�ܧY�N�}�l�I
						end
						PlayMotion( NPC , 103 ) --�[�o
						Sleep(50)
						--Say( OwnerID() , "Random = "..Random.."; Count = "..table.getn(Modelnpc) )
						for i = 1 , 2 , 1 do --�إ�1�k1�k NPC						
							Model = CreateObjByFlag( Modelnpc[Random][i] , 780989 , Flag[i] , 1 ) --�ѷӫ��w�X�l����m�Ӳ��ͪ���(NPC�s���B�X�l�N���B�ĴX���X�l�B����ƶq )
							SetModeEx( Model , EM_SetModeType_Mark , false ) --����ܼаO
							SetModeEx( Model , EM_SetModeType_SearchenemyIgnore , false ) --���i�Q�j�M
							AddToPartition( Model , 0 )
							Callplot( Model , "Lua_ying_weave_Delnpc" , 3600 , Random ) --6������R��NPC
							Callplot( Model , "Lua_ying_weave_model" , i , NPC ) --���q						
						end
						WriteRoleValue( NPC , EM_RoleValue_Register+7 , Modelnpc[Random][3] ) --�Nnpc���W��Register+7�g�JRand��1~9
						Sleep(3000) --5�����ᴣ�ܳѤU�@����
						Yell( NPC , "[SC_WEAVE_2011_24]" , 2 ) --�ɶ��u�ѤU�@������I
						PlayMotion( NPC , ruFUSION_ACTORSTATE_EMOTE_SPEAK ) --���� 
						Sleep(600)--6�����R��NPC��
						SetModeEx( NPC , EM_SetModeType_Mark, false ) --�N�^���R�аO����
						WriteRoleValue( NPC , EM_RoleValue_Register9, 3 ) --��NPC�^���R��Register9�ȼg��"3"�A����o��檱�a����I�����ΥX����M��BUFF
--						Reg = ReadRoleValue( NPC , EM_RoleValue_Register9 ) --Ū��NPC�^���R119003���W��Register9��
--						Say( OwnerID() , "Reg5 = "..Reg)
						Yell( NPC , "[SC_WEAVE_2011_11]" , 2 ) --�X�ܮɶ����o�㮥�߫e�T�W���B�͡I���U�Ӫ�3�����A�N�Ыe�T�W���B�͡A�Ӹ�ڻ���I���A�˸���ҩ��a�I
						PlayMotion( NPC , ruFUSION_ACTORSTATE_EMOTE_SPEAK ) --����
						Sleep(30)
						SetModeEx( NPC , EM_SetModeType_Mark, true ) --�N�^���R�аO���}
						Sleep(1800)--3���� --�A�إߤU�@��NPC
						WriteRoleValue( NPC , EM_RoleValue_Register+7 , 0 ) --�Nnpc���W��Register+7�k0
						table.remove( Modelnpc , Random ) --����model table��rand�쪺�էO ( ����Table , �ĴX�� )
						if j == 3 then --�Y���ĤT���X����tNPC
							WriteRoleValue( NPC , EM_RoleValue_Register9 , 0 )
							WriteRoleValue( NPC , EM_RoleValue_Register+2 , 0 )
--							Reg = ReadRoleValue( NPC , EM_RoleValue_Register9 ) --Ū��NPC�^���R119003���W��Register9��
--							Say( OwnerID() , "Reg4 = "..Reg)
							Yell( NPC , "[SC_WEAVE_2011_23]", 2 ) --�o�ӳ������A�ˮi�N��o�䵲���o�I�P�¤j�a�����ѻP�I
							PlayMotion( NPC , ruFUSION_ACTORSTATE_EMOTE_CUTE2 ) --���`
						end
					end
				end
			end			
		end
		Sleep(600) --1�����]�@���j��
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_weave_Delnpc( Sec , Random ) --60���R��NPC

--	for i = 1 , Sec/10 , 1 do --1 , 30 , 1 do
--	WriteRoleValue( OwnerID() , EM_RoleValue_PID , Random ) --�g�J�ĴX��PID
		Sleep( Sec ) 
--		Say( OwnerID() , i )
--	end
		DelObj( OwnerID() ) --60���R��
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_weave_model( Sex , NPC ) --���q(�N�W�@��function�� i �N�J)

	local Flag = 780989
	local Count
	local Motion = { }
--	local Motion = { 103 , 109 , 111 , 114 , 116 , 123 , 250 , 251 , 253 , 260 , 261 , 266 }

	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 1 ) --�]�w������
	if Sex == 1 then --�k --table���Ĥ@�Ӧ�m
		Count = 0
		Motion = { 103 , 109 , 111 , 114 , 116 , 123 , 250 , 251 , 260 , 261 }
	elseif Sex == 2 then --�k --table���ĤG�Ӧ�m
		Count = 4
		Motion = { 103 , 109 , 111 , 114 , 116 , 123 , 250 , 251 , 260 , 261 }
	end
--	Say( OwnerID() , "Count = "..Count )
	for i = 1 , 3 , 1 do
		local Random = Rand(10)+1
		Count = Count + 1
		DW_MoveToFlag( OwnerID() , Flag , Count , 0 , Enable )
		-- ���沾�ʪ���H�B�X�l����Ʈw�s���B�X�l�s���B�üƨM�w���ʨ�w�I���d��BEnable  0�A������movotoflag   1�A����movetoflag
		Sleep(10)
		PlayMotion( OwnerID() , Motion[Random] )
		Sleep(40)
	end
	
	for i = 1 , 3 , 1 do
		local Random = Rand(10)+1
		Count = Count - 1
		DW_MoveToFlag( OwnerID() , Flag , Count , 0 , Enable )
		-- ���沾�ʪ���H�B�X�l����Ʈw�s���B�X�l�s���B�üƨM�w���ʨ�w�I���d��BEnable  0�A������movotoflag   1�A����movetoflag
		Sleep(10)
		if i == 1 or i == 2 then --���^�X��2�P�X��1���ʧ@
			if Sex == 1 then --�k
				FA_FaceFlagEX( OwnerID() , 780989 , 3 ) --���V�X��3
			elseif Sex == 2 then --�k
				FA_FaceFlagEX( OwnerID() , 780989 , 7 ) --���V�X��7
			end
			PlayMotion( OwnerID() , Motion[Random] )
			Sleep(40)
		end
	end
	if Sex == 1 then --�k
		FA_FaceFlagEX( OwnerID() , 780989 , 3 ) --���V�X��3
	elseif Sex == 2 then --�k
		FA_FaceFlagEX( OwnerID() , 780989 , 7 ) --���V�X��7
		WriteRoleValue( NPC , EM_RoleValue_Register+1 , 0 ) --�Nnpc���W��Register+1�BRegiste+4�BRegiste+5�BRegiste+6 �k�s
		WriteRoleValue( NPC , EM_RoleValue_Register+4 , 0 ) 
		WriteRoleValue( NPC , EM_RoleValue_Register+5 , 0 ) 
		WriteRoleValue( NPC , EM_RoleValue_Register+6 , 0 ) 
		Yell( NPC , "[SC_WEAVE_2011_09]" , 2 ) --�үS�ਭ�W�諸��A�ܬ��a�I�Q��o���ܡA�N����L�ӦV�ڥX�ܧA�⤤���𮧵��u�a�I
		PlayMotion( NPC , ruFUSION_ACTORSTATE_EMOTE_SPEAK ) --����
		Sleep(20)
		SetModeEx( NPC , EM_SetModeType_Mark, true ) --�N�^���R�аO���}	
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_weave_119003talk() --NPC�^���R ��ܼ@��
--	Say(OwnerID(), "Owner") --���a
--	Say(TargetID(), "Target") --NPC
	local Reg = ReadRoleValue( TargetID() , EM_RoleValue_Register9 ) --Ū��NPC���W��Register9��
	local Sign = CheckBuff( OwnerID() , 620636 ) --�w���WBUFF
	local Change = CheckBuff( OwnerID() , 620637 ) --�I���A�˸��
	local Over = CheckFlag( OwnerID() , 545450 ) --�o�л������key
	local Rank = {	[1] = ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) ,
--			[2] = String.rep( "0" , 1 ) , --1��ܤ޸��̪��r�����1��
--			[3] = String.rep( "0" , 1 ) 					}
			[2] = 0 , 
			[3] = 0	}
	local Score = { [1] = ReadRoleValue( TargetID() , EM_RoleValue_Register+4 ) ,  -- �Ĥ@�����X��
			[2] = ReadRoleValue( TargetID() , EM_RoleValue_Register+5 ) ,  -- �ĤG�����X��
			[3] = ReadRoleValue( TargetID() , EM_RoleValue_Register+6 ) }  -- �ĤT�����X��

	if Rank[1] == 0 then		-- ���S���H�v�Ю�
--		Rank[1] = String.rep( "0" , 1 )	
		Rank[1] = 0
	elseif Rank[1] == 2 then	-- �u����H�v�Ю�
		Rank[2] = Rank[1] - 1
	elseif Rank[1] > 2 then	-- �T�H�H�W�v�Ю�
		Rank[2] = Rank[1] - 1
		Rank[3] = Rank[1] - 2
	end

	if Reg == 2 then --���ʶ}�l
		if Sign == true then --�w���W
			SetSpeakDetail( OwnerID() , "[SC_WEAVE_2011_13][$SETVAR1="..Rank[1].."][$SETVAR2="..Rank[2].."][$SETVAR3="..Rank[3].."][$SETVAR4="..Score[1].."][$SETVAR5="..Score[2].."][$SETVAR6="..Score[3].."]" )
		--�Q�o��үS�ਭ�W�i�ܪ��A�˶ܡH�ⴤ�ɶ��A�O�[�ޤ�W���𮧵��u��� --�ثe������I���A�˸�檺�e�T�W���G
		-- �Ĥ@�W�G�s��[$VAR1]���X�ܪ� �A�X�ܼƶq��[$VAR4]�ӡC  -- �ĤG�W�G�s��[$VAR2]���X�ܪ� �A�X�ܼƶq��[$VAR5]�ӡC  -- �ĤT�W�G�s��[$VAR3]���X�ܪ� �A�X�ܼƶq��[$VAR6]�ӡC
		-- ����A�o���A�Q�X�ܦh�֭Ӯ𮧵��u�O�H
			AddSpeakOption( OwnerID() , TargetID() , "[SC_WEAVE_2011_14][$SETVAR1=".."10".."]" , "Lua_ying_weave_giveitem10" , 0 ) --�ڷQ��Ĥ@�W�h�X��10�Ӯ𮧵��u�I
			AddSpeakOption( OwnerID() , TargetID() , "[SC_WEAVE_2011_14][$SETVAR1=".."20".."]" , "Lua_ying_weave_giveitem20" , 0 ) --�ڷQ��Ĥ@�W�h�X��20�Ӯ𮧵��u�I
			AddSpeakOption( OwnerID() , TargetID() , "[SC_WEAVE_2011_14][$SETVAR1=".."50".."]" , "Lua_ying_weave_giveitem50" , 0 ) --�ڷQ��Ĥ@�W�h�X��50�Ӯ𮧵��u�I
		elseif Change == true then --�w���I���A�˸��
			SetSpeakDetail( OwnerID() , "[SC_WEAVE_2011_15]" ) --�A�w�g��o�F�I���A�˸���o�A����h��S���i��I���a�I
		elseif Over == true then --�o�л������key
			SetSpeakDetail( OwnerID() , "[SC_WEAVE_2011_20]" ) --�A���Ѥw�g��o�L�g��A�ˤF�A���Ѥ~��A�ѻP���ʮ@��
		else --�����W
			SetSpeakDetail( OwnerID() , "[SC_WEAVE_2011_12]" ) --�ѩ�A�S�����W��o�ѻP�A�ˮi�����A�ҥH�L�k�i�榹���ʮ@��
		end
	elseif Reg == 3 then --����o��檱�a����I�����έ���M��BUFF
		if Sign == true then --�����Wbuff
			SetSpeakDetail( OwnerID() , "[SC_WEAVE_2011_17][$SETVAR1="..Rank[1].."][$SETVAR2="..Rank[2].."][$SETVAR3="..Rank[3].."][$SETVAR4="..Score[1].."][$SETVAR5="..Score[2].."][$SETVAR6="..Score[3].."]" )
			--���ߥH�U�s�����B�͡A�N�i��o�I���A���ҩ��A�A�̫ܼF�`��I����a�ۧA�̩ҥX�ܪ��ƶq�Ӹ�ڧI���ҩ��a��
			--�s��[$VAR1]���A�X�ܮ𮧵��u���ƶq��[$VAR4]�ӡC--�s��[$VAR2]���A�X�ܮ𮧵��u���ƶq��[$VAR5]�ӡC--�s��[$VAR3]���A�X�ܮ𮧵��u���ƶq��[$VAR6]�ӡC
			AddSpeakOption( OwnerID() , TargetID() , "[SC_WEAVE_2011_18]" , "Lua_ying_weave_cloth" , 0 ) --�ڷQ����I���A�˸��I
		elseif Change == true then --�w���I���A�˸��
			SetSpeakDetail( OwnerID() , "[SC_WEAVE_2011_15]" ) --�A�w�g��o�F�I���A�˸���o�A����h��S���i��I���a�I
		elseif Over == true then --�o�л������key
			SetSpeakDetail( OwnerID() , "[SC_WEAVE_2011_20]" ) --�A���Ѥw�g��o�L�g��A�ˤF�A���Ѥ~��A�ѻP���ʮ@��
		else --�L���WBUFF 
			SetSpeakDetail( OwnerID() , "[SC_WEAVE_2011_12]" ) --�ѩ�A�S�����W��o�ѻP�A�ˮi�����A�ҥH�L�k�i�榹���ʮ@��
		end
	elseif Reg == 1 then --���ʶ}�l���W
		LoadQuestOption( OwnerID() ) --Ū���Ҫ�
		AddSpeakOption( OwnerID() , TargetID() , "[SC_111576_YU_03]" , "Lua_ying_weave_sign" , 0 ) --"�ڭn���W�I"�ﶵ
		AddSpeakOption( OwnerID() , TargetID() , "[SC_WEAVE_2011_02]" , "Lua_ying_weave_game" , 0 ) --�ڷQ���D�u�g��^�U�D�A�ˮi�v�����ʤ��e  �ﶵ
	elseif Reg == 0 then --���ʥ��}�l�B���b���W�ɶ�
		LoadQuestOption( OwnerID() ) --Ū���Ҫ�
		AddSpeakOption( OwnerID() , TargetID() , "[SC_WEAVE_2011_02]" , "Lua_ying_weave_game" , 0 ) --�ڷQ���D�u�g��^�U�D�A�ˮi�v�����ʤ��e  �ﶵ
		AddSpeakOption( OwnerID() , TargetID() , "[SC_COLORWEAVE_01]" , "Lua_ying_weave_story" , 0 ) --�ڷQ���D��´�`���Ѩ�
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_weave_cloth() --�ڷQ����I���A�˸��I

	CloseSpeak( OwnerID() )

	local NumBuff = CheckBuff( OwnerID() , 507946 ) --�s��buff
	local BuffLV = FN_CountBuffLevel( OwnerID() , 507946 ) --�P�_���a���W���X�ܽs��BUFF���Ŧh��
	local Count = CountBodyItem( OwnerID() , 240502 ) --�P�_���a���W�𮧵��u���ƶq
	local Reg7 = ReadRoleValue( TargetID() , EM_RoleValue_Register+7 ) --Ū��NPCRegister+7�ȡA�ΨӧP�_�X����M��
	local Rank = {	[1] = ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) ,
			[2] = 0 , 
			[3] = 0	}
	local Score = { [1] = ReadRoleValue( TargetID() , EM_RoleValue_Register+4 ) ,  -- �Ĥ@�����X��
			[2] = ReadRoleValue( TargetID() , EM_RoleValue_Register+5 ) ,  -- �ĤG�����X��
			[3] = ReadRoleValue( TargetID() , EM_RoleValue_Register+6 ) }  -- �ĤT�����X��

	if Rank[1] == 0 then		-- ���S���H�v�Ю�
		Rank[1] = 0
	elseif Rank[1] == 2 then	-- �u����H�v�Ю�
		Rank[2] = Rank[1] - 1
	elseif Rank[1] > 2 then	-- �T�H�H�W�v�Ю�
		Rank[2] = Rank[1] - 1
		Rank[3] = Rank[1] - 2
	end
--	Say(TargetID() , "Reg7 = "..Reg7 )
	if NumBuff == true then  --���W�w���s��buff
		for i = 1 , table.getn( Rank ) , 1 do --1 , 3 ,1 do
			if BuffLV + 1 == Rank[i] then --buff���X�ŦX�e�T�W
				if Count >= Score[i] then --�p�G���a���W���𮧵��u>= �X���ƶq
					CancelBuff( OwnerID() , 507946 ) --�R���s��buff
					CancelBuff( OwnerID() ,  620636 ) --�R�����Wbuff
					AddBuff( OwnerID() , 620637 , Reg7- 1 , 10800 ) --�������Įɶ�3�p�ɪ��I�����buff --3�p�� --���Ű����P�O���@�M�A��0~8 �C������1~9
					DelBodyItem( OwnerID() , 240502 , Score[i] ) --�R���𮧵��u
					return false
				else --�𮧵��u����
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_WEAVE_2011_16]" , C_SYSTEM ) --�A���W���𮧵��u�����I
					ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_WEAVE_2011_16]" , C_SYSTEM ) --�A���W���𮧵��u�����I
					return false
				end			
			end
		end
		CancelBuff( OwnerID() , 507946 ) --�R���s��buff
		ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_WEAVE_2011_19]" , C_SYSTEM ) --�A�ä��ŦX�i�������I
		ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_WEAVE_2011_19]" , C_SYSTEM ) --�A�ä��ŦX�i�������I
	else --�L�s��buff
		ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_WEAVE_2011_19]" , C_SYSTEM ) --�A�ä��ŦX�i�������I
		ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_WEAVE_2011_19]" , C_SYSTEM ) --�A�ä��ŦX�i�������I
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_weave_giveitem10() --�o���ڷQ�X��10�Ӯ𮧵��u�I

	CloseSpeak( OwnerID() )
	CallPlot( TargetID() , "Lua_ying_weave_giveitem" , OwnerID() , 10 ) --����̬�Target=NPC	
	local Key = ReadRoleValue( TargetID() , EM_RoleValue_PID )
--	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_DBID )
--	local Name = GetGUIDByDBID( Player )
--	DebugMsg( 0 , 0 , OwnerID().." Key2  = "..Key )
--	Say( OwnerID() , "Guid = "..Name )
	if Key == 1 then  -- NPC��PID��1�A�h���NPC��ܳQ��
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SAY_NPC_BUSY]" , C_SYSTEM ) -- �����a�T���A�ؼЦ��L��
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SAY_NPC_BUSY]" , C_SYSTEM ) -- �����a�T���A�ؼЦ��L��
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_weave_giveitem20() --�o���ڷQ�X��20�Ӯ𮧵��u�I

	CloseSpeak( OwnerID() )
	CallPlot( TargetID() , "Lua_ying_weave_giveitem" , OwnerID() , 20 ) --����̬�Target=NPC	
	local Key = ReadRoleValue( TargetID() , EM_RoleValue_PID )
--	DebugMsg( 0 , 0 , OwnerID().." Key3  = "..Key )
	if Key == 1 then  -- NPC��PID��1�A�h���NPC��ܳQ��
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SAY_NPC_BUSY]" , C_SYSTEM ) -- �����a�T���A�ؼЦ��L��
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SAY_NPC_BUSY]" , C_SYSTEM ) -- �����a�T���A�ؼЦ��L��
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_weave_giveitem50() --�o���ڷQ�X��10�Ӯ𮧵��u�I

	CloseSpeak( OwnerID() )
	CallPlot( TargetID() , "Lua_ying_weave_giveitem" , OwnerID() , 50 ) --����̬�Target=NPC	
	local Key = ReadRoleValue( TargetID() , EM_RoleValue_PID )
--	DebugMsg( 0 , 0 , OwnerID().." Key3  = "..Key )
	if Key == 1 then  -- NPC��PID��1�A�h���NPC��ܳQ��
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SAY_NPC_BUSY]" , C_SYSTEM ) -- �����a�T���A�ؼЦ��L��
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SAY_NPC_BUSY]" , C_SYSTEM ) -- �����a�T���A�ؼЦ��L��
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_weave_giveitem( Player , Value )  -- �bNPC���W����

	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 ) -- ���NPC���
	DisableQuest( OwnerID() , true )

	local Rank = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 ) --���Xbuff
	local Score = ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 )
	local Count = CountBodyItem( Player , 240502 ) --�P�_���a���W�𮧵��u���ƶq
	local Check = CheckBuff( Player , 507946 ) --�ˬd���a���W�O�_���X�ܵ��ubuff
	local BuffLV = FN_CountBuffLevel( Player , 507946 ) --�ˬd�X��BUFF������
	
	if Check == true then
		if BuffLV+1 == Rank or BuffLV+1 == Rank-1 or BuffLV+1 == Rank-2 then
			ScriptMessage( Player , Player , 1 , "[SC_WEAVE_2011_22]" , C_SYSTEM ) --�A�w�b�e�T�W���A���ݦA�X�ܧ�h���𮧵��u�I
			WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )	-- �Ѷ}NPC���
			DisableQuest( OwnerID() , false )
			return false
		end
	end
	
	if Count >= Score + Value then --�Y���a���W���𮧵��u >= �ثe�Ĥ@�W�X������+10
		Rank = Rank + 1
		Score = Score + Value
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , Rank )
		CancelBuff( Player , 507946 ) --�R���X�ܮ𮧵��uBUFF
		AddBuff( Player , 507946 , Rank-1 , 600 )
		CallPlot( OwnerID() , "Lua_ying_weave_newgive" , Score ) --�N�s���X�ܼƶq�ȼg�JNPC���W
	else --�Y���a���W���𮧵��u < �ثe�Ĥ@�W�X������+10
		ScriptMessage( Player , Player , 1 , "[SC_WEAVE_2011_16]" , C_SYSTEM ) --�A���W���𮧵��u�����I
		ScriptMessage( Player , Player , 0 , "[SC_WEAVE_2011_16]" , C_SYSTEM ) --�A���W���𮧵��u�����I
	end
	Sleep(10)
	DisableQuest( OwnerID() , false )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )  -- �Ѷ}NPC���
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_weave_newgive( Score ) --�P�_��ܵ��������X�ܪ��~�ƶq�� (�N�s���X�ܼƶq�ȼg�JNPC���W)

	local No = {	[1] = ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) ,		-- �Ĥ@�����X�ܼƶq
			[2] = ReadRoleValue( OwnerID() , EM_RoleValue_Register+5 ) ,	}	-- �ĤG�����X�ܼƶq
--	DebugMsg( 0 , 0 , "Score = "..Score ) 
--	DebugMsg( 0 , 0 , "No[1] = "..No[1] ) 
--	DebugMsg( 0 , 0 , "No[2] = "..No[2] ) 
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+4 , Score )	-- �N�s�v�Ъ�����g�JReg+4
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+5 , No[1] )	-- �N�쥻�ONo.1���л��g�JReg+5
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+6 , No[2] )	-- �N�쥻�ONo.2���л��g�JReg+6
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_weave_game() --�ڷQ���D�u�g��^�U�D�A�ˮi�v�����ʤ��e

	SetSpeakDetail( OwnerID() , "[SC_WEAVE_2011_03]" ) --�u�g��^�U�D�A�ˮi�v�A�U�W��q�N�O�|�b�A�ˮi���A�i�ܥX�H�����Ǩ㦳�S��S�g�媺�A��....
	AddSpeakOption ( OwnerID(), TargetID(), "[SO_BACK]", "Lua_ying_weave_119003talk", 0 ) --�^��W�@��
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_weave_story() --�ڷQ���D��´�`���Ѩ�

	SetSpeakDetail( OwnerID() , "[SC_COLORWEAVE_02]" ) --��´���Ѩ�
	AddSpeakOption ( OwnerID(), TargetID(), "[SO_BACK]", "Lua_ying_weave_119003talk", 0 ) --�^��W�@��
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_weave_sign() --�ڭn���W�I

	local Sign = CheckBuff( OwnerID() , 620636 ) --�w���WBUFF
	local NotS = CheckBuff( OwnerID() , 620638 ) --�A�ˮi�T��
	local Over = CheckFlag( OwnerID() , 545450 ) --�o�л������key

	if Over == true then --�w�o�л������
		SetSpeakDetail( OwnerID() , "[SC_DAN_112756_6]" ) --�A���Ѥw�g���������ʡA�Щ��ѦA�~����W�a�C
	elseif NotS == true then --�A�ˮi�T��
		SetSpeakDetail( OwnerID() , "[SC_WEAVE_2011_04]" ) --XXX�A�A�b���o�I���A�˸���A�S���b3�p�ɤ���S���i��I���A�ҥH�ثe�L�k�A�����W�ѥ[�C
	elseif Sign == true then --�w���W
		SetSpeakDetail( OwnerID() , "[SC_WEAVE_2011_05]" ) --�A�w�g���W�L�o�I���I���ɭԡu�g��^�U�D�A�ˮi�v�N�|�}�l�F�A�аO�o�h�ǳƤ@�Ǯ𮧵��u�@�A���A�n�B�I
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_WEAVE_2011_06]" , C_SYSTEM ) --�A�����W�w�g�ӽЧ����I
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_WEAVE_2011_06]" , C_SYSTEM ) --�A�����W�w�g�ӽЧ����I
		AddBuff( OwnerID() , 620636 , 0 , 2400 ) --�������WBUFF
		CloseSpeak( OwnerID() )
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_weave_119004talk() --NPC�S��� ��ܼ@��

	local Change = CheckBuff( OwnerID() , 620637 ) --�I���A�˸��
	local Sign = CheckBuff( OwnerID() , 620636 ) --�w���WBUFF

	LoadQuestOption( OwnerID() ) --Ū���Ҫ�
	if Sign == true then
		AddSpeakOption( OwnerID() , TargetID() , "[SC_WEAVE_2013_CHANGE_01]" , "Lua_mika_weave_getitem" , 0 ) -- �ڻݭn��h��[240502]
	end
	if Change == true then
		AddSpeakOption( OwnerID() , TargetID() , "[SC_WEAVE_2011_07]" , "Lua_ying_weave_change" , 0 ) --"�ڤw�֦��F�I���A�˸��A�ڷQ�i��I���I"�ﶵ
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_weave_getitem()
	local Player = OwnerID()

	SetSpeakDetail( Player , "[SC_WEAVE_2013_CHANGE_02]" )   
	--  �A���b�дo�ݨ�߰ʪ��A�˫o�S��������[240502]�i���v�жܡH
	-- �p�G�A�����ڻݭn��<CS>[201607]</CS>�A�ڴN�H<CS>[201607]1�өM�A�洫<CS>[240502]20��</CS>�A�N�U�p��H

	AddSpeakOption( OwnerID() , TargetID() , "[SC_WEAVE_2013_CHANGE_03]" , "Lua_mika_weave_getitem2" , 0 ) --����I
end

function Lua_mika_weave_getitem2()  -- 2013 6.0.2 ��´�`�s�W �I���𮧵��u�ﶵ
	local Player = OwnerID()
	local stoneid = 201607  -- �ĦX�֤�
	local weaveid =  240502  -- �𮧵��u
	local itemcount = 20

	if CountBodyItem(Player, stoneid ) >= 1 then
		CloseSpeak(Player)
		DelBodyItem(Player, stoneid, 1) -- �R�� �ĦX�֤� x1
		GiveBodyItem(Player, 240502, 20 )  -- ���� �𮧵��u x 20
		DesignLog( Player , 119004 , " 201607 Change Item 240502 x20 " )
	else
		SetSpeakDetail( Player , "[SC_112503_NO] " )   --  �A�ҫ������~�ƶq������I
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_weave_change() --"�ڤw�֦��F�I���A�˸��A�ڷQ�i��I���I"

	CloseSpeak( OwnerID() )

	local Change = CheckBuff( OwnerID() , 620637 ) --�I���A�˸��
	local BuffLV = FN_CountBuffLevel( OwnerID() , 620637 ) --�P�_���a���W���I�����BUFF���Ŧh��(���Ŭ��P�_�ĴX�s�����M��)
	local BuffNum = { 0 , 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 }
--	local Gift = { 240045 , 240046 , 240047 , 240048 , 240049 , 240050 , 240051 , 240052 , 240053 }   -- 6.0.2 �H�e§��
	local Gift = { 242697 , 242698 , 242699 , 242700 , 242701 , 242702 , 240047 , 240051 , 240053 }   -- 6.0.2 �s�W§��
--	DebugMsg( OwnerID() , 0 , "BuffLV = "..BuffLV )
	if Change == true then --���W���I�����
		for i = 1 , table.getn(BuffNum) , 1 do -- 1 , 9 , 1 do --BuffNum��1~9��m
			if BuffLV == BuffNum[i] then --�YBUFF����="0~8"
				GiveBodyItem( OwnerID() , Gift[i] , 1 ) --�������aGift��1~9�۹��m§��
				SetFlag( OwnerID() ,  545450 , 1 ) --�����o�л������key
				CancelBuff( OwnerID() , 620637) --�R���I���A�˸��
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_WEAVE_2011_21][$SETVAR1=".."["..Gift[i].."]".."]" , C_SYSTEM ) --�A�w���\����F[$VAR1]§���I
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_WEAVE_2011_21][$SETVAR1=".."["..Gift[i].."]".."]" , C_SYSTEM ) --�A�w���\����F[$VAR1]§���I
				BeginPlot( OwnerID() , "Lua_ying_weave_cancelbuff" , 1 ) --�Y���I���h�R���A�˸T��
			end
		end
	else
		ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_WEAVE_2011_19]" , C_SYSTEM ) --�A�ä��ŦX�i�������I
		ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_WEAVE_2011_19]" , C_SYSTEM ) --�A�ä��ŦX�i�������I
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_weave_cancelbuff()
	
	CancelBuff( OwnerID() , 620638) --�R���A�˸T��
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_weave_test_clean() --�M����tNPC

--	local Modelnpc = { 118970 , 118971 , 118987 , 118988 , 118989 , 118990 ,  118991 , 118992  , 118993 , 118994  , 118995 , 118996 , 118997 , 118998 , 118999 , 119000 , 119001 , 119002 }
	local Modelnpc = { 122452 , 122453 , 122454 , 122455 , 122456 , 122457 ,  122458 , 122459 ,  122460 , 122461 , 122462 , 122463  , 118989 , 118990 ,  118997 , 118998 ,  119001 , 119002 }   --6.0.2 ��s

	for i = 1 , table.getn(Modelnpc) , 1 do
		Lua_Hao_NPCofAll_Clear( Modelnpc[i] , 300 )
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_weave_test_time( Time )	-- �վ�ثe�ɶ��@�Шϥ� /gm ? pcall Lua_ying_weave_test_time �ާ@
-- ��J�Ȭ� -2 �ɡA�d�ߥثe�ɶ��A -1 �ɡA�N�e�i�ɶ��k�s�A��J�� 0000 �� 2359 �ɡA�����ܳ]�w�ɶ��C

	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID() , 119003 , 200 , 0 ) --�V�P��200�X�j�MNPC�^���R119003
	local Hour = GetSystime(1) --���o�{�b�ɶ��G��
	local Min = GetSystime(2) --���o�{�b�ɶ��G��
	local Weave_Hour = ReadRoleValue( NPC , EM_RoleValue_Register+2 )	-- �վ�{�b��
	local Weave_Min = ReadRoleValue( NPC , EM_RoleValue_Register+3 )	-- �վ�{�b��
	local Select_Hour , Select_Min

	if Time == -2 then							-- �d�ߥثe�A�e�i�F�h�֮ɶ�
		DebugMsg( OwnerID() , 0 , "Weave_Hour = "..Weave_Hour.." Weave_Min = "..Weave_Min )
	elseif Time == -1 then							-- �N�e�i���ɶ� �p�ɻP�� �k�s
		WriteRoleValue( NPC , EM_RoleValue_Register+2 , 0 )
		WriteRoleValue( NPC , EM_RoleValue_Register+3 , 0 )
	elseif Time >= 0 and Time <= 2359 then					-- �վ�ثe�ɶ��@00:00 ~ 23:59
		Select_Hour = Math.floor( Time / 100 )				-- ���㰣����
		Select_Min = Time % 100					-- ���l�Ƴ���
		if ( Select_Hour >= 0 and Select_Hour <= 23 ) and ( Select_Min >= 0 and Select_Min <= 59 ) then
			WriteRoleValue( NPC , EM_RoleValue_Register+2 , Select_Hour )
			WriteRoleValue( NPC , EM_RoleValue_Register+3 , Select_Min )
		else
			DebugMsg( OwnerID() , "Enter Error" )
		end
	else
		DebugMsg( OwnerID() , "Enter Error" )
	end
end
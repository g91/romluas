function Lua_ying_juice_begin() --�������Ϊ���

	local BOX = OwnerID()
	local ZoneID = ReadRoleValue( BOX , EM_RoleValue_RealZoneID ) --Ū�����ê��������Zone
	local NPC = LuaFunc_SearchNPCbyOrgID( BOX , 113754 , 500 , 0 ) --�H���ê���119223�����ߡA�V�P��500�X�j�MNPC�S���K��113754
										       --(�̫᪺0��Type�AType 0 ���ܷ|�b�u���@�ӥؼЮɦ^�ǸӥؼСA�A�Ω�w���ƶq�ؼ�)
										       --(1 ���ܫh�O�L�ק��X�ӡA���^�Ǿ�Ӹs�աA�A�Ω󥼪��ƶq�ؼ�)
	while true do
--		Say( BOX , "begin" )
		local Hour = GetSystime(1) --���o�{�b�ɶ��G��
		local Min = GetSystime(2) --���o�{�b�ɶ��G��

		if Hour == 12 or Hour== 15 or Hour == 18 or Hour == 21 then
--		if Hour == 9 or Hour== 10 or Hour == 11 or Hour == 12 or Hour == 13 or Hour == 14 or Hour == 15 or Hour == 16 or Hour == 17 or Hour == 18 or Hour == 19 then
			if Min == 20 then
--			if Min == 1 or Min == 7 or Min == 13 or Min == 19 or Min == 25 or Min == 31 or Min == 37 or Min == 43 or Min == 49 or Min == 55 then
				if ZoneID < 1000 then --(���y1�G21�B���y2�G2102�B���y3�G2102�A�YZoneID�j��1000�h�����y)
					RunningMsgEx( BOX , 2 , 3 , "[SC_THANKS_2011_1]" ) --���@�`���ʡy�ɱ��{���a��z�Y�N�b10������}�l�A������̽ХߧY�e���p�_�Ҥ���e���h�ۤj�����A�V�S���K�����W�ѥ[
				end
				BeginPlot( BOX , "Lua_ying_juice_magic" , 0 ) --�إ��]�k�}
				WriteRoleValue( NPC , EM_RoleValue_PID , 1 ) --���Wpid=1
--				PID = ReadRoleValue ( NPC , EM_RoleValue_PID )
--				Say( BOX , "PID = "..PID )
			elseif Min == 29 then
--			elseif Min == 2 or Min == 8 or Min == 14 or Min == 20 or Min == 26 or Min == 32 or Min == 38 or Min == 44 or Min == 50 or Min == 56 then
				ScriptMessage( BOX , 0 , 1 , "[SC_THANKS_2011_22]" , C_SYSTEM ) --���W�ɶ��ѤU1�����A�Чⴤ�ɶ��I
				ScriptMessage( BOX , 0 , 0 , "[SC_THANKS_2011_22]" , C_SYSTEM ) --���W�ɶ��ѤU1�����A�Чⴤ�ɶ��I
				ScriptMessage( NPC , 0 , 1 , "[SC_THANKS_2011_22]" , C_SYSTEM ) --���W�ɶ��ѤU1�����A�Чⴤ�ɶ��I
				ScriptMessage( NPC , 0 , 0 , "[SC_THANKS_2011_22]" , C_SYSTEM ) --���W�ɶ��ѤU1�����A�Чⴤ�ɶ��I
			elseif Min == 30 then
--			elseif Min == 3 or Min == 9 or Min == 15 or Min == 21 or Min == 27 or Min == 33 or Min == 39 or Min == 45 or Min == 51 or Min == 57 then
				BeginPlot( BOX , "Lua_ying_juice_gamebegin" , 0 ) --���ʶ}�l
				WriteRoleValue( NPC , EM_RoleValue_PID , 2 ) --���ʶ}�lpid=2
--				PID = ReadRoleValue ( NPC , EM_RoleValue_PID )
--				Say( BOX , "PID = "..PID )
			end
		end
		Sleep(600) --1�����]�@���j��
	end
end
----------���ʶ}�l-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_juice_gamebegin()

	local BOX = OwnerID()
	local Player = SearchRangePlayer( BOX , 115 ) --�j�MBOX�P��115�Ҧ����a�itable
	local Host = LuaFunc_SearchNPCbyOrgID( BOX , 113754 , 500 , 0 ) --�H���ê���119223�����ߡA�V�P��500�X�j�MNPC�S���K��113754
	local CheckPlayer = {}
	local NPC = {}

	for i = 0 , table.getn(Player) , 1 do
		if CheckBuff( Player[i] , 509865 ) == true then --���w���WBUFF 
			CancelBuff( Player[i] , 509865 )
			AddBuff( Player[i] , 620791 , 49 , -1 ) --�{���I��50�h
			table.insert( CheckPlayer , Player[i] ) --�[�JCheckPlayer��table��
--			Say( BOX , "CheckPlayer = "..Player[i] )
		end	
	end

	for i=1 , 180 , 1 do --3����

		if #CheckPlayer > 0 then
			CheckPlayer = Lua_ying_juice_inplayer( CheckPlayer ) --�NCheckPlayer��table�a�Jfunction
			local Player = SearchRangePlayer( BOX , 115 ) --�j�MBOX�P��115�Ҧ����a�itable

			for i = 0 , table.getn(Player) , 1 do
				local BuffType = 0
				local Count = BuffCount( Player[i] )

				for j = 0 , Count  , 1 do
					local BuffID = BuffInfo( Player[i] , j , EM_BuffInfoType_BuffID )
					if GameObjInfo_int( BuffID , "AssistType" ) == 68 then
						BuffType = GameObjInfo_int( BuffID , "AssistType" )
						break
					end
				end

				if BuffType == 68 then --���M�����M
					DW_CancelTypeBuff( 68,  Player[i] ) --�U��
					ScriptMessage( Player[i] , Player[i] , 1 , "[SC_THANKS_2011_12]" , 0 )  --���ʶi�椤�A���B�L�k�M�����M�I
				end
			end		
		end

		if i == 1 then
--			DebugMsg( 0 , 0 , "Time = "..i )
			NPC[1] = Lua_ying_juice_creatnpc( 119568 , 0 )
			if  #CheckPlayer > 0 then
				for i = 1 , #CheckPlayer , 1 do
					ScriptMessage( CheckPlayer[i] , CheckPlayer[i] , 1 , "[SC_THANKS_2011_23]" , C_SYSTEM ) --���ʶ}�l�I
					ScriptMessage( CheckPlayer[i] , CheckPlayer[i] , 0 , "[SC_THANKS_2011_23]" , C_SYSTEM ) --���ʶ}�l�I
				end
				Yell( NPC[1], "[SC_THANKS_2011_14]" , 2 ) --���ʶ}�l�o�I�j�a�ɱ��a�{���a��
				PlayMotion( NPC[1] , ruFUSION_ACTORSTATE_EMOTE_SPEAK ) --����
			end
			CallPlot( NPC[1] , "Lua_ying_juice_Spell" , CheckPlayer )
		elseif i == 3 then
			NPC[2] = Lua_ying_juice_creatnpc( 119571 , 1 )
			if  #CheckPlayer > 0 then
				Yell( NPC[2] , "[SC_THANKS_2011_15]" , 2 ) --�p�ߧO�Q�ڭ̤⤤���֮笣�{��F���
				PlayMotion( NPC[2] , ruFUSION_ACTORSTATE_EMOTE_SPEAK ) --����
			end
			CallPlot( NPC[2] , "Lua_ying_juice_Spell" , CheckPlayer )
		elseif i == 60 then
--			DebugMsg( 0 , 0 , "Time = "..i )
			NPC[3] = Lua_ying_juice_creatnpc( 119569 , 2 )
			if  #CheckPlayer > 0 then
				Yell( NPC[3] , "[SC_THANKS_2011_16]" , 2 ) --�ĤG���q�n���o��
				PlayMotion( NPC[3] , ruFUSION_ACTORSTATE_EMOTE_SPEAK ) --����
			end
			CallPlot( NPC[3] , "Lua_ying_juice_Spell" , CheckPlayer )
		elseif i == 63 then
			NPC[4] = Lua_ying_juice_creatnpc( 119572 , 3 )
			if  #CheckPlayer > 0 then
				Yell( NPC[4] , "[SC_THANKS_2011_17]" , 2 ) --�j�a�[�o�I
				PlayMotion( NPC[4] , 103 ) --�[�o
			end
			CallPlot( NPC[4] , "Lua_ying_juice_Spell" , CheckPlayer )
		elseif i == 120 then
--			DebugMsg( 0 , 0 , "Time = "..i )
			NPC[5] = Lua_ying_juice_creatnpc( 119570 , 4 )
			if  #CheckPlayer > 0 then
				Yell( NPC[5] , "[SC_THANKS_2011_18]" , 2 ) --�ܶ}�ߦ��H�������̫�@�i���֮笣������
				PlayMotion( NPC[5] , 102 ) --���
			end
			CallPlot( NPC[5] , "Lua_ying_juice_Spell" , CheckPlayer )
		elseif i == 123 then
			NPC[6] = Lua_ying_juice_creatnpc( 119593 , 5 )
			if  #CheckPlayer > 0 then
				Yell( NPC[6] , "[SC_THANKS_2011_19]" , 2 ) --�N�o�˫��򪺰{����̫�a��GO�I
				PlayMotion( NPC[6] , 115 ) --GO
			end
			CallPlot( NPC[6] , "Lua_ying_juice_Spell" , CheckPlayer )
		elseif i == 176 then
--			DebugMsg( 0 , 0 , "Time = "..i )
			for i = 1 , #NPC , 1 do 
				WriteRoleValue( NPC[i] , EM_RoleValue_Register+1 , 0 ) --�NNPC�� EM_RoleValue_Register+1�g�J0
			end
		elseif i == 180 then
--			DebugMsg( 0 , 0 , "Time = "..i )
			local Site ={ 0 , 1 , 2 , 3 , 4 , 5 }

			if #CheckPlayer > 0 then
				for i = 1 , #CheckPlayer , 1 do
					local BuffLV = FN_CountBuffLevel( CheckPlayer[i] , 620791 ) --�P�_���a���W���{���I�Ʀ��h�� --0���C������1
				
					CancelBuff( CheckPlayer[i] , 621082 ) --�R���ˬdBUFF
					CancelBuff( CheckPlayer[i] , 620791 ) --�R���{���I��
					if BuffLV <= 10 then --�C����1~10
						GiveBodyItem( CheckPlayer[i] , 206266 , 1 ) --���@�`���ʼ���
					elseif BuffLV > 11 and BuffLV <= 19 then --11~20
						GiveBodyItem( CheckPlayer[i] , 206266 , 2 )
					elseif BuffLV > 19 and BuffLV <= 29 then --21~30
						GiveBodyItem( CheckPlayer[i] , 206266 , 3 )
					elseif BuffLV > 29 and BuffLV <= 39 then --31~40
						GiveBodyItem( CheckPlayer[i] , 206266 , 4 )
					else --41�H�W
						GiveBodyItem( CheckPlayer[i] , 206266 , 5 )
					end
					GiveBodyItem( CheckPlayer[i] , 240374 , 1 ) --�����Ĥ�
					ScriptMessage( CheckPlayer[i] , CheckPlayer[i] , 1 , "[SC_THANKS_2011_13]" , C_SYSTEM ) --���ʵ���
					ScriptMessage( CheckPlayer[i] , CheckPlayer[i] , 0 , "[SC_THANKS_2011_13]" , C_SYSTEM ) --���ʵ���
				end
			end

			BeginPlot( BOX , "Lua_ying_juice_clearmagic" , 0 ) --�R���]�k�}
			WriteRoleValue( Host , EM_RoleValue_PID , 0 ) --���ʵ���pid=0
--			PID = ReadRoleValue ( Host , EM_RoleValue_PID )
--			Say( BOX , "PID = "..PID )
			for i = 1 , #NPC , 1 do --�R�����WNPC
				if #CheckPlayer > 0 then
					if i == 1 then
						Yell( NPC[1] , "[SC_THANKS_2011_20]" , 2 ) --�o���������ʴN�즹�����o�I
					elseif i ==2 then
						Yell( NPC[2] , "[SC_THANKS_2011_21]" , 2 ) --�j�a�A���I
					end
				end
				PlayMotion( NPC[i] , 116 ) --����
				DW_MoveToFlag( NPC[i] , 781033 , Site[i] , 0 )
--				Say( NPC[i] , "Site ="..Site[i] )
				DelObj( NPC[i] )
			end
		end
		sleep(10)
	end
end
----------�{�֮笣----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_juice_Spell( CheckPlayer )

	local NPC = OwnerID()
	local Motion = { 101 , 105 , 112 } --�`������.��.����
	local String = { 9 , 10 , 11 } --���S�H�ܡA�n����K   ��򳣨S���H�O�H.  �O���O���ʤӧx���F�H

	if #CheckPlayer > 0 then --���H����
		while #CheckPlayer > 0  do
			local NewArray = {}
			local Reg = ReadRoleValue( NPC , EM_RoleValue_Register+1 )
--			DebugMsg( 0 , 0 , "Reg ="..Reg )
			if Reg == 1 then
				for i , player in pairs(CheckPlayer) do
					if CheckBuff( player , 620791 ) == true then --���{���I��buff
						table.insert( NewArray, Player )
--						Say( NPC , "NewArray = "..Player )
					end
				end

				if #NewArray > 0 then --table.getn(NewArray) > 0
					CheckPlayer = NewArray
				else
					return
				end

				local Sec = math.ceil((5/#NewArray)*10) --�X����

				if Sec >= 7 then
					Sleep(Sec) --((5/3)*10)���X�� --�L����i��(���]CheckPlayer��3�H�A�h��2��)
				else
					Sleep(7)
				end

				local Target = NewArray[DW_Rand(#NewArray)] --1. �YDW_Rand(3) = rand1~3  2.���BCheckPlayer table���|�P�W�qfunction�P�B�ܰ�
				local X = ReadRoleValue( Target , EM_RoleValue_X )+math.random(-40 , 40 )
				local Y = ReadRoleValue( Target , EM_RoleValue_Y )
				local Z = ReadRoleValue( Target , EM_RoleValue_Z )+math.random(-40 , 40 )

				CastSpellPos( NPC , X , Y , Z , 498468 , 0 ) --�k�N���X.�{��
			else
				return
			end
		end
	else
		local Random = DW_Rand(3) --1~3
		
		Say( NPC , "[SC_THANKS_2011_"..String[Random].."]" )
		PlayMotion( NPC , Motion[Random] )
	end
end
-----------�Q�{��--------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_juice_beerbox_broken()

--	local NPC = OwnerID()
	local Player =  TargetID()
	local BuffLV = FN_CountBuffLevel( Player , 620791 ) --�P�_���a���W���{���I�Ʀ��h�� --0���C������1
	local Random = DW_Rand(100) --1~100

	if CheckBuff( Player , 620791 ) ==true then --���{���I��buff
		if Random <= 30 then --30%
			if BuffLV <= 1 then -- �C��������1��2
				CancelBuff( Player , 620791 ) --�R���{���I��
			else				
				AddBuff( Player , 621079 , 0 , 3 ) --�{�פ���
				CancelBuff( Player , 620791 ) --�R���{���I��
				AddBuff( Player , 620791 , BuffLV-2 , -1 ) 
			end
		elseif Random > 30 and Random <= 70 then --40%
			if BuffLV <= 0 then -- �C��������1
				CancelBuff( Player , 620791 ) --�R���{���I��
			else				
				AddBuff( Player , 621070 , 0 , 3 ) --�w�C�e�i
				CancelBuff( Player , 620791 ) --�R���{���I��
				AddBuff( Player , 620791 , BuffLV-1 , -1 ) 
			end
 		else --30%
			if BuffLV <= 0 then -- �C��������1
				CancelBuff( Player , 620791 ) --�R���{���I��
			else				
				AddBuff( Player , 621071 , 0 , 3 ) --�����w��
				CancelBuff( Player , 620791 ) --�R���{���I��
				AddBuff( Player , 620791 , BuffLV-1 , -1 ) 
			end
		end
	end
end
----------�إߥᬣNPC------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_juice_creatnpc( NPCID , Site )

	local OrgID = CreateObjByFlag( NPCID , 781033 , Site , 1 ) --�ѷӫ��w�X�l����m�Ӳ��ͪ���(NPC�s���B�X�l�N���B�ĴX���X�l�B����ƶq )

	SetModeEx( OrgID , EM_SetModeType_Mark , false ) --����ܼаO
	SetModeEx( OrgID , EM_SetModeType_SearchenemyIgnore , false ) --���i�Q�j�M
	AddToPartition( OrgID , 0 )
	WriteRoleValue( OrgID , EM_RoleValue_Register+1 , 1 ) --�NNPC�� EM_RoleValue_Register+1�g�J1
	MoveToFlagEnabled( OrgID , false ) --�������޼@��
	CallPlot( OrgID, "LuaFunc_MoveToFlag", OrgID , 781033 , Site+6 , 0 )
	return OrgID
end
----------���ѻP���a------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_juice_inplayer( CheckPlayer )

	local BOX = OwnerID()
	local Newplayer ={}

	for i , player in pairs(CheckPlayer) do
		if CheckBuff( player , 620791 ) then --���{���I��buff
			local Dis = GetDistance( BOX , player ) 
			if Dis < 115 then --�c�l�P���a�Z��<115
				AddBuff( player, 621082 , 0 , 3 ) --�[�ˬd_�{��BUFF
				if Dis > 85 then --�c�l�P���a�Z�� >85
					ScriptMessage( player , player , 1 , "[SC_THANKS_2011_6]" , 0 ) --"�A�֭n�W�X����]�k�}�~�I"
				end
			end
			table.insert( Newplayer , Player )
		end
	end
	return Newplayer --�N�^Lua_ying_juice_gamebegin
end
----------�ˬd_�{��BUFF --�R���{���I��buff-----------------------------------------------------------------------------------------------------------------------------
function Lua_ying_juice_del620791()

	local Player = OwnerID()
	local Random = DW_Rand(3) --1~3
	local Gift = {}
	Gift[1] = 206590
	Gift[2] = 206591
	Gift[3] = 206592	

	CancelBuff( Player , 620791 )
	ScriptMessage( Player , Player , 1 , "[SC_THANKS_2011_7]" , C_SYSTEM ) --���ʥ��ѡI
	ScriptMessage( Player , Player , 0 , "[SC_THANKS_2011_7]" , C_SYSTEM ) --���ʥ��ѡI
	GiveBodyItem( Player , Gift[Random] , 1 )
	GiveBodyItem( Player , 240373 , 1 ) --�����Ĥ�
end
----------�إ��]�k�}---------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_juice_magic()

	local Obj = Role:new( OwnerID() ) --�b"�������Ϊ���"���m�A�إ߷s��NPC
	local BaseX = Obj :X() --���Ϊ���X�b
	local BaseY = Obj :Y() --���Ϊ���Y�b
	local BaseZ = Obj :Z() --���Ϊ���Z�b
	local BaseDir = Obj:Dir() --���Ϊ��󪺭��V
	local Magic

	Magic = CreateObj( 118358 , BaseX , BaseY , BaseZ , BaseDir , 1 ) --�إ�"�]�k�}"
	SetModeEx( Magic , EM_SetModeType_SearchenemyIgnore , false ) --���Q�j�M
	SetModeEx( Magic , EM_SetModeType_Obstruct , false ) --������
	SetModeEx( Magic , EM_SetModeType_Mark , false ) --���аO
	SetModeEx( Magic , EM_SetModeType_Move , false ) --������
	SetModeEx( Magic , EM_SetModeType_HideName , false ) --����ܦW��
	SetModeEx( Magic , EM_SetModeType_ShowRoleHead , false ) --������Y����
	AddToPartition( Magic , 0 ) --�ϫإߥX�Ӫ��]�k�}�X�{
end
-----------�R���]�k�}----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_juice_clearmagic()

	local Magic = LuaFunc_SearchNPCbyOrgID( OwnerID() , 118358 , 50 , 0 ) --�H���ê���119223�����ߡA�V�P��50�X�j�M�]�k�}118358

	DelObj( Magic )
end
-----------NPC�S���K��(113754)��ܼ@��---------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_juice_113754talk()

	local Player = OwnerID()
	local NPC = TargetID()
	local PID = ReadRoleValue ( NPC , EM_RoleValue_PID )

	AdjustFaceDir( NPC , Player , 0 ) --NPC���V���a
	if PID == 0 then --���ʥ��}�l
		LoadQuestOption( Player )
	elseif PID == 1 then --���W
		LoadQuestOption( Player )
		AddSpeakOption( Player , NPC , "[SC_111576_YU_03]" , "Lua_ying_juice_sign" , 0 ) --"�ڭn���W�I"�ﶵ
	else --���ʶ}�l
		SetSpeakDetail( Player , "[SC_THANKS_2011_3]" ) --�w�y���@�`���u�ɱ��{���a��v���ʥ����x�i�椤�A������ѥ[�ܡH�����٥��ѻP�L���B�͡A�O�o�b���ʶ}�l�e10�����ӧ�ڳ��W�ѥ[���
	end
	AddSpeakOption( Player , NPC , "[SC_THANKS_2011_2]" , "Lua_ying_juice_game" , 0 ) --����u�ɱ��{���a��v�ﶵ
	AddSpeakOption( Player , NPC , "[SC_THANKSGIVING_04]" , "Lua_Hao_thanksday_about1", 0 ) ---�ڷQ���D���@�`���Ѩ�
end
-----------����u�ɱ��{���a��v----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_juice_game()

	local Player = OwnerID()

	SetSpeakDetail( Player , "[SC_THANKS_2011_8]" ) --���F�y�P���@�`�����{�A�����Űӷ|��C�Ѫ�12�I30���B15�I30���B18�I30����21�I30���|�Ӯɬq�A�S�O�b���|��F�w�y���@�`�����ʡC
end
-----------�ڭn���W�I------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_juice_sign()

	local Player = OwnerID()
	local BUFF = CheckBuff( Player , 509865 ) --�w���WBUFF
	local Key = CheckFlag( Player , 545689 ) --�w���Wkey

	if Key  then
		if BUFF  then 
			SetSpeakDetail( Player , "[SC_THANKS_2011_4]" ) --�A�w�g���W�����F�I30�����ɭԬ��ʴN�|�}�l�A���ֶi�J����]�k�}���A�p�ߤ��n���L�ɶ��o��
		else
			SetSpeakDetail( Player , "[SC_THANKS_2011_5]" ) --�A���Ѥw�g���W�ѻP�L�������o�A�Щ��ѦA�~����W�a�C
		end
	else
		ScriptMessage( Player , Player , 1 , "[SC_WEAVE_2011_06]" , C_SYSTEM ) --�A�����W�w�g�ӽЧ����I
		ScriptMessage( Player , Player , 0 , "[SC_WEAVE_2011_06]" , C_SYSTEM ) --�A�����W�w�g�ӽЧ����I
		AddBuff( Player , 509865 , 0 , 900 ) --�������WBUFF
		SetFlag( Player , 545689 , 1 ) --�������Wkey
		CloseSpeak( Player )
	end
end
-----------���ի��O---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_juice_test_clear() --��ʧR���]�k�}

	local Modelnpc = { 119568 , 119571 , 119569 , 119572 , 119570 , 119593 , 118358 , 103007 , 119648 }

	for i = 1 , table.getn(Modelnpc) , 1 do
		Lua_Hao_NPCofAll_Clear( Modelnpc[i] , 300 )
	end
end

function Lua_ying_test_620791add(BuffLV)

	CancelBuff( OwnerID() , 620791 )
	AddBuff( OwnerID() , 620791 , BuffLV-1 , -1 )
end
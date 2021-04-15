function Lua_Hao_Taiwan_Frog_Clock() -- �ɶ��ŧi

	Hao_Frog_Hour = 0	-- ��
	Hao_Frog_Min = 0	-- ��
	local Step = 0
	local Hour = GetSystime(1)
	local Min = GetSystime(2)
	local BronID = 100292 --���ͩǪ�ID
	local Flag = 780321 --�C����l�X�l�s��
	local Monster = 0

	while true do -- �ɶ��B�z
		Hour = GetSystime(1)
		Min = GetSystime(2)

		if Hao_Frog_Hour ~= nil and Hao_Frog_Min ~= nil then

			if Hao_Frog_Hour == 0 and Hao_Frog_Min == 0 then
				--
			else
				Hour = GetSystime(1) + Hao_Frog_Hour
				Min = GetSystime(2) + Hao_Frog_Min

				if Hour >23 then
					Hour = Hour - 24
				end

				if Min > 59 then
					Min = Min - 60
				end
			end
		end
		--Say(OwnerID(), "hour = "..hour.."min = "..min )
		--Say(OwnerID(), Step )
		if Step ~= Hour then
		--	if CheckID(Monster) == true then
		--		DelObj(Monster)
		--	end
			local X = rand(10) -- 0 ~ 9
		--	Say(OwnerID() , "X="..X )
		--	Say(OwnerID() , "Step="..Step )
			if X >= 5 then -- 5 ~ 9
				Monster = CreateObjByFlag( BronID, Flag , rand((GetMoveFlagCount(Flag)-1)) , 1 )
				--( ObjID �ҪO�N�� , FlagObjID �ѷӪ��X�l�N�� , FlagID �ѷӪ��X�l�s�X , count ���󪺼ƶq )
				-- GetMoveFlagCount(xxxxx) ���o FlagGroup �X�l�s�սs��
				SetModeEx( Monster , EM_SetModeType_Fight , false )--�i�������
				SetModeEx( Monster , EM_SetModeType_Strikback, false )--����
				SetModeEx( Monster , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
				SetModeEx( Monster , EM_SetModeType_Obstruct, false )--����
				SetModeEx( Monster , EM_SetModeType_Gravity, false )--���O
				SetModeEx( Monster , EM_SetModeType_Move, false )--����
				SetModeEx( Monster , EM_SetModeType_ShowRoleHead, false )--�Y����
				SetModeEx( Monster , EM_SetModeType_Searchenemy, false )--����
				SetModeEx( Monster , EM_SetModeType_Show , false ) --�����
				SetModeEx( Monster , EM_SetModeType_Mark, false )--�аO
				AddToPartition( Monster , 0 )
				BeginPlot( Monster , "Lua_Hao_Taiwan_Frog_Act", 0 )
			end
			Step = Hour
		--	Say(OwnerID() , "Hour="..Step )
		end
		sleep(100)
	end
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Taiwan_Frog_CheckTime() -- �d�ߥثe�e�i�F�h�[���ɶ�
	Say(OwnerID() , Hao_Frog_Hour )
	Say(OwnerID() , Hao_Frog_Min )
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Taiwan_Frog_Gobackto0() -- �N�e�i���ɶ� �p�ɻP�� �k�s
	Hao_Frog_Hour = 0
	Hao_Frog_Min = 0
end
-------------------------------------------------------------------------------------------------------------------
--? pcall Lua_Hao_Taiwan_Frog_SetHour(hour) �u ( ) �v ����hour �N��A�Q�n�e�i���p�ɼƶq  �d��u��O0~23 �ó]���H��G�ۭt...
function Lua_Hao_Taiwan_Frog_SetHour(hour)

	if hour >= 48 then

	else
		if hour >= 24 then
			Hao_Frog_Hour = hour - 24
		else
			Hao_Frog_Hour = hour
		end
	end
end
-------------------------------------------------------------------------------------------------------------------
--? pcall Lua_Hao_Taiwan_Frog_SetMin(min) �u ( ) �v ����min �N��A�Q�n�e�i�������ƶq  �d��u��O0~59 �ó]���H��G�ۭt...
function Lua_Hao_Taiwan_Frog_SetMin(min)

	if min >= 120 then

	else
		if min >= 60 then
			Hao_Frog_Min = min - 60
		else
			Hao_Frog_Min = min
		end
	end
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Taiwan_Frog_Act() -- ���b��������W���_�l�@��

	--	Say( OwnerID() , "1" )	-- �L
	--	Say( TargetID() , "2" )	-- �C��p�ɪ���

	BeginPlot( OwnerID() , "Lua_Hao_Taiwan_Frog_End" , 0 ) -- ���b���Ϊ���W�������@��

	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) 
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 ) -- �P�_���y

--	if ZoneID <= 999 then
		if Zone == 1 then
			RunningMsg( OwnerID() , 2 , "[SC_TAIWAN_FROG_06]" ) -- �z�s�s�S���Y�B�X�{�F�@�s�o�J���C��
		elseif Zone == 2 then
			RunningMsg( OwnerID() , 2 , "[SC_TAIWAN_FROG_07]" ) -- �ȴ餧�����Y�B�X�{�F�@�s�o�J���C��
		elseif Zone == 6 then
			RunningMsg( OwnerID() , 2 , "[SC_TAIWAN_FROG_08]" ) -- �Я�l�����Y�B�X�{�F�@�s�o�J���C��
		elseif Zone == 8 then
			RunningMsg( OwnerID() , 2 , "[SC_TAIWAN_FROG_09]" ) -- ��ͤ��a���Y�B�X�{�F�@�s�o�J���C��
		elseif Zone == 49 then
			RunningMsg( OwnerID() , 1 , "Test Msg : Zone49 Frog Begin ... KERO KERO KERO" ) -- �@�s�o�J���C��X�{�b49�ϡAKERO�P�H�өԡI
		end
--	end

	local Frogfreak  = {}

	if FrogDeadCount == nil then
		FrogDeadCount = {}
	end
	
	FrogDeadCount[Zone] = 0
--	Frogfreak = Lua_Davis_BornByMultilateral( 103960 , 10 , 50 )	-- ����B�䫬�ƶq�B�b�|

	local Obj = Role:new( OwnerID() )
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj :Dir()
	local MonsterGroup = {}
	local MonsterID = 103960 -- �C��
	local X = 10 -- �X�䫬
	local dis = 50 -- �Z����ߪ��Z��

	for i = 1 , X do
		MonsterGroup[i] =CreateObj( MonsterID , BaseX-dis*math.cos(math.pi*2*(i/X)),BaseY,BaseZ+dis*math.sin(math.pi*2*(i/X)),BaseDir, 1 )
	end
	for i = 1, table.getn(MonsterGroup) do
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Revive , true )--�i����
		AddToPartition( MonsterGroup[i] , RoomID )
		SetAttack( MonsterGroup[i] , TargetID() )
		SetRandMove( MonsterGroup[i] , 50 , 20 , 25 ) -- ID�B�Z���B�üƲ��ʶ��j���ɶ� 10��1��B�̤j���ʶZ��
	end
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Taiwan_Frog_End() -- ���b��������W�������@��

	Sleep(18000) -- ���ʫ���30����

	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) 
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 ) -- �P�_���y
	local Count = SetSearchAllNPC(RoomID) -- �j���ϰ줺���Ҧ�NPC �A�^�ǭȬ���ƶq
	local Obj

	if Zone == 1 or Zone == 2 or Zone == 6 or Zone == 8 or Zone == 49 then -- �屼�����y���C��
		for i = 1 , Count , 1 do
			local ID = GetSearchResult() -- �^�ǰ��� SetSearchAllNPC ��ҷj�M�쪺�Ҧ�����
			Obj = Role:New( ID ) -- ���P�� ReadRoleValue( ID() , EM_RoleValue_OrgID )	Org = ��Ʈw����ID
			if Obj:IsNPC() == true then --IsNPC = �O���Onpc
				local MustDel = ReadRoleValue( ID , EM_RoleValue_OrgID )
				if MustDel == 103960 or MustDel == 103961 then
					DelObj( ID )
				--	DelObj( OwnerID() )
				end 
			end
		end 
	end

--	if ZoneID <= 999 then -- ��UZone���Ĥ@���y�s��
		if Zone == 1 then
			RunningMsg( OwnerID() , 2 , "[SC_TAIWAN_FROG_10]" ) -- ����z�s�s�S�Y�B���C��̦ܧO�B�o�J�F
		elseif Zone == 2 then
			RunningMsg( OwnerID() , 2 , "[SC_TAIWAN_FROG_11]" ) -- ���ȴ餧���Y�B���C��̦ܧO�B�o�J�F
		elseif Zone == 6 then
			RunningMsg( OwnerID() , 2 , "[SC_TAIWAN_FROG_12]" ) -- ���Я�l���Y�B���C��̦ܧO�B�o�J�F
		elseif Zone == 8 then
			RunningMsg( OwnerID() , 2 , "[SC_TAIWAN_FROG_13]" ) -- ����ͤ��a�Y�B���C��̦ܧO�B�o�J�F
		elseif Zone == 49 then
			RunningMsg( OwnerID() , 1 , "Test Msg : Zone49 Frog End...KERO KERO KERO" ) -- 49�Ϫ�KERO�P�H�̰����{�ԡIKERO�BKERO�C
		end

	Beginplot( OwnerID() , "Lua_Hao_Taiwan_Frog_End_02" , 0 )

end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Taiwan_Frog_End_02() -- ���b��������W�������@��

	DelObj( OwnerID() )

end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_CheckCount()	-- �Ǫ����۳�@��

	-- Zone 1	�z�s�s�S
	-- Zone 2	�ȴ餧��
	-- Zone 6	�Я�l��
	-- Zone 8	��ͤ��a

	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) 
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 ) -- �P�_���y
	local Count = SetSearchAllNPC(RoomID) -- �j���ϰ줺���Ҧ�NPC �A�^�ǭȬ���ƶq
	local Obj
	local Amount = 0 -- 103960 ���ƶq
	local Monster

	if Zone == 1 or Zone == 2 or Zone == 6 or Zone == 8 or Zone == 49 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult() -- �^�ǰ��� SetSearchAllNPC ��ҷj�M�쪺�Ҧ�����
			Obj = Role:New( ID ) -- ���P�� ReadRoleValue( ID() , EM_RoleValue_OrgID )	Org = ��Ʈw����ID
			if Obj:IsNPC() == true then --IsNPC = �O���Onpc
				if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 103960 then
					Amount = Amount + 1
				--	Say( ID , Amount ) -- ���X�C���`�ƶq
				end 
			end
		end 
		local A = Amount
		if A <= 25 then	-- �p�G103960�Ǫ��`�ƶq�p��25�A�h�üƭ���1~3���C
			local Obj = Role:new( OwnerID() ) 
			local BaseX = Obj : X()
			local BaseY = Obj : Y()
			local BaseZ = Obj : Z()
			local BaseDir = Obj : Dir()
			local BaseRoom = Obj : RoomID()
			local NewObjGUID = nil
			local Random = Rand(2)+1

			for i = 1 , Random , 1 do
				NewObjGUID = CreateObj( 103960 , BaseX , BaseY , BaseZ , BaseDir , 1 )		
				SetModeEx( NewObjGUID , EM_SetModeType_Revive , false )--���i����
				AddToPartition( NewObjGUID , RoomID )
				SetAttack( NewObjGUID , TargetID() )
		--		SetPlot( NewObjGUID , "dead" , "Lua_Hao_Taiwan_Frog_Act_01" , 0 )
		--		Say( NewObjGUID , Random )
			end

		--	Monster = Createobjbyobj( 103960 , OwnerID() , Random )
		--	SetPlot( Monster , "dead" , "Lua_Hao_Taiwan_Frog_Act_01" , 0 )
		--	Say( Monster , Random)
		else
		--	Say( TargetID() , "too much" )
			return false
		end
	end
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Taiwan_Frog_MCount()	-- �Ǫ������`�@��

	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) 
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 ) -- �P�_���y

	if FrogDeadCount == nil then
		FrogDeadCount = {}
	end

	FrogDeadCount[Zone] = FrogDeadCount[Zone] + 1

	local Count = FrogDeadCount[Zone]

	if Count >= 10 then
			Boss = Createobjbyobj( 103961 , OwnerID() , 1  )
			AddToPartition( Boss , RoomID )
			SetAttack( Boss , TargetID() )
			FrogDeadCount[Zone] = 0	-- �N���`���ƲM��
		--	Say( TargetID() , Count )	-- ���a���X���`����

	elseif Count < 10 then
		--	Say( TargetID() , Count )	-- ���a���X���`����
	end
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Taiwan_Frog_SayCount() -- ���X�����W���`���Ǫ��ƶq - �C�W�L10���k�s

	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) 
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 ) -- �P�_���y

	local Count = FrogDeadCount[Zone]

	Say( OwnerID() , Count )

end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Taiwan_Frog_TCount()	-- ���ճ��W���Ǫ��ƶq

	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) 
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 ) -- �P�_���y

	if FrogDeadCount == nil then
		FrogDeadCount = {}
	end
	FrogDeadCount[Zone] = FrogDeadCount[Zone] + 1
	local Count = FrogDeadCount[Zone]
	Say( TargetID() , Count )	-- ���a���X���`����
end
-------------------------------------------------------------------------------------------------------------------
function LuaI_207258()	--�������a���@��
	ClearBorder( OwnerID())	--��l�ƥ۸O����
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	AddBorderPage( OwnerID(), GetQuestDetail( 423080 , 1  ) )
	ShowBorder( OwnerID() , 423080 ,str ,"ScriptBorder_Texture_Paper" )

end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_GiveNameTITLE()	-- �����ٸ�

	local Title01 = 530493		-- �����C��n�٦� ( ��������2��
	local Title02 = 530494		-- �C����l�S��� ( ��������4��
	local Title03 = 530495		-- ���Ѩ��c�C��Ұ� ( ��������6��

	local Day = ReadRoleValue( TargetID() ,  EM_LuaValueFlag_UseItem8 )

	PlayMotion( OwnerID() , 251 )	-- ��§
	AdjustFaceDir( OwnerID() , TargetID() , 0 ) --���V

	if Day == 0 then	-- ��1��
		WriteRoleValue( TargetID() , EM_LuaValueFlag_UseItem8  , 1 )
	elseif Day == 1 then	-- ��2��
		WriteRoleValue( TargetID() , EM_LuaValueFlag_UseItem8  , 2 )
		GiveBodyItem( TargetID() , Title01 , 1 )  --���ٸ�  �����C��n�٦�
	elseif Day == 2 then	-- ��3��
		WriteRoleValue( TargetID() , EM_LuaValueFlag_UseItem8  , 3 )
	elseif Day == 3 then	-- ��4��
		WriteRoleValue( TargetID() , EM_LuaValueFlag_UseItem8  , 4 )  
		GiveBodyItem( TargetID() , Title02 , 1 )  --���ٸ�  �C����l�S���
	elseif Day == 4 then	-- ��5��
		WriteRoleValue( TargetID() , EM_LuaValueFlag_UseItem8  , 5 )
	elseif Day == 5 then	-- ��6��
		WriteRoleValue( TargetID() , EM_LuaValueFlag_UseItem8  , 6 )
		GiveBodyItem( TargetID() , Title03 , 1 )  --���ٸ�  ���Ѩ��c�C��Ұ�
	end
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_ResetNameTITLE()	-- �M���ٸ�&�NUseItem8���k�s

	local Title01 = 530493		-- �����C��n�٦� ( ��������2��
	local Title02 = 530494		-- �C����l�S��� ( ��������4��
	local Title03 = 530495		-- ���Ѩ��c�C��Ұ� ( ��������6��

	DelBodyItem( OwnerID() , Title01 , 1 )  --���ٸ�  �����C��n�٦�
	DelBodyItem( OwnerID() , Title02 , 1 )  --���ٸ�  �C����l�S���
	DelBodyItem( OwnerID() , Title03 , 1 )  --���ٸ�  ���Ѩ��c�C��Ұ�
	WriteRoleValue( TargetID() , EM_LuaValueFlag_UseItem8  , 0 )
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Taiwan_Frog_NPC_Begin() -- NPC��l�@��

--	Say( OwnerID() , "1" ) -- ���a
--	Say( TargetID() , "2" ) -- NPC

	BeginPlot( TargetID() , "Lua_Hao_Taiwan_Frog_NPC_Range" , 0 ) -- �Z���W�L50�Y������ܵ���
--	PlayMotion( TargetID() , 116 ) -- �A��
--	PlayMotion( TargetID() , 107 ) -- �n�⻡��
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --���V
--	SetSpeakDetail( OwnerID() , "[SC_TAIWAN_FROG_00]" ) -- �]���۵��R�A�����֤k���K�۬ܧC�n���_�A�o�ݰ_�ӫD�`���ˤߡA�]�\�A�Ӹ߰ݦo������ߨơH�^
	AddSpeakOption(  OwnerID() , TargetID( ) , "[SC_TAIWAN_FROG_01]" ,  "Lua_Hao_Taiwan_Frog_NPC_Begin_02",  0 ) -- �аݡA�p������ߨƶܡH
	PlayMotion( TargetID() , 105 ) -- ���_
	LoadQuestOption( OwnerID() )  --���J���ȼҪO
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Taiwan_Frog_NPC_Begin_02() -- NPC��l�@��

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --���V
	PlayMotion( TargetID() , 112 ) -- ����
	SetSpeakDetail( OwnerID() , "[SC_TAIWAN_FROG_02]" ) -- �X�ѫe���@�Ӭ��n����...
	AddSpeakOption(  OwnerID() , TargetID( ) , "[SC_TAIWAN_FROG_03]" ,  "Lua_Hao_Taiwan_Frog_NPC_Begin_03",  0 ) -- �O��ߡA�ڤ@�w�|���U�p���C
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Taiwan_Frog_NPC_Begin_03() -- NPC��l�@��

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --���V
	PlayMotion( TargetID() , 106 ) -- ���U
	CloseSpeak( OwnerID() )
	ScriptMessage( OwnerID() , OwnerID() , 1 ,"[SC_TAIWAN_FROG_04]", C_SYSTEM)  -- �h�`�N�P�䪺�����A��A�γ\�������U�C
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Taiwan_Frog_NPC_Range() -- �Z���W�L50�Y������ܵ���

--	say(OwnerID() , "3" ) --NPC
--	say(TargetID() , "4" ) --���a

	while true do
		if GetDistance( OwnerID() , TargetID() )  >= 50 then
			CloseSpeak( TargetID() )
			AdjustFaceDir( OwnerID(), TargetID() , 0 ) -- ���V
			PlayMotion( OwnerID() , 116 ) -- �A��
		--	if CountBodyItem( TargetID() , 207258 ) >= 1 then
		--		tell( TargetID() , OwnerID() ,"[SC_TAIWAN_FROG_05]" ) --�@...�A���W�����a�A���n���ڳQ�C��m�����������a�O�H
		--	end
			break
		end
		sleep(5)
	end
end

-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Taiwan_Frog_Make_BOX() -- �G�m�UZone�@�����l

	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )

	local Obj = Role:new( OwnerID() )
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj :Dir()
	local Monster
	local MonsterID = 114998 -- ���μ@������

	Monster = CreateObj( MonsterID , BaseX , BaseY , BaseZ , BaseDir , 1 )	

	SetModeEx( Monster , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Monster , EM_SetModeType_Strikback , false )--����
	SetModeEx( Monster , EM_SetModeType_SearchenemyIgnore , false )--�Q�j�M
	SetModeEx( Monster , EM_SetModeType_Obstruct , false )--����
	SetModeEx( Monster , EM_SetModeType_Gravity , false )--���O
	SetModeEx( Monster , EM_SetModeType_Move , false )--����
	SetModeEx( Monster , EM_SetModeType_ShowRoleHead , false )--�Y����
	SetModeEx( Monster , EM_SetModeType_Searchenemy , false )--����
	SetModeEx( Monster , EM_SetModeType_Show , true ) --�����
	SetModeEx( Monster , EM_SetModeType_Mark , false )--�аO
	AddToPartition( Monster , RoomID) -- �إߪ���

	Beginplot( Monster , "Lua_Hao_Taiwan_Frog_Clock" , 0 )
	
end
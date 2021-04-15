function Lua_120992_00()	--�~�Ϫ�������
	local Owner = OwnerID()
	local Target = TargetID()
	local PlayerLv = ReadRoleValue( Owner , EM_RoleValue_LV) --Ū�����a�D¾���šA����50(�t)�H�W�A�C�^�X����5�ӥ����Ŷꨩ
	local Daily = 548115 --���ʨC��
	local Reward = 548116 --�������
	local ScoreBase = ReadRoleValue( Owner , EM_LuaValueFlag_UseItem40)
	local Round = math.floor(ScoreBase / 1000)  --���a�F�����^�X
	local Score = ScoreBase%1000  -- ���l�ơA�������諸����
	AdjustFaceDir( Target, Owner , 0) 
	if CountBodyItem( Owner , 530968 ) >= 1 then
		AddSpeakOption( Owner , Owner, "[SC_120992_GACHA]", "Lua_FindMistake_GACHA" , 0 ) --�ڷQ�I���a����J
	end

	if CheckFlag( Owner, Daily ) == true and ScoreBase ~= 0 then --�w�g�������ȡA�|��������y
		if Score == 0 then
			SetSpeakDetail( Owner , "[SC_120993_09][$SETVAR2="..Score.."]" )
			GiveBodyItem( Owner , 724266 , 1 )
		else
			SetSpeakDetail( Owner , "[SC_120993_07][$SETVAR1="..Round.."][$SETVAR2="..Score.."]" )
			Lua_FindMistake_Reward(Owner, Round ,Score)
		end
			SetFlag( Owner , Reward , 1 ) --�����w�g������X��
			WriteRoleValue( Owner , EM_LuaValueFlag_UseItem40 , 0 ) --�N���ƭ��m

	elseif CheckFlag( Owner, Daily ) == true and CheckFlag( Owner, Reward ) == true then	
		SetSpeakDetail( Owner, "[SC_120993_08]" )

	elseif ScoreBase ~= 0 then
		if Score == 0 then
			SetSpeakDetail( Owner , "[SC_120993_09][$SETVAR2="..Score.."]" )
			GiveBodyItem( Owner , 724266 , 1 )
		else
			SetSpeakDetail( Owner , "[SC_120993_07][$SETVAR1="..Round.."][$SETVAR2="..Score.."]" )
			Lua_FindMistake_Reward(Owner, Round ,Score)	
		end
		WriteRoleValue( Owner , EM_LuaValueFlag_UseItem40 , 0 ) --�N���ƭ��m

	else
		SetSpeakDetail( Owner , "[SC_120992_OUT]" )	--[$playername]�A�w��Ө�ڪ��_�۫ΡI�b�o�̡A�ڷQ�V�A���[��O�P�O�ФO���X�D�ԡC�A�O�_�@�N�����ڪ�����O�H
		AddSpeakOption( Owner, Owner , "[SC_120992_YES]" , "Lua_FindMistake_Trans" , 0 )		--�ڤw�g�ǳƦn�����D�ԤF�I
		AddSpeakOption( Owner, Owner , "[SO_110378_4]" , "Lua_FindMistake_SpeakClose" , 0 )	--�ڦA�Ҽ{�ݬ�
	end
end

function Lua_FindMistake_Reward(Owner, Round ,Score)
	local PlayerLv = ReadRoleValue( Owner, EM_RoleValue_LV)
--	local RList = {	[1] = 726834 , [2] = 726135 , [3] = 204555, 
		--	[4]= 726944 , [5] = 205817	} --1.���|�귽 / 2. ���|�u��c�t�� / 3.�]�k�־������] / 4. �S����s�y���� / 5.���A�̪��ԧQ�~
	if PlayerLv >= 50 and  Round > 3 then --�ˬd�O�_���������Ŷꨩ	�ĤT�^�X����~����
		local Monetary = Round*5
		Hao_Monetary_Union_240181(Owner , Monetary)
	--	GiveBodyItem( Owner , 201014 , 1 ) --�j�v�U��ײz��
	--	GiveBodyItem( Owner , 203487 , 1 ) --�]���_����q1�I
	end

	if Score >= 200 then --���ٸ� 
		GiveBodyItem( Owner , 530966, 1 ) --�N��Ʀ��ǧڤ]�{�o�I
		GiveBodyItem( Owner , 530965, 1 ) --�G�������j����
	elseif Score >= 40 then
		GiveBodyItem( Owner , 530965, 1 ) --�G�������j����
	end

	if Round == 9 then
		GiveBodyItem( Owner , 726944 , 1 ) --�S��s�y���� 726944
		GiveBodyItem( Owner , 205817 , 1 ) --���A�̪��ԧQ�~ 205817
		GiveBodyItem( Owner, 242757 , 3 ) -- �m������] 2
	elseif Round == 8 then
		GiveBodyItem( Owner , 726944 , 1 ) --�S��s�y���� 726944
		GiveBodyItem( Owner , 726135 , 1 )--���|�u��c�t�� 726135 
		GiveBodyItem( Owner, 242756 , 3 ) -- �z�������] 3
	elseif Round == 7 then
		GiveBodyItem( Owner , 205817 , 1 ) --���A�̪��ԧQ�~ 205817
		GiveBodyItem( Owner, 242757 , 2 ) -- �m������] 2
	elseif Round == 6 then
		GiveBodyItem( Owner, 204555 , 1 ) --�]�k�־������]204555
		GiveBodyItem( Owner , 726834, 1 ) --���|�귽 726834
		GiveBodyItem( Owner, 242756 , 2 ) --�z�������] 2
	elseif  Round == 5 then
		GiveBodyItem( Owner, 204555 , 1 ) --�]�k�־������]204555
		GiveBodyItem( Owner, 242757 , 1 ) --�m������] 1
	elseif Round >= 4 then
		GiveBodyItem( Owner , 726135, 1 ) --���|�u��c�t�� 726135
		GiveBodyItem( Owner, 242756 , 1 ) --�z�������] 1	
	elseif Round == 3 then
		GiveBodyItem( Owner , 726135 , 1 ) --���|�u��c�t�� 726135
	elseif Round <= 2 then
		GiveBodyItem( Owner , 726834, 1 )
	end
end


function Lua_FindMistake_GACHA() --�I����J
	local Owner = OwnerID()
	SetSpeakDetail( Owner , "[SC_120992_GACHA1]" )
	AddSpeakOption(Owner , Owner ,"[SC_120992_GACHA2]" , "Lua_FindMistake_Reward1(1)" , 0 )
	AddSpeakOption(Owner , Owner ,"[SC_120992_GACHA3]" , "Lua_FindMistake_Reward1(2)", 0 )
end


function Lua_FindMistake_Reward1(TYPE)
	local Owner = OwnerID()
	if Type == 1 then
		if CountBodyItem( Owner , 242756) >= 30 then
			SetSpeakDetail( Owner , "[SC_120992_GACHA5]" )
			DelBodyItem(Owner , 242756, 30 )
			GiveBodyItem( Owner , 242761 , 1 ) --�����@��a����J
			Designlog( Owner , 361 , "Furniture Gacha Exchange" ) 
		else	
			CloseSpeak( Owner)
			ScriptMessage( Owner , Owner , 1 , "[SC_120992_GACHA4]" , 0 )
		end
	elseif Type == 2 then
		if CountBodyItem( Owner , 242757) >= 30 then
			SetSpeakDetail( Owner , "[SC_120992_GACHA5]" )
			DelBodyItem( Owner , 242757, 30)
			GiveBodyItem( Owner , 242762 , 1 ) --�����`�y�a����J
			Designlog( Owner , 361 , "Festival Furniture Gacha Exchange" ) 
		else	
			CloseSpeak( Owner)
			ScriptMessage( Owner , Owner , 1 , "[SC_120992_GACHA4]" , 0 )
		end
	end		
end


function Lua_FindMistake_SpeakClose()
	CloseSpeak( OwnerID() )
end


function Lua_FindMistake_Trans() --�ǰe�ܰƥ���
	local Owner = OwnerID()
	ChangeZone( Owner, 361, -1, 3802, 3013.5, 3760, 270 )
end


function Lua_FindMistake_Enter() --�i�J�ƥ��ᵹ��buff����ϥ�¾�~�ޯ�
	local Owner = OwnerID()
	AddBuff( Owner , 624582 , 0 , -1 )
end





------------------------------------------
--�ƥ����������� ��l�@��
------------------------------------------
function Lua_na_120993_NpcBorn() 
	local Owner = OwnerID()
	local Target = TargetID()
	WriteRoleValue( Owner , EM_RoleValue_Register1 , 1 )--�i��}��
	WriteRoleValue( Owner , EM_RoleValue_Register2  , 0) -- �^�X
	local Reg = ReadRoleValue( Owner , EM_RoleValue_Register1) --���ʶ}��
	local Reg2 = ReadRoleValue( Owner , EM_RoleValue_Register2) --���q
--	DebugMsg( 0,0, "Lylia Reg = "..Reg.." Reg2 = "..Reg2)
end


function Lua_na_120993_speak() --�����ȹ�ܼ@��
	local Owner = OwnerID() --���a
	local Target = TargetID() --NPC
	local Switch = ReadRoleValue( Target , EM_RoleValue_Register1 ) -- Switch
	local R = ReadRoleValue( Target , EM_RoleValue_Register2 ) --����NPC�W���O�����C�����q�A��l��0
	local BuffID = 624295
	local Score = ReadRoleValue( Owner, EM_LuaValueFlag_UseItem40)
--	DebugMsg( 0, 0 , "Switch = "..Switch)
	AdjustFaceDir( Target, Owner , 0) 
	local UIFlag = ReadRoleValue( Owner , EM_LuaValueFlag_UseItem45) 
	if UIFlag == 30 then  --�����ٸ������Ȫ��n�B��
		GiveBodyItem( Owner , 530968 , 1 )
	elseif UIFlag == 100 then  --�����ٸ��W��������
		GiveBodyItem( Owner , 530967 , 1 )
	end

	if Switch == 3 then --�O�Э˼Ƥ��������ȹ��
		SetSpeakDetail( Owner ,"[SC_120993_06]" )	 --�A���O�Цn�F�ܡH�ɶ��i�O�@���@���L�h�o�I	
	elseif CheckBuff( Owner , BuffID ) == true then --�p�G���a���W�٦b�i��C��
		if  R == 9 then --�w�g�����F��
			CancelBuff( Owner , BuffID) -- �R�����ѽw�ĭ�
			SetSpeakDetail( Owner ,"[SC_120993_END1]" )	
			GiveBodyItem( Owner, 530964 , 1 )
			AddSpeakOption( Owner, Target , "[SC_120993_QUIT]" , "Lua_na_FindMistake_QUIT" , 0 ) --���}�_�۫�
		else
			Score = Score%1000
			local BuffLV = FN_CountBuffLevel(Owner, BuffID )
			if BuffLV >= 7 then
				SetSpeakDetail( Owner , "[SC_120993_03][$SETVAR1="..Score.."]") 	
			elseif BuffLV >= 3 then
				SetSpeakDetail( Owner , "[SC_120993_04][$SETVAR1="..Score.."]") 
			elseif BuffLV == 0 then
				SetSpeakDetail( Owner , "[SC_120993_05][$SETVAR1="..Score.."]") 	
			end
		--	DebugMsg( Owner , 0 , BuffLV )
			AddSpeakOption( Owner, Owner , "[SC_120993_OPT1]" , "Lua_na_FindMistakeRule" , 0 )
			AddSpeakOption( Owner, Owner , "[SC_120993_START] ", "Lua_na_FM_begin1" , 0 )
			AddSpeakOption( Owner, Owner , "[SC_120993_LEAVE] ", "Lua_na_FindMistake_Leave" , 0 )
		end	
	else
		if R == 0 then 
		--	WriteRoleValue( Owner , EM_LuaValueFlag_UseItem40 , 0) --�M�Ť���
			SetSpeakDetail( Owner , "[SC_120993_01]") 
			AddSpeakOption( Owner, Owner , "[SC_120993_OPT1]" , "Lua_na_FindMistakeRule" , 0 )
			AddSpeakOption( Owner, Owner , "[SC_120993_START] ", "Lua_na_FM_begin" , 0 )
			AddSpeakOption( Owner, Owner , "[SC_120993_LEAVE] ", "Lua_na_FindMistake_Leave" , 0 )
		elseif  CheckBuff( Owner , BuffID ) == false then --���a�i�D�Ԫ����Ƥw�g�Χ�
			SetSpeakDetail( Owner , "[SC_120993_END]") 	
			AddSpeakOption( Owner, Owner , "[SC_120993_QUIT] ", "Lua_na_FindMistake_QUIT" , 0 )	
		end
	end
end


function Lua_na_FindMistakeRule()
	local Owner = OwnerID()
	SetSpeakDetail( Owner , "[SC_120993_RULE]")	
	AddSpeakOption( Owner, Owner , "[SC_120993_START] ", "Lua_na_FM_begin" , 0 )
end

function Lua_na_FindMistake_Leave() --���}���ʰƥ�
	local Owner = OwnerID()
	local Target = TargetID()
	SetSpeakDetail( Owner , "[SC_120993_LEAVEMES]" ) --���}�ƥ�
	AddSpeakOption( Owner, Target , "[SC_120993_QUIT]" , "Lua_na_FindMistake_QUIT" , 0 ) --���}�_�۫�
	AddSpeakOption( Owner, Target , "[SO_BACK]" , "Lua_na_120993_speak" , 0 ) --�^��W�@��
end


function Lua_na_FindMistake_QUIT()
	local Owner = OwnerID()
	local NPC = SearchRangeNPC( Owner , 50)
	local Lylia = 120993
	for i = 0 , #NPC do
		if ReadRoleValue( Npc[i] , EM_RoleValue_OrgID ) == Lylia then
		--	Say( NPC[i] , " Lylia" )
			WriteRoleValue( NPC[i]  , EM_RoleValue_Register1 , 1 )--�i��}��
			WriteRoleValue( NPC[i]  , EM_RoleValue_Register2 , 0) -- �^�X
			local Reg = ReadRoleValue( NPC[i]  , EM_RoleValue_Register1) --���ʶ}��
			local Reg2 = ReadRoleValue( NPC[i]  , EM_RoleValue_Register2) --���q
			break
		end
	end
--	DebugMsg(0, 0, "LEAVE!" )	
	Sleep(20)
	ChangeZone( Owner, 2, 0 , 4829, 103, -1875, 77.3 )
	
end

function Lua_na_reward_mes()  --�N���a�ǰe�X���ʰƥ���A�ΨӴ��ܼ��y������T��
	local Owner = OwnerID()
	ScriptMessage( Owner , Owner, 3, "[SC_120992_REWARD_MES]" , 0 )  --�лP�����s���������ȹ�ܡA������y�C
end


-----------------------------
--�C������
-------------------------------
function Lua_na_FM_begin() --���ʶ}�l�A���������ťN��
	local Owner = OwnerID() --player
	local Target = TargetID() --NPC
	local BuffID = 624295
	local Lv = ReadRoleValue( OwnerID() , EM_RoleValue_Lv )
	local SubLv = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )
	WriteRoleValue( Owner, EM_RoleValue_Register10 , Target)  --�������ȰO���a
	WriteRoleValue( Target, EM_RoleValue_Register10 , Owner)  --�����a�O�������
	local Switch = ReadRoleValue( Target  , EM_RoleValue_Register1) --NPC���W����
	local R = ReadRoleValue( Target , EM_RoleValue_Register2)
	Designlog( Owner , 361 , "Lv = "..Lv.."  SubLv = "..SubLv.." Game Start" ) 
--	DebugMsg( 0, 0,"R="..R)
	if R == 0 then
		if CountBodyItem( Owner , 203038) >= 30 then
 			ScriptMessage( Owner, Owner , 0 ,"[SC_120992_START]", 0)
			DelBodyItem( Owner , 203038 , 30 )
			SetFlag( Owner , 548115, 1) --���ʧ����C��X��
			AddBuff( Owner , BuffID , 9 , -1) --�[�W�P�_���Ѧ��ƪ�BUFF�A����10�h
			AddBuff( Owner , 624483 , 0, -1 ) --BUFF������A��ܼ��y����T��
			Lua_na_FM_begin1()		
		else
			CloseSpeak( Owner)
 			ScriptMessage( Owner, Owner , 1, "[SC_BUY_TOKEN]" , 0 )
		end
	else
		Lua_na_FM_begin1()			
	end		
end

function Lua_na_FM_begin1()
	local Owner = OwnerID() --���a
	local Target = TargetID() --NPC
	local Switch = ReadRoleValue( Target , EM_RoleValue_Register1 ) -- Switch
	local R = ReadRoleValue( Target , EM_RoleValue_Register2 ) --����NPC�W���O�����C�����q�A��l��0
	WriteRoleValue( Target , EM_RoleValue_Register2 , R+1)
	local NewR = ReadRoleValue( Target , EM_RoleValue_Register2)

	CloseSpeak( Owner)	
	if Switch == 1 then --�p�G���ʶi�椤
		ScriptMessage( Owner , Owner , 1 , "[SC_120993_ROUND][$SETVAR1="..NewR.."]", C_SYSTEM ) 
		StartClientCountDown(Owner, 20, 0, 0, 0, 1, "[SC_120993_START_MES]")
 		----��1~3 �O��X�h�X�Ӫ��a��
		if NewR == 1 or NewR == 2 or NewR  == 3 then -- 
			ScriptMessage(Owner ,Owner , 2 , "[SC_120993_GAMETYPE1_1]",0)
			BeginPlot( Target , "Lua_na_FindMistake_Q1",0)
			---��4~6 �O��m���ʪ��a��
		elseif NewR  == 4 or NewR  == 5 or NewR == 6 then
			ScriptMessage(Owner ,Owner , 2 , "[SC_120993_GAMETYPE3_1]",0)
			BeginPlot( Target , "Lua_na_FindMistake_Q3",0)
		----��7~9 �~�����ܪ��a��
		elseif NewR  == 7 or NewR == 8 or NewR  == 9 then
			ScriptMessage(Owner ,Owner , 2 , "[SC_120993_GAMETYPE2_1]",0)
			BeginPlot( Target , "Lua_na_FindMistake_Q2",0)
		end
		WriteRoleValue( Target , EM_RoleValue_Register1 , 3 )  --���������Ȫ����
	end
end




function Lua_na_FindMistake_obj()  --�����Ȯ�������A���ͪ����ê���A�Ψӧ@���P�_���a�O�_������X�Ҧ�������
	local Owner = OwnerID()
	local OrgID = ReadRoleValue(  Owner , EM_RoleValue_OrgID)
	local RoomID = ReadRoleValue( Owner , EM_RoleValue_RoomID )
	local Lylia = Role:new( Owner )  -- ���o������X.Y.Z.Dir��
	local BaseX = Lylia :X()
 	local BaseY = Lylia :Y();
 	local BaseZ = Lylia :Z();
	local BaseDir = Lylia:Dir();
	local Obj = CreateObj( 120994 , BaseX, BaseY, BaseZ, BaseDir, 1 ) --�b�����Ȯy�� X.Y.Z.Dir �Хߪ���
	SetModeEx( Obj , EM_SetModeType_Strikback, false )--����
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Obj , EM_SetModeType_Obstruct, false )--����
	SetModeEx( Obj , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Obj , EM_SetModeType_Move, false )--����
	SetModeEx( Obj , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Obj , EM_SetModeType_HideName, false )--�W��
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Obj , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Obj , EM_SetModeType_Drag , false )--���O
	SetModeEx( Obj , EM_SetModeType_Show, false )--���
	WriteRoleValue( Obj , EM_RoleValue_Register9 , Owner) --�����ê���O�o������
	AddToPartition( Obj ,  RoomID) -- �إ����ê���A�ˬd���D���p
	Sleep(10)
	Hide(Owner) --���ò�����
end




---------------------------------------------------------
--�ˬd���׬O�_�Q��쪺���ê���
---------------------------------------------------------
function Lua_na_FindMistake_obj1()
	local Owner = OwnerID()
	local Lylia = ReadRoleValue ( Owner , EM_RoleValue_Register9 )
	local Player = ReadRoleValue( Lylia , EM_RoleValue_Register10) --Ū�����a
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID ) 
	local Time = 0
--	Say( Player, "Player is me? ")
	while true do	
		local Answer = {}
		local allNPC = SearchRangeNPC( Owner , 700) --
		for i = 0 , #allNPC do --
			if ReadRoleValue ( allNPC[i] , EM_RoleValue_Register1 ) == 2 then
				table.insert( Answer , allNPC[i] )
			end
		end
		
		if #Answer < 1 then  --�Ҧ����פw�g�Q��X��
			ClockClose(Player)
			CancelBuff( Player , 622634 )	 --��j��ޯ�R��
			Lua_na_FindMistake_DelAll()
			sleep(10)
			Show(Lylia , RoomID)
			ScriptMessage( Player , Player , 2 ,"[SC_120993_END3]" ,0) --�V�����Ȧ^�����Ѫ����G
			if ReadRoleValue( Lylia , EM_RoleValue_Register1) == 3 then
				WriteRoleValue( Lylia , EM_RoleValue_Register1 , 1 )  --�}�Ҳ����Ȫ����
			end
			DelObj( Owner)
			local Score = ReadRoleValue( Player , EM_LuaValueFlag_UseItem40 )
		--	Say( Player , "Score = "..Score )
			local PlayerLv = ReadRoleValue( Player , EM_RoleValue_LV) 
			if Score >= 4000 and Score < 5000 and PlayerLv >= 50 then 
				GiveBodyItem( Player , 201014 , 1 ) --�j�v�U��ײz��
				GiveBodyItem( Player , 203487 , 1 ) --�]���_����q1�I
			elseif Score >= 6000 and Score < 7000 then
				local UI = ReadRoleValue( Player , EM_LuaValueFlag_UseItem45)
				WriteRoleValue( Player, EM_LuaValueFlag_UseItem45 , UI +1 ) --�q�L�Ĥ������p��
				ScriptMessage( Player, Player , 2 , "[SC_120993_10]", 0 )
			end
		end	

		if FN_CountBuffLevel( Player , 624295) < 0 then --���a�����ѥ��ѫפw�g�Χ�
			CancelBuff( Player , 624306 )					
			WriteRoleValue( Lylia , EM_RoleValue_Register1, 0 ) -- �����ȡA��������
			ClockClose(Player)
			CancelBuff( Player , 622634 )	 --��j��ޯ�R��
			Lua_na_FindMistake_DelAll()
			sleep(10)
			Show(Lylia , RoomID)
			ScriptMessage( Player , Player , 2 ,"[SC_120993_END3]" ,0) --�V�����Ȧ^�����Ѫ����G
			local Score = ReadRoleValue( Player , EM_LuaValueFlag_UseItem40 )
		--	Say( Player , "Score = "..Score )		
		end
		if Time == 31 then
			local Y = FN_CountBuffLevel( Player , 624295) --�D�Ԧ���
			ScriptMessage( Player, Player, 1 ,"[SC_120993_MISS][$SETVAR1="..#Answer.."]" , 0 )
			if #Answer < Y then
				CancelBuff_NoEvent( Player , 624295 )
				AddBuff( Player, 624295 , (Y - #Answer) , -1 )
			--	Say( Owner , #Answer )
			else
				CancelBuff( Player , 624295 )	
				CancelBuff( Player , 624306 )					
				WriteRoleValue( Lylia , EM_RoleValue_Register1, 0 ) -- �����ȡA��������
			end
			local Score = ReadRoleValue( Player , EM_LuaValueFlag_UseItem40 )
		--	Say( Player , "Score = "..Score )	
		end		
		sleep(10)
		Time = Time +1
	end
end




-----------------------------------------
--�ϥΧޯ�
-----------------------------------------
function Lua_na_FM_checkobj() --�ϥΫe�ˬd�A���i��ۤv�ϥ�
	local Owner = OwnerID()
	local Target = TargetID()
	if Owner == Target or CheckBuff( Owner , 624295) == false then
		ScriptMessage( Owner , Owner , 1 , "[SC_204592_1]" , 0 )
		return false
	else
		return true
	end
end 


function Lua_na_FM_checkobj_1() 
	local Owner = OwnerID()
	local Target = TargetID()
	local CheckReg = ReadRoleValue( Target , EM_RoleValue_Register1)
	local Score = ReadRoleValue( Owner , EM_LuaValueFlag_UseItem40 )
	local ExtraPoint = 624306	--�B�~�[����BUFF
	local Mistake = 624295  --���~�e�\����
	local StringTable1 = {	[1] = "[SC_FINDMISTAKE_CHECK_1]" ,
				[2] = "[SC_FINDMISTAKE_CHECK_2]" ,
				[3] = "[SC_FINDMISTAKE_CHECK_3]" ,
				[4] = "[SC_FINDMISTAKE_CHECK_4]" , } --���諸���
	local StringTable2 = {	[1] = "[SC_FINDMISTAKE_CHECK_5]" ,
				[2] = "[SC_FINDMISTAKE_CHECK_6]" ,
				[3] = "[SC_FINDMISTAKE_CHECK_7]" ,
				[4] = "[SC_FINDMISTAKE_CHECK_8]" , } --���������

--	if Owner ~= Target then
		if CheckReg == 2 then --����A�[��
			local X = FN_CountBuffLevel( Owner , ExtraPoint ) -- --1�h����0 �A �S������-1
			SysCastSpellLv( Target , Owner , 850926 , 0)
			if X >= 0  then   --�p�G���a�s�򵪹�
				AddBuff( Owner , ExtraPoint, 0,-1)
				X = (X+1)*1 --�B�~�[���ΡA�C�hBUFFx1���A�������T�N�|�o��780��
				DebugMsg( 0,0, "ExtraPoint ="..X) 
				WriteRoleValue( Owner , EM_LuaValueFlag_UseItem40 , Score+1+X)				
			else
				WriteRoleValue( Owner , EM_LuaValueFlag_UseItem40 , Score+1)
				AddBuff( Owner , ExtraPoint, 0 ,-1)
			end
			DelObj( Target)
			local RanMes = DW_Rand( #StringTable1)
			ScriptMessage( Owner , Owner , 1 , StringTable1[RanMes] , C_SYSTEM ) 
	--	SC_FINDMISTAKE_CHECK_1~4 ����
		else --����
			local Y = FN_CountBuffLevel( Owner , Mistake ) -- --1�h����0 �A �S������-1	
			if Y == 0 then
				CancelBuff( Owner , Mistake)
			else	
				CancelBuff_NoEvent( Owner , Mistake)
				AddBuff( Owner , Mistake , Y -1 , -1)
			end
			CancelBuff( Owner , ExtraPoint)		
			local RanMes = DW_Rand( #StringTable2)
			ScriptMessage( Owner , Owner , 1 , StringTable2[RanMes] , 0 ) 
		end
--	else
--		return false
--	end
	local new = ReadRoleValue( Owner , EM_LuaValueFlag_UseItem40 )
--	say( Owner , "ScoreNew ="..new)
end




---------------------------------------------
--�R���a��NPC
---------------------------------------------
function Lua_na_FindMistake_DelAll() 
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local F = {  	111915, 111916, 111917, 113879, 113885, 113651, 111919, 111921, 118394, 118395, 
			118396, 118397, 118398, 118399, 118400, 118401, 118402, 113847, 113848, 113849, 
			113855, 113856, 113857, 113858, 113859, 113860, 113861, 113862, 114156, 114157, 
			114165, 113912, 113707, 113708, 113738, 113739, 113737, 113740,
			111857, 111860, 111862, 113894, 113895, 113882, 113883, 113890, 113891, 113892, 
			114143, 114144, 114145, 114146, 114147, 114153, 114154, 114155, 114196, 114197, 
			114198, 114152, 114148, 114149, 114151	 }  --�R���Ҧ��a��

	if  Count ~= 0 then
		for i=1 , Count , 1 do
		local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
				local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--�T�{�Ҧ�NPC���s��
				for j = 1 , table.getn( F ) , 1 do
					if Name == F[j] then  --�Y���}�C������
						Delobj( ID) --������
					end
				end
			end
		end
	end
end


 --��ܵ��ת��S��
function Lua_na_showans()
	local Owner = OwnerID()
	sleep(310)
	addbuff( Owner , 622846, 1 , 5 )
	Sleep(50)
	Lua_na_FindMistake_DelAll()
end




--------------------------------
--���ի��O
--------------------------------
function Lua_na_FM_addbuff()
	AddBuff( OwnerID() , 624295 , 9 , -1 )
end

function Lua_361_reset()
	local Owner = OwnerID()
	SetFlag(Owner , 548115 , 0 )
	SetFlag(Owner , 548116 , 0 )
	WriteRoleValue( Owner,EM_LuaValueFlag_UseItem40, 0 )
end

function Lua_361_check()
	local Owner = OwnerID()
	local Score = ReadRoleValue( Owner,EM_LuaValueFlag_UseItem40 )
	Say( Owner , "Score = "..Score)
	local Perfect = ReadRoleValue( Owner, EM_LuaValueFlag_UseItem45 )
	Say( Owner , "PassLv6= "..Perfect )
end


function Lua_361_Score(Score)
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem40, Score)
end

function Lua_na_361_cheat()
	local Owner = OwnerID()
--	local RoomID = ReadRoleValue( Owner , EM_RoleValue_RoomID )
	local Count = SearchRangeNPC( Owner , 700)
	local Obj = {}
	local F = {  	111915, 111916, 111917, 113879, 113885, 113651, 111919, 111921, 118394, 118395, 
			118396, 118397, 118398, 118399, 118400, 118401, 118402, 113847, 113848, 113849, 
			113855, 113856, 113857, 113858, 113859, 113860, 113861, 113862, 114156, 114157, 
			114165, 113912, 113707, 113708, 113738, 113739, 113737, 113740,
			111857, 111860, 111862, 113894, 113895, 113882, 113883, 113890, 113891, 113892, 
			114143, 114144, 114145, 114146, 114147, 114153, 114154, 114155, 114196, 114197, 
			114198, 114152, 114148, 114149, 114151	 }  --�Ҧ��a��
	for i = 0 , #Count do
		for j = 1 , #F do
			local OrgID = ReadRoleValue( Count[i] , EM_RoleValue_OrgID )
			if OrgID == F[j]  then
			table.insert( obj, Count[i])
			end
		end
	end

	for i = 1 , #obj do
		if ReadRoleValue( obj[i] , EM_RoleValue_Register1 ) == 2 then
			addbuff( obj[i] , 620015, 1 , -1 )
		end
	end
end

function Lua_361_title_test(Count)
	local Owner = OwnerID()
	WriteRoleValue( Owner , EM_LuaValueFlag_UseItem45 , Count)
	local C = ReadRoleValue( Owner , EM_LuaValueFlag_UseItem45)
	DebugMsg( 0 , 0 , "PassLv6 = ".. C )
end

function Lua_361_Round(R)
	local Owner = OwnerID()
	local Lylia = 120993
	local NPC = SearchRangeNPC( Owner , 300)
	local Score = ReadRoleValue( Owner, EM_LuaValueFlag_UseItem40)
	for i = 0 , #NPC do
		if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID) == Lylia then
			WriteRoleValue(NPC[i] , EM_RoleValue_Register2 , R )
			WriteRoleValue( Owner , EM_LuaValueFlag_UseItem40 , (R*1000)+Score )
			local NewR = ReadRoleValue( Owner , EM_LuaValueFlag_UseItem40)
			Say( NPC[i] , "Round = "..R )
			Say( Owner ,  " Now Score is "..NewR )
			break
		end
	end
end



-------------------------
--�a����J
-------------------------
function Lua_242761() --��o�a����J
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 727036 , 1 } }
	return BaseTressureProc(   itemset , 1 )
end

function Lua_242762() --�`�y�a����J
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 727037 , 1 } }
	return BaseTressureProc(   itemset , 1 )
end
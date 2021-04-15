function lua_LivingSkillLimitAdd_check(rank)--�ϥΪ��~�ˬd
	local player = OwnerID()
	local Crafting = {}

	Crafting[1] = {}	-- �Ǯ{
	Crafting[2] = { "[SC_CRAFTING_01]" , "[SC_CRAFTING_05]" , 548066, 548067, 548068  }	-- �u�K
	Crafting[3] = { "[SC_CRAFTING_02]" , "[SC_CRAFTING_06]" , 548069, 548070, 548071, 548072, 548073, 548074  }	-- �M��
	Crafting[4] = { "[SC_CRAFTING_03]" , "[SC_CRAFTING_07]" , 548075, 548076, 548077, 548078, 548079, 548080, 548081 }	-- �j�v
	Crafting[5] = { "[SC_CRAFTING_04]" , "[SC_CRAFTING_08]" , 548082, 548083, 548084, 548085, 548086, 548087, 548088 }	-- �ǩ_
	-- �L�k�ϥΡA�i�ǲߪ� _ _ ���w�F�W���C�@�W�[�i�ǲߪ� _ _ ���C
	for pos=3 , #Crafting[rank] , 1 do
		if CheckFlag( player , Crafting[rank][pos] ) == false then
			SysCastSpellLv( player , player , 491010 , 0 )
			SetFlag( player , Crafting[rank][pos] , 1 )
			ScriptMessage( player , player , 3 , Crafting[rank][2] , C_SYSTEM )	-- ��ܵ����P�e�������P�����
			return true
		end
	end
	ScriptMessage( player , player , 3 , Crafting[rank][1] , C_SYSTEM )	-- ��ܵ���
	return false
end

function Hao_Crafting_Set_Value()	-- �վ�ͬ��ޯ�

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )

	if CheckBuff( Player , 501570 ) == true then 
		ScriptMessage( Player , Player , 0 , "[SC_WINDOW_OPENED]", 0 )	--�����w�g���}�F
		return
	end
	
	local Time = 0
	local DialogStatus
	local Crafting_Code = ""

	local Msg = {}
	Msg[0] = "[SC_CRAFTING_MSG_03]"	-- �Щ���줤��J�H�U�N���G
	Msg[1] ="[SC_CRAFTING_10]"	-- �R���U���q�ͬ��ޯ��X�R��W�[���ǲ߸��C		
	Msg[2] ="[SC_CRAFTING_09]"	-- ���o�U���q�ͬ��ޯ��X�R��W�[���ǲ߸��C
	Msg[3] ="[SC_CRAFTING_11]"		-- �R���Ҧ��ͬ��ޯ�
	Msg[4] ="[SC_CRAFTING_12]"		-- ���o�Ҧ��ͬ��ޯ�
	Msg[5] ="[SYS_SKILLNAME_BLACKSMITH]"	-- ���K�ޯ�
	Msg[6] ="[SYS_SKILLNAME_CARPENTER]"	-- ��u�ޯ�
	Msg[7] ="[SYS_SKILLNAME_MAKEARMOR]"	-- �s�ҧޯ�
	Msg[8] ="[SYS_SKILLNAME_TAILOR]"		-- ���_�ޯ�
	Msg[9] ="[SYS_SKILLNAME_COOK]"		-- �i���ޯ�
	Msg[10] ="[SYS_SKILLNAME_ALCHEMY]"	-- �Ҫ��ޯ�
	Msg[11] ="[SYS_SKILLNAME_MINING]"	-- ���q�ޯ�
	Msg[12] ="[SYS_SKILLNAME_LUMBERING]"	-- ���ޯ�
	Msg[13] ="[SYS_SKILLNAME_HERBLISM]"	-- ���ħޯ�
	Msg[14] ="[SYS_SKILLNAME_PLANT]"		-- �شӧޯ�

	if ReadRoleValue( Player , EM_RoleValue_PID ) == 0 then
		ScriptMessage( Player , Player , 0 , Msg[0] , C_SYSTEM )
		for Pos = 1 , #Msg , 1 do
			ScriptMessage( Player , Player , 0 , Pos.." = "..Msg[Pos] , C_SYSTEM )
		end
	end

	AddBuff( Player , 501570 , 0 , -1 )  
	DialogCreate( Player , EM_LuaDialogType_Input , "[SC_CRAFTING_MSG_01]" )	-- �п�J�N���G
	DialogSelectStr( Player , "[BG_DLG_SURE_ENTER_ROOM]" )	-- �T�w
	DialogSelectStr( Player , "[BG_DLG_CANCEL_JOIN_ROOM]" )	-- ����

	if DialogSendOpen(Player) == false then  --���ϥο��~�A�^�ǿ��~�T��
		ScriptMessage ( Player , Player , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )
		return
	end

	while true do
		sleep(1)
		Time = Time+1
	 	if Time > 600 then  -- 60��L�ʧ@�A������ܵ���
			ScriptMessage( Player , Player , 0 , "Idle for more than 60 sec , window will close automatically." , 0 ) -- ���m�W�L60��,�۰����������C
			break
		end
		DialogStatus = DialogGetResult( Player )  --�ˬd�ϥΪ̿��������
		if DialogStatus ~= -2 and DialogStatus ~= -1 then -- �������l�ƤΤ��_��
			Crafting_Code = DialogGetInputResult( Player )
			if DialogStatus == 0 then  -- ����J�r��
				if tonumber(Crafting_Code) == nil or Crafting_Code == "" or Msg[tonumber(Crafting_Code)] == nil then	-- ��J���ɡA������r��B�ťաB��Table���s�b��..
					ScriptMessage( player , player , 0 , "[SC_209462_3]" , C_SYSTEM )	-- ��J���~
					break
				else
				--	ScriptMessage( Player , Player , 0 , Msg[tonumber(Crafting_Code)] , C_SYSTEM )	-- ��ܿ�ܶ���
					CancelBuff( Player, 501570 )
					DialogClose( Player )
					WriteRoleValue( Player , EM_RoleValue_PID , 1 )
					return Hao_Crafting_Set_Value_01( Player , tonumber(Crafting_Code) , Msg[tonumber(Crafting_Code)] )
				end
			else
				break
			end
		elseif DialogStatus == -1 then	-- ���_
			break
		end
	end
	WriteRoleValue( Player , EM_RoleValue_PID , 0 )
	CancelBuff( Player , 501570 )
	DialogClose( Player )
end

function Hao_Crafting_Set_Value_01( Player , Crafting_Code , String )

	if CheckBuff( Player , 501570 ) == true then
		ScriptMessage( Player , Player , 0 , "[SC_WINDOW_OPENED]" , 0 )	--�����w�g���}�F
		return
	end

	if String == nil then
		String = ""
	end

	local Time = 0
	local DialogStatus
	local Skill_Volume = ""	-- ����

	local Crafting = {}
	-- �B�~�X�R���ͬ��ޯ���
	Crafting[1] = {
			[1] = { 548066, 548067, 548068  } ,					-- �u�K
			[2] = { 548069, 548070, 548071, 548072, 548073, 548074  } ,		-- �M��
			[3] = { 548075, 548076, 548077, 548078, 548079, 548080, 548081 } ,	-- �j�v
			[4] = { 548082, 548083, 548084, 548085, 548086, 548087, 548088 }	-- �ǩ_			
				}

	Crafting[5] = { 540268 , 540343 , 540352 , 540361 , 540369 }	-- ���K(�Ǯ{�B�u�K�B�M��B�j�v�B�ǩ_)
	Crafting[6] = { 540334 , 540344 , 540353 , 540362 , 540368 }	-- ��u
	Crafting[7] = { 540335 , 540345 , 540354 , 540363 , 544329 }	-- �s��
	Crafting[8] = { 540336 , 540346 , 540355 , 540364 , 540374 }	-- ���_
	Crafting[9] = { 540337 , 540347 , 540356 , 540365 , 540373 }	-- �i��
	Crafting[10] = { 540338 , 540348 , 540357 , 540366 , 540375 }	-- �Ҫ�
	Crafting[11] = { 540269 , 540340 , 540349 , 540358 , 540371 }	-- ���q
	Crafting[12] = { 540270 , 540341 , 540350 , 540359 , 540370 }	-- ���
	Crafting[13] = { 540333 , 540342 , 540351 , 540360 , 540372 }	-- ����
	Crafting[14] = { 542886 , 542887 , 542888 , 542889 , 543535 }	-- �ش�

	Crafting[3] = {				-- �Ҧ��ͬ��ޯ�
			Crafting[5] ,
			Crafting[6] ,
			Crafting[7] ,
			Crafting[8] ,
			Crafting[9] ,
			Crafting[10] ,
			Crafting[11] ,
			Crafting[12] ,
			Crafting[13] ,
			Crafting[14]
					}

	local Skill = {}
	Skill[5] = EM_RoleValue_Skill_BlackSmith	-- ���K
	Skill[6] = EM_RoleValue_Skill_Carpenter	-- ��u
	Skill[7] = EM_RoleValue_Skill_MakeArmor	-- �s��
	Skill[8] = EM_RoleValue_Skill_Tailor		-- ���_
	Skill[9] = EM_RoleValue_Skill_Cook		-- �i��
	Skill[10] = EM_RoleValue_Skill_Alchemy	-- �Ҫ�
	Skill[11] = EM_RoleValue_Skill_Mining		-- ���q
	Skill[12] = EM_RoleValue_Skill_Lumbering	-- ���
	Skill[13] = EM_RoleValue_Skill_Herblism	-- ����
	Skill[14] = EM_RoleValue_Skill_Plant		-- �ش�

	if Crafting_Code == 1 then	-- �R���U���q�ͬ��ޯ��X�R��W�[���ǲ߸��C
		ScriptMessage( Player , Player , 0 , "[SC_CRAFTING_10]" , 0 )
		for Rank = 1 , #Crafting[1] , 1 do
			for Pos = 1 , #Crafting[1][Rank] , 1 do 
				if CheckFlag( Player , Crafting[1][Rank][Pos] ) == true then
					SetFlag( Player , Crafting[1][Rank][Pos] , 0 )
				end
			end
		end
		return Hao_Crafting_Set_Value()
	elseif Crafting_Code == 2 then	-- ���o�U���q�ͬ��ޯ��X�R��W�[���ǲ߸��C
		ScriptMessage( Player , Player , 0 , "[SC_CRAFTING_09]" , 0 )
		for Rank = 1 , #Crafting[1] , 1 do
			for Pos = 1 , #Crafting[1][Rank] , 1 do 
				if CheckFlag( Player , Crafting[1][Rank][Pos] ) == false then
					SetFlag( Player , Crafting[1][Rank][Pos] , 1 )
				end
			end
		end
		return Hao_Crafting_Set_Value()
	elseif Crafting_Code == 3 then	-- �R���Ҧ��ͬ��ޯ�
		ScriptMessage( Player , Player , 0 , "[SC_CRAFTING_11]" , 0 )
		-- �R���ͬ��ޯ���	
		for Rank = 1 , #Crafting[3] , 1 do
			for Pos = 1 , #Crafting[3][Rank] , 1 do
				if CheckFlag( Player , Crafting[3][Rank][Pos] ) == true then
					SetFlag( Player , Crafting[3][Rank][Pos] , 0 )
				end
			end
		end		
		--
		for Choise , Value in pairs(Skill) do
			WriteRoleValue( Player , Skill[Choise] , 0 )
		end
		return Hao_Crafting_Set_Value()
	elseif Crafting_Code == 4 then	-- ���o�Ҧ��ͬ��ޯ�
		ScriptMessage( Player , Player , 0 , "[SC_CRAFTING_12]" , 0 )
		-- ���o�ͬ��ޯ���
		for Rank = 1 , #Crafting[3] , 1 do
			for Pos = 1 , #Crafting[3][Rank] , 1 do
				if CheckFlag( Player , Crafting[3][Rank][Pos] ) == false then
					SetFlag( Player , Crafting[3][Rank][Pos] , 1 )
				end
			end
		end
		--
		for Choise , Value in pairs(Skill) do
			WriteRoleValue( Player , Skill[Choise] , 100 )
		end	
		return Hao_Crafting_Set_Value()
	end

	AddBuff( Player , 501570 , 0 , -1 )
	DialogCreate( Player , EM_LuaDialogType_Input , "[SC_CRAFTING_MSG_02][$SETVAR1="..String.."]" )	-- �п�J�Q�n�վ㪺 _ _ ���šG
	DialogSelectStr( Player , "[BG_DLG_SURE_ENTER_ROOM]" )	-- �T�w
	DialogSelectStr( Player , "[BG_DLG_CANCEL_JOIN_ROOM]" )	-- ����

	if DialogSendOpen(Player) == false then  --���ϥο��~�A�^�ǿ��~�T��
		ScriptMessage ( Player , Player , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )
		return
	end

	while true do
		sleep(1)
		Time = Time+1
	 	if Time > 600 then  -- 60��L�ʧ@�A������ܵ���
			ScriptMessage( Player , Player , 0 , "Idle for more than 60 sec , window will close automatically." , 0 ) -- ���m�W�L60��,�۰����������C
			break
		end
		DialogStatus = DialogGetResult( Player )  --�ˬd�ϥΪ̿��������
		if DialogStatus ~= -2 and DialogStatus ~= -1 then -- �������l�ƤΤ��_��
			Skill_Volume = DialogGetInputResult( Player )
			if DialogStatus == 0 then  -- ����J�r��
				if Type(Skill_Volume) ~= "string" or Skill_Volume == ""  or tonumber(Skill_Volume) < 0 then	-- ��J���ɡA������r��B�ťծɫh...
					ScriptMessage( Player , Player , 0 , "[SC_209462_3]" , C_SYSTEM )	-- ��J���~
				else
					local Ceil = math.ceil(tonumber(Skill_Volume)/20)	-- �L����i��
				--	ScriptMessage( Player , Player , 0 , Skill_Volume , C_SYSTEM )	-- ��ܿ�J��
					for Pos = 1 , #Crafting[Crafting_Code] , 1 do	-- ���m�᭫�s����
							SetFlag( Player , Crafting[Crafting_Code][Pos] , 0 )
					end
					if Ceil ~= 0 then	-- ���J���Ť����� 0 �ɤ~����
						for Pos = 1 , Ceil , 1 do
							if Crafting[Crafting_Code][Pos] ~= nil then
								if CheckFlag( Player , Crafting[Crafting_Code][Pos] ) == false then	-- �����
									SetFlag( Player , Crafting[Crafting_Code][Pos] , 1 )
								end
							end
						end
					end
					WriteRoleValue( Player , Skill[Crafting_Code] , tonumber(Skill_Volume) )	-- �ק��ܪ��ͬ��ޯ�
				end
				CancelBuff( Player , 501570 )
				DialogClose( Player )
				return Hao_Crafting_Set_Value()
			else
				break
			end
		elseif DialogStatus == -1 then	-- ���_
			break
		end
	end
	WriteRoleValue( Player , EM_RoleValue_PID , 0 )	
	CancelBuff( Player , 501570 )
	DialogClose( Player )
end

function Hao_Check_Buff_State(BuffID)	-- �T�{���a���W�O�_�w�����Ӫ��~���Ѫ��ĪG

	local Player = OwnerID()
	if CheckBuff( Player , BuffID ) == true then
		ScriptMessage( Player , Player , 1 , "[MSG_EFFECT_HAVE]" , C_DEFAULT )	-- ���~�ϥΥ��ѡA���ĪG�w�s�b�C
		return false
	end
end
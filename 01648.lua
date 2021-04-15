------------------------------------------------------------------------------------------------------"*--�m�_�I�ƥ�n--*"-----------------------------------------------------------------------------------------------------------------------
function Yuyu_Pet_Event_Adventure_01() --�_�I�ƥ�   /gm ? runplot Yuyu_Pet_Event_Adventure_01
--OwnerID()  ���a

	local PlayerID = OwnerID()
	local Mode = -1
	local ModePet = -1
	local RoomID = ReadRoleValue( PlayerID , EM_RoleValue_RoomID )

	for i = 0,5 do

		Mode = ReadPetValue( PlayerID , i ,EM_CultivatePetStructValueType_EventType ) --�d�����A(���Q�l��(2)�B���b�Ȧ�(4)�B���b�Ͳ�(8)...etc)

		if Mode == 2 then
			ModePet = i	--�g�Ji�����b�l��X�Ӫ��d�����Ǹ�
			ModePet = ModePet+1	--�����ϥΡA�d�����q1�}�l
		end
	end

	local CheckTime = 1
	local RunTime = 1
	local DialogStatus = 0
	local TransferSelect = {}

	local Event_Life = { }
	Event_Life[0] = {"[SC_PETS_EVENT_03_21_00]","[SC_PETS_EVENT_03_21_01]","[SC_PETS_EVENT_03_21_02]","[SC_PETS_EVENT_03_21_03]"}	
	Event_Life[1] = {"[SC_PETS_EVENT_03_22_00]","[SC_PETS_EVENT_03_22_01]","[SC_PETS_EVENT_03_22_02]","[SC_PETS_EVENT_03_22_03]"}
	Event_Life[2] = {"[SC_PETS_EVENT_03_23_00]","[SC_PETS_EVENT_03_23_01]","[SC_PETS_EVENT_03_23_02]","[SC_PETS_EVENT_03_23_03]"}
	Event_Life[3] = {"[SC_PETS_EVENT_03_24_00]","[SC_PETS_EVENT_03_24_01]","[SC_PETS_EVENT_03_24_02]","[SC_PETS_EVENT_03_24_03]"}				
	Event_Life[4] = {"[SC_PETS_EVENT_03_25_00]","[SC_PETS_EVENT_03_25_01]","[SC_PETS_EVENT_03_25_02]","[SC_PETS_EVENT_03_25_03]"}
	Event_Life[5] = {"[SC_PETS_EVENT_03_26_00]","[SC_PETS_EVENT_03_26_01]","[SC_PETS_EVENT_03_26_02]","[SC_PETS_EVENT_03_26_03]"}
	Event_Life[6] = {"[SC_PETS_EVENT_03_27_00]","[SC_PETS_EVENT_03_27_01]","[SC_PETS_EVENT_03_27_02]","[SC_PETS_EVENT_03_27_03]"}
	Event_Life[7] = {"[SC_PETS_EVENT_03_28_00]","[SC_PETS_EVENT_03_28_01]","[SC_PETS_EVENT_03_28_02]","[SC_PETS_EVENT_03_28_03]"}				
	Event_Life[8] = {"[SC_PETS_EVENT_03_29_00]","[SC_PETS_EVENT_03_29_01]","[SC_PETS_EVENT_03_29_02]","[SC_PETS_EVENT_03_29_03]"}
	Event_Life[9] = {"[SC_PETS_EVENT_03_30_00]","[SC_PETS_EVENT_03_30_01]","[SC_PETS_EVENT_03_30_02]","[SC_PETS_EVENT_03_30_03]"}

	local STRING = Rand( 10 )      

	TransferSelect[0] = { ModePet .. "" } -- PET _ POS  �d����m�A���g�k�Y�O���e�����N���ഫ���r��
	if STRING <5 then
		TransferSelect[1] = { "interface\\Icons\\PetSystem\\pet_event04" } --�ϧθ��|   Tag�ɤj�p�G512*125   �ϧγW��G274*124
	else
		TransferSelect[1] = { "interface\\Icons\\PetSystem\\pet_event03" } --�ϧθ��|   Tag�ɤj�p�G512*125   �ϧγW��G274*124
	end
	TransferSelect[2] = { Event_Life[STRING][2] } --�ƥ���D_1
	TransferSelect[3] = { Event_Life[STRING][3] } --�ƥ���D_2
	TransferSelect[4] = { Event_Life[STRING][4] } --�ƥ���D_3
	TransferSelect[5] = { "[SC_PETS_EVENT_00_00_00]" } --�ƥ���D_4
	if CheckBuff( PlayerID , 501570) == true then 
		ScriptMessage( PlayerID , PlayerID , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		return
	end
	DialogCreate( PlayerID , EM_LuaDialogType_Pet , Event_Life[STRING][1] )--�ƥ󤺮e(string)
	AddBuff(PlayerID , 501570,0,-1);

	ModePet = ModePet-1	--�]���e�����F���i�����j�ϥΦ��ѼơA�[�F 1�AServer�ݫh�����٭��ȡA�G-1

	for i = 0, table.getn( TransferSelect ) do
		DialogSelectStr( PlayerID , TransferSelect[i][1] )
	end

	if( DialogSendOpen( PlayerID ) == false ) then 
		ScriptMessage( PlayerID , PlayerID , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--��ưe�X�����D
		return 0
	end
	while true do
		Sleep( 5 )
		RunTime = RunTime + 1
		if RunTime  > 600 then -- ���L�a�j��A600 = �@����
			DebugMsg( 0, RoomID ,"Exit the MENU because IDLE a long Time !!")
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		end

		DialogStatus = DialogGetResult( PlayerID )
		--Say( PlayerID , DialogStatus )

		local Addstaus = 50									--�ݩʼW�[ �g��ȡB�ޯ��I�B�_�c
		if DialogStatus == -2 then
			-- DO nothing
		elseif DialogStatus == -1 then
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		elseif DialogStatus == 1 then--�ƥ���D_1  ���G
			local Str = "[SC_PETS_EVENT_00_00_01][$SETVAR1=".."[SC_PETS_EVENT_00_00_06]".."][$SETVAR2="..Addstaus.."]"
			AddPetValue( PlayerID , ModePet , EM_CultivatePetStructValueType_Exp , Addstaus )  
			ScriptMessage( PlayerID , PlayerID , 1 , Str , "0xff00ffff" )
			ScriptMessage( PlayerID , PlayerID , 0 , Str , "0xff00ffff" )
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--

			--//���s�p���d������
			ReCalPetLv(PlayerID,ModePet)
			--ReCalPetLv( int GItemID , int Pos )
				        --���a�A             ���d����m	
			break
		elseif DialogStatus == 2 then--�ƥ���D_2  ���G
			Addstaus = 5
			local Str = "[SC_PETS_EVENT_00_00_01][$SETVAR1=".."[SC_PETS_EVENT_00_00_07]".."][$SETVAR2="..Addstaus.."]"
			AddPetValue( PlayerID , ModePet , EM_CultivatePetStructValueType_SKillPoint , Addstaus )  
			AddPetValue( PlayerID , ModePet , EM_CultivatePetStructValueType_TotalSkillPoint , Addstaus )  
			ScriptMessage( PlayerID , PlayerID , 1 , Str , "0xff00ffff" )
			ScriptMessage( PlayerID , PlayerID , 0 , Str , "0xff00ffff" )
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		elseif DialogStatus == 3 then--�ƥ���D_3  ���G
			ScriptMessage( PlayerID , PlayerID , 1 , "[SC_PETS_EVENT_00_00_08]" , "0xff00ffff" )
			ScriptMessage( PlayerID , PlayerID , 0 , "[SC_PETS_EVENT_00_00_08]" , "0xff00ffff" )
			GiveBodyItem( PlayerID , 205793 , 1 )
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		elseif DialogStatus == 4 then--�ƥ���D_4  ���G
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		end

	end
end

------------------------------------------------------------------------------------------------------"*--�m���P�ƥ�n--*"-----------------------------------------------------------------------------------------------------------------------

function Yuyu_Pet_Event_Emotion_01() --���P�ƥ�   /gm ? runplot Yuyu_Pet_Event_Emotion_01
--OwnerID()  ���a

	local PlayerID = OwnerID()
	local Mode = -1
	local ModePet = -1
	local RoomID = ReadRoleValue( PlayerID , EM_RoleValue_RoomID )

	for i = 0,5 do

		Mode = ReadPetValue( PlayerID , i ,EM_CultivatePetStructValueType_EventType ) --�d�����A(���Q�l��(2)�B���b�Ȧ�(4)�B���b�Ͳ�(8)...etc)

		if Mode == 2 then
			ModePet = i	--�g�Ji�����b�l��X�Ӫ��d�����Ǹ�
			ModePet = ModePet+1	--�����ϥΡA�d�����q1�}�l
		end
	end

	local CheckTime = 1
	local RunTime = 1
	local DialogStatus = 0
	local TransferSelect = {}

	local Event_Life = { }
	Event_Life[0] = {"[SC_PETS_EVENT_02_11_00]","[SC_PETS_EVENT_02_11_01]","[SC_PETS_EVENT_02_11_02]","[SC_PETS_EVENT_02_11_03]"}	
	Event_Life[1] = {"[SC_PETS_EVENT_02_12_00]","[SC_PETS_EVENT_02_12_01]","[SC_PETS_EVENT_02_12_02]","[SC_PETS_EVENT_02_12_03]"}	
	Event_Life[2] = {"[SC_PETS_EVENT_02_13_00]","[SC_PETS_EVENT_02_13_01]","[SC_PETS_EVENT_02_13_02]","[SC_PETS_EVENT_02_13_03]"}	
	Event_Life[3] = {"[SC_PETS_EVENT_02_14_00]","[SC_PETS_EVENT_02_14_01]","[SC_PETS_EVENT_02_14_02]","[SC_PETS_EVENT_02_14_03]"}					
	Event_Life[4] = {"[SC_PETS_EVENT_02_15_00]","[SC_PETS_EVENT_02_15_01]","[SC_PETS_EVENT_02_15_02]","[SC_PETS_EVENT_02_15_03]"}	
	Event_Life[5] = {"[SC_PETS_EVENT_02_16_00]","[SC_PETS_EVENT_02_16_01]","[SC_PETS_EVENT_02_16_02]","[SC_PETS_EVENT_02_16_03]"}	
	Event_Life[6] = {"[SC_PETS_EVENT_02_17_00]","[SC_PETS_EVENT_02_17_01]","[SC_PETS_EVENT_02_17_02]","[SC_PETS_EVENT_02_17_03]"}	
	Event_Life[7] = {"[SC_PETS_EVENT_02_18_00]","[SC_PETS_EVENT_02_18_01]","[SC_PETS_EVENT_02_18_02]","[SC_PETS_EVENT_02_18_03]"}					
	Event_Life[8] = {"[SC_PETS_EVENT_02_19_00]","[SC_PETS_EVENT_02_19_01]","[SC_PETS_EVENT_02_19_02]","[SC_PETS_EVENT_02_19_03]"}	
	Event_Life[9] = {"[SC_PETS_EVENT_02_20_00]","[SC_PETS_EVENT_02_20_01]","[SC_PETS_EVENT_02_20_02]","[SC_PETS_EVENT_02_20_03]"}	

	local STRING = Rand( 10 )      

	TransferSelect[0] = { ModePet .. "" } -- PET _ POS  �d����m�A���g�k�Y�O���e�����N���ഫ���r��
	if STRING <5 then
		TransferSelect[1] = { "interface\\Icons\\PetSystem\\pet_event01" } --�ϧθ��|   Tag�ɤj�p�G512*125   �ϧγW��G274*124
	else
		TransferSelect[1] = { "interface\\Icons\\PetSystem\\pet_event02" } --�ϧθ��|   Tag�ɤj�p�G512*125   �ϧγW��G274*124
	end
	TransferSelect[2] = { Event_Life[STRING][2] } --�ƥ���D_1
	TransferSelect[3] = { Event_Life[STRING][3] } --�ƥ���D_2
	TransferSelect[4] = { Event_Life[STRING][4] } --�ƥ���D_3
	TransferSelect[5] = { "[SC_PETS_EVENT_00_00_00]" } --�ƥ���D_4
	if CheckBuff( PlayerID , 501570) == true then 
		ScriptMessage( PlayerID , PlayerID , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		return
	end
	DialogCreate( PlayerID , EM_LuaDialogType_Pet , Event_Life[STRING][1] )--�ƥ󤺮e(string)
	AddBuff(PlayerID , 501570,0,-1);

	ModePet = ModePet-1	--�]���e�����F���i�����j�ϥΦ��ѼơA�[�F 1�AServer�ݫh�����٭��ȡA�G-1

	for i = 0, table.getn( TransferSelect ) do
		DialogSelectStr( PlayerID , TransferSelect[i][1] )
	end

	if( DialogSendOpen( PlayerID ) == false ) then 
		ScriptMessage( PlayerID , PlayerID , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--��ưe�X�����D
		return 0
	end
	while true do
		Sleep( 5 )
		RunTime = RunTime + 1
		if RunTime  > 600 then -- ���L�a�j��A600 = �@����
			DebugMsg( 0, RoomID ,"Exit the MENU because IDLE a long Time !!")
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		end

		DialogStatus = DialogGetResult( PlayerID )
		--Say( PlayerID , DialogStatus )

		local Addstaus = 10									--�ݩʼW�[ ���۫סB�����סB���m
		if DialogStatus == -2 then
			-- DO nothing
		elseif DialogStatus == -1 then
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		elseif DialogStatus == 1 then--�ƥ���D_1  ���G
			Addstaus = 1
			local Str = "[SC_PETS_EVENT_00_00_01][$SETVAR1=".."[SC_PETS_EVENT_00_00_03]".."][$SETVAR2="..Addstaus.."]"
			local NowLoyal = ReadPetValue( PlayerID, ModePet ,EM_CultivatePetStructValueType_Loyal )--�ثe���۫�

			if (NowLoyal + Addstaus) > 100 then
				WritePetValue( PlayerID , ModePet , EM_CultivatePetStructValueType_Loyal , 100 )
			else
				AddPetValue( PlayerID , ModePet , EM_CultivatePetStructValueType_Loyal , Addstaus )  
			end
			ScriptMessage( PlayerID , PlayerID , 1 , Str , "0xff00ffff" )
			ScriptMessage( PlayerID , PlayerID , 0 , Str , "0xff00ffff" )
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		elseif DialogStatus == 2 then--�ƥ���D_2  ���G
			local Str = "[SC_PETS_EVENT_00_00_01][$SETVAR1=".."[SC_PETS_EVENT_00_00_04]".."][$SETVAR2="..Addstaus.."]"
			local NowHunger = ReadPetValue( PlayerID, ModePet ,EM_CultivatePetStructValueType_Hunger )--�ثe������

			if (NowHunger + Addstaus) > 100 then
				WritePetValue( PlayerID , ModePet , EM_CultivatePetStructValueType_Hunger , 100 )
			else
				AddPetValue( PlayerID , ModePet , EM_CultivatePetStructValueType_Hunger , Addstaus )  
			end

			ScriptMessage( PlayerID , PlayerID , 1 , Str , "0xff00ffff" )
			ScriptMessage( PlayerID , PlayerID , 0 , Str , "0xff00ffff" )
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		elseif DialogStatus == 3 then--�ƥ���D_3  ���G
			local Str = "[SC_PETS_EVENT_00_00_01][$SETVAR1=".."[SC_PETS_EVENT_00_00_05]".."][$SETVAR2="..Addstaus.."]"
			local NowSpirit = ReadPetValue( PlayerID, ModePet ,EM_CultivatePetStructValueType_Spirit )--�ثe���m��

			if (NowSpirit + Addstaus) > 10000 then
				WritePetValue( PlayerID , ModePet , EM_CultivatePetStructValueType_Spirit , 10000 )
			else
				AddPetValue( PlayerID , ModePet , EM_CultivatePetStructValueType_Spirit , Addstaus )  
			end

			ScriptMessage( PlayerID , PlayerID , 1 , Str , "0xff00ffff" )
			ScriptMessage( PlayerID , PlayerID , 0 , Str , "0xff00ffff" )
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		elseif DialogStatus == 4 then--�ƥ���D_4  ���G
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		end

	end
end

------------------------------------------------------------------------------------------------------"*--�m�ͬ��ƥ�n--*"-----------------------------------------------------------------------------------------------------------------------

function Yuyu_Pet_Event_Life_01() --�ͬ��ƥ�   /gm ? runplot Yuyu_Pet_Event_Life_01
--OwnerID()  ���a

	local PlayerID = OwnerID()
	local Mode = -1
	local ModePet = -1
	local RoomID = ReadRoleValue( PlayerID , EM_RoleValue_RoomID )

	for i = 0,5 do

		Mode = ReadPetValue( PlayerID , i ,EM_CultivatePetStructValueType_EventType ) --�d�����A(���Q�l��(2)�B���b�Ȧ�(4)�B���b�Ͳ�(8)...etc)

		if Mode == 2 then
			ModePet = i	--�g�Ji�����b�l��X�Ӫ��d�����Ǹ�
			ModePet = ModePet+1	--�����ϥΡA�d�����q1�}�l
		end
	end

	local CheckTime = 1
	local RunTime = 1
	local DialogStatus = 0
	local TransferSelect = {}

	local Event_Life = { }
	Event_Life[0] = {"[SC_PETS_EVENT_01_01_00]","[SC_PETS_EVENT_01_01_01]","[SC_PETS_EVENT_01_01_02]","[SC_PETS_EVENT_01_01_03]"}	
	Event_Life[1] = {"[SC_PETS_EVENT_01_02_00]","[SC_PETS_EVENT_01_02_01]","[SC_PETS_EVENT_01_02_02]","[SC_PETS_EVENT_01_02_03]"}
	Event_Life[2] = {"[SC_PETS_EVENT_01_03_00]","[SC_PETS_EVENT_01_03_01]","[SC_PETS_EVENT_01_03_02]","[SC_PETS_EVENT_01_03_03]"}
	Event_Life[3] = {"[SC_PETS_EVENT_01_04_00]","[SC_PETS_EVENT_01_04_01]","[SC_PETS_EVENT_01_04_02]","[SC_PETS_EVENT_01_04_03]"}				
	Event_Life[4] = {"[SC_PETS_EVENT_01_05_00]","[SC_PETS_EVENT_01_05_01]","[SC_PETS_EVENT_01_05_02]","[SC_PETS_EVENT_01_05_03]"}
	Event_Life[5] = {"[SC_PETS_EVENT_01_06_00]","[SC_PETS_EVENT_01_06_01]","[SC_PETS_EVENT_01_06_02]","[SC_PETS_EVENT_01_06_03]"}
	Event_Life[6] = {"[SC_PETS_EVENT_01_07_00]","[SC_PETS_EVENT_01_07_01]","[SC_PETS_EVENT_01_07_02]","[SC_PETS_EVENT_01_07_03]"}
	Event_Life[7] = {"[SC_PETS_EVENT_01_08_00]","[SC_PETS_EVENT_01_08_01]","[SC_PETS_EVENT_01_08_02]","[SC_PETS_EVENT_01_08_03]"}				
	Event_Life[8] = {"[SC_PETS_EVENT_01_09_00]","[SC_PETS_EVENT_01_09_01]","[SC_PETS_EVENT_01_09_02]","[SC_PETS_EVENT_01_09_03]"}
	Event_Life[9] = {"[SC_PETS_EVENT_01_10_00]","[SC_PETS_EVENT_01_10_01]","[SC_PETS_EVENT_01_10_02]","[SC_PETS_EVENT_01_10_03]"}

	local STRING = Rand( 10 )      

	TransferSelect[0] = { ModePet .. "" } -- PET _ POS  �d����m�A���g�k�Y�O���e�����N���ഫ���r��
	if STRING <5 then
		TransferSelect[1] = { "interface\\Icons\\PetSystem\\pet_event05" } --�ϧθ��|   Tag�ɤj�p�G512*125   �ϧγW��G274*124
	else
		TransferSelect[1] = { "interface\\Icons\\PetSystem\\pet_event06" } --�ϧθ��|   Tag�ɤj�p�G512*125   �ϧγW��G274*124
	end
	TransferSelect[2] = { Event_Life[STRING][2] } --�ƥ���D_1
	TransferSelect[3] = { Event_Life[STRING][3] } --�ƥ���D_2
	TransferSelect[4] = { Event_Life[STRING][4] } --�ƥ���D_3
	TransferSelect[5] = { "[SC_PETS_EVENT_00_00_00]" } --�ƥ���D_4
	if CheckBuff( PlayerID , 501570) == true then 
		ScriptMessage( PlayerID , PlayerID , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		return
	end
	DialogCreate( PlayerID , EM_LuaDialogType_Pet , Event_Life[STRING][1] )--�ƥ󤺮e(string)
	AddBuff(PlayerID , 501570,0,-1);

	ModePet = ModePet-1	--�]���e�����F���i�����j�ϥΦ��ѼơA�[�F 1�AServer�ݫh�����٭��ȡA�G-1

	for i = 0, table.getn( TransferSelect ) do
		DialogSelectStr( PlayerID , TransferSelect[i][1] )
	end

	if( DialogSendOpen( PlayerID ) == false ) then 
		ScriptMessage( PlayerID , PlayerID , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--��ưe�X�����D
		return 0
	end
	while true do
		Sleep( 5 )
		RunTime = RunTime + 1
		if RunTime  > 600 then -- ���L�a�j��A600 = �@����
			DebugMsg( 0, RoomID ,"Exit the MENU because IDLE a long Time !!")
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		end

		DialogStatus = DialogGetResult( PlayerID )
		--Say( PlayerID , DialogStatus )

		if (STRING == 0) or (STRING == 2) or (STRING == 4) or (STRING == 6) or (STRING == 8) then		--�ݩʼW�[ �O�q�B�@�O�B�ӱ�
			local Addstaus = 0.05
			if DialogStatus == -2 then
				-- DO nothing
			elseif DialogStatus == -1 then
				DialogClose( PlayerID )
				CancelBuff( PlayerID, 501570 );--
				break
			elseif DialogStatus == 1 then--�ƥ���D_1  ���G
				local Str = "[SC_PETS_EVENT_00_00_01][$SETVAR1=".."[SC_SKILLTIPS_STR]".."][$SETVAR2="..Addstaus.."]"
				AddPetValue( PlayerID , ModePet , EM_CultivatePetStructValueType_Str , Addstaus )  
				ScriptMessage( PlayerID , PlayerID , 1 , Str , "0xff00ffff" )
				ScriptMessage( PlayerID , PlayerID , 0 , Str , "0xff00ffff" )
				DialogClose( PlayerID )
				CancelBuff( PlayerID, 501570 );--
				break
			elseif DialogStatus == 2 then--�ƥ���D_2  ���G
				local Str = "[SC_PETS_EVENT_00_00_01][$SETVAR1=".."[SC_SKILLTIPS_AGI]".."][$SETVAR2="..Addstaus.."]"
				AddPetValue( PlayerID , ModePet , EM_CultivatePetStructValueType_Agi , Addstaus )  
				ScriptMessage( PlayerID , PlayerID , 1 , Str , "0xff00ffff" )
				ScriptMessage( PlayerID , PlayerID , 0 , Str , "0xff00ffff" )
				DialogClose( PlayerID )
				CancelBuff( PlayerID, 501570 );--
				break
			elseif DialogStatus == 3 then--�ƥ���D_3  ���G
				local Str = "[SC_PETS_EVENT_00_00_01][$SETVAR1=".."[SC_SKILLTIPS_STA]".."][$SETVAR2="..Addstaus.."]"
				AddPetValue( PlayerID , ModePet , EM_CultivatePetStructValueType_Sta , Addstaus )  
				ScriptMessage( PlayerID , PlayerID , 1 , Str , "0xff00ffff" )
				ScriptMessage( PlayerID , PlayerID , 0 , Str , "0xff00ffff" )
				DialogClose( PlayerID )
				CancelBuff( PlayerID, 501570 );--
				break
			elseif DialogStatus == 4 then--�ƥ���D_4  ���G
				DialogClose( PlayerID )
				CancelBuff( PlayerID, 501570 );--
				break
			end
		else											--�ݩʼW�[ ���z�B�믫�B���
			local Addstaus = 0.05
			if DialogStatus == -2 then
				-- DO nothing
			elseif DialogStatus == -1 then
				DialogClose( PlayerID )
				CancelBuff( PlayerID, 501570 );--
				break
			elseif DialogStatus == 1 then--�ƥ���D_1  ���G 
				local Str = "[SC_PETS_EVENT_00_00_01][$SETVAR1=".."[SC_SKILLTIPS_INT]".."][$SETVAR2="..Addstaus.."]"
				AddPetValue( PlayerID , ModePet , EM_CultivatePetStructValueType_Int , Addstaus )  
				ScriptMessage( PlayerID , PlayerID , 1 , Str , "0xff00ffff" )
				ScriptMessage( PlayerID , PlayerID , 0 , Str , "0xff00ffff" )
				DialogClose( PlayerID )
				CancelBuff( PlayerID, 501570 );--
				break
			elseif DialogStatus == 2 then--�ƥ���D_2  ���G
				local Str = "[SC_PETS_EVENT_00_00_01][$SETVAR1=".."[SC_SKILLTIPS_MND]".."][$SETVAR2="..Addstaus.."]"
				AddPetValue( PlayerID , ModePet , EM_CultivatePetStructValueType_Mnd , Addstaus )  
				ScriptMessage( PlayerID , PlayerID , 1 , Str , "0xff00ffff" )
				ScriptMessage( PlayerID , PlayerID , 0 , Str , "0xff00ffff" )
				DialogClose( PlayerID )
				CancelBuff( PlayerID, 501570 );--
				break
			elseif DialogStatus == 3 then--�ƥ���D_3  ���G
				Addstaus = 0.01
				local Str = "[SC_PETS_EVENT_00_00_01][$SETVAR1=".."[SC_PETS_EVENT_00_00_02]".."][$SETVAR2="..Addstaus.."]"
				local NowTalent = ReadPetValue( PlayerID, ModePet ,EM_CultivatePetStructValueType_Talent )--�ثe���

				if (NowTalent + Addstaus) > 100 then
					WritePetValue( PlayerID , ModePet , EM_CultivatePetStructValueType_Talent , 100 )
				else
					AddPetValue( PlayerID , ModePet , EM_CultivatePetStructValueType_Talent , Addstaus )  
				end

				ScriptMessage( PlayerID , PlayerID , 1 , Str , "0xff00ffff" )
				ScriptMessage( PlayerID , PlayerID , 0 , Str , "0xff00ffff" )
				DialogClose( PlayerID )
				CancelBuff( PlayerID, 501570 );--
				break
			elseif DialogStatus == 4 then--�ƥ���D_4  ���G
				DialogClose( PlayerID )
				CancelBuff( PlayerID, 501570 );--
				break
			end
		end
	end
end
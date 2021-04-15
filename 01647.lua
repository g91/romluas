
function Yuyu_SetPetEgg_1_00(Pos,Type) -- �d���J�m�J�@��
--Say(OwnerID(),OwnerID())
--Say(TargetID(),TargetID())

--Pos �d����m
--Type 0 ��J 1 ���X
--ReadPetValue( GItemID , PetPos , ValueType )    Ū���d��(OwnerID(�D�H), �ĴX���d��,�����ݩ�)
--WritePetValue( GItemID , PetPos , ValueType , Value )  �g�J�d��(OwnerID(�D�H), �ĴX���d��,�����ݩ�,�g�J��)
--AddPetValue( GItemID , PetPos , ValueType , Value )  �[�g�J�d��(OwnerID(�D�H), �ĴX���d��,�����ݩ�,�g�J��)

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	local Loyal = ReadPetValue( OwnerID(), Pos ,EM_CultivatePetStructValueType_Loyal )				--���۫�
	local Hunger = ReadPetValue( OwnerID(), Pos ,EM_CultivatePetStructValueType_Hunger )			--������
	local Talent = ReadPetValue( OwnerID(), Pos ,EM_CultivatePetStructValueType_Talent )			--���
	local Spirit = ReadPetValue( OwnerID(), Pos ,EM_CultivatePetStructValueType_Spirit )				--���m��

	local Z = 10
	local Add = Rand( Z )    --�ץ���

	if Type == 0 then--�J�J��i�h����

		local P = 70
		local Loyal = Rand( P )    
		if Loyal < 50 then
			Loyal = 50+Add
		end
		WritePetValue( OwnerID() , Pos , EM_CultivatePetStructValueType_Loyal , Loyal ) --�g�J ���۫�
		WritePetValue( OwnerID() , Pos , EM_CultivatePetStructValueType_Hunger , 60 ) --�g�J ������
--		Spirit = (Spirit+Add)*2
--		WritePetValue( OwnerID() , Pos , EM_CultivatePetStructValueType_Spirit , Spirit ) --�g�J ���m��

	end
end

--**********************************************************************************************************************
--**********************************************************************************************************************
--*********************************************��}�C��i�ĦX���ƤW��**************************************************
--**********************************************************************************************************************
--**********************************************************************************************************************
--**********************************************************************************************************************

--�� ���ի��O�G�i��}�C��i�ĦX���ƤW���C
--WriteRoleValue( OwnerID() , EM_RoleValue_CultivatePet_NextMergeResetTime  , 0 )

function LuaYU_Pets_Mesh_CountOpen_00(Option)--�d���_���J���}�q�@��
	local PlayerID = OwnerID()
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	local Mesh_CountOpen = ReadRoleValue( PlayerID ,EM_RoleValue_CultivatePet_NextMergeResetTime) 

	if ( Option == "CHECK" ) then

		return true

	elseif ( Option == "USE" ) then
		Beginplot( PlayerID ,"LuaYU_Pets_Mesh_CountOpen_01", 0 )
	end
end

function LuaYU_Pets_Mesh_CountOpen_01()
	local PlayerID = OwnerID()
	WriteRoleValue( OwnerID() , EM_RoleValue_CultivatePet_NextMergeResetTime  , 0 )
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_PETSYS_70]" , 0 )--���\���m�Ҧ��d�����餧�i�ĦX���ơC
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_PETSYS_70]" , 0 )
end

--**********************************************************************************************************************
--**********************************************************************************************************************
--*********************************************�d���_���J���}�q�@��**************************************************
--**********************************************************************************************************************
--**********************************************************************************************************************
--**********************************************************************************************************************

function LuaYU_Pets_House_Open_00(Option)--�d���_���J���}�q�@��
	local PlayerID = OwnerID()
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	local PetPage03 = ReadRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage3 )
	local PetPage04 = ReadRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage4 )
	local PetPage05 = ReadRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage5 )
	local PetPage06 = ReadRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage6 )

	local PetPage = {PetPage03,PetPage04,PetPage05,PetPage06}	
	local PageEmpty = 0						--�ťժ���츹�X

	for J = 1,4 do
		DebugMsg( 0, RoomID ,"PetPageStatus = "..PetPage[J] )
	end
	for i = 1,4 do

		if PetPage[i]==-1 then					-- -1��ܸ����|���}�ҡC
			PageEmpty = i					--�ثe�ťժ���츹�X���Ǹ��̤p��
			break
		end

	end

	if ( Option == "CHECK" ) then
		if PageEmpty ~= 0 then					--�p�G�ثe���ťժ����
			return true
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_PETSYS_63]" , 0 )--�ثe�}�q���w�F�W���I
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_PETSYS_63]" , 0 )
			return false
		end
	elseif ( Option == "USE" ) then
		Beginplot( PlayerID ,"LuaYU_Pets_House_Open_01", 0 )
	end
end

function LuaYU_Pets_House_Open_01()
	local PlayerID = OwnerID()
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	local PetPage03 = ReadRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage3 )
	local PetPage04 = ReadRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage4 )
	local PetPage05 = ReadRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage5 )
	local PetPage06 = ReadRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage6 )

	local PetPage = {PetPage03,PetPage04,PetPage05,PetPage06}	
	local PageEmpty = 0						--�ťժ���츹�X
	for J = 1,4 do
		DebugMsg( 0, RoomID ,"PetPageStatus = "..PetPage[J] )
	end
	for i = 1,4 do

		if PetPage[i]==-1 then					-- -1��ܸ����|���}�ҡC
			PageEmpty = i					--�ثe�ťժ���츹�X���Ǹ��̤p��
			break
		end

	end


	if PageEmpty ~= 0 then					--�p�G�ثe���ťժ����					--�ťժ���츹�X

		local Ticket =  CountBodyItem( PlayerID , 204513 ) --���⨭�W�O�_�� �_���J���|��

		if Ticket >0 then
			if PageEmpty == 1 then
				PageEmpty=PageEmpty+2
				local Str = "[SC_PETSYS_65][$SETVAR1="..PageEmpty.."]"
				WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage3 , 52560000 )
				--WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage6 , 180 )-- 180�� = 3�p��
				ScriptMessage( OwnerID() , OwnerID() , 1 , Str , "0xff00ffff" )--���ߡI�w���\�}�q��[$VAR1]�檺�_���J���|��C
				ScriptMessage( OwnerID() , OwnerID() , 0 , Str , "0xff00ffff" )
			elseif PageEmpty == 2 then
				PageEmpty=PageEmpty+2
				local Str = "[SC_PETSYS_65][$SETVAR1="..PageEmpty.."]"
				WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage4 , 52560000 )
				--WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage6 , 180 )-- 180�� = 3�p��
				ScriptMessage( OwnerID() , OwnerID() , 1 , Str , "0xff00ffff" )
				ScriptMessage( OwnerID() , OwnerID() , 0 , Str , "0xff00ffff" )
			elseif PageEmpty == 3 then
				PageEmpty=PageEmpty+2
				local Str = "[SC_PETSYS_65][$SETVAR1="..PageEmpty.."]"
				WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage5 , 52560000 )
				--WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage6 , 180 )-- 180�� = 3�p��
				ScriptMessage( OwnerID() , OwnerID() , 1 , Str , "0xff00ffff" )
				ScriptMessage( OwnerID() , OwnerID() , 0 , Str , "0xff00ffff" )
			elseif PageEmpty == 4 then
				PageEmpty=PageEmpty+2
				local Str = "[SC_PETSYS_65][$SETVAR1="..PageEmpty.."]"
				WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage6 , 52560000 )
				--WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage6 , 180 )-- 180�� = 3�p��
				ScriptMessage( OwnerID() , OwnerID() , 1 , Str , "0xff00ffff" )
				ScriptMessage( OwnerID() , OwnerID() , 0 , Str , "0xff00ffff" )
			end
			Beginplot( PlayerID ,"LuaYU_Pets_House_Open_02", 0 )
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_PETSYS_66]" , 0 )
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_PETSYS_66]" , 0 )
		end
	end
end

function LuaYU_Pets_House_Open_02()
	local ID = OwnerID() --���a
	DelBodyItem( ID , 204513 , 1 ) -- �����@�� �_���J���|��
end

--*********************************************�d���_���J���}�q�@��  �{�� ���ե�**************************************************

function LuaYU_Pets_House_Open_Test()--�d���_���J���}�q�@��
	local PlayerID = OwnerID()
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	local PetPage03 = ReadRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage3 )
	local PetPage04 = ReadRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage4 )
	local PetPage05 = ReadRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage5 )
	local PetPage06 = ReadRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage6 )

	local PetPage = {PetPage03,PetPage04,PetPage05,PetPage06}	
	local PageEmpty = 0						--�ťժ���츹�X
	for J = 1,4 do
		DebugMsg( 0, RoomID ,"PetPageStatus = "..PetPage[J] )
	end
	for i = 1,4 do

		if PetPage[i]==-1 then					-- -1��ܸ����|���}�ҡC
			PageEmpty = i					--�ثe�ťժ���츹�X���Ǹ��̤p��
			break
		end

	end


	if PageEmpty ~= 0 then					--�p�G�ثe���ťժ����
		local CheckTime = 1
		local RunTime = 1
		local DialogStatus = 0
		local TransferSelect = {}
		TransferSelect[0] = { "-------- YES --------" }
		TransferSelect[1] = { "-------- NO --------" }

		DialogCreate( OwnerID() , EM_LuaDialogType_Select , "Do You Want To Open The Pet's House ?" )
		for i = 0, table.getn( TransferSelect ) do
			DialogSelectStr( OwnerID() , TransferSelect[i][1] )
		end
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--��ưe�X�����D
			return 0
		end
		while true do
			Sleep( 5 )
			RunTime = RunTime + 1
			if RunTime  > 600 then -- ���L�a�j��A600 = �@����
				DebugMsg( 0, RoomID ,"Exit the MENU because IDLE a long Time !!")
				DialogClose( PlayerID )
				break
			end

			DialogStatus = DialogGetResult( PlayerID )
			--Say( PlayerID , DialogStatus )

			if DialogStatus == -2 then
				-- DO nothing
			elseif DialogStatus == 1 or DialogStatus == -1 then
				DialogClose( PlayerID )
				break
			elseif DialogStatus == 0 then

				if PageEmpty == 1 then
					PageEmpty=PageEmpty+2
					WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage3 , 52560000 )
					--WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage6 , 180 )-- 180�� = 3�p��
					ScriptMessage( OwnerID() , OwnerID() , 1 , "PetPage "..PageEmpty.." is Open!!" , "0xff00ffff" )
					ScriptMessage( OwnerID() , OwnerID() , 0 , "PetPage "..PageEmpty.." is Open!!" , "0xff00ffff" )
				elseif PageEmpty == 2 then
					PageEmpty=PageEmpty+2
					WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage4 , 52560000 )
					--WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage6 , 180 )-- 180�� = 3�p��
					ScriptMessage( OwnerID() , OwnerID() , 1 , "PetPage "..PageEmpty.." is Open!!" , "0xff00ffff" )
					ScriptMessage( OwnerID() , OwnerID() , 0 , "PetPage "..PageEmpty.." is Open!!" , "0xff00ffff" )
				elseif PageEmpty == 3 then
					PageEmpty=PageEmpty+2
					WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage5 , 52560000 )
					--WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage6 , 180 )-- 180�� = 3�p��
					ScriptMessage( OwnerID() , OwnerID() , 1 , "PetPage "..PageEmpty.." is Open!!" , "0xff00ffff" )
					ScriptMessage( OwnerID() , OwnerID() , 0 , "PetPage "..PageEmpty.." is Open!!" , "0xff00ffff" )
				elseif PageEmpty == 4 then
					PageEmpty=PageEmpty+2
					WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage6 , 52560000 )
					--WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage6 , 180 )-- 180�� = 3�p��
					ScriptMessage( OwnerID() , OwnerID() , 1 , "PetPage "..PageEmpty.." is Open!!" , "0xff00ffff" )
					ScriptMessage( OwnerID() , OwnerID() , 0 , "PetPage "..PageEmpty.." is Open!!" , "0xff00ffff" )
				end
				DialogClose( PlayerID )
				break
			end
		end

	else
				ScriptMessage( OwnerID() , OwnerID() , 1 , "Your Have No EmptyPetPage." , 0 )
				ScriptMessage( OwnerID() , OwnerID() , 0 , "Your Have No EmptyPetPage." , 0 )
	end

end

function LuaYU_Pets_House_Colse_Test()--�d���_���J���3~6�������@��

	local PlayerID = OwnerID()
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	local PetPage03 = ReadRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage3 )
	local PetPage04 = ReadRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage4 )
	local PetPage05 = ReadRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage5 )
	local PetPage06 = ReadRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage6 )

	local PetPage = {PetPage03,PetPage04,PetPage05,PetPage06}	
	local PageEmpty = 0						--�ťժ���츹�X
															--for J = 1,4 do
															--	Say(PlayerID,"PetPageStatus = "..PetPage[J])
															--end
	for i = 1,4 do

		if PetPage[i]==-1 then					-- -1��ܸ����|���}�ҡC
			PageEmpty = i					--�ثe�ťժ���츹�X���Ǹ��̤p��
			break
		end

	end


	WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage3 , -1 )
	WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage4 , -1 )
	WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage5 , -1 )
	WriteRoleValue( PlayerID , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_PetPage6 , -1 )
	Say(PlayerID,"OK!!Set 3~6 is Empty!!!")
end

function LuaYU_Pets_AutoGetTreauses_00()--�P�_�O�_���W�w�����_������BUFF

	if CheckBuff( OwnerID() , 503479 ) == true then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SC_PETSYS_71]",0)--���W�w�Q�x�F���������_����
		return false
	else
		return true
	end
end
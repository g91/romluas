--==================================================--
--  ��ͤ��a�������ȥ洫����                        --
--==================================================--
-- 206219 ���y���ѥ�
function LuaPE_ZONE8_ExChange_Set()
	local Guard = OwnerID()
	local GuardX = ReadRoleValue( Guard , EM_RoleValue_X )
	local GuardY = ReadRoleValue( Guard , EM_RoleValue_Y )
	local GuardZ = ReadRoleValue( Guard , EM_RoleValue_Z )
	local GuardDir = ReadRoleValue( Guard , EM_RoleValue_Dir )
	local Width = 30
	local Height = Width
	local BoxNum = 6
	local BoxID = 113716
	local Box = {}
	local RoomID = 0

	local BoxPosition = LuaPE_ZONE8_02SCA_FormationPosition( GuardX , GuardY , GuardZ , Width , Height , GuardDir )	-- �p��Ө��쪺��m
	for i = 2 , BoxNum do
		Box[i] = CreateObj( BoxID , BoxPosition["X"][i], BoxPosition["Y"][i] , BoxPosition["Z"][i] , GuardDir , 1 )
		SetModeEx( Box[i] , EM_SetModeType_Obstruct , true )		-- ����
		SetModeEx( Box[i] , EM_SetModeType_Gravity , false )		-- ���O
		AddToPartition( Box[i] , RoomID )
		SetPlot( Box[i] , "TOUCH" , "LuaPE_ZONE8_BowBox"..(i-1) , 15 )
	end

	--BeginPlot( Guard , "LuaPE_ZONE8_ExCha_BoxReborn" , 0 )
end

function LuaPE_ZONE8_ExCha_BoxReborn()
	local BoxID = 113716

--Say( OwnerID() , "run" )
	while true do
		local OpenBoxNum = 0
		Sleep( 600 )
		local SearchObj = SearchRangeNPC( OwnerID() , 500 )
		if SearchObj[0] == -1 then	-- �䤣��H
		else
			for i = 0, table.getn(SearchObj)-1 do	-- �̫�@��-1���n�A�ҥH�n-1
				if SearchObj[i] == OwnerID() then	-- �ۤv����
				else
					if ReadRoleValue( SearchObj[i] , EM_RoleValue_OrgID ) == BoxID then	-- ����_�c
						if ReadRoleValue( SearchObj[i] , EM_RoleValue_PID ) == 1 then
							OpenBoxNum = OpenBoxNum + 1
							--Say( SearchObj[i] , "Open" )
						else
							--Say( SearchObj[i] , "No Open" )
						end

					end
				end
			end
		end

		if OpenBoxNum >= 5 then
			local tmp = 0
			for j = 0, table.getn(SearchObj)-1 do
				if ReadRoleValue( SearchObj[j] , EM_RoleValue_OrgID ) == BoxID then	-- ����_�c
					tmp = tmp + 1
					SetPlot( SearchObj[j] , "TOUCH" , "LuaPE_ZONE8_BowBox"..tmp , 15 )
					WriteRoleValue( SearchObj[j] , EM_RoleValue_PID , 0 )
					PlayMotionEX( SearchObj[j] , ruFUSION_ACTORSTATE_ACTIVATE_END , ruFUSION_ACTORSTATE_NORMAL )
				end
			end
		end
	end
end

function LuaPE_ZONE8_ExChange()
	local ItemID = 205971	-- �D�H���O
	local SilverKeyID = 206011	-- ���������_��
	local GoldenKeyID = 206012	-- ���������_��

	--LoadQuestOption( OwnerID() )  --���J���ȼҪO
	local Num = CountBodyItem( OwnerID() , ItemID )

	if Num <= 0 then
		SetSpeakDetail( OwnerID() , "[SC_PE_ZONE8_11]" )	-- �ڭ̬������ثe���H���O����D�H�ɵ��u�W���U�ت��p�A�úܺɩү�I�_�D�H���p���P�ɵ��C�^�i���_�I�̰ڡI�u�n�A���U�ڭ̬������ѨM�D�H�����D�A�ñq�L�̨��W���o[205971]�A����A�N�i�H�γo��[205971]���ҡA�洫�ڨ����_�c�̭������~�ӱN�@�A�^�i�欰�����S�I
	elseif Num > 0 and Num < 30 then
		SetSpeakDetail( OwnerID() , "[SC_PE_ZONE8_12]" )	-- ���§A��ڭ̬���������U�A���L�A�Ҩ��o��[205971]�ƶq���G�٤����h�A�A�i��o�յۨ��o 100 �ӥH�W���ƶq�A�ӻP�ڥ洫�C
	elseif Num >= 30 and Num < 135 then
		SetSpeakDetail( OwnerID() , "[SC_PE_ZONE8_13]" )	-- ���§A��ڭ̬���������U�A�A�Q�ϥ�[205971]�ӥ洫����ܡH
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_PE_ZONE8_14]" , "LuaPE_ZONE8_ExChange1" , 0 )	-- �H 30 ��[205971] �洫 1 ������_�c�����_��
	elseif Num >= 135 then
		SetSpeakDetail( OwnerID() , "[SC_PE_ZONE8_13]" )	-- ���§A��ڭ̬���������U�A�A�Q�ϥ�[205971]�ӥ洫����ܡH
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_PE_ZONE8_14]" , "LuaPE_ZONE8_ExChange1" , 0 )	-- �H 30 ��[205971] �洫 1 ��[206011]
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_PE_ZONE8_15]" , "LuaPE_ZONE8_ExChange2" , 0 )	-- �H 135 ��[205971] �洫 5 ��[206012]
	end
end

function LuaPE_ZONE8_ExChange1()
	local ItemID = 205971		-- �D�H���O
	local SilverKeyID = 206011	-- ���������_��

	local NeedSpace = 1
	local NeedSpaceStatus = Check_Bag_Space( OwnerID() , NeedSpace )
	if ( NeedSpaceStatus  == false ) then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[MSG_SONGSONGBAGWARN]", C_DEFAULT )	-- �I�]�Ů���줣���A�L�k�~����o���~�I
		return false
	else
		if CountBodyItem( OwnerID() , ItemID ) >= 30 then
			if DelBodyItem( OwnerID() , ItemID , 30 ) == true then
				SetSpeakDetail( OwnerID() , "[SC_PE_ZONE8_16]" )	-- �o�O�_�c���_�͡A�ЧA��ܳ��w���_�c���}�A�H���o�A�洫�����ફ�~�a�I
				GiveBodyItem( OwnerID() , SilverKeyID , 1 )
			end
		end
	end
end

function LuaPE_ZONE8_ExChange2()
	local ItemID = 205971		-- �D�H���O
	--local GoldenKeyID = 206012	-- ���������_��
	local GoldenKeyID = 206011	-- ���������_��

	local NeedSpace = 1
	local NeedSpaceStatus = Check_Bag_Space( OwnerID() , NeedSpace )
	if ( NeedSpaceStatus  == false ) then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[MSG_SONGSONGBAGWARN]", C_DEFAULT )	-- �I�]�Ů���줣���A�L�k�~����o���~�I
		return false
	else
		if CountBodyItem( OwnerID() , ItemID ) >= 135 then
			if DelBodyItem( OwnerID() , ItemID , 135 ) == true then
				SetSpeakDetail( OwnerID() , "[SC_PE_ZONE8_16]" )	-- �o�O�_�c���_�͡A�ЧA��ܳ��w���_�c���}�A�H���o�A�洫�����ફ�~�a�I
				GiveBodyItem( OwnerID() , GoldenKeyID , 5 )
			end
		end
	end
end

function LuaPE_ZONE8_BowBox1()	-- �}�_�c�ʧ@
	local SilverKeyID = 206011	-- ���������_��
	local GoldenKeyID = 206012	-- ���������_��
	local UseSilverKey = 0		-- �ϥλ��_��
	local UseGoldenKey = 0		-- �ϥΪ��_��

	if ReadRoleValue( TargetID() , EM_RoleValue_PID ) == 1 then
		--ScriptMessage( OwnerID(), OwnerID(), 1, "[TREASURE_NEED_KEY]", C_DEFAULT )
	else
		if CountBodyItem( OwnerID() , SilverKeyID ) >= 1 then
			UseSilverKey = 1
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
		elseif CountBodyItem( OwnerID() , GoldenKeyID ) >= 1 then
			UseGoldenKey = 1
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, "[TREASURE_NEED_KEY]", C_DEFAULT )	-- �ݭn�_�ͤ~��}��
		end
	end

	if UseSilverKey == 1 or UseGoldenKey == 1 then
		local NeedSpace = 6
		if EmptyPacketCount( OwnerID() ) < NeedSpace then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[MSG_SONGSONGBAGWARN]", C_DEFAULT )	-- �I�]�Ů���줣���A�L�k�~����o���~�I
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			return
		elseif QueuePacketCount( OwnerID() ) > 0 then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_PE_ZONE8_17]", C_DEFAULT )	-- �е��ݪ��~�����i�J��I�]�����I
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			return
		end

		if BeginCastBar( OwnerID() , "[TREASURE_OPEN]" , 10 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) ~= 1 then
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SAY_NPC_BUSY]" , 0 )
			return
		end
		while true do
		Sleep( 2 )
			local CastBarStatus = CheckCastBar( OwnerID() )
			if ( CastBarStatus ~= 0 ) then 
				if ( CastBarStatus > 0) then -- ���\
					result = "OKOK"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				elseif ( CastBarStatus < 0 ) then -- ����
					result = "DAME"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				end
			end
		end

		if ( result == "OKOK" ) then
			if DelBodyItem( OwnerID() , SilverKeyID , 1 ) == true then
				local BoxContentID , BoxContentNum = LuaPE_ZONE8_BoxContent()
				PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
				SetPlot( TargetID() , "TOUCH" , "" , 0 )
				for i = 1 , table.getn(BoxContentID) do
					GiveBodyItem( OwnerID() , BoxContentID[i] , BoxContentNum[i] )
					Sleep(5)
				end
			elseif DelBodyItem( OwnerID() , GoldenKeyID , 1 ) == true then
				local BoxContentID , BoxContentNum = LuaPE_ZONE8_BoxContent()
				PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
				WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
				SetPlot( TargetID() , "TOUCH" , "" , 0 )
				for i = 1 , table.getn(BoxContentID) do
					GiveBodyItem( OwnerID() , BoxContentID[i] , BoxContentNum[i] )
					Sleep(5)
				end	
			end

			Sleep( 10 )
			SetPlot( TargetID() , "TOUCH" , "LuaPE_ZONE8_BowBox1" , 15 )
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_END , ruFUSION_ACTORSTATE_NORMAL )

		else
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
		end
	end
end
function LuaPE_ZONE8_BowBox2()	-- �}�_�c�ʧ@
	local SilverKeyID = 206011	-- ���������_��
	local GoldenKeyID = 206012	-- ���������_��
	local UseSilverKey = 0		-- �ϥλ��_��
	local UseGoldenKey = 0		-- �ϥΪ��_��

	if ReadRoleValue( TargetID() , EM_RoleValue_PID ) == 1 then
		--ScriptMessage( OwnerID(), OwnerID(), 1, "[TREASURE_NEED_KEY]", C_DEFAULT )
	else
		if CountBodyItem( OwnerID() , SilverKeyID ) >= 1 then
			UseSilverKey = 1
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
		elseif CountBodyItem( OwnerID() , GoldenKeyID ) >= 1 then
			UseGoldenKey = 1
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, "[TREASURE_NEED_KEY]", C_DEFAULT )	-- �ݭn�_�ͤ~��}��
		end
	end

	if UseSilverKey == 1 or UseGoldenKey == 1 then
		local NeedSpace = 6
		if EmptyPacketCount( OwnerID() ) < NeedSpace then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[MSG_SONGSONGBAGWARN]", C_DEFAULT )	-- �I�]�Ů���줣���A�L�k�~����o���~�I
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			return
		elseif QueuePacketCount( OwnerID() ) > 0 then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_PE_ZONE8_17]", C_DEFAULT )	-- �е��ݪ��~�����i�J��I�]�����I
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			return
		end

		if BeginCastBar( OwnerID() , "[TREASURE_OPEN]" , 10 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) ~= 1 then
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SAY_NPC_BUSY]" , 0 )
			return
		end
		while true do
		Sleep( 2 )
			local CastBarStatus = CheckCastBar( OwnerID() )
			if ( CastBarStatus ~= 0 ) then 
				if ( CastBarStatus > 0) then -- ���\
					result = "OKOK"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				elseif ( CastBarStatus < 0 ) then -- ����
					result = "DAME"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				end
			end
		end

		if ( result == "OKOK" ) then
			if DelBodyItem( OwnerID() , SilverKeyID , 1 ) == true then
				local BoxContentID , BoxContentNum = LuaPE_ZONE8_BoxContent()
				PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
				SetPlot( TargetID() , "TOUCH" , "" , 0 )
				for i = 1 , table.getn(BoxContentID) do
					GiveBodyItem( OwnerID() , BoxContentID[i] , BoxContentNum[i] )
					Sleep(5)
				end
			elseif DelBodyItem( OwnerID() , GoldenKeyID , 1 ) == true then
				local BoxContentID , BoxContentNum = LuaPE_ZONE8_BoxContent()
				PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
				WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
				SetPlot( TargetID() , "TOUCH" , "" , 0 )
				for i = 1 , table.getn(BoxContentID) do
					GiveBodyItem( OwnerID() , BoxContentID[i] , BoxContentNum[i] )
					Sleep(5)
				end	
			end

			Sleep( 10 )
			SetPlot( TargetID() , "TOUCH" , "LuaPE_ZONE8_BowBox2" , 15 )
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_END , ruFUSION_ACTORSTATE_NORMAL )

		else
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
		end
	end
end
function LuaPE_ZONE8_BowBox3()	-- �}�_�c�ʧ@
	local SilverKeyID = 206011	-- ���������_��
	local GoldenKeyID = 206012	-- ���������_��
	local UseSilverKey = 0		-- �ϥλ��_��
	local UseGoldenKey = 0		-- �ϥΪ��_��

	if ReadRoleValue( TargetID() , EM_RoleValue_PID ) == 1 then
		--ScriptMessage( OwnerID(), OwnerID(), 1, "[TREASURE_NEED_KEY]", C_DEFAULT )
	else
		if CountBodyItem( OwnerID() , SilverKeyID ) >= 1 then
			UseSilverKey = 1
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
		elseif CountBodyItem( OwnerID() , GoldenKeyID ) >= 1 then
			UseGoldenKey = 1
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, "[TREASURE_NEED_KEY]", C_DEFAULT )	-- �ݭn�_�ͤ~��}��
		end
	end

	if UseSilverKey == 1 or UseGoldenKey == 1 then
		local NeedSpace = 6
		if EmptyPacketCount( OwnerID() ) < NeedSpace then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[MSG_SONGSONGBAGWARN]", C_DEFAULT )	-- �I�]�Ů���줣���A�L�k�~����o���~�I
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			return
		elseif QueuePacketCount( OwnerID() ) > 0 then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_PE_ZONE8_17]", C_DEFAULT )	-- �е��ݪ��~�����i�J��I�]�����I
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			return
		end

		if BeginCastBar( OwnerID() , "[TREASURE_OPEN]" , 10 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) ~= 1 then
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SAY_NPC_BUSY]" , 0 )
			return
		end
		while true do
		Sleep( 2 )
			local CastBarStatus = CheckCastBar( OwnerID() )
			if ( CastBarStatus ~= 0 ) then 
				if ( CastBarStatus > 0) then -- ���\
					result = "OKOK"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				elseif ( CastBarStatus < 0 ) then -- ����
					result = "DAME"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				end
			end
		end

		if ( result == "OKOK" ) then
			if DelBodyItem( OwnerID() , SilverKeyID , 1 ) == true then
				local BoxContentID , BoxContentNum = LuaPE_ZONE8_BoxContent()
				PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
				SetPlot( TargetID() , "TOUCH" , "" , 0 )
				for i = 1 , table.getn(BoxContentID) do
					GiveBodyItem( OwnerID() , BoxContentID[i] , BoxContentNum[i] )
					Sleep(5)
				end
			elseif DelBodyItem( OwnerID() , GoldenKeyID , 1 ) == true then
				local BoxContentID , BoxContentNum = LuaPE_ZONE8_BoxContent()
				PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
				WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
				SetPlot( TargetID() , "TOUCH" , "" , 0 )
				for i = 1 , table.getn(BoxContentID) do
					GiveBodyItem( OwnerID() , BoxContentID[i] , BoxContentNum[i] )
					Sleep(5)
				end	
			end

			Sleep( 10 )
			SetPlot( TargetID() , "TOUCH" , "LuaPE_ZONE8_BowBox3" , 15 )
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_END , ruFUSION_ACTORSTATE_NORMAL )

		else
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
		end
	end
end
function LuaPE_ZONE8_BowBox4()	-- �}�_�c�ʧ@
	local SilverKeyID = 206011	-- ���������_��
	local GoldenKeyID = 206012	-- ���������_��
	local UseSilverKey = 0		-- �ϥλ��_��
	local UseGoldenKey = 0		-- �ϥΪ��_��

	if ReadRoleValue( TargetID() , EM_RoleValue_PID ) == 1 then
		--ScriptMessage( OwnerID(), OwnerID(), 1, "[TREASURE_NEED_KEY]", C_DEFAULT )
	else
		if CountBodyItem( OwnerID() , SilverKeyID ) >= 1 then
			UseSilverKey = 1
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
		elseif CountBodyItem( OwnerID() , GoldenKeyID ) >= 1 then
			UseGoldenKey = 1
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, "[TREASURE_NEED_KEY]", C_DEFAULT )	-- �ݭn�_�ͤ~��}��
		end
	end

	if UseSilverKey == 1 or UseGoldenKey == 1 then
		local NeedSpace = 6
		if EmptyPacketCount( OwnerID() ) < NeedSpace then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[MSG_SONGSONGBAGWARN]", C_DEFAULT )	-- �I�]�Ů���줣���A�L�k�~����o���~�I
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			return
		elseif QueuePacketCount( OwnerID() ) > 0 then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_PE_ZONE8_17]", C_DEFAULT )	-- �е��ݪ��~�����i�J��I�]�����I
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			return
		end

		if BeginCastBar( OwnerID() , "[TREASURE_OPEN]" , 10 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) ~= 1 then
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SAY_NPC_BUSY]" , 0 )
			return
		end
		while true do
		Sleep( 2 )
			local CastBarStatus = CheckCastBar( OwnerID() )
			if ( CastBarStatus ~= 0 ) then 
				if ( CastBarStatus > 0) then -- ���\
					result = "OKOK"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				elseif ( CastBarStatus < 0 ) then -- ����
					result = "DAME"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				end
			end
		end

		if ( result == "OKOK" ) then
			if DelBodyItem( OwnerID() , SilverKeyID , 1 ) == true then
				local BoxContentID , BoxContentNum = LuaPE_ZONE8_BoxContent()
				PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
				SetPlot( TargetID() , "TOUCH" , "" , 0 )
				for i = 1 , table.getn(BoxContentID) do
					GiveBodyItem( OwnerID() , BoxContentID[i] , BoxContentNum[i] )
					Sleep(5)
				end
			elseif DelBodyItem( OwnerID() , GoldenKeyID , 1 ) == true then
				local BoxContentID , BoxContentNum = LuaPE_ZONE8_BoxContent()
				PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
				WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
				SetPlot( TargetID() , "TOUCH" , "" , 0 )
				for i = 1 , table.getn(BoxContentID) do
					GiveBodyItem( OwnerID() , BoxContentID[i] , BoxContentNum[i] )
					Sleep(5)
				end	
			end

			Sleep( 10 )
			SetPlot( TargetID() , "TOUCH" , "LuaPE_ZONE8_BowBox4" , 15 )
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_END , ruFUSION_ACTORSTATE_NORMAL )

		else
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
		end
	end
end
function LuaPE_ZONE8_BowBox5()	-- �}�_�c�ʧ@
	local SilverKeyID = 206011	-- ���������_��
	local GoldenKeyID = 206012	-- ���������_��
	local UseSilverKey = 0		-- �ϥλ��_��
	local UseGoldenKey = 0		-- �ϥΪ��_��

	if ReadRoleValue( TargetID() , EM_RoleValue_PID ) == 1 then
		--ScriptMessage( OwnerID(), OwnerID(), 1, "[TREASURE_NEED_KEY]", C_DEFAULT )
	else
		if CountBodyItem( OwnerID() , SilverKeyID ) >= 1 then
			UseSilverKey = 1
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
		elseif CountBodyItem( OwnerID() , GoldenKeyID ) >= 1 then
			UseGoldenKey = 1
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, "[TREASURE_NEED_KEY]", C_DEFAULT )	-- �ݭn�_�ͤ~��}��
		end
	end

	if UseSilverKey == 1 or UseGoldenKey == 1 then
		local NeedSpace = 6
		if EmptyPacketCount( OwnerID() ) < NeedSpace then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[MSG_SONGSONGBAGWARN]", C_DEFAULT )	-- �I�]�Ů���줣���A�L�k�~����o���~�I
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			return
		elseif QueuePacketCount( OwnerID() ) > 0 then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_PE_ZONE8_17]", C_DEFAULT )	-- �е��ݪ��~�����i�J��I�]�����I
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			return
		end

		if BeginCastBar( OwnerID() , "[TREASURE_OPEN]" , 10 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) ~= 1 then
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SAY_NPC_BUSY]" , 0 )
			return
		end
		while true do
		Sleep( 2 )
			local CastBarStatus = CheckCastBar( OwnerID() )
			if ( CastBarStatus ~= 0 ) then 
				if ( CastBarStatus > 0) then -- ���\
					result = "OKOK"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				elseif ( CastBarStatus < 0 ) then -- ����
					result = "DAME"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				end
			end
		end

		if ( result == "OKOK" ) then
			if DelBodyItem( OwnerID() , SilverKeyID , 1 ) == true then
				local BoxContentID , BoxContentNum = LuaPE_ZONE8_BoxContent()
				PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
				SetPlot( TargetID() , "TOUCH" , "" , 0 )
				for i = 1 , table.getn(BoxContentID) do
					GiveBodyItem( OwnerID() , BoxContentID[i] , BoxContentNum[i] )
					Sleep(5)
				end
			elseif DelBodyItem( OwnerID() , GoldenKeyID , 1 ) == true then
				local BoxContentID , BoxContentNum = LuaPE_ZONE8_BoxContent()
				PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
				WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
				SetPlot( TargetID() , "TOUCH" , "" , 0 )
				for i = 1 , table.getn(BoxContentID) do
					GiveBodyItem( OwnerID() , BoxContentID[i] , BoxContentNum[i] )
					Sleep(5)
				end	
			end

			Sleep( 10 )
			SetPlot( TargetID() , "TOUCH" , "LuaPE_ZONE8_BowBox5" , 15 )
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_END , ruFUSION_ACTORSTATE_NORMAL )

		else
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
		end
	end
end

function LuaPE_ZONE8_BoxContent()

	local BoxContentID = {}
	local BoxContentNum = {}

	BoxContentID[1] = 206249	-- �@�U���ѥ�
	BoxContentNum[1] = 2

	BoxContentID[2] = 206250	-- �@�U�Ť�
	BoxContentNum[2] = 1

	local RNDType = Rand( 100 ) + 1	-- ���� 1~100 ���ü�
	
	if RNDType > 1 and RNDType <= 33 then
		local MaterialID = {}	-- ����LV53
		MaterialID[1] = 200242	-- ���K�q
		MaterialID[2] = 200306	-- ������
		MaterialID[3] = 200345	-- ��۱�
		local MaterialNum = {}
		MaterialNum[1] = 20
		MaterialNum[2] = 20
		MaterialNum[3] = 20

		BoxContentID[3] = MaterialID[1]	-- ���K�q
		BoxContentNum[3] = MaterialNum[1]
		BoxContentID[4] = MaterialID[2]	-- ������
		BoxContentNum[4] = MaterialNum[2]
		BoxContentID[5] = MaterialID[3]	-- ��۱�
		BoxContentNum[5] = MaterialNum[3]


		local MaterialRuneID = {}	-- �Ͳ��Ť�
		MaterialRuneID[1] = 200850	-- �s��
		MaterialRuneID[2] = 200851	-- �N�o
		MaterialRuneID[3] = 200852	-- ����
		MaterialRuneID[4] = 200853	-- ����
		MaterialRuneID[5] = 200854	-- �¤�
		MaterialRuneID[6] = 200855	-- �V�X
		local MaterialRuneNum = {}
		MaterialRuneNum[1] = 10
		MaterialRuneNum[2] = 10
		MaterialRuneNum[3] = 10
		MaterialRuneNum[4] = 10
		MaterialRuneNum[5] = 10
		MaterialRuneNum[6] = 10

		local RND1 = Rand( 6 ) + 1	-- ���� 1~6 ���ü�
		BoxContentID[6] = MaterialRuneID[RND1]	-- �Ͳ��Ť�
		BoxContentNum[6] = MaterialRuneNum[RND1]

	elseif RNDType > 33 and RNDType <= 66 then
		local PotionID = {}	--  ���e�Ĥ�
		PotionID[1] = 204889	-- ���F�į�
		PotionID[2] = 204890	-- ���F������
		PotionID[3] = 200229	-- �j��������
		PotionID[4] = 200270	-- �j���F�P�Ĥ�
		local PotionNum = {}
		PotionNum[1] = 10
		PotionNum[2] = 10
		PotionNum[3] = 4
		PotionNum[4] = 4

		BoxContentID[3] = PotionID[1]	-- ���F�į�
		BoxContentNum[3] = PotionNum[1]
		BoxContentID[4] = PotionID[2]	-- ���F������
		BoxContentNum[4] = PotionNum[2]
		BoxContentID[5] = PotionID[3]	-- �j��������
		BoxContentNum[5] = PotionNum[3]
		BoxContentID[6] = PotionID[4]	-- �j���F�P�Ĥ�
		BoxContentNum[6] = PotionNum[4]

	elseif RNDType > 66 and RNDType <= 100 then
		local FixPotionID = {}	--  ���e�Ĥ�
		FixPotionID[1] = 204889	-- ���F�į�
		FixPotionID[2] = 204890	-- ���F������
		local FixPotionNum = {}
		FixPotionNum[1] = 10
		FixPotionNum[2] = 10

		BoxContentID[3] = FixPotionID[1]	-- ���F�į�
		BoxContentNum[3] = FixPotionNum[1]
		BoxContentID[4] = FixPotionID[2]	-- ���F������
		BoxContentNum[4] = FixPotionNum[2]

		local RNDPotionID = {}	-- �H���Ĥ�
		--RNDPotionID[3] = 200271	-- ��E����	-- �o�Ӥ��e
		RNDPotionID[1] = 200272	-- �t�O�Ĥ�
		RNDPotionID[2] = 200113	-- �N�x�T�⭻�z
		RNDPotionID[3] = 200114	-- ���K�����`��
		local RNDPotionNum = {}
		RNDPotionNum[1] = 1
		RNDPotionNum[2] = 1
		RNDPotionNum[3] = 1

		local RND2 = Rand( 3 ) + 1	-- ���� 1~3 ���ü�
		BoxContentID[5] = RNDPotionID[RND2]	-- �H���Ĥ�
		BoxContentNum[5] = RNDPotionNum[RND2]

		local RNDFoodID = {}	-- �H������
		RNDFoodID[1] = 200143	-- �����P��
		RNDFoodID[2] = 200144	-- ����i�i�p
		local RNDFoodNum = {}
		RNDFoodNum[1] = 3
		RNDFoodNum[2] = 3

		local RND3 = Rand( 2 ) + 1	-- ���� 1~2 ���ü�
		BoxContentID[6] = RNDFoodID[RND3]	-- �H������
		BoxContentNum[6] = RNDFoodNum[RND3]
	end

	return BoxContentID , BoxContentNum;

end

function LuaPE_StoneBag( Option )
	local PlayerID = OwnerID()
	local PackageID = 206249 -- �@�U���ѥ�
	local NeedSpace = 1

	if ( Option == "CHECK" ) then
		if EmptyPacketCount( PlayerID ) < NeedSpace then
			ScriptMessage( PlayerID, PlayerID, 1, "[MSG_SONGSONGBAGWARN]", C_DEFAULT )	-- �I�]�Ů���줣���A�L�k�~����o���~�I
			return false;
		elseif QueuePacketCount( PlayerID ) > 0 then
			ScriptMessage( PlayerID, PlayerID, 1, "[SC_PE_ZONE8_17]", C_DEFAULT )	-- �е��ݪ��~�����i�J��I�]�����I
			return false;
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true;
		end
	elseif ( Option == "USE" ) then
		local Stone3ID = 206219	 -- 3�ݩʼ��y���ѥ�
		local Stone2ID = 206220	 -- 2�ݩʼ��y���ѥ�
		local Stone1ID = 206227	 -- 1�ݩʼ��y���ѥ�

		local RND = Rand( 100 ) + 1	-- ���� 1~100 ���ü�

		if RND > 0 and RND <= 50 then
			GiveBodyItem( PlayerID , Stone3ID , 1 )
		elseif RND > 50 and RND <= 85 then
			GiveBodyItem( PlayerID , Stone2ID , 1 )
		else
			GiveBodyItem( PlayerID , Stone1ID , 1 )
		end
		UseItemDestroy() 		--�R���ϥΤ������~
	end
end
function LuaPE_RuneBag( Option )
	local PlayerID = OwnerID()
	local PackageID = 206250 -- �@�U�Ť�
	local NeedSpace = 1
	local NeedSpaceStatus = Check_Bag_Space( PlayerID , NeedSpace )

	local RuneID = 724938	-- ���y�Ť�

	if ( Option == "CHECK" ) then
		if EmptyPacketCount( PlayerID ) < NeedSpace then
			ScriptMessage( PlayerID, PlayerID, 1, "[MSG_SONGSONGBAGWARN]", C_DEFAULT )	-- �I�]�Ů���줣���A�L�k�~����o���~�I
			return false;
		elseif QueuePacketCount( PlayerID ) > 0 then
			ScriptMessage( PlayerID, PlayerID, 1, "[SC_PE_ZONE8_17]", C_DEFAULT )	-- �е��ݪ��~�����i�J��I�]�����I
			return false;
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true;
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , RuneID , 1 )
		UseItemDestroy() 		--�R���ϥΤ������~
	end
end
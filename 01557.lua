function Lua_apon_113595() ---���s��ƥ�NPC
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_01]" , "Lua_apon_113595_1_1", 0 ) --�D��A���s���I��²��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_02]" , "Lua_apon_113595_1_2", 0 ) --������ƻ���²��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03]" , "Lua_apon_113595_1_3", 0 ) --�i��������
end

function Lua_apon_113595_1_1()
	SetSpeakDetail( OwnerID(), "[SC_113595_01_1]"   )--�D��A���s���I��²���A���e
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595", 0 ) --�^��W�@��
end

function Lua_apon_113595_1_2()
	SetSpeakDetail( OwnerID(), "[SC_113595_02_1]"   )--������ƻ���²���A���e
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595", 0 ) --�^��W�@��
end

function Lua_apon_113595_1_3()----�Ҧ����s������ƪ����~�b���C
	SetSpeakDetail( OwnerID(), "[SC_113595_03_1]"   )--�ڷQ�i�������ơC
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_10]" , "Lua_apon_113595_1_3_01" , 0 ) ---����s��e��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_11]" , "Lua_apon_113595_1_3_02" , 0 ) ---�������s��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_12]" , "Lua_apon_113595_1_3_03" , 0 ) ---�y�U�����s�Q��
	--AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_10]" , "Lua_apon_113595_1_3_4" , 0 ) ---����s��
	--AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_11]" , "Lua_apon_113595_1_3_5" , 0 ) ---�������s��
	--AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_12]" , "Lua_apon_113595_1_3_6" , 0 ) ---�y�U�����s�Q��
	--AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_2]" , "Lua_apon_113595_1_3_1" , 0 ) ---����s��
	--AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_8]" , "Lua_apon_113595_1_3_2" , 0 ) ---�������s��
	--AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_9]" , "Lua_apon_113595_1_3_3" , 0 ) ---�y�U�����s�Q��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_13]" , "Lua_apon_113595_1_3_7" , 0 ) ---�K���s��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_14]" , "Lua_apon_113595_1_3_8" , 0 ) ---���V�s��
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595", 0 ) --�^��W�@��
end

-------����s��e��------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113595_1_3_01() ---��Ʃһݧ��Ƥ��e
	SetSpeakDetail( OwnerID(), "[SC_113595_1_3_01]"   )--������ƪ��һݧ��Ʀp�U
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_1_3_02]" , "Lua_apon_113595_1_3_4" , 0 ) ---�O���A�ڭn�i����ơC
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_1_3_03]" , "Lua_apon_113595_1_3_1" , 0 ) ---�O���A�ڭn�i����ơC
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3", 0 ) --�^��W�@��
end

-------�������s��e��------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113595_1_3_02() ---��Ʃһݧ��Ƥ��e
	SetSpeakDetail( OwnerID(), "[SC_113595_1_3_01]"   )--������ƪ��һݧ��Ʀp�U
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_1_3_02]" , "Lua_apon_113595_1_3_5" , 0 ) ---�O���A�ڭn�i����ơC
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_1_3_03]" , "Lua_apon_113595_1_3_2" , 0 ) ---�O���A�ڭn�i����ơC
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3", 0 ) --�^��W�@��
end

-------�y�U�����s�Q���e��------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113595_1_3_03() ---��Ʃһݧ��Ƥ��e
	SetSpeakDetail( OwnerID(), "[SC_113595_1_3_01]"   )--������ƪ��һݧ��Ʀp�U
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_1_3_02]" , "Lua_apon_113595_1_3_6" , 0 ) ---�O���A�ڭn�i����ơC
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_1_3_03]" , "Lua_apon_113595_1_3_3" , 0 ) ---�O���A�ڭn�i����ơC
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3", 0 ) --�^��W�@��
end

-------����s��------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113595_1_3_1() ---��Ʃһݧ��Ƥ��e
	SetSpeakDetail( OwnerID(), "[SC_113595_03_6]"   )--������ƪ��һݧ��Ʀp�U
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_7]" , "Lua_apon_113595_1_3_1_1" , 0 ) ---�O���A�ڭn�i����ơC
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_01", 0 ) --�^��W�@��
end

function Lua_apon_113595_1_3_1_1()
	local Money = ReadRoleValue(OwnerID() , EM_RoleValue_Money)
	if (Money < 6000) then
		SetSpeakDetail( OwnerID(), "[SC_113595_03_5]" )---�A���W������������I�o������ƶO��
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_01", 0 ) --�^��W�@��
	else
		if CountBodyItem( OwnerID() , 205980 ) >= 3 and CountBodyItem( OwnerID() , 205987 ) >= 6 and CountBodyItem( OwnerID() , 205986 ) >= 6 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then	
				DelBodyItem( OwnerID() , 205980 , 3 )
				DelBodyItem( OwnerID() , 205987 , 6 )
				DelBodyItem( OwnerID() , 205986 , 6 )
				GiveBodyItem( OwnerID(), 205979, 1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Money   , Money - 6000 ) ---����
				SetSpeakDetail( OwnerID(), "[SC_113595_03_3]" )---�������
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_01", 0 ) --�^��W�@��
			else
				SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]")--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_01", 0 ) --�^��W�@��
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_113595_03_4]"   )--�ƶq�����A����I���C
			AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_01", 0 ) --�^��W�@��
		end
	end
end
------�������s��-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113595_1_3_2() ---��Ʃһݧ��Ƥ��e
	SetSpeakDetail( OwnerID(), "[SC_113595_1_3_2]"   )--������ƪ��һݧ��Ʀp�U
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_7]" , "Lua_apon_113595_1_3_2_1" , 0 ) ---�O���A�ڭn�i����ơC
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_02", 0 ) --�^��W�@��
end

function Lua_apon_113595_1_3_2_1()
	local Money = ReadRoleValue(OwnerID() , EM_RoleValue_Money)
	if (Money < 6000) then
		SetSpeakDetail( OwnerID(), "[SC_113595_03_5]" )---�A���W������������I�o������ƶO��
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_02", 0 ) --�^��W�@��
	else
		if CountBodyItem( OwnerID() , 205982 ) >= 3 and CountBodyItem( OwnerID() , 205985 ) >= 6 and CountBodyItem( OwnerID() , 205987 ) >= 6 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then	
				DelBodyItem( OwnerID() , 205982 , 3 )
				DelBodyItem( OwnerID() , 205985 , 6 )
				DelBodyItem( OwnerID() , 205987 , 6 )
				GiveBodyItem( OwnerID(), 205981, 1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Money   , Money - 6000 ) ---����
				SetSpeakDetail( OwnerID(), "[SC_113595_03_3]" )---�������
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_02", 0 ) --�^��W�@��
			else
				SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]")--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_02", 0 ) --�^��W�@��
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_113595_03_4]"   )--�ƶq�����A����I���C
			AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_02", 0 ) --�^��W�@��
		end
	end
end
-------�y�U�����s�Q��------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113595_1_3_3() ---��Ʃһݧ��Ƥ��e
	SetSpeakDetail( OwnerID(), "[SC_113595_1_3_3]"   )--������ƪ��һݧ��Ʀp�U
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_7]" , "Lua_apon_113595_1_3_3_1" , 0 ) ---�O���A�ڭn�i����ơC
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_03", 0 ) --�^��W�@��
end

function Lua_apon_113595_1_3_3_1()
	local Money = ReadRoleValue(OwnerID() , EM_RoleValue_Money)
	if (Money < 6000) then
		SetSpeakDetail( OwnerID(), "[SC_113595_03_5]" )---�A���W������������I�o������ƶO��
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_03", 0 ) --�^��W�@��
	else
		if CountBodyItem( OwnerID() , 205984 ) >= 3 and CountBodyItem( OwnerID() , 205986 ) >= 6 and CountBodyItem( OwnerID() , 205985 ) >= 6 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then	
				DelBodyItem( OwnerID() , 205984 , 3 )
				DelBodyItem( OwnerID() , 205986 , 6 )
				DelBodyItem( OwnerID() , 205985 , 6 )
				GiveBodyItem( OwnerID(), 205983, 1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Money   , Money - 6000 ) ---����
				SetSpeakDetail( OwnerID(), "[SC_113595_03_3]" )---�������
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_03", 0 ) --�^��W�@��
			else
				SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]")--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_03", 0 ) --�^��W�@��
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_113595_03_4]"   )--�ƶq�����A����I���C
			AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_03", 0 ) --�^��W�@��
		end
	end
end
-------����s�� - 2 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113595_1_3_4() ---��Ʃһݧ��Ƥ��e
	SetSpeakDetail( OwnerID(), "[SC_113595_1_3_4]"   )--������ƪ��һݧ��Ʀp�U
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_7]" , "Lua_apon_113595_1_3_4_1" , 0 ) ---�O���A�ڭn�i����ơC
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_01", 0 ) --�^��W�@��
end

function Lua_apon_113595_1_3_4_1()
	local Money = ReadRoleValue(OwnerID() , EM_RoleValue_Money)
	if (Money < 6000) then
		SetSpeakDetail( OwnerID(), "[SC_113595_03_5]" )---�A���W������������I�o������ƶO��
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_01", 0 ) --�^��W�@��
	else
		if CountBodyItem( OwnerID() , 205980 ) >= 6 and CountBodyItem( OwnerID() , 205989 ) >= 30 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then	
				DelBodyItem( OwnerID() , 205980 , 3 )
				DelBodyItem( OwnerID() , 205989 , 30 )
				--DelBodyItem( OwnerID() , 205989 , 3 )
				GiveBodyItem( OwnerID(), 205979, 1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Money   , Money - 6000 ) ---����
				SetSpeakDetail( OwnerID(), "[SC_113595_03_3]" )---�������
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_01", 0 ) --�^��W�@��
			else
				SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]")--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_01", 0 ) --�^��W�@��
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_113595_03_4]"   )--�ƶq�����A����I���C
			AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_01", 0 ) --�^��W�@��
		end
	end
end
-------�������s�� - 2 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113595_1_3_5() ---��Ʃһݧ��Ƥ��e
	SetSpeakDetail( OwnerID(), "[SC_113595_1_3_5]"   )--������ƪ��һݧ��Ʀp�U
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_7]" , "Lua_apon_113595_1_3_5_1" , 0 ) ---�O���A�ڭn�i����ơC
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_02", 0 ) --�^��W�@��
end

function Lua_apon_113595_1_3_5_1()
	local Money = ReadRoleValue(OwnerID() , EM_RoleValue_Money)
	if (Money < 6000) then
		SetSpeakDetail( OwnerID(), "[SC_113595_03_5]" )---�A���W������������I�o������ƶO��
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_02", 0 ) --�^��W�@��
	else
		if CountBodyItem( OwnerID() , 205982 ) >= 6 and CountBodyItem( OwnerID() , 205991 ) >= 30 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then	
				DelBodyItem( OwnerID() , 205982 , 6 )
				DelBodyItem( OwnerID() , 205991 , 30 )
				--DelBodyItem( OwnerID() , 205990 , 3 )
				GiveBodyItem( OwnerID(), 205981, 1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Money   , Money - 6000 ) ---����
				SetSpeakDetail( OwnerID(), "[SC_113595_03_3]" )---�������
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_02", 0 ) --�^��W�@��
			else
				SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]")--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_02", 0 ) --�^��W�@��
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_113595_03_4]"   )--�ƶq�����A����I���C
			AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_02", 0 ) --�^��W�@��
		end
	end
end
-------�y�U�����s�Q�� -2 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113595_1_3_6() ---��Ʃһݧ��Ƥ��e
	SetSpeakDetail( OwnerID(), "[SC_113595_1_3_6]"   )--������ƪ��һݧ��Ʀp�U
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_7]" , "Lua_apon_113595_1_3_6_1" , 0 ) ---�O���A�ڭn�i����ơC
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_03", 0 ) --�^��W�@��
end

function Lua_apon_113595_1_3_6_1()
	local Money = ReadRoleValue(OwnerID() , EM_RoleValue_Money)
	if (Money < 6000) then
		SetSpeakDetail( OwnerID(), "[SC_113595_03_5]" )---�A���W������������I�o������ƶO��
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_03", 0 ) --�^��W�@��
	else
		if CountBodyItem( OwnerID() , 205984 ) >= 6 and CountBodyItem( OwnerID() , 205990 ) >= 30 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then	
				DelBodyItem( OwnerID() , 205984 , 6 )
				DelBodyItem( OwnerID() , 205990 , 30 )
				--DelBodyItem( OwnerID() , 205991 , 3 )
				GiveBodyItem( OwnerID(), 205983, 1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Money   , Money - 6000 ) ---����
				SetSpeakDetail( OwnerID(), "[SC_113595_03_3]" )---�������
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_03", 0 ) --�^��W�@��
			else
				SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]")--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_03", 0 ) --�^��W�@��
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_113595_03_4]"   )--�ƶq�����A����I���C
			AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_03", 0 ) --�^��W�@��
		end
	end
end
-------�K���s��------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113595_1_3_7() ---��Ʃһݧ��Ƥ��e
	SetSpeakDetail( OwnerID(), "[SC_113595_1_3_7]"   )--������ƪ��һݧ��Ʀp�U
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_7]" , "Lua_apon_113595_1_3_7_1" , 0 ) ---�O���A�ڭn�i����ơC
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3", 0 ) --�^��W�@��
end

function Lua_apon_113595_1_3_7_1()
	local Money = ReadRoleValue(OwnerID() , EM_RoleValue_Money)
	if (Money < 25000) then
		SetSpeakDetail( OwnerID(), "[SC_113595_03_5]" )---�A���W������������I�o������ƶO��
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3", 0 ) --�^��W�@��
	else
		if CountBodyItem( OwnerID() , 205981 ) >= 6 and CountBodyItem( OwnerID() , 206031 ) >= 6 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then	
				DelBodyItem( OwnerID() , 205981 , 6 )
				DelBodyItem( OwnerID() , 206031 , 6 )
				--DelBodyItem( OwnerID() , 205991 , 3 )
				GiveBodyItem( OwnerID(), 206026, 1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Money   , Money - 25000 ) ---����
				SetSpeakDetail( OwnerID(), "[SC_113595_03_3]" )---�������
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3", 0 ) --�^��W�@��
			else
				SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]")--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3", 0 ) --�^��W�@��
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_113595_03_4]"   )--�ƶq�����A����I���C
			AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3", 0 ) --�^��W�@��
		end
	end
end
-------���V�s��------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113595_1_3_8() ---��Ʃһݧ��Ƥ��e
	SetSpeakDetail( OwnerID(), "[SC_113595_1_3_8]"   )--������ƪ��һݧ��Ʀp�U
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_7]" , "Lua_apon_113595_1_3_8_1" , 0 ) ---�O���A�ڭn�i����ơC
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3", 0 ) --�^��W�@��
end

function Lua_apon_113595_1_3_8_1()
	local Money = ReadRoleValue(OwnerID() , EM_RoleValue_Money)
	if (Money < 25000) then
		SetSpeakDetail( OwnerID(), "[SC_113595_03_5]" )---�A���W������������I�o������ƶO��
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3", 0 ) --�^��W�@��
	else
		if CountBodyItem( OwnerID() , 205979 ) >= 6 and CountBodyItem( OwnerID() , 206031 ) >= 3 and CountBodyItem( OwnerID() , 206030 ) >= 3 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then	
				DelBodyItem( OwnerID() , 205979 , 6 )
				DelBodyItem( OwnerID() , 206031 , 3 )
				DelBodyItem( OwnerID() , 206030 , 3 )
				GiveBodyItem( OwnerID(), 205998, 1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Money   , Money - 25000 ) ---����
				SetSpeakDetail( OwnerID(), "[SC_113595_03_3]" )---�������
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3", 0 ) --�^��W�@��
			else
				SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]")--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3", 0 ) --�^��W�@��
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_113595_03_4]"   )--�ƶq�����A����I���C
			AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3", 0 ) --�^��W�@��
		end
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
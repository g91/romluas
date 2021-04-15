function Lua_apon_113597() ---�]�sNPC
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_01]" , "Lua_apon_113597_1_1", 0 ) --�D��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_02]" , "Lua_apon_113597_1_2", 0 ) --������ƻ���²��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03]" , "Lua_apon_113597_1_3", 0 ) --�i��������
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113596_00]" , "Lua_apon_113597_1_4", 0 ) --�c��t���
end

function Lua_apon_113597_1_1()
	SetSpeakDetail( OwnerID(), "[SC_113595_01_1]"   )--�D��A�]�s���I��²���A���e
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597", 0 ) --�^��W�@��
end

function Lua_apon_113597_1_2()
	SetSpeakDetail( OwnerID(), "[SC_113595_02_1]"   )--������ƻ���²���A���e
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597", 0 ) --�^��W�@��
end

function Lua_apon_113597_1_3()----�Ҧ��]�s������ƪ����~�b���C
	SetSpeakDetail( OwnerID(), "[SC_113595_03_1]"   )--�ڷQ�i�������ơC
	
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113597_03]" , "Lua_apon_113597_1_3_6" , 0 ) ---���V�s��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113597_04]" , "Lua_apon_113597_1_3_7" , 0 ) ---�K���s��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113597_1_1]" , "Lua_apon_113597_1_3_8" , 0 ) ---�y�U�����s�Q��
	
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113597_1_3_1]" , "Lua_apon_113597_1_3_1" , 0 ) ---�O�q����
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113597_1_3_2]" , "Lua_apon_113597_1_3_2" , 0 ) ---�]�O����
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113597_1_3_3]" , "Lua_apon_113597_1_3_3" , 0 ) ---��������
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113597_1_3_4]" , "Lua_apon_113597_1_3_4" , 0 ) ---����s��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113597_1_3_5]" , "Lua_apon_113597_1_3_5" , 0 ) ---�������s��
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597", 0 ) --�^��W�@��
end

-------�O�q����------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113597_1_3_1() ---��Ʃһݧ��Ƥ��e
	SetSpeakDetail( OwnerID(), "[SC_113597_1_3_1_1]"   )--������ƪ��һݧ��Ʀp�U
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_7]" , "Lua_apon_113597_1_3_1_1" , 0 ) ---�O���A�ڭn�i����ơC
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
end

function Lua_apon_113597_1_3_1_1()
	local Money = ReadRoleValue(OwnerID() , EM_RoleValue_Money)
	if (Money < 50000) then
		SetSpeakDetail( OwnerID(), "[SC_113595_03_5]" )---�A���W������������I�o������ƶO��
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
	else
		if CountBodyItem( OwnerID() , 206036 ) >= 10 and CountBodyItem( OwnerID() , 206028 ) >= 10 and CountBodyItem( OwnerID() , 206027 ) >= 2 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then	
				DelBodyItem( OwnerID() , 206036 , 10 )
				DelBodyItem( OwnerID() , 206028 , 10 )
				DelBodyItem( OwnerID() , 206027 , 2 )
				GiveBodyItem( OwnerID(), 206039, 1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Money   , Money - 50000 ) ---����
				SetSpeakDetail( OwnerID(), "[SC_113595_03_3]" )---�������
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
			else
				SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]")--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_113595_03_4]"   )--�ƶq�����A����I���C
			AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
		end
	end
end
-------�]�O����------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113597_1_3_2() ---��Ʃһݧ��Ƥ��e
	SetSpeakDetail( OwnerID(), "[SC_113597_1_3_2_1]"   )--������ƪ��һݧ��Ʀp�U
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_7]" , "Lua_apon_113597_1_3_2_1" , 0 ) ---�O���A�ڭn�i����ơC
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
end

function Lua_apon_113597_1_3_2_1()
	local Money = ReadRoleValue(OwnerID() , EM_RoleValue_Money)
	if (Money < 50000) then
		SetSpeakDetail( OwnerID(), "[SC_113595_03_5]" )---�A���W������������I�o������ƶO��
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
	else
		if CountBodyItem( OwnerID() , 206037 ) >= 10 and CountBodyItem( OwnerID() , 206031 ) >= 10 and CountBodyItem( OwnerID() , 205998 ) >= 2 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then	
				DelBodyItem( OwnerID() , 206037 , 10 )
				DelBodyItem( OwnerID() , 206031 , 10 )
				DelBodyItem( OwnerID() , 205998 , 2 )
				GiveBodyItem( OwnerID(), 206040, 1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Money   , Money - 50000 ) ---����
				SetSpeakDetail( OwnerID(), "[SC_113595_03_3]" )---�������
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
			else
				SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]")--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_113595_03_4]"   )--�ƶq�����A����I���C
			AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
		end
	end
end
-------��������------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113597_1_3_3() ---��Ʃһݧ��Ƥ��e
	SetSpeakDetail( OwnerID(), "[SC_113597_1_3_3_1]"   )--������ƪ��һݧ��Ʀp�U
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_7]" , "Lua_apon_113597_1_3_3_1" , 0 ) ---�O���A�ڭn�i����ơC
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
end

function Lua_apon_113597_1_3_3_1()
	local Money = ReadRoleValue(OwnerID() , EM_RoleValue_Money)
	if (Money < 50000) then
		SetSpeakDetail( OwnerID(), "[SC_113595_03_5]" )---�A���W������������I�o������ƶO��
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
	else
		if CountBodyItem( OwnerID() , 206038 ) >= 10 and CountBodyItem( OwnerID() , 206030 ) >= 10 and CountBodyItem( OwnerID() , 206026 ) >= 2 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then	
				DelBodyItem( OwnerID() , 206038 , 10 )
				DelBodyItem( OwnerID() , 206030 , 10 )
				DelBodyItem( OwnerID() , 206026 , 2 )
				GiveBodyItem( OwnerID(), 206041, 1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Money   , Money - 50000 ) ---����
				SetSpeakDetail( OwnerID(), "[SC_113595_03_3]" )---�������
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
			else
				SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]")--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_113595_03_4]"   )--�ƶq�����A����I���C
			AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
		end
	end
end
-------����s��------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113597_1_3_4() ---��Ʃһݧ��Ƥ��e
	SetSpeakDetail( OwnerID(), "[SC_113597_1_3_4_1]"   )--������ƪ��һݧ��Ʀp�U
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_7]" , "Lua_apon_113597_1_3_4_1" , 0 ) ---�O���A�ڭn�i����ơC
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
end

function Lua_apon_113597_1_3_4_1()
	local Money = ReadRoleValue(OwnerID() , EM_RoleValue_Money)
	if (Money < 25000) then
		SetSpeakDetail( OwnerID(), "[SC_113595_03_5]" )---�A���W������������I�o������ƶO��
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
	else
		if CountBodyItem( OwnerID() , 205998 ) >= 1 and CountBodyItem( OwnerID() , 205989 ) >= 6 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then	
				DelBodyItem( OwnerID() , 205998 , 1 )
				DelBodyItem( OwnerID() , 205989 , 6 )
				--DelBodyItem( OwnerID() , 206026 , 3 )
				GiveBodyItem( OwnerID(), 205979, 3 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Money   , Money - 25000 ) ---����
				SetSpeakDetail( OwnerID(), "[SC_113595_03_3]" )---�������
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
			else
				SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]")--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_113595_03_4]"   )--�ƶq�����A����I���C
			AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
		end
	end
end
-------�������s��------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113597_1_3_5() ---��Ʃһݧ��Ƥ��e
	SetSpeakDetail( OwnerID(), "[SC_113597_1_3_5_1]"   )--������ƪ��һݧ��Ʀp�U
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_7]" , "Lua_apon_113597_1_3_5_1" , 0 ) ---�O���A�ڭn�i����ơC
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
end

function Lua_apon_113597_1_3_5_1()
	local Money = ReadRoleValue(OwnerID() , EM_RoleValue_Money)
	if (Money < 25000) then
		SetSpeakDetail( OwnerID(), "[SC_113595_03_5]" )---�A���W������������I�o������ƶO��
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
	else
		if CountBodyItem( OwnerID() , 206026 ) >= 1 and CountBodyItem( OwnerID() , 205991 ) >= 6 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then	
				DelBodyItem( OwnerID() , 206026 , 1 )
				DelBodyItem( OwnerID() , 205991 , 6 )
				--DelBodyItem( OwnerID() , 206026 , 3 )
				GiveBodyItem( OwnerID(), 205981, 3 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Money   , Money - 25000 ) ---����
				SetSpeakDetail( OwnerID(), "[SC_113595_03_3]" )---�������
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
			else
				SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]")--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_113595_03_4]"   )--�ƶq�����A����I���C
			AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
		end
	end
end

-------���V�s��------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113597_1_3_6() ---��Ʃһݧ��Ƥ��e
	SetSpeakDetail( OwnerID(), "[SC_113597_1_2]"   )--������ƪ��һݧ��Ʀp�U
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_7]" , "Lua_apon_113597_1_3_6_1" , 0 ) ---�O���A�ڭn�i����ơC
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
end

function Lua_apon_113597_1_3_6_1()
	local Money = ReadRoleValue(OwnerID() , EM_RoleValue_Money)
	if (Money < 30000) then
		SetSpeakDetail( OwnerID(), "[SC_113595_03_5]" )---�A���W������������I�o������ƶO��
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
	else
		if CountBodyItem( OwnerID() , 206028 ) >= 9 and CountBodyItem( OwnerID() , 206031 ) >= 9 and CountBodyItem( OwnerID() , 206030 ) >= 9 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then	
				DelBodyItem( OwnerID() , 206028 , 9 )
				DelBodyItem( OwnerID() , 206031 , 9 )
				DelBodyItem( OwnerID() , 206030 , 9 )
				GiveBodyItem( OwnerID(), 205998, 1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Money   , Money - 30000 ) ---����
				SetSpeakDetail( OwnerID(), "[SC_113595_03_3]" )---�������
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
			else
				SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]")--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_113595_03_4]"   )--�ƶq�����A����I���C
			AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
		end
	end
end


-------�K���s��------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113597_1_3_7() ---��Ʃһݧ��Ƥ��e
	SetSpeakDetail( OwnerID(), "[SC_113597_1_3]"   )--������ƪ��һݧ��Ʀp�U
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_7]" , "Lua_apon_113597_1_3_7_1" , 0 ) ---�O���A�ڭn�i����ơC
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
end

function Lua_apon_113597_1_3_7_1()
	local Money = ReadRoleValue(OwnerID() , EM_RoleValue_Money)
	if (Money < 30000) then
		SetSpeakDetail( OwnerID(), "[SC_113595_03_5]" )---�A���W������������I�o������ƶO��
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
	else
		if CountBodyItem( OwnerID() , 206029 ) >= 9 and CountBodyItem( OwnerID() , 206031 ) >= 9 and CountBodyItem( OwnerID() , 206028 ) >= 9 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then	
				DelBodyItem( OwnerID() , 206029 , 9 )
				DelBodyItem( OwnerID() , 206031 , 9 )
				DelBodyItem( OwnerID() , 206028 , 9 )
				GiveBodyItem( OwnerID(), 206026, 1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Money   , Money - 30000 ) ---����
				SetSpeakDetail( OwnerID(), "[SC_113595_03_3]" )---�������
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
			else
				SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]")--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_113595_03_4]"   )--�ƶq�����A����I���C
			AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
		end
	end
end


-------�y�U�����s�Q��------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113597_1_3_8() ---��Ʃһݧ��Ƥ��e
	SetSpeakDetail( OwnerID(), "[SC_113597_1_3_8]"   )--������ƪ��һݧ��Ʀp�U
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_7]" , "Lua_apon_113597_1_3_8_1" , 0 ) ---�O���A�ڭn�i����ơC
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
end

function Lua_apon_113597_1_3_8_1()
	local Money = ReadRoleValue(OwnerID() , EM_RoleValue_Money)
	if (Money < 30000) then
		SetSpeakDetail( OwnerID(), "[SC_113595_03_5]" )---�A���W������������I�o������ƶO��
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
	else
		if CountBodyItem( OwnerID() , 206030 ) >= 9 and CountBodyItem( OwnerID() , 206029 ) >= 9 and CountBodyItem( OwnerID() , 206028 ) >= 9 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then	
				DelBodyItem( OwnerID() , 206030 , 9 )
				DelBodyItem( OwnerID() , 206029 , 9 )
				DelBodyItem( OwnerID() , 206028 , 9 )
				GiveBodyItem( OwnerID(), 206027, 1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Money   , Money - 30000 ) ---����
				SetSpeakDetail( OwnerID(), "[SC_113595_03_3]" )---�������
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
			else
				SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]")--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_113595_03_4]"   )--�ƶq�����A����I���C
			AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --�^��W�@��
		end
	end
end



-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function Lua_apon_113597_1_4() 

	SetSpeakDetail( OwnerID(), "[SC_113596_1]" )--����Ͳ��t��
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113596_00]" , "Lua_apon_113597_1_4_00", 0 ) --�t�誺����
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113597_1_4_01]" , "Lua_apon_113597_1_4_01", 0 ) --�Z���t��
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113597_1_4_02]" , "Lua_apon_113597_1_4_02", 0 ) --���~�t��
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597", 0 ) --�^��W�@��

end

function Lua_apon_113597_1_4_00()--�Z��NPC
	SetSpeakDetail( OwnerID(), "[SC_113596_00_1]"   )--�D��
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_4", 0 ) --�^��W�@��
end

function Lua_apon_113597_1_4_01()                                                                                               
	local GAHO0 = LuaFunc_SearchNPCbyOrgID(TargetID(), 113602, 200 , 1) 
	BeginPlot( GAHO0[0],  "Lua_apon_113597_1_4_01_1" , 0 )    
end

function Lua_apon_113597_1_4_01_1()
	BeginPlot( TargetID(), "Lua_apon_touch" , 0 )
	AddRecipe( OwnerID() , 551026)
	AddRecipe( OwnerID() , 551027)
	AddRecipe( OwnerID() , 551028)
	AddRecipe( OwnerID() , 551029)
	AddRecipe( OwnerID() , 551030)
	AddRecipe( OwnerID() , 551031)
	AddRecipe( OwnerID() , 551331)
end

function Lua_apon_113597_1_4_02()--���~NPC                                                                                               
	local GAHO1 = LuaFunc_SearchNPCbyOrgID(TargetID(), 113603, 200 , 1) 
	BeginPlot( GAHO1[0],  "Lua_apon_113597_1_4_02_1" , 0 )    
end

function Lua_apon_113597_1_4_02_1()
	BeginPlot( TargetID(), "Lua_apon_touch" , 0 )
	AddRecipe( OwnerID() , 551332)
	AddRecipe( OwnerID() , 551333)
	AddRecipe( OwnerID() , 551334)
	AddRecipe( OwnerID() , 551335)
	AddRecipe( OwnerID() , 551336)
	AddRecipe( OwnerID() , 551337)
	AddRecipe( OwnerID() , 551338)
	AddRecipe( OwnerID() , 551339)
	AddRecipe( OwnerID() , 551340)
	AddRecipe( OwnerID() , 551341)
end













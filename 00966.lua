---------------------------------
function LuaS_111490_6()
--�ڷQ�αm�a�I���ӫ����~
	SetSpeakDetail( OwnerID(), GetString("SC_111490_6_DIALOG")   )--�аݧA�n�I�����@�ءC
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_6_DIALOG1") , "LuaS_111490_6_1", 0 ) --�Τ�������m�a�I��
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_6_DIALOG2") , "LuaS_111490_6_2", 0 ) --�Τ������m�a�I��
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_6_DIALOG3") , "LuaS_111490_6_3", 0 ) --�Τ����Ŧ�m�a�I��
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_6_DIALOG4") , "LuaS_111490_6_4", 0 ) --�Τ�������m�a�I��
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_6_DIALOG5") , "LuaS_111490_6_5", 0 ) --�Τ�������m�a�I��
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --�^��W�@��
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_111490_6_1()
--�Τ�������m�a�I��
local flag = 203080
local item = 207963 --���|�귽§��
local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
	if CountBodyItem( OwnerID() , flag ) >= 5 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
			DelBodyItem( OwnerID() , flag , 5 )
			GiveBodyItem( OwnerID() , item , 1 )
			SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG8")   )--���z�n�ʸ`�ּ֡I
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --�^��W�@��
		else
			SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG10")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --�^��W�@��
		end
	else
		SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG9")   )--�z�ҫ������ƶq�����A�٤���I����C
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --�^��W�@��	
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_111490_6_2()
--�Τ������m�a�I��
local flag = 203081
local item = 201445 --�@���W�D�۸ܻ�
	if CountBodyItem( OwnerID() , flag ) >= 5 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
			DelBodyItem( OwnerID() , flag , 5 )
			GiveBodyItem( OwnerID() , item , 10 )
			SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG8")   )--���z�n�ʸ`�ּ֡I
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --�^��W�@��
		else
			SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG10")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --�^��W�@��
		end
	else
		SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG9")   )--�z�ҫ������ƶq�����A�٤���I����C
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --�^��W�@��	
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_111490_6_3()
--�Τ����Ŧ�m�a�I��
local flag = 203082
local item = 201134 --�g���ľ�
	if CountBodyItem( OwnerID() , flag ) >= 5 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
			DelBodyItem( OwnerID() , flag , 5 )
			GiveBodyItem( OwnerID() , item , 2 )
			SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG8")   )--���z�n�ʸ`�ּ֡I
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --�^��W�@��
		else
			SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG10")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --�^��W�@��
		end
	else
		SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG9")   )--�z�ҫ������ƶq�����A�٤���I����C
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --�^��W�@��	
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_111490_6_4()
--�Τ�������m�a�I��
local flag = 203083
local item = 202902  --�Ŷ��O������
	if CountBodyItem( OwnerID() , flag ) >= 5 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
			DelBodyItem( OwnerID() , flag , 5 )
			GiveBodyItem( OwnerID() , item , 5 )
			SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG8")   )--���z�n�ʸ`�ּ֡I
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --�^��W�@��
		else
			SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG10")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --�^��W�@��
		end
	else
		SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG9")   )--�z�ҫ������ƶq�����A�٤���I����C
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --�^��W�@��	
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_111490_6_5()
--�Τ�������m�a�I��
local flag = 203084
local item = 202903 --�ǰe�̲Ť�
	if CountBodyItem( OwnerID() , flag ) >= 5 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
			DelBodyItem( OwnerID() , flag , 5 )
			GiveBodyItem( OwnerID() , item , 10 )
			SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG8")   )--���z�n�ʸ`�ּ֡I
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --�^��W�@��
		else
			SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG10")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --�^��W�@��
		end
	else
		SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG9")   )--�z�ҫ������ƶq�����A�٤���I����C
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --�^��W�@��	
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
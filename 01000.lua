function LuaS_InSideWorld_3_1_8()
--�ڭn�I���Z��
local flag = 203097
local item = 210409
local HowMuch = 7200
local HowMuch2 = 7
	if CountBodyItem( OwnerID() , flag ) >= HowMuch and CountBodyItem( OwnerID() , flag2 ) >= HowMuch2 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
		DelBodyItem( OwnerID() , flag , HowMuch )
		GiveBodyItem( OwnerID() , item , 1 )
		SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_1")   )--�ӳo�N�O�A�n���˳ơC
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_1", 0 ) --�^��W�@��
		else
		SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_2")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_1", 0 ) --�^��W�@��
		end
	else
	SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_3")   )--�z�ҫ��������ڸH���ξ��ڤ����ƶq�����A�٤���I����C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_1", 0 ) --�^��W�@��	
	end
end
function LuaS_InSideWorld_3_2_8()
--�ڭn�I���Z��
local flag = 203097
local flag2 = 203280
local item = 210463
local HowMuch = 7200
local HowMuch2 = 7
	if CountBodyItem( OwnerID() , flag ) >= HowMuch and CountBodyItem( OwnerID() , flag2 ) >= HowMuch2 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
		DelBodyItem( OwnerID() , flag , HowMuch )
		GiveBodyItem( OwnerID() , item , 1 )
		SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_1")   )--�ӳo�N�O�A�n���˳ơC
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_2", 0 ) --�^��W�@��
		else
		SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_2")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_2", 0 ) --�^��W�@��
		end
	else
	SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_3")   )--�z�ҫ��������ڸH���ξ��ڤ����ƶq�����A�٤���I����C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_2", 0 ) --�^��W�@��	
	end
end
function LuaS_InSideWorld_3_3_8()
--�ڭn�I���Z��
local flag = 203097
local flag2 = 203280
local item = 210431
local HowMuch = 7200
local HowMuch2 = 7
	if CountBodyItem( OwnerID() , flag ) >= HowMuch and CountBodyItem( OwnerID() , flag2 ) >= HowMuch2 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
		DelBodyItem( OwnerID() , flag , HowMuch )
		GiveBodyItem( OwnerID() , item , 1 )
		SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_1")   )--�ӳo�N�O�A�n���˳ơC
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_3", 0 ) --�^��W�@��
		else
		SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_2")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_3", 0 ) --�^��W�@��
		end
	else
	SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_3")   )--�z�ҫ��������ڸH���ξ��ڤ����ƶq�����A�٤���I����C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_3", 0 ) --�^��W�@��	
	end
end
function LuaS_InSideWorld_3_4_8()
--�ڭn�I���Z��
local flag = 203097
local flag2 = 203280
local item = 210222
local HowMuch = 7200
local HowMuch2 = 7
	if CountBodyItem( OwnerID() , flag ) >= HowMuch and CountBodyItem( OwnerID() , flag2 ) >= HowMuch2 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
		DelBodyItem( OwnerID() , flag , HowMuch )
		GiveBodyItem( OwnerID() , item , 1 )
		SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_1")   )--�ӳo�N�O�A�n���˳ơC
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_4", 0 ) --�^��W�@��
		else
		SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_2")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_4", 0 ) --�^��W�@��
		end
	else
	SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_3")   )--�z�ҫ��������ڸH���ξ��ڤ����ƶq�����A�٤���I����C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_4", 0 ) --�^��W�@��	
	end
end
function LuaS_InSideWorld_3_5_8()
--�ڭn�I���Z��
local flag = 203097
local flag2 = 203280
local item = 210437
local HowMuch = 7200
local HowMuch2 = 7
	if CountBodyItem( OwnerID() , flag ) >= HowMuch and CountBodyItem( OwnerID() , flag2 ) >= HowMuch2 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
		DelBodyItem( OwnerID() , flag , HowMuch )
		GiveBodyItem( OwnerID() , item , 1 )
		SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_1")   )--�ӳo�N�O�A�n���˳ơC
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_5", 0 ) --�^��W�@��
		else
		SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_2")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_5", 0 ) --�^��W�@��
		end
	else
	SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_3")   )--�z�ҫ��������ڸH���ξ��ڤ����ƶq�����A�٤���I����C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_5", 0 ) --�^��W�@��	
	end
end
function LuaS_InSideWorld_3_6_8()
--�ڭn�I���Z��
local flag = 203097
local flag2 = 203280
local item = 210423
local HowMuch = 7200
local HowMuch2 = 7
	if CountBodyItem( OwnerID() , flag ) >= HowMuch and CountBodyItem( OwnerID() , flag2 ) >= HowMuch2 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
		DelBodyItem( OwnerID() , flag , HowMuch )
		GiveBodyItem( OwnerID() , item , 1 )
		SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_1")   )--�ӳo�N�O�A�n���˳ơC
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_6", 0 ) --�^��W�@��
		else
		SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_2")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_6", 0 ) --�^��W�@��
		end
	else
	SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_1_3")   )--�z�ҫ��������ڸH���ξ��ڤ����ƶq�����A�٤���I����C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3_6", 0 ) --�^��W�@��	
	end
end
--------------------------------
function LuaS_InSideWorld_3_4()
--�ڭn�I���Ԥh�M��
	SetSpeakDetail( OwnerID(), GetString("SC_CHANGE_0")   )--�аݧA�n�I�����ӳ���C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CHANGE_1") , "LuaS_InSideWorld_3_4_1", 0 ) --�ڭn�I���Y��(�ݭn1600�Ӿ��ڸH���M4�Ӿ��ڤ���)
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CHANGE_2") , "LuaS_InSideWorld_3_4_2", 0 ) --�ڭn�I���W��(�ݭn7000�Ӿ��ڸH���M6�Ӿ��ڤ���)
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CHANGE_3") , "LuaS_InSideWorld_3_4_3", 0 ) --�ڭn�I���Ǥl(�ݭn5500�Ӿ��ڸH���M5�Ӿ��ڤ���)
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CHANGE_4") , "LuaS_InSideWorld_3_4_4", 0 ) --�ڭn�I����M(�ݭn1400�Ӿ��ڸH��)
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CHANGE_5") , "LuaS_InSideWorld_3_4_5", 0 ) --�ڭn�I���c�l(�ݭn1200�Ӿ��ڸH��)
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CHANGE_6") , "LuaS_InSideWorld_3_4_6", 0 ) --�ڭn�I���ӥ�(�ݭn800�Ӿ��ڸH��)
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CHANGE_7") , "LuaS_InSideWorld_3_4_7", 0 ) --�ڭn�I���y�a(�ݭn600�Ӿ��ڸH��)
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CHANGE_8") , "LuaS_InSideWorld_3_4_8", 0 ) --�ڭn�I���Z��(�ݭn7200�Ӿ��ڸH���M7�Ӿ��ڤ���)
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_InSideWorld_3", 0 ) --�^��W�@��
end
--------------------------------
function LuaS_InSideWorld_3_4_1()
--�ڭn�I���Y��
local flag = 203097
local flag2 = 203280
local item = 221009
local HowMuch = 1600
local HowMuch2 = 4
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
--------------------------------
function LuaS_InSideWorld_3_4_2()
--�ڭn�I���W��
local flag = 203097
local flag2 = 203280
local item = 221014
local HowMuch = 7000
local HowMuch2 = 6
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
--------------------------------
function LuaS_InSideWorld_3_4_3()
--�ڭn�I���Ǥl
local flag = 203097
local flag2 = 203280
local item = 221025
local HowMuch = 5500
local HowMuch2 = 5
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
--------------------------------
function LuaS_InSideWorld_3_4_4()
--�ڭn�I����M
local flag = 203097
local flag2 = 203280
local item = 221027
local HowMuch = 1400
	if CountBodyItem( OwnerID() , flag ) >= HowMuch then
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
--------------------------------
function LuaS_InSideWorld_3_4_5()
--�ڭn�I���c�l
local flag = 203097
local flag2 = 203280
local item = 221031
local HowMuch = 1200
	if CountBodyItem( OwnerID() , flag ) >= HowMuch then
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
--------------------------------
function LuaS_InSideWorld_3_4_6()
--�ڭn�I���ӥ�
local flag = 203097
local flag2 = 203280
local item = 221035
local HowMuch = 800
	if CountBodyItem( OwnerID() , flag ) >= HowMuch then
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
--------------------------------
function LuaS_111376_0()
LoadQuestOption( OwnerID() )
AddSpeakOption( OwnerID(), TargetID( ), GetString("K_08MID_DIALOG1") , "LuaS_111376_1", 0 ) --/*�ڷQ�F�Ѥ���`���ӷ�
AddSpeakOption( OwnerID(), TargetID( ), GetString("K_08MID_DIALOG2") , "LuaS_111376_2", 0 ) --�ڷQ��10�Ө��F��洫������§�](�p)202906 202908 
AddSpeakOption( OwnerID(), TargetID( ), GetString("K_08MID_DIALOG3") , "LuaS_111376_3", 0 ) --�ڷQ��10�ӷ�����洫������§�](��)202907 202909
AddSpeakOption( OwnerID(), TargetID( ), GetString("K_08MID_DIALOG4") , "LuaS_111376_4", 0 ) --�ڷQ��20�ӷ�����洫������§�](�j)202907 202910
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_111376_1()
SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG5")   )--�o�N�O����`���Ѩӣ�
AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111376_0", 0 ) --�^��W�@��
end


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_111376_2()
--�ڷQ��10�Ө��F��洫������§�](�p)
	if CountBodyItem( OwnerID() , 202906 ) >= 10 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
		DelBodyItem( OwnerID() , 202906 , 10 )
		GiveBodyItem( OwnerID() , 202908  , 1 )
		SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG6")   )--���z����θ`�r��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111376_0", 0 ) --�^��W�@��
		else
		SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG8")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111376_0", 0 ) --�^��W�@��
		end
	else
	SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG7")   )--�z�ҫ������ƶq�����A�٤���I����C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111376_0", 0 ) --�^��W�@��	
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_111376_3()
--�ڷQ��10�ӷ�����洫������§�](��)
	if CountBodyItem( OwnerID() , 202907 ) >= 10 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
		DelBodyItem( OwnerID() , 202907 , 10 )
		GiveBodyItem( OwnerID() , 202909  , 1 )
		SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG6")   )--���z����θ`�r��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111376_0", 0 ) --�^��W�@��
		else
		SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG8")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111376_0", 0 ) --�^��W�@��
		end
	else
	SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG7")   )--�z�ҫ������ƶq�����A�٤���I����C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111376_0", 0 ) --�^��W�@��	
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_111376_4()
--�ڷQ��20�ӷ�����洫������§�](�j)
	if CountBodyItem( OwnerID() , 202907 ) >= 20 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
		DelBodyItem( OwnerID() , 202907 , 20 )
		GiveBodyItem( OwnerID() , 202910  , 1 )
		SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG6")   )--���z����θ`�r��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111376_0", 0 ) --�^��W�@��
		else
		SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG8")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111376_0", 0 ) --�^��W�@��
		end
	else
	SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG7")   )--�z�ҫ������ƶq�����A�٤���I����C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111376_0", 0 ) --�^��W�@��	
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
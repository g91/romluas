function LuaS_oldkeys()
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_OLDKEY_DIALOG2") , "LuaS_oldkeys_1", 0 ) --�ڷQ��20�ӡu�ǲ��������v�I��1�ӡu�j�Ѫ��_�͡v
end
-----------------
function LuaS_oldkeys_1()
--�ڷQ��20�ӡu�ǲ��������v�I��1�ӡu�j�Ѫ��_�͡v
	if CountBodyItem( OwnerID() , 204222 ) >= 20 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			DelBodyItem( OwnerID() , 204222 , 20 )
			GiveBodyItem( OwnerID() , 203178 , 1 )
			SetSpeakDetail( OwnerID(), GetString("SC_OLDKEY_DIALOG8")   )--���¥��{�I
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_oldkeys", 0 ) --�^��W�@��
		else
		SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG10")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_oldkeys", 0 ) --�^��W�@��
		end
	else
	SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG9")   )--�z�ҫ������ƶq�����A�٤���I����C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_oldkeys", 0 ) --�^��W�@��	
	end
end
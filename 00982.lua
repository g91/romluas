function LuaS_111491_0()
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111491_DIALOG1") , "LuaS_111491_1", 0 ) --�ڷQ��10�ӡu�F��H���v�I���u�ܨ��Ĥ��v�C
end
-----------------
function LuaS_111491_1()
--�ڷQ��10�ӡu�F��H���v�I���u�ܨ��Ĥ��v�C
	if CountBodyItem( OwnerID() , 203165 ) >= 10 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
		DelBodyItem( OwnerID() , 203165 , 10 )
		GiveBodyItem( OwnerID() , 203085 , 1 )
		SetSpeakDetail( OwnerID(), GetString("SC_111491_DIALOG2")   )--�K�K�I�ܨ���A�A�i�঳�N�~����ì�C
		else
		SetSpeakDetail( OwnerID(), GetString("SC_111491_DIALOG3")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111491_0", 0 ) --�^��W�@��
		end
	else
	SetSpeakDetail( OwnerID(), GetString("SC_111491_DIALOG4")   )--�z�ҫ������u�F��H���v�ƶq�����A�٤���I���C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111491_0", 0 ) --�^��W�@��	
	end
end
function LuaS_ForEventNpcs()
LoadQuestOption( OwnerID() )
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_K_09V_112151_6") , "LuaS_112151_20", 0 ) --�ڷQ�s�@�R�ʥ��J�O
end

function LuaS_112151_20()
local aitem=202981	--�i�i��
local bitem=202983	--����
local citem=203022	--���H���R��
local ditem=203023	--�R�ʥ��J�O
	if  CountBodyItem( OwnerID() , aitem )>=1 and CountBodyItem( OwnerID() , bitem )>=1 and CountBodyItem( OwnerID() , citem )>=1 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			DelBodyItem( OwnerID() , aitem , 1 )
			DelBodyItem( OwnerID() , bitem , 1 )
			DelBodyItem( OwnerID() , citem , 1 )
			GiveBodyItem( OwnerID() ,ditem , 1 )
			SetSpeakDetail( OwnerID(), GetString("SC_K_09V_112151_5")   )--���ѤU�����H�צ�����
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_112150_20", 0 ) --�^��W�@��
		else
		SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG8")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_112150_20", 0 ) --�^��W�@��
		end
	else
	SetSpeakDetail( OwnerID(), GetString("SC_K_09V_112151_7")   )--�z�ҫ������ƶq�����A�٤���I����C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_112150_20", 0 ) --�^��W�@��
	end
end
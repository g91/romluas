
function Lua_jiyi_121431_talk() --�ǰeNPC��ܼ@��
	local own=OwnerID() --���a
	local tar=TargetID() --NPC
--	local star = ReadRoleValue(Tar, EM_RoleValue_Register1 )  --�����O�_�i�H�Ұ� 0��ܥi�H 1��ܪ��a�D�Ԥ� 
	local string ={"[SC_2012HALLOWEEN_PLAYER_121431_01]",
			"[SC_2012HALLOWEEN_PLAYER_121431_02]", 
			"[SC_2012HALLOWEEN_PLAYER_121431_05]",
			"[SC_2012HALLOWEEN_PLAYER_121431_06]",
			"[SC_2012HALLOWEEN_NPC_121431_01]"}	

	if CheckFlag( own , 547019) == true then --�p�G���a�w�g��L���y
			SetSpeakDetail( own, "[SC_2012HALLOWEEN_NPC_121431_01]" )   --���§A�������F
	elseif 	CheckFlag( own , 547020) ==true  then --���a�w�����ʺX��
			SetSpeakDetail( own, "[SC_2012HALLOWEEN_NPC_121431_02]" )   --����§���F��?
			AddSpeakOption( own,tar, string[1],"Lua_jiyi_121431_talk2", 0 )  --����
			AddSpeakOption( own, tar,string[2], "Lua_jiyi_121431_talk3", 0 )  --����
	else 
			SetSpeakDetail( own, "[SC_2012HALLOWEEN_NPC_121431_03]" )  --������
			AddSpeakOption( own, tar, string[3], "Lua_jiyi_121431_talk5", 0 )  --�h�ݬ�
			AddSpeakOption( own, tar, string[4], "Lua_jiyi_121431_talk7", 0 )  --�S��	
	end	
end



function Lua_jiyi_121431_talk2()
	local own=OwnerID()
			SetSpeakDetail(own,"[SC_2012HALLOWEEN_NPC_121431_01]") --���§A�������F
end

function Lua_jiyi_121431_talk3()
	local own=OwnerID()
	local tar=TargetID() --NPC	
			SetSpeakDetail( own, "[SC_2012HALLOWEEN_NPC_121431_04]" )  --�ڰe�A�h�A��
			AddSpeakOption( own, tar, "[SC_2012HALLOWEEN_PLAYER_121431_03]", "Lua_jiyi_121431_talk5", 0 )  --�n�A�ǰe
			AddSpeakOption( own, tar, "[SC_2012HALLOWEEN_PLAYER_121431_04]", "Lua_jiyi_121431_talk4", 0 )  --���ΤF
end

function Lua_jiyi_121431_talk4()
	local own=OwnerID()
			SetSpeakDetail(own,"[SC_2012HALLOWEEN_NPC_121431_05]") --�O�o�h���
end

function Lua_jiyi_121431_talk5()
	local own=OwnerID() --���a
	local tar=TargetID() --NPC		
		SetPos( own, 30.7, 81.0, -15.0, 0 )--�ǰe���a
end

function Lua_jiyi_121431_talk6()
	local own=OwnerID()
			SetSpeakDetail( own, "[SC_2012HALLOWEEN_NPC_121431_06]" )  --�ڰe�A�h�A��
			AddSpeakOption( own, tar, "[SC_2012HALLOWEEN_PLAYER_121431_03]", "Lua_jiyi_121431_talk5", 0 )  --�n�A�ǰe
end

function Lua_jiyi_121431_talk7()
	local own=OwnerID()
			SetSpeakDetail(own,"[SC_2012HALLOWEEN_PLAYER_121431_07]") --���ŦA��
end
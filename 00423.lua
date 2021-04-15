-----------------------------------------------------------------------------------------------------------
function LuaS_110184()

	LoadQuestOption( OwnerID() );  --���J���ȼҪO

	if CheckAcceptQuest( OwnerID(), 420551) == true then
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_110184_NOSAY"),   	   "LuaS_110484_NoSay",     0 );	--�W�[�@�ӿﶵ�A���i��
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_110184_ITISNOSAY"), "LuaS_110484_ItIsNoSay",0 );	--�W�[�@�ӿﶵ�A�w�쬰���i��
	elseif CheckAcceptQuest( OwnerID(), 420552) ==true then
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_110184_BOOK"),           "LuaS_110484_Book",       0 );	--�W�[�@�ӿﶵ�A�w�d��������
	end

end

-----------------------------------------------------------------------------------------------------------

function LuaS_110484_NoSay()

	SetSpeakDetail( OwnerID(), GetString("ST_110184_1") );
	AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_LOOKOTHER"),     "LuaS_110184",      0 );	--�W�[�@�ӿﶵ�A�ݬݨ�L����
--	AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_EXIT"), "LuaS_110484_Exit",0 );		--�W�[�@�ӿﶵ�A���}

end

-----------------------------------------------------------------------------------------------------------

function LuaS_110484_ItIsNoSay()

	SetSpeakDetail( OwnerID(), GetString("ST_110184_2") );
	AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_LOOKOTHER"),     "LuaS_110184",      0 );	--�W�[�@�ӿﶵ�A�ݬݨ�L����
--	AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_EXIT"), "LuaS_110484_Exit",0 );		--�W�[�@�ӿﶵ�A���}

end

-----------------------------------------------------------------------------------------------------------

function LuaS_110484_Book()

	SetSpeakDetail( OwnerID(), GetString("ST_110184_3") );
	AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_LOOKOTHER"),     "LuaS_110184",      0 );	--�W�[�@�ӿﶵ�A�ݬݨ�L����
--	AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_EXIT"), "LuaS_110484_Exit",0 );		--�W�[�@�ӿﶵ�A���}

end
-----------------------------------------------------------------------------------------------------------

function LuaS_110184_Exit()

	CloseSpeak( OwnerID() );	--������ܵ���

end

-----------------------------------------------------------------------------------------------------------

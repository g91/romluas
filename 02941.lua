-----------------------------------------------------------------------------
--Z26
-----------------------------------------------------------------------------
-----------------------------------------------------聯盟守衛陪你說話
function lua_Z26m_Talk1()
	SetPlot(OwnerID(),"touch","lua_Z26m_Talk1_1",30)
	SetCursorType( OwnerID() , eCursor_Speak) 
end
function lua_Z26m_Talk1_1()
	local num = Rand(5)+1
	--Say( OwnerID(),num)
	AdjustFaceDir( TargetID(),OwnerID(),0)
	NpcSay(TargetID(),"[SC_Z26M_TALK1_"..num.."]")
end
-----------------------------------------------------喵咪陪你說話
function lua_Z26m_Talk2()
	SetPlot(OwnerID(),"touch","lua_Z26m_Talk2_1",30)
	SetCursorType( OwnerID() , eCursor_Speak) 
end
function lua_Z26m_Talk2_1()
	local num = Rand(5)+1
	AdjustFaceDir( TargetID(),OwnerID(),0)
	NpcSay(TargetID(),"[SC_Z26M_TALK2_"..num.."]")
end
-----------------------------------------------------狗狗陪你說話
function lua_Z26m_Talk3()
	SetPlot(OwnerID(),"touch","lua_Z26m_Talk3_1",30)
	SetCursorType( OwnerID() , eCursor_Speak) 
end
function lua_Z26m_Talk3_1()
	local num = Rand(5)+1
	AdjustFaceDir( TargetID(),OwnerID(),0)
	NpcSay(TargetID(),"[SC_Z26M_TALK3_"..num.."]")
end
-----------------------------------------------------艾力克陪你說話
function lua_Z26m_Talk4()
	SetPlot(OwnerID(),"touch","lua_Z26m_Talk4_1",30)
	SetCursorType( OwnerID() , eCursor_Speak) 
end
function lua_Z26m_Talk4_1()
	--
	local num = Rand(5)+1
	AdjustFaceDir( TargetID(),OwnerID(),0)
	NpcSay(TargetID(),"[SC_Z26M_TALK4_"..num.."]")
end

-----------------------------------------------------沸水蛛蠍在跳舞
function lua_Z26m_107718_PlayMotion()
	
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_ATTACK_1H)
	Sleep(30)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_BUFF_SP01)
	Sleep(30)
end
-----------------------------------------------------制裁者89-X在跳舞
function lua_Z26m_107710_PlayMotion()
	
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_PARRY_1H)
	Sleep(20)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_PARRY_1H)
	Sleep(20)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_PARRY_1H)
	Sleep(20)
end
-----------------------------------------------------索雷爾頓巡視者在跳舞
function lua_Z26m_107711_PlayMotion()
	
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_BUFF_BEGIN)
	CastSpell( OwnerID() ,OwnerID() , 850896 )
	Sleep(20)
end


-----------------------�ʧ@��{----------------------------
Function LuaP_ShowCry()                                    --�@����
	while true do
		PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_EMOTE_CRY)
		Sleep( 10 )
		PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_EMOTE_CRY)
		Sleep( 10 )
		Sleep( rand( 100 ) )
	end
end
----------------------------------------
Function LuaP_Showlol()                                    --�@���j��
	while true do
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_LAUGH)
		Sleep( 10 )
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_LAUGH)
		Sleep( 10 )
		Sleep( rand( 100 ) )
	end
end
----------------------------------------
function Lua_kk_SALUTE()			--�Ԥh�q§
	while true do
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SALUTE2)
		sleep(90)
	end
end
----------------------------------------
function Lua_kk_ATTACK_BOW()		--�g�b
	while ture do
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_ATTACK_BOW_SP_BEGIN)
		sleep(20)
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_ATTACK_BOW_SP_LOOP)
		sleep(30)
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_ATTACK_BOW_SP_END)
		sleep(10)
		Sleep( rand( 100 ) )
	end
end
----------------------------------------
function LuaS_k_Motion1()
	while true do
		PlayMotion( OwnerID()  ,ruFUSION_ACTORSTATE_EMOTE_EAT)		--
		sleep(50)
		PlayMotion( OwnerID()  ,ruFUSION_ACTORSTATE_EMOTE_DRINK)
		sleep(50)
	end
end
----------------------------------------
function LuaS_k_Motion2()
	while true do
		PlayMotion( OwnerID()  ,ruFUSION_ACTORSTATE_EMOTE_PROVOKE)		--
		sleep(50)
		PlayMotion( OwnerID()  ,ruFUSION_ACTORSTATE_EMOTE_THREATEN)
		sleep(50)
	end
end
--------------------------------------
function LuaS_k_ANGRY()	--�ͮ�
	while true do
		PlayMotion( OwnerID()  ,ruFUSION_ACTORSTATE_EMOTE_ANGRY)		
		sleep(50)
	end
end
---------------
function LuaS_k_CRY()	--���_
	while true do
		PlayMotion( OwnerID()  ,ruFUSION_ACTORSTATE_EMOTE_CRY)		
		sleep(50)
	end
end
---------------------
function LuaS_k_LAUGH()	--�j��
	while true do
		PlayMotion( OwnerID()  ,ruFUSION_ACTORSTATE_EMOTE_LAUGH)		
		sleep(50)
	end
end
-------------------------
function LuaS_KK_Motion_JUMP()--���ڤH�M��
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_JUMP_LOOP)
end
-----------------------
function LuaS_KK_Motion_JUMP_GIRL()--���ڤk�H�M��
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_CROUCH_LOOP)
end
-----------------------
Function LuaP_HANDSTAND() --�����ί{�A�v 
	while true do 
		PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_HANDSTAND )
		sleep(15)
		PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_SP_SPINKICK )
		sleep(20)
		PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SALUTE2 )
		sleep(30)
	end
end
----------------------
Function LuaP_Speak_kk()--�����ιΪ��M��  �b���ܪ��P�ɼ��ʰ�
	local Motion = { 	[1] = ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD ; -- �g�J�}�C �I�Y
						[2] = ruFUSION_ACTORSTATE_EMOTE_APPLAUSE ; --���
						[3] = ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE ; --�n�Y
						[4] = ruFUSION_ACTORSTATE_EMOTE_KISS ; --���k
					}	--�ŧiMotion���}�C

	local Message = {	[1] = "[SC_116982_1]";	
						[2] = "[SC_116982_2]";
						[3] = "[SC_116982_3]";
						[4] = "[SC_116982_4]";
						[5] = "[SC_116982_5]";
					}
	
	while 1  do 	
		local j = rand(5) + 1	
		if j < 5 then  				
			PlayMotion( OwnerID(), Motion[j] )
		end
		Say( OwnerID() , Message[j] )
		sleep(150+Rand(5)*10)
	end
end

-------���R---------
function LuaS_kk_Motion_DANCE()
	while 1 do
		SetDefIdleMotion(OwnerID(),ruFUSION_MIME_EMOTE_DANCE)
		sleep(5+Rand(5))
	end
end
-----------------------動作表現----------------------------
Function LuaP_ShowCry()                                    --一直哭
	while true do
		PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_EMOTE_CRY)
		Sleep( 10 )
		PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_EMOTE_CRY)
		Sleep( 10 )
		Sleep( rand( 100 ) )
	end
end
----------------------------------------
Function LuaP_Showlol()                                    --一直大笑
	while true do
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_LAUGH)
		Sleep( 10 )
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_LAUGH)
		Sleep( 10 )
		Sleep( rand( 100 ) )
	end
end
----------------------------------------
function Lua_kk_SALUTE()			--紳士敬禮
	while true do
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SALUTE2)
		sleep(90)
	end
end
----------------------------------------
function Lua_kk_ATTACK_BOW()		--射箭
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
function LuaS_k_ANGRY()	--生氣
	while true do
		PlayMotion( OwnerID()  ,ruFUSION_ACTORSTATE_EMOTE_ANGRY)		
		sleep(50)
	end
end
---------------
function LuaS_k_CRY()	--哭泣
	while true do
		PlayMotion( OwnerID()  ,ruFUSION_ACTORSTATE_EMOTE_CRY)		
		sleep(50)
	end
end
---------------------
function LuaS_k_LAUGH()	--大笑
	while true do
		PlayMotion( OwnerID()  ,ruFUSION_ACTORSTATE_EMOTE_LAUGH)		
		sleep(50)
	end
end
-------------------------
function LuaS_KK_Motion_JUMP()--犬族人專用
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_JUMP_LOOP)
end
-----------------------
function LuaS_KK_Motion_JUMP_GIRL()--犬族女人專用
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_CROUCH_LOOP)
end
-----------------------
Function LuaP_HANDSTAND() --馬戲團砸耍師 
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
Function LuaP_Speak_kk()--馬戲團團長專用  在說話的同時撥動做
	local Motion = { 	[1] = ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD ; -- 寫入陣列 點頭
						[2] = ruFUSION_ACTORSTATE_EMOTE_APPLAUSE ; --拍手
						[3] = ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE ; --搖頭
						[4] = ruFUSION_ACTORSTATE_EMOTE_KISS ; --飛吻
					}	--宣告Motion為陣列

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

-------跳舞---------
function LuaS_kk_Motion_DANCE()
	while 1 do
		SetDefIdleMotion(OwnerID(),ruFUSION_MIME_EMOTE_DANCE)
		sleep(5+Rand(5))
	end
end

---------------------------------------------------------------
function LuaS_422713_0() -- 總導演 的出生劇情
---------------------------------------------------------------
--使用旗子 780094 編號 1 2 3 4 5 6
--建立所有演員
	local Ball1 = Lua_DW_CreateObj("flag",113579,780094,4)
	local Ball2 = Lua_DW_CreateObj("flag",113579,780094,5)
	Lua_ObjDontTouch(Ball1)
	Lua_ObjDontTouch(Ball2)
	sleep(10)
	local Master1 = Lua_DW_CreateObj("flag",113422,780094,1)
	local Master2 = Lua_DW_CreateObj("flag",113421,780094,2)
	local Master3 = Lua_DW_CreateObj("flag",113423,780094,3)
	SetModeEx(Master1,EM_SetModeType_HideName,false) 
	SetModeEx(Master2,EM_SetModeType_HideName,false) 
	SetModeEx(Master3,EM_SetModeType_HideName,false) 
	sleep(60)
	while	true	do
--讓三首席施法
		CastSpell(Master1,Ball1,492184)
		CastSpell(Master2,Ball1,492184)
		CastSpell(Master3,Ball1,492184)
		sleep(1200)
--依序中斷施法
		AddBuff( Master1 ,502383,1 ,1)
		sleep(10)
		sleep(10)
		PlayMotion(Master1,ruFUSION_ACTORSTATE_EMOTE_SURRENDER)
		AddBuff( Master2 ,502383,1 ,1)
		sleep(15)
		Say(Master2,"[SC_422713_0]")
		PlayMotion(Master2,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		sleep(20)
		AddBuff( Master3 ,502383,1 ,1)
--對話
		Say(Master1,"[SC_422713_1]")
		sleep(25)
		Say(Master3,"[SC_422713_2]")
		PlayMotion(Master3,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
--solo施法
		sleep(20)
		CastSpell(Master3,Ball1,492184)
--吐血
		Say(Master2,"[SC_422713_3]")
		PlayMotion(Master2,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		sleep(40)
		AddBuff( Master3 ,502383,1 ,1)
		sleep(15)
		CastSpell(Ball2,Ball2,492667)
		PlayMotion(Master3,ruFUSION_ACTORSTATE_HURT_CRITICAL)
		Say(Master3,"[SC_422713_4]")
		sleep(10)
		Say(Master2,"[SC_422713_5]")
		sleep(25)
--對話
		Say(Master3,"[SC_422713_6]")
		sleep(25)
		Say(Master1,"[SC_422713_7]")
		sleep(25)
		Say(Master2,"[SC_422713_8]")
		PlayMotion(Master2,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		sleep(20)
		PlayMotion(Master3,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
		PlayMotion(Master1,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
		sleep(20)
	end

	Delobj(Master1)
	Delobj(Master2)
	Delobj(Master3)
	Delobj(Ball1)
	Delobj(Ball2)
end
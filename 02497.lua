------------------------------------------------------巨獸之王------------------------------------------------------------------------
function LuaS_118922_WORLDBOSS_010()		--對話劇情
	local player = OwnerID()
	local npc = TargetID()
	LoadQuestOption(player)
	if ReadRoleValue(npc,EM_RoleValue_Register9)==0 then
		if	CountBodyItem(player,240558) >= 10 then 
			AddSpeakOption(player,npc,"[SC_118922_WORLDBOSS_01]","LuaS_118922_WORLDBOSS_011",0)
		else
			ScriptMessage( player, player, 1,"[SC_118922_WORLDBOSS]", 0 )
			LoadQuestOption(player)
		end
	end
end

function LuaS_118922_WORLDBOSS_011()
	local player = OwnerID()
	local npc = TargetID()
	SetSpeakDetail(player,"[SC_118922_WORLDBOSS_02]")		
	AddSpeakOption(player,npc,"[SC_118922_WORLDBOSS_03]","LuaS_118922_WORLDBOSS_012",0)	--解除封印
end

function LuaS_118922_WORLDBOSS_012()
	local player = OwnerID()
	local npc = TargetID()
	CloseSpeak(player)
	-- 2013.02.21 改寫，修正玩家利用對話機制的漏洞，重複招喚Boss的問題
	if ReadRoleValue(npc,EM_RoleValue_Register9)==0 then
		DisableQuest(npc,true)
		CallPlot(npc,"LuaS_118922_WORLDBOSS_013",npc,player)
		delBodyItem(player,240558,10) 
	end
	--
end

function LuaS_118922_WORLDBOSS_013(npc,player)
	local HardCore=(ReadRoleValue(npc,EM_RoleValue_Register8)==0);
	local RoomID = ReadRoleValue(npc,EM_RoleValue_RoomID)
	local ctrl  = Lua_CreateObjByDir( npc , 119306 , 0 , 0)
	SetModeEx(ctrl,EM_SetModeType_Show,true)
	SetModeEx(ctrl,EM_SetModeType_Mark,false)
	AddToPartition(ctrl,RoomID)
	CastSpell(ctrl,ctrl,498334)
	sleep(60)
	local BossOrgID
	if HardCore==false then
		BossOrgID=105893;
	else
		BossOrgID=107190;
	end
	local boss  = Lua_CreateObjByDir( ctrl, BossOrgID , 0 , 0)
	if HardCore==true then
		WriteRoleValue(boss,EM_RoleValue_Register8,0);

	else
		WriteRoleValue(boss,EM_RoleValue_Register8,1);
	end
	WriteRoleValue(boss,EM_RoleValue_Register9,npc);
	WriteRoleValue(npc,EM_RoleValue_Register9,1);
	AddToPartition(boss,RoomID)
	SetAttack(boss,player)
	DelObj(ctrl)
	--callplot(npc,"LuaS_118922_WORLDBOSS_014",npc,boss)
end


------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------大海之牙--------------------------------------------------------------

function LuaS_118922_WORLDBOSS_020()		--對話劇情
	local player = OwnerID()
	local npc = TargetID()
	LoadQuestOption(player)
	if ReadRoleValue(npc,EM_RoleValue_Register9)==0 then
		if	CountBodyItem(player,240638) >= 10 then 
			AddSpeakOption(player,npc,"[SC_118922_WORLDBOSS_04]","LuaS_118922_WORLDBOSS_021",0)	--放置海洋能量結晶。
		else
			LoadQuestOption(player)
		end
	end
end

function LuaS_118922_WORLDBOSS_021()
	local player = OwnerID()
	local npc = TargetID()
	SetSpeakDetail(player,"[SC_118922_WORLDBOSS_05]")						--有種不尋常的壓力，壟罩著祭壇周圍...
	AddSpeakOption(player,npc,"[SC_118922_WORLDBOSS_03]","LuaS_118922_WORLDBOSS_022",0)	--解除封印
end

function LuaS_118922_WORLDBOSS_022()
	local player = OwnerID()
	local npc = TargetID()
	-- 2013.02.21 改寫，修正玩家利用對話機制的漏洞，重複招喚Boss的問題
	CloseSpeak(player)
	if ReadRoleValue(npc,EM_RoleValue_Register9)==0 then
		DisableQuest(npc,true);
		CallPlot(npc,"LuaS_118922_WORLDBOSS_023",npc,player)
		delBodyItem(player,240638,10)
	end
	--
end

function LuaS_118922_WORLDBOSS_023(npc,player)
	local HardCore=(ReadRoleValue(npc,EM_RoleValue_Register8)==0);
	local RoomID = ReadRoleValue(npc,EM_RoleValue_RoomID)
	local ctrl1  = Lua_CreateObjByDir( npc , 119306 , 0 , 0)
	local ctrl2  = Lua_CreateObjByDir( npc , 119306 , 360 , 0)
	SetModeEx(ctrl1,EM_SetModeType_Show,true)
	SetModeEx(ctrl1,EM_SetModeType_Mark,false)
	SetModeEx(ctrl2,EM_SetModeType_Show,true)
	SetModeEx(ctrl2,EM_SetModeType_Mark,false)
	AddToPartition(ctrl1,RoomID)
	AddToPartition(ctrl2,RoomID)
	CastSpell(ctrl1,ctrl2,498335)
	sleep(60)
	local BossOrgID,FakeBossOrgID
	if HardCore==false then
		BossOrgID=105894
		FakeBossOrgID=106163
	else
		BossOrgID=107192
		FakeBossOrgID=107193
	end
	local fakeboss  = Lua_CreateObjByDir( ctrl2,FakeBossOrgID, 0 , 0)
	SetModeEx(fakeboss,EM_SetModeType_Fight,false)
	SetModeEx(fakeboss,EM_SetModeType_Searchenemy,false)
	AddToPartition(fakeboss,RoomID)
	Move(fakeboss,-29894.3,-342.1,23807.7)
	addbuff(fakeboss,620930,0,15)
	Sleep(100)
	PlayMotion(fakeboss,31)
	CastSpell(ctrl1,fakeboss,498335)
	Sleep(10)
	local boss  = Lua_CreateObjByDir( fakeboss, BossOrgID , 0 , 0)
	DelObj(fakeboss)
	if HardCore==true then
		WriteRoleValue(boss,EM_RoleValue_Register8,0);
	else
		WriteRoleValue(boss,EM_RoleValue_Register8,1);
	end
	WriteRoleValue(boss,EM_RoleValue_Register9,npc);
	WriteRoleValue(npc,EM_RoleValue_Register9,1);
	AddToPartition(boss,RoomID)
	SetAttack(boss,player)
	DelObj(ctrl1)
	DelObj(ctrl2)
	--callplot(npc,"LuaS_118922_WORLDBOSS_024",npc,boss)
end
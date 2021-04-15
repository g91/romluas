Function Z25_NPC107677_DEAD()
	AddBuff( OwnerID(), 623134, 0, -1 )
	return
End

function Lua_426117_ask()
	local player = OwnerID()
	local Npc = TargetID()
	if CheckAcceptQuest(player,426117)==true and CheckFlag(player,547718)==false then
		AddSpeakOption(player,npc,"[SC_426117_01]","Lua_426117_say",0)
	end
	LoadQuestOption(player)	
end

function Lua_426117_say()
	local player = OwnerID()
	local Npc = TargetID()
	local lock = ReadRoleValue(npc,EM_RoleValue_register1)
	SetSpeakDetail(player,"[SC_426117_02]")
	if CheckAcceptQuest(player,426117)==true and CheckFlag(player,547718)==false then
		if lock == 0 then		
			AddSpeakOption(player,npc,"[SC_426117_03]","Lua_426117_Show_ready(1)",0)
		else
			AddSpeakOption(player,npc,"[SC_426117_03]","Lua_426117_Show_ready(2)",0)
		end
	end
end

function Lua_426117_Show_ready(num)
	local player = OwnerID()
	local Npc = TargetID()
	Lua_AND_RANGEPLAYER(player,Npc,426117)	--用來關閉同時間開啟對話視窗的玩家
	if num == 1 then
		WriteRoleValue(npc,EM_RoleValue_register1,1)
		CallPlot(npc,"Lua_426117_Show",npc,player)
	elseif num == 2 then
		SetSpeakDetail(player,"[SC_424528_3]")
	end
end

function Lua_426117_Show(npc,player)
	local ShowFlag = 780950
	CloseSpeak(player)
	AddBuff(player,624059,0,10)
	ScriptMessage(npc,player,2,"[SC_426117_04]",0)
	sleep(25)	
	local STONE = Lua_DW_CreateObj("flag",119344, ShowFlag, 0)
	ScriptMessage(npc,player,2,"[SC_426117_05]",0)
	CastSpell(STONE,STONE,850719)
	sleep(15)
	DelObj(STONE)
	ScriptMessage(npc,player,2,"[SC_426117_06]",0)
	AddBuff(player,620001,0,2)
	sleep(5)
	CancelBuff(player,624059)
	if CheckAcceptQuest(player,426117)==true and CheckFlag(player,547718)==false then
		SetFlag(player,547718,1)
		SetFlag(player,547692,1)
	else
		WriteRoleValue(npc,EM_RoleValue_register1,0)
		return
	end
	WriteRoleValue(npc,EM_RoleValue_register1,0)
end

function Lua_426118_ask()
	local player = OwnerID()
	local npc = TargetID()
	local lock = ReadRoleValue(npc,EM_RoleValue_register1)
	LoadQuestOption(player)
	if CheckAcceptQuest(player,426118)==true and CheckFlag(player,547719)==false then
		if lock == 0 then		
			AddSpeakOption(player,npc,"[SC_426118_00]","Lua_426118_Show_ready(1)",0)
		else
			AddSpeakOption(player,npc,"[SC_426118_00]","Lua_426118_Show_ready(2)",0)

		end
	end			
end

function Lua_426118_Show_ready(num)
	local player = OwnerID()
	local Npc = TargetID()
	Lua_AND_RANGEPLAYER(player,Npc,426118)	--用來關閉同時間開啟對話視窗的玩家
	if num == 1 then
		WriteRoleValue(npc,EM_RoleValue_register1,1)
		CallPlot(npc,"Lua_426118_Show",npc,player)
	elseif num == 2 then	
		SetSpeakDetail(player,"[SC_424528_3]")
	end
end


function Lua_426118_Show(npc,player)
	local ShowFlag = 780950
	local TempPlayer = SearchRangePlayer(npc,150)
	local panilor = Lua_DW_CreateObj("flag",122084, ShowFlag,1)
	local RoomID = ReadRoleValue(npc,EM_RoleValue_RoomID)
	AddToPartition( panilor, RoomID )
	CloseSpeak(player)
	sleep(10)
	for checkcount=0,#TempPlayer do
		if CheckAcceptQuest(TempPlayer[checkcount],426118)==true then
			AddBuff(TempPlayer[checkcount],624064,0,20)
		end
	end
	AddBuff(player,624064,0,20)
	Say(panilor ,"[SC_426118_01]")
	sleep(30)
	Say(panilor,"[SC_426118_02]")
	sleep(20)
	Say(panilor,"[SC_426118_03]")
	sleep(20)
	Say(panilor,"[SC_426118_04]")
	sleep(20)
	Say(panilor,"[SC_426118_05]")
	sleep(20)
	Say(panilor,"[SC_426118_06]")
	sleep(20)
	Say(panilor,"[SC_426118_07]")
	sleep(20)
	Say(panilor,"[SC_426118_08]")
	sleep(20)
	ScriptMessage(panilor,0,1,"[SC_426118_09]",0)
	DelObj(panilor)
	sleep(10)
	for checkcount=0,#TempPlayer do
		if CheckAcceptQuest(TempPlayer[checkcount],426118)==true and CheckBuff(TempPlayer[checkcount],624064)==true then
			SetFlag(TempPlayer[checkcount],547719,1)
		end
	end
	CancelBuff(player,624064)
	WriteRoleValue(npc,EM_RoleValue_register1,0)
end

function Lua_426117_finish()
	local player = TargetID()
	SetFlag(player,547692,1)
end

function Lua_426119_accept()
	local ShowFlag = 780950
	local player = TargetID()
	local Npc = OwnerID()
	local Jill = Lua_DW_CreateObj( "obj",120921,Npc ,1 , 1)
	AddBuff(player,622179,0,8)
	DW_Move("flag",Jill ,ShowFlag,2)
	sleep(10)
	DelObj(Jill)
end

function Lua_426120_finish()
	local ShowFlag = 780950
	local player = TargetID()
	local soldier = Lua_DW_CreateObj("flag",122108, ShowFlag,3)
	AddBuff(player,623821,0,8)
	DW_Move("flag",soldier,ShowFlag,4)	
	Sleep(20)
	say(soldier,"[SC_426120_00]")
	Sleep(20)
	DW_Move("flag",soldier,ShowFlag,3)
	DelObj(soldier)
	CancelBuff(player,623821)
	AddBuff(player,620001,0,2)
	Sleep(5)
	SetPos(player,-12130,1728,-5801,252)
end

function Lua_426121_ask()
	local player = OwnerID()
	local Npc = TargetID()
	if CheckAcceptQuest(player,426121)==true and CheckFlag(player,547720)==false then
		AddSpeakOption(player,npc,"[SC_426121_00]","Lua_426121_show",0)
	end
	LoadQuestOption(player)
end

function Lua_426121_show()
	local player = OwnerID()
	local Npc = TargetID()
	CloseSpeak(player)
	Lua_426121_drama_queue()
end

function Lua_426121_finish()
	local player = TargetID()
	SetFlag(player,547693,1)
end

function Lua_426122_accept()
	local player = TargetID()
	SetPos(player,-12135,2032,-5242,315)	
end

function Lua_Z25_lock_stone()
	local Center = OwnerID()
	local T1_XYZ = { -10449 , 1834 , -7697 }
	local T2_XYZ = { -10583 , 1834 , -7513 }
	local T3_XYZ = { -10701 , 1834 , -7738 }
	local T1 = Lua_DW_CreateObj( "xyz" , 119344 , T1_XYZ , 1 , 180 , 1 )
	local T2 = Lua_DW_CreateObj( "xyz" , 119344 , T2_XYZ , 1 , 180 , 1 )
	local T3 = Lua_DW_CreateObj( "xyz" , 119344 , T3_XYZ , 1 , 180 , 1 )
	SysCastSpellLv(T1,Center,850741,0) 
	SysCastSpellLv(T2,Center,850741,0) 
	SysCastSpellLv(T3,Center,850741,0)
	AddBuff(Center,624150,0,-1) 
end

function Lua_Z25_jill_cast()
	local Center = OwnerID()
	CastSpell(Center ,Center,497492)
end

function Lua_Z25_426121_buffcheck()
	if CheckAcceptQuest(OwnerID(),426121)==true or CheckAcceptQuest(OwnerID(),425995)==true then
		return
	else
		CancelBuff(OwnerID(),624059)
	end
end

function Lua_Z25_426118_buffcheck()
	if CheckAcceptQuest(OwnerID(),426118)==true then
		return
	else
		CancelBuff(OwnerID(),624064)
	end
end

function LuaQ_425844_Show()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Bman = CreateObj_ByObjPoint(OwnerID(),121729,"p_down") 
	SetModeEx(Bman,EM_SetModeType_Gravity,true)
	AddToPartition(Bman,RoomID)
	Sleep(10)
	npcsay(Bman,"[EM_421042_2]")
	Sleep(10)
	DelObj(Bman)
	return true
end
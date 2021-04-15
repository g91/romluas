function LuaQ_424817_Anmeson_0()
	local OID = OwnerID()
	local TID = TargetID()
	LoadQuestOption(OID)

	if CheckAcceptQuest(OID,424817)==true and CheckFlag(OID,545873)==false then
		AddSpeakOption(OID,TID,"[SC_424817_01]","LuaQ_424817_Anmeson_1",0)

	-- 2011.11.03 mika 加入柯隆專用物品商店對話選項
	elseif CheckCompleteQuest(OID,425013) == true then
		AddSpeakOption( OID, TID, GetString("SO_WANTBUY") , "LuaS_ComShop_1", 0 ); --/我想看看你賣的東西
	-----------------------------------------------------------
	else
		LoadQuestOption(OID)
	end
	--2011.12.29加入再取得任務物品

	if CheckAcceptQuest(OID,424813)==true and CountBodyItem(OID,240829)==0 then

 		AddSpeakOption( OwnerID(), TargetID(), "[SC_MOREITEM][$SETVAR1=".."[240829]".."]" , "LuaQ_424813_Anmeson_0", 0 ); 

	end
end


function LuaQ_424813_Anmeson_0()

	GiveBodyItem(OwnerID(),240829,4)
	CloseSpeak(OwnerID())
end




function LuaQ_424817_Anmeson_1()
	local OID = OwnerID()
	SetSpeakDetail(OID,"[SC_424817_02]")
	SetFlag(OID,545870,1)
end

function LuaQ_424817_Gill_0()
	local OID = OwnerID()
	local TID = TargetID()
	LoadQuestOption(OID)
	if CheckAcceptQuest(OID,424817)==true and CheckFlag(OID,545870)==true and CheckFlag(OID,545873)==false then
		AddSpeakOption(OID,TID,"[SC_424817_03]","LuaQ_424817_Gill_1",0)
	else
		LoadQuestOption(OID)
	end
end

function LuaQ_424817_Gill_1()
	local OID = OwnerID()
	local TID = TargetID()
--		SetFlag(OID,545871,1)
		SetSpeakDetail(OID,"[SC_424817_04]")
--		DelBodyItem(OID,545870,1)
--		if CheckFlag(OID,545871)==true and CheckFlag(OID,545870)==false then
			AddSpeakOption(OID,TID,"[SC_424817_05]","LuaQ_424817_Gill_2",0)
--		else
--			LoadQuestOption(OID)
--		end
end

function LuaQ_424817_Gill_2()
	local OID = OwnerID()
	local TID = TargetID()
--		SetFlag(OID,545872,1)
		SetSpeakDetail(OID,"[SC_424817_06]")
--		DelBodyItem(OID,545871,1)
--		if CheckFlag(OID,545872)==true then
			AddSpeakOption(OID,TID,"[SC_424817_07]","LuaQ_424817_Gill_3",0)
--		else
--			LoadQuestOption(OID)
--		end
end


function LuaQ_424817_Gill_3()
	local OID = OwnerID()
	local TID = TargetID()
	local Flag = 781049	
	local actor_Gill = Lua_DW_CreateObj("obj",119694,TID)
	ks_ActSetMode( actor_Gill )
	AddBuff(OID,621147,0,-1)
	
	local TRegist = ReadRoleValue(TID,EM_RoleValue_Register1)
	if TRegist == 0 then
		CallPlot(TID,"LuaQ_424817_Gill_4",TID,OID,actor_Gill,Flag)
	else
		LoadQuestOption(OID)
	end
end
	
function LuaQ_424817_Gill_4(TID,OID,actor_Gill,Flag)
	CloseSpeak(OID)
	WriteRoleValue(TID,EM_RoleValue_Register1,9)
	local Anmeson = Lua_DW_CreateObj("flag",119695, Flag, 0)
	ks_ActSetMode( Anmeson )
	sleep(20)
	PlayMotion(actor_Gill, ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	NPCSAY(actor_Gill, "[SC_424817_08]")
	sleep(10)
	PlayMotion(actor_Gill, ruFUSION_ACTORSTATE_ATTACK_UNARMED)
	sleep(5)
	PlayMotion(Anmeson , ruFUSION_ACTORSTATE_KNOCKDOWN_BEGIN)
	Sleep(10)
	local Sha = Lua_DW_CreateObj("flag",119696, Flag, 1)
	ks_ActSetMode( Sha )
	Yell(Sha,"[SC_424817_STOP]",2)
	DW_MoveToFlag( Sha , Flag, 2, 0, 1)
	AdjustFaceDir(actor_Gill,Sha, 0 )
	PlayMotion(Sha, ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	NPCSAY(Sha, "[SC_424817_09]")
	Sleep(25)
	PlayMotion(Sha, ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	NPCSAY(Sha, "[SC_424817_10]")
	Sleep(25)
	PlayMotion(Sha, ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	NPCSAY(Sha, "[SC_424817_11]")
	Sleep(25)
	PlayMotion(Sha, ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	NPCSAY(Sha, "[SC_424817_12]")
	Sleep(25)
	PlayMotion(actor_Gill, ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	NPCSAY(actor_Gill, "[SC_424817_13]")
	Sleep(10)
	DW_MoveToFlag( actor_Gill , Flag, 3, 0, 1)
	DelObj(actor_Gill)
	DW_MoveToFlag( Sha , Flag, 4, 0, 1)
	Sleep(10)
	DelObj(Sha)
	DelObj(Anmeson)
	WriteRoleValue(TID, EM_RoleValue_Register1, 0) 
	beginPlot(OID,"LuaQ_424817_Gill_5",0)	
end

function LuaQ_424817_Gill_5()
	local OID = OwnerID()
	GiveBodyItem(OID,545873,1)
	GiveBodyItem(OID,545872,1)
	CancelBuff(OID,621147)
end

function LuaQ_424819_START()
	local OID = OwnerID()
	local TID = TargetID()
	AddBuff(TID ,621148,0,-1)
	local Robert  = Lua_DW_CreateObj("obj",119693,OID)
	ks_ActSetMode( Robert )
	CloseSpeak(TID)
	sleep(10)
	NPCSAY(Robert, "[SC_424819_COME]")
	DW_MoveToFlag( Robert , 781049, 5, 0, 1)
	sleep(10)
	DelObj(Robert)
	CancelBuff(TID,621148)
end

function LuaQ_424818_sha0()
	local OID = OwnerID()
	local TID = TargetID()
	LoadQuestOption(OID)
	if CountBodyItem(OID,240839)==1 then
		AddSpeakOption(OID,TID,"[SC_424818_01]","LuaQ_424818_sha1",0)
	elseif (CheckAcceptQuest(OID,424985)==true or
		CheckAcceptQuest(OID,424990)==true or
		CheckAcceptQuest(OID,424995)==true )and
		CountBodyItem(OID,240845)<1 then
		AddSpeakOption(OID,TID,"[SC_MOREITEM][$SETVAR1=".."[240845]".."]" ,"LuaQ_424818_sha2",0)
	else
		LoadQuestOption(OID)
	end
end

function LuaQ_424818_sha1()
	local OID = OwnerID()
	SetSpeakDetail(OID,"[SC_424818_02]")
	SetFlag(OID,546055,1)
	DelBodyItem(OID,240839,1)
end

function LuaQ_424818_sha2()
	GiveBodyItem(OwnerID(),240845,20)
	CloseSpeak(OwnerID())
end

function LuaQ_424980_SPEAK()
	local OID = OwnerID()
	local TID = TargetID()
	LoadQuestOption(OID)
	if CheckAcceptQuest(OID,424980)==true and CheckFlag(OID,546057)==false then
		AddSpeakOption(OID,TID,"[SC_424980_0]","LuaQ_424980_NPC",0)
	else
		LoadQuestOption(OID)
	end
end

function LuaQ_424980_NPC()
	local OID = OwnerID()
	local TID = TargetID()
	local Flag = 781050	
	local NPC = Lua_DW_CreateObj("obj",119758,TID)
	ks_ActSetMode( NPC )
	PlayMotion(NPC, ruFUSION_ACTORSTATE_SIT_LOOP)
	AddBuff(OID,621495,0,-1)
	
	local TRegist = ReadRoleValue(TID,EM_RoleValue_Register1)
	if TRegist == 0 then
		CallPlot(TID,"LuaQ_424980_Drama",TID,OID,NPC,Flag)
	else
		LoadQuestOption(OID)
	end
end

function LuaQ_424980_Drama(TID,OID,NPC,Flag)
	CloseSpeak(OID)
	WriteRoleValue(TID,EM_RoleValue_Register1,9)
	ScriptMessage(OID,OID,1,"[SC_424980_7]",0)	--一陣無比詭異的氛圍壟罩周圍
	PlayMotion(NPC,ruFUSION_ACTORSTATE_SIT_END)
	sleep(10)
	AdjustFaceDir(NPC,OID, 0 )
	PlayMotion(NPC, ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	NPCSAY(NPC, "[SC_424980_1]") --這個魔法陣的來頭不小...
	sleep(20)
	PlayMotion(NPC, ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	NPCSAY(NPC, "[SC_424980_2]") --從前有個叫瑞冥尤薩的符文神使，因為過度暴虐被數以百計的法師聯手將這個神使封印到虛界去了...
	sleep(30)
	PlayMotion(NPC, ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	NPCSAY(NPC, "[SC_424980_3]") --而眼前的魔法陣就是供給封印當時的能量來源之一，
	Sleep(20)
	NPCSAY(NPC, "[SC_424980_4]")	--不過最令人害怕的是這個神使具備所有符文的知識，如果哪天這個神使回到我們的世界...
	Sleep(30)
	PlayMotion(NPC, ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	NPCSAY(NPC, "[SC_424980_5]")	--以現在的符文知識與魔法力量...根本無法與之匹敵...
	Sleep(20)
	local CC = Lua_DW_CreateObj("flag",119756, Flag, 1)
	ks_ActSetMode( CC )
	Sleep(10)
	NPCSAY(CC, "[SC_424980_6]")	--瑞冥尤薩...！這個名字我記住了！哈哈哈哈
	Sleep(10)
	DelObj(CC)
	ScriptMessage(OID,OID,1,"[SC_424980_8]",0)	--一陣詭譎的笑聲迴盪在空氣中...
	PlayMotion(NPC, ruFUSION_ACTORSTATE_SIT_BEGIN)
	Sleep(10)
	DelObj(NPC)
	CancelBuff(OID,621495)
	SetFlag(OID,546057,1)
	WriteRoleValue(TID,EM_RoleValue_Register1,0)
end

function LuaQ_424980_Complete()
	local OID = OwnerID()
	local TID = TargetID()
	local Flag = 781050	
	local NPC = Lua_DW_CreateObj("obj",119758,OID)
	ks_ActSetMode( NPC )
	AddBuff(TID ,621147,0,-1)
	local TRegist = ReadRoleValue(OID ,EM_RoleValue_Register1)
	if TRegist == 0 then
		CallPlot(OID ,"LuaQ_424980_Completed",TID,OID,NPC,Flag)
	else
		LoadQuestOption(TID )
	end
end

function LuaQ_424980_Completed(TID,OID,NPC,Flag)
	CloseSpeak(TID)
	WriteRoleValue(OID ,EM_RoleValue_Register1,9)
--	PlayMotion(NPC, ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(10)
	NPCSAY(NPC, "[SAY_420083]") --嘿！我先走囉！你自己多小心啊！
	sleep(10)
	DW_MoveToFlag( NPC , Flag, 3, 0, 1)
	DelObj(NPC)
	CancelBuff(TID ,621147)
	WriteRoleValue(OID,EM_RoleValue_Register1,0)
end


function LuaQ_119943_QuestFinish()
	local OID = OwnerID()
	local TID = TargetID()
	local Flag = 781050	
	local NPC = Lua_DW_CreateObj("obj",119942,OID)
	ks_ActSetMode( NPC )
	PlayMotion(NPC, ruFUSION_ACTORSTATE_SIT_LOOP)
	AddBuff(TID,621495,0,-1)
	
	local TRegist = ReadRoleValue(OID,EM_RoleValue_Register1)
	if TRegist == 0 then
		CallPlot(OID,"LuaQ_119943_FinishDrama",TID,OID,NPC,Flag)
	else
		LoadQuestOption(TID)
	end
end

function LuaQ_119943_FinishDrama(TID,OID,NPC,Flag)
	CloseSpeak(TID)
	WriteRoleValue(OID,EM_RoleValue_Register1,9)
	PlayMotion(NPC,ruFUSION_ACTORSTATE_SIT_END)
	sleep(10)
	AdjustFaceDir(NPC,TID, 0 )
	PlayMotion(NPC, ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	NPCSAY(NPC, "[SC_119943_4]") --
	sleep(20)
	PlayMotion(NPC, ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	NPCSAY(NPC, "[SC_119943_5]")
	sleep(20)
	DW_MoveToFlag( NPC , Flag, 4, 0, 1)
	DelObj(NPC)
	CancelBuff(TID ,621495)
	WriteRoleValue(OID,EM_RoleValue_Register1,0)
end

function LuaQ_424823_QuestFinish()
	local OID = OwnerID()
	local TID = TargetID()
	local Flag = 781050	
	local NPC = Lua_DW_CreateObj("obj",120079,OID)
	ks_ActSetMode( NPC )
	AddBuff(TID,621171,0,-1)
	local TRegist = ReadRoleValue(OID,EM_RoleValue_Register1)
	if TRegist == 0 then
		CallPlot(OID,"LuaQ_424823_FinishDrama",TID,OID,NPC,Flag)
	else
		LoadQuestOption(TID)
	end
end

function LuaQ_424823_FinishDrama(TID,OID,NPC,Flag)
	CloseSpeak(TID)
	WriteRoleValue(OID,EM_RoleValue_Register1,9)
	local Gill = Lua_DW_CreateObj("flag",120080, Flag,5)
	ks_ActSetMode( Gill )
	NPCSAY(Gill, "[SC_424823_3]") 
	DW_MoveToFlag( Gill , Flag, 6, 0, 1)
	NPCSAY(NPC, "[SC_424823_0]") 
	sleep(20)
	NPCSAY(Gill, "[SC_424823_1]") 
	PlayMotion(NPC, ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(20)
	NPCSAY(NPC, "[SC_424823_2]")
	PlayMotion(NPC, ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(10)
	DelObj(NPC)
	DelObj(Gill)
	CancelBuff(TID ,621171)
	WriteRoleValue(OID,EM_RoleValue_Register1,0)
end

function LuaQ_424822_QuestStart()
	local OID = OwnerID()
	local TID = TargetID()
	local actor1 = Lua_DW_CreateObj("obj",119982,OID)
	--ks_ActSetMode( actor1 )
	AddBuff(TID,621702,0,-1)
	WriteRoleValue(OID, EM_RoleValue_Register1, 0) 
	local ORegist = ReadRoleValue(OID,EM_RoleValue_Register1)
	if ORegist == 0 then
		CallPlot(actor1,"LuaQ_424822_QuestdDrama",OID,TID,actor1)
	else
		LoadQuestOption(OID)
	end
end
	
function LuaQ_424822_QuestdDrama(OID,TID,actor1)
	WriteRoleValue(OID,EM_RoleValue_Register1,9)
	CloseSpeak(TID)
	sleep(10)
	CastSpell(actor1,TID,498911)
	sleep(30)
	CancelBuff(TID,621702)
	WriteRoleValue(OID, EM_RoleValue_Register1, 0) 
	CancelBuff(TID,621733)
	sleep(10)
	DelObj(actor1)
end

function LuaQ_424822_Stone()
	local OID = OwnerID()
	AddBuff(OID,621734,0,-1)
end

-------------------------------------------------------------------------
function LuaPE_9_1_DW49() --任務對話劇情
-------------------------------------------------------------------------
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),422951)	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_PE_9_1_41]","LuaPE_9_1_DW50", 0 )
	end
end
-------------------------------------------------------------------------
function LuaPE_9_1_DW50() 
-------------------------------------------------------------------------
	SetSpeakDetail( OwnerID(),"[SC_PE_9_1_42]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_PE_9_1_43]","LuaPE_9_1_DW51", 0 )
end
-------------------------------------------------------------------------
function LuaPE_9_1_DW51() 
-------------------------------------------------------------------------
	CloseSpeak(OwnerID())
	SetFlag(OwnerID(),543563,1)
end


-------------------------------------------------------------------------
function LuaPE_9_1_DW52() 
-------------------------------------------------------------------------
	CloseSpeak(OwnerID())
	GiveBodyItem(OwnerID(),206555,1)
end


-------------------------------------------------------------------------
function LuaPE_9_1_DW53() --物品的檢查劇情
-------------------------------------------------------------------------
	if	DW_CheckMap(OwnerID(),731)	then
		return true
	end
	local NPC = SearchRangeNPC( OwnerID() , 100 )
	for i=0,table.getn(NPC),1 do
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==113473	then
			return true
		end
	end
	ScriptMessage( OwnerID(), OwnerID(),1, "[SC_CANTHOME]", 0 )
	return false
end

-------------------------------------------------------------------------
function LuaPE_9_1_DW54() --物品的使用劇情
-------------------------------------------------------------------------
	if	DW_CheckMap(OwnerID(),731)	then
		ChangeZone(OwnerID(),9,-1,-11940,181,28520,313)
	else
		ChangeZone(OwnerID(),9,-1,-9111,513,32124,44)
	end
end


-------------------------------------------------------------------------
function LuaPE_9_1_DW55() --三級包
-------------------------------------------------------------------------
	local Result = DW_Rand(100)
	local RandItem = {200271,200272,200113,200114,200143,200144}

	if	DW_CheckBackpage(OwnerID(),6)	then
--符文
		GiveBodyItem(OwnerID(),206250,1)
		GiveBodyItem(OwnerID(),204889,10)
		GiveBodyItem(OwnerID(),204890,10)
		GiveBodyItem(OwnerID(),200229,10)
		GiveBodyItem(OwnerID(),200270,10)
--溶解石
		GiveBodyItem(OwnerID(),206249,1)
		UseItemDestroy()
	else
		ScriptMessage( OwnerID() , OwnerID(), 0, GetString("MSG_SONGSONGBAGWARN"), 0 )
	end
end


-------------------------------------------------------------------------
function LuaPE_9_1_DW56() --二級包
-------------------------------------------------------------------------
	local Result = DW_Rand(100)
	local RandItem = {200271,200272,200113,200114,200143,200144}

	if	DW_CheckBackpage(OwnerID(),5)	then
--符文
		GiveBodyItem(OwnerID(),206250,1)
		GiveBodyItem(OwnerID(),200244,20)
		GiveBodyItem(OwnerID(),200307,20)
		GiveBodyItem(OwnerID(),200346,20)
--溶解石
		GiveBodyItem(OwnerID(),206249,1)
		UseItemDestroy()
	else
		ScriptMessage( OwnerID() , OwnerID(), 0, GetString("MSG_SONGSONGBAGWARN"), 0 )
	end

end



-------------------------------------------------------------------------
function LuaPE_9_1_DW57() --一級包
-------------------------------------------------------------------------
	local Result = DW_Rand(100)
	local RandItem = {200271,200272,200113,200114,200143,200144}


	if	DW_CheckBackpage(OwnerID(),6)	then
--符文
		GiveBodyItem(OwnerID(),206250,1)
		for i=DW_Rand(2),table.getn(RandItem),2 do
			GiveBodyItem(OwnerID(),RandItem[i],5)
		end
--溶解石
		GiveBodyItem(OwnerID(),206249,1)
		UseItemDestroy()
	else
		ScriptMessage( OwnerID() , OwnerID(), 0, GetString("MSG_SONGSONGBAGWARN"), 0 )
	end

end


-------------------------------------------------------------------------
function LuaPE_9_1_DW58()
-------------------------------------------------------------------------
--中斷所有攻擊
	SetFightMode(OwnerID(),0,1,0,0 )
	Lua_CancelAllBuff(OwnerID())
	SetStopAttack(OwnerID())
	AddBuff(OwnerID(),502921,1,-1)
	AddBuff(OwnerID(),502707,1,-1)
	BeginPlot(OwnerID(),"LuaPE_9_1_DW59",0)
	return false
end

-------------------------------------------------------------------------
function LuaPE_9_1_DW59()
-------------------------------------------------------------------------
--赤蛇登場
--所有人陷入沉睡
	local RedSnake = Lua_CreateObjByDir( OwnerID() , 102526 , 25 , 0) 
	AddToPartition(RedSnake,0)
	SetPlot(RedSnake,"range","LuaPE_9_1_DW60",400)
	SetFightMode(RedSnake,0,1,0,0 )
	AddBuff(RedSnake,502921,1,-1)
	AddBuff(RedSnake,502707,1,-1)

	local NPC = SearchRangeNPC(OwnerID() , 400 )
	local Deader = {102514,102529,102530,102531,102748,102870,102848,102908,102926,102927}
	for i=0,table.getn(NPC),1 do
		for k=1,table.getn(Deader),1 do
			if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==Deader[k]	then
				KillID(RedSnake,NPC[i])
				break
			end
		end
	end
	sleep(20)
--翼蛇說話
	Yell(OwnerID(),"[SC_PE_9_1_46]",4)
	sleep(15)
	PlayMotion(RedSnake,ruFUSION_ACTORSTATE_ATTACK_1H)
	sleep(15)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_DYING)
	sleep(15)
--赤蛇說話
	Yell(RedSnake,"[SC_PE_9_1_47]",4)
	sleep(30)
	PlayMotion(RedSnake,ruFUSION_ACTORSTATE_BUFF_INSTANT)
	sleep(5)
	DelObj(RedSnake)
	DelObj(OwnerID())
end

-------------------------------------------------------------------------
function LuaPE_9_1_DW60()
-------------------------------------------------------------------------
	ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_PE_9_1_48]", C_Red )
	AddBuff(OwnerID(),505484,1,13)
end
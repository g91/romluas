--672
----------------------------------------------
function LuaS_422847_0()--點擊物件前執行
----------------------------------------------
--判斷戰鬥狀態
	if	ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==1	then
		return	-1
	end
--判斷buff狀態
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==114005		then
		if	CheckBuff(OwnerID(),505495)	then
			return	-1
		end
	else
		if	CheckBuff(OwnerID(),505495)==false	then
			return	-1
		end
	end
--判斷是否和薩滿說過話
	if	Checkflag(OwnerID(),543530)==false	then
		return	-1
	end
	return 1
end


----------------------------------------------
function LuaS_422847_1()--點擊物件後執行
----------------------------------------------
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==114005	then
--給予BUFF
		AddBuff(OwnerID(),505495,1,-1)
		AddBuff(OwnerID(),505497,1,-1)
		for i=1,10,1 do
			AddBuff(OwnerID(),505533,1,-1)
		end
		return	1
	end
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==114006	then
--給予BUFF
		AddBuff(OwnerID(),505496,1,-1)
		return	1
	end
end


----------------------------------------------
function LuaS_422847_2()--交待任務的對話劇情
----------------------------------------------
	SetSpeakDetail( OwnerID(),"[SC_422847_12]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_422847_22]","LuaS_422847_32", 0 )
end



----------------------------------------------
function LuaS_422847_3()--buff持續檢查位置
----------------------------------------------
	local MapID = 672 
	if	DW_CheckMap(OwnerID(),MapID)	and
		CheckBuff(OwnerID(),505533)		then
		if	CheckBuff(OwnerID(),505519)==false	then
			AddBuff(OwnerID(),505497,1,-1)
		end
		return true
	else
		BeginPlot(OwnerID(),"LuaS_422847_30",0)
		CancelBuff(OwnerID(),505495)
	end
end


----------------------------------------------
function LuaS_422847_4()--怪物的佯攻AI
----------------------------------------------
	SetPlot(OwnerID(),"range","LuaS_422847_5",100)
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,1)
	WriteRoleValue(OwnerID(),EM_RoleValue_IsWalk,0)
	AddBuff(OwnerID(),505520,1,-1)
--上壞的幻術buff
	AddBuff(OwnerID(),505575,1,-1)
end


----------------------------------------------
function LuaS_422847_5()--判斷玩家是否失去資格
----------------------------------------------
DeBugMSG(0,0,"Start to Check")
--先關閉再開啟
	SetPlot(TargetID(),"range","",0)
--雙重記號
	WriteRoleValue(TargetID(),EM_RoleValue_PID,0)
--身上有buff的玩家才會引起反應
	if	CheckBuff(OwnerID(),505495)	then
DeBugMSG(0,0,"Ex-Combat Check = true")
		BeginPlot(TargetID(),"LuaS_422847_6",0)
	else
DeBugMSG(0,0,"Ex-Combat Check = false")
		WriteRoleValue(TargetID(),EM_RoleValue_PID,1)
		SetPlot(TargetID(),"range","LuaS_422847_5",100)
	end
end


----------------------------------------------
function LuaS_422847_6()--
----------------------------------------------
	local AttackTarget = TargetID()
	local MapID = 672
--設定自己處在『假戰鬥』中的狀態(BUFF取消)
	CancelBuff(OwnerID(),505520)
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_COMBAT_1H)
--為避免走位錯誤先關閉巡邏劇情
	MoveToFlagEnabled(OwnerID(), false)
--記錄初始位置
	local InitialX = ReadRoleValue(OwnerID(),EM_RoleValue_X)
	local InitialZ = ReadRoleValue(OwnerID(),EM_RoleValue_Z)
	local X,Z
--持續判斷
	while	true	do
		sleep(7)
-----------------------------------------------------------------------------------回頭區
		X = ReadRoleValue(OwnerID(),EM_RoleValue_X)
		Z = ReadRoleValue(OwnerID(),EM_RoleValue_Z)
		if	(X-InitialX)^2+(Z-InitialZ)^2 >=250^2		then
--雙重記號
			WriteRoleValue(OwnerID(),EM_RoleValue_PID,1)
			BeginPlot(OwnerID(),"LuaS_422847_8",0)
DeBugMSG(0,0,"so far")
			return
		end
-----------------------------------------------------------------------------------判斷區
--先確定對象仍在世界上若不在的話要取消
		if	CheckID(AttackTarget)==false	then
--搜尋玩家NPC
			local NPC = SearchRangeNPC ( OwnerID() , 150 )
			local Player = SearchRangePlayer ( OwnerID() , 150 )
			local Findone = false
--找身上有戰鬥BUFF的玩家
			for i=0,table.getn(Player),1 do
				if	CheckBuff(Player[i],505497)	then
					AttackTarget = Player[i]
					AddBuff( OwnerID() ,  502383 , 0 , 1 )
DeBugMSG(0,0,"Findone = true")
					Findone = true
					break
				end
			end
--如果沒找到
			if	Findone == false	then
DeBugMSG(0,0,"Findone = false")
--找身上有戰鬥BUFF的NPC
				for i=0,table.getn(NPC),1 do
					if	CheckBuff(NPC[i],505497)	then
						AttackTarget = NPC[i]
						AddBuff( OwnerID() ,  502383 , 0 , 1 )
						break
					end
					if	i==table.getn(NPC)	then
						if	CheckID(TargetID())	then
DeBugMSG(0,0,"Condition0")
							LuaS_422847_7(OwnerID())
							return	true
						end
					end
				end
			end
			if	CheckID(AttackTarget)==false	then
DeBugMSG(0,0,"Condition1")
				LuaS_422847_7(OwnerID())
				return	true
			end
		end
--再確定對方的位置若不在土波多村要取消
		if	DW_CheckMap(AttackTarget,MapID)==false	then
DeBugMSG(0,0,"Condition2")
			LuaS_422847_7(OwnerID())
			return	true
		end
--是玩家才需要做的判斷
		if	ReadRoleValue(AttackTarget,EM_RoleValue_IsPlayer)==1	then
--若對方在劇情狀態則取消
			if	CheckBuff(AttackTarget,505522)	then
DeBugMSG(0,0,"Condition3")
				LuaS_422847_7(OwnerID())
				return	true
			end
--若對方已不在任務狀態中 則取消
			if	CheckBuff(AttackTarget,505495)==false	then
DeBugMSG(0,0,"Condition4")
				LuaS_422847_7(OwnerID())
				return	true
			end
		end
--確定對方的buff狀態 若無buff檢查附近是否有詐敵 都沒有的話就取消
		if	CheckBuff(AttackTarget,505497)==false	then
			local NPC = SearchRangeNPC ( OwnerID() , 150 )
			local Player = SearchRangePlayer ( OwnerID() , 150 )
				local Findone = false
				for i=0,table.getn(Player),1 do
					if	CheckBuff(Player[i],505497)	then
						AttackTarget = Player[i]
						AddBuff( OwnerID() ,  502383 , 0 , 1 )
DeBugMSG(0,0,"Findone = true")
						Findone = true
						break
					end
				end
				if	Findone == false	then
DeBugMSG(0,0,"Findone = false")
					for i=0,table.getn(NPC),1 do
						if	CheckBuff(NPC[i],505497)	then
							AttackTarget = NPC[i]
							AddBuff( OwnerID() ,  502383 , 0 , 1 )
							break
						end
						if	i==table.getn(NPC)	then
DeBugMSG(0,0,"Condition5")
							LuaS_422847_7(OwnerID())
							return	true
						end
					end
				end
			if	AttackTarget ==TargetID()	then
DeBugMSG(0,0,"Condition6")
				LuaS_422847_7(OwnerID())
				return	true
			end
		end
--如果對方死亡就取消
		if	ReadRoleValue(AttackTarget,EM_RoleValue_IsDead)==1	then
DeBugMSG(0,0,"Condition7")
			LuaS_422847_7(OwnerID())
			return	true
		end
--如果瞬間距離過大就取消
		if	CheckDistance(OwnerID(),AttackTarget, 400)==false		then
DeBugMSG(0,0,"Condition8")
			LuaS_422847_7(OwnerID())
			return	true
		end
-----------------------------------------------------------------------------------移動區
		if	CheckDistance(OwnerID(),AttackTarget, 150)==false		then
			DW_GetClose(OwnerID(),AttackTarget,150)
-----------------------------------------------------------------------------------回頭區
			X = ReadRoleValue(OwnerID(),EM_RoleValue_X)
			Z = ReadRoleValue(OwnerID(),EM_RoleValue_Z)
			if	(X-InitialX)^2+(Z-InitialZ)^2 >=250^2		then
--雙重記號
				WriteRoleValue(OwnerID(),EM_RoleValue_PID,1)
				BeginPlot(OwnerID(),"LuaS_422847_8",0)
DeBugMSG(0,0,"so far 2")
				return
			end
-----------------------------------------------------------------------------------判斷區(再次判斷避免斷掉)
--先確定對象仍在世界上若不在的話要取消
			if	CheckID(AttackTarget)==false	then
				local NPC = SearchRangeNPC ( OwnerID() , 150 )
				local Player = SearchRangePlayer ( OwnerID() , 150 )
				local Findone = false
				for i=0,table.getn(Player),1 do
					if	CheckBuff(Player[i],505497)	then
						AttackTarget = Player[i]
						AddBuff( OwnerID() ,  502383 , 0 , 1 )
DeBugMSG(0,0,"Findone = true")
						Findone = true
						break
					end
				end
				if	Findone == false	then
DeBugMSG(0,0,"Findone = false")
					for i=0,table.getn(NPC),1 do
						if	CheckBuff(NPC[i],505497)	then
							AttackTarget = NPC[i]
							AddBuff( OwnerID() ,  502383 , 0 , 1 )
							break
						end
						if	i==table.getn(NPC)	then
							LuaS_422847_7(OwnerID())
							return	true
						end
					end
				end
				if	AttackTarget ==TargetID()	then
DeBugMSG(0,0,"Condition9")
					LuaS_422847_7(OwnerID())
					return	true
				end
			end
--再確定對方的位置若不在土波多村要取消
			if	DW_CheckMap(AttackTarget,MapID)==false	then
DeBugMSG(0,0,"Condition10")
				LuaS_422847_7(OwnerID())
				return	true
			end
--是玩家才需要做的判斷
			if	ReadRoleValue(AttackTarget,EM_RoleValue_IsPlayer)==1	then
--若對方在劇情狀態則取消
				if	CheckBuff(AttackTarget,505522)	then
DeBugMSG(0,0,"Condition11")
					LuaS_422847_7(OwnerID())
					return	true
				end
--若對方已不在任務狀態中 則取消
				if	CheckBuff(AttackTarget,505495)==false	then
DeBugMSG(0,0,"Condition12")
					LuaS_422847_7(OwnerID())
					return	true
				end
			end
--確定對方的buff狀態 若無buff檢查附近是否有詐敵 都沒有的話就取消
			if	CheckBuff(AttackTarget,505497)==false		then
				local NPC = SearchRangeNPC ( OwnerID() , 150 )
				local Player = SearchRangePlayer ( OwnerID() , 150 )
				local Findone = false
				for i=0,table.getn(Player),1 do
					if	CheckBuff(Player[i],505497)	then
						AttackTarget = Player[i]
						AddBuff( OwnerID() ,  502383 , 0 , 1 )
DeBugMSG(0,0,"Findone = true")
						Findone = true
						break
					end
				end
				if	Findone == false	then
DeBugMSG(0,0,"Findone = false")
					for i=0,table.getn(NPC),1 do
						if	CheckBuff(NPC[i],505497)	then
							AttackTarget = NPC[i]
							AddBuff( OwnerID() ,  502383 , 0 , 1 )
							break
						end
						if	i==table.getn(NPC)	then
DeBugMSG(0,0,"Condition13")
							LuaS_422847_7(OwnerID())
							return	true
						end
					end
				end
DeBugMSG(0,0,"Condition14")
				LuaS_422847_7(OwnerID())
				return	true
			end
--如果對方死亡就取消
			if	ReadRoleValue(AttackTarget,EM_RoleValue_IsDead)==1	then
DeBugMSG(0,0,"Condition15")
				LuaS_422847_7(OwnerID())
				return	true
			end
--如果瞬間距離過大就取消
			if	CheckDistance(OwnerID(),AttackTarget, 400)==false		then
DeBugMSG(0,0,"Condition16")
				LuaS_422847_7(OwnerID())
				return	true
			end
		end
-----------------------------------------------------------------------------------攻擊區
		CastSpell(OwnerID(),AttackTarget,494806)
	end
end

----------------------------------------------
function LuaS_422847_7(obj) --重置索敵的劇情
----------------------------------------------
DeBugMSG(0,0,"LuaS_422847_7 RUN")
	if	ReadRoleValue(obj,EM_RoleValue_SpellMagicID )~=0	then
		AddBuff( obj ,  502383 , 0 , 1 )
	end
--覆寫雙重記號
	WriteRoleValue(obj,EM_RoleValue_PID,1)
--改回未進入「假戰鬥」的狀態(掛上buff)
	AddBuff(obj,505520,1,-1)
	SetDefIdleMotion(obj,ruFUSION_MIME_IDLE_STAND)
	MoveToFlagEnabled(obj, true)
	BeginPlot(obj,"LuaS_422847_4",20)
end



----------------------------------------------
function LuaS_422847_8() --跑回原位的劇情
----------------------------------------------
	MoveToFlagEnabled(OwnerID(), true)
	LuaS_422847_7(OwnerID())
end


----------------------------------------------
function LuaS_422847_9()	--技能1：遁地檢查
---------------------------------------------
	if	CheckBuff(OwnerID(),505522)	then
DeBugMSG(0,0,"false1")
		return false
	end
	local MapID = 672
	if	DW_CheckMap(OwnerID(),MapID)==false	then
DeBugMSG(0,0,"false2")
		return	false
	end
	AddBuff(OwnerID(),503977,1,2)
	return	true
end

----------------------------------------------
function LuaS_422847_10()	--技能1：遁地執行
---------------------------------------------
--取消判斷buff
	CancelBuff(OwnerID(),505497)
--建出誘敵土堆
--只存在6秒
--附上會轉移npc目標的buff
	local Item = Lua_DW_CreateObj("obj",114297,OwnerID())
	WriteRoleValue(Item,EM_RoleValue_LiveTime,6)
	AddBuff(Item,505497,1,-1)
--改變buff狀態
--附上變身術
	CancelBuff(OwnerID(),505497)
	AddBuff(OwnerID(),505519,1,6)
end


----------------------------------------------
function LuaS_422847_11()	--buff消失的表演和效果
----------------------------------------------
--buff消失的時候：
--重上引敵buff
	AddBuff(OwnerID(),505497,1,-1)
--更新範圍內的npc索敵
--確定是怪物的才有效
	local NPC = SearchRangeNPC ( OwnerID() , 100 )
	for i=0,table.getn(NPC),1 do
		if	CheckBuff(NPC[i],505520)	then
			if	ReadRoleValue(NPC[i],EM_RoleValue_PID)==1	then
				AddBuff(GID,BUFFID,BUFFLV,BUFFTIME)
				SetPlot(NPC[i],"range","LuaS_422847_5",100)
			end
		end
	end
--跳出動作
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_BUFF_INSTANT)
--跳出特效
	local Item = Lua_DW_CreateObj("obj",114297,OwnerID())
	WriteRoleValue(Item,EM_RoleValue_LiveTime,2)
end



----------------------------------------------
function LuaS_422847_12() --第一段的表演
----------------------------------------------
--建立要圍攻的怪物
	local Mobs = {}
	for i=1,3,1 do
		for k=1,5,1 do
			Mobs[5*(i-1)+K] = Lua_DW_CreateObj("flag",113972+K,780502,5*(i-1)+K)
		end
	end
	sleep(30)
--台詞1
	Yell(Mobs[1],"[SC_422847_14]",3)
--安特克羅出現
	local Anticlo = Lua_DW_CreateObj("flag",113950,780503,0)
--建出隱形球
	local HideBall = {}
	for i=1,3,1 do
		HideBall[i] = Lua_DW_CreateObj("flag",112399,780503,i*3)
	end
	local ShowWar = {}
	for	i=1,6,1	do
		for k=1,2,1 do
			ShowWar[2*(i-1)+K] = Lua_DW_CreateObj("flag",113968+K,780503,2*(i-1)+K,0)
			CallPlot(ShowWar[2*(i-1)+K],"",2*(i-1)+K)
			SetDefIdleMotion(ShowWar[2*(i-1)+K],ruFUSION_MIME_IDLE_COMBAT_1H)
		end
	end
	sleep(20)
--台詞2&換角度
	AdjustFaceDir(Mobs[2],Anticlo,0)
	sleep(10)
	Yell(Mobs[2],"[SC_422847_15]",3)
	sleep(5)
--全部的人換角度 同時進入戰鬥狀態
	for i=1,table.getn(Mobs),1 do
		AdjustFaceDir(Mobs[i],Anticlo,0)
		SetDefIdleMotion(Mobs[i],ruFUSION_MIME_IDLE_COMBAT_1H)
	end
	sleep(10)
--台詞3
--安特克羅台詞
	Yell(Anticlo,"[SC_422847_0]",3)
	sleep(5)
--建出戰士們
	for i = 1,table.getn(ShowWar),1 do
		AddToPartition(ShowWar[i],0)
	end
--射箭特效
	for i=1,table.getn(HideBall),1 do
		CastSpellLV(HideBall[i],Mobs[i*5],494838,200)
	end
	sleep(30)
--卡薩姆
	ScriptMessage( OwnerID(), 0, 1, "[SC_422847_3]", "0xFFBE60D2" )
	sleep(20)
--安德薩斯
	ScriptMessage( OwnerID(), 0, 2, "[SC_422847_2]", "0xFFBE60D2" )
	sleep(15)
	Yell(Anticlo,"[SC_422847_1]",3)
--範圍劇情>>劇情保護模式
	SetPlot(OwnerID(),"range","",0)
	sleep(30)
--給予玩家完成旗標
	local Player = SearchRangePlayer ( OwnerID() , 300 )
	for i=0,table.getn(Player),1 do
		if	CheckBuff(Player[i],505495)	then
			SetFlag(Player[i],543570,1)
			CancelBuff(Player[i],505522)
		end
	end
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
	sleep(10)
	DelObj(Anticlo)
	for i=1,table.getn(ShowWar),1 do
		DelObj(ShowWar[i])
	end
	for i=1,table.getn(HideBall),1 do
		DelObj(HideBall[i])
	end
	for i=1,table.getn(Mobs),1 do
		DelObj(Mobs[i])
	end
end



----------------------------------------------------
function LuaS_422847_13(flag) -- 戰士移動劇情
----------------------------------------------------
	DW_MoveToFlag( OwnerID() , 780403 , flag,20 , 1  )
end




----------------------------------------------------
function LuaS_422847_14() -- 第二段的表演
----------------------------------------------------
--人類戰士
	local Mans = {}
	for i=1,5,1 do
		Mans[i] = Lua_DW_CreateObj("flag",113987,780402,i)
	end
--人類法師
	local Magic = Lua_DW_CreateObj("flag",113982,780402,6)
--怪物
	local Mobs = {0,0,0,0,0}
	for i=1,5,1 do
		Mobs[i] = Lua_DW_CreateObj("flag",113978,780403,i)
	end
	sleep(30)
--攻擊
	for i=1,table.getn(Mobs),1 do
		CallPlot(Mobs[i],"LuaS_422847_15",Mans[i])
	end
	for i=1,table.getn(Mans),1 do
		CallPlot(Mans[i],"LuaS_422847_15",Mobs[i])
	end
--法師攻擊
	CallPlot(Magic,"LuaS_422847_16",Mobs[1])
	sleep(30)
--安德薩斯出場
	local Asace = Lua_DW_CreateObj("flag",113951,780404,1)
	Yell(Asace,"[SC_422847_18]",3)
	CallPlot(Asace,"LuaS_422847_17",Mobs[2])
--判斷所有的敵人死亡
	local Pass = true
	local TrueSec = 0
	while Pass do
		sleep(10)
		TrueSec = TrueSec +1
		for i=1,table.getn(Mobs),1 do
			if	CheckID(Mobs[i])==true	then
				if	ReadRoleValue(Mobs[i],EM_RoleValue_IsDead)==0	then
					break
				end
			end
			if	i==table.getn(Mobs)	then
				Pass = false
			end
		end
		if	TrueSec > 12	then
			Pass = false
		end
	end
--法師發作
	Yell(Magic,"[SC_422847_16]",3)
	CancelBuff(Magic,505574)
	AddBuff(Magic,505575,1,-1)
	AdjustFaceDir(Asace,Magic,0)
	sleep(15)
	Yell(Asace,"[SC_422847_19]",3)
	CastSpellLV(Magic,Asace,494810,200)
	sleep(10)
	for i=1,table.getn(Mans),1 do
		WriteRoleValue(Mans[i],EM_RoleValue_HP,0)
		PlayMotion(Mans[i],ruFUSION_ACTORSTATE_DYING)
	end
--安德薩斯衝鋒
	CastSpellLV(Asace,Magic,494831,200)
	sleep(15)
	Yell(Asace,"[SC_422847_5]",3)
	sleep(15)
--緹亞娜現身
	local Tina = Lua_DW_CreateObj("flag",113952,780404,1)
	sleep(10)
	AdjustFaceDir(Asace,Tina,0)
	Yell(Tina,"[SC_422847_6]",3)
	sleep(15)
--再衝鋒
	CastSpellLV(Asace,Tina,494831,200)
	sleep(10)
	PlayMotion(Asace,ruFUSION_ACTORSTATE_ATTACK_1H)
	DelObj(Tina)
	sleep(5)
	Tina = Lua_DW_CreateObj("flag",113952,780404,2)
	sleep(5)
	AdjustFaceDir(Asace,Tina,0)
	Yell(Asace,"[SC_422847_7]",3)
	sleep(20)
	Yell(Tina,"[SC_422847_8]",3)
	sleep(5)
	CastSpell(Tina,Tina,494832)
	sleep(15)
	Yell(Asace,"[SC_422847_9]",3)
	sleep(5)
	CallPlot(Asace,"LuaS_422847_13",1)
	sleep(30)
	DelObj(Asace)
--範圍劇情>>劇情保護模式取消
	SetPlot(OwnerID(),"range","",0)
	sleep(5)
	ScriptMessage( OwnerID(), 0, 2, "[SC_422847_10]", C_Red )
--給予玩家完成旗標
	local Player = SearchRangePlayer(OwnerID() , 300 )
	for i=0,table.getn(Player),1 do
		if	CheckBuff(Player[i],505495)	then
			SetFlag(Player[i],543571,1)
			CancelBuff(Player[i],505522)
		end
	end
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
	for i=1,table.getn(Mans),1 do
		DelObj(Mans[i])
	end
	DelObj(Magic)
	for i=1,table.getn(Mobs),1 do
		DelObj(Mobs[i])
	end
end

----------------------------------------------------
function LuaS_422847_15(obj)--攻擊用程式
----------------------------------------------------
	while	true	do
		sleep(10)
--確定目標存在
		if	CheckID(obj)==false	then
			return
		end
		if	ReadRoleValue(obj,EM_RoleValue_IsDead)==1	then
			return
		end
		if	CheckDistance(OwnerID(),obj, 50)==false		then
			DW_GetClose(OwnerID(),obj,50)
		end
		if	CheckID(obj)==false	then
			return
		end
		if	ReadRoleValue(obj,EM_RoleValue_IsDead)==1	then
			return
		end
		if	CheckDistance(OwnerID(),obj, 55)	then
			CastSpellLV(OwnerID(),obj,494807,6)
		end
	end
end
----------------------------------------------------
function LuaS_422847_16(obj)--法術攻擊用程式
----------------------------------------------------
	while	true	do
		sleep(10)
--確定目標存在
		if	CheckID(obj)==false	then
			return
		end
		if	ReadRoleValue(obj,EM_RoleValue_IsDead)==1	then
			return
		end
		if	CheckDistance(OwnerID(),obj, 100)==false		then
			DW_GetClose(OwnerID(),obj,100)
		end
		if	CheckID(obj)==false	then
			return
		end
		if	ReadRoleValue(obj,EM_RoleValue_IsDead)==1	then
			return
		end
		if	CheckDistance(OwnerID(),obj, 150)	then
			CastSpellLV(OwnerID(),obj,494808,10)
		end
	end
end

----------------------------------------------------
function LuaS_422847_17(obj)--安德薩斯攻擊用程式
----------------------------------------------------
	while	true	do
		sleep(10)
--確定目標存在
		if	CheckID(obj)==false	then
			return
		end
		if	ReadRoleValue(obj,EM_RoleValue_IsDead)==1	then
			return
		end
		if	CheckDistance(OwnerID(),obj, 50)==false		then
			DW_GetClose(OwnerID(),obj,50)
		end
		if	CheckID(obj)==false	then
			return
		end
		if	ReadRoleValue(obj,EM_RoleValue_IsDead)==1	then
			return
		end
		if	CheckDistance(OwnerID(),obj, 55)	then
			CastSpellLV(OwnerID(),obj,494809,200)
		end
	end
end


----------------------------------------------------
function LuaS_422847_18(Num)--安德薩斯技能的檢查劇情
----------------------------------------------------
--針對法師使用的  只對法師有用
	if	Num == 1	then
		if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==113982		then
			return	true
		else
			return	false
		end
	end
--針對緹亞娜使用的  只對緹亞娜有用
	if	Num == 2	then
		if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==113952		then
			return	true
		else
			return	false
		end
	end
--針對「鳥人」範圍掃蕩的技能
	if	Num == 3	then
		if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==113978		then
			return	true
		else
			return	false
		end
	end
--針對「人類戰士」範圍掃蕩的技能
	if	Num == 4	then
		if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==113987		then
			return	true
		else
			return	false
		end
	end
	return false
end


----------------------------------------------------
function LuaS_422847_19() --呼救法術的檢查
----------------------------------------------------
	if	CheckBuff(OwnerID(),505522)	then
		return false
	end
	local Temp
--檢查位置和距離
	local NPC = SearchRangeNPC ( OwnerID() , 110 )
	for i=0,table.getn(NPC),1 do
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==113981	or
			ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==113983	then
			Temp = i
		end
	end
	if	ReadRoleValue(NPC[Temp],EM_RoleValue_PID)~=0	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422847_21]", 0 )
		return false
	end
	if	CheckDistance(OwnerID(),NPC[Temp], 100)==false		then
--提示距離太遠
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422847_20]", 0 )
		return false
	end
--訊息提醒
	return true
end


----------------------------------------------------
function LuaS_422847_20()--法術的執行
----------------------------------------------------
	local NPC = SearchRangeNPC ( OwnerID() , 100 )
--讓他們執行
	for i=0,table.getn(NPC),1 do
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==113983		then
--執行完畢需要跳出
			BeginPlot(NPC[i],"LuaS_422847_21",0)
			return
		end
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==113981		then
--執行完畢需要跳出
			BeginPlot(NPC[i],"LuaS_422847_21",0)
			return
		end
	end
end


----------------------------------------------------
function LuaS_422847_21()--呼喚地母的劇情
----------------------------------------------------
	local CastBarResult
--將玩家的ID寫入
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,TargetID())
--讀秒條
	if BeginCastBar( TargetID(), "[SC_422847_17]" , 100 , ruFUSION_ACTORSTATE_CAST_BEGIN , ruFUSION_ACTORSTATE_CAST_END , 0 ) ~= 1 then
		ScriptMessage ( TargetID() , TargetID() , 1 , "[SAY_NPC_BUSY]" , 0 )
		return
	end
--持續檢查
	SetDefIdleMotion(TargetID(),ruFUSION_MIME_CAST_LOOP)
	while	true	do
		sleep(2)
--確保目標仍在
--若不在 重置變數
		if	CheckID(TargetID())==false	then
			WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
			return
		end
		CastBarResult = CheckCastBar(TargetID())
		if	CastBarResult ~=0	then
			if	CastBarResult >0	then
--成功
				EndCastBar( TargetID(), CastBarResult )
				SetDefIdleMotion(TargetID(),ruFUSION_MIME_IDLE_STAND)
--從編號判斷要表演的片段
				if	ReadRoleValue(OwnerID(),EM_RoleValue_OrgID)==113981		then
					BeginPlot(OwnerID(),"LuaS_422847_12",0)
				else
					BeginPlot(OwnerID(),"LuaS_422847_14",0)
				end
--範圍內的玩家進入劇情保護模式
				local Player = SearchRangePlayer ( OwnerID() , 100 )
				for i=0,table.getn(Player),1 do
DeBugMSG(0,0,"search 1")
					if	CheckBuff(Player[i],505495)	then
DeBugMSG(0,0,Player[i])
						BeginPlot(Player[i],"LuaS_422847_22",0)
					end
				end
--範圍劇情>>劇情保護模式
				SetPlot(OwnerID(),"range","LuaS_422847_22",100)
				return
			else
--被中斷
				SetDefIdleMotion(TargetID(),ruFUSION_MIME_IDLE_STAND)
				EndCastBar( TargetID(), CastBarResult )
				WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
				return
			end
		end
	end
end

------------------------------------------
function LuaS_422847_22() --啟動劇情保護
------------------------------------------
DeBugMSG(0,0,"range plot is begin")
--只對已變成波多的玩家起作用
	if	CheckBuff(OwnerID(),505495)	then
DeBugMSG(0,0,"check pass")
		if	CheckBuff(OwnerID(),505522)==false	then
			AddBuff(OwnerID(),505522,1,30)
			SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_STAND_02)
			sleep(20)
--附上石頭102065
			local Rock = Lua_DW_CreateObj("obj",114303,OwnerID(),0)
			SetModeEx(Rock ,EM_SetModeType_Strikback,false)
			SetModeEx(Rock,EM_SetModeType_Move,false)
			AddToPartition(Rock ,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --載入同層
			BeginPlot(Rock,"LuaS_422847_23",0)
			PlayMotion(Rock ,ruFUSION_ACTORSTATE_SPAWN_BEGIN)
		end
	end
end
------------------------------------------
function LuaS_422847_23() --石頭的自毀劇情
------------------------------------------
DeBugMSG(0,0,"rock start to check")
--玩家離線
	while	CheckID(TargetID())	do
		sleep(10)
--劇情表演結束
		if	CheckBuff(TargetID(),505522)==false	then
			SetDefIdleMotion(TargetID(),ruFUSION_MIME_IDLE_STAND)
DeBugMSG(0,0,"Del 1")
			DelObj(OwnerID())
			break
		end
	end
DeBugMSG(0,0,"Del 2")
	DelObj(OwnerID())
end
------------------------------------------
function LuaS_422847_24()--砍在緹亞娜身上  用來表演的
------------------------------------------
--刪除緹亞娜
	DelObj(TargetID())
	return true
end
------------------------------------------
function LuaS_422847_25()--精靈多重箭的判斷劇情
------------------------------------------
	for i=1,5,1 do
		if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==(113972+i)	then
			return true
		end
	end
	return false
end
-------------------------------------------------
function LuaS_422847_26()--刪除目標身上的buff數量
-------------------------------------------------
	Lua_SubtractBuff(TargetID(),505533,0,0)
end
-------------------------------------------------
function LuaS_422847_27()  --法術的判斷
-------------------------------------------------
	if	CheckBuff(TargetID(),505519)==false	then
		return true
	else
		return false
	end
end
-------------------------------------------------------------
function LuaS_422847_28() --好的幻象
-------------------------------------------------------------
	AddBuff(OwnerID(),505574,1,-1)
end
-------------------------------------------------------------
function LuaS_422847_29() --壞的幻象
-------------------------------------------------------------
	AddBuff(OwnerID(),505575,1,-1)
end
-------------------------------------------------------------
function LuaS_422847_30() --buff消失時應做的處置
-------------------------------------------------------------
	CancelBuff(OwnerID(),505496)
	Lua_SubtractBuff( OwnerID() , 505533 , 11 , 1 )
	CancelBuff_NoEvent(OwnerID(),505519)
	CancelBuff(OwnerID(),505497)
	CancelBuff(OwnerID(),505574)
end
-------------------------------------------------------------
function LuaS_422847_31() --幻象技能的檢查
-------------------------------------------------------------
	if	CheckBuff(OwnerID(),505522)	then
		return false
	else
		return true
	end
end
----------------------------------------------
function LuaS_422847_32()--交待任務的對話劇情
----------------------------------------------
	SetSpeakDetail( OwnerID(),"[SC_422847_23]")
	SetFlag(OwnerID(),543530,1)
end
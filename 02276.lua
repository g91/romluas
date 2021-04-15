-- G_FA_423800_Hun	記錄定點（["A"]）與走路（["B"]）的獵人的ID（Born劇情產生）跟狀態。
--			獵人["A"]：
--			-> G_FA_423800_Hun["A"][1] = 獵人A的ID
--			-> G_FA_423800_Hun["A"][2] = 獵人A的進度	0 = 初始狀態 1 = 已被觸發準備要走了 2 = 起身出發
--			-> G_FA_423800_Hun["A"][3] = 獵人A身旁有人否的記錄
--			獵人["B"]：
--			-> G_FA_423800_Hun["B"][1] = 獵人B的ID
--			-> G_FA_423800_Hun["B"][2] = 獵人B的進度	0 = 初始狀態 1 = 移動中 2 = 到了
--			-> G_FA_423800_Hun["B"][3] = 獵人B身旁有人否的記錄
-- G_FA_423800_Rec	記錄玩家資訊，從[1]開始依次記錄玩家ID
-- G_FA_423800_Rec2	記錄玩家資訊反向索引，如GUID＝123456的玩家，
--			-> G_FA_423800_Rec2[123456][1]＝123456在FA_423800_Rec的位置
--			-> G_FA_423800_Rec2[123456][2] = 該玩家的狀態，0= 沒完成或沒開始 1=任務完成，2=等車發動
			
function LuaFA_117506_01()
	local Owner = OwnerID()
	local Target = TargetID()
	local FlagOn
	if G_FA_423800_Rec2 == nil then G_FA_423800_Rec2 = {} end
	if G_FA_423800_Rec2[Owner] == nil then G_FA_423800_Rec2[Owner] = {} end
	if  CheckAcceptQuest(Owner,423800) == TRUE then
-- DebugMsg(0,0,"enter")
		if CheckFlag(Owner,544775) == FALSE then
-- DebugMsg(0,0,"enter_A1")
			FlagOn = 1
			-- DebugMsg(0,0,"In_FO1")
		elseif G_FA_423800_Rec2[Owner][2] == 2 then
-- DebugMsg(0,0,"enter_A2")
			ScriptMessage(Owner,Owner,0,"[SC_423800_HUNTERSAY][SC_423800_A02]","0xffffffff")
		else
-- DebugMsg(0,0,"enter_A3")
			FlagOn = 9
			-- DebugMsg(0,0,"In_FO9")
		end
-- DebugMsg(0,0,"enter_OutA")
-- DebugMsg(0,0,G_FA_423800_Rec2[Owner][2])
		if G_FA_423800_Rec2[Owner][2] == 0 or G_FA_423800_Rec2[Owner][2] == nil then
-- DebugMsg(0,0,"enter_B")
			-- DebugMsg(0,0,"In_2")
			FA_StopLoafing(Target,1,Owner)
			-- DebugMsg(0,0,"In_SL")
			if G_FA_423800_Hun["A"][2] == 1 then
-- DebugMsg(0,0,"enter_C1")
				-- DebugMsg(0,0,"In_3")
				ScriptMessage(Owner,Owner,0,"[SC_423800_HUNTERSAY][SC_423800_A0"..FlagOn.."]","0xffffffff")	-- 你也來試驗嗎
				Sleep(15)
				ScriptMessage(Owner,Owner,0,"[SC_423800_HUNTERSAY][SC_423800_A02]","0xffffffff")	-- 等一下吧
			elseif G_FA_423800_Hun["A"][2] == 0 then
-- DebugMsg(0,0,"enter_C2")
				-- DebugMsg(0,0,"In_4")
				Say(Target,"[SC_423800_A0"..FlagOn.."][SC_423800_A02]")	-- 你也來試驗嗎？等一下吧
--				FA_117506_Group = {OwnerID()}
			end
-- DebugMsg(0,0,"enter_OutC")
			LuaFA_423800_Set()
			-- DebugMsg(0,0,"set")
		end
-- DebugMsg(0,0,"enter_OutB")
	else
-- DebugMsg(0,0,"enter_Else")
		LuaFA_423800_Reset()
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_423800_HUNTERSAY][SC_423800_IGNORE]","0xffffffff")
	end
-- DebugMsg(0,0,"Out")
end

function LuaFA_423800_Set(B_Start)
	local Owner = OwnerID()
	if B_Start ~= 1 then
		if  G_FA_423800_Hun["A"][2] == 1 then
			table.insert(G_FA_423800_Rec,Owner)
			G_FA_423800_Rec2[Owner][1] = table.getn(G_FA_423800_Rec)
			G_FA_423800_Rec2[Owner][2] = 2
			SetFlag(Owner,544775,1)
		else
			G_FA_423800_Hun["A"][2] = 1
			G_FA_423800_Rec = {Owner}
			G_FA_423800_Rec2[Owner][1] = 1
			G_FA_423800_Rec2[Owner][2] = 2
			SetFlag(Owner,544775,1)
			BeginPlot(TargetID(),"LuaFA_423800_01",0)
		end
	else
		Show(G_FA_423800_Hun["B"][1],0)
		FA_SetPosByObj(G_FA_423800_Hun["B"][1],G_FA_423800_Hun["A"][1])
		Hide(G_FA_423800_Hun["A"][1])
		FA_MoveToPathGo(G_FA_423800_Hun["B"][1])
	end
end

function LuaFA_117578_Reborn()
	local Owner = OwnerID()
	DisableQuest( Owner , TRUE )
	G_FA_423800_Hun = {}
	G_FA_423800_Hun["A"] = {}
	G_FA_423800_Hun["B"] = {}
	G_FA_423800_Rec = {}
	G_FA_423800_Rec2 = {}
	G_FA_423800_Hun["B"][1] = Owner
	LuaFA_423800_Reset("B2")
--	AddBuff(OwnerID(),506956,1,-1)
	SetFightMode ( Owner,0, 1, 0,0 )
end

function LuaFA_117506_Reborn()
	local HunterA = OwnerID()
	local Rnd = RandRange(3,4)
	DisableQuest( HunterA , TRUE )
	WriteRoleValue( HunterA , EM_RoleValue_IsWalk , 0 )
	DW_MoveToFlag(HunterA,780880 , 2,20 ,1)
	DW_MoveToFlag(HunterA,780880 , Rnd,10 ,1)
	WriteRoleValue( HunterA , EM_RoleValue_IsWalk , 1 )
	G_FA_423800_Hun["A"][1] = HunterA
	LuaFA_423800_Reset("A2")
	LuaFA_423800_Reset("B")
	if Rnd == 3 then
		CallPlot(HunterA,"FA_Loafing",HunterA,10,50,780880,4,780880,3)
	else
		CallPlot(HunterA,"FA_Loafing",HunterA,10,50,780880,3,780880,4)
	end
end

function LuaFA_423800_01()
	local Owner = OwnerID()
-- 記得改成545
	Sleep(20)
	SetPlot( Owner,"touch","",0 )
	LuaFA_423800_CheckPC(1)
	Sleep(55)
	G_FA_423800_Hun["A"][3] = 0
	LuaFA_423800_CheckPC(1)
	if  G_FA_423800_Hun["A"][3] == 0 then
		FA_LookAround(G_FA_423800_Hun["A"][1],0,5,1,5)		-- 左顧右盼
		Say(G_FA_423800_Hun["A"][1],"[SC_423800_A04]")		-- 怎麼說要來的人都不見了…
		LuaFA_423800_Reset("Nobody")	-- 讓玩家從獵人對話開始做
		Sleep(10)
		LuaFA_423800_Reset("A")	-- 歸零
		Lua_DW_CreateObj("flag" ,117506,780880,1)	-- 重種A
	else
		LuaFA_423800_02()	-- GO!
	end
end

function LuaFA_423800_02()
	LuaFA_423800_Reset("B")
	G_FA_423800_Hun["B"][2] = 1
	LuaFA_423800_Set(1)
--	DebugMsg(0,0,"A must die!")
	LuaFA_423800_Reset("A")
--	DebugMsg(0,0,"er, is A dead now?")
	BeginPlot(G_FA_423800_Hun["B"][1], "LuaFA_423800_CheckPC_Loop",0)
	Say(G_FA_423800_Hun["B"][1],"[SC_423800_A03]")	-- 走吧！
end

function LuaFA_423800_End()
	local Owner = OwnerID()
	FA_MoveToPathStop(G_FA_423800_Hun["B"][1])
	G_FA_423800_Hun["B"][2] = 2
	FA_LookAround(Owner,0,nil,1,nil)		-- 左顧右盼
	Say(Owner,"[SC_423800_C05]")	-- 到啦
	Sleep(50)
	LuaFA_423800_CheckPC(3)
	if G_FA_423800_Hun["A"][1] == 0 or G_FA_423800_Hun["A"][1] == nil then
		Lua_DW_CreateObj("flag" ,117506,780880,1)	-- 重種A
	end
	LuaFA_423800_Reset("B")
end

function LuaFA_423800_Reset(Mode,OwnerInput)	-- 歸零
	local Owner = OwnerInput or OwnerID()
	if ReadRoleValue(Owner,EM_RoleValue_OrgID) == 117328 then
		Owner = TargetID()
	end
	if Mode == "A" then		-- 清獵人A 117506
		DelObj(G_FA_423800_Hun["A"][1])
		G_FA_423800_Hun["A"][1] = 0
		G_FA_423800_Hun["A"][2] = 0
		G_FA_423800_Hun["A"][3] = 0
	elseif Mode == "A2" then	-- 初始設定獵人A 117506
		G_FA_423800_Hun["A"][2] = 0
		G_FA_423800_Hun["A"][3] = 0
		SetPlot( G_FA_423800_Hun["A"][1],"touch","LuaFA_117506_01",40 )
	elseif Mode == "B" then		-- 清獵人B 117578
		FA_SetPosByObj(G_FA_423800_Hun["B"][1],G_FA_423800_Hun["A"][1])
		Hide(G_FA_423800_Hun["B"][1])
		MoveToPathPoint(G_FA_423800_Hun["B"][1],0)
		FA_MoveToPathStop(G_FA_423800_Hun["B"][1])
		G_FA_423800_Hun["B"][2] = 0
		G_FA_423800_Hun["B"][3] = 0
	elseif Mode == "B2" then	-- 初始設定獵人B 117578
		Hide(G_FA_423800_Hun["B"][1])
		FA_MoveToPathStop(G_FA_423800_Hun["B"][1])
		G_FA_423800_Hun["B"][2] = 0
		G_FA_423800_Hun["B"][3] = 0
	elseif Mode == "Entry" then	-- 讓玩家回到獵人起始點狀態
		for i = 1 , table.getn(G_FA_423800_Rec) do
			if G_FA_423800_Rec[i] == Owner then
				table.remove(G_FA_423800_Rec,i)
			end
		end
		G_FA_423800_Rec2[Owner] = nil
	elseif Mode == "Nobody" then	-- 讓所有玩家回到獵人起始點狀態
		G_FA_423800_Rec = {}
		G_FA_423800_Rec2 = {}
	else				-- 徹底清除玩家狀態
		SetFlag(Owner,544770,0)
		SetFlag(Owner,544775,0)
		LuaFA_423800_Reset("Entry",Owner)
	end
end


function LuaFA_423800_CheckPC(Mode)
	local Owner = OwnerID()
	-- DebugMsg(0,0,"In_CheckPC_"..Mode)
	local AorB = {"A","B","B"}
	for i = 1, table.getn(G_FA_423800_Rec) do
		if CheckDistance(Owner,G_FA_423800_Rec[i],300) == TRUE then
			-- DebugMsg(0,0,"In_CheckDis_"..Mode)
			-- DebugMsg(0,0,i)
			-- DebugMsg(0,0,G_FA_423800_Rec[i])
			-- DebugMsg(0,0,"IsAttack_"..ReadRoleValue(G_FA_423800_Rec[i],EM_RoleValue_IsAttackMode))
			-- DebugMsg(0,0,"IsNPCAttack_"..ReadRoleValue(OwnerID(),EM_RoleValue_Register4))
			G_FA_423800_Hun[AorB[Mode]][3] = 1
			if Mode == 2 and ReadRoleValue(Owner,EM_RoleValue_Register4) == 0 then	-- 如果117578沒在打人
				if ReadRoleValue(G_FA_423800_Rec[i],EM_RoleValue_IsAttackMode) ~= 0 then	-- 如果掃到的玩家正在扁人
					-- DebugMsg(0,0,IFATTACK)
					CallPlot(Owner,"LuaFA_117578_AI",G_FA_423800_Rec[i])
					-- 呼叫AI func
					WriteRoleValue(Owner,EM_RoleValue_Register4,1)	-- 鎖起來
				end
			end
			if Mode == 3 then
				-- DebugMsg(0,0,"In_SetFlag_Done")
				SetFlag(G_FA_423800_Rec[i],544775,0)
				SetFlag(G_FA_423800_Rec[i],544770,1)
			end
		else
			-- DebugMsg(0,0,"In_CheckDis_Where r u?")
			CallPlot(G_FA_423800_Rec[i],"LuaFA_423800_WhereAreYou",Mode)
		end
	end
end

function LuaFA_117578_AI( HelpWho )
	local Owner = OwnerID()
	-- DebugMsg(0,0,"In_HELPWHO")
	local HitWho		-- 被要幫忙的玩家打的倒楣鬼
	local Attacking = 1	-- 繼續打的判斷記錄
	repeat
		if ReadRoleValue(HelpWho,EM_RoleValue_IsAttackMode) ~= 0
		and ReadRoleValue(HelpWho,EM_RoleValue_IsDead) ~= 1
		and GetModeEx(HelpWho,EM_SetModeType_Fight) ~= FALSE  then		-- 如果在幫的玩家還在扁人
			-- DebugMsg(0,0,"In_HELPWHO_InSide")
			HitWho = ReadRoleValue(HelpWho,EM_RoleValue_AttackTargetID)	-- 把要打的對象設定成要幫的玩家打的對象
--			CastSpell(HelpWho,HitWho,496930)
			-- DebugMsg(0,0,"In_HELPWHO_HitWho")
			SetRoleCamp(Owner,"SNPC")
			SetFightMode ( Owner,0, 1, 0,0 )
			SetAttack (Owner,HitWho)						-- 實際設定角色攻擊
		else	-- 沒在打了的話
			-- DebugMsg(0,0,"In_HELPWHO_STOP")
			SetRoleCamp(Owner,"Visitor")
			SetStopattack(Owner)	-- 哩賣擱打啊
			Attacking = 0
		end
		Sleep(5)
	until Attacking == 0	-- 如果判斷該停手了就不打
	WriteRoleValue(Owner,EM_RoleValue_Register4,0)
end

function LuaFA_423800_CheckPC_Loop()
	local Owner = OwnerID()
	-- DebugMsg(0,0,"In_CheckLoop")
	repeat
		G_FA_423800_Hun["B"][3] = 0
		LuaFA_423800_CheckPC(2)
		if G_FA_423800_Hun["B"][3] == 0 then
			-- DebugMsg(0,0,"Nobody")
			Sleep(30)
			FA_MoveToPathStop(G_FA_423800_Hun["B"][1])
			FA_LookAround(G_FA_423800_Hun["B"][1],0,5,1,5)	-- 左顧右盼
			Say(G_FA_423800_Hun["B"][1],"[SC_423800_A05]")	-- 轉個身人都跑光了是哪招
			for i = 1, table.getn(G_FA_423800_Rec) do
				CallPlot(G_FA_423800_Rec[i], "DW_ChooseOneFromTwo", G_FA_423800_Rec[i],"[SC_423800_C01]",
				"LuaFA_423800_GoBack","LuaFA_423800_Resume","[SC_423800_C02]","[SC_423800_C03]")
			end
			LuaFA_423800_Reset("Nobody")	-- 讓玩家從獵人對話開始做
			Sleep(10)
			LuaFA_423800_Reset("A")
			Lua_DW_CreateObj("flag" ,117506,780880,2)	-- 重種A
			LuaFA_423800_Reset("B")	-- 重置B
			return
		end
		Sleep(20)
	until G_FA_423800_Hun["B"][2] == 2
	-- DebugMsg(0,0,"Out_CheckLoop")
end

function LuaFA_423800_WhereAreYou(Mode)
	local Owner = OwnerID()
	-- DebugMsg(0,0,"TooFar_In")
	if Mode == 1 then
		-- DebugMsg(0,0,"TooFar_In1")
		ScriptMessage(Owner,Owner,0,"[SC_423800_A05_2]","0xffff0000")	-- 你太遠啦！ 左下
		ScriptMessage(Owner,Owner,1,"[SC_423800_A05_2]","0xffff0000")	-- 你太遠啦！ 中央
		while G_FA_423800_Hun["A"][2] == 1 do
			sleep(10)
			if CheckDistance(Owner,G_FA_423800_Hun["A"][1],300) == TRUE then
				G_FA_423800_Hun["A"][3] = 1
				return
			end
		end
		ScriptMessage(Owner,Owner,0,"[SC_423800_A06]","0xffff0000")	-- 你太遠啦！ 左下
		ScriptMessage(Owner,Owner,1,"[SC_423800_A06]","0xffff0000")	-- 你太遠啦！ 中央
	elseif Mode == 2 then
		-- DebugMsg(0,0,"TooFar_In2")
		ScriptMessage(Owner,Owner,0,"[SC_423800_B01_2]","0xffff0000")	-- 你太遠啦！ 左下
		ScriptMessage(Owner,Owner,1,"[SC_423800_B01_2]","0xffff0000")	-- 你太遠啦！ 中央
	elseif Mode == 3 then
		-- DebugMsg(0,0,"TooFar_In3")
		LuaFA_423800_Reset("Entry")
		DW_ChooseOneFromTwo(Owner,"[SC_423800_C01]","LuaFA_423800_GoBack","LuaFA_423800_Resume","[SC_423800_C02]","[SC_423800_C03]")
	end
end

function LuaFA_423800_GoBack(Who)
	ScriptMessage(Who,Who,0,"[SC_423800_A07]","0xffff0000")	-- 你太遠啦！ 左下
	ScriptMessage(Who,Who,1,"[SC_423800_A07]","0xffff0000")	-- 你太遠啦！ 中央
end

function LuaFA_423800_Resume(Who)
	SetFlag(Who,544775,0)
	SetFlag(Who,544770,1)
end

function LuaFA_117837_Born()
	local Owner = OwnerID()
	DisableQuest( Owner , TRUE )
	SetPlot( Owner,"range","LuaFA_117837_Range",200 )
end

function LuaFA_117837_Range()
	local Owner = OwnerID()
	if FA_CheckQuestOrFlag(Owner,423800,544770) == TRUE then
		return
	end
	if CheckAcceptQuest(Owner,423800) == TRUE and G_FA_423800_Hun["A"][1] == 0 then
		ScriptMessage(Owner,Owner,0,"[SC_423800_C04]","0xffff0000")	-- 人不在啦！ 左下
		ScriptMessage(Owner,Owner,1,"[SC_423800_C04]","0xffff0000")	-- 人不在啦！ 中央
	end
end

function LuaFA_423800_Show()
	show (G_FA_423800_Hun["B"][1],0)
end

function LuaFA_423800_Say()
	Say(G_FA_423800_Hun["B"][1],"[SC_423800_A03]")
end
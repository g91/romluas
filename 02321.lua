function LuaS_209036_1()

	local Obj = OwnerID()

	if	CheckCompleteQuest( Obj, 423823 ) == TRUE	then
		UseItemDestroy()
		return
	end
	
	local NotYet = "[SC_209036_NOTYET]"

	if CheckCompleteQuest(Obj, 423984) == TRUE then
		if ReadRoleValue(Obj,EM_RoleValue_LV) >= 21 then
			DW_Border(423823)
		else
			ScriptMessage(Obj,Obj,0,NotYet,0)	-- 現在還沒有要去蘭薩德部落
		end
	end
	LuaS_209036_2(1)
end

function LuaS_209036_2(who)

	local Obj = OwnerID()
	local TargetID = TargetID()
	local S_Pain = "[SC_209036_1]"

	if who == 1 then
		say (Obj, S_Pain)
		AddBuff(Obj,502641,10,9)
	else
		say (TargetID, S_Pain)
		AddBuff(TargetID,502641,10,9)
	end
end

function LuaS_209036_DoSomething(Int)

	local Obj = OwnerID()
	local WhenEsc = function() WriteRoleValue( Obj, EM_RoleValue_Register6, 0 ) end

	if	CheckCompleteQuest( Obj, 423823 ) == TRUE	then
		return
	end

	if ReadRoleValue( Obj, EM_RoleValue_Register6 ) == 209036 then
		return
	else
		WriteRoleValue( Obj, EM_RoleValue_Register6, 209036 )
	end

	local S_Drop = "[SC_209036_DROP]"
	local S_Remind = "[SC_209036_REMIND_01]"
	local Option = {	{"[SC_209036_O_REMIND]",	function ()
									LuaS_423823_O_REMIND()
									WhenEsc()
								end	},

				{"[SC_209036_O_DROP]",	function ()
									LuaS_209036_DoSomething()
									WhenEsc()
								end	},

				{"[SC_209036_O_BYE]",	function ()
									LuaS_423823_O_BYE()
									WhenEsc()
								end	},

				{"[LuaS_423823_O_IGNORE]",	function ()
									LuaS_423823_O_IGNORE()
									WhenEsc()
								end	}	}

	if Int == nil then
		LuaS_423823_DelBear()
		BeginPlot( Obj, "LuaS_209036_DEL", 0)
	else
		ScriptMessage(Obj, Obj, 0, S_Remind, C_Red )	-- 提醒玩家
		ScriptMessage(Obj, Obj, 1, S_Remind, C_Red )
		sleep (20)
		OpenClientMenu(Obj,EM_ClientMenuType_Bag)	-- 打開玩家的背包
		FA_Dialog_Choose( Obj, "[SC_209036_REMIND_02]", Option, 1200, 0, 0, nil, nil, nil, WhenEsc )
	end

end

function LuaS_209036_DEL()
		local Obj = OwnerID()
		local S_Drop = "[SC_209036_DROP]"
		local S_Remind = "[SC_209036_REMIND_01]"
		ScriptMessage( Obj, Obj, 0, S_Drop, C_Red )	-- 你丟了熊
		ScriptMessage( Obj, Obj, 1, S_Drop, C_Red )
		if	CheckCompleteQuest( Obj, 423823 ) == TRUE	then
			return
		end
		Sleep(20)
		GiveBodyItem( Obj, 209036, 1 )
		ScriptMessage( Obj, Obj, 0, S_Remind, C_Red )	-- 熊來電震鈴
		ScriptMessage( Obj, Obj, 1, S_Remind, C_Red )
		Sleep(10)
		OpenClientMenu(Obj,EM_ClientMenuType_Bag)	-- 打開玩家的背包
		if CheckBuff( Obj , 501570) == true then 
			ScriptMessage( Obj , Obj , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
			return 0
		end
		AddBuff(Obj , 501570,0,-1);
		DialogCreate(Obj,EM_LuaDialogType_Select,"[SC_209036_DEL]")
		DialogSelectStr( Obj,"[SC_209036_REMIND_ACCEPT]")
		if DialogSendOpen( Obj ) == false then 
			ScriptMessage( Obj , Obj , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--資料送出有問題
			CancelBuff( Obj, 501570 );--
			return 0
		end
		for i=1,120,1 do
			local WhatNow = DialogGetResult(Obj)
			sleep(5)
			if		WhatNow==0 or WhatNow==-1	then
				CancelBuff( Obj, 501570 );--
				DialogClose(Obj)
				break
			end
		end
end



function LuaS_423823_DelBear()

	local Obj = OwnerID()

	if CheckCompleteQuest( Obj, 423823 ) == TRUE then
		return
	end

	if GetUseItemGUID( Obj ) == 209036 then
		UseItemDestroy()
	else
		DelBodyItem( Obj, 209036, CountBodyItem( Obj, 209036 ) )
	end
end

function LuaS_423823_REMIND()

	local Obj = OwnerID()

	if CheckCompleteQuest( Obj, 423823 ) == TRUE then
		return
	end

	if ReadRoleValue( Obj, EM_RoleValue_Register6 ) == 209036
	or CheckCompleteQuest( Obj, 423823 ) == TRUE then
		return
	end

	if CountBodyItem( Obj, 209036 ) > 0 and CheckCompleteQuest( Obj, 423984 ) == TRUE
	and ReadRoleValue( Obj, EM_RoleValue_LV ) >= 23 then
		LuaS_209036_DoSomething(1)
	end
end

function LuaS_423823_O_REMIND()

	local S_Remind_03 = "[SC_209036_REMIND_03]"
	local Obj = OwnerID()
	local Option = {	{"[SC_209036_REMIND_ACCEPT]",	function ()
									DialogClose( Obj )
									CancelBuff( Obj, 501570 );--
									WriteRoleValue( Obj, EM_RoleValue_Register6, 0 )
									DW_Border(423823)
								end	}	}
	if CheckCompleteQuest(Obj,423984) == TRUE
	and ReadRoleValue(Obj,EM_RoleValue_LV) >= 23 then
		FA_Dialog_Choose( Obj, S_Remind_03, Option, 1200, 1 )
	else
		FA_Dialog_Choose( Obj, S_Remind_03, 0, 1200, 1 )
	end
	
end

function LuaS_423823_O_BYE()

	local Obj = OwnerID()

	LuaS_423823_DelBear()
	FA_Dialog_Choose( Obj,"[SC_209036_BYE]" , 0, 1200, 0 )

end

function LuaS_423823_O_IGNORE()

	local Obj = OwnerID()
	local S_Ignore = "[SC_209036_IGNORE]"

	DialogClose( Obj )
	CancelBuff( Obj, 501570 );--

	ScriptMessage( Obj, Obj, 0, S_Ignore, C_Red )	-- 你不管熊了
	ScriptMessage( Obj, Obj, 1, S_Ignore, C_Red )

end

function LuaS_423823_GOAL()

	local Obj = OwnerID()
	local S_Goal_1 = "[SC_209036_GOAL_01]"

	if CheckCompleteQuest( Obj, 423823 ) == TRUE then
		return
	end

	if CountBodyItem(Obj,209036) > 0
	and CheckAcceptQuest( Obj, 423823 ) == TRUE then
		SetFlag( Obj, 544772, 1)
		ScriptMessage( Obj, Obj, 0, S_Goal_1, C_Red )	-- 冒險者來一下～
		ScriptMessage( Obj, Obj, 1, S_Goal_1, C_Red )
	end
end

function LuaS_423823()

	local Obj = OwnerID()
	DelBodyItem(Obj ,209036 , CountBodyItem(Obj ,209036))

end
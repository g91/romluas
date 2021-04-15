function LuaI_201250_Check()
	local Target = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
	if CheckAcceptQuest( OwnerID() , 420458 ) == false or CheckCompleteQuest( OwnerID() , 420458 ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_201250_0"), 0 ); --/*任務不符合。
		return false
	elseif CountBodyItem( OwnerID() , 201249 ) >= 5 then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_201250_1"), 0 ); --/*五隻野生拔忽在籠子裡騷動著。
		return false
	end
	if CheckID( TargetID() ) == false or TargetID() == OwnerID() then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_201250_2"), 0 ); --/*你沒有目標。
		return false
	else
		if Target ~= 100367 then 
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_201250_3"), 0 ); --/*目標錯誤。
			return false	
		elseif ReadRoleValue( TargetID() , EM_RoleValue_AttackTargetID ) ~= OwnerID() then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_201250_4"), 0 ); --/*你必須先讓野生拔忽攻擊你，才能誘捕牠。
			return false
		else
			return true
		end
	end
end

function LuaC_201250_Effect()
	if  Rand(20) > 10 then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_201250_5"), 0 ); --/*唉呀！差一點就抓到了！
	else
		BeginPlot(TargetID() , "LuaI_201250_Reset" , 0 )
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_201250_6"), 0 ); --/*你成功地抓到了一隻野生拔忽！
		GiveBodyItem(OwnerID() ,201249 , 1 )
	end	
end
function LuaI_201250_Reset()
	LuaFunc_ResetObj( OwnerID() )	
end


function LuaS_420829_2()--藍色藥水的檢查
	if ReadRoleValue(TargetID(), EM_RoleValue_OrgID)==100675 then
		if CheckBuff( TargetID() , 500447) then
			return true
		else
			return false
		end
	else
		return false
	end
end 

function LuaS_420829_3()--藍色藥水的使用
	CancelBuff( TargetID() , 500447)--消除無敵狀態
	WriteRoleValue(TargetID(),EM_RoleValue_PID,OwnerID())
	ScriptMessage( OwnerID(), OwnerID(), 2, GetString("EM_420829_0") , 0 )		--你成功破解了魔物的防禦！
end




function LuaS_100675()
	local maxhp=ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP) --宣告最大的血量
	local hp=ReadRoleValue(OwnerID(),EM_RoleValue_HP) -- 宣告目前的血量
	local Shield=false --宣告護盾狀態
	local Player={}  --宣告空陣列
	WriteRoleValue ( OwnerID() ,EM_RoleValue_PID , 0 )  --清空自己的PID
	local Breaker = ReadRoleValue ( OwnerID() , EM_RoleValue_PID ) --將PID送到 Breaker 之中

	while true do --無限迴圈
		maxhp=ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP) --重新抓取HP最大值
		hp=ReadRoleValue(OwnerID(),EM_RoleValue_HP) --重新抓取HP 值
		Breaker = ReadRoleValue ( OwnerID() , EM_RoleValue_PID ) --重新抓取 PID 值

		
		if hp/maxhp < 0.77 then  --如果血少於百分之七十七
			
			if Breaker == 0 then -- 如果PID之中還沒有玩家
				CastSpell(OwnerID(),OwnerID(),491207)--開啟無敵
				Player = SearchRangePlayer ( OwnerID(), 325 ) --抓取附近的玩家

				for i=0 , table.getn(Player) do
					if Player[i]~= -1 then
						ScriptMessage( OwnerID(), Player[i] , 2, GetString("EM_100675_1") , 0 )--基歐塞德的外殼變得刀槍不入，水火不侵！
						if CheckAcceptQuest( Player[i] , 420827) then
							SetFlag( Player[i], 540947, 1 )--完成任務
						end
					end
				end
			else
				if CheckID( Breaker ) then --如果 PID 中有玩家資料 且該玩家還在線上
					if GetDistance( OwnerID(), Breaker  ) >310 then -- 如果該玩家離得太遠
						WriteRoleValue ( OwnerID() ,EM_RoleValue_PID , 0 ) --重寫PID為 0 (沒有玩家 )
						CastSpell(OwnerID(),OwnerID(),491207)--開啟無敵
						Player = SearchRangePlayer ( OwnerID(), 310 ) --搜尋附近的玩家
						for i=0 , table.getn(Player) do
							if Player[i]~=-1 then
								ScriptMessage( OwnerID(), Player[i] , 2, GetString("EM_100675_1") , 0 )--基歐塞德的外殼變得刀槍不入，水火不侵！
								if CheckAcceptQuest( Player[i] , 420827) then
									SetFlag( Player[i], 540947, 1 )--完成任務
								end
							end
						end
					end
				end
			end
		end
		Sleep(10)
	end
end




--以下是25級的劇情
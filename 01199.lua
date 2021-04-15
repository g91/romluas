function LuaI_Mulgrum_Relic_Enter()
	SetPlot( OwnerID() , "Collision" , "LuaS_Mulgrum_Relic_Enter" , 0 )
end
function LuaS_Mulgrum_Relic_Enter()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		
		DialogCreate( OwnerID(),EM_LuaDialogType_YesNo,"[SC_ZONE114_0]"); --請問是否要進入50級的副本？
		DialogSelectStr( OwnerID() , GetString("SO_YES") );
		DialogSelectStr( OwnerID() , GetString("SO_NO") );
		local Ans = LuaS_DialogRePort_TwoChoose(OwnerID())
		if	Ans == "Etc"	then
			return
		end

		if	Ans == "Yes"	then
			if CheckFlag( OwnerID() , 542397 ) == false then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[WARRING_ZONE_NOT_OPEN_EX01]" , C_SYSTEM )	-- 裡面傳來沈重的金屬敲擊聲，隱約透漏著一種危險的氣息...
				Sleep( 10 )
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[WARRING_ZONE_NOT_OPEN_EX02]" , C_DEFAULT )	-- 你覺得你還沒準備好可以踏進這個區域！
			else
				if ChangeZone( OwnerID() , 114 , -1 , 4296.5 , 229 , 2549 , 0 ) then
					local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- 取得玩家等級
					local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- 取得玩家副職等級
					DesignLog( OwnerID() , 114 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- 紀錄進入人次	-- 冰雪矮人王國遺跡
				else
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
				end
			end
		end
		
		if	Ans == "No"	then
			if CheckFlag( OwnerID() , 542397 ) == false then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[WARRING_ZONE_NOT_OPEN_EX01]" , C_SYSTEM )	-- 裡面傳來沈重的金屬敲擊聲，隱約透漏著一種危險的氣息...
				Sleep( 10 )
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[WARRING_ZONE_NOT_OPEN_EX02]" , C_DEFAULT )	-- 你覺得你還沒準備好可以踏進這個區域！
			else
				if ChangeZone( OwnerID() , 113 , -1 , 4296.5 , 229 , 2549 , 0 ) then
					local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- 取得玩家等級
					local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- 取得玩家副職等級
					DesignLog( OwnerID() , 113 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- 紀錄進入人次	-- 冰雪矮人王國遺跡
				else
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
				end
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end

function LuaI_Mulgrum_Relic_Out()
	SetPlot( OwnerID() , "Collision" , "LuaS_Mulgrum_Relic_Out" , 0 )
end
function LuaS_Mulgrum_Relic_Out()
	if ChangeZone( OwnerID() , 11 , 0 , -20351 , 1036 , -21154 , 215 ) then

	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end

function LuaI_Treasure_Trove_Enter()
	SetPlot( OwnerID() , "Collision" , "LuaS_Treasure_Trove_Enter" , 0 )
end
function LuaS_Treasure_Trove_Enter()
	if CheckCompleteQuest( OwnerID() , 421829 ) == false then	-- 解完威爾主線任務
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[WARRING_ZONE_NOT_OPEN_EX03]" , C_SYSTEM )	-- 裡面傳來一股詭異的氣氛，隱約透漏著一種危險的氣息...
		Sleep( 10 )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[WARRING_ZONE_NOT_OPEN_EX04]" , C_DEFAULT )	-- 你覺得有一股莫名的力量阻止你持續前進！
	else
		if ChangeZone( OwnerID() , 108 , -1 , 3155 , 711 , 664 , 0 ) then
			local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- 取得玩家等級
			local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- 取得玩家副職等級
			DesignLog( OwnerID() , 108 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- 紀錄進入人次	-- 冰雪矮人王國遺跡
		else
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
		end
	end
end

function LuaI_Treasure_Trove_Out()
	SetPlot( OwnerID() , "Collision" , "LuaS_Treasure_Trove_Out" , 0 )
end
function LuaS_Treasure_Trove_Out()
	if ChangeZone( OwnerID() , 3 , 0 , 11644, 23 , 2243 , 350 ) then

	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end
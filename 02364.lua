function Lua_Hao_eneu_2year_login()

--	if type == EM_Event_Module_Type_Login then

		local month = GetSystime(3)+1
		local day = GetSystime(4)
		local hour = GetSystime(1)
		local min = GetSystime(2)
	
		local Buff = 505766
		local MsgBuff = 507860	-- 提示用時間訊息
		local Keyitem = 545026
		local Item = 209561
		local Give = 1
		local BuffTime = 90000
	
--		if month == 3 then
--			if PlayerLV >= 20 then
--				if day == 15 and hour < 15 then
--					return false
--				elseif day == 19 and hour >= 11 then
--					return false
--				elseif ( hour >=00 and min >=0 ) then
					AddBuff( OwnerID() , MsgBuff , 0 , -1 )
					if CheckFlag( OwnerID() , Keyitem ) == true then
					--	AddBuff( OwnerID() , MsgBuff , 0 , -1 )
						return false
					else
					--	AddBuff( OwnerID() , MsgBuff , 0 , -1 )
						if CheckBuff( OwnerID() , Buff ) == false then -- 當連續登入天數為 1 天時
							AddBuff( OwnerID() , Buff , 0 , BuffTime )
							SetFlag( OwnerID() , Keyitem , 1 )
							GiveBodyItem( OwnerID() , Item , Give )
							return false
						else
							local Count = BuffCount( OwnerID() )
							for i = 0 , Count , 1 do
							--	DebugMsg( 0 , 0 , "Count = "..Count )
								local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
							--	DebugMsg( 0 , 0 , "BuffID = "..BuffID )
								if BuffID == Buff then
									local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
								--	DebugMsg( 0 , 0 , "BuffLv = "..BuffLv )
									if BuffLv == 0 then -- 當連續登入天數為 2 天時
										AddBuff( OwnerID() , Buff , 0 , BuffTime )
										SetFlag( OwnerID() , Keyitem , 1 )
										GiveBodyItem( OwnerID() , Item , Give+1 )
										break
									elseif BuffLv == 1 then -- 當連續登入天數為 3 天時
										AddBuff( OwnerID() , Buff , 0 , BuffTime )
										SetFlag( OwnerID() , Keyitem , 1 )
										GiveBodyItem( OwnerID() , Item , Give+2 )
										break
									elseif BuffLv == 2 then -- 當連續登入天數為 4 天時
										AddBuff( OwnerID() , Buff , 0 , BuffTime )
										SetFlag( OwnerID() , Keyitem , 1 )
										GiveBodyItem( OwnerID() , Item , Give+3 )
										break
									elseif BuffLv >= 3 then -- 當連續登入天數為 5 天時
										AddBuff( OwnerID() , Buff , 0 , BuffTime )
										SetFlag( OwnerID() , Keyitem , 1 )
										GiveBodyItem( OwnerID() , Item , Give+4 )
										break
									end
							--	elseif CheckFlag( OwnerID() , Keyitem ) == true and CheckBuff( OwnerID() , Buff ) == false then
							--		DebugMsg( 0 , 0 , "You must use the correct way to test this activity , Something wrong  , Please try again ." )
								end
							end
						end
					end
--				end
--			end
--		end
--	end
end

function Lua_Hao_eneu_2year_login_Msg()	-- 提示玩家必須在幾小時，幾分後重新登入遊戲。

--	local Buff = 507860	-- 提示用時間訊息
	local Lowhour = 6
	local Maxhour = 23
	local Maxmin = 60
	local Msghour , Msgmin

--	local month = GetSystime(3)+1
--	local day = GetSystime(4)
	local hour = GetSystime(1)
	local min = GetSystime(2)

	if hour >= 0 and hour <= 5 then
	--	DebugMsg( 0 , 0 , "1" )
		Msghour = Lowhour - (hour+1)
		Msgmin = Maxmin - min
		if Msgmin == Maxmin then	-- 60 = 60
			Msghour = Msghour + 1	-- 當分針 = 60，時針+1
			Msgmin = 0			-- 同時，分針歸 0
		end
	elseif hour >= 6 and hour <= 23 then
	--	DebugMsg( 0 , 0 , "2" )
		Msghour = Maxhour - hour + Lowhour
		Msgmin = Maxmin - min
		if Msgmin == Maxmin then	-- 60 = 60
			Msghour = Msghour + 1	-- 當分針 = 60，時針+1
			Msgmin = 0			-- 同時，分針歸 0
		end
	end
--	Lua_Hao_System_Time()
	DebugMsg( 0 , 0 , "Hour = "..Msghour.." ".."Min = "..Msgmin )

	Msghour = string.format( "%02d", Msghour )
	Msgmin = string.format( "%02d", Msgmin )

	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_GERMANY2_03][$SETVAR1="..Msghour.."][$SETVAR2="..Msgmin.."]" , C_SYSTEM )
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_GERMANY2_03][$SETVAR1="..Msghour.."][$SETVAR2="..Msgmin.."]" , C_SYSTEM )
--	ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_GERMANY2_03][$SETVAR1="..Msghour.."][$SETVAR2="..Msgmin.."]" , C_SYSTEM )
--	每天持續的登入，會帶給你額外的獎勵，
--	若於[$VAR1]小時[$VAR2]分鐘後至[505766]效果消失前的期間內重新登入，
--	即可提高[505766]的等級。最高可升級至等級5。
--	活動期間，只要每天保持登入，就能提高此效果等級，等級越高，將讓你獲得的更多<CY>[209561]</CY>。
end
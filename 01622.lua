--古代秘寶 
--命運盒子.亡靈黑洞.淨化燭台.冰燄燭台
------------------------------------------------------------------
--命運盒子

Function  Lua_mika_losttreasuredes02()
--	Say(TargetID(),"TargetID")
--	Say(OwnerID(),"OwnerID")
	if CheckBuff(OwnerID(), 505297) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_MSG02]" , C_SYSTEM )	--你處於裝死狀態無法行動。
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_MSG02]"  , C_SYSTEM )
	else
		if BeginCastBar( OwnerID(), "[SC_LOSTTREASURE_DES05]", 30 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	--/*開始施法，使用者,時間條上的文字,進行時間,起始動作,結束動作,中斷條件(0為移動中斷)

			while true do
			sleep( 2 )
				local CastBarStatus = CheckCastBar( OwnerID() )
				if ( CastBarStatus ~= 0 ) then 
					if ( CastBarStatus > 0) then -- 成功
						result = "OKOK"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					elseif ( CastBarStatus < 0 ) then -- 失敗
						result = "DAME"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					end
				end
			end

			if ( result == "OKOK" ) then

				if CheckID( TargetID() ) == true then
						PlayMotionEX( TargetID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --寶箱持續播放145    146
						BeginPlot(  OwnerID()  , "Lua_mika_losttreasuredes03" , 0 )  
						SetPlot( TargetID(),"touch","",0 )
						sleep(10)
				end
			elseif ( result == "DAME" ) then
				SetPlot( TargetID(),"touch","Lua_mika_losttreasuredes02",60 )
			end
		end
	end
end

function Lua_mika_losttreasuredes03()     

			---------------- 2011.08.30 新增稱號培養系統任務條件
			local npcid = 106282
			DW_QietKillOne( OwnerID(), npcid )
			------------------------------------------------- 

			local BuffType = 0
			local Count = BuffCount ( OwnerID())
			local SetA = -1--
			local SetB = -1--
			local SetC = -1--
			local SetD = -1--
			for i = 0 , Count do
				local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
				if BuffID == 505282 then
					local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
					SetA = BuffLv
				elseif BuffID == 505283 then
					local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
					SetB = BuffLv
				elseif BuffID == 505284 then
					local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
					SetC = BuffLv
				elseif BuffID == 505285 then
					local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
					SetD = BuffLv
				end
			end
			local P = 4
			local XX = Rand( P )      
			if XX == 0 then   
				CancelBuff(OwnerID(),505282)
				AddBuff(OwnerID(), 505282,SetA+1,1200)
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_DES01] " , C_SYSTEM )	--你取得了1次[使用505282]的機會。
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_DES01]"  , C_SYSTEM )	
			elseif XX == 1 then   
				CancelBuff(OwnerID(),505283)
				AddBuff(OwnerID(), 505283,SetB+1,1200)
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_DES02] " , C_SYSTEM )	 --你取得了1次[使用505283]的機會。
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_DES02]"  , C_SYSTEM )	
			elseif XX == 2 then   
				CancelBuff(OwnerID(),505284)
				AddBuff(OwnerID(), 505284,SetC+1,1200)
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_DES03] " , C_SYSTEM )	--你取得了1次[使用505284]的機會。
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_DES03] "  , C_SYSTEM )	
			elseif XX == 3 then   
				CancelBuff(OwnerID(),505285)
				AddBuff(OwnerID(), 505285,SetD+1,1200)
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_DES04] " , C_SYSTEM )	--你取得了1次[使用505285]的機會。
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_DES04]"  , C_SYSTEM )	
			end

end
------------------------------------------------------------------
--命運盒子減少次數

function Lua_mika_losttreasuredes_magic01()  --減少次數
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local SetA = -1--
	local SetB = -1--
	local SetC = -1--
	local SetD = -1--
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if BuffID == 505282 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetA = BuffLv
		elseif BuffID == 505283 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetB = BuffLv
		elseif BuffID == 505284 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetC = BuffLv
		elseif BuffID == 505285 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetD = BuffLv
		end
	end

	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if BuffID == 505282 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			if BuffLv > 0 then
				CancelBuff(OwnerID(),505282)
				AddBuff(OwnerID(), 505282,SetA-1,1200)
				break
			else
				CancelBuff(OwnerID(),BuffID)
				break
			end
		end
	end
end

-----------------------------------------------------------------
function Lua_mika_losttreasuredes_magic02()  --減少次數
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local SetA = -1--
	local SetB = -1--
	local SetC = -1--
	local SetD = -1--
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if BuffID == 505282 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetA = BuffLv
		elseif BuffID == 505283 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetB = BuffLv
		elseif BuffID == 505284 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetC = BuffLv
		elseif BuffID == 505285 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetD = BuffLv
		end
	end
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if BuffID == 505283 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			if BuffLv > 0 then
				CancelBuff(OwnerID(),505283)
				AddBuff(OwnerID(), 505283,SetB-1,1200)
				break
			else
				CancelBuff(OwnerID(),BuffID)
				break
			end
		end
	end
end
-----------------------------------------------------------------

function Lua_mika_losttreasuredes_magic03()  --減少次數
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local SetA = -1--
	local SetB = -1--
	local SetC = -1--
	local SetD = -1--
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if BuffID == 505282 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetA = BuffLv
		elseif BuffID == 505283 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetB = BuffLv
		elseif BuffID == 505284 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetC = BuffLv
		elseif BuffID == 505285 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetD = BuffLv
		end
	end
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if BuffID == 505284 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			if BuffLv > 0 then
				CancelBuff(OwnerID(),505284)
				AddBuff(OwnerID(), 505284,SetC-1,1200)
				break
			else
				CancelBuff(OwnerID(),BuffID)
				break
			end
		end
	end
end

-----------------------------------------------------------------
function Lua_mika_losttreasuredes_magic04()  --減少次數
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local SetA = -1--
	local SetB = -1--
	local SetC = -1--
	local SetD = -1--
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if BuffID == 505282 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetA = BuffLv
		elseif BuffID == 505283 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetB = BuffLv
		elseif BuffID == 505284 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetC = BuffLv
		elseif BuffID == 505285 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			SetD = BuffLv
		end
	end
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if BuffID == 505285 then
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			if BuffLv > 0 then
				CancelBuff(OwnerID(),505285)
				AddBuff(OwnerID(), 505285,SetD-1,1200)
				break
			else
				CancelBuff(OwnerID(),BuffID)
				break
			end
		end
	end
end

------------------------------------------------------------------
--亡靈黑洞
function Lua_mika_losttreasure_dark2()    --亡靈黑洞 
	if CheckBuff(OwnerID(), 505297) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_MSG02]" , C_SYSTEM )	--你處於裝死狀態無法行動。
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_MSG02]"  , C_SYSTEM )
	else
		if CheckBuff(OwnerID(), 505286) == false then --如果沒有特定buff
			AddBuff( OwnerID() , 503047 , 0, 5)  --火焰著身
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_HALL01]" , C_SYSTEM ) --你觸碰到[114081]的詛咒，全身燃燒了起來。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_HALL01]"  , C_SYSTEM )--你觸碰到[114081]的詛咒，全身燃燒了起來。
		elseif CheckBuff(OwnerID(), 505286) == true then -- 如果有特定buff BUFF編號代用
			--------------------------------------------------------------------------------------
			-- 2011.08.15  殺死-NPC  消滅亡靈黑洞	106280
			local npcid = 106280
			DW_QietKillOne( OwnerID(), npcid )
			--	say(OwnerID(), "kill id = "..npcid )
			--------------------------------------------------------------------------------------
			DelObj(TargetID())
			CancelBuff( OwnerID() , 505286)  --取消 淨化之焰效果
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_HALL02]" , C_SYSTEM )  --[114081]受到淨化效果的影響而消失了。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_HALL02] "  , C_SYSTEM )  --[114081]受到淨化效果的影響而消失了。
		end
	end
end
------------------------------------------------------------------
--淨化燭台	

Function  Lua_mika_losttreasurecure02()
--	Say(TargetID(),"TargetID")
--	Say(OwnerID(),"OwnerID")
	local candle = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114079, 300 , 0)       --燭台
	if CheckBuff(OwnerID(), 505297) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_MSG02]" , C_SYSTEM )	--你處於裝死狀態無法行動。
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_MSG02]"  , C_SYSTEM )
	elseif CheckBuff(OwnerID(), 505286) == true then --如果有淨化之焰
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_CURE01] " , C_SYSTEM )	--你已持有[505286]效果。
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_CURE01]"  , C_SYSTEM )	
	else
		if BeginCastBar( OwnerID(), "[SC_LOSTTREASURE_CURE03]", 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) == 1 then	--/*開始施法，使用者,時間條上的文字,進行時間,起始動作,結束動作,中斷條件(0為移動中斷)
	--取得[505286]
			while true do
			sleep( 2 )
				local CastBarStatus = CheckCastBar( OwnerID() )
				if ( CastBarStatus ~= 0 ) then 
					if ( CastBarStatus > 0) then -- 成功
						result = "OKOK"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					elseif ( CastBarStatus < 0 ) then -- 失敗
						result = "DAME"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					end
				end
			end

			if ( result == "OKOK" ) then
				if CheckID( TargetID() ) == true then
						--PlayMotion(candle, ruFUSION_MIME_CROUCH_BEGIN) 
						AddBuff( OwnerID() ,505286 , 0, 180)  --淨化之焰效果 
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_CURE02] " , C_SYSTEM )	--你取得了[505286]效果。
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_CURE02]"  , C_SYSTEM )	
				end
			elseif ( result == "DAME" ) then
				SetPlot( TargetID(),"touch","Lua_mika_losttreasurecure02",50 )
			end
		end
	end
end


------------------------------------------------------------------------
--冰焰燭臺
function Lua_mika_losttreasure_blue2() --冰焰燭臺
--	Say(OwnerID(),"O") 玩家
--	Say(TargetID(),"T")  燭台
	local candle1 = CheckFlag (OwnerID(), 543487)
	local candle2 = CheckFlag (OwnerID(), 543488)
	local candle3 = CheckFlag (OwnerID(), 543489)
	local onoff = ReadRoleValue(TargetID() , EM_RoleValue_Register)   --燭臺開關狀態，值為1是已點燃，值為0是未點燃。

	if CheckBuff(OwnerID(), 505297) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_MSG02]" , C_SYSTEM )	--你處於裝死狀態無法行動。
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_MSG02]"  , C_SYSTEM )
	else
		if candle3 == true then
			ScriptMessage( OwnerID(), -1  , 1 ,"[SC_LOSTTREASURE_22]" ,0  )--3個燭臺已被點燃，趁時間未結束前快前往遺跡中央的藏寶庫吧。
			ScriptMessage( OwnerID(), -1  , 0 ,"[SC_LOSTTREASURE_22]" ,0  )-- 3個燭臺已被點燃，趁時間未結束前快前往遺跡中央的藏寶庫吧。
		elseif onoff == 1 then
			ScriptMessage( OwnerID(), -1  , 1 ,"[SC_LOSTTREASURE_23]" ,0  )-- 此燭臺已被點燃。
			ScriptMessage( OwnerID(), -1  , 0 ,"[SC_LOSTTREASURE_23]" ,0  )-- 此燭臺已被點燃。
		elseif onoff == 0 then
			if BeginCastBar( OwnerID(), "[SC_LOSTTREASURE_18]", 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) == 1 then	--/*開始施法，使用者,時間條上的文字,進行時間,起始動作,結束動作,中斷條件(0為移動中斷)
	while true do
				sleep( 2 )
					local CastBarStatus = CheckCastBar( OwnerID() )
					if ( CastBarStatus ~= 0 ) then 
						if ( CastBarStatus > 0) then -- 成功
							result = "OKOK"
							EndCastBar( OwnerID() , CastBarStatus )
							break;
						elseif ( CastBarStatus < 0 ) then -- 失敗
							result = "DAME"
							EndCastBar( OwnerID() , CastBarStatus )
							break;
						end
					end
				end
				if ( result == "OKOK" ) then
					if CheckID( TargetID() ) == true then
						if candle1 == true  and candle2 == true then --燭臺1和燭臺2已被點燃 (此燭臺為第3個。)
			--				Sleep(10)
							PlayMotion(TargetID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)  --讓燭臺點燃
							WriteRoleValue(TargetID() , EM_RoleValue_Register, 1 )    --此燭臺已被點燃
							if CheckFlag(OwnerID(), 543497) == true then
								AddBuff( OwnerID() , 505596 , 1, 1200)  --20分鐘 
							else
								AddBuff( OwnerID() , 505596 , 1, 900)  --15分鐘 
							end
							SetFlag(OwnerID(), 543489, 1) --給第3個燭臺KEY
							sleep(20)
							time = ReadRoleValue(OwnerID() , EM_RoleValue_Register+9) 
		--					Say(OwnerID(), time)
							if time >= 240 then
								--- 6.0.1 新增 61級以上玩家剩下4分鐘以上通關, 獲得特殊key
								if ReadRoleValue(OwnerID(), EM_RoleValue_LV)  >= 61 then-- 主職等級
									Setflag(OwnerID(), 548091, 1 )
								end

								ScriptMessage( OwnerID(), -1  , 1 ,"[SC_LOSTTREASURE_19]" ,0  )--遠方傳來沉重的開門聲，藏寶庫的大門已經開啟。
								ScriptMessage( OwnerID(), -1  , 0 ,"[SC_LOSTTREASURE_19] " ,0  )--遠方傳來沉重的開門聲，藏寶庫的大門已經開啟。
								CancelBuff(OwnerID(), 505594)
								CancelBuff(OwnerID(), 505595)
								CancelBuff(OwnerID(), 505596)
								ScriptMessage( OwnerID(), -1  , 1 ,"[SC_LOSTTREASURE_MSG01]" ,0  )--藏寶庫似乎出現了特殊寶箱。
								ScriptMessage( OwnerID(), -1  , 0 ,"[SC_LOSTTREASURE_MSG01]" ,0  )--藏寶庫似乎出現了特殊寶箱。
								BeginPlot(OwnerID()  , "Lua_mika_losttreasure_boxtest1" , 0 )   --生一般寶箱
								BeginPlot(OwnerID()  , "Lua_mika_losttreasure_boxtest11" , 0 )   --生一般寶箱
								BeginPlot(OwnerID()  , "Lua_mika_losttreasure_boxtest2" , 0 )   --生綠寶相
								BeginPlot(OwnerID()  , "Lua_mika_losttreasure_boxtest3" , 0 )   --生紫寶箱
							else
								ScriptMessage( OwnerID(), -1  , 1 ,"[SC_LOSTTREASURE_19]" ,0  )--遠方傳來沉重的開門聲，藏寶庫的大門已經開啟。
								ScriptMessage( OwnerID(), -1  , 0 ,"[SC_LOSTTREASURE_19] " ,0  )--遠方傳來沉重的開門聲，藏寶庫的大門已經開啟。
								CancelBuff(OwnerID(), 505594)
								CancelBuff(OwnerID(), 505595)
								CancelBuff(OwnerID(), 505596)
								BeginPlot(OwnerID()  , "Lua_mika_losttreasure_boxtest1" , 0 )   --生一般寶箱
								BeginPlot(OwnerID()  , "Lua_mika_losttreasure_boxtest11" , 0 )   --生一般寶箱
								BeginPlot(OwnerID()  , "Lua_mika_losttreasure_boxtest2" , 0 )   --生綠寶箱
							end
							local treasuredoor = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113621, 2000 , 0)       --寶庫大門
							PlayMotion(treasuredoor, 145) 
							Sleep(100)  --10秒後
							BeginPlot(OwnerID(), "Lua_mika_losttreasure_exit00" , 0 )   --呼叫離開用傳送陣
							Sleep(10)  --30秒後
							local tran = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113615, 3000 , 0)       --遺跡大門
							BeginPlot(tran, "Lua_mika_losttreasure_delnpc2", 0)  --刪除藏寶庫周圍怪
						elseif candle1 == true then --燭臺1已被點燃(此燭臺為第2個)
		--					Sleep(10)
							PlayMotion(TargetID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)  --讓燭臺點燃
							WriteRoleValue(TargetID() , EM_RoleValue_Register, 1 )    --此燭臺已被點燃
							WriteRoleValue(TargetID() , EM_RoleValue_Register, 1 )    --此燭臺已被點燃
							ScriptMessage( OwnerID(), -1  , 1 ,"[SC_LOSTTREASURE_ICE02]" ,0  )--你點燃了第二個[113614]。
							ScriptMessage( OwnerID(), -1  , 0 ,"[SC_LOSTTREASURE_ICE02] " ,0  )--你點燃了第二個[113614]。
							if CheckFlag(OwnerID(), 543497) == true then
								AddBuff( OwnerID() , 505595 , 1, 1200)  --20分鐘 
							else
								AddBuff( OwnerID() , 505595 , 1, 900)  --15分鐘 
							end
							SetFlag(OwnerID(), 543488, 1) --給第2個燭臺KEY
						else --此為第1個燭臺
		--					Sleep(10)
							PlayMotion(TargetID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)  --讓燭臺點燃
							WriteRoleValue(TargetID() , EM_RoleValue_Register, 1 )    --此燭臺已被點燃
							ScriptMessage( OwnerID(), -1  , 1 ,"[SC_LOSTTREASURE_ICE01]" ,0  )--你點燃了第一個[113614]。
							ScriptMessage( OwnerID(), -1  , 0 ,"[SC_LOSTTREASURE_ICE01] " ,0  )--你點燃了第一個[113614]。
							if CheckFlag(OwnerID(), 543497) == true then
								AddBuff( OwnerID() , 505594 , 1, 1200)  --20分鐘 
							else
								AddBuff( OwnerID() , 505594 , 1, 900)  --15分鐘 
							end
							SetFlag(OwnerID(), 543487, 1) --給第1個燭臺KEY
						end
					end
				elseif ( result == "DAME" ) then
					SetPlot( TargetID(),"touch","Lua_mika_losttreasure_blue2",50 )
				end
			end
		end
	end
end


function Lua_mika_losttreasure_test11()
	Say(TargetID(),EM_RoleValue_Register)
end

-----------------------------------------------------------
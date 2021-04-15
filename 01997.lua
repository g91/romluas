function Lua_beerday_na_A_01()
	SetPlot( OwnerID() , "touch" , "Lua_beerday_na_A_02" , 50 ); --設定物件的觸碰劇情，50為範圍
end

function Lua_beerday_na_A_02()
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	local checkcupz = CheckBuff( OwnerID() , 507452)  --空杯
	local checkcupa = CheckBuff( OwnerID() , 507453) --A杯
	local checkcupb = CheckBuff( OwnerID() , 507454)	--B杯
	local checkcupc = CheckBuff( OwnerID() , 507455) --C杯

	DesignLog(O_ID,115822 , "beer A" )  --回傳活動參與值

	if checkcupz or checkcupa or checkcupb or checkcupc ==true then
		if BeginCastBarEvent( OwnerID(), TargetID(),"[SC_BEERDAY_NEW25]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "lua_beerday_na_A_castbar" ) ~= 1 then --20為bar動作時間
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NA_10]" , 0 )	--畫面中間訊息 你身上沒有任何杯子。
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_NA_10]" , 0 )	--訊息欄
	end
end


function Lua_beerday_na_A_castbar(O_ID, CheckStatus)   -- <---() 內 參數一定要有
	local checkcupz = CheckBuff( OwnerID() , 507452)  --空杯
	local checkcupa = CheckBuff( OwnerID() , 507453) --A杯
	local checkcupb = CheckBuff( OwnerID() , 507454)	--B杯
	local checkcupc = CheckBuff( OwnerID() , 507455) --C杯


	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			EndCastBar( O_ID, CheckStatus );

			if checkcupz or checkcupa or checkcupb or checkcupc ==true then
				if checkcupz == true then   --檢查玩家身上是否持有空酒杯
					CancelBuff( OwnerID(), 507452 )  --刪除
					AddBuff( OwnerID(),  507453, 0 , 1800 )	--水果啤酒
					ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NA_01]" ,C_SYSTEM )	--畫面中間訊息 獲得 半杯水果啤酒。

				elseif checkcupa == true then   --檢查玩家身上是否持有空酒杯
					CancelBuff( OwnerID(), 507453)  --刪除A杯BUFF
					AddBuff( OwnerID(), 507456, 0 , 3600 )	--水果啤酒BUFF
					ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NA_02]" ,C_SYSTEM )	--獲得 水果啤酒。
	
				elseif checkcupb == true then   --檢查玩家身上是否持有空酒杯
					CancelBuff( OwnerID(), 507454)  --刪除B杯BUFF
					AddBuff( OwnerID(), 507457, 0 , 3600 )	--香料水果啤酒BUFF	
					ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NA_03]" ,C_SYSTEM )	--獲得 香料水果啤酒。

				elseif checkcupc == true then   --檢查玩家身上是否持有空酒杯
					CancelBuff( OwnerID(), 507455)  --刪除C杯BUFF
					AddBuff( OwnerID(),507458, 0 , 3600 )	--花香水果啤酒BUFF
					ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NA_04]" ,C_SYSTEM )	--獲得 花香水果啤酒。
				end
			end
		else
			-- 失敗
			EndCastBar(O_ID, CheckStatus );
		end
	end
end



function Lua_beerday_na_B_01()
	SetPlot( OwnerID() , "touch" , "Lua_beerday_na_B_02" , 50 ); --設定物件的觸碰劇情，50為範圍
end

function Lua_beerday_na_B_02()
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	local checkcupz = CheckBuff( OwnerID() , 507452)  --空杯
	local checkcupa = CheckBuff( OwnerID() , 507453) --A杯
	local checkcupb = CheckBuff( OwnerID() , 507454)	--B杯
	local checkcupc = CheckBuff( OwnerID() , 507455) --C杯

	DesignLog( O_ID ,115823 , "beer B" )  --回傳活動參與值

	if checkcupz or checkcupa or checkcupb or checkcupc ==true then
		if BeginCastBarEvent( OwnerID(), TargetID(),"[SC_BEERDAY_NEW25]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "lua_beerday_na_B_castbar" ) ~= 1 then --20為bar動作時間
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NA_10]" , 0 )	--畫面中間訊息 你身上沒有任何杯子。
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_NA_10]" , 0 )	--訊息欄
	end
end


function Lua_beerday_na_B_castbar(O_ID, CheckStatus)   -- <---() 內 參數一定要有
	local checkcupz = CheckBuff( OwnerID() , 507452)  --空杯
	local checkcupa = CheckBuff( OwnerID() , 507453) --A杯
	local checkcupb = CheckBuff( OwnerID() , 507454)	--B杯
	local checkcupc = CheckBuff( OwnerID() , 507455) --C杯


	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			EndCastBar( O_ID, CheckStatus );

			if checkcupz or checkcupa or checkcupb or checkcupc ==true then
				if checkcupz == true then   --檢查玩家身上是否持有空酒杯
					CancelBuff( OwnerID(),507452)  --刪除
					AddBuff( OwnerID(), 507454, 0 , 1800 )	--B杯BUFF
					ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NA_08]" ,C_SYSTEM )	--獲得 半杯香料啤酒。

				elseif checkcupa == true then   --檢查玩家身上是否持有空酒杯
					CancelBuff( OwnerID(), 507453)  --刪除A杯BUFF
					AddBuff( OwnerID(), 507457, 0 , 3600 )	--香料水果啤酒BUFF
					ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NA_03]" ,C_SYSTEM )	--獲得 香料水果啤酒。

				elseif checkcupb == true then   --檢查玩家身上是否持有空酒杯
					CancelBuff( OwnerID(), 507454)  --刪除B杯BUFF
					AddBuff( OwnerID(), 507459, 0 , 3600  )	--香料啤酒BUFF	
					ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NA_05]" ,C_SYSTEM )	--獲得 香料啤酒。
	
				elseif checkcupc == true then   --檢查玩家身上是否持有空酒杯
					CancelBuff( OwnerID(), 507455)  --刪除C杯BUFF
					AddBuff( OwnerID(), 507460, 0 , 3600 )	--花朵香料啤酒BUFF
					ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NA_06]" ,C_SYSTEM )	--獲得 花朵香料啤酒。
				end
			end
		else
			-- 失敗
			EndCastBar(O_ID, CheckStatus );
		end
	end
end





function Lua_beerday_na_C_01()
	SetPlot( OwnerID() , "touch" , "Lua_beerday_na_C_02" , 50 ); --設定物件的觸碰劇情，50為範圍
end

function Lua_beerday_na_C_02()
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	local checkcupz = CheckBuff( OwnerID() , 507452)  --空杯
	local checkcupa = CheckBuff( OwnerID() , 507453) --A杯
	local checkcupb = CheckBuff( OwnerID() , 507454)	--B杯
	local checkcupc = CheckBuff( OwnerID() , 507455) --C杯

	DesignLog(O_ID ,115824 , "beer C" )  --回傳活動參與值

	if checkcupz or checkcupa or checkcupb or checkcupc ==true then
		if BeginCastBarEvent( OwnerID(), TargetID(),"[SC_BEERDAY_NEW25]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "lua_beerday_na_C_castbar" ) ~= 1 then --20為bar動作時間
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NA_10]" , 0 )	--畫面中間訊息 你身上沒有任何杯子。
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_NA_10]" , 0 )	--訊息欄
	end
end



function lua_beerday_na_C_castbar(O_ID, CheckStatus)   -- <---() 內 參數一定要有
	local checkcupz = CheckBuff( OwnerID() , 507452)  --空杯
	local checkcupa = CheckBuff( OwnerID() , 507453) --A杯
	local checkcupb = CheckBuff( OwnerID() , 507454)	--B杯
	local checkcupc = CheckBuff( OwnerID() , 507455) --C杯


	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			EndCastBar( O_ID, CheckStatus );

			if checkcupz or checkcupa or checkcupb or checkcupc ==true then
				if checkcupz == true then   --檢查玩家身上是否持有空酒杯
					CancelBuff( OwnerID(), 507452)  --刪除
					AddBuff( OwnerID(), 507455, 0 , 1800 )	--C杯BUFF
					ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NA_09]" ,C_SYSTEM )	--獲得 半杯花香啤酒。
				
				elseif checkcupa == true then   --檢查玩家身上是否持有空酒杯
					CancelBuff( OwnerID(), 507453 )  --刪除A杯BUFF
					AddBuff( OwnerID(), 507458, 0 , 3600 )	--花香水果啤酒BUFF
					ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NA_04]" ,C_SYSTEM )	--獲得 花香水果啤酒。
				
				elseif checkcupb == true then   --檢查玩家身上是否持有空酒杯
					CancelBuff( OwnerID(), 507454)  --刪除B杯BUFF
					AddBuff( OwnerID(),507460, 0 , 3600 )	--花朵香料啤酒BUFF
					ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NA_06]" ,C_SYSTEM )	--獲得 花朵香料啤酒。
				
				elseif checkcupc == true then   --檢查玩家身上是否持有空酒杯
					CancelBuff( OwnerID(),507455 )  --刪除C杯BUFF
					AddBuff( OwnerID(), 507461, 0 , 3600 )	--花香啤酒BUFF
					ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NA_07]" ,C_SYSTEM )	--獲得 花香啤酒。
				end
			end
		else
			-- 失敗
			EndCastBar(O_ID, CheckStatus );
		end
	end
end


--C_SYSTEM 黃色
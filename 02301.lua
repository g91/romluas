--NPC 石槽
--水槽
function Lua_na_waterslot_touch() --水槽觸碰劇情
	SetPlot( OwnerID() , "touch" , "Lua_na_waterslot_touch1" , 50 )
end

function Lua_na_waterslot_touch1()
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC

	if BeginCastBarEvent( OwnerID(), TargetID(),"[SC_WSLOT_01]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_na_waterslot_touch2" ) ~= 1 then --20為bar動作時間 汲取[208307]
		ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 )--目標忙碌中
		return
	end
end



function Lua_na_waterslot_touch2(O_ID, CheckStatus)
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			EndCastBar( O_ID, CheckStatus );
			local X = CountBodyItem( OwnerID(), 208306)
			Say( OwnerID(), X )
			if X == 1 then  --如果身上有汲水葉
				DelBodyItem( OwnerID(), 208306, 1 ) --刪除汲水葉
				GiveBodyItem( OwnerID(), 208307, 1 ) --給予詛咒之水, 生存時間10秒

			elseif CountBodyItem( OwnerID(), 208307) == 1 then  --若玩家身上已經有詛咒之水

				ScriptMessage( OwnerID(), OwnerID(), 0,  "[SC_423154_ITEM]" , C_SYSTEM )  --你已經取得過了。
				ScriptMessage( OwnerID(), OwnerID(), 1,  "[SC_423154_ITEM]" , C_SYSTEM )  --你已經取得過了。
			else 
				ScriptMessage( OwnerID(), OwnerID(), 0,  "[SC_WSLOT_02]" , C_SYSTEM )  --你已經取得過了。
				ScriptMessage( OwnerID(), OwnerID(), 1,  "[SC_WSLOT_02]" , C_SYSTEM )  --你已經取得過了。
			end
		else		-- 失敗
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_FROSTY_NA_15]" , C_SYSTEM )
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_FROSTY_NA_15]" , C_SYSTEM )
			EndCastBar(O_ID, CheckStatus );	
		end
	end
end



function Lua_na_c_regiveleave() --詛咒之水刪除時觸發劇情，再次給汲水葉
	GiveBodyItem( OwnerID(), 208306, 1)
end


function Lua_na_plants_register_clear()
	WriteRoleValue( OwnerID(), EM_RoleValue_Register+8, 0 ) --在物品身上寫入值0
	Say( OwnerID(), "REGISTER CLEAR!")
end



--食料槽
function Lua_na_foodslot_touch() --食料槽觸碰劇情
	SetPlot( OwnerID() , "touch" , "Lua_na_foodslot_touch1" , 50 )
end

function Lua_na_foodslot_touch1()
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC

	if BeginCastBarEvent( OwnerID(), TargetID(),"[SC_FSLOT_01]", 10, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_na_foodslot_touch2" ) ~= 1 then --10為bar動作時間 汲取[208307]
		ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 )--目標忙碌中
		return
	end
end



function Lua_na_foodslot_touch2(O_ID, CheckStatus)
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			EndCastBar( O_ID, CheckStatus );
			local rand1 = rand(3)+1
			if rand1 == 1 then
				GiveBodyItem( OwnerID() , 208303 , 3 ) --給綠晶果
		--		Say( OwnerID(), rand2 )
			elseif rand1 == 2 then  
				GiveBodyItem( OwnerID() , 208304 , 3 ) --給紅晶果
		--		Say( OwnerID(), rand2 )			
			elseif rand1 == 3 then  
				GiveBodyItem( OwnerID() , 208305 , 3 ) --給黃晶果
		--		Say( OwnerID(), rand2 )
			end
		else		-- 失敗
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_PICK_ERROR_NA]" , C_SYSTEM )  --拾取失敗(未翻譯)
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_PICK_ERROR_NA]" , C_SYSTEM )  --拾取失敗
			EndCastBar(O_ID, CheckStatus );	
		end
	end
end




--詛咒之水的劇情
function Lua_na_cursedrop() --使用詛咒之水的效果
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local Monster =  {105125, 105126}
	--Owner = 玩家自己
	--Target=NPC/其它玩家	
	if CheckDistance( OwnerID(), TargetID(), 150 ) == true then
		if OrgID ~= Monster or TargetID() == OwnerID()  then  --目標不是玩家也不是仙人掌
			ScriptMessage( OwnerID(), OwnerID() ,  1 , "[SC_204425_1]" , C_SYSTEM ) --目標不正確
			ScriptMessage( OwnerID(), OwnerID(), 0 , "[SC_204425_1]" , 0 )	--目標不正確	
			return false
		elseif OrgID == Monster then --目標是仙人掌
			return true
		end
	end
	sleep(1)
end
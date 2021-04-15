function LuaI_110363()	--古老的寶箱初始劇情
	SetPlot( OwnerID() , "touch" , "LuaS_110363_1" , 30 );
end

function LuaS_110363_1()
	local result = ""

	if ( CheckAcceptQuest( OwnerID() , 420360 ) == true and CheckAcceptQuest( OwnerID() , 420361 ) == false ) then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110363_02") , 0 )	-- 鎖頭壞了，你打不開這個箱子。
	elseif ( CheckAcceptQuest( OwnerID() , 420361 ) == true and CheckAcceptQuest( OwnerID() , 420362 ) == false ) then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110363_03") , 0 )	-- 你應該要把萬能鑰匙交給索林斯。
	elseif ( CheckAcceptQuest( OwnerID() , 420362 ) == true and CountBodyItem( OwnerID() , 200945 ) >= 1 ) then
		if BeginCastBar( OwnerID(), GetString("CASTBAR_NAME_07") , 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) ~= 1 then	-- 你打開了古老的寶箱，從箱子裡跑出一團東西！
			ScriptMessage( OwnerID(), OwnerID(), 0,"[SAY_NPC_BUSY]"  , 0 );
			return
		end
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
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110363_04") , 0 )
			DelBodyItem ( OwnerID() , 200945, 1 )		-- 萬能鑰匙
			local MoneySlime = LuaFunc_CreateObjByObj ( 100442 , TargetID() )
			SetAttack( MoneySlime , OwnerID() )
			while true do
				if ReadRoleValue( MoneySlime , EM_RoleValue_AttackTargetID ) ~= 0 and CheckID( MoneySlime ) == true then  --檢查是否離開戰鬥
				else
					if CheckID( MoneySlime ) == true then
						DelObj( MoneySlime )
					end
					break		
				end
			Sleep( 60 )	-- 六秒檢查一次	
			end
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110363_01") , 0 )	-- 你看見一個古老的箱子。
	end
end
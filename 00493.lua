function LuaI_110071()
	SetPlot( OwnerID() , "touch" , "LuaQ_110071_CheckItem" , 25 );
	CastSpell( OwnerID(),OwnerID() , 491030 )  -- 出生後幫自己上特效魔法
end

function LuaQ_110071_CheckItem()
	local result = ""

	if CountBodyItem ( OwnerID() , 200895 ) >= 1 then
		if BeginCastBar( OwnerID(), GetString("CASTBAR_NAME_05") , 60 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) ~= 1 then	-- 收集風嗥聲
			ScriptMessage( OwnerID(), OwnerID(), 0,"[SAY_NPC_BUSY]"  , 0 );
			return
		end
			while 1 do
				sleep( 2 );
				local CastBarStatus = CheckCastBar( OwnerID() );

				if ( CastBarStatus ~= 0 ) then 
					if ( CastBarStatus > 0 ) then -- 成功
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
				DelBodyItem ( OwnerID() , 200895 , 1 );
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110071_1") , 0 )	-- 你拿出集音螺，收集風嗥聲！
				GiveBodyItem ( OwnerID() , 200896 , 1 );
			end
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110071_2") , 0 )	-- 你沒有可以收集風嗥聲的物品！
	end
end
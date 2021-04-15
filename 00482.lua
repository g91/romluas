function LuaI_110735()
	SetPlot( OwnerID() , "touch" , "LuaQ_110735_CheckItem" , 25 );
	--CastSpell( OwnerID(),OwnerID() , 491029 )  -- 出生後幫自己上特效魔法
end

function LuaQ_110735_CheckItem()
	local result = ""

	if CountBodyItem ( OwnerID() , 200907 ) >= 1 then
		if BeginCastBar( OwnerID(), GetString("CASTBAR_NAME_08") , 60 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) ~= 1 then	-- 裝入冰雪粉晶
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
				DelBodyItem ( OwnerID() , 200907 , 1 );
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110735_1") , 0 )	-- 你拿出冰製瓶，裝入一些冰雪粉晶！
				GiveBodyItem ( OwnerID() , 200908 , 1 );
			end
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110735_2") , 0 )	-- 你沒有可以裝冰雪粉晶的物品！
	end
end
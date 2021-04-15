function LuaInit_HuiInit()

	SetPlot( OwnerID(),"range","LuaSO_HuiTest_RangePlot",30)

end
--------------------------------------------------------------------------------------------------------------------------
function LuaSO_HuiTest_RangePlot()

	if( RandRange( 0, 1 ) == 1 ) then
		Say( TargetID(), "咪~咪~" );
	end
	-- 可以試著撥放聲音

end
--------------------------------------------------------------------------------------------------------------------------
function LuaQ_HuiTest_BeginPlot()

	-- 現在 OwnerID() 是怪物, Target 是玩家

	local TargetDBID = ReadRoleValue( TargetID(), EM_RoleValue_DBID ) 
	local SelfDBID = ReadRoleValue( OwnerID(), EM_RoleValue_DBID ) 
	Say( OwnerID(), "Target DBID = " .. TargetDBID .. " SelfDBID = " .. SelfDBID );
	
	while 1 do

		-- 測試目標( 玩家 ) 與自己的距離
		if( LuaFunc_PlayerCheck( TargetID() , DBID ) == true and CheckDistance( OwnerID(), TargetID(), 40 ) == true ) then
			 --LuaFunc_PlayerCheck( ItemID , DBID)
			--if( LuaFunc_Player_Alive( TargetID(), TargetDBID, 40 ) == 1 ) then
			Say( OwnerID(), "還在附近" );
		else
			Say( OwnerID(), "不在附近" );
			break;
		end			

		sleep( 500 );
	end
	
	
end
--------------------------------------------------------------------------------------------------------------------------
function LuaItem_ProcessItem()
	
	Say( OwnerID(), "開始使用物品劇情" );

end

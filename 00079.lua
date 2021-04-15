function TEST_Dindin_01( )
	-- OwnerID()	保護的 NPC
	-- TargetID()	執行任務的玩家或隊伍

	-- FlagID		路徑旗子群組代碼
	-- Flag			路徑旗子代碼

 	local FlagID	= 3;
	local FlagCount = GetMoveFlagCount ( FlagID ) - 1;

	Say( OwnerID(), "Flag Count:" .. FlagCount );

	local Flag		= 0;

	while 1 do

		-- DEBUG 用
		--local Owner = Role:new( OwnerID() ) 
		--Say( OwnerID(), "X: " .. Owner:X() .. ", Y:" .. Owner:Z()   );

		if( NPC_MoveToFlag( OwnerID() ,FlagID , Flag , 0 ) == true ) then
			
			-- 測試用
			Say( OwnerID(), "嘻嘻嘻～我走到旗子" .. Flag .. "了");

			-- 到達第三根旗子
			if( Flag == 2 ) then
				
				Say( OwnerID(), "這是第三根旗子，我厲害吧！！" );
				sleep( 30 );
								
				-- 召喚怪物 ( 熊 100002 )
				--local ObjID;

				--ObjID = S_CreateNPC( 100002, 0, 2, 1, 0 );					
				-- 表演劇情和說話
				--Say( ObjID, "你死定了, 看我殺了你!!" );
			
				-- 改變怪物的攻擊方式 ( 未完成 )
				-- SetNPCGroup( ObjID, 1 );
				--sleep( 20 );
				
			end

			-- 檢查是不是到終點了
			if( Flag == 4 ) then

				-- 任務完成
				Say( OwnerID(), "這是第" .. Flag .. "根旗子，好玩～但是要給物品才能過任務！" );

				-- 給予物品狼肉
				S_GiveItem( 200033, 1 );
				
				sleep( 20 );
				
				-- 刪除任務 NPC 
				Say( OwnerID(), "任務結束了，讓一切都重來一遍！" );	-- DEBUG
				S_ResetObj(  OwnerID() );

				break;
			end

			Flag = Flag+1;

		end

		sleep( 1 );

	end
end
function TEST_Quest420025( )
	-- OwnerID()	保護的 NPC
	-- TargetID()	執行任務的玩家或隊伍

	-- FlagID		路徑旗子群組代瑪
	-- Flag			路徑旗子代瑪

 	local FlagID	= 0;
	local FlagCount = GetMoveFlagCount ( FlagID ) - 1;

	Say( OwnerID(), "Flag Count:" .. FlagCount );

	SetRoleCamp( OwnerID(), "Guard" );
	SetFightMode( OwnerID(), 1, 1, 0, 1 );

	local Flag		= 0;

	while 1 do

		-- DEBUG 用
		local Owner = Role:new( OwnerID() ) 
		Say( OwnerID(), "X: " .. Owner:X() .. ", Y:" .. Owner:Z()   );

		if( NPC_MoveToFlag( OwnerID() ,FlagID , Flag , 0 ) == true ) then
			
			-- 測試用
			Say( OwnerID(), "到達旗子: " .. Flag );

			-- 到達事件點 1
			if( Flag == 2 ) then
				
				Say( OwnerID(), "我到達了事件點了, 等待 1秒" );
				sleep( 10 );

				--PlayMotion( OwnerID(), "unarmed_attack01" );


								
				-- 召喚怪物 ( 熊 100002 )
				local ObjID = S_CreateNPC( 100002, 1, 0, 0, 2 );
					
				-- 表演劇情和說話
				Say( ObjID, "你死定了, 看我殺了你!!" );

				sleep( 100 );

				-- 改變怪物的攻擊方式 ( 未完成 )
				-- SetNPCGroup( ObjID, 1 );
				--sleep( 1000 );
				
			end

			-- 檢查是不是到終點了
			if( Flag == 3 ) then

				

				-- 任務完成
				Say( OwnerID(), "End:" .. Flag );

				-- 給予物品
				--GiveBodyItem( TargetID(), 540001, 1 );
				--S_GiveItem( 540030, 1 );
				--S_GiveItem( 200033, 1 );
				
				sleep( 20 );
				
				-- 刪除任務 NPC 
				Say( OwnerID(), "重置" );	-- DEBUG
				S_ResetObj(  OwnerID() );

				break;
			end

			Flag = Flag+1;

		end

		sleep( 1 );

	end
end
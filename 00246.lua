function LuaS_HuiTest_fInit()
	
	SetSpeakDetail( OwnerID(), GetString( "LUAS_TESTSTRING2" ) );  --	教學內文1
	--AddSpeakOption( OwnerID(), TargetID(), "Let game begin!!" , "LuaS_HuiTest_GameBegin",0 )--增加一個選項，教學內文1
	--AddSpeakOption( OwnerID(), TargetID(), "S1" , "LuaS_HuiTest_GameBegin",0 )--增加一個選項，教學內文1


end

-----------------------------------------------------------------------------------------------------------
function LuaS_HuiTest_GameBegin()

	-- 設定 NPC 不能再對話, 不能在接任務
	-- LockNPC( TargetID(), 1 );  -- 鎖住 NPC, 
	--BeginPlot( TargetID(), "LuaQ_HuiTest_StartFire", 0 );	

	local a = xasfasdf();
end

------------------------------------------------------------------------------------------------------------
function LuaQ_HuiTest_StartFire()

	-- 在一分鐘內每五秒產生一個火, 當同時累積到五個火. 便失敗
	-- 用 780040 旗子的位置產生火
	-- OwnerID() NPC
	-- TargetID() Player

	local 	tickCount 	= 0;
	local	objCollect	= {};

	Say( OwnerID(), "Let game begin!" );

	-- 檢查身上有無水桶及裝滿水的水桶
		--local	WaterCount	= CountBodyItem( TargetID(), 201034 ) + CountBodyItem( TargetID(), 201035 );
		
		--if( WaterCount == 0 ) then			
		--	GiveBodyItem( TargetID(), 201034, 1 );
		--end
	

	while 1 do

		-- 產生火	
			local RandFlag 	= Rand( 8 );				
			local ObjID	= CreateObjByFlag( 110007, 780040, RandFlag, 1 );



			AddToPartition( ObjID, 0 );
			SetPlot( ObjID, "Touch", "LuaQ_Touch_Fire", 40 );
			LockObj( ObjID, 1, TargetID() );
			Say( OwnerID(), "烘 ( 模擬火燄聲 )" );
			
			objCollect[ tickCount ] = ObjID;
			tickCount = tickCount + 1;				

			

		-- 對話
			if( tickCount == 1 ) then
				Say( OwnerID(), "看! 起火了, 去那邊水池取水去熄滅那些火!" );
			end	

		
		Sleep( 50 );

		-- 檢查還剩幾隻火
			local AliveCount 	= 0;
			for i=0, ( tickCount -1 ), 1 do


				local ObjID 		= objCollect[ i ];

				if( ObjID ~= nil and CheckID( ObjID ) == true ) then
					AliveCount = AliveCount + 1;
				end					
			end

			if( AliveCount == 3 ) then
				Say( OwnerID(), "火越來越大了! 你到底行不行呀!" );
			end

			if( AliveCount >= 5 ) then
				Say( OwnerID(), "你遜斃了!" );
				break;	-- 跳開迴圈			
			end

		


		if( tickCount == 13 ) then
			Say( OwnerID(), "你成功了! 真不敢相信!" );
			break;
		end
	end

	for i=0, ( tickCount -1 ), 1 do

		local ObjID 		= objCollect[ i ];

		if( ObjID ~= nil and CheckID( ObjID ) == true ) then			
			--DelObj( ObjID );
		end

	end

	-- 檢查玩家是不是還在, 並檢查 DBID 穩合

	-- 回收水桶

	local	WaterCount 	= 0;

	WaterCount		= CountBodyItem( TargetID(), 201034 );
	if( WaterCount ~= 0 ) then			
		DelBodyItem( TargetID(), 201034, WaterCount );
	end

	WaterCount		= CountBodyItem( TargetID(), 201035 );
	if( WaterCount ~= 0 ) then			
		DelBodyItem( TargetID(), 201035, WaterCount );
	end	
	
end
------------------------------------------------------------------------------------------------------------
function LuaQ_Touch_Fire()

	WaterCount		= CountBodyItem( OwnerID(), 201035 );
	if( WaterCount ~= 0 ) then			
		DelBodyItem( OwnerID(), 201035, WaterCount );
		--Say( TargetID(), "阿..我被你弄滅了" );
		ScriptMessage( TargetID(), 0, 0, "火燄熄滅了", 0 );
		DelObj( TargetID() );
	else
		ScriptMessage( TargetID(), OwnerID(), 1, "你身上找不到能熄滅火的東西!", 0 );
	end

end
------------------------------------------------------------------------------------------------------------
function LuaQ_Init_Water()

	SetPlot( OwnerID(), "touch", "LuaQ_Touch_WaterPool", 40 );

end
------------------------------------------------------------------------------------------------------------
function LuaQ_Touch_WaterPool()

	-- 回收水桶

	local	WaterCount 	= 0;
	
	-- 檢查空的水桶
	--WaterCount		= CountBodyItem( OwnerID(), 201034 );
	--if( WaterCount ~= 0 ) then			
	--	DelBodyItem( OwnerID(), 201034, WaterCount );
	--else
	--	ScriptMessage( TargetID(), OwnerID(), 1, "你沒有裝水的容器", 0 );
	--	return;
	--end

	-- 檢查滿的水桶
	WaterCount		= CountBodyItem( OwnerID(), 201035 );
	if( WaterCount ~= 0 ) then
		return;
		--DelBodyItem( OwnerID(), 201035, WaterCount );
	end
	
	-- 給予裝滿水的水桶

		GiveBodyItem( OwnerID(), 201035, 1 );	
end
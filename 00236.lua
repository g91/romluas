function LuaS_110171_0()
	-- 應加入判斷是否是清晨的語法
	if CheckAcceptQuest( OwnerID() , 420216 ) == true and CountBodyItem(OwnerID() , 200668) == 0 then
		SetSpeakDetail( OwnerID(), GetString( "ST_110171_0" ) );
	  	--/*你是隊長請來協助我們滅火的嗎？等等開始冒火後，到旁邊的水缸取水，然後澆灑到火頭上。
	  	--/*動作一定要快，否則火會蔓延開來。

          		--/*準備好了嗎？

		AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110171_1") , "LuaS_110171_1",0 )--/*準備好了
	else
		SetSpeakDetail( OwnerID(), GetString( "ST_110171_1" ) );
	  	--/*很抱歉，我的責任是看守這個地方，不讓一般人隨意進出，請回吧！		
	end
--	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110171_2") , "LuaS_110171_2",0 )--/*結束對話

end
-----------------------------------------------------------------------------------------------------------
function LuaS_110171_1()

	CloseSpeak( OwnerID() );	--關閉對話視窗	
	GiveBodyItem( OwnerID() , 201034 , 1 ) --給予滅火瓶
	--將玩家傳送進入火場
	SetPlot( TargetID() , "touch" , "LuaS_110171_3", 40 )
	BeginPlot( TargetID(), "LuaQ_420216", 0 );	

end
-----------------------------------------------------------------------------------------------------------
function LuaS_110171_2()

	CloseSpeak( OwnerID() );	--關閉對話視窗

end
-----------------------------------------------------------------------------------------------------------
function LuaS_110171_3()

	Say( TargetID() , GetString("SAY_110171") ) --/*請不要在火場旁邊圍觀。

end
-----------------------------------------------------------------------------------------------------------
function LuaQ_420216()

	-- 在一分鐘內每五秒產生一個火, 當同時累積到五個火. 便失敗
	-- 用 780040 旗子的位置產生火
	-- OwnerID() NPC
	-- TargetID() Player

	local 	tickCount 	= 0;
	local	objCollect	= {};
	local DBID = ReadRoleValue( TargetID(), EM_RoleValue_DBID ) 

	Say( OwnerID(), "Let game begin!" );
	sleep(60)

	while 1 do

		-- 產生火	
			local RandFlag 	= Rand( 8 );				
			local ObjID	= CreateObjByFlag( 110007, 780040, RandFlag, 1 );

			AddToPartition( ObjID, 0 );
			SetPlot( ObjID, "Touch", "LuaQ_420216_Fire", 40 );
			Say( ObjID, "烘 ( 模擬火燄聲 )" );
			
			objCollect[ tickCount ] = ObjID;
			tickCount = tickCount + 1;				

			

		-- 對話
			if( tickCount == 1 ) then
				Say( OwnerID(), "看! 起火了, 去那邊水池取水去熄滅那些火!" );
			end	

		
		Sleep( 60 );

		-- 檢查還剩幾隻火
			local AliveCount 	= 0;
			for i=0, ( tickCount -1 ), 1 do

				local ObjID = objCollect[ i ];

				if( ObjID ~= nil and CheckID( ObjID ) == true ) then
					AliveCount = AliveCount + 1;
				end					
			end

			if( AliveCount == 3 ) then
				Say( OwnerID(), "火越來越大了! 你到底行不行呀!" );
			end

			if( AliveCount >= 5 ) then
				-- 檢查玩家是不是還在, 並檢查 DBID 吻合
				if  Luafunc_Player_Alive( TargetID(),DBID,100 ) == true  then
					Say( OwnerID(), "任務失敗!" );
					--將玩家傳回去
				end
				sleep( 50 )
				SetPlot( OwnerID() , "Touch" , "" , 0 ) 
				break;	-- 跳開迴圈			
			end

			if( tickCount == 10 ) then
				Say( OwnerID(), "你成功了! 真不敢相信!" );
				local FireSpr = CreateObjByFlag( 100084 , 780040 , rand(8) , 1 )
				AddToPartition( FireSpr , 0 )
				BeginPlot( FireSpr , "LuaQ_420216_CHECK" , 0 )
				SetAttack( FireSpr , TargetID() )
				break;
			end
	end

	-- 清除所有活著的火
	for i=0, ( tickCount -1 ), 1 do
	 	local ObjID = objCollect[ i ];

		if( ObjID ~= nil and CheckID( ObjID ) == true ) then			
			DelObj( ObjID );
		end

	end

	-- 回收水桶

	local WaterCount = 0;

	WaterCount = CountBodyItem( TargetID(), 201034 );
	if( WaterCount ~= 0 ) then			
		DelBodyItem( TargetID(), 201034, WaterCount );
	end

	WaterCount = CountBodyItem( TargetID(), 201035 );
	if( WaterCount ~= 0 ) then			
		DelBodyItem( TargetID(), 201035, WaterCount );
	end	
	
end
------------------------------------------------------------------------------------------------------------
function LuaQ_420216_Fire()

	local WaterCount = CountBodyItem( OwnerID(), 201035 );
	if( WaterCount ~= 0 ) then
		SetPlot( TargetID(),"touch","LuaFunc_Obj_BUSY",40 ) 	
		sleep( 5 )		
		DelBodyItem( OwnerID(), 201035, WaterCount );
		GiveBodyItem( OwnerID(), 201034, 1 );
		Say( TargetID(), "阿..我被你弄滅了" );
		--ScriptMessage( TargetID(), OwnerID(), 1, GetString("EM_420216_1"), 0 )--/*你成功熄滅了火。
		DelObj( TargetID() );
	else
		--ScriptMessage( TargetID(), OwnerID(), 1, GetString("EM_420216_2"), 0 );
		--/*你身上找不到能熄滅火的東西!
		Say( TargetID(), "你身上找不到能熄滅火的東西!" );
	end

end
------------------------------------------------------------------------------------------------------------
function LuaI_420216_Water()

	SetPlot( OwnerID(), "touch", "LuaQ_420216_WaterPool", 40 );

end
------------------------------------------------------------------------------------------------------------
function LuaQ_420216_WaterPool()

	-- 回收水桶

	local	WaterCount = 0;
	SetPlot( TargetID(),"touch","LuaFunc_Obj_BUSY",40 ) 
	sleep( 5 )
	-- 檢查空的水桶
	WaterCount = CountBodyItem( OwnerID(), 201034 );
	if( WaterCount ~= 0 ) then			
		DelBodyItem( OwnerID(), 201034, WaterCount );

		-- 給予裝滿水的水桶
		GiveBodyItem( OwnerID(), 201035, 1 );	
	else
		-- 檢查滿的水桶
		WaterCount = CountBodyItem( OwnerID(), 201035 );
		if( WaterCount ~= 0 ) then
			--ScriptMessage( TargetID(), OwnerID(), 1, GetString("EM_420216_3"), 0 );
			--/*你沒有多的容器可以裝水
			Say( TargetID() , "你沒有多的容器可以裝水。")
		else
			--ScriptMessage( TargetID(), OwnerID(), 1, GetString("EM_420216_4"), 0 );
			--/*你重新拿了一個水桶。
			Say( TargetID() , "你重新拿了一個水桶。")
			GiveBodyItem( OwnerID(), 201034, 1 );
			WaterCount = CountBodyItem( OwnerID(), 201034 );
		end

	end
	SetPlot( TargetID(), "touch", "LuaQ_420216_WaterPool", 40 );
end
-------------------------------------------------------------------------------------------------------------
function LuaQ_420216_CHECK()
	
	SetPlot( OwnerID() , "Dead" , "LuaI_100084_D" , 40 )
	Sleep(200)

	while 1 do
		sleep(1)
		if ReadRoleValue( OwnerID(), EM_RoleValue_AttackTargetID ) ~= 0 then 
			sleep(60)	-- 六秒檢查一次	
		else
			local Bill = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110171 , 300 )
			SetPlot( Bill[0] , "touch" , "" , 0 )
			DelObj( OwnerID() )
			break	
		end
	sleep(1)
	end

end
-------------------------------------------------------------------------------------------------------------
function LuaI_100084_D()
	
	local Bill = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110171 , 300 )
	if  ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer)  then
		Say( OwnerID() ,"Clear!")
			--將玩家傳回去
	end
	SetPlot( Bill[0] , "touch" , "" , 0 )

end

--107340--透明球

--※ 護衛打打 ※--
function sasa_106904_ShowAttack()
	while true do
		PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_ATTACK_POLEARM , ruFUSION_ACTORSTATE_NORMAL )
		Sleep( 10 )
		PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_ATTACK_POLEARM_SP , ruFUSION_ACTORSTATE_NORMAL )
		Sleep( 10 )
		Sleep( rand( 100 ) )
	end
end

--※ 劇情觸碰字串 ※--
function sasa_107340_range()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	SetPlot( OwnerID() , "range" , "sasa_107340_rangeAI" , 50 )
end

function sasa_107340_rangeAI()		--碰撞物件產生字串
	local AI = TargetID()
	local Num = ReadRoleValue( AI , EM_RoleValue_PID )
	local RoomID = ReadRoleValue ( AI , EM_RoleValue_RoomID )
	--Say( OwnerID() , "Here" )
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) ~= 0 then
		--Say( OwnerID() , "There" )
		if Num == 1 then
			ScriptMessage( OwnerID() , -1 , 2 , "[SC_ZONE149_MONSTER01]" , 2 )
			--你一臉納悶：「那飄浮在空中的生物是？」
			sleep ( 10 )
			DelObj ( AI )
		elseif Num == 2 then
			ScriptMessage( OwnerID() , -1 , 2 , "[SC_ZONE149_MONSTER02]" , 2 )
			--接近深處，氣氛似乎有了轉變……
			sleep(10)
			DelObj ( AI )
		elseif Num == 3 then
			ScriptMessage( OwnerID() , -1 , 2 , "[SC_ZONE149_MONSTER03]" , 2 )
			--一路望去，你看著士兵與被操控者之間，那仍停留在過去般地一切…
			sleep ( 10 )
			DelObj ( AI )
		elseif Num == 4 then
			ScriptMessage( OwnerID() , -1 , 2 , "[SC_ZONE149_MONSTER04]" , 2 )
			--掙脫控制的士兵們，無法解救同伴，也只能不斷地戰鬥！
			sleep ( 10 )
			DelObj ( AI )
		elseif Num == 5 then
			ScriptMessage( OwnerID() , -1 , 2 , "[SC_ZONE149_MONSTER05]" , 2 )
			--偶然間，你發現樓梯上方瀰漫著不尋常的氛圍…
			sleep ( 10 )
			DelObj ( AI )
		end
	end
end

--==============================================================================
--※ 裂縫出怪 ※--

--機關球位置/GM ? zone 149 0 1680 3190 652.8
--X-6,Z-6
--107344--控制器
--Flag--16
function sasa_149_holethemonster()
	local PID = ReadRoleValue( OwnerID() , EM_RoleValue_PID )   --種物件時填入的值
	if PID > 0 then
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )		----讀在哪一層
		local counter = 0
		local mobcount = 0
		local mob = {}
		local DemonID = 106907	--怪魚
		--local R = math.random(3)
		local Touchflag = (PID-1)*8
		local BallA = CreateObjByFlag( 107340 , 780858 , Touchflag+1 , 1 )	--提示球
		SetModeEx( BallA , EM_SetModeType_SearchenemyIgnore , true )--物件不會被搜尋
		SetModeEx( BallA , EM_SetModeType_HideName , true )  		--物件頭上是否顯示名稱
		SetModeEx( BallA , EM_SetModeType_HideMinimap , true )		--物件是否在小地圖上顯示
		SetModeEx( BallA , EM_SetModeType_Searchenemy , false )   	--索敵
		SetModeEx( BallA , EM_SetModeType_Mark , false )			--標記
		SetModeEx( BallA , EM_SetModeType_Fight , false ) 			--砍殺
		SetModeEx( BallA , EM_SetModeType_Move , false )			--移動
		SetModeEx( BallA , EM_SetModeType_ShowRoleHead , true )
		SetModeEx( BallA , EM_SetModeType_Strikback , false )		--反擊
		SetModeEx( BallA , EM_SetModeType_Show , true )				--秀出
		AddToPartition( BallA , Room )
		
		local Crack = CreateObjByFlag( 107343 , 780858 , Touchflag+2 , 1 )	--裂縫
		SetModeEx( Crack , EM_SetModeType_SearchenemyIgnore , true )--物件不會被搜尋
		SetModeEx( Crack , EM_SetModeType_HideName , true )  		--物件頭上是否顯示名稱
		SetModeEx( Crack , EM_SetModeType_HideMinimap , true )		--物件是否在小地圖上顯示
		SetModeEx( Crack , EM_SetModeType_Searchenemy , false )   	--索敵
		SetModeEx( Crack , EM_SetModeType_Mark , false )			--標記
		SetModeEx( Crack , EM_SetModeType_Fight , false ) 			--砍殺
		SetModeEx( Crack , EM_SetModeType_Move , false )			--移動
		SetModeEx( Crack , EM_SetModeType_ShowRoleHead , true )
		SetModeEx( Crack , EM_SetModeType_Strikback , false )		--反擊
		SetModeEx( Crack , EM_SetModeType_Show , true )				--秀出
		AddToPartition( Crack , Room )
		
		local Touch01 = CreateObjByFlag( 114340 , 780858 , Touchflag+3 , 1 )
		SetModeEx( Touch01 , EM_SetModeType_SearchenemyIgnore , true )---物件不會被搜尋
		SetModeEx( Touch01 , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
		SetModeEx( Touch01 , EM_SetModeType_HideMinimap , true )	---物件是否在小地圖上顯示
		SetModeEx( Touch01 , EM_SetModeType_Searchenemy , false )   --索敵
		SetModeEx( Touch01 , EM_SetModeType_Mark , true )			--標記
		SetModeEx( Touch01 , EM_SetModeType_Fight , false ) 		--砍殺
		SetModeEx( Touch01 , EM_SetModeType_Move , false )			--移動
		SetModeEx( Touch01 , EM_SetModeType_ShowRoleHead , false )
		SetModeEx( Touch01 , EM_SetModeType_Strikback , false )		--反擊
		SetModeEx( Touch01 , EM_SetModeType_Show , true )			--秀出
		SetModeEx( Touch01 , EM_SetModeType_NotShowHPMP , false )		--不show血條
		AddToPartition( Touch01 , Room )
		local Touch02 = CreateObjByFlag( 114340 , 780858 , Touchflag+4 , 1 )
		SetModeEx( Touch02 , EM_SetModeType_SearchenemyIgnore , true )---物件不會被搜尋
		SetModeEx( Touch02 , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
		SetModeEx( Touch02 , EM_SetModeType_HideMinimap , true )	---物件是否在小地圖上顯示
		SetModeEx( Touch02 , EM_SetModeType_Searchenemy , false )   --索敵
		SetModeEx( Touch02 , EM_SetModeType_Mark , true )			--標記
		SetModeEx( Touch02 , EM_SetModeType_Fight , false ) 		--砍殺
		SetModeEx( Touch02 , EM_SetModeType_Move , false )			--移動
		SetModeEx( Touch02 , EM_SetModeType_ShowRoleHead , false )
		SetModeEx( Touch02 , EM_SetModeType_Strikback , false )		--反擊
		SetModeEx( Touch02 , EM_SetModeType_Show , true )			--秀出
		SetModeEx( Touch02 , EM_SetModeType_NotShowHPMP , false )		--不show血條
		AddToPartition( Touch02 , Room )
		local Touch03 = CreateObjByFlag( 114340 , 780858 , Touchflag+5 , 1 )
		SetModeEx( Touch03 , EM_SetModeType_SearchenemyIgnore , true )---物件不會被搜尋
		SetModeEx( Touch03 , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
		SetModeEx( Touch03 , EM_SetModeType_HideMinimap , true )	---物件是否在小地圖上顯示
		SetModeEx( Touch03 , EM_SetModeType_Searchenemy , false )   --索敵
		SetModeEx( Touch03 , EM_SetModeType_Mark , true )			--標記
		SetModeEx( Touch03 , EM_SetModeType_Fight , false ) 		--砍殺
		SetModeEx( Touch03 , EM_SetModeType_Move , false )			--移動
		SetModeEx( Touch03 , EM_SetModeType_ShowRoleHead , false )
		SetModeEx( Touch03 , EM_SetModeType_Strikback , false )		--反擊
		SetModeEx( Touch03 , EM_SetModeType_Show , true )			--秀出
		SetModeEx( Touch03 , EM_SetModeType_NotShowHPMP , false )		--不show血條
		AddToPartition( Touch03 , Room )
		local Touch04 = CreateObjByFlag( 114340 , 780858 , Touchflag+6 , 1 )
		SetModeEx( Touch04 , EM_SetModeType_SearchenemyIgnore , true )---物件不會被搜尋
		SetModeEx( Touch04 , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
		SetModeEx( Touch04 , EM_SetModeType_HideMinimap , true )	---物件是否在小地圖上顯示
		SetModeEx( Touch04 , EM_SetModeType_Searchenemy , false )   --索敵
		SetModeEx( Touch04 , EM_SetModeType_Mark , true )			--標記
		SetModeEx( Touch04 , EM_SetModeType_Fight , false ) 		--砍殺
		SetModeEx( Touch04 , EM_SetModeType_Move , false )			--移動
		SetModeEx( Touch04 , EM_SetModeType_ShowRoleHead , false )
		SetModeEx( Touch04 , EM_SetModeType_Strikback , false )		--反擊
		SetModeEx( Touch04 , EM_SetModeType_Show , true )			--秀出
		SetModeEx( Touch04 , EM_SetModeType_NotShowHPMP , false )		--不show血條
		AddToPartition( Touch04 , Room )
		local Touch05 = CreateObjByFlag( 114340 , 780858 , Touchflag+7 , 1 )
		SetModeEx( Touch05 , EM_SetModeType_SearchenemyIgnore , true )---物件不會被搜尋
		SetModeEx( Touch05 , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
		SetModeEx( Touch05 , EM_SetModeType_HideMinimap , true )	---物件是否在小地圖上顯示
		SetModeEx( Touch05 , EM_SetModeType_Searchenemy , false )   --索敵
		SetModeEx( Touch05 , EM_SetModeType_Mark , true )			--標記
		SetModeEx( Touch05 , EM_SetModeType_Fight , false ) 		--砍殺
		SetModeEx( Touch05 , EM_SetModeType_Move , false )			--移動
		SetModeEx( Touch05 , EM_SetModeType_ShowRoleHead , false )
		SetModeEx( Touch05 , EM_SetModeType_Strikback , false )		--反擊
		SetModeEx( Touch05 , EM_SetModeType_Show , true )			--秀出
		SetModeEx( Touch05 , EM_SetModeType_NotShowHPMP , false )		--不show血條
		AddToPartition( Touch05 , Room )
		local Touch06 = CreateObjByFlag( 114340 , 780858 , Touchflag+8 , 1 )
		SetModeEx( Touch06 , EM_SetModeType_SearchenemyIgnore , true )---物件不會被搜尋
		SetModeEx( Touch06 , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
		SetModeEx( Touch06 , EM_SetModeType_HideMinimap , true )	---物件是否在小地圖上顯示
		SetModeEx( Touch06 , EM_SetModeType_Searchenemy , false )   --索敵
		SetModeEx( Touch06 , EM_SetModeType_Mark , true )			--標記
		SetModeEx( Touch06 , EM_SetModeType_Fight , false ) 		--砍殺
		SetModeEx( Touch06 , EM_SetModeType_Move , false )			--移動
		SetModeEx( Touch06 , EM_SetModeType_ShowRoleHead , false )
		SetModeEx( Touch06 , EM_SetModeType_Strikback , false )		--反擊
		SetModeEx( Touch06 , EM_SetModeType_Show , true )			--秀出
		SetModeEx( Touch06 , EM_SetModeType_NotShowHPMP , false )		--不show血條
		AddToPartition( Touch06 , Room )
		local Set = { Touch01 , Touch02 , Touch03 , Touch04 , Touch05 , Touch06 }
		local ScriptSet = { "sasa_107340_TouchAI01" , "sasa_107340_TouchAI02" }
		
		Writerolevalue( OwnerID() , EM_RoleValue_register2 , BallA )	--控制器的2是字串感應
		Writerolevalue( OwnerID() , EM_RoleValue_register3 , Crack )	--控制器的3是裂縫
		Writerolevalue( BallA , EM_RoleValue_register1 , OwnerID() )	--字串感應的1是控制器
		Writerolevalue( BallA , EM_RoleValue_register3 , Crack )		--字串感應的3是裂縫
		
		SetPlot( BallA , "range" , "sasa_107340_holeAI" , 50 )
		
		local lucky = DW_rand(6)										--先選出對的按鈕
		Setplot( Set[lucky] , "touch" , ScriptSet[1] , 30 )
		Writerolevalue( Set[lucky] , EM_RoleValue_register3 , Crack )	--裂縫id寫進按鈕裡
		table.remove( Set , lucky )										--選中的按鈕從table移除
		
		for i = 1 , 5 do
			Setplot( Set[i] , "touch" , ScriptSet[2] , 30 )				--其他按鈕設定會爆炸
			Writerolevalue( Set[i] , EM_RoleValue_register3 , Crack )	--裂縫id寫進按鈕裡
			--table.remove( ScriptSet , num )
			sleep(1)
		end

		while 1 do
			sleep(10)
			if ReadRoleValue ( Crack , EM_RoleValue_register10 ) == 1 then
				counter = counter + 1
				if counter >= 7 then
					if mobcount < 12 then
						mob[table.getn(mob)+1] = star_CreateObj( Crack , DemonID , 0 , 0 , 0 , Room , 0 )	--生怪魚
						counter = 0
						mobcount = mobcount + 1
					end
				end
			else
				mobcount = 0
				counter = 0
				mob = {}
			end
		end
	end
end

function sasa_149_holethemonster_2()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )		----讀在哪一層
	local counter = 0
	local mobcount = 0
	local mob = {}
	local DemonID = 106902	--怪魚
	--local R = math.random(3)
	--local Touchflag = (PID-1)*8
	local BallA = CreateObjByFlag( 107340 , 780858 , 9 , 1 )	--提示球
	SetModeEx( BallA , EM_SetModeType_SearchenemyIgnore , true )--物件不會被搜尋
	SetModeEx( BallA , EM_SetModeType_HideName , true )  		--物件頭上是否顯示名稱
	SetModeEx( BallA , EM_SetModeType_HideMinimap , true )		--物件是否在小地圖上顯示
	SetModeEx( BallA , EM_SetModeType_Searchenemy , false )   	--索敵
	SetModeEx( BallA , EM_SetModeType_Mark , false )			--標記
	SetModeEx( BallA , EM_SetModeType_Fight , false ) 			--砍殺
	SetModeEx( BallA , EM_SetModeType_Move , false )			--移動
	SetModeEx( BallA , EM_SetModeType_ShowRoleHead , true )
	SetModeEx( BallA , EM_SetModeType_Strikback , false )		--反擊
	SetModeEx( BallA , EM_SetModeType_Show , true )				--秀出
	
	AddToPartition( BallA , Room )
	
	local Crack = CreateObjByFlag( 107343 , 780858 , 10 , 1 )	--裂縫
	SetModeEx( Crack , EM_SetModeType_SearchenemyIgnore , true )--物件不會被搜尋
	SetModeEx( Crack , EM_SetModeType_HideName , true )  		--物件頭上是否顯示名稱
	SetModeEx( Crack , EM_SetModeType_HideMinimap , true )		--物件是否在小地圖上顯示
	SetModeEx( Crack , EM_SetModeType_Searchenemy , false )   	--索敵
	SetModeEx( Crack , EM_SetModeType_Mark , false )			--標記
	SetModeEx( Crack , EM_SetModeType_Fight , false ) 			--砍殺
	SetModeEx( Crack , EM_SetModeType_Move , false )			--移動
	SetModeEx( Crack , EM_SetModeType_ShowRoleHead , true )
	SetModeEx( Crack , EM_SetModeType_Strikback , false )		--反擊
	SetModeEx( Crack , EM_SetModeType_Show , true )				--秀出
	AddToPartition( Crack , Room )
	
	local Touch01 = CreateObjByFlag( 114340 , 780858 , 11 , 1 )
	SetModeEx( Touch01 , EM_SetModeType_SearchenemyIgnore , true )---物件不會被搜尋
	SetModeEx( Touch01 , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
	SetModeEx( Touch01 , EM_SetModeType_HideMinimap , true )	---物件是否在小地圖上顯示
	SetModeEx( Touch01 , EM_SetModeType_Searchenemy , false )   --索敵
	SetModeEx( Touch01 , EM_SetModeType_Mark , true )			--標記
	SetModeEx( Touch01 , EM_SetModeType_Fight , false ) 		--砍殺
	SetModeEx( Touch01 , EM_SetModeType_Move , false )			--移動
	SetModeEx( Touch01 , EM_SetModeType_ShowRoleHead , false )
	SetModeEx( Touch01 , EM_SetModeType_Strikback , false )		--反擊
	SetModeEx( Touch01 , EM_SetModeType_Show , true )			--秀出
	SetModeEx( Touch01 , EM_SetModeType_NotShowHPMP , false )		--不show血條
	AddToPartition( Touch01 , Room )
	local Touch02 = CreateObjByFlag( 114340 , 780858 , 12 , 1 )
	SetModeEx( Touch02 , EM_SetModeType_SearchenemyIgnore , true )---物件不會被搜尋
	SetModeEx( Touch02 , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
	SetModeEx( Touch02 , EM_SetModeType_HideMinimap , true )	---物件是否在小地圖上顯示
	SetModeEx( Touch02 , EM_SetModeType_Searchenemy , false )   --索敵
	SetModeEx( Touch02 , EM_SetModeType_Mark , true )			--標記
	SetModeEx( Touch02 , EM_SetModeType_Fight , false ) 		--砍殺
	SetModeEx( Touch02 , EM_SetModeType_Move , false )			--移動
	SetModeEx( Touch02 , EM_SetModeType_ShowRoleHead , false )
	SetModeEx( Touch02 , EM_SetModeType_Strikback , false )		--反擊
	SetModeEx( Touch02 , EM_SetModeType_Show , true )			--秀出
	SetModeEx( Touch02 , EM_SetModeType_NotShowHPMP , false )		--不show血條
	AddToPartition( Touch02 , Room )
	local Touch03 = CreateObjByFlag( 114340 , 780858 , 13 , 1 )
	SetModeEx( Touch03 , EM_SetModeType_SearchenemyIgnore , true )---物件不會被搜尋
	SetModeEx( Touch03 , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
	SetModeEx( Touch03 , EM_SetModeType_HideMinimap , true )	---物件是否在小地圖上顯示
	SetModeEx( Touch03 , EM_SetModeType_Searchenemy , false )   --索敵
	SetModeEx( Touch03 , EM_SetModeType_Mark , true )			--標記
	SetModeEx( Touch03 , EM_SetModeType_Fight , false ) 		--砍殺
	SetModeEx( Touch03 , EM_SetModeType_Move , false )			--移動
	SetModeEx( Touch03 , EM_SetModeType_ShowRoleHead , false )
	SetModeEx( Touch03 , EM_SetModeType_Strikback , false )		--反擊
	SetModeEx( Touch03 , EM_SetModeType_Show , true )			--秀出
	SetModeEx( Touch03 , EM_SetModeType_NotShowHPMP , false )		--不show血條
	AddToPartition( Touch03 , Room )
	local Touch04 = CreateObjByFlag( 114340 , 780858 , 14 , 1 )
	SetModeEx( Touch04 , EM_SetModeType_SearchenemyIgnore , true )---物件不會被搜尋
	SetModeEx( Touch04 , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
	SetModeEx( Touch04 , EM_SetModeType_HideMinimap , true )	---物件是否在小地圖上顯示
	SetModeEx( Touch04 , EM_SetModeType_Searchenemy , false )   --索敵
	SetModeEx( Touch04 , EM_SetModeType_Mark , true )			--標記
	SetModeEx( Touch04 , EM_SetModeType_Fight , false ) 		--砍殺
	SetModeEx( Touch04 , EM_SetModeType_Move , false )			--移動
	SetModeEx( Touch04 , EM_SetModeType_ShowRoleHead , false )
	SetModeEx( Touch04 , EM_SetModeType_Strikback , false )		--反擊
	SetModeEx( Touch04 , EM_SetModeType_Show , true )			--秀出
	SetModeEx( Touch04 , EM_SetModeType_NotShowHPMP , false )		--不show血條
	AddToPartition( Touch04 , Room )
	local Touch05 = CreateObjByFlag( 114340 , 780858 , 15 , 1 )
	SetModeEx( Touch05 , EM_SetModeType_SearchenemyIgnore , true )---物件不會被搜尋
	SetModeEx( Touch05 , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
	SetModeEx( Touch05 , EM_SetModeType_HideMinimap , true )	---物件是否在小地圖上顯示
	SetModeEx( Touch05 , EM_SetModeType_Searchenemy , false )   --索敵
	SetModeEx( Touch05 , EM_SetModeType_Mark , true )			--標記
	SetModeEx( Touch05 , EM_SetModeType_Fight , false ) 		--砍殺
	SetModeEx( Touch05 , EM_SetModeType_Move , false )			--移動
	SetModeEx( Touch05 , EM_SetModeType_ShowRoleHead , false )
	SetModeEx( Touch05 , EM_SetModeType_Strikback , false )		--反擊
	SetModeEx( Touch05 , EM_SetModeType_Show , true )			--秀出
	SetModeEx( Touch05 , EM_SetModeType_NotShowHPMP , false )		--不show血條
	AddToPartition( Touch05 , Room )
	local Touch06 = CreateObjByFlag( 114340 , 780858 , 16 , 1 )
	SetModeEx( Touch06 , EM_SetModeType_SearchenemyIgnore , true )---物件不會被搜尋
	SetModeEx( Touch06 , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
	SetModeEx( Touch06 , EM_SetModeType_HideMinimap , true )	---物件是否在小地圖上顯示
	SetModeEx( Touch06 , EM_SetModeType_Searchenemy , false )   --索敵
	SetModeEx( Touch06 , EM_SetModeType_Mark , true )			--標記
	SetModeEx( Touch06 , EM_SetModeType_Fight , false ) 		--砍殺
	SetModeEx( Touch06 , EM_SetModeType_Move , false )			--移動
	SetModeEx( Touch06 , EM_SetModeType_ShowRoleHead , false )
	SetModeEx( Touch06 , EM_SetModeType_Strikback , false )		--反擊
	SetModeEx( Touch06 , EM_SetModeType_Show , true )			--秀出
	SetModeEx( Touch06 , EM_SetModeType_NotShowHPMP , false )		--不show血條
	AddToPartition( Touch06 , Room )
	local Set = { Touch01 , Touch02 , Touch03 , Touch04 , Touch05 , Touch06 }
	local ScriptSet = { "sasa_107340_TouchAI01" , "sasa_107340_TouchAI02" }
	
	Writerolevalue( OwnerID() , EM_RoleValue_register2 , BallA )	--控制器的2是字串感應
	Writerolevalue( OwnerID() , EM_RoleValue_register3 , Crack )	--控制器的3是裂縫
	Writerolevalue( BallA , EM_RoleValue_register1 , OwnerID() )	--字串感應的1是控制器
	Writerolevalue( BallA , EM_RoleValue_register3 , Crack )		--字串感應的3是裂縫
	
	SetPlot( BallA , "range" , "sasa_107340_holeAI" , 50 )
	
	local lucky = DW_rand(6)										--先選出對的按鈕
	Setplot( Set[lucky] , "touch" , ScriptSet[1] , 30 )
	Writerolevalue( Set[lucky] , EM_RoleValue_register3 , Crack )	--裂縫id寫進按鈕裡
	table.remove( Set , lucky )										--選中的按鈕從table移除
	
	for i = 1 , 5 do
		Setplot( Set[i] , "touch" , ScriptSet[2] , 30 )				--其他按鈕設定會爆炸
		Writerolevalue( Set[i] , EM_RoleValue_register3 , Crack )	--裂縫id寫進按鈕裡
		--table.remove( ScriptSet , num )
		sleep(1)
	end

	while 1 do
		sleep(10)
		if ReadRoleValue ( Crack , EM_RoleValue_register10 ) == 1 then
			counter = counter + 1
			if counter >= 10 then
				if mobcount < 12 then
					mob[table.getn(mob)+1] = star_CreateObj( Crack , DemonID , 0 , 0 , 0 , Room , 0 )	--生怪魚
					counter = 0
					mobcount = mobcount + 1
				end
			end
		else
			mobcount = 0
			counter = 0
			mob = {}
		end
	end
end

function sasa_107340_holeAI()
	local Ball = TargetID()
	local RoomID = ReadRoleValue ( Ball , EM_RoleValue_RoomID )
	local Crack = ReadRoleValue ( Ball , EM_RoleValue_register3 )
	local Mons = star_CreateObj( Crack , 106901 , 0 , 0 , 0 , RoomID , 0)
	--AddToPartition( Mons , RoomID )
	--Say( OwnerID() , "Here" )
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) ~= 0 then
		--Say( OwnerID() , "There" )
		ScriptMessage( OwnerID() , -1 , 2 , "[SC_ZONE149_MONSTER06]" , 2 )
		--前方突然出現奇特的景象，是裂縫！有裂縫…
		sleep ( 20 )
		ScriptMessage( OwnerID() , -1 , 2 , "[SC_ZONE149_MONSTER07]" , 2 )
		--怪物正從裂縫湧出，而兩旁的晶體似乎是關鍵！
		Writerolevalue( Crack , EM_RoleValue_register10 , 1 )
		sleep ( 10 )
		--DelObj ( Ball )
		Hide ( Ball )
	end
end

function sasa_107340_TouchAI01()		--點對關裂縫
	BeginPlot( TargetID() , "sasa_107340_TouchAI01_1" , 0 )
end

function sasa_107340_TouchAI01_1()
	Setplot( OwnerID() , "touch" , "" , 0 )
	sleep(1)
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Crack = ReadRoleValue( OwnerID() , EM_RoleValue_register3 )
	local Light = 499456	--電光
	local PPL = SetSearchAllPlayer(Room)
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_ZONE149_MONSTER08]" , 2 )
	CastSpellLv( OwnerID() , Crack , Light , 0 )
	sleep(20)
	DelObj ( Crack )
	for i = 1 , PPL , 1 do
		local ID = GetSearchResult()
		if ReadRoleValue( ID , EM_RoleValue_RoomID ) == Room then
			if CountBodyItem ( ID , 530932 ) == 0 then
				GiveBodyItem( ID , 530932 , 1 )
			end
		end
	end
end

function sasa_107340_TouchAI02()		--點錯被炸
	BeginPlot( TargetID() , "sasa_107340_TouchAI02_1" , 0)
	WriteRoleValue ( TargetID() , EM_RoleValue_Register4 , OwnerID() )	--透明按鈕的4是玩家
end

function sasa_107340_TouchAI02_1()
	Setplot( OwnerID() , "touch" , "" , 0 )
	local toucher = ReadRoleValue ( OwnerID() , EM_RoleValue_Register4 )
	local LightBomb = 499455	--閃光炸裂
	CastSpellLv( toucher , toucher , LightBomb , 8 )
end



--※ 裂縫出怪 ※--

--機關球位置/GM ? zone 149 0 1680 3190 652.8
--X-6,Z-6
--107344--控制器
--Flag--16
function sasa_149_holethemonster_E()
	local PID = ReadRoleValue( OwnerID() , EM_RoleValue_PID )   --種物件時填入的值
	if PID > 0 then
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )		----讀在哪一層
		local counter = 0
		local mobcount = 0
		local mob = {}
		local DemonID = 107406	--怪魚
		--local R = math.random(3)
		local Touchflag = (PID-1)*8
		local BallA = CreateObjByFlag( 107340 , 780858 , Touchflag+1 , 1 )	--提示球
		SetModeEx( BallA , EM_SetModeType_SearchenemyIgnore , true )--物件不會被搜尋
		SetModeEx( BallA , EM_SetModeType_HideName , true )  		--物件頭上是否顯示名稱
		SetModeEx( BallA , EM_SetModeType_HideMinimap , true )		--物件是否在小地圖上顯示
		SetModeEx( BallA , EM_SetModeType_Searchenemy , false )   	--索敵
		SetModeEx( BallA , EM_SetModeType_Mark , false )			--標記
		SetModeEx( BallA , EM_SetModeType_Fight , false ) 			--砍殺
		SetModeEx( BallA , EM_SetModeType_Move , false )			--移動
		SetModeEx( BallA , EM_SetModeType_ShowRoleHead , true )
		SetModeEx( BallA , EM_SetModeType_Strikback , false )		--反擊
		SetModeEx( BallA , EM_SetModeType_Show , true )				--秀出
		AddToPartition( BallA , Room )
		
		local Crack = CreateObjByFlag( 107343 , 780858 , Touchflag+2 , 1 )	--裂縫
		SetModeEx( Crack , EM_SetModeType_SearchenemyIgnore , true )--物件不會被搜尋
		SetModeEx( Crack , EM_SetModeType_HideName , true )  		--物件頭上是否顯示名稱
		SetModeEx( Crack , EM_SetModeType_HideMinimap , true )		--物件是否在小地圖上顯示
		SetModeEx( Crack , EM_SetModeType_Searchenemy , false )   	--索敵
		SetModeEx( Crack , EM_SetModeType_Mark , false )			--標記
		SetModeEx( Crack , EM_SetModeType_Fight , false ) 			--砍殺
		SetModeEx( Crack , EM_SetModeType_Move , false )			--移動
		SetModeEx( Crack , EM_SetModeType_ShowRoleHead , true )
		SetModeEx( Crack , EM_SetModeType_Strikback , false )		--反擊
		SetModeEx( Crack , EM_SetModeType_Show , true )				--秀出
		AddToPartition( Crack , Room )
		
		local Touch01 = CreateObjByFlag( 114340 , 780858 , Touchflag+3 , 1 )
		SetModeEx( Touch01 , EM_SetModeType_SearchenemyIgnore , true )---物件不會被搜尋
		SetModeEx( Touch01 , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
		SetModeEx( Touch01 , EM_SetModeType_HideMinimap , true )	---物件是否在小地圖上顯示
		SetModeEx( Touch01 , EM_SetModeType_Searchenemy , false )   --索敵
		SetModeEx( Touch01 , EM_SetModeType_Mark , true )			--標記
		SetModeEx( Touch01 , EM_SetModeType_Fight , false ) 		--砍殺
		SetModeEx( Touch01 , EM_SetModeType_Move , false )			--移動
		SetModeEx( Touch01 , EM_SetModeType_ShowRoleHead , false )
		SetModeEx( Touch01 , EM_SetModeType_Strikback , false )		--反擊
		SetModeEx( Touch01 , EM_SetModeType_Show , true )			--秀出
		SetModeEx( Touch01 , EM_SetModeType_NotShowHPMP , false )		--不show血條
		AddToPartition( Touch01 , Room )
		local Touch02 = CreateObjByFlag( 114340 , 780858 , Touchflag+4 , 1 )
		SetModeEx( Touch02 , EM_SetModeType_SearchenemyIgnore , true )---物件不會被搜尋
		SetModeEx( Touch02 , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
		SetModeEx( Touch02 , EM_SetModeType_HideMinimap , true )	---物件是否在小地圖上顯示
		SetModeEx( Touch02 , EM_SetModeType_Searchenemy , false )   --索敵
		SetModeEx( Touch02 , EM_SetModeType_Mark , true )			--標記
		SetModeEx( Touch02 , EM_SetModeType_Fight , false ) 		--砍殺
		SetModeEx( Touch02 , EM_SetModeType_Move , false )			--移動
		SetModeEx( Touch02 , EM_SetModeType_ShowRoleHead , false )
		SetModeEx( Touch02 , EM_SetModeType_Strikback , false )		--反擊
		SetModeEx( Touch02 , EM_SetModeType_Show , true )			--秀出
		SetModeEx( Touch02 , EM_SetModeType_NotShowHPMP , false )		--不show血條
		AddToPartition( Touch02 , Room )
		local Touch03 = CreateObjByFlag( 114340 , 780858 , Touchflag+5 , 1 )
		SetModeEx( Touch03 , EM_SetModeType_SearchenemyIgnore , true )---物件不會被搜尋
		SetModeEx( Touch03 , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
		SetModeEx( Touch03 , EM_SetModeType_HideMinimap , true )	---物件是否在小地圖上顯示
		SetModeEx( Touch03 , EM_SetModeType_Searchenemy , false )   --索敵
		SetModeEx( Touch03 , EM_SetModeType_Mark , true )			--標記
		SetModeEx( Touch03 , EM_SetModeType_Fight , false ) 		--砍殺
		SetModeEx( Touch03 , EM_SetModeType_Move , false )			--移動
		SetModeEx( Touch03 , EM_SetModeType_ShowRoleHead , false )
		SetModeEx( Touch03 , EM_SetModeType_Strikback , false )		--反擊
		SetModeEx( Touch03 , EM_SetModeType_Show , true )			--秀出
		SetModeEx( Touch03 , EM_SetModeType_NotShowHPMP , false )		--不show血條
		AddToPartition( Touch03 , Room )
		local Touch04 = CreateObjByFlag( 114340 , 780858 , Touchflag+6 , 1 )
		SetModeEx( Touch04 , EM_SetModeType_SearchenemyIgnore , true )---物件不會被搜尋
		SetModeEx( Touch04 , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
		SetModeEx( Touch04 , EM_SetModeType_HideMinimap , true )	---物件是否在小地圖上顯示
		SetModeEx( Touch04 , EM_SetModeType_Searchenemy , false )   --索敵
		SetModeEx( Touch04 , EM_SetModeType_Mark , true )			--標記
		SetModeEx( Touch04 , EM_SetModeType_Fight , false ) 		--砍殺
		SetModeEx( Touch04 , EM_SetModeType_Move , false )			--移動
		SetModeEx( Touch04 , EM_SetModeType_ShowRoleHead , false )
		SetModeEx( Touch04 , EM_SetModeType_Strikback , false )		--反擊
		SetModeEx( Touch04 , EM_SetModeType_Show , true )			--秀出
		SetModeEx( Touch04 , EM_SetModeType_NotShowHPMP , false )		--不show血條
		AddToPartition( Touch04 , Room )
		local Touch05 = CreateObjByFlag( 114340 , 780858 , Touchflag+7 , 1 )
		SetModeEx( Touch05 , EM_SetModeType_SearchenemyIgnore , true )---物件不會被搜尋
		SetModeEx( Touch05 , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
		SetModeEx( Touch05 , EM_SetModeType_HideMinimap , true )	---物件是否在小地圖上顯示
		SetModeEx( Touch05 , EM_SetModeType_Searchenemy , false )   --索敵
		SetModeEx( Touch05 , EM_SetModeType_Mark , true )			--標記
		SetModeEx( Touch05 , EM_SetModeType_Fight , false ) 		--砍殺
		SetModeEx( Touch05 , EM_SetModeType_Move , false )			--移動
		SetModeEx( Touch05 , EM_SetModeType_ShowRoleHead , false )
		SetModeEx( Touch05 , EM_SetModeType_Strikback , false )		--反擊
		SetModeEx( Touch05 , EM_SetModeType_Show , true )			--秀出
		SetModeEx( Touch05 , EM_SetModeType_NotShowHPMP , false )		--不show血條
		AddToPartition( Touch05 , Room )
		local Touch06 = CreateObjByFlag( 114340 , 780858 , Touchflag+8 , 1 )
		SetModeEx( Touch06 , EM_SetModeType_SearchenemyIgnore , true )---物件不會被搜尋
		SetModeEx( Touch06 , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
		SetModeEx( Touch06 , EM_SetModeType_HideMinimap , true )	---物件是否在小地圖上顯示
		SetModeEx( Touch06 , EM_SetModeType_Searchenemy , false )   --索敵
		SetModeEx( Touch06 , EM_SetModeType_Mark , true )			--標記
		SetModeEx( Touch06 , EM_SetModeType_Fight , false ) 		--砍殺
		SetModeEx( Touch06 , EM_SetModeType_Move , false )			--移動
		SetModeEx( Touch06 , EM_SetModeType_ShowRoleHead , false )
		SetModeEx( Touch06 , EM_SetModeType_Strikback , false )		--反擊
		SetModeEx( Touch06 , EM_SetModeType_Show , true )			--秀出
		SetModeEx( Touch06 , EM_SetModeType_NotShowHPMP , false )		--不show血條
		AddToPartition( Touch06 , Room )
		local Set = { Touch01 , Touch02 , Touch03 , Touch04 , Touch05 , Touch06 }
		local ScriptSet = { "sasa_107340_TouchAI01" , "sasa_107340_TouchAI02" }
		
		Writerolevalue( OwnerID() , EM_RoleValue_register2 , BallA )	--控制器的2是字串感應
		Writerolevalue( OwnerID() , EM_RoleValue_register3 , Crack )	--控制器的3是裂縫
		Writerolevalue( BallA , EM_RoleValue_register1 , OwnerID() )	--字串感應的1是控制器
		Writerolevalue( BallA , EM_RoleValue_register3 , Crack )		--字串感應的3是裂縫
		
		SetPlot( BallA , "range" , "sasa_107340_holeAI_E" , 50 )
		
		local lucky = DW_rand(6)										--先選出對的按鈕
		Setplot( Set[lucky] , "touch" , ScriptSet[1] , 30 )
		Writerolevalue( Set[lucky] , EM_RoleValue_register3 , Crack )	--裂縫id寫進按鈕裡
		table.remove( Set , lucky )										--選中的按鈕從table移除
		
		for i = 1 , 5 do
			Setplot( Set[i] , "touch" , ScriptSet[2] , 30 )				--其他按鈕設定會爆炸
			Writerolevalue( Set[i] , EM_RoleValue_register3 , Crack )	--裂縫id寫進按鈕裡
			--table.remove( ScriptSet , num )
			sleep(1)
		end

		while 1 do
			sleep(10)
			if ReadRoleValue ( Crack , EM_RoleValue_register10 ) == 1 then
				counter = counter + 1
				if counter >= 7 then
					if mobcount < 12 then
						mob[table.getn(mob)+1] = star_CreateObj( Crack , DemonID , 0 , 0 , 0 , Room , 0 )	--生怪魚
						counter = 0
						mobcount = mobcount + 1
					end
				end
			else
				mobcount = 0
				counter = 0
				mob = {}
			end
		end
	end
end

function sasa_149_holethemonster_2_E()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )		----讀在哪一層
	local counter = 0
	local mobcount = 0
	local mob = {}
	local DemonID = 107401	--怪魚
	--local R = math.random(3)
	--local Touchflag = (PID-1)*8
	local BallA = CreateObjByFlag( 107340 , 780858 , 9 , 1 )	--提示球
	SetModeEx( BallA , EM_SetModeType_SearchenemyIgnore , true )--物件不會被搜尋
	SetModeEx( BallA , EM_SetModeType_HideName , true )  		--物件頭上是否顯示名稱
	SetModeEx( BallA , EM_SetModeType_HideMinimap , true )		--物件是否在小地圖上顯示
	SetModeEx( BallA , EM_SetModeType_Searchenemy , false )   	--索敵
	SetModeEx( BallA , EM_SetModeType_Mark , false )			--標記
	SetModeEx( BallA , EM_SetModeType_Fight , false ) 			--砍殺
	SetModeEx( BallA , EM_SetModeType_Move , false )			--移動
	SetModeEx( BallA , EM_SetModeType_ShowRoleHead , true )
	SetModeEx( BallA , EM_SetModeType_Strikback , false )		--反擊
	SetModeEx( BallA , EM_SetModeType_Show , true )				--秀出
	AddToPartition( BallA , Room )
	
	local Crack = CreateObjByFlag( 107343 , 780858 , 10 , 1 )	--裂縫
	SetModeEx( Crack , EM_SetModeType_SearchenemyIgnore , true )--物件不會被搜尋
	SetModeEx( Crack , EM_SetModeType_HideName , true )  		--物件頭上是否顯示名稱
	SetModeEx( Crack , EM_SetModeType_HideMinimap , true )		--物件是否在小地圖上顯示
	SetModeEx( Crack , EM_SetModeType_Searchenemy , false )   	--索敵
	SetModeEx( Crack , EM_SetModeType_Mark , false )			--標記
	SetModeEx( Crack , EM_SetModeType_Fight , false ) 			--砍殺
	SetModeEx( Crack , EM_SetModeType_Move , false )			--移動
	SetModeEx( Crack , EM_SetModeType_ShowRoleHead , true )
	SetModeEx( Crack , EM_SetModeType_Strikback , false )		--反擊
	SetModeEx( Crack , EM_SetModeType_Show , true )				--秀出
	AddToPartition( Crack , Room )
	
	local Touch01 = CreateObjByFlag( 114340 , 780858 , 11 , 1 )
	SetModeEx( Touch01 , EM_SetModeType_SearchenemyIgnore , true )---物件不會被搜尋
	SetModeEx( Touch01 , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
	SetModeEx( Touch01 , EM_SetModeType_HideMinimap , true )	---物件是否在小地圖上顯示
	SetModeEx( Touch01 , EM_SetModeType_Searchenemy , false )   --索敵
	SetModeEx( Touch01 , EM_SetModeType_Mark , true )			--標記
	SetModeEx( Touch01 , EM_SetModeType_Fight , false ) 		--砍殺
	SetModeEx( Touch01 , EM_SetModeType_Move , false )			--移動
	SetModeEx( Touch01 , EM_SetModeType_ShowRoleHead , false )
	SetModeEx( Touch01 , EM_SetModeType_Strikback , false )		--反擊
	SetModeEx( Touch01 , EM_SetModeType_Show , true )			--秀出
	SetModeEx( Touch01 , EM_SetModeType_NotShowHPMP , false )		--不show血條
	AddToPartition( Touch01 , Room )
	local Touch02 = CreateObjByFlag( 114340 , 780858 , 12 , 1 )
	SetModeEx( Touch02 , EM_SetModeType_SearchenemyIgnore , true )---物件不會被搜尋
	SetModeEx( Touch02 , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
	SetModeEx( Touch02 , EM_SetModeType_HideMinimap , true )	---物件是否在小地圖上顯示
	SetModeEx( Touch02 , EM_SetModeType_Searchenemy , false )   --索敵
	SetModeEx( Touch02 , EM_SetModeType_Mark , true )			--標記
	SetModeEx( Touch02 , EM_SetModeType_Fight , false ) 		--砍殺
	SetModeEx( Touch02 , EM_SetModeType_Move , false )			--移動
	SetModeEx( Touch02 , EM_SetModeType_ShowRoleHead , false )
	SetModeEx( Touch02 , EM_SetModeType_Strikback , false )		--反擊
	SetModeEx( Touch02 , EM_SetModeType_Show , true )			--秀出
	SetModeEx( Touch02 , EM_SetModeType_NotShowHPMP , false )		--不show血條
	AddToPartition( Touch02 , Room )
	local Touch03 = CreateObjByFlag( 114340 , 780858 , 13 , 1 )
	SetModeEx( Touch03 , EM_SetModeType_SearchenemyIgnore , true )---物件不會被搜尋
	SetModeEx( Touch03 , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
	SetModeEx( Touch03 , EM_SetModeType_HideMinimap , true )	---物件是否在小地圖上顯示
	SetModeEx( Touch03 , EM_SetModeType_Searchenemy , false )   --索敵
	SetModeEx( Touch03 , EM_SetModeType_Mark , true )			--標記
	SetModeEx( Touch03 , EM_SetModeType_Fight , false ) 		--砍殺
	SetModeEx( Touch03 , EM_SetModeType_Move , false )			--移動
	SetModeEx( Touch03 , EM_SetModeType_ShowRoleHead , false )
	SetModeEx( Touch03 , EM_SetModeType_Strikback , false )		--反擊
	SetModeEx( Touch03 , EM_SetModeType_Show , true )			--秀出
	SetModeEx( Touch03 , EM_SetModeType_NotShowHPMP , false )		--不show血條
	AddToPartition( Touch03 , Room )
	local Touch04 = CreateObjByFlag( 114340 , 780858 , 14 , 1 )
	SetModeEx( Touch04 , EM_SetModeType_SearchenemyIgnore , true )---物件不會被搜尋
	SetModeEx( Touch04 , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
	SetModeEx( Touch04 , EM_SetModeType_HideMinimap , true )	---物件是否在小地圖上顯示
	SetModeEx( Touch04 , EM_SetModeType_Searchenemy , false )   --索敵
	SetModeEx( Touch04 , EM_SetModeType_Mark , true )			--標記
	SetModeEx( Touch04 , EM_SetModeType_Fight , false ) 		--砍殺
	SetModeEx( Touch04 , EM_SetModeType_Move , false )			--移動
	SetModeEx( Touch04 , EM_SetModeType_ShowRoleHead , false )
	SetModeEx( Touch04 , EM_SetModeType_Strikback , false )		--反擊
	SetModeEx( Touch04 , EM_SetModeType_Show , true )			--秀出
	SetModeEx( Touch04 , EM_SetModeType_NotShowHPMP , false )		--不show血條
	AddToPartition( Touch04 , Room )
	local Touch05 = CreateObjByFlag( 114340 , 780858 , 15 , 1 )
	SetModeEx( Touch05 , EM_SetModeType_SearchenemyIgnore , true )---物件不會被搜尋
	SetModeEx( Touch05 , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
	SetModeEx( Touch05 , EM_SetModeType_HideMinimap , true )	---物件是否在小地圖上顯示
	SetModeEx( Touch05 , EM_SetModeType_Searchenemy , false )   --索敵
	SetModeEx( Touch05 , EM_SetModeType_Mark , true )			--標記
	SetModeEx( Touch05 , EM_SetModeType_Fight , false ) 		--砍殺
	SetModeEx( Touch05 , EM_SetModeType_Move , false )			--移動
	SetModeEx( Touch05 , EM_SetModeType_ShowRoleHead , false )
	SetModeEx( Touch05 , EM_SetModeType_Strikback , false )		--反擊
	SetModeEx( Touch05 , EM_SetModeType_Show , true )			--秀出
	SetModeEx( Touch05 , EM_SetModeType_NotShowHPMP , false )		--不show血條
	AddToPartition( Touch05 , Room )
	local Touch06 = CreateObjByFlag( 114340 , 780858 , 16 , 1 )
	SetModeEx( Touch06 , EM_SetModeType_SearchenemyIgnore , true )---物件不會被搜尋
	SetModeEx( Touch06 , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
	SetModeEx( Touch06 , EM_SetModeType_HideMinimap , true )	---物件是否在小地圖上顯示
	SetModeEx( Touch06 , EM_SetModeType_Searchenemy , false )   --索敵
	SetModeEx( Touch06 , EM_SetModeType_Mark , true )			--標記
	SetModeEx( Touch06 , EM_SetModeType_Fight , false ) 		--砍殺
	SetModeEx( Touch06 , EM_SetModeType_Move , false )			--移動
	SetModeEx( Touch06 , EM_SetModeType_ShowRoleHead , false )
	SetModeEx( Touch06 , EM_SetModeType_Strikback , false )		--反擊
	SetModeEx( Touch06 , EM_SetModeType_Show , true )			--秀出
	SetModeEx( Touch06 , EM_SetModeType_NotShowHPMP , false )		--不show血條
	AddToPartition( Touch06 , Room )
	local Set = { Touch01 , Touch02 , Touch03 , Touch04 , Touch05 , Touch06 }
	local ScriptSet = { "sasa_107340_TouchAI01" , "sasa_107340_TouchAI02" }
	
	Writerolevalue( OwnerID() , EM_RoleValue_register2 , BallA )	--控制器的2是字串感應
	Writerolevalue( OwnerID() , EM_RoleValue_register3 , Crack )	--控制器的3是裂縫
	Writerolevalue( BallA , EM_RoleValue_register1 , OwnerID() )	--字串感應的1是控制器
	Writerolevalue( BallA , EM_RoleValue_register3 , Crack )		--字串感應的3是裂縫
	
	SetPlot( BallA , "range" , "sasa_107340_holeAI_E" , 50 )
	
	local lucky = DW_rand(6)										--先選出對的按鈕
	Setplot( Set[lucky] , "touch" , ScriptSet[1] , 30 )
	Writerolevalue( Set[lucky] , EM_RoleValue_register3 , Crack )	--裂縫id寫進按鈕裡
	table.remove( Set , lucky )										--選中的按鈕從table移除
	
	for i = 1 , 5 do
		Setplot( Set[i] , "touch" , ScriptSet[2] , 30 )				--其他按鈕設定會爆炸
		Writerolevalue( Set[i] , EM_RoleValue_register3 , Crack )	--裂縫id寫進按鈕裡
		--table.remove( ScriptSet , num )
		sleep(1)
	end

	while 1 do
		sleep(10)
		if ReadRoleValue ( Crack , EM_RoleValue_register10 ) == 1 then
			counter = counter + 1
			if counter >= 10 then
				if mobcount < 12 then
					mob[table.getn(mob)+1] = star_CreateObj( Crack , DemonID , 0 , 0 , 0 , Room , 0 )	--生怪魚
					counter = 0
					mobcount = mobcount + 1
				end
			end
		else
			mobcount = 0
			counter = 0
			mob = {}
		end
	end
end

function sasa_107340_holeAI_E()
	local Ball = TargetID()
	local RoomID = ReadRoleValue ( Ball , EM_RoleValue_RoomID )
	local Crack = ReadRoleValue ( Ball , EM_RoleValue_register3 )
	local Mons = star_CreateObj( Crack , 107400 , 0 , 0 , 0 , RoomID , 0)
	AddToPartition( Mons , RoomID )
	--Say( OwnerID() , "Here" )
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) ~= 0 then
		--Say( OwnerID() , "There" )
		ScriptMessage( OwnerID() , -1 , 2 , "[SC_ZONE149_MONSTER06]" , 2 )
		--前方突然出現奇特的景象，是裂縫！有裂縫…
		sleep ( 20 )
		ScriptMessage( OwnerID() , -1 , 2 , "[SC_ZONE149_MONSTER07]" , 2 )
		--怪物正從裂縫湧出，而兩旁的晶體似乎是關鍵！
		Writerolevalue( Crack , EM_RoleValue_register10 , 1 )
		sleep ( 10 )
		--DelObj ( Ball )
		Hide ( Ball )
	end
end
function FollowFlagChangeDir()
	BeginPlot( TargetID(), "FollowFlagChangeDirPlot", 0 ); 
end

function FollowFlagChangeDirPlot()
	
	SetPlot( OwnerID() ,"touch" , "", 0 )
	local X , Y , Z , Dir = DW_Location( OwnerID() )
	Dir = Dir + 90
	if Dir > 360 then
		Dir = Dir -360
	end
	--say( OwnerID() , "Dir="..Dir )
	--AdjustDir( OwnerID() , Dir )
	SetDir( OwnerID(), Dir )
	sleep( 5 )
	SetPlot( OwnerID() ,"touch" , "FollowFlagChangeDir", 20 )

end

function RedHatandWolfRUN()

	local FollowID = 122770	-- 可轉路標(蘑菇人)
	local BlockID = 122771	-- 不可轉路標(寵物蘑菇人)
	local RedHatID = 122772	-- 小紅帽(小女孩)
	local WolfID = 122773	-- 大野狼(紅巨狼)
	local FollowFlagID = 781334	-- 可轉旗標
	local BlockFlagID = 781335	-- 不可轉旗標

	local DefaultDir = { 90 , 180, 270, 0 }		-- 初始讓路形成一個迴圈

	local FollowFlagNum = GetMoveFlagCount( FollowFlagID )	-- 取得旗子總數
	local Follow = {}	-- 可轉路標陣列
	for i = 1, FollowFlagNum , 1 do
		Follow[i] = CreateObjByFlag( FollowID , FollowFlagID , i-1 , 1 );
		MoveToFlagEnabled( Follow[i] , false )
		WriteRoleValue( Follow[i] , EM_RoleValue_Dir , DefaultDir[i]  )
		AddToPartition( Follow[i] , 0 );
		SetPlot( Follow[i] ,"touch" , "FollowFlagChangeDir", 20 )
	end

	local BlockFlagNum = GetMoveFlagCount( BlockFlagID )	-- 取得旗子總數
	local Block = {}	-- 不可轉路標陣列
	for i = 1, BlockFlagNum , 1 do
		Block[i] = CreateObjByFlag( BlockID , BlockFlagID , i-1 , 1 );
		AddToPartition( Block[i] , 0 );
	end

	local RedHat = CreateObjByFlag( RedHatID , BlockFlagID , 0 , 1 );	-- 小紅帽誕生
	WriteRoleValue( RedHat , EM_RoleValue_IsWalk , 1 )
	MoveToFlagEnabled( RedHat , false );
	AddToPartition( RedHat , 0 );				-- 加入顯示
	say( RedHat , "Create RedHat !" )	-- 測試訊息，小紅帽有成功誕生就會自己說話
	CallPlot( RedHat , "OBJRUNRUN" , Follow , Block )

	local Wolf = CreateObjByFlag( WolfID , BlockFlagID , 6 , 1 );	-- 大野狼誕生
	WriteRoleValue( Wolf , EM_RoleValue_IsWalk , 1 )
	MoveToFlagEnabled( Wolf , false );
	AddToPartition( Wolf , 0 );				-- 加入顯示
	say( Wolf , "Create Wolf !" )	-- 測試訊息，大野狼有成功誕生就會自己說話
	CallPlot( Wolf , "OBJRUNRUN2" , Follow , Block )

	sleep( 600 )

	for i = 1, FollowFlagNum , 1 do	-- 測試完刪除
		delobj( Follow[i] );
	end

	for j = 1, BlockFlagNum , 1 do	-- 測試完刪除
		delobj( Block[j] );
	end

	delobj ( RedHat )
	sleep( 1 )
	delobj ( Wolf )
	sleep( 1 )

end

function OBJRUNRUN( Follow , Block )

	local OBJ = OwnerID()

	local FollowFlagNum = table.maxn( Follow )	-- 取得旗子總數
	local BlockFlagNum =  table.maxn( Block )	-- 取得旗子總數

	local Distance = 5
	local X , Y , Z , Dir = DW_Location( OBJ )

	local NowFollow = 0	-- 現在所在指示路標
	local NowBlock = 0	-- 現在所在返回路標
	
	for i = 1,500,1 do	-- 跑跑迴圈
		X = X+(Distance*math.sin(math.rad(Dir+90)))
		Z = Z+(Distance*math.cos(math.rad(Dir+90)))
		local OBJRUN = MoveDirect( OBJ , X,Y,Z )
		sleep( OBJRUN )

		for j = 1, FollowFlagNum , 1 do	-- 判斷小紅帽跟所有指示路標的距離
			if CheckDistance( OBJ , Follow[j] , 20 ) then
				if NowFollow ~= Follow[j] then
					NowFollow = Follow[j]
					local FollowX , FollowY , FollowZ , FollowDir = DW_Location( Follow[j] )
					Say( OBJ , "Find a Follow ! and TURN Dir" )
					local OBJAppear = MoveDirect( OBJ , FollowX , FollowY , FollowZ )
					sleep( OBJAppear )
					X = FollowX
					Y = FollowY 
					Z = FollowZ 
					Dir = FollowDir
				end
			else
				--say( OBJ , "I Can't Find FOLLOW" )
			end
		end
		for k = 1, BlockFlagNum , 1 do	-- 判斷小紅帽跟所有返回路標的距離
			if CheckDistance( OBJ , Block[k] , 20 ) then
				if NowBlock ~= Block[k] then
					NowBolck = Block[k]
					NowFollow = 0
					local BlockX , BlockY , BlockZ , BlockDir = DW_Location( Block[k] )
					Say( OBJ , "Find a Block ! and Back" )
					local OBJBack = MoveDirect( OBJ , BlockX , BlockY , BlockZ )
					sleep( OBJBack )
					X = BlockX 
					Y = BlockY 
					Z = BlockZ 
					Dir = BlockDir
				end
			else
				--say( OBJ , "I Can't Find FOLLOW" )
			end
		end
	end
end

function OBJRUNRUN2( Follow , Block )

	local OBJ2 = OwnerID()

	local FollowFlagNum2 = table.maxn( Follow )	-- 取得旗子總數
	local BlockFlagNum2 =  table.maxn( Block )	-- 取得旗子總數

	local Distance = 5
	local X2 , Y2 , Z2 , Dir2 = DW_Location( OBJ2 )

	local NowFollow2 = 0	-- 現在所在指示路標
	local NowBlock2 = 0	-- 現在所在返回路標
	
	for i = 1,500,1 do	-- 跑跑迴圈
		X2 = X2+(Distance*math.sin(math.rad(Dir2+90)))
		Z2 = Z2+(Distance*math.cos(math.rad(Dir2+90)))
		local OBJRUN2 = MoveDirect( OBJ2 , X2,Y2,Z2 )
		sleep( OBJRUN2 )

		for j = 1, FollowFlagNum2 , 1 do	-- 判斷小紅帽跟所有指示路標的距離
			if CheckDistance( OBJ2 , Follow[j] , 20 ) then
				if NowFollow2 ~= Follow[j] then
					NowFollow2 = Follow[j]
					local FollowX2 , FollowY2 , FollowZ2 , FollowDir2 = DW_Location( Follow[j] )
					Say( OBJ2 , "Find a Follow ! and TURN Dir" )
					local OBJAppear2 = MoveDirect( OBJ2 , FollowX2 , FollowY2 , FollowZ2 )
					sleep( OBJAppear2 )
					X2 = FollowX2
					Y2 = FollowY2 
					Z2 = FollowZ2 
					Dir2 = FollowDir2
				end
			else
				--say( OBJ2 , "I Can't Find FOLLOW" )
			end
		end
		for k = 1, BlockFlagNum2 , 1 do	-- 判斷小紅帽跟所有返回路標的距離
			if CheckDistance( OBJ2 , Block[k] , 20 ) then
				if NowBolck2 ~= Block[k] then
					NowBolck2 = Block[k]
					NowFollow2 = 0
					local BlockX2 , BlockY2 , BlockZ2 , BlockDir2 = DW_Location( Block[k] )
					Say( OBJ2 , "Find a Block ! and Back" )
					local OBJBack2 = MoveDirect( OBJ2 , BlockX2 , BlockY2 , BlockZ2 )
					sleep( OBJBack2 )
					X2 = BlockX2 
					Y2 = BlockY2 
					Z2 = BlockZ2 
					Dir2 = BlockDir2
				end
			else
				--say( OBJ , "I Can't Find FOLLOW" )
			end
		end
	end
end
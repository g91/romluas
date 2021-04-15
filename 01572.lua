
function Lua_cang_119_wall_01()	--發動 觸發
	SetPlot( OwnerID() , "range" , "Lua_cang_119_wall_02" , 150 )
end

function Lua_cang_119_wall_02()
	SetPlot( TargetID(),"range", "" ,0 )
	BeginPlot( TargetID(), "Lua_cang_119_wall_03", 10)
end

function Lua_cang_119_wallclose_01()	--關閉 觸發
	SetPlot( OwnerID() , "range" , "Lua_cang_119_wallclose_02" , 50 )
end
	
function Lua_cang_119_wallclose_02()	--關閉 刪除啟動物件
	WriteRoleValue( TargetID() ,EM_RoleValue_Register1, 1)	
	Sleep(400)
	DelObj(TargetID())
end

function Lua_cang_119_wall_03()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Close = CreateObjByFlag( 102819, 780474, 0, 1)	--招換
	SetModeEx( Close   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Close   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Close   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Close   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Close   , EM_SetModeType_Move, false )--移動
	SetModeEx( Close   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Close   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Close   , EM_SetModeType_HideName, false )--名稱
	DelFromPartition( Close )
	AddToPartition( Close , RoomID )	--加進舞台	
	BeginPlot(Close,"Lua_cang_119_wallclose_01",0)
	BeginPlot(Close,"Lua_cang_119_wall_04_1",0)
	WriteRoleValue( Close ,EM_RoleValue_Register1, 0)
end	

function Lua_cang_119_wall_04_1()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Temp = {}
	for i=1,32,1 do 
		Temp[i]=CreateObjByFlag( 102820, 780474, i,1)
		SetModeEx( Temp[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( Temp[i] , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( Temp[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( Temp[i] , EM_SetModeType_Mark, false )--標記
		SetModeEx( Temp[i] , EM_SetModeType_Move, false )--移動
		SetModeEx( Temp[i] , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( Temp[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( Temp[i] , EM_SetModeType_HideName, false )--名稱
		SetModeEx( Temp[i] , EM_SetModeType_Show,true )--名稱
		AddToPartition( Temp[i] , RoomID )
	end
	while true do
		Sleep(10)
		local Close = ReadRoleValue( OwnerID() ,EM_RoleValue_Register1)	
		local RND1 =  Rand( 100 )+1	-- 產生亂數	
		local RND2 =  Rand( 100 )+1	-- 產生亂數	
		local RND3 =  Rand( 100 )+1	-- 產生亂數	
		local RND4 =  Rand( 100 )+1	-- 產生亂數	
		local RND5 =  Rand( 100 )+1	-- 產生亂數	
		local RND6 =  Rand( 100 )+1	-- 產生亂數	
		local RND7 =  Rand( 100 )+1	-- 產生亂數	
		local RND8 =  Rand( 100 )+1	-- 產生亂數	
		if Close == 0 then
			if RND1 <= 100 and RND1 > 75 then
				CastSpellLV( Temp[1]  , OwnerID() , 494437 , 1 )
			elseif RND1 <= 75 and RND1 > 50 then
				CastSpellLV( Temp[2] , OwnerID() , 494437 , 1 )
			elseif RND1 <= 50 and RND1 > 25 then
				CastSpellLV( Temp[3] , OwnerID() , 494437 , 1 )
			elseif RND1 <= 25 and RND1 > 0 then
				CastSpellLV( Temp[4] , OwnerID() , 494437 , 1 )
			end		
			if RND2 <= 100 and RND2 > 75 then
				CastSpellLV( Temp[5]  , OwnerID() , 494437 , 1 )
			elseif RND2 <= 75 and RND2 > 50 then
				CastSpellLV( Temp[6] , OwnerID() , 494437 , 1 )
			elseif RND2 <= 50 and RND2 > 25 then
				CastSpellLV( Temp[7] , OwnerID() , 494437 , 1 )
			elseif RND2 <= 25 and RND2 > 0 then
				CastSpellLV( Temp[8] , OwnerID() , 494437 , 1 )
			end				
			if RND3 <= 100 and RND3 > 75 then
				CastSpellLV( Temp[9]  , OwnerID() , 494437 , 1 )
			elseif RND3 <= 75 and RND3 > 50 then
				CastSpellLV( Temp[10] , OwnerID() , 494437 , 1 )
			elseif RND3 <= 50 and RND3 > 25 then
				CastSpellLV( Temp[11] , OwnerID() , 494437 , 1 )
			elseif RND3 <= 25 and RND3 > 0 then
				CastSpellLV( Temp[12] , OwnerID() , 494437 , 1 )
			end		
			if RND4 <= 100 and RND4 > 75 then
				CastSpellLV( Temp[13]  , OwnerID() , 494437 , 1 )
			elseif RND4 <= 75 and RND4 > 50 then
				CastSpellLV( Temp[14] , OwnerID() , 494437 , 1 )
			elseif RND4 <= 50 and RND4 > 25 then
				CastSpellLV( Temp[15] , OwnerID() , 494437 , 1 )
			elseif RND4 <= 25 and RND4 > 0 then
				CastSpellLV( Temp[16] , OwnerID() , 494437 , 1 )
			end
			if RND5 <= 100 and RND5 > 75 then
				CastSpellLV( Temp[17]  , OwnerID() , 494437 , 1 )
			elseif RND5 <= 75 and RND5 > 50 then
				CastSpellLV( Temp[18] , OwnerID() , 494437 , 1 )
			elseif RND5 <= 50 and RND5 > 25 then
				CastSpellLV( Temp[19] , OwnerID() , 494437 , 1 )
			elseif RND5 <= 25 and RND5 > 0 then
				CastSpellLV( Temp[20] , OwnerID() , 494437 , 1 )
			end	
			if RND6 <= 100 and RND6 > 75 then
				CastSpellLV( Temp[21]  , OwnerID() , 494437 , 1 )
			elseif RND6 <= 75 and RND6 > 50 then
				CastSpellLV( Temp[22] , OwnerID() , 494437 , 1 )
			elseif RND6 <= 50 and RND6 > 25 then
				CastSpellLV( Temp[23] , OwnerID() , 494437 , 1 )
			elseif RND6 <= 25 and RND6 > 0 then
				CastSpellLV( Temp[24] , OwnerID() , 494437 , 1 )
			end		
			if RND7 <= 100 and RND7 > 75 then
				CastSpellLV( Temp[25]  , OwnerID() , 494437 , 1 )
			elseif RND7 <= 75 and RND7 > 50 then
				CastSpellLV( Temp[26] , OwnerID() , 494437 , 1 )
			elseif RND7 <= 50 and RND7 > 25 then
				CastSpellLV( Temp[27] , OwnerID() , 494437 , 1 )
			elseif RND7 <= 25 and RND7 > 0 then
				CastSpellLV( Temp[28] , OwnerID() , 494437 , 1 )
			end
			if RND8 <= 100 and RND8 > 75 then
				CastSpellLV( Temp[29]  , OwnerID() , 494437 , 1 )
			elseif RND8 <= 75 and RND8 > 50 then
				CastSpellLV( Temp[30] , OwnerID() , 494437 , 1 )
			elseif RND8 <= 50 and RND8 > 25 then
				CastSpellLV( Temp[31] , OwnerID() , 494437 , 1 )
			elseif RND8 <= 25 and RND8 > 0 then
				CastSpellLV( Temp[32] , OwnerID() , 494437 , 1 )
			end
		elseif Close == 1 then
			for i=1,32,1 do
				sleep(10)
				Delobj( Temp[i] )
			end	
		end		
	end
end	
----------------------------------------------------------------------------------------------------------------

function Lua_cang_119_wall2_01()	--發動 觸發
	SetPlot( OwnerID() , "range" , "Lua_cang_119_wall2_02" , 150 )
end

function Lua_cang_119_wall2_02()
	SetPlot( TargetID(),"range", "" ,0 )
	BeginPlot( TargetID(), "Lua_cang_119_wall2_03", 10)
end

function Lua_cang_119_wallclose2_01()	--關閉 觸發
	SetPlot( OwnerID() , "range" , "Lua_cang_119_wallclose2_02" , 50 )
end
	
function Lua_cang_119_wallclose2_02()	--關閉 刪除啟動物件
	WriteRoleValue( TargetID() ,EM_RoleValue_Register1, 1)	
	Sleep(400)
	DelObj(TargetID())
end

function Lua_cang_119_wall2_03()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Close = CreateObjByFlag( 102819, 780478 , 0, 1)	--招換
	SetModeEx( Close   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Close   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Close   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Close   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Close   , EM_SetModeType_Move, false )--移動
	SetModeEx( Close   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Close   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Close   , EM_SetModeType_HideName, false )--名稱
	DelFromPartition( Close )
	AddToPartition( Close , RoomID )	--加進舞台	
	BeginPlot(Close,"Lua_cang_119_wallclose2_01",0)
	BeginPlot(Close,"Lua_cang_119_wall2_04_1",0)
	WriteRoleValue( Close ,EM_RoleValue_Register1, 0)
end	

function Lua_cang_119_wall2_04_1()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Temp = {}
	for i=1,32,1 do 	
		Temp[i]=CreateObjByFlag( 102820, 780478, i,1)
		SetModeEx( Temp[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( Temp[i] , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( Temp[i] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( Temp[i] , EM_SetModeType_Mark, false )--標記
		SetModeEx( Temp[i] , EM_SetModeType_Move, false )--移動
		SetModeEx( Temp[i] , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( Temp[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( Temp[i] , EM_SetModeType_HideName, false )--名稱
		SetModeEx( Temp[i] , EM_SetModeType_Show,true )--名稱
		AddToPartition( Temp[i] , RoomID )
	end
	while true do
		Sleep(10)
		local Close = ReadRoleValue( OwnerID() ,EM_RoleValue_Register1)	
		local RND1 =  Rand( 100 )+1	-- 產生亂數	
		local RND2 =  Rand( 100 )+1	-- 產生亂數	
		local RND3 =  Rand( 100 )+1	-- 產生亂數	
		local RND4 =  Rand( 100 )+1	-- 產生亂數	
		local RND5 =  Rand( 100 )+1	-- 產生亂數	
		local RND6 =  Rand( 100 )+1	-- 產生亂數	
		local RND7 =  Rand( 100 )+1	-- 產生亂數	
		local RND8 =  Rand( 100 )+1	-- 產生亂數	
		if Close == 0 then
			if RND1 <= 100 and RND1 > 75 then
				CastSpellLV( Temp[1]  , OwnerID() , 494437 , 1 )
			elseif RND1 <= 75 and RND1 > 50 then
				CastSpellLV( Temp[2] , OwnerID() , 494437 , 1 )
			elseif RND1 <= 50 and RND1 > 25 then
				CastSpellLV( Temp[3] , OwnerID() , 494437 , 1 )
			elseif RND1 <= 25 and RND1 > 0 then
				CastSpellLV( Temp[4] , OwnerID() , 494437 , 1 )
			end		
			if RND2 <= 100 and RND2 > 75 then
				CastSpellLV( Temp[5]  , OwnerID() , 494437 , 1 )
			elseif RND2 <= 75 and RND2 > 50 then
				CastSpellLV( Temp[6] , OwnerID() , 494437 , 1 )
			elseif RND2 <= 50 and RND2 > 25 then
				CastSpellLV( Temp[7] , OwnerID() , 494437 , 1 )
			elseif RND2 <= 25 and RND2 > 0 then
				CastSpellLV( Temp[8] , OwnerID() , 494437 , 1 )
			end				
			if RND3 <= 100 and RND3 > 75 then
				CastSpellLV( Temp[9]  , OwnerID() , 494437 , 1 )
			elseif RND3 <= 75 and RND3 > 50 then
				CastSpellLV( Temp[10] , OwnerID() , 494437 , 1 )
			elseif RND3 <= 50 and RND3 > 25 then
				CastSpellLV( Temp[11] , OwnerID() , 494437 , 1 )
			elseif RND3 <= 25 and RND3 > 0 then
				CastSpellLV( Temp[12] , OwnerID() , 494437 , 1 )
			end		
			if RND4 <= 100 and RND4 > 75 then
				CastSpellLV( Temp[13]  , OwnerID() , 494437 , 1 )
			elseif RND4 <= 75 and RND4 > 50 then
				CastSpellLV( Temp[14] , OwnerID() , 494437 , 1 )
			elseif RND4 <= 50 and RND4 > 25 then
				CastSpellLV( Temp[15] , OwnerID() , 494437 , 1 )
			elseif RND4 <= 25 and RND4 > 0 then
				CastSpellLV( Temp[16] , OwnerID() , 494437 , 1 )
			end
			if RND5 <= 100 and RND5 > 75 then
				CastSpellLV( Temp[17]  , OwnerID() , 494437 , 1 )
			elseif RND5 <= 75 and RND5 > 50 then
				CastSpellLV( Temp[18] , OwnerID() , 494437 , 1 )
			elseif RND5 <= 50 and RND5 > 25 then
				CastSpellLV( Temp[19] , OwnerID() , 494437 , 1 )
			elseif RND5 <= 25 and RND5 > 0 then
				CastSpellLV( Temp[20] , OwnerID() , 494437 , 1 )
			end	
			if RND6 <= 100 and RND6 > 75 then
				CastSpellLV( Temp[21]  , OwnerID() , 494437 , 1 )
			elseif RND6 <= 75 and RND6 > 50 then
				CastSpellLV( Temp[22] , OwnerID() , 494437 , 1 )
			elseif RND6 <= 50 and RND6 > 25 then
				CastSpellLV( Temp[23] , OwnerID() , 494437 , 1 )
			elseif RND6 <= 25 and RND6 > 0 then
				CastSpellLV( Temp[24] , OwnerID() , 494437 , 1 )
			end		
			if RND7 <= 100 and RND7 > 75 then
				CastSpellLV( Temp[25]  , OwnerID() , 494437 , 1 )
			elseif RND7 <= 75 and RND7 > 50 then
				CastSpellLV( Temp[26] , OwnerID() , 494437 , 1 )
			elseif RND7 <= 50 and RND7 > 25 then
				CastSpellLV( Temp[27] , OwnerID() , 494437 , 1 )
			elseif RND7 <= 25 and RND7 > 0 then
				CastSpellLV( Temp[28] , OwnerID() , 494437 , 1 )
			end
			if RND8 <= 100 and RND8 > 75 then
				CastSpellLV( Temp[29]  , OwnerID() , 494437 , 1 )
			elseif RND8 <= 75 and RND8 > 50 then
				CastSpellLV( Temp[30] , OwnerID() , 494437 , 1 )
			elseif RND8 <= 50 and RND8 > 25 then
				CastSpellLV( Temp[31] , OwnerID() , 494437 , 1 )
			elseif RND8 <= 25 and RND8 > 0 then
				CastSpellLV( Temp[32] , OwnerID() , 494437 , 1 )
			end
		elseif Close == 1 then
			for i=1,32,1 do
				sleep(10)
				Delobj( Temp[i] )
			end	
		end		
	end
end	
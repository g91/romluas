function LuaYU_101489_0()   --生出地板
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
 	local floor = CreateObjByFlag( 101471, 780201, 0 , 1 );  --地板引導者
	AddToPartition( floor, RoomID) 

	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_PID  )  
	WriteRoleValue( floor , EM_RoleValue_PID , PlayerLV )   

		SetModeEx( floor    , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( floor    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( floor    , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( floor    , EM_SetModeType_Mark, false )--標記
		SetModeEx( floor    , EM_SetModeType_Move, false )--移動
		SetModeEx( floor    , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( floor    , EM_SetModeType_HideName, true )--名稱
		SetModeEx( floor   , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( floor   , EM_SetModeType_Show , false ) --不顯示
		SetModeEx( floor   , EM_SetModeType_Fight , false )--可砍殺攻擊

		Hide( floor )
		Show( floor ,RoomID)

	BeginPlot( floor , "LuaYuyu_floor_matrix" , 0 )  
end

function LuaYU_101489_1()  --生出機關模型
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local F={}  --機關模型

	local P = 100
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_PID  )  
	local MonsterLV 
		if PlayerLV <= 4 then
			MonsterLV = 5
		else
			MonsterLV = PlayerLV - (PlayerLV%5)
		end
--	Say(Player, "1 PlayerLV = "..PlayerLV )
--	Say(Player, "1 MonsterLV = "..MonsterLV )

	for k = 0, 19 do  -- 0 ~ 19
		F[k]  = CreateObjByFlag( 101489, 780235, (k+1) , 1 );
		WriteRoleValue( F[k] , EM_RoleValue_LV , MonsterLV )	-- 設定怪物等級
		SetModeEx( F[k]    , EM_SetModeType_Strikback, false )--反擊
		SetFightMode(  F[k] , 0, 0, 0, 1 )
		AddToPartition( F[k], RoomID) 
		AddBuff( F[k] ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
		WriteRoleValue(F[k], EM_RoleValue_Register+5, PlayerLV)  -- 將玩家等級寫入R+5
		SetPlot(  F[k] , "dead","LuaYU_101489_2",0 )      --  機關模型死亡劇情
	end

-- 	F[0] = CreateObjByFlag( 101489, 780235, 1 , 1 );
-- 	F[1] = CreateObjByFlag( 101489, 780235, 2 , 1 );
-- 	F[2] = CreateObjByFlag( 101489, 780235, 3 , 1 );
-- 	F[3] = CreateObjByFlag( 101489, 780235, 4 , 1 );
-- 	F[4] = CreateObjByFlag( 101489, 780235, 5 , 1 );
-- 	F[5] = CreateObjByFlag( 101489, 780235, 6 , 1 );
-- 	F[6] = CreateObjByFlag( 101489, 780235, 7 , 1 );
-- 	F[7] = CreateObjByFlag( 101489, 780235, 8 , 1 );
-- 	F[8] = CreateObjByFlag( 101489, 780235, 9 , 1 );
-- 	F[9] = CreateObjByFlag( 101489, 780235, 10 , 1 );
-- 	F[10] = CreateObjByFlag( 101489, 780235, 11 , 1 );
-- 	F[11] = CreateObjByFlag( 101489, 780235, 12 , 1 );
-- 	F[12] = CreateObjByFlag( 101489, 780235, 13 , 1 );
-- 	F[13] = CreateObjByFlag( 101489, 780235, 14 , 1 );
-- 	F[14] = CreateObjByFlag( 101489, 780235, 15 , 1 );
-- 	F[15] = CreateObjByFlag( 101489, 780235, 16 , 1 );
-- 	F[16] = CreateObjByFlag( 101489, 780235, 17 , 1 );
-- 	F[17] = CreateObjByFlag( 101489, 780235, 18 , 1 );
-- 	F[18] = CreateObjByFlag( 101489, 780235, 19 , 1 );
-- 	F[19] = CreateObjByFlag( 101489, 780235, 20 , 1 );


	

	while true do
		sleep(50)

		local G = 100
		local YY = Rand( G )   
		if YY >= 65 and YY < 100 then   --35%  -- 藍色電網
			for i=0, 9 do
				if checkid(F[i]) == true and Checkid(F[i+10]) == true then
					CastSpelllv( F[i+10], F[i], 492452, 1)   -- 詭異的電流 麻痺效果
				end
			end

			for i=10, 19 do

				if checkid(F[i]) == true and Checkid(F[i-10]) == true then
					CastSpelllv( F[i-10], F[i], 492452, 1)  -- 詭異的電流 麻痺效果
				end
			end

		elseif YY >= 30 and YY < 65 then   --35%  --  紅色火網
			local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_PID  )  

			local staff = LuaFunc_CreateObjByObj ( 101273 , OwnerID() )	
			SetFightMode(  staff , 0, 0, 0, 0 )
			SetModeEx( staff , EM_SetModeType_Mark, false )--標記
			SetModeEx( staff , EM_SetModeType_HideName, true )--名稱
			SetModeEx( staff , EM_SetModeType_ShowRoleHead, false )--頭像框
			AddToPartition( staff, RoomID) 
			Hide( staff )
			Show( staff,RoomID )

			sleep(10)
			for i = 0, 19 do
				if checkid(F[i]) == true then
					CastSpelllv( F[i],  staff  , 492454, 0)	-- 詭異的火焰						
				end
			end
			sleep(20)

			if YY >= 45 and YY < 65 then
				CastSpelllv( staff ,  staff , 492456, 0)  -- 火紅光波	
				sleep(10)		
				Delobj(staff)
			else
				Delobj(staff)	
			end


		else --30％   --黃色
			local G = 100
			local XX = Rand( G )   
			local magicid = 492455  -- 溫暖的電流
				if XX >= 75 and XX < 100 then   --25%  
						CastSpelllv( F[17] , F[11] , magicid , 1)
						CastSpelllv( F[11] , F[2] , magicid , 1)
						CastSpelllv( F[2] , F[14] , magicid , 1)
						CastSpelllv( F[14] , F[9] , magicid , 1)
						CastSpelllv( F[9] , F[17] , magicid , 1)

				elseif XX >= 50 and XX < 75 then   --25%  
						CastSpelllv( F[12] , F[8] , magicid , 1)
						CastSpelllv( F[8] , F[17] , magicid , 1)
						CastSpelllv( F[17] , F[5] , magicid , 1)
						CastSpelllv( F[5] , F[3] , magicid , 1)
						CastSpelllv( F[3] , F[12] , magicid , 1)

				elseif XX >= 25 and XX < 50 then   --25%  
						CastSpelllv( F[0], F[12], magicid, 1)
						CastSpelllv( F[12], F[3] , magicid, 1)
						CastSpelllv( F[3], F[7], magicid, 1)
						CastSpelllv( F[7], F[16], magicid, 1)
						CastSpelllv( F[16], F[0], magicid, 1)
				else --25％  
						CastSpelllv( F[19], F[7], magicid, 1)
						CastSpelllv( F[7], F[16] , magicid, 1)
						CastSpelllv( F[16], F[2], magicid, 1)
						CastSpelllv( F[2], F[11], magicid, 1)
						CastSpelllv( F[11], F[19], magicid, 1)
				end
		end
	end
end


function LuaYU_101489_2()  --機關模型死亡劇情1
	BeginPlot( OwnerID() , "LuaYU_101489_3" , 0 )  
	return false
end

function LuaYU_101489_3()  --機關模型死亡劇情2
	local stone = OwnerID() -- 詭異的機關模型
	local stone_x = ReadRoleValue(stone, EM_RoleValue_X)
	local stone_y = ReadRoleValue(stone, EM_RoleValue_Y)
	local stone_z = ReadRoleValue(stone, EM_RoleValue_Z)
	local stone_dir = ReadRoleValue(stone, EM_RoleValue_dir)
	local RoomID = ReadRoleValue(stone, EM_RoleValue_RoomID )

	local PlayerLV = ReadRoleValue( stone , EM_RoleValue_Register+5  )    -- 玩家主職等級
	local MonsterLV 
		if PlayerLV <= 4 then
			MonsterLV = 5
		else
			MonsterLV = PlayerLV - (PlayerLV%5)
		end
--	Say(Player, "1 PlayerLV = "..PlayerLV )
--	Say(Player, "1 MonsterLV = "..MonsterLV )
	local MonsterID  = 101269  -- 守護岩靈 (原本26以下的)

	PlayMotion( stone , 19) 
	sleep(10)
	PlayMotion( stone , 19) 
	sleep(10)
	PlayMotion( stone , 19) 
	sleep(20)
	CastSpell( stone, stone, 491002)  -- 爆炸特效
	sleep(20)

	local Monster =  CreateObj( MonsterID, stone_x, stone_y, stone_z, stone_dir, 1 )
	WriteRoleValue( Monster , EM_RoleValue_LV , MonsterLV )	-- 寫入等級 
	SetModeEx( Monster    , EM_SetModeType_Strikback, true )--反擊
	SetModeEx( Monster    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Monster    , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( Monster    , EM_SetModeType_Mark, true )--標記
	SetModeEx( Monster    , EM_SetModeType_Move, true )--移動
	SetModeEx( Monster    , EM_SetModeType_Searchenemy, true )--索敵
	SetModeEx( Monster    , EM_SetModeType_HideName, false )--名稱
	SetModeEx( Monster , EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( Monster , EM_SetModeType_Fight , true )--可砍殺攻擊
	MoveToFlagEnabled( Monster , false )   	       --開／關巡邏劇情
	AddToPartition( Monster, RoomID )	--讓物件產生  
		
	sleep(10)
	Delobj(stone)  -- 刪除模型
end	
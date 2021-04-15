--陣型產生範例
function LuaYu_Ma2floor_matrix()--產生  地板
--Lua_MadeByRectangle(113109 , 66.5 , 34.5 , 5 , 10)  --Wnm需為1.3.5....Lnm需為正整數,Wdis為橫向間距,Ldis為前後間距 (不指定陣列內容)
	local Malatina = ReadRoleValue( OwnerID() ,EM_RoleValue_PID) --任務 瑪拉
	local BoxMala = ReadRoleValue( Malatina ,EM_RoleValue_Register+1) --隱藏觸發用瑪拉
	local CountPid = ReadRoleValue( BoxMala ,EM_RoleValue_PID) --目前解第幾次

	local floora = { }	
	local floorb = { }	
	local floorc = { }
	local floord = { }
	local floore = { }
	local floorf =  { }
	local floorg = { }
	local floorh = { }
	local floori  = { }


	local ClassNow = CountPid+1

	ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff".."[SC_113120_MALA2_43]"..ClassNow.. "|r" , 0 ) --回合：
	ScriptMessage( OwnerID() , -1 , 0 , "|cffff00ff".."[SC_113120_MALA2_43]"..ClassNow.. "|r" , 0 ) 


	sleep(10)

	if CountPid == 0 then -- Key*1

		 floora = { 113110,113109,113110,113113,113109 }--綠 炮 綠 藍 炮	
		 floorb = { 113108,113108,113108,113108,113108 }--灰 灰 灰 灰 灰	
		 floorc = { 113110,113111,113108,113111,113110 }--綠 紅 灰 紅 綠	
		 floord = { 113108,113110,113111,113108,113109 }--灰 綠 紅 灰 炮	
		 floore = { 113109,113113,113108,113111,113110 }--炮 藍 灰 紅 綠		
		 floorf =  { 113108,113108,113108,113108,113108 }--灰 灰 灰 灰 灰
		 floorg = { 113108,113112,113108,113110,113109 }--灰 鑰 灰 綠 炮	
		 floorh = { 113110,113111,113108,113113,113108 }--綠 紅 灰 藍 灰	
		 floori  = { 113111,113108,113111,113110,113110 }--紅 灰 紅 綠 綠

	elseif CountPid == 1 then --Key*2

		 floora = { 113110,113110,113109,113113,113109 }--綠 綠 炮 藍 炮	
		 floorb = { 113108,113108,113108,113108,113108 }--灰 灰 灰 灰 灰	
		 floorc = { 113110,113111,113108,113111,113110 }--綠 紅 灰 紅 綠	
		 floord = { 113108,113110,113111,113108,113109 }--灰 綠 紅 灰 炮	
		 floore = { 113109,113113,113108,113111,113112 }--炮 藍 灰 紅 鑰		
		 floorf =  { 113108,113108,113108,113108,113108 }--灰 灰 灰 灰 灰
		 floorg = { 113108,113110,113108,113110,113109 }--灰 綠 灰 綠 炮	
		 floorh = { 113110,113111,113108,113113,113108 }--綠 紅 灰 藍 灰	
		 floori  = { 113111,113108,113111,113109,113112 }--紅 灰 紅 炮 鑰

	elseif CountPid == 2 then -- Key*3

		 floora = { 113113,113110,113109,113110,113109 }--藍 綠 炮 綠 炮	
		 floorb = { 113108,113108,113108,113108,113108 }--灰 灰 灰 灰 灰	
		 floorc = { 113110,113111,113110,113111,113110 }--綠 紅 綠 紅 綠	
		 floord = { 113108,113110,113111,113111,113109 }--灰 綠 紅 紅 炮	
		 floore = { 113110,113113,113108,113111,113112 }--綠 藍 灰 紅 鑰		
		 floorf =  { 113108,113108,113108,113108,113108 }--灰 灰 灰 灰 灰
		 floorg = { 113108,113112,113108,113110,113109 }--灰 鑰 灰 綠 炮	
		 floorh = { 113110,113111,113108,113113,113110 }--綠 紅 灰 藍 綠	
		 floori  = { 113111,113108,113111,113110,113112 }--紅 灰 紅 綠 鑰

	elseif CountPid == 3 then --Key*4

		 floora = { 113113,113110,113109,113110,113109 }--藍 綠 炮 綠 炮	
		 floorb = { 113108,113108,113108,113108,113108 }--灰 灰 灰 灰 灰	
		 floorc = { 113112,113111,113111,113111,113110 }--鑰 紅 紅 紅 綠	
		 floord = { 113108,113110,113111,113108,113109 }--灰 綠 紅 灰 炮	
		 floore = { 113111,113113,113108,113111,113112 }--紅 藍 灰 紅 鑰		
		 floorf =  { 113108,113108,113108,113108,113108 }--灰 灰 灰 灰 灰
		 floorg = { 113108,113112,113108,113110,113109 }--灰 鑰 灰 綠 炮	
		 floorh = { 113110,113111,113108,113110,113111 }--綠 紅 灰 綠 紅	
		 floori  = { 113111,113108,113111,113110,113112 }--紅 灰 紅 綠 鑰

	end

	
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	local Array={}
	local floor={}

		for i=1 , 9 do

			if i == 1 then			
				 floor = floora
			elseif i ==2 then
				 floor = floorb
			elseif i ==3 then
				 floor = floorc
			elseif i ==4 then
				 floor = floord
			elseif i ==5 then
				 floor = floore
			elseif i ==6 then
				 floor = floorf
			elseif i ==7 then
				 floor = floorg
			elseif i ==8 then
				 floor = floorh
			elseif i ==9 then
				 floor = floori
--			elseif i ==10 then
--				 floor = floorj
			end


			for j=1 , 5 do
				
				local Woo = rand(table.getn(floor))+1 -- 矩陣隨機取樣，+1暗指從1開始。

				local ArrayX = table.getn(Array)

				Array[ArrayX+1] = floor[Woo]

				table.remove( floor,Woo)

			end

		end


	sleep(10)

	

	local Davis = Lua_MadeByRectangleX(  Array , 66.5 , 34.5 , 5 , 9)  --Wnm需為1.3.5....Lnm需為正整數,Wdis為橫向間距,Ldis為前後間距 (指定陣列內容)

	for j=1 , table.getn(Davis) do	

		SetModeEx( Davis[j] , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( Davis[j] , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( Davis[j] , EM_SetModeType_Obstruct, true )--阻擋
		SetModeEx( Davis[j] , EM_SetModeType_Mark, true )--標記
		SetModeEx( Davis[j] , EM_SetModeType_Move, false )--移動
		SetModeEx( Davis[j] , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( Davis[j] , EM_SetModeType_HideName, false )--名稱
		SetModeEx( Davis[j] , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( Davis[j] , EM_SetModeType_Fight , true )--可砍殺攻擊
		SetModeEx( Davis[j] , EM_SetModeType_DisableRotate, true )--轉向
--		Hide(Davis[j])
--		Show(  Davis[j],RoomID)

	end


end

function LuaYu_Ma2floor_Del()

	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_Register  )  



	local floor = {}
--		if PlayerLV < 16 then
--			floor[1] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102368, 300 , 1)    --虛空召喚結界
--			floor[2] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102369, 300 , 1)    --小丑之魂
--		elseif PlayerLV >= 16 and PlayerLV < 26 then
--			floor[1] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102372, 300 , 1)     
--			floor[2] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102373, 300 , 1)  
--		elseif PlayerLV >= 26 and PlayerLV < 36 then
--			floor[1] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102376, 300 , 1)     
--			floor[2] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102377, 300 , 1)  
--		elseif PlayerLV >= 36 and PlayerLV < 46 then
--			floor[1] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102380, 300 , 1)     
--			floor[2] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102381, 300 , 1)  
--		else
--			floor[1] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102384, 300 , 1)     
--			floor[2] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102385, 300 , 1)  
--		end


		floor[1] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102368, 300 , 1)    --虛空召喚結界 lv 16版
		floor[2] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102369, 300 , 1)    --小丑之魂

		floor[3] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113104, 300 , 1)     --巨型藤蔓
		floor[4] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 112959, 300 , 1)     --奇異的光芒
		floor[5] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113115, 300 , 1)     --砲擊目標
		floor[6] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113106, 300 , 1)     --KEY
		floor[7] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113107, 300 , 1)     --Door
		floor[8] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102382, 300 , 1)     --鐵拒馬

		floor[9] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113108, 300 , 1)     
		floor[10] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113109, 300 , 1)     
		floor[11] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113110, 300 , 1)     
		floor[12] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113111, 300 , 1)     
		floor[13] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113112, 300 , 1)     
		floor[14] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113113, 300 , 1)     
		floor[15] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113103, 300 , 1)     --火砲車
		floor[16] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113105, 300 , 1)   --執行生出所有地板
		floor[17] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 100044, 300 , 1)   --執行刪除全部的地板

	for i=1 , table.getn(floor) do	
		if floor[i] ~= -1 then
			for j = 0 ,table.getn(floor[i])  do

				Delobj(floor[i][j])
			end
		end
	end



end

--*********************************************************************************************************************************


-- 113108 封印(巨人的煉鐵拒馬) 物件產生劇情
function LuaYu_floorX_01_01() -- 地板觸碰轉換成大型物件   

	SetCursorType( OwnerID() , eCursor_Interact ); --游標變成 齒輪
	SetPlot( OwnerID() ,"range",  "LuaYu_floorX_01_2" , 40 )   --
	SetPlot( OwnerID() , "dead", "LuaYu_floorX_01_dead",0 )  -- 務件死亡時刪除自己物件

end

-- 113111 封印(虛空召喚結界) 物件產生劇情
function LuaYu_floorX_01_02() -- 地板觸碰轉換成大型物件   --  禁錮門

	SetCursorType( OwnerID() , eCursor_Interact ); --游標變成 齒輪
	SetPlot( OwnerID() ,"range",  "LuaYu_floorX_ghoststage" , 40 )   --***特殊
	SetPlot( OwnerID() , "dead", "LuaYu_floorX_01_dead",0 )   

end

-- 113112 封印(寶藏之鑰) 物件產生劇情
function LuaYu_floorX_01_03() -- 地板觸碰轉換成大型物件   --  KEY

	SetCursorType( OwnerID() , eCursor_Interact ); --游標變成 齒輪
	SetPlot( OwnerID() ,"touch",  "LuaYu_floorX_01_2" , 40 )   --
	SetPlot( OwnerID() , "dead", "LuaYu_KEYfloor_dead",0 )  --***特殊

end

-- 113109 封印(重型火砲車)  物件產生劇情
-- 113113 封印(神秘的魔石之門)
-- 113110 封印(巨型藤蔓)
function LuaYu_floorX_01_04() -- 地板觸碰轉換成大型物件   --  其他

	SetCursorType( OwnerID() , eCursor_Interact ); --游標變成 齒輪
	SetPlot( OwnerID() ,"touch",  "LuaYu_floorX_01_2" , 40 )   --
	SetPlot( OwnerID() , "dead", "LuaYu_floorX_01_dead",0 )  

end

--------------------------------------------------------

function LuaYu_floorX_01_begindead()  --地板死亡劇情
	SetPlot( OwnerID() , "dead", "LuaYu_floorX_01_dead",0 )   
end

-- 刪除物件
function LuaYu_floorX_01_dead()

	SetPlot( OwnerID() ,"touch",  "" , 0 )  
	SetPlot( OwnerID() ,"range",  "" , 0 ) 


	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	SetModeEx( OwnerID() , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( OwnerID() , EM_SetModeType_Mark, false )--標記
	SetModeEx( OwnerID() , EM_SetModeType_HideName, false )--名稱
	SetModeEx( OwnerID() , EM_SetModeType_Fight , false )--可砍殺攻擊


	BeginPlot( OwnerID() , "LuaP_Dead" , 0 )   
	sleep(20)
	Delobj( OwnerID() )


end

function LuaYu_floorX_01_2() --點開地板變身
--Say( OwnerID(),"OwnerID()_1" )--玩家
--Say( TargetID(),"TargetID()_1" )--物件

--	if TargetID() ~= -1 then
	if CheckID( TargetID() )== true and CheckBuff( OwnerID() , 502864 ) == false and CheckBuff( OwnerID() , 503991 ) == false and CheckBuff( OwnerID() , 503992 ) == false then

		local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 
		SetPlot( TargetID() ,"touch",  "" , 0 ) 
		SetPlot( TargetID() ,"range",  "" , 0 ) 

		local PlayerID = OwnerID()
		local floorID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID  ) --該怪在資料庫的統一ID
		local PlayerLV = ReadRoleValue( PlayerID , EM_RoleValue_LV  )  



		local floorXID= {	113108,--鐵拒馬
				113109,--炮彈軍火庫
				113110,--巨藤蔓
				113112,--鑰匙
				113113--傳送門
				}

		local XID1= {	102382,--鐵拒馬
				113103,--炮彈軍火庫
				113104,--巨藤蔓               
				113106,--鑰匙
				113107--傳送門
				}

		local Newfloor = 0

		for i= 1 , table.getn(floorXID) do

			if floorID == floorXID[i] then 
				Newfloor = XID1[i]
			end
		end

		local OwnerX = ReadRoleValue( TargetID() , EM_RoleValue_X ) 
		local OwnerY = ReadRoleValue( TargetID() , EM_RoleValue_Y ) 
		local OwnerZ = ReadRoleValue( TargetID() , EM_RoleValue_Z ) 
		local OwnerDIR = ReadRoleValue( TargetID() , EM_RoleValue_Dir ) 

		local NewfloorX = CreateObj( Newfloor , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)

		SetModeEx( NewfloorX , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( NewfloorX , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( NewfloorX , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( NewfloorX , EM_SetModeType_HideName, false )--名稱
		SetModeEx( NewfloorX , EM_SetModeType_Obstruct, true )--阻擋
		SetModeEx( NewfloorX , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( NewfloorX , EM_SetModeType_ShowRoleHead, false )--頭像框

		if Newfloor == 113103 then  									--砲台
			SetModeEx( NewfloorX , EM_SetModeType_Obstruct, false )--阻擋

		elseif floorID == 113108  then  --鐵拒馬
			local MonsterLV 
				if PlayerLV <= 4 then
					MonsterLV = 5
				else
					MonsterLV = PlayerLV - (PlayerLV%5)
				end

			WriteRoleValue( NewfloorX , EM_RoleValue_LV , MonsterLV )	-- 設定怪物等級
			SetModeEx( NewfloorX , EM_SetModeType_Move, false )--移動
			SetModeEx( NewfloorX , EM_SetModeType_DisableRotate, true )--轉向
			SetModeEx( NewfloorX , EM_SetModeType_ShowRoleHead, true )--頭像框
			SetModeEx( NewfloorX , EM_SetModeType_Fight , true )--可砍殺攻擊
			AddBuff( NewfloorX ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)

		elseif floorID == 113110  then  --巨藤蔓

			SetModeEx( NewfloorX , EM_SetModeType_Move, false )--移動
			SetModeEx( NewfloorX , EM_SetModeType_DisableRotate, true )--轉向
			SetModeEx( NewfloorX , EM_SetModeType_Fight , true )--可砍殺攻擊

		elseif floorID == 113113  then  --傳送

			SetModeEx( NewfloorX , EM_SetModeType_Move, false )--移動
			SetModeEx( NewfloorX , EM_SetModeType_DisableRotate, true )--轉向
			SetModeEx( NewfloorX , EM_SetModeType_Fight , true )--可砍殺攻擊

		end

		SetModeEx( NewfloorX , EM_SetModeType_Mark, true )--標記
		AddToPartition( NewfloorX , RoomID )  

		if floorID == 113113  then   --傳送
			Callplot( NewfloorX , "LuaYu_Mala2_Door_01" , 0 )   -- 傳送門劇情
			SetPlot( NewfloorX ,"range",  "LuaYu_Mala2_Door_03" , 15 ) 
		end

		Delobj( TargetID() )


	end
end

function LuaYu_floorX_ghoststage() --點開地板變身  虛空召喚結界
--	Say( OwnerID(),"O1" )--玩家
--	Say( TargetID(),"T1" )--物件

	if CheckID( TargetID() )== true and CheckBuff( OwnerID() , 502864 ) == false then

		local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 
		SetPlot( TargetID() ,"range",  "" , 0 ) 

		local PlayerID = OwnerID()
		local floorID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID  ) --該怪在資料庫的統一ID
		local PlayerLV = ReadRoleValue( PlayerID , EM_RoleValue_LV  )  

		local Newfloor = 102368  -- 改成用16級的
		local MonsterLV 
			if PlayerLV <= 4 then
				MonsterLV = 5
			else
				MonsterLV = PlayerLV - (PlayerLV%5)
			end


		local OwnerX = ReadRoleValue( TargetID() , EM_RoleValue_X ) 
		local OwnerY = ReadRoleValue( TargetID() , EM_RoleValue_Y ) 
		local OwnerZ = ReadRoleValue( TargetID() , EM_RoleValue_Z ) 
		local OwnerDIR = ReadRoleValue( TargetID() , EM_RoleValue_Dir ) 

		local NewfloorX = CreateObj( Newfloor , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
		WriteRoleValue( NewfloorX , EM_RoleValue_LV , MonsterLV )	-- 設定怪物等級
		SetModeEx( NewfloorX , EM_SetModeType_Obstruct, true )--阻擋
		SetModeEx( NewfloorX , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( NewfloorX , EM_SetModeType_Move, false )--移動
		SetModeEx( NewfloorX , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( NewfloorX , EM_SetModeType_HideName, false )--名稱
		SetModeEx( NewfloorX , EM_SetModeType_DisableRotate, true )--轉向
		SetModeEx( NewfloorX , EM_SetModeType_Strikback, true )--反擊
		SetModeEx( NewfloorX , EM_SetModeType_ShowRoleHead, true )--頭像框
		SetModeEx( NewfloorX , EM_SetModeType_Fight , true )--可砍殺攻擊
		AddBuff( NewfloorX ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
		AddToPartition( NewfloorX , RoomID )  
		WriteRoleValue( NewfloorX  , EM_RoleValue_Register , OwnerID() ) --記住玩家
		SetPlot( NewfloorX , "dead","LuaYu_Mala2_ghost_03",0 )  -- 虛空之門 死亡劇情
		Beginplot( NewfloorX , "LuaYu_Mala2_ghost_01" , 0 )     -- 虛空之門 產生 小丑之魂

		Delobj( TargetID() )
		SetModeEx( NewfloorX , EM_SetModeType_Mark, true )--標記

	end

end


-----------------------寶箱------------------------------------
function LuaYU_Mala2_Treasure()   
	SetPlot( OwnerID() ,"touch",  "LuaYU_Mala2_Treasure01" , 20 )  
end


function LuaYU_Mala2_Treasure01()  
	local O_ID = OwnerID()   -- 玩家
	local T_ID = TargetID()    -- 寶箱

--	say(O_ID, "O1")
--	say(T_ID, "T1") 
	local KEY =  CountBodyItem( O_ID , 203027 )    --普通KEY
	
	if ReadRoleValue( O_ID , EM_RoleValue_SpellMagicID ) ~= 0 then  -- 施法中就不跑
		return
	end

	if KEY > 0 then
		-- 2013. 03. 05  6.0.0 修改 當有施法條狀態時, 無法點擊另外一個物件
		if Lua_Hao_Check_SetPlot_Touch( O_ID ) == false then
			if BeginCastBarEvent( O_ID, T_ID,"[SO_110195_1]", 30, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END, 0, "LuaYU_Mala2_Treasure02" ) ~= 1 then
				ScriptMessage( O_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
				return
			end
		end
	else
		ScriptMessage( O_ID , O_ID , 1 , "  [SC_113120_MALA2_45]  " , 0 ) --你需要鑰匙
		ScriptMessage( O_ID , O_ID , 0 , "  [SC_113120_MALA2_45]  " , 0 ) --你需要鑰匙
	end
end

-- 普通寶葙2
function LuaYU_Mala2_Treasure02( ObjID, CheckStatus )
	local O_ID = OwnerID()   -- 玩家
	local T_ID = TargetID()    -- 寶箱

--	say(O_ID, "O2")
--	say(T_ID, "T2")

	if ReadRoleValue( O_ID , EM_RoleValue_SpellMagicID ) ~= 0 then -- 施法中就不跑
		return
	end

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			EndCastBar( O_ID, CheckStatus );
			if EmptyPacketCount( O_ID ) >= 1  and QueuePacketCount( O_ID ) == 0 then	
				SetPlot( T_ID,"touch","",0 )	
				PlayMotionEX( T_ID, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --持續播放145    146
				BeginPlot( O_ID, "LuaYU_Mala2_Treasure03" , 0 )  -- 開寶箱
			else
				ScriptMessage( O_ID , O_ID , 1 , "[K_08MID_DIALOG8]" , 0 ) --您的背包空間不足，請清理一下再來吧。
			end

		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

-- 普通寶葙3
function LuaYU_Mala2_Treasure03()   
	local Player = OwnerID() 
	local PlayerLV = ReadRoleValue( Player , EM_RoleValue_LV  )  
 
	DelBodyItem( Player , 203027 , 1 )  -- 普通key
	GiveBodyItem( Player , 720592 , 1 );  

	if PlayerLV >= 40 then  --依等級判斷
		local XX = Rand(100)+1     				
		if XX >= 91 then   --10%
			GiveBodyItem( Player , 201967 , 2 ) --安心修理鎚*2
		elseif XX >= 71 and XX <= 90 then   --20%
			GiveBodyItem( Player , 201967 , 1 ) --安心修理鎚*1
		end
	end			
end

-----------------------寶箱------------------------------------
function LuaYU_Mala2_Treasure2()   
	SetPlot( OwnerID() ,"touch",  "LuaYU_Mala2_Treasure201" , 20 )  
end

-- 特殊寶葙1
function LuaYU_Mala2_Treasure201()   
	local O_ID = OwnerID()   -- 玩家
	local T_ID = TargetID()    -- 寶箱

--	say(O_ID, "O1")
--	say(T_ID, "T1")
	local KEY =  CountBodyItem( O_ID , 205791 )    --特殊KEY

	if ReadRoleValue( O_ID , EM_RoleValue_SpellMagicID ) ~= 0 then  -- 施法中就不跑
		return
	end

	if KEY > 0 then
		-- 2013. 03. 05  6.0.0 修改 當有施法條狀態時, 無法點擊另外一個物件
		if Lua_Hao_Check_SetPlot_Touch( O_ID ) == false then
			if BeginCastBarEvent( O_ID, T_ID,"[SO_110195_1]", 30, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END, 0, "LuaYU_Mala2_Treasure202" ) ~= 1 then
				ScriptMessage( O_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
				return
			end
		end
	else
		ScriptMessage( O_ID , O_ID , 1 , "[SC_113120_MALA2_67]" , 0 ) --你需要特殊鑰匙
		ScriptMessage( O_ID , O_ID , 0,  "[SC_113120_MALA2_67]" , 0 ) --
	end
end

-- 特殊寶葙2
function LuaYU_Mala2_Treasure202( ObjID, CheckStatus )
	local O_ID = OwnerID()   -- 玩家
	local T_ID = TargetID()    -- 寶箱

--	say(O_ID, "O2")
--	say(T_ID, "T2")

	if ReadRoleValue( O_ID , EM_RoleValue_SpellMagicID ) ~= 0 then -- 施法中就不跑
		return
	end

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			EndCastBar( O_ID, CheckStatus );
			if EmptyPacketCount( O_ID ) >= 2  and QueuePacketCount( O_ID ) == 0 then	
				SetPlot( T_ID,"touch","",0 )	
				PlayMotionEX( T_ID, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --持續播放145    146
				BeginPlot( O_ID, "LuaYU_Mala2_Treasure203" , 0 )  -- 開寶箱
			else
				ScriptMessage( O_ID , O_ID , 1 , "[K_08MID_DIALOG8]" , 0 ) --您的背包空間不足，請清理一下再來吧。
			end

		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

-- 特殊寶葙3
function LuaYU_Mala2_Treasure203()   
	local Player = OwnerID() 
	local PlayerLV = ReadRoleValue( Player , EM_RoleValue_LV  )  

	local P = 100
	local XX = Rand( P )     

	DelBodyItem( Player , 205791 , 1 )

	GiveBodyItem( Player , 720591 , 1 );  
	if PlayerLV >= 40 then  --依等級判斷
		if XX > 30 and XX <= 100 then   --70%
			GiveBodyItem( Player , 203487 , 1 ) --魔幻寶盒1點*1
		else  --30%
	
			GiveBodyItem( Player , 203487 , 2 ) --魔幻寶盒1點*2
		end
	end
						
end










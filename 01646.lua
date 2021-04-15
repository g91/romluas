function LuaI_YU_PetSystem_GetEgg_00()    --帕奇鼠，躲避玩家劇情

	local ID = OwnerID()--老鼠
	local RoomID = ReadRoleValue( ID , EM_RoleValue_RoomID)
	local stime = 10
	SetModeEx( ID , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( ID , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( ID  , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( ID , EM_SetModeType_Searchenemy, false )--索敵
--	MoveToflagEnabled( ID , false )
	WriteRoleValue( ID,EM_RoleValue_IsWalk ,0)--用跑的
	SetModeEx( ID  , EM_SetModeType_Move, true )--移動

	Beginplot( ID ,"LuaYU_TakePetEGG_00", 0 )--範圍內有陷阱則被捕。

	while true do 
		local P = 100			--偵查玩家距離	靈敏度	隨機取值
		local XX = Rand( P )    

		if XX < 30 then
			XX = 30
		end

		local Player = SearchRangePlayer( ID , XX ) --判斷附近是否有玩家
		local PetPID = ReadRoleValue( ID , EM_RoleValue_PID  ) --該老鼠是否已被捕捉記錄了玩家的ID

		if (PetPID>0) then
			break
		elseIf CheckID( Player[0] ) == true then	--如果附近XX內有玩家

			local M = 60		--有玩家則移動之距離
			local ZZ = Rand( M )    
			if ZZ < 20 then
				ZZ = 20
			end

			AdjustFaceDir(ID, Player[0] , 180 ) --面向 背對
--			WriteRoleValue( ID  ,EM_RoleValue_IsWalk , 0  )--用跑的
			sleep(5)
			local Dis = ZZ	
			Lua_MoveLine( ID , Dis ) --參考物件，向前移動到Dis距離的位置 (Dis 填 負數 為 向後移動)
			sleep(stime)
		end
		sleep(stime)
	end
end

function LuaYU_TakePetEGG_00() --老鼠被捕劇情
	local ID = OwnerID()--老鼠
	local RoomID = ReadRoleValue( ID , EM_RoleValue_RoomID)
	local stime = 5

	while true do 

		local Trap = LuaFunc_SearchNPCbyOrgID( ID, 103565, 15 , 1)       --狩獵陷阱

		If (CheckID( Trap[0] ) == true) then	--如果附近15內有陷阱
			local N = 10		--若附近有陷阱，30%機率閃避之。 <---之後可作成 金黃帕奇鼠，閃避率較高。
			local YY = Rand( N )    

			local Mark = ReadRoleValue( Trap[0] , EM_RoleValue_Register)--該狩獵陷阱是否有抓到怪了
			if Mark == 0 then
				if YY >=3 then
					local PlayerID = ReadRoleValue( Trap[0] , EM_RoleValue_PID  ) --陷阱所屬"玩家"ID
					local OwnerX = ReadRoleValue( Trap[0] , EM_RoleValue_X ) 
					local OwnerY = ReadRoleValue( Trap[0] , EM_RoleValue_Y ) 
					local OwnerZ = ReadRoleValue( Trap[0] , EM_RoleValue_Z ) 
					local OwnerDIR = ReadRoleValue( Trap[0] , EM_RoleValue_Dir ) 
					OwnerDIR = OwnerDIR+180
					SetPos( ID, OwnerX, OwnerY , OwnerZ , OwnerDIR )--將該怪傳送到陷阱處
--					SetModeEx( ID , EM_SetModeType_Mark, true )--標記
--					SetModeEx( ID  , EM_SetModeType_HideName, false )--名稱
--					SetModeEx( ID , EM_SetModeType_ShowRoleHead, true )--頭像框
					SetModeEx( ID , EM_SetModeType_Fight , false )--可砍殺攻擊
					SetModeEx( ID  , EM_SetModeType_Move, false )--移動
					SetModeEx( ID , EM_SetModeType_Obstruct, false )--阻擋
					SetModeEx( ID  , EM_SetModeType_Strikback, false )--反擊
					SetModeEx( ID , EM_SetModeType_DisableRotate, true )--不轉向
					SetModeEx( ID , EM_SetModeType_Searchenemy, false )--索敵
					SetModeEx( ID , EM_SetModeType_NotShowHPMP, true )--不顯示血條
			--		PlayMotion( Trap[0] , 12) --deadth 陷阱關閉動作
					WriteRoleValue( Trap[0]  ,EM_RoleValue_Register , 110  )--做記號，該陷阱已捕捉到獵物
					WriteRoleValue( ID , EM_RoleValue_PID, PlayerID ) --讓老鼠記住玩家
					WriteRoleValue( ID , EM_RoleValue_Register+2, Trap[0] ) --讓老鼠記住陷阱
					If (CheckID(PlayerID) == true) then
						ScriptMessage( PlayerID , PlayerID , 2 , "[SC_PETSYS_34]" , "0xff00ffff" )--太好了！成功捕獲了[103567]！
						ScriptMessage( PlayerID , PlayerID , 0 , "[SC_PETSYS_34]" , "0xff00ffff" )

						SetPlot( OwnerID(),"touch","LuaYU_TakePetEGG_01",30 )
					end
					Beginplot( ID ,"LuaYU_TakePetEGG_03", 0 )--自被困住起，60秒後，自動掙脫。
					break
				else										--寵物發現有陷阱，烙跑
					AddBuff( ID ,503141 ,1 ,3 )--驚訝
					AdjustFaceDir(ID, Trap[0] , 180 ) --面向 背對
--					WriteRoleValue( ID  ,EM_RoleValue_IsWalk , 0  )--用跑的
					local Dis = 50	
					Lua_MoveLine( ID , Dis ) --參考物件，向前移動到Dis距離的位置 (Dis 填 負數 為 向後移動)
				end
			end
		end
		sleep(stime)
	end
end


function LuaYU_TakePetEGG_01() --觸碰劇情，玩家取蛋
--OwnerID() --玩家
--TargetID() --老鼠

	local PlayerID = ReadRoleValue( TargetID() , EM_RoleValue_PID  ) --"玩家"ID
	local play =  CheckFlag( PlayerID , 542570 ) --是否參與過免費練習
	local FreeEgg =  CheckFlag( PlayerID , 542573 ) --第一顆免費蛋

	if (PlayerID ~= OwnerID()) then --點擊陷阱者非該陷阱所有者
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_PETSYS_62]" , 0 )--你不是該狩獵陷阱的設置者，無法解除它。
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_PETSYS_62]" , 0 )
		return
	elseif (PlayerID == OwnerID()) then
		SetPlot( TargetID(),"touch","",0 )
		local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
		local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
		local ZoneID = Zone-1000*math.floor( Zone/1000 )
		local PetEggLv	 --寵物蛋等級
		-- 2013.03.11 阿浩：(5.0.10)調整各區域捕捉帕奇寵物蛋時的隨機等級區間
		local Player = OwnerID()		
		local PetLvRange = {	[1] = 7 ,	-- Zone ID , 帕奇寵物(寵物蛋)產生時的等級隨機區間。
					[2] = 14 , 	-- Zone 2，帕奇寵物產生時的等級隨機區間為 1 ~ 14
					[3] = 33 ,
					[4] = 20 ,
					[5] = 27 ,
					[6] = 33 ,
					[7] = 34 ,
					[8] = 36 ,
					[9] = 36 ,
					[10] = 14 ,
					[11] = 23 ,
					[12] = 6 ,
					[13] = 28 ,
					[14] = 33 ,
					[15] = 38 ,
					[16] = 38 ,
					[17] = 40 ,
					[18] = 41 ,
					[19] = 43 ,
					[20] = 44 ,
					[21] = 46 ,
					[22] = 50 ,
					[23] = 50 ,
					[24] = 51 ,
					[25] = 53 ,
					[26] = 54 ,
					[27] = 56 ,
					[28] = 58 ,
					[29] = 60 ,
					[30] = 61 ,
					[31] = 6 ,
					[32] = 63 ,
					[33] = 64 ,
					[34] = 66	}

		if play == true and FreeEgg == false and ZoneID == 304 then	--玩家於米拉牧場，且未曾領取過免費的寵物蛋
			PetEggLv = 5
		elseif PetLvRange[Zone] ~= nil then	-- 當前 Zone 屬於 PetLvRange 中定義的 Zone 時執行
			PetEggLv = Math.random(PetLvRange[Zone])
			DebugMsg( Player , RoomID , "Zone = "..ZoneID.." , MaxLv = "..PetLvRange[Zone].." , EggLv = "..PetEggLv )
		else	-- 當前 Zone 不屬於 PetLvRange 中定義的任何 Zone 時執行
			local MaxLv = ReadRoleValue( Player , EM_RoleValue_MaxLv )	-- 讀取該伺服器當前設定好的玩家最高等級
			PetEggLv = Math.random( Math.floor( MaxLv*(2/3) ) )	-- 寵物蛋等級 = (玩家最高等級*2/3)的整數
			DebugMsg( Player , RoomID , "Zone = "..ZoneID.." , MaxLv = "..MaxLv.." , EggLv = "..PetEggLv )
		end
		-- 2013.03.11 阿浩：以上為此次修改的部分
	-----------------------以下為了組合出 寵物蛋 《蛋的ID》------------------------------

		local Egg = { }
		Egg[0] = {204476,204477,204478,204479,204480,204481}	--野生寶貝蛋		
		Egg[1] = {204482,204483,204484,204485,204486,204487}	--野生寶貝蛋2	
		Egg[2] = {204488,204489,204490,204491,204492,204493}	--奇異寶貝蛋	
		Egg[3] = {204506,204507,204508}			--符文寶貝蛋		
		Egg[4] = {204494,204495,204496,204497,204498,204499}	--奇異寶貝蛋2	
		Egg[5] = {204500,204501,204502,204503,204504,204505}	--聖紋寶貝蛋	

		local MouseOrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) --該怪在資料庫的統一ID
		local RareEgg = 0 --蛋的種類變數
		local EggItem = 0 --蛋的排列位置

		if (MouseOrgID==103566) then --棕色帕奇鼠
			RareEgg = Rand( 4 )    
			local RuneEggRand = Rand( 100 )    

			if RareEgg == 3 then
				if (RuneEggRand >=30) and (RuneEggRand <100) then 			--70%
					EggItem = 2
				elseif (RuneEggRand >=5) and (RuneEggRand <30) then 		--25%
					EggItem = 3
				else									--5%
					EggItem = 1
				end
			else
				EggItem = rand(table.getn(Egg[RareEgg]))+1
			end

		elseif (MouseOrgID==103567) then --金色帕奇鼠
			RareEgg = Rand( 6 )    
			if RareEgg < 2 then
				RareEgg = 3
			end

			local RuneEggRand = Rand( 100 )    

			if RareEgg == 3 then
				if (RuneEggRand >=30) and (RuneEggRand <100) then 			--70%
					EggItem = 2
				elseif (RuneEggRand >=5) and (RuneEggRand <30) then 		--25%
					EggItem = 3
				else									--5%
					EggItem = 1
				end
			else
				EggItem = rand(table.getn(Egg[RareEgg]))+1
			end

		end	


	-----------------------以下為了組合出 寵物蛋 包含之 寵物OrgID------------------------------

		local Pets = { }--***************************************一般區域性寵物***************************************--
		Pets[0] = {103610,103611,103612,103613,103614,103615,103616,103617,103618,103619,
		                    103622,103629,103624,103630,103642,103628,103710,103693,103694,103695,
		                    103691,103636,103660,103668}									--一般全域寵
		Pets[1] = {103622,103624,103625,103626,103627,103628}							--Zone1
		Pets[2] = {103629,103630,103631,103632,103633,103634}							--Zone2
		Pets[3] = {103635,103636,103637}										--Zone3
		Pets[4] = {103642,103643,103644,103645}									--Zone4
		Pets[5] = {103649,103650,103651,103652}									--Zone5
		Pets[6] = {103657,103658,103659,103660,103661}								--Zone6
		Pets[7] = {103666,103667,103668,103669,103670,103671,103672}						--Zone7
		Pets[8] = {103676,103677,103678,103679}									--Zone8
		Pets[9] = {103684,103685,103686,103687}									--Zone9
		Pets[10] = {103691,103692,103693,103694,103695}								--Zone10
		Pets[11] = {103697,103698,103699,103701,103700}								--Zone11
		Pets[12] = {103706,103707,103708,103709,103710}								--Zone12

		local ElitePets = { }--***************************************稀有區域性寵物***************************************--
		ElitePets[0] = {103620,103621,103718,103719,103720,103721,103722,103723,103724,103725,103726,
			            103711,103681,103713,103696,103623 }								--稀有全域寵
		ElitePets[1] = {103623}												--Zone1
		ElitePets[2] = {103717}												--Zone2
		ElitePets[3] = {103639,103640,103638}										--Zone3
		ElitePets[4] = {103646,103647,103648}										--Zone4
		ElitePets[5] = {103653,103654,103655,103656}									--Zone5
		ElitePets[6] = {103662,103663,103664,103665}									--Zone6
		ElitePets[7] = {103673,103674,103675}										--Zone7
		ElitePets[8] = {103680,103681,103682,103683}									--Zone8
		ElitePets[9] = {103690}												--Zone9
		ElitePets[10] = {103696}												--Zone10
		ElitePets[11] = {103702,103703}											--Zone11
		ElitePets[12] = {103711,103712,103713}										--Zone12

		local RunePets = {103714,103715,103716}--符文寵物

		local PGroup = Rand( 100 )    
		local PetNpcGroup = 0		--寵物種類：一般全域寵(1)/稀有全域寵(2)/一般區域寵(3)/稀有區域寵(4)/符文寵(5)
		local PetSet= 0			--該群組寵物蛋之位置
		local PetOrgID= 0		--寵物ID

		if RareEgg == 3 then		--此次之寵物蛋為：符文寶貝蛋
			PetNpcGroup = 5		--符文寵(5)

		elseif (ZoneID > 12) then		--12區之後新開之區域
			if (PGroup >= 10)  and  (PGroup < 100) then		--80%
				PetNpcGroup = 1	--一般全域寵(1)
			else						--10%
				PetNpcGroup = 2	--稀有全域寵(2)
			end

		elseif (PGroup >= 50)  and  (PGroup < 100) then		--50%
			PetNpcGroup = 1		--一般全域寵(1)

		elseif (PGroup >= 20)  and  (PGroup < 50) then		--30%
			PetNpcGroup = 3		--一般區域寵(3)

		elseif (PGroup >= 10)  and  (PGroup < 20) then		--10%
			PetNpcGroup = 2		--稀有全域寵(2)
		else							--10%
			PetNpcGroup = 4		--稀有區域寵(4)
		end

		if PetNpcGroup == 1 then				--一般全域寵(1)
			PetSet = rand(table.getn(Pets[0]))+1
			PetOrgID = Pets[0][PetSet]
		elseif PetNpcGroup == 2 then			--稀有全域寵(2)
			PetSet = rand(table.getn(ElitePets[0]))+1
			PetOrgID = ElitePets[0][PetSet]
		elseif PetNpcGroup == 3 then			--一般區域寵(3)
			PetSet = rand(table.getn(Pets[ZoneID]))+1
			PetOrgID = Pets[ZoneID][PetSet]
		elseif PetNpcGroup == 4 then			--稀有區域寵(4)
			PetSet = rand(table.getn(ElitePets[ZoneID]))+1
			PetOrgID = ElitePets[ZoneID][PetSet]
		else						--符文寵(5)
			PetSet = rand(table.getn(RunePets))+1
			PetOrgID = RunePets[PetSet]
		end

		if PlayerID == OwnerID() then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_PETSYS_35]" , "0xff00ffff" )
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_PETSYS_35]" , "0xff00ffff" )

			local LvAddRange = math.ceil(2+(0.3*PetEggLv))--無條件進位，取整數
			local TotalLvAdd = LvAddRange*2

			if ( play == true ) and ( FreeEgg == false ) and (ZoneID == 304) then--未獲得過免費蛋，而且玩家正處於米拉牧場
				GiveItem_Pet( OwnerID()   , 204509 , 1 , LvAddRange ,    TotalLvAdd   , 103714 ); 
				SetFlag( OwnerID() , 542573 , 1 ) -- 獲得第一顆免費蛋
			else
				GiveItem_Pet( OwnerID()   , Egg[RareEgg][EggItem] , PetEggLv , LvAddRange ,    TotalLvAdd   , PetOrgID ); 
		--bool		GiveItem_Pet( int GItemID ,      int ItemOrgID          ,    int Lv   ,    int Range   , MaxTotalPoint , int NpcOrgID ); 
		--　　　　　　　     　　	              給誰                 蛋ID                        等級         屬性增幅     增幅總和上限         寵物ID
			end
			Beginplot( TargetID() ,"LuaYU_TakePetEGG_02", 0 )--自被困住起，60秒後，自動掙脫。

		end

	--TargetID()   老鼠
	--OwnerID()   玩家
	end
end

function LuaYU_TakePetEGG_02() --帕奇鼠掙脫
	local PlayerID = ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) --"玩家"ID
	local Trap = ReadRoleValue( OwnerID() , EM_RoleValue_Register+2  ) --"陷阱"ID
	Delobj(Trap)
--	sleep(10)
	PlayMotion( OwnerID() , 161) --老鼠跳躍掙脫
	sleep(20)
	Delobj(OwnerID())
end

function LuaYU_TakePetEGG_03() --自被困住起，60秒後，自動掙脫。
	local Trap = ReadRoleValue( OwnerID() , EM_RoleValue_Register+2  ) --"陷阱"ID
	PlayMotion( Trap , 12) --deadth 陷阱關閉動作
	PlayMotion( OwnerID() , 21) --掙扎的動作 -- 
	sleep(600)
	Beginplot( OwnerID() ,"LuaYU_TakePetEGG_03_2", 0 )
end

function LuaYU_TakePetEGG_03_2() --帕奇鼠掙脫
	local PlayerID = ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) --"玩家"ID
	local Trap = ReadRoleValue( OwnerID() , EM_RoleValue_Register+2  ) --"陷阱"ID
	Delobj(Trap)
--	sleep(10)
	PlayMotion( OwnerID() , 161) --老鼠跳躍掙脫
	ScriptMessage( OwnerID() , 0 , 2 , "[SC_PETSYS_36]" , "0xff00ffff" )
	ScriptMessage( OwnerID() , 0 , 0 , "[SC_PETSYS_36]" , "0xff00ffff" )
	sleep(20)
	Delobj(OwnerID())
end

function LuaI_YU_PetSystem_GetEgg_01(Option)    --玩家安裝陷阱劇情
	local ID = OwnerID()
	local RoomID = ReadRoleValue( ID , EM_RoleValue_RoomID)

	if ( Option == "CHECK" ) then
		local BuffType = 0
		local Count = BuffCount (ID)
		for i = 0 , Count do
			local BuffID = BuffInfo (ID, i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end
		if BuffType == 68 then				       	    --/*有騎乘狀態無法使用
			ScriptMessage(ID,ID, 1 , "[SYS_GAMEMSGEVENT_167]" , 0 )  --騎乘不能使用
			return false
		else
			return true
		end
	elseif ( Option == "USE" ) then
		BeginPlot( ID , "LuaI_YU_PetSystem_GetEgg_02" , 0 )  
	end

end

function LuaI_YU_PetSystem_GetEgg_02() --安裝陷阱
	local ID = OwnerID() --玩家
	-- 2013.03.11 阿浩：為便利測試，已調整為持有帕奇寵物鑰匙(204512)或特殊劇情觸發鑰匙(203477)時，無需讀秒，使用後的施法時間為瞬發。
	local Item = { 204512 , 203477 }
	local Sec = 15
	for i = 1 , #Item , 1 do
		if CountBodyItem( ID , Item[i] ) > 0 then
			Sec = 0
			break
		end
	end		

	if BeginCastBarEvent( ID, ID,"[SC_YU_GUILDWAR_BUILD_13]", Sec , ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END, 0, "LuaI_YU_PetSystem_GetEgg_03" ) ~= 1 then
		ScriptMessage( ID, ID, 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
		return
	end
end

function LuaI_YU_PetSystem_GetEgg_03(ObjID,CheckStatus)--實裝安裝陷阱

	local ID = OwnerID() --玩家
	if ( CheckStatus ~= 0 ) then
		if ( CheckStatus > 0 ) then
			-- 成功
			EndCastBar( ID, CheckStatus );

			local RoomID = ReadRoleValue( ID ,EM_RoleValue_RoomID) 

			local OwnerX = ReadRoleValue( ID , EM_RoleValue_X ) 
			local OwnerY = ReadRoleValue( ID , EM_RoleValue_Y ) 
			local OwnerZ = ReadRoleValue( ID , EM_RoleValue_Z ) 
			local OwnerDIR = ReadRoleValue( ID , EM_RoleValue_Dir ) 
			OwnerY = OwnerY+15

			local StageNpc = CreateObj( 103565 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1) --100989 陷阱用 NPC  捕捉動作：死亡 13
			AddToPartition( StageNpc , RoomID )  
			WriteRoleValue( StageNpc , EM_RoleValue_PID, ID ) --記住玩家

			SetModeEx( StageNpc   , EM_SetModeType_Mark, false )--標記
			SetModeEx( StageNpc  , EM_SetModeType_HideName, true )--名稱
			SetModeEx( StageNpc , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( StageNpc , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( StageNpc  , EM_SetModeType_Move, false )--移動
			SetModeEx( StageNpc , EM_SetModeType_Obstruct, false )--阻擋
			SetModeEx( StageNpc  , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( StageNpc , EM_SetModeType_DisableRotate, true )--不轉向
			SetModeEx( StageNpc , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( StageNpc , EM_SetModeType_NotShowHPMP, true )--不顯示血條
			BeginPlot( ID , "LuaYU_PetSystem_TrapOFF" , 0 )  
			BeginPlot( StageNpc , "LuaYU_PetSystem_TrapDead" , 0 )  
		else
			-- 失敗
			EndCastBar( ID, CheckStatus );
		end
	end
end

function LuaYU_PetSystem_TrapOFF() --佈置陷阱
	local ID = OwnerID() --玩家
	DelBodyItem( ID , 206776 , 1 )
end

function LuaYU_PetSystem_TrapDead() --陷阱60秒後消失
	sleep(600)
	local Mark = ReadRoleValue( OwnerID() , EM_RoleValue_Register)--該狩獵陷阱是否有抓到怪了
	if Mark == 0 then--沒有抓到怪
		DelObj(OwnerID())
	end
end
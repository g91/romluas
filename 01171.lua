------------------------------------------- 炸彈 -------------------------------------------

function LuaYU_111813_003()   --炸彈  --OwnerID() 玩家
	BeginPlot( TargetID() , "LuaYU_111813_003_UU" , 0 )  
end

function LuaYU_111813_003_UU()   --炸彈  --OwnerID() 玩家
	local O_ID = OwnerID() --地板
	local T_ID = TargetID()  --玩家

       --int BeginCastBarEvent ( int iObjID, int iClickObjID, const char* pszString, int iTime, int iMotionID, int iMotionEndID, int iFlag, const char* pszLuaEvent )  新的CastingBar
       --                                     （  開bar者  ,    被開者           ,       Bar上的文字   ,        所需時間   ,  開始動作     ,  結束動作             , 中斷模式  ,  連結事件 ）
	if BeginCastBarEvent( T_ID, O_ID,"[SC_111813_YU_25]", 50, ruFUSION_ACTORSTATE_MINING_BEGIN, ruFUSION_ACTORSTATE_MINING_END, 0, "LuaYU_111813_003_UU_1" ) ~= 1 then
		ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
		return
	else
		AttachCastMotionTool( T_ID, 210508 ); --CastingBar觸發成功，置換武器為圓鍬
	end
end

function LuaYU_111813_003_UU_1( ObjID, CheckStatus )
	local O_ID = OwnerID() -- 玩家
	local T_ID = TargetID()  -- 地板

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			EndCastBar( O_ID, CheckStatus );

			SetPlot( T_ID,"touch","",0 )
			local RoomID = ReadRoleValue( O_ID ,EM_RoleValue_RoomID) 

			SetModeEx( T_ID  , EM_SetModeType_Mark, false )--標記
			SetModeEx( T_ID  , EM_SetModeType_HideName, true )--名稱
			Hide(T_ID)
			Show(T_ID , RoomID )

			PlayMotionEX( T_ID, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --持續播放145    146
			WriteRoleValue( T_ID , EM_RoleValue_Register , 1 )   --紀錄被挖開數
			--------------------------------------------------------------------------------------
			-- 2011.08.11  殺死-NPC  挖掘藏寶地磚  106272
				local npcid = 106272
				DW_QietKillOne(OwnerID(), npcid )
			--	say(OwnerID(), "kill id = "..npcid )
			--------------------------------------------------------------------------------------

			local PlayerLV = ReadRoleValue( O_ID , EM_RoleValue_LV  )  
			WriteRoleValue( T_ID , EM_RoleValue_Register+7 , PlayerLV )   --紀錄玩家等級
			BeginPlot( T_ID , "LuaYU_111813_Bob" , 0 )  
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus );
		end
	end
end


function LuaYU_111813_Bob()   
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7  )  
	local P = 100
	local XX = Rand( P )    
	local magicid = {492453, 850865, 850866}  -- 小炸彈 ,中炸彈, 大炸彈

	if XX > 40 and XX <= 100 then   --60%
		ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_17]".. "|r" , 0 ) --呦～唧唧唧唧～是顆[101486]呀！唧唧唧唧～
		ScriptMessage( OwnerID() , -1 , 0 , "|cffff00ff" .."[SC_111813_YU_17]".. "|r" , 0 ) --呦～唧唧唧唧～是顆[101486]呀！唧唧唧唧～
		local Bob = LuaFunc_CreateObjByObj ( 101486 , OwnerID() ) --小炸彈
		SetFightMode(  Bob , 0, 0, 0, 0 )
		sleep(25)
		CastSpell( Bob, Bob, magicid[1] )   -- 小炸彈法術
		sleep(10)
		Delobj(Bob)

	elseif XX <= 40 and XX > 10 then  --30%
		ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_18]".. "|r" , 0 ) --呦～唧唧唧唧～是顆[101487]喔！唧唧唧唧～
		ScriptMessage( OwnerID() , -1 , 0 , "|cffff00ff" .."[SC_111813_YU_18]".. "|r" , 0 ) --呦～唧唧唧唧～是顆[101487]喔！唧唧唧唧～
		local Bob = LuaFunc_CreateObjByObj ( 101487 , OwnerID() ) --中炸彈
		SetFightMode(  Bob , 0, 0, 0, 0 )
		sleep(25)
		CastSpell( Bob, Bob, magicid[2] )   -- 中炸彈法術
		sleep(10)
		Delobj(Bob)
	else --10%
		ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_19]".. "|r" , 0 ) --呦～唧唧唧唧～是顆[101488]喔！唧唧唧唧～
		ScriptMessage( OwnerID() , -1 , 0 , "|cffff00ff" .."[SC_111813_YU_19]".. "|r" , 0 ) --呦～唧唧唧唧～是顆[101488]喔！唧唧唧唧～
		local Bob = LuaFunc_CreateObjByObj ( 101488 , OwnerID() ) --大炸彈
		SetFightMode(  Bob , 0, 0, 0, 0 )
		sleep(25)
		CastSpell( Bob, Bob, magicid[3] )   -- 大炸彈法術
		sleep(10)
		Delobj(Bob)

	end
end

------------------------------------------- 怪物 -------------------------------------------

function LuaYU_111813_004()   --怪物  --OwnerID() 玩家
	BeginPlot( TargetID() , "LuaYU_111813_004_UU" , 0 )  
end

function LuaYU_111813_004_UU()   --怪物
	local O_ID = OwnerID() --地板
	local T_ID = TargetID()  --玩家

	if BeginCastBarEvent( T_ID, O_ID,"[SC_111813_YU_25]", 50, ruFUSION_ACTORSTATE_MINING_BEGIN, ruFUSION_ACTORSTATE_MINING_END, 0, "LuaYU_111813_004_UU_1" ) ~= 1 then
		ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
		return
	else
		AttachCastMotionTool( T_ID, 210508 ); --CastingBar觸發成功，置換武器為圓鍬
	end
end

function LuaYU_111813_004_UU_1( ObjID, CheckStatus )

	local O_ID = OwnerID() -- 玩家
	local T_ID = TargetID()  -- 地板

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			EndCastBar( O_ID, CheckStatus );

			SetPlot( T_ID,"touch","",0 )
			local RoomID = ReadRoleValue( O_ID ,EM_RoleValue_RoomID) 

			SetModeEx( T_ID  , EM_SetModeType_Mark, false )--標記
			SetModeEx( T_ID  , EM_SetModeType_HideName, true )--名稱
			Hide(T_ID)
			Show(T_ID , RoomID )

			PlayMotionEX( T_ID, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --持續播放145    146
			WriteRoleValue( T_ID , EM_RoleValue_Register , 1 )   --紀錄被挖開數
			--------------------------------------------------------------------------------------
			-- 2011.08.11  殺死-NPC  挖掘藏寶地磚  106272
				local npcid = 106272
				DW_QietKillOne(OwnerID(), npcid )
			--	say(OwnerID(), "kill id = "..npcid )
			--------------------------------------------------------------------------------------

			local PlayerLV = ReadRoleValue( O_ID , EM_RoleValue_LV  )  
			Callplot( T_ID , "LuaYU_111813_Monster" , PlayerLV )  
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

function LuaYU_111813_Monster(PlayerLV)   --怪
	local stone = OwnerID() -- 石板
	local stone_x = ReadRoleValue(stone, EM_RoleValue_X)
	local stone_y = ReadRoleValue(stone, EM_RoleValue_Y)
	local stone_z = ReadRoleValue(stone, EM_RoleValue_Z)
	local stone_dir = ReadRoleValue(stone, EM_RoleValue_dir)
	local RoomID = ReadRoleValue(stone, EM_RoleValue_RoomID )
	local MonsterLV 
		if PlayerLV <= 4 then
			MonsterLV = 5
		else
			MonsterLV = PlayerLV - (PlayerLV%5)
		end
--	Say(Player, "1 PlayerLV = "..PlayerLV )
--	Say(Player, "1 MonsterLV = "..MonsterLV )

	--找玩家
	local PlayerID = 0
	local Obj
	local Count = SetSearchAllPlayer(RoomID)
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == True then
				PlayerID = ID
			end
		end	
	end

	local Ma = 101271 --守護劍士  (用26以下的)
 	local Mb = 101270 --守護衛士 (用26以下的)
	local Mc = 101272 --狂暴惡魔劍士 (用26以下的)

	local P = 100
	local XX = Rand( P )    

	if XX > 40 and XX <= 100 then   --60%
		ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_21]".. "|r" , 0 ) --呦～唧唧唧唧～你把[101271]的封印給解除了呀！唧唧唧唧～
		ScriptMessage( OwnerID() , -1 , 0 , "|cffff00ff" .."[SC_111813_YU_21]".. "|r" , 0 ) --呦～唧唧唧唧～你把[101271]的封印給解除了呀！唧唧唧唧～
	--	local Monster = LuaFunc_CreateObjByObj( Ma , OwnerID() ) --守護劍士

		local Monster =  CreateObj( Ma, stone_x, stone_y, stone_z, stone_dir, 1 )
		WriteRoleValue( Monster , EM_RoleValue_LV , MonsterLV )	-- 設定怪物等級
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
		AddBuff( Monster ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
		SetAttack( Monster , PlayerID  )

	elseif XX <= 40 and XX > 5 then  --35%
		ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_20]".. "|r" , 0 ) --呦～唧唧唧唧～你把[101270]的封印給解除了呀！唧唧唧唧～
		ScriptMessage( OwnerID() , -1 , 0 , "|cffff00ff" .."[SC_111813_YU_20]".. "|r" , 0 ) --呦～唧唧唧唧～你把[101270]的封印給解除了呀！唧唧唧唧～

		local Monster =  CreateObj( Mb, stone_x, stone_y, stone_z, stone_dir, 1 )
		WriteRoleValue( Monster , EM_RoleValue_LV , MonsterLV )	-- 設定怪物等級
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
		AddBuff( Monster ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
		SetAttack( Monster , PlayerID  )

	else --5%
		ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_22]".. "|r" , 0 ) --呦～唧唧唧唧～是[101272]！你居然解除了他的封印！雖然擊敗他能夠獲得非常稀有的飾品，但我勸你還是跑吧！
		ScriptMessage( OwnerID() , -1 , 0 , "|cffff00ff" .."[SC_111813_YU_22]".. "|r" , 0 ) --呦～唧唧唧唧～是[101272]！你居然解除了他的封印！雖然擊敗他能夠獲得非常稀有的飾品，但我勸你還是跑吧！

		local Monster =  CreateObj( Mc, stone_x, stone_y, stone_z, stone_dir, 1 )
		WriteRoleValue( Monster , EM_RoleValue_LV , MonsterLV )	-- 設定怪物等級
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
		AddBuff( Monster ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
		SetAttack( Monster , PlayerID  )
	end
end

------------------------ 沒東西 ------------------------ 

function LuaYU_111813_005()   --沒東西   --OwnerID() 玩家
	BeginPlot( TargetID() , "LuaYU_111813_005_UU" , 0 )  
end

function LuaYU_111813_005_UU()   --沒東西
	local O_ID = OwnerID() --地板
	local T_ID = TargetID()  --玩家

	if BeginCastBarEvent( T_ID, O_ID,"[SC_111813_YU_25]", 50, ruFUSION_ACTORSTATE_MINING_BEGIN, ruFUSION_ACTORSTATE_MINING_END, 0, "LuaYU_111813_005_UU_1" ) ~= 1 then
		ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
		return
	else
		AttachCastMotionTool( T_ID, 210508 ); --CastingBar觸發成功，置換武器為圓鍬
	end
end

function LuaYU_111813_005_UU_1( ObjID, CheckStatus )

	local O_ID = OwnerID() -- 玩家
	local T_ID = TargetID()  -- 地板

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			EndCastBar( O_ID, CheckStatus );

			SetPlot( T_ID,"touch","",0 )
			local RoomID = ReadRoleValue( O_ID ,EM_RoleValue_RoomID) 
			SetModeEx( T_ID  , EM_SetModeType_Mark, false )--標記
			SetModeEx( T_ID  , EM_SetModeType_HideName, true )--名稱
			Hide(T_ID)
			Show(T_ID , RoomID )
			PlayMotionEX( T_ID, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --持續播放145    146
			WriteRoleValue( T_ID , EM_RoleValue_Register , 1 )   --紀錄被挖開數

			--------------------------------------------------------------------------------------
			-- 2011.08.11  殺死-NPC  挖掘藏寶地磚  106272
				local npcid = 106272
				DW_QietKillOne(OwnerID(), npcid )
			--	say(OwnerID(), "kill id = "..npcid )
			--------------------------------------------------------------------------------------

			local PlayerLV = ReadRoleValue( O_ID , EM_RoleValue_LV  )  
			WriteRoleValue( T_ID , EM_RoleValue_Register+7 , PlayerLV )   --紀錄玩家等級
			BeginPlot( T_ID , "LuaYU_111813_Nothing" , 0 )  
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

function LuaYU_111813_Nothing()   --沒東西
	local P = 100
	local XX = Rand( P )    
	local magicid = { 492458, 492456, 492457 }   --  黃色 (治療) 紅色(倒地+扣血) 藍色(加速)

	if XX >= 60 and XX < 100 then   --40%
		ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_23]".. "|r" , 0 ) --呦～唧唧唧唧～沒東西耶～好吧，那我幫你治療一下好了～
		ScriptMessage( OwnerID() , -1 , 0 , "[SC_111813_YU_23]" , 0 ) --呦～唧唧唧唧～沒東西耶～好吧，那我幫你治療一下好了～
		Callplot( OwnerID() , "LuaYU_111813_curestaff" , 492458 )        --黃色
	elseif XX > 20 and XX <= 60 then   --40%
		ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_26]".. "|r" , 0 ) --呦～唧唧唧唧～沒東西耶～好吧，那就嚇你一下好了～
		ScriptMessage( OwnerID() , -1 , 0 , "|cffff00ff" .."[SC_111813_YU_26]".. "|r" , 0 ) --呦～唧唧唧唧～沒東西耶～好吧，那就嚇你一下好了～
		Callplot( OwnerID() , "LuaYU_111813_curestaff" , 492456 )        --黃色
	else--20%
		ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_24]".. "|r" , 0 ) --呦～唧唧唧唧～沒東西耶～好吧，那我幫你加速一下好了～
		ScriptMessage( OwnerID() , -1 , 0 , "[SC_111813_YU_24]" , 0 ) --呦～唧唧唧唧～沒東西耶～好吧，那我幫你加速一下好了～
		Callplot( OwnerID() , "LuaYU_111813_curestaff" , 492457 )        --藍色
	end

end

function LuaYU_111813_curestaff(magicid)   --黃
	local staffnolight = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101472, 300 , 1)       -- 不發光魔杖
	local staff = LuaFunc_CreateObjByObj ( 101273 , staffnolight[0] )   -- 發光魔杖

	SetModeEx( staff    , EM_SetModeType_Mark, false )--標記
	SetModeEx( staff    , EM_SetModeType_HideName, true )--名稱
	SetModeEx( staff   , EM_SetModeType_ShowRoleHead, false )--頭像框
--	AddToPartition( staff, RoomID) 	
	SetFightMode(  staff , 0, 0, 0, 0 )

	CastSpell( staff ,  staff , magicid)
	sleep(30)		
	Delobj(staff)
end
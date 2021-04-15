--702759 萬聖瑪拉_地磚遭遇

------------------------------  好瓜 ------------------------------ 

function lua_mika_2012hallow_obj1_01()   --炸彈  --OwnerID() 玩家
	BeginPlot( TargetID() , "lua_mika_2012hallow_obj1_02" , 0 )  
end

-- 這段只要改連結事件function就好
function lua_mika_2012hallow_obj1_02()   
	local O_ID = OwnerID() --地板
	local T_ID = TargetID()  --玩家
	
	if ReadRoleValue( T_ID , EM_RoleValue_SpellMagicID ) ~= 0 then  -- 施法中就不跑
		return
	end

	AttachCastMotionTool( T_ID , 212076 ) -- 將武器置換成空手
	if BeginCastBarEvent( T_ID, O_ID,"[SC_111813_YU_25]", 30, ruFUSION_ACTORSTATE_MINING_BEGIN, ruFUSION_ACTORSTATE_MINING_END, 0, "lua_mika_2012hallow_obj1_03" ) ~= 1 then
		ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
		return
	else
		AttachCastMotionTool( T_ID, 210508 ); --CastingBar觸發成功，置換武器為圓鍬
	end
end

function lua_mika_2012hallow_obj1_03( ObjID, CheckStatus )
	local O_ID = OwnerID() -- 玩家
	local T_ID = TargetID()  -- 地板

	if ReadRoleValue( O_ID , EM_RoleValue_SpellMagicID ) ~= 0 then -- 施法中就不跑
		return
	end

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
			AddRoleValue(O_ID, EM_LuaValueFlag_UseItem42 , 1 )  -- 記錄玩家挖掘數
			BeginPlot( T_ID, "lua_mika_2012hallow_obj1_04" , 0 )  -- 出現瓜
			sleep(10)

		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

-- 出現瓜
function lua_mika_2012hallow_obj1_04()
	local O_ID = OwnerID() -- 地板
	local T_ID = TargetID()  -- 玩家
	local RoomID = ReadRoleValue( O_ID ,EM_RoleValue_RoomID)

	local OBJ = LuaFunc_CreateObjByObj ( 121405 , O_ID )  -- 按照物件位置產生物件  
	SetModeEx( OBJ, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( OBJ, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( OBJ, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( OBJ, EM_SetModeType_Mark, true )--標記
	SetModeEx( OBJ, EM_SetModeType_Move, true )--移動
	SetModeEx( OBJ, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( OBJ, EM_SetModeType_HideName, true )--名稱
	SetModeEx( OBJ, EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( OBJ, EM_SetModeType_Show , True ) --不顯示
	SetModeEx( OBJ, EM_SetModeType_Fight , false )--可砍殺攻擊
	AddToPartition( OBJ, RoomID) 

	local light = LuaFunc_CreateObjByObj ( 121408 , O_ID )  -- 按照物件位置產生物件  
	SetModeEx( light, EM_SetModeType_Mark, false )--標記
	SetModeEx( light, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( light, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( light, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( light, EM_SetModeType_Move, false )--移動
	SetModeEx( light, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( light, EM_SetModeType_HideName, true )--名稱
	SetModeEx( light, EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( light, EM_SetModeType_Show , True ) --不顯示
	SetModeEx( light, EM_SetModeType_Fight , false )--可砍殺攻擊
	AddToPartition( light, RoomID) 
	Hide( light )
	sleep(5)
	Show( light ,RoomID)

	ScriptMessage( O_ID , -1 , 1 , "|cffff00ff" .."[SC_2012HALLOW_MALA_16]".. "|r" , 0 )  -- 呦～唧唧唧唧～是顆[121405]呀！唧唧唧唧～
	WriteRoleValue(OBJ, EM_RoleValue_Register+1, light )
	BeginPlot(OBJ, "lua_mika_2012hallow_obj1_05", 0 ) 
end

--  寶箱觸碰劇情
function lua_mika_2012hallow_obj1_05()
	local O_ID = OwnerID() -- 瓜
	Setplot(O_ID, "Touch", "lua_mika_2012hallow_obj1_06", 60)
end

-- 點擊寶箱劇情
function lua_mika_2012hallow_obj1_06()
	local OID = OwnerID()  --玩家
	local TID = TargetID()  -- 瓜

	GiveBodyItem( OID , 720724 , 1 );    -- 給獎勵
	AddRoleValue(OID, EM_RoleValue_Register+9, 1 )  -- 記錄玩家開啟寶箱數
	local count = ReadRoleValue(OID, EM_RoleValue_Register+9 )
--	SAY(OID, "treasure get ="..count )
	local light = ReadRoleValue(TID, EM_RoleValue_Register+1 )
	Setplot(TID, "Touch", "", 0)
	Delobj(light)
	Delobj(TID)
end


------------------------------  噴火瓜 ------------------------------ 
function lua_mika_2012hallow_obj2_01()   --炸彈  --OwnerID() 玩家
	BeginPlot( TargetID() , "lua_mika_2012hallow_obj2_02" , 0 )  
end

-- 這段只要改連結事件function就好
function lua_mika_2012hallow_obj2_02()   
	local O_ID = OwnerID() --地板
	local T_ID = TargetID()  --玩家

	if ReadRoleValue( T_ID , EM_RoleValue_SpellMagicID ) ~= 0 then  -- 施法中就不跑
		return
	end

	AttachCastMotionTool( T_ID , 212076 ) -- 將武器置換成空手
	if BeginCastBarEvent( T_ID, O_ID,"[SC_111813_YU_25]", 30, ruFUSION_ACTORSTATE_MINING_BEGIN, ruFUSION_ACTORSTATE_MINING_END, 0, "lua_mika_2012hallow_obj2_03" ) ~= 1 then
		ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
		return
	else
		AttachCastMotionTool( T_ID, 210508 ); --CastingBar觸發成功，置換武器為圓鍬
	end
end

function lua_mika_2012hallow_obj2_03( ObjID, CheckStatus )
	local O_ID = OwnerID() -- 玩家
	local T_ID = TargetID()  -- 地板

	if ReadRoleValue( O_ID , EM_RoleValue_SpellMagicID ) ~= 0 then  -- 施法中就不跑
		return
	end

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
			AddRoleValue(O_ID, EM_LuaValueFlag_UseItem42 , 1 )  -- 記錄玩家挖掘數
			BeginPlot( T_ID , "lua_mika_2012hallow_obj2_04" , 0 )  -- 出現壞瓜
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

------------------------------  03 炸彈瓜  ------------------------------ 
function lua_mika_2012hallow_obj3_01()   --炸彈  --OwnerID() 玩家
	BeginPlot( TargetID() , "lua_mika_2012hallow_obj3_02" , 0 )  
end

-- 這段只要改連結事件function就好
function lua_mika_2012hallow_obj3_02()   
	local O_ID = OwnerID() --地板
	local T_ID = TargetID()  --玩家

	if ReadRoleValue( T_ID , EM_RoleValue_SpellMagicID ) ~= 0 then  -- 施法中就不跑
		return
	end

	AttachCastMotionTool( T_ID , 212076 ) -- 將武器置換成空手
	if BeginCastBarEvent( T_ID, O_ID,"[SC_111813_YU_25]", 30, ruFUSION_ACTORSTATE_MINING_BEGIN, ruFUSION_ACTORSTATE_MINING_END, 0, "lua_mika_2012hallow_obj3_03" ) ~= 1 then
		ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
		return
	else
		AttachCastMotionTool( T_ID, 210508 ); --CastingBar觸發成功，置換武器為圓鍬
	end
end

function lua_mika_2012hallow_obj3_03( ObjID, CheckStatus )
	local O_ID = OwnerID() -- 玩家
	local T_ID = TargetID()  -- 地板

	if ReadRoleValue( O_ID , EM_RoleValue_SpellMagicID ) ~= 0 then  -- 施法中就不跑
		return
	end

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
			AddRoleValue(O_ID, EM_LuaValueFlag_UseItem42 , 1 )  -- 記錄玩家挖掘數

			BeginPlot( T_ID , "lua_mika_2012hallow_obj3_04" , 0 )  -- 出現炸彈瓜
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

-- 出現炸彈瓜
function lua_mika_2012hallow_obj3_04()
	local O_ID = OwnerID() -- 地板
	local T_ID = TargetID()  -- 玩家
	local RoomID = ReadRoleValue( O_ID ,EM_RoleValue_RoomID)

	local OBJ = LuaFunc_CreateObjByObj ( 121412 , O_ID )  -- 按照物件位置產生物件  
	SetModeEx( OBJ    , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( OBJ    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( OBJ    , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( OBJ    , EM_SetModeType_Mark, true )--標記
	SetModeEx( OBJ    , EM_SetModeType_Move, false )--移動
	SetModeEx( OBJ    , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( OBJ    , EM_SetModeType_HideName, true )--名稱
	SetModeEx( OBJ   , EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( OBJ   , EM_SetModeType_Show , True ) --顯示
	SetModeEx( OBJ   , EM_SetModeType_Fight , false )--可砍殺攻擊
	AddToPartition( OBJ, RoomID) 

	ScriptMessage( OBJ  , -1 , 1 , "|cffff00ff" .."[SC_2012HALLOW_MALA_18]".. "|r" , 0 ) 
	NPCSAY(OBJ, "[SC_2012HALLOW_MALA_13]" )	-- 輪到哪個傢伙鑰讓我炸哩？
	BeginPlot(OBJ, "lua_mika_2012hallow_obj3_05", 0 )
end

function lua_mika_2012hallow_obj3_05()
	local OID = OwnerID()
	setplot(OID, "touch", "lua_mika_2012hallow_obj3_06", 30 )
end

function lua_mika_2012hallow_obj3_06()
	local OID = OwnerID()  --玩家
	local TID = TargetID()  -- 瓜

	if CheckBuff(TID, 623500) == true then  -- 瓜cd
		NPCSAY(TID, "[SC_2012HALLOW_MALA_25]" )	-- 讓我休息一下吧，嘻嘻！
	else
		if CheckBuff(OID, 623466)  == false then  -- buff 炸彈瓜
			WriteRoleValue(OID, EM_RoleValue_Register+3, TID)  -- 將瓜寫入玩家R+3
			WriteRoleValue(TID, EM_RoleValue_Register+3, OID)  -- 將玩家寫入瓜R+3
			ScriptMessage( TID  , -1 , 1 , "|cffff00ff" .."[SC_2012HALLOW_MALA_32]".. "|r" , 0 ) 
			AddBuff(OID, 623466, 0, -1 )  -- 給玩家技能Buff X秒鐘
		else
			NPCSAY(TID, "[SC_2012HALLOW_MALA_14]" )	-- 快轟炸吧！別讓我等！
		end
	end
end

--  法術集合 檢查
function lua_mika_2012hallow_obj3_07()
	local OID = OwnerID()  -- 玩家
	local TID = TargetID()  -- 目標
	local OrgID = ReadRoleValue( TID , EM_RoleValue_OrgID ) -- 目標的orgid 
	local pumpkin = ReadRoleValue(OID, EM_RoleValue_Register+3 )  -- 炸彈瓜

	if OrgID == 121407 then  -- 墳墓
		return true
	else
		NPCSAY(pumpkin, "[SC_2012HALLOW_MALA_15]" )	-- 我炸不了這傢伙，換個別的吧！
		return false
	end
end


-- 基本法術 執行
function lua_mika_2012hallow_obj3_08()
	local OID = OwnerID()  -- 玩家
	local TID = TargetID()  -- 目標
	local pumpkin = ReadRoleValue(OID, EM_RoleValue_Register+3 )  -- 炸彈瓜

	CancelBuff(OID, 623466 )
	CastSpell(pumpkin, TID, 850414 )   -- 炸彈轟炸  只有特效
	Beginplot(TID, "lua_mika_2012hallow_obj3_09" ,0 )
	AddBuff(pumpkin, 623500, 0, 60 )  -- 給瓜Buff X秒鐘 CD用  暈眩
	WriteRoleValue( OID, EM_RoleValue_Register+3, 0 )  -- 清空R3

end

function lua_mika_2012hallow_obj3_09()
	local OID = OwnerID()  -- 墳墓
	local mist = ReadRoleValue(OID, EM_RoleValue_Register+8 )  -- 產生的霧

	sleep(5)
	Delobj(mist)
	sleep(5)
--	say(OID, "dead")
	Delobj(OID)

end


------------------------------ 04 陷阱  ------------------------------ 

function lua_mika_2012hallow_obj4_01()   --炸彈  --OwnerID() 玩家
	BeginPlot( TargetID() , "lua_mika_2012hallow_obj4_02" , 0 )  
end

-- 這段只要改連結事件function就好
function lua_mika_2012hallow_obj4_02()   
	local O_ID = OwnerID() --地板
	local T_ID = TargetID()  --玩家

	if ReadRoleValue( T_ID , EM_RoleValue_SpellMagicID ) ~= 0 then  -- 施法中就不跑
		return
	end

	AttachCastMotionTool( T_ID , 212076 ) -- 將武器置換成空手
	if BeginCastBarEvent( T_ID, O_ID,"[SC_111813_YU_25]", 30, ruFUSION_ACTORSTATE_MINING_BEGIN, ruFUSION_ACTORSTATE_MINING_END, 0, "lua_mika_2012hallow_obj4_03" ) ~= 1 then
		ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
		return
	else
		AttachCastMotionTool( T_ID, 210508 ); --CastingBar觸發成功，置換武器為圓鍬
	end
end

function lua_mika_2012hallow_obj4_03( ObjID, CheckStatus )
	local O_ID = OwnerID() -- 玩家
	local T_ID = TargetID()  -- 地板

	if ReadRoleValue( O_ID , EM_RoleValue_SpellMagicID ) ~= 0 then  -- 施法中就不跑
		return
	end

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			EndCastBar( O_ID, CheckStatus );

			SetPlot( T_ID,"touch","",0 )
			local RoomID = ReadRoleValue( O_ID ,EM_RoleValue_RoomID) 

			SetModeEx( T_ID  , EM_SetModeType_Mark, false )--標記
			SetModeEx( T_ID  , EM_SetModeType_HideName, true )--名稱
			Hide(T_ID)
			AddRoleValue(O_ID, EM_LuaValueFlag_UseItem42 , 1 )  -- 記錄玩家挖掘數

			BeginPlot( T_ID , "lua_mika_2012hallow_obj4_04" , 0 )  -- 出現陷阱
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

-- 出現陷阱
function lua_mika_2012hallow_obj4_04()
	local O_ID = OwnerID() -- 地板
	local T_ID = TargetID()  -- 玩家

	local RoomID = ReadRoleValue( O_ID ,EM_RoleValue_RoomID)
	local objid = 121404 -- 陷阱物件id

	local OBJ = LuaFunc_CreateObjByObj ( objid , O_ID )  -- 按照物件位置產生物件  
	SetModeEx( OBJ    , EM_SetModeType_Mark, false )--標記
	SetModeEx( OBJ    , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( OBJ    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( OBJ    , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( OBJ    , EM_SetModeType_Move, true )--移動
	SetModeEx( OBJ    , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( OBJ    , EM_SetModeType_HideName, true )--名稱
	SetModeEx( OBJ   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( OBJ   , EM_SetModeType_Show , True ) --不顯示
	SetModeEx( OBJ   , EM_SetModeType_Fight , false )--可砍殺攻擊
	AddToPartition( OBJ, RoomID)  -- 使物件產生
	Hide( OBJ )
	sleep(5)
	Show( OBJ ,RoomID)

	ScriptMessage( T_ID , -1 , 1 , "|cffff00ff" .."[SC_2012HALLOW_MALA_19]".. "|r" , 0 ) 

	BeginPlot( OBJ , "lua_mika_2012hallow_obj4_05" , 0 )  
	Delobj(O_ID)  -- 刪除地板

end

function lua_mika_2012hallow_obj4_05()
	local O_ID = OwnerID() -- 陷阱
	local R = Rand(5)+1 
	sleep(15)
	While true do 
		CastSpell(O_ID, O_ID, 850400 )
		sleep(15+R)
	end
end



------------------------------  鬼墓 ------------------------------ 

function lua_mika_2012hallow_obj5_01()   --炸彈  --OwnerID() 玩家
	BeginPlot( TargetID() , "lua_mika_2012hallow_obj5_02" , 0 )  
end

-- 這段只要改連結事件function就好
function lua_mika_2012hallow_obj5_02()   
	local O_ID = OwnerID() --地板
	local T_ID = TargetID()  --玩家

	if ReadRoleValue( T_ID , EM_RoleValue_SpellMagicID ) ~= 0 then  -- 施法中就不跑
		return
	end

	AttachCastMotionTool( T_ID , 212076 ) -- 將武器置換成空手
	if BeginCastBarEvent( T_ID, O_ID,"[SC_111813_YU_25]", 30, ruFUSION_ACTORSTATE_MINING_BEGIN, ruFUSION_ACTORSTATE_MINING_END, 0, "lua_mika_2012hallow_obj5_03" ) ~= 1 then
		ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
		return
	else
		AttachCastMotionTool( T_ID, 210508 ); --CastingBar觸發成功，置換武器為圓鍬
	end
end

function lua_mika_2012hallow_obj5_03( ObjID, CheckStatus )
	local O_ID = OwnerID() -- 玩家
	local T_ID = TargetID()  -- 地板

	if ReadRoleValue( O_ID , EM_RoleValue_SpellMagicID ) ~= 0 then  -- 施法中就不跑
		return
	end

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
			AddRoleValue(O_ID, EM_LuaValueFlag_UseItem42 , 1 )  -- 記錄玩家挖掘數

			BeginPlot( T_ID , "lua_mika_2012hallow_obj5_04" , 0 )  -- 出現鬼墓
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

-- 出現鬼墓
function lua_mika_2012hallow_obj5_04()
	local O_ID = OwnerID() -- 地板
	local T_ID = TargetID()  -- 玩家
	local RoomID = ReadRoleValue( O_ID ,EM_RoleValue_RoomID)
	local ghostlist = {107346, 107347, 107348}
	local R = Rand(3)+1 -- 1. 2

	-- 產生鬼墓
	local OBJ = LuaFunc_CreateObjByObj ( 121407 , O_ID )  -- 按照物件位置產生物件  
	SetModeEx( OBJ    , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( OBJ    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( OBJ    , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( OBJ    , EM_SetModeType_Mark, True )--標記
	SetModeEx( OBJ    , EM_SetModeType_Move, false )--移動
	SetModeEx( OBJ    , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( OBJ    , EM_SetModeType_HideName, true )--名稱
	SetModeEx( OBJ   , EM_SetModeType_ShowRoleHead, True )--頭像框
	SetModeEx( OBJ   , EM_SetModeType_Show , True ) --顯示
	SetModeEx( OBJ   , EM_SetModeType_Fight , false )--可砍殺攻擊

	local mist = LuaFunc_CreateObjByObj ( 121410 , OBJ )  -- 按照物件位置產生物件  
	SetModeEx( mist    , EM_SetModeType_Mark, false )--標記
	SetModeEx( mist    , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( mist    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( mist    , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( mist    , EM_SetModeType_Move, false )--移動
	SetModeEx( mist    , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( mist    , EM_SetModeType_HideName, true )--名稱
	SetModeEx( mist   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( mist   , EM_SetModeType_Show , True ) --顯示
	SetModeEx( mist   , EM_SetModeType_Fight , false )--可砍殺攻擊
	sleep(5)
	AddToPartition( OBJ, RoomID) 
	AddToPartition( mist, RoomID) 

	WriteRoleValue(obj, EM_RoleValue_Register+8, mist  ) -- 將mist寫入墳墓r8
	Sleep(15)

	-- 產生鬼
	local ghost = LuaFunc_CreateObjByObj ( ghostlist[R] , OBJ )  -- 按照物件位置產生物件  
	SetModeEx( ghost    , EM_SetModeType_Strikback, true )--反擊
	SetModeEx( ghost    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( ghost    , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( ghost    , EM_SetModeType_Mark, true )--標記
	SetModeEx( ghost    , EM_SetModeType_Move, true )--移動
	SetModeEx( ghost    , EM_SetModeType_Searchenemy, true )--索敵
	SetModeEx( ghost    , EM_SetModeType_HideName, true )--名稱
	SetModeEx( ghost   , EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( ghost   , EM_SetModeType_Show , True ) --顯示
	SetModeEx( ghost   , EM_SetModeType_Fight , true )--可砍殺攻擊

	sleep(5)
	AddToPartition( ghost, RoomID)  -- 使鬼產生
	ScriptMessage( O_ID , -1 , 1 , "|cffff00ff" .."[SC_2012HALLOW_MALA_20]".. "|r" , 0 ) 

	BeginPlot(obj, "lua_mika_2012hallow_obj5_05", 0 )  -- 掃鬼死掉沒

	WriteRoleValue(ghost, EM_RoleValue_Register+9, obj )  -- 將墳墓寫入鬼怪r9
	WriteRoleValue(obj, EM_RoleValue_Register+9, ghost  ) -- 將鬼寫入墳墓r9
	Beginplot(ghost, "lua_mika_2012hallow_obj5_06", 0 ) -- 檢查戰鬥, 非戰鬥狀態才跑隨機移動劇情

end

--資料庫npc設定 
function lua_mika_2012hallow_obj5_07()
	local Ghost = OwnerID()
	AddBuff(ghost, 623467, 0, -1 )
--	say(ghost, "addbuff")
end

-- 墳墓掃怪死亡沒
function lua_mika_2012hallow_obj5_05()
	local Grave = OwnerID()
	local RoomID = ReadRoleValue( Grave ,EM_RoleValue_RoomID)
	local ghostlist = {107346, 107347, 107348}
	local R = Rand(3)+1 -- 1. 2

	while true do 
		local key = ReadRoleValue(grave, EM_RoleValue_Register+2 )
		if key == 99 then
		--	say(grave, "key ="..key )
			-- 重生鬼
			sleep(100)  -- 10 秒
			local ghost = LuaFunc_CreateObjByObj ( ghostlist[R] , Grave )  -- 按照物件位置產生物件  
			SetModeEx( ghost    , EM_SetModeType_Strikback, true )--反擊
			SetModeEx( ghost    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( ghost    , EM_SetModeType_Obstruct, false )--阻擋
			SetModeEx( ghost    , EM_SetModeType_Mark, true )--標記
			SetModeEx( ghost    , EM_SetModeType_Move, true )--移動
			SetModeEx( ghost    , EM_SetModeType_Searchenemy, true )--索敵
			SetModeEx( ghost    , EM_SetModeType_HideName, true )--名稱
			SetModeEx( ghost   , EM_SetModeType_ShowRoleHead, true )--頭像框
			SetModeEx( ghost   , EM_SetModeType_Show , True ) --顯示
			SetModeEx( ghost   , EM_SetModeType_Fight , true )--可砍殺攻擊
			sleep(5)
			AddToPartition( ghost, RoomID)  -- 使鬼產生
			WriteRoleValue(grave, EM_RoleValue_Register+2, 0 )
			WriteRoleValue(ghost, EM_RoleValue_Register+9, Grave )  -- 將墳墓寫入鬼怪r9
			Beginplot(ghost, "lua_mika_2012hallow_obj5_06", 0 ) -- 檢查戰鬥, 非戰鬥狀態才跑隨機移動劇情
		end
		sleep(30)
	end


end

-- 檢查是否戰鬥狀態, 非戰鬥狀態就隨機移動
function lua_mika_2012hallow_obj5_06()
	local ghost = OwnerID()

	local x = ReadRoleValue(ghost, EM_RoleValue_X )
	local y = ReadRoleValue(ghost, EM_RoleValue_Y )
	local z = ReadRoleValue(ghost, EM_RoleValue_Z )
	local Range = 30+Rand(15)  --亂數移動範圍
	local timer = 0
	local movetime = 3  -- 每x秒隨機移動一次 

	while true do 
		timer = timer + 1 
		local attack =  ReadRoleValue( ghost , EM_RoleValue_AttackTargetID ) 
--		say(ghost, "now timer ="..timer)
---		say(ghost, "attackflag ="..attack )

		if timer%movetime == 0 then -- 每x秒隨機移動一次
			if attack == 0 then --檢查是否離開戰鬥 如果沒戰鬥, 就以原本位置隨機move
			--	say(ghost, "move" )
				MoveDirect( ghost, X+math.random(-Range,Range), Y, Z+math.random(-Range,Range) )
			end
		end
		sleep(10)
	end
end

------------------------------  治療  ------------------------------ 
function lua_mika_2012hallow_obj6_01()   --炸彈  --OwnerID() 玩家
	BeginPlot( TargetID() , "lua_mika_2012hallow_obj6_02" , 0 )  
end

-- 這段只要改連結事件function就好
function lua_mika_2012hallow_obj6_02()   
	local O_ID = OwnerID() --地板
	local T_ID = TargetID()  --玩家

	if ReadRoleValue( T_ID , EM_RoleValue_SpellMagicID ) ~= 0 then  -- 施法中就不跑
		return
	end

	AttachCastMotionTool( T_ID , 212076 ) -- 將武器置換成空手
	if BeginCastBarEvent( T_ID, O_ID,"[SC_111813_YU_25]", 30, ruFUSION_ACTORSTATE_MINING_BEGIN, ruFUSION_ACTORSTATE_MINING_END, 0, "lua_mika_2012hallow_obj6_03" ) ~= 1 then
		ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
		return
	else
		AttachCastMotionTool( T_ID, 210508 ); --CastingBar觸發成功，置換武器為圓鍬
	end
end

function lua_mika_2012hallow_obj6_03( ObjID, CheckStatus )
	local O_ID = OwnerID() -- 玩家
	local T_ID = TargetID()  -- 地板

	if ReadRoleValue( O_ID , EM_RoleValue_SpellMagicID ) ~= 0 then  -- 施法中就不跑
		return
	end

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
			AddRoleValue(O_ID, EM_LuaValueFlag_UseItem42 , 1 )  -- 記錄玩家挖掘數

			BeginPlot( T_ID , "lua_mika_2012hallow_obj6_04" , 0 )  -- 出現治癒小南瓜
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

-- 出現治癒小南瓜
function lua_mika_2012hallow_obj6_04()
	local O_ID = OwnerID() -- 地板
	local T_ID = TargetID()  -- 玩家

	local RoomID = ReadRoleValue( O_ID ,EM_RoleValue_RoomID)
	local objid = 121411 -- 小南瓜 物件id

	local OBJ = LuaFunc_CreateObjByObj ( objid , O_ID )  -- 按照物件位置產生物件  
	SetModeEx( OBJ    , EM_SetModeType_Mark, false )--標記
	SetModeEx( OBJ    , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( OBJ    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( OBJ    , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( OBJ    , EM_SetModeType_Move, true )--移動
	SetModeEx( OBJ    , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( OBJ    , EM_SetModeType_HideName, true )--名稱
	SetModeEx( OBJ   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( OBJ   , EM_SetModeType_Show , True ) --不顯示
	SetModeEx( OBJ   , EM_SetModeType_Fight , false )--可砍殺攻擊
	AddToPartition( OBJ, RoomID) 
	Hide( OBJ )
	sleep(5)
	Show( OBJ ,RoomID)

	ScriptMessage( O_ID , -1 , 1 , "|cffff00ff" .."[SC_2012HALLOW_MALA_21]".. "|r" , 0 ) 

	Sleep(10)
	NPCSAY(OBJ, "[SC_2012HALLOW_MALA_27]") --嘿嘿，讓我治療一下吧！
	CastSpell(OBJ, T_ID,  850399 ) -- 施放治癒術 
	BeginPlot(OBJ, "lua_mika_2012hallow_obj6_05", 0 )
end

function lua_mika_2012hallow_obj6_05()
	local O_ID = OwnerID() -- 小南瓜
	sleep(20)
	DelObj(O_ID)

end
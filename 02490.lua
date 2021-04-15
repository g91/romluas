-- 新版稱號任務 物品使用劇情

-----活動任務相關物品-------------------------------------------

function Lua_mika_240618( Option )      -- 奪寶遊戲特殊道具_火砲置換捲軸

	local PlayerID = OwnerID()
	local PackageID = 203029		-- 將 範圍50內的  封印(巨型藤蔓) 轉換為 封印(重型火砲)
	local ZoneID = ReadRoleValue(OwnerID() ,EM_RoleValue_ZoneID )
	local tree = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113110, 50 , 1)     

	if ( Option == "CHECK" ) then
		if ( ZoneID ~= 353 ) then
			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_DAN_111700_37]" , C_SYSTEM )  --不可在此區使用
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_DAN_111700_37]" , C_SYSTEM )  --不可在此區使用
			return false
		elseif tree[0] == -1 then	
			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_113120_MALA2_61]" , C_SYSTEM )  --目標不在作用範圍內。
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_113120_MALA2_61]" , C_SYSTEM )  --目標不在作用範圍內。
			return false
		elseif CheckBuff( OwnerID() , 502864 ) == true then --定身狀態(也許進行教學)
	
			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_113120_MALA2_84]" , C_SYSTEM )  --目標不在作用範圍內。
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_113120_MALA2_84]" , C_SYSTEM )  --目標不在作用範圍內。
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) and ( ZoneID == 353 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_113120_MALA2_62]" , C_SYSTEM )  --重置OK
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_113120_MALA2_62]" , C_SYSTEM )  --重置OK

		--------------------------------------------------------------------------------------
			-- 2011.08.12  殺死-NPC  使用巫咒卷軸(火砲置換) 106274
				local npcid = 106274
				DW_QietKillOne(OwnerID(), npcid )
			--	say(OwnerID(), "kill id = "..npcid )
		--------------------------------------------------------------------------------------

		local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
--		local tree = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113110, 50 , 1)     

		if tree[0] ~= -1 then
			SetPlot( tree[0]  ,"touch",  "" , 0 ) 
			AddBuff( OwnerID() ,503991 ,1 , 3 ); --火焰領域特效

			local OwnerX = ReadRoleValue( tree[0] , EM_RoleValue_X ) 
			local OwnerY = ReadRoleValue( tree[0] , EM_RoleValue_Y ) 
			local OwnerZ = ReadRoleValue( tree[0] , EM_RoleValue_Z ) 
			local OwnerDIR = ReadRoleValue( tree[0] , EM_RoleValue_Dir ) 

			local NewfloorX = CreateObj( 113109 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)

			SetModeEx( NewfloorX , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( NewfloorX , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( NewfloorX , EM_SetModeType_Move, false )--移動
			SetModeEx( NewfloorX , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( NewfloorX , EM_SetModeType_Mark, true )--標記
			SetModeEx( NewfloorX , EM_SetModeType_HideName, false )--名稱
			SetModeEx( NewfloorX , EM_SetModeType_Obstruct, true )--阻擋

			Hide(NewfloorX)
			Show( NewfloorX,RoomID)		
			AddToPartition( NewfloorX , RoomID )  
			Delobj( tree[0]  )		
		end
	end
end




-----系統任務相關物品-------------------------------------------


-- 表情書-哭泣
function lua_mika_240199_check()
	local voc = ReadRoleValue(OwnerID(), EM_RoleValue_VOC ) -- 自己主職
	local voc_target = ReadRoleValue(TargetID(), EM_RoleValue_VOC ) -- 對方主職
	
	if ( TargetID() == OwnerID() )   then   --若對象是自己
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_424142_1]" , 0 ) --使用目標錯誤！
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_424142_1]" , 0 ) 
		return false
	else
		if voc == voc_target then
			return true
		else
			ScriptMessage( OwnerID(),OwnerID(), 1,"[SC_424142_1]", 0)	-- 使用目標錯誤！
			ScriptMessage( OwnerID(),OwnerID(), 0,"[SC_424142_1]", 0)	-- 使用目標錯誤！
			return false
		end
	end

end

function lua_mika_240199_use()
	DW_CancelTypeBuff( 68 , OwnerID()) --騎乘坐騎時，點擊下馬

	ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_TITLEQUEST_08][$SETVAR1="..GetName(TargetID() ).."]" , C_SYSTEM) 	-- 你趴在[$VAR1]身上放聲大哭。
	ScriptMessage( TargetID(), TargetID(),  0,"[SC_TITLEQUEST_09][$SETVAR1="..GetName(OwnerID() ).."]" , C_SYSTEM)	-- [$VAR1]趴在你身上放聲大哭。

	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_CRY )
	DW_QietKillOne(OwnerID(), 106252 )
end
-------------------------------
--表情書-敬禮 
function lua_mika_240200_check()
	local sex = ReadRoleValue(OwnerID(), EM_RoleValue_SEX ) -- 自己性別
	local sex_target = ReadRoleValue(TargetID(), EM_RoleValue_SEX ) -- 對方性別

	if ( TargetID() == OwnerID() )   then   --若對象是自己
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_424142_1]" , 0 ) --使用目標錯誤！
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_424142_1]" , 0 ) 
		return false
	else
		if sex ~= sex_target then 
			return true
		else
			ScriptMessage( OwnerID(),OwnerID(), 1,"[SC_424142_1]", 0)	-- 使用目標錯誤！
			ScriptMessage( OwnerID(),OwnerID(), 0,"[SC_424142_1]", 0)	-- 使用目標錯誤！
			return false
		end
	end
end

function lua_mika_240200_use()
	DW_CancelTypeBuff( 68 , OwnerID()) --騎乘坐騎時，點擊下馬

	ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_TITLEQUEST_10][$SETVAR1="..GetName(TargetID() ).."]" , C_SYSTEM )	-- 你對[$VAR1]有禮貌地行了禮。
	ScriptMessage( TargetID(), TargetID(),  0,"[SC_TITLEQUEST_11][$SETVAR1="..GetName(OwnerID() ).."]" , C_SYSTEM )	-- [$VAR1]對你有禮貌地行了禮。

	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SALUTE2 )
	DW_QietKillOne(OwnerID(), 106253 )

end

-------------------------------
--表情書-做鬼臉 
function lua_mika_240201_check()
	local Race = ReadRoleValue(OwnerID(), EM_RoleValue_RACE ) -- 自己種族
	local Race_target = ReadRoleValue(TargetID(), EM_RoleValue_RACE ) -- 對方種族

	if ( TargetID() == OwnerID() )   then   --若對象是自己
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_424142_1]" , 0 ) --使用目標錯誤！
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_424142_1]" , 0 ) 
		return false
	else
		if Race == Race_target then
			return true
		else
			ScriptMessage( OwnerID(),OwnerID(), 1,"[SC_424142_1]", 0)	-- 使用目標錯誤！
			ScriptMessage( OwnerID(),OwnerID(), 0,"[SC_424142_1]", 0)	-- 使用目標錯誤！
			return false
		end
	end
end

function lua_mika_240201_use()
	DW_CancelTypeBuff( 68 , OwnerID()) --騎乘坐騎時，點擊下馬

	ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_TITLEQUEST_14][$SETVAR1="..GetName(TargetID() ).."]" , C_SYSTEM )
	ScriptMessage( TargetID(), TargetID(),  0,"[SC_TITLEQUEST_15][$SETVAR1="..GetName(OwnerID() ).."]" , C_SYSTEM )

	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_CUTE1 )
	DW_QietKillOne(OwnerID(), 106254 )
end
-------------------------------
--表情書-踢踏舞 
function lua_mika_240202_check()

	if ( TargetID() == OwnerID() )   then   --若對象是自己
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_424142_1]" , 0 ) --使用目標錯誤！
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_424142_1]" , 0 ) 
		return false
	else
		return true
	end
end


function lua_mika_240202_use()
	DW_CancelTypeBuff( 68 , OwnerID()) --騎乘坐騎時，點擊下馬

	ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_TITLEQUEST_12][$SETVAR1="..GetName(TargetID() ).."]" , C_SYSTEM )
	ScriptMessage( TargetID(), TargetID(),  0,"[SC_TITLEQUEST_13][$SETVAR1="..GetName(OwnerID() ).."]" , C_SYSTEM )

	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_TAPDANCE )
	DW_QietKillOne(OwnerID(), 106255 )
end

-------------------------------
-- 測試指令
function lua_mika_killone(npcid)
	DW_QietKillOne(OwnerID(), npcid )
	say(OwnerID(), "kill id = "..npcid )
end

function lua_mika_playmotion(motionid)
	PlayMotion(OwnerID(), motionid )
end
---------------------------------------------------------------------------
function Lua_ying_240044_check()

	local X = ReadRoleValue( OwnerID() , EM_RoleValue_X ) --玩家X軸
	local Y = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) --玩家Y軸
	local Z = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) --玩家Z軸
--	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) -- RoomID
	local Key = { 545690 , 545710 , 545711 , 545712 , 545713 , 545714 , 545715 , 545716 , 545717 , 545718, 547728, 547729 }
	local Area = { 462 , 57 , 153 , 530 , 203 , 254 , 111 , 569 , 765 , 824, 233, 313 }
	local Item = { 240191 , 240193 , 240194 , 240195 , 240196 , 240197 , 240198 , 240619 , 240620 , 240621, 242416, 242417 }

	DW_CancelTypeBuff( 68 , OwnerID()) --騎乘坐騎時，點擊下馬

	for i = 1 , #Key  do 
		if CheckFlag( OwnerID() , key[i] ) == true then
		--	DebugMsg( OwnerID() , 0 , " Key = "..Key[i].." Area = "..Area[i] )
		--	if CheckMapID( X , Y , Z , Area[i] ) == true then
			if  DW_CheckMap(OwnerID(), Area[i] ) then
				if CountBodyItem( OwnerID() , Item[i] ) < 3 then
					return true
				else
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_TITLEQUEST_18]" , 0 ) --你已掘取了足夠的晶石！
					return false
				end
			else
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_TITLEQUEST_17]" , 0 )--非正確區域 --探勘地點不正確！
				return false
			end	
		end
	end
end
----------使用檢查LUA-法術集合-----------------------------------------------------------------------------------------------------------------------
function Lua_ying_498397_motion()
	local OID = OwnerID()
	local Type = GameObjInfo_Int( 498397, "ColdownType" ) -- 抓這個法術的冷卻類別(法術集合-施法冷卻次分類)

	if ReadRoleValue( OID, EM_RoleValue_Coldown_Item+Type ) == 0 then
		AttachCastMotionTool(  OID, 210327 ) --置換武器為十字鎬
		CallPlot( OID, "PlayMotion" , OID, ruFUSION_ACTORSTATE_MINING_BEGIN ) --挖礦動作
		CallPlot( OID , "Lua_ying_mining_motion", 0 )
		return true
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_mining_motion()
	local OID = OwnerID()
	
	for i = 1 , 6 do
		if ReadRoleValue( OID, EM_RoleValue_SpellMagicID ) == 0  then
			AttachCastMotionTool( OID , 212076 )  --置換武器為空手
			PlayMotion( OID, ruFUSION_ACTORSTATE_MINING_END ) --挖礦動作結束
			break
		end
		sleep(5)
	end
end
----------使用物品-探勘用十字鎬-------------------------------------------------------------------------------------------------------------------------
function Lua_ying_240044_use()

	local Key = { 545690 , 545710 , 545711 , 545712 , 545713 , 545714 , 545715 , 545716 , 545717 , 545718, 547728, 547729 }
	local Item = { 240191 , 240193 , 240194 , 240195 , 240196 , 240197 , 240198 , 240619 , 240620 , 240621, 242416, 242417 }

	AttachCastMotionTool( OwnerID() , 212076 )  --置換武器為空手
	CallPlot( OwnerID() , "PlayMotion" , OwnerID() , ruFUSION_ACTORSTATE_MINING_END ) --挖礦動作結束

	for i = 1 , table.getn(Key) , 1 do --1 , 10 , 1 do
		if CheckFlag( OwnerID() , key[i] ) == true then
			if Rand(100) < 30 then
				GiveBodyItem( OwnerID() , Item[i] , 1 )
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_TITLEQUEST_19][$SETVAR1=".."["..Item[i] .."]".."]" , C_SYSTEM ) --你成功掘取到了XX晶石！
			else
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_TITLEQUEST_20]" , C_SYSTEM ) --你在此處進行了探勘，但一無所獲…
			end
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------

function Lua_mika_240044_test()
	local mapid = { 
			201, 221, 222, 223, 224,
			225, 226, 231, 232, 233,
			235, 241, 242, 243, 244, 
			245, 246 
			}
		
	for i = 1, #mapid do	
		DebugMsg( OwnerID() , 0 , "map  -"..i )
		if  DW_CheckMap(OwnerID(), mapid[i] ) then
			DebugMsg( OwnerID() , 0 , "map  -"..i.."  = "..mapid[i] )
		end
	end

end
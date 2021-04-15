--====================================================================================================================

function Yuyu_GW_witchgood_1_01( Option ) --【插杖法術】詭譎之顏

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--職業
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --是否具有通行證 = GM測試

	if ( Option == "CHECK" ) then
	-- 2013.06.27 阿浩:整合Lua 使用前檢查，加入使用時檢查高度 --
		BeginPlot( OwnerID() , "Hao_GuildWar_Place_Tower_Check" , 0 )
	--
	--	if (ZoneID == 402) or (ZoneID == 51) or (PassCard > 0) then
	--		return true
	--	else
	--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DAN_111700_37]", C_SYSTEM ) --你無法在此區域使用該物品！
	--		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DAN_111700_37]", C_SYSTEM ) 
	--		return false
	--	end
	elseif ( Option == "USE" ) then
		BeginPlot( OwnerID()  , "Yuyu_GW_witchgood_1_02" , 0 )  
	end

end

function Yuyu_GW_witchgood_1_02() --【插杖法術】詭譎之顏施法

--	ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_MUSICPLAY_01]" , C_SYSTEM )  --你優雅的演奏了一段魔法音樂。

		if BeginCastBar( OwnerID(), "[SC_YU_GUILDWAR_BUILD_13]", 30 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then

			while true do
			sleep( 2 )
				local CastBarStatus = CheckCastBar( OwnerID() )
				if ( CastBarStatus ~= 0 ) then 
					if ( CastBarStatus > 0) then -- 成功
						result = "OKOK"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					elseif ( CastBarStatus < 0 ) then -- 失敗
						result = "DAME"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					end
				end
			end

			if ( result == "OKOK" ) then
				
				local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

				local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
				local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
				local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
				local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
				local PlayerGuildID = GetRoleCampID( OwnerID() )--玩家的陣營

				local StageNpc = CreateObj( 102366 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
				
				AddBuff( StageNpc ,505013 ,1 ,1 ); --縮小 
				SetModeEx( StageNpc, EM_SetModeType_Show, false )--顯示
				-- 2013.02.21 新增，修正玩家於公會城戰爭中使用詭譎之顏(206666)時，詭譎之顏會對玩家及建築物造成普攻傷害的問題
				SetModeEx( StageNpc , EM_SetModeType_Strikback , false )	--反擊
				SetModeEx( StageNpc , EM_SetModeType_Searchenemy , false )	-- 索敵
				SetStopAttack( StageNpc )
				-- 2013.02.23 詭譎之顏的機關等級會隨玩家角色等級開放的上限而成長
				local Player = OwnerID()
				local ServerMaxLv = ReadRoleValue( Player , EM_RoleValue_MaxLv )	-- 讀取伺服器設定的玩家等級上限
				WriteRoleValue( StageNpc , EM_RoleValue_LV , ServerMaxLv )
				--
				AddToPartition( StageNpc , RoomID )  
				AddBuff( StageNpc , 505921 , 39 , -1 )	--40%	--被玩家攻擊傷害折扣 法術等級 0 = 1%	
				SetRoleCampID( StageNpc, PlayerGuildID )--寫入陣營

				AddBuff( StageNpc ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)

				BeginPlot( OwnerID() , "Yuyu_GW_witchgood_delitem_01" , 0 )  
				SetPlot(  StageNpc, "dead","Yuyu_GW_witchgood_dead_01",0 )     
				SetModeEx( StageNpc   , EM_SetModeType_Mark, true )--標記
				SetModeEx( StageNpc  , EM_SetModeType_HideName, true )--名稱
				SetModeEx( StageNpc , EM_SetModeType_ShowRoleHead, true )--頭像框
				SetModeEx( StageNpc , EM_SetModeType_Fight , true )--可砍殺攻擊
				SetModeEx( StageNpc  , EM_SetModeType_Move, false )--移動
				SetModeEx( StageNpc , EM_SetModeType_Obstruct, false )--阻擋
				SetModeEx( StageNpc  , EM_SetModeType_Strikback, false )--反擊
				sleep(10)
				SetModeEx( StageNpc, EM_SetModeType_Show, true )--顯示	

				BeginPlot( StageNpc , "Yuyu_GW_witchgood_1_03" , 0 )  

			end
		end
end

function Yuyu_GW_witchgood_1_03() --【插杖法術】詭譎之顏施法

	local OID = OwnerID()

	while true do 
		CastSpelllv( OID , OID , 494821 , 0 )	--詭譎的禁制 : 緩速(502583)、倒地(509973)、防止倒地(509978)
		sleep(70)
	end

end


------------------------- 494821 詭譎的禁制 基本法術 檢查BUFF  -------------------------

--- 509978 無敵
function lua_509978_check()	-- 防止倒地前檢查
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
--	DebugMsg( TargetID() , RoomID , "Caster = "..OwnerID().." ,I am = "..TargetID() )
	if CheckBuff( TargetID() , 509973 ) == true then  -- 是否有倒地
		return true
	else
		return false
	end
end

-- 509973 倒地效果
function lua_509973_check()	-- 倒地前檢查
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
--	DebugMsg( TargetID() , RoomID , "Caster = "..OwnerID().." ,I am = "..TargetID() )
	if CheckBuff( TargetID() , 509978 ) == true then  -- 是否有防止倒地
		return false
	else
		return true
	end
end
-----------------------------------------------------------------------

--====================================================================================================================

function Yuyu_GW_witchgood_2_01( Option ) --【插杖法術】海縷之石

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--職業
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --是否具有通行證 = GM測試

	if ( Option == "CHECK" ) then
	-- 2013.06.27 阿浩:整合Lua 使用前檢查，加入使用時檢查高度 --
		BeginPlot( OwnerID() , "Hao_GuildWar_Place_Tower_Check" , 0 )
	--
	--	if (ZoneID == 402) or (ZoneID == 31) or (PassCard > 0) then
	--
	--			return true
	--	else
	--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DAN_111700_37]", C_SYSTEM ) --你無法在此區域使用該物品！
	--		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DAN_111700_37]", C_SYSTEM ) 
	--			return false
	--	end
	elseif ( Option == "USE" ) then
		BeginPlot( OwnerID()  , "Yuyu_GW_witchgood_2_02" , 0 )  
	end

end

function Yuyu_GW_witchgood_2_02() --【插杖法術】海縷之石

--	ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_MUSICPLAY_01]" , C_SYSTEM )  --你優雅的演奏了一段魔法音樂。

		if BeginCastBar( OwnerID(), "[SC_YU_GUILDWAR_BUILD_13]", 30 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then

			while true do
			sleep( 2 )
				local CastBarStatus = CheckCastBar( OwnerID() )
				if ( CastBarStatus ~= 0 ) then 
					if ( CastBarStatus > 0) then -- 成功
						result = "OKOK"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					elseif ( CastBarStatus < 0 ) then -- 失敗
						result = "DAME"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					end
				end
			end

			if ( result == "OKOK" ) then
				
				local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

				local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
				local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
				local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
				local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
				local PlayerGuildID = GetRoleCampID( OwnerID() )--玩家的陣營

				local StageNpc = CreateObj( 102367 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)

				AddBuff( StageNpc ,505013 ,1 ,1 ); --縮小 
				SetModeEx( StageNpc, EM_SetModeType_Show, false )--顯示
				-- 2013.02.21 新增，修正玩家於公會城戰爭中使用海縷之石(206667)時，海縷之石會對玩家及建築物造成普攻傷害的問題
				SetModeEx( StageNpc , EM_SetModeType_Strikback , false )	--反擊
				SetModeEx( StageNpc , EM_SetModeType_Searchenemy , false )	-- 索敵
				SetStopAttack( StageNpc )
				-- 2013.02.23 海縷之石的機關等級會隨玩家角色等級開放的上限而成長
				local Player = OwnerID()
				local ServerMaxLv = ReadRoleValue( Player , EM_RoleValue_MaxLv )	-- 讀取伺服器設定的玩家等級上限
				WriteRoleValue( StageNpc , EM_RoleValue_LV , ServerMaxLv )				
				--
				AddToPartition( StageNpc , RoomID )  
				AddBuff( StageNpc , 505921 , 39 , -1 )	--40%	--被玩家攻擊傷害折扣 法術等級 0 = 1%	
				SetRoleCampID( StageNpc, PlayerGuildID )--寫入陣營

				AddBuff( StageNpc ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)

				BeginPlot( OwnerID() , "Yuyu_GW_witchgood_delitem_02" , 0 )  
				SetPlot(  StageNpc, "dead","Yuyu_GW_witchgood_dead_01",0 )     
				SetModeEx( StageNpc   , EM_SetModeType_Mark, true )--標記
				SetModeEx( StageNpc  , EM_SetModeType_HideName, true )--名稱
				SetModeEx( StageNpc , EM_SetModeType_ShowRoleHead, true )--頭像框
				SetModeEx( StageNpc , EM_SetModeType_Fight , true )--可砍殺攻擊
				SetModeEx( StageNpc  , EM_SetModeType_Move, false )--移動
				SetModeEx( StageNpc , EM_SetModeType_Obstruct, false )--阻擋
				SetModeEx( StageNpc  , EM_SetModeType_Strikback, false )--反擊
				sleep(10)
				SetModeEx( StageNpc, EM_SetModeType_Show, true )--顯示	

				BeginPlot( StageNpc , "Yuyu_GW_witchgood_2_03" , 0 )  


			end
		end
end


function Yuyu_GW_witchgood_2_03() --【插杖法術】海縷之石

	local OID = OwnerID()

	while true do 
		CastSpelllv( OID , OID , 494820 , 0 )	--惡魔的禁制(禁言)
		sleep(50)
	end

end


--====================================================================================================================

function Yuyu_GW_witchgood_3_01( Option ) --【插杖法術】真知之眼

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--職業
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --是否具有通行證 = GM測試

	if ( Option == "CHECK" ) then
	-- 2013.06.27 阿浩:整合Lua 使用前檢查，加入使用時檢查高度 --
		BeginPlot( OwnerID() , "Hao_GuildWar_Place_Tower_Check" , 0 )
	--	
	--
	--
	--	if (ZoneID == 402) or (ZoneID == 31) or (PassCard > 0) then
	--
	--		return true
	--	else
	--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DAN_111700_37]", C_SYSTEM ) --你無法在此區域使用該物品！
	--		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DAN_111700_37]", C_SYSTEM ) 
	--			return false
	--	end
	elseif ( Option == "USE" ) then
		BeginPlot( OwnerID()  , "Yuyu_GW_witchgood_3_02" , 0 )  
	end

end

function Yuyu_GW_witchgood_3_02() --【插杖法術】真知之眼

--	ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_MUSICPLAY_01]" , C_SYSTEM )  --你優雅的演奏了一段魔法音樂。

		if BeginCastBar( OwnerID(), "[SC_YU_GUILDWAR_BUILD_13]", 30 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then

			while true do
			sleep( 2 )
				local CastBarStatus = CheckCastBar( OwnerID() )
				if ( CastBarStatus ~= 0 ) then 
					if ( CastBarStatus > 0) then -- 成功
						result = "OKOK"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					elseif ( CastBarStatus < 0 ) then -- 失敗
						result = "DAME"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					end
				end
			end

			if ( result == "OKOK" ) then
				
				local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

				local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
				local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
				local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
				local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
				local PlayerGuildID = GetRoleCampID( OwnerID() )--玩家的陣營

				local StageNpc = CreateObj( 102370 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)

				AddBuff( StageNpc ,505013 ,1 ,1 ); --縮小 
				SetModeEx( StageNpc, EM_SetModeType_Show, false )--顯示
				-- 2013.02.21 新增，修正玩家於公會城戰爭中使用真知之眼(206668)時，真知之眼會對玩家及建築物造成普攻傷害的問題
				SetModeEx( StageNpc , EM_SetModeType_Strikback , false )	--反擊
				SetModeEx( StageNpc , EM_SetModeType_Searchenemy , false )	-- 索敵
				SetStopAttack( StageNpc )
				-- 2013.02.23 真知之眼的機關等級會隨玩家角色等級開放的上限而成長
				local Player = OwnerID()
				local ServerMaxLv = ReadRoleValue( Player , EM_RoleValue_MaxLv )	-- 讀取伺服器設定的玩家等級上限
				WriteRoleValue( StageNpc , EM_RoleValue_LV , ServerMaxLv )				
				--			
				AddToPartition( StageNpc , RoomID )  
				AddBuff( StageNpc , 505921 , 39 , -1 )	--40%	--被玩家攻擊傷害折扣 法術等級 0 = 1%	
				SetRoleCampID( StageNpc, PlayerGuildID )--寫入陣營

				AddBuff( StageNpc ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)

				BeginPlot( OwnerID() , "Yuyu_GW_witchgood_delitem_03" , 0 )  
				SetPlot(  StageNpc, "dead","Yuyu_GW_witchgood_dead_01",0 )     
				SetModeEx( StageNpc   , EM_SetModeType_Mark, true )--標記
				SetModeEx( StageNpc  , EM_SetModeType_HideName, true )--名稱
				SetModeEx( StageNpc , EM_SetModeType_ShowRoleHead, true )--頭像框
				SetModeEx( StageNpc , EM_SetModeType_Fight , true )--可砍殺攻擊
				SetModeEx( StageNpc  , EM_SetModeType_Move, false )--移動
				SetModeEx( StageNpc , EM_SetModeType_Obstruct, false )--阻擋
				SetModeEx( StageNpc  , EM_SetModeType_Strikback, false )--反擊
				sleep(10)
				SetModeEx( StageNpc, EM_SetModeType_Show, true )--顯示	

				BeginPlot( StageNpc , "Yuyu_GW_witchgood_3_03" , 0 )  

			end
		end
end


function Yuyu_GW_witchgood_3_03() --【插杖法術】詭譎之顏施法

	local OID = OwnerID()

	while true do 
		CastSpelllv( OID , OID , 494822 , 0 )	--潛行的禁制(解除隱形)
		sleep(30)
	end

end


function Yuyu_GW_witchgood_3_04() --【插杖法術】詭譎之顏施法效果
	
	local PlayerGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID ) 
	local TargetIDGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID ) 

	if PlayerGuildID ~= BuildingGuildID then

		local Count = BuffCount ( TargetID())
		for i = 1 , Count do
			local BuffID = BuffInfo ( TargetID() ,Count- i , EM_BuffInfoType_BuffID )-- 基本法術ID
			if GameObjInfo_int ( BuffID , "AssistType" ) == 52 then --輔助法術類型：隱身
				CancelBuff(TargetID(),BuffID)
				AddBuff( TargetID() ,503141 ,0 ,3 ); --驚訝
				ScriptMessage( TargetID() , TargetID() , 2 , "[SC_YU_GUILDWAR_BUILD_40]", 1 ) 
				AddBuff( TargetID() ,502574 ,0 ,5 ); --震暈5秒
			--	break
			end
		end
	end

end




function Yuyu_GW_witchgood_dead_01()  --機關死亡劇情

	-- 2013.08.14 阿浩：修正Npc攻擊塔類物件時，會因為死亡劇情被 return false 而讓追逐距離遠超過資料庫中設定值的問題。
	DelObj( OwnerID() )
	--
--	BeginPlot( OwnerID() , "Yuyu_GW_witchgood_dead_02" , 0 )  
--	return false
end

function Yuyu_GW_witchgood_dead_02()  --機關死亡劇情

	AddBuff( OwnerID() , 503605 , 0 , -1 )		--起火燃燒
	PlayMotion( OwnerID() , 19) 
	sleep(10)
	PlayMotion( OwnerID() , 19) 
	sleep(10)
	PlayMotion( OwnerID() , 19) 
	sleep(20)
	CastSpell( OwnerID(), OwnerID(), 491002)
	sleep(30)
	AddBuff( OwnerID() , 506150 , 0 , -1 )		--坍塌冒煙
	sleep(5)
	Delobj(OwnerID())
end	

function Yuyu_GW_witchgood_delitem_01()  --使用後刪除物品 詭譎之顏
	DelBodyItem( OwnerID() , 206666 , 1 )
end

function Yuyu_GW_witchgood_delitem_02()  --使用後刪除物品 海縷之石
	DelBodyItem( OwnerID() , 206667 , 1 )
end

function Yuyu_GW_witchgood_delitem_03()  --使用後刪除物品 真知之眼
	DelBodyItem( OwnerID() , 206668 , 1 )
end

function Yuyu_GW_witchgood_delitem_04()  --使用後刪除物品 策反典籍
	DelBodyItem( OwnerID() , 206681 , 1 )
end
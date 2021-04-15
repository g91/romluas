function Lua_Hao_SONGKRAN_000( Option ) -- 潑水前確認

	if ( Option == "CHECK" ) then
		if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --施法對象是玩家
			if ( TargetID() == OwnerID() )   then   --若對象是自己
			--	local BuffType = 0
			--	local Count = BuffCount ( TargetID())
			--	for i = 0 , Count do
			--		local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID )
			--		if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
			--			BuffType = GameObjInfo_int ( BuffID , "AssistType" )
			--			break
			--		end
			--	end
			--	if BuffType == 68 then				       	    --/*有騎乘狀態
			--		ScriptMessage(OwnerID() , OwnerID() , 1 , "[SC_MOUNT_CAN_NOT_BE_USED]" , 0 )  --你無法在騎乘狀態下使用該物品。
			--		return false
			--	else
					if CheckBuff( TargetID() , 506326 ) == true then  -- 有潑水節祝福的狀態下
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC05]" , C_SYSTEM )	--使用對象已持有相同類型效果，無法使用。
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC05]"  , C_SYSTEM )	--
						return false
					else
						return true
					end
			--	end
			else	--若對象不是自己
				if CheckBuff( TargetID() , 506326 ) == true then  -- 有潑水節祝福的狀態下
					if GetDistance( OwnerID(), TargetID() )  <= 100 then
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC05]" , C_SYSTEM )	--使用對象已持有相同類型效果，無法使用。
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC05]"  , C_SYSTEM )	--
						return false
--					elseif GetDistance( OwnerID(), TargetID() )  > 100 then
					else
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_GAMEMSGEVENT_101]" , 0 )	--施法距離過遠。
--						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SYS_GAMEMSGEVENT_101]" , 0 )	--
						return false
					end
				else
					return true
				end
			end
		else -- 當對象非玩家，而為NPC等物件時
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_ONLY_FOR_PLAYER]" , C_SYSTEM )	--此物品只能對玩家使用。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_ONLY_FOR_PLAYER]"  , C_SYSTEM )	--此物品只能對玩家使用。
			return false
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_SONGKRAN_001() -- 茉莉花常駐

--	Say( TargetID() , "1" )	-- 物件
--	Say( OwnerID() , "2" )	-- 物件
	AddBuff( OwnerID() , 506324 , 0 , -1 )
--	SetPlot( OwnerID() , "touch" , "Lua_Hao_SONGKRAN_002" , 50 )
end	
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--function Lua_Hao_SONGKRAN_002() -- 採集茉莉花
--
----	Say( TargetID() , "3" )	-- 物件
----	Say( OwnerID() , "4" )	-- 玩家
--
----	SetPlot( TargetID() , "touch" , " " , 50 )
--
--	if ReadRoleValue( TargetID() , EM_RoleValue_PID) == 1 then 			--防止複數玩家於同時摘取花朵。
--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_AUCTION_WAIT_NEXT]" , 0)	--忙碌中，請稍候再試。
--		return									--
--	end										--
--	WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 )				--
--
--	if BeginCastBar( OwnerID() , "[SC_THAILAND_SONGKRAN_002]" , 30 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	
--	--/*開始施法，使用者 , 時間條上的文字 , 進行時間 , 起始動作 , 結束動作 , 中斷條件 ( 0為移動中斷 )		[SC_THAILAND_SONGKRAN_002] 摘取花朵
--
--		while true do
--		sleep( 2 )
--			local CastBarStatus = CheckCastBar( OwnerID() )
--			if ( CastBarStatus ~= 0 ) then 
--				if ( CastBarStatus > 0) then -- 成功
--					result = "OKOK"
--					EndCastBar( OwnerID() , CastBarStatus )
--					break
--				elseif ( CastBarStatus < 0 ) then -- 失敗
--					result = "DAME"
--					EndCastBar( OwnerID() , CastBarStatus )
--					break
--				end
--			end
--		end
--
--		if ( result == "OKOK" ) then
--
--			if CheckID( TargetID() ) == true then
--				if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then --檢查背包欄位
--
----					GiveBodyItem( OwnerID() , 207085 , 1 )
----					SetModeEx( TargetID() , EM_SetModeType_Mark , false )--標記
----					CancelBuff( TargetID() , 506324 )
----					SetModeEx( TargetID() , EM_SetModeType_Show, false )--顯示
----					sleep(0)
----					SetModeEx( TargetID() , EM_SetModeType_Mark , true )--標記
----					SetModeEx( TargetID() , EM_SetModeType_Show,  true )--顯示
----					AddBuff( TargetID() , 506324 , 0 , -1 )
--					WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )
--				else
--					ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --您的背包空間不足，請清理一下再來吧。
--					WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )
----					SetPlot( TargetID() , "touch" , "Lua_Hao_SONGKRAN_002" , 50 )
--				end	
--			end
--
--		elseif ( result == "DAME" ) then
--			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )	-- 防止複數玩家於同時點擊的問題
----			SetPlot( TargetID() , "touch" , "Lua_Hao_SONGKRAN_002" , 50 )
--		end
--	end
--end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_SONGKRAN_003() -- 碰觸任務NPC後，自動轉向

--	Say( TargetID() , "1" )	-- 玩家
--	Say( OwnerID() , "2" )	-- NPC

	AdjustFaceDir( TargetID(), OwnerID() , 0 ) --面向
	PlayMotion( TargetID() , 112 )
	LoadQuestOption( OwnerID() )  --載入任務模板

--	SetSpeakDetail( OwnerID() , "[SC_GERMANY_1YEAR_00]" ) -- 你想了解更多關於週年慶的事情嗎？
	AddSpeakOption(  OwnerID() , TargetID( ) , "[SC_THAILAND_SONGKRAN_004]" ,  "Lua_Hao_SONGKRAN_003_3" ,  0 ) ; --  什麼是潑水節。
	AddSpeakOption(  OwnerID() , TargetID( ) , "[SC_THAILAND_SONGKRAN_006]" ,  "Lua_Hao_SONGKRAN_003_4" ,  0 ) ; --  我該去哪找尋[206618]？
	AddSpeakOption(  OwnerID() , TargetID( ) , "[SC_THAILAND_SONGKRAN_008]" ,  "Lua_Hao_SONGKRAN_003_5" ,  0 ) ; --  [207084]還有另外的用處嗎？
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_SONGKRAN_003_1() -- 接受任務後，再執行的Script。

--	Say( TargetID() , "1" )	-- 玩家
--	Say( OwnerID() , "2" )	-- NPC

	AdjustFaceDir( OwnerID(), TargetID() , 0 ) --面向
	PlayMotion( OwnerID() , 106 )
	Sleep(20)
	PlayMotion( OwnerID() , 254 )
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_SONGKRAN_003_2() -- 完成任務後，再執行的Script。

--	Say( TargetID() , "3" )	-- 玩家
--	Say( OwnerID() , "4" )	-- NPC

	AdjustFaceDir( OwnerID(), TargetID() , 0 ) --面向
	PlayMotion( OwnerID() , 102 )
	Sleep(20)
	PlayMotion( OwnerID() , 251 )
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_SONGKRAN_003_3() -- 什麼是潑水節

	PlayMotion( TargetID() , 106 )
	AdjustFaceDir( TargetID(), OwnerID() , 0 ) --面向
	SetSpeakDetail( OwnerID() , "[SC_THAILAND_SONGKRAN_005]" ) 
	AddSpeakOption( OwnerID() , TargetID( ) , GetString("SO_BACK") , "Lua_Hao_SONGKRAN_003", 0 ) --回到上一頁
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_SONGKRAN_003_4() -- 我該去哪找尋[206618]？

	PlayMotion( TargetID() , 106 )
	AdjustFaceDir( TargetID(), OwnerID() , 0 ) --面向
	SetSpeakDetail( OwnerID() , "[SC_THAILAND_SONGKRAN_007]" ) 
	AddSpeakOption( OwnerID() , TargetID( ) , GetString("SO_BACK") , "Lua_Hao_SONGKRAN_003", 0 ) --回到上一頁
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_SONGKRAN_003_5() -- [207084]還有另外的用處嗎？

	PlayMotion( TargetID() , 106 )
	AdjustFaceDir( TargetID(), OwnerID() , 0 ) --面向
	SetSpeakDetail( OwnerID() , "[SC_THAILAND_SONGKRAN_009]" ) -- [207084]實在是供不應求，為了應付其他人的需求，節慶活動期間，只要你拿5個[207084]給我，我就用[207084]跟你交換歐。
	AddSpeakOption(  OwnerID() , TargetID( ) , "[SC_BEERDAY_29]" ,  "Lua_Hao_SONGKRAN_003_6" ,  0 ) ; -- 我想兌換。
	AddSpeakOption( OwnerID() , TargetID( ) , GetString("SO_BACK") , "Lua_Hao_SONGKRAN_003", 0 ) --回到上一頁
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_SONGKRAN_003_6() -- 好的，我想兌換。

	if CountBodyItem( OwnerID() , 207084 ) >= 5 then
		GiveBodyItem( OwnerID() , 203675 , 1 )
		DelBodyItem( OwnerID() , 207084 , 5 )
		CloseSpeak( OwnerID() )
		AdjustFaceDir( TargetID(), OwnerID() , 0 ) --面向
		PlayMotion( TargetID() , 251 )
	else
		SetSpeakDetail( OwnerID() , " [SC_112311_6]" ) -- 您所持有的數量不足，還不能兌換喔。
		AddSpeakOption( OwnerID() , TargetID( ) , GetString("SO_BACK") , "Lua_Hao_SONGKRAN_003", 0 ) --回到上一頁
		AdjustFaceDir( TargetID(), OwnerID() , 0 ) --面向
		PlayMotion( TargetID() , 107 )
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_SONGKRAN_004() -- 潑水效果

	local You = GetName( OwnerID() )
--	PlayMotion( OwnerID() , 115 )

	if ( TargetID() ~= OwnerID() ) then
		PlayMotion( TargetID() , 115 )
	else
		PlayMotion( TargetID() , 103 )
	end
	AddBuff( TargetID() , 506324 , 0 , 30 )

	if ( TargetID() ~= OwnerID() )   then   --若對象不是自己
		ScriptMessage( OwnerID() , TargetID() , 0 , You.."[SC_THAILAND_SONGKRAN_001]" , C_SYSTEM )	-- xxx 對你潑水，你感覺到一股暢快的清涼感。
		ScriptMessage( OwnerID() , TargetID() , 1 , You.."[SC_THAILAND_SONGKRAN_001]" , C_SYSTEM )	-- xxx 對你潑水，你感覺到一股暢快的清涼感。
	end
end

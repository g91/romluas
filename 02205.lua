
-----------------------------------------------------------------------------------------給介面的值
--距離下次結算的時間：SYS_WORLD_EVENT_END_TIME
--勢力比：SYS_WORLD_EVENT_INFLUENCE_SCORE
--獎勵時間：SYS_WORLD_EVENT_PRIZE_TIME
-----------------------------------------------------------------------------------------讓廠商能設定的值
--開啟設定結算時間功能開關：SETTING_TurnOn_WorldBattle_EVENT_END_TIME( 0 為關閉，1 為開放)
--設定結算時間(早)：SETTING_WorldBattle_EVENT_END_TIME1
--設定結算時間(晚)：SETTING_WorldBattle_EVENT_END_TIME2
----------------------------------------------------------------------------------------判斷使用
--是否開放獎勵：star_WorldBattle_Prize_On  ( 0 為關閉，1 為開放)
----------------------------------------------------------------------------------------
function star_WorldBattle_EventControl()
	SetWorldVar( "star_WorldBattle_Prize_On" , 0 )			--是否開放獎勵時間(0表示關，1表示開)
	SetWorldVar( "SYS_WORLD_EVENT_PRIZE_TIME" , 0 )
	local IsReset = 0			-----是否重置過
	local BonusNpc
	local NPCID = 105110
	local NPCFlag = 780843		--獎勵NPC用flag
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	while 1 do
		sleep(1)
		local CountDownBuff 	------計算時間用		
		local TimeCounter1 = 0
		local TimeCounter2 = 0
		local EndTime1 			------結算時間(白天)，小時
		local EndTime2 			------結算時間(晚上)，小時
		local EndMinute = 00 	------結算時間，分鐘

		if GetWorldVar( "SETTING_TurnOn_WorldBattle_EVENT_END_TIME" ) == 0 then
			EndTime1 = 10		------結算時間(白天)
			EndTime2 = 22		------結算時間(晚上)	
		elseif GetWorldVar( "SETTING_TurnOn_WorldBattle_EVENT_END_TIME" ) == 1 then
			EndTime1 = GetWorldVar( "SETTING_WorldBattle_EVENT_END_TIME1" )		------結算時間(白天)
			EndTime2 = GetWorldVar(	"SETTING_WorldBattle_EVENT_END_TIME2" ) 		------結算時間(晚上)
			if EndTime1 > EndTime2 then
				local SwitchTemp1 = EndTime1
				EndTime1 = EndTime2
				EndTime2 = SwitchTemp1
			end
		end		
		
		local MinusPerHR = 200	--每小時固定扣分
		local Score = -20		--起始勢力比分數
		local EndTime_Temp 
		local EndTime_Counter = 0
		SetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" , -20 )  --設定起始勢力分數
		
		local TestCounter = 0
		
		local TimeVal = GetLocaltime( 0 , 0 ) -- 取得系統時間的秒數, 從 1900 年開始算
		local hr = GetLocaltime( TimeVal , 1 )	-- 取得該時間值的小時
		local minute = GetLocaltime( TimeVal , 2 )	-- 取得該時間值的分 
		local second = GetLocaltime( TimeVal , 3 )	-- 取得該時間值的秒
		
		EndTime_Counter = star_WorldBattle_TimeCount(hr , minute , second , EndTime1 , EndTime2 , EndMinute)
		
		while 1 do
			sleep(10)	
			TimeVal = GetLocaltime( 0 , 0 ) -- 取得系統時間的秒數, 從 1900 年開始算
			hr = GetLocaltime( TimeVal , 1 )	-- 取得該時間值的小時
			minute = GetLocaltime( TimeVal , 2 )	-- 取得該時間值的分 
			second = GetLocaltime( TimeVal , 3 )	-- 取得該時間值的秒
			
			if EndTime_Counter ~= 0 then
				EndTime_Counter = EndTime_Counter - 1
				SetWorldVar( "SYS_WORLD_EVENT_END_TIME" , EndTime_Counter )
			end
			
			TestCounter = TestCounter + 1
			if TestCounter == 5 then				
				--Say(OwnerID() , "hr ="..hr)
				--Say(OwnerID() , "minute ="..minute)
				--Say(OwnerID() , "second ="..second)
				--Say(OwnerID() , "Score ="..GetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" ))
				--Say(OwnerID() , "EndTime ="..GetWorldVar( "SYS_WORLD_EVENT_END_TIME" ))
				--Say(OwnerID() , "PrizeTime ="..GetWorldVar( "SYS_WORLD_EVENT_PRIZE_TIME" ))
				TestCounter	= 0
			end
			
			if (hr == EndTime1 and minute == EndMinute) or (hr == EndTime2 and minute == EndMinute) then		--重置時間
				if IsReset == 0 then					
					if GetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" ) > 0 then
						SetWorldVar( "star_WorldBattle_Prize_On" , 1 )		--開放獎勵時間
						sleep(50)					
						BonusNpc = CreateObjByFlag( NPCID , NPCFlag , 1 , 1 )
						--BonusNpc = star_CreateObj_NoAdd( OwnerID() , NPCID , 20 , 0 , 0 , Room , 0 ) 
						SetModeEx( BonusNpc , EM_SetModeType_Show , false )			------不顯示
						SetModeEx( BonusNpc , EM_SetModeType_Move , false )			------不移動
						SetModeEx( BonusNpc , EM_SetModeType_Strikback , false )	------不反擊
						SetModeEx( BonusNpc , EM_SetModeType_Fight , false )		------不可砍殺
						SetModeEx( BonusNpc , EM_SetModeType_Searchenemy , false )	------不索敵
						SetModeEx( BonusNpc , EM_SetModeType_Mark , false )			------不可點選
						SetModeEx( BonusNpc , EM_SetModeType_NotShowHPMP , false )	------不show血條
						AddToPartition( BonusNpc , Room )
						WriteRoleValue( BonusNpc , EM_RoleValue_register1 , OwnerID() )
						BeginPlot( BonusNpc , "star_WorldBattle_BonusNPC" , 0 )
					end	
					IsReset = 1		-----代表已重置
					break
				end	
				if TimeCounter1 >= 0 then
					TimeCounter1 = TimeCounter1 + 1
					--Say(OwnerID() , "Counter_1 ="..TimeCounter1)
				end	
			elseif (hr ~= EndTime1 or hr ~= EndTime2) and minute == EndMinute then						--每小時扣分
				if TimeCounter2 == 0 then
					Score = GetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" )
					if (Score - MinusPerHR) <= -10000 then 
						SetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" , -10000 )
					else
						SetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" , Score - MinusPerHR )
					end	
					TimeCounter2 = TimeCounter2 + 1
					--Say(OwnerID() , "Counter_2 ="..TimeCounter2)
					--Say(OwnerID() , "Score_2 ="..GetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" ))
				elseif TimeCounter2 > 0 then 
					TimeCounter2 = TimeCounter2 + 1
					--Say(OwnerID() , "Counter_3 ="..TimeCounter2)
				end	
			else																--重置變數
				if TimeCounter1 ~= 0 then
					TimeCounter1 = 0
					IsReset = 0
					--Say(OwnerID() , "Clear 1" )
				elseif TimeCounter2 ~= 0 then
					TimeCounter2 = 0
					--Say(OwnerID() , "Clear 2" )
				end
			end
		end
	end	
end

function star_WorldBattle_TimeCount(hr , minute , second , EndTime1 , EndTime2 , EndMinute)		--計算時間使用
	local EndTime_Temp
	local EndTime_Counter
	if (hr < EndTime1) and (hr < EndTime2) then
		EndTime_Temp = (EndTime1-hr-1)*60*60 + (60-minute+EndMinute-1)*60 + (60 - second)
		EndTime_Counter = EndTime_Temp
		SetWorldVar( "SYS_WORLD_EVENT_END_TIME" , EndTime_Counter )
	elseif hr == EndTime1 then
		if minute < EndMinute then
			EndTime_Temp = (EndMinute-minute-1)*60 + (60 - second)
			EndTime_Counter = EndTime_Temp
			SetWorldVar( "SYS_WORLD_EVENT_END_TIME" , EndTime_Counter )
		elseif minute >= EndMinute then
			EndTime_Temp = (EndTime2-hr-1)*60*60 + (60-minute+EndMinute-1)*60 + (60 - second)
			EndTime_Counter = EndTime_Temp
			SetWorldVar( "SYS_WORLD_EVENT_END_TIME" , EndTime_Counter )
		end	
	elseif (hr > EndTime1) and (hr < EndTime2) then	
		EndTime_Temp = (EndTime2-hr-1)*60*60 + (60-minute+EndMinute-1)*60 + (60 - second)
		EndTime_Counter = EndTime_Temp
		SetWorldVar( "SYS_WORLD_EVENT_END_TIME" , EndTime_Counter )
	elseif hr == EndTime2 then
		if minute < EndMinute then
			EndTime_Temp = (EndMinute-minute-1)*60 + (60 - second)
			EndTime_Counter = EndTime_Temp
			SetWorldVar( "SYS_WORLD_EVENT_END_TIME" , EndTime_Counter )
		elseif minute >= EndMinute then
			EndTime_Temp = (24+EndTime1-hr-1)*60*60 + (60-minute+EndMinute-1)*60 + (60 - second)
			EndTime_Counter = EndTime_Temp
			SetWorldVar( "SYS_WORLD_EVENT_END_TIME" , EndTime_Counter )
		end		
	elseif (hr > EndTime2) and (hr > EndTime1) then
		EndTime_Temp = (24+EndTime1-hr-1)*60*60 + (60-minute+EndMinute-1)*60 + (60 - second)
		EndTime_Counter = EndTime_Temp
		SetWorldVar( "SYS_WORLD_EVENT_END_TIME" , EndTime_Counter )
	end	
	
	return EndTime_Counter
end

function star_WorldBattle_BonusNPC()		--獎勵NPC
	local ControlNPC = ReadRoleValue(OwnerID() , EM_RoleValue_register1)
	local TimeCounter = 0
	local BonusTime = 10800  -- 獎勵時間3小時
	while 1 do
		sleep(10)
		--TimeCounter = TimeCounter + 1
		BonusTime = BonusTime - 1
		SetWorldVar( "SYS_WORLD_EVENT_PRIZE_TIME" , BonusTime )
		if BonusTime == 0 then
			WriteRoleValue(ControlNPC , EM_RoleValue_register1 , 1)		--通知控制NPC獎勵時間結束
			SetWorldVar( "star_WorldBattle_Prize_On" , 0 )				--獎勵結束
			SetWorldVar( "SYS_WORLD_EVENT_PRIZE_TIME" , 0 )
			sleep(50)
			DelObj(OwnerID())
		end
	end
end


function star_WorldBattle_ScoreCal(IsWin , MapNumber)		--IsWin  回傳勝負條件( 0表示輸，1表示贏 )，MapNumber 回傳是幾號戰場
	local WinScore = { 20 , 5 , 15 }		--世界戰場1，世界戰場2，世界戰場3
	local LossScore = { -20 , -5 , -15 }
	if MapNumber == 1 then
		if IsWin == 1 then
			if ( GetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" )+WinScore[1] ) >= 10000 then
				SetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" , 10000 )
			else
				SetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" , GetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" )+WinScore[1] )
			end	
		elseif IsWin == 0 then
			if ( GetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" )+WinScore[1] ) <= -10000 then
				SetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" , -10000 )
			else
				SetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" , GetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" )+LossScore[1] )
			end	
		end
	elseif MapNumber == 2 then
		if IsWin == 1 then
			if ( GetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" )+WinScore[2] ) >= 10000 then
				SetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" , 10000 )
			else
				SetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" , GetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" )+WinScore[2] )
			end	
		elseif IsWin == 0 then
			if ( GetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" )+WinScore[2] ) <= -10000 then
				SetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" , -10000 )
			else
				SetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" , GetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" )+LossScore[2] )
			end	
		end
	elseif MapNumber == 3 then
		if IsWin == 1 then
			if ( GetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" )+WinScore[3] ) >= 10000 then
				SetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" , 10000 )
			else
				SetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" , GetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" )+WinScore[3] )
			end	
		elseif IsWin == 0 then
			if ( GetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" )+WinScore[3] ) <= -10000 then
				SetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" , -10000 )
			else
				SetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" , GetWorldVar( "SYS_WORLD_EVENT_INFLUENCE_SCORE" )+LossScore[3] )
			end	
		end	
	end	
end

function star_WorldBattle_CheckBonus()				--掉寶表確認是否是獎勵時間用
	local BonusOn = GetWorldVar( "star_WorldBattle_Prize_On" )
	if BonusOn == 1 then
		return true
	elseif BonusOn == 0 then
		return false
	end
end
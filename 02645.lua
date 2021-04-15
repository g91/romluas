                                                                     
                                                                     
                                                                     
                                             
---------------------------------------------------------------------------------------------------
--變數階段
---------------------------------------------------------------------------------------------------
Nehelia_FES_Global = Nehelia_FES_Global or {
			["turtle"] = { [1] ={ ID =120553 ,	Buff = 16},	--搶奪龜
				        [2] ={ID = 120554 ,	Buff = 13},	--游擊龜
				        [3] ={ID = 120555,Buff = 15 }},		--火箭炮龜
			["happen"] = { 				--機率調整
					[1] = { poss1 = 60 ,
					            poss2 = 80  },
					[2] = { poss1 = 30 ,
					            poss2 = 70  }}}

----------------------------------------------------------------------------------------------------

function lua_nehelia_easterCircle()--蓋圍欄
	local Circle=OwnerID()
	Lua_Hao_Round_wall( Circle , 120559 , 16 , 100 , 0 ) --建牆
end


------------------------------------NPC初對話------------------------------------

function lua_nehelia_easterNPC()--NPC對話
	local Player=OwnerID()
	local NPC=TargetID()
	local Day=CheckFlag ( Player , 546228 )--每日免費票
	local Ticket=CheckBuff ( Player , 622215 )--遊戲Coin
	local Played=CheckFlag ( Player , 546229 )--遊戲彩票

	SetSpeakDetail ( Player,"[SC_EASTER_2012NE_03]")--皮條客內容
	AddSpeakOption( Player , NPC , "[SC_EASTER_2012NE_01]" , "lua_nehelia_easter01", 0 )--遊戲說明

	if Ticket==false then
		if Played== true then
			AddSpeakOption( Player , NPC , "[SC_0908SEANSON_03]" , "lua_nehelia_easterP", 0 )--領取獎勵
		else
			if Day==false then
				AddSpeakOption( Player , NPC , "[SC_EASTER_2012NE_02]" , "lua_nehelia_easter02", 0 )--我要玩
			end

			if Day== true then
				local Language = GetServerDataLanguage() 
			--	if Language ~= "rw" then  -- 台版專屬沒有重置選項  測試用
				if Language ~= "tw" then  -- 台版專屬沒有重置選項  正式版
					AddSpeakOption( Player , NPC , "[SC_CLICKFUNGO31]" , "lua_nehelia_easter03", 0 )--再玩一次
				end
			end
		end
	end
end


------------------------------------NPC對話選項------------------------------------


----遊戲說明
function lua_nehelia_easter01()--遊戲說明
	local Player=OwnerID()
	local NPC=TargetID()
	SetSpeakDetail ( Player,"[SC_EASTER_2012NE_04]")
	AddSpeakOption( Player , NPC , "[SC_112533_0]" , "lua_nehelia_easterNPC", 0 )--回上一次對話
end

----第一次免費玩
function lua_nehelia_easter02()--我要玩
	local Player=OwnerID()
	local NPC=TargetID()
	SetSpeakDetail ( Player,"[SC_EASTER_2012NE_05]" )--你要現在拿遊戲參加券試試看嗎?
	AddSpeakOption( Player , NPC , "[SC_422367_1]" , "lua_nehelia_easterCoin", 0 )--是的!!
end

----再玩一次
function lua_nehelia_easter03()--再玩一次
	local Player=OwnerID()
	local NPC=TargetID()
	SetSpeakDetail ( Player,"[SC_EASTER_2012NE_06]")--給錢才給玩!
	AddSpeakOption( Player , NPC , "[SC_FLOWERFES_KORS_RS05]" , "lua_nehelia_easterCoin_again", 0 )--交出傳送者符文
end


function lua_nehelia_easterCoin()--給予遊戲Coin機制 (正常玩)
	local NPC = TargetID()	-- NPC
	local Player=OwnerID()	--玩家
	local CheckCoin=CheckBuff( Player , 622215 )
	local CheckA=CheckFlag( Player , 546228 )

	SetSpeakDetail ( Player,"[SC_EASTER_2012NE_07]" )
	DesignLog( Player , 120552 , "Accept" )		-- 報名
	SetFlag( Player , 546228 , 1 )		--開啟每日免費打
	AddBuff ( Player , 622215 , 0 , -1 )	--給予遊戲Coin

end

function lua_nehelia_easterCoin_again()--給予遊戲Coin機制 (重置玩)
	local NPC = TargetID()	-- NPC
	local Player=OwnerID()	--玩家
	local CheckB=CountBodyItem( Player , 202903 )

	if CheckB==0 then
		SetSpeakDetail ( Player,"[SC_EASTER_2012NE_08]")--你沒有錢喔
	else
		SetSpeakDetail ( Player,"[SC_EASTER_2012NE_07]" )
		DesignLog( Player , 120552 , "Accept" )		-- 報名
		AddBuff ( Player , 622215 , 0 , -1 )--給予遊戲Coin
		DelBodyItem( Player , 202903 , 1 )--刪除玩家身上的傳送者符文*1個
	end
end


------------------------------------給獎劇情------------------------------------

function lua_nehelia_easterP()--給獎劇情
	local Player=OwnerID()
	local NPC=TargetID()
	local Played=CheckFlag ( Player , 546229 )			--遊戲彩票
--	local Point = FN_CountBuffLevel( Player , 622174 )		--遊戲分數 
	local score = ReadRoleValue(Player,EM_RoleValue_Register1)	--遊戲分數 

	local OID = Player  
	--< OID後方請請填入該活動中是玩家的變數,  例如 Local OID = player

		local allcount = 4  -- 所有新活動數量
		local count = 0
		local keylist =  {
				546288,	--拉比兔防衛戰
				546257,	--拉比追緝令
				546264,	--夢幻彩雞
				546232		--彩蛋塗鴉
				}
		for i =  1 , table.getn(keylist) do
			if Checkflag(OID , keylist[i] )  == true then
				count = count +1
			end
			if i == table.getn(keylist) then
				if count == allcount then -- 如果完成全部
					lua_mika_festivalbuffgive(OID, 0 )  -- 2012. 4月春雨節活動 為等級0
				end
			end
		end



	if Played==true then		--有分數的獎勵
		if score<3 and score>0 then					--1~2分
			SetSpeakDetail ( Player,"[SC_EASTER_2012NE_10]")	--做的不錯
			DesignLog( Player , 1205520 , "Complete" )	-- 完成
			GiveBodyItem( Player , 204218 , 1 )			--給予地靈結晶*1
			SetFlag( Player , 546229 , 0 )				--關掉遊戲彩票
			CancelBuff( Player , 622174 )
		elseif score>=3 then						--3分
			SetSpeakDetail ( Player,"[SC_EASTER_2012NE_11]")	--做的真好!
			DesignLog( Player , 1205520 , "Complete" )	-- 完成
			GiveBodyItem( Player , 204218 , 2 )			--給予地靈結晶*2
			SetFlag( Player , 546229 , 0 )				--關掉遊戲彩票
			CancelBuff( Player , 622174 )
		else
			SetSpeakDetail ( Player,"[SC_EASTER_2012NE_09]")	--真可惜下次再努力吧
			DesignLog( Player , 1205520 , "Complete" )	-- 完成
			GiveBodyItem( Player , 724266 , 1 )			--必爾汀藥水隨機抽*1
			SetFlag( Player , 546229 , 0 )				--關掉遊戲彩票
			CancelBuff( Player , 622174 )
		end

--	elseif Played==false then	--1分都沒有可是我有玩
--		SetSpeakDetail ( Player,"[SC_EASTER_2012NE_09]")		--真可惜下次再努力吧
--		GiveBodyItem( Player , 202903 , 1 )				--給予獎勵
--		SetFlag( Player , 546229 , 0 )					--關掉遊戲彩票
	end

end
----------------------------------------------------------------------------------
--中控器階段
----------------------------------------------------------------------------------

function lua_nehelia_easter_GameSet()	--台子自動種出柵欄跟設定台子啟動
	local AC = OwnerID()
	local room = ReadRoleValue(AC,EM_RoleValue_RoomID)
	local CircleBar = 120559--遊戲柵欄
	local BarTable = {}

	SetModeEx( AC, EM_SetModeType_ShowRoleHead, FALSE )	--頭像框
	Nehelia_FES_Global[room] = Nehelia_FES_Global or {}
	Nehelia_FES_Global[room][AC] = {}
		for i = 1 , 10  do
		local pos = 281+(18*(i-1))
			BarTable[i] = KORS_CreateObjPosition(CircleBar,AC,120,pos)
			SetModeEx(BarTable[i],EM_SetModeType_ShowRoleHead, FALSE )	--頭相框
			SetModeEx(BarTable[i],EM_SetModeType_SearchenemyIgnore, FALSE )
			SetModeEx(BarTable[i], EM_SetModeType_Obstruct, TRUE )		--阻擋
			SetModeEx(BarTable[i],EM_SetModeType_Mark,FALSE  )		--標記
			MoveToFlagEnabled(BarTable[i],FALSE) 
			AdjustFaceDir( BarTable[i] , AC , 0 )
			AddToPartition(BarTable[i],room)
		end
		SetPlot(AC,"touch","lua_nehelia_easter_GameStay",5)
end



function lua_nehelia_easter_GameStay()--檯子待機狀態
	local Player = OwnerID()
	local ctrl = TargetID()		--這隻是兔子
	local CheckCoin = CheckBuff(Player,622215)					--檢查玩家身上有沒有遊戲幣

	SetPlot(ctrl,"touch","",0)

		if CheckCoin == FALSE then						--沒有遊戲Coin
			ScriptMessage(ctrl,Player,1,"[SC_EASTER_2012NE_12]",C_SYSTEM)	--抱歉你沒有錢喔
			SetPlot(ctrl,"touch","lua_nehelia_easter_GameStay",5)		--重置機台touch劇情
		elseif CheckCoin == TRUE and Lua_Mounts_Copilot( Player) == TRUE then	--有遊戲Coin
--			Say(ctrl,"game Start")
			WriteRoleValue(Player,EM_RoleValue_Register1,3)		--計值在Player身上,三分守衛值
			DW_CancelTypeBuff( 68, Player )				--消除玩家坐騎
			AddBuff( Player , 622216 , 1 , 70 )				--給予彩彈引導法術,1級,60秒
			AddBuff( Player , 622174 , 2 , -1)				--給予遊戲分數
--			AddBuff( Player , 622415 , 1 , -1)				--給予遊戲中不受干擾Buff
			KORS_FirstPersonSee(player,"ON")				--對Player定身+鎖視角
			SetFlag( Player , 546229 , 0 )					--給予遊戲彩票
			CancelBuff(Player, 622215)					--刪除遊戲Coin
			WriteRoleValue(ctrl,EM_RoleValue_PID,Player)			--遊戲機台記值

			BeginPlot(ctrl,"lua_nehelia_easterGing",0)
		elseif Lua_Mounts_Copilot(Player) == FALSE then
			ScriptMessage(Player,Player,1,"[SC_EASTER_2012NE_24]",C_SYSTEM)		--乘坐坐騎狀態下無法開始遊戲。
			SetPlot(ctrl,"touch","lua_nehelia_easter_GameStay",5)
		end
end



function lua_nehelia_easterGing()	--遊戲啟動(中控器)
	local Arcade = OwnerID()	
	local room = ReadRoleValue(Arcade,EM_RoleValue_RoomID)
	local time = 0
	local Global =  Nehelia_FES_Global[room]
	local turtleBox = {}
	local Player = ReadRoleValue(Arcade,EM_RoleValue_PID)

	Global[Arcade] = { game = 1,boom = 0,Phase = 1}	--控制機器台的全域變數, game = 1時遊戲啟動中、boom = 被烏龜衝到次數，三次失敗。
		
		for x = 0,9 do	--倒數開始
			if CheckID(Player) == false then				--玩家斷線或登出機台值清空	
				Global[Arcade] = {game= 0,boom = 0,Phase = 0 }
				BeginPlot(arcade,"lua_nehelia_easterGend",0)
				return
			end 
			if ReadRoleValue(Player,EM_RoleValue_IsDead) ~=0 then	--玩家死翹翹機台值清空+玩家分數歸0
				Global[Arcade] = {game= 0,boom = 0,Phase = 0 }
				WriteRoleValue(Player,EM_RoleValue_Register1,0)
				CancelBuff(Player,622174)
				BeginPlot(Arcade,"lua_nehelia_easterGend",0)
				return
			end
			if Lua_Mounts_Copilot(Player) == false then		--玩家遊戲中上車就取消他玩資格。
				Global[Arcade] = {game= 0,boom = 0,Phase = 0 }
				ScriptMessage( Player , Player , 1, "[SC_EASTER_2012NE_25]", C_SYSTEM )		--遊戲中禁止騎乘坐騎，遊戲失敗！
				WriteRoleValue(Player,EM_RoleValue_Register1,0)				--分數歸零
				CancelBuff(Player,622174)
				BeginPlot(Arcade,"lua_nehelia_easterGend",0)
				return				
			end

			ScriptMessage( Player , Player , 1, (10-x).."[SC_EASTER_2012NE_23]", C_SYSTEM )	--X秒後遊戲開始，請準備並調整好視角
			Sleep(10)

		end

		ScriptMessage( Player , Player , 1, "[SC_EASTER_2012NE_13]", C_SYSTEM )	--烏龜大軍來襲!!

		for i = 1, 6 do
			local pos = 315+(i-1)*20
			turtleBox[i] = KORS_CreateObjPosition(120583,Arcade,100,pos)			--創生怪箱
				WriteRoleValue(turtleBox[i],EM_RoleValue_PID,Arcade)			--寫給生怪箱讀全域變數用
				SetModeEx(turtleBox[i],EM_SetModeType_Show, FALSE )			--顯示
				SetModeEx( turtleBox[i], EM_SetModeType_ShowRoleHead, FALSE )	--頭像框
				SetModeEx( turtleBox[i], EM_SetModeType_SearchenemyIgnore, FALSE )	--被搜尋
				SetModeEx( turtleBox[i], EM_SetModeType_Obstruct, TRUE )		--阻擋
				SetModeEx(turtleBox[i], EM_SetModeType_Mark,FALSE  )			--標記
				AdjustFaceDir( turtleBox[i],Arcade,0 )
				MoveToFlagEnabled(turtleBox[i],false)
				BeginPlot(turtleBox[i],"lua_nehelia_TurtleRun",0)				--生出烏龜快跑!
				AddToPartition(turtleBox[i],room)
		end

		while TRUE do
			if Lua_Mounts_Copilot(Player) == false then				--玩家遊戲中上車就取消他玩資格。
				Global[Arcade] = {game= 0,boom = 0,Phase = 0 }
				ScriptMessage( Player , Player , 1, "[SC_EASTER_2012NE_25]", C_SYSTEM )	--遊戲中禁止騎乘坐騎，遊戲失敗！
				WriteRoleValue(Player,EM_RoleValue_Register1,0)			--分數歸零
				CancelBuff(Player,622174)
--				CancelBuff(Player,622415)
					for x = 1,#turtleBox do			--斷
						DelObj(turtleBox[x])		--斷
					end					--斷
				BeginPlot(Arcade,"lua_nehelia_easterGend",0)
				Break						--斷
			end

			if CheckID(Player) == FALSE then					--玩家斷線或登出機台值清空	
				Global[Arcade] = {game= 0,boom = 0,Phase = 0 }
					for x = 1,#turtleBox do			--斷
						DelObj(turtleBox[x])		--斷
					end					--斷
				BeginPlot(Arcade,"lua_nehelia_easterGend",0)
				Break
			end 
			if ReadRoleValue(Player,EM_RoleValue_IsDead) ~=0 then			--玩家死翹翹機台值清空+玩家分數歸0
				Global[Arcade] = {game= 0,boom = 0,Phase = 0 }
				WriteRoleValue(Player,EM_RoleValue_Register1,0)
				CancelBuff(Player,622174)
--				CancelBuff(Player,622415)
					for x = 1,#turtleBox do			--斷
						DelObj(turtleBox[x])		--斷
					end					--斷
				BeginPlot(Arcade,"lua_nehelia_easterGend",0)
				Break
			end


		--以下為正常情況下該跑的
			if time > 40 and Global[Arcade].Phase ~= 2 then					--時間到切換2階段控制
				Global[Arcade].Phase = 2
				ScriptMessage( Player , Player , 1, "[SC_EASTER_2012NE_15]", C_SYSTEM )	--最後一波襲擊，要撐住啊!
			end

			if time >= 60 then								--結束
				Global[Arcade] = {game= 0,boom = 0,Phase = 0 }				--遊戲結束
				ScriptMessage( Player , Player , 1, "[SC_EASTER_2012NE_16]", C_SYSTEM )	--成功守住了拉比兔及彩蛋！向[120552]換取獎賞吧
					for x = 1,#turtleBox do
						DelObj(turtleBox[x])
					end			
				BeginPlot(Arcade,"lua_nehelia_easterGend",0)
				break
			end

			if Global[Arcade].boom >= 3 then						--被炸到三次結束
				Global[Arcade] = {game= 0,boom = 0,Phase = 0 }	
					for x = 1,#turtleBox do
						DelObj(turtleBox[x])
					end	
				BeginPlot(Arcade,"lua_nehelia_easterGend",0)
				break
			end

		time = time +1	
		Sleep(10)
		end

end


function lua_nehelia_TurtleRun()	--生烏龜的控制器
	local RunCtrl = OwnerID()
	local room = ReadRoleValue(RunCtrl,EM_RoleValue_RoomID)
	local Global = Nehelia_FES_Global[room]								--設定全域變數群組
	local Arcade = ReadRoleValue(RunCtrl,EM_RoleValue_PID)					--讀中控器
	local turtle = Nehelia_FES_Global["turtle"]							--全域變數烏龜
	local Player = ReadRoleValue(Arcade,EM_RoleValue_PID)						--讀玩家
	local R 
	local hapn = Nehelia_FES_Global["happen"]							--全域變數機率

		while TRUE do										--自執行迴圈，創造烏龜出來			

			if Global[Arcade].Game ~= 1 then						--時間到自刪
				DelObj(RunCtrl)
				break
			 end				

		local type =Global[Arcade].Phase							--群組資訊，目前階段
		local Rnd = Rand(99)
		local RNG1 = hapn[type].poss1 
		local Rng2 = hapn[type].poss2
		local timeRnd = RandRange(7,10) * 10							--第一階段隨機秒數生怪

			if type == 2 then
				timeRnd = RandRange(4,7) * 10						--第二階段出怪速度控制
			end

			if Rnd < RNG1 then								--機率判斷
				R = 1
			elseif Rnd >= RNG1 and Rnd < Rng2 then
				R = 2
			elseif Rnd >= Rng2 then
				R = 3
			end

		local Runner = LuaFunc_CreateObjByObj( turtle[R].ID, RunCtrl )				--產生烏龜
--				MoveToFlagEnabled(Runner,false)
	 			WriteRoleValue(Runner,EM_RoleValue_PID,Arcade)			--值
				SetModeEx( Runner, EM_SetModeType_ShowRoleHead, TRUE )
				AddBuff(Runner,622219,turtle[R].Buff,-1)					--烏龜速度調整
				BeginPlot(Runner,"lua_nehelia_easterTurtle",0)
				SetPlot(Runner,"range","lua_nehelia_easter_turtleRange",10) 
				AddToPartition(Runner,room)
		Sleep(timeRnd)
		end
end
	

function lua_nehelia_easterGend()	--遊戲結束後對玩家該做的事情
	local Arcade = OwnerID()
	local room = ReadRoleValue(Arcade,EM_RoleValue_RoomID)
	local Global = Nehelia_FES_Global[room]
	local Player = ReadRoleValue(Arcade,EM_RoleValue_PID)
		CancelBuff( Player, 622216 )							--消除射擊技能 
--		CancelBuff( Player, 622415 )							--消除遊戲中不受影響Buff
		SetFlag( Player, 546229, 1 )							--打開遊戲彩票Flag
		SetFlag( Player, 546288, 1 )							--打開共通獎勵用Flag
		KORS_FirstPersonSee(player,"Off")						--解除視角
--		Global[Arcade] = {game= 0,boom = 0,Phase = 0 }					--遊戲結束
		Sleep(30)
		WriteRoleValue(Arcade,EM_RoleValue_PID,0)					--清空機台記的玩家值
		SetPlot(Arcade,"touch","lua_nehelia_easter_GameStay",5)				--重新開台
end


function lua_nehelia_easterTurtle()	--烏龜身上自跑撿查迴圈
	local turtle = OwnerID()
	local Arcade = ReadRoleValue(turtle,EM_RoleValue_PID)
	local room = ReadRoleValue(turtle,EM_RoleValue_RoomID)
	local Global = Nehelia_FES_Global[room]
	local Player = ReadRoleValue(Arcade,EM_RoleValue_PID)
	local Dis
		 KORS_MoveByObj(turtle,Arcade)						--跑向遊戲機台
		while TRUE do								
			if Global[Arcade].Game ~= 1 then					--檢查是否遊戲結束
				DelObj(turtle)
			end
			
			if ReadRoleValue(turtle,EM_RoleValue_Register1) ~= 0 then
				DelObj(turtle)
			end

--			if CheckDistance( turtle, Arcade, 5) ==TRUE then					--撿查距離是否撞到
--				local boomEd = Global[Arcade].boom
--				local PlayerSC = ReadRoleValue(Player,EM_RoleValue_Register1)		--讀玩家目前分數
--				AddBuff ( Player , 622217 , 0 , -1 )					--暈眩
--				WriteRoleValue(Player,EM_RoleValue_Register1,PlayerSC-1)		--執行扣分
--				ScriptMessage( Player , Player , 0, "PlayerPoint"..PlayerSC.."/3", 0 )		--還有PlayerSC/3分!
--				Global[Arcade].boom = boomEd +1	
--				Say(turtle,Global[Arcade].boom)						--烏龜說現在爆幾次
--				Sleep(5)
--				DelObj(turtle)
--			end		
		Sleep(5)
		end 
end


function lua_nehelia_easter_turtleRange()	--範圍劇情，判斷跟台子在距離內才執行爆炸
	local Player = OwnerID()
	local turtle = TargetID()
	local Arcade = ReadRoleValue(turtle,EM_RoleValue_PID)
	local room = ReadRoleValue(turtle,EM_RoleValue_RoomID)
	local Global = Nehelia_FES_Global[room]
	local Arcade = ReadRoleValue(turtle,EM_RoleValue_PID)
 	local Player = ReadRoleValue(Arcade,EM_RoleValue_PID)
	local PlayerSC = ReadRoleValue(Player,EM_RoleValue_Register1)				--讀玩家目前分數

	AddBuff ( Player , 622217 , 0 , 2 )							--暈眩
	WriteRoleValue(Player,EM_RoleValue_Register1,PlayerSC-1)				--執行扣分
		if Global[Arcade].boom ~= nil then
	Global[Arcade].boom = Global[Arcade].boom +1
		end
		if PlayerSC>=2 then
			ScriptMessage( Player , Player , 1, "[SC_EASTER_2012NE_14]".."[SC_EASTER_2012NE_18]".. PlayerSC-1, C_SYSTEM )	--遭受攻擊，剩下分數為：
				if PlayerSC-1>=0 then
				KORS_buffUpDown( Player , 622174 , 1 , 1 ) -- 0是加, 1是減,最後的數字是層級
				end
		else
			ScriptMessage( Player , Player , 1, "[SC_EASTER_2012NE_17]", C_SYSTEM )			--遭受太多的攻擊，失敗了
			CancelBuff( Player , 622174 )
		end

--	Say(turtle,Global[Arcade].boom)	--烏龜說現在爆幾次
	Sleep(5)
	DelObj(turtle)
end


function lua_nehelia_easter_Fire()	--射到烏龜的劇情
	local Player = OwnerID()		--玩家
	local turtle = TargetID()		--該死的烏龜
	local Arcade = ReadRoleValue(turtle,EM_RoleValue_PID)	--兔子機台
	local Boom=ReadRoleValue(turtle,EM_RoleValue_OrgID)

		if Boom==120555 then
			SysCastSpellLv( turtle ,turtle , 499277 , 0) 	 --法術集合
			SetPlot(turtle,"range","lua_nehelia_easter_FireBooM",30)
			WriteRoleValue(turtle,EM_RoleValue_Register1,1)
		else
	--		Hide(turtle,0)
			DelObj(turtle)
		end

end


function lua_nehelia_easter_FireBooM()	--暈眩技
local Player = OwnerID()
	AddBuff ( Player , 622217 , 0 , 2 )
	ScriptMessage( Player , Player , 1, "[SC_EASTER_2012NE_14]", C_SYSTEM )			--遭受太多的攻擊，失敗了
end


function lua_nehelia_easter_FireCheck()	--撿查法術
	local Player = OwnerID()
	local Tag = TargetID()
	local TagOid = ReadRoleValue(Tag,EM_RoleValue_OrgID)

		if tagOid==120553 or tagOid==120554 or tagOid==120555 then
			return TRUE
		else		
			return FALSE
		end
end


function lua_nehelia_easter_Del()	--拉比兔彩票刪除
	local Player = OwnerID()
		SetFlag ( Player , 546229 , 0 )
end



--------------------------------------------------------------------------------------------------------------
--第二NPC說話內容
--------------------------------------------------------------------------------------------------------------

function lua_nehelia_easter_Npc01()--2號NPC說說說
	local Player=OwnerID()
	local NPC=TargetID()
	local score = ReadRoleValue(Player,EM_RoleValue_Register1)	--遊戲分數 

		if score>=3 then
			SetSpeakDetail ( Player,"[SC_EASTER_2012NE_22]" )--什麼！你居然完美過關了，這怎麼可能！
			GiveBodyItem( Player , 530894 , 1 ) --給予彩蛋射手稱號獎勵
		else
			SetSpeakDetail ( Player,"[SC_EASTER_2012NE_19]" )--啊啊！到底該怎麼突破最後那一波。老是在最後一波關卡失敗，好可惡喔！
			AddSpeakOption( Player , NPC , "[SC_EASTER_2012NE_20]" , "lua_nehelia_easter_Npc02", 0 )--最後關卡是什麼
		end
end


function lua_nehelia_easter_Npc02()--2號NPC說最後關卡
	local Player=OwnerID()
	local NPC=TargetID()
	SetSpeakDetail ( Player,"[SC_EASTER_2012NE_21]" )--就是這個遊戲啊，要抵擋烏龜的攻擊。
end

--------------------------------------------------------------------------------------------------------------
--測試用自行給分
--------------------------------------------------------------------------------------------------------------

function lua_nehelia_easter_GiveP()--自己給分
	local Player=OwnerID()
	local PlayerSC = ReadRoleValue(Player,EM_RoleValue_Register1)				--讀玩家目前分數

	if PlayerSC==0 then
		WriteRoleValue(Player,EM_RoleValue_Register1,1)					--計值在Player身上,
		ScriptMessage( Player , Player , 1 , "[SC_DANCEFES_KORS_ARR_05]"..PlayerSC , C_SYSTEM )	--目前獲得分數：PlayerSC
	elseif PlayerSC==1 then
		WriteRoleValue(Player,EM_RoleValue_Register1,2)					--計值在Player身上,
		ScriptMessage( Player , Player , 1 , "[SC_DANCEFES_KORS_ARR_05]"..PlayerSC , C_SYSTEM )	--目前獲得分數：PlayerSC
	elseif PlayerSC==2 then
		WriteRoleValue(Player,EM_RoleValue_Register1,3)					--計值在Player身上,
		ScriptMessage( Player , Player , 1 , "[SC_DANCEFES_KORS_ARR_05]"..PlayerSC , C_SYSTEM )	--目前獲得分數：PlayerSC
	else
		ScriptMessage( Player , Player , 1 , "[SC_DANCEFES_KORS_ARR_05]"..PlayerSC , C_SYSTEM )	--目前獲得分數：PlayerSC
	end

end
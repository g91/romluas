
--SC_BEERDAY_SASA_01-13
--541866--完成搖酒任務
--546266--完成報名
--546267--階段一
--546701--階段二
--546702--階段三
--113961--希拉．貝蒂
--781185--旗標
--205941--啤酒節憑證
-----------------------------------------------對話

--※ NPC ※--

function sasa_Beerday_npc01()
	LoadQuestOption(OwnerID())
	local OID = OwnerID()	--player
	local TID = TargetID()  --Target
	local Ok = CheckAcceptQuest( OwnerID() , 425208 )		--報名
	if Ok == false then
		--SetSpeakDetail( OID , "[SC_BEERDAY_SASA_02]" )   	--對話
		--有興趣一塊兒調酒嗎？
		AddSpeakOption( OID , OID , "[SC_BEERDAY_02]" , "lua_mika_beercontest_02" , 0 )
		--我想知道<CB>啤酒節</CB>的由來
		AddSpeakOption( OID , OID , "[SC_BEERDAY_SASA_01]" , "sasa_Beerday_npc02" , 0 )
		--調配的方法與素材
	elseif Ok == true then
		--SetSpeakDetail( OID , "[SC_BEERDAY_SASA_02]" )   	--對話
		--有興趣一塊兒調酒嗎？
		AddSpeakOption( OID , OID , "[SC_BEERDAY_02]" , "lua_mika_beercontest_02" , 0 )
		--我想知道<CB>啤酒節</CB>的由來
		AddSpeakOption( OID , OID , "[SC_BEERDAY_SASA_01]" , "sasa_Beerday_npc02" , 0 )
		--調配的方法與素材
		AddSpeakOption( OID , OID , "[SC_BEERDAY_SASA_11]" , "sasa_Beerday_npcgive" , 0 )
		--客人進場
	end
end

function sasa_Beerday_npc02()
	local OID = OwnerID()  --player
	local TID = TargetID()  --Target
	SetSpeakDetail( OID , "[SC_BEERDAY_SASA_03]" )   --調配的方法與素材
	--調配的方式很簡單，只要確認客人要的酒，拿好材料，盡快將酒給客人就好。
	--在三個階段中，只要各給予兩位客人正確的酒即算你及格了…(每階段皆必須給予兩位客人正確的酒即算你及格…)
	--當然如果你想挑戰自己的極限，那也無妨！
	
	--想要成為一流的調酒師，這些配方是基本要了解的必備課程。
	--別說我私藏不肯透露呢！我可是全都寫下來告訴你了，你可要記好…
	--<CN>伏特加萊姆：伏特加 + 萊姆汁</CN>
	--<CN>自由古巴：可樂 + 蘭姆酒</CN>
	--<CN>白蘭地酸酒：白蘭地 + 檸檬汁</CN>
	--<CN>香草啤酒：大麥啤酒 + 香草汁</CN>
	
	--<CS>注意：可別讓客人久候喔。</CS>
	AddSpeakOption( OID , OID , "[SC_111352_2]" , "sasa_Beerday_npc01" , 0 )    --back
	--回上一頁
end

function sasa_Beerday_npcgive()		--當接下任務執行劇情
	CloseSpeak(OwnerID())
	local GetM = CheckAcceptQuest( OwnerID() , 425208 )		--報名
	local IsBegun = ReadRoleValue( TargetID() , EM_RoleValue_register1 )
	if GetM == false then								--如果沒有報名
		--GiveBodyItem( TargetID() , 241639 , 1 )		--給予XX
		--Setflag( TargetID() , 546266 , 1 )			--給FLAG
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_BEERDAY_SASA_10]" , 1 )
		--你必須先接取任務唷！
	else
		if IsBegun == 0 then
			BeginPlot( TargetID() , "sasa_Bartending_Beer2012" , 0 )	--主持人
			Sleep(10)
			WriteRoleValue( TargetID() , EM_RoleValue_register1 , 1 )
		elseif IsBegun == 1 then
			ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_BEERDAY_SASA_12]" , 1 )
			--活動已經開始囉！
		end
	end		
end

function sasa_Beerday_reward()	--完成任務
	local Player = TargetID()
	local WineBuff = { 505999 , 509115 , 507714 , 621878 , 507712 , 622724 , 621865 , 507713 }
					--伏特加 , 萊姆汁 , 可樂 , 蘭姆酒 , 白蘭地 , 檸檬汁 , 大麥啤酒 , 香草汁
	local point_buff = { 623372 , 623405 , 623406 }		--三個階段暫時累計用
	
	--Say( Player , "flag get" )
	Setflag( Player , 541866 , 1 )			--完成任務KEYITEM
	local Lv = ReadRoleValue( Player , EM_RoleValue_Lv )
	DesignLog( Player , 113961 , "BEERDAY Girl-Bedy Lv"..Lv )
	Sleep(20)
	Lua_Festival_09_All(Player)
	--Say( Player , "WineBuff ="..table.getn(WineBuff) )
	--Say( Player , "point_buff ="..table.getn(point_buff) )
	for s = 1 , table.getn(WineBuff) do
		if CheckBuff( Player , WineBuff[s] ) == true then
			CancelBuff( Player , WineBuff[s] )
		end
	end
	for t = 1 , table.getn(point_buff) do
		if CheckBuff( Player , point_buff[t] ) == true then
			CancelBuff( Player , point_buff[t] )
		end
	end	
end

------------------------------以上---------任務區-----

-----控制器-----------以下----------------------------

function sasa_Bartending_Ctrl()
	Beginplot( OwnerID() , "sasa_Bartending_beer" , 0 )		--生酒
	Sleep(10)
end

function sasa_Bartending_beer()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Flag = 781185
	local Obj = { 113964 , 113980 , 120336 , 120340 , 120343 , 121153 , 121166 , 121167 }
				--伏特加 , 白蘭地 , 香草汁 , 可樂 , 萊姆汁 , 蘭姆酒 , 檸檬汁 , 大麥啤酒
	local WineScript = { "sasa_Bartending_01" , "sasa_Bartending_02" , "sasa_Bartending_03" , "sasa_Bartending_04" , 
	                     "sasa_Bartending_05" , "sasa_Bartending_06" , "sasa_Bartending_07" , "sasa_Bartending_08" }
	for i=1 , table.getn(Obj) do
		local Beer = CreateObjByFlag( Obj[i] , Flag , i , 1 )
		SetModeEx( Beer , EM_SetModeType_Gravity , false )		--無重力
		AddToPartition( Beer , Room )
		Beginplot( Beer , WineScript[i] , 0 )
	end
end
--------------------------------共用判斷身上的酒
function sasa_Bartending_WineCheck()
	local WineBuff = { 505999 , 509115 , 507714 , 621878 , 507712 , 622724 , 621865 , 507713 }
					--伏特加 , 萊姆汁 , 可樂 , 蘭姆酒 , 白蘭地 , 檸檬汁 , 大麥啤酒 , 香草汁
	--local count = BuffCount( OwnerID() )
	local WineTable = {}
	for x = 1 , table.getn(WineBuff) do
		if CheckBuff( OwnerID() , WineBuff[x] ) == true then
			WineTable[table.getn(WineTable)+1] = WineBuff[x]
		end
	end
	return WineTable
end

function sasa_Bartending_MixCheck()
	local WineTemp = {}
	WineTemp = sasa_Bartending_WineCheck()		--將身上的酒讀進暫存table
	--Say( OwnerID() , "WineTemp ="..table.getn(WineTemp) )
	if table.getn(WineTemp) >= 2 then
		if CheckBuff( OwnerID() , 509115 ) == true and CheckBuff( OwnerID() , 505999 ) == true then
			AddBuff( OwnerID() , 623377 , 0 , 10 )	--伏特加萊姆
		elseif CheckBuff( OwnerID() , 507714 ) == true and CheckBuff( OwnerID() , 621878 ) == true then
			AddBuff( OwnerID() , 623378 , 0 , 10 )	--自由古巴
		elseif CheckBuff( OwnerID() , 507712 ) == true and CheckBuff( OwnerID() , 622724 ) == true then
			AddBuff( OwnerID() , 623379 , 0 , 10 )	--白蘭地酸酒	
		elseif CheckBuff( OwnerID() , 621865 ) == true and CheckBuff( OwnerID() , 507713 ) == true then
			AddBuff( OwnerID() , 623381 , 0 , 10 )	--香草啤酒	
		else	
			AddBuff( OwnerID() , 622039 , 0 , 20 )	--雜酒
		end	
		for j=1 , table.getn(WineTemp) do
			CancelBuff( OwnerID() , WineTemp[j] )
		end
	end	
end

-------------------------------------------------

function sasa_Bartending_01()	--伏特加=================================================
	SetPlot( OwnerID() , "touch" , "sasa_Bartending_01_1" , 30 )	--觸碰劇情
	--AddBuff( OwnerID() , 508370 , 0  -1 )		--物品發光
end

function sasa_Bartending_01_1()
	local GetM = CheckAcceptQuest( OwnerID() , 425208 )		--是否報名
	local Tar = TargetID()	
	if GetM == true then 
		AddBuff( OwnerID() , 505999 , 0 , -1 )
		Beginplot( OwnerID() , "sasa_Bartending_MixCheck" , 0 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_BEERDAY_SASA_10]" , 1 )
		--你必須先接取任務唷！
	end	
end

function sasa_Bartending_02()	--白蘭地=================================================
	SetPlot( OwnerID() , "touch" , "sasa_Bartending_02_1" , 30 )	--觸碰劇情
	--AddBuff( OwnerID() , 508370 , 0 , -1 )		--物品發光
end

function sasa_Bartending_02_1()
	local GetM = CheckAcceptQuest( OwnerID() , 425208 )		--是否報名
	local Tar = TargetID()
	if GetM == true then
		AddBuff( OwnerID() , 507712 , 0 , -1 )
		Beginplot( OwnerID() , "sasa_Bartending_MixCheck" , 0 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_BEERDAY_SASA_10]" , 1 )
		--你必須先接取任務唷！
	end	
end

function sasa_Bartending_03()	--香草汁=================================================
	SetPlot( OwnerID() , "touch" , "sasa_Bartending_03_1" , 30 )	--觸碰劇情
	--AddBuff( OwnerID() , 508370 , 0 , -1 )		--物品發光
end

function sasa_Bartending_03_1()
	local GetM = CheckAcceptQuest( OwnerID() , 425208 )		--是否報名
	local Tar = TargetID()
	if GetM == true then
		AddBuff( OwnerID() , 507713 , 0 , -1 )
		Beginplot( OwnerID() , "sasa_Bartending_MixCheck" , 0 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_BEERDAY_SASA_10]" , 1 )
		--你必須先接取任務唷！
	end	
end

function sasa_Bartending_04()	--可樂=================================================
	SetPlot( OwnerID() , "touch" , "sasa_Bartending_04_1" , 30 )	--觸碰劇情
	--AddBuff( OwnerID() , 508370 , 0 , -1 )		--物品發光
end

function sasa_Bartending_04_1()
	local Tar = TargetID()
	local GetM = CheckAcceptQuest( OwnerID() , 425208 )		--是否報名
	if GetM == true then
		AddBuff( OwnerID() , 507714 , 0 , -1 )
		Beginplot( OwnerID() , "sasa_Bartending_MixCheck" , 0 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_BEERDAY_SASA_10]" , 1 )
		--你必須先接取任務唷！
	end	
end

function sasa_Bartending_05()	--萊姆汁=================================================
	SetPlot( OwnerID() , "touch" , "sasa_Bartending_05_1" , 30 )	--觸碰劇情
	--AddBuff( OwnerID() , 508370 , 0 , -1 )		--物品發光
end

function sasa_Bartending_05_1()
	local Tar = TargetID()
	local GetM = CheckAcceptQuest( OwnerID() , 425208 )		--是否報名
	if GetM == true then
		AddBuff( OwnerID() , 509115 , 0 , -1 )
		Beginplot( OwnerID() , "sasa_Bartending_MixCheck" , 0 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_BEERDAY_SASA_10]" , 1 )
		--你必須先接取任務唷！
	end	
end

function sasa_Bartending_06()	--蘭姆酒=================================================
	SetPlot( OwnerID() , "touch" , "sasa_Bartending_06_1" , 30 )	--觸碰劇情
	--AddBuff( OwnerID() , 508370 , 0 , -1 )		--物品發光
end

function sasa_Bartending_06_1()
	local Tar = TargetID()
	local GetM = CheckAcceptQuest( OwnerID() , 425208 )		--是否報名
	if GetM == true then
		AddBuff( OwnerID() , 621878 , 0 , -1 )
		Beginplot( OwnerID() , "sasa_Bartending_MixCheck" , 0 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_BEERDAY_SASA_10]" , 1 )
		--你必須先接取任務唷！
	end	
end

function sasa_Bartending_07()	--檸檬汁=================================================
	SetPlot( OwnerID() , "touch" , "sasa_Bartending_07_1" , 30 )	--觸碰劇情
	--AddBuff( OwnerID() , 508370 , 0 , -1 )		--物品發光
end

function sasa_Bartending_07_1()
	local Tar = TargetID()
	local GetM = CheckAcceptQuest( OwnerID() , 425208 )		--是否報名
	if GetM == true then
		AddBuff( OwnerID() , 622724 , 0 , -1 )
		Beginplot( OwnerID() , "sasa_Bartending_MixCheck" , 0 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_BEERDAY_SASA_10]" , 1 )
		--你必須先接取任務唷！
	end	
end

function sasa_Bartending_08()	--大麥啤酒=================================================
	SetPlot( OwnerID() , "touch" , "sasa_Bartending_08_1" , 30 )	--觸碰劇情
	--AddBuff( OwnerID() , 508370 , 0 , -1 )		--物品發光
end

function sasa_Bartending_08_1()
	local Tar = TargetID()
	local GetM = CheckAcceptQuest( OwnerID() , 425208 )		--是否報名
	if GetM == true then
		AddBuff( OwnerID() , 621865 , 0 , -1 )
		Beginplot( OwnerID() , "sasa_Bartending_MixCheck" , 0 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_BEERDAY_SASA_10]" , 1 )
		--你必須先接取任務唷！
	end	
end

-------------------------------------------------

function sasa_Bartending_Beer2012()--TargetID = Player
	local human = { 121357 , 121358 , 121359 }
	local pp = 0
	local b = math.random(3)
	local step = 0 
	local Xtime = 0
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	
	while true do
		if step == 0 then  --確認開始遊戲了嗎？
			NPCSay( OwnerID() , "[GUILD_TC_HITPLATYPUS_9]" )
			--ScriptMessage( TargetID() , TargetID() , 1 , "[GUILD_TC_HITPLATYPUS_9]" , 0 )
			--準備好了嗎？倒數開始！
			--sasa_Beer_TimeCheck( 5 , 5 , 0 )	--玩家Client顯示倒數
			Sleep(10)
			NPCSay( OwnerID() , " 3 " )
			--ScriptMessage( TargetID() ,  TargetID() , 1 , " 3 " , C_SYSTEM )
			Sleep(10)
			NPCSay( OwnerID() , " 2 " )
			--ScriptMessage( TargetID() ,  TargetID() , 1 , " 2 " , C_SYSTEM )
			Sleep(10)
			NPCSay( OwnerID() , " 1 " )
			--ScriptMessage( TargetID() ,  TargetID() , 1 , " 1 " , C_SYSTEM )
			step = 1
		elseif step == 1 then	--第一關
			NPCSay( OwnerID() , "[SC_BEERDAY_SASA_08]" )
			--ScriptMessage( TargetID() , TargetID() , 1 , "[SC_BEERDAY_SASA_08]" , 0 )
			--第一階段
			Sleep(10)
			pp = CreateObjByFlag( human[b] , 781185 , 9 , 1 )		--生出村民
			SetModeEx( pp , EM_SetModeType_ShowRoleHead , true )
			AddToPartition( pp , RoomID )
			WriteRoleValue( pp , EM_RoleValue_register2 , 1 )
			BeginPlot( pp , "sasa_Beer_NPC_AInew" , 0 )			--npc活動開始AI
			while Xtime < 60 do
				--say(OwnerID(),"111")
				Xtime = sasa_Bartending_BeerBoy01(Xtime , 1)
			end
			step = 2
		elseif step == 2 then	--第二關
			if  Xtime > 590 then
				--提示活動範圍內無人即將結束
			else
				NPCSay( OwnerID() , "[SC_THANKS_2011_16]" )
				--ScriptMessage( TargetID() , TargetID() , 1 , "[SC_THANKS_2011_16]" , 0 )
				--第二階段要來囉～
				Sleep(10)
			end	
			while Xtime >= 60 and Xtime < 120 do	
				--say(OwnerID(),"222")
				Xtime = sasa_Bartending_BeerBoy01(Xtime , 2)
			end
			step = 3
		elseif step == 3 then	--第三關
			if  Xtime > 590 then
				--提示活動範圍內無人即將結束
			else
				NPCSay( OwnerID() , "[SC_BEERDAY_SASA_13]" )
				--ScriptMessage( TargetID() , TargetID() , 1 , "[SC_BEERDAY_SASA_13]" , 0 )
				--第三階段開始！
				Sleep(10)
			end	
			while Xtime >= 120 and Xtime < 180 do
				--say(OwnerID(),"333")
				Xtime = sasa_Bartending_BeerBoy01(Xtime , 3)			 
			end
			step = 4
		elseif step == 4 then	--給獎勵
			Sleep(40)
			NPCSay( OwnerID() , "[GUILD_TC_HITPLATYPUS_16]" )
			--ScriptMessage( TargetID() , TargetID() , 1 , "[GUILD_TC_HITPLATYPUS_16]" , 0 )
			--遊戲結束！
			WriteRoleValue( OwnerID() , EM_RoleValue_register1 , 0 )
			--sasa_Beerday_reward()
			sleep(10)
			break	
		end
		sleep(10)
	end
end

function sasa_Bartending_BeerBoy01(Xtime , phase)	--階段
	local Flag = 781185
	local moveflag = { 10 , 11 , 12 }
	local People = { 121357 , 121358 , 121359 }
	local Counter = 0
	local NPC = {}
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local X = 0
	local showtime = { 10 , 7 , 5 }   --每次出村民的間隔時間
	local npctemp = 0
	local AcceptQuestNumber = 0
	while 1 do
		Counter = Counter + 1
		local a = math.random(3)
		if Counter >= showtime[phase] then
			AcceptQuestNumber = sasa_Bartending_CheckRange()			--檢查附近有任務的玩家數
			if AcceptQuestNumber == -1 then
				Xtime = 600								--把目前活動持續時間設定成超過180秒的一個值
				break
			end
			--Say( OwnerID() , showtime[phase] )
			npctemp = CreateObjByFlag( People[a] , Flag , 9 , 1 )		--生出村民
			NPC[table.getn(NPC)+1]= npctemp
			SetModeEx( npctemp , EM_SetModeType_ShowRoleHead , true )
			AddToPartition( npctemp , RoomID )
			WriteRoleValue( npctemp , EM_RoleValue_register2 , phase )
			BeginPlot( npctemp , "sasa_Beer_NPC_AInew" , 0 )			--npc活動開始AI
			Counter = 0
		end		
		--Say( OwnerID() , "Xtime ="..Xtime )
		--Say( OwnerID() , "X ="..X )
		X = X + 1
		Xtime = Xtime + 1	
		sleep(10)
		if X >= 60 then
			break 	
		end	
	end
	return Xtime
end

function sasa_Beer_NPC_AInew()
	local npctemp = OwnerID()
	local phase = ReadRoleValue( npctemp , EM_RoleValue_register2 )
	local Flag = 781185
	local moveflag = { 10 , 11 , 12 }
	local point_buff = { 623372 , 623405 , 623406 }  --三個階段暫時累計用
	local Ok_Flag = { 546267 , 546701 , 546702 }     --三個階段完成旗標
	local Ok_Num = { 2 , 2 , 2 }                     --三個階段目標次數
	local speaklist = { "[SC_BEERDAY_SASA_04]" ,
						"[SC_BEERDAY_SASA_05]" ,
						"[SC_BEERDAY_SASA_06]" ,
						"[SC_BEERDAY_SASA_07]" }
	--我要伏特加萊姆！--給我自由古巴。--白蘭地酸酒…--一杯香草啤酒！
	local speaklist02 = { "[SC_PETS_SAY_G_1]" ,
						"[SC_COOKING_03]" ,
						"[SC_422966_24]" ,
						"[SC_422993_9]" }
	--噢！不錯喔！--太棒了！這味道真香！--嗝...喝完了...--好喝！看來待會兒的聚會可以暢飲一番了！
	local winelist = { 623393 , 623394 , 623395 , 623397 }
				--伏特加萊姆 , 自由古巴 , 白蘭地酸酒 , 香草啤酒
    local counter = 0	
	local PRandom = math.random(3)
	--local R = math.random(5)
	local R2 = math.random(4)
	local speak_switch1 = 0 	--講話開關1
	local speak_switch2 = 0 	--講話開關2
	NPCSay( npctemp , speaklist[R2] )							--npc隨機字串講話
	DW_MoveToFlag( npctemp , Flag , moveflag[PRandom] , 0 , 1 )	--移動到棋子上
	--NPCSay( npctemp , speaklist[R2] )							--npc隨機字串講話
	--sleep(45)										--停在吧台的時間(要小於第三階段的生村民時間)
	while counter < 2 do
		sleep(20)
		counter = counter + 1
		--Say( npctemp , "A" )
		local count = BuffCount( npctemp )
		if CheckBuff( npctemp , winelist[R2] ) == true then
			for x=0 , count do
				if BuffInfo( npctemp , x , EM_BuffInfoType_BuffID ) == winelist[R2] then
					local player = BuffInfo( npctemp , x , EM_BuffInfoType_OwnerID )
					--Say( player , "B" )
					AddBuff( player , point_buff[phase] , 0 , -1 )   --暫時累計成功次數
					local count1 = BuffCount( player )
					for y = 0 , count1 do					--檢察玩家身上在此階段累積次數是否有達目標
						if BuffInfo( player , y , EM_BuffInfoType_BuffID ) == point_buff[phase] then		
							if BuffInfo( player , y , EM_BuffInfoType_Power ) >= (Ok_Num[phase] - 1) then
								Setflag( Player , Ok_Flag[phase] , 1 )		--階段OK
								break
							end	
						end
					end
					CancelBuff( npctemp , winelist[R2] )	--清掉npc身上的調酒buff
				end
			end
			--CancelBuff( npctemp , winelist[R2] )   如果cancel是一次全清同編號的就要採用這行
			if speak_switch1 == 0 then
				NPCSay( npctemp , speaklist02[R2] )			--npc隨機字串講話
				--提示成功的npc講話
				speak_switch1 = 1
			end
		elseif CheckBuff( npctemp , 623398 ) == true then		--喝到雜酒
			if speak_switch2 == 0 then
				NPCSay( npctemp , "[SC_BEERDAY_SASA_09]" )
				--搞什麼呀…！
				speak_switch2 = 1
			end
		end
	end
	DW_MoveToFlag( npctemp , Flag , 13 , 0 , 1 )	--移動到終點
	Delobj(npctemp)
end

function sasa_Beer_TimeCheck(Time,NowTime,type)		--時間倒數記數器
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local Obj
	local Count = SetSearchAllPlayer(RoomID)
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == true then
				StartClientCountDown ( ID, Time, NowTime, 0, 0, type, "[SC_1V1PVP_COUNTDOWN]" )	--玩家Client顯示倒數5秒
				sleep(15)
			end
		end	
	end
end

function sasa_Bartending_Check()		--檢查Lua
	local GID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )	--檢查施法目標的ID
	if GID == 121357 or GID == 121358 or GID == 121359 then		--是這三人才可以施放
		return true
	elseif GID ~= 121357 or GID ~= 121358 or GID ~= 121359 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204624_2]" , 0 )
		--目標錯誤
		return false
	end
end

--※ 測距離 ※--

function sasa_Bartending_CheckRange()
	local range = 140
	local AcceptQuestNumber = 0
	local Player = SearchRangePlayer( OwnerID() , range )		--搜尋周圍玩家
	for i = 0, table.getn(Player)-1 do
		if CheckAcceptQuest( Player[i] , 425208 ) == true then		--是否報名
			AcceptQuestNumber = AcceptQuestNumber + 1
		end
	end
	if AcceptQuestNumber == 0 then		--找不到任何有接任務的人
		 AcceptQuestNumber = -1
	end
	return AcceptQuestNumber
end


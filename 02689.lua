-------------------------------------------
--重製旗標 546708
--invisiball 隱形物件register+1，1=正確擊中 2=錯誤的擊中
--invisiball 隱形物件register+2，光球狀態  1=小  2=中  3=大
--invisiball 隱形物件 register +3 bucket
--invisiball 隱形物件 register +4 ball
-- bucket register +1 ==目標擊中判斷


--bucket register +1 是來辨認bonus模式是否啟動 (1== bonus mode on      0== bonus mode off)
--bucket register+4 用來判斷得分/扣分機制是否在執行中
-- bucket register+6 和 register+7 是用來辨認自己生出來的隱形物件與光球
--bucket register +9 記住玩家
--製造機器的register+1是來辨認有沒有人正在進行遊戲
--製造機器的register+2來辨認玩家得分狀態


------活動npc-------------

function lua_skwerl_craft1_machine() --發明機的對話框
	SetSpeakDetail( OwnerID(), "[SKWERL_CRAFT1_07]" ) 
	AddSpeakOption( OwnerID(), TargetID(), "[SKWERL_CRAFT1_06]" , "lua_skwerl_craft1_begin1", 0) --開始遊戲
	AddSpeakOption( OwnerID(), TargetID(), "[SKWERL_CRAFT1_05]" , "lua_skwerl_craft1_manual", 0 ) --使用說明
end


function lua_skwerl_craft1_manual() --說明手冊(機器用)
	SetSpeakDetail( OwnerID(), "[SKWERL_CRAFT1_08]" ) 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "lua_skwerl_craft1_machine", 0 ) --回上一頁
end


function  lua_skwerl_craft1_npc() --活動NPC對話
	SetSpeakDetail( OwnerID(), "[SKWERL_CRAFT1_04]" ) 
	AddSpeakOption( OwnerID(), TargetID(), "[SKWERL_CRAFT1_05]" , "lua_skwerl_craft1_npcmanual", 0 ) --使用說明
	AddSpeakOption( OwnerID(), TargetID(), "[SKWERL_CRAFT1_10]" , "lua_skwerl_craft1_exchange", 0 ) --兌換萬用零件
end


function lua_skwerl_craft1_npcmanual() --說明手冊(NPC用)
	SetSpeakDetail( OwnerID(), "[SKWERL_CRAFT1_09]" ) 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "lua_skwerl_craft1_npc", 0 ) --回上一頁
end


function lua_skwerl_craft1_exchange()--兌換獎勵
	local player=OwnerID()
	local count= CountBodyItem( player, 241606);   --計算玩家身上的萬用零件
	if count==0 then
  		closespeak(player)
  		ScriptMessage(Player,Player,1, "[SKWERL_CRAFT1_12]", C_SYSTEM) --你沒有萬用零件可以兌換，用我發明的[120905]來做出幾個吧！
  		ScriptMessage(Player,Player,0, "[SKWERL_CRAFT1_12]", C_SYSTEM)  --你沒有萬用零件可以兌換，用我發明的[120905]來做出幾個吧！
	else
  		CloseSpeak(player)
  		DelBodyItem(player, 241606, count) --移除玩家身上的萬用零件
  		Givebodyitem(player,240060, count)--給玩家等數的活動券
		GiveBodyItem(player, 241479, count*4)--給暴風元素 (一個萬用零件可以換4個暴風元素 )
  		ScriptMessage(Player,Player,1, "[SKWERL_CRAFT1_11]", C_SYSTEM) --我從來都不會嫌有太多萬用零件!
  		ScriptMessage(Player,Player,0, "[SKWERL_CRAFT1_11]", C_SYSTEM) --我從來都不會嫌有太多萬用零件!
	end
end




---------------------投扔劇情---------------------------------------
--投扔系統說明:玩家施展法術。法術會擊中開口上的隱形物件。隱形物件會知道目前光球的大小，光球的ID，與開口。
--當玩家擊中目標時，法術會判斷目標是否正確，與目標狀態。接著，目標隱形物件會被刪除，然後開口會執行加分或扣分的函示


function lua_skwerl_craft1_toss0() --綠色法術
	local player=OwnerID()
	local target=TargetID() --被法術擊中的隱形物件
	local state=ReadRoleValue( target, EM_RoleValue_Register+2  ) --讀取目標狀態(目前光球的大小)
	local bucket=ReadRoleValue( target, EM_RoleValue_Register+3  ) --讀取bucket
	local ball=ReadRoleValue( target, EM_RoleValue_Register+4  ) --讀取光球
	local playerid=ReadRoleValue( target, EM_RoleValue_Register+5)--讀取光球該有的玩家(錯誤的玩家不會影響到光球) 
	if player~=playerid then  --如果是錯誤的玩家，不會算入擊中
		return false
	end
	
	local tgtid=ReadRoleValue( TargetID(), EM_RoleValue_OrgID) --辨識目標是否為活動目標
	if tgtid~= 120917 and tgtid~= 120918 and tgtid~= 120919  then  --如果不是點選到開口，return false
		return false
	end
	

	if tgtid==120917 then
		delobj(target) --刪除隱形物件
		callplot (bucket, "lua_skwerl_craft1_score", player, bucket, ball, state, 1) --開口執行加分劇情

		
	else
		delobj(target)
		callplot (bucket, "lua_skwerl_craft1_score", player, bucket, ball, state, 2)--開口執行扣分劇情
		addbuff(player, 622799, 0, 75)--錯誤法術積分，加到十五分會爆機
	end
end

function lua_skwerl_craft1_toss1() --藍色法術
	local player=OwnerID()
	local target=TargetID()
	local state=ReadRoleValue( target, EM_RoleValue_Register+2  ) --讀取目標狀態
	local bucket=ReadRoleValue( target, EM_RoleValue_Register+3  ) --讀取bucket
	local ball=ReadRoleValue( target, EM_RoleValue_Register+4  ) --讀取光球
	local playerid=ReadRoleValue( target, EM_RoleValue_Register+5)--讀取光球該有的玩家(錯誤的玩家不會影響到光球) 
	if player~=playerid then  --如果是錯誤的玩家，不會算入擊中
		return false
	end

	local tgtid=ReadRoleValue( TargetID(), EM_RoleValue_OrgID) --辨識目標是否為活動目標
	if tgtid~= 120917 and tgtid~= 120918 and tgtid~= 120919 then  --如果不是點選到開口，return false
		return false
	end
	
	if tgtid==120918 then
		delobj(target)
		callplot (bucket, "lua_skwerl_craft1_score", player, bucket, ball, state, 1)--開口執行加分劇情
	else
		delobj(target)
		callplot (bucket, "lua_skwerl_craft1_score", player, bucket, ball, state, 2)--開口執行扣分劇情
		addbuff(player, 622799, 0, 75)--錯誤法術積分，加到十五分會爆機
	end
end

function lua_skwerl_craft1_toss2()--紅色法術
	local player=OwnerID()
	local target=TargetID()
	local state=ReadRoleValue( target, EM_RoleValue_Register+2  ) --讀取目標狀態
	local bucket=ReadRoleValue( target, EM_RoleValue_Register+3  ) --讀取bucket
	local ball=ReadRoleValue( target, EM_RoleValue_Register+4  ) --讀取光球
	local playerid=ReadRoleValue( target, EM_RoleValue_Register+5)--讀取光球該有的玩家(錯誤的玩家不會影響到光球) 
	if player~=playerid then  --如果是錯誤的玩家，不會算入擊中
		return false
	end


	local tgtid=ReadRoleValue( TargetID(), EM_RoleValue_OrgID) --辨識目標是否為活動目標
	if tgtid~= 120917 and tgtid~= 120918 and tgtid~= 120919 then --如果不是點選到開口，return false
		return false
	end
	
	if tgtid==120919 then

		delobj(target)
		callplot (bucket, "lua_skwerl_craft1_score", player, bucket, ball, state, 1) --開口執行加分劇情

	else
		delobj(target)
		callplot (bucket, "lua_skwerl_craft1_score", player, bucket, ball, state, 2)--開口執行扣分劇情
		addbuff(player, 622799, 0, 75)--錯誤法術積分，加到十五分會爆機
	end
end

-------------------------------------------------------------------------------------------------
function lua_skwerl_craft1_begin1() ---生中控器
	local Player= OwnerID()
	local Machine= TargetID()
	local state=ReadRoleValue( machine, EM_RoleValue_Register+1  ) --如果是1，代表有人在玩 ，如果是0，遊戲會開始
	Closespeak(Player)
	If Checkflag(Player, 546708)== true then  --如果玩家今天已經玩過
		ScriptMessage(Player,Player,1, "[SKWERL_CRAFT1_01]", C_SYSTEM) --操作[120905]需要大量的能量，就算是身經百戰的冒險者也只能一天操作一次！
		ScriptMessage(Player,Player,0, "[SKWERL_CRAFT1_01]", C_SYSTEM) --操作[120905]需要大量的能量，就算是身經百戰的冒險者也只能一天操作一次！
		return false
	end
	If checkbuff(player, 622847)== true then
		return false
	end
	if state==1 then   --如果有人在玩，跳出
		ScriptMessage(Player,Player,1, "[SKWERL_CRAFT1_16]", C_SYSTEM) --通知玩家有人正在進行遊戲
		ScriptMessage(Player,Player,0, "[SKWERL_CRAFT1_16]", C_SYSTEM)
		return false
	end
 	Callplot (machine, "lua_skwerl_craft1_begin2", player, machine)	
end




----------------------------------------------------------------------------------------------------
function lua_skwerl_craft1_begin2(player, machine)
	local PID = ReadRoleValue( machine , EM_RoleValue_PID )--讀取機器的PID來辨認旗標
	local RoomID = ReadRoleValue( player , EM_RoleValue_RoomID )
	local controller1 -- 中控器
	local controller2 -- 中控器
	local controller3 -- 中控器
	local Table={controller1, controller2, controller3, controller4, controller5}
	local Buff={622752, 622753, 622754, 622847, 622799}
	local state=ReadRoleValue( machine, EM_RoleValue_Register+1  ) --如果是1，代表有人在玩 ，如果是0，遊戲會開始
	local buckettable={} --記住光球產生器的table
---------------------------統計系統，計算有多少玩家玩這個活動-------------------------------
	DesignLog( Machine, 120905 , "Craft event machine play number".."." )
---------------------------------------------------------------------------------------------------------------------------------

	WriteRoleValue(machine, EM_RoleValue_Register+1, 1 ) --寫入register+1來避免其他玩家開始進行遊戲

--------------------為了避免重玩，遊戲開始時給安慰獎加旗標與全勤---------------------------
	setFlag(player, 546708,1)--給每日完成flag
--	SkillCraft_AllFinish(player)--給全勤
	Lua_Festival_06_All(player)  -- 6.0.1 改指令
	ScriptMessage(Player,Player,1, "[SKWERL_CRAFT1_18]", C_SYSTEM) --機器吹出了一些暴風元素
	ScriptMessage(Player,Player,0, "[SKWERL_CRAFT1_18]", C_SYSTEM) --機器吹出了一些暴風元素
	GiveBodyItem(player, 241479, 4)--給4個暴風元素 
--	----------------------------給予活動技能------------------------------------------
	for i=1, 4, 1 do
		addbuff(player, Buff[i], 1, 100) ---持續100秒的活動技能
	end
-------------------------------------------------------------------------------------------
sleep(15)

------------------------------把玩家傳送到正確的位置-------------------------------
	local ZoneID = ReadRoleValue(Player, EM_RoleValue_ZoneID)
	local BaseX = GetMoveFlagValue( 781167 , PID , EM_RoleValue_X )
	local BaseY = GetMoveFlagValue( 781167 , PID , EM_RoleValue_y )
	local BaseZ = GetMoveFlagValue( 781167 , PID , EM_RoleValue_z )
	local BaseDir = GetMoveFlagValue( 781167 , PID , EM_RoleValue_Dir )
	ChangeZone(player , ZoneID, RoomID, BaseX, BaseY, BaseZ, BaseDir) ---把玩家傳到場地
	sleep(10)	
----------------------------------------------------------------------------------------



	lua_skwerl_craft1_countdown(player) --倒數(ready???? Go!)
--	-----------------------------------------------------------------------------------
	for i=1, 5, 1 do
		Table[i]= CreateObjByFlag(120907, 781166, i-1+(PID*5), 1)	-- 在旗標生中控器(產生物件ID , 產生旗子ID , 旗子位置ID , 產生數量)
--		SetModeEx(Table[i], EM_SetModeType_Show, false )--顯示
		SetModeEx(Table[i] , EM_SetModeType_Mark, false )--標記
		SetModeEx(Table[i], EM_SetModeType_ShowRoleHead, false) --關頭相框
		SetModeEx(Table[i], EM_SetModeType_HideName, true )--關掉名稱
		AddToPartition( Table[i] , RoomID )
		WriteRoleValue(Table[i], EM_RoleValue_Register+9, player ) -- 中控器記住玩家
	--	WriteRoleValue(Table[i], EM_RoleValue_LiveTime, 70 )
		Callplot(Table[i], "lua_skwerl_craft1_controller2")--生出的目標產生器開始產生目標
--開始執行倒數刪除系統
	end

	Callplot(machine, "lua_skwerl_craft1_machinelock", player, table, buff, RoomID) --(遊戲結束時會再允許玩家加入的機制以及遊戲結束機制)	
	Callplot(machine, "lua_skwerl_craft1_product", player) --(執行給予獎勵的機制)
end

function lua_skwerl_craft1_countdown(player) --倒數計時機制
	ScriptMessage(Player,Player,1, "[SKWERL_CRAFT1_02]", C_SYSTEM)--預備
	ScriptMessage(Player,Player,0, "[SKWERL_CRAFT1_02]", C_SYSTEM) --預備
	sleep(30) 
	ScriptMessage(Player,Player,1, "[SKWERL_CRAFT1_03]", C_SYSTEM)--開始!
	ScriptMessage(Player,Player,0, "[SKWERL_CRAFT1_03]", C_SYSTEM) --開始!
end

function lua_skwerl_craft1_machinelock(player, table, buff, RoomID)--遊戲結束機制 與 避免其他玩家在遊戲進行時開啟新遊戲，接著會把遊戲解鎖
--table 為所有的開口物件，buff為活動相關技能，roomID為物件所在的roomID
	local Distance
	local score
	local machine= OwnerID()
--	sleep(760) --活動會進行76秒
	for i= 1, 75, 1 do
		local explosivescore= FN_CountBuffLevel(player, 622799)+1  --讀取爆破分數(到25會自爆)

--		say(player, explosivescore)
-----------------------------------------------------------------------如果玩家下線
		If CheckID(player)== false then
			for i=1,5,1 do
				break
			end
		end
--------------------------------------------------------------------- 如果玩家出界/離開
		if Checkbuff(player, 622847)==false then
			for i=1,5,1 do
				Callplot(Table[i], "lua_skwerl_craft1_bucketdel") --生光球器的自我刪除
			end
			for i=1, 5, 1 do
				cancelbuff(Player, buff[i]) --清除活動buff
			end
			sleep(15)
			cancelbuff(player, 622830)
			WriteRoleValue(machine, EM_RoleValue_Register+1, 0 ) --清空register+1來允許其他玩家開始進行遊戲
			ScriptMessage(Player,Player,1, "[SKWERL_CRAFT1_13]", C_SYSTEM) ---分數過低，活動失敗，需要重來
			ScriptMessage(Player,Player,0, "[SKWERL_CRAFT1_13]", C_SYSTEM) 
			return false

		end
--------------------------------------------------------------------------------------------------
		if explosivescore >=24 then --玩家每次投錯目標會得爆破分，如果玩家刻意把分數加的夠高的話，機器會引爆
			local Obj = Role:new(machine)  -- 取得machine X.Y.Z.Dir值  用來生爆破用隱形物件 121016
			local BaseX = Obj :X()
 			local BaseY = Obj :Y()
			local BaseZ = Obj :Z()
			local BaseDir = Obj:Dir()
			local explosive = CreateObj(121016, BaseX , BaseY+18 , BaseZ , BaseDir , 1 )--爆破用隱形物件 
			SetModeEx( explosive , EM_SetModeType_NotShowHPMP , true )	------不show血條
			AddtoPartition (explosive, RoomID)
			


			ScriptMessage(Player,Player,1, "[SKWERL_CRAFT1_15]", C_SYSTEM) ---你....到底是做了什麼?!
			ScriptMessage(Player,Player,0, "[SKWERL_CRAFT1_15]", C_SYSTEM) ---你....到底是做了什麼?!
			
			if CountBodyItem(player, 530897)==0 then-- 檢查是否有爆機的稱號，沒有才給
				givebodyitem(player, 530897, 1)
			end
			Hide(machine)  --爆破後，機器暫時消失	
			SysCastSpellLv(explosive, explosive, 499402, 0 ) --機器爆破特效
			SysCastSpellLv(explosive, explosive, 499449, 0 ) --機器爆破特效2
			addbuff(player, 622829, 1, 4)--玩家倒地
			
			cancelbuff(player, 622830)
			for i=1,5,1 do
				Callplot(Table[i], "lua_skwerl_craft1_bucketdel") --生光球器的自我刪除
			end
			sleep(30)
			WriteRoleValue(machine, EM_RoleValue_Register+1, 0 ) --清空register+1來允許其他玩家開始進行遊戲
			for i=1, 5, 1 do
				cancelbuff(Player, buff[i]) --清除活動buff
			end
			delobj(explosive)
			sleep(150)
			Show(Machine, RoomID) --機器重新出現
			return false
		end
		sleep(10)
	end

--------------------------------------bonus 模式------------------------------------------
	score= FN_CountBuffLevel(player, 622830)+1  --讀取分數
	if score>= 220 then 
		ScriptMessage(player, player, 1, "[SKWERL_CRAFT1_17]", C_SYSTEM ) --宣布玩家分數
		sleep(20)	
		for i=1,5,1 do
			WriteRoleValue(Table[i], EM_RoleValue_Register+1, 1 ) --生光球器 register 1寫為1，開啟bonus mode
		end
		sleep (160)
	end
---------------------------------------------------------------------------------------------
	score= FN_CountBuffLevel(player, 622830)+1  --讀取分數
	ScriptMessage(player, player, 1, "[SKWERL_VAL_08]", C_SYSTEM ) --宣布活動結束
	for i=1,5,1 do
		Callplot(Table[i], "lua_skwerl_craft1_bucketdel") --生光球器的自我刪除
	end
	sleep(15)
	for i=1, 5, 1 do
		cancelbuff(Player, buff[i]) --清除活動buff
	end
	sleep(15)
	ScriptMessage(player, player, 1, "[SKWERL_VAL_33]"..": "..score, C_SYSTEM ) --宣布玩家分數
	cancelbuff(player, 622830)
	WriteRoleValue(machine, EM_RoleValue_Register+1, 0 ) --清空register+1來允許其他玩家開始進行遊戲

	if score >=365 then --(如果得到365分以上而)
		if CountBodyItem(player, 530919)==0 then-- 檢查是否有究極操作員的稱號，沒有才給
			givebodyitem(player, 530919, 1)
		end
	end

  end

function lua_skwerl_craft1_product(player)--給萬用零件用script --每到幾分給一個
	local machine= OwnerID()
	local mode ---0 代表沒給過獎，1代表給第一次獎，2代表給第二次獎
	local score
	for i=1, 100, 1 do
 			mode=ReadRoleValue( machine, EM_RoleValue_Register+2  )
 			score= FN_CountBuffLevel(player, 622830)+1  --讀取分數
		
		if Checkbuff(player, 622847)==false or CheckID(player)== false  then           --- 如果玩家取消法術或下線，重製，關閉script
			WriteRoleValue(machine, EM_RoleValue_Register+2, 0)--寫入判斷，reset
			return false
		end

 		if score >119 and mode==0 then--120分時
 			Givebodyitem(player,241606, 1)--給玩家萬用零件x1
 			ScriptMessage(Player,Player,1, "[SKWERL_CRAFT1_14]", C_SYSTEM) 
 	 		ScriptMessage(Player,Player,0, "[SKWERL_CRAFT1_14]", C_SYSTEM)    --製造成功
 			WriteRoleValue(machine, EM_RoleValue_Register+2, 1 ) --寫入判斷，給獎第一次	
 		end
 	
 		if score >209 and mode==1 then --210分時
 			Givebodyitem(player,241606, 1)--給玩家萬用零件x1
 			ScriptMessage(Player,Player,1, "[SKWERL_CRAFT1_14]", C_SYSTEM) 
 	 		ScriptMessage(Player,Player,0, "[SKWERL_CRAFT1_14]", C_SYSTEM)    --製造成功
 			WriteRoleValue(machine, EM_RoleValue_Register+2, 2 )--寫入判斷，給獎第2次	
 		end
 		
 		if score >359 and mode==2 then --360分時
 			Givebodyitem(player,241606, 1)--給玩家萬用零件x1
 			ScriptMessage(Player,Player,1, "[SKWERL_CRAFT1_14]", C_SYSTEM) 
 	 		ScriptMessage(Player,Player,0, "[SKWERL_CRAFT1_14]", C_SYSTEM)    --製造成功
 			WriteRoleValue(machine, EM_RoleValue_Register+2, 0)--寫入判斷，reset
 			return false	
 		end


	sleep(10)
	end
end



function lua_skwerl_craft1_bucketdel() --刪除光球生產器用的劇情
local bucket= OwnerID()
local ball=ReadRoleValue( bucket , EM_RoleValue_Register+6 )--讀取光球 (register+6)
local invisiball=ReadRoleValue( bucket , EM_RoleValue_Register+7 )--讀取隱形物件用 (register+7)
Delobj(ball) --刪除物件光球
Delobj(invisiball)--刪除物件隱形物件
Delobj(bucket)--刪除生產隱形物件與光球的生產器

end



function lua_skwerl_craft1_controller2()
	local bucket= OwnerID()
	local player=ReadRoleValue(bucket, EM_RoleValue_Register+9  )
	----讀取開口位置 ---把光球生在自己的位置上
	local RoomID = ReadRoleValue(bucket , EM_RoleValue_RoomID )
	local Obj = Role:new(bucket)  -- 取得npc X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	--創出光球---隨機抽出該有的光球種類
	local choice
	local choice2
	local random= rand(3)
	if random==0 then --綠球 
		choice=120910   --綠球 
		choice2=120917--綠色隱形球
		elseif random==1 then --藍球
		choice=120911 --藍球
		choice2=120918--藍色隱形球
		elseif random==2 then--紅球
		choice=120912--紅球
		choice2=120919--紅色隱形球
	end 
	local ball = CreateObj( choice, BaseX , BaseY+18 , BaseZ , BaseDir , 1 )--光球(材料需求提示)
	local invisiball= CreateObj( choice2, BaseX , BaseY, BaseZ , BaseDir , 1 ) --創立隱形物件，因為光球沒有參考點，得分劇情是由這個物件執行，所以可以視為中控器
	SetModeEx(invisiball, EM_SetModeType_ShowRoleHead, false) --關隱形物件頭相框
	SetModeEx(invisiball, EM_SetModeType_HideName, true )--關掉隱形物件名稱
	SetModeEx(invisiball, EM_SetModeType_Mark, false )--關掉隱形物件名牌 
	SetModeEx(invisiball, EM_SetModeType_Show, false )--不顯示隱形物件顯示
	SetModeEx(ball, EM_SetModeType_ShowRoleHead, false) --關隱形物件頭相框
	SetModeEx(ball, EM_SetModeType_HideName, true )--關掉隱形物件名稱
	SetModeEx(ball, EM_SetModeType_Mark, false )--關掉隱形物件名牌 
	SetModeEx( ball, EM_SetModeType_Gravity, false )--光球不受重力影響
	Addbuff(ball, 500988, 1, -1) ---把球先縮小
	sleep(21)
	AddToPartition(ball , RoomID )
	AddtoPartition (invisiball, RoomID)
	WriteRoleValue(bucket, EM_RoleValue_Register+6, ball ) ---讓中控器認識光球用(寫入 register+6)
	WriteRoleValue(bucket, EM_RoleValue_Register+7, invisiball ) ---讓中控器認識隱形物件用 (寫入register+7)
	Callplot(invisiball, "lua_skwerl_craft1_ball2", ball, bucket, player)--隱形物件開始執行得分劇情。
end




function lua_skwerl_craft1_ball2(ball, bucket, player) --隱形物件執行的劇情，主要控制光球的大小與掃描玩家是否有對物件施法
	local invisiball=OwnerID()
	local time0
	local time1
	local time2
	local switch
	WriteRoleValue(invisiball, EM_RoleValue_Register+3, bucket)  --寫入bucket
	WriteRoleValue(invisiball, EM_RoleValue_Register+4, ball)  --寫入光球
	WriteRoleValue(invisiball, EM_RoleValue_Register+5, player)  --寫入玩家(辨認這棵光球是被正確玩家擊中)
	
	local mode= ReadRoleValue(bucket, EM_RoleValue_Register+1  ) ---如果register+1為0==一般模式  1==bonus 模式
--	say(bucket, mode)
	if mode==0 then
		time0= Rand(41)+5 --隨機決定第2階段的存活時間
		time1= Rand(41)+5--隨機決定第2階段的存活時間
		time2= Rand(31)+21--隨機決定第三階段的存活時間
	elseif mode==1 then
		time0= 1  --隨機決定第2階段的存活時間
		time1= 1 --隨機決定第2階段的存活時間
		time2= 150 --隨機決定第三階段的存活時間
	end
	
	WriteRoleValue(invisiball, EM_RoleValue_Register+2, 1)  --寫入光球狀態(目前光球的大小)--小--值一分
	for i=1,time0,1 do --第一階段生存時間
		sleep(1)
	end
	
	cancelbuff(ball, 500988) --刪除縮小術使光球變大

	WriteRoleValue(invisiball, EM_RoleValue_Register+2, 2)  --寫入光球狀態(目前光球的大小)--中 值兩分

	for i=1, time1, 1 do --第二階段生存時間
		sleep(1)
	end
	
	WriteRoleValue(invisiball, EM_RoleValue_Register+2, 6)  --寫入光球狀態(目前光球的大小)--大 值六分
	addbuff(ball, 505454, 1, -1) --使光球變大

	for i=1, time2, 1 do --第三階段生存時間
		sleep(1)
	end


	Delobj(ball)--刪除光球
	delobj(invisiball)
	callplot (bucket, "lua_skwerl_craft1_score", player, bucket, ball, 3, 2)---光球爆掉，扣分

end


function lua_skwerl_craft1_score(player, bucket, ball, points, choice) --得分/扣分 中彈劇情 --points為光球值幾分--choice為玩家有沒有使用正確的法術，正確為1錯誤為2
				
	If choice==1 then
		addbuff(player, 622830, points-1, -1) --依照光球大小給玩家分數
		ScriptMessage(player, player, 1, "+"..points, C_SYSTEM )
		SysCastSpellLv(bucket, bucket, 499108, 0 ) --得分特效

		Addbuff(Bucket, 621985, 1, 1) --killer visual fx
		Delobj(ball)--刪除光球
		Callplot(bucket, "lua_skwerl_craft1_controller2") --通知中控器去生新的光球
	elseif choice==2 then --如果技能選擇錯誤，扣分
		CastSpell(bucket , bucket , 497005 ) ---爆破特效
		--扣分系統--
		local score= FN_CountBuffLevel(player, 622830)  --先讀取目前的分數
		cancelbuff(player, 622830) --刪除目前分數
		addbuff(player, 622830, score-1, -1) --更新分數 
		ScriptMessage(player, player, 1, "-1", 0 )
		 --通知中控器去生新的光球
		Delobj(ball)--刪除光球
		Callplot(bucket, "lua_skwerl_craft1_controller2")--通知中控器去生新的光球
	end
end



function lua_skwerl_craft1_reset()
	local player=OwnerID()
	DelBodyItem(player, 546708, 1)
	DelBodyItem(player, 530897, 1)
	DelBodyItem(player, 530919, 1)
end



--hp test system--
--switch
function lua_skwerl_val_test()
	local Player=OwnerID()
	Addbuff(Player, 621904, 1, -1)-- play system
	Addbuff(Player, 621903, 3, -1) ---hp
	Addbuff(Player, 621993, 1, -1)--IFF
	Addbuff(Player, 622035, 1, 180)
end

function lua_skwerl_val_test2()
	local Player=OwnerID()
	Addbuff(Player, 622035, 1, 180)
end

--impact
function lua_skwerl_val_hit()  --中彈劇情
--	say(OwnerID(), "owner")
--	say(TargetID(), "target")
	local target=targetID()
	local Player=OwnerID()
	local HP= FN_CountBuffLevel(target, 621903)


	if CheckBuff(target, 621933)==true then                                                  --如果目標已死
		return false

--	elseif CheckBuff( target , 621915)==true then --如果目標帶有防禦法術
--		return false

	elseif HP==1 then	--當目標hp=0時，確認目標斃命，幫殺手加分
		SysCastSpellLv(target, target, 499097,1 )
		--say (Player, playerscore)
		Cancelbuff(target, 621903) --扣hp
		Addbuff(target, 621903, HP-1, -1)
		Addbuff(Player, 621985, 1, 1) --killer visual fx
		Addbuff(Player, 622036, 1, 900) --加分
		local score= FN_CountBuffLevel(Player, 622036) --報分
		ScriptMessage( Player,Player, 2, "+2", C_SYSTEM );  --報分
--		say (Player, score+1) --報分
		Addbuff(target,621933,1,8) --死亡無敵狀態
		Addbuff(target,621932,1,5) --裝死
	
		sleep(50)
		Addbuff(target, 621903, 2, -1)--目標重生
	--	say(target, "respawn")	
	
	else               -- 一般擊中
		SysCastSpellLv(target, target, 499097,1 )
		SysCastSpellLv(target, Player, 499108, 1 )--得能量像效果
		Cancelbuff(target, 621903)
		Addbuff(target, 621903, HP-1, -1) --扣hp
		--Addbuff(Player, 621960, 1, 1)
		Addbuff(Player, 622036, 0, 900) --加分
		ScriptMessage( Player,Player, 2, "+1", C_SYSTEM );  --報分

		--say(target, "Hit")
	end
end




-------------------
function lua_skwerl_val_explosion()
local Player = TargetID()
local Mine = OwnerID()
--say(Player, "player")
--say(Mine, "mine")
--	local Master = ReadRoleValue ( OwnerID , EM_RoleValue_OwnerGUID )
	local Obj_X = ReadRoleValue ( Mine, EM_RoleValue_X)
	local Obj_Y = ReadRoleValue ( Mine, EM_RoleValue_Y)
	local Obj_Z = ReadRoleValue ( Mine, EM_RoleValue_Z)   ---------讀取舊的BOSS本身的座標位置
--	local powerLV = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+12 )
	Sleep (13) --地雷延遲引爆
--	Addbuff(Player, 621960, 1, -1)
	
		--sysCastSpelllv ( OwnerID , OwnerID , 498573 , 0 )  ----自己對自己施放一個法術(表演用)
--	say(Player, "Obj_X="..Obj_X)
--	say(Player, "Obj_Y="..Obj_Y)
--	say(Player, "Obj_Z="..Obj_Z)
--	SysCastSpellLv_Pos( Mine , Obj_X , Obj_Y , Obj_Z , 499047 , 1 )
	SysCastSpellLv( Player, Mine, 499047,1 )
	sleep ( 10 )
end
---------------------------
function lua_skwerl_val_counter_explosion()
local Player = TargetID()
local Mine = OwnerID()
local bufflv= FN_CountBuffLevel(Player, 621916)+1
	if bufflv+1 ==0 then
		Cancelbuff(Player, 621916)
	else
	local newbuff= bufflv-1
		Cancelbuff(Player, 621916) --讓玩家只能反擊一次
		Addbuff(Player, 621916, newbuff-2, -1)
	end
	
	local Obj_X = ReadRoleValue ( Mine, EM_RoleValue_X)
	local Obj_Y = ReadRoleValue ( Mine, EM_RoleValue_Y)
	local Obj_Z = ReadRoleValue ( Mine, EM_RoleValue_Z)   ---------讀取舊的BOSS本身的座標位置
	
	Sleep (13)

	SysCastSpellLv( Player, Mine, 499069,1 )
	sleep ( 10 )
end

---------------------------------

function lua_skwerl_val_counterhit()
	
	local target=targetID()
	local Player=OwnerID()
	local HP= FN_CountBuffLevel(target, 621903)
	
	if CheckBuff(target , 621933)==true then                                                --如果目標已死
		return false

	elseif CheckBuff( target , 621915)==true then --如果目標帶有防禦法術
		Addbuff(target, 621916, 1, -1)  --給予反擊技能
		Cancelbuff(target, 621915) --取消防禦

	else	--一擊斃殺

		SysCastSpellLv(target, target, 499097,1 )
		--say (Player, playerscore)
		Cancelbuff(target, 621903) --扣hp
		Addbuff(target, 621903, HP-1, -1)
		Addbuff(Player, 621985, 1, 1) --killer visual fx
		Addbuff(Player, 622036, 1, 900) --加分
		local score= FN_CountBuffLevel(Player, 622036) --報分
		ScriptMessage( Player,Player, 2, "+2", C_SYSTEM );  --報分
--		say (Player, score+1) --報分
		Addbuff(target,621933,1,8) --死亡無敵狀態
		Addbuff(target,621932,1,5) --裝死
	
		sleep(50)
		Addbuff(target, 621903, 2, -1)--目標重生


	end
end
----------------------------------------------------

function lua_skwerl_val_hpreport()
	local Player=TargetID()
	local HP= FN_CountBuffLevel(Player, 622036)
	say(Player, HP)
end

---model/element/common/prop/music_fun/act_magic_plane_b.ros

function lua_skwerl_mine_hide()

	SetModeEx( OwnerId(), EM_SetModeType_Mark , false )--標記
	SetModeEx( OwnerId(), EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( OwnerId(), EM_SetModeType_Show , false )--顯示

end
--------------------------------------------------------------------
--- check for friendly---
function lua_skwerl_iff()
local target= TargetID()
	if Checkbuff(target,621993)==false then   ---如果沒報名
		return false
	elseif  CheckBuff( target , 621915)==true then --如果目標帶有防禦法術
		return false
	end
local caster = OwnerID()
	if caster==target then 
		return false
	else
		return true
	end
end

-----------

function lua_skwerl_val_cheat()
	say(OwnerID(), "owner")
	say(TargetID(), "target")
	Addbuff(OwnerID(),  621986, 1, -1)
	Addbuff(OwnerID(), 621915, 1, 10)
	Addbuff(OwnerID(), 621916, 2, -1)
end


function lua_skwerl_val_KO()
local Player = TargetID()
local Mine = OwnerID()

Cancelbuff(Player, 621986) --讓玩家只能反擊一次
	
	local Obj_X = ReadRoleValue ( Mine, EM_RoleValue_X)
	local Obj_Y = ReadRoleValue ( Mine, EM_RoleValue_Y)
	local Obj_Z = ReadRoleValue ( Mine, EM_RoleValue_Z)   ---------讀取舊的BOSS本身的座標位置

	SysCastSpellLv( Player, Mine, 499059,1 )
	sleep ( 10 )
end

function lua_skwerl_val_koshutdown()
	Cancelbuff(OwnerID(), 621986)
	Addbuff(targetID(),621932,1,5) 
end

function lua_skwerl_val_koshutdown2()
	Cancelbuff(OwnerID(), 621986)
	say(OwnerID(), "owner")
end
---remove buff if KIA'ed
---remove buff if used
---checkbufflv if 2 then +1 buff and give weapon switch 1
--- checkbufflv if 4 then +1 buff and give weapon switch 2




-------------REGISTRATION SYSTEM-------------------------------------------

-----------NPC--------------
function lua_skwerl_val_npc()  --主辦人
	SetSpeakDetail( OwnerID(), "[SKWERL_VAL_03]" ) --((Correction:stove introduction))
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SKWERL_VAL_18") , "lua_skwerl_val_aboutrules", 0) --活動規則
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SKWERL_VAL_27") , "lua_skwerl_val_abouttime", 0) --活動時間	
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SKWERL_VAL_02") , "Lua_skwerl_val_registration", 0 ) --參加遊戲
end

function lua_skwerl_val_npc_teleport()  ---傳送師
	SetSpeakDetail( OwnerID(), "[SKWERL_VAL_26]" ) --((introduction )
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SKWERL_VAL_30") , "Lua_skwerl_val_teleportation", 0 ) --給我傳送石
 end

function lua_skwerl_val_teleportationstone()  --傳送石
	ChangeZone(OwnerID() , 2, 0, 1594.3, -21.9, 9542.8, 74.5)
end


-----報名-----------
function Lua_skwerl_val_registration() --Npc報名劇情
	local Player = OwnerID()
	local npc= TargetID()
	local registercount= ReadRoleValue( npc , EM_RoleValue_Register+1  )
	Local Hour
	Local Min
	Local Backdoor
	 Hour = GetSystime(1) --取得現在時間：時
	 Min = GetSystime(2) --取得現在時間：分
	--place backdoor system here----
	backdoor= ReadRoleValue( npc , EM_RoleValue_Register+2  ) 
	local check=checkbuff(Player, 622035)
		if CheckFlag( Player, 546188 ) == true then
		Closespeak(Player);
		ScriptMessage(Player,Player,1, "[SKWERL_VAL_15]", C_SYSTEM) --你今天已經參加過了，請明天再來!
	 	ScriptMessage(Player,Player,0, "[SKWERL_VAL_15]", C_SYSTEM)
			
		elseif check==true then
		Closespeak(Player);
		ScriptMessage(Player,Player,1, "[SKWERL_VAL_22]", C_SYSTEM) --你已經註冊過了
	 	ScriptMessage(Player,Player,0, "[SKWERL_VAL_22]", C_SYSTEM)
	
		elseif Hour==0 or Hour==12 or Hour==18 or  backdoor==1 then

			if registercount==10 then
			Closespeak(Player);
			ScriptMessage(Player,Player,1, "[SKWERL_VAL_24]", C_SYSTEM)--活動已額滿
	 		ScriptMessage(Player,Player,0, "[SKWERL_VAL_24]", C_SYSTEM)
			elseif (Min>=7 and Min<10) or (Min>=17 and Min<20) or (Min >=27 and Min<30) or (Min >=37 and Min<40) or (Min >=47 and Min<50)  then 	
			Closespeak(Player);
			ScriptMessage(Player,Player,1, "[SKWERL_VAL_01]", C_SYSTEM) --註冊成功
			ScriptMessage(Player,Player,0, "[SKWERL_VAL_01]", C_SYSTEM)
			newregistercount=registercount+1
			WriteRoleValue(npc , EM_RoleValue_Register+1, newregistercount ) 
			Addbuff(Player, 622035, 1, 185)--註冊證明 ---give registration buff 
			else
			Closespeak(Player);
			ScriptMessage(Player,Player,1, "[SKWERL_VAL_25]", C_SYSTEM) --請在活動開始三分鐘前報名
			ScriptMessage(Player,Player,0, "[SKWERL_VAL_25]", C_SYSTEM)

			end
		else
		Closespeak(Player);
		ScriptMessage(Player,Player,1, "[SKWERL_VAL_25]", C_SYSTEM) --請在活動開始三分鐘前報名
		ScriptMessage(Player,Player,0, "[SKWERL_VAL_25]", C_SYSTEM)


	end
end
-------------------獎品兌換------------------------

-------------------------------------------
function Lua_skwerl_val_teleportation()-- 傳送師能力
	local player= OwnerID()
	if CheckFlag( Player, 546195 ) == true then  --檢查傳送石的每日flag
		Closespeak(player);	
		ScriptMessage(Player,Player,1, "[SKWERL_VAL_28]", C_SYSTEM) --"很抱歉，一天只能送一顆傳送石，請明天再來!"
		ScriptMessage(Player,Player,0, "[SKWERL_VAL_28]", C_SYSTEM)
	else
		Closespeak(player);
		ScriptMessage(Player,Player,1, "[SKWERL_VAL_31]", C_SYSTEM) --"這一顆傳送石就給你了，祝你好運!"
		ScriptMessage(Player,Player,0, "[SKWERL_VAL_31]", C_SYSTEM)
		GiveBodyItem( player, 241112, 1 ) --給傳送石
		setFlag(player, 546195,1)--給傳送石的每日flag
	end
end



function lua_skwerl_val_aboutrules() --關於規則字串
	SetSpeakDetail( OwnerID(), GetString("SKWERL_VAL_16") ) 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , " lua_skwerl_val_npc", 0 ) --回上一頁
end

function lua_skwerl_val_abouttime() --關於時間字串
	SetSpeakDetail( OwnerID(), GetString("SKWERL_VAL_13") ) 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , " lua_skwerl_val_npc", 0 ) --回上一頁
end


	--function lua_skwerl_val_timetable() --報名細節字串
	--	SetSpeakDetail( OwnerID(), GetString("SKWERL_VAL_25") ) 
	--	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , " lua_skwerl_val_npc", 0 ) --回上一頁
	--end
	--
	--function lua_skwerl_val_alreadyregistered() --已經報名過
	--	SetSpeakDetail( OwnerID(), GetString("SKWERL_VAL_22") ) 
	--	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , " lua_skwerl_val_npc", 0 ) --回上一頁
	--end
	--
	--function lua_skwerl_val_full() --名額已滿
	--	SetSpeakDetail( OwnerID(), GetString("SKWERL_VAL_24") ) 
	--	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , " lua_skwerl_val_npc", 0 ) --回上一頁
	--end


function lua_skwerl_val_timer() ---npc 時間計時
		local npc=TargetID()
		Local Hour
		Local Min
		while true do
		 Hour = GetSystime(1) --取得現在時間：時
		 Min = GetSystime(2) --取得現在時間：分
			if (hour==0 and Min==0) or (hour==12 and Min==0) or (hour == 18 and Min==0) then
			ScriptMessage(OwnerID(),2,1, "[SKWERL_VAL_32]", C_SYSTEM) --廣播
			local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
			local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsgEx( OwnerID() , 2 , 3 , "[SKWERL_VAL_32]" )   --廣播開始
			end
			sleep(600)
			end
		
			 if Min==0 or Min==10 or Min==20 or Min==30 or  Min==40 or Min ==50 then   
			WriteRoleValue(TargetID() , EM_RoleValue_Register+1, 0)
			 end	
		sleep (600)
		end
end
-----------------------------------------------------------------------------------------
function lua_skwerl_val_bailout()
	
--時間系統
	
	Local npc=OwnerID()
	Local magicformation
	Local Hour
	Local Min

---物件位置
	local RoomID = ReadRoleValue( npc , EM_RoleValue_RoomID )
	local Obj = Role:new( npc )  -- 取得npc X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local x= BaseX
	local y= BaseY
	local z= BaseZ
	local  direction= BaseDir
	local backdoor
	local backdoor2
	local backdoor3
-------	
	local magicformation
	local registeredplayer
	local remainingplayer = 0
	local judge
	local wall
	local registeredplayer2 ={}--new
	while true do
		 Hour = GetSystime(1) --取得現在時間：時
		 Min = GetSystime(2) --取得現在時間：分
		--backdoor-
		backdoor= ReadRoleValue( npc , EM_RoleValue_Register+1  ) --後門，強制開始遊戲
		backdoor2= ReadRoleValue( npc , EM_RoleValue_Register+2  )  -- 後門，強制人數足夠開關
		backdoor3= ReadRoleValue( npc , EM_RoleValue_Register+3  )  -- 後門，強制人數足夠開關
    		   if Hour==0 or Hour==12 or Hour==18 or backdoor==1 or backdoor3==1 then	
			if Min==7 or Min== 17 or Min==27 or Min==37 or Min==47 or backdoor3==1 then  --test
				--預先生魔法鎮
			
				magicformation= CreateObj(120390 , BaseX , BaseY , BaseZ , BaseDir , 1 )
				SetModeEx( magicformation  , EM_SetModeType_Mark, false )--標記
				AddToPartition( magicformation , RoomID )
				if  backdoor3==1  then
					say(npc, "test begins")
				elseif backdoor==0 or backdoor==1 then
					Sleep(1500) --魔法鎮倒數時間 test
				end
				registeredplayer = SearchRangePlayer( npc , 130 )  --搜尋圈內玩家
				
				for i=0, table.getn(registeredplayer), 1 do --向圈內玩家宣告倒數
					ScriptMessage( registeredplayer[i],registeredplayer[i],1, "[SKWERL_VAL_12]", C_SYSTEM) --活動即將開始
					ScriptMessage(registeredplayer[i],registeredplayer[i],0, "[SKWERL_VAL_12]", C_SYSTEM)
				end
				
				sleep(300)
				DelObj(magicformation)
			--	WriteRoleValue(npc , EM_RoleValue_Register+1, 0) --清除後門backdoor開關 				
		
				
				for i=0, table.getn(registeredplayer), 1 do
					if CheckBuff( registeredplayer[i] , 622035 ) == true then -- 有註冊buff讓玩家開始遊戲
						Addbuff(registeredplayer[i], 621904, 1, -1)-- play system --攻擊法術
						Addbuff(registeredplayer[i], 621903, 3, -1) ---hp
						Addbuff(registeredplayer[i], 621993, 1, -1)
						CancelBuff(registeredplayer[i], 622035) ---砍註冊buff					
						table.insert(registeredplayer2, registeredplayer[i] )--new	
				--	else
				--		ChangeZone(registeredplayer[i] , 954 , RoomID , -274.0, -257.1, -634.2, 237.4) --無註冊玩家傳送出場
					end	
				end
				local number1=table.getn(registeredplayer)
				local number2=table.getn(registeredplayer2)
				--say (npc, number1)
				--say (npc, number2)
				 if backdoor3==1 then
					number2=6
					WriteRoleValue(npc , EM_RoleValue_Register+3, 0)  --清除後門開關。
				end
				if number2<2 then
			--	if table.getn(registeredplayer2)<2 then
					for  i=1, table.getn(registeredplayer2), 1 do
		
		
						ScriptMessage( registeredplayer2[i],registeredplayer2[i],1, "[SKWERL_VAL_17]", C_SYSTEM) --人數不夠
						ScriptMessage(registeredplayer2[i],registeredplayer2[i],0, "[SKWERL_VAL_17]", C_SYSTEM)
						Cancelbuff(registeredplayer2[i], 621904)-- play system
						Cancelbuff(registeredplayer2[i], 621903) ---hp
						Cancelbuff(registeredplayer2[i], 621993) --註冊
		
					end
					registeredplayer2={}---registeredplayer2 歸零
					sleep (620)
					
				else
					for  i=1, table.getn(registeredplayer2), 1 do
						ScriptMessage( registeredplayer2[i],registeredplayer2[i],1, "[SKWERL_VAL_09]", C_SYSTEM) --活動開始
						ScriptMessage(registeredplayer2[i],registeredplayer2[i],0, "[SKWERL_VAL_09]", C_SYSTEM)
				
					end
		
					Lua_Hao_Round_wall( npc , 120368 , 20, 130 , 0 ) --建牆
					--生裁判
				--	local judge
					judge=  CreateObj( 120394 , BaseX , BaseY , BaseZ , BaseDir , 1 ) --創裁判
					AddToPartition(judge , RoomID )
					SetModeEx( judge, EM_SetModeType_Mark , false )
				--	生power up
					 lua_skwerl_val_spawn(X,Y,Z,Direction,RoomID,registeredplayer2)	
					 lua_skwerl_val_spawn_2(X,Y,Z,Direction,RoomID,registeredplayer2)	
					 
				--------------------------遊戲結束 remove buff----------------------------				
					for i=1, table.getn(registeredplayer2), 1 do
						Cancelbuff(registeredplayer2[i], 621904)-- play system
						Cancelbuff(registeredplayer2[i], 621903) ---hp
						Cancelbuff(registeredplayer2[i], 621993) --註冊
						--刪除power ups--
						Cancelbuff(registeredplayer2[i],621986)
						Cancelbuff(registeredplayer2[i],621916)	
						Cancelbuff(registeredplayer2[i],621915)
						
					end
			
				------------------刪牆---------------------------------------------
					wall= LuaFunc_SearchNPCbyOrgID(npc , 120368, 350 , 1 )   	
					for i=0, table.getn(wall), 1 do
						Delobj(wall[i])
					end
				--------------------------------------------------------------------------
					DelObj(judge) --刪裁判
					sleep(10)
				-------------重複執行清除，確認完全清除-----------------
					
					for i=1, 3, 1 do
						for i=1, table.getn(registeredplayer2), 1 do
							Cancelbuff(registeredplayer2[i], 621904)-- play system
							Cancelbuff(registeredplayer2[i], 621903) ---hp
							Cancelbuff(registeredplayer2[i], 621993) --註冊
							--刪除power ups--
							Cancelbuff(registeredplayer2[i],621986)
							Cancelbuff(registeredplayer2[i],621916)	
							Cancelbuff(registeredplayer2[i],621915)
						end
					end
					sleep(5)


					registeredplayer2={}---remainingplayer 歸零
			   	 end
				
			end 
		end
	sleep (10)
    	end

end





 function Lua_skwerl_val_walltest() -- 測試建立圓型阻擋牆
	Lua_Hao_Round_wall( OwnerID() , 120368 , 20, 130 , 0 )
	sleep(30)
--	local wall
--	wall= LuaFunc_SearchNPCbyOrgID( OwnerID() , 120368, 350 , 1 )   	
			for i=0, table.getn(wall), 1 do
				Delobj(wall[i])
			end
	
--	Delobj(wall)
	say (OwnerID(), "test")
end



function Lua_skwerl_val_distcheck() --檢查距離
	local npc = OwnerID()
--	local Newplayer ={}
--	for i , player in pairs(CheckPlayer) do
	
	local activeplayer = SearchRangePlayer( npc , 300 )  --掃報名玩家。
	local activeplayer2={}
	for i=0, table.getn(activeplayer), 1 do
		if CheckBuff( activeplayer[i] , 621993 ) == true then 
			table.insert(activeplayer2 , activeplayer[i]);
		end
	end	
	if #activeplayer2 >= 0 then--table.getn(activeplayer2) ~= nil then
		while true do
			local tmp = {}
			for i=1 , table.getn(activeplayer2) , 1 do
				local Distance= GetDistance(npc, activeplayer2[i])
				if Distance > 160 then
					ScriptMessage( activeplayer2[i],activeplayer2[i],1, "[SKWERL_VAL_07]", C_SYSTEM)  --玩家出局
					ScriptMessage( activeplayer2[i],activeplayer2[i],0, "[SKWERL_VAL_07]", C_SYSTEM)
					Cancelbuff(activeplayer2[i], 621904)-- play system
					Cancelbuff(activeplayer2[i], 621903) ---hp
					Cancelbuff(activeplayer2[i], 621993) --註冊
					Cancelbuff(activeplayer2[i], 622036) -- 分數
					--砍power ups
					Cancelbuff(activeplayer2[i],621986)
					Cancelbuff(activeplayer2[i],621916)	
					Cancelbuff(activeplayer2[i],621915)
				
				else
					table.insert( tmp, activeplayer2[i] )
				end
			end
			activeplayer2 = tmp;
			SysCastSpellLv(npc, npc, 499244,1 )
			
			for i = 1 , table.getn(tmp) , 1 do
				local BuffType = 0
				local Count = BuffCount( tmp[i] )

				for j = 1 , Count  , 1 do
					local BuffID = BuffInfo(tmp[i] , j , EM_BuffInfoType_BuffID )
					if GameObjInfo_int( BuffID , "AssistType" ) == 68 then
						BuffType = GameObjInfo_int( BuffID , "AssistType" )
						break
					end
				end
				if BuffType == 68 then --有騎乘坐騎
					DW_CancelTypeBuff( 68,  tmp[i] ) --下馬
					ScriptMessage( tmp[i] , tmp[i] , 1 , "[SKWERL_VAL_29]" , 0 )  --活動進行中，此處無法騎乘坐騎！0是紅的  C_SYSTEM是黃色
				end
	
			end
		sleep(10)
		end
	end
end	
	

-----------------沒報名的玩家會傳出場(法術設定)-------------------

function lua_skwerl_teleportationcheck()
	local player= TargetID()
	if (Checkbuff(player,621993)==false and Checkbuff(player, 622035)== true) then
		ChangeZone(Player , 2, 0, 1594.3, -21.9, 9542.8, 74.5) 
		ScriptMessage(player,player,1, "[SKWERL_VAL_35]", C_SYSTEM)  --請不要干擾活動。
		ScriptMessage( player,player,0, "[SKWERL_VAL_35]", C_SYSTEM)
	elseif Checkbuff(player,621993)==false then    --沒報名的玩家會傳出場
		ChangeZone(Player , 2, 0, 1594.3, -21.9, 9542.8, 74.5) --傳到活動npc旁
		ScriptMessage(player,player,1, "[SKWERL_VAL_11]", C_SYSTEM)  --請不要干擾活動。
		ScriptMessage( player,player,0, "[SKWERL_VAL_11]", C_SYSTEM)
	end
end
--------------------------------------------------------------------
function lua_skwerl_val_power_invincible()  ---無敵power up
	Local player=OwnerID()
	if Checkbuff(player, 621993)==false then
		return false
		else
		Addbuff(player, 621915, 1, 8)
		ScriptMessage(Player,Player,1, "[SKWERL_VAL_04]", C_SYSTEM)
		ScriptMessage(Player,Player,0, "[SKWERL_VAL_04]", C_SYSTEM)
	end
end


Function lua_skwerl_val_power_knockdown() ---倒地power up
	Local player=OwnerID()
	if Checkbuff(player, 621993)==false then
		return false
		else
		Addbuff(player,  621986, 1, -1)
		ScriptMessage(Player,Player,1, "[SKWERL_VAL_05]", C_SYSTEM)
		ScriptMessage(Player,Player,0, "[SKWERL_VAL_05]", C_SYSTEM)
	end
end

Function lua_skwerl_val_power_nuke() ---大絕power up
	Local player=OwnerID()
	if Checkbuff(player, 621993)==false then
			return false
	elseif checkbuff(player, 621916)==true then
			return false
	else
		Addbuff(player, 621916, 2, -1)
		ScriptMessage(Player,Player,1, "[SKWERL_VAL_06]", C_SYSTEM)
		ScriptMessage(Player,Player,0, "[SKWERL_VAL_06]", C_SYSTEM)
	end
end

-----power up 生產function---
function lua_skwerl_val_spawn(X,Y,Z,Direction,RoomID)
	local powerup
	local angle			
	for i=0, 9, 1 do
		local Random1 = Rand(3)
		local Random2=Rand(2)
		if Random2==0 then
			angle = 1
		elseif Random2==1 then
			angle = -1	
		end

		if Random1==0 then
			powerup= CreateObj( 241054 ,X + angle*Rand(85) , Y , Z+angle*Rand(85) , Direction , 1 ) --創立power up 1
		elseif Random1==1 then
			powerup= CreateObj( 241072 , X + angle*Rand(85) ,Y , Z+angle*Rand(85) , Direction , 1 ) --創立power up 2
		else
			powerup= CreateObj( 241073 , X + angle*Rand(85) ,Y , Z+angle*Rand(85) , Direction , 1 ) --創立power up 3	
		end
		AddToPartition( powerup , RoomID )
		SetModeEx( powerup , EM_SetModeType_Mark , false )
		Sleep(150)
		DelObj(powerup)		
	 end	
end

-----power up 生產function part 2---

function lua_skwerl_val_spawn_2(X,Y,Z,Direction,RoomID,table1)
	local powerup1
	local powerup2
	local powerup3
	local angle
	local angle2
	local angle3
	local score
	local green

	for  i=1, table.getn(table1), 1 do
		if Checkbuff(table1[i], 621993)==true then
			ScriptMessage(table1[i],table1[i],1, "[SKWERL_VAL_19]", C_SYSTEM) --離遊戲結束還有30秒
			ScriptMessage(table1[i],table1[i],0, "[SKWERL_VAL_19]", C_SYSTEM)
		end
	end

	for i=0, 5, 1 do
		if i==4 then
			for  i=1, table.getn(table1), 1 do
				if Checkbuff(table1[i], 621993)==true then
					ScriptMessage(table1[i],table1[i],1, "[SKWERL_VAL_20]", C_SYSTEM) --離遊戲結束還有10秒
					ScriptMessage(table1[i],table1[i],0, "[SKWERL_VAL_20]", C_SYSTEM)
				end
			end
		elseif i==5 then
			for  i=1, table.getn(table1), 1 do
				if Checkbuff(table1[i], 621993)==true then
					ScriptMessage(table1[i],table1[i],1, "[SKWERL_VAL_21]", C_SYSTEM) --離遊戲結束還有5秒
					ScriptMessage(table1[i],table1[i],0, "[SKWERL_VAL_21]", C_SYSTEM)
					setFlag(table1[i], 546188,1)   --給參與過flag 
				end
			end	
		end

		local Random2=Rand(2)
		if Random2==0 then
			angle = 1
			elseif Random2==1 then
			angle = -1	
		end
		
		local Random3=Rand(2)
		if Random3==0 then
			angle2 = 1
			elseif Random3==1 then
			angle2 = -1	
		end
		
		local Random4=Rand(2)
		if Random4==0 then
			angle3 = 1
			elseif Random4==1 then
			angle3 = -1	
		end
		
		local greenrandom=Rand(100)        --生綠球系統

		
		if greenrandom >= 79 then
  			powerup1= CreateObj( 241054 ,X + angle*Rand(85) , Y , Z+angle3*Rand(85) , Direction , 1 ) --創立power up 1
  			AddToPartition( powerup1 , RoomID )
  			SetModeEx( powerup1 , EM_SetModeType_Mark , false )
		end

		powerup2= CreateObj( 241072 , X + angle2*Rand(85) ,Y , Z+angle*Rand(85) , Direction , 1 ) --創立power up 2
		AddToPartition( powerup2 , RoomID )
		SetModeEx( powerup2 , EM_SetModeType_Mark , false )

		powerup3= CreateObj( 241073 , X + angle3*Rand(85) ,Y , Z+angle2*Rand(85) , Direction , 1 ) --創立power up 3	
		AddToPartition( powerup3 , RoomID )
		SetModeEx( powerup3, EM_SetModeType_Mark , false )	
	
		
		Sleep(60)
		if greenrandom >= 79  then
			DelObj(powerup1)
		end		
		DelObj(powerup2)
		DelObj(powerup3) 
	 end	
	
	for  i=1, table.getn(table1), 1 do
		if Checkbuff(table1[i], 621993)==true then
			ScriptMessage(table1[i],table1[i],1, "[SKWERL_VAL_08]", C_SYSTEM) --遊戲結束
			ScriptMessage(table1[i],table1[i],0, "[SKWERL_VAL_08]", C_SYSTEM)
		end
	end
	for  i=1, table.getn(table1), 1 do  --得分宣布
		if Checkbuff(table1[i], 621993)==true then
			score = FN_CountBuffLevel(table1[i], 622036)+1
			ScriptMessage(table1[i],table1[i],1, "[SKWERL_VAL_33]"..":"..score.."[SKWERL_VAL_34]", C_SYSTEM) 
			ScriptMessage(table1[i],table1[i],0, "[SKWERL_VAL_33]"..":"..score.."[SKWERL_VAL_34]", C_SYSTEM)
				if score >=40 then
				GiveBodyItem(table1[i], 209161,3)--給予獎勵
					if CountBodyItem(table1[i], 530877 )==0 then-- 檢查是否有擊墜王成就，如果沒有，給成就
					givebodyitem(table1[i], 530877, 1)
					end
				elseif score>=20 then
				Givebodyitem(table1[i], 209161,2) --給予獎勵
				else
				Givebodyitem(table1[i], 209161,1) --給予獎勵
				end

			Cancelbuff(table1[i], 622036)---刪除分數	
		end
	end
	
end

----------傳送石阻擋---------------<100 為正常區域
function lua_skwerl_val_teleportcheck()
	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )  -- 自己的zone id
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 )

	if Zone < 100  then  
		return true
	else
		ScriptMessage( OwnerID(), OwnerID() ,  1 , "[SC_DAN_111700_37]" , 0 )
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_DAN_111700_37]" , 0 )	
		return false	
	end
end


------------------測試科用後門指令--------------
function lua_skwerl_val_on() --backdoor on
	local OID= OwnerID()
	local NPC = LuaFunc_SearchNPCbyOrgID( OID , 120387, 400 , 0) 
	local NPC2 = LuaFunc_SearchNPCbyOrgID( OID , 120319, 400 , 0) 
	WriteRoleValue(NPC , EM_RoleValue_Register+1, 1 ) 
	WriteRoleValue(NPC2 , EM_RoleValue_Register+2, 1 ) 
end

function lua_skwerl_val_off() --backdoor off
	local OID= OwnerID()
	local NPC = LuaFunc_SearchNPCbyOrgID( OID , 120387, 400 , 0) 
	local NPC2 = LuaFunc_SearchNPCbyOrgID( OID , 120319, 400 , 0) 
	WriteRoleValue(NPC , EM_RoleValue_Register+1, 0 ) 
	WriteRoleValue(NPC2 , EM_RoleValue_Register+2, 0 ) 
end

function lua_skwerl_val_backdoor2()
	local OID= OwnerID()
	local NPC = LuaFunc_SearchNPCbyOrgID( OID , 120387, 300 , 0) 
	WriteRoleValue(NPC , EM_RoleValue_Register+3, 1 ) 

end

function lua_skwerl_val_announcement()
	ScriptMessage(OwnerID(),2,1, "[SKWERL_VAL_32]", C_SYSTEM) --廣播
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsgEx( OwnerID() , 2 , 3 , "[SKWERL_VAL_32]" )   --廣播開始
	end
end

function lua_skwerl_val_score(score)
	Cancelbuff(OwnerID(), 622036)
	Addbuff(OwnerID(), 622036, score-1, 900)
end
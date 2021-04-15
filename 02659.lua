---register vlaue used---
-- monster register 8 and 9 are for destination navigations
--- monster register 2 are target hit lock

--player register 1 ==WriteRoleValue(player, EM_RoleValue_Register+1,  ) for timer system 
-- player em register 2= attack cooldown
--player register 3== 1==timed mode 0==survival
-- player register 4== 1= timed 2= survival
--	WriteRoleValue(player, EM_RoleValue_Register+7, 5 )  for player sp 1hko  weapon count
--	WriteRoleValue(player, EM_RoleValue_Register+8, 5 )  for player sp slow down  weapon count
--	WriteRoleValue(player, EM_RoleValue_Register+9, 5 )  for player sp 1hko  weapon count


function lua_skwerl_mobius_movetest() --生出特別目標用的script
	local player= OwnerID()
	local BaseX = GetMoveFlagValue( 781131 , 0 , EM_RoleValue_X )
	local BaseY = GetMoveFlagValue( 781131 , 0 , EM_RoleValue_y )
	local BaseZ = GetMoveFlagValue( 781131 , 0 , EM_RoleValue_z )
	local BaseDir = GetMoveFlagValue( 781131 , 0 , EM_RoleValue_Dir )
	local RoomID = ReadRoleValue( player, EM_RoleValue_RoomID )
	local j= 0
	local i= 0
	monster= CreateObj(106885, BaseX, BaseY, BaseZ, BaseDir , 1 )
	SetModeEx( monster , EM_SetModeType_ShowRoleHead, false) --關頭相框
	SetModeEx( monster , EM_SetModeType_HideName, true )--關掉名稱
	AddToPartition( monster , RoomID )
	addbuff(monster, 623108, 120, -1) --加速
	Addbuff(monster, 622599, 1, -1) --著火特效
	sleep(10)
	WriteRoleValue(monster, EM_RoleValue_LiveTime, 20 )
	Callplot(monster, "lua_skwerl_mobius_move",j, i) --移動到旗標
end


function lua_skwerl_mobius_test()
	local player = OwnerID()
	Addbuff(Player, 622377, 1, -1)	
	AddBuff(Player , 621826 , 1 , -1)
end


function lua_skwerl_mobius_impact()  ---中彈劇情
	local target= TargetID() --目標
	local Player=OwnerID() --玩家
	local hp= FN_CountBuffLevel(target, 622401)+1 --目前目標的血量
	local speed=FN_CountBuffLevel(target, 622403)+1---目前目標的速度加成
	local modifier=2^speed --(速度給的分數量是這樣算的: 加速一次=分數x2   加速兩次:分數x2x2，加速三次= 分數x2x2x2) 
	local score= modifier*2 --(2 是每滴HP給的基本分數，modifier為上面算出來的分數加成)
	local tgtid=ReadRoleValue( target, EM_RoleValue_OrgID)
	local hit= ReadRoleValue( target , EM_RoleValue_Register+2  ) --檢查目標是否以中彈 ，當hit為1時，目標已經要死了，正在delobj，所以法術不會再執行，如果沒這個判斷，會有很多"plot is already running"
	local spellcast= ReadRoleValue(player , EM_RoleValue_Register+2  ) --檢查spellcast是否在撥放中
	if spellcast==0 then 
		callplot(player, "lua_skwerl_mobius_tgttest")--(內建CD系統，模板的CD系統會顯示"冷卻中"訊息，我改用兩秒的register設定來做替代式CD。
		CastSpell(player, target, 499390) --造假攻擊特效，這個特效自己有兩秒的CD來避免"已在施法中"訊息洗頻. 當register2為1時，法術無法施放) !!!!攻擊法術本身沒有CD，不過攻擊特效有CD!!!!!
	else 
	--	say(player, "busy")
	end


	PlayMotion( player , 88 ) ---發法動作(因為法術掛的地方讓玩家沒辦發有施法動作，所以就去造假)


	if target==player then  --如果目標是玩家，顯示錯誤訊息
		ScriptMessage(player,player,2, "[EM_200928_2]", C_SYSTEM)
		ScriptMessage(player,player,0, "[EM_200928_2]", C_SYSTEM)
		return  false
	end

	
	if tgtid~=106881 and tgtid~=106882 and tgtid~=106883 and tgtid~= 106884 and tgtid~=106885 then  --只攻擊活動目標
		return false
	end
	if checkbuff (target, 622606)== true then --倒數時的目標無敵(在護盾後的目標是無敵的，有無敵buff return false)
		return false
	end
	
	if hit==1 then ---如果判斷目標已經中彈(目標死亡中)，法術無用
	--	say (target, "hit2")
		return false
	end
	----------當以上條件都府和，攻擊法術開始判斷目標種類------
	SysCastSpellLv(target, Player, 499386, 1 ) --得分特效 (得分光球往玩家飛)
	if tgtid==106885 then --特殊目標(擊中特殊目標:106885會給玩家特殊技能)
		WriteRoleValue(target, EM_RoleValue_Register+2, 1 ) -- target hit 
		local powerup=rand(2)
		if powerup==0 then --給範圍性攻擊
			addbuff(player, 622601, 1, -1)  
			addbuff(player, 622646, 1, -1) --給2發攻擊存彈量
			ScriptMessage(player,player,2, "[SKWERL_MOBIUS_07]", C_SYSTEM)
		end
		
		if powerup==1 then --- 給緩速技
			addbuff(player, 622602, 1, -1)
			addbuff(player, 622647, 1, -1)--給2發緩速技存彈量
			ScriptMessage(player,player,2, "[SKWERL_MOBIUS_06]", C_SYSTEM)
		end

	end

	if tgtid==106882 then --如果目標是爆裂型 
		WriteRoleValue(target, EM_RoleValue_Register+2, 1 )-- 避免被擊中多次 (目標一次就可以被打死，所以被打中一次就宣告死亡)
		callplot(target, "lua_skwerl_mobius_scan", Player) ---爆裂攻擊的script
	--	SysCastSpellLv(target, target, 499370, 1)
		SysCastSpellLv(target, target, 499310,1) ---爆裂特效
		SetModeEx( target, EM_SetModeType_Mark, false ) --關標記，以免連續擊中
	end
	if tgtid==106883 then       --如果目標是加血類 
		WriteRoleValue(target, EM_RoleValue_Register+2, 1 ) -- 避免被擊中多次 (目標一次就可以被打死，所以被打中一次就宣告死亡)
		SysCastSpellLv(target, target, 499311,1) --幫附近的目標加血
		SetModeEx( target, EM_SetModeType_Mark, false ) --關標記，以免連續擊中
	end
	if tgtid== 106884 then       --如果目標是加速類
		WriteRoleValue(target, EM_RoleValue_Register+2, 1 ) -- 避免被擊中多次
		lua_skwerl_mobius_explosionfx(target, 121070, 499312)  --爆破特效，並幫周圍目標加速
		SetModeEx( target, EM_SetModeType_Mark, false ) --關標記，以免連續擊中

	end
	if hp<=2 then --如果HP少於2，目標會被殺死
		WriteRoleValue(target, EM_RoleValue_Register+2, 1 ) -- 避免被擊中多次
		if tgtid==106881 or tgtid==106885 then 
   			SysCastSpellLv( target, target, 497005,1 )
   		end
		AddBuff(target , 622727 , 1 , -1) ---死掉的目標被定身
		Addbuff(player, 622402, score-1, -1) --玩家加分
	--	Addbuff(player, 622543, 0, -1)
	--	say(target, score)
		SetModeEx( target, EM_SetModeType_Mark, false ) --關標記，以免連續擊中
   		Callplot(target, "lua_skwerl_mobius_death")--延遲0.8秒的刪除系統(不然特效會消失)
	else --如果目標有大於2的生命值，扣一點的生命值
		Cancelbuff(target,  622401) --刪除原有生命值
		local hp2=hp-3 --扣除目前的hp量(扣兩滴) 因為遊戲的分數是以2為基礎
		Addbuff(player, 622402, score-1, -1)--給玩家分數
	--	say(target, score)
		addbuff(target, 622401, hp2, -1)
	end

end


function lua_skwerl_mobius_death() --延遲0.8秒的刪除系統(不燃特效會消失)
	sleep(8)
	delobj(OwnerID())
end


function lua_skwerl_mobius_move()--怪物移動系統，讀取移動旗標781130，接著指定目標移動至旗標附近的座標
	local owner=OwnerID()
	local x
	local y
	local z
	local j= ReadRoleValue( owner , EM_RoleValue_Register+8  )  --讀取自己的目標
	local i=ReadRoleValue( owner , EM_RoleValue_Register+9  ) --讀取自己的目標
	x = GetMoveFlagValue( 781130 , 0 , EM_RoleValue_X )
	y = GetMoveFlagValue( 781130 , 0 , EM_RoleValue_y )
	z = GetMoveFlagValue( 781130 , 0 , EM_RoleValue_z )
	movedirect(owner, x+13*j, y , z+13*i )
end


function lua_skwerl_mobius_spawn(player, loop, time)
	local BaseX = GetMoveFlagValue( 781131 , 0 , EM_RoleValue_X )--抓怪用旗標[781131]的座標
	local BaseY = GetMoveFlagValue( 781131 , 0 , EM_RoleValue_y )--抓怪用旗標[781131]的座標
	local BaseZ = GetMoveFlagValue( 781131 , 0 , EM_RoleValue_z )--抓怪用旗標[781131]的座標
	local BaseDir = GetMoveFlagValue( 781131 , 0 , EM_RoleValue_Dir )
	local RoomID = ReadRoleValue( player, EM_RoleValue_RoomID )
	local timemode= ReadRoleValue(player, EM_RoleValue_Register+3) --如果timemode=1，代表是玩計時模式
	local monsterlist={}
	local wall
--	cancelbuff(Player, 622543)
	wall= CreateObj(114771, BaseX+64 , BaseY, BaseZ+95  , BaseDir , 1 ) --生怪時，怪物前面會有阻擋牆
	SetModeEx( wall, EM_SetModeType_Mark, false ) --關標記
	AddToPartition( wall , RoomID )
	if loop~=1 and timemode==1 then --如果計時遊戲正在進行中，暫停計時器
		lua_skwerl_mobius_clockpause(player)
	end
-----生怪系統，讀取旗標781131的位置，接著再以9x5的形式生怪
	for i= 0, 8, 1 do	
 		for j=0, 4, 1 do
			local spawnid
 			local monster
			local random=5
			if (i==1 and j==3) or  (i==4 and j==3) or (i==7 and j==3) then --強制在(1, 3) (4, 3) 與(7,3)的位置生爆破怪
				random=0		
			end

			if j==1 and (i==0 or i==2 or i==4 or i==6 or i==8) then --在(1, 0), (1, 2), (1,4), (1,6), 與(1,8)的位置生特別怪
				random=rand(3)
			end

			if random==0 then ---爆破類
					spawnid=106882 ---加血類
				elseif random==1 then
					spawnid=106883
				elseif random ==2 then --加速類
					spawnid=106884
				elseif random > 2 then
					spawnid=106881 --一般目標
			end
 			monster= CreateObj(spawnid, BaseX+16*j , BaseY, BaseZ+16*i  , BaseDir , 1 )--(每隻怪的位置是由座標判斷)
			Addbuff(monster, 622401, 1, -1) --設hp為2(上HP buff)
			SetModeEx( monster , EM_SetModeType_NotShowHPMP , true )	------不show血條
			SetModeEx( monster , EM_SetModeType_ShowRoleHead, false) --關頭相框
			SetModeEx( monster , EM_SetModeType_HideName, true )--關掉名稱
			SetModeEx( monster  , EM_SetModeType_Searchenemy, false )--不可索敵
			SetModeEx( monster  , EM_SetModeType_Strikback, false )--不可反擊
 			AddToPartition( monster , RoomID )
			lua_skwerl_mobius_levelspeed(monster, loop) --系統會判斷玩家是在第幾關，來調整怪物的跑速: (loop=關卡數)
			WriteRoleValue( monster , EM_RoleValue_Register+1 , player )  ---怪物記住玩家
			WriteRoleValue(monster , EM_RoleValue_Register+8, j )    --怪物記住自己的目標 (目標以自己的register 8與9來決定要走的位置，以保持移動隊形)
			WriteRoleValue(monster, EM_RoleValue_Register+9, i ) --怪物記住自己的目標  (目標以自己的register 8與9來決定要走的位置，以保持移動隊形)
			WriteRoleValue(monster, EM_RoleValue_LiveTime, 200 ) --設定怪物生存時間(其實不是很重要，備份系統以免怪物刪除有問題)
			MoveToFlagEnabled( monster, false ); --  避免系統會在 NPC 離開出生點太遠的時候下令 NPC 跑回出生點
			table.insert(monsterlist, monster) 
			addbuff(monster, 622606, 1, -1) --怪物剛生出時程無敵狀態，不然就被玩家馬上打死了

		sleep (1)
 		end

	end	
	
	lua_skwerl_mobius_countdown(player, wall)
	if loop==1 and timemode==1 then --如果是有計時性遊戲
		 lua_skwerl_mobius_clockstart(player, time) --如果遊戲是剛開始，創造計時器
	elseif timemode==1 then  --如果是有計時性遊戲
		 lua_skwerl_mobius_clockcontinue(player)--如果計時暫停，繼續計時
	end
	For i= 1, table.getn(monsterlist), 1 do
		cancelbuff(monsterlist[i], 622606)--怪物開始移動，關閉無敵
		Callplot(monsterlist[i], "lua_skwerl_mobius_move")--移動到旗標
	end
end


function lua_skwerl_mobius_scan(Player) ---當爆破目標引爆時，會計算所有附近目標的分數
	local target
	local total=0
	target= LuaFunc_SearchNPCbyOrgID(OwnerID() , 106881, 25 , 1 )   	--搜尋範圍內的一般目標
	for i=0, table.getn(target), 1 do
		local hit= ReadRoleValue( target[i] , EM_RoleValue_Register+2  ) --檢查目標是否以中彈 
		if hit==0 then	
			local hp= FN_CountBuffLevel(target[i], 622401)+1 --計算目標血量
			local speed=FN_CountBuffLevel(target[i], 622403)+1 --計算目標的速度buff
			local modifier=2^speed 
			local score= modifier*hp
		--	say(target[i], score.." modifier:"..modifier.." ")
			total =total+score
	
		--	say(target[i], "scanned")
			SysCastSpellLv(target[i], player, 499386, 1 )
			WriteRoleValue(target[i], EM_RoleValue_Register+2, 1 ) -- 代表目標已經被擊中，避免一個目標被炸到多次然後造成script already running
			SetModeEx( target[i]   , EM_SetModeType_Mark, false ) --關標記，以免連續擊中
			addbuff(target[i], 622727, 1, -1)
			callplot(target[i], "lua_skwerl_mobius_death")--刪除被炸到的目標
		--------------^把所有掃到目標的分數加起來 ^-------------------------
		end
	end
--	say(player, "total1: "..total)
	total=total/2 --因為是爆破目標所以得分減半
--	Addbuff(player, 622543, table.getn(target)-1, -1)
--	say (Player, total)
	Addbuff(player, 622402, total-1, -1) --幫玩家加分
	if total >2 then --爆出玩家這次爆破收到了幾分
		ScriptMessage(player, player, 2, "+".." "..total+2, C_SYSTEM )	
	end
	
	if total >28 then --如果一次擊爆28分，給成就
		if CountBodyItem(player, 530924)==0 then-- 檢查是否有爆破的稱號，沒有才給
			givebodyitem(player, 530924, 1) --爆力美學
		end
	end
end



function lua_skwerl_mobius_hp_buff() --加血目標劇情(掛在499311下)
	local target= TargetID()
	local Player=OwnerID()
	local hp= FN_CountBuffLevel(Target, 622401)+1
	local tgtid=ReadRoleValue( target, EM_RoleValue_OrgID)
	if tgtid==106881 then --如果是一般目標
	local hp2= (2*hp)	--hpx2
	--	say (target, "hp2".." "..hp2)
		cancelbuff(target, 622401) ---刪除原先hp
		addbuff(target, 622401, hp2-1, -1) ---帶入新hp數值 
		addbuff(target, 622400, 1, -1) ---特效
	end
end


function lua_skwerl_mobius_speed()---加速目標爆破劇情 (掛在499312下)
	local target= TargetID()
	local owner=OwnerID()
	local j= ReadRoleValue( target , EM_RoleValue_Register+8  )  --讀取自己的目標
	local i=ReadRoleValue( target , EM_RoleValue_Register+9  ) --讀取自己的目標
	local hp= FN_CountBuffLevel(Target, 622401)+1
	local tgtid=ReadRoleValue( target, EM_RoleValue_OrgID)
	if tgtid~=106881  then --只會引響一般目標
		return false
	end
--	addbuff(target, 622403, 0, -1)
	--say(target, "test2")
	if owner==target then
		delobj(owner)
		return false
	end


	local bufflv= FN_CountBuffLevel(target, 622403)+1  --目標加速buff層數
	local speedlv= FN_CountBuffLevel(target, 623108)+1 --目標原有的速度
	addbuff(target, 622403, bufflv, -1) --(把目標加速)
	StopMove(target, true)--瞬間把目標暫停
	ReCalculate(target)--讓伺服器重新計算目標會到達目的地的速率
	callplot(target, "lua_skwerl_mobius_move", j, i)--重新執行移動劇情

end








function lua_skwerl_mobius_scantest()
	addbuff(OwnerID(), 622521, 1, -1)

end


function lua_skwerl_mobius_line()
	local owner= OwnerID()
	local target= TargetID()
	local tgtid=ReadRoleValue( target, EM_RoleValue_OrgID)
	local player = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9  ) --讀取玩家
	if tgtid==106885 then--直接刪除特別目標，特殊目標越界不算game over
		delobj(target)
	end
	if tgtid==106881 or tgtid==106882 or tgtid==106883 or tgtid== 106884 then  --只掃描活動目標
		Addbuff(Owner, 622401, 0, -1) --當目標一越界，加一層622401(計算越界目標量)
		local bufflv= FN_CountBuffLevel(Owner, 622401)+1 --(如果目標越界，622401會被加層，加到5的時候game over)
		local playerbuff= FN_CountBuffLevel(player, 622576)+1  ---玩家還剩多少目標穿越機會(讀出來，計算用)
		if bufflv<6 then
			ScriptMessage( player , player , 2 ," ".. bufflv.."[SKWERL_MOBIUS_04]" , 0 )
		end 
		cancelbuff(player, 622576) ---玩家還剩多少目標穿越機會
		if playerbuff>0 then
			addbuff(player, 622576, playerbuff-2, -1)--(跟新可越界目標數字)<---顯示在計分板上用的
		end
		delobj(target)		
	end
end




function lua_skwerl_mobius_linescan(npc, player)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+9, player ) --記住玩家

	while true do
------記分板機制--------------------------
	local playerscore=FN_CountBuffLevel(player, 622402)+1--改變記分板分數
	local playerhp=FN_CountBuffLevel(player, 622576)+1--可越界次數

	SetSmallGameMenuStr( PLAYER , 15 , 1 , "[SKWERL_MOBIUS_05][$SETVAR1="..playerhp.."]" ) --可越界次數
	SetSmallGameMenuStr( PLAYER , 15 , 2 , "[SC_DDR_STRING07_STATE][$SETVAR1="..playerscore.."]" ) --改變記分板分數
------------------------------------------
	SysCastSpellLv( OwnerID(), OwnerID(), 499352,1 )--偵測越界目標用的正方形魔法鎮
	sleep(10)
	end

end



function lua_skwerl_mobius_loop(player, npc, timersystem)
	local owner= OwnerID()
	local BaseX = GetMoveFlagValue( 781130 , 0 , EM_RoleValue_X ) --781130 為生怪用旗標，先抓座標
	local BaseY = GetMoveFlagValue( 781130 , 0 , EM_RoleValue_y )--781130 為生怪用旗標，先抓座標
	local BaseZ = GetMoveFlagValue( 781130 , 0 , EM_RoleValue_z )--781130 為生怪用旗標，先抓座標
	local BaseDir = GetMoveFlagValue( 781130 , 0 , EM_RoleValue_Dir )
	local RoomID = ReadRoleValue( npc, EM_RoleValue_RoomID )
	local timemode= ReadRoleValue(player, EM_RoleValue_Register+3) --如果是有計時性遊戲，timemode=1，如果玩生存戰，timemode==0
	local x=0
	local time=0
	local scanner
	local randomspawn=0
	Closespeak(Player) --關閉玩家與npc對話框
	lua_skwerl_mobius_npcswitch(false, true) --避免玩家在活動時點到活動npc(因為一開始跟NPC對話)
	Setflag(player, 546722, 1) --玩過活動的旗標
	ClientSkyType( EM_ClientSkyProcType_Day ) --變成白天，不然低系統玩家看不清楚
	AddBuff(Player , 622727 , 1 , -1)--把玩家定身
	SetSmallGameMenuType( Player, 15 , 1 ) --記分板，填1為創造，填2為關閉				--記分板
	scanner= CreateObj(120687, BaseX+13*4 , BaseY, BaseZ+13*2  , BaseDir , 1 ) --在終點線造出掃描機:scanner (scanner會掃描越界的敵人量)
	SetModeEx( scanner, EM_SetModeType_Show , false ) --不顯示scanner
	AddToPartition( scanner , RoomID )
	Callplot(scanner, "lua_skwerl_mobius_linescan", npc, player)
	ChangeZone(player , 360, RoomID, 53.2, 963.2, 411.3, 270) ---把玩家傳到射擊地點	
	sleep(10)
	addbuff(player, 622576, 4, -1)--可越界次數(顯示在玩家UI上的越界提示) (Game over用的系統是讀scanner上的buff 622401
	Addbuff(Player, 622377, 1, -1) --給予玩家基本攻擊技能
	
--	Hide(owner)
	sleep(30)
--	Show(Owner, RoomID)
	while true do --當所有遊戲開始步驟都準備好後，開始跑遊戲執行迴圈
		x=x+1
		--say(Owner, "loop"..x.." ") --x 為關卡數(這就是為什麼從0開始數)
		ScriptMessage(player,0,2, "[SKWERL_MOBIUS_01][$SETVAR1="..x.."]", C_SYSTEM)
	--	callplot(Owner, "lua_skwerl_mobius_spawn", player, x)
		lua_skwerl_mobius_spawn(player, x, timersystem) --生目標用的script，生完目標後繼續執行迴圈
		sleep (20)  --這個迴圈主要是讀取終點線scanner的狀況，與遊戲時間倒數狀態
 			while true do
 		
 				local bufflv= FN_CountBuffLevel(scanner, 622401)+1 --scanner的buff level是決定於幾個目標越界，如果5個目標越界，buff level就會是5
				local countdown
				if timemode==1 then --當遊戲模式為計時模式時，會去讀取目前倒數時間
					countdown=ClockRead(player , EM_ClockValueType_NowTime )
				else 
					countdown=100 --在無計時闖關模式裡讓系統以為還有剩時間 (所以在非計時模式，時間永遠待在100秒)
				end
		
 				if bufflv> 4 or countdown<1  then  --如果時間結束或5個目標越界，game over
					if bufflv>4 then
						ScriptMessage( player , player , 2 ,"[SKWERL_MOBIUS_08]", 0 ) --宣告過多目標越界，game over
					end
					lua_skwerl_turtlecleanup() ---如果game over，刪除所有場上目標
					lua_skwerl_mobius_endgame(player, countdown, x, timemode, scanner)--執行遊戲結束分數，獎勵計算劇情
					return false	
 				end
 		
 				local number=lua_skwerl_mobius_tgtcount() --數出場上存活目標數量(數量確認是0會逕行下一局，不然玩家會一直等)

 				if number<1 then --如果目標數為0，提早進入下一關
 					ScriptMessage(player,0,2, "[SKWERL_MOBIUS_03][$SETVAR1="..x.."]", C_SYSTEM)
					local wavebonus= (x*30) --給玩家過關紅利，紅利==關卡數x30
 					ScriptMessage(player,0,2, "[SKWERL_MOBIUS_13]".." + "..wavebonus.." ", C_SYSTEM)
					ScriptMessage(player,0,0, "[SKWERL_MOBIUS_13]".." + "..wavebonus.." ", C_SYSTEM)
					Addbuff(player, 622402, wavebonus, -1)
					sleep(20)
					if timemode==0 and  x==10 then ---如果玩闖關模式玩到第X關，玩家全破
						lua_skwerl_mobius_endgame(player, countdown, x, timemode, scanner)
						return false	
					end
					break
 				end

				time= time +1
			--	say(OwnerID(), x.." :  "..time)
 				sleep(10)
				if (x==3 or x==6 or x==9 or x== 12 or x==15 or x==18 or x== 21 or x==24 or x==27 or x==30) and time==1 then ----在這些回合的第一秒中生出特殊目標
					lua_skwerl_mobius_movetest()
				end

 			end
	time=0
	sleep(1)
	end
end


function lua_skwerl_mobius_tgtcount() --搜尋系統，回報場地上的目標物件總數，如果算出來為0，遊戲會進入下一關
	local tgt1
	local tgt2
	local tgt3
	local tgt4
	local count1
	local count2
	local count3
	local count4
	count1= LuaFunc_SearchNPCbyOrgID(OwnerID() , 106881, 650 , 1 )
	count2 = LuaFunc_SearchNPCbyOrgID(OwnerID() ,106882 , 650 , 1 )
	count3= LuaFunc_SearchNPCbyOrgID(OwnerID() , 106883, 650 , 1 )  	
	count4= LuaFunc_SearchNPCbyOrgID(OwnerID() , 106884, 650 , 1 )  	
	tgt1= table.getn(count1)
	tgt2= table.getn(count2)
	tgt3= table.getn(count3)
	tgt4= table.getn(count4)
	local total= tgt1+tgt2+tgt3+tgt4
	return total
end


Function lua_skwerl_mobius_countdown(player, wall)
	--	local count= 5-(i-1)
		ScriptMessage( player, player, 2, "Get ready!!!" , C_SYSTEM)  
		sleep (35)
		delobj(wall)
		ScriptMessage( player, player, 2, "Go!!!" , C_SYSTEM)  

end

function lua_skwerl_turtlecleanup() ---刪除場上所有目標用
	lua_skwerl_tgtdelete(106881)
	lua_skwerl_tgtdelete(106882)
	lua_skwerl_tgtdelete(106883)
	lua_skwerl_tgtdelete(106884)
	lua_skwerl_tgtdelete(106885)
end

function lua_skwerl_tgtdelete(object)--偵測範圍內目標並把目標刪除
	local tgt
	tgt= LuaFunc_SearchNPCbyOrgID(OwnerID() , object, 650 , 1 )   	
	for i=0, table.getn(tgt), 1 do
	Delobj(tgt[i])
	end
end



---------------------------遊戲結束系統---------------------------------

function lua_skwerl_mobius_endgame(player, countdown, x, timemode, scanner) --x 是關卡數
		lua_skwerl_mobius_npcswitch(true, false) --活動結束，NPC恢復到可對話狀態
		local scorerecord 
		local gamemode=ReadRoleValue(player, EM_RoleValue_Register+3) --如果是1的話，代表計時模式。
		local bonuslv=  FN_CountBuffLevel(player, 622576)+1 --統計玩家未越界次數
		clockclose(player)  ---關掉倒數計時
------------------------------------------------v  成功全破才會給的bonus v------------------------------------------------------------------
	 	if countdown<1 or (timemode==0  and x==10 and bonuslv>1) then --第一項是假設計時模式的時間到，第二項是指在生存戰破關(mode: 生存戰，第X關，存活成功)
			if countdown<1 then		
				ScriptMessage( player , player , 2 ,"[SKWERL_MOBIUS_31]", 0 ) --時間到
			elseif x==10 then ---道第10關全破
				ScriptMessage( player , player , 2 ,"[SKWERL_MOBIUS_44]", 0 ) --生存成功！
			end
			ScriptMessage( player , player , 2 ,"[SKWERL_MOBIUS_09]", 0 ) --訓練結束！
			sleep(25)
			ScriptMessage(player,player,2, "[SKWERL_MOBIUS_11]", C_SYSTEM) --防守加成
			ScriptMessage(player,player,0, "[SKWERL_MOBIUS_11]", C_SYSTEM) --防守加成
			sleep(10)
			local defbonus= bonuslv*50 --用未越界次數來計算防守bonus
			ScriptMessage(player,player,2, "[SKWERL_MOBIUS_12]".." "..bonuslv.." x ".."50 ", C_SYSTEM) -- 可越界次數x50
			ScriptMessage(player,player,0, "[SKWERL_MOBIUS_12]".." "..bonuslv.." x ".."50 ", C_SYSTEM) 	-- 可越界次數x50
			sleep(20)
			ScriptMessage(player,player,2, "[SKWERL_MOBIUS_17]"..defbonus.."[SKWERL_VAL_34]", C_SYSTEM) --額外X分
			ScriptMessage(player,player,0, "[SKWERL_MOBIUS_17]"..defbonus.."[SKWERL_VAL_34]", C_SYSTEM)  --額外X分
			Addbuff(player, 622402, defbonus-1, -1)
			sleep(30)
			ScriptMessage(player,player,2, "[SKWERL_MOBIUS_10]".." + 100" , C_SYSTEM)  --生存獎勵
			ScriptMessage(player,player,0, "[SKWERL_MOBIUS_10]".." + 100" , C_SYSTEM)  --生存獎勵
			Addbuff(player, 622402, 99, -1) --幫玩家加分

			-- defense bonus

		end
		---------------------^以上為成功過關的bonus，提早game over就不會給^-------------------------------------------------	
		sleep(15)

		local playerscore=FN_CountBuffLevel(player, 622402)+1
		ScriptMessage(player,player,2, "[SKWERL_MOBIUS_38]"..x, C_SYSTEM) ---完成關卡數：
		ScriptMessage(player,player,0, "[SKWERL_MOBIUS_38]"..x, C_SYSTEM)----完成關卡數：

		--ScriptMessage(player,player,2, "[SKWERL_MOBIUS_10]", C_SYSTEM)
		sleep(30)

		ScriptMessage(player,player,2, "[SKWERL_VAL_33]"..":"..playerscore.."[SKWERL_VAL_34]", C_SYSTEM) --總分 ____分
		ScriptMessage(player,player,0, "[SKWERL_VAL_33]"..":"..playerscore.."[SKWERL_VAL_34]", C_SYSTEM) --總分 ____分
		sleep(30)
---------------------------------------------------成就計算--------------------------------------------------------------------------
		lua_skwerl_mobius_achievements (player, playerscore, gamemode, x)--player==玩家 playerscore= 分數 gamemode=遊戲模式，計時模式為1，生存戰為0  level=關卡數
---------------------------------------------------給獎計算--------------------------------------------------------------------------
		local Rank
		if playerscore >= 3300 then
			Rank = "A"
		elseif playerscore >= 2700 then
			Rank = "B"
		elseif playerscore >= 2100 then
			Rank = "C"
		else
			Rank = "D"
		end
		-- 2013.05.13 阿浩:追加代入玩家分數
 		lua_skwerl_mobius_prizeroll(player,gamemode,Rank,playerscore)
 		--
		sleep(30)
------------------------------------------------------記分板------------------------------------------------------------------------------
		If gamemode==1 then  --如果是計時模式，開啟計時分數的計分系統
			Billboard_TopUpdate(Player, EM_BillboardSortType_Range, playerscore) --上傳玩家的分數(只會上傳大於自己在計分板最高分數的分數)
	 		OpenClientMenu(player , EM_ClientMenuType_BillBoard+102 )---開計時模式排行榜
		end
		--******注意，不同的計分模式會開出不同的記分板*******-------------
		If gamemode==0 then  --如果是生存模式，開啟計時分數的計分系統
			Billboard_TopUpdate(Player, EM_BillboardSortType_Range_Survival, playerscore)--上傳玩家的分數(只會上傳大於自己在計分板最高分數的分數)
	 		OpenClientMenu(player , EM_ClientMenuType_BillBoard+103 ) ---開出生存戰排行榜
		end
----------------------------------------------------------------------------------------------------------------------------------------------------
	SetSmallGameMenuType( Player, 15 , 2 ) --記分板，填1為創造，填2為關閉	
	WriteRoleValue(player, EM_RoleValue_Register+1, 0 )--計時器系統清空
	WriteRoleValue(player, EM_RoleValue_Register+2, 0 )  --玩家法術CD清空(多重清空來確保安全)
	WriteRoleValue(player, EM_RoleValue_Register+3, 0 ) --關掉計分模式tag 
		cancelbuff(player, 622576)
		cancelbuff(player, 622402)
--		cancelbuff(Player, 622543)
		cancelbuff(Player, 622377)	
		cancelbuff(Player , 622727)
		cancelbuff(Player, 622601) 
		cancelbuff(Player, 622602) 
		cancelbuff(player, 622604) 
----------------------------------------------------
		cancelbuff(player, 622646)
		cancelbuff(player, 622647)
		cancelbuff(player, 622648)
	
		sleep(10)
		sleep(10)
		delobj(scanner)

end











-----------------------------------------timer system------------------------計時系統
function lua_skwerl_mobius_clockstart(player, time) --開始計時
ClockOpen(player, EM_ClockCheckValue_28, time, time, 0, "Lua_Clockending" ,  "Lua_skwerl_mobius_clockend" )
end

function Lua_skwerl_mobius_clockend() --時間結束
	ClockClose(OwnerID())
	--say(OwnerID(), "clock ends")
end

function lua_skwerl_mobius_clockpause(player) ---時間暫停
	--ClockStop(player)
	local time=ClockRead(player , EM_ClockValueType_NowTime ) --抓目前時間
	WriteRoleValue(player, EM_RoleValue_Register+1, time-1)--把時間記在玩家的register上
	
	ClockClose(player) --關閉玩家目前的倒數
	ClockOpen(player, EM_ClockCheckValue_28, time-1, time-1, 0, "Lua_Clockending" ,  "Lua_skwerl_mobius_clockend" )
	ClockStop(player)
end

function lua_skwerl_mobius_clockcontinue(player) --繼續倒數
	local time =ReadRoleValue(player, EM_RoleValue_Register+1 ) --讀取記錄在玩家身上的殘餘時間
	ClockClose(player) --關閉玩家目前的倒數
	ClockOpen(player, EM_ClockCheckValue_28, time, time, 0, "Lua_Clockending" ,  "Lua_skwerl_mobius_clockend" )--用殘餘時間開始在計時
end

---------------------------------------------------------------------------
function lua_skwerl_clockteststart()
	ClockOpen(OwnerID(), EM_ClockCheckValue_28, 60, 60, 0, "Lua_Clockending" ,  "Lua_skwerl_mobius_clockend" )
end

function lua_skwerl_clocktestpause()
	local time=ClockRead(OwnerID() , EM_ClockValueType_NowTime ) --抓目前時間
--	WriteRoleValue(OwnerID(), EM_RoleValue_Register+1, time-1 )--把時間記在玩家的register上
	ClockClose(OwnerID()) --關閉玩家目前的倒數
	ClockOpen(OwnerID(), EM_ClockCheckValue_28, time-1, time-1, 0, "Lua_Clockending" ,  "Lua_skwerl_mobius_clockend" )
	ClockStop(OwnerID())
	sleep(30)
	ClockClose(OwnerID())
end

function lua_skwerl_clocktestcontinue() --繼續倒數
	local time =ReadRoleValue(OwnerID(), EM_RoleValue_Register+1 ) --讀取記錄在玩家身上的殘餘時間
	ClockClose(OwnerID()) --關閉玩家目前的倒數
	ClockOpen(OwnerID(), EM_ClockCheckValue_28, time, time, 0, "Lua_Clockending" ,  "Lua_skwerl_mobius_clockend" )--用殘餘時間開始在計時
end

-------------------------------------記分板--------------------------------------------
function lua_skwerl_scoreboard(player) ---開出正確的排行榜
OpenClientMenu(player , EM_ClientMenuType_BillBoard+102 )
--EM_ClientMenuType_BillBoard+016 )
end
-----------------------------------冷卻系統------------------
function lua_skwerl_mobius_tgttest() ---內建Cooldown系統(不用法術集合的CD來避免施法中與冷卻中的訊息)
		WriteRoleValue(OwnerID(), EM_RoleValue_Register+2, 1 ) 

		sleep(20)
		WriteRoleValue(OwnerID(), EM_RoleValue_Register+2, 0) 
end


function lua_skwerl_mobius_attackcd()  ---如果CD系統設玩家register 2為1，系統不會允許施法
	local spellcast= ReadRoleValue(OwnerID() , EM_RoleValue_Register+2  ) --檢查spellcast是否在撥放中(利用register值來判斷)
	if spellcast==1 then 
		return false
	end
	if spellcast==0 then
		return true
	end
end


function lua_skwerl_mobius_achievements(player, playerscore, gamemode, level) --player=玩家 playerscore=玩家分數，gamemode==遊戲模式(0==生存 1==計時) (level=玩家破的關卡數)
	--	say(player, "playerscore:"..playerscore.."  gamemode:"..gamemode.."  level:" ..level)
		if gamemode==1 then  --計時模式特有稱號
			if playerscore>2500 then       --分數稱號          超越巔峰    --harder                 
				if CountBodyItem(player, 530920)==0 then-- 檢查是否有稱號，沒有才給
					givebodyitem(player, 530920, 1) --超越巔峰 
				end
			end
			if level>=10 then ---計時模式過關稱號  ---速戰速決---easer
				if CountBodyItem(player, 530921)==0 then-- 檢查是否有稱號，沒有才給
					givebodyitem(player, 530921, 1) --速戰速決-
				end
			end	
		end

		if gamemode==0 then ---生存模式
			if playerscore >=1800 then --分數稱號--生存者--harder
				if CountBodyItem(player, 530923)==0 then-- 檢查是否有稱號，沒有才給
					givebodyitem(player, 530923, 1) --生存者
				end
			end
			if level>9 then --全破稱號--魔法守門員--easier
				if CountBodyItem(player, 530922)==0 then-- 檢查是否有稱號，沒有才給
					givebodyitem(player, 530922, 1) --安德爾守門員
				end
			end		
	
		end
end

function lua_skwerl_mobius_levelspeed(monster, level) ---調整關卡目標速度的script
	if level==1 then --第1關速度
		addbuff(monster, 623108, 500, -1) --緩速 
 	end

	if level==2 then--第2關速度
		addbuff(monster, 623108, 440, -1) --緩速 
	end
	
	if level==3  then--第3關速度
		addbuff(monster, 623108, 360, -1) --緩速 
	end
	
	if level==4  then--第4關速度
		addbuff(monster, 623108, 220, -1) --緩速 
	end

	if level==5  then--第5關速度
		addbuff(monster, 623108, 120, -1) --緩速 
	end

	if level==6  then--第6關速度
		addbuff(monster, 623108, 80, -1) --緩速 
	end

	if level==7  then--第 7關速度
		addbuff(monster, 623108, 20, -1) --緩速 
	end

	if level==8  then--第8關速度
		addbuff(monster, 623108, 0, -1) --緩速 
	end

	if level==9  then--第9關速度
		addbuff(monster, 623110, 30, -1) --加速
	end

	if level==10 then--第10關速度
		addbuff(monster, 623110, 60, -1) --加速
	end
	
	if level>10  then--第 關速度
		addbuff(monster, 623110, 30*(level-7), -1) --加速
	end
end


function lua_skwerl_mobius_npcswitch(mode1, mode2)
	SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, mode1) --關頭相框  true==開 false==關
	SetModeEx( OwnerID(), EM_SetModeType_HideName, mode2 )--關掉名稱           true==關 false==開
end

function lua_skwerl_mobius_explosionfx(owner, explosiveid, spell) --owner==執行function的物件，explosiveid==爆破用隱形球ID，spell==爆破法術
	local Obj = Role:new(owner)  -- 取得owner X.Y.Z.Dir值  用來生爆破用隱形物件 explosiveid
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local RoomID = ReadRoleValue( owner , EM_RoleValue_RoomID )
	local explosive 
	explosive= CreateObj(explosiveid, BaseX , BaseY, BaseZ , BaseDir , 1 )--生出爆破用隱形物件 
	SetModeEx( explosive, EM_SetModeType_ShowRoleHead, false) --關頭相框
	SetModeEx( explosive , EM_SetModeType_HideName, true )--關掉名稱
	SetModeEx( explosive , EM_SetModeType_NotShowHPMP , true )	------不show血條
	SetModeEx( explosive , EM_SetModeType_Mark, false )--標記
	AddtoPartition (explosive, RoomID)
	WriteRoleValue(explosive, EM_RoleValue_LiveTime, 3 ) --隱形物件五秒後刪除
	SysCastSpellLv(explosive, explosive, spell, 0 )--爆破法術 

end

--AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem38 , 1 )   --稱號記次

--	local UseItem5 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem38)

--	WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem38 , 50 )   --稱號記次
 --700510 麒均活動副本靶場

--節慶活動安德爾靶場

--\\dev1\Server\Resource
--\\GS2\Runewaker\Resource
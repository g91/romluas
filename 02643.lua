function lua_skwerl_easter_test()

	local player = OwnerID()
	local RoomID = ReadRoleValue(player, EM_RoleValue_RoomID )
	local Obj = Role:new( player )  
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local bunnycontrol = CreateObj( 120326 , BaseX , BaseY , BaseZ , BaseDir , 1 ) --創立兔子中控器
	local RoleName = GetName( OwnerID() ) 
	SetModeEx( bunnycontrol  , EM_SetModeType_Mark, false )--標記
	SetModeEx( bunnycontrol , EM_SetModeType_NotShowHPMP , true)
	AddToPartition( bunnycontrol , RoomID )
	CallPlot(bunnycontrol , "lua_skwerl_easter_bunnycontrol" , player) 
	Cancelbuff(player,  622241)
	Cancelbuff(player, 622249)--砍兔子緩速
	Cancelbuff(player, 622237)-- 砍獵人加速
	Cancelbuff(player, 622229) --砍攻擊機制
--	Cancelbuff(player, 622226)--砍獵人生蛋
	addbuff(player, 622206, 1, 5) --bunny cooldown buff
	addbuff(player, 622233,1,5)  --目標無敵
	addbuff(player, 622183, 1, 5)--無敵效果


	Addbuff(player, 622186, 1, 180) --變身成為兔子
	Addbuff(Player, 622247, 1, 180) --兔子發光
	ScriptMessage(player, player, 2, "[SKWERL_EASTER_01]", C_SYSTEM );
end

function lua_skwerl_easter_test2()
--	Addbuff(OwnerID(), 622226, 1, -1)
	Addbuff(OwnerID(), 622229, 1, -1)
 	Addbuff(OwnerID(), 622259, 1, -1) 
end

function lua_skwerl_easter_iff()
	addbuff(OwnerID(), 622260, 1, 190)
end

function lua_skwerl_easter_test3()
	Lua_Hao_Round_wall( OwnerID() , 120559 , 45 , 200 , 0 ) --建牆
end

function lua_skwerl_easter_backdoor()
	local OID= OwnerID()
	local NPC= Lua_Hao_NPC_Closest_Search( OID , 120549 ,20 )
	local NPC2= Lua_Hao_NPC_Closest_Search( OID , 120584 ,20 )
	say(npc, "test")
	say(npc2, "test") 
	WriteRoleValue(NPC , EM_RoleValue_Register+6, 1 ) 
	WriteRoleValue(NPC2 , EM_RoleValue_Register+2, 1 ) 
 end


function lua_skwerl_easter_backdoor_off()
	local OID= OwnerID()
	local NPC= Lua_Hao_NPC_Closest_Search( OID , 120549 ,20 )
	local NPC2= Lua_Hao_NPC_Closest_Search( OID , 120584 ,20 )
	say(npc, "test off")
	say(npc2, "test off") 
	WriteRoleValue(NPC , EM_RoleValue_
+6, 0 ) 
	WriteRoleValue(NPC2 , EM_RoleValue_Register+2, 0 ) 
 end


function lua_skwerl_easter_backdoor2()
	local OID= OwnerID()
	local NPC= Lua_Hao_NPC_Closest_Search( OID , 120549 ,300 )
	say(npc, "test") 
	WriteRoleValue(NPC , EM_RoleValue_Register+5, 9) 

	local backdoor
	backdoor= ReadRoleValue( npc , EM_RoleValue_Register+5  )
	say(npc, "current"..backdoor) 

end



function lua_skwerl_easter_boxtest()
	local npc= OwnerID()
	local monster
	local random=Rand(6) -- (0, 1, 2, 3, 4, 5)
	local RoomID = ReadRoleValue( npc , EM_RoleValue_RoomID )
	Monster = CreateObjByFlag( 120548, 781114 , random  , 1 )		-- 在旗標生怪(產生物件ID , 產生旗子ID , 旗子位置ID , 產生數量)
	SetModeEx( Monster  , EM_SetModeType_Mark, false )--標記
	AddToPartition( Monster , RoomID )

end


function lua_skwerl_easter_bunnycontrol(player)
--	say(OwnerID(), player)
	for i=1, 1800, 1 do
		if i%10==0 then --每一秒加一次分
			addbuff(player, 622228,0,300)
		end
		--test stat--
		if i%10==0 then --每一秒加一次分
			addbuff(player, 622318,0,300)
		end
		--test stat--

		if i>=1 and i<100 then  ---兔子有速度優勢
			local x= 35-i
			Cancelbuff(player, 622212)
			addbuff(player, 622212, x, 180)
		end
		if i==150 then
			if CountBodyItem(player, 530895)==0 then-- 檢查是否有擊兔子成就，如果沒有，給成就
				givebodyitem(player, 530895, 1)
			end
		end

		if i>200 and i<400 then --兔子變慢
			local y=i-200
			Cancelbuff(player, 622213)
			addbuff(player, 622213, 2*y, 180) --max level at 400
		end

		if checkbuff(player, 622186)==false then
			Cancelbuff(player, 622212) --砍加速buff
			Cancelbuff(player, 622213) --砍減速buff
			sleep(5)
			Cancelbuff(Player, 622193)----砍衝刺buff
			sleep(5)
			Cancelbuff(Player, 622193)--砍衝刺buff
			DelObj(OwnerID())
			break
		end
		SysCastSpellLv(player, player,499267,1) --掃獵人
--		SysCastSpellLv(player, player,499263,1) --掃金蛋 --experimental
		sleep(1)
	end
	DelObj(OwnerID())
end





function lua_skwerl_easter_touch() --兔子腳色交接
	local Owner=OwnerID()
	local Target=TargetID()
	if checkbuff(target, 622232)==true  or checkbuff(target, 622260)==false then	--檢查 倒地玩家不能抓兔子 622260==不是遊戲內玩家
		return false
	else
		local teststat= FN_CountBuffLevel(Owner, 622318)+1
		local name= GetName(Owner )
		ScriptMessage(Owner, Owner, 2, "[SKWERL_EASTER_05]", 0); --你被抓到了!
		ScriptMessage(Owner,0,1, name.."[SKWERL_EASTER_11][$SETVAR1="..teststat.."]", C_SYSTEM) --報兔子生存時間
	--	say(Owner, teststat)
		--for ex-bunny player--(被抓到的兔子)
		cancelbuff(Owner, 622186) 
		AddBuff(Owner, 622206, 1, 5) -- bunny cooldown
		Cancelbuff(Owner, 622212) --砍加速buff
		Cancelbuff(Owner, 622213) --砍減速buff
		CancelBuff(Owner, 622183)--砍衝刺buff
		CancelBuff(Owner, 622193)--砍衝刺開關buff
		Cancelbuff(Owner, 622318) --cancel test stat
	--	Addbuff(Owner, 622226, 1, -1)--獵人生蛋
		Addbuff(Owner, 622229, 1, 180) --攻擊機制
		Cancelbuff(Owner, 622247)--砍兔子發光
		Cancelbuff(Owner, 622249)--砍兔子緩速
		--for new bunny player--(新兔子)
		Cancelbuff(Target, 622241)--砍獵人減速
		Cancelbuff(Target, 622233)--砍獵人無敵
		Cancelbuff(Target, 622237)-- 砍獵人加速
		Cancelbuff(Target, 622229) --砍攻擊機制
	--	Cancelbuff(Target, 622226)--砍獵人生蛋
		addbuff(Target, 622206, 1, 5) --bunny cooldown buff
		addbuff(Target, 622183, 1, 5) --兔子無敵效果
		CallPlot(Target, "lua_skwerl_easter_test" ) 
	--	SysCastSpellLv( Target, Target, 499275,1 ) --讓旁邊人類倒地
	end
end

function lua_skwerl_easter_touchdetect()
	say(targetID(), "target")
	say(ownerID(), "owner")
end


function lua_skwerl_easter_safetyswitch()
	local Caster= OwnerID()
	local target= TargetID()
	if Caster== target then  ---不能打自己
		return false
	end
	
	if checkbuff(Caster, 622206)== true then
		return false
	end
	
	if checkbuff(target, 622206)== true then
		return false
	end

	if checkbuff(target, 622260)==false then --不是遊戲內玩家
		return false
	end
end



----------------------攻擊系統-----
function lua_skwerl_easter_explosion()
local Player = TargetID()
local Mine = OwnerID()
local bufflv= FN_CountBuffLevel(Player, 621916)+1
	
	local Obj_X = ReadRoleValue ( Mine, EM_RoleValue_X)
	local Obj_Y = ReadRoleValue ( Mine, EM_RoleValue_Y)
	local Obj_Z = ReadRoleValue ( Mine, EM_RoleValue_Z)   ---------讀取舊的BOSS本身的座標位置
	
	Sleep (13)

	SysCastSpellLv( Player, Mine, 499275,1 )
	sleep ( 10 )
end


function lua_skwerl_easter_explosionhit()  --如果玩家被擊中  --experiment
	local score
	local target=targetID()
	local Player=OwnerID()
	if  checkbuff (targetID(), 622260)== false then --不是活動玩家
	return false                                                                      --無法攻擊非活動玩家
	end

	if checkbuff(target,622186)==true then
		addbuff(target, 622249, 0, 7)  --bunny slows down when hit
		addbuff(player, 622234,0,180) ----一般命中報分
		addbuff(player, 622235,0,180) ----一般命中報分	


	else 
		SysCastSpellLv(target, Player, 499108, 1 )--得能量像效果
		addbuff(target, 622241,1,5)   --目標緩速
		addbuff(target, 622233,1,6)  --目標無敵
		addbuff(Player, 622237,1, 4) --加速
		addbuff(player, 622234,0,180) ----一般命中報分
		ScriptMessage(player, player, 1, "[SKWERL_EASTER_07]", C_SYSTEM );

	end
end

function lua_skwerl_easter_explosioncheck()
	
	local target=targetID()
	local Player=OwnerID()
	
	if target== Player then --不會被自己的法術炸到
		return false
	end
	
	if checkbuff(target, 622233)==true then --不能鞭屍
		return false
	end
	


end

-----------------------------------------------------------------------------


function lua_skwerl_easter_speedboost() ---兔子加速
local Player = OwnerID()
local bufflv= FN_CountBuffLevel(Player, 622193)+1 
--	if bufflv+1 ==0 then                          --加速用三次歸零
		ScriptMessage(player, player, 2, "[SKWERL_EASTER_04]", C_SYSTEM );
		AddBuff(player, 622183, 1, 7)
		Cancelbuff(Player, 622193)


end

-----------------------------------------------------------------------
--金蛋系統
function lua_skwerl_easter_egglaying()
	local player = OwnerID()
	local RoomID = ReadRoleValue(player, EM_RoleValue_RoomID )
	local Obj = Role:new( player )  
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local random= Rand(10)
	if Random > 6 then
		local egg = CreateObj( 119552 , BaseX , BaseY , BaseZ , BaseDir , 1 ) --創立金蛋
		AddToPartition( egg , RoomID )
		CallPlot(egg , "lua_skwerl_easter_eggdelete") 
	end
end



function lua_skwerl_easter_eggdetection()
	while true do
	local egg= OwnerID()
	local rabbit = SearchRangePlayer( egg , 50 )  --掃範圍內玩家。
	for i=0, table.getn(rabbit), 1 do
		if CheckBuff( rabbit[i] , 622186 ) == true then 
		ScriptMessage(rabbit[i],rabbit[i], 1, "+3", C_SYSTEM );  
		addbuff(rabbit[i], 622228,2,300) --加3分
		Addbuff(rabbit[i], 622250, 1, 1) 
		SysCastSpellLv(egg, rabbit[i], 499108, 0 )--得能量像效果
		AddBuff(rabbit[i], 622237, 1, 3)
		sleep(10)
		Hide(egg)
		DelOBJ(egg)
					
		end
	end	
	sleep(1)
	end
end


function lua_skwerl_easter_eggdelete()--金蛋自我刪除
	sleep(115)
	DelOBJ(OwnerID())
end
-------------------------中控器用-------------------game system code----------------------------------------
function lua_skwerl_easter_controller()

	Local Hour
	Local Min
	local npc= OwnerID()
	local wall
	local backdoor
	--報時系統--
	while true do
	local backdoor
	backdoor= ReadRoleValue( npc , EM_RoleValue_Register+5  ) --後門，強制開始遊戲
	backdoor2= ReadRoleValue( npc , EM_RoleValue_Register+6  ) --後門，強制開始遊戲
		 Hour = GetSystime(1) --取得現在時間：時
		 Min = GetSystime(2) --取得現在時間：分
		if  Hour==21 or Hour==22 or Hour==23 or Hour==0 or backdoor==9 or backdoor==8 or backdoor2==1 then
			if Min==7 or Min== 17 or Min==27 or Min==37 or Min==47 or backdoor==9  or backdoor==8 then
				lua_skwerl_easter_magicformation()  --魔法陣
				
				lua_skwerl_easter_judge()  ---裁判/遊戲執行
				lua_skwerl_objectdelete(120559) ---刪牆
				lua_skwerl_objectdelete(120586) --砍障礙
				lua_skwerl_objectdelete(120587) --砍障礙
				lua_skwerl_objectdelete(119552)--砍紅蘿蔔
			end
		end
--	say (npc, hour..":"..min.." backdoor:"..backdoor)
	WriteRoleValue(npc , EM_RoleValue_Register+5, 0) -- 關後門 
	sleep(10)
	end
end


function lua_skwerl_easter_magicformation() --魔法陣
	local npc= OwnerID()
	local RoomID = ReadRoleValue( npc , EM_RoleValue_RoomID )
	local backdoor= ReadRoleValue( npc , EM_RoleValue_Register+5  ) --後門，強制開始遊戲
	local Obj = Role:new( npc )  -- 取得npc X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local magicformation
	magicformation= CreateObj(120550, BaseX , BaseY , BaseZ , BaseDir , 1 )
	SetModeEx( magicformation  , EM_SetModeType_Mark, false )--標記
	SetModeEx( magicformation , EM_SetModeType_NotShowHPMP , true )
	AddToPartition( magicformation , RoomID )
	SetModeEx( magicformation  , EM_SetModeType_Mark, false )--標記
	if backdoor==0 then
	sleep (1500) ---法陣存活時間
	end
	ScriptMessage(npc,0,1,"[SKWERL_VAL_12]", C_SYSTEM)
	sleep (300)
	delobj(magicformation)

end


function lua_skwerl_easter_judge()
	local npc = OwnerID()
	local backdoor
	backdoor= ReadRoleValue( npc , EM_RoleValue_Register+5  ) --後門，強制開始遊戲
	local activeplayer = SearchRangePlayer( npc , 300 )  --掃範圍內玩家。
	local activeplayer2={}
	for i=0, table.getn(activeplayer), 1 do
		if CheckBuff( activeplayer[i] ,622259 ) == true then 
			table.insert(activeplayer2 , activeplayer[i]);
		end
	end

	if #activeplayer2 < 4 and backdoor~=9 then--人數不到四人

		for i=1, table.getn(activeplayer2), 1 do --宣布人數不足
				ScriptMessage( activeplayer2[i],activeplayer2[i],1, "[SKWERL_EASTER_12]", C_SYSTEM) --宣布人數不足
				ScriptMessage(activeplayer2[i],activeplayer2[i],0, "[SKWERL_EASTER_12]", C_SYSTEM)
				lua_skwerl_easter_cleanup(activeplayer2[i]) 
		end

	else
		lua_Hao_Round_wall( npc , 120559 , 26 , 145 , 0 ) --建牆 l( OwnerID() , 120559 , 45 , 200 , 0 ) 
		lua_skwerl_easter_boxspawn() --生障礙
		lua_skwerl_easter_gamebuff (activeplayer2)   --遊戲開始buff
		sleep(15)
		lua_skwerl_easter_beginteleport(activeplayer2) --傳到起跑點	
		lua_skwerl_easter_monitor (activeplayer2) --遊戲進行回圈

	end
end

function lua_skwerl_easter_gamebuff(playerlist)   ---給遊戲開始buff
	for i=1 , table.getn(playerlist) , 1 do
		cancelbuff(playerlist[i] ,622259)
		--Addbuff(playerlist[i], 622226, 1, 180)
		Addbuff(playerlist[i], 622229, 1, 180)
		Addbuff(playerlist[i], 622260, 1, 190)
	end
end


function lua_skwerl_easter_mountban(tmp) --禁止坐騎

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

end

function lua_skwerl_easter_monitor(activeplayer2)
		local npc= OwnerID()
		local RoomID = ReadRoleValue( npc , EM_RoleValue_RoomID )
		local condition
		local time
		local random

		for time=1, 1800, 1 do
			local tmp = {}
			local rabbitcount=0
			CallPlot(npc , "lua_skwerl_easter_mountban", activeplayer2) 	--擋坐騎
			if (time> 10 or time <1770) and time%40==0 then
				SysCastSpellLv(npc, npc, 499304,1)  --傳走局外玩家
			end
			-----------生蛋--------------------------------
			if time%120==0 then --每10秒加一次蛋
		  		random= Az_RND_Ary(0,5,3) --- 從1~10中取3個
		  		lua_skwerl_easter_balltest(random[1])
		  	end
	
			-------------------廣播--------------------------------
			if time==1 then
				lua_skwerl_easter_broadcast (activeplayer2, "[SKWERL_EASTER_04]")
			end 
		
			if time==1200 then
				lua_skwerl_easter_broadcast (activeplayer2, "[SKWERL_EASTER_02]")
			end 	

			if time==1500 then
				lua_skwerl_easter_broadcast (activeplayer2, "[SKWERL_VAL_19]")
			end 
			
			if time==1800 then
				lua_skwerl_easter_broadcast (activeplayer2, "[SKWERL_VAL_08]")
			end 
		
			------------------------------------------------------------------
			for i=1 , table.getn(activeplayer2) , 1 do  ---越界出局
				local Distance= GetDistance(npc, activeplayer2[i])
	--			say(npc, activeplayer2[i]..distance)	
				if Distance > 165 then
					lua_skwerl_easter_cleanup(activeplayer2[i]) 
					ScriptMessage( activeplayer2[i],activeplayer2[i],1, "[SKWERL_VAL_07]", C_SYSTEM)  --玩家出局
					ScriptMessage( activeplayer2[i],activeplayer2[i],0, "[SKWERL_VAL_07]", C_SYSTEM)
				else
					if distance >150 then
					ScriptMessage(activeplayer2[i],activeplayer2[i],1, "[SKWERL_EASTER_03]", 0)

					end
					if Checkbuff(activeplayer2[i], 622186)== true then --檢查場內兔子
						rabbitcount=rabbitcount+1 
					end
					table.insert( tmp, activeplayer2[i] )
				end
					
			end
			if rabbitcount>0 then   ---如果場上有兔子
				WriteRoleValue(npc , EM_RoleValue_Register+1, 2 ) --場上有兔子
			end
			if rabbitcount==0 then
				condition= ReadRoleValue( npc , EM_RoleValue_Register+1  )
				if condition==0 then --遊戲開始 
					WriteRoleValue(npc , EM_RoleValue_Register+1, 1 ) ---光求生了可是沒人檢
					callplot (npc, "lua_skwerl_easter_boxtest")
				end
									
				if condition==2 then --場上的兔子出局了
					WriteRoleValue(npc , EM_RoleValue_Register+1, 1 ) ---光求生了可是沒人檢
					callplot (npc, "lua_skwerl_easter_boxtest")
				end
			end
		
							
			activeplayer2 = tmp;
			sleep(1)
		end
		
		WriteRoleValue(npc , EM_RoleValue_Register+1, 0 )  --遊戲結束，register重設
		lua_skwerl_easter_balldelete() --刪兔子光球
		sleep(30)
		--成功完成活動計算--
		local finishedcount1= ReadRoleValue( npc , EM_RoleValue_Register+8  )
		local finishedcount2= finishedcount1+table.getn(activeplayer2)
		WriteRoleValue(npc, EM_RoleValue_Register+8, finishedcount2 ) 
	--	say(npc, "finished total:"..finishedcount2.." ")
		DesignLog( npc, 120549 , "successful completion count for easter bunny hunt "..finishedcount2 )

		------
		for i=1 , table.getn(activeplayer2) , 1 do
			lua_skwerl_easter_endgame(activeplayer2[i])
			lua_skwerl_easter_cleanup(activeplayer2[i])
		end
		

end


function lua_skwerl_objectdelete(object)
	local wall
	wall= LuaFunc_SearchNPCbyOrgID(OwnerID() , object, 350 , 1 )   	
	for i=0, table.getn(wall), 1 do
	Delobj(wall[i])
	end
end

function lua_skwerl_easter_endgame(Owner)

	local bufflv= FN_CountBuffLevel(Owner, 622228)+1
	ScriptMessage(Owner,Owner,1, "[SKWERL_VAL_33]"..":"..bufflv.."[SKWERL_VAL_34]", C_SYSTEM) 
	ScriptMessage(Owner,Owner,0, "[SKWERL_VAL_33]"..":"..bufflv.."[SKWERL_VAL_34]", C_SYSTEM)		
--	say(Owner, "game"..bufflv)
		if bufflv >=60 then
	       		  Givebodyitem(Owner, 204218,3)  ---讀分數，給獎勵
		elseif bufflv >= 30 then
			  Givebodyitem(Owner, 204218,2)		
		 else
	        		  Givebodyitem(Owner, 204218,1)	
		end	

	local bufflv3= FN_CountBuffLevel(Owner, 622234)+1  --給擊中多數目標成就
		if bufflv3>15 then
			if CountBodyItem(Owner, 530896 )==0 then-- 檢查是否有擊狙擊手成就，如果沒有，給成就
				givebodyitem(Owner, 530896, 1)
			end
		end
	
--	say(Owner, "total kill"..bufflv3)
	setFlag(Owner, 546257,1)   --給參與過flag 

	local OID =Owner  
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

--give achievement--
end



function lua_skwerl_easter_cleanup(Owner)

	cancelbuff(Owner, 622259)--砍報名buff
	cancelbuff(Owner, 622186) 
	cancelbuff(Owner, 622206) -- bunny cooldown
	Cancelbuff(Owner, 622212) --砍加速buff
	Cancelbuff(Owner, 622213) --砍減速buff
	CancelBuff(Owner, 622183)--砍兔子無敵
	CancelBuff(Owner, 622193)--砍衝刺開關buff
	Cancelbuff(Owner, 622247)--砍兔子發光
	Cancelbuff(Owner, 622249)--砍兔子緩速
	Cancelbuff(Owner, 622318)--砍兔子生存
	Cancelbuff(Owner, 622235)-- 砍獵人分數紀錄(兔子)
	Cancelbuff(Owner, 622234)-- 砍獵人分數紀錄(一般)
	Cancelbuff(Owner, 622237)-- 砍獵人加速
	Cancelbuff(Owner, 622229) --砍攻擊機制
--	Cancelbuff(Owner, 622226)--砍獵人生蛋
	Cancelbuff(Owner, 622260)--砍IFF玩家不參與遊戲了
	Cancelbuff(Owner,622228)--砍分數
	

end

function lua_skwerl_easter_boxspawn()
	local box1
	local box4
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )

	for i=0,20,1 do
		box1 = CreateObjByFlag( 120587 , 781115, i , 1 )		-- 在旗標生矮箱子(產生物件ID , 產生旗子ID , 旗子位置ID , 產生數量)
		SetModeEx( box1 , EM_SetModeType_NotShowHPMP , true )
		SetModeEx( box1 , EM_SetModeType_Obstruct, true )
		SetModeEx( box1  , EM_SetModeType_Mark, false )--標記
		AddToPartition( box1 , RoomID )		
	end
	
	for i=0,20,1 do
		box4 = CreateObjByFlag(  120586  , 781116, i , 1 )		-- 在旗標生 高箱子(產生物件ID , 產生旗子ID , 旗子位置ID , 產生數量)
		SetModeEx(box4 , EM_SetModeType_NotShowHPMP , true )
		SetModeEx( box4 , EM_SetModeType_Obstruct, true )
		SetModeEx( box4  , EM_SetModeType_Mark, false )--標記
		AddToPartition( box4 , RoomID )
	end

end



---------------------------------------------報名系統-----------------------------------------------

function lua_skwerl_easter_npc()  --主辦人
	SetSpeakDetail( OwnerID(), "[SKWERL_EASTER_06]" ) --((Correction:stove introduction))
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SKWERL_VAL_18") , "lua_skwerl_easter_aboutrules", 0) --活動規則
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SKWERL_VAL_27") , "lua_skwerl_easter_abouttime", 0) --活動時間	
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SKWERL_VAL_02") , "Lua_skwerl_easter_registration", 0 ) --參加遊戲
end

function lua_skwerl_easter_aboutrules() --關於規則字串
	SetSpeakDetail( OwnerID(), GetString("SKWERL_EASTER_09") ) 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , " lua_skwerl_easter_npc", 0 ) --回上一頁
end

function lua_skwerl_easter_abouttime() --關於時間字串
	SetSpeakDetail( OwnerID(), GetString("SKWERL_EASTER_10") ) 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , " lua_skwerl_easter_npc", 0 ) --回上一頁
end


function lua_skwerl_easter_teleporter() --春雨傳送師
	SetSpeakDetail( OwnerID(), "[SKWERL_EASTER_08]" ) --((Correction:stove introduction))
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_FIREDAY_2012_EV1_20") , "lua_skwerl_easter_npcteleport", 0) --傳送到活動場地
end

function Lua_skwerl_easter_registration() --Npc報名劇情
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
		if CheckFlag( Player, 546257 ) == true then
		Closespeak(Player);
		ScriptMessage(Player,Player,1, "[SKWERL_VAL_15]", C_SYSTEM) --你今天已經參加過了，請明天再來!
	 	ScriptMessage(Player,Player,0, "[SKWERL_VAL_15]", C_SYSTEM)
			
		elseif check==true then
		Closespeak(Player);
		ScriptMessage(Player,Player,1, "[SKWERL_VAL_22]", C_SYSTEM) --你已經註冊過了
	 	ScriptMessage(Player,Player,0, "[SKWERL_VAL_22]", C_SYSTEM)
	
		elseif Hour==21 or Hour==22 or Hour==23 or Hour==00 or  backdoor==1 then

			if registercount>7 then   ---遊戲最高人數
			Closespeak(Player);
			ScriptMessage(Player,Player,1, "[SKWERL_VAL_24]", C_SYSTEM)--活動已額滿
	 		ScriptMessage(Player,Player,0, "[SKWERL_VAL_24]", C_SYSTEM)
			elseif (Min>=7 and Min<10) or (Min>=17 and Min<20) or (Min >=27 and Min<30) or (Min >=37 and Min<40) or (Min >=47 and Min<50)  then 	
			Closespeak(Player);
			ScriptMessage(Player,Player,1, "[SKWERL_VAL_01]", C_SYSTEM) --註冊成功
			ScriptMessage(Player,Player,0, "[SKWERL_VAL_01]", C_SYSTEM)
			newregistercount=registercount+1
			WriteRoleValue(npc , EM_RoleValue_Register+1, newregistercount ) 
			Addbuff(Player, 622259, 1, 185)--註冊證明 ---give registration buff 
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

function lua_skwerl_easter_timer() ---npc 時間計時
		local npc=TargetID()
		Local Hour
		Local Min
		local ZoneID = ReadRoleValue( npc , EM_RoleValue_RealZoneID )
		while true do
		 Hour = GetSystime(1) --取得現在時間：時
		 Min = GetSystime(2) --取得現在時間：分
			if (hour==21 and Min==0) or (hour==22 and Min==0) or (hour == 23 and Min==0) or (hour == 0 and Min==0)  then
				if ZoneID <= 999 then
					RunningMsgEx( OwnerID() , 2 , 3 , "[SKWERL_EASTER_13]" )   --廣播開始
				sleep(600)
				end
			end
		
			 if Min==0 or Min==10 or Min==20 or Min==30 or  Min==40 or Min ==50 then   

			---玩家統計用--
			local totalplayer1= ReadRoleValue( npc , EM_RoleValue_Register+1  )  
			local totalplayer2= ReadRoleValue( npc , EM_RoleValue_Register+9  )
			local totalplayer3
			totalplayer3= totalplayer1+totalplayer2
			WriteRoleValue(TargetID() , EM_RoleValue_Register+9, totalplayer3)
		--	say(npc, "total player:"..totalplayer3.." ")
			DesignLog( npc, 120584 , "registration count for easter bunny hunt "..totalplayer3 )
			---------------
			
			WriteRoleValue(TargetID() , EM_RoleValue_Register+1, 0) --清空註冊玩家數量
			 end	
		sleep (600)
		end
end



---------------------------------------------------------------------------------------------------------------------------
function lua_skwerl_easter_rabbitballcheck() ----- 兔子光球檢查
	
	local target= targetID()	
	local owner= OwnerID()
	if checkbuff (targetID(), 622260)== false then --不是活動玩家
		return false
	else
		Callplot(target, "lua_skwerl_easter_test")
		delobj(owner)
	end

end

function lua_skwerl_easter_rabbitball() --
	for i= 1, 1800, 1 do
			SysCastSpellLv(OwnerID(), OwnerID(),499281,1)
			sleep(1)
	end
	delobj(OwnerID())
end


function lua_skwerl_easter_balldelete()
	local ball
	ball= LuaFunc_SearchNPCbyOrgID(OwnerID() , 120548, 350 , 1 )   	
	for i=0, table.getn(ball), 1 do
	Delobj(ball[i])
	end
end

function lua_skwerl_easter_broadcast(table1, phrase)
	for  i=1, table.getn(table1), 1 do
		ScriptMessage(table1[i],table1[i],1, phrase, C_SYSTEM) --離遊戲結束還有5秒
		ScriptMessage(table1[i],table1[i],0, phrase, C_SYSTEM)
	end

end

function lua_skwerl_easter_balltest(random)  ---生紅蘿蔔
	local npc= OwnerID()
	local monster
	local RoomID = ReadRoleValue( npc , EM_RoleValue_RoomID )
	Monster = CreateObjByFlag( 119552, 781114 , random  , 1 )		-- 在旗標生怪(產生物件ID , 產生旗子ID , 旗子位置ID , 產生數量)
	SetModeEx( Monster , EM_SetModeType_NotShowHPMP , true )
	SetModeEx( Monster  , EM_SetModeType_Mark, false )--標記
	AddToPartition( Monster , RoomID )
	CallPlot(Monster , "lua_skwerl_easter_eggdelete") 
end


function lua_skwerl_easter_teleportcheck()
	local Player= TargetID()


	if (Checkbuff(player,622260)==false and Checkbuff(player, 622259)== true) then
		ChangeZone(player , 2, 0, 6551.7, 49.5, -2226.6, 148.8)
		ScriptMessage(player,player,1, "[SKWERL_VAL_35]", C_SYSTEM)  --請不要干擾活動。
		ScriptMessage( player,player,0, "[SKWERL_VAL_35]", C_SYSTEM)
	elseif Checkbuff(player,622260)==false then    --沒報名的玩家會傳出場
		ChangeZone(player , 2, 0, 6551.7, 49.5, -2226.6, 148.8)
		ScriptMessage(player,player,1, "[SKWERL_VAL_11]", C_SYSTEM)  --請不要干擾活動。
		ScriptMessage( player,player,0, "[SKWERL_VAL_11]", C_SYSTEM)
	end


end

function lua_skwerl_easter_beginteleport(playerlist) ---以防玩家被卡在箱子內的機制。把玩家傳到起跑點

	Local npc=OwnerID()
	local RoomID = ReadRoleValue( npc , EM_RoleValue_RoomID )
	local Obj = Role:new( npc )  -- 取得npc X.Y.Z.Dir值
	local ZoneID = ReadRoleValue( npc , EM_RoleValue_ZoneID )
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local x= BaseX
	local y= BaseY
	local z= BaseZ
	local  direction= BaseDir
	
	for i=1 , table.getn(playerlist) , 1 do
		ChangeZone(playerlist[i] , ZoneID, RoomID, x, y, z, 74.5)
	end

end


function lua_skwerl_easter_npcteleport()
	ChangeZone(OwnerID() , 2, 0, 6487.7, 49.5, -2239.3, 340.9)
end


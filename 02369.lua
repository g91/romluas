--旗標780932 ： 1 = door2
--              2 = boss
--              3 = door1
--              4 = 陷阱1
--              5 = 陷阱2
--              6 = 陷阱3
--字串  SC_105515
function un_zone20_boss2Ctrl()  --控制器*****
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Ctrl = OwnerID()					--控制器
	local PhaseChange = 60					--切換時間
	local PhaseCount = 1					--模式計時
	local CombatBegin=0						--開戰旗標
	local RoomID=ReadRoleValue(Ctrl,EM_RoleValue_RoomID)
	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local BOSSID = 105515
	local doorchick1
	local doorchick2
	--local catch1	--陷阱1
	--local catch2	--陷阱2
	--local catch3	--陷阱3
	local catchtable1 = {} --陷阱
	local catchtable2 = {105546,105547,105548} --陷阱編號
	local catchtable3 = {"un_zone20_catch1","un_zone20_catch2","un_zone20_catch3"} --戰鬥
	local catchtable3_1 = {"un_zone20_catch1_1","un_zone20_catch2_1","un_zone20_catch3_1"} --簡單戰鬥
	local catchtable4 = {"un_zone20_catch1die","un_zone20_catch2die","un_zone20_catch3die"}--死亡
	local catch1tt =0	--陷阱1重生時間
	local catch2tt =0	--陷阱2重生時間
	local catch3tt =0	--陷阱3重生時間
	local reg5=0
	local reg6=0
	local reg7=0
	if ZoneID == 140 then
		BOSSID = 105880
		catchtable2 = {105881,105882,105883}
	end
	local Boss=CreateObjByFlag(BOSSID,780932,2,1)
	WriteRoleValue(Ctrl,EM_RoleValue_register5,0)
	WriteRoleValue(Ctrl,EM_RoleValue_register6,0)
	WriteRoleValue(Ctrl,EM_RoleValue_register7,0)
	local Sktalk = {"[SC_105515_01]","[SC_105515_02]","[SC_105515_03]"}
	local playcount
	AddToPartition(Boss,RoomID)
	WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
	WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)
	doorchick2 = CreateObjByFlag( 105386 , 780932 , 1 , 1 )
	SetModeEx(doorchick2,EM_SetModeType_Mark, false)
	SetModeEx(doorchick2,EM_SetModeType_HideName, false)
	SetModeEx(doorchick2,EM_SetModeType_NotShowHPMP, false)
	SetModeEx(doorchick2,EM_SetModeType_Strikback, false)
	SetModeEx(doorchick2,EM_SetModeType_Move, false)
	SetModeEx(doorchick2,EM_SetModeType_Fight, false)
	SetModeEx(doorchick2,EM_SetModeType_Searchenemy, false)
	SetModeEx(doorchick2,EM_SetModeType_Obstruct, true)
	AddToPartition( doorchick2, RoomID)
	--SetDefIdleMotion(doorchick1,ruFUSION_MIME_ACTIVATE_LOOP)
	SetDefIdleMotion(doorchick2,ruFUSION_MIME_ACTIVATE_END)
	WriteRoleValue(doorchick2,EM_RoleValue_register1,doorchick2)
	WriteRoleValue(boss,EM_RoleValue_register1,doorchick2)
	SetPlot( boss,"dead","un_zone20_boss2Desd",0 )
	
	while true do
		sleep(10)
		if ReadRoleValue( boss , EM_RoleValue_IsDead)==1 then
			Delobj(doorchick2)
		end
		if hatelistcount(boss)~=0 then
			if CombatBegin==0 then
				CombatBegin=1										--開打了
				BeginPlot(boss , "un_zone20_boss2" , 0)	
				ScriptMessage( Boss, -1 , 2 , Sktalk[1] , 2 )
				--SetDefIdleMotion(doorchick1,ruFUSION_MIME_ACTIVATE_END)
					doorchick1 = CreateObjByFlag( 105386 , 780932 , 3 , 1 )
					SetModeEx(doorchick1,EM_SetModeType_Mark, false)
					SetModeEx(doorchick1,EM_SetModeType_HideName, false)
					SetModeEx(doorchick1,EM_SetModeType_NotShowHPMP, false)
					SetModeEx(doorchick1,EM_SetModeType_Strikback, false)
					SetModeEx(doorchick1,EM_SetModeType_Move, false)
					SetModeEx(doorchick1,EM_SetModeType_Fight, false)
					SetModeEx(doorchick1,EM_SetModeType_Searchenemy, false)
					SetModeEx(doorchick1,EM_SetModeType_Obstruct, true)
					AddToPartition( doorchick1, RoomID)
					---------------------------------------------------------------------------***陷阱
					for i=1 , 3 do
						catchtable1[i] = CreateObjByFlag( catchtable2[i] , 780932 , i+3 , 1 )
						WriteRoleValue(catchtable1[i],EM_RoleValue_register1,Boss)
						WriteRoleValue(catchtable1[i],EM_RoleValue_register2,ctrl)
						PlayMotionEX( catchtable1[i],ruFUSION_ACTORSTATE_COMBAT_UNARMED, ruFUSION_ACTORSTATE_COMBAT_UNARMED)
						SetModeEx( catchtable1[i],EM_SetModeType_Move, false)
						AddToPartition( catchtable1[i], RoomID)
						--addbuff(catchtable1[i],509354,0,-1)
						--Beginplot(catchtable1[i],catchtable3[i],0)
						if ZoneID == 140 then
							Beginplot(catchtable1[i],catchtable3_1[i],0)
							addbuff(catchtable1[i],620575,0,-1)
						else
							Beginplot(catchtable1[i],catchtable3[i],0)
							addbuff(catchtable1[i],509354,0,-1)
						end
						SetPlot( catchtable1[i],"dead",catchtable4[i],0 )
					end
					sleep(10)
					--[[catch1 = CreateObjByFlag( catchtable2[1] , 780932 , 4 , 1 )
					catch2 = CreateObjByFlag( catchtable2[2] , 780932 , 5 , 1 )
					catch3 = CreateObjByFlag( catchtable2[3] , 780932 , 6 , 1 )
					WriteRoleValue(ctrl,EM_RoleValue_register1,catch1)
					WriteRoleValue(ctrl,EM_RoleValue_register2,catch2)
					WriteRoleValue(ctrl,EM_RoleValue_register3,catch3)
					WriteRoleValue(catch1,EM_RoleValue_register1,Boss)--reg1 = boss
					WriteRoleValue(catch2,EM_RoleValue_register1,Boss)
					WriteRoleValue(catch3,EM_RoleValue_register1,Boss)
					WriteRoleValue(catch1,EM_RoleValue_register2,ctrl)--reg2 = ctrl
					WriteRoleValue(catch2,EM_RoleValue_register2,ctrl)
					WriteRoleValue(catch3,EM_RoleValue_register2,ctrl)
					PlayMotionEX( catch1,ruFUSION_ACTORSTATE_COMBAT_UNARMED, ruFUSION_ACTORSTATE_COMBAT_UNARMED)
					PlayMotionEX( catch2,ruFUSION_ACTORSTATE_COMBAT_UNARMED, ruFUSION_ACTORSTATE_COMBAT_UNARMED)
					PlayMotionEX( catch3,ruFUSION_ACTORSTATE_COMBAT_UNARMED, ruFUSION_ACTORSTATE_COMBAT_UNARMED)
					SetModeEx(catch1,EM_SetModeType_Move, false)
					SetModeEx(catch2,EM_SetModeType_Move, false)
					SetModeEx(catch3,EM_SetModeType_Move, false)
					AddToPartition( catch1, RoomID)
					AddToPartition( catch2, RoomID)
					AddToPartition( catch3, RoomID)
					addbuff(catch1,509354,0,-1)
					addbuff(catch2,509354,0,-1)
					addbuff(catch3,509354,0,-1)
					Beginplot(catch1,"un_zone20_catch1",0)
					Beginplot(catch2,"un_zone20_catch2",0)
					Beginplot(catch3,"un_zone20_catch3",0)
					sleep(10)--]]
			elseif CombatBegin == 1 then
					reg5 = ReadRoleValue(ctrl,EM_RoleValue_register5)
					reg6 = ReadRoleValue(ctrl,EM_RoleValue_register6)
					reg7 = ReadRoleValue(ctrl,EM_RoleValue_register7)
					--------------------------------------------------------------***陷阱消失以後重置用
					if reg5 == 1 then
						catch1tt=catch1tt+1
						--say(Boss,"catch1tt = "..catch1tt)
					end
					if reg6 == 1 then
						catch2tt=catch2tt+1
						--say(Boss,"catch1tt2 = "..catch2tt)
					end
					if reg7 == 1 then
						catch3tt=catch3tt+1
						--say(Boss,"catch1tt3 = "..catch3tt)
					end
					--say(catch3,"catch1tt = "..catch1tt)
					if catch1tt >= 8 then
					WriteRoleValue(Ctrl,EM_RoleValue_register5,0)
						catchtable1[1] = CreateObjByFlag( catchtable2[1] , 780932 , 4 , 1 )
						WriteRoleValue(catchtable1[1],EM_RoleValue_register1,Boss)
						WriteRoleValue(catchtable1[1],EM_RoleValue_register2,ctrl)
						SetModeEx(catchtable1[1],EM_SetModeType_Move, false)
						AddToPartition( catchtable1[1], RoomID)
						addbuff(catchtable1[1],509354,0,-1)
						PlayMotionEX( catchtable1[1],ruFUSION_ACTORSTATE_COMBAT_UNARMED, ruFUSION_ACTORSTATE_COMBAT_UNARMED)
						Beginplot(catchtable1[1],"un_zone20_catch1",0)
						SetPlot(catchtable1[1],"dead","un_zone20_catch1die",0 )
						catch1tt = 0
					end
					if catch2tt >= 8 then
					WriteRoleValue(Ctrl,EM_RoleValue_register6,0)
						catchtable1[2] = CreateObjByFlag( catchtable2[2] , 780932 , 5 , 1 )
						WriteRoleValue(catchtable1[2],EM_RoleValue_register1,Boss)
						WriteRoleValue(catchtable1[2],EM_RoleValue_register2,ctrl)
						SetModeEx(catchtable1[2],EM_SetModeType_Move, false)
						AddToPartition( catchtable1[2], RoomID)
						addbuff(catchtable1[2],509354,0,-1)
						PlayMotionEX( catchtable1[2],ruFUSION_ACTORSTATE_COMBAT_UNARMED, ruFUSION_ACTORSTATE_COMBAT_UNARMED)
						Beginplot(catchtable1[2],"un_zone20_catch2",0)
						SetPlot(catchtable1[2],"dead","un_zone20_catch2die",0 )
						catch2tt = 0
					end
					if catch3tt >= 8 then
					WriteRoleValue(Ctrl,EM_RoleValue_register7,0)
						catchtable1[3] = CreateObjByFlag( catchtable2[3] , 780932 , 6 , 1 )
						WriteRoleValue(catchtable1[3],EM_RoleValue_register1,Boss)
						WriteRoleValue(catchtable1[3],EM_RoleValue_register2,ctrl)
						SetModeEx(catchtable1[3],EM_SetModeType_Move, false)
						AddToPartition( catchtable1[3], RoomID)
						addbuff(catchtable1[3],509354,0,-1)
						PlayMotionEX( catchtable1[3],ruFUSION_ACTORSTATE_COMBAT_UNARMED, ruFUSION_ACTORSTATE_COMBAT_UNARMED)
						Beginplot(catchtable1[3],"un_zone20_catch3",0)
						SetPlot(catchtable1[3],"dead","un_zone20_catch3die",0 )
						catch3tt = 0
					end
				--WriteRoleValue(boss,EM_RoleValue_register1,1)		--從模式1開始
			end
		end

		if hatelistcount(boss)==0 and CombatBegin==1 then			--開戰後仇恨表沒人
			if ReadRoleValue( boss , EM_RoleValue_IsDead)==0 then
			playcount = SetSearchAllPlayer(RoomID)
				for i=1 , playcount do
				local NpcGID = GetSearchResult()
					if CheckBuff(NpcGID,509348) ==true then
						cancelbuff(NpcGID,509348)
					end
					if CheckBuff(NpcGID,509350) ==true then
						cancelbuff(NpcGID,509350)
					end
					if CheckBuff(NpcGID,509352) ==true then
						cancelbuff(NpcGID,509352)
					end
					--addbuff(NpcGID,509206,0,-1)
				end
				DelObj(boss)
				SetDefIdleMotion(doorchick1,ruFUSION_MIME_ACTIVATE_BEGIN)
				Delobj(doorchick1)
				Delobj(catchtable1[1])
				Delobj(catchtable1[2])
				Delobj(catchtable1[3])
				catch1tt = 0
				catch2tt = 0
				catch3tt = 0
				ScriptMessage( Boss, -1 , 2 , Sktalk[2] , 2 )
				sleep(50)
				if ZoneID == 139 then
					Boss=CreateObjByFlag(105515,780932,2,1)
				else	
					Boss=CreateObjByFlag(105880,780932,2,1)
				end	
				RoomID=ReadRoleValue(Ctrl,EM_RoleValue_RoomID)
				AddToPartition(Boss,RoomID)                         --重置BOSS
				WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
				WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)
				WriteRoleValue(boss,EM_RoleValue_register1,doorchick2)
				SetPlot( boss,"dead","UN_taigeDead_zone18",0 )
				CombatBegin=0										--重置戰鬥
				PhaseCount=1										--重置計時

			elseif ReadRoleValue( boss , EM_RoleValue_IsDead)==1 then
			playcount = SetSearchAllPlayer(RoomID)
				for i=1 , playcount do
				local NpcGID = GetSearchResult()
					if CheckBuff(NpcGID,509348) ==true then
						cancelbuff(NpcGID,509348)
					end
					if CheckBuff(NpcGID,509350) ==true then
						cancelbuff(NpcGID,509350)
					end
					if CheckBuff(NpcGID,509352) ==true then
						cancelbuff(NpcGID,509352)
					end
					--addbuff(NpcGID,509206,0,-1)
				end			
				ScriptMessage( Boss, -1 , 2 , Sktalk[3] , 2 )
				SetDefIdleMotion(doorchick2,ruFUSION_MIME_ACTIVATE_BEGIN)
				SetDefIdleMotion(doorchick1,ruFUSION_MIME_ACTIVATE_BEGIN)
				sleep(20)
				Delobj(doorchick2)
				Delobj(doorchick1)
				Delobj(catchtable1[1])
				Delobj(catchtable1[2])
				Delobj(catchtable1[3])				
				sleep(50)
				break
			end
		end	
	end
end

function un_zone20_boss2()      --BossAI*****
	local Boss = OwnerID()
	local RoomID=ReadRoleValue(Boss,EM_RoleValue_RoomID)
	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local ctrl = ReadRoleValue(Boss,EM_RoleValue_PID)
	local skilltime = 0
	local skill = {497433,497434,497435}
	local rand
	local target
	while 1 do 
		sleep(10)
		skilltime=skilltime+1
		--say(OWnerID(),"time = "..skilltime)

		if skilltime%21 ==0 then  --丟3符文
			while ReadRoleValue(OWnerID(),EM_RoleValue_SpellMagicID)~=0 do--檢查還有沒有在施法
				sleep(2)
			end
			--say(OWnerID(),"13")
			ScriptMessage( Boss, -1 , 2 ,"[SC_105515_04]", 2 )
			player = DW_HateRemain(0)                          --player = 取得仇恨列表，為一個陣列
			Play_Chose =KS_RegroupArray( player, num )         --打亂陣列列表
			CastSpelllv( OwnerID(), OwnerID(),497583 ,0 )      --做一個表演法術
			while ReadRoleValue(OWnerID(),EM_RoleValue_SpellMagicID)~=0 do--檢查還有沒有在施法
				sleep(2)
			end
			if table.getn(Play_Chose)<4 then                   --判斷如果BOSS仇恨列表<6人
				for i=1 , table.getn(Play_Chose) do            --對仇恨列表內所有人放招
					if ZoneID == 140 then
						sysCastSpelllv(OwnerID(),Play_Chose[i],skill[i],0)
					else
						sysCastSpelllv(OwnerID(),Play_Chose[i],skill[i],9)--系統放傷害招
					--say(Play_Chose[i],i)
					end
				end
			end
			if table.getn(Play_Chose)>=3 then                   --判斷如果BOSS仇恨列表>6人
				for i=1 , 3 do                                  --對仇恨列表內6人放招
					if ZoneID == 140 then
						sysCastSpelllv(OwnerID(),Play_Chose[i],skill[i],0)
					else
						sysCastSpelllv(OwnerID(),Play_Chose[i],skill[i],9)--系統放傷害招
					end
				end
			end
		elseif skilltime%21 ==3 then  --符文啟動
			--say(OWnerID(),"15")
			while ReadRoleValue(OWnerID(),EM_RoleValue_SpellMagicID)~=0 do--檢查還有沒有在施法
				sleep(2)
			end
			if ZoneID == 140 then
				CastSpelllv( OwnerID(), OwnerID(),497440 ,4 )
			else
				CastSpelllv( OwnerID(), OwnerID(),497440 ,29 )
			end
		elseif skilltime %7 ==0 then  --7S普攻技(煙幕+單體)
			--say(OWnerID(),"7")
			rand = DW_rand(2)
			--say(OWnerID(),"rand = "..rand)
			target = ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID)  --當前目標
			if rand ==1 then
				CastSpellLV( OwnerID(), OwnerID(), 497441 ,0 )
			elseif 	rand ==2 then
				CastSpellLV( OwnerID(), target, 497582 ,5 )
			end
		elseif skilltime>=340 then
			if ZoneID == 140 then
			else
				addbuff(OWnerID(),620042,0,-1)
			end
		end
	end
end

function un_zone20_boss2Desd()  --Boss死亡劇情
	
end
function un_zone20_497440()--符文啟動判斷
	local tar = TargetID()
	if checkbuff(tar,509348) == true or checkbuff(tar,509350) == true or checkbuff(tar,509352) == true then
		return true
	else
		return false
	end
end
--------------------------------------------------------------------------------------------**符文裝置攻擊****
function un_zone20_catch1()
	local boss =  ReadRoleValue(OwnerID(),EM_RoleValue_register1)
	local ttime = 0
	local farplayer = {}
	local rand1
	while 1 do
		sleep(10)
		ttime=ttime+1
		if ttime % 5 == 0 then
			farplayer = KS_GetHateList( Boss, 1 )--仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家)
			if table.getn(farplayer)>0 then
				rand1 = DW_Rand(table.getn(farplayer))
				SysCastSpellLv(OwnerID(),farplayer[rand1],497436,4) 
			end	
		end
	end
end
function un_zone20_catch2()
	local boss =  ReadRoleValue(OwnerID(),EM_RoleValue_register1)
	local ttime = 0
	local farplayer = {}
	local rand1
	while 1 do
		sleep(10)
		ttime=ttime+1
		if ttime % 5 == 0 then
			farplayer = KS_GetHateList( Boss, 1 )--仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家)
			if table.getn(farplayer)>0 then
				rand1 = DW_Rand(table.getn(farplayer))
				SysCastSpellLv(OwnerID(),farplayer[rand1],497437,4) 
			end	
		end
	end
end
function un_zone20_catch3()
	local boss =  ReadRoleValue(OwnerID(),EM_RoleValue_register1)
	local ttime = 0
	local farplayer = {}
	local rand1
	while 1 do
		sleep(10)
		ttime=ttime+1
		if ttime % 5 == 0 then
			farplayer = KS_GetHateList( Boss, 1 )--仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家)
			if table.getn(farplayer)>0 then
				rand1 = DW_Rand(table.getn(farplayer))
				SysCastSpellLv(OwnerID(),farplayer[rand1],497438,4)
			end	
		end
	end
end
function un_zone20_catch1_1()
	local boss =  ReadRoleValue(OwnerID(),EM_RoleValue_register1)
	local ttime = 0
	local farplayer = {}
	local rand1
	while 1 do
		sleep(10)
		ttime=ttime+1
		if ttime % 5 == 0 then
			farplayer = KS_GetHateList( Boss, 1 )--仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家)
			if table.getn(farplayer)>0 then
				rand1 = DW_Rand(table.getn(farplayer))
				SysCastSpellLv(OwnerID(),farplayer[rand1],497436,0) 
			end	
		end
	end
end
function un_zone20_catch2_1()
	local boss =  ReadRoleValue(OwnerID(),EM_RoleValue_register1)
	local ttime = 0
	local farplayer = {}
	local rand1
	while 1 do
		sleep(10)
		ttime=ttime+1
		if ttime % 5 == 0 then
			farplayer = KS_GetHateList( Boss, 1 )--仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家)
			if table.getn(farplayer)>0 then
				rand1 = DW_Rand(table.getn(farplayer))
				SysCastSpellLv(OwnerID(),farplayer[rand1],497437,0) 
			end	
		end
	end
end
function un_zone20_catch3_1()
	local boss =  ReadRoleValue(OwnerID(),EM_RoleValue_register1)
	local ttime = 0
	local farplayer = {}
	local rand1
	while 1 do
		sleep(10)
		ttime=ttime+1
		if ttime % 5 == 0 then
			farplayer = KS_GetHateList( Boss, 1 )--仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家)
			if table.getn(farplayer)>0 then
				rand1 = DW_Rand(table.getn(farplayer))
				SysCastSpellLv(OwnerID(),farplayer[rand1],497438,0)
			end	
		end
	end
end
function un_zone20_catch1die()
	local ctrl = ReadRoleValue(OwnerID(),EM_RoleValue_register2)
	--say(ctrl,"1")
	WriteRoleValue(Ctrl,EM_RoleValue_register5,1)
end
function un_zone20_catch2die()
	local ctrl = ReadRoleValue(OwnerID(),EM_RoleValue_register2)
	--say(ctrl,"1")
	WriteRoleValue(Ctrl,EM_RoleValue_register6,1)
end
function un_zone20_catch3die()
	local ctrl = ReadRoleValue(OwnerID(),EM_RoleValue_register2)
	--say(ctrl,"1")
	WriteRoleValue(Ctrl,EM_RoleValue_register7,1)
end
--------------------------------------------------------------------------------------------**符文裝置攻擊****
--------------------------------------------------------------------------------------------**符文Buff判斷
function un_zone20_497442_1()  --霜凍符文判斷
	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local tar = TargetID()
	local own = OwnerID()
	if checkbuff(tar,509350) == true and checkbuff(tar,509352) == true then
		SysCastSpellLv(own,own,497584,0)
		ScriptMessage( own, -1 , 2 ,"[SC_105515_05]", "0xff6fb7ff" )
	end
	if checkbuff(tar,509358) == true then
		CancelBuff( tar, 509358 )
		CancelBuff( own,509348)
	elseif 	checkbuff(tar,509356) == true then
		if ZoneID == 140 then
			SysCastSpellLv(own,own,497442,4)
		else
			SysCastSpellLv(own,own,497442,24)
		end
		--CancelBuff( own,509356)
	elseif 	checkbuff(tar,509357) == true then
		if ZoneID == 140 then
			SysCastSpellLv(own,own,497442,4)
		else
			SysCastSpellLv(own,own,497442,24)
		end
		--CancelBuff( own,509357)
	end
end
function un_zone20_497442_2()  --熔解符文
	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local tar = TargetID()
	local own = OwnerID()
	if checkbuff(tar,509348) == true and checkbuff(tar,509352) == true then
		SysCastSpellLv(own,own,497584,0)
		ScriptMessage( own, -1 , 2 ,"[SC_105515_05]", "0xff6fb7ff" )
	end
	if checkbuff(tar,509357) == true then
		CancelBuff( tar, 509357 )
		CancelBuff( own,509350)
	elseif 	checkbuff(tar,509356) == true then
		if ZoneID == 140 then
			SysCastSpellLv(own,own,497442,4)
		else
			SysCastSpellLv(own,own,497442,24)
		end
		--CancelBuff( own,509356)
	elseif 	checkbuff(tar,509358) == true then
		if ZoneID == 140 then
			SysCastSpellLv(own,own,497442,4)
		else
			SysCastSpellLv(own,own,497442,24)
		end
		--CancelBuff( own,509358)
	end
end
function un_zone20_497442_3()  --衰竭符文
	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local tar = TargetID()
	local own = OwnerID()
	if checkbuff(tar,509348) == true and checkbuff(tar,509350) == true then
		SysCastSpellLv(own,own,497584,0)
		ScriptMessage( own, -1 , 2 ,"[SC_105515_05]", "0xff6fb7ff" )
	end
	if checkbuff(tar,509356) == true then
		CancelBuff( tar, 509356 )
		CancelBuff( own,509352)
	elseif 	checkbuff(tar,509358) == true then
		if ZoneID == 140 then
			SysCastSpellLv(own,own,497442,4)
		else
			SysCastSpellLv(own,own,497442,24)
		end
		--CancelBuff( own,509358)
	elseif 	checkbuff(tar,509357) == true then
		if ZoneID == 140 then
			SysCastSpellLv(own,own,497442,4)
		else
			SysCastSpellLv(own,own,497442,24)
		end
		--CancelBuff( own,509357)
	end
end
function un_zone20_105546()--溶解死亡
	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	if ZoneID == 140 then
		addbuff(TargetID(),509356,0,20)
	else
		addbuff(TargetID(),509356,9,20)
	end
	NPCDead( OwnerID() ,OwnerID() ) 
	delobj(OwnerID())
end
function un_zone20_105547()--棟霜死亡
	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	if ZoneID == 140 then
		addbuff(TargetID(),509357,0,20)
	else
		addbuff(TargetID(),509357,9,20)
	end
	NPCDead( OwnerID() ,OwnerID() ) 
	delobj(OwnerID())
end
function un_zone20_105548()--衰竭死亡
	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	if ZoneID == 140 then
		addbuff(TargetID(),509358,0,20)
	else
		addbuff(TargetID(),509358,9,20)
	end
	NPCDead( OwnerID() ,OwnerID() ) 
	delobj(OwnerID())
end
--------------------------------------------------------------------------------------------**符文Buff判斷
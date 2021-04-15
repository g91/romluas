function Lua_Az133_104142_Ctrl()							--Raid金旺
	local Ctrl=OwnerID()									--控制器
	local CombatBegin=0										--開戰旗標
	local SoulCount=0
	local RoomID=ReadRoleValue(Ctrl,EM_RoleValue_RoomID)
	local Boss=CreateObjByFlag(104142,780701,0,1)			--王
	local Obj1=CreateObjByFlag(104344,780701,1,1)			--獅子
	local Obj2=CreateObjByFlag(104344,780701,2,1)			--猩猩
	local Obj3=CreateObjByFlag(104344,780701,3,1)			--羚羊
	local door1=CreateObjByFlag(104197,780701,4,1)			--前門
	local door2=CreateObjByFlag(104196,780701,5,1)			--後門
	local BuffCount=12										--計數器
--	local gameover=500
	local BossHpMax=ReadRoleValue(Boss,EM_RoleValue_MaxHP)	--最大HP
	AddToPartition(Boss,RoomID)
	SetModeEx(obj1,EM_SetModeType_Gravity,false) 					
	SetModeEx(obj1,EM_SetModeType_Move,false)
	SetModeEx(obj1,EM_SetModeType_Fight,false)
	SetModeEx(obj1,EM_SetModeType_Searchenemy,false)
	SetModeEx(obj1,EM_SetModeType_Strikback,false)
	SetModeEx(obj1,EM_SetModeType_Mark ,false)
	SetModeEx(obj2,EM_SetModeType_Gravity,false) 					
	SetModeEx(obj2,EM_SetModeType_Move,false)
	SetModeEx(obj2,EM_SetModeType_Fight,false)
	SetModeEx(obj2,EM_SetModeType_Searchenemy,false)
	SetModeEx(obj2,EM_SetModeType_Strikback,false)
	SetModeEx(obj2,EM_SetModeType_Mark ,false)
	SetModeEx(obj3,EM_SetModeType_Gravity,false) 					
	SetModeEx(obj3,EM_SetModeType_Move,false)
	SetModeEx(obj3,EM_SetModeType_Fight,false)
	SetModeEx(obj3,EM_SetModeType_Searchenemy,false)
	SetModeEx(obj3,EM_SetModeType_Strikback,false)
	SetModeEx(obj3,EM_SetModeType_Mark ,false)
	SetModeEx(door2,EM_SetModeType_Mark, false)
	SetModeEx(door2,EM_SetModeType_HideName, false)
	SetModeEx(door2,EM_SetModeType_NotShowHPMP, false)
	SetModeEx(door2,EM_SetModeType_Strikback, false)
	SetModeEx(door2,EM_SetModeType_Move, false)
	SetModeEx(door2,EM_SetModeType_Fight, false)
	SetModeEx(door2,EM_SetModeType_Searchenemy, false)
	SetModeEx(door2,EM_SetModeType_Obstruct, true)
	AddToPartition(Obj1,RoomID)
	AddToPartition(Obj2,RoomID)
	AddToPartition(Obj3,RoomID)
	AddToPartition(door2,RoomID)
	WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
	WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)
	WriteRoleValue(Boss,EM_RoleValue_register2,BossHpMax)	--暫存器2暫存HP判斷是否清BUFF用，初始值=最大HP
	WriteRoleValue(Boss,EM_RoleValue_register3,1)			--暫存器3暫存上次所施放的BUFF編號
	WriteRoleValue(Boss,EM_RoleValue_register4,1)
	WriteRoleValue(Boss,EM_RoleValue_register5,door2)
	SetPlot(Boss,"dead","Lua_Az133_104142_dead",0)
	local BuffID={507255,507254,507256}						--獅子猩猩羚羊
	local ObjID={Obj2,Obj3,Obj1}							--獅子猩猩羚羊
	local BossHpOld
	local LowHP
	local BuffNum
	local HpDiff
	local pos
	local BuffLv
	local BossHpNow
	local phase
	while true do
		sleep(10)
		local BossTarget=ReadRoleValue(Boss,EM_RoleValue_AttackTargetID)	
		if hatelistcount(boss)~=0 then
			if Combatbegin==0 then
				CombatBegin=1									--開戰
				phase=1
				SoulCount=0
				WriteRoleValue(Boss,EM_RoleValue_register1,1)
				BeginPlot(Boss,"Lua_Az133_104142",0)
				door1=CreateObjByFlag(104197,780701,4,1)
				SetModeEx(door1,EM_SetModeType_Mark, false)
				SetModeEx(door1,EM_SetModeType_HideName, false)
				SetModeEx(door1,EM_SetModeType_NotShowHPMP, false)
				SetModeEx(door1,EM_SetModeType_Strikback, false)
				SetModeEx(door1,EM_SetModeType_Move, false)
				SetModeEx(door1,EM_SetModeType_Fight, false)
				SetModeEx(door1,EM_SetModeType_Searchenemy, false)
				SetModeEx(door1,EM_SetModeType_Obstruct, true)
				AddToPartition(door1,RoomID)
				ScriptMessage(boss,-1,2,"[SC_104142_01]",2)		--受死吧人類!
			elseif CombatBegin==1 then
				BuffCount=BuffCount+1
				--say(Ctrl,"BuffCount="..BuffCount)
				BossHpNow=ReadRoleValue(Boss,EM_RoleValue_HP)
				LowHP=BossHpNow/BossHpMax						--HP百分比
				if phase==1 then								--HP小於40%進P2
					if LowHp<=0.4 then
						phase=2
						WriteRoleValue(Boss,EM_roleValue_register1,2)
						ScriptMessage(boss,-1,2,"[SC_104142_11]",2)	--吼嗄～我生氣了
					end
				end
				if BuffCount%31==0 then
					if ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)~=0 then
						BuffCount=BuffCount-1
					else
--					AddBuff
--					local NewBoss=Lua_DW_CreateObj("obj",104142,boss,0,1)
--					local HpNow=ReadRoleValu(Boss,EM_RoleValue_HP)
--					WriteRoleValue(NewBoss,EM_RoleValue_HP,HpNow)
					BossHpOld=ReadRoleValue(Boss,EM_RoleValue_register2)			--讀入前次施放HP
					BossHpNow=ReadRoleValue(Boss,EM_RoleValue_HP)
					BuffNum=ReadRoleValue(Boss,EM_RoleValue_register3)				--讀入前次施放BUFF
					--say(boss,"OldBuff="..BuffNum)
					--say(boss,"OldHp="..BossHpOld)
					--say(boss,"NowHp="..BossHpNow)
					HpDiff=BossHpOld-BossHpNow										--HP差
					pos=Lua_BuffPosSearch(Boss,BuffID[BuffNum])						--BUFF位置
					BuffLv=BuffInfo(Boss,pos,EM_BuffInfoType_Power)	
					if HpDiff/BossHpMax>=0.05 then									--打掉了5%血
						if CheckBuff(Boss,BuffID[BuffNum]) then						--身上有這BUFF
							CancelBuff(Boss,BuffID[BuffNum])						--清掉
							ScriptMessage(boss,-1,2,"[SC_104142_06]",2)				--耶!清光光
							if BuffLv>0	then 										--若BUFF大於1級
								BuffLv=BuffLv-1
								AddBuff(Boss,BuffID[BuffNum],BuffLv,-1)				--減1級加回去
							end
						end
					elseif BuffID[BuffNum]==507256 then
						if CheckBuff(Boss,507256) then
							table.remove(BuffID,3)
						end
					end
					WriteRoleValue(Boss,EM_RoleValue_register4,0)
					sleep(30)
					SoulCount=SoulCount+1
					--say(Boss,"SoulCount="..SoulCount)
					if SoulCount==2 then
						BuffNum=1
					elseif SoulCount==4 then
						BuffNum=2
					elseif SoulCount==6 then
						if table.getn(BuffID)~=3 then
							BuffNum=DW_Rand(table.getn(BuffID))
						else
							BuffNum=3
						end
					else
						BuffNum=DW_Rand(table.getn(BuffID))											--Rand一個新的BUFF		
					end	
					--Say(ObjID[BuffNum],"ME")

						--say(boss,"NewBuff="..BuffNum)
						SysCastSpellLv(ObjID[BuffNum],Boss,495972,1)					--雕像表演對BOSS上法術
						--say(objid[buffnum],"me")
--						PlayMotion(boss, ruFUSION_ACTORSTATE_BUFF_BEGIN)
						
						WriteRoleValue(Boss,EM_RoleValue_register2,BossHpNow)			--記錄現在HP
						WriteRoleValue(Boss,EM_RoleValue_register3,BuffNum)				--記錄上什麼BUFF
						sleep(10)
						--say(boss,"stop5")
						if CheckBuff(Boss,BuffID[BuffNum]) then							--身上有BUFF時
							pos=Lua_BuffPosSearch(Boss,BuffID[BuffNum])
							BuffLv=BuffInfo(Boss,pos,EM_BuffInfoType_Power)
							BuffLv=BuffLv+1
							CancelBuff(Boss,BuffID[BuffNum])
							AddBuff(Boss,BuffID[BuffNum],BuffLv,-1)
						else
							if BuffID[BuffNum]==507256 then
								ScriptMessage(boss,-1,2,"[SC_104142_03]",2)
							end
							AddBuff(Boss,BuffID[BuffNum],0,-1)
						end
					end
				end
			end
		elseif hatelistcount(boss)==0 then
			if Combatbegin==1 then
				if ReadRoleValue( boss , EM_RoleValue_IsDead)==0 then
					ScriptMessage(boss,-1,2,"[SC_104142_08]",2)		--嫩!死光光
					DelObj(Boss)
					DelObj(Obj1)
					DelObj(Obj2)
					DelObj(Obj3)
					DelObj(door1)
					sleep(50)
					Boss=CreateObjByFlag(104142,780701,0,1)			--王
					Obj1=CreateObjByFlag(104344,780701,1,1)			--獅子
					Obj2=CreateObjByFlag(104344,780701,2,1)			--猩猩
					Obj3=CreateObjByFlag(104344,780701,3,1)			--羚羊
					SetModeEx(obj1,EM_SetModeType_Gravity,false) 					
					SetModeEx(obj1,EM_SetModeType_Move,false)
					SetModeEx(obj1,EM_SetModeType_Fight,false)
					SetModeEx(obj1,EM_SetModeType_Searchenemy,false)
					SetModeEx(obj1,EM_SetModeType_Strikback,false)
					SetModeEx(obj1,EM_SetModeType_Mark ,false)
					SetModeEx(obj2,EM_SetModeType_Gravity,false) 					
					SetModeEx(obj2,EM_SetModeType_Move,false)
					SetModeEx(obj2,EM_SetModeType_Fight,false)
					SetModeEx(obj2,EM_SetModeType_Searchenemy,false)
					SetModeEx(obj2,EM_SetModeType_Strikback,false)
					SetModeEx(obj2,EM_SetModeType_Mark ,false)
					SetModeEx(obj3,EM_SetModeType_Gravity,false) 					
					SetModeEx(obj3,EM_SetModeType_Move,false)
					SetModeEx(obj3,EM_SetModeType_Fight,false)
					SetModeEx(obj3,EM_SetModeType_Searchenemy,false)
					SetModeEx(obj3,EM_SetModeType_Strikback,false)
					SetModeEx(obj3,EM_SetModeType_Mark ,false)
					AddToPartition(Boss,RoomID)
					AddToPartition(Obj1,RoomID)
					AddToPartition(Obj2,RoomID)
					AddToPartition(Obj3,RoomID)
					WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
					WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)
					WriteRoleValue(Boss,EM_RoleValue_register4,1)
					WriteRoleValue(Boss,EM_RoleValue_register5,door2)
					SetPlot(Boss,"dead","Lua_Az133_104142_dead",0)
					CombatBegin=0
					BuffCount=12
					SoulCount=0
				elseif ReadRoleValue( boss , EM_RoleValue_IsDead)==1 then
--					ScriptMessage(boss,-1,2,"[SC_104142_09]",2)		--放飯了!大家來領便當
					DelObj(Obj1)
					DelObj(Obj2)
					DelObj(Obj3)
					DelObj(door1)
					break
				end
			end
		end	
	end
end

function Lua_Az133_104142()
	local boss=OwnerID()
	local RoomID=ReadRoleValue(boss,EM_RoleValue_RoomID)
	local SkSel={}
	local SkCd={}
	local SkLv={}
	local SkTgt={}
	local SkStr={}
	local SkNum											--table內技能數量
	local RND
	local SkCount=0
	local BrCount=0
	while true do
		sleep(10)
		local target=ReadRoleValue(boss,EM_RoleValue_AttackTargetID)
		local PickOne=Lua_RandomPlayerFromHateList(Boss,1)
		SkSel={}
		SkCd={}
		SkLv={}
		SkTgt={}
		SkStr={}
--		if CheckBuff(boss,507256)==true then			--獅子
--			table.insert(SkSel,495471)
--			table.insert(SkSel,495471)
--			table.insert(SkCd,0)
--			table.insert(SkCd,0)
--			table.insert(SkLv,14)
--			table.insert(SkLv,14)
--			table.insert(SkTgt,boss)
--			table.insert(SkTgt,boss)
--			table.insert(SkStr,"[SC_104142_03]")
--			table.insert(SkStr,"[SC_104142_03]")
--		end
		if CheckBuff(boss,507255)==true then		--猩猩
			table.insert(SkSel,496011)
			table.insert(SkSel,496011)
			table.insert(SkCd,20)
			table.insert(SkCd,20)
			table.insert(SkLv,0)
			table.insert(SkLv,0)
			table.insert(SkTgt,target)
			table.insert(SkTgt,boss)
			table.insert(SkStr,"[SC_104142_04]")
			table.insert(SkStr,"[SC_104142_10]")
		end
		if CheckBuff(boss,507254)==true then		--蹬羚
			table.insert(SkSel,495700)
			table.insert(SkSel,495700)
			table.insert(SkCd,10)
			table.insert(SkCd,10)
			table.insert(SkLv,0)
			table.insert(SkLv,0)
			table.insert(SkTgt,PickOne[1])
			table.insert(SkTgt,PickOne[1])
			table.insert(SkStr,"[SC_104142_05]")
			table.insert(SkStr,"[SC_104142_05]")
		end
			table.insert(SkSel,495970)					--固定
			table.insert(SkCd,10)
			table.insert(SkLv,6)	
			table.insert(SkTgt,boss)
			table.insert(SkStr,"[SC_104142_15]")
		SkNum=table.getn(SkSel)
		local mode=ReadRoleValue(Boss,EM_RoleValue_register1)
--		if ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)~=0 then
--			sleep(5)
--			say(boss,"sleep")
--		else
		SkCount=SkCount+1
		BrCount=BrCount+1
		--Say(boss,"SkCount"..SkCount)
--		end
		if mode==1 then
			if ReadRoleValue(Boss,EM_RoleValue_register4)==0 then
				CastSpellLv(Boss,Boss,495873,0)
				ScriptMessage(boss,-1,2,"[SC_104142_02]",2)						--我吸我吸
				sleep(20)
				SysCastSpellLv(Boss,Boss,495874,0)
				sleep(50)
				BrCount=BrCount+5
				WriteRoleValue(Boss,EM_RoleValue_register4,1)
			elseif ReadRoleValue(Boss,EM_RoleValue_register4)==1 then
				if BrCount==500 then 
--					AddBuff(boss,507364,0,-1)
--					ScriptMessage(boss,-1,2,"[SC_104142_12]",2)
				elseif SkCount%17==0 then
					if ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)~=0 then 
							SkCount=SkCount-1
					else
						local NoWayRun=Lua_RandomPlayerFromHateList(boss,-1)
						local EveryOne=table.getn(NoWayRun)
						local SoulBall={}
						--say(boss,"EveryOne="..EveryOne)
						for i=1,EveryOne,1 do
							--say(boss,"11111")
							SoulBall[i]=Lua_DW_CreateObj("obj",104344,NoWayRun[i],0,1)
							SetModeEx(SoulBall[i],EM_SetModeType_Move,false)
							SetModeEx(SoulBall[i],EM_SetModeType_Fight,false)
							SetModeEx(SoulBall[i],EM_SetModeType_Searchenemy,false)
							SetModeEx(SoulBall[i],EM_SetModeType_Strikback,false)
							SetModeEx(SoulBall[i],EM_SetModeType_Mark ,false)
							SetModeEx(SoulBall[i],EM_SetModeType_ShowRoleHead,false)
							AddToPartition(SoulBall[i],RoomID)
							WriteRoleValue(SoulBall[i],EM_RoleValue_LiveTime,1)
							SysCastSpellLv(SoulBall[i],boss,495972,5)
							SysCastSpellLv(boss,NoWayRun[i],496089,11)
						end
						CastSpellLv(boss,boss,496090,0)
						ScriptMessage(boss,-1,2,"[SC_104142_14]",2)
						sleep(10)
						BrCount=BrCount+1
					end
				elseif SkCount%7==0 then
					RND=DW_Rand(SkNum)
					if SkSel[RND]==496011 then
						if ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)~=0 then 
							SkCount=SkCount-1
						else
							CastSpellLv(boss,boss,495471,4)
							ScriptMessage(boss,-1,2,"[SC_104142_10]",2)
							for x=1,7 do
								if ReadRoleValue(Boss,EM_RoleValue_register4)==0 then
									CastSpellLv(Boss,Boss,495873,0)
									say(OwnerID(),"break")
									break
								elseif ReadRoleValue(Boss,EM_RoleValue_register4)==1 and x<7 then
									sleep(10)
									say(OwnerID(),"X="..X)
								elseif ReadRoleValue(Boss,EM_RoleValue_register4)==1 and x==7 then
									CastSpellLv(boss,target,496011,0)
									ScriptMessage(boss,-1,2,"[SC_104142_04]",2)
									sleep(20)
									say(OwnerID(),"yes")
									SkCount=SkCount+8
								end
							end
							SkCount=SkCount+6
							BrCount=BrCount+9
						end
					elseif SkSel[RND]==495700 then
						if ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)~=0 then
							SkCount=SkCount-1
						else
							CastSpellLv(boss,PickOne[1],495700,0)
							ScriptMessage(boss,-1,2,"[SC_104142_05]",2)
						end
					elseif SkSel[RND]==495970 then
						if ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)~=0 then
							SkCount=SkCount-1
						else
							CastSpellLv(boss,boss,495970,6)
							sleep(10)
						end
					end
				end
			end
		elseif mode==2 then
			if ReadRoleValue(Boss,EM_RoleValue_register4)==0 then
				sleep(50)
				BrCount=BrCount+5
				WriteRoleValue(Boss,EM_RoleValue_register4,1)
			elseif ReadRoleValue(Boss,EM_RoleValue_register4)==1 then
				if BrCount==480 then 
--					AddBuff(boss,507364,0,-1)
--					ScriptMessage(boss,-1,2,"[SC_104142_12]",2)
				elseif SkCount%19==0 then 
					if ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)~=0 then
						SkCount=SkCount-1
					else
						CastSpellLv(boss,boss,495468,1)
						ScriptMessage(boss,-1,2,"[SC_104142_07]",2)
						sleep(20)
						BrCount=BrCount+2
					end
				elseif SkCount%7==0 then
					RND=DW_Rand(SkNum)
					if SkSel[RND]==496011 then
						if ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)~=0 then 
							SkCount=SkCount-1
						else
							CastSpellLv(boss,boss,495471,7)
							ScriptMessage(boss,-1,2,"[SC_104142_10]",2)
							for x=1,7 do
								if ReadRoleValue(Boss,EM_RoleValue_register4)==0 then
									CastSpellLv(Boss,Boss,495873,0)
									say(OwnerID(),"break")
									break
								elseif ReadRoleValue(Boss,EM_RoleValue_register4)==1 and x<7 then
									sleep(10)
									say(OwnerID(),"X="..X)
								elseif ReadRoleValue(Boss,EM_RoleValue_register4)==1 and x==7 then
									CastSpellLv(boss,target,496011,0)
									ScriptMessage(boss,-1,2,"[SC_104142_04]",2)
									sleep(20)
									say(OwnerID(),"yes")
									SkCount=SkCount+8
								end
							end
							SkCount=SkCount+7
							BrCount=BrCount+9
						end
					elseif SkSel[RND]==495700 then
						if ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)~=0 then
							SkCount=SkCount-1
						else
							CastSpellLv(boss,PickOne[1],495700,0)
							ScriptMessage(boss,-1,2,"[SC_104142_05]",2)
						end
					elseif SkSel[RND]==495970 then
						if ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)~=0 then
							SkCount=SkCount-1
						else
							CastSpellLv(boss,boss,495970,6)
							sleep(10)
						end
					end
				end
			end
		end
	end
end

function Lua_Az_pplcheck_133()
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	--say(TargetID( ),"X"..x)
	local cab=Lua_DW_CreateObj("obj",104344,TargetID(),0)
	SetModeEx(cab,EM_SetModeType_Mark,false) ----標記
	SetModeEx(cab,EM_SetModeType_Strikback,false) ---反擊
	SetModeEx(cab,EM_SetModeType_Move,false) ---移動	
	SetModeEx(cab,EM_SetModeType_Fight,false) ---可砍殺
	SetModeEx(cab,EM_SetModeType_SearchenemyIgnore,false) ---物件不會被搜尋
	SetModeEx(cab,EM_SetModeType_HideName,false)  ---物件頭上是否顯示名稱
	SetModeEx(cab,EM_SetModeType_HideMinimap,false)  ---物件是否在小地圖上顯示
	SetModeEx(cab,EM_SetModeType_Searchenemy,false)  ---鎖敵
	AddToPartition(cab,RoomID )
	local PPL=SearchRangePlayer(TargetID(),50)	
	local x=table.getn(PPL)-----取出來的是數量
	WriteRoleValue(cab,EM_RoleValue_Livetime,3)
	if x>=6 then 
		CastSpellLV(cab,cab,495470,74)
	elseif x==5 then 
		CastSpellLV(cab,cab,495470,89)
	elseif x==4 then 
		CastSpellLV(cab,cab,495470,112)
	elseif x==3 then
		CastSpellLV(cab,cab,495470,149)
	elseif x==2 then
		CastSpellLV(cab,cab,495470,224)
	elseif x==1 then	
		CastSpellLV(cab,cab,495470,449)
	end
end

function Lua_Az133_Enter()
	SetPlot(OwnerID(),"range","Lua_Az133_Tele",50)
end

function Lua_Az133_Back()
	SetPlot(OwnerID(),"range","Lua_Az133_TeleBack",30)
end

function Lua_Az133_Tele()
	RID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	ZID=ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID)
	ChangeZone(OwnerID(),ZID,RID,-1200,200,1000,270)
	ScriptMessage(TargetID(),OwnerID(),2,"[SC_104142_13]",2)
end

function Lua_Az133_TeleBack()
	RID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	ZID=ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID)
	ChangeZone(OwnerID(),ZID,RID,-1200,200,400,90)
	--ScriptMessage(TargetID(),OwnerID(),2,"[SC_104142_13]",2)
end

function Lua_Az133_Soul()
	beginplot(TargetID(),"Lua_Az133_SoulDrain",0)
end

function Lua_Az133_SoulDrain()
	while true do
		sleep(10)
		if CheckBuff(OwnerID(),507476)==false then
			break
		end
		if ReadRoleValue(OwnerID(),EM_RoleValue_HP)>=ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP) then
			CancelBuff_NoEvent(OwnerID(),507476)
		end
	end
end

function Lua_Az133_104142_dead()
	local door2=ReadRoleValue(OwnerID(),EM_RoleValue_register5)
	ScriptMessage(OwnerID(),-1,2,"[SC_104142_09]",2)
	DelObj(door2)
	local player=SearchRangePlayer(OwnerID(),1000)
	local players=table.getn(player)
	for m=1,players,1 do
		CancelBuff(player[m],506968)
		CancelBuff(player[m],507476)
	end
end
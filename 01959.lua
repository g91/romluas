function Lua_Az133_104141_Ctrl()							--Raid帕依察控制器
	local Ctrl=OwnerID()
	local CombatBegin=0										--開戰旗標
	local RoomID=ReadRoleValue(Ctrl,EM_RoleValue_RoomID)
	local Boss=CreateObjByFlag(104141,780713,0,1)
	local door1=CreateObjByFlag(104205,780713,1,1)
	local door2=CreateObjByFlag(104206,780713,2,1)
	--local Phase
	--local PhaseCount=0
	SetModeEx(door2,EM_SetModeType_Mark, false)
	SetModeEx(door2,EM_SetModeType_HideName, false)
	SetModeEx(door2,EM_SetModeType_NotShowHPMP, false)
	SetModeEx(door2,EM_SetModeType_Strikback, false)
	SetModeEx(door2,EM_SetModeType_Move, false)
	SetModeEx(door2,EM_SetModeType_Fight, false)
	SetModeEx(door2,EM_SetModeType_Searchenemy, false)
	SetModeEx(door2,EM_SetModeType_Obstruct, true)
	AddToPartition(door2,RoomID)
	AddToPartition(Boss,RoomID)
	WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
	WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)
	WriteRoleValue(Boss,EM_RoleValue_register5,door2)
	SetPlot(Boss,"dead","Lua_Az133_104141_Dead",0)
	while true do
		sleep(10)
		local BossTarget=ReadRoleValue(Boss,EM_RoleValue_AttackTargetID)	
		if hatelistcount(boss)~=0 then
			if Combatbegin==0 then
				CombatBegin=1									--開戰
				--phase=1
				--WriteRoleValue(Boss,EM_RoleValue_register1,1)
				BeginPlot(Boss,"Lua_Az133_104141",0)
				door1=CreateObjByFlag(104205,780713,1,1)
				SetModeEx(door1,EM_SetModeType_Mark, false)
				SetModeEx(door1,EM_SetModeType_HideName, false)
				SetModeEx(door1,EM_SetModeType_NotShowHPMP, false)
				SetModeEx(door1,EM_SetModeType_Strikback, false)
				SetModeEx(door1,EM_SetModeType_Move, false)
				SetModeEx(door1,EM_SetModeType_Fight, false)
				SetModeEx(door1,EM_SetModeType_Searchenemy, false)
				SetModeEx(door1,EM_SetModeType_Obstruct, true)
				AddToPartition(door1,RoomID)
				ScriptMessage(boss,-1,2,"[SC_104141_01]",2)
				--say(Boss,"111")
			end
		elseif hatelistcount(boss)==0 then
			if Combatbegin==1 then
				if ReadRoleValue(boss,EM_RoleValue_IsDead)==0 then
					ScriptMessage(boss,-1,2,"[SC_104141_08]",2)
					DelObj(Boss)
					DelObj(door1)
					sleep(50)
					Boss=CreateObjByFlag(104141,780713,0,1)
					AddToPartition(Boss,RoomID)
					WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
					WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)
					WriteRoleValue(Boss,EM_RoleValue_register5,door2)
					SetPlot(Boss,"dead","Lua_Az133_104141_Dead",0)					
					Combatbegin=0
					PhaseCount=0
					local player=SearchRangePlayer(TargetID(),1000)
					local players=table.getn(player)
					for m=1,players,1 do
						CancelBuff(player[m],507369)
						CancelBuff(player[m],507392)
					end
				elseif ReadRoleValue(boss,EM_RoleValue_IsDead)==1 then
					--ScriptMessage(boss,-1,2,"[SC_104141_07]",2)		--放飯了!大家來領便當
					DelObj(door1)
					break
				end
			end
		end
	end
end
		
function Lua_Az133_104141()									--Raid帕依察
	local Boss=OwnerID()
	local RoomID=ReadRoleValue(Boss,EM_RoleValue_RoomID)
	local Sk={496008,496009,495959}						--7,7,19
--	local Sk={496008,495970,495959}						--測試用
	local PickOne=Lua_RandomPlayerFromHateList(Boss,1)
	local SkTgt={boss,boss,PickOne[1]}
	local SkLv={12,26,12}												--等級
	local SkStr={"[SC_104141_02]","[SC_104141_03]","[SC_104141_04]"}	--水波,冰晶,水球
	local RND
	local SkCount=0
	local mode
	while true do
		sleep(10)
		SkCount=SkCount+1
--		say(Boss,"Skcount="..Skcount)
--		mode=ReadRoleValue(Boss,EM_RoleValue_register1)
--		if mode==1 then
			if SkCount==500 then 
			local EveryOne=DW_HateRemain(0)
				for l=1,table.getn(EveryOne),1 do
					SysCastSpellLv(Boss,EveryOne[l],495981,50)
				end
				--say(boss,"die")
				AddBuff(boss,507364,0,-1)
				ScriptMessage(boss,-1,2,"[SC_104141_09]",2)
			elseif SkCount%23==0 then												--水牢
				local NoTank=DW_HateRemain(1)										
--				local NoTank=DW_HateRemain(0)
--				say(Boss,"NoTank="..NoTank[1])
				local BadLuck={}
				local ppl=table.getn(NoTank)
				local Amt
				if ppl>3 then 
					Amt=3
				else 
					Amt=ppl
				end
				for j=1,Amt do
					local RNDppl=DW_Rand(ppl)
--				say(Boss,"RNDppl="..RNDppl)
					table.insert(BadLuck,NoTank[RNDppl])
					table.remove(NoTank,RNDppl)
					ppl=table.getn(NoTank)
				end
--			say(boss,"BadLuck="..BadLuck[1])
--			say(boss,"amt="..Amt)
				local jell={}
				for i=1,Amt do
					CastSpellLv(Boss,BadLuck[i],495958,9)
					AddBuff(BadLuck[i],507368,0,14)
					AddBuff(BadLuck[i],507369,0,-1)
					jell[i]=Lua_DW_CreateObj("obj",104178,BadLuck[i],0,1)
					SetModeEx(jell[i],EM_SetModeType_Move,false)
					SetModeEx(jell[i],EM_SetModeType_Searchenemy,false)
					SetModeEx(jell[i],EM_SetModeType_Strikback,false)
					sleep(10)
					AddToPartition(jell[i],RoomID)
					AddBuff(jell[i],507528,0,-1)
					WriteRoleValue(jell[i],EM_RoleValue_PID,BadLuck[i])
					AddBuff(jell[i],507370,0,-1)									--水牢特效
					BeginPlot(jell[i],"Az_JellTimer_133",0)
					SetPlot(jell[i],"dead","Az_JellDead_133",0)
					ScriptMessage(boss,-1,2,"[SC_104141_05]",2)
--					say(boss,"BadLuck="..BadLuck[i])
				end
				sleep(20)
			elseif SkCount%19==0 then
				local Allppl=DW_HateRemain(0)
				local LuckyGuy={}
				ppl=table.getn(Allppl)
				if ppl>5 then
					Amt=5
				else
					Amt=ppl
				end
				for k=1,Amt do
					RNDppl=DW_Rand(ppl)
					table.insert(LuckyGuy,Allppl[RNDppl])
					table.remove(Allppl,RNDppl)
					ppl=table.getn(Allppl)
					CastSpellLv(Boss,LuckyGuy[k],Sk[3],SkLv[3])
				end
--				PickOne=Lua_RandomPlayerFromHateList(Boss,5)
				CastSpellLv(Boss,SkTgt[3],Sk[3],SkLv[3])
				ScriptMessage(boss,-1,2,SkStr[3],2)
--				Say(boss,"Small")
			elseif SkCount%7==6 then
				BeginPlot(boss,"Lua_Az_LightingCould_133",0)
				--say(boss,"Lighting")
			elseif SkCount%7==0 then
				RND=DW_Rand(2)
				CastSpellLv(Boss,SkTgt[RND],Sk[RND],SkLv[RND])
				--ScriptMessage(boss,-1,2,SkStr[RND],2)
			end
--		elseif mode==2 then
--			sleep(50)
--			if SkCount==480 then 
--				AddBuff(boss,507364,0,-1)
--				ScriptMessage(boss,-1,2,"[SC_104141_09]",2)
--			-elseif SkCount%19==0 then
--				CastSpellLv(Boss,SkTgt[3],Sk[3],SkLv[3])
--				ScriptMessage(boss,-1,2,SkStr[3],2)
--				Say(boss,"Small")
--			elseif 	SkCount%7==0 then
--				RND=DW_Rand(2)
--				CastSpellLv(Boss,SkTgt[RND],Sk[RND],SkLv[RND])
--				ScriptMessage(boss,-1,2,SkStr[RND],2)
--			elseif SkCount%3==0 then
--				BeginPlot(boss,"Lua_Az_LightingCould_133",0)
--			end
--		end
	end
end

function Az_JellTimer_133()
	local JellTime=0
	while true do
		sleep(10)
		JellTime=JellTime+1
		if ReadRoleValue(OwnerID(),EM_RoleValue_IsDead)==0 then
			if JellTime>=13 then
				DelObj(OwnerID())
			end
		end
	end
end

function Az_JellDead_133()
	local LukGuy=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	if CheckBuff(LukGuy,507369)==true then
		local pos=Lua_BuffPosSearch(LukGuy,507369)
		local BuffLv=BuffInfo(LukGuy,pos,EM_BuffInfoType_Power)
		--say(OwnerID(),"BuffLv="..BuffLv)
		CancelBuff(LukGuy,507369)
		CancelBuff(LukGuy,507368)
		if BuffLv>0 then
			BuffLv=BuffLv-1
			--say(OwnerID(),"NewBuffLv="..BuffLv)
			AddBuff(LukGuy,507369,BuffLv,-1)
		end
		DelObj(OwnerID())
	end
end

function Lua_Az_ThunderCheck_133()
	if CheckBuff(TargetID(),507369)==true then
		--Say(TargetID(),"YES,YES")
		local BuffPos=Lua_BuffPosSearch(TargetID(),507369)
		local BuffPower=BuffInfo(TargetID(),BuffPos,EM_BuffInfoType_Power)
		if BuffPower==9 then
			SysCastSpellLv(TargetID(),TargetID(),496007,189)
			--Say(TargetID(),"BuffLv=10")
		elseif BuffPower==8 then 
			SysCastSpellLv(TargetID(),TargetID(),496007,169)
			--Say(TargetID(),"BuffLv=9")
		elseif BuffPower==7 then 
			SysCastSpellLv(TargetID(),TargetID(),496007,149)
			--Say(TargetID(),"BuffLv=8")
		elseif BuffPower==6 then 
			SysCastSpellLv(TargetID(),TargetID(),496007,129)
			--Say(TargetID(),"BuffLv=7")
		elseif BuffPower==5 then 
			SysCastSpellLv(TargetID(),TargetID(),496007,109)
			--Say(TargetID(),"BuffLv=6")
		elseif BuffPower==4 then 
			SysCastSpellLv(TargetID(),TargetID(),496007,89)
			--Say(TargetID(),"BuffLv=5")
		elseif BuffPower==3 then 
			SysCastSpellLv(TargetID(),TargetID(),496007,69)
			--Say(TargetID(),"BuffLv=4")
		elseif BuffPower==2 then 
			SysCastSpellLv(TargetID(),TargetID(),496007,49)
			--Say(TargetID(),"BuffLv=3")
		elseif BuffPower==1 then 
			SysCastSpellLv(TargetID(),TargetID(),496007,29)
			--Say(TargetID(),"BuffLv=2")
		elseif BuffPower==0 then 
			SysCastSpellLv(TargetID(),TargetID(),496007,9)
			--Say(TargetID(),"BuffLv=1")
		end
	end
end

function Lua_Az_DelayCheck_133()
	if CheckBuff(TargetID(),507391)==true then
		local BPos=Lua_BuffPosSearch(TargetID(),507391)
		local BLv=BuffInfo(TargetID(),BPos,EM_BuffInfoType_Power)
		if BLv==1 then 
			CancelBuff(TargetID(),507391)
			AddBuff(TargetID(),507392,0,-1)
			--say(TargetID(),"105%")
		elseif BLv==0 then
			CancelBuff(TargetID(),507391)
			AddBuff(TargetID(),507391,1,-1)
			--say(TargetID(),"70%")
		end
	elseif CheckBuff(TargetID(),507391)==false then
		AddBuff(TargetID(),507391,0,-1)
		--say(TargetID(),"35%")
	end
end

function Lua_Az_LightingCould_133()
	local Boss=OwnerID()
	local RoomID=ReadRoleValue(Boss,EM_RoleValue_RoomID)
	local PickOne=Lua_RandomPlayerFromHateList(Boss,1)
	local obj1=Lua_DW_CreateObj("obj",104178,PickOne[1],0,1)
	SetModeEx(obj1,EM_SetModeType_Move,false)
	SetModeEx(obj1,EM_SetModeType_Fight,false)
	SetModeEx(obj1,EM_SetModeType_Searchenemy,false)
	SetModeEx(obj1,EM_SetModeType_Strikback,false)
	SetModeEx(obj1,EM_SetModeType_Mark ,false)
	SetModeEx(obj1,EM_SetModeType_ShowRoleHead,false)
	AddToPartition(obj1,RoomID)
	AddBuff(obj1,507285,0,3)
	--Say(obj1,"lighting")
	local XYZ={ReadRoleValue(obj1,EM_RoleValue_X),ReadRoleValue(obj1,EM_RoleValue_Y)+70,ReadRoleValue(obj1,EM_RoleValue_Z)}
	sleep(10)
	local obj2=Lua_DW_CreateObj("xyz",104178,XYZ,0,0,1)
	SetModeEx(obj2,EM_SetModeType_Gravity,false) 					--重力
	SetModeEx(obj2,EM_SetModeType_Move,false)
	SetModeEx(obj2,EM_SetModeType_Fight,false)
	SetModeEx(obj2,EM_SetModeType_Searchenemy,false)
	SetModeEx(obj2,EM_SetModeType_Strikback,false)
	SetModeEx(obj2,EM_SetModeType_Mark ,false)
	SetModeEx(obj2,EM_SetModeType_ShowRoleHead,false)
	AddToPartition(obj2,RoomID)
	AddBuff(obj2,507284,0,3)
	sleep(10)
	local Lazy=SearchRangePlayer(obj1,40)
	local LazyBone=table.getn(Lazy)
		if LazyBone~=0 then
		for i=0 ,LazyBone do
			SysCastSpellLv(Boss,Lazy[i],495981,14)
			ScriptMessage(OwnerID(),-1,2,"[SC_104141_06]",2)
		end
	end
	sleep(10)
	DelObj(obj1)
	DelObj(obj2)
end

function Lua_Az133_104141_Dead()
	--say(OwnerID(),"111")
	--say(TargetID(),"222")
	local door2=ReadRoleValue(OwnerID(),EM_RoleValue_register5)
	--say(door2,"555")
	DelObj(door2)
	ScriptMessage(OwnerID(),-1,2,"[SC_104141_07]",2)		--放飯了!大家來領便當
	local player=SearchRangePlayer(OwnerID(),1000)
	local players=table.getn(player)
	--say(OwnerID(),"players="..players)
	for m=1,players,1 do
		CancelBuff(player[m],507369)
		CancelBuff(player[m],507392)
	end
end
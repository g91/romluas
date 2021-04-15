function Lua_Az135_104571_Ctrl()
	local Ctrl=OwnerID()
	local RoomID=ReadRoleValue(Ctrl,EM_RoleValue_RoomID)
	local Boss=CreateObjByFlag(104571,780758,0,1)
	local FrontDoor=CreateObjByFlag(104499,780758,1,1)
	local BackDoor=CreateObjByFlag(104499,780758,2,1)
	local Crc=CreateObjByFlag(104511,780758,0,1)
	local CombatBegin=0
	local Timer=0
	SetModeEx(BackDoor,EM_SetModeType_Mark,false)
	SetModeEx(BackDoor,EM_SetModeType_HideName,true)
	SetModeEx(BackDoor,EM_SetModeType_NotShowHPMP,true)
	SetModeEx(BackDoor,EM_SetModeType_Strikback,false)
	SetModeEx(BackDoor,EM_SetModeType_Move,false)
	SetModeEx(BackDoor,EM_SetModeType_Fight,false)
	SetModeEx(BackDoor,EM_SetModeType_Searchenemy,false)
	SetModeEx(BackDoor,EM_SetModeType_Obstruct,true)
	SetModeEx(BackDoor,EM_SetModeType_ShowRoleHead,false)
	SetModeEx(FrontDoor,EM_SetModeType_Mark,false)
	SetModeEx(FrontDoor,EM_SetModeType_HideName,true)
	SetModeEx(FrontDoor,EM_SetModeType_NotShowHPMP,true)
	SetModeEx(FrontDoor,EM_SetModeType_Strikback,false)
	SetModeEx(FrontDoor,EM_SetModeType_Move,false)
	SetModeEx(FrontDoor,EM_SetModeType_Fight,false)
	SetModeEx(FrontDoor,EM_SetModeType_Searchenemy,false)
	SetModeEx(FrontDoor,EM_SetModeType_Obstruct,true)
	SetModeEx(FrontDoor,EM_SetModeType_ShowRoleHead,false)
	SetModeEx(Crc,EM_SetModeType_Mark, false)
	SetModeEx(Crc,EM_SetModeType_HideName, false)
	SetModeEx(Crc,EM_SetModeType_NotShowHPMP, true)
	SetModeEx(Crc,EM_SetModeType_Strikback, false)
	SetModeEx(Crc,EM_SetModeType_Move, false)
	SetModeEx(Crc,EM_SetModeType_Fight, false)
	SetModeEx(Crc,EM_SetModeType_Searchenemy, false)
	SetModeEx(Crc,EM_SetModeType_Obstruct, true)
	SetModeEx(Crc,EM_SetModeType_ShowRoleHead,false)
	SetModeEx(Boss,EM_SetModeType_Move, false)
	AddToPartition(FrontDoor,RoomID)
	AddToPartition(BackDoor,RoomID)
	AddToPartition(Crc,RoomID)
	AddToPartition(Boss,RoomID)
	AddBuff(Crc,507822,0,-1)
	SetDefIdleMotion(FrontDoor,ruFUSION_MIME_ACTIVATE_LOOP)
	SetDefIdleMotion(BackDoor,ruFUSION_MIME_ACTIVATE_END)
	SetPlot(Boss,"dead","Lua_Az135_104571_Dead",0)
	WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
	WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)
	WriteRoleValue(Boss,EM_RoleValue_register1,BackDoor)
	WriteRoleValue(Boss,EM_RoleValue_register2,Crc)
	WriteRoleValue(Crc,EM_RoleValue_PID,Boss)
	while true do
		sleep(10)
		local BossTarget=ReadRoleValue(Boss,EM_RoleValue_AttackTargetID)	
		if hatelistcount(boss)~=0 then
			if Combatbegin==0 then
				CombatBegin=1								
				BeginPlot(Boss,"Lua_Az135_104571",0)
				BeginPlot(Crc,"Lua_Az135_Buff",0)
				SetDefIdleMotion(FrontDoor,ruFUSION_MIME_ACTIVATE_END)
				ScriptMessage(boss,-1,2,"[SC_104227_01]",2)
--				CastSpellLv(Boss,Boss,496188,4)
--				AddBuff(Boss,507629,0,-1)
			end
		elseif hatelistcount(boss)==0 then
			if Combatbegin==1 then
				if ReadRoleValue(boss,EM_RoleValue_IsDead)==0 then
					ScriptMessage(boss,-1,2,"[SC_104227_02]",2)
					local player=SearchRangePlayer(boss,1000)
					local players=table.getn(player)
					for m=0,players,1 do
						CancelBuff(player[m],507633)
						CancelBuff(player[m],507716)
						CancelBuff_NoEvent(player[m],507586)
					end
					DelObj(Boss)
					DelObj(Crc)
					SetDefIdleMotion(FrontDoor,ruFUSION_MIME_ACTIVATE_BEGIN)
					sleep(50)
					Boss=CreateObjByFlag(104571,780758,0,1)
					Crc=CreateObjByFlag(104511,780758,0,1)
					SetModeEx(Crc,EM_SetModeType_Mark, false)
					SetModeEx(Crc,EM_SetModeType_HideName, false)
					SetModeEx(Crc,EM_SetModeType_NotShowHPMP, true)
					SetModeEx(Crc,EM_SetModeType_Strikback, false)
					SetModeEx(Crc,EM_SetModeType_Move, false)
					SetModeEx(Crc,EM_SetModeType_Fight, false)
					SetModeEx(Crc,EM_SetModeType_Searchenemy, false)
					SetModeEx(Crc,EM_SetModeType_Obstruct, true)
					SetModeEx(Crc,EM_SetModeType_ShowRoleHead,false)
					SetModeEx(Boss,EM_SetModeType_Move, false)
					AddToPartition(Boss,RoomID)
					AddToPartition(Crc,RoomID)
					WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
					WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)
					WriteRoleValue(Boss,EM_RoleValue_register1,BackDoor)
					WriteRoleValue(Boss,EM_RoleValue_register2,Crc)
					WriteRoleValue(Crc,EM_RoleValue_PID,Boss)
					AddBuff(Crc,507822,0,-1)
					SetPlot(Boss,"dead","Lua_Az135_104571_Dead",0)					
					Combatbegin=0
					Timer=0
				elseif ReadRoleValue(boss,EM_RoleValue_IsDead)==1 then
					SetDefIdleMotion(FrontDoor,ruFUSION_MIME_ACTIVATE_BEGIN)
					break
				end
			end
		end
	end
end

		
function Lua_Az135_104571()
	local boss=OwnerID()
	local BossTarget
	local RoomID=ReadRoleValue(boss,EM_RoleValue_RoomID)
	local Skills={495538,496185,495590,496032}								--小砂球,AE,砂手,大砂球
	local SkLv={6,9,6,6}
	local SkCount=0
	local RND
	while true do
		sleep(10)
		SkCount=SkCount+1
		if SkCount%19==0 then
			RND=DW_Rand(2)
			if RND==1 then
				while ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)~=0 do
					sleep(2)
				end
				ScriptMessage(boss,-1,2,"[SC_104227_05]",2)
				local ppl=SetSearchAllPlayer(RoomID)
				for u=1,ppl,1 do
					local ID = GetSearchResult()
					if ReadRoleValue(ID,EM_RoleValue_IsDead)~=1 and ReadRoleValue(ID,EM_RoleValue_VOC)~=0 and ReadRoleValue(ID,EM_RoleValue_RoomID)==RoomID and CheckBuff(ID,507634)~=true and CheckBuff(ID,507716)~=true then
						SetPos(ID,ReadRoleValue(boss,EM_RoleValue_X),ReadRoleValue(boss,EM_RoleValue_Y),ReadRoleValue(boss,EM_RoleValue_Z),ReadRoleValue(boss,EM_RoleValue_Dir))
					end
				end
				sleep(5)
				CastSpellLv(boss,boss,Skills[2],SkLv[2])
				sleep(30)
			elseif RND==2 then
				while ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)~=0 do
					sleep(2)
				end
				CastSpellLv(boss,boss,Skills[4],Sklv[4])
				ScriptMessage(boss,-1,2,"[SC_104227_08]",1)
				sleep(20)
				local Select=DW_HateRemain(0)
				RND=DW_Rand(table.getn(Select))
				AddBuff(Select[RND],507586,0,5)
				sleep(20)
			end
		elseif SkCount%11==0 then
			local HateList=DW_HateRemain(0)
			local Range=SearchRangePlayer(OwnerID(),100)
			for i=0,table.getn(HateList),1 do
				for j=0,table.getn(Range),1 do
					if HateList[i]==Range[j] then
						table.remove(HateList,i)
					end
				end
			end
			RND=DW_Rand(table.getn(HateList))
			while ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)~=0 do
				sleep(2)
			end
			if table.getn(HateList)~=0 then 
				RND=DW_Rand(table.getn(HateList))
--				local RNG=SearchRangePlayer(HateList[RND],20)
--				for t=0,table.getn(RNG),1 do
--					if CheckBuff(RNG[t],507716) then
--						CancelBuff(RNG[t],507716)
--						ScriptMessage()
--					end
--				end
				CastSpellLv(Boss,HateList[RND],Skills[3],SkLv[3])
				SysCastSpellLv(HateList[RND],Boss,496136,0)
			else
				HateList=DW_HateRemain(0)
--				RNG=SearchRangePlayer(HateList[RND],20)
--				for t=0,table.getn(RNG),1 do
--					if CheckBuff(RNG[t],507716) then
--						CancelBuff(RNG[t],507716)
--						ScriptMessage()
--					end
--				end
				RND=DW_Rand(table.getn(HateList))
				CastSpellLv(Boss,HateList[RND],Skills[3],SkLv[3])
				SysCastSpellLv(HateList[RND],Boss,496136,0)
			end
--			CastSpellLv(Boss,BossTarget,Skills[3],SkLv[3])
--			say(boss,"ppl="..table.getn(HateList))
			ScriptMessage(boss,-1,2,"[SC_104227_07]",2)
			CastSpellLv(boss,BossTarget,Skills[1],SkLv[1])
			sleep(10)
		elseif SkCount%7==0 then
			BeginPlot(boss,"Lua_Az135_SandTrap",0)
		elseif SkCount%2==0 then
			BossTarget=ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID)
			CastSpellLv(boss,BossTarget,Skills[1],SkLv[1])
			sleep(10)
		end
	end	
end

function Lua_Az135_SandTrap()
	local Boss=OwnerID()
	local RoomID=ReadRoleValue(Boss,EM_RoleValue_RoomID)
--	local PickOne=Lua_RandomPlayerFromHateList(Boss,1)
	local SandTrap={}
	local HateList=Lua_RandomPlayerFromHateList(Boss,1)
--	local Range=SearchRangePlayer(OwnerID(),100)
--	for v=0,table.getn(HateList),1 do
--		for w=0,table.getn(Range),1 do
--			if HateList[v]==Range[w] then
--				table.remove(HateList,v)
--			end
--		end
--	end
	for Trap=1,table.getn(HateList),1 do
		if ReadRoleValue(HateList[Trap],EM_RoleValue_IsDead)~=1 and ReadRoleValue(HateList[Trap],EM_RoleValue_VOC)~=0 then
			SandTrap[Trap]=Lua_DW_CreateObj("obj",104501,HateList[Trap],0,1)
			SetModeEx(SandTrap[Trap],EM_SetModeType_Move,false)
			SetModeEx(SandTrap[Trap],EM_SetModeType_Fight,false)
			SetModeEx(SandTrap[Trap],EM_SetModeType_Searchenemy,false)
			SetModeEx(SandTrap[Trap],EM_SetModeType_Strikback,false)
			SetModeEx(SandTrap[Trap],EM_SetModeType_Mark ,false)
			SetModeEx(SandTrap[Trap],EM_SetModeType_ShowRoleHead,false)
			AddToPartition(SandTrap[Trap],RoomID)
			AddBuff(SandTrap[Trap],506739,0,4)
			sleep(2)
			CastSpelllv(SandTrap[Trap],SandTrap[Trap],496184,4)
			WriteRoleValue(SandTrap[Trap],EM_RoleValue_Livetime,5)
		end
	end
end
	
function Lua_Az135_104571_Dead()
	local BackDoor=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	local Crc=ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
	SetDefIdleMotion(BackDoor,ruFUSION_MIME_ACTIVATE_BEGIN)
	DelObj(Crc)
	ScriptMessage(OwnerID(),-1,2,"[SC_104227_06]",2)		
	local player=SearchRangePlayer(OwnerID(),1000)
	local players=table.getn(player)
	for m=0,players,1 do
		CancelBuff(player[m],507633)
		CancelBuff(player[m],507716)
		CancelBuff_NoEvent(player[m],507586)
	end
end

function Lua_Az135_Buff()
	local Crc=OwnerID()
	local Boss=ReadRoleValue(Crc,EM_RoleValue_PID)
	local ppl=SearchRangePlayer(Boss,1000)
	local Stack=2
	local BuffTime=480
	while true do
		sleep(10)
		if CheckID(Crc)==true and CheckID(Boss)==true then
			for t=0,table.getn(ppl),1 do
				if ReadRoleValue(ppl[t],EM_RoleValue_IsDead)~=1 and ReadRoleValue(ppl[t],EM_RoleValue_VOC)~=0 then
					if BuffTime>0 then
						AddBuff(ppl[t],507633,Stack,BuffTime)
	--					say(Crc,"t="..t)
					elseif BuffTime<=0 then
--						AddBuff(ppl[t],507633,49,-1)
--						AddBuff(Boss,507663,0,-1)
--						ScriptMessage(boss,-1,2,"[SC_104227_03]",2)
						break
					end
				end
			end
			Stack=Stack+1
--			say(Crc,"NextStack="..Stack)
			BuffTime=BuffTime-60
--			say(Crc,"NextBuff="..BuffTime)
			sleep(600)
		else
			break
		end
	end
end

function Lua_Az135_CancelBuff()
--	Say(TargetID(),"Cancel")
	if CheckBuff(TargetID(),507716) then
		CancelBuff(TargetID(),507716)
		CancelBuff_NoEvent(TargetID(),507634)
--		Say(TargetID(),"Canceled")
		ScriptMessage(OwnerID(),TargetID(),2,"[SC_104227_09]",0xff6fb7ff)
	end
end	

function Lua_Az135_FlyCheck()
	if CheckBuff(TargetID(),507634) or CheckBuff(TargetID(),507716) then
		return false
	else 
		return true
	end
end
function ic_fire_00()																		---紅色 106578  藍色 106579 
local isaac=OwnerID()
local fire1=ic_mob_flag_add_Y_N( isaac,106578,781064,11,1)
local fire2=ic_mob_flag_add_Y_N( isaac,106579,781064,12,1)
	ic_All_bobo(fire1)
	ic_All_bobo(fire2)
	SetModeEx( fire1 , EM_SetModeType_Obstruct, false) 
	SetModeEx( fire2 , EM_SetModeType_Obstruct, false) 
	WriteRoleValue(fire1,EM_RoleValue_register10,isaac)
	WriteRoleValue(fire2,EM_RoleValue_register10,isaac)
	SetPlot(fire1,"touch","ic_fire_01",50)													---紅柱
	SetPlot(fire2,"touch","ic_fire_02",50)													---藍住
end

function ic_fire_01()																		---招換柱  ic_ZONE6_2_1
	local play=OwnerID()	
	local npc=TargetID()
	local isaac=ReadRoleValue(npc,EM_RoleValue_register10)	
	local yes_no	
	local time00=0
	local time01=0
	local time02
	local open=0
	local mob	
	local play12
	SetPlot(npc,"touch","",0)
	SetModeEx( npc , EM_SetModeType_Mark, false)
	time00=ReadRoleValue(npc,EM_RoleValue_register1)
	yes_no=ReadRoleValue(isaac,EM_RoleValue_register1)
	time02=ReadRoleValue(npc,EM_RoleValue_register2)
	--say(npc ,"time02="..time02)
	if time02==0 then
		WriteRoleValue(npc,EM_RoleValue_register2,1)
		time02=ReadRoleValue(npc,EM_RoleValue_register2)
		--say(npc ,"time02="..time02)
		if time00==0 and yes_no==0 then 
			local RoomID=ReadRoleValue(npc,EM_RoleValue_RoomID)
			local TempPlayer = SetSearchAllPlayer(RoomID)										----找區域所有玩家
			local play123 = {}
			if CountBodyItem( play, 240995 )>=3  then											---可以玩
				for i=1,TempPlayer do
					play123[i] = GetSearchResult()
					if ReadRoleValue(play123[i]  , EM_RoleValue_VOC ) ~= 0 then 
						play12=ReadRoleValue(npc,EM_RoleValue_register7)
						WriteRoleValue(npc,EM_RoleValue_register7,play12+1)
					end	
				end
				play12=ReadRoleValue(npc,EM_RoleValue_register7)
				--say(npc,"play12="..play12)
				if play12<2 then																---人不夠
					ScriptMessage( npc, -1 , 1 , "[SC_IC_FIRE_01]" , 2 )
					WriteRoleValue(npc,EM_RoleValue_register1,0)
					WriteRoleValue(npc,EM_RoleValue_register7,0)
					WriteRoleValue(npc,EM_RoleValue_register2,0)
					SetModeEx( npc , EM_SetModeType_Mark, true)
					SetPlot(npc,"touch","ic_fire_01",20)
				elseif play12>6 then															---人太多
					ScriptMessage( npc, -1 , 1 , "[SC_IC_FIRE_02]" , 2 )
					WriteRoleValue(npc,EM_RoleValue_register1,0)
					WriteRoleValue(npc,EM_RoleValue_register7,0)
					WriteRoleValue(npc,EM_RoleValue_register2,0)
					SetModeEx( npc , EM_SetModeType_Mark, true)
					SetPlot(npc,"touch","ic_fire_01",20)
				elseif play12>1 and play12<7 then												---開戰
					WriteRoleValue(npc,EM_RoleValue_register1,1)
					WriteRoleValue(isaac,EM_RoleValue_register1,1)
					DelBodyItem( play, 240995,3)
				end
			elseif  CountBodyItem( play, 240995)<3 then											---招換物品不夠
					ScriptMessage( npc, -1 , 1 , "[SC_IC_FIRE_03]" , 2 )
					--say(npc,"YOU_NO_240995*3")
					WriteRoleValue(npc,EM_RoleValue_register1,0)
					WriteRoleValue(npc,EM_RoleValue_register2,0)
					SetModeEx( npc , EM_SetModeType_Mark, true)
					SetPlot(npc,"touch","ic_fire_01",20)	
			end		
		end
		time00=ReadRoleValue(npc,EM_RoleValue_register1)
		yes_no=ReadRoleValue(isaac,EM_RoleValue_register1)
		if 	time00==1 and yes_no==1 then 
			if time01==0 then
				ScriptMessage( npc, -1 , 2 , "[SC_IC_FIRE_05]" , 2 )	
				local RoomID=ReadRoleValue(npc,EM_RoleValue_RoomID)						---出場
				local Boss=ic_mob_flag_add_Y_N( npc,106203,781064,8,1)							---惡獸 紅色106203  藍色106204		
				local npc123={}							---NPC幾人 
				local play1
				AddBuff(Boss,621782,0 ,-1 )
				SetModeEx( Boss , EM_SetModeType_Move, false)
				WriteRoleValue(Boss,EM_RoleValue_PID,npc)
				BeginPlot(Boss,"ic_fire_01_boss" , 0)	
				WriteRoleValue(Boss,EM_RoleValue_register1,play)
				WriteRoleValue(Boss,EM_RoleValue_register5,isaac)
				local TempPlayer = SetSearchAllPlayer(RoomID)----找區域所有玩家
				local play123 = {}
				for i=1,TempPlayer do
					play123[i] = GetSearchResult()
					if ReadRoleValue(play123[i]  , EM_RoleValue_VOC ) ~= 0 then 
						AddBuff(play123[i],621775,0 ,-1 )
						ClockOpen(play123[i] , EM_ClockCheckValue_26 , 300 , 300 , 0 , "ic_fire_Clockclose" , "ic_fire_Clockclose" )
						ic_skill_CD_0(play123[i],498940,0)
						ic_skill_CD_0(play123[i],498941,0)
						ic_skill_CD_0(play123[i],498942,0)
						npc123[i]=ic_mob_flag_add_Y_N( npc,106205,781064,i+1,1)
						SetModeEx( npc123[i], EM_SetModeType_Move, false)
						WriteRoleValue(npc123[i],EM_RoleValue_PID,Boss)
						AddBuff(npc123[i],621782,0 ,-1 )
						BeginPlot(npc123[i],"ic_fire_01_npc" , 0)
					end
				end
				play12=ReadRoleValue(npc,EM_RoleValue_register7)
				WriteRoleValue(boss,EM_RoleValue_register7,play12)
				SetAttack(Boss , npc123[1])
				time01=1 
			end	
		end
		if time00==0 and  yes_no==1 then
			ScriptMessage( npc, -1 , 1 , "[SC_IC_FIRE_04]" , 2 )
			WriteRoleValue(npc,EM_RoleValue_register1,0)
			WriteRoleValue(npc,EM_RoleValue_register2,0)
			SetModeEx( npc , EM_SetModeType_Mark, true)
			SetPlot(npc,"touch","ic_fire_01",20)
		end	
	end		
end
function ic_fire_01_bosskk()
	if ReadRoleValue(TargetID() , EM_RoleValue_OrgID ) == 106203 then 
		return true
	elseif ReadRoleValue(TargetID() , EM_RoleValue_OrgID ) ~=0 then 
		return false
	end
end
function ic_fire_01_npckk()
	if ReadRoleValue(TargetID() , EM_RoleValue_OrgID ) == 106205 then 
		return true
	elseif ReadRoleValue(TargetID() , EM_RoleValue_OrgID ) ~=0 then 
		return false
	end
end
function ic_fire_01_npcxx()																	---NPC死亡									
	local boss=ReadRoleValue(OwnerID(),EM_RoleValue_PID)	
	local playxx
	playxx=ReadRoleValue(boss,EM_RoleValue_register8)	
	WriteRoleValue(boss,EM_RoleValue_register8,playxx+1)
end
function ic_fire_01_npc()																	---NPCAI	
	local mob=OwnerID()	
	local boss=ReadRoleValue(mob,EM_RoleValue_PID)		
	local open=0
	local time1=0
	local time2=0
	local time3=0
	local AttackTarget
	SetPlot(mob,"dead","ic_fire_01_npcxx",0)	
	while 1 do
	sleep(10)
		AttackTarget = ReadRoleValue(mob, EM_RoleValue_PID )
		if CheckBuff(mob, 621762 ) == true then					---特殊招
			while 	ReadRoleValue(mob , EM_RoleValue_SpellMagicID  ) ~= 0   do
				sleep(5)
			end
			CastSpellLV( mob, AttackTarget, 498944, 0 )
			while 	ReadRoleValue(mob , EM_RoleValue_SpellMagicID  ) ~= 0   do
				sleep(5)
			end
			CancelBuff(mob,621762)
		end
		if CheckBuff(mob, 621767 ) == false then	
			if time1>=0 then																	--單體
				while 	ReadRoleValue(mob , EM_RoleValue_SpellMagicID  ) ~= 0   do
					sleep(5)
				end
				CastSpellLV( mob, AttackTarget, 498943, 0 )
				while 	ReadRoleValue(mob , EM_RoleValue_SpellMagicID  ) ~= 0   do
					sleep(5)
				end
				time1=0
			end
		end	
	end
end
function ic_fire_01_bossxx()																---惡獸死亡
	local npc=ReadRoleValue(OwnerID(),EM_RoleValue_PID)	
	local play=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
	local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_register5)
	local play30
	local play31
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local TempPlayer = SetSearchAllPlayer(RoomID)----找區域所有玩家
	local play123 = {}																		
	for i=1,TempPlayer do
		play123[i] = GetSearchResult() 
		if ReadRoleValue(play123[i]  , EM_RoleValue_VOC ) ~= 0 then 
			AddRoleValue(play123[i] , EM_LuaValueFlag_UseItem30,1 )
			play30=ReadRoleValue(play123[i], EM_LuaValueFlag_UseItem30 )
			play31=ReadRoleValue(play123[i], EM_LuaValueFlag_UseItem31 )
			--say(play123[i],"play30="..play30)
			--say(play123[i],"play31="..play31)
			ClockClose(play123[i])
			if play30>=1 and play31>=1 and CountBodyItem(play123[i], 530863 )==0 then
				GiveBodyItem( play123[i], 530863, 1 )
				--say(play123[i] ,"1")
			elseif play30>=20 and play31>=20 and CountBodyItem(play123[i], 530864 )==0 then
				GiveBodyItem( play123[i], 530864, 1 )
				--say(play123[i] ,"2")
			end
		end	
	end
	ScriptMessage( npc, -1 , 2 , "[SC_IC_FIRE_06]" , 2 )									---死亡
	local bobo=ic_mob_Rand_noadd( OwnerID() , 106587 ,0,0) 
	ic_All_bobo(bobo)
	AddToPartition(bobo,RoomID)
	SetModeEx( npc , EM_SetModeType_Mark, true)
	SetPlot(npc,"touch","ic_fire_01",50)
	WriteRoleValue(npc,EM_RoleValue_register1,0)
	WriteRoleValue(npc,EM_RoleValue_register7,0)
	WriteRoleValue(npc,EM_RoleValue_register2,0)
	WriteRoleValue(isaac,EM_RoleValue_register1,0)
	ic_npcXX(0,106205,0,0,0,0,0,0,0,0,0)
	ic_playBUFFXX(0,621775,0,0,0,0,0,0,0,0,0)
	local Search = SearchRangeNPC ( OwnerID() , 400 )
	for i = 0 , table.getn(Search) do
		if Search[i] ~= OwnerID() then
			if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	103900	then
				WriteRoleValue(isaac,EM_RoleValue_register1,0)
			end		
		end
	end
	DelObj(OwnerID())
end
function ic_fire_01_boss()																	---惡獸AI
	local mob=OwnerID()	
	local npc=ReadRoleValue(mob,EM_RoleValue_PID)	
	local isaac=ReadRoleValue(mob,EM_RoleValue_register5)
	local npcxx
	local npc123
	local open=0
	local time1=0
	local time2=0
	local time3=0
	local time4=0
	SetPlot(mob,"dead","ic_fire_01_bossxx",0)	
	while 1 do
		sleep(10)
		npc123=ReadRoleValue(mob,EM_RoleValue_register7)
		npcxx=ReadRoleValue(mob,EM_RoleValue_register8)
		if npcxx==npc123 then
			ScriptMessage( mob, -1 , 2 , "[SC_IC_FIRE_07]" , 2 )							---跑走
			local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
			local TempPlayer = SetSearchAllPlayer(RoomID)----找區域所有玩家
			local play123 = {}																		
			for i=1,TempPlayer do
				play123[i] = GetSearchResult() 
				if ReadRoleValue(play123[i]  , EM_RoleValue_VOC ) ~= 0 then 
					ClockClose(play123[i])
					CancelBuff(play123[i], 621775)
				end	
			end
			SetModeEx( npc , EM_SetModeType_Mark, true)
			SetPlot(npc,"touch","ic_fire_01",50)
			WriteRoleValue(npc,EM_RoleValue_register1,0)
			WriteRoleValue(npc,EM_RoleValue_register7,0)
			WriteRoleValue(npc,EM_RoleValue_register2,0)
			WriteRoleValue(isaac,EM_RoleValue_register1,0)
			ic_npcXX(0,106205,0,0,0,0,0,0,0,0,0) 
			local Search = SearchRangeNPC ( OwnerID() , 400 )
			for i = 0 , table.getn(Search) do
				if Search[i] ~= OwnerID() then
					if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	103900	then
						WriteRoleValue(isaac,EM_RoleValue_register1,0)
					end		
				end
			end
			DelObj(mob) 
		elseif hatelistcount(mob)~=0 then
			if open==0 then
				open=1
			end
			time1=time1+1
			time2=time2+1
			time3=time3+1
			time4=time4+1
			if time1>300 then
				ScriptMessage( mob, -1 , 2 , "[SC_IC_FIRE_07]" , 2 )						---跑走
				local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
				local TempPlayer = SetSearchAllPlayer(RoomID)----找區域所有玩家
				local play123 = {}																		
				for i=1,TempPlayer do
					play123[i] = GetSearchResult() 
					if ReadRoleValue(play123[i]  , EM_RoleValue_VOC ) ~= 0 then 
						ClockClose(play123[i])
						CancelBuff(play123[i], 621775)
					end	
				end
				SetModeEx( npc , EM_SetModeType_Mark, true)
				SetPlot(npc,"touch","ic_fire_01",50)
				WriteRoleValue(npc,EM_RoleValue_register1,0)
				WriteRoleValue(npc,EM_RoleValue_register7,0)
				WriteRoleValue(npc,EM_RoleValue_register2,0)
				WriteRoleValue(isaac,EM_RoleValue_register1,0)
				ic_npcXX(0,106205,0,0,0,0,0,0,0,0,0) 
				local Search = SearchRangeNPC ( OwnerID() , 400 )
				for i = 0 , table.getn(Search) do
					if Search[i] ~= OwnerID() then
						if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	103900	then
							WriteRoleValue(isaac,EM_RoleValue_register1,0)
						end		
					end
				end
				DelObj(mob) 
			end
			if time4>=19 then
				ScriptMessage( mob, -1 , 2 , "[SC_IC_FIRE_08]" , 2 )						---大絕
				ScriptMessage( mob,-1 , 0 , "[SC_IC_FIRE_08]", C_SYSTEM )
				sleep(100)
				time1=time1+10
				if CheckBuff(mob, 621764 ) == false then	
					CastSpellLV( mob, mob, 498947, 0 )
				end	
				sleep(30)
				time1=time1+3
				time4=0
			end
			if time3>=11 then
				npc123=ReadRoleValue(mob,EM_RoleValue_register7)
				--say(mob ,"npc123="..npc123)
				if npc123==2 then
					ic_playkk_Rand_1_6(mob,1,0,498946,0)
				elseif	npc123>2 then
					ic_playkk_Rand_1_6(mob,3,0,498946,0)
				end	
				sleep(10)
				time1=time1+1
				local Search = SearchRangeNPC (mob , 400 )
				for i = 0 , table.getn(Search) do
					if Search[i] ~= OwnerID() then
						if CheckBuff(Search[i], 621767 ) == true then	
							NPCSay( Search[i], "[SC_IC_FIRE_10]" )
						end	
					end
				end	
				time3=0
			end
			if time2>=5 then
				npc123=ReadRoleValue(mob,EM_RoleValue_register7)
				--say(mob ,"npc123="..npc123)
				if npc123==2 then
					ic_playkk_Rand_1_6(mob,1,0,498945,0)
				elseif	npc123>2 then
					ic_playkk_Rand_1_6(mob,3,0,498945,0)
				end	
				sleep(10)
				time1=time1+1
				local Search = SearchRangeNPC ( mob , 400 )
				for i = 0 , table.getn(Search) do
					if Search[i] ~= OwnerID() then
						if CheckBuff(Search[i], 621766 ) == true then	
							NPCSay( Search[i], "[SC_IC_FIRE_09]" )
						end	
					end
				end	
				time2=0
			end
		end
	end	
end
--------------------------------------------------------------------------------------------
function ic_fire_02()		---(藍)招換柱初始劇情
	local play=OwnerID()	 --玩家
	local npc=TargetID()	--藍色召喚柱
	local isaac=ReadRoleValue(npc,EM_RoleValue_register10) --隱藏物件
	local yes_no
	local time00
	local time01=0
	local time02
	local open=0
	local mob
	SetPlot(npc,"touch","",0)
	SetModeEx( npc , EM_SetModeType_Mark, false)
	time00=ReadRoleValue(npc,EM_RoleValue_register1) 
	yes_no=ReadRoleValue(isaac,EM_RoleValue_register1)
	time02=ReadRoleValue(npc,EM_RoleValue_register2)
	--say(npc ,"time02="..time02)
	if time02==0 then
		WriteRoleValue(npc,EM_RoleValue_register2,1)
--		time02=ReadRoleValue(npc,EM_RoleValue_register2)
		--say(npc ,"time02="..time02)
		if time00==0 and yes_no==0 then 
			local RoomID=ReadRoleValue(npc,EM_RoleValue_RoomID)
			local TempPlayer = SetSearchAllPlayer(RoomID)----找區域所有玩家
			local play123 = {}	
			if CountBodyItem( play, 240996 )>=3 then					---可以玩
				for i=1,TempPlayer do
					play123[i] = GetSearchResult()
					if ReadRoleValue(play123[i]  , EM_RoleValue_VOC ) ~= 0 then  --如果職業不是GM
						play12 = ReadRoleValue(npc,EM_RoleValue_register7)
						WriteRoleValue(npc,EM_RoleValue_register7,play12+1)
					end	
				end
				play12=ReadRoleValue(npc,EM_RoleValue_register7)
				--say(npc,"play12="..play12)
				if play12<2 then		---人不夠
					ScriptMessage( npc, -1 , 1 , "[SC_IC_FIRE_01]" , 2 )
					WriteRoleValue(npc,EM_RoleValue_register1,0)
					WriteRoleValue(npc,EM_RoleValue_register7,0)
					WriteRoleValue(npc,EM_RoleValue_register2,0)
					SetModeEx( npc , EM_SetModeType_Mark, true)
					SetPlot(npc,"touch","ic_fire_02",20)
				elseif play12>6 then		---人太多
					ScriptMessage( npc, -1 , 1 , "[SC_IC_FIRE_02]" , 2 )
					WriteRoleValue(npc,EM_RoleValue_register1,0)
					WriteRoleValue(npc,EM_RoleValue_register7,0)
					WriteRoleValue(npc,EM_RoleValue_register2,0)
					SetModeEx( npc , EM_SetModeType_Mark, true)
					SetPlot(npc,"touch","ic_fire_02",20)
				elseif play12>1 and play12<7 then												---開戰
					WriteRoleValue(npc,EM_RoleValue_register1,1)
					WriteRoleValue(isaac,EM_RoleValue_register1,1)
					DelBodyItem( play, 240996,3)
				end
			elseif  CountBodyItem( play, 240996)<3 then											---招換物品不夠
				ScriptMessage( npc, -1 , 1 , "[SC_IC_FIRE_03]" , 2 )
				--say(npc,"YOU_NO_240996*3")
				WriteRoleValue(npc,EM_RoleValue_register1,0)
				WriteRoleValue(npc,EM_RoleValue_register2,0)
				SetModeEx( npc , EM_SetModeType_Mark, true)
				SetPlot(npc,"touch","ic_fire_02",20)	
			end		
		end	
		time00=ReadRoleValue(npc,EM_RoleValue_register1)
		yes_no=ReadRoleValue(isaac,EM_RoleValue_register1)
		if 	time00==1 and yes_no==1 then 
			if time01==0 then
				local RoomID=ReadRoleValue(npc,EM_RoleValue_RoomID)
				ScriptMessage( npc, -1 , 2 , "[SC_IC_FIRE_05]" , 2 )							---出場
				local Boss=ic_mob_flag_add_Y_N( npc,106204,781064,1,1)							---惡獸 紅色 106203  藍色 106204	
			--	Say( play,"ATTACK")			
--				local play1
				AddToPartition( Boss , RoomID)
				AddBuff(Boss,621782,0 ,-1 )
				WriteRoleValue(Boss,EM_RoleValue_PID,npc) --讓BOSS記住藍柱
				WriteRoleValue(Boss,EM_RoleValue_register5,isaac) --讓BOSS記住隱藏物件
				WriteRoleValue(Boss,EM_RoleValue_register1,play) --讓BOSS記住玩家
				BeginPlot(Boss,"ic_fire_02_boss" , 0) --執行劇情
			--	say(Boss , "BOW")
				local TempPlayer = SetSearchAllPlayer(RoomID)----找區域所有玩家
				local play123 = {}			
				for i=1,TempPlayer do
					play123[i] = GetSearchResult()
					if ReadRoleValue(play123[i]  , EM_RoleValue_VOC ) ~= 0 then 
						AddBuff(play123[i],621776,0 ,-1 )
						ClockOpen(play123[i] , EM_ClockCheckValue_26 , 300 , 300 , 0 , "ic_fire_Clockclose" , "ic_fire_Clockclose" )
						ic_skill_CD_0(play123[i],498948,0)
						ic_skill_CD_0(play123[i],498949,0)
						ic_skill_CD_0(play123[i],498950,0)
						ic_skill_CD_0(play123[i],498951,0)
					end
				end
				SetAttack(Boss , play)
				AddBuff(play,621797,0 ,-1 )
				ic_All_Boss100_1(781064,Boss,Boss,500)	
				time01=1 
			end	
		end	
		if time00==0 and yes_no==1 then
			ScriptMessage( npc, -1 , 1 , "[SC_IC_FIRE_04]" , 2 )
			WriteRoleValue(npc,EM_RoleValue_register1,0)
			WriteRoleValue(npc,EM_RoleValue_register2,0)
			WriteRoleValue(npc,EM_RoleValue_register7,0)
			SetModeEx( npc , EM_SetModeType_Mark, true)
			SetPlot(npc,"touch","ic_fire_02",20)
		end
	end	
end
function ic_fire_02_bosskk()																---打BOSS用
	if ReadRoleValue(TargetID() , EM_RoleValue_OrgID ) == 106204 then 
		return true
	elseif ReadRoleValue(TargetID() , EM_RoleValue_OrgID ) ~=0 then 
		return false
	end
end
function ic_fire_02_playkk()																---打玩家用   
	if CheckBuff(TargetID(), 621776 ) == true then 
		return true
	elseif CheckBuff(TargetID(), 621776 ) == false then
		return false
	end
end
function ic_fire_02_bossxx()																---惡獸死亡
	local npc=ReadRoleValue(OwnerID(),EM_RoleValue_PID)	
	local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_register5)
	local play30
	local play31
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local TempPlayer = SetSearchAllPlayer(RoomID)----找區域所有玩家
	local play123 = {}																		
	for i=1,TempPlayer do
		play123[i] = GetSearchResult() 
		if ReadRoleValue(play123[i]  , EM_RoleValue_VOC ) ~= 0 then 
			---play31=ReadRoleValue(play123[i], EM_LuaValueFlag_UseItem31 )
			AddRoleValue(play123[i] , EM_LuaValueFlag_UseItem31 , 1 )
			play30=ReadRoleValue(play123[i], EM_LuaValueFlag_UseItem30 )
			play31=ReadRoleValue(play123[i], EM_LuaValueFlag_UseItem31 )
			--say(play123[i] ,"play30="..play30)
			--say(play123[i] ,"play31="..play31)
			ClockClose(play123[i])
			if play30>=1 and play31>=1 and CountBodyItem(play123[i], 530863 )==0 then
				GiveBodyItem( play123[i], 530863, 1 )
				--say(play123[i] ,"1")
			elseif play30>=20 and play31>=20 and CountBodyItem(play123[i], 530864 )==0 then
				GiveBodyItem( play123[i], 530864, 1 )
				--say(play123[i] ,"2")
			end
		end	
	end
	ScriptMessage( npc, -1 , 2 , "[SC_IC_FIRE_06]" , 2 )									---死亡
	local bobo=ic_mob_Rand_noadd( OwnerID() , 106588,0,0) 
	ic_All_bobo(bobo)
	AddToPartition(bobo,RoomID)
	SetModeEx( npc , EM_SetModeType_Mark, true)
	SetPlot(npc,"touch","ic_fire_02",50)
	WriteRoleValue(npc,EM_RoleValue_register1,0)
	WriteRoleValue(npc,EM_RoleValue_register7,0)
	WriteRoleValue(npc,EM_RoleValue_register2,0)
	WriteRoleValue(isaac,EM_RoleValue_register1,0)
	ic_npcXX(0,106205,0,0,0,0,0,0,0,0,0)
	ic_playBUFFXX(0,621776,621797,621798,621774,0,0,0,0,0,0)
	local Search = SearchRangeNPC ( OwnerID() , 400 )
	for i = 0 , table.getn(Search) do
		if Search[i] ~= OwnerID() then
			if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	103900	then
				WriteRoleValue(isaac,EM_RoleValue_register1,0)
			end		
		end
	end
	DelObj(OwnerID())
end
function ic_fire_02_boss()																	---惡獸AI
	local mob=OwnerID()		--Owner是boss，target是玩家
	local npc=ReadRoleValue(mob,EM_RoleValue_PID)	
	local isaac=ReadRoleValue(mob,EM_RoleValue_register5)
	local open=0
	local time1=0
	local time2=0
	local time3=0
	local time4=0
	local boss9898
	local play1x={} 
	local plays=0
	SetPlot(mob,"dead","ic_fire_02_bossxx",0)	
	local CountTime = 0
	while 1 do
		sleep(10)
		local Attack = ReadRoleValue( mob , EM_RoleValue_IsAttackMode)
		boss9898=ReadRoleValue(mob,EM_RoleValue_register9)
		--say(mob,"boss9898="..boss9898)
		if Attack == 0 then --在非戰鬥狀態
			if CountTime == 30 then
				ic_playBUFFXX(0,621776,621797,621798,621774,0,0,0,0,0,0)
				SetModeEx( npc , EM_SetModeType_Mark, true)
				SetPlot(npc,"touch","ic_fire_02",50)
				WriteRoleValue(npc,EM_RoleValue_register1,0)
				WriteRoleValue(npc,EM_RoleValue_register7,0)
				WriteRoleValue(npc,EM_RoleValue_register2,0)
				WriteRoleValue(isaac,EM_RoleValue_register1,0)
				ic_npcXX(0,106205,0,0,0,0,0,0,0,0,0) 
				local Search = SearchRangeNPC ( OwnerID() , 400 )
				for i = 0 , table.getn(Search) do
					if Search[i] ~= OwnerID() then
						if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	103900	then
							WriteRoleValue(isaac,EM_RoleValue_register1,0)
						end		
					end
				end
				DelObj(mob) 
			end
			CountTime = CountTime +1
		elseif Attack == 1 then --戰鬥狀態
			if open==0 then
				open=1
			end
			time1=time1+1
			time2=time2+1
			time3=time3+1
			time4=time4+1
			--say(mob,"time1="..time1)
			if time1>300 or boss9898==1 and open==1 then
				ScriptMessage( mob, -1 , 2 , "[SC_IC_FIRE_07]" , 2 )						---跑走
				local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
				local TempPlayer = SetSearchAllPlayer(RoomID)----找區域所有玩家
				local play123 = {}																		
				for i=1,TempPlayer do
					play123[i] = GetSearchResult() 
					if ReadRoleValue(play123[i]  , EM_RoleValue_VOC ) ~= 0 then 
						ClockClose(play123[i])
						CancelBuff(play123[i], 621776)
						CancelBuff(play123[i], 621797)
						CancelBuff(play123[i], 621798)
						CancelBuff(play123[i], 621774)
					end	
				end
				SetModeEx( npc , EM_SetModeType_Mark, true)
				SetPlot(npc,"touch","ic_fire_02",50)
				WriteRoleValue(npc,EM_RoleValue_register1,0)
				WriteRoleValue(npc,EM_RoleValue_register7,0)
				WriteRoleValue(npc,EM_RoleValue_register2,0)
				WriteRoleValue(isaac,EM_RoleValue_register1,0)
				ic_npcXX(0,106205,0,0,0,0,0,0,0,0,0) 
				local Search = SearchRangeNPC ( OwnerID() , 400 )
				for i = 0 , table.getn(Search) do
					if Search[i] ~= OwnerID() then
						if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	103900	then
							WriteRoleValue(isaac,EM_RoleValue_register1,0)
						end		
					end
				end
				DelObj(mob) 
			end
			if time4>=19 then
				ScriptMessage( mob, -1 , 2 , "[SC_IC_FIRE_08]" , 2 )						---大絕t
				ScriptMessage( mob,-1 , 0 , "[SC_IC_FIRE_08]", C_SYSTEM )
				while 	ReadRoleValue(mob , EM_RoleValue_SpellMagicID  ) ~= 0   do
					sleep(5)
				end
				CastSpellLV( mob, mob, 498953, 0 )
				sleep(30)
				time1=time1+3
				time4=0
			end
			if time3>=5 then
				while 	ReadRoleValue(mob , EM_RoleValue_SpellMagicID  ) ~= 0   do
					sleep(5)
				end
				SetModeEx( mob , EM_SetModeType_Move, false)
				local Player = SearchRangePlayer( mob , 400)
				local Alive = { } 
				for i = 0 , #Player do
					if ReadRoleValue( Player[i] , EM_RoleValue_IsDead) ~= 1 then
						table.insert( Alive , Player[i])
					end
				end
				local R = DW_Rand( #Alive)
				CastSpellLV( mob,Alive[R], 498952,0)				--↑修改成以上寫法 2015/03/10 奈
--				play1x=DW_HateRemain(0)	
--				plays=DW_Rand(#play1x)
--				CastSpellLV( mob,play1x[plays], 498952,0)
				sleep(30)
				time1=time1+3
				SetModeEx( mob , EM_SetModeType_Move, true)	
				time3=0
			end
			if time2>=10 then
				local Player = SearchRangePlayer( mob , 400)
				local Alive = { }
				for i = 0 , #Player do
					if ReadRoleValue( Player[i] , EM_RoleValue_IsDead) ~= 1 then
						table.insert( Alive , Player[i])
					end
				end
				local R = DW_Rand( #Alive)
--				play1x=DW_HateRemain(0)
--				plays=DW_Rand(table.getn(play1x))
				if CheckBuff( Alive[R], 621797 ) == false then	
					SetAttack(mob ,  Alive[R])
					AddBuff( Alive[R] , 621797, 0 , -1 )	--↑修改成以上寫法 2015/03/10 奈
		--		if CheckBuff( play1x[plays], 621797 ) == false then	
		--			SetAttack(mob , play1x[plays])
		--			AddBuff(play1x[plays],621797,0 ,-1 )
					time2=0
					sleep(10)
					time1=time1+1
				end
			end
		end
	end	
end
--------------------------------------------------------------------------------------------
function ic_fire_03()																		---符文獎勵
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 725946,1} }
return BaseTressureProc(   itemset , 1) 
end
function ic_fire_04()																		---A碎片包
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 725952,1} }
return BaseTressureProc(   itemset , 1) 
end
function ic_fire_05()																		---B碎片包
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 725953,1} }
return BaseTressureProc(   itemset , 1) 
end
function LuaI_241012( Option ) --狄司爾召喚之契
	local PlayerID = OwnerID()
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local item1 = CountBodyItem( PlayerID, 241012) 
	local item2 = CountBodyItem( PlayerID, 241013) 
	local item3 = CountBodyItem( PlayerID, 241014) 
	local item4 = CountBodyItem( PlayerID, 241015) 
	local luck=0
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			ScriptMessage( OwnerID(), OwnerID()  , 1 ,"[SC_TREASURE_NOSPACE]" ,0  )--
			ScriptMessage( OwnerID(), OwnerID()  , 0 ,"[SC_TREASURE_NOSPACE]" ,0  )--
			return false
		elseif item1 >= 1 and item2 >=1 and item3 >=1 and item4 >=1  then
			DelBodyItem( PlayerID, 241013, 1) 
			DelBodyItem( PlayerID, 241014, 1) 
			DelBodyItem( PlayerID, 241015, 1) 
			return true
		else
			ScriptMessage( OwnerID(), OwnerID()  , 1 ,"[SC_0908SEANSON_26]" ,0  )--你所持的物品數量不足。
			ScriptMessage( OwnerID(), OwnerID()  , 0 ,"[SC_0908SEANSON_26]" ,0  )--你所持的物品數量不足。
			return false
		end

	elseif ( Option == "USE" ) then		
		Luck=DW_Rand(100)
		if Luck<4 then
			GiveBodyItem( PlayerID ,240917 , 1 )	 --坐騎
		elseif Luck>3 then
			GiveBodyItem( PlayerID ,240916 , 1 )
		end		
	end
end

function ZONE359_BOSS_IN()																	---入口
	SetPlot( OwnerID() , "Collision" , "ZONE359_BOSS_IN_1" , 1 )
end
function ZONE359_BOSS_IN_1()
	All_ZONE_BOSS_IN123(359,359,359,937,450,657,354)
end
function ZONE359_BOSS_OUT()																	---出口
	SetPlot( OwnerID() , "Collision" , "ZONE359_BOSS_OUT_1" , 0 )
end
function ZONE359_BOSS_OUT_1()
	if ChangeZone( OwnerID() ,6,0, -13507 , -630, 4571 , 27 ) then							---出副本後的座標點

	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end	
function ic_fire_Clockclose()	
	ClockClose( OwnerID())
end
function ic_zone2_6_door()																	---傳送門用
SetPlot( OwnerID(),"collision","ic_zone2_6_3",30 ) 
end
function ic_zone6_2_door()																	---傳送門用
SetPlot( OwnerID(),"collision","ic_zone6_2_3_2",30 ) 
end
function ic_zone2_6()
ChangeZone( OwnerID(), 6,0,-13670,-631,4995,150 )
end
function ic_zone6_2()
ChangeZone( OwnerID(), 2,0,2529,12,1280,2 )
end
function ic_zone2_6_3()
	if CheckBuff( OwnerID() , 501570) == true then  --增加檢查判斷
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	else	
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
	end
	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_IC_FIRE_12]")
	DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" )
	DialogSelectStr( OwnerID() , "[SC_CANCEL]" )
	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
		--資料送出有問題s
		return
	end
	for i = 0 , 30 , 1 do
		Sleep( 1 );
		SelectID = DialogGetResult( OwnerID() );
		if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 30 then
			if ( SelectID == 0 ) then
				-- 選是，執行劇情
		ChangeZone(OwnerID(), 6,0,-13670,-631,4995,150 )
				break;
			elseif ( SelectID == 1 ) then
				-- 選否
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				DialogClose( OwnerID() )	
				break
			end
		elseif i == 30 then
			-- 3秒後，自動關閉視窗
			CancelBuff( OwnerID(), 501570 );--最後清除BUFF
			DialogClose( OwnerID() )	
			break
		end
	end
end
function ic_zone6_2_3_2()
	if CheckBuff( OwnerID() , 501570) == true then  --增加檢查判斷
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	else	
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
	end
	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_IC_FIRE_11]")
	DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" )
	DialogSelectStr( OwnerID() , "[SC_CANCEL]" )
	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
		--資料送出有問題s
		return
	end
	for i = 0 , 30 , 1 do
		Sleep( 1 );
		SelectID = DialogGetResult( OwnerID() );
		if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 30 then
			if ( SelectID == 0 ) then
				-- 選是，執行劇情
		ChangeZone( OwnerID(), 2,0,2529,12,1280,2 )
				break;
			elseif ( SelectID == 1 ) then
				-- 選否
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				DialogClose( OwnerID() )	
				break
			end
		elseif i == 30 then
			-- 3秒後，自動關閉視窗
			CancelBuff( OwnerID(), 501570 );--最後清除BUFF
			DialogClose( OwnerID() )	
			break
		end
	end
end
function ic_fire_01_play()																	---? runplot ic_zone2_6_2 自身 口袋歸0 清除稱號
local play=OwnerID()
local play30
local play31
	DelBodyItem(play, 530863 , 1 ) 
	DelBodyItem(play, 530864 , 1 ) 
	play30=ReadRoleValue(play, EM_LuaValueFlag_UseItem30 )
	play31=ReadRoleValue(play, EM_LuaValueFlag_UseItem31 )
	AddRoleValue(play , EM_LuaValueFlag_UseItem30,-play30 )
	AddRoleValue(play , EM_LuaValueFlag_UseItem31,-play31)
	play30=ReadRoleValue(play, EM_LuaValueFlag_UseItem30 )
	play31=ReadRoleValue(play, EM_LuaValueFlag_UseItem31 )
	say(play,"play30="..play30)
	say(play,"play31="..play31)
		
end
function ic_fire_01_play2()				---自身 加1 
local play=OwnerID()
local npc=ReadRoleValue(OwnerID(),EM_RoleValue_PID)	
local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_register5)
local play30
local play31
	AddRoleValue(play , EM_LuaValueFlag_UseItem31,1)
	AddRoleValue(play , EM_LuaValueFlag_UseItem30,1)
	play30=ReadRoleValue(play, EM_LuaValueFlag_UseItem30 )
	play31=ReadRoleValue(play, EM_LuaValueFlag_UseItem31 )
	say(play,"play30="..play30)
	say(play,"play31="..play31)
	if play30>=1 and play31>=1 and CountBodyItem(play,530863 )==0 then
		GiveBodyItem(play, 530863, 1 )
		say(play ,"1")
	elseif play30>=20 and play31>=20 and CountBodyItem(play, 530864 )==0 then
		GiveBodyItem(play, 530864, 1 )
		say(play ,"2")
	end
end
--SC_IC_FIRE_01----隊伍人數不足
--SC_IC_FIRE_02----隊伍人數超過6人
--SC_IC_FIRE_03----身上招換符文不夠
--SC_IC_FIRE_04----無法招換第2之惡獸
--SC_IC_FIRE_05----惡獸出場
--SC_IC_FIRE_06----惡獸死亡
--SC_IC_FIRE_07----惡獸跑走
--SC_IC_FIRE_08----大獸大絕
--SC_IC_FIRE_09----NPC~封印
--SC_IC_FIRE_10----NPC~DOT
function ic_MOB_23_106212_1()--血肉蛆蟲
local mob=OwnerID()
local ZoneID=ic_ReadRoleValue(mob,17)
local Zone={146,147,148}
SetPlot(mob,"dead","ic_MOB_23_99",0 )
	if 		ZoneID==Zone[1] then														
		ic_All_mob_KKplay_1(498439,7,80,5,3,0)
	elseif 	ZoneID==Zone[2] then													
		ic_All_mob_KKplay_1(498439,7,80,5,3,0)
	elseif 	ZoneID==Zone[3] then														
		ic_All_mob_KKplay_1(498439,7,80,5,3,0)
	end
end
function ic_MOB_23_106220_1()--庫勒奇殺手蟻
local mob=OwnerID()
local ZoneID=ic_ReadRoleValue(mob,17)
local Zone={146,147,148}
SetPlot(mob,"dead","ic_MOB_23_99",0 )
	if 		ZoneID==Zone[1] then														
		ic_All_mob_KKplay_3(498309,24,10,5,1,0,
						498304,10,40,11,3,0,
						498306,0,10,20,3,0)
	elseif 	ZoneID==Zone[2] then													
		ic_All_mob_KKplay_3(498309,24,10,5,1,0,
						498304,10,40,11,3,0,
						498306,0,10,20,3,0)
	elseif 	ZoneID==Zone[3] then														
		ic_All_mob_KKplay_3(498309,24,10,5,1,0,
						498304,10,40,11,3,0,
						498306,0,10,20,3,0)
	end
end
function ic_MOB_23_106390_1()--庫勒奇掠奪蟻
local mob=OwnerID()
local ZoneID=ic_ReadRoleValue(mob,17)
local Zone={146,147,148}
SetPlot(mob,"dead","ic_MOB_23_99",0 )
	if 		ZoneID==Zone[1] then														
		ic_All_mob_KKplay_3(498311,399,10,5,3,0,
						498310,0,10,11,2,0,
						498306,0,10,20,3,0)
	elseif 	ZoneID==Zone[2] then													
		ic_All_mob_KKplay_3(498311,399,10,5,3,0,
						498310,0,10,11,2,0,
						498306,0,10,20,3,0)
	elseif 	ZoneID==Zone[3] then														
		ic_All_mob_KKplay_3(498311,399,10,5,3,0,
						498310,0,10,11,2,0,
						498306,0,10,20,3,0)
	end
end
function ic_MOB_23_106534_1()--庫勒奇監軍蟻(106133)
local mob=OwnerID()
local ZoneID=ic_ReadRoleValue(mob,17)
local Zone={146,147,148}
SetPlot(mob,"dead","ic_MOB_23_99",0 )
	if 		ZoneID==Zone[1] then														
		ic_All_mob_KKplay_3(498316,7,30,5,1,0,
						498307,7,10,11,3,0,
						498306,0,10,20,3,0)
	elseif 	ZoneID==Zone[2] then													
		ic_All_mob_KKplay_3(498316,7,30,5,1,0,
						498307,7,10,11,3,0,
						498306,0,10,20,3,0)
	elseif 	ZoneID==Zone[3] then														
		ic_All_mob_KKplay_3(498316,7,30,5,1,0,
						498307,7,10,11,3,0,
						498306,0,10,20,3,0)
	end
end
function ic_MOB_23_106846_1()--貝琳琴之子(106124)
local mob=OwnerID()
local ZoneID=ic_ReadRoleValue(mob,17)
local Zone={146,147,148}
SetPlot(mob,"dead","ic_MOB_23_99",0 )
	if 		ZoneID==Zone[1] then														
		ic_All_mob_KKplay_4(498319,1500,5,5,2,0,
						498318,4,20,11,3,0,
						498314,100,10,15,3,0,
						498320,0,30,20,3,0)
	elseif 	ZoneID==Zone[2] then													
		ic_All_mob_KKplay_4(498319,1500,5,5,2,0,
						498318,4,20,11,3,0,
						498314,100,10,15,3,0,
						498320,0,30,20,3,0)
	elseif 	ZoneID==Zone[3] then														
		ic_All_mob_KKplay_4(498319,1500,5,5,2,0,
						498318,4,20,11,3,0,
						498314,100,10,15,3,0,
						498320,0,30,20,3,0)
	end
end
function ic_MOB_23_106553_1()--庫勒奇監軍蟻(互打)
local mob=OwnerID()
local ZoneID=ic_ReadRoleValue(mob,17)
local Zone={146,147,148}
SetPlot(mob,"dead","ic_MOB_23_99",0 )
	if 		ZoneID==Zone[1] then														
		ic_All_mob_KKplay_1(498316,7,20,5,3,0)
	elseif 	ZoneID==Zone[2] then													
		ic_All_mob_KKplay_1(498316,7,20,5,3,0)
	elseif 	ZoneID==Zone[3] then														
		ic_All_mob_KKplay_1(498316,7,20,5,3,0)
	end
end
function ic_MOB_23_106551_1()--庫勒奇殺手蟻(互打)
local mob=OwnerID()
local ZoneID=ic_ReadRoleValue(mob,17)
local Zone={146,147,148}
SetPlot(mob,"dead","ic_MOB_23_99",0 )
	if 		ZoneID==Zone[1] then														
		ic_All_mob_KKplay_1(498304,10,15,5,1,0)
	elseif 	ZoneID==Zone[2] then													
		ic_All_mob_KKplay_1(498304,10,15,5,1,0)
	elseif 	ZoneID==Zone[3] then														
		ic_All_mob_KKplay_1(498304,10,15,5,1,0)
	end
end
function ic_MOB_23_4_5()--無視裝死--共用
	AddBuff(OwnerID(),620908,0 ,-1 )
end
function ic_MOB_23_99()
	local isaac=OwnerID()
	local luck
	local mob
	local ZoneID=ic_ReadRoleValue(isaac,17)
	local Zone={146,147,148}	
	luck=DW_Rand(10)
	if luck==5 then
		local mob1={106891,106891,106891}--土
		local mob2={106892,106892,106892}--風
		local mob3={106893,106893,106893}--水
		local mob4={106894,106894,106894}--火
		local buff={622654,622655,622656,622657}
		local luck1
		local mobdir=ic_ReadRoleValue(isaac,16)
		luck1=DW_Rand(4)
		ScriptMessage(isaac,0,2,"[SC_ELEMENT_03]",0)
		AddBuff(isaac,buff[luck1],0 ,-1 )
		if 		luck1==1 then
			if 		ZoneID==Zone[1] then														
				mob=ic_mob_Rand_add(isaac, mob1[1] ,mobdir,0)
			elseif 	ZoneID==Zone[2] then													
				mob=ic_mob_Rand_add(isaac, mob1[2] ,mobdir,0)
			elseif 	ZoneID==Zone[3] then														
				mob=ic_mob_Rand_add(isaac, mob1[3] ,mobdir,0)
			end
			BeginPlot(mob,"ic_MOB_23_99_1" , 0)	
		elseif 	luck1==2 then
			if 		ZoneID==Zone[1] then														
				mob=ic_mob_Rand_add(isaac, mob2[1] ,mobdir,0)
			elseif 	ZoneID==Zone[2] then													
				mob=ic_mob_Rand_add(isaac, mob2[2] ,mobdir,0)
			elseif 	ZoneID==Zone[3] then														
				mob=ic_mob_Rand_add(isaac, mob2[3] ,mobdir,0)
			end
			BeginPlot(mob,"ic_MOB_23_99_2" , 0)
		elseif 	luck1==3 then
			if 		ZoneID==Zone[1] then														
				mob=ic_mob_Rand_add(isaac, mob3[1] ,mobdir,0)
			elseif 	ZoneID==Zone[2] then													
				mob=ic_mob_Rand_add(isaac, mob3[2] ,mobdir,0)
			elseif 	ZoneID==Zone[3] then														
				mob=ic_mob_Rand_add(isaac, mob3[3] ,mobdir,0)
			end
			BeginPlot(mob,"ic_MOB_23_99_3" , 0)
		elseif 	luck1==4 then
			if 		ZoneID==Zone[1] then														
				mob=ic_mob_Rand_add(isaac, mob4[1] ,mobdir,0)
			elseif 	ZoneID==Zone[2] then													
				mob=ic_mob_Rand_add(isaac, mob4[2] ,mobdir,0)
			elseif 	ZoneID==Zone[3] then														
				mob=ic_mob_Rand_add(isaac, mob4[3] ,mobdir,0)
			end
			BeginPlot(mob,"ic_MOB_23_99_4" , 0)
		end
	elseif luck<4 then
		local RoomID=ReadRoleValue(isaac,EM_RoleValue_RoomID)
		local mob=ic_mob_Rand_noadd( isaac , 106889 ,0,0)
		ic_All_nolook_00(mob)
		WriteRoleValue(mob, EM_RoleValue_Livetime,2)
		AddToPartition(mob,RoomID)
		ScriptMessage(isaac,0,2,"[SC_ELEMENT_04]",0)
		CastSpellLv( mob, mob, 499290,49)
	end
end
function ic_MOB_23_99_1()---106869
	ic_All_mob_KKplay_2(850226,29,10,3,2,0,
						850227,0,10,7,3,0)
end
function ic_MOB_23_99_2()---106870
	ic_All_mob_KKplay_2(850228,29,10,3,2,0,
						850229,0,40,7,2,0)
end
function ic_MOB_23_99_3()---106871
local mob=OwnerID()
local time1=0
local time2=0
local ZoneID=ic_ReadRoleValue(mob,17)
local Zone={146,147,148}	
	while true do
		if hatelistcount(mob)==0 then
			time1=0
			time2=0
		elseif hatelistcount(mob)~=0 then
			time1=time1+1
			time2=time2+1
			if time1>2 then
				ic_magic_ing(mob,5)
				ic_All_mob_KK123(mob,2,0,850230,29,10,0,0,0)
				time1=0
			end
			if time2>6 then
				ic_All_mob_KK123(mob,3,0,850234,0,0,0,0,0)
				ic_magic_ing(mob,5)
				if CheckBuff(mob, 622681 ) == true then
					if 		ZoneID==Zone[1] then														
						ic_playkk_Rand_1_6(mob,3,0,850231,0)
					elseif 	ZoneID==Zone[2] then													
						ic_playkk_Rand_1_6(mob,3,0,850231,0)
					elseif 	ZoneID==Zone[3] then														
						ic_playkk_Rand_1_6(mob,6,0,850231,0)
					end
				end
				time2=0
			end
		end	
			sleep(10)
	end
end
function ic_MOB_23_99_4()---106872
local mob=OwnerID()
local time1=0
local time2=0
local ZoneID=ic_ReadRoleValue(mob,17)
local Zone={146,147,148}
	while true do
		if hatelistcount(mob)==0 then
			time1=0
			time2=0
		elseif hatelistcount(mob)~=0 then
			time1=time1+1
			time2=time2+1
			if time1>2 then
				ic_magic_ing(mob,5)
				ic_All_mob_KK123(mob,2,0,850232,29,10,0,0,0)
				time1=0
			end
			if time2>6 then
				ic_All_mob_KK123(mob,3,0,850235,0,0,0,0,0)
				ic_magic_ing(mob,5)
				if CheckBuff(mob, 622682 ) == true then
					if 		ZoneID==Zone[1] then														
						ic_playkk_Rand_1_6(mob,3,0,850233,29)
					elseif 	ZoneID==Zone[2] then													
						ic_playkk_Rand_1_6(mob,3,0,850233,29)
					elseif 	ZoneID==Zone[3] then														
						ic_playkk_Rand_1_6(mob,6,0,850233,29)
					end
				end
				time2=0
			end	
		end	
			sleep(10)
	end
end
function ic_23_mobnokk()---路上小怪 死亡爆炸用--共用
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local mob10 = ic_mob_Rand_noadd( OwnerID() , 106219 ,0,0)
	ic_MOB_23_99()
	ic_All_nolook_00(mob10)
	AddToPartition(mob10,RoomID)
	WriteRoleValue( mob10, EM_RoleValue_Livetime, 5)				--存在秒數
	CastSpellLv(mob10,mob10,498332,0)
end
------------------------------------------------------------------------------------------------------------------------以上沒狀態小怪技能
function ic_MOB_23_106218_1()---小怪用匯對自己放減傷BUFF(魔法物理有機會共存)庫勒奇巡邏蟻(拿刀)
local mob=OwnerID()
local ZoneID=ic_ReadRoleValue(mob,17)
local Zone={146,147,148}
local buff1={620911,620911,620911}--物理
local buff2={620912,620911,620911}--魔法
local time0=0
local time1=0
local time2=0
local time3=0
local time4=0
local play1x={} 
local plays=0
local Luck=0
local AttackTarget 
SetPlot(mob,"dead","ic_23_mobnokk",0 )	--免改
	if 		ZoneID==Zone[1] then														
		ic_WriteRoleValue(mob,0,1)
	elseif 	ZoneID==Zone[2] then													
		ic_WriteRoleValue(mob,0,2)
	elseif 	ZoneID==Zone[3] then														
		ic_WriteRoleValue(mob,0,3)
	end
	local play_Mode=ic_ReadRoleValue(mob,0)----[play_Mode]
	while true do
		if hatelistcount(mob)==0 then
			time1=0
			time2=0
			time3=0
			time4=0
		elseif hatelistcount(mob)~=0 then
			AttackTarget = ReadRoleValue(mob, EM_RoleValue_AttackTargetID )
			time1=time1+1
			time3=time3+1
			time4=time4+1
			if time1>=7 then--自己放BUFF
				if CheckBuff(mob, buff1[play_Mode] ) == true and 
				   CheckBuff(mob, buff2[play_Mode] ) == true and time0==0		then
					CancelBuff(mob, buff2[play_Mode])
					CancelBuff(mob, buff1[play_Mode])
					time0=1	
				elseif CheckBuff(mob, buff1[play_Mode] ) == true and time0==0	then--物理減傷
					CancelBuff(mob, buff1[play_Mode])
					time0=1	
				elseif CheckBuff(mob, buff2[play_Mode] ) == true and time0==0	then--魔法減傷
					CancelBuff(mob, buff2[play_Mode])
					time0=1	
				end
				Luck=DW_Rand(3)
				if Luck==1 then
					AddBuff(mob,buff1[play_Mode],0 ,-1 )
					time1=0
					time0=0	
				elseif	Luck==2 then
					AddBuff(mob,buff2[play_Mode],0 ,-1 )
					time1=0
					time0=0	
				elseif	Luck==3 then
					AddBuff(mob,buff1[play_Mode],0 ,-1 )
					AddBuff(mob,buff2[play_Mode],0 ,-1 )
					sleep(10)
					time1=0
					time0=0						
				end
			end
			if time3>=11 then--範圍技能
				ic_magic_ing(mob,5)
				if 		play_Mode==1 then												
					CastSpellLV(mob,mob, 498306 , 0 )
				elseif 	play_Mode==2 then
					CastSpellLV(mob,mob, 498306 , 0 )
				elseif 	play_Mode==3 then
					CastSpellLV(mob,mob, 498306 , 0 )
				end
				sleep(10)
				time3=0
			end
			if time4>=5 then--單體
				ic_magic_ing(mob,5)
				if 		play_Mode==1 then												
					CastSpellLV(mob,AttackTarget , 498304 ,7)
				elseif 	play_Mode==2 then
					CastSpellLV(mob,AttackTarget , 498304 ,7)
				elseif 	play_Mode==3 then
					CastSpellLV(mob,AttackTarget , 498304 ,7)
				end
				sleep(40)
				time4=0
			end
		end
		sleep(10)
	end	
end
function ic_MOB_23_106217_1()---小怪用匯對自己放減傷BUFF(魔法物理有機會共存)庫勒奇巡邏蟻(長矛)
local mob=OwnerID()
local ZoneID=ic_ReadRoleValue(mob,17)
local Zone={146,147,148}
local buff1={620911,620911,620911}--物理
local buff2={620912,620911,620911}--魔法
local time0=0
local time1=0
local time2=0
local time3=0
local time4=0
local play1x={} 
local plays=0
local Luck=0
local AttackTarget 
SetPlot(mob,"dead","ic_23_mobnokk",0 )--免改
	if 		ZoneID==Zone[1] then														
		ic_WriteRoleValue(mob,0,1)
	elseif 	ZoneID==Zone[2] then													
		ic_WriteRoleValue(mob,0,2)
	elseif 	ZoneID==Zone[3] then														
		ic_WriteRoleValue(mob,0,3)
	end
	local play_Mode=ic_ReadRoleValue(mob,0)
	while true do
		if hatelistcount(mob)==0 then
			time1=0
			time2=0
			time3=0
			time4=0
		elseif hatelistcount(mob)~=0 then
			AttackTarget = ReadRoleValue(mob, EM_RoleValue_AttackTargetID )
			time1=time1+1
			time3=time3+1
			time4=time4+1
			if time1>=7 then--自己放BUFF
				if CheckBuff(mob, buff1[play_Mode] ) == true and 
				   CheckBuff(mob, buff2[play_Mode] ) == true and time0==0		then
					CancelBuff(mob, buff2[play_Mode])
					CancelBuff(mob, buff1[play_Mode])
					time0=1	
				elseif CheckBuff(mob, buff1[play_Mode] ) == true and time0==0	then--物理減傷
					CancelBuff(mob, buff1[play_Mode])
					time0=1	
				elseif CheckBuff(mob, buff2[play_Mode] ) == true and time0==0	then--魔法減傷
					CancelBuff(mob, buff2[play_Mode])
					time0=1	
				end
				Luck=DW_Rand(3)
				if Luck==1 then
					AddBuff(mob,buff1[play_Mode],0 ,-1 )
					time1=0
					time0=0	
				elseif	Luck==2 then
					AddBuff(mob,buff2[play_Mode],0 ,-1 )
					time1=0
					time0=0	
				elseif	Luck==3 then
					AddBuff(mob,buff1[play_Mode],0 ,-1 )
					AddBuff(mob,buff2[play_Mode],0 ,-1 )
					time1=0
					time0=0						
				end
			end
			if time3>=11 then--範圍技能
				ic_magic_ing(mob,5)
				if 		play_Mode==1 then												
					CastSpellLV(mob,mob, 498306 , 0 )
				elseif 	play_Mode==2 then
					CastSpellLV(mob,mob, 498306 , 0 )
				elseif 	play_Mode==3 then
					CastSpellLV(mob,mob, 498306 , 0 )
				end
				sleep(10)
				time3=0
			end
			if time4>=5 then--單體
				ic_magic_ing(mob,5)
				if 		play_Mode==1 then												
					CastSpellLV(mob,AttackTarget , 498442 ,24)
				elseif 	play_Mode==2 then
					CastSpellLV(mob,AttackTarget , 498442 ,24)
				elseif 	play_Mode==3 then
					CastSpellLV(mob,AttackTarget , 498442 ,24)
				end
				sleep(70)
				time4=0
			end
		end
		sleep(10)
	end	
end
function ic_MOB_23_106214_1()---小怪用匯對自己放減傷BUFF(魔法物理有機會共存)庫勒奇孵育蟻 
local mob=OwnerID()
local ZoneID=ic_ReadRoleValue(mob,17)
local Zone={146,147,148}
local buff1={620911,620911,620911}--物理
local buff2={620912,620911,620911}--魔法
local time0=0
local time1=0
local time2=0
local time3=0
local time4=0
local play1x={} 
local plays=0
local Luck=0
local AttackTarget 
SetPlot(mob,"dead","ic_MOB_23_99",0 )
	if 		ZoneID==Zone[1] then														
		ic_WriteRoleValue(mob,0,1)
	elseif 	ZoneID==Zone[2] then													
		ic_WriteRoleValue(mob,0,2)
	elseif 	ZoneID==Zone[3] then														
		ic_WriteRoleValue(mob,0,3)
	end
	local play_Mode=ic_ReadRoleValue(mob,0)
	while true do
		if hatelistcount(mob)==0 then
			time1=0
			time2=0
			time3=0
			time4=0
		elseif hatelistcount(mob)~=0 then
			AttackTarget = ReadRoleValue(mob, EM_RoleValue_AttackTargetID )
			time1=time1+1
			time3=time3+1
			time4=time4+1
			if time1>=7 then--自己放BUFF
				if CheckBuff(mob, buff1[play_Mode] ) == true and 
				   CheckBuff(mob, buff2[play_Mode] ) == true and time0==0		then
					CancelBuff(mob, buff2[play_Mode])
					CancelBuff(mob, buff1[play_Mode])
					time0=1	
				elseif CheckBuff(mob, buff1[play_Mode] ) == true and time0==0	then--物理減傷
					CancelBuff(mob, buff1[play_Mode])
					time0=1	
				elseif CheckBuff(mob, buff2[play_Mode] ) == true and time0==0	then--魔法減傷
					CancelBuff(mob, buff2[play_Mode])
					time0=1	
				end
				Luck=DW_Rand(3)
				if Luck==1 then
					AddBuff(mob,buff1[play_Mode],0 ,-1 )
					time1=0
					time0=0	
				elseif	Luck==2 then
					AddBuff(mob,buff2[play_Mode],0 ,-1 )
					time1=0
					time0=0	
				elseif	Luck==3 then
					AddBuff(mob,buff1[play_Mode],0 ,-1 )
					AddBuff(mob,buff2[play_Mode],0 ,-1 )
					time1=0
					time0=0						
				end
			end
			if time3>=11 then--範圍技能
				ic_magic_ing(mob,5)
				if 		play_Mode==1 then												
					CastSpellLV(mob,mob, 498306 , 0 )
				elseif 	play_Mode==2 then
					CastSpellLV(mob,mob, 498306 , 0 )
				elseif 	play_Mode==3 then
					CastSpellLV(mob,mob, 498306 , 0 )
				end
				sleep(10)
				time3=0
			end
			if time4>=5 then--單體
				ic_magic_ing(mob,5)
				if 		play_Mode==1 then												
					CastSpellLV(mob,AttackTarget , 498317 ,24)
				elseif 	play_Mode==2 then
					CastSpellLV(mob,AttackTarget , 498317 ,24)
				elseif 	play_Mode==3 then
					CastSpellLV(mob,AttackTarget , 498317 ,24)
				end
				sleep(10)
				time4=0
			end
		end
		sleep(10)
	end	
end
function ic_MOB_23_106216_1()---小怪用匯對自己放減傷BUFF(魔法減傷)(2王-3王)庫勒奇運屍蟻
local mob=OwnerID()
local ZoneID=ic_ReadRoleValue(mob,17)
local Zone={146,147,148}
local buff1={620911,620911,620911}--物理
local buff2={620912,620911,620911}--魔法
local time0=0
local time1=0
local time2=0
local time3=0
local time4=0
local play1x={} 
local plays=0
local Luck=0
local AttackTarget 
SetPlot(mob,"dead","ic_MOB_23_99",0 )
	if 		ZoneID==Zone[1] then														
		ic_WriteRoleValue(mob,0,1)
	elseif 	ZoneID==Zone[2] then													
		ic_WriteRoleValue(mob,0,2)
	elseif 	ZoneID==Zone[3] then														
		ic_WriteRoleValue(mob,0,3)
	end
	local play_Mode=ic_ReadRoleValue(mob,0)
	while true do
		if hatelistcount(mob)==0 then
			time1=0
			time2=0
			time3=0
			time4=0
		elseif hatelistcount(mob)~=0 then
			AttackTarget = ReadRoleValue(mob, EM_RoleValue_AttackTargetID )
			time1=time1+1
			time2=time2+1
			time3=time3+1
			if time1>=7 and time0==0 then--自己放BUFF
				time1=0
				if time0==0 then
					AddBuff(mob,buff2[play_Mode],0 ,-1 )
					time0=1
				end
			end
			if time2>=11 then--隨機目標
				ic_magic_ing(mob,5)
				if 		play_Mode==1 then												
					CastSpellLV(mob,mob, 498306 , 0 )
				elseif 	play_Mode==2 then
					CastSpellLV(mob,mob, 498306 , 0 )
				elseif 	play_Mode==3 then
					CastSpellLV(mob,mob, 498306 , 0 )
				end
				sleep(40)
				time2=0
			end
			if time3>=5 then--範圍技能
				ic_magic_ing(mob,5)
				if 		play_Mode==1 then												
					CastSpellLV(mob,mob, 498311 ,799)
				elseif 	play_Mode==2 then
					CastSpellLV(mob,mob, 498311 ,799)
				elseif 	play_Mode==3 then
					CastSpellLV(mob,mob, 498311 ,799)
				end
				sleep(10)
				time3=0
			end
		end
		sleep(10)
	end	
end
function ic_MOB_23_106215_1()---小怪用匯對自己放減傷BUFF(物理減傷)(3王-4王)庫勒奇碎屍蟻
local mob=OwnerID()
local ZoneID=ic_ReadRoleValue(mob,17)
local Zone={146,147,148}
local buff1={620911,620911,620911}--物理
local buff2={620912,620911,620911}--魔法
local time0=0
local time1=0
local time2=0
local time3=0
local time4=0
local time5=0
local play1x={} 
local plays=0
local Luck=0
local AttackTarget
SetPlot(mob,"dead","ic_MOB_23_99",0 )
	if 		ZoneID==Zone[1] then														
		ic_WriteRoleValue(mob,0,1)
	elseif 	ZoneID==Zone[2] then													
		ic_WriteRoleValue(mob,0,2)
	elseif 	ZoneID==Zone[3] then														
		ic_WriteRoleValue(mob,0,3)
	end
	local play_Mode=ic_ReadRoleValue(mob,0)
	while true do
		if hatelistcount(mob)==0 then
			time1=0
			time2=0
			time3=0
			time4=0
			if time5==0 then
				Luck=DW_Rand(6)
				SetIdleMotion(mob,ruFUSION_ACTORSTATE_CAST_SP01) 
				sleep(Luck*5)
			end	
		elseif hatelistcount(mob)~=0 then
			AttackTarget = ReadRoleValue(mob, EM_RoleValue_AttackTargetID )
			time1=time1+1
			time3=time3+1
			time4=time4+1
			time5=1
			if time1>=7  then--自己放BUFF
				time1=0
				if time0==0 then
					AddBuff(mob,buff1[play_Mode],0 ,-1 )
					time0=1
				end					
			end
			if time3>=11 then--範圍技能
				ic_magic_ing(mob,5)
				if 		play_Mode==1 then												
					CastSpellLV(mob,mob, 498306 , 0 )
				elseif 	play_Mode==2 then
					CastSpellLV(mob,mob, 498306 , 0 )
				elseif 	play_Mode==3 then
					CastSpellLV(mob,mob, 498306 , 0 )
				end
				sleep(10)
				time3=0
			end
			if time4>=5 then--單體
				ic_magic_ing(mob,5)
				if 		play_Mode==1 then												
					CastSpellLV(mob,AttackTarget , 498441 ,29)
				elseif 	play_Mode==2 then
					CastSpellLV(mob,AttackTarget , 498441 ,29)
				elseif 	play_Mode==3 then
					CastSpellLV(mob,AttackTarget , 498441 ,29)
				end
				sleep(70)
				time4=0
			end
		end
		sleep(10)
	end	
end
function ic_MOB_23_106213_1()---小怪用匯對自己放減傷BUFF(物理減傷+魔法減傷)(4王-5王)貝琳琴之女 
local mob=OwnerID()
local ZoneID=ic_ReadRoleValue(mob,17)
local Zone={146,147,148}
local buff1={620911,620911,620911}--物理
local buff2={620912,620911,620911}--魔法
local time0=0
local time1=0
local time2=0
local time3=0
local time4=0
local play1x={} 
local plays=0
local Luck=0
local AttackTarget
SetPlot(mob,"dead","ic_MOB_23_99",0 )
	if 		ZoneID==Zone[1] then														
		ic_WriteRoleValue(mob,0,1)
	elseif 	ZoneID==Zone[2] then													
		ic_WriteRoleValue(mob,0,2)
	elseif 	ZoneID==Zone[3] then														
		ic_WriteRoleValue(mob,0,3)
	end
	local play_Mode=ic_ReadRoleValue(mob,0)
	while true do
		if hatelistcount(mob)==0 then
			time1=0
			time2=0
			time3=0
			time4=0
		elseif hatelistcount(mob)~=0 then
			AttackTarget = ReadRoleValue(mob, EM_RoleValue_AttackTargetID )
			time1=time1+1
			time2=time2+1
			time3=time3+1
			time4=time4+1
			if time1>=7 and time0==0 then--自己放BUFF
				ic_magic_ing(mob,5)
				AddBuff(mob,buff1[play_Mode],0 ,-1 )
				AddBuff(mob,buff2[play_Mode],0 ,-1 )
				time0=1
			end
			if time2>=13 then--隨機目標
				ic_magic_ing(mob,5)
				if 		play_Mode==1 then												
					CastSpellLV(mob,mob, 498306 , 0 )
				elseif 	play_Mode==2 then
					CastSpellLV(mob,mob, 498306 , 0 )
				elseif 	play_Mode==3 then
					CastSpellLV(mob,mob, 498306 , 0 )
				end
				sleep(40)
				time2=0
			end
			if time3>=9 then--範圍技能
				ic_magic_ing(mob,5)
				if 		play_Mode==1 then												
					CastSpellLV(mob,mob,498313,3)
				elseif 	play_Mode==2 then
					CastSpellLV(mob,mob,498313,3)
				elseif 	play_Mode==3 then
					CastSpellLV(mob,mob,498313,3)
				end
				sleep(10)
				time3=0
			end
			if time4>=5 then--單體
				ic_magic_ing(mob,5)
				if 		play_Mode==1 then												
					CastSpellLV(mob,mob,498440,7)
				elseif 	play_Mode==2 then
					CastSpellLV(mob,mob,498440,7)
				elseif 	play_Mode==3 then
					CastSpellLV(mob,mob,498440,7)
				end
				sleep(40)
				time4=0
			end
		end
		sleep(10)
	end	
end
------------------------------------------------------------------------------------------------------------------------上面有狀態小怪技能
function ic_MOBALL_23_1_1()																	---庫勒奇警戒蟻
local isaac=OwnerID()															--- 小怪號碼
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob1
local mob2
local mob1xx=0
local mob2xx=0
local time1=0
local open=0
local time2
local mob_id={106159,106159,106159}
local ZoneID=ic_ReadRoleValue(isaac,17)														---哪區域
local Zone={146,147,148}
	if 		ZoneID==Zone[1] then														
		ic_WriteRoleValue(isaac,10,1)
	elseif 	ZoneID==Zone[2] then													
		ic_WriteRoleValue(isaac,10,2)
	elseif 	ZoneID==Zone[3] then														
		ic_WriteRoleValue(isaac,10,3)
	end
	local play_Mode=ic_ReadRoleValue(isaac,10)
	time2=ReadRoleValue(isaac,EM_RoleValue_PID)
	if time2==1 then--4王房間
		mob1=ic_mob_flag_add_Y_N( isaac,mob_id[play_Mode],781014,811,1)
		mob2=ic_mob_flag_add_Y_N( isaac,mob_id[play_Mode],781014,812,1)
	elseif time2==2 then--5王門口
		mob1=ic_mob_flag_add_Y_N( isaac,mob_id[play_Mode],781014,831,1)
		mob2=ic_mob_flag_add_Y_N( isaac,mob_id[play_Mode],781014,832,1)
	elseif time2==3 then--5王門口
		mob1=ic_mob_flag_add_Y_N( isaac,mob_id[play_Mode],781014,841,1)
		mob2=ic_mob_flag_add_Y_N( isaac,mob_id[play_Mode],781014,842,1)
	end
	WriteRoleValue(mob1,EM_RoleValue_register1,isaac)
	WriteRoleValue(mob2,EM_RoleValue_register1,isaac)
	SetPlot( mob1,"dead","ic_MOBALL_23_12_mob1xx_1",0 )--免改
	SetPlot( mob2,"dead","ic_MOBALL_23_12_mob2xx_1",0 )--免改
	BeginPlot(mob1 , "ic_MOBALL_23_1mob12KK_1" , 0)
	BeginPlot(mob2 , "ic_MOBALL_23_1mob12KK_1" , 0)
	while true do
		mob1xx=ReadRoleValue(isaac , EM_RoleValue_register1)
		mob2xx=ReadRoleValue(isaac , EM_RoleValue_register2)
		if mob1xx==1 and mob2xx==1 and open==1 then
				sleep(20)
				break
		end
		if  hatelistcount(mob1)~=0 or hatelistcount(mob2)~=0 and open==0 then
			open=1
		end
		if mob1xx==1 and time1==0 and open==1  then
			if 		play_Mode==1 then												
				AddBuff(mob2,620913,0 ,-1 )
			elseif 	play_Mode==2 then
				AddBuff(mob2,620913,0 ,-1 )
			elseif 	play_Mode==3 then
				AddBuff(mob2,620913,0 ,-1 )
			end
			time1=1 
		end
		if mob2xx==1 and time1==0 and open==1 then
			if 		play_Mode==1 then												
				AddBuff(mob1,620913,0 ,-1 )
			elseif 	play_Mode==2 then
				AddBuff(mob1,620913,0 ,-1 )
			elseif 	play_Mode==3 then
				AddBuff(mob1,620913,0 ,-1 )
			end
			time1=1 
			--say(OwnerID(),"2xx")
		end
		if  mob1xx==1 and open==0 or mob2xx==1 and open==0 then
			DelObj(mob1)
			DelObj(mob2)
			sleep(20)
			WriteRoleValue(isaac,EM_RoleValue_register1,0)
			WriteRoleValue(isaac,EM_RoleValue_register2,0)
			time2=ReadRoleValue(isaac,EM_RoleValue_PID)
			if time2==1 then
				mob1=ic_mob_flag_add_Y_N( isaac,mob_id[play_Mode],781014,811,1)
				mob2=ic_mob_flag_add_Y_N( isaac,mob_id[play_Mode],781014,812,1)
			elseif time2==2 then
				mob1=ic_mob_flag_add_Y_N( isaac,mob_id[play_Mode],781014,831,1)
				mob2=ic_mob_flag_add_Y_N( isaac,mob_id[play_Mode],781014,832,1)
			elseif time2==3 then
				mob1=ic_mob_flag_add_Y_N( isaac,mob_id[play_Mode],781014,841,1)
				mob2=ic_mob_flag_add_Y_N( isaac,mob_id[play_Mode],781014,842,1)
			end
			WriteRoleValue(mob1,EM_RoleValue_register1,isaac)
			WriteRoleValue(mob2,EM_RoleValue_register1,isaac)
			SetPlot( mob1,"dead","ic_MOBALL_23_12_mob1xx_1",0 )--免改
			SetPlot( mob2,"dead","ic_MOBALL_23_12_mob2xx_1",0 )--免改
			BeginPlot(mob1 , "ic_MOBALL_23_1mob12KK_1" , 0)
			BeginPlot(mob2 , "ic_MOBALL_23_1mob12KK_1" , 0)
			time1=0
			open=0
		end
		if  hatelistcount(mob1)==0 and ReadRoleValue(mob2,EM_RoleValue_IsDead)== 1 and open==1 and ReadRoleValue(mob1,EM_RoleValue_IsDead)== 0 or 
			hatelistcount(mob2)==0 and ReadRoleValue(mob1,EM_RoleValue_IsDead)== 1 and open==1 and ReadRoleValue(mob2,EM_RoleValue_IsDead)== 0 or
			hatelistcount(mob1)==0 and ReadRoleValue(mob1,EM_RoleValue_IsDead)== 0 and open==1 and 
			hatelistcount(mob2)==0 and ReadRoleValue(mob2,EM_RoleValue_IsDead)== 0 and open==1 then
			DelObj(mob1)
			DelObj(mob2)
			sleep(20)
			WriteRoleValue(isaac,EM_RoleValue_register1,0)
			WriteRoleValue(isaac,EM_RoleValue_register2,0)
			time2=ReadRoleValue(isaac,EM_RoleValue_PID)
			if time2==1 then
				mob1=ic_mob_flag_add_Y_N( isaac,mob_id[play_Mode],781014,811,1)
				mob2=ic_mob_flag_add_Y_N( isaac,mob_id[play_Mode],781014,812,1)
			elseif time2==2 then
				mob1=ic_mob_flag_add_Y_N( isaac,mob_id[play_Mode],781014,831,1)
				mob2=ic_mob_flag_add_Y_N( isaac,mob_id,781014,832,1)
			elseif time2==3 then
				mob1=ic_mob_flag_add_Y_N( isaac,mob_id[play_Mode],781014,841,1)
				mob2=ic_mob_flag_add_Y_N( isaac,mob_id[play_Mode],781014,842,1)
			end
			WriteRoleValue(mob1,EM_RoleValue_register1,isaac)
			WriteRoleValue(mob2,EM_RoleValue_register1,isaac)
			SetPlot( mob1,"dead","ic_MOBALL_23_12_mob1xx_1",0 )--免改
			SetPlot( mob2,"dead","ic_MOBALL_23_12_mob2xx_1",0 )--免改
			BeginPlot(mob1 , "ic_MOBALL_23_1mob12KK_1" , 0)
			BeginPlot(mob2 , "ic_MOBALL_23_1mob12KK_1" , 0)
			time1=0
			open=0
		end
		sleep(10)
	end
end
function ic_MOBALL_23_1mob12KK_1()--守衛技能ok--庫勒奇警戒蟻
local mob=OwnerID()
local ZoneID=ic_ReadRoleValue(mob,17)
local Zone={146,147,148}
	if 		ZoneID==Zone[1] then														
		ic_All_mob_KKplay_4(498308,0,30,5,2,0,
						498305,5,10,11,3,0,
						498306,0,10,20,3,0,
						498312,0,30,17,2,0)
	elseif 	ZoneID==Zone[2] then													
		ic_All_mob_KKplay_4(498308,0,30,5,2,0,
						498305,5,10,11,3,0,
						498306,0,10,20,3,0,
						498312,0,30,17,2,0)
	elseif 	ZoneID==Zone[3] then														
		ic_All_mob_KKplay_4(498308,0,30,5,2,0,
						498305,5,10,11,3,0,
						498306,0,10,20,3,0,
						498312,0,30,17,2,0)
	end										
end
function ic_MOBALL_23_12_mob1xx_1()--守衛死													---共用
local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
	WriteRoleValue(isaac,EM_RoleValue_register1,1)
	ic_MOB_23_99()
end
function ic_MOBALL_23_12_mob2xx_1()--守衛死													---共用
local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
	WriteRoleValue(isaac,EM_RoleValue_register2,1)
	ic_MOB_23_99()
end
function ic_MOBALL_23_2_1()																	---庫勒奇掠奪蟻
local isaac=OwnerID()
local mob_id=106160																			---小怪號碼
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob1
local mob2
local mob1xx=0
local mob2xx=0
local time1=0
local open=0
local time2
local mob_id={106160,106160,106160}
local ZoneID=ic_ReadRoleValue(isaac,17)														---哪區域
local Zone={146,147,148}
	if 		ZoneID==Zone[1] then														
		ic_WriteRoleValue(isaac,10,1)
	elseif 	ZoneID==Zone[2] then													
		ic_WriteRoleValue(isaac,10,2)
	elseif 	ZoneID==Zone[3] then														
		ic_WriteRoleValue(isaac,10,3)
	end
	local play_Mode=ic_ReadRoleValue(isaac,10)
	time2=ReadRoleValue(isaac,EM_RoleValue_PID)
	if time2==1 then--2王門口
		mob1=ic_mob_flag_add_Y_N( isaac,mob_id[play_Mode],781014,821,1)
		mob2=ic_mob_flag_add_Y_N( isaac,mob_id[play_Mode],781014,822,1)
	elseif time2==2 then--1王門口
		mob1=ic_mob_flag_add_Y_N( isaac,mob_id[play_Mode],781014,851,1)
		mob2=ic_mob_flag_add_Y_N( isaac,mob_id[play_Mode],781014,852,1)
	elseif time2==3 then--3王門口
		mob1=ic_mob_flag_add_Y_N( isaac,mob_id[play_Mode],781014,861,1)
		mob2=ic_mob_flag_add_Y_N( isaac,mob_id[play_Mode],781014,862,1)
	end
	WriteRoleValue(mob1,EM_RoleValue_register1,isaac)
	WriteRoleValue(mob2,EM_RoleValue_register1,isaac)
	SetPlot( mob1,"dead","ic_MOBALL_23_12_mob1xx_1",0 )--免改
	SetPlot( mob2,"dead","ic_MOBALL_23_12_mob2xx_1",0 )--免改
	BeginPlot(mob1 , "ic_MOBALL_23_1mob12KK_2" , 0)
	BeginPlot(mob2 , "ic_MOBALL_23_1mob12KK_2" , 0)
	while true do
		mob1xx=ReadRoleValue(isaac , EM_RoleValue_register1)
		mob2xx=ReadRoleValue(isaac , EM_RoleValue_register2)
		if mob1xx==1 and mob2xx==1 and open==1 then
				sleep(20)
				break
		end
		if  hatelistcount(mob1)~=0 or hatelistcount(mob2)~=0 and open==0 then
			open=1
		end
		if mob1xx==1 and time1==0 and open==1 then
			if 		play_Mode==1 then												
				AddBuff(mob2,620913,0 ,-1 )
			elseif 	play_Mode==2 then
				AddBuff(mob2,620913,0 ,-1 )
			elseif 	play_Mode==3 then
				AddBuff(mob2,620913,0 ,-1 )
			end
				time1=1 
		end
		if mob2xx==1 and time1==0 and open==1 then
			if 		play_Mode==1 then												
				AddBuff(mob1,620913,0 ,-1 )
			elseif 	play_Mode==2 then
				AddBuff(mob1,620913,0 ,-1 )
			elseif 	play_Mode==3 then
				AddBuff(mob1,620913,0 ,-1 )
			end
				time1=1 
				--say(OwnerID(),"2xx")
		end
		if  mob1xx==1 and open==0 or mob2xx==1 and open==0 then
			DelObj(mob1)
			DelObj(mob2)
			sleep(20)
			WriteRoleValue(isaac,EM_RoleValue_register1,0)
			WriteRoleValue(isaac,EM_RoleValue_register2,0)
			time2=ReadRoleValue(isaac,EM_RoleValue_PID)
			if time2==1 then
				mob1=ic_mob_flag_add_Y_N( isaac,mob_id[play_Mode],781014,821,1)
				mob2=ic_mob_flag_add_Y_N( isaac,mob_id[play_Mode],781014,822,1)
			elseif time2==2 then
				mob1=ic_mob_flag_add_Y_N( isaac,mob_id[play_Mode],781014,851,1)
				mob2=ic_mob_flag_add_Y_N( isaac,mob_id[play_Mode],781014,852,1)
			elseif time2==3 then
				mob1=ic_mob_flag_add_Y_N( isaac,mob_id[play_Mode],781014,861,1)
				mob2=ic_mob_flag_add_Y_N( isaac,mob_id[play_Mode],781014,862,1)
			end
			WriteRoleValue(mob1,EM_RoleValue_register1,isaac)
			WriteRoleValue(mob2,EM_RoleValue_register1,isaac)
			SetPlot( mob1,"dead","ic_MOBALL_23_12_mob1xx_1",0 )--免改
			SetPlot( mob2,"dead","ic_MOBALL_23_12_mob2xx_1",0 )--免改
			BeginPlot(mob1 , "ic_MOBALL_23_1mob12KK_2" , 0)
			BeginPlot(mob2 , "ic_MOBALL_23_1mob12KK_2" , 0)
			time1=0
			open=0
		end
		if  hatelistcount(mob1)==0 and ReadRoleValue(mob2,EM_RoleValue_IsDead)== 1 and open==1 and ReadRoleValue(mob1,EM_RoleValue_IsDead)== 0 or 
			hatelistcount(mob2)==0 and ReadRoleValue(mob1,EM_RoleValue_IsDead)== 1 and open==1 and ReadRoleValue(mob2,EM_RoleValue_IsDead)== 0 or
			hatelistcount(mob1)==0 and ReadRoleValue(mob1,EM_RoleValue_IsDead)== 0 and open==1 and 
			hatelistcount(mob2)==0 and ReadRoleValue(mob2,EM_RoleValue_IsDead)== 0 and open==1 then
			DelObj(mob1)
			DelObj(mob2)
			sleep(20)
			WriteRoleValue(isaac,EM_RoleValue_register1,0)
			WriteRoleValue(isaac,EM_RoleValue_register2,0)
			time2=ReadRoleValue(isaac,EM_RoleValue_PID)
			if time2==1 then
				mob1=ic_mob_flag_add_Y_N( isaac,mob_id[play_Mode],781014,821,1)
				mob2=ic_mob_flag_add_Y_N( isaac,mob_id[play_Mode],781014,822,1)
			elseif time2==2 then
				mob1=ic_mob_flag_add_Y_N( isaac,mob_id[play_Mode],781014,851,1)
				mob2=ic_mob_flag_add_Y_N( isaac,mob_id[play_Mode],781014,852,1)
			elseif time2==3 then
				mob1=ic_mob_flag_add_Y_N( isaac,mob_id[play_Mode],781014,861,1)
				mob2=ic_mob_flag_add_Y_N( isaac,mob_id[play_Mode],781014,862,1)
			end
			WriteRoleValue(mob1,EM_RoleValue_register1,isaac)
			WriteRoleValue(mob2,EM_RoleValue_register1,isaac)
			SetPlot( mob1,"dead","ic_MOBALL_23_12_mob1xx_1",0 )--免改
			SetPlot( mob2,"dead","ic_MOBALL_23_12_mob2xx_1",0 )--免改
			BeginPlot(mob1 , "ic_MOBALL_23_1mob12KK_2" , 0)
			BeginPlot(mob2 , "ic_MOBALL_23_1mob12KK_2" , 0)
			time1=0
			open=0
		end
		sleep(10)
	end
end
function ic_MOBALL_23_1mob12KK_2()--守衛技能ok--庫勒奇掠奪蟻
local mob=OwnerID()
local ZoneID=ic_ReadRoleValue(mob,17)
local Zone={146,147,148}
	if 		ZoneID==Zone[1] then														
		ic_All_mob_KKplay_3(498310,299,20,11,1,0,	
					    498311,0,10,5,3,0,
					    498306,0,10,20,3,0)
	elseif 	ZoneID==Zone[2] then													
		ic_All_mob_KKplay_3(498310,299,20,11,1,0,	
					    498311,0,10,5,3,0,
					    498306,0,10,20,3,0)
	elseif 	ZoneID==Zone[3] then														
		ic_All_mob_KKplay_3(498310,299,20,11,1,0,	
					    498311,0,10,5,3,0,
					    498306,0,10,20,3,0)
	end										
end
------------------------------------------------------------------------------------------------------------------------上面小怪門神同時趴
function ic_MOBALL_23_3_1()																	---1王前面
local isaac=OwnerID()		
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob0
local mob0xx
local mob123
local mob1
local mob2
local mob3
local AttackTarget
local time1
local mob_id={106133,106133,106133}															---守衛
local mob1_id={106132,106132,106132}
local mob2_id={106131,106131,106131}
local mob3_id={106130,106130,106130}
local ZoneID=ic_ReadRoleValue(isaac,17)														---哪區域
local Zone={146,147,148}
	if 		ZoneID==Zone[1] then														
		ic_WriteRoleValue(isaac,5,1)
	elseif 	ZoneID==Zone[2] then													
		ic_WriteRoleValue(isaac,5,2)
	elseif 	ZoneID==Zone[3] then														
		ic_WriteRoleValue(isaac,5,3)
	end
	local play_Mode=ic_ReadRoleValue(isaac,5)
sleep(20)
	time1=ReadRoleValue(isaac,EM_RoleValue_PID)
	if time1==1 then
		mob0=CreateObjByFlag(mob_id[play_Mode],781014,710,1)--守衛--往1王走道
	elseif time1==2 then
		mob0=CreateObjByFlag(mob_id[play_Mode],781014,720,1)--守衛--往1王走道
	elseif time1==3 then
		mob0=CreateObjByFlag(mob_id[play_Mode],781014,730,1)--守衛--往2王走道
	elseif time1==4 then
		mob0=CreateObjByFlag(mob_id[play_Mode],781014,740,1)--守衛--往2王走道
	elseif time1==5 then
		mob0=CreateObjByFlag(mob_id[play_Mode],781014,750,1)--守衛--往4王走道
	elseif time1==6 then
		mob0=CreateObjByFlag(mob_id[play_Mode],781014,760,1)--守衛--往4王走道
	elseif time1==7 then
		mob0=CreateObjByFlag(mob_id[play_Mode],781014,770,1)--守衛
	end
	AddToPartition(mob0,RoomID)
	WriteRoleValue(mob0,EM_RoleValue_PID,isaac)
	SetPlot( mob0,"dead","ic_MOBALL_23_2mob0XX_1",0 )--免改
	BeginPlot(mob0 , "ic_MOBALL_23_2mob0KK_1" , 0)
	while true do
		mob0xx=ReadRoleValue(isaac , EM_RoleValue_register10)
		AttackTarget = ReadRoleValue(mob0, EM_RoleValue_AttackTargetID )
		if mob0xx==1 then
			sleep(20)
			break
		end
		if  hatelistcount(mob0)==0 and mob0xx==0 then  
				WriteRoleValue(isaac,EM_RoleValue_register9,0)			
		elseif hatelistcount(mob0)~=0 then
			mob0xx=ReadRoleValue(isaac , EM_RoleValue_register10)
			if CancelBuff(mob0, 620904)==true then
				mob123=ReadRoleValue(isaac , EM_RoleValue_register9)
				if mob123<4 then
					mob123=ReadRoleValue(isaac , EM_RoleValue_register9)
					WriteRoleValue(isaac,EM_RoleValue_register9,mob123+3)
					mob1=ic_mob_Rand_add(mob0,mob1_id[play_Mode],0,0)--小兵(單體+範圍)ok
					mob2=ic_mob_Rand_add(mob0,mob2_id[play_Mode],0,0)--小兵(範圍技能)ok
					mob3=ic_mob_Rand_add(mob0,mob3_id[play_Mode],0,0)--小兵(門神)ok
					WriteRoleValue(mob1,EM_RoleValue_PID,isaac)
					WriteRoleValue(mob2,EM_RoleValue_PID,isaac)
					WriteRoleValue(mob3,EM_RoleValue_PID,isaac)
					WriteRoleValue(mob1,EM_RoleValue_register1,mob0)
					WriteRoleValue(mob2,EM_RoleValue_register1,mob0)
					WriteRoleValue(mob3,EM_RoleValue_register1,mob0)
					SetPlot( mob1,"dead","ic_MOBALL_23_2mob123XX_1",0 )--免改
					SetPlot( mob2,"dead","ic_MOBALL_23_2mob123XX_1",0 )--免改
					SetPlot( mob3,"dead","ic_MOBALL_23_2mob123XX_1",0 )--免改
					BeginPlot(mob1 , "ic_MOBALL_23_2mob1KK_1" , 0)
					BeginPlot(mob2 , "ic_MOBALL_23_2mob2KK_1" , 0)
					BeginPlot(mob3 , "ic_MOBALL_23_2mob3KK_1" , 0)
					CancelBuff(mob0, 620904)
					SetAttack(mob1 , AttackTarget)
					SetAttack(mob2 , AttackTarget)
					SetAttack(mob3 , AttackTarget)
				elseif  mob123>3 then
					CancelBuff(mob0, 620904)
				end	
			end
		end	
		sleep(10)
	end
end
function ic_MOBALL_23_2mob0XX_1()--守衛死													---共用
local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	WriteRoleValue(isaac,EM_RoleValue_register10,1)
	ic_MOB_23_99()
end
function ic_MOBALL_23_2mob0KK_1()--守衛技能ok	
local mob=OwnerID()
local ZoneID=ic_ReadRoleValue(mob,17)
local Zone={146,147,148}
	if 		ZoneID==Zone[1] then														
		ic_All_mob_KKplay_4(498316,7,30,5,1,0,
						498307,7,10,11,3,0,
						498306,0,10,20,3,0,
						498323,0,20,10,3,0)
	elseif 	ZoneID==Zone[2] then													
		ic_All_mob_KKplay_4(498316,7,30,5,1,0,
						498307,7,10,11,3,0,
						498306,0,10,20,3,0,
						498323,0,20,10,3,0)
	elseif 	ZoneID==Zone[3] then														
		ic_All_mob_KKplay_4(498316,7,30,5,1,0,
						498307,7,10,11,3,0,
						498306,0,10,20,3,0,
						498323,0,20,10,3,0)
	end												
end
function ic_MOBALL_23_2mob123XX_1()--小怪死													---共用
local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	mob123=ReadRoleValue(isaac , EM_RoleValue_register9)
	WriteRoleValue(isaac,EM_RoleValue_register9,mob123-1)
	ic_MOB_23_99()
end
function ic_MOBALL_23_2mob1KK_1()--小兵(單體+範圍)ok										---共用
local mob=OwnerID()
local mob0=ReadRoleValue(mob,EM_RoleValue_register1)
local time2=0
local time3=0
local time4=0
local play1x={} 
local plays=0
local Luck=0
local AttackTarget
local isaac=ic_ReadRoleValue(mob,0)
local play_Mode=ic_ReadRoleValue(isaac,5)													---難度 1=困難12人 2=正常6人 3=簡單6人  
	while true do
		if hatelistcount(mob)==0 and hatelistcount(mob0)==0  then
			time2=0
			time3=0
			time4=0
			DelObj(mob)
		elseif hatelistcount(mob)~=0 then
			AttackTarget = ReadRoleValue(mob, EM_RoleValue_AttackTargetID )
			time2=time2+1
			time3=time3+1
			time4=time4+1
			if time2>=20 then--隨機目標
				ic_magic_ing(mob,5)
				if 		play_Mode==1 then												
					CastSpellLV(mob,mob, 498306 , 0 )
				elseif 	play_Mode==2 then
					CastSpellLV(mob,mob, 498306 , 0 )
				elseif 	play_Mode==3 then
					CastSpellLV(mob,mob, 498306 , 0 )
				end
				sleep(10)
				time2=0
			end
			if time3>=11 then--範圍技能
				ic_magic_ing(mob,5)
				if 		play_Mode==1 then												
					CastSpellLV(mob,mob, 498304 , 10 )
				elseif 	play_Mode==2 then
					CastSpellLV(mob,mob, 498304 , 10 )
				elseif 	play_Mode==3 then
					CastSpellLV(mob,mob, 498304 , 10 )
				end
				sleep(20)
				time3=0
			end
			if time4>=5 then--單體
				ic_magic_ing(mob,5)
				if 		play_Mode==1 then												
					CastSpellLV(mob,AttackTarget , 498309 ,24)
				elseif 	play_Mode==2 then
					CastSpellLV(mob,AttackTarget , 498309 ,24)
				elseif 	play_Mode==3 then
					CastSpellLV(mob,AttackTarget , 498309 ,24)
				end
				sleep(10)
				time4=0
			end
		end
		sleep(10)
	end	
end
function ic_MOBALL_23_2mob2KK_1()--小兵(範圍技能)ok										---共用
local mob=OwnerID()
local mob0=ReadRoleValue(mob,EM_RoleValue_register1)
local time2=0
local time3=0
local time4=0
local play1x={} 
local plays=0
local Luck=0
local AttackTarget 
local isaac=ic_ReadRoleValue(mob,0)
local play_Mode=ic_ReadRoleValue(isaac,5)													---難度 1=困難12人 2=正常6人 3=簡單6人  
	while true do
		if hatelistcount(mob)==0 and hatelistcount(mob0)==0  then
			time2=0
			time3=0
			time4=0
			DelObj(mob)
		elseif hatelistcount(mob)~=0 then
			AttackTarget = ReadRoleValue(mob, EM_RoleValue_AttackTargetID )
			time2=time2+1
			time3=time3+1
			time4=time4+1
			if time2>=20 then--隨機目標
				ic_magic_ing(mob,5)
				if 		play_Mode==1 then												
					CastSpellLV(mob,mob, 498306 , 0 )
				elseif 	play_Mode==2 then
					CastSpellLV(mob,mob, 498306 , 0 )
				elseif 	play_Mode==3 then
					CastSpellLV(mob,mob, 498306 , 0 )
				end
				sleep(10)
				time2=0
			end
			if time3>=11 then--範圍技能
				ic_magic_ing(mob,5)
				play1x=DW_HateRemain(0)	---1排坦
				plays=DW_Rand(table.getn(play1x))
				if 		play_Mode==1 then												
					CastSpellLV(mob,play1x[plays] , 498310 , 0 )
				elseif 	play_Mode==2 then
					CastSpellLV(mob,play1x[plays] , 498310 , 0 )
				elseif 	play_Mode==3 then
					CastSpellLV(mob,play1x[plays] , 498310 , 0 )
				end
				sleep(20)
				time3=0
			end
			if time4>=5 then--單體
				ic_magic_ing(mob,5)
				if 		play_Mode==1 then												
					CastSpellLV(mob,mob, 498311 ,399)
				elseif 	play_Mode==2 then
					CastSpellLV(mob,mob, 498311 ,399)
				elseif 	play_Mode==3 then
					CastSpellLV(mob,mob, 498311 ,399)
				end
				sleep(10)
				time4=0
			end
		end
		sleep(10)
	end	
end
function ic_MOBALL_23_2mob3KK_1()--小兵(門神)ok												---共用
local mob=OwnerID()
local mob0=ReadRoleValue(mob,EM_RoleValue_register1)
local time1=0
local time2=0
local time3=0
local time4=0
local play1x={} 
local plays=0
local Luck=0
local AttackTarget
local isaac=ic_ReadRoleValue(mob,0)
local play_Mode=ic_ReadRoleValue(isaac,5)													---難度 1=困難12人 2=正常6人 3=簡單6人 
	while true do
		if hatelistcount(mob)==0 and hatelistcount(mob0)==0  then
			time1=0
			time2=0
			time3=0
			time4=0
			DelObj(mob)
		elseif hatelistcount(mob)~=0 then
			AttackTarget = ReadRoleValue(mob, EM_RoleValue_AttackTargetID )
			time1=time1+1
			time2=time2+1
			time3=time3+1
			time4=time4+1
			if time1>=20 then--隨機目標
				ic_magic_ing(mob,5)
				if 		play_Mode==1 then												
					CastSpellLV(mob,mob, 498306 , 0 )
				elseif 	play_Mode==2 then
					CastSpellLV(mob,mob, 498306 , 0 )
				elseif 	play_Mode==3 then
					CastSpellLV(mob,mob, 498306 , 0 )
				end
				sleep(10)
				time1=0
			end
			if time2>=17 then--隨機目標
				ic_magic_ing(mob,5)
				play1x=DW_HateRemain(0)	---1排坦
				plays=DW_Rand(table.getn(play1x))
				if 		play_Mode==1 then												
					CastSpellLV(mob,play1x[plays] , 498312 , 0 )
				elseif 	play_Mode==2 then
					CastSpellLV(mob,play1x[plays] , 498312 , 0 )
				elseif 	play_Mode==3 then
					CastSpellLV(mob,play1x[plays] , 498312 , 0 )
				end
				sleep(30)
				time2=0
			end
			if time3>=11 then--範圍技能
				ic_magic_ing(mob,5)
				if 		play_Mode==1 then												
					CastSpellLV(mob,mob, 498305 , 5 )
				elseif 	play_Mode==2 then
					CastSpellLV(mob,mob, 498305 , 5 )
				elseif 	play_Mode==3 then
					CastSpellLV(mob,mob, 498305 , 5 )
				end
				sleep(10)
				time3=0
			end
			if time4>=5 then--單體
				ic_magic_ing(mob,5)
				play1x=DW_HateRemain(0)	---1排坦
				plays=DW_Rand(table.getn(play1x))
				if 		play_Mode==1 then												
					CastSpellLV(mob,play1x[plays] , 498308 , 0 )
				elseif 	play_Mode==2 then
					CastSpellLV(mob,play1x[plays] , 498308 , 0 )
				elseif 	play_Mode==3 then
					CastSpellLV(mob,play1x[plays] , 498308 , 0 )
				end
				sleep(30)
				time4=0
			end
		end
		sleep(10)
	end				
end	
------------------------------------------------------------------------------------------------------------------------上面小怪烙人
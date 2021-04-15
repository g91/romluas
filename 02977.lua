function WY_Z27_WB_TarHeyRaMul()
	--DebugMsg(0,0,"This T.H.R.M patch 1.05a")
--	LockHP(OwnerID(),1,"WY_Z27_DEAD_AND_DEAD")
	Lua_DW_WBGUIDRecord( 1 );
	local boss = {}
	local AtkTarget = 0
	boss.id = OwnerID()
	boss.HP = 1
	boss.MaxHP = 0
	boss.HealthPR = 0 
	--計時器個位數
	boss.Sec = 0
	--計時器十位數
	boss.Ten = 0
	--轉變階段計時器
	boss.TimerSwitch = 1
	boss.Time = 0
	boss.Time10 = 0
	boss.stage1 = 1
	boss.stage2 = 1
	--上升氣流冷卻計次
	boss.Rising = 1
	--旋風衝擊冷卻計次
	boss.Hurricane = 1
	--龍捲風冷卻計次
	boss.Tornado = 1
	--和風牢籠冷卻計次
	boss.Cage = 1
	--颶風枷鎖冷卻計次
	boss.Chain = 1
	--氣流牽絆冷卻計次
	boss.AirCell = 1
	--暴風凝聚冷卻計次
	boss.Storm = 1
	boss.Hatelist = {}
	boss.DDlist = {}
	--建立boss技能表
	boss.Skills = {}
	boss.Skills.Hurricane = 851183
	boss.Skills.Tornado = 851184
	boss.Skills.Cage = 851187
	boss.Skills.Chain = 851186
	boss.Skills.AirCell = 624808
	boss.Skills.Storm = 000000
	boss.Skills.Rising = 851182
	local RisedBackFire = 624791
	local NotRising = 624792
	boss.Bufflist = {}
	boss.WindStance = true
	local StormLocation = {}
	local StormObj = {}
	local RoomID = ReadRoleValue( boss.id , EM_RoleValue_RoomID )
	StormLocation[1] = {0,0,-257,0}
	StormLocation[2] = {100,-257,100,0}
	StormLocation[3] = {-100, -257 , -170,0}
	local ActiveStorm = {}
	local earlygame = true
	local wait = true
	local TempHate = 0
	local RisingCheck = false
	local Rised = 0
	local ChainReady = false
	local Chained = false
	local ChainedPlayers = {}
	local ChainStage = 1
	local bounce = 1
	local HoldedPlayers = {}
	local TornadoCountDown = {}
	local TornadoTable = {}
	local ChainedFuck = 0
	local count = 3
	local air = 0
	local KO = {}
	WriteRoleValue(boss.id, EM_RoleValue_Register1,11)
	WriteRoleValue(boss.id, EM_RoleValue_Register2,11)
--	Boss的R1為龍捲風該被移除的編號，R2則是該被移除的暴風凝聚點GUID
	AddBuff( boss.id , 624809 , 0, -1)
	while boss.HP> 0 do
		if HateListCount(boss.id)~= 0 then wait = false end
		if not wait then
			--取得BOSS仇恨表(GM不會進仇恨表)
			for n = 0,HateListCount(boss.id) do
				if ReadRoleValue(HateListInfo(TargetID(), n , EM_HateListInfoType_GItemID),EM_RoleValue_VOC) ~= 0 then
					boss.Hatelist[n] = HateListInfo( TargetID(), n, EM_HateListInfoType_GItemID)  
				end
			end

			Lua_DW_WBLvCheck_Table( boss.Hatelist );

			--取得BOSS全身健康檢查報告
			boss.HP = ReadRoleValue(boss.id,EM_RoleValue_HP)
			boss.MaxHP = ReadRoleValue(boss.id, EM_RoleValue_MaxHP)
			boss.HealthPR = boss.HP/boss.MaxHP*100 
			--個位數計時
			boss.Sec = boss.Sec+1
			--十位數計時
			if boss.Sec >= 10 then
				boss.Ten = boss.Ten+1
				boss.Sec = 0
			end
			--無風狀態的技能使用
-----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------
			--和風守護的使用AI //HP >50%時每5秒使用
			if boss.HealthPR > 50 and air ~= 5 then
				air = air +1
			elseif boss.HealthPR > 50 and air == 5 then
				AddBuff(boss.id, 624807,0 ,-1)
				air = 0
			end
			--檢查是否施放超級旋風衝擊
			if ReadRoleValue(boss.id, EM_RoleValue_Register7) == 1 then
				ScriptMessage(boss.id, 0 ,2,"[WY_Z27_Super_Storm]",0)
				--AddBuff(boss.id, 624922,0 ,10)

				for _i = 1 , 10 , 1 do
					SysCastSpellLv( boss.id , boss.id , 851256 , 0 );
					Sleep( 10 );
				end

				WriteRoleValue(boss.id,EM_RoleValue_Register7, 0) 

				CancelBuff(boss.id, 624801)
				AddBuff(boss.id, 624801, 0, -1)

				--Sleep(100)
			end
-----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------
			--暴風凝聚點產生AI //每21秒使用
			if boss.Ten == boss.Storm*2  and boss.Sec >= 1 then
				ScriptMessage(boss.id, 0 ,2,"[WY_Z27_STORM_JOINT]",0)
				local x,y,z,dir = ReadRoleValue(boss.id, EM_RoleValue_X),ReadRoleValue(boss.id, EM_RoleValue_Y),ReadRoleValue(boss.id, EM_RoleValue_Z),ReadRoleValue(boss.id, EM_RoleValue_Dir)
				boss.Storm = boss.Storm+1
				if #StormObj < 3 then
					local r1 = RandRange(25,95)
					local r2 = RandRange(25,95)
					local r3 = {1,-1}
					local n = RandRange(1,2)
					TempObj = CreateObj(108170, x+r1*r3[n] , y , z+r2*r3[n] , dir ,1)
					AddToPartition(TempObj,RoomID)
					WriteRoleValue(TempObj,EM_RoleValue_Register10,boss.id)
					SetModeEx(TempObj,EM_SetModeType_Searchenemy, false)
					SetModeEx(TempObj,EM_SetModeType_Strikback, false)
					Table.insert(StormObj,TempObj)
					LockHP( TempObj , 1 , "WY_Z27_STORM_DEL" );  
				end
			end
			--暴風凝聚點刪除
			if ReadRoleValue(boss.id, EM_RoleValue_Register2) ~= 11 then
				LockHP( ReadRoleValue(boss.id, EM_RoleValue_Register2), 0 , "")
				local Knock_Out = {}
				table.insert(Knock_Out, ReadRoleValue(boss.id, EM_RoleValue_Register2))
				DelObj(ReadRoleValue(boss.id, EM_RoleValue_Register2))
				for k = 1, #Knock_Out do
					for i,v in pairs(StormObj) do
						if  v == Knock_Out[k] then table.remove(StormObj, i ) end
					end
				end
				WriteRoleValue(boss.id,EM_RoleValue_Register2,11)
			end
--			上升氣流施展AI //每25秒使用
---------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------
			if boss.Ten == boss.Rising*2 and boss.Sec >= 5 then
				ScriptMessage(boss.id, 0 ,2,"[WY_Z27_UPDRAFT]",0)
				local pos = 0
				for a = 0, HateListCount(boss.id) do
					if HateListInfo(boss.id, a, EM_HateListInfoType_HatePoint) > TempHate then
						pos = a
						TempHate = HateListInfo(boss.id, a, EM_HateListInfoType_HatePoint)
						Rised = HateListInfo(boss.id, a, EM_HateListInfoType_GItemID)					
					 end
				end
				boss.Rising = boss.Rising+1
				SysCastSpellLv(boss.id, Rised, boss.Skills.Rising,0);
				SetHateListPoint( boss.id , pos, 0 )
				RisingCheck = true
			end
			--上升氣流結束檢查
			if RisingCheck then
				for b = 0, HateListCount(boss.id) do
					if CheckBuff(HateListInfo(boss.id, b, EM_HateListInfoType_GItemID), RisedBackFire) then
						TempHate = HateListInfo(boss.id, b, EM_HateListInfoType_HatePoint)
						CancelBuff(HateListInfo(boss.id, b, EM_HateListInfoType_GItemID), NotRising)
						RisingCheck = false
					end
					if CheckBuff(HateListInfo(boss.id, b, EM_HateListInfoType_GItemID), NotRising) then
						SetHateListPoint( boss.id , b , TempHate*0.9+HateListInfo(boss.id, b, EM_HateListInfoType_HatePoint))
						CancelBuff(HateListInfo(boss.id, b, EM_HateListInfoType_GItemID), NotRising)
						RisingCheck = false
					end
				end
			end
-----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------
			--颶風枷鎖施展AI //每17秒使用   
			if boss.Ten == boss.Chain and boss.Sec >= 7 and not Chained then ChainReady = true end
			if ChainReady then
				local TempTable = boss.Hatelist
				for c = 0, #boss.Hatelist do
					r = RandRange(0,#TempTable-1)
					local SearchRes = SearchRangePlayer(TempTable[r], 60)
					if #SearchRes > 1 then
						SysCastSpellLv(boss.id, SearchRes[r], boss.Skills.Chain,0);
					--	移除多餘的目標
						if #SearchRes > 2 then
							for a = 1,#SearchRes-2 do
								--DebugMsg(0,0,"Target is more then two, removing index "..#SearchRes - a.." from the list.")
								table.remove(SearchRes, #SearchRes - a)
							end
						end
						ChainedPlayers = SearchRes
						ChainReady = false
						Chained = true
					elseif #SearchRes == 1 then
						--DebugMsg(0,0,"Target is invalid")
						table.remove(TempTable, r )
					end
				end
				if Chained then
					SysCastSpellLv(boss.id ,ChainedPlayers[0] , boss.Skills.Chain,0)
					Tell(ChainedPlayers[0],ChainedPlayers[1], "[WY_Z27_I_AM_STUCKED]")
					SysCastSpellLv(boss.id ,ChainedPlayers[1] , 851185,0)
					boss.Chain = boss.Chain+1
				end
			end
			if Chained and ChainStage == 1 and not CheckDistance( ChainedPlayers[0],ChainedPlayers[1], 150 ) then
				Tell(ChainedPlayers[1],ChainedPlayers[0], "[WY_Z27_I_AM_SLOWED]")
				AddBuff(ChainedPlayers[0], 624900,0,40)
				AddBuff(ChainedPlayers[1], 624811,0,40)
				CancelBuff(ChainedPlayers[0], 624811)
				CancelBuff(ChainedPlayers[1], 624900)
				ChainStage = 2
			elseif Chained and ChainStage == 2 and CheckDistance( ChainedPlayers[0],ChainedPlayers[1], 30 ) then
				Tell(ChainedPlayers[0],ChainedPlayers[1], "[WY_Z27_ONE_LAST_TIME]")
				CancelBuff(ChainedPlayers[1], 624811)
				CancelBuff(ChainedPlayers[0], 624900)
				AddBuff(ChainedPlayers[1], 624900,0,20)
				AddBuff(ChainedPlayers[0], 624811,0,20)
				ChainStage = 3
			elseif Chained and ChainStage == 3 and not CheckDistance( ChainedPlayers[1],ChainedPlayers[0], 150 ) then
				--DebugMsg(0,0,"CS3 is Checked")
				CancelBuff(ChainedPlayers[1], 624900)
				CancelBuff(ChainedPlayers[0], 624811)
				ChainReady = true
				Chained = false
				ChainStage = 1
			end
			if Chained and ReadRoleValue(ChainedPlayers[0], EM_RoleValue_IsDead)==1 then
				CancelBuff(ChainedPlayers[1],624900)
				CancelBuff(ChainedPlayers[1],624811)
			end
			if Chained and ReadRoleValue(ChainedPlayers[1], EM_RoleValue_IsDead)==1 then
				CancelBuff(ChainedPlayers[0],624900)
				CancelBuff(ChainedPlayers[0],624811)
			end
			if Chained and (not CheckID(ChainedPlayers[0]) or not CheckDistance(ChainedPlayers[0], boss.id, 560)) then
				CancelBuff(ChainedPlayers[1],624900)
				CancelBuff(ChainedPlayers[1],624811)
			end
			if Chained and (not CheckID(ChainedPlayers[1]) or not CheckDistance(ChainedPlayers[1], boss.id, 560)) then
				CancelBuff(ChainedPlayers[0],624900)
				CancelBuff(ChainedPlayers[0],624811)
			end			
--			判斷是否轉入颶風狀態
			if  boss.HealthPR < 50 and earlygame then
				ScriptMessage(boss.id, 0 ,2,"[WY_Z27_HALF_HEALTH]",0)
				WriteRoleValue(boss.id ,EM_RoleValue_Register10 , 10)
				CancelBuff( boss.id , 624809)
				AddBuff( boss.id , 624810 , 0, -1)
				boss.WindStance = true
				local Sphere = CreateObj(122954, -5386, 184, 11226, 0, 1) --CreateObj(122954, 110, -257, -130,0, 1)  
				AddToPartition(Sphere,RoomID)
				earlygame = false
			elseif  boss.Ten == boss.stage1*4 and earlygame then
				ScriptMessage(boss.id, 0 ,2,"[WY_Z27_TIME40]",0)
				CancelBuff( boss.id , 624809)
				AddBuff( boss.id , 624810 , 0, -1)
				local Sphere =  CreateObj(122954, -5386, 184, 11226, 0, 1) -- CreateObj(122954, 110, -257, -130, 0, 1)  
				AddToPartition(Sphere,RoomID)
				boss.WindStance = true
				boss.stage1 = boss.stage1+2
			end
			--風之牽絆受災戶檢查
			if #HoldedPlayers ~= 0  and count == 3 then
				for g = 1,#HoldedPlayers do
					if not HoldedPlayers[g] then  --避免玩家死亡被移除而找不到目標
						local TempTable = SearchRangePlayer(HoldedPlayers[g],60)
						if #TempTable > 1 then
							count = 0
							local TempPower = 0
							for z = 0, BuffCount(HoldedPlayers[g]) do
								if BuffInfo( HoldedPlayers[g] , z , EM_BuffInfoType_BuffID ) == boss.skills.AirCell then
									TempPower = BuffInfo(HoldedPlayers[g], z , EM_BuffInfoType_Power)
								end
							end
							for h = 0,#TempTable-1 do
								if TempTable[h] ~= HoldedPlayers[g] and not CheckBuff(TempTable[h], 624815)then
									AddBuff( TempTable[h],boss.skills.AirCell,2 ,3)
									TempPower = TempPower -1
								end
							end
							CancelBuff(HoldedPlayers[g], boss.skills.AirCell)
							if TempPower > 0 then
								AddBuff(HoldedPlayers[g], boss.skills.AirCell, TempPower, -1)
							else
								table.remove(HoldedPlayers,g)
							end
						end
					end
				end
				elseif count < 3 then
					count = count +1	
				end
			--當處於颶風狀態
			if boss.WindStance then
				--颶風狀態計時
				boss.Time = boss.Time+1
				--十位數計時
				if boss.Time >= 10 then
					boss.Time10 = boss.Time10+1
					boss.Time = 0
				end
				--風之牽絆施展AI //每23秒使用
				if boss.Time10 == boss.AirCell*2 and boss.Time == 3 then
					local r = RandRange(1,#boss.Hatelist)
					local slowed_tank = 0
					local pos = 0
					local TempHate = 0
					for a = 0, HateListCount(boss.id) do
						if HateListInfo(boss.id, a, EM_HateListInfoType_HatePoint) > TempHate then
							pos = a
							TempHate = HateListInfo(boss.id, a, EM_HateListInfoType_HatePoint)
							slowed_tank = HateListInfo(boss.id, a, EM_HateListInfoType_GItemID)					
						 end
					end
--					AddBuff(boss.Hatelist[r] ,boss.skills.AirCell ,19 ,-1)
					AddBuff(slowed_tank ,boss.skills.AirCell ,19 ,-1)
					ScriptMessage(boss.id, 0 ,2,"[WY_Z27_YOU_ARE_SLOWED]",0)
--					table.insert(HoldedPlayers, boss.Hatelist[r])
					table.insert(HoldedPlayers, slowed_tank)
					boss.AirCell = boss.AirCell +1
				end
				--旋風衝擊施展AI //每10秒使用
				if boss.Time10 == boss.Hurricane then
					SetAttack(boss.id, AtkTarget)
					CastSpell( boss.id, boss.id, boss.Skills.Hurricane )
					boss.Hurricane = boss.Hurricane+1
				end
				--龍捲風施展AI //每5秒使用
				if boss.Time10 == boss.Tornado or boss.Time == 5 and #TornadoTable <10 then
					local r1 = RandRange(-55,55)+ReadRoleValue(boss.id, EM_RoleValue_X)
					local r2 = RandRange(-55,55)+ReadRoleValue(boss.id, EM_RoleValue_Z)
					local y = ReadRoleValue(boss.id, EM_RoleValue_Y)
					local Tornado = CreateObj(108165,r1, y, r2, 0, 1)
					AddToPartition(Tornado, RoomID)
					table.insert(TornadoTable,Tornado)
					WriteRoleValue(Tornado, EM_RoleValue_Register10, boss.id)
					WriteRoleValue(Tornado, EM_RoleValue_Register9, #TornadoTable)
					SetModeEx(Tornado,EM_SetModeType_Mark, false)
					SetModeEx(Tornado,EM_SetModeType_ShowRoleHead, false)
					boss.Tornado = boss.Tornado+1
				elseif boss.Time10 == boss.Tornado or boss.time == 5 and #TornadoTable > 10 then
					boss.Tornado = boss.Tornado+1									
				end
				--龍捲風刪除
				if ReadRoleValue(boss.id, EM_RoleValue_Register1) ~= 11 then
					DelObj(TornadoTable[ReadRoleValue(boss.id, EM_RoleValue_Register1)])
					table.remove(TornadoTable,ReadRoleValue(boss.id, EM_RoleValue_Register1))
					WriteRoleValue(boss.id, EM_RoleValue_Register1,11)
				end
				--和風牽引施展AI //每20秒使用
				if boss.Time10 == boss.Cage*2 then
					local HitTable = {}
					local TargetTable = {}
					local compare = 0
					local take = 0
					local hit = 0
					local Complete = false
					for i,v in pairs(boss.Hatelist) do
						hit = HateListInfo( boss.id, i, EM_HateListInfoType_HitPoint)
						if #TargetTable == 0 then 
							table.insert(HitTable, hit)
							table.insert(TargetTable, v)
						else
							for a = 1,#HitTable do
								if hit > HateListInfo(boss.id, TargetTable[a], EM_HateListInfoType_HitPoint) then
									--DebugMsg(0,0,"Resorting")
									table.insert(HitTable, a, hit)
									table.insert(TargetTable, a, v)
									break
								 else
									table.insert(HitTable, hit)
									table.insert(TargetTable, v)
									 break
								end
								--DebugMsg(0,0,"Table is not resorted")
							end
						end
					end
					for T = 1,#TargetTable do
						Complete = true
						take = take+1
						if take>5 then break end   --10人  5--
						SysCastSpellLv(boss.id, TargetTable[T],boss.Skills.Cage, 0)
					end
					if Complete then 
						boss.Cage= boss.Cage+1
					end
				end
				--是否離開颶風姿態		
				if boss.HealthPR > 50 and boss.Time10 == boss.stage2*4 then
					ScriptMessage(boss.id, 0 ,2,"[WY_Z27_TIMESUP]",0)
					boss.WindStance = false
					CancelBuff( boss.id , 624810)
					AddBuff( boss.id , 624809 , 0, -1)
					boss.stage2 = boss.stage2+1
				end
			end
		end
		if HateListCount(boss.id) < 1 or boss.HP <= 0 then
			wait =true
			boss.Sec = 0
			boss.Time = 0
			boss.WindStance = false
			earlygame = true
			for i,v in pairs(StormObj) do
				DelObj(v)
			end
			for i,v in pairs(TornadoTable) do
				DelObj(v)
			end
			CancelBuff(boss.id,624807)
			if not CheckBuff(boss.id,624809) then
				CancelBuff( boss.id , 624810)
				AddBuff( boss.id , 624809 , 0, -1)
			end
			StormObj = {}
			TornadoTable = {}
			boss.Sec = 0
			boss.Ten = 0
			boss.TimerSwitch = 1
			boss.Time = 0
			boss.Time10 = 0
			boss.stage1 = 1
			boss.stage2 = 1
			boss.Rising = 1
			boss.Hurricane = 1
			boss.Tornado = 1
			boss.Cage = 1
			boss.Chain = 1
			boss.AirCell = 1
			boss.Storm = 1
			air = 0

			--DebugMsg( 0 , 0 , "--oUT OF lOOP" );
			CancelBuff(boss.id, 624801);--高氣壓增幅
			CancelBuff(boss.id, 624799);--低氣壓增幅
			CancelBuff(boss.id, 624807);--和風守護
		end
		sleep(10)
	end	


end		

function WY_Z27_WB_hitbounce(caster , target)
	while CheckBuff(caster, 624813) do
		SysCastSpellLv(caster , target , 851185)
		AddBuff(target ,624805,-1)
		sleep(10)
	end
end

function WY_Z27_WB_SPHERE()
	local TempPower = 0
	local here = OwnerID()
	local far_table = {}
	local near_table = {}
	local temp_table = SearchRangeNPC(OwnerID(),250)
	local boss = 0
	local  Active = true
	local time = 0

	DebugMsg( 0 , 0 , "--WY_Z27_WB_SPHERE : "..here );


	for o = 0,#temp_table-1 do
		if ReadRoleValue(temp_table[o] , EM_RoleValue_OrgID) == 107934 then boss = temp_table[o] end
	end
	if CheckDistance(boss, here, 80) and not CheckBuff(boss,624801) then
		AddBuff(boss, 624799,0 ,-1)
	elseif not  CheckDistance(boss, here, 80) and not CheckBuff(boss,624799) then
		AddBuff(boss, boss, 624801,-1)
	end
	temp_table = SearchRangePlayer(OwnerID(),230)
	for t = 0,#temp_table-1 do
		if CheckDistance(temp_table[t], here, 80) then
			table.insert(near_table,temp_table[t]);
			AddBuff(temp_table[t],624798, 0,-1);--624798低氣壓影響
			CancelBuff( temp_table[t],624800);
		else
			table.insert(far_table, temp_table[t]);
			AddBuff(temp_table[t],624800, 0,-1);--624800高氣壓影響
			CancelBuff( temp_table[t],624798);
		end
	end
	while Active do
		time = time +1
		local kick_out = {}
		for a = 1,#near_table do
			if near_table[a] and not CheckDistance(near_table[a], here, 80) then
				AddBuff(near_table[a],624800, 0,-1)
				AddBuff(near_table[a],624813,0,-1)
				CancelBuff( near_table[a],624798)
				table.insert(far_table,near_table[a])
				table.insert(kick_out ,near_table[a])
--			=====NearTable踢除檢查================================
				for i,v in pairs(near_table) do
					for ii,vv in pairs(kick_out) do
						if v == vv then table.remove(near_table, i); break; end
					end
				end
--			=================================================
			elseif (  near_table[a] and CheckDistance(near_table[a], here , 80) ) and ReadRoleValue(near_table[a],EM_RoleValue_HP) >0 then
				AddBuff(near_table[a],624798, 0,-1);
				CancelBuff( near_table[a],624800);
			end
		end
		kick_out = {}
		for b = 1,#far_table do
			if not far_table[b] then
				if CheckDistance(far_table[b], here , 80) then
					AddBuff(far_table[b],624798, 0,-1)
					AddBuff(far_table[b],624813, 0,-1)
					CancelBuff( far_table[b],624800)
					table.insert(near_table,far_table[b])
					table.insert(kick_out ,far_table[b])
	--			=====FarTable踢除檢查================================
					for i,v in pairs(far_table) do
						for ii,vv in pairs(kick_out) do
							if v == vv then table.remove(far_table, i); break; end
						end
					end
	--			=================================================
				else
					if ( not CheckDistance(far_table[b], here , 80) or not CheckBuff(far_table[b],624800) ) and ReadRoleValue(far_table[b],EM_RoleValue_HP) >0 then
						AddBuff(far_table[b],624800, 0,-1)
						CancelBuff( far_table[b],624798);
					end	
				end
			end
		end
		if CheckBuff(boss, 624799) then
			if not CheckDistance(boss, here, 80) then
				SysCastSpellLv(boss ,boss ,851188 , 0)
				for z = 0, BuffCount(boss) do
					if BuffInfo( boss , z , EM_BuffInfoType_BuffID ) == 624799 then
						TempPower = BuffInfo(boss, z , EM_BuffInfoType_Power)
					end
				end
				CancelBuff(boss, 624799)
				if TempPower ~= 0 then
					AddBuff(boss, 624799, TempPower-1, -1)
				end
			else
				AddBuff(boss, 624799, 0, -1)
				for z = 0, BuffCount(boss) do
					if BuffInfo( boss , z , EM_BuffInfoType_BuffID ) == 624799 then
						TempPower = BuffInfo(boss, z , EM_BuffInfoType_Power)
					end
				end
				if TempPower >= 19 then
					SysCastSpellLv(boss,boss,851230,0)
					ScriptMessage(boss, 0 ,2,"[WY_Z27_Super_Vacuum]",0)
					Sleep(50);--強制顯示20
					CancelBuff(boss, 624799)
					AddBuff(boss, 624799, 0, -1)
				end
			end
		elseif CheckBuff(boss, 624801) then
			if CheckDistance(boss, here, 80) then
				SysCastSpellLv(boss ,boss ,851188 , 0)
				for z = 0, BuffCount(boss) do
					if BuffInfo( boss , z , EM_BuffInfoType_BuffID ) == 624801 then
						TempPower = BuffInfo(boss, z , EM_BuffInfoType_Power)
					end
				end
				CancelBuff(boss, 624801)
				if TempPower ~= 0 then
					AddBuff(boss, 624801, TempPower-1, -1)
				end
			else
				AddBuff(boss, 624801,0 , -1)
				for z = 0, BuffCount(boss) do
					if BuffInfo( boss , z , EM_BuffInfoType_BuffID ) == 624801 then
						TempPower = BuffInfo(boss, z , EM_BuffInfoType_Power)
					end
				end
				if TempPower >= 19 then--140703  --K.J. Aris
					
					WriteRoleValue(boss, EM_RoleValue_Register7, 1)
					--CancelBuff(boss, 624801)
					--AddBuff(boss, 624801, 0, -1)
				end
			end
		else
			if CheckDistance(boss, here, 80) then
				AddBuff(boss, 624799, 0,-1)
			else
				AddBuff(boss, 624801, 0,-1)
			end	
		end
		if time >= 40 and ReadRoleValue(boss,EM_RoleValue_Register10) ~= 10 then
			--DebugMsg(0,0,"times up")
			time = 0
			Active = false
			for a = 1,#near_table do
				CancelBuff( near_table[a],624798)
			end
			for b = 1,#far_table do
				CancelBuff( far_table[b],624800)
			end
			CancelBuff(boss,624801)
			CancelBuff(boss,624799)
			DelObj(here)
		end
		if HateListCount(boss) < 1 or ReadRoleValue(boss,EM_RoleValue_HP) <= 0 then	
			time = 0
			Active = false
			for a = 1,#near_table do
				CancelBuff( near_table[a],624798)
			end
			for b = 1,#far_table do
				CancelBuff( far_table[b],624800)
			end
			CancelBuff(boss,624801)
			CancelBuff(boss,624799)
			DelObj(here)
		end


	-------------------------------------------------------140114 K.J. Aris	強制低氣壓 高氣壓 轉換
	temp_table = SearchRangePlayer(OwnerID(),230);
	for t = 0,#temp_table-1 do
		if CheckDistance(temp_table[t], here, 80) then
			--table.insert(near_table,temp_table[t]);
			AddBuff(temp_table[t],624798, 0,-1);--624798低氣壓影響
			CancelBuff( temp_table[t],624800);
		else
			--table.insert(far_table, temp_table[t]);
			AddBuff(temp_table[t],624800, 0,-1);--624800高氣壓影響
			CancelBuff( temp_table[t],624798);
		end
	end
	------------------------------------------END----------140114 K.J. Aris	強制低氣壓 高氣壓 轉換



	sleep(10)
	end
	DebugMsg( 0 , 0 , "--oUT OF lOOP" );
	CancelBuff(boss, 624801);--高氣壓增幅
	CancelBuff(boss, 624799);--低氣壓增幅
	CancelBuff(boss, 624807);--和風守護
	
end
			
function WY_Zone27_WB_Tornado()
	local Moving = false
	local wp_table = {781319,781354,781355}
	local Targets = {}
	local activeTime = 0
	local x,y,z,dir = 0,0,0,0
	local randomstop = 0
	local boss = ReadRoleValue(OwnerID(),EM_RoleValue_Register10)
	WriteRoleValue(OwnerID(),EM_RoleValue_IsWalk,1)
	SetModeEx(OwnerID(),EM_SetModeType_Strikback, false)
	SetModeEx(OwnerID(),EM_SetModeType_Strikback, false)
	MoveToFlagEnabled( OwnerID(), false );
	while true do

		local random = RandRange(-60,60)
		local stopper = false
		activeTime = activeTime +1
		Targets = SearchRangePlayer(OwnerID(),28)
		if not Moving then
			local chance = RandRange(1,3)
			local g = RandRange(1,3)
			local r = RandRange(1,7)
			x= GetMoveFlagValue(wp_table[g], r-1,EM_RoleValue_X)
			y= GetMoveFlagValue(wp_table[g], r-1 ,EM_RoleValue_Y)
			z= GetMoveFlagValue(wp_table[g], r-1 ,EM_RoleValue_Z)
			if chance == 2 and g ~= 3 then
				x = x+random
				z= z+random
			elseif chance == 3 then
				randomstop = RandRange(4,12)
			end	
			MoveDirect(OwnerID(), x, y, z)
			Moving = true
		else if math.abs(ReadRoleValue(OwnerID(), EM_RoleValue_X)-x) < 15 and math.abs(ReadRoleValue(OwnerID(), EM_RoleValue_Z)-z) <15 then Moving = false end
		end
		if randomstop == 1 then
			StopMove(OwnerID(),1)
			Moving = false
		elseif randomstop > 0 then
			randomstop = randomstop-1
		end
		SysCastSpellLv(OwnerID(),OwnerID(),851184, 1)
		sleep(12)
		if activeTime >= 30 or HateListCount(boss) < 1 or ReadRoleValue(boss,EM_RoleValue_HP) <= 0 then
			WriteRoleValue(boss ,EM_RoleValue_Register1,ReadRoleValue(OwnerID(),EM_RoleValue_Register9))
			DelObj(OwnerID())
		end
	end	
end
----龍捲風技能檢查
function WY_Tornado_targetcheck()
	if not CheckBuff(TargetID(),624839) and TargetID() ~= OwnerID() then
		return true
	else
		return false
	end
end

--暴風凝聚點產生劇情
function WY_Z27_WB_Storm()
	local me = OwnerID()
	local PowerCheck = 0
	local time = 0
	local TempTable = {}
	local boss = ReadRoleValue(me ,EM_RoleValue_Register10)
	Addbuff(me,624840,0,-1 )
	while true do
		if not CheckBuff(me,624840) then
			ScriptMessage(me, 0 ,2,"[WY_Z27_STORM_DOWN]",0)
			WriteRoleValue(boss,EM_RoleValue_Register2,ReadRoleValue(me,EM_RoleValue_Register9))
			DelObj(me)
		end
		time = time +1
		for x = 0,BuffCount(me) do
			if BuffInfo(me , x ,EM_BuffInfoType_BuffID) == 624840 then
				PowerCheck = BuffInfo(me, x ,EM_BuffInfoType_Power)
			end
		end
		if PowerCheck == 0 then PowerCheck = 0.5 end
		if time == (2/PowerCheck) then
			SysCastSpellLv(me,me, 851221,1 )
			SysCastSpellLv( me, me, 851183,1)
			time = 0
		end
		if HateListCount(boss) < 1 or ReadRoleValue(boss,EM_RoleValue_HP) <= 0 then
			DelObj(me)
		end
		sleep(10)
	end
end

function WY_Z27_WB_Vacuum()
	local x =  ReadRoleValue(OwnerID(),EM_RoleValue_X)
	local y =  ReadRoleValue(OwnerID(),EM_RoleValue_Y)
	local z =  ReadRoleValue(OwnerID(),EM_RoleValue_Z)
	local dir =  ReadRoleValue(OwnerID(),EM_RoleValue_Dir)
	SetPos(TargetID(),x,y,z,dir)
	AddBuff(TargetID(),624805,0,3/2)
	AddBuff(TargetID(),624839,0,3)
	return true
end

function SpellCastCheck()
	return true
end

function WY_Z27_AC_test()
	local r1,r2,r3 = RandRange(-20,20),RandRange(-20,20),RandRange(0,359)
	DW_CancelMount(TargetID())
	if CheckBuff(TargetID(),624796) then
		ScriptMessage(OwnerID(),TargetID() ,2,"[WY_Z27_STAY_THERE]",0)
		SetPos(TargetID(),-5386+r1,184,11226+r2,r3)		--SetPos(TargetID(),109+r1,-257,-129+r2,r3)
		CancelBuff(TargetID(),624796)
		AddBuff(TargetID(),624797,0, 10)
	end
	return true
end

function WY_Z27_STORM_DEL()
	WriteRoleValue(ReadRoleValue(OwnerID(),EM_RoleValue_Register10),EM_RoleValue_Register2,OwnerID())
end

function WY_Z27_DEAD_AND_DEAD()
	WriteRoleValue(OwnerID(),EM_RoleValue_Register3,1)
end

function WY_Z27_RESTORE_MY_SPEED_PLEASE()
	--DebugMsg(0,0, "Restored")
	CancelBuff(OwnerID(), 624790)
	CancelBuff(OwnerID(), 624793)
	CancelBuff(OwnerID(), 624794)
	CancelBuff(OwnerID(), 624796)
	CancelBuff(OwnerID(), 624797)
	CancelBuff(OwnerID(), 624798)
	CancelBuff(OwnerID(), 624800)
	CancelBuff(OwnerID(), 624813)
	CancelBuff(OwnerID(), 624811)
	CancelBuff(OwnerID(), 624900)
	CancelBuff(OwnerID(), 624815)
	CancelBuff(OwnerID(), 624808) 
end 

function WY_Tornado_Protection(a)
	if a > 0 then
	local n = n*10
		AddBuff(OwnerID(),624839,0,n)
	elseif a == 0 then
		CancelBuff(OwnerID(),624839)
	end
end  
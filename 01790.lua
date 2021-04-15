function Lua_bk_ice_102471_easy()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local alltime=0-----全部
	local time1=0
	local time2=0
	local boss=OwnerID()
	local Play_Chose={}
	local kp=0	
	while 1 do
	local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標
	local BossTarget=AttackTarget
		sleep(10)
		time1=time1+1
		alltime=alltime+1
		if HateListCount( boss ) ~= 0 then
			
			Play_Chose=DW_HateRemain(0)
			if time1 >= 8 then --------------------------------打坦克大招式
				------say(boss,"BossTarget"..BossTarget)
			---	Luck=DW_Rand(100)
			---	if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
					BossTarget = AttackTarget
					CastSpellLV( OwnerID() , OwnerID(), 495452 , 0 )
			----	end
				time1=0
			end
			if alltime >= 15 then 	
				for j=1 , 2 , 1 do-------------------------------隨機打兩個
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then 
					end
					if kp~=0 then 
					BossTarget = Play_Chose[kp]
					SysCastSpellLV( OwnerID() , BossTarget , 494286 , 0 )
					end	
					table.remove (Play_Chose, kp)
					table.getn (Play_Chose)	
				end
				alltime=0
			end
		elseif HateListCount( boss ) == 0 then 
			alltime=0
			time1=0
		end
	end
end
function Lua_bk_iron_102472_easy()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local alltime=0-----全部
	local time1=0
	local time2=0
	local boss=OwnerID()
	local Play_Chose={}
	local kp=0
	while 1 do
	local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標
	local BossTarget=AttackTarget
		sleep(10)
		time1=time1+1
		alltime=alltime+1
		if HateListCount( boss ) ~= 0 then
			Play_Chose=DW_HateRemain(0)
			if time1 >= 8 then --------------------------------打坦克大招式
				------say(boss,"BossTarget"..BossTarget)
				Luck=DW_Rand(100)
				if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
					BossTarget = AttackTarget
					CastSpellLV( OwnerID() , BossTarget , 493736 , 0 )	
				elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 100) then
					CastSpellLV( OwnerID() , OwnerID() , 495453 , 0 )
					sleep(30)
					if CheckBuff(boss,504793) == false then 
						AddBuff(boss,504210,1,10)
						SetIdleMotion( boss ,  ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
						sleep(100)
						SetIdleMotion( boss ,  ruFUSION_ACTORSTATE_NORMAL)
					end
				end
				time1=0
			end
			if alltime >= 15 then 	
				for j=1 , 2 , 1 do-------------------------------隨機打兩個
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then 
					end
					if kp~=0 then 
					BossTarget = Play_Chose[kp]
					SysCastSpellLV( OwnerID() , BossTarget , 494288 , 0 )
					end	
					table.remove (Play_Chose, kp)
					table.getn (Play_Chose)						
				end
				alltime=0
			end
		elseif HateListCount( boss ) == 0 then 
			alltime=0
			time1=0
		end
	end
end

function Lua_cang_EMI_GGmen3_easy()

	while true do
	sleep(10)
		local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
		local SkillB = 0
		local SkillC = 0
		
		while true do
		sleep(10)

			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )	--抓目標值
			if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥

				SkillB = SkillB + 1		
				
				if SkillC == 0 then
					local Temp = Lua_Davis_BornByMultilateral( 102479 , 1 , 10 )	--在自己身上出小機器人
					BeginPlot(Temp[1],"Lua_cang_EMI_GGmen3_1",0)
					--BeginPlot(Temp[2],"Lua_cang_EMI_GGmen3_1",0)
					--BeginPlot(Temp[3],"Lua_cang_EMI_GGmen3_1",0)
					SkillC = 1 
				end
				if SkillB >= 90 then
					local Temp = Lua_Davis_BornByMultilateral( 102479 , 3 , 10 )	--在自己身上出小機器人
					BeginPlot(Temp[1],"Lua_cang_EMI_GGmen3_1",0)
					--BeginPlot(Temp[2],"Lua_cang_EMI_GGmen3_1",0)
					--BeginPlot(Temp[3],"Lua_cang_EMI_GGmen3_1",0)
					sleep(10)					
					SkillB = 0
				end
			else
				break	
			end	
		end	
	end
end
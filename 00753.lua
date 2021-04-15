

function LuaS_zone200_Call( MonsterBoss ,  LuaBoss , HowMuch ,  Monster1  )--造怪模版

	hour = GetSystime(1)
	min = GetSystime(2)

		if 	Discowood_FireHour ~= nil and
			Discowood_FireMin ~= nil then

			if 	Discowood_FireHour == 0 and
				Discowood_FireMin == 0 then
			else
				hour = GetSystime(1) + Discowood_FireHour
				min = GetSystime(2) + Discowood_FireMin

				if hour >23 then
					hour = hour - 24
				end

				if min > 59 then
					min = min - 60
				end
			end
		end

	if hour > 11 then
		if min < 40  then
	------------------------------------------------------------------------------------------
			local Boss = CreateObjByFlag( MonsterBoss, 780087 , 0 , 1 )
			AddToPartition( Boss ,   0 )
			BeginPlot(Boss , LuaBoss , 0 )
		------------------------------------------------------------------------------------
			for i=1,10 do
				for j=1, HowMuch do
					local Monster = CreateObjByFlag( Monster1, 780087 , i , 1 )
					AddToPartition( Monster ,  0 )
					BeginPlot(Monster , "LuaS_zone200_Time" , 0 )
				end
			end
		end
	end
end



function LuaS_zone200_SetDead(Lua)--設死亡劇情模版
	SetPlot(OwnerID() ,"dead" , Lua , 30 )
	LuaS_zone200_killself(40)--請往下看
end

function LuaS_zone200_killself( Time )
	local hour = 0
	local min = 0
	while true do
		hour = GetSystime(1)
		min = GetSystime(2)

		if 	Discowood_FireHour ~= nil and
			Discowood_FireMin ~= nil then

			if 	Discowood_FireHour == 0 and
				Discowood_FireMin == 0 then
			else
				hour = GetSystime(1) + Discowood_FireHour
				min = GetSystime(2) + Discowood_FireMin

				if hour >23 then
					hour = hour - 24
				end

				if min > 59 then
					min = min - 60
				end
			end
		end
----------------------------------------------------
		if (hour > 11) and ( min >= Time ) then
			DelObj(OwnerID())
		end

		sleep(220)
	end
end

function LuaS_zone200_Time()
	local hour = 0
	local min = 0
	while true do
		hour = GetSystime(1)
		min = GetSystime(2)

		if 	Discowood_FireHour ~= nil and
			Discowood_FireMin ~= nil then

			if 	Discowood_FireHour == 0 and
				Discowood_FireMin == 0 then
			else
				hour = GetSystime(1) + Discowood_FireHour
				min = GetSystime(2) + Discowood_FireMin

				if hour >23 then
					hour = hour - 24
				end

				if min > 59 then
					min = min - 60
				end
			end
		end
----------------------------------------------------
		if (hour > 11) and ( min >= 40 ) then
			DelObj(OwnerID())
		end

		sleep(220)
	end
end

function LuaS_zone200()
	PKFlag( 2 )
end


function LuaS_zone200_inside()--副本裡掌握進度
	Discowood_FireHour = 0
	Discowood_FireMin = 0

	local hour = 0
	local min = 0

	local step1 = false

------------------------------------------------
	while true do

----------------------------------------------時間處理
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
----------------------------------------------------第一段  10分~48分叫出怪
		if hour > 11 then
			if (min>9 and min<40) and step1 == false then
				step1 = true
				BeginPlot ( OwnerID() , "LuaS_zone200_2_0" , 0 )
			end
		end

------------------------------------------第三段 50分時清場
		if hour > 11 then
			if min > 39 then
				step1 = false
				BeginPlot ( OwnerID() , "LuaS_zone200_clear" , 0 )
			end
		end

		BeginPlot( OwnerID() , "LuaS_zone200_CheckBuff" , 0 )
	
		sleep(200)
	end
end



---叫怪 八波的function 

function LuaS_zone200_2_0()
	LuaS_zone200_Call( 100377 ,  "LuaS_zone200_2_1" , 5 ,  100376  )
end

function LuaS_zone200_2_1()
	LuaS_zone200_SetDead("LuaS_zone200_3_0")
end
-----------------------
function LuaS_zone200_3_0()
	LuaS_zone200_Call( 100692 ,  "LuaS_zone200_3_1" , 4 ,  100281  )
end

function LuaS_zone200_3_1()
	LuaS_zone200_SetDead("LuaS_zone200_4_0")
end
-----------------------
function LuaS_zone200_4_0()
	LuaS_zone200_Call( 100097 ,  "LuaS_zone200_4_1" , 3 ,  100131  )
end

function LuaS_zone200_4_1()
	LuaS_zone200_SetDead("LuaS_zone200_5_0")
end
-----------------------
function LuaS_zone200_5_0()
	LuaS_zone200_Call( 100264 ,  "LuaS_zone200_5_1" , 2 ,  100562  )
end

function LuaS_zone200_5_1()
	LuaS_zone200_SetDead("LuaS_zone200_6_0")
end
-----------------------
function LuaS_zone200_6_0()
	LuaS_zone200_Call( 100236 ,  "LuaS_zone200_6_1" , 1 ,  100228  )
end

function LuaS_zone200_6_1()
	LuaS_zone200_SetDead("LuaS_zone200_7_0")
end
-----------------------
function LuaS_zone200_7_0()
	LuaS_zone200_Call( 100611 ,  "LuaS_zone200_7_1" , 1 ,  100366  )
end

function LuaS_zone200_7_1()
	LuaS_zone200_SetDead("LuaS_zone200_8_0")
end
-----------------------
function LuaS_zone200_8_0()
	LuaS_zone200_Call( 100625 ,  "LuaS_zone200_8_1" , 1 ,  100370  )
end

function LuaS_zone200_8_1()
	LuaS_zone200_SetDead("LuaS_zone200_9_0")
end
-----------------------
function LuaS_zone200_9_0()
	LuaS_zone200_Call( 100160 ,  "LuaS_zone200_9_1" , 1 ,  100138  )
end

function LuaS_zone200_9_1()
	LuaS_zone200_SetDead("LuaS_zone200_10")
end
-----------------------

function LuaS_zone200_10()
	if ReadRoleValue(TargetID() , EM_RoleValue_IsPlayer ) then
		GiveBodyItem(TargetID() , 202678 , 1)
	end
	BeginPlot ( TargetID() , "LuaS_zone200_final" , 0 )
end

----------------------------------------------------

function LuaS_zone200_final()
	local Chest = CreateObjByFlag( 111309, 780088 , 0 , 1 )
	BeginPlot( Chest , "LuaS_zone200_chest" , 0 )
end

function LuaS_zone200_chest()
	SetPlot(OwnerID() , "touch" , "LuaS_chest_test" , 50 )
	LuaS_zone200_killself(40)
end

function LuaS_chest_test()
	if CountBodyItem(OwnerID() , 202678 ) > 0 then
		local value = Rand(100)+1
		if value <11 then
			DelBodyItem( OwnerID() , 202678 , 1 )
			GiveBodyItem( OwnerID() , 222062 , 1 )--鍊
			DelObj(TargetID())
		elseif value <40 and value > 20 then
			DelBodyItem( OwnerID() , 202678 , 1 )
			GiveBodyItem( OwnerID() , 222061 , 1 )--戒
			DelObj(TargetID())
		elseif value <100 and value > 79 then
			DelBodyItem( OwnerID() , 202678 , 1 )
			GiveBodyItem( OwnerID() , 222063 , 1 )--環
			DelObj(TargetID())
		else
			DelBodyItem( OwnerID() , 202678 , 1 )
			GiveBodyItem( OwnerID() , 200392, 1 )--聖火徽
			DelObj(TargetID())
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_111284_4"), 0 ) --你需要聖火鑰匙
	end
end

function LuaS_zone200_out()
	local Dir = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )
	ChangeZone( OwnerID(), 2 , 0, 3905 , 49, -785, 240)
end


function LuaS_zone200_clear()
	local Obj
	local Count = SetSearchAllPlayer(0)
	if count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == True then
				BeginPlot(  ID , "LuaS_zone200_out" , 0 )
			end
		end	
	end
end


function LuaS_zone200_CheckBuff()
	local Obj
	local Count = SetSearchAllPlayer(0)
	if count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == True then
				if CheckBuff( ID , 500669 ) == false then
					BeginPlot(  ID , "LuaS_zone200_out" , 0 )
				end
			end
		end	
	end
end
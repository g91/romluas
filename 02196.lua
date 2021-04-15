function Lua_kors_test_99()
local X = 0
local Y = 0

	for i = 1,9 do
		for s = 1,9 do			
			Say ( OwnerID() , i.. " x " ..s.. " = "..i*s )	
			Sleep (10)
		end	
	end
end

function lua_three()
local point = 0
	for i =1,3 do
		for o =1, 3 do
			for u =1,3 do	
			Say ( OwnerID() , i.. " x " ..o.." x "..u.. " = "..i*o*u )
			Sleep (10)
			end
		end	
	end
end



function lua_breadgive()
local btable = {207635,207636,207637,207638,207639}
local lv = ReadRoleValue(OwnerID(),EM_RoleValue_LV)
	for i = 1,5 do
		if lv > (i-1)*20 and lv <=i*20 then
		GiveBodyItem(OwnerID(),btable[i],1)
		break
		end
	end
end

function lua_work1()
local point = 0
	for i = 1,10 do
		if i % 2 ~= 0 then
			point = point+i
			Say(OwnerID(),point)
		end
	end	
end


function Lua_kors_test_99w()
local i =0

	while i ~= 9 do
		i=i+1
		local d = 0
		while d ~= 9 do
			d=d+1
			a=i*d

	Say ( OwnerID() , i.. "x" ..d.. " = " ..a )
	Sleep (10)
			
		end
		if a == 36 then
		break
		end
	end
end


function Lua_kors_table_00()
local s={"abyss" , "elysion" ,"chronicle" , "molia" , "soundhorizon" }
local i=0
	while i < 5  do
		i = i +1
		local X= rand(5)+1
		Say ( OwnerID() , s[X] )
		sleep(10)
	end
end

function lua_cfirecycle_star()
	BeginPlot(OwnerID(),"lua_cfirecycle",0)
end
function lua_cfirecycle()
	local Player = OwnerID()
	local Fires = {}
	local PlayerX = ReadRoleValue( Player, EM_RoleValue_X )
	local PlayerZ = ReadRoleValue( Player, EM_RoleValue_Z )
	local PlayerY = ReadRoleValue( Player, EM_RoleValue_Y)
	local Radius = 50
	for i = 1, 10 do
		local Angle = i * 36
		local Radian = ( math.pi / 180 ) * Angle
		moveX = PlayerX + ( Radius * math.cos( Radian ) )
		moveZ = PlayerZ - ( Radius * math.sin( Radian ) )
		Fires[i] =  CreateObj(100292,moveX,PlayerY,moveZ,Radian,1)
		WriteRoleValue(Fires[i],EM_RoleValue_Register8,i)
		WriteRoleValue(Fires[i],EM_RoleValue_Register9,Player)
		AddToPartition(Fires[i],0)
	end
	while TRUE do 
		for n = 1,10 do
			local nowX = ReadRoleValue( Player , EM_RoleValue_X)
			local nowZ = ReadRoleValue (Player, EM_RoleValue_Z)
			local Angle = n * 36
			local Radian = ( math.pi / 180 ) * Angle
			moveX = nowX + ( Radius * math.cos( Radian ) )
			moveZ = nowZ - ( Radius * math.sin( Radian ) )
			Move(Fires[n], moveX, PlayerY, moveZ )
		end

			Sleep(1)
	end
end

function lua_cfirecycle_star_2()
	BeginPlot(OwnerID(),"lua_cfirecycle_2",0)
end
                               
function lua_cfirecycle_2()
	local Player = OwnerID()
	local Fires = {}
	local PlayerX = ReadRoleValue( Player, EM_RoleValue_X )
	local PlayerZ = ReadRoleValue( Player, EM_RoleValue_Z )
	local PlayerY = ReadRoleValue( Player, EM_RoleValue_Y)
	local Radius = 50
	local run = WriteRoleValue(Player,EM_RoleValue_Register8,0)
	local turn = WriteRoleValue(Player,EM_RoleValue_Register9,1)
	for i = 1, 10 do --火堆創出
		local Angle = i * 36
		local Radian = ( math.pi / 180 ) * Angle
		moveX = PlayerX + ( Radius * math.cos( Radian ) )
		moveZ = PlayerZ - ( Radius * math.sin( Radian ) )
		Fires[i] =  CreateObj(100292,moveX,PlayerY,moveZ,Radian,1)
		MoveToFlagEnabled(Fires[i],FALSE)
		WriteRoleValue(Fires[i],EM_RoleValue_IsWalk,0)
		AddToPartition(Fires[i],0)
	end
	while TRUE do 
			local nowX = ReadRoleValue( Player , EM_RoleValue_X)
			local nowZ = ReadRoleValue (Player, EM_RoleValue_Z)
			local turn = ReadRoleValue(Player,EM_RoleValue_Register9)			
		if nowX ~= PlayerX or nowZ ~= PlayerZ then --判定移動
			for n = 1,10 do
				local Angle = n * 36
				local Radian = ( math.pi / 180 ) * Angle
				moveX = nowX + ( Radius * math.cos( Radian ) )
				moveZ = nowZ - ( Radius * math.sin( Radian ) )
				Move(Fires[n], moveX, PlayerY, moveZ )
			end
					WriteRoleValue(Player,EM_RoleValue_PID,1)
				PlayerX = nowX
				PlayerZ = nowZ
		else --未移動	
			if ReadRoleValue(Player,EM_RoleValue_PID) == 0 then
			local run =   ReadRoleValue(Player,EM_RoleValue_Register8)
				for o = 1, 10 do
					local Angle = ( o+run ) * 36
					local Radian = ( math.pi / 180 ) * Angle
					moveX = nowX + ( Radius * math.cos( Radian ) )
					moveZ = nowZ - ( Radius * math.sin( Radian ) )
					Move(Fires[o], moveX, PlayerY, moveZ )
				end
				if turn%2 ~= 0 then 
					WriteRoleValue(Player,EM_RoleValue_Register8,run+1)
				else
					WriteRoleValue(Player,EM_RoleValue_Register8,run-1)
				end
			else
				WriteRoleValue(Player,EM_RoleValue_Register9,turn+1)
				WriteRoleValue(Player,EM_RoleValue_PID,0)
			end
		end
		Sleep(10)
	end
end

function lua_kors_FPS_TEST()
	local player = OwnerID()
	KORS_FirstPersonSee(player,"ON")
end

function Lua_kors_flowerS_Monplay()
local con = OwnerID()
local mon = {120384,120385,120386}
local time = 0
local conX = ReadRoleValue(con,EM_RoleValue_X)
local conY = ReadRoleValue(con,EM_RoleValue_Y)
local conZ = ReadRoleValue(con,EM_RoleValue_Z)
local Radius = 20
local Cycle = {}	
		for i = 1, 10 do
			local Mr = RandRange(1,3)
			local Angle = i * 36
			local Radian = ( math.pi / 180 ) * Angle
			local moveY = conY + ( Radius * math.sin( Radian ) )
			local moveX = conX + (Radius * math.cos(Radian) )
			local moveZ = conZ - ( Radius * math.sin( Radian ) )
			Cycle[i] =  CreateObj(mon[Mr],moveX,moveY,moveZ,Radian,1)
			SetModeEx( Cycle[i], EM_SetModeType_Show, TRUE )			--顯示
			SetModeEx( Cycle[i], EM_SetModeType_Gravity, FALSE )			--重力關掉
			AddToPartition(Cycle[i],0)
		end

	while time < 61 do
		local run = ReadRoleValue(con,EM_RoleValue_Register8)
		for n = 1,10 do
			local nowX = ReadRoleValue( con, EM_RoleValue_X)
			local nowZ = ReadRoleValue( con, EM_RoleValue_Z)
			local Angle = (n+run) * 36
			local Radian = ( math.pi / 180 ) * Angle
			local moveX = nowX + ( Radius * math.cos( Radian ) )
			local moveY = conY - ( Radius * math.sin( Radian ) )
			local moveZ = nowZ - ( Radius * math.sin( Radian ) )
			Move(Cycle[n], moveX,moveY, moveZ )
		end
		WriteRoleValue(con,EM_RoleValue_Register8,run+1)
	time = time +1
	end
end

function Lua_kors_givTEST()
local player = OwnerID()
local nowY
	while TRUE do
	nowY = ReadRoleValue(player,EM_RoleValue_Y)
	Say(player,nowY)
	Sleep(40)
	end
end

function lua_kors_Z23play()
local player =OwnerID()
local NPC = TargetID()
	SetSpeakDetail(player,"[SC_Z23_KORS_T1]")
	AddSpeakOption(player,NPC,"[SC_Z23_KORS_T2]","lua_kors_intothesky",0)
	AddSpeakOption(player,NPC,"[SC_Z23_KORS_T3]","lua_kors_intothesky",0)
end

function lua_kors_intothesky()
local player = OwnerID()
	CloseSpeak(player)
	ScriptMessage(player,player,1,"[SC_Z23_KORS_T4]",0)
	FA_OverLook(4450)
	Sleep(30)
	FA_OverLook(4450)
	Sleep(10)
	ScriptMessage(player,player,1,"welcome to true world!",0)
end

function lua_musican_12_speedtest()
local ctrl = OwnerID()
local Partitur = {}
local buff = {622394,622395}
local j = 1
	for i = 1, 30 do
	local Rnd = Rand(100)
		if Rnd<= 50 then 
			Partitur[i] = 1
		elseif Rnd>50 and Rnd <= 80 then
			Partitur[i] = 2
		else
			Partitur[i] = 0
		end
	end

	while TRUE do
			if Partitur[j]~= 0 then
				AddBuff(ctrl,buff[Partitur[j]],1,-1)
			else
				CancelBuff(ctrl,buff[1])
				CancelBuff(ctrl,buff[2])
			end
		j= j+1
			if J >30 then
				j= 1
			end
		Sleep(9)
	end
end

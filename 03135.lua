function Cl_Z32_Boss2_ObjList()
	local Obj_table = {}
	Obj_table.Box = { 108616 , 106154 , 106155 } --黑牢密儲箱
	Obj_table.captain = { 108684 , 108880 , 108886 } --馬薩里隊長
	Obj_table.Monster = {}
	Obj_table.Monster[1] = { 
								{ ObjID = { 108660 , 108875 , 108881 } , num = { 1 , 1 , 0 } , AI= "Cl_Z32_Boss2_C_Jailer" } , --狡詐的獄卒
								{ ObjID = { 108661 , 108876 , 108882 } , num = { 1 , 1 , 1 } , AI= "Cl_Z32_Boss2_S_Jailer" }   --強壯的獄卒
							}
	Obj_table.Monster[2] = { 
							
								{ ObjID = { 108660 , 108875 , 108881 } , num = { 1 , 1 , 1 } , AI= "Cl_Z32_Boss2_C_Jailer" } , --狡詐的獄卒
								{ ObjID = { 108663 , 108878 , 108884 } , num = { 1 , 1 , 0 } , AI= "Cl_Z32_Boss2_Cooper" }     --魯莽的庫柏
							}
	Obj_table.Monster[3] = {
								{ ObjID = { 108662 , 108877 , 108883 } , num = { 1 , 1 , 0 } , AI= "Cl_Z32_Boss2_Guard" } ,    --黑牢門衛
								{ ObjID = { 108663 , 108878 , 108884 } , num = { 1 , 1 , 1 } , AI= "Cl_Z32_Boss2_Cooper" }     --魯莽的庫柏
							}
	Obj_table.Monster[4] = {
								{ ObjID = { 108661 , 108876 , 108882 } , num = { 1 , 1 , 1 } , AI= "Cl_Z32_Boss2_S_Jailer" } , --強壯的獄卒
								{ ObjID = { 108662 , 108877 , 108883 } , num = { 1 , 1 , 1 } , AI= "Cl_Z32_Boss2_Guard" } ,    --黑牢門衛
								{ ObjID = { 108664 , 108879 , 108885 } , num = { 1 , 1 , 0 } , AI= "Cl_Z32_Boss2_Torturer" }   --黑牢拷問者
							}
	Obj_table.Monster[5] = {
								{ ObjID = { 108660 , 108875 , 108881 } , num = { 1 , 1 , 0 } , AI= "Cl_Z32_Boss2_C_Jailer" } , --狡詐的獄卒
								{ ObjID = { 108661 , 108876 , 108882 } , num = { 1 , 1 , 1 } , AI= "Cl_Z32_Boss2_S_Jailer" } , --強壯的獄卒
								{ ObjID = { 108663 , 108878 , 108884 } , num = { 1 , 1 , 1 } , AI= "Cl_Z32_Boss2_Cooper" } ,   --魯莽的庫柏
								{ ObjID = { 108662 , 108877 , 108883 } , num = { 1 , 1 , 0 } , AI= "Cl_Z32_Boss2_Guard" } ,    --黑牢門衛
								{ ObjID = { 108664 , 108879 , 108885 } , num = { 1 , 1 , 0 } , AI= "Cl_Z32_Boss2_Torturer" }   --黑牢拷問者
							}
	return Obj_table
end
function Cl_Z32_Boss2_ResetVar()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	Cl_Z32_Boss2_GlobalVar = Cl_Z32_Boss2_GlobalVar or {}
	Cl_Z32_Boss2_GlobalVar[RoomID] = Cl_Z32_Boss2_GlobalVar[RoomID] or {}
	Cl_Z32_Boss2_GlobalVar[RoomID]["stage"] = 0
	Cl_Z32_Boss2_GlobalVar[RoomID]["CtarlAI"] = OwnerID
	Cl_Z32_Boss2_GlobalVar[RoomID]["PlayerList"] = {}
	Cl_Z32_Boss2_GlobalVar[RoomID].ObjList = {}
	Cl_Z32_Boss2_GlobalVar[RoomID].stageList = {}
	Cl_Z32_Boss2_GlobalVar[RoomID].KeyBuff = {625443,625444,625445,625446,625447}
	Cl_Z32_Boss2_GlobalVar[RoomID].time = 0
	Cl_Z32_Boss2_GlobalVar[RoomID].captain = 0
	Cl_Z32_Boss2_GlobalVar[RoomID].BoxNum = 0
end
function Cl_Z32_Boss2_CreateBoss(OwnerID,RoomID,ObjID)
	local Ox = ReadRoleValue ( OwnerID , EM_RoleValue_X )
	local Oy = ReadRoleValue ( OwnerID , EM_RoleValue_Y )
	local Oz = ReadRoleValue ( OwnerID , EM_RoleValue_Z )
	local ODir = ReadRoleValue ( OwnerID , EM_RoleValue_Dir )
	local Boss = CreateObj( ObjID , Ox , Oy , Oz , ODir , 1 )
	SetModeEx( Boss , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( Boss , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( Boss , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( Boss , EM_SetModeType_Mark, true)			---可點選(是)
	SetModeEx( Boss , EM_SetModeType_ShowRoleHead, true) 		---頭像框(是)
	SetModeEx( Boss , EM_SetModeType_Fight, true) ---可砍殺(是)
	AddToPartition( Boss , RoomID )
	Cl_Z32_Boss2_GlobalVar[RoomID].captain = Boss
	
	Addbuff ( Boss , 500343 , 0 , -1 )
	CallPlot( Boss , "Cl_Z32_Boss2_BossAI" , 0 ) 
	return Boss
end
function Cl_Z32_Boss2_CreateBox(RoomID)
	local BuffTable = {625448,625449,625450,625451,625452}
	local Box = {}
	for i = 1 , 5 , 1 do
		local x , y , z , dir = DW_Location( 781402 , i )--根據旗子位置
		Box[i] = CreateObj( 123511 , x , y , z , dir , 1 )
		SetModeEx( Box[i] , EM_SetModeType_Strikback, false) ---反擊(否)
		SetModeEx( Box[i] , EM_SetModeType_Move, false) ---移動	(否)
		SetModeEx( Box[i] , EM_SetModeType_Searchenemy, false)--索敵(否)
		SetModeEx( Box[i] , EM_SetModeType_Mark, true)			---可點選(是)
		SetModeEx( Box[i] , EM_SetModeType_ShowRoleHead, true) 		---頭像框(是)
		SetModeEx( Box[i] , EM_SetModeType_Fight, false) ---可砍殺(是)
		SetModeEx( Box[i] , EM_SetModeType_NotShowHPMP , true ) ----不顯示寫條  
		SetModeEx( Box[i] , EM_SetModeType_Obstruct , true ) ----不顯示寫條  
		AddToPartition( Box[i] , RoomID )
		Cl_Z32_Boss2_GlobalVar[RoomID].BoxNum = Cl_Z32_Boss2_GlobalVar[RoomID].BoxNum + 1
		local Buffnum = Rand(#BuffTable-1)+1
		Addbuff (  Box[i] , BuffTable[Buffnum] , 0 , -1 )
		SetPlot( Box[i],"touch","Cl_Z32_Boss2_BoxAI",30 ) 
		table.remove(BuffTable,Buffnum)
	end
	return Box
end
function Cl_Z32_Boss2_CreateRune(RoomID)
	local x , y , z , dir = DW_Location( 781402 , RandRange( 6 , 30 ) )--根據旗子位置
	local Rune = CreateObj( 123515 , x , y , z , dir , 1 )
	SetModeEx( Rune , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( Rune , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( Rune , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( Rune , EM_SetModeType_Mark, true)			---可點選(是)
	SetModeEx( Rune , EM_SetModeType_ShowRoleHead, true) 		---頭像框(是)
	SetModeEx( Rune , EM_SetModeType_Fight, true) ---可砍殺(是)
	AddToPartition( Rune , RoomID )
	if #Cl_Z32_Boss2_GlobalVar[RoomID].KeyBuff > 0 then
		local Buffnum = Rand(#Cl_Z32_Boss2_GlobalVar[RoomID].KeyBuff-1)
		WriteRoleValue( Rune , EM_RoleValue_PID , Cl_Z32_Boss2_GlobalVar[RoomID].KeyBuff[Buffnum+1] )
		table.remove(Cl_Z32_Boss2_GlobalVar[RoomID].KeyBuff,Buffnum+1)
	end
	--[[]]--
	
	Cl_Z32_Boss2_GlobalVar[RoomID].ObjList[#Cl_Z32_Boss2_GlobalVar[RoomID].ObjList+1] = Rune
	SetPlot( Rune,"touch","Cl_Z32_Boss2_RuneAI",30 )
	return
end
function Cl_Z32_Boss2_CreateMonster(RoomID,stage,ObjID,Diff)
	for i = 1 , #ObjID.Monster[stage] , 1 do
		for z = 1 , ObjID.Monster[stage][i].num[Diff] , 1 do
			local x , y , z , dir = DW_Location( 781402 , 0 )--根據旗子位置
			local Monster = CreateObj( ObjID.Monster[stage][i].ObjID[Diff] , x , y , z , dir , 1 )
			AddToPartition( Monster , RoomID )
			Cl_Z32_Boss2_GlobalVar[RoomID].ObjList[#Cl_Z32_Boss2_GlobalVar[RoomID].ObjList+1] = Monster
			--Cl_Z32_Boss2_GlobalVar[RoomID].stageList[#Cl_Z32_Boss2_GlobalVar[RoomID].stageList+1] = Monster
			CallPlot( Monster , ObjID.Monster[stage][i].AI , 0 ) 
		end
	end
	return
end
function Cl_Z32_Boss2_CreateDoor(RoomID)
	local x , y , z , dir = DW_Location( 781402 , 0 )--根據旗子位置
	local Door = CreateObj( 105947 , x , y , z , dir , 1 )
	SetModeEx( Door , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( Door , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( Door , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( Door , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( Door , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( Door , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( Door , EM_SetModeType_NotShowHPMP , true ) ----不顯示寫條  
	SetModeEx( Door , EM_SetModeType_Obstruct , true ) ----不顯示寫條  
	AddToPartition( Door , RoomID )
	return Door
end
function Cl_Z32_Boss2_CreateDrop(RoomID)
	local x , y , z , dir = DW_Location( 781402 , 31 )--根據旗子位置
	local ObjID = Cl_Z32_Boss2_ObjList()
	local Diff = Cl_Z32_Boss_Difficulty()
	local DropBox = CreateObj( ObjID.Box[Diff] , x , y , z , dir , 1 )
	SetModeEx( DropBox , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( DropBox , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( DropBox , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( DropBox , EM_SetModeType_Mark, true)			---可點選(是)
	SetModeEx( DropBox , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( DropBox , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( DropBox , EM_SetModeType_NotShowHPMP , true ) ----不顯示寫條   
	AddToPartition( DropBox , RoomID )
	return DropBox
end
function Cl_Z32_Boss2_CrtlAI()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local ObjID = Cl_Z32_Boss2_ObjList()
	local Diff = Cl_Z32_Boss_Difficulty()
	--local Diff = Cl_Z32_Boss_Difficulty()
	Cl_Z32_Boss2_ResetVar()
	local Boss = Cl_Z32_Boss2_CreateBoss( OwnerID , RoomID , ObjID.captain[Diff] )
	local exitDoor = Cl_Z32_Boss3_CreateDoor(RoomID,32)
	local Box = Cl_Z32_Boss2_CreateBox(RoomID)
	local CombatBegin = false
	local Door = 0
	local stage = 1
	while Cl_Z32_Boss2_GlobalVar[RoomID]["stage"] ~= 4 do
		sleep( 10 )
		--[[for i = 1 , #Cl_Z32_Boss2_GlobalVar[RoomID].KeyBuff , 1 do
			say( Boss , "BuffID="..Cl_Z32_Boss2_GlobalVar[RoomID].KeyBuff[i] )
		end
		say( Boss , "------------" )]]--
		if Cl_Z32_Boss2_GlobalVar[RoomID]["stage"] == 1 then
			if CombatBegin == false then
				Cl_Resist_HackersFightBegin( Boss )
				ScriptMessage( OwnerID , -1 , 2 , "[SC_108684_ENGAGE]" , 2 )
				Door = Cl_Z32_Boss2_CreateDoor(RoomID)
				Cl_Z32_Boss2_CreateMonster(RoomID,stage,ObjID,Diff)
				CombatBegin = true
			end
			if CombatBegin == true then
				Cl_Z32_Boss2_GlobalVar[RoomID].time = Cl_Z32_Boss2_GlobalVar[RoomID].time + 1
				--Say( Cl_Z32_Boss2_GlobalVar[RoomID]["PlayerList"][1] , "1111" )
				if Cl_Z32_Boss2_GlobalVar[RoomID].time%90 == 0 then
					stage = stage + 1
					ScriptMessage( OwnerID , -1 , 2 , "[SC_108684_03]" , 2 )
				end
				if stage <= 5 then
					Cl_Z32_Boss_stageAI(stage,Cl_Z32_Boss2_GlobalVar[RoomID].time%90,ObjID)
				elseif stage >= 6 then
					--Cl_Z32_Boss2_GlobalVar[RoomID]["stage"] = 4
					ScriptMessage( OwnerID , 0 , 2 , "[$MUTE]".."[SC_108684_RAID]" , 0 )
					
					KillID( Boss , Boss ) --104607 --Cl_Z32_Boss3_CrtlAI
				end
			end
		elseif Cl_Z32_Boss2_GlobalVar[RoomID]["stage"] == 2 then
			--ScriptMessage( OwnerID , -1 , 2 , "AI Failure" , 2 )
			sleep( 50 )
			
			Cl_Z32_Boss2_GlobalVar[RoomID]["stage"] = 3
		elseif Cl_Z32_Boss2_GlobalVar[RoomID]["stage"] == 3 then
			ScriptMessage( OwnerID , -1 , 2 , "[SC_108684_RESET]" , 2 )
			if CombatBegin == true then
				Delobj( Door )
				Delobj( Boss )
				for i = 1 , #Cl_Z32_Boss2_GlobalVar[RoomID].ObjList , 1 do
					if CheckID( Cl_Z32_Boss2_GlobalVar[RoomID].ObjList[i] ) == true then
						Delobj( Cl_Z32_Boss2_GlobalVar[RoomID].ObjList[i] )
					end
				end
				for i = 1 , #Box , 1 do
					if CheckID( Box[i] ) == true then
						Delobj( Box[i] )
					end
				end
				CombatBegin = false
			end
			sleep( 30 )
			Cl_Z32_Boss2_ResetVar()
			Boss = Cl_Z32_Boss2_CreateBoss( OwnerID , RoomID , ObjID.captain[Diff] )
			Box = Cl_Z32_Boss2_CreateBox(RoomID)
			Cl_Z32_Boss2_GlobalVar[RoomID]["stage"] = 0
			stage = 1
		end
		
	end
	if CombatBegin == true then
		Delobj( Door )
		
		for i = 1 , #Box , 1 do
			if CheckID( Box[i] ) == true then
				Delobj( Box[i] )
			end
		end
		for i = 1 , #Cl_Z32_Boss2_GlobalVar[RoomID].ObjList , 1 do
			if CheckID( Cl_Z32_Boss2_GlobalVar[RoomID].ObjList[i] ) == true then
				Delobj( Cl_Z32_Boss2_GlobalVar[RoomID].ObjList[i] )
			end
		end
		CombatBegin = false
	end
	Delobj( exitDoor )
	Cl_Resist_HackersBossDead(Boss)
	CancelBuff_NoEvent( Boss , 500343 ) 
	--Say( Boss , GetName( Cl_Z32_Boss2_GlobalVar[RoomID]["PlayerList"][1] ) )
	ScriptMessage( OwnerID , -1 , 2 , "[SC_108684_DEATH]" , 2 )
	Delobj( Boss )
	local Drop = Cl_Z32_Boss2_CreateDrop(RoomID)
	KillID( Cl_Z32_Boss2_GlobalVar[RoomID]["PlayerList"][1] , Drop )
	--say( OwnerID , "Stop" )
end

function Cl_Z32_Boss_stageAI(stage,time,ObjID)
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local Diff = Cl_Z32_Boss_Difficulty()
	--local Diff = Cl_Z32_Boss_Difficulty()
	--say( OwnerID , "Cl_Z32_Boss_stageAI time="..time )
	if time == 20 then
		ScriptMessage( OwnerID , -1 , 2 , "[SC_108684_04]" , 2 )
		Cl_Z32_Boss2_CreateRune(RoomID)
	end
	if time%20 == 0 then
		Cl_Z32_Boss2_CreateMonster(RoomID,stage,ObjID,Diff) --暫時不出怪
	end
end
function Cl_Z32_Text_RuneAI()
	SetPlot( OwnerID(),"touch","Cl_Z32_Boss2_RuneAI",30 )
end
function Cl_Z32_Boss2_RuneAI()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local TargetID = TargetID()
	local BuffID = ReadRoleValue ( TargetID , EM_RoleValue_PID )
	if BuffID ~= 0 then
		WriteRoleValue( TargetID , EM_RoleValue_PID , 0 )
		Addbuff ( OwnerID , BuffID , 0 , -1 )
		Delobj( TargetID )
	end
end
function Cl_Z32_Boss2_BossAI()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local CombatBegin = 0
	SetPlot( OwnerID, "dead","Cl_Z32_Boss2_BossDead", 0 )
	while Cl_Z32_Boss2_GlobalVar[RoomID]["stage"] ~= 4 do
		Cl_Z32_Boss2_GlobalVar[RoomID]["PlayerList"] = {}
		SysCastSpellLv( OwnerID , OwnerID , 493404 , 0 ) 
		--LuaP_Dazed() 
		sleep( 10 )
		------say( OwnerID , "PlayerList="..#Cl_Z32_Boss2_GlobalVar[RoomID]["PlayerList"] )
		if #Cl_Z32_Boss2_GlobalVar[RoomID]["PlayerList"] ~= 0 then
			if CombatBegin == 0 then
				CombatBegin = 1
				Cl_Z32_Boss2_GlobalVar[RoomID]["stage"] = 1
			end
		elseif #Cl_Z32_Boss2_GlobalVar[RoomID]["PlayerList"]  == 0 then
			if CombatBegin == 1 then
				CombatBegin = 0
				Cl_Z32_Boss2_GlobalVar[RoomID]["stage"] = 3
			end
		end
	end
	Cl_Z32_Boss2_GlobalVar[RoomID]["PlayerList"] = {}
end
function Cl_Z32_Boss2_BoxAI()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	for i = 0 , 4 , 1 do
		if CheckBuff( TargetID , 625448+i ) == true then
			if CheckBuff( OwnerID , 625443+i ) == true then
				CancelBuff_NoEvent( OwnerID , 625443+i ) 
				Delobj( TargetID )
				Cl_Z32_Boss2_GlobalVar[RoomID].BoxNum = Cl_Z32_Boss2_GlobalVar[RoomID].BoxNum - 1
				local _message = "[$MUTE]"..GetName( OwnerID ).."[SC_108684_01]".."["..tostring( 625448+i ).."]";--XXX已經解開了OO結界鎖
				ScriptMessage( TargetID , -1 , 2 , _message , 0 );
				if Cl_Z32_Boss2_GlobalVar[RoomID].BoxNum == 0 then
					Cl_Z32_Boss2_GlobalVar[RoomID]["stage"] = 4
				end
				return
			else
				ScriptMessage( TargetID , -1 , 2 , "[SC_108684_02]" , 0 );
			end
		end
	end
end
function Cl_Cl_Z32_Boss2_CheckRang()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local TargetID = TargetID()
	if ReadRoleValue ( TargetID , EM_RoleValue_VOC ) ~= 0 and
		ReadRoleValue( TargetID , EM_RoleValue_IsDead ) ~= 1 and
		GetModeEx( TargetID , EM_SetModeType_Fight ) ~= false then
		local num = #Cl_Z32_Boss2_GlobalVar[RoomID]["PlayerList"]
		Cl_Z32_Boss2_GlobalVar[RoomID]["PlayerList"][num+1] = TargetID
	end
end
function Cl_Z32_Boss2_BossDead()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	Cl_Z32_Boss2_GlobalVar[RoomID]["stage"] = 3
end

function Cl_Z32_Boss2_revisetime()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local time = Cl_Z32_Boss2_GlobalVar[RoomID].time
	local num = (10 - time%90%10 )
	Cl_Z32_Boss2_GlobalVar[RoomID].time = Cl_Z32_Boss2_GlobalVar[RoomID].time + ( num - 1 )
end
function Cl_Z32_Boss2_MonsterDead()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	if #Cl_Z32_Boss2_GlobalVar[RoomID].stageList ~= 0 then
		for i = 1 , #Cl_Z32_Boss2_GlobalVar[RoomID].stageList , 1 do
			if Cl_Z32_Boss2_GlobalVar[RoomID].stageList[i] == OwnerID then
				table.remove(Cl_Z32_Boss2_GlobalVar[RoomID].stageList,i)
				break
			end
		end
	end
end
function Cl_Z32_Boss2_KeyDrop()
	local OwnerID = OwnerID()
	for i = 0 , 4 , 1 do
		if CheckBuff( OwnerID , 625443+i ) == true then
			CancelBuff_NoEvent( OwnerID , 625443+i ) 
			local Ox = ReadRoleValue ( OwnerID , EM_RoleValue_X )
			local Oy = ReadRoleValue ( OwnerID , EM_RoleValue_Y )
			local Oz = ReadRoleValue ( OwnerID , EM_RoleValue_Z )
			local ODir = ReadRoleValue ( OwnerID , EM_RoleValue_Dir )
			
			local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
			local Rune = CreateObj( 123515 , Ox , Oy , Oz , ODir , 1 )
			SetModeEx( Rune , EM_SetModeType_Strikback, false) ---反擊(否)
			SetModeEx( Rune , EM_SetModeType_Move, false) ---移動	(否)
			SetModeEx( Rune , EM_SetModeType_Searchenemy, false)--索敵(否)
			SetModeEx( Rune , EM_SetModeType_Mark, true)			---可點選(是)
			SetModeEx( Rune , EM_SetModeType_ShowRoleHead, true) 		---頭像框(是)
			SetModeEx( Rune , EM_SetModeType_Fight, false) ---可砍殺(是)
			AddToPartition( Rune , RoomID )
			
			WriteRoleValue( Rune , EM_RoleValue_PID , 625443+i )
			
			Cl_Z32_Boss2_GlobalVar[RoomID].ObjList[#Cl_Z32_Boss2_GlobalVar[RoomID].ObjList+1] = Rune
			SetPlot( Rune,"touch","Cl_Z32_Boss2_RuneAI",30 )
			break
		end
	end
end
function Cl_Z32_Boss2_C_Jailer()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	sleep( 10 )
	SetAttack( OwnerID , Cl_Z32_Boss2_GlobalVar[RoomID].captain )
	if CheckBuff( Cl_Z32_Boss2_GlobalVar[RoomID].captain , 508071 ) == true then
		 AddBuff( OwnerID , 508071 , 0, -1 )
	end
	SysCastSpellLv( Cl_Z32_Boss2_GlobalVar[RoomID].captain , OwnerID , 493408 , 0 ) 
end
function Cl_Z32_Boss2_S_Jailer()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	sleep( 10 )
	SetAttack( OwnerID , Cl_Z32_Boss2_GlobalVar[RoomID].captain )
	if CheckBuff( Cl_Z32_Boss2_GlobalVar[RoomID].captain , 508071 ) == true then
		 AddBuff( OwnerID , 508071 , 0, -1 )
	end
end
function Cl_Z32_Boss2_Cooper(Var)
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	sleep( 10 )
	SetAttack( OwnerID , Cl_Z32_Boss2_GlobalVar[RoomID].captain )
	if CheckBuff( Cl_Z32_Boss2_GlobalVar[RoomID].captain , 508071 ) == true then
		 AddBuff( OwnerID , 508071 , 0, -1 )
	end
	if Var == 0 or Var == nil then
		local Ox = ReadRoleValue ( OwnerID , EM_RoleValue_X )
		local Oy = ReadRoleValue ( OwnerID , EM_RoleValue_Y )
		local Oz = ReadRoleValue ( OwnerID , EM_RoleValue_Z )
		local ODir = ReadRoleValue ( OwnerID , EM_RoleValue_Dir )
		local OrgID = ReadRoleValue ( OwnerID , EM_RoleValue_OrgID  )
		local Cooper = CreateObj( OrgID , Ox , Oy , Oz , ODir , 1 )
		AddToPartition( Cooper , RoomID )	
		WriteRoleValue( Cooper , EM_RoleValue_PID , OwnerID )
		WriteRoleValue( OwnerID , EM_RoleValue_PID , Cooper )
		CallPlot( Cooper , "Cl_Z32_Boss2_Cooper" , 1 ) 
	end
	local Partner = ReadRoleValue ( OwnerID , EM_RoleValue_PID  )
	local DeadTime = 0
	while Cl_Z32_Boss2_GlobalVar[RoomID]["stage"] ~= 4 do
	--while true do
		sleep( 10 )
		SysCastSpellLv( OwnerID , OwnerID , 493410 , 0 ) 
		if ReadRoleValue( Partner , EM_RoleValue_IsDead ) == 1 or
			CheckID( Partner ) ~= true then
			DeadTime = DeadTime + 1
			----say( OwnerID , "DeadTime="..DeadTime )
			if DeadTime%10 == 0 then
				Ox = ReadRoleValue ( OwnerID , EM_RoleValue_X )
				Oy = ReadRoleValue ( OwnerID , EM_RoleValue_Y )
				Oz = ReadRoleValue ( OwnerID , EM_RoleValue_Z )
				ODir = ReadRoleValue ( OwnerID , EM_RoleValue_Dir )
				OrgID = ReadRoleValue ( OwnerID , EM_RoleValue_OrgID  )
				Cooper = CreateObj( OrgID , Ox , Oy , Oz , ODir , 1 )
				AddToPartition( Cooper , RoomID )	
				WriteRoleValue( Cooper , EM_RoleValue_PID , OwnerID )
				WriteRoleValue( OwnerID , EM_RoleValue_PID , Cooper )
				CallPlot( Cooper , "Cl_Z32_Boss2_Cooper" , 1 ) 
				DeadTime = 0
			end
		end
	end
	while ReadRoleValue( OwnerID , EM_RoleValue_IsAttackMode ) ~= 1 do
		sleep( 10 )
	end
	delobj( OwnerID )
end
function Cl_Z32_Boss2_CheckIsCooper()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local OrgID = ReadRoleValue ( OwnerID , EM_RoleValue_OrgID  )
	if ReadRoleValue ( TargetID , EM_RoleValue_OrgID  ) == OrgID and 
		TargetID ~= OwnerID then
		return true
	else
		return false
	end
end
function Cl_Z32_Boss2_Guard()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	sleep( 10 )
	SetAttack( OwnerID , Cl_Z32_Boss2_GlobalVar[RoomID].captain )
	if CheckBuff( Cl_Z32_Boss2_GlobalVar[RoomID].captain , 508071 ) == true then
		 AddBuff( OwnerID , 508071 , 0, -1 )
	end
	SysCastSpellLv( Cl_Z32_Boss2_GlobalVar[RoomID].captain , OwnerID , 493408 , 0 ) 
end
function Cl_Z32_Boss2_Torturer()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	sleep( 10 )
	SetAttack( OwnerID , Cl_Z32_Boss2_GlobalVar[RoomID].captain )
	if CheckBuff( Cl_Z32_Boss2_GlobalVar[RoomID].captain , 508071 ) == true then
		 AddBuff( OwnerID , 508071 , 0, -1 )
	end
	SysCastSpellLv( Cl_Z32_Boss2_GlobalVar[RoomID].captain , OwnerID , 493408 , 0 ) 
end
function Cl_Z32_Boss2_CheckStage()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	if Cl_Z32_Boss2_GlobalVar[RoomID]["stage"] ~= 1 then
		
	end
end
----------------
function Cl_Z32_Boss2_GameOver()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	Cl_Z32_Boss2_GlobalVar[RoomID]["stage"] = 4
end
function Cl_text_time()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	Cl_Z32_Boss2_ResetVar()
	local x , y , z , dir = DW_Location( 781402 , RandRange( 6 , 30 ) )--根據旗子位置
	Rune = CreateObj( 123515 , x , y , z , dir , 1 )
	SetModeEx( Rune , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( Rune , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( Rune , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( Rune , EM_SetModeType_Mark, true)			---可點選(是)
	SetModeEx( Rune , EM_SetModeType_ShowRoleHead, true) 		---頭像框(是)
	SetModeEx( Rune , EM_SetModeType_Fight, true) ---可砍殺(是)
	SetModeEx( Rune , EM_SetModeType_NotShowHPMP , true ) ----不顯示寫條  
	AddToPartition( Rune , RoomID )
	
	if #Cl_Z32_Boss2_GlobalVar[RoomID].KeyBuff > 0 then
		local Buffnum = Rand(#Cl_Z32_Boss2_GlobalVar[RoomID].KeyBuff-1)
		WriteRoleValue( Rune , EM_RoleValue_PID , Cl_Z32_Boss2_GlobalVar[RoomID].KeyBuff[Buffnum+1] )
		table.remove(Cl_Z32_Boss2_GlobalVar[RoomID].KeyBuff,Buffnum+1)
	else
		----say( OwnerID , "No Buff" )
	end

	Cl_Z32_Boss2_GlobalVar[RoomID].ObjList[#Cl_Z32_Boss2_GlobalVar[RoomID].ObjList+1] = Rune
	SetPlot( Rune,"touch","Cl_Z32_Boss2_RuneAI",30 )
end
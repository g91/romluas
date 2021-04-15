function LuaI_202PQ_ControlCenter() 
	local NumSet = { 70 , 30 , 1 } 
	local TimeSet = { 0 , 300 , 300 , 300 } 
	LuaPQ_CreatePQStage(NumSet,TimeSet) 
	LuaI_PQ_ControlCenter() 
end

function  LuaI_202PQ_Stage1_Obj() --清除小怪
	sleep( 10 + DW_Rand(10)) 
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 10 )
	SetPlot( OwnerID() , "dead" , "LuaI_202PQ_Stage1_Obj_Dead" , 0 ) 
	LuaI_PQ_ObjectController_RH()
end

function LuaI_202PQ_Stage1_Obj_Dead()
	local Stage = LuaPQ_GetStage() 
	if Stage == 1 then
		LuaPQ_ChangeNum(1) 
		ScriptMessage( TargetID() , TargetID() , 0 , "[SC_ZONE205PQ_STAGE1_GIVE]" , 0 )
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_ZONE205PQ_STAGE1_GIVE]" , 0 )
		GiveBodyItem( TargetID() , 204980 , DW_Rand(3) )
	end
	return true
end

function  LuaI_202PQ_Stage3_Obj() --打王
	sleep( 10 + DW_Rand(10)) 
--	DebugLog( 2, "XXX 205 KING Create!! XXX" )
	SetPosByFlag( OwnerID(), 780017 , 1 )
--	DebugLog( 2, "XXX 205 KING FLAG SET!! XXX" )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 3 )
--	DebugLog( 2, "XXX 205 KING PID SET!! XXX" )
	SetPlot( OwnerID() , "dead" , "LuaI_202PQ_Stage3_Obj_Dead" , 0 ) 
--	DebugLog( 2, "XXX 205 KING DEAD PLOT SET!! XXX" )
	LuaI_PQ_ObjectController()
end

function LuaI_202PQ_Stage3_Obj_Dead()
	local Stage = LuaPQ_GetStage() 
	local Reward = {}
	local Number = {300,250,250,200,200,150,150,100,100,50}
	if Stage == 3 then
		LuaPQ_ChangeNum(1) 
		local HateList = Lua_HateListPos(10) 
		local Hate = HateListInfo(OwnerID() ,HateList[1] , EM_HateListInfoType_HatePoint ) 
		local pry = 1
		for i = 1 , HateListCount( OwnerID() ) , 1 do
--			Say( OwnerID() , HateList[i].. " : "..GetName(HateListInfo(OwnerID() ,HateList[i] , EM_HateListInfoType_GItemID )).." HateValue is "..HateListInfo(OwnerID() ,HateList[i], EM_HateListInfoType_HatePoint ) )
			if HateList[i]  ~= -1 and  HateListInfo(OwnerID() , HateList[i]  , EM_HateListInfoType_HatePoint ) >= Hate/100 then
				Reward[pry] = HateListInfo(OwnerID() ,HateList[i] , EM_HateListInfoType_GItemID )
				pry = pry + 1
			end
		end
		for pry , obj in pairs( Reward ) do
			local Give = 0
			if CheckID(Obj) == true and ReadRoleValue( Obj , EM_RoleValue_IsPlayer ) == 1 then
				if pry > table.getn(Number) then
					Give =  table.getn(Number) 
				else
					Give = pry
				end
				if CheckID(Obj) == true then
					if ReadRoleValue( Obj , EM_RoleValue_VOC ) == 5 then
						GiveBodyItem( obj , 204980 , Number[pry] +DW_Rand(100) )
					else
						GiveBodyItem( obj , 204980 , Number[pry] +DW_Rand(50) )
					end
				end
			end	
		end		
	end
	return true
end

function LuaI_202PQ_Stage2_Obj() --產生運屍人的物件
	sleep( 10 + DW_Rand(10)) 
	SetPosByFlag( OwnerID(), 780017 , 1 )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 2 )
	SetPlot( OwnerID() , "dead" , "LuaI_202PQ_Stage2_Obj_Dead" , 0 ) 
	BeginPlot( OwnerID() , "LuaI_202PQ_Corpse" , 0 )
	LuaI_PQ_ObjectController()
end

function LuaI_202PQ_Stage2_Obj_Dead()
	GiveBodyItem( TargetID() , 205038 , 1 )
	return true
end

function LuaI_202PQ_Corpse()
	while 1 do
		if ReadRoleValue( OwnerID() , EM_RoleValue_Register + 9 ) > 0 then
			break
		end
		sleep( 10 )
	end
	local RoomID = ReadRoleValue(  OwnerID() , EM_RoleValue_RoomID )
	Hide( OwnerID() )
	SetModeEx( OwnerID() , EM_SetModeType_Strikback , false)
	SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , false )
	SetModeEx( OwnerID() , EM_SetModeType_Fight , false )
	SetFlag( OwnerID() , 540820 , 0 )
	Show( OwnerID() , RoomID)
end

function LuaI_113025_0()
	local BuffID = 503604
	AddBuff( OwnerID() , BuffID , 1 , -1 )
	SetFollow( OwnerID(), TargetID() )
	While 1 do
		if ReadRoleValue( TargetID()  , EM_RoleValue_Register + 9 ) == 0 then
			if LuaPQ_GetStage() ~= 3 then
				DelObj( OwnerID() )
				return
			else
				break
			end
		end
		if CheckID(TargetID()) == false or ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1 then
			break
		end
		sleep( 10 )
	end
	CancelBuff_NoEvent( OwnerID() , BuffID)
	SetFightMode( OwnerID() , 0 , 0 , 0 , 0 )
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	sleep( 30 )
	BeginPlot( OwnerID() , "LuaI_113025_3" , 0 )
	SetPlot( OwnerID() , "touch" , "LuaI_113025_1" ,  20 )
end

function LuaI_113025_1()
	if CountBodyItem( OwnerID() , 205038 ) > 0 then
		DelBodyItem( OwnerID() , 205038 , 1 )
		SetPlot( TargetID() , "touch" , "" ,  0 )
		BeginPlot( targetID() , "LuaI_113025_2" , 0 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_113025_0]" , 0)
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_113025_0]" , 0)
	end
end

function LuaI_113025_2()
	AddBuff( OwnerID() , 503605 , 1 , -1 )
	local Stage = LuaPQ_GetStage() 
	if Stage == 2 then
		LuaPQ_ChangeNum(1) 
		GiveBodyItem( TargetID() , 204980 , 15 )
	end
	PlayMotionEX( OwnerID(), 0 , 0 )
	sleep(5)
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_BUFF_INSTANT)
	sleep(15)
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_BUFF_INSTANT)
	sleep(15)
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_BUFF_INSTANT)
	sleep(15)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Me = Role:new( OwnerID() )
	local Ashes = CreateObj( 113067 , Me:X() , Me:Y() , Me:Z() , Me:Dir() , 1 )
	WriteRoleValue( Ashes , EM_RoleValue_LiveTime , 30 )
	Hide( OwnerID() )
	AddToPartition( Ashes , RoomID )
	DelObj( OwnerID() )
end

function LuaI_113025_3()
	while 1 do
		local Stage = LuaPQ_GetStage() 
		if Stage == 1 or Stage == 0 then
			Deloj( OwnerID() )
			return
		end
		if Stage == 3 then
			break
		end
		sleep( 10 )
	end
	local Me= Role:new( OwnerID() )
	local Skeleton= CreateObj( 102128 , Me:X() ,Me:Y() ,Me:Z() ,Me:Dir() ,1) 
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	Hide( OwnerID() )
	AddToPartition( Skeleton , RoomID )
	WriteRoleValue( Skeleton, EM_RoleValue_PID , 3 )
	BeginPlot( Skeleton , "LuaI_113025_4" , 0 )
	sleep( 10 )
	DelObj( OwnerID() )
end
function LuaI_113025_4()

	local OrgX = ReadRoleValue( OwnerID() , EM_RoleValue_X )
	local OrgZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z )
	local X , Y , Z = 0 , 0 , 0
	local T = 0
	while 1 do
		local Stage = LuaPQ_GetStage() 
		if Stage ~= 3 then
			break
		end
		if HateListCount( OwnerID() ) < 1 and T == 0 then
			X = OrgX + DW_Rand(30)*(-1^DW_Rand(2))
			Z = OrgZ + DW_Rand(30)*(-1^DW_Rand(2))
			Y= GetHeight( X , ReadRoleValue( OwnerID() , EM_RoleValue_Y) , Z );
			Move( OwnerID() , X, Y ,Z )
		end
		sleep( 10 )
		T = T +1
		if T >= 7 then
			T = 0
		end
	end
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	sleep( 15 )
	Delobj( OwnerID() )
end

function LuaI_113026_0()
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 23 )
	BeginPlot( OwnerID() , "LuaI_113026_1" , 0 )
	LuaI_PQ_ObjectController()
end

function LuaI_113026_1() --臨時用進度公佈劇情
	sleep( 20 )
	local Stage = 0
	local OrgNum = 0
	local Num = 0
	local OrgTime = 0
	local Time = 0
	local String = {[0] = "[SC_ZONE205PQ_STAGE0]" , [1] = "[SC_ZONE205PQ_STAGE1]" , [2] = "[SC_ZONE205PQ_STAGE2]" , [3] = "[SC_ZONE205PQ_STAGE3]"}
	local StoryString = {[0] = "NO" , [1] = "[SC_ZONE205PQ_STORY1]" , [2] = "[SC_ZONE205PQ_STORY2]" , [3] = "[SC_ZONE205PQ_STORY3]"}
	local StageString = {[0] = "[SC_ZONE205PQ_NAMES0]" , [1] = "[SC_ZONE205PQ_NAMES1]" , [2] = "[SC_ZONE205PQ_NAMES2]" , [3] = "[SC_ZONE205PQ_NAMES3]"}
	local CountString = {[0] = "NO" , [1] = "[SC_ZONE205PQ_COUNT1]" , [2] = "[SC_ZONE205PQ_COUNT2]" , [3] = "[SC_ZONE205PQ_COUNT3]"}
	local TimerString = {[0] = "[SC_ZONE205PQ_TIMER0]" , [1] = "NO" , [2] = "[SC_ZONE205PQ_TIMER2]" , [3] = "[SC_ZONE205PQ_TIMER3]"}
	local TempStr = ""
	local Counter = 0

	while 1 do
		OrgNum = math.abs(LuaPQ_GetOrgNum())
		OrgTime = math.abs(LuaPQ_GetOrgTime())

		if  Stage ~= LuaPQ_GetStage() then
			Stage = LuaPQ_GetStage() 
			if String[Stage] ~="NO" then
				ScriptMessage( OwnerID() , -1 , 1, String[Stage] , 0 ) --更換階段後的訊息
				ScriptMessage( OwnerID() , -1 , 0, String[Stage] , 0 )
			end
			if StoryString[Stage] ~= "NO" then
				ScriptMessage( OwnerID() , -1 , 0, StoryString[Stage] , 0 )--劇情提示訊息
			end
			ScriptMessage( OwnerID() , -1 , 0, StageString[Stage] , 0 )--劇情提示訊息
			if OrgNum ~= 0 then
				Num = LuaPQ_GetNum()
				TempStr = CountString[Stage].."[$SETVAR1="..OrgNum.."][$SETVAR2="..Num.."]"
				ScriptMessage( OwnerID() , -1 , 0,TempStr  , 0 )--劇情提示訊息
			end
			if OrgTime ~= 0 then
				Time = LuaPQ_GetTime()
				TempStr = TimerString[Stage].."[$SETVAR1="..Time.."]"
				ScriptMessage( OwnerID() , -1 , 0, TempStr  , 0 )--劇情提示訊息
			end
		end

		if OrgTime ~= 0 then
			Time = LuaPQ_GetTime()
			if Time ~= OrgTime and ( (Counter == 30 and Time >= 30 ) or Time <= 10 ) then
				ScriptMessage( OwnerID() , -1 , 0, StageString[Stage] , 0 )--劇情提示訊息
				TempStr = TimerString[Stage].."[$SETVAR1="..Time.."]"
				ScriptMessage( OwnerID() , -1 , 0, TempStr , 0 )--劇情提示訊息
			end
		end

		if OrgNum ~= 0 and ( Num ~= LuaPQ_GetNum() or (Num == LuaPQ_GetNum() and Counter == 30 ) ) then
			if OrgTime == 0 then
				ScriptMessage( OwnerID() , -1 , 0, StageString[Stage] , 0 )--劇情提示訊息
			end
			Num = LuaPQ_GetNum()
			TempStr = CountString[Stage].."[$SETVAR1="..OrgNum.."][$SETVAR2="..Num.."]"
			ScriptMessage( OwnerID() , -1 , 0,TempStr  , 0 )--劇情提示訊息
		end

		if Counter == 30 then

			Counter = 0 
		end

		sleep( 10 )
		Counter  = Counter  + 1
	end
end

function LuaP_102127_Point()
	if CheckFlag( OwnerID() , 540820 ) == false then
--		Say( OwnerID() , "DO" )
		local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		SetModeEx( OwnerID() , EM_SetModeType_Strikback , true)
		SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , true )
		SetModeEx( OwnerID() , EM_SetModeType_Fight , true )
		SetFlag( OwnerID() , 540820 , 1 )
		Hide( OwnerID() )
		Show( OwnerID() , RoomID )
		local Corpse = Lua_CreateObjByDir( OwnerID() , 113025 , -10 , 0) 
--		SetModeEX( Corpse , EM_SetModeType_Gravity , false )
		AddToPartition( Corpse , RoomID )
		BeginPlot( Corpse , "LuaI_113025_0" , 0 )
	else
--		Say( OwnerID() , "fali" )
	end
end

function LuaQ_422392_AfterClick()
	Delobj( TargetID() )
	return true
end
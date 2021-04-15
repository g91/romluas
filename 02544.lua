--誕生之地使用=======================================
function LuaPG_Trans_Dead()
	local NPC = OwnerID()
	local RoomID = ReadRoleValue(NPC, EM_RoleValue_RoomID)
	local Player = TargetID()
	Hide(NPC)
	local New_Trans = DW_CreateObjEX("obj", 106469, NPC)
	LuaPG_SetMode(New_Trans)
	
	Lua_ZonePE_3th_GetScore(1)
	CallPlot(New_Trans, "LuaPG_Del_Broken",New_Trans )
end

function LuaPG_Del_Broken(New_Trans)
	Sleep(80)
	DelObj(New_Trans)
end

function LuaPG_Process_Dead()
	local NPC = OwnerID()
	local RoomID = ReadRoleValue(NPC, EM_RoleValue_RoomID)
	local Player = TargetID()
	Hide(NPC)
	local New_Process = DW_CreateObjEX("obj", 106470, NPC)
	LuaPG_SetMode(New_Process)

	Lua_ZonePE_3th_GetScore(1)
	CallPlot(New_Process, "LuaPG_Del_Process",New_Process )
end

function LuaPG_Del_Process(New_Process)
	Sleep(80)
	DelObj(New_Process)
end

function LuaPG_Draw_Dead()
	local NPC = OwnerID()
	local RoomID = ReadRoleValue(NPC, EM_RoleValue_RoomID)
	local Player = TargetID()
	Hide(NPC)
	local New_Draw = DW_CreateObjEX("obj", 106471, NPC)
	LuaPG_SetMode(New_Draw)

	Lua_ZonePE_3th_GetScore(1)
	CallPlot(New_Draw, "LuaPG_Del_Draw",New_Draw )
end

function LuaPG_Del_Draw(New_Draw)
	Sleep(80)
	DelObj(New_Draw)
end

function LuaPG_SetMode(Obj)
	SetModeEx(Obj, EM_SetModeType_NotShowHPMP, true )
	AddBuff(Obj,621170,0,10)
--	SetModeEx( Obj  ,EM_SetModeType_Mark , false ) 	--標記
	SetModeEx( Obj  ,EM_SetModeType_Fight , false )	--砍殺
	SetModeEx( Obj  ,EM_SetModeType_Move , false ) 	--移動
	SetModeEx( Obj  ,EM_SetModeType_Obstruct , true ) 	--阻擋
--	SetModeEx( Obj  ,EM_SetModeType_ShowRoleHead , false ) --頭像框	
end

function LuaPG_Trans_Buff()
	AddBuff(OwnerID, 622311, 1, -1)
	CastSpell(OwnerID(), OwnerID(), 498520)	
end

function LuaPG_Stone_Buff_01()
	local Target = SearchRangeNPC( OwnerID(), 40 )	
	local Num = table.getn(Target)	
	local j=0
--	Say(OwnerID(), Num)	
	local OrgID =ReadRoleValue(TargetID(), EM_RoleValue_OrgID)

	for i = 0,Num do
		OrgID = ReadRoleValue(Target[i], EM_RoleValue_OrgID)
			if OrgID == 119739 or OrgID ==119958 or OrgID ==119959  then
				j=i
				break
			end	
	end

	if OrgID == 119739 or OrgID ==119958 or OrgID ==119959  then
		CastSpell(OwnerID(), Target[j], 498592)
	end
end

function LuaPG_Machine_Buff_01()
	local Target = SearchRangeNPC( OwnerID(), 40 )	
	local Num = table.getn(Target)	
	local j=0
	local OrgID =ReadRoleValue(TargetID(), EM_RoleValue_OrgID)

	for i = 0,Num do
		OrgID = ReadRoleValue(Target[i], EM_RoleValue_OrgID)
			if OrgID == 106426 then
				j=i
				break
			end	
	end
	
	if OrgID== 106426 then
		CastSpell(OwnerID(), Target[j], 498630)
	end
end

function LuaPG_Machine_Buff_02()
	local Target = SearchRangeNPC( OwnerID(), 40 )	
	local Num = table.getn(Target)	
	local j=0
	local OrgID =ReadRoleValue(TargetID(), EM_RoleValue_OrgID)

	for i = 0,Num do
		OrgID = ReadRoleValue(Target[i], EM_RoleValue_OrgID)
			if OrgID == 106453 then
				j=i
				break
			end	
	end
	
	if OrgID== 106453 then
		CastSpell(OwnerID(), Target[j], 498630)
	end
end
----------------------------------------------------------------------------------
function LuaPG_Trans_Stuff()		--接近後，會生一個物件出來，隨機為某個零件或者方塊
	local Target = SearchRangeNPC( OwnerID(), 60 )	
	local Num = table.getn(Target)	
	local j=0
	local OrgID =ReadRoleValue(TargetID(), EM_RoleValue_OrgID)
	local ObjList = {119983, 119921, 119922}	

	for i = 0,Num do
		OrgID = ReadRoleValue(Target[i], EM_RoleValue_OrgID)
			if OrgID == 106452 then
				j=i
				break
			end	
	end
	
	if OrgID== 106452 then
		local RandNum = Rand(3)+1
		local CenterX =ReadRoleValue(Target[j], EM_ROLEVALUE_X)
		local CenterY =ReadRoleValue(Target[j], EM_ROLEVALUE_Y)
		local CenterZ =ReadRoleValue(Target[j], EM_ROLEVALUE_Z)
		local RoomID=ReadRoleValue(Target[j], EM_RoleValue_RoomID)
		local New_Stuff = CreateObj( ObjList[RandNum], CenterX-5, CenterY+30, CenterZ-5, 0, 1 )
--		Say(New_Stuff, "11")
		AddToPartition( New_Stuff, RoomID )
		CallPlot(New_Stuff, "LuaPG_Trans_Stuff02",New_Stuff)	--生出一個東西
	end
end

function LuaPG_Trans_Stuff02(New_Stuff)
	CallPlot(New_Stuff, "LuaPG_Trans_Stuff03",New_Stuff)
	SetModeEx( New_Stuff  ,EM_SetModeType_Mark , false ) 	--標記
	SetModeEx( New_Stuff  ,EM_SetModeType_Fight , false )	--砍殺
	SetModeEx( New_Stuff  ,EM_SetModeType_Move , false ) 	--移動
	SetModeEx( New_Stuff  ,EM_SetModeType_Obstruct , true ) --阻擋
	SetModeEx( New_Stuff  ,EM_SetModeType_ShowRoleHead , false ) --頭像框
	Sleep(40)
	DelObj(New_Stuff)
end

function LuaPG_Trans_Stuff03(New_Stuff)
	local X = 0
	local OrgID =ReadRoleValue(TargetID(), EM_RoleValue_OrgID)	
	local Check = SearchRangeNPC( New_Stuff, 40 )
	local Num = table.getn(Check)
--	Say(New_Stuff, "55")
	local j = 0	
	for i = 0,Num do
		OrgID = ReadRoleValue(Check[i], EM_RoleValue_OrgID)
			if OrgID == 106452 then
				j=i
				break
			end	
	end

	if j ~= 0 then
		while X<=4 do	--檢查4秒
			for i = 1, Num do	--檢查目標	
				OrgID = ReadRoleValue(Check[j], EM_RoleValue_OrgID)					
					if OrgID ~= 106452 then	--目標不在則整個跳出
						DelObj(New_Stuff)
--						Say(New_Stuff,"44")
						return
					end
--				Say(New_Stuff, "22")
			end		
			Sleep(10)
--			Say(New_Stuff, "33")
			X = X+1
		end
	end
end


function LuaPG_CantAttack()
	AddBuff(OwnerID(), 622311, 1, -1)
end
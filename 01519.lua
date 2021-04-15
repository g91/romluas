
--招喚閃電球 

function Lua_cang_Em_GGmen1()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local SpellCaster = LuaFunc_CreateObjByObj ( 102473, TargetID() )
	SetModeEx( SpellCaster   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( SpellCaster   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( SpellCaster   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( SpellCaster   , EM_SetModeType_Mark, false )--標記
	SetModeEx( SpellCaster   , EM_SetModeType_Move, false )--移動
	SetModeEx( SpellCaster   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( SpellCaster   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( SpellCaster   , EM_SetModeType_HideName, false )--名稱
	DelFromPartition( SpellCaster )
	AddToPartition( SpellCaster ,    RoomID )	--加進舞台
	AddBuff( SpellCaster ,504203,1 ,-1 )
	BeginPlot(SpellCaster,"Lua_cang_Em_GGmen2", 0)
	return true
end

function  Lua_cang_Em_GGmen2()
	sleep(120)
	Delobj(OwnerID())
end

function Lua_cang_EMI_GGmen4()

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Temp = Lua_Davis_BornByMultilateral( 102578 , 3 , 50 )	--在自己身上出小機器人
	--local Temp1, Temp2, Temp3
	--Temp1 = CreateObjByFlag( 102578, 780423, 0, 1) 
	--AddToPartition( Temp1 , RoomID )	
	--sleep(10)
	--Temp2 = CreateObjByFlag( 102579, 780423, 1, 1)
	--AddToPartition( Temp2 , RoomID )	
	--sleep(10)
	--Temp3 = CreateObjByFlag( 102590, 780423, 2, 1)
	--AddToPartition( Temp3 , RoomID )	
	--sleep(10)
	WriteRoleValue( Temp[1] ,EM_RoleValue_PID, OwnerID())	--寫入PID
	WriteRoleValue( Temp[2] ,EM_RoleValue_PID, OwnerID())	--寫入PID
	WriteRoleValue( Temp[3] ,EM_RoleValue_PID, OwnerID())	--寫入PID
	
	while true do
	sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if AttackTarget == 0 and CheckID( OwnerID() ) == true then  -- 檢查是否離開戰鬥	
			CastSpellLV(Temp[1], OwnerID(), 493819 ,1)
			CastSpellLV(Temp[2], OwnerID(), 493819 ,1)
			CastSpellLV(Temp[3], OwnerID(), 493819 ,1)
			Sleep(50)
		elseif AttackTarget ~= 0 then 
			SetAttack( Temp[1], AttackTarget)	
			SetAttack( Temp[2], AttackTarget)	
			SetAttack( Temp[3], AttackTarget)	
			break
		end
	end
end

--------------------

function Lua_cang_EMI_GGmen3()

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
					local Temp = Lua_Davis_BornByMultilateral( 102479 , 3 , 10 )	--在自己身上出小機器人
					BeginPlot(Temp[1],"Lua_cang_EMI_GGmen3_1",0)
					BeginPlot(Temp[2],"Lua_cang_EMI_GGmen3_1",0)
					BeginPlot(Temp[3],"Lua_cang_EMI_GGmen3_1",0)
					SkillC = 1 
				end
				if SkillB >= 60 then
					local Temp = Lua_Davis_BornByMultilateral( 102479 , 3 , 10 )	--在自己身上出小機器人
					BeginPlot(Temp[1],"Lua_cang_EMI_GGmen3_1",0)
					BeginPlot(Temp[2],"Lua_cang_EMI_GGmen3_1",0)
					BeginPlot(Temp[3],"Lua_cang_EMI_GGmen3_1",0)
					sleep(10)					
					SkillB = 0
				end
			else
				break	
			end	
		end	
	end
end

--------------------------------------------------------------
function Lua_cang_EMI_GGmen3_1()

	local Count1 = 0
	local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
	local ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- 接暫存值
		SetAttack( OwnerID() , ThesePlayer[i] ) --送出攻擊目標
	end	
	while 1 do
		Sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )	--抓目標值
		if (  AttackTarget == 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥	
			DelObj(OwnerID())
		end 
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥	
			if Count1 == 0 then
				Addbuff( OwnerID(), 504204, 1 , -1)	--對自己buff
				Count1 = 1
			end	
		end	
	end
end

function LuaS_101535_0()

	local X = ReadRoleValue(OwnerID() , EM_RoleValue_X )
	local Y = ReadRoleValue(OwnerID() , EM_RoleValue_Y )
	local Z = ReadRoleValue(OwnerID() , EM_RoleValue_Z )
	local Dir = ReadRoleValue(TargetID() , EM_RoleValue_Dir )

	SetPos( TargetID(), X , Y, Z , Dir )
end



function LuaS_101535_1()

	local UseFlag = 780228

	local BossMonster = { 101532 , 101533 ,101534 }
	local BossSpell = { 492967 , 492996 , 492430 }    --阿龐修改 492427 改成 492967，492434改成492996
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	math.randomseed(math.random(10000, 99999))
	local RandMonster = math.random(3)

	local CloseDis , Flag
	local X = ReadRoleValue(OwnerID() , EM_RoleValue_X )
	local Z = ReadRoleValue(OwnerID() , EM_RoleValue_Z )
	for i = 0 , GetMoveFlagCount(UseFlag)-1 do
		local FX = GetMoveFlagValue( UseFlag , i , EM_RoleValue_X )
		local FZ = GetMoveFlagValue( UseFlag , i , EM_RoleValue_Z )
		if i == 0 then
			CloseDis = ((X-FX)*(X-FX))+((Z-FZ)*(Z-FZ))
			Flag = i
		else
			if CloseDis > ((X-FX)*(X-FX))+((Z-FZ)*(Z-FZ)) then
				Flag = i
				CloseDis = ((X-FX)*(X-FX))+((Z-FZ)*(Z-FZ))
			end
		end
	end

	if RandMonster == 1 then
		Say(OwnerID() , "[SC_101535_12]")
		local Boss = CreateObjByFlag( BossMonster[RandMonster] , UseFlag , Flag  , 1 )
		EnableNpcAI( Boss  , false )
		SetModeEx( Boss  , EM_SetModeType_Strikback , false )
		SetModeEx( Boss  , EM_SetModeType_Fight , false ) 
		SetModeEx( Boss  , EM_SetModeType_Searchenemy , false ) 
		AddToPartition( Boss   , RoomID)
		CastSpellLV( Boss , TargetID() , BossSpell[RandMonster] , 240 )  --skill
--		SetAttack(Boss , TargetID() )
		AddBuff(Boss,501081,1,-1)
		BeginPlot(Boss , "LuaS_101535_2" , 0 )
	end
	if RandMonster == 2 then
		Say(OwnerID() , "[SC_101535_13]")
		local Boss = CreateObjByFlag( BossMonster[RandMonster] , UseFlag , Flag  , 1 )
		EnableNpcAI( Boss  , false )
		SetModeEx( Boss  , EM_SetModeType_Strikback , false )
		SetModeEx( Boss  , EM_SetModeType_Fight , false ) 
		SetModeEx( Boss  , EM_SetModeType_Searchenemy , false ) 
		AddToPartition( Boss   , RoomID)
		CastSpellLV( Boss , TargetID() , BossSpell[RandMonster] , 25 )  --skill		
--		SetAttack(Boss , TargetID() )
		AddBuff(Boss,501081,1,-1)
		BeginPlot(Boss , "LuaS_101535_3" , 0 )
	end
	if RandMonster == 3 then
		Say(OwnerID() , "[SC_101535_14]")
		local Boss = CreateObjByFlag( BossMonster[RandMonster] , UseFlag , Flag , 1 )
		EnableNpcAI( Boss  , false )
		SetModeEx( Boss  , EM_SetModeType_Strikback , false )
		SetModeEx( Boss  , EM_SetModeType_Fight , false ) 
		SetModeEx( Boss  , EM_SetModeType_Searchenemy , false ) 
		AddToPartition( Boss   , RoomID)
		CastSpellLV( Boss , TargetID() , BossSpell[RandMonster] , 34 )  --skill
--		SetAttack(Boss , TargetID() )
		AddBuff(Boss,501081,1,-1)
		BeginPlot(Boss , "LuaS_101535_4" , 0 )
	end
end

function LuaS_101535_2()
	sleep(20)
	Say(TargetID() , "[SC_101535_01]")
	sleep(20)
	Say(OwnerID() , "[SC_101535_02]")
	sleep(30)
	DelObj(OwnerID())
end

function LuaS_101535_3()
	sleep(30)
	Say(OwnerID() , "[SC_101535_03]")
--	sleep(20)
--	Say(TargetID() , "[SC_101535_04]")
--	sleep(20)
--	Say(OwnerID() , "[SC_101535_05]")
	sleep(10)
	DelObj(OwnerID())
end


function LuaS_101535_4()
	sleep(30)
	Say(OwnerID() , "[SC_101535_06]")
	sleep(10)
--	Say(TargetID() , "[SC_101535_07]")
--	sleep(20)
--	Say(OwnerID() , "[SC_101535_08]")
--	sleep(20)
--	Say(TargetID() , "[SC_101535_09]")
--	sleep(20)
--	Say(OwnerID() , "[SC_101535_10]")
--	sleep(20)
--	Say(TargetID() , "[SC_101535_11]")
--	sleep(10)
	DelObj(OwnerID())
end

function LuaS_101535_5()
	ScriptMessage(OwnerID() , TargetID() , 2 , "[SC_101535_15]" , 0 )
	AddBuff(TargetID() , 502586 , 1 , 6 )
	return true
end
function LuaS_101535_6()
	ScriptMessage(OwnerID() , TargetID() , 2 , "[SC_101535_16]" , 0 )
	return true
end
function LuaS_101535_7()
	SetRoleEquip( OwnerID() , EM_EQWearPos_SecondHand, 211604, 1)
end
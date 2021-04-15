function LuaQ_421249_Check()
	local AttackMode_P = ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode )
	local AttackMode_M = ReadRoleValue( TargetID() , EM_RoleValue_IsAttackMode )
	local Target = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local Check_Target_ThreeBrother = {100831 , 100832 , 100833}
	local Check_Target_ThreeBrother_1 = {541304 , 541305 , 541306}
	local Check_Targer_Aly = { 100835 , 100836 , 100837 , 100838 , 100839}
	if CheckID(TargetID()) then
		if AttackMode_P==0 or AttackMode_M==0 then
			for i=1,table.getn(Check_Target_ThreeBrother) do
				if Target == Check_Target_ThreeBrother[i] then
					if Checkflag(OwnerID() , Check_Target_ThreeBrother_1[i] )  then
						ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421219_3"), 0 ); --/*你燒過這種豺狼人了！
						return false
					else
						return true
					end
				end
			end
			for i=1,table.getn(Check_Targer_Aly) do
				if Target == Check_Targer_Aly[i] then
					return true
				end
			end
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_421101_0]", 0 )
			return false
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421219_2"), 0 ); --/*戰鬥時是瞄不準的！
			return false
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421219_1"), 0 ); --/*你沒有目標。
		return false
	end
end



function LuaQ_421249_Effect()
	local Check_Target_ThreeBrother = {100831 , 100832 , 100833}
	local Check_Targer_Aly = { 100835 , 100836 , 100837 , 100838 , 100839 }
	local Check_Target_ThreeBrother_1 = {541304 , 541305 , 541306}
	local MonsterID = TargetID()
	local OrgID = ReadRoleValue(TargetID() , EM_RoleValue_OrgID)

	for i=1,table.getn(Check_Target_ThreeBrother) do
		if OrgID == Check_Target_ThreeBrother[i] then
			SetFlag( OwnerID() , Check_Target_ThreeBrother_1[i] , 1)
			MonsterID = 100834
		end
	end

	for i=1,table.getn(Check_Targer_Aly) do
		if OrgID == Check_Targer_Aly[i] then
			MonsterID = 100840
		end
	end



	local Monster = LuaFunc_CreateObjByObj ( MonsterID , TargetID() )
	
	Beginplot(TargetID() , "LuaS_421219_3" , 0 )
	AddToPartition( Monster ,    0 )
	SetAttack( Monster , OwnerID())
	BeginPlot( Monster , "LuaS_421219_2", 0 )

end

function LuaS_421219_2()
	while true do
		CastSpell( OwnerID() , OwnerID() , 491248 )
		sleep(25)
		AttackTarget = ReadRoleValue(OwnerID() , EM_RoleValue_AttackTargetID )
		if AttackTarget == 0 then
			DelObj(OwnerID())
			break
		end
	end	
end

function LuaS_421219_3()
	LuaFunc_ResetObj( OwnerID() )
end
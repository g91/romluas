

function DW_MobRandMove_outFight(Mode,Var1,Var2,Var3,Var4)
	if	Mode == nil or	Var1 == nil	then
		return false
	end
	local Me = OwnerID()
	while	true	do
		sleep(20)
		if	ReadRoleValue(Me,EM_RoleValue_IsAttackMode)==0	and	HateListCount(Me)==0	then
			sleep((DW_Rand(999)%3)*10)

			if	Mode == "flag"	then
				if	Var2 == nil or	Var3 == nil	then
					return false
				end
				DW_MoveRand(Me,Var1,1,Var2,Var3) --依旗子隨機移動
			end

			if	Mode == "self"	then
				DW_MoveRand(Me,Var1) --依現在的座標隨機移動
			end

			if	Mode == "xyz"	then
				if	Var2 == nil or	Var3 == nil or	Var4==nil	then
					return false
				end
				DW_MoveRand(Me,Var1,1,Var2,Var3,Var4) --依xyz 的座標隨機移動
			end

			sleep(10*(math.floor(Var1/40)))
		end
	end
end
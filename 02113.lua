

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
				DW_MoveRand(Me,Var1,1,Var2,Var3) --�̺X�l�H������
			end

			if	Mode == "self"	then
				DW_MoveRand(Me,Var1) --�̲{�b���y���H������
			end

			if	Mode == "xyz"	then
				if	Var2 == nil or	Var3 == nil or	Var4==nil	then
					return false
				end
				DW_MoveRand(Me,Var1,1,Var2,Var3,Var4) --��xyz ���y���H������
			end

			sleep(10*(math.floor(Var1/40)))
		end
	end
end
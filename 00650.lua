

function LuaS_100678()--�������}������
	local sec=0
	local player={}
	local number=0
	local u=0	
	local AttackTarget = ReadRoleValue ( OwnerID() , EM_RoleValue_AttackTargetID)	

	while 1 do


		AttackTarget = ReadRoleValue ( OwnerID() , EM_RoleValue_AttackTargetID)

		if (CheckID( AttackTarget ) == true) and (CheckID( OwnerID() ) == true ) then
			if CountBodyItem( AttackTarget , 201837)==0  then
				BeginPlot( AttackTarget , "LuaS_100678_Transport",0)
				ScriptMessage( OwnerID(), AttackTarget , 0, GetString("EM_100678_0") , 0 )--�����ϥαj�j�Ŷ��O�q�չϱN�A�ǰe�I

				Sleep(5)

				player=SearchRangePlayer ( OwnerID(), 300 )--�N���񪱮a�����}�C
				if player[0]~= -1 then
					SetAttack(OwnerID(),player[0])
				end
			end


			if CountBodyItem( AttackTarget , 201837)>0  then
				ScriptMessage( OwnerID(), AttackTarget , 1, GetString("EM_100678") , 0 )--�w���@�ŨϧA�K��Q�ǰe���R�B�I
			end
		end


	


		Sleep(30)



	end

end 
function LuaS_100678_Transport()
	ChangeZone(OwnerID(), 5 , 0,-16424, 1220, -2838, 0)--�ǰe
end
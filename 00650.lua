

function LuaS_100678()--妖王蕾咪絲莉芙
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
				ScriptMessage( OwnerID(), AttackTarget , 0, GetString("EM_100678_0") , 0 )--妖王使用強大空間力量試圖將你傳送！

				Sleep(5)

				player=SearchRangePlayer ( OwnerID(), 300 )--將附近玩家取成陣列
				if player[0]~= -1 then
					SetAttack(OwnerID(),player[0])
				end
			end


			if CountBodyItem( AttackTarget , 201837)>0  then
				ScriptMessage( OwnerID(), AttackTarget , 1, GetString("EM_100678") , 0 )--定身護符使你免於被傳送的命運！
			end
		end


	


		Sleep(30)



	end

end 
function LuaS_100678_Transport()
	ChangeZone(OwnerID(), 5 , 0,-16424, 1220, -2838, 0)--傳送
end
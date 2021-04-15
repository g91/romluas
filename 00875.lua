function yuyu_Treasure_cobo2_00()
	SetCursorType( OwnerID() , 0)
	SetPlot( OwnerID() , "Touch" , "yuyu_Treasure_cobo2_01" , 50 );
end

function yuyu_Treasure_cobo2_01()                                                      

	local PlayerTeam = LuaFunc_PartyData( OwnerID() )                              --判斷TargetID() 的所有組隊成員的資料(排除不在同地區者但未排除死亡者)， PlayerTeam[0] 第一筆資料為成員人數、第二筆以後為成員資料。	



	if( KillID( OwnerID() , TargetID() ) == true ) then 

		local A = 0
		for i = 1 , PlayerTeam[0] , 1 do

		sleep(10)


			if CheckID( PlayerTeam[i] ) == true and ReadRoleValue(  PlayerTeam[i] , EM_RoleValue_IsPlayer ) == 1 and  ReadRoleValue(  PlayerTeam[i] , EM_RoleValue_RoomID ) == ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) then          --確定該玩家和owner同一層且存在
			sleep(10)

				local P = 100
				local XX = Rand( P )      
	
				if XX >= 70 and XX <= 100 then   --30%
					GiveBodyItem( PlayerTeam[i] , 200230 , 2 );  --黃銅礦
					GiveBodyItem( PlayerTeam[i] , 200335 , 2 );  --山魔楊草
					GiveBodyItem( PlayerTeam[i] , 200853, 1 );  --分解
					GiveBodyItem( PlayerTeam[i] , 200807, 2 );  --急救藥水
					GiveBodyItem( PlayerTeam[i] , 201046, 2 );  --魔力藥水

				elseif XX <= 15 and XX > 10 then  --5%
					GiveBodyItem( PlayerTeam[i] , 200855, 1 );  --混合
					GiveBodyItem( PlayerTeam[i] , 200854, 1 );  --純化
					GiveBodyItem( PlayerTeam[i] , 200807, 5 );  --急救藥水
					GiveBodyItem( PlayerTeam[i] , 201046, 5 );  --魔力藥水

				elseif XX <= 10 and XX > 5 then  --5%
					GiveBodyItem( PlayerTeam[i] , 200506 , 1 );  --藍冰石
					GiveBodyItem( PlayerTeam[i] , 201762 , 1 );  --柳木條
					GiveBodyItem( PlayerTeam[i] , 200807, 5 );  --急救藥水
					GiveBodyItem( PlayerTeam[i] , 201046, 5 );  --魔力藥水

				elseif XX <= 5 and XX > 0 then  --5%
					GiveBodyItem( PlayerTeam[i] , 200507 , 1 );  --火焰塵
					GiveBodyItem( PlayerTeam[i] , 201724 , 1 );  --錫塊
					GiveBodyItem( PlayerTeam[i] , 200807, 5 );  --急救藥水
					GiveBodyItem( PlayerTeam[i] , 201046, 5 );  --魔力藥水


				elseif XX < 50 and XX >= 25 then   -- 25%
					GiveBodyItem( PlayerTeam[i] , 201723 , 1 );  --黃銅塊
					GiveBodyItem( PlayerTeam[i] , 201785 , 1 );  --山魔楊草束
					GiveBodyItem( PlayerTeam[i] , 200807, 2 );  --急救藥水
					GiveBodyItem( PlayerTeam[i] , 201046, 2 );  --魔力藥水


				elseif XX < 70 and XX >= 50 then   -- 20%
					GiveBodyItem( PlayerTeam[i] , 200851, 1 );  --冷卻
					GiveBodyItem( PlayerTeam[i] , 201761 , 2 );  --輕木條
					GiveBodyItem( PlayerTeam[i] , 200807, 2 );  --急救藥水
					GiveBodyItem( PlayerTeam[i] , 201046, 2 );  --魔力藥水

				elseif XX < 25 and XX > 15 then  --10%

					GiveBodyItem( PlayerTeam[i] , 200852, 1 );  --活化
					GiveBodyItem( PlayerTeam[i] , 201800 , 1 );  --野漿草汁
					GiveBodyItem( PlayerTeam[i] , 200807, 3 );  --急救藥水
					GiveBodyItem( PlayerTeam[i] , 201046, 3 );  --魔力藥水

				end	
			end	
		end



	end
end
function yuyu_Treasure_cobo_00()

	SetPlot( OwnerID() , "Touch" , "yuyu_Treasure_cobo_01" , 50 );
end

function yuyu_Treasure_cobo_01()                                                      

	local PlayerTeam = LuaFunc_PartyData( OwnerID() )                              --判斷TargetID() 的所有組隊成員的資料(排除不在同地區者但未排除死亡者)， PlayerTeam[0] 第一筆資料為成員人數、第二筆以後為成員資料。	



--	if( KillID( OwnerID() , TargetID() ) == true ) then        --開寶箱觸碰寶箱寶箱就死玩家取得寶物

		ScriptMessage(OwnerID(), 0 , 1 , GetString("SC_YU_111301_0") , C_SYSTEM )	-- 開箱訊息。
  
		local NN = LuaFunc_SearchNPCbyOrgID(OwnerID(), 101028, 200 , 1)   --尋怪id

		local BOX = LuaFunc_SearchNPCbyOrgID(OwnerID(), 111301, 200 , 1)   --尋怪id
		local RoomID = ReadRoleValue( NN[0] , EM_RoleValue_RoomID )  --判斷所在的地層
		Hide( BOX[0] )

		local A = 0
		for i = 1 , PlayerTeam[0] , 1 do


			if 	CheckID( PlayerTeam[i] ) == true and 
				ReadRoleValue(  PlayerTeam[i] , EM_RoleValue_IsPlayer ) == 1 and
				ReadRoleValue(  PlayerTeam[i] , EM_RoleValue_RoomID ) == ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) then          --確定該玩家和owner同一層且存在


				CastSpelllv( NN[0] , OwnerID() , 490642, 80)                                                              --施放法術&LV(施法者,對象id,法術id,LV)  
				sleep(10)

				local P = 100
				local XX = Rand( P )      
	
				if XX >= 70 and XX <= 100 then   --30%
					GiveBodyItem( PlayerTeam[i] , 203008 , 2 );   --赤鬃野豬皮
					GiveBodyItem( PlayerTeam[i] , 203010 , 2 );   --破損的庫柏法袍
					GiveBodyItem( PlayerTeam[i] , 203011 , 2 );  --殘破的哥不林杖


				elseif XX <= 10 then  --10%
					GiveBodyItem( PlayerTeam[i] , 203013 , 1 );  --庫柏王冠的碎片
					GiveBodyItem( PlayerTeam[i] , 203016 , 1 );  --咕謬的背包


				elseif XX < 19 and XX > 10 then   -- 10%
					GiveBodyItem( PlayerTeam[i] , 203014 , 1 );  --鎚牙面具上的寶石
					GiveBodyItem( PlayerTeam[i] , 203015 , 1 );  --暗殺者的劍柄


				elseif XX < 50 and XX >= 30 then   -- 20%
					GiveBodyItem( PlayerTeam[i] , 203009 , 2 );  --損壞的庫柏戰斧
					GiveBodyItem( PlayerTeam[i] , 203012 , 2 );   --損毀的精緻連弩
					GiveBodyItem( PlayerTeam[i] , 203010 , 1 );   --破損的庫柏法袍

				elseif XX < 70 and XX >= 50 then   -- 20%
					GiveBodyItem( PlayerTeam[i] , 203008 , 2 );   --赤鬃野豬皮
					GiveBodyItem( PlayerTeam[i] , 203009 , 2 );  --損壞的庫柏戰斧

				elseif XX < 30 and XX >= 19 then  --10%
					GiveBodyItem( PlayerTeam[i] , 203016 , 1 );  --咕謬的背包
					GiveBodyItem( PlayerTeam[i] , 203015 , 1 );  --暗殺者的劍柄
				end	
			end	
		end



--	end


		sleep(10)		

		local GOBOLIN  = CreateObjByFlag( 100634, 780183, 0 , 1 );            --產生怪     
		local NN = LuaFunc_SearchNPCbyOrgID(OwnerID(), 101028, 200 , 1)   --尋怪id           	        	
		local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )  --判斷所在的地層
--	Say( OwnerID(), GetString("YU_OWNER") )    
--	 Say( TargetID() , GetString("YU_TARGET") )  

		sleep(10)
		AddToPartition( GOBOLIN  , RoomID )       --副本要用劇情產生怪必須要同一個地層，因此要用以存的隱形物件來判斷產生的怪是否同一地層來加進舞台
		BeginPlot(GOBOLIN, "LuaYuyu_gobolin_matrix" , 0 )        --讓剛出生的怪掛陣型
		local GOBOLIN = LuaFunc_SearchNPCbyOrgID(OwnerID(), 100634, 200 , 1) 
		 Say( GOBOLIN[0] , GetString("SC_YUYU_GOBOLIN_0") )   
	sleep(36000)
			Show( BOX[0],0 )

end
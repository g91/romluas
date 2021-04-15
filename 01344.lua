function LuaDan_112757_Openflag_1() --掛載在隱形物件上，讓有音樂盒的人，關掉身上的flag
	
	SetPlot( OwnerID() , "range" ,"LuaDan_112757_Openflag_2",150)  
	--sleep(100)


end
----------------------------------------------------------------------------------------------------------------
function LuaDan_112757_Openflag_2() --關掉flag

	local Flag =      CheckFlag(OwnerID()  , 542448)           --防止不斷生出怪
	local MusicBox =  CountBodyItem( OwnerID() , 204426 ) --音樂盒

	while  MusicBox ~= 0 and Flag == true do

	sleep(20)
		SetFlag( OwnerID()  , 542448 , 0 )--避免重覆觸碰生怪

	end

end
----------------------------------------------------------------------------------------------------------------
function LuaDan_112757_1() --範圍劇情，有音樂盒的人靠近，生怪及生簽哨員
	
	SetPlot( OwnerID() , "range" ,"LuaDan_112757_Monster",150)  
	--sleep(300)
	

end

----------------------------------------------------------------------------------------------------------------
function LuaDan_112757_2() --範圍劇情，有音樂盒的人靠近，生怪及生簽哨員
	
	SetPlot( OwnerID() , "range" ,"LuaDan_112757_Monster2",150)  
	--sleep(300)
	

end

----------------------------------------------------------------------------------------------------------------
function LuaDan_112757_Monster() --第一個點生怪

--say(OwnerID(), "OwnerID") --玩家	SetFlag( OwnerID()  , 542529 , 1 )  
--say(TargetID(), "TargetID") --隱形物件
	local Flag = CheckFlag(OwnerID()  , 542448)           --防止不斷生出怪
	local Flag2 = CheckFlag(OwnerID()  , 542529)           --第一個簽哨點
	local MusicBox =  CountBodyItem( OwnerID() , 204426 ) --音樂盒
	local Protect  = CheckFlag(OwnerID()  , 542551)       --護衛旗標
	local Monster = {}
	--local captial = OwnerID()
		--SetFlag( OwnerID()  , 542448 , 1 )--避免重覆觸碰生怪


		while  MusicBox ~= 0 and Flag == false and Flag2 == false  do
			
			sleep(10)	
	  		SetFlag( OwnerID()  , 542448 , 1 )--避免重覆觸碰生怪
		

			 Monster[0] = CreateObjByFlag( 101998, 780333, 5, 1 )        --哥布林
			 Monster[1] = CreateObjByFlag( 101998, 780333, 6, 1 )        --哥布林
			 Monster[2] = CreateObjByFlag( 101998, 780333, 7, 1 )        --哥布林
			ScriptMessage( OwnerID(), 0 , 1 , "[SC_DAN_SR_112757_MONSTER]" , C_SYSTEM ) --哼哼！想要通過這邊，先問問我們要不要讓你過！把音樂盒交出來！
			--Say( Monster[0], "[SC_DAN_SR_112757_Monster]")  	

			for i = 0, 2 do

				SetModeEx( Monster[i]   , EM_SetModeType_Strikback, true )--反擊
				SetModeEx( Monster[i]   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
				SetModeEx( Monster[i]   , EM_SetModeType_Obstruct, false )--阻擋
				SetModeEx( Monster[i]   , EM_SetModeType_Mark, true )--標記
				SetModeEx( Monster[i]   , EM_SetModeType_Move, true )--移動
				SetModeEx( Monster[i]   , EM_SetModeType_Searchenemy, true )--索敵
				SetModeEx( Monster[i]    , EM_SetModeType_HideName, true )--名稱
				SetModeEx( Monster[i] , EM_SetModeType_ShowRoleHead, true )--頭像框
				SetModeEx( Monster[i], EM_SetModeType_Fight , true )--可砍殺攻擊
				SetModeEx( Monster[i]   , EM_SetModeType_Show , true ) --不顯示
				AddToPartition( Monster[i]  , 0)  
				SetAttack( Monster[i] , OwnerID()  )
				AddBuff( Monster[i],502707 ,1 ,-1 )
				
				--sleep(10)
				
				--MoveToFlagEnabled( Monster[i] , false )                --巡邏劇情關
                                --WriteRoleValue( Monster[i], EM_RoleValue_IsWalk, 0)    --走路	
				--LuaFunc_MoveToFlag( Monster[i], 780303, 0, 0)          --前進到指定旗

				--sleep(10)

	        			BeginPlot (Monster[i], "LuaDan_112757_Monster_Delete", 10) 	--寫一個怪自動刪掉
				SetPlot(Monster[i] , "dead" , "LuaDan_112757_MDeadScript" , 0 )				

				--sleep(15)
			end
				--繼續生怪
			 Monster[3] = CreateObjByFlag( 102003, 780333, 2, 1 )        --幽棘蜘蛛
			 Monster[4] = CreateObjByFlag( 102003, 780333, 3, 1 )        --幽棘蜘蛛
			 Monster[5] = CreateObjByFlag( 102003, 780333, 4, 1 )        --幽棘蜘蛛
			
				
			for i = 3, 5 do

				SetModeEx( Monster[i]   , EM_SetModeType_Strikback, true )--反擊
				SetModeEx( Monster[i]   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
				SetModeEx( Monster[i]   , EM_SetModeType_Obstruct, false )--阻擋
				SetModeEx( Monster[i]   , EM_SetModeType_Mark, true )--標記
				SetModeEx( Monster[i]   , EM_SetModeType_Move, true )--移動
				SetModeEx( Monster[i]   , EM_SetModeType_Searchenemy, true )--索敵
				SetModeEx( Monster[i]    , EM_SetModeType_HideName, true )--名稱
				SetModeEx( Monster[i] , EM_SetModeType_ShowRoleHead, true )--頭像框
				SetModeEx( Monster[i], EM_SetModeType_Fight , true )--可砍殺攻擊
				SetModeEx( Monster[i]   , EM_SetModeType_Show , true ) --不顯示
				AddToPartition( Monster[i]  , 0)  
				SetAttack( Monster[i] , OwnerID()  )
				AddBuff( Monster[i],502707 ,1 ,-1 )
				
				--sleep(10)
				
				--MoveToFlagEnabled( Monster[i] , false )                --巡邏劇情關
                                --WriteRoleValue( Monster[i], EM_RoleValue_IsWalk, 1)    --走路	
				--LuaFunc_MoveToFlag( Monster[i], 780303, 0, 0)          --前進到指定旗

				--sleep(10)

	        		BeginPlot (Monster[i], "LuaDan_112757_Monster_Delete", 10) 	--寫一個怪自動刪掉
			SetPlot(Monster[i] , "dead" , "LuaDan_112757_MDeadScript" , 0 )


				--sleep(15)
			end

			 Monster[6] = CreateObjByFlag( 102006, 780333, 8, 1 )        --草原土狼
			 Monster[7] = CreateObjByFlag( 102006, 780333, 0, 1 )        --草原土狼
			 Monster[8] = CreateObjByFlag( 102006, 780333, 1, 1 )        --草原土狼
		
				
			for i = 6, 8 do

				SetModeEx( Monster[i]   , EM_SetModeType_Strikback, true )--反擊
				SetModeEx( Monster[i]   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
				SetModeEx( Monster[i]   , EM_SetModeType_Obstruct, false )--阻擋
				SetModeEx( Monster[i]   , EM_SetModeType_Mark, true )--標記
				SetModeEx( Monster[i]   , EM_SetModeType_Move, true )--移動
				SetModeEx( Monster[i]   , EM_SetModeType_Searchenemy, true )--索敵
				SetModeEx( Monster[i]    , EM_SetModeType_HideName, true )--名稱
				SetModeEx( Monster[i] , EM_SetModeType_ShowRoleHead, true )--頭像框
				SetModeEx( Monster[i], EM_SetModeType_Fight , true )--可砍殺攻擊
				SetModeEx( Monster[i]   , EM_SetModeType_Show , true ) --不顯示
				AddToPartition( Monster[i]  , 0)  
				SetAttack( Monster[i] , OwnerID()  )
				AddBuff( Monster[i],502707 ,1 ,-1 )
				
				--sleep(10)
				
				--MoveToFlagEnabled( Monster[i] , false )                --巡邏劇情關
                                --WriteRoleValue( Monster[i], EM_RoleValue_IsWalk, 0)    --走路	
				--LuaFunc_MoveToFlag( Monster[i], 780303, 0, 0)          --前進到指定旗

				--sleep(10)

	        		BeginPlot (Monster[i], "LuaDan_112757_Monster_Delete", 10) 	--寫一個怪自動刪掉
			SetPlot(Monster[i] , "dead" , "LuaDan_112757_MDeadScript" , 0 )

				--sleep(15)
			end
				
			
				SetFlag( OwnerID()  , 542448 , 1 )--避免重覆觸碰生怪

			break
		end

	
	
	--BeginPlot (OwnerID(), "LuaDan_112757_Signer", 10) 	--把簽哨員叫出來
end  
----------------------------------------------------------------------------------------------------------------
function LuaDan_112757_Monster2() --第二個點生怪

	local Flag = CheckFlag(OwnerID()  , 542448)           --防止不斷生出怪
	local Flag2 = CheckFlag(OwnerID()  , 542529)           --確保回頭時不會再生怪542560
	local Flag3 = CheckFlag(OwnerID()  , 542630) 
	local MusicBox =  CountBodyItem( OwnerID() , 204426 ) --音樂盒
	local Protect  = CheckFlag(OwnerID()  , 542551)       --護衛旗標
	local Monster = {}

		--SetFlag( OwnerID()  , 542448 , 1 )--避免重覆觸碰生怪


		while  MusicBox ~= 0 and Flag == true and Flag2 == false and Flag3 == false  do
			
			sleep(10)	
	  		 SetFlag( OwnerID()  , 542630 , 1 )--再度生怪

			 Monster[0] = CreateObjByFlag( 102001, 780333, 15, 1 )        --庫柏突襲兵
			 Monster[1] = CreateObjByFlag( 102001, 780333, 16, 1 )        --庫柏突襲兵
			 Monster[2] = CreateObjByFlag( 102001, 780333, 17, 1 )        --庫柏突襲兵
			 Monster[3] = CreateObjByFlag( 102001, 780333, 12, 1 )        --庫柏突襲兵
			 Monster[4] = CreateObjByFlag( 102001, 780333, 13, 1 )        --庫柏突襲兵
			 Monster[5] = CreateObjByFlag( 102001, 780333, 14, 1 )        --庫柏突襲兵
			 Monster[6] = CreateObjByFlag( 102001, 780333, 9,  1 )         --庫柏突襲兵
			 Monster[7] = CreateObjByFlag( 102001, 780333, 10, 1 )        --庫柏突襲兵
			 Monster[8] = CreateObjByFlag( 102001, 780333, 11, 1 )        --庫柏突襲兵

			ScriptMessage( OwnerID(), 0 , 1 , "[SC_DAN_SR_112757_MONSTER2]" , C_SYSTEM ) --沒想到你還蠻厲害的！過得了前面，過不了我們這關的！
			--Say( TargetID() , "[SC_DAN_SR_112757_Monster2]")  	

			for i = 0, 8 do

				SetModeEx( Monster[i]   , EM_SetModeType_Strikback, true )--反擊
				SetModeEx( Monster[i]   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
				SetModeEx( Monster[i]   , EM_SetModeType_Obstruct, false )--阻擋
				SetModeEx( Monster[i]   , EM_SetModeType_Mark, true )--標記
				SetModeEx( Monster[i]   , EM_SetModeType_Move, true )--移動
				SetModeEx( Monster[i]   , EM_SetModeType_Searchenemy, true )--索敵
				SetModeEx( Monster[i]    , EM_SetModeType_HideName, true )--名稱
				SetModeEx( Monster[i] , EM_SetModeType_ShowRoleHead, true )--頭像框
				SetModeEx( Monster[i], EM_SetModeType_Fight , true )--可砍殺攻擊
				SetModeEx( Monster[i]   , EM_SetModeType_Show , true ) --不顯示
				AddToPartition( Monster[i]  , 0)  
				SetAttack( Monster[i] , OwnerID()  )
				AddBuff( Monster[i],502707 ,1 ,-1 )
				
				--sleep(10)
				
				--MoveToFlagEnabled( Monster[i] , false )                --巡邏劇情關
                                --WriteRoleValue( Monster[i], EM_RoleValue_IsWalk, 0)    --走路	
				--LuaFunc_MoveToFlag( Monster[i], 780303, 0, 0)          --前進到指定旗

				--sleep(10)

	        		BeginPlot (Monster[i], "LuaDan_112757_Monster_Delete", 10) 	--寫一個怪自動刪掉
			SetPlot(Monster[i] , "dead" , "LuaDan_112757_MDeadScript" , 0 )

				--sleep(15)
			end
				--繼續生怪
			--Monster[9]  = CreateObjByFlag( 102001, 780333, 15, 1 )        --鼠耳蝙蝠
			 --Monster[10] = CreateObjByFlag( 102001, 780333, 16, 1 )        --鼠耳蝙蝠
			 --Monster[11] = CreateObjByFlag( 102001, 780333, 17, 1 )        --鼠耳蝙蝠
			 --Monster[12] = CreateObjByFlag( 102001, 780333, 12, 1 )        --鼠耳蝙蝠
			 --Monster[13] = CreateObjByFlag( 102001, 780333, 13, 1 )        --鼠耳蝙蝠
			 --Monster[14] = CreateObjByFlag( 102001, 780333, 14, 1 )        --鼠耳蝙蝠
			 --Monster[15] = CreateObjByFlag( 102001, 780333, 9,  1 )         --鼠耳蝙蝠
			 --Monster[16] = CreateObjByFlag( 102001, 780333, 10, 1 )        --鼠耳蝙蝠
			 --Monster[17] = CreateObjByFlag( 102001, 780333, 11, 1 )        --鼠耳蝙蝠


			--for i = 9, 17 do

				--SetModeEx( Monster[i]   , EM_SetModeType_Strikback, true )--反擊
				--SetModeEx( Monster[i]   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
				--SetModeEx( Monster[i]   , EM_SetModeType_Obstruct, false )--阻擋
				--SetModeEx( Monster[i]   , EM_SetModeType_Mark, true )--標記
				--SetModeEx( Monster[i]   , EM_SetModeType_Move, true )--移動
				--SetModeEx( Monster[i]   , EM_SetModeType_Searchenemy, true )--索敵
				--SetModeEx( Monster[i]    , EM_SetModeType_HideName, true )--名稱
				--SetModeEx( Monster[i] , EM_SetModeType_ShowRoleHead, true )--頭像框
				--SetModeEx( Monster[i], EM_SetModeType_Fight , true )--可砍殺攻擊
				--SetModeEx( Monster[i]   , EM_SetModeType_Show , true ) --不顯示
				--AddToPartition( Monster[i]  , 0)  
				--SetAttack( Monster[i] , OwnerID()  )
				--AddBuff( Monster[i],502707 ,1 ,-1 )
				
				--sleep(10)
				
				--MoveToFlagEnabled( Monster[i] , false )                --巡邏劇情關
                              			  --WriteRoleValue( Monster[i], EM_RoleValue_IsWalk, 0)    --走路	
				--LuaFunc_MoveToFlag( Monster[i], 780303, 0, 0)          --前進到指定旗

				--sleep(10)

	        		--BeginPlot (Monster[i], "LuaDan_112757_Monster_Delete", 10) 	--寫一個怪自動刪掉

				--sleep(15)
			--end
				
			
				--SetFlag( OwnerID()  , 542448 , 1 )--避免重覆觸碰生怪

			break
		end


	
	--BeginPlot (OwnerID(), "LuaDan_112757_Signer", 10) 	--把簽哨員叫出來
end  


----------------------------------------------------------------------------------------------------------------
function LuaDan_112757_Monster_Delete()

--say(OwnerID(), "OwnerID") --玩家
--say(TargetID(), "TargetID") --隱形物件

	sleep(1200)
	DelObj( OwnerID())

end

function LuaDan_112757_MDeadScript() -- 怪物死亡觸法劇情
--	Say(OwnerID(), " 1234") --monster
--	Say(TargetID(), " 5678") --player

	local Player = SearchRangePlayer ( OwnerID() , 300 )  -- ownerid = monster 搜尋怪物周圍150內的玩家
	for i=0,table.getn(Player),1 do
	--	Say(OwnerID(), Player[i] )
	--	Say(Player[i], i  )
		BeginPlot(Player[i], "Lua_mika_musicfes_giveticket"  ,0 )
	end
end

function Lua_mika_musicfes_giveticket() --
--	local Player = TargetID()
	local Player = OwnerID()
	local ItemNm = CountBodyItem(Player , 204526)
	local Flag1 =	 CheckFlag(Player  , 542520)          
	local Flag2 =	 CheckFlag(Player  , 542551)          
--	Say(OwnerID(), " 1233") --monster
--	Say( Player, " 4566") --player
	if CountBodyItem(Player , 204526) < 1 and (Flag1 == true or Flag2 == true ) then --有隊長或隊員flag
		GiveBodyItem ( Player  , 204526 , 1 )
	end
end

function lua_mika_musicfest_monsterborn()
	local Monster = CreateObjByFlag( 102003, 780333, 2, 1 )        --幽棘蜘蛛
	SetModeEx( Monster   , EM_SetModeType_Strikback, true )--反擊
	SetModeEx( Monster   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Monster   , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( Monster   , EM_SetModeType_Mark, true )--標記
	SetModeEx( Monster   , EM_SetModeType_Move, true )--移動
	SetModeEx( Monster   , EM_SetModeType_Searchenemy, true )--索敵
	SetModeEx( Monster  , EM_SetModeType_HideName, true )--名稱
	SetModeEx( Monster , EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( Monster, EM_SetModeType_Fight , true )--可砍殺攻擊
	SetModeEx( Monster   , EM_SetModeType_Show , true ) --不顯示
	AddToPartition( Monster  , 0)  
	SetAttack( Monster , OwnerID()  )
	SetPlot(Monster , "dead" , "LuaDan_112757_MDeadScript" , 0 )
end
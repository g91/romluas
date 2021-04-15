----------------------------------------------------------------------------------------------------------------
function LuaDan_112757_3() --範圍劇情，有音樂盒的人靠近，生怪及生簽哨員
	
	SetPlot( OwnerID() , "range" ,"LuaDan_112757_Monster3",150)  
	--sleep(300)
	

end

----------------------------------------------------------------------------------------------------------------
function LuaDan_112757_4() --範圍劇情，有音樂盒的人靠近，生怪及生簽哨員
	
	SetPlot( OwnerID() , "range" ,"LuaDan_112757_Monster4",150)  
	--sleep(300)
	

end

----------------------------------------------------------------------------------------------------------------
function LuaDan_112757_Monster3() --第一個點生怪

--say(OwnerID(), "OwnerID") --玩家	SetFlag( OwnerID()  , 542529 , 1 )  
--say(TargetID(), "TargetID") --隱形物件
	local Flag = CheckFlag(OwnerID()  , 542448)           --防止不斷生出怪
	local Flag2 = CheckFlag(OwnerID()  , 542529)           --確保回頭時不會再生怪
	local Signflag2 = CheckFlag(OwnerID()  , 542548)      --第二個簽哨點
	local MusicBox =  CountBodyItem( OwnerID() , 204426 ) --音樂盒
	local Protect  = CheckFlag(OwnerID()  , 542551)       --護衛旗標
	local Monster = {}

	

		while  MusicBox ~= 0 and Flag == false and Signflag2 == false do
			
			sleep(10)	
	  		SetFlag( OwnerID()  , 542448 , 1 )--避免重覆觸碰生怪

			 Monster[0] = CreateObjByFlag( 102003, 780333, 20, 2 )        --亞米斯
			 Monster[1] = CreateObjByFlag( 102003, 780333, 19, 2 )        --亞米斯
			 Monster[2] = CreateObjByFlag( 102003, 780333, 18, 2 )        --亞米斯
			ScriptMessage( OwnerID(), 0 , 1 , "[SC_DAN_SR_112757_MONSTER]" , C_SYSTEM ) --哼哼！想要通過這邊，先問問我們要不要讓你過！把音樂盒交出來！
			--Say( TargetID() , "[SC_DAN_SR_112757_Monster]")  	

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
				--LuaFunc_MoveToFlag( Monster[i], 780303, 1, 0)          --前進到指定旗

				--sleep(10)

	        		BeginPlot (Monster[i], "LuaDan_112757_Monster_Delete", 10) 	--寫一個怪自動刪掉
			SetPlot(Monster[i] , "dead" , "LuaDan_112757_MDeadScript" , 0 )
				--sleep(15)
			end
				--繼續生怪
			 Monster[3] = CreateObjByFlag( 102003, 780333, 23, 1)        --幽棘蜘蛛
			 Monster[4] = CreateObjByFlag( 102003, 780333, 22, 1 )        --幽棘蜘蛛
			 Monster[5] = CreateObjByFlag( 102003, 780333, 21, 1 )        --幽棘蜘蛛
		
				
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
				--LuaFunc_MoveToFlag( Monster[i], 780303, 1, 0)          --前進到指定旗

				--sleep(10)

	        		BeginPlot (Monster[i], "LuaDan_112757_Monster_Delete", 10) 	--寫一個怪自動刪掉
			SetPlot(Monster[i] , "dead" , "LuaDan_112757_MDeadScript" , 0 )
				--sleep(15)
			end

			 Monster[6] = CreateObjByFlag( 102002, 780333, 24, 2 )        --麥督格惡僕
			 Monster[7] = CreateObjByFlag( 102002, 780333, 25, 2 )        --麥督格惡僕
			 Monster[8] = CreateObjByFlag( 102002, 780333, 26, 2 )        --麥督格惡僕
		
				
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
				--LuaFunc_MoveToFlag( Monster[i], 780303, 1, 0)          --前進到指定旗

				--sleep(10)

	        		BeginPlot (Monster[i], "LuaDan_112757_Monster_Delete", 10) 	--寫一個怪自動刪掉
			SetPlot(Monster[i] , "dead" , "LuaDan_112757_MDeadScript" , 0 )
				--sleep(15)
			end
				
			
				--SetFlag( OwnerID()  , 542448 , 1 )--避免重覆觸碰生怪

			break
		end


	
	--BeginPlot (OwnerID(), "LuaDan_112757_Signer", 10) 	--把簽哨員叫出來
end  
----------------------------------------------------------------------------------------------------------------
function LuaDan_112757_Monster4() --第二個點生怪

	local Flag = CheckFlag(OwnerID()  , 542448)           --防止不斷生出怪
	local Flag2 = CheckFlag(OwnerID()  , 542529)           --確保回頭時不會再生怪
	local Signflag2 = CheckFlag(OwnerID()  , 542548)      --第二個簽哨點
	local Flag3 = CheckFlag(OwnerID()  , 542630) 
	local MusicBox =  CountBodyItem( OwnerID() , 204426 ) --音樂盒
	local Protect  = CheckFlag(OwnerID()  , 542551)       --護衛旗標
	local Monster = {}



		while  MusicBox ~= 0 and Flag == true and Signflag2 == false and Flag3 ==false do
			
			sleep(10)	
	  		SetFlag( OwnerID()  , 542630 , 1 )--再度生怪

			
			 Monster[0] = CreateObjByFlag( 102004, 780333, 33, 1 )        --基普奧
			 Monster[1] = CreateObjByFlag( 102004, 780333, 34, 1 )        --基普奧
			 Monster[2] = CreateObjByFlag( 102004, 780333, 35, 1 )        --基普奧
			 Monster[3] = CreateObjByFlag( 102004, 780333, 32, 1 )        --基普奧
			 Monster[4] = CreateObjByFlag( 102004, 780333, 31, 1 )        --基普奧
			 Monster[5] = CreateObjByFlag( 102004, 780333, 30, 1 )        --基普奧
			 Monster[6] = CreateObjByFlag( 102004, 780333, 27,  1 )       --基普奧
			 Monster[7] = CreateObjByFlag( 102004, 780333, 28, 1 )        --基普奧
			 Monster[8] = CreateObjByFlag( 102004, 780333, 29, 1 )        --基普奧
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
				--LuaFunc_MoveToFlag( Monster[i], 780303, 1, 0)          --前進到指定旗

				--sleep(10)

	        		BeginPlot (Monster[i], "LuaDan_112757_Monster_Delete", 10) 	--寫一個怪自動刪掉
			SetPlot(Monster[i] , "dead" , "LuaDan_112757_MDeadScript" , 0 )
				--sleep(15)
			end
				--繼續生怪
			 --Monster[9]  = CreateObjByFlag( 102001, 780333, 33, 1 )        --鼠耳蝙蝠
			 --Monster[10] = CreateObjByFlag( 102001, 780333, 34, 1 )        --鼠耳蝙蝠
			 --Monster[11] = CreateObjByFlag( 102001, 780333, 35, 1 )        --鼠耳蝙蝠
			 --Monster[12] = CreateObjByFlag( 102001, 780333, 32, 1 )        --鼠耳蝙蝠
			 --Monster[13] = CreateObjByFlag( 102001, 780333, 31, 1 )        --鼠耳蝙蝠
			 --Monster[14] = CreateObjByFlag( 102001, 780333, 30, 1 )        --鼠耳蝙蝠
			 --Monster[15] = CreateObjByFlag( 102001, 780333, 27,  1 )       --鼠耳蝙蝠
			 --Monster[16] = CreateObjByFlag( 102001, 780333, 28, 1 )        --鼠耳蝙蝠
			 --Monster[17] = CreateObjByFlag( 102001, 780333, 29, 1 )        --鼠耳蝙蝠


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
				--LuaFunc_MoveToFlag( Monster[i], 780303, 1, 0)          --前進到指定旗

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
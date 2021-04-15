----------------------------------------------------------------------------------------------------------------
function LuaDan_112757_5() --範圍劇情，有音樂盒的人靠近，生怪及生簽哨員
	
	SetPlot( OwnerID() , "range" ,"LuaDan_112757_Monster5",150)  
	--sleep(300)
	

end

----------------------------------------------------------------------------------------------------------------
function LuaDan_112757_6() --範圍劇情，有音樂盒的人靠近，生怪及生簽哨員
	
	SetPlot( OwnerID() , "range" ,"LuaDan_112757_Monster6",150)  
	--sleep(300)
	

end

----------------------------------------------------------------------------------------------------------------
function LuaDan_112757_Monster5() --第一個點生怪

--say(OwnerID(), "OwnerID") --玩家	SetFlag( OwnerID()  , 542529 , 1 )  
--say(TargetID(), "TargetID") --隱形物件
	local Flag = CheckFlag(OwnerID()  , 542448)           --防止不斷生出怪
	local Flag2 = CheckFlag(OwnerID()  , 542529)           --確保回頭時不會再生怪
	local Signflag3 = CheckFlag(OwnerID()  , 542549)
	local MusicBox =  CountBodyItem( OwnerID() , 204426 ) --音樂盒
	local Protect  = CheckFlag(OwnerID()  , 542551)       --護衛旗標
	local Monster = {}

	

		while  MusicBox ~= 0 and Flag == false and Signflag3 ==false  do
			
			sleep(10)	
			SetFlag( OwnerID()  , 542448 , 1 )--避免重覆觸碰生怪

	  		
			 Monster[0] = CreateObjByFlag( 102005, 780333, 41, 2 )        --塔格納遊蕩者
			 Monster[1] = CreateObjByFlag( 102005, 780333, 42, 2 )        --塔格納遊蕩者
			 Monster[2] = CreateObjByFlag( 102005, 780333, 44, 2 )        --塔格納遊蕩者
			ScriptMessage( OwnerID() , 0 , 1 , "[SC_DAN_SR_112757_MONSTER3]" , C_SYSTEM ) --啊哎！前面的人都睡覺了啊！！居然這麼簡單就放你過！這是最後一道防線了，絕對不能讓你通過！！
			--Say( TargetID() , "[SC_DAN_SR_112757_Monster3]")  	

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
				--LuaFunc_MoveToFlag( Monster[i], 780303, 2, 0)          --前進到指定旗

				--sleep(10)

	        		BeginPlot (Monster[i], "LuaDan_112757_Monster_Delete", 10) 	--寫一個怪自動刪掉
			SetPlot(Monster[i] , "dead" , "LuaDan_112757_MDeadScript" , 0 )

				--sleep(150)
			end
				--繼續生怪
			 Monster[3] = CreateObjByFlag( 102005, 780333, 40, 1)        --塔格納遊蕩者
			 Monster[4] = CreateObjByFlag( 102005, 780333, 39, 1 )        --塔格納遊蕩者
			 Monster[5] = CreateObjByFlag( 102005, 780333, 43, 1 )        --塔格納遊蕩者
		
				
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
				--LuaFunc_MoveToFlag( Monster[i], 780303, 2, 0)          --前進到指定旗

				--sleep(10)

	        		BeginPlot (Monster[i], "LuaDan_112757_Monster_Delete", 10) 	--寫一個怪自動刪掉
			SetPlot(Monster[i] , "dead" , "LuaDan_112757_MDeadScript" , 0 )

				--sleep(150)
			end

			 Monster[6] = CreateObjByFlag( 102005, 780333, 36, 1 )        --塔格納遊蕩者
			 Monster[7] = CreateObjByFlag( 102005, 780333, 37, 1 )        --塔格納遊蕩者
			 Monster[8] = CreateObjByFlag( 102005, 780333, 38, 1)        --塔格納遊蕩者
		
				
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
				SetAttack( Monster[i] , OwnerID() )
				AddBuff( Monster[i],502707 ,1 ,-1 )
				
				--sleep(10)
				
				--MoveToFlagEnabled( Monster[i] , false )                --巡邏劇情關
                                --WriteRoleValue( Monster[i], EM_RoleValue_IsWalk, 0)    --走路	
				--LuaFunc_MoveToFlag( Monster[i], 780303, 2, 0)          --前進到指定旗

				--sleep(10)

	        		BeginPlot (Monster[i], "LuaDan_112757_Monster_Delete", 10) 	--寫一個怪自動刪掉
			SetPlot(Monster[i] , "dead" , "LuaDan_112757_MDeadScript" , 0 )

				--sleep(150)
			end
				
			
				--SetFlag( OwnerID()  , 542448 , 1 )--避免重覆觸碰生怪

			break
		end

	
	
	--BeginPlot (OwnerID(), "LuaDan_112757_Signer", 10) 	--把簽哨員叫出來
end  

----------------------------------------------------------------------------------------------------------------
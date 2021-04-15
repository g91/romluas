function LuaDan_112563_NPC_Create()

	local Rnpc = LuaFunc_SearchNPCbyOrgID( OwnerID() , 112563, 100 , 1)       --拉比兔

	If CheckID( Rnpc[0] ) == true then 

		local secondR = ReadRoleValue( Rnpc[0] ,  EM_RoleValue_Register+1 )  

		if secondR == 5 then

			DelObj(Rnpc[0])

		end

	else

		
			local Npc = CreateObjByFlag( 112563, 780348, 0 , 1 )
			AddToPartition( Npc , 0)  
	  
				SetModeEx( Npc   , EM_SetModeType_Strikback,	      false )--反擊
				SetModeEx( Npc   , EM_SetModeType_SearchenemyIgnore,  false )--被搜尋
				SetModeEx( Npc   , EM_SetModeType_Obstruct, 	      false )--阻擋
				SetModeEx( Npc   , EM_SetModeType_Mark, 	      true )--標記
				SetModeEx( Npc   , EM_SetModeType_Move, 	      true )--移動
				SetModeEx( Npc   , EM_SetModeType_Searchenemy, 	      false )--索敵
				SetModeEx( Npc   , EM_SetModeType_HideName, 	      false )--名稱
				SetModeEx( Npc   , EM_SetModeType_ShowRoleHead,	      false )--頭像框
				SetModeEx( Npc   , EM_SetModeType_Show , 	      true ) --不顯示
				SetModeEx( Npc   , EM_SetModeType_Fight , 	      false )--可砍殺攻擊
	  
			  --say(OwnerID(), "1")
		          --say(TargetID(), "2")
			  
			  BeginPlot( Npc , "LuaDan_112563_NPC_Rabbit00" , 0 ) 

	end

         
end
---------------------------------------------------------------------------------------------------------------------------------

function LuaDan_112563_NPC_Create2()

             
		local Npc = CreateObjByFlag( 112563, 780348, 0 , 1 )
		AddToPartition( Npc , 0)  
	  
			SetModeEx( Npc   , EM_SetModeType_Strikback,	      false )--反擊
			SetModeEx( Npc   , EM_SetModeType_SearchenemyIgnore,  false )--被搜尋
			SetModeEx( Npc   , EM_SetModeType_Obstruct, 	      false )--阻擋
			SetModeEx( Npc   , EM_SetModeType_Mark, 	      true )--標記
			SetModeEx( Npc   , EM_SetModeType_Move, 	      true )--移動
			SetModeEx( Npc   , EM_SetModeType_Searchenemy, 	      false )--索敵
			SetModeEx( Npc   , EM_SetModeType_HideName, 	      false )--名稱
			SetModeEx( Npc   , EM_SetModeType_ShowRoleHead,	      false )--頭像框
			SetModeEx( Npc   , EM_SetModeType_Show , 	      true ) --不顯示
			SetModeEx( Npc   , EM_SetModeType_Fight , 	      false )--可砍殺攻擊

			WriteRoleValue( Npc , EM_RoleValue_Register+1 , 5 )   
	  
		--say(OwnerID(), "1")
		--say(TargetID(), "2")
		--BeginPlot( Npc , "LuaDan_112563_NPC_Rabbit" , 0 ) 
		--sleep(30)
		BeginPlot( Npc , "LuaDan_112563_NPC_Rabbit00" , 0 ) 


end
---------------------------------------------------------------------------------------------------------------------------------

function LuaDan_112563_NPC_Rabbit() 

SetSpeakDetail(OwnerID(), "[SC_DAN_SR_111700_10]" )    --只有我最勤勞，不要看其他兩隻拉比兔，我肯定是最快到達目的地的！

end
---------------------------------------------------------------------------------------------------------------------------------

function LuaDan_112563_NPC_Rabbit00() 
	SetPlot( OwnerID() , "touch" ,"LuaDan_112563_NPC_Rabbit01",50)  
end
---------------------------------------------------------------------------------------------------------------------------------
function LuaDan_112563_NPC_Rabbit01() 

--say(OwnerID(), "5")
--say(TargetID(), "6")
	local Key    = CountBodyItem( OwnerID() , 203477 )  
	 
			if  Key >= 1 then		--方便測試課使用
				WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )           
				BeginPlot( TargetID(), "Lua_Dan_112563_Parade" , 0 ) 

			else
				ScriptMessage( TargetID(), OwnerID(), 1 , "[SC_DAN_SR_111700_10]",C_SYSTEM )  
				BeginPlot( TargetID(), "LuaDan_112563_NPC_Rabbit02" , 0 ) 		
	  		end

end
---------------------------------------------------------------------------------------------------------------------------------

function LuaDan_112563_NPC_Rabbit02() 
--say(OwnerID(), "7")
--say(TargetID(), "8")					
---
		while true do
		
		sleep(30)

	 		local RT     = ReadRoleValue( OwnerID(),  EM_RoleValue_PID )  
							

			if   GetSystime(1) == 11  and RT == 0 then

--			Say( OwnerID(),"5" )
--			Say( TargetID(),"6")
				
					WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 )           
					BeginPlot( OwnerID(), "Lua_Dan_112563_Parade" , 0 )  --活動於1100分開始
				

			elseif GetSystime(1) == 16  and RT == 0 then      

--			Say( OwnerID(),"7" )
--			Say( TargetID(),"8")                 
				
					WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 )  --活動於1600分開始
					BeginPlot( OwnerID() , "Lua_Dan_112563_Parade" , 0 )  
				

			elseif  GetSystime(1) == 20  and RT == 0 then  

--			Say( OwnerID(),"9" )
--			Say( TargetID(),"10")                         
			
					WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 )  --活動於2000分開始
					BeginPlot( OwnerID() , "Lua_Dan_112563_Parade" , 0 ) --用LubbyRabbit開始劇情 
			else 

					say(OwnerID(), "[SC_DAN_SR_112563_18]" )    --請在 11, 16, 20點在來
					break
		        end
	end
end
---------------------------------------------------------------------------------------------------------------------------------
function Lua_Dan_112563_Parade() --路線一

	local CT = 10	-- 一秒檢查一次 PID 預防程式一直檢查的措施
	local ST = 400	-- 拉比兔停留15秒的時間
	local LubbyRabbit = OwnerID()    
	
		WriteRoleValue( LubbyRabbit , EM_RoleValue_IsWalk , 1) --命令該角色都用走的(0跑;1走)                                     --Question Walk new function
		MoveToFlagEnabled( LubbyRabbit , false )   	       --開／關巡邏劇情
		SetFightMode( LubbyRabbit , 0, 1, 0, 0 )               --索敵、移動、逃跑、被攻擊 1 true.

       			 ScriptMessage( LubbyRabbit , 0 , 1 , "[SC_DAN_SR_111700_2]", C_SYSTEM ) --寶物獵人們，跟隨我的腳步，握緊你的十字鎬，來尋找屬於你的寶物吧!出發！
		    	 Say( LubbyRabbit , "[SC_DAN_SR_111700_2]")  				 --由NPC發送訊息
       			 SetPlot( LubbyRabbit , "touch" ,"Lua_Dan_112563_Touch", 50)                --點選拉比兔，拉比兔即開始遊行
	
		sleep(CT)
--		Say( OwnerID(),"1" )
--		Say( TargetID(),"2" )
	
		WriteRoleValue( LubbyRabbit, EM_RoleValue_IsWalk, 1) 			--跑吧！兔子。
		LuaFunc_MoveToFlag( LubbyRabbit, 780294, 0, 0)        			--移動到指定的棋子 
			
		sleep(CT)

			ScriptMessage( LubbyRabbit , 0 , 1 , "[SC_DAN_SR_111700_3]" , C_SYSTEM ) --拉比兔停留點：「這裡似乎有很多寶物的感覺喔。動手挖挖看吧！！」
			Say( LubbyRabbit , "[SC_DAN_SR_111700_3]" )  
	
                	 BeginPlot (LubbyRabbit, "Lua_Dan_112563_createholes", 50)       --呼叫產生洞的Script
------			
		sleep(ST)

			ScriptMessage( LubbyRabbit , 0 , 1 , "[SC_DAN_SR_111700_4]" , C_SYSTEM ) --嘿！我沒有騙你吧，我們繼續走吧！
			Say( LubbyRabbit , "[SC_DAN_SR_111700_4]" )  
	 				
		sleep(CT)		     

		WriteRoleValue(LubbyRabbit ,EM_RoleValue_IsWalk , 1) 			--走吧！兔子。
               	LuaFunc_MoveToFlag( LubbyRabbit, 780294, 1, 0)        			--移動到下一支旗子位置

		sleep(CT)

			ScriptMessage( LubbyRabbit , 0 , 1 , "[SC_DAN_SR_111700_3]" , C_SYSTEM ) --拉比兔停留點：「這裡似乎有很多寶物的感覺喔。動手挖挖看吧！！」
			Say( LubbyRabbit , "[SC_DAN_SR_111700_3]" )  
				
			BeginPlot (LubbyRabbit, "Lua_Dan_112563_createholes1", 50) 	--呼叫產生洞的Script

		sleep(ST)
			BeginPlot (LubbyRabbit, "LuaDan_112563_NPC_Create2", 10)	--呼叫產生兔子的Script
			ScriptMessage( LubbyRabbit , 0 , 1 , "[SC_DAN_SR_111700_4]" , C_SYSTEM ) --嘿！我沒有騙你吧，我們繼續走吧！
			Say( LubbyRabbit , "[SC_DAN_SR_111700_4]" )  
					
		sleep(CT)		     

		WriteRoleValue( LubbyRabbit, EM_RoleValue_IsWalk, 0) 			--跑吧！兔子。
		LuaFunc_MoveToFlag( LubbyRabbit, 780294, 2, 0)        			--移動到指定的棋子 54000替換長頸兔 ((三段路徑))

		sleep(CT)

			ScriptMessage( LubbyRabbit , 0 , 1 , "[SC_DAN_SR_111700_3]" , C_SYSTEM ) --拉比兔停留點：「這裡似乎有很多寶物的感覺喔。動手挖挖看吧！！」
			Say( LubbyRabbit, "[SC_DAN_SR_111700_3]" )  
				
			BeginPlot (LubbyRabbit, "Lua_Dan_112563_createholes12", 50)      --呼叫產生洞的Script

		sleep(ST)

			ScriptMessage( LubbyRabbit, 0 , 1 , "[SC_DAN_SR_111700_4]" , C_SYSTEM ) --嘿！我沒有騙你吧，我們繼續走吧！
			Say( LubbyRabbit, "[SC_DAN_SR_111700_4]" )  
					
		sleep(CT)		     

		WriteRoleValue( LubbyRabbit, EM_RoleValue_IsWalk, 0) 			--跑吧！兔子。
		LuaFunc_MoveToFlag( LubbyRabbit, 780294, 3, 0)        			--移動到指定的棋子 54000替換長頸兔 ((三段路徑))

		sleep(CT)

			ScriptMessage( LubbyRabbit, 0 , 1 , "[SC_DAN_SR_111700_3]" , C_SYSTEM ) --拉比兔停留點：「這裡似乎有很多寶物的感覺喔。動手挖挖看吧！！」
			ScriptMessage( LubbyRabbit, 0 , 1 , "[SC_DAN_SR_111700_23]" , C_SYSTEM ) --拉比兔停留點：「這是最後一站了喔！唧唧～」

			Say( LubbyRabbit, "[SC_DAN_SR_111700_3]" )  
			Say( LubbyRabbit, "[SC_DAN_SR_111700_23]" )  
			BeginPlot (LubbyRabbit, "Lua_Dan_112563_createholes13", 50)	--呼叫產生洞的Script

		sleep(ST)

			
			ScriptMessage( LubbyRabbit, 0 , 1 , "[SC_DAN_SR_111700_5]" , C_SYSTEM ) --遊行結束啦！是一段相當愉快的旅程喔。
			Say( LubbyRabbit, "[SC_DAN_SR_111700_5]" )  				 
--結束Script		
		sleep(CT)

		WriteRoleValue( LubbyRabbit  , EM_RoleValue_PID , 0 )
		--SetPos( LubbyRabbit, 586.5, 24.0, -8188.1, 293.1 ) --兔子出發的座標


		local secondR = ReadRoleValue( LubbyRabbit,  EM_RoleValue_Register+1 )  

		if secondR ~= 5 then

			--ScriptMessage( LubbyRabbit, 0 , 1 , "123" , C_SYSTEM ) --遊行結束啦！是一段相當愉快的旅程喔。	
		
			BeginPlot (LubbyRabbit, "LuaDan_112563_NPC_Create", 10)	--呼叫產生兔子的Script	
			sleep(50)
			DelObj(LubbyRabbit)
		else

			sleep(50)
			DelObj(LubbyRabbit)
		end

                       
end
----------------------------------------------------------------------------------------------------------------

function Lua_Dan_112563_Touch()

	Return true

end
----------------------------------------------------------------------------------------------------------------

function Lua_Dan_112563_createholes() --780296

	--Say( OwnerID(),"1" ) --Player
	--Say( TargetID(),"2" ) --Hole

		local Hole = {}

				
			Hole[0] = CreateObjByFlag( 112459, 780296, 0 , 1 )    --洞1        
			AddToPartition( Hole[0] , 0)     

			Hole[1] = CreateObjByFlag( 112459, 780296, 1 , 1 )    --洞2       
			AddToPartition( Hole[1] , 0)     

			Hole[2] = CreateObjByFlag( 112459, 780296, 2 , 1 )    --洞3       
			AddToPartition( Hole[2] , 0)     

			Hole[3] = CreateObjByFlag( 112459, 780296, 3 , 1 )    --洞4        
			AddToPartition( Hole[3] , 0)     

			Hole[4] = CreateObjByFlag( 112459, 780296, 4 , 1 )    --洞5        
			AddToPartition( Hole[4] , 0)     

                for i = 0, 4 do

			SetModeEx( Hole[i]   , EM_SetModeType_Strikback,	 false )--反擊
			SetModeEx( Hole[i]   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( Hole[i]   , EM_SetModeType_Obstruct, 	 false )--阻擋
			SetModeEx( Hole[i]   , EM_SetModeType_Mark, 		 true )--標記
			SetModeEx( Hole[i]   , EM_SetModeType_Move, 		 false )--移動
			SetModeEx( Hole[i]   , EM_SetModeType_Searchenemy, 	 false )--索敵
			SetModeEx( Hole[i]   , EM_SetModeType_HideName, 	 false )--名稱
			SetModeEx( Hole[i]   , EM_SetModeType_ShowRoleHead,	 false )--頭像框
			SetModeEx( Hole[i]   , EM_SetModeType_Show , 	 	 true ) --不顯示
			SetModeEx( Hole[i]   , EM_SetModeType_Fight , 		 false )--可砍殺攻擊

		end
	              	sleep(10)    
                        			
			--SetCursorType( Hole[0] , eCursor_Mine )
			--SetPlot( Hole[0] ,"touch",  "Lua_Dan_112563_Hole" , 50 )
			BeginPlot (Hole[0] , "Lua_Dan_112563_Hole", 10)  
		

			--SetCursorType( Hole[1] , eCursor_Mine )
			--SetPlot( Hole[1] ,"touch",  "Lua_Dan_112563_Hole" , 50 )
			BeginPlot (Hole[1] , "Lua_Dan_112563_Hole1", 10)  
			

			--SetCursorType( Hole[2] , eCursor_Mine )
			--SetPlot( Hole[2] ,"touch",  "Lua_Dan_112563_Hole" , 50 )
			BeginPlot (Hole[2] , "Lua_Dan_112563_Hole2", 10)  
			

			--SetCursorType( Hole[3] , eCursor_Mine )
			--SetPlot( Hole[3] ,"touch",  "Lua_Dan_112563_Hole" , 50 )
			BeginPlot (Hole[3] , "Lua_Dan_112563_Hole3", 10) 
			

			--SetCursorType( Hole[4] , eCursor_Mine )
			--SetPlot( Hole[4] ,"touch",  "Lua_Dan_112563_Hole" , 50 )
			BeginPlot (Hole[4] , "Lua_Dan_112563_Hole4", 10) 
					
end



----------------------------------------------------------------------------------------------------------------
function Lua_Dan_112563_createholes1() --780336

			local Hole = {}

				
			Hole[0] = CreateObjByFlag( 112459, 780336, 0 , 1 )    --洞1        
			AddToPartition( Hole[0] , 0)     

			Hole[1] = CreateObjByFlag( 112459, 780336, 1 , 1 )    --洞2       
			AddToPartition( Hole[1] , 0)     

			Hole[2] = CreateObjByFlag( 112459, 780336, 2 , 1 )    --洞3       
			AddToPartition( Hole[2] , 0)     

			Hole[3] = CreateObjByFlag( 112459, 780336, 3 , 1 )    --洞4        
			AddToPartition( Hole[3] , 0)     

			Hole[4] = CreateObjByFlag( 112459, 780336, 4 , 1 )    --洞5        
			AddToPartition( Hole[4] , 0)     

                for i = 0, 4 do

			SetModeEx( Hole[i]   , EM_SetModeType_Strikback,	 false )--反擊
			SetModeEx( Hole[i]   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( Hole[i]   , EM_SetModeType_Obstruct, 	 false )--阻擋
			SetModeEx( Hole[i]   , EM_SetModeType_Mark, 		 true )--標記
			SetModeEx( Hole[i]   , EM_SetModeType_Move, 		 false )--移動
			SetModeEx( Hole[i]   , EM_SetModeType_Searchenemy, 	 false )--索敵
			SetModeEx( Hole[i]   , EM_SetModeType_HideName, 	 false )--名稱
			SetModeEx( Hole[i]   , EM_SetModeType_ShowRoleHead,	 false )--頭像框
			SetModeEx( Hole[i]   , EM_SetModeType_Show , 	 	 true ) --不顯示
			SetModeEx( Hole[i]   , EM_SetModeType_Fight , 		 false )--可砍殺攻擊

		end
	              	sleep(10)    
                        			
			--SetCursorType( Hole[0] , eCursor_Mine )
			--SetPlot( Hole[0] ,"touch",  "Lua_Dan_112563_Hole" , 50 )
			BeginPlot (Hole[0] , "Lua_Dan_112563_Hole", 10)  
		

			--SetCursorType( Hole[1] , eCursor_Mine )
			--SetPlot( Hole[1] ,"touch",  "Lua_Dan_112563_Hole" , 50 )
			BeginPlot (Hole[1] , "Lua_Dan_112563_Hole1", 10)  
			

			--SetCursorType( Hole[2] , eCursor_Mine )
			--SetPlot( Hole[2] ,"touch",  "Lua_Dan_112563_Hole" , 50 )
			BeginPlot (Hole[2] , "Lua_Dan_112563_Hole2", 10)  
			

			--SetCursorType( Hole[3] , eCursor_Mine )
			--SetPlot( Hole[3] ,"touch",  "Lua_Dan_112563_Hole" , 50 )
			BeginPlot (Hole[3] , "Lua_Dan_112563_Hole3", 10) 
			

			--SetCursorType( Hole[4] , eCursor_Mine )
			--SetPlot( Hole[4] ,"touch",  "Lua_Dan_112563_Hole" , 50 )
			BeginPlot (Hole[4] , "Lua_Dan_112563_Hole4", 10) 
				
		
			
			
			
end
----------------------------------------------------------------------------------------------------------------

function Lua_Dan_112563_createholes12() --780337

				local Hole = {}

				
			Hole[0] = CreateObjByFlag( 112459, 780337, 0 , 1 )    --洞1        
			AddToPartition( Hole[0] , 0)     

			Hole[1] = CreateObjByFlag( 112459, 780337, 1 , 1 )    --洞2       
			AddToPartition( Hole[1] , 0)     

			Hole[2] = CreateObjByFlag( 112459, 780337, 2 , 1 )    --洞3       
			AddToPartition( Hole[2] , 0)     

			Hole[3] = CreateObjByFlag( 112459, 780337, 3 , 1 )    --洞4        
			AddToPartition( Hole[3] , 0)     

			Hole[4] = CreateObjByFlag( 112459, 780337, 4 , 1 )    --洞5        
			AddToPartition( Hole[4] , 0)     

                for i = 0, 4 do

			SetModeEx( Hole[i]   , EM_SetModeType_Strikback,	 false )--反擊
			SetModeEx( Hole[i]   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( Hole[i]   , EM_SetModeType_Obstruct, 	 false )--阻擋
			SetModeEx( Hole[i]   , EM_SetModeType_Mark, 		 true )--標記
			SetModeEx( Hole[i]   , EM_SetModeType_Move, 		 false )--移動
			SetModeEx( Hole[i]   , EM_SetModeType_Searchenemy, 	 false )--索敵
			SetModeEx( Hole[i]   , EM_SetModeType_HideName, 	 false )--名稱
			SetModeEx( Hole[i]   , EM_SetModeType_ShowRoleHead,	 false )--頭像框
			SetModeEx( Hole[i]   , EM_SetModeType_Show , 	 	 true ) --不顯示
			SetModeEx( Hole[i]   , EM_SetModeType_Fight , 		 false )--可砍殺攻擊

		end
	              	sleep(10)    
                        			
			--SetCursorType( Hole[0] , eCursor_Mine )
			--SetPlot( Hole[0] ,"touch",  "Lua_Dan_112563_Hole" , 50 )
			BeginPlot (Hole[0] , "Lua_Dan_112563_Hole", 10)  
		

			--SetCursorType( Hole[1] , eCursor_Mine )
			--SetPlot( Hole[1] ,"touch",  "Lua_Dan_112563_Hole" , 50 )
			BeginPlot (Hole[1] , "Lua_Dan_112563_Hole1", 10)  
			

			--SetCursorType( Hole[2] , eCursor_Mine )
			--SetPlot( Hole[2] ,"touch",  "Lua_Dan_112563_Hole" , 50 )
			BeginPlot (Hole[2] , "Lua_Dan_112563_Hole2", 10)  
			

			--SetCursorType( Hole[3] , eCursor_Mine )
			--SetPlot( Hole[3] ,"touch",  "Lua_Dan_112563_Hole" , 50 )
			BeginPlot (Hole[3] , "Lua_Dan_112563_Hole3", 10) 
			

			--SetCursorType( Hole[4] , eCursor_Mine )
			--SetPlot( Hole[4] ,"touch",  "Lua_Dan_112563_Hole" , 50 )
			BeginPlot (Hole[4] , "Lua_Dan_112563_Hole4", 10) 
				
		
		
			
			
end
----------------------------------------------------------------------------------------------------------------

function Lua_Dan_112563_createholes13() --780338

		
				local Hole = {}

				
			Hole[0] = CreateObjByFlag( 112459, 780338, 0 , 1 )    --洞1        
			AddToPartition( Hole[0] , 0)     

			Hole[1] = CreateObjByFlag( 112459, 780338, 1 , 1 )    --洞2       
			AddToPartition( Hole[1] , 0)     

			Hole[2] = CreateObjByFlag( 112459, 780338, 2 , 1 )    --洞3       
			AddToPartition( Hole[2] , 0)     

			Hole[3] = CreateObjByFlag( 112459, 780338, 3 , 1 )    --洞4        
			AddToPartition( Hole[3] , 0)     

			Hole[4] = CreateObjByFlag( 112459, 780338, 4 , 1 )    --洞5        
			AddToPartition( Hole[4] , 0)     

                for i = 0, 4 do

			SetModeEx( Hole[i]   , EM_SetModeType_Strikback,	 false )--反擊
			SetModeEx( Hole[i]   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( Hole[i]   , EM_SetModeType_Obstruct, 	 false )--阻擋
			SetModeEx( Hole[i]   , EM_SetModeType_Mark, 		 true )--標記
			SetModeEx( Hole[i]   , EM_SetModeType_Move, 		 false )--移動
			SetModeEx( Hole[i]   , EM_SetModeType_Searchenemy, 	 false )--索敵
			SetModeEx( Hole[i]   , EM_SetModeType_HideName, 	 false )--名稱
			SetModeEx( Hole[i]   , EM_SetModeType_ShowRoleHead,	 false )--頭像框
			SetModeEx( Hole[i]   , EM_SetModeType_Show , 	 	 true ) --不顯示
			SetModeEx( Hole[i]   , EM_SetModeType_Fight , 		 false )--可砍殺攻擊

		end
	              	sleep(10)    
                        			
			--SetCursorType( Hole[0] , eCursor_Mine )
			--SetPlot( Hole[0] ,"touch",  "Lua_Dan_112563_Hole" , 50 )
			BeginPlot (Hole[0] , "Lua_Dan_112563_Hole", 10)  
		

			--SetCursorType( Hole[1] , eCursor_Mine )
			--SetPlot( Hole[1] ,"touch",  "Lua_Dan_112563_Hole" , 50 )
			BeginPlot (Hole[1] , "Lua_Dan_112563_Hole1", 10)  
			

			--SetCursorType( Hole[2] , eCursor_Mine )
			--SetPlot( Hole[2] ,"touch",  "Lua_Dan_112563_Hole" , 50 )
			BeginPlot (Hole[2] , "Lua_Dan_112563_Hole2", 10)  
			

			--SetCursorType( Hole[3] , eCursor_Mine )
			--SetPlot( Hole[3] ,"touch",  "Lua_Dan_112563_Hole" , 50 )
			BeginPlot (Hole[3] , "Lua_Dan_112563_Hole3", 10) 
			

			--SetCursorType( Hole[4] , eCursor_Mine )
			--SetPlot( Hole[4] ,"touch",  "Lua_Dan_112563_Hole" , 50 )
			BeginPlot (Hole[4] , "Lua_Dan_112563_Hole4", 10) 
		
			

end



----------------------------------------------------------------------------------------------------------------
function Lua_Dan_112563_Hole()

	--Say( OwnerID(),"Hole" ) --Player
	--Say( TargetID(),"Hole2" ) --Hole

	local Random = Rand(100)

		     local probability = {		20,	-- 資源
			   			20,             -- 炸彈
			                      		20,             -- 藥水
			                       		20,             -- 怪
						20 }       	-- 什麼都沒有 
                       
                   	

                         if Random > (100 - probability[1] )  then  --20% 機率　--神秘的結晶體用來打開得到資源--Lua_Dan_112563_Hole_Resource
  				
                   			SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Nothing" , 50 ) 
							
			 

                    	 elseif Random > (100 - probability[1] - probability[2])  then --40%活動藥水 --Lua_Dan_112563_Hole_Potion
				
				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Bomb" , 50 ) 
			
						
                         

			 elseif Random > (100 - probability[1] - probability[2] - probability[3]) then --怪物 60% --Lua_Dan_112563_Hole_Monster
			 
				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Resource" , 50 ) 
		
								
			 

			elseif Random > (100 - probability[1] - probability[2] - probability[3] - probability[4])  then --炸彈  80% --Lua_Dan_112563_Hole_Bomb
			
				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Potion" , 50 ) 
                      
			else 

				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Monster" ,50 ) --Lua_Dan_112563_Hole_Nothing
						
			end

--Say( OwnerID(),"Hole5" ) --洞
--Say( TargetID(),"Hole6" ) --尼樂
                                BeginPlot ( OwnerID() , "Lua_Dan_112563_Hole_Delete", 10) 


end 
----------------------------------------------------------------------------------------------------------------
function Lua_Dan_112563_Hole1()

	
	--Say( OwnerID(),"Hole3" ) --Player
	--Say( TargetID(),"Hole4" ) --Hole

		local Random = Rand(100)

		     local probability = {	20,		-- 資源
			   			20,             -- 炸彈
			                        20,             -- 藥水
			                        20,             -- 怪
						20 }       	-- 什麼都沒有 
                       
                   	

                         if Random > (100 - probability[1] )  then  --20% 機率　--神秘的結晶體用來打開得到資源--Lua_Dan_112563_Hole_Resource
  				
                   		SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Nothing" , 50 ) 
                    	 elseif Random > (100 - probability[1] - probability[2])  then --40%活動藥水 --Lua_Dan_112563_Hole_Potion
				
				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Bomb" , 50 ) 
			   
			 elseif Random > (100 - probability[1] - probability[2] - probability[3]) then --怪物 60% --Lua_Dan_112563_Hole_Monster
			 
				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Resource" , 50 ) 
		
			elseif Random > (100 - probability[1] - probability[2] - probability[3] - probability[4])  then --炸彈  80% --Lua_Dan_112563_Hole_Bomb
			
				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Potion" , 50 ) 
                      
			else 
				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Monster" , 50 ) --Lua_Dan_112563_Hole_Nothing
						
			end

--Say( OwnerID(),"Hole5" ) --洞
--Say( TargetID(),"Hole6" ) --尼樂
                                BeginPlot ( OwnerID() , "Lua_Dan_112563_Hole_Delete", 10) 

end 
----------------------------------------------------------------------------------------------------------------
function Lua_Dan_112563_Hole2()

	--Say( OwnerID(),"Hole5" ) --Player
	--Say( TargetID(),"Hole6" ) --Hole

		local Random = Rand(100)

		     local probability = {	20,		-- 資源
			   			20,             -- 炸彈
			                        20,             -- 藥水
			                        20,             -- 怪
						20 }       	-- 什麼都沒有 
                       
                   	

                          if Random > (100 - probability[1] )  then  --20% 機率　--神秘的結晶體用來打開得到資源--Lua_Dan_112563_Hole_Resource
  				
                   		SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Nothing" , 50 ) 
							
			  

                    	 elseif Random > (100 - probability[1] - probability[2])  then --40%活動藥水 --Lua_Dan_112563_Hole_Potion
				
				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Bomb" , 50 ) 
			
						
                         

			 elseif Random > (100 - probability[1] - probability[2] - probability[3]) then --怪物 60% --Lua_Dan_112563_Hole_Monster
			 
				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Resource" , 50 ) 
		
								
			 
			elseif Random > (100 - probability[1] - probability[2] - probability[3] - probability[4])  then --炸彈  80% --Lua_Dan_112563_Hole_Bomb
			
				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Potion" , 50 ) 
                      
			else 

				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Monster" , 50 ) --Lua_Dan_112563_Hole_Nothing
						
			end

--Say( OwnerID(),"Hole5" ) --洞
--Say( TargetID(),"Hole6" ) --尼樂
                                BeginPlot ( OwnerID() , "Lua_Dan_112563_Hole_Delete", 10) 
end 
----------------------------------------------------------------------------------------------------------------
function Lua_Dan_112563_Hole3()

	--Say( OwnerID(),"Hole7" ) --Player
	--Say( TargetID(),"Hole8" ) --Hole

		local Random = Rand(100)

		     local probability = {	20,		-- 資源
			   			20,             -- 炸彈
			                        20,             -- 藥水
			                        20,             -- 怪
						20 }       	-- 什麼都沒有 
                       
                   	

                          if Random > (100 - probability[1] )  then  --20% 機率　--神秘的結晶體用來打開得到資源--Lua_Dan_112563_Hole_Resource
  				
                   		SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Nothing" , 50 ) 
							
			  

                    	 elseif Random > (100 - probability[1] - probability[2])  then --40%活動藥水 --Lua_Dan_112563_Hole_Potion
				
				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Bomb" , 50 ) 
			
						
                         

			 elseif Random > (100 - probability[1] - probability[2] - probability[3]) then --怪物 60% --Lua_Dan_112563_Hole_Monster
			 
				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Resource" , 50 ) 
		
								
			 
			elseif Random > (100 - probability[1] - probability[2] - probability[3] - probability[4])  then --炸彈  80% --Lua_Dan_112563_Hole_Bomb
			
				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Potion" , 50 ) 
                      
			else 

				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Monster" , 50 ) --Lua_Dan_112563_Hole_Nothing
						
			end
--Say( OwnerID(),"Hole5" ) --洞
--Say( TargetID(),"Hole6" ) --尼樂
                                 BeginPlot ( OwnerID() , "Lua_Dan_112563_Hole_Delete", 10) 

end 
----------------------------------------------------------------------------------------------------------------
function Lua_Dan_112563_Hole4()

	--Say( OwnerID(),"Hole9" ) --Player
	--Say( TargetID(),"Hole10" ) --Hole

		local Random = Rand(100)

		     local probability = {	20,		-- 資源
			   			20,             -- 炸彈
			                        20,             -- 藥水
			                        20,             -- 怪
						20 }       	-- 什麼都沒有 
                       
                   	

                         if Random > (100 - probability[1] )  then  --20% 機率　--神秘的結晶體用來打開得到資源--Lua_Dan_112563_Hole_Resource
  				
                   		SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Nothing" , 50 ) 
							
			  

                    	 elseif Random > (100 - probability[1] - probability[2])  then --40%活動藥水 --Lua_Dan_112563_Hole_Potion
				
				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Bomb" , 50 ) 
			
						
                         

			 elseif Random > (100 - probability[1] - probability[2] - probability[3]) then --怪物 60% --Lua_Dan_112563_Hole_Monster
			 
				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Resource" , 50 ) 
		
								
			 
			elseif Random > (100 - probability[1] - probability[2] - probability[3] - probability[4])  then --炸彈  80% --Lua_Dan_112563_Hole_Bomb
			
				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Potion" , 50 ) 
                      
			else 

				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Monster" , 50 ) --Lua_Dan_112563_Hole_Nothing
						
			end
--Say( OwnerID(),"Hole5" ) --洞
--Say( TargetID(),"Hole6" ) --尼樂 
			BeginPlot ( OwnerID() , "Lua_Dan_112563_Hole_Delete", 10) 
                                
end 
----------------------------------------------------------------------------------------------------------------
function Lua_Dan_112563_Hole_Bomb() --Target為炸彈
	
	--Say( OwnerID(),"1" ) --Player
	--Say( TargetID(),"2" ) --Hole
	--SetPlot( TargetID(),"touch","", 30)
	AddBuff(OwnerID(), 503147 , 1 , 1 )
	if BeginCastBar( OwnerID(), "[SC_DAN_SR_111700_6]", 30 , ruFUSION_ACTORSTATE_MINING_BEGIN , ruFUSION_ACTORSTATE_MINING_END , 0 ) == 1 then
        --/*開始施法，使用者,時間條上的文字,進行時間,起始動作,結束動作,中斷條件(0為移動中斷)	
 		
		
		AttachCastMotionTool( OwnerID(), 210508 ) --置換武器為圓鍬

		while true do
		sleep( 2 )
		
			if ( CheckCastBar( OwnerID() )   ~= 0 ) then 
				if ( CheckCastBar( OwnerID() )   > 0) then -- 成功
					result = "OKOK"
					EndCastBar( OwnerID() , CheckCastBar( OwnerID() )   )
					break
				elseif ( CheckCastBar( OwnerID() )   < 0 ) then -- 失敗
					result = "DAME"
					EndCastBar( OwnerID() , CheckCastBar( OwnerID() )   )
					break
				end
			end
		end
			if ( result == "OKOK" ) then
			SetPlot( TargetID(),"touch","", 0)

--502927
--CastSpelllv( TargetID(), TargetID() , 492823, 0) --春雨節的祝福

			
			local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV  ) 
			WriteRoleValue( TargetID() , EM_RoleValue_Register+7 , PlayerLV )  
	

			BeginPlot( TargetID() , "Lua_Dan_112563_Bomb" , 0 )  
			--sleep(10)
			
			--hide(TargetID())

			end


			end
			
			
		

        
	
end

----------------------------------------------------------------------------------------------------------------
function Lua_Dan_112563_Hole_Monster() --Target為怪物
	
	--Say( OwnerID(),"9" ) --Player
	--Say( TargetID(),"10" ) --Hole

	--SetPlot( TargetID(),"touch","", 0)
	AddBuff(OwnerID(), 503147 , 1 , 1 )
	if BeginCastBar( OwnerID(), "[SC_DAN_SR_111700_6]", 30 , ruFUSION_ACTORSTATE_MINING_BEGIN , ruFUSION_ACTORSTATE_MINING_END , 0 ) == 1 then
        --/*開始施法，使用者,時間條上的文字,進行時間,起始動作,結束動作,中斷條件(0為移動中斷)	
 		
		
		AttachCastMotionTool( OwnerID(), 210508 ); --置換武器為圓鍬

		while true do
		sleep( 2 )
		
			if ( CheckCastBar( OwnerID() )   ~= 0 ) then 
				if ( CheckCastBar( OwnerID() )   > 0) then -- 成功
					result = "OKOK"
					EndCastBar( OwnerID() , CheckCastBar( OwnerID() )   )
					break
				elseif ( CheckCastBar( OwnerID() )   < 0 ) then -- 失敗
					result = "DAME"
					EndCastBar( OwnerID() , CheckCastBar( OwnerID() )   )
					break
				end
			end
			end
			if ( result == "OKOK" ) then
			SetPlot( TargetID(),"touch","", 0)
			
			 
			 BeginPlot( TargetID() , "Lua_Dan_112563_Monster" , 10 )  
			--AddBuff( TargetID(),  502927, 1, 10)
			 
--			 sleep(10)
				
			

			end


			end
			
			
		

        
	
end

----------------------------------------------------------------------------------------------------------------


function Lua_Dan_112563_Hole_Resource() --Target為資源
	
	--Say( OwnerID(),"11" ) --Player
	--Say( TargetID(),"12" ) --Hole
	--SetPlot( TargetID(),"touch","", 30)
		AddBuff(OwnerID(), 503147 , 1 , 1 )
	if BeginCastBar( OwnerID(), "[SC_DAN_SR_111700_6]", 30 , ruFUSION_ACTORSTATE_MINING_BEGIN , ruFUSION_ACTORSTATE_MINING_END , 0 ) == 1 then
        --/*開始施法，使用者,時間條上的文字,進行時間,起始動作,結束動作,中斷條件(0為移動中斷)	
 	
		
		AttachCastMotionTool( OwnerID(), 210508 ); --置換武器為圓鍬

		while true do
		sleep( 2 )
		
			if ( CheckCastBar( OwnerID() )   ~= 0 ) then 
				if ( CheckCastBar( OwnerID() )   > 0) then -- 成功
					result = "OKOK"
					EndCastBar( OwnerID() , CheckCastBar( OwnerID() )   )
					break;
				elseif ( CheckCastBar( OwnerID() )   < 0 ) then -- 失敗
					result = "DAME"
					EndCastBar( OwnerID() , CheckCastBar( OwnerID() )   )
					break;
				end
			end
		end
			if ( result == "OKOK" ) then
			SetPlot( TargetID(),"touch","",0 )
				--AddBuff( TargetID(),  502927, 1, 10)           --煙霧特效
 			--CastSpelllv( TargetID(), TargetID() , 492823, 0) --春雨節的祝福


			--local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV  ) 
			--WriteRoleValue( TargetID() , EM_RoleValue_Register+7 , PlayerLV )  
			BeginPlot( TargetID() , "Lua_Dan_112563_Resource" , 10 )  
			--sleep(10)
								
			
			--hide(TargetID())
                        
				
			end

			end
			
		
		

        
	
end

----------------------------------------------------------------------------------------------------------------


function Lua_Dan_112563_Hole_Potion() --Target為藥水
	
	--Say( OwnerID(),"13" ) --Player
	--Say( TargetID(),"14" ) --Hole
	--SetPlot( TargetID(),"touch","", 30)
AddBuff(OwnerID(), 503147 , 1 , 1 )
	if BeginCastBar( OwnerID(), "[SC_DAN_SR_111700_6]", 30 , ruFUSION_ACTORSTATE_MINING_BEGIN , ruFUSION_ACTORSTATE_MINING_END , 0 ) == 1 then
        --/*開始施法，使用者,時間條上的文字,進行時間,起始動作,結束動作,中斷條件(0為移動中斷)	
 		
		AttachCastMotionTool( OwnerID(), 210508 ); --置換武器為圓鍬

		while true do
		sleep( 2 )
			
			if ( CheckCastBar( OwnerID() )   ~= 0 ) then 
				if ( CheckCastBar( OwnerID() )   > 0) then -- 成功
					result = "OKOK"
					EndCastBar( OwnerID() , CheckCastBar( OwnerID() )   )
					break;
				elseif ( CheckCastBar( OwnerID() )   < 0 ) then -- 失敗
					result = "DAME"
					EndCastBar( OwnerID() , CheckCastBar( OwnerID() )   )
					break;
				end
			end
		end
			if ( result == "OKOK" ) then
			SetPlot( TargetID(),"touch","",0 )
--Say( OwnerID(),"00" )  --Player
--Say( TargetID(),"01" ) --Hole
				--AddBuff( TargetID(),  502927, 1, 10)

 			--CastSpelllv( TargetID(), TargetID() , 492823, 0) --春雨節的祝福
			--local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV  ) 
			--WriteRoleValue( TargetID() , EM_RoleValue_Register+7 , PlayerLV )  
			BeginPlot( TargetID() , "Lua_Dan_112563_Potion" , 10 )  
			--sleep(10)
			--hide(TargetID())
	
			end

			
			end
		

        
	
end

----------------------------------------------------------------------------------------------------------------


function Lua_Dan_112563_Hole_Nothing() --Target為什麼都沒有
	
	--Say( OwnerID(),"15" ) --Player
	--Say( TargetID(),"16" ) --Hole

	--SetPlot( TargetID(),"touch","", 30)
	AddBuff(OwnerID(), 503147 , 1 , 1 )
	if BeginCastBar( OwnerID(), "[SC_DAN_SR_111700_6]", 30 , ruFUSION_ACTORSTATE_MINING_BEGIN , ruFUSION_ACTORSTATE_MINING_END , 0 ) == 1 then
        --/*開始施法，使用者,時間條上的文字,進行時間,起始動作,結束動作,中斷條件(0為移動中斷)	
 	
		AttachCastMotionTool( OwnerID(), 210508 ); --置換武器為圓鍬

		while true do
		sleep( 2 )
		
			if ( CheckCastBar( OwnerID() )   ~= 0 ) then 
				if ( CheckCastBar( OwnerID() )   > 0) then -- 成功
					result = "OKOK"
					EndCastBar( OwnerID() , CheckCastBar( OwnerID() )   )
					break
				elseif ( CheckCastBar( OwnerID() )   < 0 ) then -- 失敗
					result = "DAME"
					EndCastBar( OwnerID() , CheckCastBar( OwnerID() )   )
					break
				end
			end
			end
		
			if ( result == "OKOK" ) then
			SetPlot( TargetID(),"touch","", 0)
			
			 --AddBuff( TargetID(),  502927, 1, 10)
			 --CastSpelllv( TargetID(), TargetID() , 492823, 0) --春雨節的祝福
					 
			BeginPlot( TargetID() , "Lua_Dan_112563_Nothing" , 10 )  
			--sleep(10)

			--hide(TargetID())
		
			end

			
			end
       
	
end
function Lua_Dan_112563_Resource()
	 
				Hole = LuaFunc_CreateObjByObj ( 112579 , OwnerID() )   --洞    
			
				SetModeEx( Hole   , EM_SetModeType_Strikback, false )--反擊
				SetModeEx( Hole   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
				SetModeEx( Hole   , EM_SetModeType_Obstruct, false )--阻擋
				SetModeEx( Hole   , EM_SetModeType_Mark, false )--標記
				SetModeEx( Hole   , EM_SetModeType_Move, false )--移動
				SetModeEx( Hole   , EM_SetModeType_Searchenemy, false )--索敵
				SetModeEx( Hole   , EM_SetModeType_HideName, false )--名稱
				SetModeEx( Hole  , EM_SetModeType_ShowRoleHead, false )--頭像框
				SetModeEx( Hole   , EM_SetModeType_Show , true ) --不顯示
				SetModeEx( Hole   , EM_SetModeType_Fight , false )--可砍殺攻擊
			
				AddToPartition( Hole , 0) 					                          	
				BeginPlot (Hole , "Lua_Dan_112563_Hole_Delete", 10) 
				sleep(10)
				DelObj(OwnerID())    

                   			ScriptMessage( OwnerID() , 0 , 1 , "[SC_DAN_SR_111700_11]" , C_SYSTEM ) --原來是地靈結晶啊~
  				GiveBodyItem( TargetID(), 204218, 1) 
	 
end
----------------------------------------------------------------------------------------------------------------

function Lua_Dan_112563_Potion()  --20100305 米佳變更 原本藥水是基礎藥水 變更為必爾汀藥水掉寶表

	--Say( OwnerID(),"1" ) --Hole
	--Say( TargetID(),"2" ) --Player			
				
			
				

        		local Hole = LuaFunc_CreateObjByObj ( 112579 , OwnerID() )   --洞        
				
				ScriptMessage( OwnerID() , 0 , 1 , "[SC_DAN_SR_111700_15]" , C_SYSTEM ) --原來是藥水啊~
  				GiveBodyItem(TargetID(), 724266, 1)   --必爾汀系列補品包
	--Say( OwnerID(),"3" ) --Hole
	--Say( TargetID(),"4" ) --Player	
				SetModeEx( Hole   , EM_SetModeType_Strikback, false )--反擊
				SetModeEx( Hole   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
				SetModeEx( Hole   , EM_SetModeType_Obstruct, false )--阻擋
				SetModeEx( Hole   , EM_SetModeType_Mark, false )--標記
				SetModeEx( Hole   , EM_SetModeType_Move, false )--移動
				SetModeEx( Hole   , EM_SetModeType_Searchenemy, false )--索敵
				SetModeEx( Hole   , EM_SetModeType_HideName, false )--名稱
				SetModeEx( Hole  , EM_SetModeType_ShowRoleHead, false )--頭像框
				SetModeEx( Hole   , EM_SetModeType_Show , true ) --不顯示
				SetModeEx( Hole   , EM_SetModeType_Fight , false )--可砍殺攻擊
			
				AddToPartition( Hole , 0)  
                    			

				

				--DelObj( Hole )	 
				BeginPlot (Hole , "Lua_Dan_112563_Hole_Delete", 10) 
				sleep(10)
				DelObj(OwnerID())   
				
end
----------------------------------------------------------------------------------------------------------------

function Lua_Dan_112563_Monster()
	
			AddBuff( TargetID(),  502927, 1, 10)
			--sleep(20)
			Hole = LuaFunc_CreateObjByObj ( 112579 , OwnerID() )   --洞        
			   

			SetModeEx( Hole   , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( Hole   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( Hole   , EM_SetModeType_Obstruct, false )--阻擋
			SetModeEx( Hole   , EM_SetModeType_Mark, false )--標記
			SetModeEx( Hole   , EM_SetModeType_Move, false )--移動
			SetModeEx( Hole   , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( Hole   , EM_SetModeType_HideName, false )--名稱
			SetModeEx( Hole  , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( Hole   , EM_SetModeType_Show , true ) --不顯示
			SetModeEx( Hole   , EM_SetModeType_Fight , false )--可砍殺攻擊
			CancelBuff( TargetID() , 503141)
		
			sleep(5)
			
			AddBuff( TargetID(),  503141, 1, 10)
			--sleep(20)
		
			AddToPartition( Hole , 0)  
			
			
			BeginPlot (Hole, "Lua_Dan_112563_Hole_Delete", 10) 
			sleep(10)
			DelObj(OwnerID())   
			
			local Monster = LuaFunc_CreateObjByObj ( 101783 , OwnerID() ) 
		        	 
			        --sleep(30)
		       		 ScriptMessage( OwnerID() , 0 , 1 , "[SC_DAN_SR_111700_16]" , C_SYSTEM ) --出現地底毛蟲~
				 AddBuff( Monster ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
				 SetAttack( Monster , TargetID()  )
	
                        	 
				BeginPlot (Monster , "Lua_Dan_112563_Monster_Delete", 10) 

				

end
----------------------------------------------------------------------------------------------------------------

function Lua_Dan_112563_Bomb()

	
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7  )  



	local P = 100
	local XX = Rand( P )    



	local aLV = 0
	local bLV = 0
	local cLV = 0	

	if PlayerLV < 16 then  --依等級判斷炸彈威力
		aLV = 1  --傷害200
 		bLV = 2  --傷300
		cLV = 4  --傷500

	elseif PlayerLV >= 16  and  PlayerLV < 21  then
		aLV = 2
 		bLV = 3
		cLV = 5

	elseif PlayerLV >= 21  and  PlayerLV < 26  then
		aLV = 3
 		bLV = 4
		cLV = 6

	elseif PlayerLV >= 26  and  PlayerLV < 31  then
		aLV = 4
 		bLV = 5
		cLV = 7

	elseif PlayerLV >= 31  and  PlayerLV < 36  then
		aLV = 5
 		bLV = 6
		cLV = 9

	elseif PlayerLV >= 36  and  PlayerLV < 41  then
		aLV = 6
 		bLV = 7
		cLV = 10

	elseif PlayerLV >= 41  and  PlayerLV < 46  then
		aLV = 7
 		bLV = 10
		cLV = 15

	elseif PlayerLV >= 46  and  PlayerLV < 52  then
		aLV = 8
 		bLV = 12
		cLV = 18

	end



	if XX > 40 and XX <= 100 then   --60%
		ScriptMessage( OwnerID() , 0 , 1 , "|cffff00ff" .."[SC_DAN_SR_111700_7]".. "|r" , 0 ) --嘿嘿!挖到一顆[101486]囉!
		ScriptMessage( OwnerID() , 0 , 0 , "|cffff00ff" .."[SC_DAN_SR_111700_7]".. "|r" , 0 ) --嘿嘿!挖到一顆[101486]囉!
		CancelBuff( TargetID() , 503141)
		
		sleep(5)
		AddBuff( TargetID(),  503141, 1, 10)
		sleep(20)
		local Bomb = LuaFunc_CreateObjByObj ( 101486 , OwnerID() ) --小炸彈
		
		SetFightMode(  Bomb , 0, 0, 0, 0 )

		WriteRoleValue( Bomb , EM_RoleValue_PID , aLV  )    --炸彈等級
		BeginPlot( Bomb , "Lua_Dan_112563_003_s" , 0 )        --由NPC執行
		
		Hole = LuaFunc_CreateObjByObj ( 112579 , OwnerID() )   --洞
	  
			
			    
			SetModeEx( Hole   , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( Hole   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( Hole   , EM_SetModeType_Obstruct, false )--阻擋
			SetModeEx( Hole   , EM_SetModeType_Mark, false )--標記
			SetModeEx( Hole   , EM_SetModeType_Move, false )--移動
			SetModeEx( Hole   , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( Hole   , EM_SetModeType_HideName, false )--名稱
			SetModeEx( Hole  , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( Hole   , EM_SetModeType_Show , true ) --不顯示
			SetModeEx( Hole   , EM_SetModeType_Fight , false )--可砍殺攻擊
			AddToPartition( Hole , 0)   
			--CastSpelllv( OwnerID(), OwnerID() , 492823, 0) 
			--sleep(20)
			BeginPlot (Hole , "Lua_Dan_112563_Hole_Delete", 10) 
			sleep(10)
			DelObj(OwnerID())   


	elseif XX <= 40 and XX > 10 then  --30%

		ScriptMessage( OwnerID() , 0, 1 , "|cffff00ff" .."[SC_DAN_SR_111700_8]".. "|r" , 0 ) --嘿嘿!挖到一顆[101487]囉!
		ScriptMessage( OwnerID() , 0 , 0 , "|cffff00ff" .."[SC_DAN_SR_111700_8]".. "|r" , 0 ) --嘿嘿!挖到一顆[101487]囉!
		
		CancelBuff( TargetID() , 503141)
		
		sleep(5)

		AddBuff( TargetID(),  503141, 1, 10)
		sleep(20)

		local Bomb = LuaFunc_CreateObjByObj ( 101487 , OwnerID() ) --中炸彈
		
		SetFightMode(  Bomb , 0, 0, 0, 0 )

		WriteRoleValue( Bomb , EM_RoleValue_PID , bLV  )   --炸彈等級
		BeginPlot( Bomb , "Lua_Dan_112563_003_m" , 0 )        --由NPC執行

			Hole = LuaFunc_CreateObjByObj ( 112579 , OwnerID() )   --洞  
			
			    
			SetModeEx( Hole   , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( Hole   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( Hole   , EM_SetModeType_Obstruct, false )--阻擋
			SetModeEx( Hole   , EM_SetModeType_Mark, false )--標記
			SetModeEx( Hole   , EM_SetModeType_Move, false )--移動
			SetModeEx( Hole   , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( Hole   , EM_SetModeType_HideName, false )--名稱
			SetModeEx( Hole  , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( Hole   , EM_SetModeType_Show , true ) --不顯示
			SetModeEx( Hole   , EM_SetModeType_Fight , false )--可砍殺攻擊
			AddToPartition( Hole , 0)   
			BeginPlot (Hole , "Lua_Dan_112563_Hole_Delete", 10) 

			sleep(10)
			DelObj(OwnerID())   
		else --10%

		ScriptMessage( OwnerID() , 0 , 1 , "|cffff00ff" .."[SC_DAN_SR_111700_9]".. "|r" , 0 ) --嘿嘿!挖到一顆[101488]囉!
		ScriptMessage( OwnerID() , 0 , 0 , "|cffff00ff" .."[SC_DAN_SR_111700_9]".. "|r" , 0 ) --嘿嘿!挖到一顆[101488]囉!
		CancelBuff( TargetID() , 503141)
		
		sleep(5)
	
		AddBuff( TargetID(),  503141, 1, 10)
		sleep(20)

		local Bomb = LuaFunc_CreateObjByObj ( 101488 , OwnerID() ) --大炸彈
		
		SetFightMode(  Bomb , 0, 0, 0, 0 )

		WriteRoleValue( Bomb , EM_RoleValue_PID , cLV  )    --炸彈等級
		BeginPlot( Bomb , "Lua_Dan_112563_003_b" , 0 )        --由NPC執行

			Hole = LuaFunc_CreateObjByObj ( 112579 , OwnerID() )   --洞  
			    
			SetModeEx( Hole   , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( Hole   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( Hole   , EM_SetModeType_Obstruct, false )--阻擋
			SetModeEx( Hole   , EM_SetModeType_Mark, false )--標記
			SetModeEx( Hole   , EM_SetModeType_Move, false )--移動
			SetModeEx( Hole   , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( Hole   , EM_SetModeType_HideName, false )--名稱
			SetModeEx( Hole  , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( Hole   , EM_SetModeType_Show , true ) --不顯示
			SetModeEx( Hole   , EM_SetModeType_Fight , false )--可砍殺攻擊
			AddToPartition( Hole , 0)   
			BeginPlot (Hole , "Lua_Dan_112563_Hole_Delete", 10) 

			sleep(10)
			DelObj(OwnerID())   
	end



end

function Lua_Dan_112563_003_s()   

			local PowerLV = ReadRoleValue( OwnerID() , EM_RoleValue_PID  )  
			--DelObj(OwnerID())
			sleep(25)
			CastSpelllv( OwnerID(), OwnerID(), 492453, PowerLV) 
			sleep(10)
			AddBuff(OwnerID(), 503147 , 1 , 1 )
			Delobj(OwnerID())
			--Delobj(OwnerID())
			
			

end

function Lua_Dan_112563_003_m()   

			local PowerLV = ReadRoleValue( OwnerID() , EM_RoleValue_PID  )  
			--DelObj(OwnerID())
			sleep(25)
			CastSpelllv( OwnerID(), OwnerID(), 492453, PowerLV) 
			sleep(10)
			AddBuff(OwnerID(), 503147 , 1 , 1 )
			--Delobj(OwnerID())
			
			
			Delobj(OwnerID())    

end

function Lua_Dan_112563_003_b()   

			local PowerLV = ReadRoleValue( OwnerID() , EM_RoleValue_PID  )  
			--DelObj(OwnerID()) --
			sleep(25)
			CastSpelllv( OwnerID(), OwnerID(), 492453, PowerLV) 
			sleep(10)
			AddBuff(OwnerID(), 503147 , 1 , 1 )
			--Delobj(OwnerID())
			--sleep(20)
			Delobj(OwnerID())
		

end


----------------------------------------------------------------------------------------------------------------

function Lua_Dan_112563_Nothing()
			ScriptMessage( OwnerID() , 0 , 1 , "[SC_DAN_SR_111700_17]" , C_SYSTEM ) --原來什麼都沒有呢~
			sleep(10)
			CancelBuff( TargetID() , 503141) --驚訝
			sleep(5)
			AddBuff( TargetID(),  503141, 1, 10) --驚訝
			Hole = LuaFunc_CreateObjByObj ( 112579 , OwnerID() )   --洞   
			SetModeEx( Hole   , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( Hole   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( Hole   , EM_SetModeType_Obstruct, false )--阻擋
			SetModeEx( Hole   , EM_SetModeType_Mark, false )--標記
			SetModeEx( Hole   , EM_SetModeType_Move, false )--移動
			SetModeEx( Hole   , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( Hole   , EM_SetModeType_HideName, false )--名稱
			SetModeEx( Hole  , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( Hole   , EM_SetModeType_Show , true ) --不顯示
			SetModeEx( Hole   , EM_SetModeType_Fight , false )--可砍殺攻擊
			AddToPartition( Hole , 0)        
			BeginPlot (Hole , "Lua_Dan_112563_Hole_Delete", 10) 
			sleep(10)
			DelObj(OwnerID())   
end

----------------------------------------------------------------------------------------------------------------
function Lua_Dan_112563_Hole_Delete()

	 
	 sleep(400)
         DelObj( OwnerID())	 

end 

----------------------------------------------------------------------------------------------------------------
function Lua_Dan_112563_Monster_Delete()

sleep(600)
 DelObj( OwnerID())	 

end
--陣型產生範例
function LuaYuyu_flowerV_matrix2()

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local Array = {111815,111815,111815,111815,111815,111815,111815,0,111815}
	local Davis = Lua_MadeByRectangleX(  Array , 9 , 9 , 9 , 1)  --Wnm需為1.3.5....Lnm需為正整數,Wdis為橫向間距,Ldis為前後間距 (指定陣列內容)

	for i=1 , table.getn(Davis) do	
		AddToPartition( Davis[i] , RoomID )  
		SetModeEx( Davis[i]    , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( Davis[i]    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( Davis[i]    , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( Davis[i]    , EM_SetModeType_Mark, true )--標記
		SetModeEx( Davis[i]    , EM_SetModeType_Move, false )--移動
		SetModeEx( Davis[i]    , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( Davis[i]    , EM_SetModeType_HideName, false )--名稱
		SetModeEx( Davis[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( Davis[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( Davis[i]   , EM_SetModeType_Gravity, false )--重力
--		SetModeEx( Davis[i]   , EM_SetModeType_Show , false ) --不顯示
		AddBuff( Davis[i] ,505762 ,100 ,-1 ); --防紅人砍殺
		SetCursorType( Davis[i] , eCursor_Herb ); --游標變成 採藥
		SetPlot( Davis[i]  ,"touch",  "LuaYuyu_flowerV_01" , 10 )   --花

	end

end

--以下為刪除所有培植花圃
function LuaYuyu_flowerV_00()

	local flower = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111815, 300 , 1)       --花


	for i= 0, table.getn(flower)  do
		if CheckID(flower[i]) == true then
			Delobj(flower[i])
		end
	end

end


--以下為培植玫瑰劇情
function LuaYuyu_flowerV_01()

	local flowerRED =  CountBodyItem( OwnerID() , 203204 )   --紅玫瑰種子
	local flowerBLUE =  CountBodyItem( OwnerID() , 203205 )  --藍玫瑰種子

	local Waterbattle =  CountBodyItem( OwnerID() , 203646 ) --裝滿水

	if flowerRED == 0 and flowerBLUE == 0 then

		ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_112150_YU_38]" , 1  ) --這是魔法玫瑰培植區，需要<CP>[203204]</CP>才能進行栽種喔！
		ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_112150_YU_38]"  , 0 ) --

	elseif flowerRED > 0 and Waterbattle > 0 then

		WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )   
		BeginPlot( TargetID() , "LuaYuyu_flowerV_02" , 0 )  --script轉回npc跑

	elseif flowerBLUE > 0 and Waterbattle > 0  then

		WriteRoleValue( TargetID() , EM_RoleValue_PID , 2 )   
		BeginPlot( TargetID() , "LuaYuyu_flowerV_02" , 0 )  --script轉回npc跑

	elseif flowerRED > 0 and Waterbattle == 0  then



		ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_112150_YU_11]" , 1  ) --請先將容器裝滿魔法培養液再進行栽種。
		ScriptMessage( TargetID() , OwnerID() , 0 , "|cffff00ff" .. "[SC_112150_YU_11]" .. "|r" , 0 ) --

	elseif flowerBLUE > 0 and Waterbattle == 0  then

		ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_112150_YU_11]" , 1  ) --請先將容器裝滿魔法培養液再進行栽種。
		ScriptMessage( TargetID() , OwnerID() , 0 , "|cffff00ff" .. "[SC_112150_YU_11]" .. "|r" , 0 ) --

	end

end

function LuaYuyu_flowerV_02()  --TargetID 玩家

--Say(OwnerID() , "OwnerID() , 1")--花圃
--Say(TargetID() , "TargetID() , 1")--玩家

	local flowerKIND = ReadRoleValue( OwnerID() , EM_RoleValue_PID  )  

	if BeginCastBar( TargetID(), "[SC_112150_YU_03]", 30 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	--/*開始施法，使用者,時間條上的文字,進行時間,起始動作,結束動作,中斷條件(0為移動中斷)

		while true do
		sleep( 2 )
		local CastBarStatus = CheckCastBar( TargetID() )
			if ( CastBarStatus ~= 0 ) then 
				if ( CastBarStatus > 0) then -- 成功
					result = "OKOK"
					EndCastBar( TargetID() , CastBarStatus )
					break;
				elseif ( CastBarStatus < 0 ) then -- 失敗
					result = "DAME"
					EndCastBar( TargetID() , CastBarStatus )
					break;
				end
			end
		end

		if ( result == "OKOK" ) then

			BeginPlot( TargetID() , "LuaYuyu_flowerV_New01" , 0 )  --script轉回npc跑

		end
	end
end

function LuaYuyu_flowerV_New01()  --script轉回npc跑

--Say(OwnerID() , "OwnerID() , 2")--玩家
--Say(TargetID() , "TargetID() , 2")--花圃

	BeginPlot( TargetID() , "LuaYuyu_flowerV_New02" , 0 )  --script轉回npc跑

end

function LuaYuyu_flowerV_New02()  --script轉回npc跑

	local flowerKIND = ReadRoleValue( OwnerID() , EM_RoleValue_PID  )  
--Say(OwnerID() , "OwnerID() , 3")--花圃
--Say(TargetID() , "TargetID() , 3")--玩家


			SetPlot( OwnerID(),"touch","",0 )
			DelBodyItem( TargetID() , 203646 , 1 )
			if flowerKIND == 1 then
				DelBodyItem( TargetID() , 203204 , 1 )
			elseif flowerKIND == 2 then
				DelBodyItem( TargetID() , 203205 , 1 )
			end
			GiveBodyItem( TargetID() , 203647  , 1 ) --沒有水的容器
			sleep(10)

	--開始階段   玫瑰花種子

			local flower = LuaFunc_CreateObjByObj ( 112175 , OwnerID() ) --魔法種子
			local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
			local X = ReadRoleValue( OwnerID() ,EM_RoleValue_X) 
			local Y = ReadRoleValue( OwnerID() ,EM_RoleValue_Y) 
			local Z = ReadRoleValue( OwnerID() ,EM_RoleValue_Z) 	


			SetModeEx( flower  , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( flower  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( flower , EM_SetModeType_Obstruct, false )--阻擋
			SetModeEx( flower  , EM_SetModeType_Mark, false )--標記
			SetModeEx( flower   , EM_SetModeType_Move, false )--移動
			SetModeEx( flower  , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( flower   , EM_SetModeType_HideName, false )--名稱
			SetModeEx( flower , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( flower , EM_SetModeType_Fight , true )--可砍殺攻擊

			SetModeEx( OwnerID()  , EM_SetModeType_Mark, false )--標記
			SetModeEx( OwnerID()  , EM_SetModeType_HideName, true )--名稱

			WriteRoleValue( OwnerID() , EM_RoleValue_PID , flowerKIND )   

			AddToPartition( flower, RoomID) 
			AddBuff( flower ,505762 ,100 ,-1 ); --防紅人砍殺

			WriteRoleValue( flower , EM_RoleValue_PID , OwnerID() )   
			WriteRoleValue( flower , EM_RoleValue_Register , TargetID() )   

			SetPlot( flower  ,"dead",  "LuaYuyu_flowerV_06" , 10 )   --花死重來--**
			sleep(10)
			ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_112150_YU_12]" , C_SYSTEM  ) --你將魔法玫瑰種子栽種至栽培區，並仔細的噴灑魔法培養液。
			ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_112150_YU_12]" , 0 ) --
			sleep(10)
			CastSpelllv( flower , flower , 492459 , 1)	--澆花
			sleep(10)
			ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_112150_YU_13]" , C_SYSTEM  ) --魔法玫瑰種子已經發芽。
			ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_112150_YU_13]" , 0 ) --

			SetPlot( flower  ,"touch",  "LuaYuyu_flowerV_03" , 30 )   --花--**可補充水份
			sleep(50)
			BeginPlot( flower , "LuaYuyu_flowerV_05" , 0 )  --開始偵測buff狀態--**

			sleep(30)
			
			local flowerHP =  ReadRoleValue( flower , EM_RoleValue_HP  )  

	--第一階段   玫瑰花葉

			local flower2 = LuaFunc_CreateObjByObj ( 112176 , OwnerID() ) --玫瑰花葉
			local flowerX2 = LuaFunc_CreateObjByObj ( 112176 , OwnerID() ) --玫瑰花葉
			local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 	


			SetModeEx( flower2  , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( flower2  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( flower2 , EM_SetModeType_Obstruct, false )--阻擋
			SetModeEx( flower2  , EM_SetModeType_Mark, false )--標記
			SetModeEx( flower2   , EM_SetModeType_Move, false )--移動
			SetModeEx( flower2  , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( flower2   , EM_SetModeType_HideName, false )--名稱
			SetModeEx( flower2 , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( flower2 , EM_SetModeType_Fight , true )--可砍殺攻擊

			Hide(flower2)
			Show(  flower2 ,RoomID)

			SetModeEx( flowerX2  , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( flowerX2  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( flowerX2 , EM_SetModeType_Obstruct, false )--阻擋
			SetModeEx( flowerX2  , EM_SetModeType_Mark, true )--標記
			SetModeEx( flowerX2   , EM_SetModeType_Move, false )--移動
			SetModeEx( flowerX2  , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( flowerX2   , EM_SetModeType_HideName, false )--名稱
			SetModeEx( flowerX2 , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( flowerX2 , EM_SetModeType_Fight , false )--可砍殺攻擊
		--	SetModeEx( flowerX2   , EM_SetModeType_Show , false ) --不顯示

			Hide(flowerX2)
			Show(  flowerX2 ,RoomID)

			WriteRoleValue( flower2 , EM_RoleValue_HP , flowerHP )   
			AddToPartition( flower2, RoomID) 
			AddBuff( flower2 ,505762 ,100 ,-1 ); --防紅人砍殺
			AddToPartition( flowerX2, RoomID) 
			WriteRoleValue( flowerX2 , EM_RoleValue_PID , flower2 )   
			AddBuff( flowerX2 ,505762 ,100 ,-1 ); --防紅人砍殺
			SetModeEx( OwnerID()  , EM_SetModeType_Show , false ) --不顯示

			ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_112150_YU_19]" , C_SYSTEM  ) --魔法玫瑰種子已開枝散葉。
			ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_112150_YU_19]" , 0 ) --
			AddBuff( flower2 ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
			AddBuff( flower2 ,502706 ,1 ,-1 ); --不可補血
			sleep(10)


			WriteRoleValue( flower2 , EM_RoleValue_HP , flowerHP )   
			WriteRoleValue( flower2 , EM_RoleValue_PID , OwnerID() )   --花圃
			WriteRoleValue( flowerX2 , EM_RoleValue_Register , TargetID() )   --玩家
			WriteRoleValue( flower2 , EM_RoleValue_Register+1 , flowerX2 )   --可澆的花

			if CheckBuff( flower , 502697 ) == true then    
				AddBuff( flowerX2 ,502697 ,1 ,-1 ); --澆花buff               
				Delobj( flower )          
			else
				Delobj( flower )     
			end  
			sleep(10)   
--			WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 1 )   --階段判斷生什麼蟲--*

			SetPlot( flower2  ,"dead",  "LuaYuyu_flowerV_06" , 10 )   --花死重來--**
			SetPlot( flowerX2  ,"touch",  "LuaYuyu_flowerV_03" , 30 )   --花--**可補充水份
			sleep(10)
			BeginPlot( flowerX2 , "LuaYuyu_flowerV_05" , 0 )  --開始偵測buff狀態--**
			sleep(30)
--			BeginPlot( flower2 , "LuaYuyu_Mflower_01" , 0 )  --開始放怪--**

	

			--怪物生
						
						X1 = X - 6
						Z1 = Z + 13

						local Ma = CreateObj( 101557 , X1 , Y , Z1 , 0 , 1 ) 

						AdjustFaceDir(Ma, OwnerID() , 0 ) --面向

						AddToPartition( Ma, 0) 

						sleep(10)
						SetAttack( Ma , flower2  )

						ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_112150_YU_36]" , 1  ) --注意！害蟲正在啃食魔法玫瑰！
						ScriptMessage( OwnerID() , TargetID() , 0 , "|cffff00ff" .. "[SC_112150_YU_36]" .. "|r" , 0 ) --

						WriteRoleValue( OwnerID() , EM_RoleValue_Register+3 , Ma )   --蟲--*


			sleep(300)

			local flowerHP =  ReadRoleValue( flower2 , EM_RoleValue_HP  )  
			sleep(10)
	

	--第二階段   玫瑰花苞
			if CheckID( flower2 ) == true then
				local flower3 = LuaFunc_CreateObjByObj ( 112178 , OwnerID() ) --玫瑰花苞
				local flowerX3 = LuaFunc_CreateObjByObj ( 112178 , OwnerID() ) --玫瑰花苞
				local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 	

				SetModeEx( flower3  , EM_SetModeType_Strikback, false )--反擊
				SetModeEx( flower3  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
				SetModeEx( flower3 , EM_SetModeType_Obstruct, false )--阻擋
				SetModeEx( flower3  , EM_SetModeType_Mark, false )--標記
				SetModeEx( flower3   , EM_SetModeType_Move, false )--移動
				SetModeEx( flower3  , EM_SetModeType_Searchenemy, false )--索敵
				SetModeEx( flower3   , EM_SetModeType_HideName, false )--名稱
				SetModeEx( flower3 , EM_SetModeType_ShowRoleHead, false )--頭像框
				SetModeEx( flower3 , EM_SetModeType_Fight , true )--可砍殺攻擊

				Hide(flower3)
				Show(  flower3 ,RoomID)
				WriteRoleValue( flower3 , EM_RoleValue_HP , flowerHP )   


				SetModeEx( flowerX3  , EM_SetModeType_Strikback, false )--反擊
				SetModeEx( flowerX3  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
				SetModeEx( flowerX3 , EM_SetModeType_Obstruct, false )--阻擋
				SetModeEx( flowerX3  , EM_SetModeType_Mark, true )--標記
				SetModeEx( flowerX3   , EM_SetModeType_Move, false )--移動
				SetModeEx( flowerX3  , EM_SetModeType_Searchenemy, false )--索敵
				SetModeEx( flowerX3   , EM_SetModeType_HideName, false )--名稱
				SetModeEx( flowerX3 , EM_SetModeType_ShowRoleHead, false )--頭像框
				SetModeEx( flowerX3 , EM_SetModeType_Fight , true )--可砍殺攻擊
		--		SetModeEx( flowerX3   , EM_SetModeType_Show , false ) --不顯示

				Hide(flowerX3)
				Show(  flowerX3 ,RoomID)



				if CheckBuff( flowerX2 , 502697 ) == true then    
					AddBuff( flowerX3 ,502697 ,1 ,-1 ); --澆花buff    
					sleep(10)


					if CheckBuff( flower2 , 502705 ) == true then     --枯萎
						AddBuff( flower3 ,502705 ,1 ,-1 ); --枯萎buff    			          
						Delobj( flower2 )    
						Delobj( flowerX2 )    

					else
						Delobj( flower2 ) 
						Delobj( flowerX2 )    

					end
	  
				else

					Delobj( flower2 )  
					Delobj( flowerX2 )      

				end    
				sleep(10)   
				AddToPartition( flower3, RoomID) 
				AddToPartition( flowerX3, RoomID) 	
				WriteRoleValue( flowerX3 , EM_RoleValue_PID , flower3 )   
				AddBuff( flower3 ,505762 ,100 ,-1 ); --防紅人砍殺
				AddBuff( flowerX3 ,505762 ,100 ,-1 ); --防紅人砍殺

				if CheckID( Ma ) == true then
					SetAttack( Ma , flower3  )
				end

				sleep(10)
				AddBuff( flower3 ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
				AddBuff( flower3 ,502706 ,1 ,-1 ); --不可補血
				ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_112150_YU_20]" , C_SYSTEM  ) --魔法玫瑰已含苞待放。
				ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_112150_YU_20]" , 0 ) --
				sleep(50)
				WriteRoleValue( flower3 , EM_RoleValue_HP , flowerHP )   
				WriteRoleValue( flower3 , EM_RoleValue_PID , OwnerID() )   --花圃
				WriteRoleValue( flowerX3 , EM_RoleValue_Register , TargetID() )   --玩家
				WriteRoleValue( flower3 , EM_RoleValue_Register+1 , flowerX3 )   --可澆的花

				SetPlot( flower3  ,"dead",  "LuaYuyu_flowerV_06" , 10 )   --花死重來--**
				SetPlot( flowerX3  ,"touch",  "LuaYuyu_flowerV_03" , 30 )   --花--**可補充水份
				sleep(50)
				BeginPlot( flowerX3 , "LuaYuyu_flowerV_05" , 0 )  --開始偵測buff狀態--**
				sleep(30)

				--怪物生2

						X1 = X - 6
						X2 = X - 1
						Z1 = Z + 13
						Z2 = Z - 18

						local Mb = CreateObj( 101559 , X1 , Y , Z1 , 0 , 1 ) 
						local Mc = CreateObj( 101559 , X2 , Y , Z2 , 0 , 1 ) 

						AdjustFaceDir(Mb, OwnerID() , 0 ) --面向
						AdjustFaceDir(Mc, OwnerID() , 0 ) --面向

						AddToPartition( Mb, 0) 
						AddToPartition( Mc, 0) 

						sleep(10)



						SetAttack( Mb , flower3  )
						SetAttack( Mc , flower3  )

						ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_112150_YU_36]" , 1  ) --注意！害蟲正在啃食魔法玫瑰！
						ScriptMessage( OwnerID() , TargetID() , 0 , "|cffff00ff" .. "[SC_112150_YU_36]" .. "|r" , 0 ) --

						WriteRoleValue(  OwnerID() , EM_RoleValue_Register+4 , Mb )   --階段判斷生什麼蟲--*
						WriteRoleValue(  OwnerID() , EM_RoleValue_Register+5 , Mc )   --階段判斷生什麼蟲--*



				sleep(300)

				--怪物生3
						X1 = X - 6
						X2 = X - 6
						Z1 = Z + 13
						Z2 = Z - 16

						local Md = CreateObj( 101557 , X1 , Y , Z1 , 0 , 1 ) 
						local Me = CreateObj( 101558 , X2 , Y , Z2 , 0 , 1 ) 

						AdjustFaceDir(Md, OwnerID() , 0 ) --面向
						AdjustFaceDir(Me, OwnerID() , 0 ) --面向

						AddToPartition( Md, 0) 
						AddToPartition( Me, 0) 
						sleep(10)

						if CheckID( Ma ) == true then
							SetAttack( Ma , flower3  )
						end
						if CheckID( Mb ) == true then
							SetAttack( Mb , flower3  )
						end
						if CheckID( Mc ) == true then
							SetAttack( Mc , flower3  )
						end


						SetAttack( Md , flower3  )
						SetAttack( Me , flower3  )

						ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_112150_YU_36]" , 1  ) --注意！害蟲正在啃食魔法玫瑰！
						ScriptMessage( OwnerID() , TargetID() , 0 , "|cffff00ff" .. "[SC_112150_YU_36]" .. "|r" , 0 ) --

						WriteRoleValue(  OwnerID() , EM_RoleValue_Register+6 , Md )   --階段判斷生什麼蟲--*
						WriteRoleValue(  OwnerID() , EM_RoleValue_Register+7 , Me )   --階段判斷生什麼蟲--*



				sleep(300)
				local flowerHP =  ReadRoleValue( flower3 , EM_RoleValue_HP  )  
				sleep(10)


	--第三階段   開花

				local flowerKIND = ReadRoleValue( OwnerID() ,EM_RoleValue_PID)  --紅花系列 = 1  藍花系列 = 2   
				local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
				local MaxHP =  ReadRoleValue( flower3 , EM_RoleValue_MaxHP  )  
				local Hprate =  flowerHP/MaxHP
				local flowerwhat = 0


				local Waterbattle =  CountBodyItem( TargetID() , 203646 ) --裝滿水
				local battle =  CountBodyItem( TargetID() , 203647 ) --空瓶

				if  Waterbattle > 0 then  --沒有水份的狀態
					DelBodyItem( TargetID() , 203646 , 1 )
				elseif battle > 0 then
					DelBodyItem( TargetID() , 203647 , 1 )
				end

				if CheckID( flower3 ) == true then

					if Hprate >= 0.9 then
						if flowerKIND == 1 then
							flowerwhat = 112179 --花神出來了
						elseif flowerKIND == 2 then
							flowerwhat = 112180 --花神出來了
						end

						ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_112150_YU_21]" , C_SYSTEM  ) --由於您細心的呵護使得魔法玫瑰燦爛的綻放，花仙子感受到您的用心將祝福贈予給您！
						ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_112150_YU_21]" , 0 ) --

						GiveBodyItem( TargetID() , 203648  , 5 ) 

					elseif Hprate > 0.7 and Hprate < 0.9 then
						if flowerKIND == 1 then
							flowerwhat = 112181 
						elseif flowerKIND == 2 then
							flowerwhat = 112182 
						end

						ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_112150_YU_22]" , C_SYSTEM  )  --由於您細心的呵護使得魔法玫瑰燦爛的綻放，將魔法玫瑰的愛情展示給你所愛的人吧！
						ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_112150_YU_22]" , 0 ) --

						GiveBodyItem( TargetID() , 203648  , 3 ) 

					elseif Hprate > 0.4 and Hprate < 0.7 then

						local G = 100
						local YY = Rand( G )   
						if YY >= 67 then
							if flowerKIND == 1 then
								flowerwhat = 112183 
							elseif flowerKIND == 2 then
								flowerwhat = 112172
							end
						elseif YY >= 34 and YY < 67 then
							if flowerKIND == 1 then
								flowerwhat = 112184
							elseif flowerKIND == 2 then
								flowerwhat = 112173
							end
						else
							if flowerKIND == 1 then
								flowerwhat = 112185
							elseif flowerKIND == 2 then
								flowerwhat = 112174
							end
						end

						ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_112150_YU_22]" , C_SYSTEM  )  --由於您細心的呵護使得魔法玫瑰燦爛的綻放，將魔法玫瑰的愛情展示給你所愛的人吧！
						ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_112150_YU_22]" , 0 ) --

						GiveBodyItem( TargetID() , 203648  , 2 ) 

					else
						if flowerKIND == 1 then
							flowerwhat = 112186
						elseif flowerKIND == 2 then
							flowerwhat = 112171
						end

						ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_112150_YU_23]" , C_SYSTEM  )  --魔法玫瑰雖然受到摧殘，依然燦爛的綻放，將魔法玫瑰的愛情展示給你所愛的人吧！
						ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_112150_YU_23]" , 0 ) --


						GiveBodyItem( TargetID() , 203648  , 1 ) 
					end




					local flower4 = LuaFunc_CreateObjByObj ( flowerwhat , OwnerID() ) --玫瑰花葉
					local FG = LuaFunc_CreateObjByObj ( 101275 , OwnerID() ) --花神	
				
					if flowerwhat == 112179 or flowerwhat == 112180 then

						SetFightMode(  FG , 0, 0, 0, 0 )
						AddToPartition( FG, RoomID) 
					--	CastSpelllv( TargetID() , FG , 492469 , 0) --花神的祝福
						CastSpelllv( FG , TargetID() , 492469 , 0) --花神的祝福

					else
						Delobj( FG )     
					end
				
					SetModeEx( flower4  , EM_SetModeType_Strikback, false )--反擊
					SetModeEx( flower4  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
					SetModeEx( flower4 , EM_SetModeType_Obstruct, false )--阻擋
					SetModeEx( flower4  , EM_SetModeType_Mark, true )--標記
					SetModeEx( flower4   , EM_SetModeType_Move, false )--移動
					SetModeEx( flower4  , EM_SetModeType_Searchenemy, false )--索敵
					SetModeEx( flower4   , EM_SetModeType_HideName, false )--名稱
					SetModeEx( flower4 , EM_SetModeType_ShowRoleHead, true )--頭像框
					SetModeEx( flower4 , EM_SetModeType_Fight , true )--可砍殺攻擊
					sleep(10)
					Hide(flower4)
					Show(  flower4 ,RoomID)
					WriteRoleValue( flower4 , EM_RoleValue_HP , flowerHP )   


					Delobj( flower3 )     
					Delobj( flowerX3 )     


					AddToPartition( flower4, RoomID) 
					AddBuff( flower4 ,505762 ,100 ,-1 ); --防紅人砍殺
					sleep(10)


					AddBuff( flower4 ,502706 ,1 ,-1 ); --不可補血
					WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 , flower4 )   --階段花的id-* 

			
					if CheckID( Ma ) == true then
						Delobj( Ma)
					end
					if CheckID( Mb ) == true then
						Delobj( Mb)
					end
					if CheckID( Mc ) == true then
						Delobj( Mc)
					end
					if CheckID( Md ) == true then
						Delobj( Md)
					end
					if CheckID( Me ) == true then
						Delobj( Me)
					end


					AddRoleValue( TargetID() , EM_LuaValueFlag_UseItem1 , 1 )   --記錄使用次數
					AddRoleValue( TargetID() , EM_LuaValueFlag_UseItem2 , 1 )   
		
					SetPlot( flower4 ,"touch","",0 )
					WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 4 )   --階段判斷生什麼蟲--*
					sleep(10)
					--BeginPlot( flower4 , "LuaYuyu_Mflower_01" , 0 )  --開始放怪--**


					AddBuff( flower4 ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
					WriteRoleValue( flower4 , EM_RoleValue_HP , flowerHP )   
					WriteRoleValue( flower4 , EM_RoleValue_PID , OwnerID() )   --花圃
					WriteRoleValue( flower4 , EM_RoleValue_Register , TargetID() )   --玩家


					sleep(600)

					if CheckID(FG) == true then
						Delobj( FG )     
					end

					sleep(4800)

					BeginPlot( flower4 , "LuaYuyu_flowerV_07" , 0 )  --重新開始

				end		
			end
end


function LuaYuyu_flowerV_03()   --玩家OwnerID

	local flower = ReadRoleValue( TargetID() , EM_RoleValue_PID )  --任務花
	local Waterbattle =  CountBodyItem( OwnerID() , 203646 ) --裝滿水


	if  Waterbattle > 0 and CheckBuff( TargetID() , 502697 ) == false then  --沒有水份的狀態
		DelBodyItem( OwnerID() , 203646 , 1 )
		GiveBodyItem( OwnerID() , 203647  , 1 ) 

		AddBuff( TargetID() ,502697 ,1 ,-1 ); --澆花buff    
		AddBuff( flower ,502697 ,1 ,-1 ); --澆花buff    

	elseif Waterbattle == 0  then

		ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_112150_YU_14]" , 1  ) --請先將容器裝滿魔法培養液再進行灌溉。
		ScriptMessage( TargetID() , OwnerID() , 0 , "|cffff00ff" .. "[SC_112150_YU_14]" .. "|r" , 0 ) --


	elseif CheckBuff( TargetID() , 502697 ) == true  then

		ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_112150_YU_15]" , C_SYSTEM  ) --目前水份飽滿。
		ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_112150_YU_15]" , 0 ) --

	end

end




function LuaYuyu_flowerV_05()  --枯萎  可澆的花OwnerID

	local flower = ReadRoleValue( OwnerID() , EM_RoleValue_PID )  --任務花
	local PlayerID = ReadRoleValue( OwnerID() , EM_RoleValue_Register )  --玩家

	while true do
	sleep(10)

		if CheckBuff( flower , 502705 ) == true and CheckBuff( OwnerID() , 502697 ) == true then     --凋零的buff

			CancelBuff( flower , 502705 )

		end

		if CheckBuff( OwnerID() , 502697 ) == false then     --水份的buff

			ScriptMessage( OwnerID() , PlayerID , 1 , "[SC_112150_YU_16]" , 1  ) --請注意水份的補充。
			ScriptMessage( OwnerID() , PlayerID , 0 , "|cffff00ff" .. "[SC_112150_YU_16]" .. "|r" , 0 ) --
			sleep(100)

			if CheckBuff( OwnerID() , 502697 ) == false then     --水份的buff		
				ScriptMessage( OwnerID() , PlayerID , 1 , "[SC_112150_YU_17]" , 1  ) --魔法植物開始枯萎，請注意補充水份。
				ScriptMessage( OwnerID() , PlayerID , 0 , "|cffff00ff" .. "[SC_112150_YU_17]" .. "|r" , 0 ) --

				AddBuff( flower ,502705 ,1 ,-1 ); --凋零的buff        
	  
			end
		

		end



	end
end


function LuaYuyu_flowerV_06() --花死枯萎

		local flower = LuaFunc_CreateObjByObj ( 112177 , OwnerID() ) --枯萎的花
		local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
		local land = ReadRoleValue( OwnerID() , EM_RoleValue_PID  )  --花圃
		local PlayerID = ReadRoleValue( OwnerID() , EM_RoleValue_Register )  --玩家	
		local flowerX = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 )  --可澆的花	
		SetFightMode(  flower , 0, 0, 0, 0 )

		SetModeEx( flower  , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( flower  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( flower , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( flower  , EM_SetModeType_Mark, true )--標記
		SetModeEx( flower   , EM_SetModeType_Move, false )--移動
		SetModeEx( flower  , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( flower   , EM_SetModeType_HideName, false )--名稱
		SetModeEx( flower , EM_SetModeType_ShowRoleHead, true )--頭像框
		SetModeEx( flower , EM_SetModeType_Fight , false )--可砍殺攻擊


		Hide(flower)
		Show(  flower ,RoomID)

		AddToPartition( flower, RoomID) 
		AddBuff( flower ,505762 ,100 ,-1 ); --防紅人砍殺
		WriteRoleValue( land , EM_RoleValue_Register+1 , 4 )   --階段判斷生什麼蟲--*


--殺怪物
			local Ma = ReadRoleValue( land , EM_RoleValue_Register+3 )  
			local Mb = ReadRoleValue( land , EM_RoleValue_Register+4 )  
			local Mc = ReadRoleValue( land , EM_RoleValue_Register+5 ) 
			local Md = ReadRoleValue( land , EM_RoleValue_Register+6 ) 
			local Me = ReadRoleValue( land , EM_RoleValue_Register+7 )  

			if CheckID( Ma ) == true then
				Delobj( Ma)
			end
			if CheckID( Mb ) == true then
				Delobj( Mb)
			end
			if CheckID( Mc ) == true then
				Delobj( Mc)
			end
			if CheckID( Md )  == true then
				Delobj( Md)
			end
			if CheckID( Me )  == true then
				Delobj( Me)
			end

		ScriptMessage( OwnerID() , PlayerID , 1 , "[SC_112150_YU_18]" , 1  ) --魔法植物已經枯萎。
		ScriptMessage( OwnerID() , PlayerID , 0 , "|cffff00ff" .. "[SC_112150_YU_18]" .. "|r" , 0 ) --


		WriteRoleValue( flower , EM_RoleValue_PID , land )   
		WriteRoleValue( flower , EM_RoleValue_Register , PlayerID )   

		BeginPlot( flower , "LuaYuyu_flowerV_07" , 0 )  --script轉回npc跑
		Delobj( flowerX )
		Delobj( OwnerID() )

end

function LuaYuyu_flowerV_07() --花死重啟
		sleep(30)
		local land = ReadRoleValue( OwnerID() , EM_RoleValue_PID  )  

		SetModeEx( land  , EM_SetModeType_Mark, true )--標記
		SetModeEx( land   , EM_SetModeType_HideName, false )--名稱
		SetModeEx( land   , EM_SetModeType_Show , true ) --不顯示

		WriteRoleValue( land , EM_RoleValue_Register+1 , 4 )   --階段判斷生什麼蟲--*

		SetCursorType( land , eCursor_Herb ); --游標變成 採藥
		SetPlot( land  ,"touch",  "LuaYuyu_flowerV_01" , 10 )   --花
		Delobj( OwnerID() )

end
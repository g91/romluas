function LuaI_101024_0()    

	local Minotaur = LuaFunc_SearchNPCbyOrgID(OwnerID() , 101024, 200 , 1)             --戰牛祭司
	local Golu = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101028 , 200 , 1)             --隱藏劇情怪
 	local M ={}
		if Minotaur[0] == -1 or  Minotaur[0] == nil  then                                         --如果戰牛祭司不存在就產生

				M[0] = ReadRoleValue(  Golu[0]   , EM_RoleValue_Register+1 ) 
				M[1] = ReadRoleValue(  Golu[0]   , EM_RoleValue_Register+2 ) 
				M[2] = ReadRoleValue(  Golu[0]   , EM_RoleValue_Register+3 ) 
				M[3] = ReadRoleValue(  Golu[0]   , EM_RoleValue_Register+4 ) 
				M[4] = ReadRoleValue(  Golu[0]   , EM_RoleValue_Register+5 ) 
				M[5] = ReadRoleValue(  Golu[0]   , EM_RoleValue_Register+6 ) 

				sleep(10)

				
				for i = 0 , 5 do

					


					SetModeEx( M[i]  , EM_SetModeType_Strikback, false )--反擊
					SetModeEx( M[i]  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
					SetModeEx( M[i]  , EM_SetModeType_Mark, false )--標記
					SetModeEx( M[i]  , EM_SetModeType_Move, false )--移動
					SetModeEx( M[i]  , EM_SetModeType_Searchenemy, false )--索敵
					SetModeEx( M[i]  , EM_SetModeType_HideName, true )--名稱
					SetModeEx( M[i]  , EM_SetModeType_ShowRoleHead, false )--頭像框
					SetModeEx( M[i]  , EM_SetModeType_Fight , false )--可砍殺攻擊
					SetModeEx( M[i]  , EM_SetModeType_Show , true ) --不顯示

					Hide(M[i] )
					Show(  M[i] , 0)

					BeginPlot( M[i] , "LuaP_Dead" , 0 )   
				end


		else
				WriteRoleValue(  Golu[0]   ,EM_RoleValue_Register+1 ,Minotaur[0] )
				WriteRoleValue(  Golu[0]   ,EM_RoleValue_Register+2 ,Minotaur[1] )
				WriteRoleValue(  Golu[0]   ,EM_RoleValue_Register+3 ,Minotaur[2] )
				WriteRoleValue(  Golu[0]   ,EM_RoleValue_Register+4 ,Minotaur[3] )
				WriteRoleValue(  Golu[0]   ,EM_RoleValue_Register+5 ,Minotaur[4] )
				WriteRoleValue(  Golu[0]   ,EM_RoleValue_Register+6 ,Minotaur[5] )

				M[0] = ReadRoleValue(  Golu[0]   , EM_RoleValue_Register+1 ) 
				M[1] = ReadRoleValue(  Golu[0]   , EM_RoleValue_Register+2 ) 
				M[2] = ReadRoleValue(  Golu[0]   , EM_RoleValue_Register+3 ) 
				M[3] = ReadRoleValue(  Golu[0]   , EM_RoleValue_Register+4 ) 
				M[4] = ReadRoleValue(  Golu[0]   , EM_RoleValue_Register+5 ) 
				M[5] = ReadRoleValue(  Golu[0]   , EM_RoleValue_Register+6 ) 

				sleep(10)
	
				for i = 0 , 5 do

					SetModeEx( M[i]  , EM_SetModeType_Strikback, false )--反擊
					SetModeEx( M[i]  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
					SetModeEx( M[i]  , EM_SetModeType_Mark, false )--標記
					SetModeEx( M[i]  , EM_SetModeType_Move, false )--移動
					SetModeEx( M[i]  , EM_SetModeType_Searchenemy, false )--索敵
					SetModeEx( M[i]  , EM_SetModeType_HideName, true )--名稱
					SetModeEx( M[i]  , EM_SetModeType_ShowRoleHead, false )--頭像框
					SetModeEx( M[i]  , EM_SetModeType_Fight , false )--可砍殺攻擊
					SetModeEx( M[i]  , EM_SetModeType_Show , false ) --不顯示

					Hide(M[i] )
					Show(  M[i] , 0)

					BeginPlot( M[i] , "LuaP_Dead" , 0 )   
				end
		end



end



function LuaI_101024_1()    --不顯示

 		local M ={}

				M[0] = ReadRoleValue(  OwnerID()   , EM_RoleValue_Register+1 ) 
				M[1] = ReadRoleValue(  OwnerID()   , EM_RoleValue_Register+2 ) 
				M[2] = ReadRoleValue(  OwnerID()   , EM_RoleValue_Register+3 ) 
				M[3] = ReadRoleValue(  OwnerID()   , EM_RoleValue_Register+4 ) 
				M[4] = ReadRoleValue(  OwnerID()   , EM_RoleValue_Register+5 ) 
				M[5] = ReadRoleValue(  OwnerID()   , EM_RoleValue_Register+6 ) 


				
				sleep(50)

				for i = 0 , 5 do
			
					SetModeEx( M[i]  , EM_SetModeType_Strikback, false )--反擊
					SetModeEx( M[i]  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
					SetModeEx( M[i]  , EM_SetModeType_Mark, false )--標記
					SetModeEx( M[i]  , EM_SetModeType_Move, false )--移動
					SetModeEx( M[i]  , EM_SetModeType_Searchenemy, false )--索敵
					SetModeEx( M[i]  , EM_SetModeType_HideName, true )--名稱
					SetModeEx( M[i]  , EM_SetModeType_ShowRoleHead, false )--頭像框
					SetModeEx( M[i]  , EM_SetModeType_Fight , false )--可砍殺攻擊
					SetModeEx( M[i]  , EM_SetModeType_Show , false ) --不顯示

					Hide(M[i] )
					Show(  M[i] , 0)

				end


end

function LuaI_101024_2()    --顯示

 		local M ={}

				M[0] = ReadRoleValue(  OwnerID()   , EM_RoleValue_Register+1 ) 
				M[1] = ReadRoleValue(  OwnerID()   , EM_RoleValue_Register+2 ) 
				M[2] = ReadRoleValue(  OwnerID()   , EM_RoleValue_Register+3 ) 
				M[3] = ReadRoleValue(  OwnerID()   , EM_RoleValue_Register+4 ) 
				M[4] = ReadRoleValue(  OwnerID()   , EM_RoleValue_Register+5 ) 
				M[5] = ReadRoleValue(  OwnerID()   , EM_RoleValue_Register+6 ) 


				for i = 0 , 5 do
			
					SetModeEx( M[i]  , EM_SetModeType_Strikback, false )--反擊
					SetModeEx( M[i]  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
					SetModeEx( M[i]  , EM_SetModeType_Mark, false )--標記
					SetModeEx( M[i]  , EM_SetModeType_Move, false )--移動
					SetModeEx( M[i]  , EM_SetModeType_Searchenemy, false )--索敵
					SetModeEx( M[i]  , EM_SetModeType_HideName, true )--名稱
					SetModeEx( M[i]  , EM_SetModeType_ShowRoleHead, false )--頭像框
					SetModeEx( M[i]  , EM_SetModeType_Fight , false )--可砍殺攻擊
					SetModeEx( M[i]  , EM_SetModeType_Show , true ) --不顯示

					Hide(M[i] )
					Show(  M[i] , 0)

					BeginPlot( M[i] , "LuaP_Dead" , 0 )   

				end


end
function LuaI_101024_0()    

	local Minotaur = LuaFunc_SearchNPCbyOrgID(OwnerID() , 101024, 200 , 1)             --�Ԥ����q
	local Golu = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101028 , 200 , 1)             --���ü@����
 	local M ={}
		if Minotaur[0] == -1 or  Minotaur[0] == nil  then                                         --�p�G�Ԥ����q���s�b�N����

				M[0] = ReadRoleValue(  Golu[0]   , EM_RoleValue_Register+1 ) 
				M[1] = ReadRoleValue(  Golu[0]   , EM_RoleValue_Register+2 ) 
				M[2] = ReadRoleValue(  Golu[0]   , EM_RoleValue_Register+3 ) 
				M[3] = ReadRoleValue(  Golu[0]   , EM_RoleValue_Register+4 ) 
				M[4] = ReadRoleValue(  Golu[0]   , EM_RoleValue_Register+5 ) 
				M[5] = ReadRoleValue(  Golu[0]   , EM_RoleValue_Register+6 ) 

				sleep(10)

				
				for i = 0 , 5 do

					


					SetModeEx( M[i]  , EM_SetModeType_Strikback, false )--����
					SetModeEx( M[i]  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
					SetModeEx( M[i]  , EM_SetModeType_Mark, false )--�аO
					SetModeEx( M[i]  , EM_SetModeType_Move, false )--����
					SetModeEx( M[i]  , EM_SetModeType_Searchenemy, false )--����
					SetModeEx( M[i]  , EM_SetModeType_HideName, true )--�W��
					SetModeEx( M[i]  , EM_SetModeType_ShowRoleHead, false )--�Y����
					SetModeEx( M[i]  , EM_SetModeType_Fight , false )--�i�������
					SetModeEx( M[i]  , EM_SetModeType_Show , true ) --�����

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

					SetModeEx( M[i]  , EM_SetModeType_Strikback, false )--����
					SetModeEx( M[i]  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
					SetModeEx( M[i]  , EM_SetModeType_Mark, false )--�аO
					SetModeEx( M[i]  , EM_SetModeType_Move, false )--����
					SetModeEx( M[i]  , EM_SetModeType_Searchenemy, false )--����
					SetModeEx( M[i]  , EM_SetModeType_HideName, true )--�W��
					SetModeEx( M[i]  , EM_SetModeType_ShowRoleHead, false )--�Y����
					SetModeEx( M[i]  , EM_SetModeType_Fight , false )--�i�������
					SetModeEx( M[i]  , EM_SetModeType_Show , false ) --�����

					Hide(M[i] )
					Show(  M[i] , 0)

					BeginPlot( M[i] , "LuaP_Dead" , 0 )   
				end
		end



end



function LuaI_101024_1()    --�����

 		local M ={}

				M[0] = ReadRoleValue(  OwnerID()   , EM_RoleValue_Register+1 ) 
				M[1] = ReadRoleValue(  OwnerID()   , EM_RoleValue_Register+2 ) 
				M[2] = ReadRoleValue(  OwnerID()   , EM_RoleValue_Register+3 ) 
				M[3] = ReadRoleValue(  OwnerID()   , EM_RoleValue_Register+4 ) 
				M[4] = ReadRoleValue(  OwnerID()   , EM_RoleValue_Register+5 ) 
				M[5] = ReadRoleValue(  OwnerID()   , EM_RoleValue_Register+6 ) 


				
				sleep(50)

				for i = 0 , 5 do
			
					SetModeEx( M[i]  , EM_SetModeType_Strikback, false )--����
					SetModeEx( M[i]  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
					SetModeEx( M[i]  , EM_SetModeType_Mark, false )--�аO
					SetModeEx( M[i]  , EM_SetModeType_Move, false )--����
					SetModeEx( M[i]  , EM_SetModeType_Searchenemy, false )--����
					SetModeEx( M[i]  , EM_SetModeType_HideName, true )--�W��
					SetModeEx( M[i]  , EM_SetModeType_ShowRoleHead, false )--�Y����
					SetModeEx( M[i]  , EM_SetModeType_Fight , false )--�i�������
					SetModeEx( M[i]  , EM_SetModeType_Show , false ) --�����

					Hide(M[i] )
					Show(  M[i] , 0)

				end


end

function LuaI_101024_2()    --���

 		local M ={}

				M[0] = ReadRoleValue(  OwnerID()   , EM_RoleValue_Register+1 ) 
				M[1] = ReadRoleValue(  OwnerID()   , EM_RoleValue_Register+2 ) 
				M[2] = ReadRoleValue(  OwnerID()   , EM_RoleValue_Register+3 ) 
				M[3] = ReadRoleValue(  OwnerID()   , EM_RoleValue_Register+4 ) 
				M[4] = ReadRoleValue(  OwnerID()   , EM_RoleValue_Register+5 ) 
				M[5] = ReadRoleValue(  OwnerID()   , EM_RoleValue_Register+6 ) 


				for i = 0 , 5 do
			
					SetModeEx( M[i]  , EM_SetModeType_Strikback, false )--����
					SetModeEx( M[i]  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
					SetModeEx( M[i]  , EM_SetModeType_Mark, false )--�аO
					SetModeEx( M[i]  , EM_SetModeType_Move, false )--����
					SetModeEx( M[i]  , EM_SetModeType_Searchenemy, false )--����
					SetModeEx( M[i]  , EM_SetModeType_HideName, true )--�W��
					SetModeEx( M[i]  , EM_SetModeType_ShowRoleHead, false )--�Y����
					SetModeEx( M[i]  , EM_SetModeType_Fight , false )--�i�������
					SetModeEx( M[i]  , EM_SetModeType_Show , true ) --�����

					Hide(M[i] )
					Show(  M[i] , 0)

					BeginPlot( M[i] , "LuaP_Dead" , 0 )   

				end


end
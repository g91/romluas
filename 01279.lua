function Lua_Dan_112563_Resource()
	 
				Hole = LuaFunc_CreateObjByObj ( 112579 , OwnerID() )   --�}    
			
				SetModeEx( Hole   , EM_SetModeType_Strikback, false )--����
				SetModeEx( Hole   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
				SetModeEx( Hole   , EM_SetModeType_Obstruct, false )--����
				SetModeEx( Hole   , EM_SetModeType_Mark, false )--�аO
				SetModeEx( Hole   , EM_SetModeType_Move, false )--����
				SetModeEx( Hole   , EM_SetModeType_Searchenemy, false )--����
				SetModeEx( Hole   , EM_SetModeType_HideName, false )--�W��
				SetModeEx( Hole  , EM_SetModeType_ShowRoleHead, false )--�Y����
				SetModeEx( Hole   , EM_SetModeType_Show , true ) --�����
				SetModeEx( Hole   , EM_SetModeType_Fight , false )--�i�������
			
				AddToPartition( Hole , 0) 					                          	
				BeginPlot (Hole , "Lua_Dan_112563_Hole_Delete", 10) 
				sleep(10)
				DelObj(OwnerID())    

                   			ScriptMessage( OwnerID() , 0 , 1 , "[SC_DAN_SR_111700_11]" , C_SYSTEM ) --��ӬO�a�F������~
  				GiveBodyItem( TargetID(), 204218, 1) 
	 
end
----------------------------------------------------------------------------------------------------------------

function Lua_Dan_112563_Potion()  --20100305 �̨��ܧ� �쥻�Ĥ��O��¦�Ĥ� �ܧ󬰥������Ĥ����_��

	--Say( OwnerID(),"1" ) --Hole
	--Say( TargetID(),"2" ) --Player			
				
			
				

        		local Hole = LuaFunc_CreateObjByObj ( 112579 , OwnerID() )   --�}        
				
				ScriptMessage( OwnerID() , 0 , 1 , "[SC_DAN_SR_111700_15]" , C_SYSTEM ) --��ӬO�Ĥ���~
  				GiveBodyItem(TargetID(), 724266, 1)   --�����Ũt�C�ɫ~�]
	--Say( OwnerID(),"3" ) --Hole
	--Say( TargetID(),"4" ) --Player	
				SetModeEx( Hole   , EM_SetModeType_Strikback, false )--����
				SetModeEx( Hole   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
				SetModeEx( Hole   , EM_SetModeType_Obstruct, false )--����
				SetModeEx( Hole   , EM_SetModeType_Mark, false )--�аO
				SetModeEx( Hole   , EM_SetModeType_Move, false )--����
				SetModeEx( Hole   , EM_SetModeType_Searchenemy, false )--����
				SetModeEx( Hole   , EM_SetModeType_HideName, false )--�W��
				SetModeEx( Hole  , EM_SetModeType_ShowRoleHead, false )--�Y����
				SetModeEx( Hole   , EM_SetModeType_Show , true ) --�����
				SetModeEx( Hole   , EM_SetModeType_Fight , false )--�i�������
			
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
			Hole = LuaFunc_CreateObjByObj ( 112579 , OwnerID() )   --�}        
			   

			SetModeEx( Hole   , EM_SetModeType_Strikback, false )--����
			SetModeEx( Hole   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
			SetModeEx( Hole   , EM_SetModeType_Obstruct, false )--����
			SetModeEx( Hole   , EM_SetModeType_Mark, false )--�аO
			SetModeEx( Hole   , EM_SetModeType_Move, false )--����
			SetModeEx( Hole   , EM_SetModeType_Searchenemy, false )--����
			SetModeEx( Hole   , EM_SetModeType_HideName, false )--�W��
			SetModeEx( Hole  , EM_SetModeType_ShowRoleHead, false )--�Y����
			SetModeEx( Hole   , EM_SetModeType_Show , true ) --�����
			SetModeEx( Hole   , EM_SetModeType_Fight , false )--�i�������
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
		       		 ScriptMessage( OwnerID() , 0 , 1 , "[SC_DAN_SR_111700_16]" , C_SYSTEM ) --�X�{�a������~
				 AddBuff( Monster ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
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

	if PlayerLV < 16 then  --�̵��ŧP�_���u�¤O
		aLV = 1  --�ˮ`200
 		bLV = 2  --��300
		cLV = 4  --��500

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
		ScriptMessage( OwnerID() , 0 , 1 , "|cffff00ff" .."[SC_DAN_SR_111700_7]".. "|r" , 0 ) --�K�K!����@��[101486]�o!
		ScriptMessage( OwnerID() , 0 , 0 , "|cffff00ff" .."[SC_DAN_SR_111700_7]".. "|r" , 0 ) --�K�K!����@��[101486]�o!
		CancelBuff( TargetID() , 503141)
		
		sleep(5)
		AddBuff( TargetID(),  503141, 1, 10)
		sleep(20)
		local Bomb = LuaFunc_CreateObjByObj ( 101486 , OwnerID() ) --�p���u
		
		SetFightMode(  Bomb , 0, 0, 0, 0 )

		WriteRoleValue( Bomb , EM_RoleValue_PID , aLV  )    --���u����
		BeginPlot( Bomb , "Lua_Dan_112563_003_s" , 0 )        --��NPC����
		
		Hole = LuaFunc_CreateObjByObj ( 112579 , OwnerID() )   --�}
	  
			
			    
			SetModeEx( Hole   , EM_SetModeType_Strikback, false )--����
			SetModeEx( Hole   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
			SetModeEx( Hole   , EM_SetModeType_Obstruct, false )--����
			SetModeEx( Hole   , EM_SetModeType_Mark, false )--�аO
			SetModeEx( Hole   , EM_SetModeType_Move, false )--����
			SetModeEx( Hole   , EM_SetModeType_Searchenemy, false )--����
			SetModeEx( Hole   , EM_SetModeType_HideName, false )--�W��
			SetModeEx( Hole  , EM_SetModeType_ShowRoleHead, false )--�Y����
			SetModeEx( Hole   , EM_SetModeType_Show , true ) --�����
			SetModeEx( Hole   , EM_SetModeType_Fight , false )--�i�������
			AddToPartition( Hole , 0)   
			--CastSpelllv( OwnerID(), OwnerID() , 492823, 0) 
			--sleep(20)
			BeginPlot (Hole , "Lua_Dan_112563_Hole_Delete", 10) 
			sleep(10)
			DelObj(OwnerID())   


	elseif XX <= 40 and XX > 10 then  --30%

		ScriptMessage( OwnerID() , 0, 1 , "|cffff00ff" .."[SC_DAN_SR_111700_8]".. "|r" , 0 ) --�K�K!����@��[101487]�o!
		ScriptMessage( OwnerID() , 0 , 0 , "|cffff00ff" .."[SC_DAN_SR_111700_8]".. "|r" , 0 ) --�K�K!����@��[101487]�o!
		
		CancelBuff( TargetID() , 503141)
		
		sleep(5)

		AddBuff( TargetID(),  503141, 1, 10)
		sleep(20)

		local Bomb = LuaFunc_CreateObjByObj ( 101487 , OwnerID() ) --�����u
		
		SetFightMode(  Bomb , 0, 0, 0, 0 )

		WriteRoleValue( Bomb , EM_RoleValue_PID , bLV  )   --���u����
		BeginPlot( Bomb , "Lua_Dan_112563_003_m" , 0 )        --��NPC����

			Hole = LuaFunc_CreateObjByObj ( 112579 , OwnerID() )   --�}  
			
			    
			SetModeEx( Hole   , EM_SetModeType_Strikback, false )--����
			SetModeEx( Hole   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
			SetModeEx( Hole   , EM_SetModeType_Obstruct, false )--����
			SetModeEx( Hole   , EM_SetModeType_Mark, false )--�аO
			SetModeEx( Hole   , EM_SetModeType_Move, false )--����
			SetModeEx( Hole   , EM_SetModeType_Searchenemy, false )--����
			SetModeEx( Hole   , EM_SetModeType_HideName, false )--�W��
			SetModeEx( Hole  , EM_SetModeType_ShowRoleHead, false )--�Y����
			SetModeEx( Hole   , EM_SetModeType_Show , true ) --�����
			SetModeEx( Hole   , EM_SetModeType_Fight , false )--�i�������
			AddToPartition( Hole , 0)   
			BeginPlot (Hole , "Lua_Dan_112563_Hole_Delete", 10) 

			sleep(10)
			DelObj(OwnerID())   
		else --10%

		ScriptMessage( OwnerID() , 0 , 1 , "|cffff00ff" .."[SC_DAN_SR_111700_9]".. "|r" , 0 ) --�K�K!����@��[101488]�o!
		ScriptMessage( OwnerID() , 0 , 0 , "|cffff00ff" .."[SC_DAN_SR_111700_9]".. "|r" , 0 ) --�K�K!����@��[101488]�o!
		CancelBuff( TargetID() , 503141)
		
		sleep(5)
	
		AddBuff( TargetID(),  503141, 1, 10)
		sleep(20)

		local Bomb = LuaFunc_CreateObjByObj ( 101488 , OwnerID() ) --�j���u
		
		SetFightMode(  Bomb , 0, 0, 0, 0 )

		WriteRoleValue( Bomb , EM_RoleValue_PID , cLV  )    --���u����
		BeginPlot( Bomb , "Lua_Dan_112563_003_b" , 0 )        --��NPC����

			Hole = LuaFunc_CreateObjByObj ( 112579 , OwnerID() )   --�}  
			    
			SetModeEx( Hole   , EM_SetModeType_Strikback, false )--����
			SetModeEx( Hole   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
			SetModeEx( Hole   , EM_SetModeType_Obstruct, false )--����
			SetModeEx( Hole   , EM_SetModeType_Mark, false )--�аO
			SetModeEx( Hole   , EM_SetModeType_Move, false )--����
			SetModeEx( Hole   , EM_SetModeType_Searchenemy, false )--����
			SetModeEx( Hole   , EM_SetModeType_HideName, false )--�W��
			SetModeEx( Hole  , EM_SetModeType_ShowRoleHead, false )--�Y����
			SetModeEx( Hole   , EM_SetModeType_Show , true ) --�����
			SetModeEx( Hole   , EM_SetModeType_Fight , false )--�i�������
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
			ScriptMessage( OwnerID() , 0 , 1 , "[SC_DAN_SR_111700_17]" , C_SYSTEM ) --��Ӥ��򳣨S���O~
			sleep(10)
			CancelBuff( TargetID() , 503141) --��Y
			sleep(5)
			AddBuff( TargetID(),  503141, 1, 10) --��Y
			Hole = LuaFunc_CreateObjByObj ( 112579 , OwnerID() )   --�}   
			SetModeEx( Hole   , EM_SetModeType_Strikback, false )--����
			SetModeEx( Hole   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
			SetModeEx( Hole   , EM_SetModeType_Obstruct, false )--����
			SetModeEx( Hole   , EM_SetModeType_Mark, false )--�аO
			SetModeEx( Hole   , EM_SetModeType_Move, false )--����
			SetModeEx( Hole   , EM_SetModeType_Searchenemy, false )--����
			SetModeEx( Hole   , EM_SetModeType_HideName, false )--�W��
			SetModeEx( Hole  , EM_SetModeType_ShowRoleHead, false )--�Y����
			SetModeEx( Hole   , EM_SetModeType_Show , true ) --�����
			SetModeEx( Hole   , EM_SetModeType_Fight , false )--�i�������
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
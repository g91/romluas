function LuaDan_112563_NPC_Create()

	local Rnpc = LuaFunc_SearchNPCbyOrgID( OwnerID() , 112563, 100 , 1)       --�Ԥ��

	If CheckID( Rnpc[0] ) == true then 

		local secondR = ReadRoleValue( Rnpc[0] ,  EM_RoleValue_Register+1 )  

		if secondR == 5 then

			DelObj(Rnpc[0])

		end

	else

		
			local Npc = CreateObjByFlag( 112563, 780348, 0 , 1 )
			AddToPartition( Npc , 0)  
	  
				SetModeEx( Npc   , EM_SetModeType_Strikback,	      false )--����
				SetModeEx( Npc   , EM_SetModeType_SearchenemyIgnore,  false )--�Q�j�M
				SetModeEx( Npc   , EM_SetModeType_Obstruct, 	      false )--����
				SetModeEx( Npc   , EM_SetModeType_Mark, 	      true )--�аO
				SetModeEx( Npc   , EM_SetModeType_Move, 	      true )--����
				SetModeEx( Npc   , EM_SetModeType_Searchenemy, 	      false )--����
				SetModeEx( Npc   , EM_SetModeType_HideName, 	      false )--�W��
				SetModeEx( Npc   , EM_SetModeType_ShowRoleHead,	      false )--�Y����
				SetModeEx( Npc   , EM_SetModeType_Show , 	      true ) --�����
				SetModeEx( Npc   , EM_SetModeType_Fight , 	      false )--�i�������
	  
			  --say(OwnerID(), "1")
		          --say(TargetID(), "2")
			  
			  BeginPlot( Npc , "LuaDan_112563_NPC_Rabbit00" , 0 ) 

	end

         
end
---------------------------------------------------------------------------------------------------------------------------------

function LuaDan_112563_NPC_Create2()

             
		local Npc = CreateObjByFlag( 112563, 780348, 0 , 1 )
		AddToPartition( Npc , 0)  
	  
			SetModeEx( Npc   , EM_SetModeType_Strikback,	      false )--����
			SetModeEx( Npc   , EM_SetModeType_SearchenemyIgnore,  false )--�Q�j�M
			SetModeEx( Npc   , EM_SetModeType_Obstruct, 	      false )--����
			SetModeEx( Npc   , EM_SetModeType_Mark, 	      true )--�аO
			SetModeEx( Npc   , EM_SetModeType_Move, 	      true )--����
			SetModeEx( Npc   , EM_SetModeType_Searchenemy, 	      false )--����
			SetModeEx( Npc   , EM_SetModeType_HideName, 	      false )--�W��
			SetModeEx( Npc   , EM_SetModeType_ShowRoleHead,	      false )--�Y����
			SetModeEx( Npc   , EM_SetModeType_Show , 	      true ) --�����
			SetModeEx( Npc   , EM_SetModeType_Fight , 	      false )--�i�������

			WriteRoleValue( Npc , EM_RoleValue_Register+1 , 5 )   
	  
		--say(OwnerID(), "1")
		--say(TargetID(), "2")
		--BeginPlot( Npc , "LuaDan_112563_NPC_Rabbit" , 0 ) 
		--sleep(30)
		BeginPlot( Npc , "LuaDan_112563_NPC_Rabbit00" , 0 ) 


end
---------------------------------------------------------------------------------------------------------------------------------

function LuaDan_112563_NPC_Rabbit() 

SetSpeakDetail(OwnerID(), "[SC_DAN_SR_111700_10]" )    --�u���ڳ̶ԳҡA���n�ݨ�L�Ⱖ�Ԥ�ߡA�ڪ֩w�O�̧֨�F�ت��a���I

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
	 
			if  Key >= 1 then		--��K���սҨϥ�
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
					BeginPlot( OwnerID(), "Lua_Dan_112563_Parade" , 0 )  --���ʩ�1100���}�l
				

			elseif GetSystime(1) == 16  and RT == 0 then      

--			Say( OwnerID(),"7" )
--			Say( TargetID(),"8")                 
				
					WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 )  --���ʩ�1600���}�l
					BeginPlot( OwnerID() , "Lua_Dan_112563_Parade" , 0 )  
				

			elseif  GetSystime(1) == 20  and RT == 0 then  

--			Say( OwnerID(),"9" )
--			Say( TargetID(),"10")                         
			
					WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 )  --���ʩ�2000���}�l
					BeginPlot( OwnerID() , "Lua_Dan_112563_Parade" , 0 ) --��LubbyRabbit�}�l�@�� 
			else 

					say(OwnerID(), "[SC_DAN_SR_112563_18]" )    --�Цb 11, 16, 20�I�b��
					break
		        end
	end
end
---------------------------------------------------------------------------------------------------------------------------------
function Lua_Dan_112563_Parade() --���u�@

	local CT = 10	-- �@���ˬd�@�� PID �w���{���@���ˬd�����I
	local ST = 400	-- �Ԥ�߰��d15���ɶ�
	local LubbyRabbit = OwnerID()    
	
		WriteRoleValue( LubbyRabbit , EM_RoleValue_IsWalk , 1) --�R�O�Ө��ⳣ�Ψ���(0�];1��)                                     --Question Walk new function
		MoveToFlagEnabled( LubbyRabbit , false )   	       --�}�������޼@��
		SetFightMode( LubbyRabbit , 0, 1, 0, 0 )               --���ġB���ʡB�k�]�B�Q���� 1 true.

       			 ScriptMessage( LubbyRabbit , 0 , 1 , "[SC_DAN_SR_111700_2]", C_SYSTEM ) --�_���y�H�̡A���H�ڪ��}�B�A����A���Q�r��A�ӴM���ݩ�A���_���a!�X�o�I
		    	 Say( LubbyRabbit , "[SC_DAN_SR_111700_2]")  				 --��NPC�o�e�T��
       			 SetPlot( LubbyRabbit , "touch" ,"Lua_Dan_112563_Touch", 50)                --�I��Ԥ�ߡA�Ԥ�ߧY�}�l�C��
	
		sleep(CT)
--		Say( OwnerID(),"1" )
--		Say( TargetID(),"2" )
	
		WriteRoleValue( LubbyRabbit, EM_RoleValue_IsWalk, 1) 			--�]�a�I�ߤl�C
		LuaFunc_MoveToFlag( LubbyRabbit, 780294, 0, 0)        			--���ʨ���w���Ѥl 
			
		sleep(CT)

			ScriptMessage( LubbyRabbit , 0 , 1 , "[SC_DAN_SR_111700_3]" , C_SYSTEM ) --�Ԥ�߰��d�I�G�u�o�̦��G���ܦh�_�����Pı��C�ʤ�����ݧa�I�I�v
			Say( LubbyRabbit , "[SC_DAN_SR_111700_3]" )  
	
                	 BeginPlot (LubbyRabbit, "Lua_Dan_112563_createholes", 50)       --�I�s���ͬ}��Script
------			
		sleep(ST)

			ScriptMessage( LubbyRabbit , 0 , 1 , "[SC_DAN_SR_111700_4]" , C_SYSTEM ) --�K�I�ڨS���F�A�a�A�ڭ��~�򨫧a�I
			Say( LubbyRabbit , "[SC_DAN_SR_111700_4]" )  
	 				
		sleep(CT)		     

		WriteRoleValue(LubbyRabbit ,EM_RoleValue_IsWalk , 1) 			--���a�I�ߤl�C
               	LuaFunc_MoveToFlag( LubbyRabbit, 780294, 1, 0)        			--���ʨ�U�@��X�l��m

		sleep(CT)

			ScriptMessage( LubbyRabbit , 0 , 1 , "[SC_DAN_SR_111700_3]" , C_SYSTEM ) --�Ԥ�߰��d�I�G�u�o�̦��G���ܦh�_�����Pı��C�ʤ�����ݧa�I�I�v
			Say( LubbyRabbit , "[SC_DAN_SR_111700_3]" )  
				
			BeginPlot (LubbyRabbit, "Lua_Dan_112563_createholes1", 50) 	--�I�s���ͬ}��Script

		sleep(ST)
			BeginPlot (LubbyRabbit, "LuaDan_112563_NPC_Create2", 10)	--�I�s���ͨߤl��Script
			ScriptMessage( LubbyRabbit , 0 , 1 , "[SC_DAN_SR_111700_4]" , C_SYSTEM ) --�K�I�ڨS���F�A�a�A�ڭ��~�򨫧a�I
			Say( LubbyRabbit , "[SC_DAN_SR_111700_4]" )  
					
		sleep(CT)		     

		WriteRoleValue( LubbyRabbit, EM_RoleValue_IsWalk, 0) 			--�]�a�I�ߤl�C
		LuaFunc_MoveToFlag( LubbyRabbit, 780294, 2, 0)        			--���ʨ���w���Ѥl 54000�������V�� ((�T�q���|))

		sleep(CT)

			ScriptMessage( LubbyRabbit , 0 , 1 , "[SC_DAN_SR_111700_3]" , C_SYSTEM ) --�Ԥ�߰��d�I�G�u�o�̦��G���ܦh�_�����Pı��C�ʤ�����ݧa�I�I�v
			Say( LubbyRabbit, "[SC_DAN_SR_111700_3]" )  
				
			BeginPlot (LubbyRabbit, "Lua_Dan_112563_createholes12", 50)      --�I�s���ͬ}��Script

		sleep(ST)

			ScriptMessage( LubbyRabbit, 0 , 1 , "[SC_DAN_SR_111700_4]" , C_SYSTEM ) --�K�I�ڨS���F�A�a�A�ڭ��~�򨫧a�I
			Say( LubbyRabbit, "[SC_DAN_SR_111700_4]" )  
					
		sleep(CT)		     

		WriteRoleValue( LubbyRabbit, EM_RoleValue_IsWalk, 0) 			--�]�a�I�ߤl�C
		LuaFunc_MoveToFlag( LubbyRabbit, 780294, 3, 0)        			--���ʨ���w���Ѥl 54000�������V�� ((�T�q���|))

		sleep(CT)

			ScriptMessage( LubbyRabbit, 0 , 1 , "[SC_DAN_SR_111700_3]" , C_SYSTEM ) --�Ԥ�߰��d�I�G�u�o�̦��G���ܦh�_�����Pı��C�ʤ�����ݧa�I�I�v
			ScriptMessage( LubbyRabbit, 0 , 1 , "[SC_DAN_SR_111700_23]" , C_SYSTEM ) --�Ԥ�߰��d�I�G�u�o�O�̫�@���F��I�A�A��v

			Say( LubbyRabbit, "[SC_DAN_SR_111700_3]" )  
			Say( LubbyRabbit, "[SC_DAN_SR_111700_23]" )  
			BeginPlot (LubbyRabbit, "Lua_Dan_112563_createholes13", 50)	--�I�s���ͬ}��Script

		sleep(ST)

			
			ScriptMessage( LubbyRabbit, 0 , 1 , "[SC_DAN_SR_111700_5]" , C_SYSTEM ) --�C�浲���աI�O�@�q�۷�r�֪��ȵ{��C
			Say( LubbyRabbit, "[SC_DAN_SR_111700_5]" )  				 
--����Script		
		sleep(CT)

		WriteRoleValue( LubbyRabbit  , EM_RoleValue_PID , 0 )
		--SetPos( LubbyRabbit, 586.5, 24.0, -8188.1, 293.1 ) --�ߤl�X�o���y��


		local secondR = ReadRoleValue( LubbyRabbit,  EM_RoleValue_Register+1 )  

		if secondR ~= 5 then

			--ScriptMessage( LubbyRabbit, 0 , 1 , "123" , C_SYSTEM ) --�C�浲���աI�O�@�q�۷�r�֪��ȵ{��C	
		
			BeginPlot (LubbyRabbit, "LuaDan_112563_NPC_Create", 10)	--�I�s���ͨߤl��Script	
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

				
			Hole[0] = CreateObjByFlag( 112459, 780296, 0 , 1 )    --�}1        
			AddToPartition( Hole[0] , 0)     

			Hole[1] = CreateObjByFlag( 112459, 780296, 1 , 1 )    --�}2       
			AddToPartition( Hole[1] , 0)     

			Hole[2] = CreateObjByFlag( 112459, 780296, 2 , 1 )    --�}3       
			AddToPartition( Hole[2] , 0)     

			Hole[3] = CreateObjByFlag( 112459, 780296, 3 , 1 )    --�}4        
			AddToPartition( Hole[3] , 0)     

			Hole[4] = CreateObjByFlag( 112459, 780296, 4 , 1 )    --�}5        
			AddToPartition( Hole[4] , 0)     

                for i = 0, 4 do

			SetModeEx( Hole[i]   , EM_SetModeType_Strikback,	 false )--����
			SetModeEx( Hole[i]   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
			SetModeEx( Hole[i]   , EM_SetModeType_Obstruct, 	 false )--����
			SetModeEx( Hole[i]   , EM_SetModeType_Mark, 		 true )--�аO
			SetModeEx( Hole[i]   , EM_SetModeType_Move, 		 false )--����
			SetModeEx( Hole[i]   , EM_SetModeType_Searchenemy, 	 false )--����
			SetModeEx( Hole[i]   , EM_SetModeType_HideName, 	 false )--�W��
			SetModeEx( Hole[i]   , EM_SetModeType_ShowRoleHead,	 false )--�Y����
			SetModeEx( Hole[i]   , EM_SetModeType_Show , 	 	 true ) --�����
			SetModeEx( Hole[i]   , EM_SetModeType_Fight , 		 false )--�i�������

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

				
			Hole[0] = CreateObjByFlag( 112459, 780336, 0 , 1 )    --�}1        
			AddToPartition( Hole[0] , 0)     

			Hole[1] = CreateObjByFlag( 112459, 780336, 1 , 1 )    --�}2       
			AddToPartition( Hole[1] , 0)     

			Hole[2] = CreateObjByFlag( 112459, 780336, 2 , 1 )    --�}3       
			AddToPartition( Hole[2] , 0)     

			Hole[3] = CreateObjByFlag( 112459, 780336, 3 , 1 )    --�}4        
			AddToPartition( Hole[3] , 0)     

			Hole[4] = CreateObjByFlag( 112459, 780336, 4 , 1 )    --�}5        
			AddToPartition( Hole[4] , 0)     

                for i = 0, 4 do

			SetModeEx( Hole[i]   , EM_SetModeType_Strikback,	 false )--����
			SetModeEx( Hole[i]   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
			SetModeEx( Hole[i]   , EM_SetModeType_Obstruct, 	 false )--����
			SetModeEx( Hole[i]   , EM_SetModeType_Mark, 		 true )--�аO
			SetModeEx( Hole[i]   , EM_SetModeType_Move, 		 false )--����
			SetModeEx( Hole[i]   , EM_SetModeType_Searchenemy, 	 false )--����
			SetModeEx( Hole[i]   , EM_SetModeType_HideName, 	 false )--�W��
			SetModeEx( Hole[i]   , EM_SetModeType_ShowRoleHead,	 false )--�Y����
			SetModeEx( Hole[i]   , EM_SetModeType_Show , 	 	 true ) --�����
			SetModeEx( Hole[i]   , EM_SetModeType_Fight , 		 false )--�i�������

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

				
			Hole[0] = CreateObjByFlag( 112459, 780337, 0 , 1 )    --�}1        
			AddToPartition( Hole[0] , 0)     

			Hole[1] = CreateObjByFlag( 112459, 780337, 1 , 1 )    --�}2       
			AddToPartition( Hole[1] , 0)     

			Hole[2] = CreateObjByFlag( 112459, 780337, 2 , 1 )    --�}3       
			AddToPartition( Hole[2] , 0)     

			Hole[3] = CreateObjByFlag( 112459, 780337, 3 , 1 )    --�}4        
			AddToPartition( Hole[3] , 0)     

			Hole[4] = CreateObjByFlag( 112459, 780337, 4 , 1 )    --�}5        
			AddToPartition( Hole[4] , 0)     

                for i = 0, 4 do

			SetModeEx( Hole[i]   , EM_SetModeType_Strikback,	 false )--����
			SetModeEx( Hole[i]   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
			SetModeEx( Hole[i]   , EM_SetModeType_Obstruct, 	 false )--����
			SetModeEx( Hole[i]   , EM_SetModeType_Mark, 		 true )--�аO
			SetModeEx( Hole[i]   , EM_SetModeType_Move, 		 false )--����
			SetModeEx( Hole[i]   , EM_SetModeType_Searchenemy, 	 false )--����
			SetModeEx( Hole[i]   , EM_SetModeType_HideName, 	 false )--�W��
			SetModeEx( Hole[i]   , EM_SetModeType_ShowRoleHead,	 false )--�Y����
			SetModeEx( Hole[i]   , EM_SetModeType_Show , 	 	 true ) --�����
			SetModeEx( Hole[i]   , EM_SetModeType_Fight , 		 false )--�i�������

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

				
			Hole[0] = CreateObjByFlag( 112459, 780338, 0 , 1 )    --�}1        
			AddToPartition( Hole[0] , 0)     

			Hole[1] = CreateObjByFlag( 112459, 780338, 1 , 1 )    --�}2       
			AddToPartition( Hole[1] , 0)     

			Hole[2] = CreateObjByFlag( 112459, 780338, 2 , 1 )    --�}3       
			AddToPartition( Hole[2] , 0)     

			Hole[3] = CreateObjByFlag( 112459, 780338, 3 , 1 )    --�}4        
			AddToPartition( Hole[3] , 0)     

			Hole[4] = CreateObjByFlag( 112459, 780338, 4 , 1 )    --�}5        
			AddToPartition( Hole[4] , 0)     

                for i = 0, 4 do

			SetModeEx( Hole[i]   , EM_SetModeType_Strikback,	 false )--����
			SetModeEx( Hole[i]   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
			SetModeEx( Hole[i]   , EM_SetModeType_Obstruct, 	 false )--����
			SetModeEx( Hole[i]   , EM_SetModeType_Mark, 		 true )--�аO
			SetModeEx( Hole[i]   , EM_SetModeType_Move, 		 false )--����
			SetModeEx( Hole[i]   , EM_SetModeType_Searchenemy, 	 false )--����
			SetModeEx( Hole[i]   , EM_SetModeType_HideName, 	 false )--�W��
			SetModeEx( Hole[i]   , EM_SetModeType_ShowRoleHead,	 false )--�Y����
			SetModeEx( Hole[i]   , EM_SetModeType_Show , 	 	 true ) --�����
			SetModeEx( Hole[i]   , EM_SetModeType_Fight , 		 false )--�i�������

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

		     local probability = {		20,	-- �귽
			   			20,             -- ���u
			                      		20,             -- �Ĥ�
			                       		20,             -- ��
						20 }       	-- ���򳣨S�� 
                       
                   	

                         if Random > (100 - probability[1] )  then  --20% ���v�@--������������Ψӥ��}�o��귽--Lua_Dan_112563_Hole_Resource
  				
                   			SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Nothing" , 50 ) 
							
			 

                    	 elseif Random > (100 - probability[1] - probability[2])  then --40%�����Ĥ� --Lua_Dan_112563_Hole_Potion
				
				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Bomb" , 50 ) 
			
						
                         

			 elseif Random > (100 - probability[1] - probability[2] - probability[3]) then --�Ǫ� 60% --Lua_Dan_112563_Hole_Monster
			 
				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Resource" , 50 ) 
		
								
			 

			elseif Random > (100 - probability[1] - probability[2] - probability[3] - probability[4])  then --���u  80% --Lua_Dan_112563_Hole_Bomb
			
				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Potion" , 50 ) 
                      
			else 

				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Monster" ,50 ) --Lua_Dan_112563_Hole_Nothing
						
			end

--Say( OwnerID(),"Hole5" ) --�}
--Say( TargetID(),"Hole6" ) --����
                                BeginPlot ( OwnerID() , "Lua_Dan_112563_Hole_Delete", 10) 


end 
----------------------------------------------------------------------------------------------------------------
function Lua_Dan_112563_Hole1()

	
	--Say( OwnerID(),"Hole3" ) --Player
	--Say( TargetID(),"Hole4" ) --Hole

		local Random = Rand(100)

		     local probability = {	20,		-- �귽
			   			20,             -- ���u
			                        20,             -- �Ĥ�
			                        20,             -- ��
						20 }       	-- ���򳣨S�� 
                       
                   	

                         if Random > (100 - probability[1] )  then  --20% ���v�@--������������Ψӥ��}�o��귽--Lua_Dan_112563_Hole_Resource
  				
                   		SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Nothing" , 50 ) 
                    	 elseif Random > (100 - probability[1] - probability[2])  then --40%�����Ĥ� --Lua_Dan_112563_Hole_Potion
				
				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Bomb" , 50 ) 
			   
			 elseif Random > (100 - probability[1] - probability[2] - probability[3]) then --�Ǫ� 60% --Lua_Dan_112563_Hole_Monster
			 
				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Resource" , 50 ) 
		
			elseif Random > (100 - probability[1] - probability[2] - probability[3] - probability[4])  then --���u  80% --Lua_Dan_112563_Hole_Bomb
			
				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Potion" , 50 ) 
                      
			else 
				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Monster" , 50 ) --Lua_Dan_112563_Hole_Nothing
						
			end

--Say( OwnerID(),"Hole5" ) --�}
--Say( TargetID(),"Hole6" ) --����
                                BeginPlot ( OwnerID() , "Lua_Dan_112563_Hole_Delete", 10) 

end 
----------------------------------------------------------------------------------------------------------------
function Lua_Dan_112563_Hole2()

	--Say( OwnerID(),"Hole5" ) --Player
	--Say( TargetID(),"Hole6" ) --Hole

		local Random = Rand(100)

		     local probability = {	20,		-- �귽
			   			20,             -- ���u
			                        20,             -- �Ĥ�
			                        20,             -- ��
						20 }       	-- ���򳣨S�� 
                       
                   	

                          if Random > (100 - probability[1] )  then  --20% ���v�@--������������Ψӥ��}�o��귽--Lua_Dan_112563_Hole_Resource
  				
                   		SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Nothing" , 50 ) 
							
			  

                    	 elseif Random > (100 - probability[1] - probability[2])  then --40%�����Ĥ� --Lua_Dan_112563_Hole_Potion
				
				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Bomb" , 50 ) 
			
						
                         

			 elseif Random > (100 - probability[1] - probability[2] - probability[3]) then --�Ǫ� 60% --Lua_Dan_112563_Hole_Monster
			 
				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Resource" , 50 ) 
		
								
			 
			elseif Random > (100 - probability[1] - probability[2] - probability[3] - probability[4])  then --���u  80% --Lua_Dan_112563_Hole_Bomb
			
				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Potion" , 50 ) 
                      
			else 

				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Monster" , 50 ) --Lua_Dan_112563_Hole_Nothing
						
			end

--Say( OwnerID(),"Hole5" ) --�}
--Say( TargetID(),"Hole6" ) --����
                                BeginPlot ( OwnerID() , "Lua_Dan_112563_Hole_Delete", 10) 
end 
----------------------------------------------------------------------------------------------------------------
function Lua_Dan_112563_Hole3()

	--Say( OwnerID(),"Hole7" ) --Player
	--Say( TargetID(),"Hole8" ) --Hole

		local Random = Rand(100)

		     local probability = {	20,		-- �귽
			   			20,             -- ���u
			                        20,             -- �Ĥ�
			                        20,             -- ��
						20 }       	-- ���򳣨S�� 
                       
                   	

                          if Random > (100 - probability[1] )  then  --20% ���v�@--������������Ψӥ��}�o��귽--Lua_Dan_112563_Hole_Resource
  				
                   		SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Nothing" , 50 ) 
							
			  

                    	 elseif Random > (100 - probability[1] - probability[2])  then --40%�����Ĥ� --Lua_Dan_112563_Hole_Potion
				
				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Bomb" , 50 ) 
			
						
                         

			 elseif Random > (100 - probability[1] - probability[2] - probability[3]) then --�Ǫ� 60% --Lua_Dan_112563_Hole_Monster
			 
				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Resource" , 50 ) 
		
								
			 
			elseif Random > (100 - probability[1] - probability[2] - probability[3] - probability[4])  then --���u  80% --Lua_Dan_112563_Hole_Bomb
			
				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Potion" , 50 ) 
                      
			else 

				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Monster" , 50 ) --Lua_Dan_112563_Hole_Nothing
						
			end
--Say( OwnerID(),"Hole5" ) --�}
--Say( TargetID(),"Hole6" ) --����
                                 BeginPlot ( OwnerID() , "Lua_Dan_112563_Hole_Delete", 10) 

end 
----------------------------------------------------------------------------------------------------------------
function Lua_Dan_112563_Hole4()

	--Say( OwnerID(),"Hole9" ) --Player
	--Say( TargetID(),"Hole10" ) --Hole

		local Random = Rand(100)

		     local probability = {	20,		-- �귽
			   			20,             -- ���u
			                        20,             -- �Ĥ�
			                        20,             -- ��
						20 }       	-- ���򳣨S�� 
                       
                   	

                         if Random > (100 - probability[1] )  then  --20% ���v�@--������������Ψӥ��}�o��귽--Lua_Dan_112563_Hole_Resource
  				
                   		SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Nothing" , 50 ) 
							
			  

                    	 elseif Random > (100 - probability[1] - probability[2])  then --40%�����Ĥ� --Lua_Dan_112563_Hole_Potion
				
				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Bomb" , 50 ) 
			
						
                         

			 elseif Random > (100 - probability[1] - probability[2] - probability[3]) then --�Ǫ� 60% --Lua_Dan_112563_Hole_Monster
			 
				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Resource" , 50 ) 
		
								
			 
			elseif Random > (100 - probability[1] - probability[2] - probability[3] - probability[4])  then --���u  80% --Lua_Dan_112563_Hole_Bomb
			
				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Potion" , 50 ) 
                      
			else 

				SetCursorType( OwnerID() , eCursor_Mine )
				SetPlot( OwnerID() ,"touch",  "Lua_Dan_112563_Hole_Monster" , 50 ) --Lua_Dan_112563_Hole_Nothing
						
			end
--Say( OwnerID(),"Hole5" ) --�}
--Say( TargetID(),"Hole6" ) --���� 
			BeginPlot ( OwnerID() , "Lua_Dan_112563_Hole_Delete", 10) 
                                
end 
----------------------------------------------------------------------------------------------------------------
function Lua_Dan_112563_Hole_Bomb() --Target�����u
	
	--Say( OwnerID(),"1" ) --Player
	--Say( TargetID(),"2" ) --Hole
	--SetPlot( TargetID(),"touch","", 30)
	AddBuff(OwnerID(), 503147 , 1 , 1 )
	if BeginCastBar( OwnerID(), "[SC_DAN_SR_111700_6]", 30 , ruFUSION_ACTORSTATE_MINING_BEGIN , ruFUSION_ACTORSTATE_MINING_END , 0 ) == 1 then
        --/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)	
 		
		
		AttachCastMotionTool( OwnerID(), 210508 ) --�m���Z��������

		while true do
		sleep( 2 )
		
			if ( CheckCastBar( OwnerID() )   ~= 0 ) then 
				if ( CheckCastBar( OwnerID() )   > 0) then -- ���\
					result = "OKOK"
					EndCastBar( OwnerID() , CheckCastBar( OwnerID() )   )
					break
				elseif ( CheckCastBar( OwnerID() )   < 0 ) then -- ����
					result = "DAME"
					EndCastBar( OwnerID() , CheckCastBar( OwnerID() )   )
					break
				end
			end
		end
			if ( result == "OKOK" ) then
			SetPlot( TargetID(),"touch","", 0)

--502927
--CastSpelllv( TargetID(), TargetID() , 492823, 0) --�K�B�`������

			
			local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV  ) 
			WriteRoleValue( TargetID() , EM_RoleValue_Register+7 , PlayerLV )  
	

			BeginPlot( TargetID() , "Lua_Dan_112563_Bomb" , 0 )  
			--sleep(10)
			
			--hide(TargetID())

			end


			end
			
			
		

        
	
end

----------------------------------------------------------------------------------------------------------------
function Lua_Dan_112563_Hole_Monster() --Target���Ǫ�
	
	--Say( OwnerID(),"9" ) --Player
	--Say( TargetID(),"10" ) --Hole

	--SetPlot( TargetID(),"touch","", 0)
	AddBuff(OwnerID(), 503147 , 1 , 1 )
	if BeginCastBar( OwnerID(), "[SC_DAN_SR_111700_6]", 30 , ruFUSION_ACTORSTATE_MINING_BEGIN , ruFUSION_ACTORSTATE_MINING_END , 0 ) == 1 then
        --/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)	
 		
		
		AttachCastMotionTool( OwnerID(), 210508 ); --�m���Z��������

		while true do
		sleep( 2 )
		
			if ( CheckCastBar( OwnerID() )   ~= 0 ) then 
				if ( CheckCastBar( OwnerID() )   > 0) then -- ���\
					result = "OKOK"
					EndCastBar( OwnerID() , CheckCastBar( OwnerID() )   )
					break
				elseif ( CheckCastBar( OwnerID() )   < 0 ) then -- ����
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


function Lua_Dan_112563_Hole_Resource() --Target���귽
	
	--Say( OwnerID(),"11" ) --Player
	--Say( TargetID(),"12" ) --Hole
	--SetPlot( TargetID(),"touch","", 30)
		AddBuff(OwnerID(), 503147 , 1 , 1 )
	if BeginCastBar( OwnerID(), "[SC_DAN_SR_111700_6]", 30 , ruFUSION_ACTORSTATE_MINING_BEGIN , ruFUSION_ACTORSTATE_MINING_END , 0 ) == 1 then
        --/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)	
 	
		
		AttachCastMotionTool( OwnerID(), 210508 ); --�m���Z��������

		while true do
		sleep( 2 )
		
			if ( CheckCastBar( OwnerID() )   ~= 0 ) then 
				if ( CheckCastBar( OwnerID() )   > 0) then -- ���\
					result = "OKOK"
					EndCastBar( OwnerID() , CheckCastBar( OwnerID() )   )
					break;
				elseif ( CheckCastBar( OwnerID() )   < 0 ) then -- ����
					result = "DAME"
					EndCastBar( OwnerID() , CheckCastBar( OwnerID() )   )
					break;
				end
			end
		end
			if ( result == "OKOK" ) then
			SetPlot( TargetID(),"touch","",0 )
				--AddBuff( TargetID(),  502927, 1, 10)           --�����S��
 			--CastSpelllv( TargetID(), TargetID() , 492823, 0) --�K�B�`������


			--local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV  ) 
			--WriteRoleValue( TargetID() , EM_RoleValue_Register+7 , PlayerLV )  
			BeginPlot( TargetID() , "Lua_Dan_112563_Resource" , 10 )  
			--sleep(10)
								
			
			--hide(TargetID())
                        
				
			end

			end
			
		
		

        
	
end

----------------------------------------------------------------------------------------------------------------


function Lua_Dan_112563_Hole_Potion() --Target���Ĥ�
	
	--Say( OwnerID(),"13" ) --Player
	--Say( TargetID(),"14" ) --Hole
	--SetPlot( TargetID(),"touch","", 30)
AddBuff(OwnerID(), 503147 , 1 , 1 )
	if BeginCastBar( OwnerID(), "[SC_DAN_SR_111700_6]", 30 , ruFUSION_ACTORSTATE_MINING_BEGIN , ruFUSION_ACTORSTATE_MINING_END , 0 ) == 1 then
        --/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)	
 		
		AttachCastMotionTool( OwnerID(), 210508 ); --�m���Z��������

		while true do
		sleep( 2 )
			
			if ( CheckCastBar( OwnerID() )   ~= 0 ) then 
				if ( CheckCastBar( OwnerID() )   > 0) then -- ���\
					result = "OKOK"
					EndCastBar( OwnerID() , CheckCastBar( OwnerID() )   )
					break;
				elseif ( CheckCastBar( OwnerID() )   < 0 ) then -- ����
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

 			--CastSpelllv( TargetID(), TargetID() , 492823, 0) --�K�B�`������
			--local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV  ) 
			--WriteRoleValue( TargetID() , EM_RoleValue_Register+7 , PlayerLV )  
			BeginPlot( TargetID() , "Lua_Dan_112563_Potion" , 10 )  
			--sleep(10)
			--hide(TargetID())
	
			end

			
			end
		

        
	
end

----------------------------------------------------------------------------------------------------------------


function Lua_Dan_112563_Hole_Nothing() --Target�����򳣨S��
	
	--Say( OwnerID(),"15" ) --Player
	--Say( TargetID(),"16" ) --Hole

	--SetPlot( TargetID(),"touch","", 30)
	AddBuff(OwnerID(), 503147 , 1 , 1 )
	if BeginCastBar( OwnerID(), "[SC_DAN_SR_111700_6]", 30 , ruFUSION_ACTORSTATE_MINING_BEGIN , ruFUSION_ACTORSTATE_MINING_END , 0 ) == 1 then
        --/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)	
 	
		AttachCastMotionTool( OwnerID(), 210508 ); --�m���Z��������

		while true do
		sleep( 2 )
		
			if ( CheckCastBar( OwnerID() )   ~= 0 ) then 
				if ( CheckCastBar( OwnerID() )   > 0) then -- ���\
					result = "OKOK"
					EndCastBar( OwnerID() , CheckCastBar( OwnerID() )   )
					break
				elseif ( CheckCastBar( OwnerID() )   < 0 ) then -- ����
					result = "DAME"
					EndCastBar( OwnerID() , CheckCastBar( OwnerID() )   )
					break
				end
			end
			end
		
			if ( result == "OKOK" ) then
			SetPlot( TargetID(),"touch","", 0)
			
			 --AddBuff( TargetID(),  502927, 1, 10)
			 --CastSpelllv( TargetID(), TargetID() , 492823, 0) --�K�B�`������
					 
			BeginPlot( TargetID() , "Lua_Dan_112563_Nothing" , 10 )  
			--sleep(10)

			--hide(TargetID())
		
			end

			
			end
       
	
end
----------------------------------------------------------------------------------------------------------------
function LuaDan_112757_5() --�d��@���A�����ֲ����H�a��A�ͩǤΥ�ñ���
	
	SetPlot( OwnerID() , "range" ,"LuaDan_112757_Monster5",150)  
	--sleep(300)
	

end

----------------------------------------------------------------------------------------------------------------
function LuaDan_112757_6() --�d��@���A�����ֲ����H�a��A�ͩǤΥ�ñ���
	
	SetPlot( OwnerID() , "range" ,"LuaDan_112757_Monster6",150)  
	--sleep(300)
	

end

----------------------------------------------------------------------------------------------------------------
function LuaDan_112757_Monster5() --�Ĥ@���I�ͩ�

--say(OwnerID(), "OwnerID") --���a	SetFlag( OwnerID()  , 542529 , 1 )  
--say(TargetID(), "TargetID") --���Ϊ���
	local Flag = CheckFlag(OwnerID()  , 542448)           --����_�ͥX��
	local Flag2 = CheckFlag(OwnerID()  , 542529)           --�T�O�^�Y�ɤ��|�A�ͩ�
	local Signflag3 = CheckFlag(OwnerID()  , 542549)
	local MusicBox =  CountBodyItem( OwnerID() , 204426 ) --���ֲ�
	local Protect  = CheckFlag(OwnerID()  , 542551)       --�@�úX��
	local Monster = {}

	

		while  MusicBox ~= 0 and Flag == false and Signflag3 ==false  do
			
			sleep(10)	
			SetFlag( OwnerID()  , 542448 , 1 )--�קK����Ĳ�I�ͩ�

	  		
			 Monster[0] = CreateObjByFlag( 102005, 780333, 41, 2 )        --���ǹC����
			 Monster[1] = CreateObjByFlag( 102005, 780333, 42, 2 )        --���ǹC����
			 Monster[2] = CreateObjByFlag( 102005, 780333, 44, 2 )        --���ǹC����
			ScriptMessage( OwnerID() , 0 , 1 , "[SC_DAN_SR_112757_MONSTER3]" , C_SYSTEM ) --�ګu�I�e�����H����ı�F�ڡI�I�~�M�o��²��N��A�L�I�o�O�̫�@�D���u�F�A���藍�����A�q�L�I�I
			--Say( TargetID() , "[SC_DAN_SR_112757_Monster3]")  	

			for i = 0, 2 do

				SetModeEx( Monster[i]   , EM_SetModeType_Strikback, true )--����
				SetModeEx( Monster[i]   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
				SetModeEx( Monster[i]   , EM_SetModeType_Obstruct, false )--����
				SetModeEx( Monster[i]   , EM_SetModeType_Mark, true )--�аO
				SetModeEx( Monster[i]   , EM_SetModeType_Move, true )--����
				SetModeEx( Monster[i]   , EM_SetModeType_Searchenemy, true )--����
				SetModeEx( Monster[i]    , EM_SetModeType_HideName, true )--�W��
				SetModeEx( Monster[i] , EM_SetModeType_ShowRoleHead, true )--�Y����
				SetModeEx( Monster[i], EM_SetModeType_Fight , true )--�i�������
				SetModeEx( Monster[i]   , EM_SetModeType_Show , true ) --�����
				AddToPartition( Monster[i]  , 0)  
				SetAttack( Monster[i] , OwnerID()  )
				AddBuff( Monster[i],502707 ,1 ,-1 )
				
				--sleep(10)
				
				--MoveToFlagEnabled( Monster[i] , false )                --���޼@����
                                --WriteRoleValue( Monster[i], EM_RoleValue_IsWalk, 0)    --����	
				--LuaFunc_MoveToFlag( Monster[i], 780303, 2, 0)          --�e�i����w�X

				--sleep(10)

	        		BeginPlot (Monster[i], "LuaDan_112757_Monster_Delete", 10) 	--�g�@�өǦ۰ʧR��
			SetPlot(Monster[i] , "dead" , "LuaDan_112757_MDeadScript" , 0 )

				--sleep(150)
			end
				--�~��ͩ�
			 Monster[3] = CreateObjByFlag( 102005, 780333, 40, 1)        --���ǹC����
			 Monster[4] = CreateObjByFlag( 102005, 780333, 39, 1 )        --���ǹC����
			 Monster[5] = CreateObjByFlag( 102005, 780333, 43, 1 )        --���ǹC����
		
				
			for i = 3, 5 do

				SetModeEx( Monster[i]   , EM_SetModeType_Strikback, true )--����
				SetModeEx( Monster[i]   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
				SetModeEx( Monster[i]   , EM_SetModeType_Obstruct, false )--����
				SetModeEx( Monster[i]   , EM_SetModeType_Mark, true )--�аO
				SetModeEx( Monster[i]   , EM_SetModeType_Move, true )--����
				SetModeEx( Monster[i]   , EM_SetModeType_Searchenemy, true )--����
				SetModeEx( Monster[i]    , EM_SetModeType_HideName, true )--�W��
				SetModeEx( Monster[i] , EM_SetModeType_ShowRoleHead, true )--�Y����
				SetModeEx( Monster[i], EM_SetModeType_Fight , true )--�i�������
				SetModeEx( Monster[i]   , EM_SetModeType_Show , true ) --�����
				AddToPartition( Monster[i]  , 0)  
				SetAttack( Monster[i] , OwnerID()  )
				AddBuff( Monster[i],502707 ,1 ,-1 )
				
				--sleep(10)
				
				--MoveToFlagEnabled( Monster[i] , false )                --���޼@����
                                --WriteRoleValue( Monster[i], EM_RoleValue_IsWalk, 1)    --����	
				--LuaFunc_MoveToFlag( Monster[i], 780303, 2, 0)          --�e�i����w�X

				--sleep(10)

	        		BeginPlot (Monster[i], "LuaDan_112757_Monster_Delete", 10) 	--�g�@�өǦ۰ʧR��
			SetPlot(Monster[i] , "dead" , "LuaDan_112757_MDeadScript" , 0 )

				--sleep(150)
			end

			 Monster[6] = CreateObjByFlag( 102005, 780333, 36, 1 )        --���ǹC����
			 Monster[7] = CreateObjByFlag( 102005, 780333, 37, 1 )        --���ǹC����
			 Monster[8] = CreateObjByFlag( 102005, 780333, 38, 1)        --���ǹC����
		
				
			for i = 6, 8 do

				SetModeEx( Monster[i]   , EM_SetModeType_Strikback, true )--����
				SetModeEx( Monster[i]   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
				SetModeEx( Monster[i]   , EM_SetModeType_Obstruct, false )--����
				SetModeEx( Monster[i]   , EM_SetModeType_Mark, true )--�аO
				SetModeEx( Monster[i]   , EM_SetModeType_Move, true )--����
				SetModeEx( Monster[i]   , EM_SetModeType_Searchenemy, true )--����
				SetModeEx( Monster[i]    , EM_SetModeType_HideName, true )--�W��
				SetModeEx( Monster[i] , EM_SetModeType_ShowRoleHead, true )--�Y����
				SetModeEx( Monster[i], EM_SetModeType_Fight , true )--�i�������
				SetModeEx( Monster[i]   , EM_SetModeType_Show , true ) --�����
				AddToPartition( Monster[i]  , 0)  
				SetAttack( Monster[i] , OwnerID() )
				AddBuff( Monster[i],502707 ,1 ,-1 )
				
				--sleep(10)
				
				--MoveToFlagEnabled( Monster[i] , false )                --���޼@����
                                --WriteRoleValue( Monster[i], EM_RoleValue_IsWalk, 0)    --����	
				--LuaFunc_MoveToFlag( Monster[i], 780303, 2, 0)          --�e�i����w�X

				--sleep(10)

	        		BeginPlot (Monster[i], "LuaDan_112757_Monster_Delete", 10) 	--�g�@�өǦ۰ʧR��
			SetPlot(Monster[i] , "dead" , "LuaDan_112757_MDeadScript" , 0 )

				--sleep(150)
			end
				
			
				--SetFlag( OwnerID()  , 542448 , 1 )--�קK����Ĳ�I�ͩ�

			break
		end

	
	
	--BeginPlot (OwnerID(), "LuaDan_112757_Signer", 10) 	--��ñ����s�X��
end  

----------------------------------------------------------------------------------------------------------------
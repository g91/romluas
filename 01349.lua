----------------------------------------------------------------------------------------------------------------
function LuaDan_112757_3() --�d��@���A�����ֲ����H�a��A�ͩǤΥ�ñ���
	
	SetPlot( OwnerID() , "range" ,"LuaDan_112757_Monster3",150)  
	--sleep(300)
	

end

----------------------------------------------------------------------------------------------------------------
function LuaDan_112757_4() --�d��@���A�����ֲ����H�a��A�ͩǤΥ�ñ���
	
	SetPlot( OwnerID() , "range" ,"LuaDan_112757_Monster4",150)  
	--sleep(300)
	

end

----------------------------------------------------------------------------------------------------------------
function LuaDan_112757_Monster3() --�Ĥ@���I�ͩ�

--say(OwnerID(), "OwnerID") --���a	SetFlag( OwnerID()  , 542529 , 1 )  
--say(TargetID(), "TargetID") --���Ϊ���
	local Flag = CheckFlag(OwnerID()  , 542448)           --����_�ͥX��
	local Flag2 = CheckFlag(OwnerID()  , 542529)           --�T�O�^�Y�ɤ��|�A�ͩ�
	local Signflag2 = CheckFlag(OwnerID()  , 542548)      --�ĤG��ñ���I
	local MusicBox =  CountBodyItem( OwnerID() , 204426 ) --���ֲ�
	local Protect  = CheckFlag(OwnerID()  , 542551)       --�@�úX��
	local Monster = {}

	

		while  MusicBox ~= 0 and Flag == false and Signflag2 == false do
			
			sleep(10)	
	  		SetFlag( OwnerID()  , 542448 , 1 )--�קK����Ĳ�I�ͩ�

			 Monster[0] = CreateObjByFlag( 102003, 780333, 20, 2 )        --�Ȧ̴�
			 Monster[1] = CreateObjByFlag( 102003, 780333, 19, 2 )        --�Ȧ̴�
			 Monster[2] = CreateObjByFlag( 102003, 780333, 18, 2 )        --�Ȧ̴�
			ScriptMessage( OwnerID(), 0 , 1 , "[SC_DAN_SR_112757_MONSTER]" , C_SYSTEM ) --���I�Q�n�q�L�o��A���ݰݧڭ̭n���n���A�L�I�⭵�ֲ���X�ӡI
			--Say( TargetID() , "[SC_DAN_SR_112757_Monster]")  	

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
				--LuaFunc_MoveToFlag( Monster[i], 780303, 1, 0)          --�e�i����w�X

				--sleep(10)

	        		BeginPlot (Monster[i], "LuaDan_112757_Monster_Delete", 10) 	--�g�@�өǦ۰ʧR��
			SetPlot(Monster[i] , "dead" , "LuaDan_112757_MDeadScript" , 0 )
				--sleep(15)
			end
				--�~��ͩ�
			 Monster[3] = CreateObjByFlag( 102003, 780333, 23, 1)        --�մƻj��
			 Monster[4] = CreateObjByFlag( 102003, 780333, 22, 1 )        --�մƻj��
			 Monster[5] = CreateObjByFlag( 102003, 780333, 21, 1 )        --�մƻj��
		
				
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
				--LuaFunc_MoveToFlag( Monster[i], 780303, 1, 0)          --�e�i����w�X

				--sleep(10)

	        		BeginPlot (Monster[i], "LuaDan_112757_Monster_Delete", 10) 	--�g�@�өǦ۰ʧR��
			SetPlot(Monster[i] , "dead" , "LuaDan_112757_MDeadScript" , 0 )
				--sleep(15)
			end

			 Monster[6] = CreateObjByFlag( 102002, 780333, 24, 2 )        --������c��
			 Monster[7] = CreateObjByFlag( 102002, 780333, 25, 2 )        --������c��
			 Monster[8] = CreateObjByFlag( 102002, 780333, 26, 2 )        --������c��
		
				
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
				SetAttack( Monster[i] , OwnerID()  )
				AddBuff( Monster[i],502707 ,1 ,-1 )
				
				--sleep(10)
				
				--MoveToFlagEnabled( Monster[i] , false )                --���޼@����
                                --WriteRoleValue( Monster[i], EM_RoleValue_IsWalk, 0)    --����	
				--LuaFunc_MoveToFlag( Monster[i], 780303, 1, 0)          --�e�i����w�X

				--sleep(10)

	        		BeginPlot (Monster[i], "LuaDan_112757_Monster_Delete", 10) 	--�g�@�өǦ۰ʧR��
			SetPlot(Monster[i] , "dead" , "LuaDan_112757_MDeadScript" , 0 )
				--sleep(15)
			end
				
			
				--SetFlag( OwnerID()  , 542448 , 1 )--�קK����Ĳ�I�ͩ�

			break
		end


	
	--BeginPlot (OwnerID(), "LuaDan_112757_Signer", 10) 	--��ñ����s�X��
end  
----------------------------------------------------------------------------------------------------------------
function LuaDan_112757_Monster4() --�ĤG���I�ͩ�

	local Flag = CheckFlag(OwnerID()  , 542448)           --����_�ͥX��
	local Flag2 = CheckFlag(OwnerID()  , 542529)           --�T�O�^�Y�ɤ��|�A�ͩ�
	local Signflag2 = CheckFlag(OwnerID()  , 542548)      --�ĤG��ñ���I
	local Flag3 = CheckFlag(OwnerID()  , 542630) 
	local MusicBox =  CountBodyItem( OwnerID() , 204426 ) --���ֲ�
	local Protect  = CheckFlag(OwnerID()  , 542551)       --�@�úX��
	local Monster = {}



		while  MusicBox ~= 0 and Flag == true and Signflag2 == false and Flag3 ==false do
			
			sleep(10)	
	  		SetFlag( OwnerID()  , 542630 , 1 )--�A�ץͩ�

			
			 Monster[0] = CreateObjByFlag( 102004, 780333, 33, 1 )        --�򴶶�
			 Monster[1] = CreateObjByFlag( 102004, 780333, 34, 1 )        --�򴶶�
			 Monster[2] = CreateObjByFlag( 102004, 780333, 35, 1 )        --�򴶶�
			 Monster[3] = CreateObjByFlag( 102004, 780333, 32, 1 )        --�򴶶�
			 Monster[4] = CreateObjByFlag( 102004, 780333, 31, 1 )        --�򴶶�
			 Monster[5] = CreateObjByFlag( 102004, 780333, 30, 1 )        --�򴶶�
			 Monster[6] = CreateObjByFlag( 102004, 780333, 27,  1 )       --�򴶶�
			 Monster[7] = CreateObjByFlag( 102004, 780333, 28, 1 )        --�򴶶�
			 Monster[8] = CreateObjByFlag( 102004, 780333, 29, 1 )        --�򴶶�
			ScriptMessage( OwnerID(), 0 , 1 , "[SC_DAN_SR_112757_MONSTER2]" , C_SYSTEM ) --�S�Q��A���Z�F�`���I�L�o�F�e���A�L���F�ڭ̳o�����I
			--Say( TargetID() , "[SC_DAN_SR_112757_Monster2]")  	

			for i = 0, 8 do

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
				--LuaFunc_MoveToFlag( Monster[i], 780303, 1, 0)          --�e�i����w�X

				--sleep(10)

	        		BeginPlot (Monster[i], "LuaDan_112757_Monster_Delete", 10) 	--�g�@�өǦ۰ʧR��
			SetPlot(Monster[i] , "dead" , "LuaDan_112757_MDeadScript" , 0 )
				--sleep(15)
			end
				--�~��ͩ�
			 --Monster[9]  = CreateObjByFlag( 102001, 780333, 33, 1 )        --���ս���
			 --Monster[10] = CreateObjByFlag( 102001, 780333, 34, 1 )        --���ս���
			 --Monster[11] = CreateObjByFlag( 102001, 780333, 35, 1 )        --���ս���
			 --Monster[12] = CreateObjByFlag( 102001, 780333, 32, 1 )        --���ս���
			 --Monster[13] = CreateObjByFlag( 102001, 780333, 31, 1 )        --���ս���
			 --Monster[14] = CreateObjByFlag( 102001, 780333, 30, 1 )        --���ս���
			 --Monster[15] = CreateObjByFlag( 102001, 780333, 27,  1 )       --���ս���
			 --Monster[16] = CreateObjByFlag( 102001, 780333, 28, 1 )        --���ս���
			 --Monster[17] = CreateObjByFlag( 102001, 780333, 29, 1 )        --���ս���


			--for i = 9, 17 do

				--SetModeEx( Monster[i]   , EM_SetModeType_Strikback, true )--����
				--SetModeEx( Monster[i]   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
				--SetModeEx( Monster[i]   , EM_SetModeType_Obstruct, false )--����
				--SetModeEx( Monster[i]   , EM_SetModeType_Mark, true )--�аO
				--SetModeEx( Monster[i]   , EM_SetModeType_Move, true )--����
				--SetModeEx( Monster[i]   , EM_SetModeType_Searchenemy, true )--����
				--SetModeEx( Monster[i]    , EM_SetModeType_HideName, true )--�W��
				--SetModeEx( Monster[i] , EM_SetModeType_ShowRoleHead, true )--�Y����
				--SetModeEx( Monster[i], EM_SetModeType_Fight , true )--�i�������
				--SetModeEx( Monster[i]   , EM_SetModeType_Show , true ) --�����
				--AddToPartition( Monster[i]  , 0)  
				--SetAttack( Monster[i] , OwnerID()  )
				--AddBuff( Monster[i],502707 ,1 ,-1 )
				
				--sleep(10)
				
				--MoveToFlagEnabled( Monster[i] , false )                --���޼@����
                               			 --WriteRoleValue( Monster[i], EM_RoleValue_IsWalk, 0)    --����	
				--LuaFunc_MoveToFlag( Monster[i], 780303, 1, 0)          --�e�i����w�X

				--sleep(10)

	        		--BeginPlot (Monster[i], "LuaDan_112757_Monster_Delete", 10) 	--�g�@�өǦ۰ʧR��

				--sleep(15)
			--end
				
			
				--SetFlag( OwnerID()  , 542448 , 1 )--�קK����Ĳ�I�ͩ�

			break
		end
	--BeginPlot (OwnerID(), "LuaDan_112757_Signer", 10) 	--��ñ����s�X��
end  


----------------------------------------------------------------------------------------------------------------
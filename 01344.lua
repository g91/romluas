function LuaDan_112757_Openflag_1() --�����b���Ϊ���W�A�������ֲ����H�A�������W��flag
	
	SetPlot( OwnerID() , "range" ,"LuaDan_112757_Openflag_2",150)  
	--sleep(100)


end
----------------------------------------------------------------------------------------------------------------
function LuaDan_112757_Openflag_2() --����flag

	local Flag =      CheckFlag(OwnerID()  , 542448)           --����_�ͥX��
	local MusicBox =  CountBodyItem( OwnerID() , 204426 ) --���ֲ�

	while  MusicBox ~= 0 and Flag == true do

	sleep(20)
		SetFlag( OwnerID()  , 542448 , 0 )--�קK����Ĳ�I�ͩ�

	end

end
----------------------------------------------------------------------------------------------------------------
function LuaDan_112757_1() --�d��@���A�����ֲ����H�a��A�ͩǤΥ�ñ���
	
	SetPlot( OwnerID() , "range" ,"LuaDan_112757_Monster",150)  
	--sleep(300)
	

end

----------------------------------------------------------------------------------------------------------------
function LuaDan_112757_2() --�d��@���A�����ֲ����H�a��A�ͩǤΥ�ñ���
	
	SetPlot( OwnerID() , "range" ,"LuaDan_112757_Monster2",150)  
	--sleep(300)
	

end

----------------------------------------------------------------------------------------------------------------
function LuaDan_112757_Monster() --�Ĥ@���I�ͩ�

--say(OwnerID(), "OwnerID") --���a	SetFlag( OwnerID()  , 542529 , 1 )  
--say(TargetID(), "TargetID") --���Ϊ���
	local Flag = CheckFlag(OwnerID()  , 542448)           --����_�ͥX��
	local Flag2 = CheckFlag(OwnerID()  , 542529)           --�Ĥ@��ñ���I
	local MusicBox =  CountBodyItem( OwnerID() , 204426 ) --���ֲ�
	local Protect  = CheckFlag(OwnerID()  , 542551)       --�@�úX��
	local Monster = {}
	--local captial = OwnerID()
		--SetFlag( OwnerID()  , 542448 , 1 )--�קK����Ĳ�I�ͩ�


		while  MusicBox ~= 0 and Flag == false and Flag2 == false  do
			
			sleep(10)	
	  		SetFlag( OwnerID()  , 542448 , 1 )--�קK����Ĳ�I�ͩ�
		

			 Monster[0] = CreateObjByFlag( 101998, 780333, 5, 1 )        --�����L
			 Monster[1] = CreateObjByFlag( 101998, 780333, 6, 1 )        --�����L
			 Monster[2] = CreateObjByFlag( 101998, 780333, 7, 1 )        --�����L
			ScriptMessage( OwnerID(), 0 , 1 , "[SC_DAN_SR_112757_MONSTER]" , C_SYSTEM ) --���I�Q�n�q�L�o��A���ݰݧڭ̭n���n���A�L�I�⭵�ֲ���X�ӡI
			--Say( Monster[0], "[SC_DAN_SR_112757_Monster]")  	

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
				--LuaFunc_MoveToFlag( Monster[i], 780303, 0, 0)          --�e�i����w�X

				--sleep(10)

	        			BeginPlot (Monster[i], "LuaDan_112757_Monster_Delete", 10) 	--�g�@�өǦ۰ʧR��
				SetPlot(Monster[i] , "dead" , "LuaDan_112757_MDeadScript" , 0 )				

				--sleep(15)
			end
				--�~��ͩ�
			 Monster[3] = CreateObjByFlag( 102003, 780333, 2, 1 )        --�մƻj��
			 Monster[4] = CreateObjByFlag( 102003, 780333, 3, 1 )        --�մƻj��
			 Monster[5] = CreateObjByFlag( 102003, 780333, 4, 1 )        --�մƻj��
			
				
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
				--LuaFunc_MoveToFlag( Monster[i], 780303, 0, 0)          --�e�i����w�X

				--sleep(10)

	        		BeginPlot (Monster[i], "LuaDan_112757_Monster_Delete", 10) 	--�g�@�өǦ۰ʧR��
			SetPlot(Monster[i] , "dead" , "LuaDan_112757_MDeadScript" , 0 )


				--sleep(15)
			end

			 Monster[6] = CreateObjByFlag( 102006, 780333, 8, 1 )        --���g�T
			 Monster[7] = CreateObjByFlag( 102006, 780333, 0, 1 )        --���g�T
			 Monster[8] = CreateObjByFlag( 102006, 780333, 1, 1 )        --���g�T
		
				
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
				--LuaFunc_MoveToFlag( Monster[i], 780303, 0, 0)          --�e�i����w�X

				--sleep(10)

	        		BeginPlot (Monster[i], "LuaDan_112757_Monster_Delete", 10) 	--�g�@�өǦ۰ʧR��
			SetPlot(Monster[i] , "dead" , "LuaDan_112757_MDeadScript" , 0 )

				--sleep(15)
			end
				
			
				SetFlag( OwnerID()  , 542448 , 1 )--�קK����Ĳ�I�ͩ�

			break
		end

	
	
	--BeginPlot (OwnerID(), "LuaDan_112757_Signer", 10) 	--��ñ����s�X��
end  
----------------------------------------------------------------------------------------------------------------
function LuaDan_112757_Monster2() --�ĤG���I�ͩ�

	local Flag = CheckFlag(OwnerID()  , 542448)           --����_�ͥX��
	local Flag2 = CheckFlag(OwnerID()  , 542529)           --�T�O�^�Y�ɤ��|�A�ͩ�542560
	local Flag3 = CheckFlag(OwnerID()  , 542630) 
	local MusicBox =  CountBodyItem( OwnerID() , 204426 ) --���ֲ�
	local Protect  = CheckFlag(OwnerID()  , 542551)       --�@�úX��
	local Monster = {}

		--SetFlag( OwnerID()  , 542448 , 1 )--�קK����Ĳ�I�ͩ�


		while  MusicBox ~= 0 and Flag == true and Flag2 == false and Flag3 == false  do
			
			sleep(10)	
	  		 SetFlag( OwnerID()  , 542630 , 1 )--�A�ץͩ�

			 Monster[0] = CreateObjByFlag( 102001, 780333, 15, 1 )        --�w�f��ŧ�L
			 Monster[1] = CreateObjByFlag( 102001, 780333, 16, 1 )        --�w�f��ŧ�L
			 Monster[2] = CreateObjByFlag( 102001, 780333, 17, 1 )        --�w�f��ŧ�L
			 Monster[3] = CreateObjByFlag( 102001, 780333, 12, 1 )        --�w�f��ŧ�L
			 Monster[4] = CreateObjByFlag( 102001, 780333, 13, 1 )        --�w�f��ŧ�L
			 Monster[5] = CreateObjByFlag( 102001, 780333, 14, 1 )        --�w�f��ŧ�L
			 Monster[6] = CreateObjByFlag( 102001, 780333, 9,  1 )         --�w�f��ŧ�L
			 Monster[7] = CreateObjByFlag( 102001, 780333, 10, 1 )        --�w�f��ŧ�L
			 Monster[8] = CreateObjByFlag( 102001, 780333, 11, 1 )        --�w�f��ŧ�L

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
				--LuaFunc_MoveToFlag( Monster[i], 780303, 0, 0)          --�e�i����w�X

				--sleep(10)

	        		BeginPlot (Monster[i], "LuaDan_112757_Monster_Delete", 10) 	--�g�@�өǦ۰ʧR��
			SetPlot(Monster[i] , "dead" , "LuaDan_112757_MDeadScript" , 0 )

				--sleep(15)
			end
				--�~��ͩ�
			--Monster[9]  = CreateObjByFlag( 102001, 780333, 15, 1 )        --���ս���
			 --Monster[10] = CreateObjByFlag( 102001, 780333, 16, 1 )        --���ս���
			 --Monster[11] = CreateObjByFlag( 102001, 780333, 17, 1 )        --���ս���
			 --Monster[12] = CreateObjByFlag( 102001, 780333, 12, 1 )        --���ս���
			 --Monster[13] = CreateObjByFlag( 102001, 780333, 13, 1 )        --���ս���
			 --Monster[14] = CreateObjByFlag( 102001, 780333, 14, 1 )        --���ս���
			 --Monster[15] = CreateObjByFlag( 102001, 780333, 9,  1 )         --���ս���
			 --Monster[16] = CreateObjByFlag( 102001, 780333, 10, 1 )        --���ս���
			 --Monster[17] = CreateObjByFlag( 102001, 780333, 11, 1 )        --���ս���


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
				--LuaFunc_MoveToFlag( Monster[i], 780303, 0, 0)          --�e�i����w�X

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
function LuaDan_112757_Monster_Delete()

--say(OwnerID(), "OwnerID") --���a
--say(TargetID(), "TargetID") --���Ϊ���

	sleep(1200)
	DelObj( OwnerID())

end

function LuaDan_112757_MDeadScript() -- �Ǫ����`Ĳ�k�@��
--	Say(OwnerID(), " 1234") --monster
--	Say(TargetID(), " 5678") --player

	local Player = SearchRangePlayer ( OwnerID() , 300 )  -- ownerid = monster �j�M�Ǫ��P��150�������a
	for i=0,table.getn(Player),1 do
	--	Say(OwnerID(), Player[i] )
	--	Say(Player[i], i  )
		BeginPlot(Player[i], "Lua_mika_musicfes_giveticket"  ,0 )
	end
end

function Lua_mika_musicfes_giveticket() --
--	local Player = TargetID()
	local Player = OwnerID()
	local ItemNm = CountBodyItem(Player , 204526)
	local Flag1 =	 CheckFlag(Player  , 542520)          
	local Flag2 =	 CheckFlag(Player  , 542551)          
--	Say(OwnerID(), " 1233") --monster
--	Say( Player, " 4566") --player
	if CountBodyItem(Player , 204526) < 1 and (Flag1 == true or Flag2 == true ) then --�������ζ���flag
		GiveBodyItem ( Player  , 204526 , 1 )
	end
end

function lua_mika_musicfest_monsterborn()
	local Monster = CreateObjByFlag( 102003, 780333, 2, 1 )        --�մƻj��
	SetModeEx( Monster   , EM_SetModeType_Strikback, true )--����
	SetModeEx( Monster   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Monster   , EM_SetModeType_Obstruct, false )--����
	SetModeEx( Monster   , EM_SetModeType_Mark, true )--�аO
	SetModeEx( Monster   , EM_SetModeType_Move, true )--����
	SetModeEx( Monster   , EM_SetModeType_Searchenemy, true )--����
	SetModeEx( Monster  , EM_SetModeType_HideName, true )--�W��
	SetModeEx( Monster , EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( Monster, EM_SetModeType_Fight , true )--�i�������
	SetModeEx( Monster   , EM_SetModeType_Show , true ) --�����
	AddToPartition( Monster  , 0)  
	SetAttack( Monster , OwnerID()  )
	SetPlot(Monster , "dead" , "LuaDan_112757_MDeadScript" , 0 )
end
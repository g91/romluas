function LuaI_101022_0()

	sleep(20)

	local HideMonster1 = LuaFunc_SearchNPCbyOrgID(OwnerID(), 100693, 200 , 1)       --�d��@���G���ì����_�c
	local HideMonster2 = LuaFunc_SearchNPCbyOrgID(HideMonster1[0] , 100694, 200 , 1)       --�d��@���G���õ����_�c

	M1 = CreateObjByFlag( 101030, 780097, 5 , 1 );            --��
	M2 = CreateObjByFlag( 101030, 780097, 6 , 1 );            --��


	SetModeEx( M1  , EM_SetModeType_Strikback, false )--����
	SetModeEx( M1  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( M1  , EM_SetModeType_Obstruct, true )--����
	SetModeEx( M1  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( M1  , EM_SetModeType_Move, false )--����
	SetModeEx( M1  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( M1  , EM_SetModeType_HideName, true )--�W��
	SetModeEx( M1  , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( M1  , EM_SetModeType_Fight , false )--�i�������

	Hide(M1)
	Show(  M1 , 0)
	AddToPartition( M1 , 0) 

	SetModeEx( M2  , EM_SetModeType_Strikback, false )--����
	SetModeEx( M2  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( M2  , EM_SetModeType_Obstruct, true )--����
	SetModeEx( M2  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( M2  , EM_SetModeType_Move, false )--����
	SetModeEx( M2  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( M2  , EM_SetModeType_HideName, true )--�W��
	SetModeEx( M2  , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( M2  , EM_SetModeType_Fight , false )--�i�������

	Hide(M2)
	Show(  M2 , 0)
	AddToPartition( M2 , 0) 


	WriteRoleValue(  OwnerID() , EM_RoleValue_Register+5 , M1)
	WriteRoleValue(  OwnerID() , EM_RoleValue_Register+6 , M2)
	BeginPlot( HideMonster2[0] , "LuaI_101024_1" , 0 )    
                SetPlot( OwnerID(),"range", "LuaI_101022_1" , 100 )                                      --�]�w�@��
                
end

function LuaI_101022_1()

	local QQ = CheckAcceptQuest( OwnerID(), 421458 );                                        --�P�_�Ө��⦳�S��������

	if QQ == true and CheckFlag( OwnerID()  , 542179 ) == false  then            --�P�_���Ѧ��S�����L�����g���S��������		

		SetPlot( TargetID(),"range","",0 )                                                                     --���@�Ӫŭ�function�A�����A��Ĳ�o�d��@�����i��C     
		BeginPlot( TargetID() , "LuaI_101022_2" , 0 )                                                   --�R�O���w����I�s Script

	end
end

function LuaI_101022_2()     	   --TargetID() ���a
	

--	local QQ = CheckAcceptQuest( TargetID(), 421458 );                                        --�P�_�Ө��⦳�S��������

--	if QQ == true and CheckFlag( TargetID()  , 541589 ) == false  then    --�P�_���Ѧ��S�����L�����g���S��������		
--		SetFlag( TargetID()  , 542179, 1 )	--�S���L���X��	
	
		local HideMonster1 = LuaFunc_SearchNPCbyOrgID(OwnerID(), 100693, 200 , 1)       --�d��@���G���ì����_�c
		local HideMonster2 = LuaFunc_SearchNPCbyOrgID(HideMonster1[0] , 100694, 200 , 1)       --�d��@���G���õ����_�c
		local Samog = LuaFunc_SearchNPCbyOrgID(HideMonster2[0] , 101022, 200 , 1)       --�ļ���
		local Solay = LuaFunc_SearchNPCbyOrgID(HideMonster2[0] , 101027, 200 , 1)       --�ļ��檺��U		
		local EYE01 = LuaFunc_SearchNPCbyOrgID(HideMonster2[0] , 101025, 200 , 1)             --���
		local EYE02 = LuaFunc_SearchNPCbyOrgID(HideMonster2[0] , 101026, 200 , 1)             --���
		local Minotaur = LuaFunc_SearchNPCbyOrgID(HideMonster2[0] , 101024, 200 , 1)             --�Ԥ����q
		local Golu= LuaFunc_SearchNPCbyOrgID( HideMonster2[0] , 101028, 200 , 1)             --���ìI�k�ؼ�


		WriteRoleValue( HideMonster1[0] , EM_RoleValue_PID , OwnerID())

--		WriteRoleValue( HideMonster2[0] ,EM_RoleValue_PID , 0 )

	sleep(10)
 		BeginPlot( Golu[0] , "LuaI_101024_2" , 0 )                                                   --���w�����_�c��{���q

		if Samog[0] == -1 or  Samog[0] == nil  then                                         --�p�G�ļ��椣�s�b�N����
			Samog = CreateObjByFlag( 101022, 780097, 0 , 1 );            
 			SetFightMode(  Samog , 0, 0, 0, 0 )
			AddToPartition( Samog  , 0) 

			if CheckBuff( Samog , 500900 ) == false then                                                                       --�ˬd�ثe�O�_����buff
				CastSpell( Golu[0] , Golu[0], 490101)                                                              
			end

		end

		if Solay[0] == -1 or  Solay[0] == nil  then

			Solay1 = CreateObjByFlag( 101027, 780097, 1 , 1 );            --���ͤ�U1 
 			SetFightMode(  Solay1 , 0, 0, 0, 0 )			
			AddToPartition( Solay1 , 0) 
			SetPlot( Solay1 , "dead","LuaI_101022_3",0 )
		end

		if Solay[1] == -1 or  Solay[1] == nil  then
			Solay2 = CreateObjByFlag( 101027, 780097, 2 , 1 );            --���ͤ�U2
 			SetFightMode(  Solay2 , 0, 0, 0, 0 )
			AddToPartition( Solay2 , 0) 
			SetPlot( Solay2 , "dead","LuaI_101022_3",0 )
		end

		if EYE01[0] == -1 or  EYE01[0] == nil  then
			EYE01 = CreateObjByFlag( 101025, 780097, 3 , 1 );            --���ͽ��
 			SetFightMode(  EYE01, 0, 0, 0, 0 )
			AddToPartition( EYE01 , 0) 

		end

		if EYE02[0] == -1 or  EYE02[0] == nil  then
			EYE02 = CreateObjByFlag( 101026, 780097, 4 , 1 );            --���ͽ��
 			SetFightMode(  EYE02 , 0, 0, 0, 0 )
			AddToPartition( EYE02 , 0) 


		end



		WriteRoleValue(  HideMonster1[0] , EM_RoleValue_Register+5 , ReadRoleValue( OwnerID(),  EM_RoleValue_Register+5  ))
		WriteRoleValue(  HideMonster1[0] , EM_RoleValue_Register+6 , ReadRoleValue( OwnerID(),  EM_RoleValue_Register+6  ))
	
		sleep(30)

		BeginPlot( HideMonster1[0] , "LuaI_101022_2_2" , 0 )      

--	end

end

function LuaI_101022_3()  
			BeginPlot( OwnerID() , "LuaI_101022_4" , 0 )        
end

function LuaI_101022_4()  
			BeginPlot( OwnerID() , "LuaP_Dead" , 0 )        
			sleep(30)
			Delobj( OwnerID() )
end
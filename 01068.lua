
function LuaYU_NewPlayerPaPaGo_00()
	local RoomID = ReadRoleValue(  OwnerID() ,EM_RoleValue_RoomID) 
	local CheckPlayer = CreateObjByFlag( 101826, 780236, 31 , 1 );  --�ˬd���a��
	SetModeEx( CheckPlayer, EM_SetModeType_Fight , false )--�i�������
	SetModeEx( CheckPlayer, EM_SetModeType_Strikback, false )--����
	SetModeEx( CheckPlayer, EM_SetModeType_Mark, false )--�аO
	SetModeEx( CheckPlayer, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( CheckPlayer, EM_SetModeType_Obstruct, false )--����
	SetModeEx( CheckPlayer, EM_SetModeType_Gravity, false )--���O
	SetModeEx( CheckPlayer, EM_SetModeType_Move, false )--����
	SetModeEx( CheckPlayer, EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( CheckPlayer, EM_SetModeType_Searchenemy, false )--����
	SetModeEx( CheckPlayer, EM_SetModeType_Show, false )--���
	AddToPartition( CheckPlayer, RoomID) 
	BeginPlot(  CheckPlayer , "LuaYU_NewPlayerCheckPlayer" , 0 )                                               --�R�O���w����I�s Script
	local Player = SearchRangePlayer( OwnerID() , 100 )


	local spiderwater =  CountBodyItem( Player[0]  , 204180 ) --�� �j����r�G
	local missionOK =  CheckFlag( Player[0]  , 542482 ) --��������

	if missionOK == false then

		SetFlag(  Player[0]   , 542482 , 1 ) --�غX�е����n���~
		BeginPlot(  OwnerID() , "LuaYU_NewPlayerPaPaGo_00_1" , 0 )                                               --�R�O���w����I�s Script

	elseif missionOK == true and spiderwater == 1 then
		sleep(10)
		Say( OwnerID() , "[SC_YU_NEWPLAYERGO_17]"  )         --��ť�ڪ��p�_���̻��A�A�w�g�⨺�ǰQ�����j�ﻰ�]�F�I�H�o�O�u���ܡH

	elseif missionOK == true then
		sleep(10)
		Say( OwnerID() , "[SC_YU_NEWPLAYERGO_16]"  )         --����@���N���U�A�F
	end

end




function LuaYU_NewPlayerPaPaGo_00_1()

	sleep(10)

	local Player = SearchRangePlayer( OwnerID() , 100 )
	local RoomID = ReadRoleValue(  OwnerID() ,EM_RoleValue_RoomID) 
	local Playername = "|cffffff20"..GetName( Player[0] ).."|r"

	local pet = "[SC_YU_NEWPLAYERGO_14][$SETVAR1="..Playername.."]"
	Say( OwnerID() , pet  )         --�p�_�֥X��	

	local ABow = CreateObjByFlag( 101826, 780236, 31 , 1 );  --�p�_
	AddToPartition( ABow, RoomID) 

	SetModeEx( ABow   , EM_SetModeType_Strikback, false )--����
	SetModeEx( ABow   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( ABow   , EM_SetModeType_Obstruct, false )--����
	SetModeEx( ABow   , EM_SetModeType_Mark, true )--�аO
	SetModeEx( ABow   , EM_SetModeType_Move, true )--����
	SetModeEx( ABow   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( ABow   , EM_SetModeType_HideName, false )--�W��
	SetModeEx( ABow   , EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( ABow   , EM_SetModeType_Show , true ) --�����
	SetModeEx( ABow   , EM_SetModeType_Fight , false )--�i�������

	Hide( ABow )
	Show( ABow ,RoomID )

	WriteRoleValue(  Player[0]  , EM_RoleValue_Register+8 ,  ABow ) --�O��p�_

	local RangeOpen = CreateObjByFlag( 100044, 780236, 6 , 1 );  --�d��Ĳ�I
	AddToPartition( RangeOpen, RoomID) 

	SetModeEx( RangeOpen   , EM_SetModeType_Strikback, false )--����
	SetModeEx( RangeOpen   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( RangeOpen   , EM_SetModeType_Obstruct, false )--����
	SetModeEx( RangeOpen   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( RangeOpen   , EM_SetModeType_Move, false )--����
	SetModeEx( RangeOpen   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( RangeOpen   , EM_SetModeType_HideName, true )--�W��
	SetModeEx( RangeOpen   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( RangeOpen   , EM_SetModeType_Show , false ) --�����
	SetModeEx( RangeOpen   , EM_SetModeType_Fight , false )--�i�������

	Hide( RangeOpen )
	Show( RangeOpen ,RoomID )


	sleep(10)

                SetPlot( RangeOpen,"range", "LuaYU_NewPlayerPaPaGo_01" , 50 )                                      --�]�w�@��

	MoveToFlagEnabled( ABow , false )
	WriteRoleValue(ABow ,EM_RoleValue_IsWalk , 0 ) --�R�O�Ө��ⳣ�Ψ���(  �]�h�] 0 )


	LuaFunc_MoveToFlag( ABow , 780236 , 32 , 0 )
	LuaFunc_MoveToFlag( ABow , 780236 , 25 , 0 )

	AdjustFaceDir(ABow, Player[0]   , 0 ) --���V

	local pet2 = "[SC_YU_NEWPLAYERGO_15][$SETVAR1="..Playername.."]"
	Say( OwnerID() , pet2  )         --�o�O�p�_
	sleep(10)

	PlayMotion( ABow, 56) --����	
	local str = "[SC_YU_NEWPLAYERGO_01][$SETVAR1="..Playername.."]"

	Say( ABow , str  )         --���֥h�ϧڭ���~
	sleep(30)

	LuaFunc_MoveToFlag( ABow , 780236 , 6 , 0 )
	Say( ABow, "[SC_YU_NEWPLAYERGO_02]" )--�b�A�k�U�誺���̭������Ʀr�A�ӼƦr�����ۧA��L���W�誺�Ʀr��I�I��������Ʀr��N�i�H��ޯ��I

	sleep(20)
	LuaFunc_MoveToFlag( ABow , 780236 , 33 , 0 )
	Say( ABow,  "[SC_YU_NEWPLAYERGO_03]"  )-- �p��ϥΧޯ�

	sleep(20)
	LuaFunc_MoveToFlag( ABow , 780236 , 30 , 0 )
	Say( ABow,  "[SC_YU_NEWPLAYERGO_04]"  )-- �p���ؼ�

	SetPosByFlag( ABow , 780236 , 30 )
	MoveToFlagEnabled( ABow , false )
	sleep(20)
	SetFollow( ABow, Player[0]   )

	SetModeEx( ABow   , EM_SetModeType_Strikback, true )--����
	SetModeEx( ABow   , EM_SetModeType_Searchenemy, true )--����
	SetModeEx( ABow   , EM_SetModeType_Fight , true )--�i�������

	Hide( ABow )
	Show( ABow ,RoomID )

--	local Sp = LuaFunc_SearchNPCbyOrgID( ABow , 101627, 300 , 1) 
--	SetAttack( ABow , Sp[1] )
--	BeginPlot( ABow , "LuaYU_NewPlayerPaPa_attack" , 0 )    

end

function LuaYU_NewPlayerPaPaGo_01()

--	Say(OwnerID(),"OwnerID=1" )--���a
--	Say(TargetID(),"TargetID=2" )--NPC
	
	
		SetPlot( TargetID(),"range","",0 )                                                                     --���@�Ӫŭ�function�A�����A��Ĳ�o�d��@�����i��C     
		BeginPlot( TargetID() , "LuaYU_NewPlayerPaPaGo_02" , 0 )                                                   --�R�O���w����I�s Script

end


function LuaYU_NewPlayerPaPaGo_02()

	local RoomID = ReadRoleValue(  OwnerID() ,EM_RoleValue_RoomID) 
	local Player = SearchRangePlayer( OwnerID() , 300 )
	local MaxHP = ReadRoleValue( Player[0] , EM_RoleValue_MaxHP )
	local MaxMP = ReadRoleValue( Player[0] , EM_RoleValue_MaxMP )
	local Playername = "|cffffff20"..GetName( Player[0] ).."|r"

	local ABow = ReadRoleValue( Player[0]  , EM_RoleValue_Register+8  )

	MoveToFlagEnabled( ABow , false )

--	Say(OwnerID(),"OwnerID=3" )--NPC
--	Say(TargetID(),"TargetID=4" )--���a
--	Say(Player[0],"Player=5")--���a


	local Bow01 = CreateObjByFlag( 101704, 780236, 1 , 1 );  --�j�_
	AddToPartition( Bow01, RoomID) 
	SetModeEx( Bow01  , EM_SetModeType_Strikback, false )--����

	local Bow02 = CreateObjByFlag( 101705, 780236, 0 , 1 ); 
	AddToPartition( Bow02, RoomID) 
	SetModeEx( Bow02  , EM_SetModeType_Strikback, false )--����

	local Bow03 = CreateObjByFlag( 101706, 780236, 2 , 1 );  
	AddToPartition( Bow03, RoomID) 
	SetModeEx( Bow03  , EM_SetModeType_Strikback, false )--����


	local Sp01 = CreateObjByFlag( 101627, 780236, 3 , 1 );  --�j��
	AddToPartition( Sp01, RoomID) 

	local Sp02 = CreateObjByFlag( 101627, 780236, 5 , 1 ); 
	AddToPartition( Sp02, RoomID) 

	local Sp03 = CreateObjByFlag( 101627, 780236, 4 , 1 );  
	AddToPartition( Sp03, RoomID) 

	SetAttack( Sp01 , Bow01 )
	SetAttack( Sp02 , Bow02 )
	SetAttack( Sp03 , Bow03 )
--	SetAttack( ABow , Sp03 )



	while true do
	sleep(10)	
--		Player = SearchRangePlayer( OwnerID() , 100 )
		local HP = ReadRoleValue( Player[0] , EM_RoleValue_HP )
		local MP = ReadRoleValue( Player[0] , EM_RoleValue_MP )

		local AttackTarget = ReadRoleValue( Player[0] , EM_RoleValue_AttackTargetID )


		if HP/MaxHP < 0.8 then

			WriteRoleValue( Player[0] , EM_RoleValue_HP , MaxHP )   

		end

		if MP/MaxMP < 0.8 then

			WriteRoleValue( Player[0] , EM_RoleValue_MP , MaxMP )   

		end



--		if CheckBuff( Player[0] , 502942 ) == false then      
--			AddBuff( Player[0] ,502942 ,1 ,30 ); --�Ĥ�	
--		end

--		if CheckBuff( Player[0] , 503047 ) == false then      
--			AddBuff( Player[0] ,503047 ,1 ,30 ); --�Ĥ�	
--		end



		if ReadRoleValue( Sp01 , EM_RoleValue_IsDead ) == 1 or CheckID( Sp01 ) == false or ReadRoleValue( Sp01 , EM_RoleValue_IsPlayer ) == 1 then
			if ReadRoleValue( Sp02 , EM_RoleValue_IsDead ) == 1 or CheckID( Sp02 ) == false or ReadRoleValue( Sp02 , EM_RoleValue_IsPlayer ) == 1 then
				if ReadRoleValue( Sp03 , EM_RoleValue_IsDead ) == 1 or CheckID( Sp03 ) == false or ReadRoleValue( Sp03 , EM_RoleValue_IsPlayer ) == 1 then

					sleep(20)

					SetFollow( ABow , Bow01  )
					Say( ABow ,  "[SC_YU_NEWPLAYERGO_05]"  )-- �I�]�ϥαо�
					break
				end
			end
		end
	


	end


	local SPKING = CreateObjByFlag( 101729, 780236, 14 , 1 );  --�j���

	while true do
		sleep(10)


		local HP = ReadRoleValue( Player[0] , EM_RoleValue_HP )
		local MP = ReadRoleValue( Player[0] , EM_RoleValue_MP )
--		local ABow = LuaFunc_SearchNPCbyOrgID( Player[0] , 101826, 300 , 1) 

		local AttackTarget = ReadRoleValue( Player[0] , EM_RoleValue_AttackTargetID )




		if HP/MaxHP < 0.8 then

			WriteRoleValue( Player[0] , EM_RoleValue_HP , MaxHP )   

		end

		if MP/MaxMP < 0.8 then

			WriteRoleValue( Player[0] , EM_RoleValue_MP , MaxMP )   

		end




		if ReadRoleValue( Sp01 , EM_RoleValue_IsDead ) == 1 or CheckID( Sp01 ) == false or ReadRoleValue( Sp01 , EM_RoleValue_IsPlayer ) == 1 then
			if ReadRoleValue( Sp02 , EM_RoleValue_IsDead ) == 1 or CheckID( Sp02 ) == false or ReadRoleValue( Sp02 , EM_RoleValue_IsPlayer ) == 1 then
				if ReadRoleValue( Sp03 , EM_RoleValue_IsDead ) == 1 or CheckID( Sp03 ) == false or ReadRoleValue( Sp03 , EM_RoleValue_IsPlayer ) == 1 then




					local HP = ReadRoleValue( Player[0] , EM_RoleValue_HP )
					local MP = ReadRoleValue( Player[0] , EM_RoleValue_MP )


			
					ScriptMessage(OwnerID(), -1 , 1 , "[SC_YU_NEWPLAYERGO_06]" , C_Default )  --����ǨӤ@�}�O�H�o�H����ķ�n...<CM>[101729]</CM>�e�ӴM���F�I
					ScriptMessage(OwnerID(), -1 , 0 , "[SC_YU_NEWPLAYERGO_06]" , C_Default )  --����ǨӤ@�}�O�H�o�H����ķ�n...<CM>[101729]</CM>�e�ӴM���F�I

					sleep(30)	


					AddToPartition( SPKING, RoomID) 
					MoveToFlagEnabled( SPKING  , false )
--					BeginPlot( SPKING , "LuaYU_NewPlayerPaPaGo_03" , 0 )         


					local Sp04 = CreateObjByFlag( 101627, 780236, 15 , 1 );  --�j��
					AddToPartition( Sp04, RoomID) 
					MoveToFlagEnabled( Sp04  , false )


					local Sp05 = CreateObjByFlag( 101627, 780236, 17 , 1 ); 
					AddToPartition( Sp05, RoomID) 
					MoveToFlagEnabled( Sp05  , false )


					local Sp06 = CreateObjByFlag( 101627, 780236, 18 , 1 );  
					AddToPartition( Sp06, RoomID) 
					MoveToFlagEnabled( Sp06  , false )


					local Sp07 = CreateObjByFlag( 101627, 780236, 15 , 1 );  
					AddToPartition( Sp07, RoomID) 
					MoveToFlagEnabled( Sp07  , false )


					local Sp08 = CreateObjByFlag( 101627, 780236, 17 , 1 );  
					AddToPartition( Sp08, RoomID) 
					MoveToFlagEnabled( Sp08  , false )
  

					local Sp09 = CreateObjByFlag( 101627, 780236, 18 , 1 );  
					AddToPartition( Sp09, RoomID) 
					MoveToFlagEnabled( Sp09  , false )


					sleep(10)

					SetAttack( SPKING, Bow01   ) --�X�нs��14
					SetAttack( Sp04, Bow01  ) --�X�нs��14
					SetAttack( Sp05, Bow02  ) --�X�нs��14
					SetAttack( Sp06, Bow03   ) --�X�нs��14
					SetAttack( Sp07, Bow01   ) --�X�нs��14
					SetAttack( Sp08, Bow02   ) --�X�нs��14
					SetAttack( Sp09, Bow03   ) --�X�нs��14


					ScriptMessage(OwnerID(), -1 , 1 , "[SC_YU_NEWPLAYERGO_07]" , C_Default )  --�A�A~
					ScriptMessage(OwnerID(), -1 , 0 , "[SC_YU_NEWPLAYERGO_07]" , C_Default )  --�A�A~



					WriteRoleValue( Player[0] , EM_RoleValue_HP , MaxHP )   




					Say( ABow ,  "[SC_YU_NEWPLAYERGO_08]"  )-- ���Ω�

					sleep(20)

						WriteRoleValue( Player[0] , EM_RoleValue_HP , MaxHP )   

					SetAttack( SPKING , Bow02 )
					SetAttack( Sp04 , Bow01 )
					SetAttack( Sp05 , Bow02 )
					SetAttack( Sp06 , Bow03 )
					SetAttack( Sp07 , Bow01 )
					SetAttack( Sp08 , Bow02 )
					SetAttack( Sp09 , Bow03 )

					sleep(30)
					WriteRoleValue( Player[0] , EM_RoleValue_HP , MaxHP )   
					sleep(30)
					WriteRoleValue( Player[0] , EM_RoleValue_HP , MaxHP )   

					CastSpelllv( SPKING , SPKING , 492766, 1)

					sleep(10)	
					ScriptMessage(OwnerID(), -1 , 1 , "[SC_YU_NEWPLAYERGO_09]" , C_SYSTEM )  --��UĨۣ�H���h<CM>[101729]</CM>!
					ScriptMessage(OwnerID(), -1 , 0 , "[SC_YU_NEWPLAYERGO_09]" , C_SYSTEM )  --��UĨۣ�H���h<CM>[101729]</CM>!


					WriteRoleValue( Player[0] , EM_RoleValue_HP , MaxHP )   

					sleep(30)


					WriteRoleValue( Player[0] , EM_RoleValue_HP , MaxHP )   


					sleep(30)


					WriteRoleValue( Player[0] , EM_RoleValue_HP , MaxHP )   



					Say( Bow01,  "[SC_YU_NEWPLAYERGO_10]"  )-- ���
					Say( Bow02,  "[SC_YU_NEWPLAYERGO_10]"  )-- ���
					Say( Bow03,  "[SC_YU_NEWPLAYERGO_10]"  )-- ���



					SetStopAttack( Bow01 ) 
					SetStopAttack( Bow02 ) 
					SetStopAttack( Bow03 ) 


					SetAttack( Bow01 , SPKING )
					SetAttack( Bow02 , SPKING )
					SetAttack( Bow03 , SPKING )
					SetAttack( ABow  , SPKING )

--					AddBuff( Bow01 ,503048 ,1 ,-1 ); --�ܤj 2.5
--					PlayMotion( Bow01, 163) 

--					AddBuff( Bow02 ,503048 ,1 ,-1 ); --�ܤj 2.5
--					PlayMotion( Bow02, 163) 

--					AddBuff( Bow03 ,503048 ,1 ,-1 ); --�ܤj 2.5
--					PlayMotion( Bow03, 163) 

					sleep(20)	

					CastSpelllv( Bow01 ,Bow01, 492130, 1)
					CastSpelllv( Bow02 ,Bow02, 492130, 1)
					CastSpelllv( Bow03 ,Bow03, 492130, 1)

					sleep(20)	

					SetAttack( Bow01 , SPKING )
					SetAttack( Bow02 , SPKING )
					SetAttack( Bow03 , SPKING )
					SetAttack( ABow  , SPKING )

					WriteRoleValue( Player[0] , EM_RoleValue_HP , MaxHP )   


					SetStopAttack( Sp04 ) 
					SetStopAttack( Sp05 ) 
					SetStopAttack( Sp06 ) 
					SetStopAttack( Sp07 ) 
					SetStopAttack( Sp08 ) 
					SetStopAttack( Sp09 ) 

					BeginPlot( Sp04 , "LuaP_Dead" , 0 )   
					BeginPlot( Sp05 , "LuaP_Dead" , 0 )   
					BeginPlot( Sp06 , "LuaP_Dead" , 0 )   
					BeginPlot( Sp07 , "LuaP_Dead" , 0 )   
					BeginPlot( Sp08 , "LuaP_Dead" , 0 )   
					BeginPlot( Sp09 , "LuaP_Dead" , 0 )   

					sleep(30)

					Delobj( Sp04 )
					Delobj( Sp05 )
					Delobj( Sp06 )
					Delobj( Sp07 )
					Delobj( Sp08 )
					Delobj( Sp09 )

					break


				end
			end
		end
	end	



	while true do
		sleep(10)


		local HP = ReadRoleValue( Player[0] , EM_RoleValue_HP )
		local MP = ReadRoleValue( Player[0] , EM_RoleValue_MP )
--		local ABow = LuaFunc_SearchNPCbyOrgID( Player[0] , 101826, 300 , 1) 

		local AttackTarget = ReadRoleValue( Player[0] , EM_RoleValue_AttackTargetID )


		if HP/MaxHP < 0.8 then

			WriteRoleValue( Player[0] , EM_RoleValue_HP , MaxHP )   

		end

		if MP/MaxMP < 0.8 then

			WriteRoleValue( Player[0] , EM_RoleValue_MP , MaxMP )   

		end

		if ReadRoleValue( SPKING , EM_RoleValue_IsDead ) == 1 or CheckID( SPKING ) == false or ReadRoleValue( SPKING , EM_RoleValue_IsPlayer ) == 1 then

			local RangeOpen = CreateObjByFlag( 100044, 780236, 6 , 1 );  --�d��Ĳ�I
			AddToPartition( RangeOpen, RoomID) 

			SetModeEx( RangeOpen   , EM_SetModeType_Strikback, false )--����
			SetModeEx( RangeOpen   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
			SetModeEx( RangeOpen   , EM_SetModeType_Obstruct, false )--����
			SetModeEx( RangeOpen   , EM_SetModeType_Mark, false )--�аO
			SetModeEx( RangeOpen   , EM_SetModeType_Move, false )--����
			SetModeEx( RangeOpen   , EM_SetModeType_Searchenemy, false )--����
			SetModeEx( RangeOpen   , EM_SetModeType_HideName, true )--�W��
			SetModeEx( RangeOpen   , EM_SetModeType_ShowRoleHead, false )--�Y����
			SetModeEx( RangeOpen   , EM_SetModeType_Show , false ) --�����
			SetModeEx( RangeOpen   , EM_SetModeType_Fight , false )--�i�������

			Hide( RangeOpen )
			Show( RangeOpen ,RoomID )

			WriteRoleValue(  RangeOpen , EM_RoleValue_PID  , 5  )	

		                SetPlot( RangeOpen,"range", "LuaYU_NewPlayerPaPaGo_102" , 50 )                                      --�]�w�@��


			GiveBodyItem( Player[0]  ,  204180  , 1 ) --�j��r�G

			SetModeEx( ABow    , EM_SetModeType_Strikback, true )--����
			SetModeEx( ABow    , EM_SetModeType_Searchenemy, true )--����
			SetModeEx( ABow    , EM_SetModeType_Fight , true )--�i�������
			Hide( ABow  )
			Show( ABow  ,RoomID )

			SetModeEx( Bow01   , EM_SetModeType_Strikback, true )--����
			SetModeEx( Bow01   , EM_SetModeType_Searchenemy, true )--����
			SetModeEx( Bow01   , EM_SetModeType_Fight , true )--�i�������
			Hide( Bow01 )
			Show( Bow01 ,RoomID )


			SetModeEx( Bow02   , EM_SetModeType_Strikback, true )--����
			SetModeEx( Bow02   , EM_SetModeType_Searchenemy, true )--����
			SetModeEx( Bow02   , EM_SetModeType_Fight , true )--�i�������
			Hide( Bow02 )
			Show( Bow02 ,RoomID )

			SetModeEx( Bow03   , EM_SetModeType_Strikback, true )--����
			SetModeEx( Bow03   , EM_SetModeType_Searchenemy, true )--����
			SetModeEx( Bow03   , EM_SetModeType_Fight , true )--�i�������
			Hide( Bow03 )
			Show( Bow03 ,RoomID )

			sleep(10)

			BeginPlot( ABow  , "LuaYU_NewPlayerPaPaGo_04" , 0 )    
			BeginPlot( Bow01 , "LuaYU_NewPlayerPaPaGo_04" , 0 )    
			BeginPlot( Bow02 , "LuaYU_NewPlayerPaPaGo_04" , 0 )    
			BeginPlot( Bow03 , "LuaYU_NewPlayerPaPaGo_04" , 0 )    


			local strcool = "[SC_YU_NEWPLAYERGO_11][$SETVAR1="..Playername.."]"

			if CheckBuff( Bow01 , 502189 ) == true then      
				CancelBuff( Bow01 , 502189 )
			end
			if CheckBuff( Bow02 , 502189 ) == true then      
				CancelBuff( Bow02 , 502189 )
			end
			if CheckBuff( Bow03 , 502189 ) == true then      
				CancelBuff( Bow03 , 502189 )
			end

			AdjustFaceDir(ABow , Player[0]   , 0 ) --���V
			AdjustFaceDir(Bow01, Player[0]   , 0 ) --���V
			AdjustFaceDir(Bow02, Player[0]   , 0 ) --���V
			AdjustFaceDir(Bow03, Player[0]   , 0 ) --���V



			Say( ABow , strcool )--�F���j����P

--			Say( Bow01, strcool )--�F���j����P

--			Say( Bow02, strcool )--�F���j����P

--			Say( Bow03, strcool )--�F���j����P

			Sleep(50)

			Say( ABow , "[SC_YU_NEWPLAYERGO_12]" )


			SetStopAttack( Bow01 ) 
			SetStopAttack( Bow02 ) 
			SetStopAttack( Bow03 ) 


			BeginPlot( Bow01 , "LuaYU_NewPlayerPaPaGo_05" , 0 )    
			BeginPlot( Bow02 , "LuaYU_NewPlayerPaPaGo_06" , 0 )    
			BeginPlot( Bow03 , "LuaYU_NewPlayerPaPaGo_07" , 0 )    
			BeginPlot( ABow  , "LuaYU_NewPlayerPaPaGo_08" , 0 )    


			break

--		else
--			SetAttack( SPKING , Bow01 )
		end

	end



end

function LuaYU_NewPlayerPaPaGo_03() --  �j���
	local Player = SearchRangePlayer( OwnerID() , 100 )


	LuaFunc_MoveToFlag( OwnerID() , 780236 , 14 , 0 )
	LuaFunc_MoveToFlag( OwnerID() , 780236 , 15 , 0 )
	LuaFunc_MoveToFlag( OwnerID() , 780236 , 16 , 0 )

	sleep(10)	
	SetAttack(  OwnerID(), Player[0] )

end

function LuaYU_NewPlayerPaPaGo_04()

	local Player = SearchRangePlayer( OwnerID() , 100 )

	AdjustFaceDir( OwnerID() , Player[0]   , 0 ) --���V

	PlayMotion( OwnerID(), 163) 
	sleep(20)

	AdjustFaceDir( OwnerID() , Player[0]   , 0 ) --���V
	PlayMotion( OwnerID(), 122) 

--	sleep(10)
--	AdjustFaceDir( OwnerID() , Player[0]   , 0 ) --���V
--	PlayMotion( OwnerID(), 56) 

end


function LuaYU_NewPlayerPaPaGo_05() -- �H�k

	WriteRoleValue(OwnerID() ,EM_RoleValue_IsWalk , 0 ) --�R�O�Ө��ⳣ�Ψ���(  �]�h�] 0 )
	MoveToFlagEnabled( OwnerID()  , false )
	LuaFunc_MoveToFlag( OwnerID() , 780236 , 6 , 0 )
	LuaFunc_MoveToFlag( OwnerID() , 780236 , 26 , 0 )
	SetPosByFlag( OwnerID(), 780236 , 26 )

end

function LuaYU_NewPlayerPaPaGo_06() --�T1

	WriteRoleValue(OwnerID() ,EM_RoleValue_IsWalk , 0 ) --�R�O�Ө��ⳣ�Ψ���(  �]�h�] 0 )
	MoveToFlagEnabled( OwnerID()  , false )
	LuaFunc_MoveToFlag( OwnerID() , 780236 , 6 , 0 )
	LuaFunc_MoveToFlag( OwnerID() , 780236 , 27 , 0 )
	SetPosByFlag( OwnerID(), 780236 , 27 )
	sleep(10)
	SetRandMove( OwnerID() , 100 ,300,50 )


end

function LuaYU_NewPlayerPaPaGo_07() --�T2

	WriteRoleValue(OwnerID() ,EM_RoleValue_IsWalk , 0 ) --�R�O�Ө��ⳣ�Ψ���(  �]�h�] 0 )
	MoveToFlagEnabled( OwnerID()  , false )
	LuaFunc_MoveToFlag( OwnerID() , 780236 , 6 , 0 )
	LuaFunc_MoveToFlag( OwnerID() , 780236 , 28 , 0 )
	SetPosByFlag( OwnerID(), 780236 , 28 )
	sleep(10)
	SetRandMove( OwnerID() , 100 ,300,50 )


end

function LuaYU_NewPlayerPaPaGo_08() --�H�k
	local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 
	WriteRoleValue(OwnerID() ,EM_RoleValue_IsWalk , 0 ) --�R�O�Ө��ⳣ�Ψ���(  �]�h�] 0 )
	MoveToFlagEnabled( OwnerID()  , false )
	LuaFunc_MoveToFlag( OwnerID() , 780236 , 6 , 0 )
	LuaFunc_MoveToFlag( OwnerID() , 780236 , 25 , 0 )
	SetPosByFlag( OwnerID(), 780236 , 25 )
	SetModeEx( OwnerID(), EM_SetModeType_Move, false )--����

	Hide(OwnerID())
	Show(OwnerID(),RoomID)


end








function Lua_NewBie_homeYU_2() --�s��оǫe��ZONE1�@��


	local Player = SearchRangePlayer( OwnerID() , 100 )
	local RoomID = ReadRoleValue(  OwnerID() ,EM_RoleValue_RoomID) 
	local Playername = "|cffffff20"..GetName( Player[0] ).."|r"

	local strbye = "[SC_YU_NEWPLAYERGO_13][$SETVAR1="..Playername.."]"

	local ABow = ReadRoleValue( Player[0]  , EM_RoleValue_Register+8  )
	local Bow01 = LuaFunc_SearchNPCbyOrgID( Player[0] , 101704, 300 , 0) 
	local Bow02 = LuaFunc_SearchNPCbyOrgID( Player[0] , 101705, 300 , 0) 
	local Bow03 = LuaFunc_SearchNPCbyOrgID( Player[0] , 101706, 300 , 0) 

	SetFlag( Player[0]   , 540794, 1 );--�s��_�I�̺X��



--	Delobj( ABow )


--	CastSpelllv( OwnerID() , OwnerID()   , 492776, 1)

--	local ABow = LuaFunc_SearchNPCbyOrgID( Player[0] , 101826, 300 , 0) 

--	SetFollow( ABow, OwnerID()  )
--	SetFollow( Bow01, OwnerID()  )
--	SetFollow( Bow02, OwnerID()  )
--	SetFollow( Bow03, OwnerID()  )


	sleep(10)

	CastSpelllv( Player[0] , Player[0]   , 491215, 1)--�M�����M
	CastSpelllv( OwnerID() , Player[0]   , 490114, 1)--�s�⪺����

	sleep(20)

	Say( ABow , strbye )
	PlayMotion( ABow , 56) --�i��

	sleep(5)
--	Say( Bow01, strbye  )
	PlayMotion( Bow01, 163) 
	sleep(5)
--	Say( Bow02, strbye  )
	PlayMotion( Bow02, 163) 
	sleep(5)
--	Say( Bow03, strbye  )
	PlayMotion( Bow03, 163) 


	sleep(30)

	ScriptMessage(OwnerID(), -1 , 1 , "[SC_YU_NEWPLAYERGO_18]" , C_SYSTEM )  --�A�a��<CR>[112497]</CR>�H��Ĩۣ�H�̪����֧Y�N�i�}�_�۪��_�I�ȵ{�C
	ScriptMessage(OwnerID(), -1 , 0 , "[SC_YU_NEWPLAYERGO_18]" , C_SYSTEM )  



	sleep(50)

	if CheckFlag( Player[0]   , 540851 ) ==true then--�ˬd���L�X��

		if GoReturnPos( Player[0] ) then
			SetFlag( Player[0]   , 540851 , 0 );--�R���X��
			return true
		end
		if ReadRoleValue(Player[0] , EM_RoleValue_Race ) == 0 then
			if ChangeZone( Player[0]  , 1 , 0 ,-4069,244, -8247, 47) then		--�ǰe��zone1
				SetFlag( Player[0]   , 540851 , 0 );--�R���X��
			end
			return true
		end
		if ReadRoleValue(Player[0] , EM_RoleValue_Race ) == 1 then
			if ChangeZone( Player[0] , 12 , 0 ,31954, 23 , 3278 , 95 ) then --�ǰe��zone12
				SetFlag( Player[0]   , 540851 , 0 );--�R���X��
			end
			return true
		end

	end
end


function Lua_NewBie_homeYU_GO() --�pĨۣ�j�è�

		SetRandMove( OwnerID(), 100 ,300,50 )
end


function LuaYU_NewPlayerPaPaGo_101()
	
		SetPlot( OwnerID() ,"range", "LuaYU_NewPlayerPaPaGo_102" , 50 )         
end


function LuaYU_NewPlayerPaPaGo_102()

--	Say(OwnerID(),"OwnerID()")--���a
--	Say(TargetID(),"TargetID()")--NPC
	
	local spiderdie = ReadRoleValue( TargetID()  , EM_RoleValue_PID  )  --�j�����PID = 5
	local spider =  CountBodyItem( OwnerID() , 204180 ) --�j��r�G

	if spiderdie == 5 and spider == 0 then

		GiveBodyItem( OwnerID()  ,  204180  , 1 ) --�j��r�G

	else
		BeginPlot( TargetID() , "LuaYU_NewPlayerPaPaGo_101" , 0 )  
	end

end
function LuaYU_NewPlayerCheckPlayer()
	local RoomID = ReadRoleValue(  OwnerID() ,EM_RoleValue_RoomID) 
	local Player = SearchRangePlayer( OwnerID() , 1000 )
	while 1 do
		local NewPlayer	 = SearchRangePlayer( OwnerID() , 1000 )
		Debuglog(2 , "Checking...NewPlayer = "..NewPlayer[0].."Player[0] = "..Player[0].."RoomID = "..RoomID)
		if NewPlayer[0] ~= Player[0] and NewPlayer[0] ~= -1 then
			if CheckFlag( NewPlayer[0]  , 540851 ) ==true then--�ˬd���L�X��
				SetFlag( NewPlayer[0]  , 540851 , 0 );--�R���X��
				SetFlag( NewPlayer[0]   , 542482 , 0 );--�R���X��
				if GoReturnPos( NewPlayer[0]  ) then
					return true
				end
				if ReadRoleValue(NewPlayer[0],EM_RoleValue_Race ) == 0 then
					ChangeZone( NewPlayer[0] , 1 , 0 ,-4069,244, -8247, 47)--�ǰe��zone1
				end
				if ReadRoleValue(NewPlayer[0],EM_RoleValue_Race ) == 1 then
					ChangeZone( NewPlayer[0] , 12 , 0 ,31954, 23 , 3278 , 95 )--�ǰe��zone12
				end
				break
			end
		end
		Sleep(10)
	end
end
--function LuaI_101022_2_0()

--              SetPlot( OwnerID(),"range", "LuaI_101022_2_1" , 100 )                                      --�]�w�@��
                
--end

--function LuaI_101022_2_1()

--	SetPlot( TargetID(),"range","",200 )                                                                     --���@�Ӫŭ�function�A�����A��Ĳ�o�d��@�����i��C     
--	BeginPlot( TargetID() , "LuaI_101022_2_2" , 0 )                                                   --�R�O���w����I�s Script
--end

function LuaI_101022_2_2()     	  

--	local QQ = CheckAcceptQuest( TargetID(), 421458 );                                        --�P�_�Ө��⦳�S��������


--	if  CheckFlag( TargetID()  , 541589 ) == true  and CheckFlag( TargetID()  , 541590 ) == false then    --�P�_���Ѧ��S�����L�����g���S��������	
--		SetFlag( TargetID()  , 541590 , 1 )	--�S���L���X��	

--	if QQ == true then 

		local Samog = LuaFunc_SearchNPCbyOrgID(OwnerID(), 101022, 200 , 1)       --�ļ���
		local Golu= LuaFunc_SearchNPCbyOrgID( OwnerID(),101028, 200 , 1)             --���ìI�k�ؼ�
		local Solay = LuaFunc_SearchNPCbyOrgID( OwnerID(),101027, 200 , 1)       --�ļ��檺��U
		local EYE01 = LuaFunc_SearchNPCbyOrgID( OwnerID(),101025, 200 , 1)             --���
		local EYE02 = LuaFunc_SearchNPCbyOrgID( OwnerID(),101026, 200 , 1)             --���
		local Minotaur = LuaFunc_SearchNPCbyOrgID(OwnerID() , 101024, 200 , 1)             --�Ԥ����q
		local HideMonster2 = LuaFunc_SearchNPCbyOrgID(OwnerID() , 100694, 200 , 1)       --�d��@���G���õ����_�c


		local StoneCow01  = ReadRoleValue( OwnerID(),  EM_RoleValue_Register+5  )
		local StoneCow02  = ReadRoleValue( OwnerID(),  EM_RoleValue_Register+6  )

		local PurpleID  = ReadRoleValue( OwnerID(),  EM_RoleValue_PID  ) --�Ŧ��_�c��id
--		WriteRoleValue( OwnerID() , EM_RoleValue_Register , OwnerID())
--		local RedID  = ReadRoleValue( OwnerID(), EM_RoleValue_Register )  --�����_�c��id

		SetFightMode(  EYE01[0] , 1, 1, 1, 1 )	
		SetFightMode(  EYE02[0] , 1, 1, 1, 1 )	
		SetFightMode(  Solay[0]  , 1, 1, 1, 1 )	
		SetFightMode(  Solay[1]  , 1, 1, 1, 1 )	

		Hide(Solay[0] )
		Hide(Solay[1] )
		Show(Solay[0],0 )
		Show(Solay[1],0 )

		SetAttack( EYE01[0], Solay[1] )	
		SetAttack( EYE02[0], Solay[0] )	
		SetAttack( Solay[0] , EYE02[0])	
		SetAttack( Solay[1] , EYE01[0])
		CastSpell( Samog[0] , Golu[0], 491919)                                                              --�I��k�N(�I�k��,��Hid,�k�Nid

	
		sleep(30)
		Say( Samog[0], GetString("SC_101022_YU_00") )  --�}����	
		sleep(30)
		Say( EYE01[0],  GetString("SC_101022_YU_01") )
		sleep(40)
		Say( EYE02[0], GetString("SC_101022_YU_02") )
		sleep(40)
		Say( Samog[0], GetString("SC_101022_YU_03") ) --�ʦL�Ѱ�
		sleep(40)
		PlayMotion ( Samog[0], 108)                                  --��t�ʧ@ 108�N�� �j��
		Say( Samog[0], GetString("SC_101022_YU_04") )
		sleep(30)
		PlayMotion ( Samog[0], 109)                                  --��t�ʧ@ 109�N�� �����e�i
		Say( Samog[0], GetString("SC_101022_YU_05") )
		sleep(30)
		CastSpell( Samog[0] , Samog[0], 491920)            --�F���ޱ�
		sleep(40)
		BeginPlot( Samog[0] , "LuaP_Dead" , 0 )                                                   --�R�O���w����I�s Script
		sleep(20)
		Delobj( Samog[0] )
		sleep(20)

		Samogmad1 = CreateObjByFlag( 101219, 780097, 7 , 1 );            --�ļ����F��1�X�{
		AddToPartition( Samogmad1 , 0) 
		WriteRoleValue( Samogmad1 , EM_RoleValue_Register , PurpleID ) --���_�c
		WriteRoleValue( Samogmad1 , EM_RoleValue_Register+1 , OwnerID()  ) --���_�c
		WriteRoleValue( Samogmad1 , EM_RoleValue_Register+5 , StoneCow01) --�U�S



		BeginPlot( Samogmad1 , "LuaI_101030_0_0" , 0 )                                                   

		Samogmad2 = CreateObjByFlag( 101219, 780097, 8 , 1 );            --�ļ����F��2�X�{
		AddToPartition( Samogmad2 , 0) 
		WriteRoleValue( Samogmad2 , EM_RoleValue_Register , PurpleID )
		WriteRoleValue( Samogmad2 , EM_RoleValue_Register+1 , OwnerID()  )
		WriteRoleValue( Samogmad2 , EM_RoleValue_Register+6 , StoneCow02) --����

	

		BeginPlot( Samogmad2 , "LuaI_101030_1_0" , 0 )           

		ScriptMessage(OwnerID(), -1 , 1 , GetString("SC_101022_YU_11") , C_Default )	--�t�ΰT��(�o�ܤH,���ܤH)���ܤH��0�h�Hsay���d�򪺪��a���iť��C

		sleep(40)

		ScriptMessage(OwnerID(), -1 , 1 , GetString("SC_101022_YU_12") , C_SYSTEM )	--�t�ΰT��(�o�ܤH,���ܤH)���ܤH��0�h�Hsay���d�򪺪��a���iť��C

		sleep(20)
		Say( EYE02[0],  GetString("SC_101022_YU_06") )
		sleep(30)
		Say( EYE02[0],  GetString("SC_101022_YU_07") )
		sleep(30)
		Say( EYE01[0], GetString("SC_101022_YU_08") )
		sleep(30)
		Say( EYE01[0], GetString("SC_101022_YU_09") )

			while true do
			sleep(30)


				if CheckID( Solay[0] ) == false and CheckID( Solay[1] ) == false then
			
					Say( EYE01[0],  GetString("SC_101022_YU_10") )
					sleep(10)

					CastSpell( EYE01[0], EYE01[0], 491922)
					CastSpell( EYE02[0], EYE02[0], 491922)
					sleep(40)
					BeginPlot( OwnerID() , "LuaI_101025_YU_1" , 0 )                                                   --�}�ҽ�̤����䴩�@��

					BeginPlot( Golu[0] , "LuaI_101024_1" , 0 )                                                   --���w�����_�c���ò��q
					Delobj( EYE01[0] )
					Delobj( EYE02[0] )
					break
				end
			end

		sleep(30)

--	end


end
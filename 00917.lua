function LuaYU_MalaTina_Goodman( Option )      -- ���Ը��R�C�����m��

	local PlayerID = OwnerID()
	local PackageID = 205814		-- ���Ը��R���m��
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )


	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false

		elseif ( ZoneID > 100 ) then

			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_DAN_111700_37]" , C_SYSTEM )  --���i�A�ƥ��ϥ�
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_DAN_111700_37]" , C_SYSTEM )  --���i�A�ƥ��ϥ�

			return false

		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		--����1
		SetFlag( OwnerID()  , 543270 , 0 ) -- ���m����Ĳ�o
		SetFlag( OwnerID()  , 542245 , 0 ) -- ���n���~
		SetFlag( OwnerID()  , 542246 , 0 ) -- ���n���~�D�ԨM�w

		--����2
		SetFlag( OwnerID()  , 542991 , 0 ) -- ���n���~
		SetFlag( OwnerID()  , 542992 , 0 ) -- ���m�P�_
		SetFlag( OwnerID()  , 543170 , 0 ) -- �q��

		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_113120_MALA2_55]" , C_SYSTEM )  --���mOK
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_113120_MALA2_55]" , C_SYSTEM )  --���mOK


	end
end

function LuaYU_MalaTina_Goodman01( Option )      --  �ͦs�C�����m��

	local PlayerID = OwnerID()
	local PackageID = 205815		-- �ͦs�C�����m��
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )


	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false

		elseif ( ZoneID > 100 ) then

			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_DAN_111700_37]" , C_SYSTEM )  --���i�A�ƥ��ϥ�
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_DAN_111700_37]" , C_SYSTEM )  --���i�A�ƥ��ϥ�

			return false

		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		--����1
		SetFlag( OwnerID()  , 543270 , 0 ) -- ���m����Ĳ�o
		SetFlag( OwnerID()  , 542245 , 0 ) -- ���n���~
		SetFlag( OwnerID()  , 542246 , 0 ) -- ���n���~�D�ԨM�w

		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_113120_MALA2_75]" , C_SYSTEM )  --���mOK
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_113120_MALA2_75]" , C_SYSTEM )  --���mOK


	end
end


function LuaYU_MalaTina_Goodman02( Option )      -- ���_�C�����m��

	local PlayerID = OwnerID()
	local PackageID = 205816		-- ���Ը��R���m��
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )


	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false

		elseif ( ZoneID > 100 ) then

			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_DAN_111700_37]" , C_SYSTEM )  --���i�A�ƥ��ϥ�
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_DAN_111700_37]" , C_SYSTEM )  --���i�A�ƥ��ϥ�

			return false

		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		Sleep(10)

		--����2
		SetFlag( OwnerID()  , 542991 , 0 ) -- ���n���~
		SetFlag( OwnerID()  , 542992 , 0 ) -- ���m�P�_
		SetFlag( OwnerID()  , 543170 , 0 ) -- �q��


		Sleep(10)

		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_113120_MALA2_76]" , C_SYSTEM )  --���mOK
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_113120_MALA2_76]" , C_SYSTEM )  --���mOK


	end
end


function LuaYU_MalaTina_SPBOOK01( Option )      -- ���_�C���S��D��_�����m�����b

	local PlayerID = OwnerID()
	local PackageID = 203029		-- �N �d��50����  �ʦL(�����ý�) �ഫ�� �ʦL(��������)
	local ZoneID = ReadRoleValue(OwnerID() ,EM_RoleValue_ZoneID )
	local tree = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113110, 50 , 1)     

	if ( Option == "CHECK" ) then
		if ( ZoneID ~= 353 ) then

			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_DAN_111700_37]" , C_SYSTEM )  --���i�b���Ϩϥ�
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_DAN_111700_37]" , C_SYSTEM )  --���i�b���Ϩϥ�

			return false

		elseif tree[0] == -1 then	

			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_113120_MALA2_61]" , C_SYSTEM )  --�ؼФ��b�@�νd�򤺡C
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_113120_MALA2_61]" , C_SYSTEM )  --�ؼФ��b�@�νd�򤺡C
			return false

		elseif CheckBuff( OwnerID() , 502864 ) == true then --�w�����A(�]�\�i��о�)
	
			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_113120_MALA2_84]" , C_SYSTEM )  --�ؼФ��b�@�νd�򤺡C
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_113120_MALA2_84]" , C_SYSTEM )  --�ؼФ��b�@�νd�򤺡C
			return false


		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) and ( ZoneID == 353 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_113120_MALA2_62]" , C_SYSTEM )  --���mOK
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_113120_MALA2_62]" , C_SYSTEM )  --���mOK



		local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
--		local tree = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113110, 50 , 1)     


		if tree[0] ~= -1 then
			SetPlot( tree[0]  ,"touch",  "" , 0 ) 
			AddBuff( OwnerID() ,503991 ,1 , 3 ); --���K���S��

			local OwnerX = ReadRoleValue( tree[0] , EM_RoleValue_X ) 
			local OwnerY = ReadRoleValue( tree[0] , EM_RoleValue_Y ) 
			local OwnerZ = ReadRoleValue( tree[0] , EM_RoleValue_Z ) 
			local OwnerDIR = ReadRoleValue( tree[0] , EM_RoleValue_Dir ) 

			local NewfloorX = CreateObj( 113109 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)

			SetModeEx( NewfloorX , EM_SetModeType_Strikback, false )--����
			SetModeEx( NewfloorX , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
			SetModeEx( NewfloorX , EM_SetModeType_Move, false )--����
			SetModeEx( NewfloorX , EM_SetModeType_Searchenemy, false )--����
			SetModeEx( NewfloorX , EM_SetModeType_Mark, true )--�аO
			SetModeEx( NewfloorX , EM_SetModeType_HideName, false )--�W��
			SetModeEx( NewfloorX , EM_SetModeType_Obstruct, true )--����

			Hide(NewfloorX)
			Show( NewfloorX,RoomID)		
			
			AddToPartition( NewfloorX , RoomID )  


			Delobj( tree[0]  )		
		end



	end
end

function LuaYU_MalaTina_SPBOOK02( Option )      -- ���_�C���S��D��_�����ǰe���b

	local PlayerID = OwnerID()
	local PackageID = 203030		-- �N �ۨ��ǰe�ܹ��_�C���J�f(�_�c�Ҧb�a)�C
	local ZoneID = ReadRoleValue(OwnerID() ,EM_RoleValue_ZoneID )
	local Canusethis = ReadRoleValue( OwnerID() ,EM_RoleValue_Register+3) --���a�O�_���b���d�����X��


	if ( Option == "CHECK" ) then
		if ( ZoneID ~= 353 ) then

			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_DAN_111700_37]" , C_SYSTEM )  --���i�b���Ϩϥ�
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_DAN_111700_37]" , C_SYSTEM )  --���i�b���Ϩϥ�

			return false

		elseif CheckBuff( OwnerID() , 502864 ) == true then --�w�����A(�]�\�i��о�)
	
			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_113120_MALA2_84]" , C_SYSTEM )  --�ثe���A���i�ϥ�
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_113120_MALA2_84]" , C_SYSTEM )  --�ثe���A���i�ϥ�
			return false

		elseif Canusethis ~= 1314 then --�b�_�c��
	
			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_DAN_111700_37]" , C_SYSTEM )  --�ثe���A���i�ϥΡC
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_DAN_111700_37]" , C_SYSTEM )  --�ثe���A���i�ϥΡC
			return false

		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) and ( ZoneID == 353 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_113120_MALA2_62]" , C_SYSTEM )  --���mOK
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_113120_MALA2_62]" , C_SYSTEM )  --���mOK

		local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

		AddBuff( OwnerID() ,503993 ,1 , 1 ); --�ǰe�S��
		SetPosByFlag( OwnerID() , 780309 , 14 )--�ǰe�� X ���X�l
		WriteRoleValue( OwnerID()  , EM_RoleValue_PID , 0 )  --PClass ���a���W��PID�M��
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 5566 )   --�����F���S�O���Ȫ����C
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+3 , 0  )   --���a��^�_�c�ϡA���i�ϥ�"�������b"���X�СC

		local ffdeler = CreateObjByFlag( 100044, 780309 , 12 , 1 );

		SetModeEx( ffdeler  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( ffdeler , EM_SetModeType_Obstruct, false )--����
		SetModeEx( ffdeler  , EM_SetModeType_Mark, false )--�аO
		SetModeEx( ffdeler   , EM_SetModeType_Move, false )--����
		SetModeEx( ffdeler  , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( ffdeler   , EM_SetModeType_HideName, true )--�W��
		SetModeEx( ffdeler , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( ffdeler , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( ffdeler  , EM_SetModeType_Show , false ) --�����

		AddToPartition( ffdeler , RoomID )  

		BeginPlot( ffdeler , "LuaYu_Ma2floor_Del" , 0 )  --�w���M���Ҧ��a�O



	end
end

function LuaYU_MalaTina_SPBOOK03( Option )      -- ���_�C���S��D��_���c�X�v���b

	local PlayerID = OwnerID()
	local PackageID = 203031		-- �N�d��150�����Ҧ��p������ä[�ᵲ���
	local ZoneID = ReadRoleValue(OwnerID() ,EM_RoleValue_ZoneID )
	local Ghost = {}


	Ghost[1] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102369, 150 , 1)     
	Ghost[2] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102373, 150 , 1)  
	Ghost[3] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102377, 150 , 1)     
	Ghost[4] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102381, 150 , 1)     
	Ghost[5] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102385, 150 , 1)  


	if ( Option == "CHECK" ) then
		if ( ZoneID ~= 353 ) then

			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_DAN_111700_37]" , C_SYSTEM )  --���i�b���Ϩϥ�
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_DAN_111700_37]" , C_SYSTEM )  --���i�b���Ϩϥ�

			return false
		elseif  (Ghost[1][0] == -1) and (Ghost[2][0] == -1) and (Ghost[3][0] == -1) and (Ghost[4][0] == -1) and (Ghost[5][0] == -1)  then	

			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_113120_MALA2_61]" , C_SYSTEM )  --�ؼФ��b�@�νd�򤺡C
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_113120_MALA2_61]" , C_SYSTEM )  --�ؼФ��b�@�νd�򤺡C
			return false	

		elseif CheckBuff( OwnerID() , 502864 ) == true then --�w�����A(�]�\�i��о�)
	
			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_113120_MALA2_84]" , C_SYSTEM )  --�ؼФ��b�@�νd�򤺡C
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_113120_MALA2_84]" , C_SYSTEM )  --�ؼФ��b�@�νd�򤺡C
			return false

		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) and ( ZoneID == 353 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_113120_MALA2_62]" , C_SYSTEM )  --���mOK
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_113120_MALA2_62]" , C_SYSTEM )  --���mOK
		AddBuff( OwnerID() ,503992 ,1 , 3 ); --�B�ʻ��S��



		for i=1 , table.getn(Ghost) do	
			if Ghost[i] ~= -1 then
				for j = 0 ,table.getn(Ghost[i])  do

					local Door = ReadRoleValue( Ghost[i][j] ,EM_RoleValue_PID) 

					SetStopAttack( Ghost[i][j]  )
					AddBuff( Ghost[i][j] , 502357 ,1 , -1 ); --�B��
					BeginPlot( Ghost[i][j] , "LuaP_Dead" , 0 )   
					sleep(20)

					Delobj( Ghost[i][j] )	

					SetStopAttack( Door )
					AddBuff( Door , 502357 ,1 , -1 ); --�B��
					BeginPlot( Door , "LuaP_Dead" , 0 )   
					sleep(20)

					Delobj( Door )
				


				end
			end
		end


	end
end


function LuaYU_rundomgoods_01( Option )
	local PlayerID = OwnerID()
	local PackageID = 203028		--���~�t��]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		GiveBodyItem( PlayerID , 720590 , 1 )	
	

	end
end

function LuaYU_rundomgoods_02( Option )
	local PlayerID = OwnerID()
	local PackageID = 203033		--�H�����M�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		GiveBodyItem( PlayerID , 720587 , 1 )	
	

	end
end

function LuaYU_rundomgoods_03( Option )
	local PlayerID = OwnerID()
	local PackageID = 203635		--�־������]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		GiveBodyItem( PlayerID , 720588 , 1 )	
	

	end
end

function LuaYU_rundomgoods_04( Option )
	local PlayerID = OwnerID()
	local PackageID = 205819		--�ųN���b�]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		GiveBodyItem( PlayerID , 720559 , 1 )	
	

	end
end

function LuaYU_rundomgoods_05( Option )
	local PlayerID = OwnerID()
	local PackageID = 205818		--���Ůa��t��]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		GiveBodyItem( PlayerID , 720593 , 1 )	
	

	end
end

function LuaYU_rundomgoods_06( Option )
	local PlayerID = OwnerID()
	local PackageID = 205820		--�־��]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		GiveBodyItem( PlayerID , 720589 , 1 )	
	

	end
end

function LuaYU_rundomgoods_07( Option )
	local PlayerID = OwnerID()
	local PackageID = 205821		--�u���@���ϥΨ�
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		GiveBodyItem( PlayerID , 720594 , 1 )	
	

	end
end
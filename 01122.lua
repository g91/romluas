function LuaYU_101489_0()   --�ͥX�a�O
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
 	local floor = CreateObjByFlag( 101471, 780201, 0 , 1 );  --�a�O�޾ɪ�
	AddToPartition( floor, RoomID) 

	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_PID  )  
	WriteRoleValue( floor , EM_RoleValue_PID , PlayerLV )   

		SetModeEx( floor    , EM_SetModeType_Strikback, false )--����
		SetModeEx( floor    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( floor    , EM_SetModeType_Obstruct, false )--����
		SetModeEx( floor    , EM_SetModeType_Mark, false )--�аO
		SetModeEx( floor    , EM_SetModeType_Move, false )--����
		SetModeEx( floor    , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( floor    , EM_SetModeType_HideName, true )--�W��
		SetModeEx( floor   , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( floor   , EM_SetModeType_Show , false ) --�����
		SetModeEx( floor   , EM_SetModeType_Fight , false )--�i�������

		Hide( floor )
		Show( floor ,RoomID)

	BeginPlot( floor , "LuaYuyu_floor_matrix" , 0 )  
end

function LuaYU_101489_1()  --�ͥX�����ҫ�
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local F={}  --�����ҫ�

	local P = 100
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_PID  )  
	local MonsterLV 
		if PlayerLV <= 4 then
			MonsterLV = 5
		else
			MonsterLV = PlayerLV - (PlayerLV%5)
		end
--	Say(Player, "1 PlayerLV = "..PlayerLV )
--	Say(Player, "1 MonsterLV = "..MonsterLV )

	for k = 0, 19 do  -- 0 ~ 19
		F[k]  = CreateObjByFlag( 101489, 780235, (k+1) , 1 );
		WriteRoleValue( F[k] , EM_RoleValue_LV , MonsterLV )	-- �]�w�Ǫ�����
		SetModeEx( F[k]    , EM_SetModeType_Strikback, false )--����
		SetFightMode(  F[k] , 0, 0, 0, 1 )
		AddToPartition( F[k], RoomID) 
		AddBuff( F[k] ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
		WriteRoleValue(F[k], EM_RoleValue_Register+5, PlayerLV)  -- �N���a���żg�JR+5
		SetPlot(  F[k] , "dead","LuaYU_101489_2",0 )      --  �����ҫ����`�@��
	end

-- 	F[0] = CreateObjByFlag( 101489, 780235, 1 , 1 );
-- 	F[1] = CreateObjByFlag( 101489, 780235, 2 , 1 );
-- 	F[2] = CreateObjByFlag( 101489, 780235, 3 , 1 );
-- 	F[3] = CreateObjByFlag( 101489, 780235, 4 , 1 );
-- 	F[4] = CreateObjByFlag( 101489, 780235, 5 , 1 );
-- 	F[5] = CreateObjByFlag( 101489, 780235, 6 , 1 );
-- 	F[6] = CreateObjByFlag( 101489, 780235, 7 , 1 );
-- 	F[7] = CreateObjByFlag( 101489, 780235, 8 , 1 );
-- 	F[8] = CreateObjByFlag( 101489, 780235, 9 , 1 );
-- 	F[9] = CreateObjByFlag( 101489, 780235, 10 , 1 );
-- 	F[10] = CreateObjByFlag( 101489, 780235, 11 , 1 );
-- 	F[11] = CreateObjByFlag( 101489, 780235, 12 , 1 );
-- 	F[12] = CreateObjByFlag( 101489, 780235, 13 , 1 );
-- 	F[13] = CreateObjByFlag( 101489, 780235, 14 , 1 );
-- 	F[14] = CreateObjByFlag( 101489, 780235, 15 , 1 );
-- 	F[15] = CreateObjByFlag( 101489, 780235, 16 , 1 );
-- 	F[16] = CreateObjByFlag( 101489, 780235, 17 , 1 );
-- 	F[17] = CreateObjByFlag( 101489, 780235, 18 , 1 );
-- 	F[18] = CreateObjByFlag( 101489, 780235, 19 , 1 );
-- 	F[19] = CreateObjByFlag( 101489, 780235, 20 , 1 );


	

	while true do
		sleep(50)

		local G = 100
		local YY = Rand( G )   
		if YY >= 65 and YY < 100 then   --35%  -- �Ŧ�q��
			for i=0, 9 do
				if checkid(F[i]) == true and Checkid(F[i+10]) == true then
					CastSpelllv( F[i+10], F[i], 492452, 1)   -- �޲����q�y �·��ĪG
				end
			end

			for i=10, 19 do

				if checkid(F[i]) == true and Checkid(F[i-10]) == true then
					CastSpelllv( F[i-10], F[i], 492452, 1)  -- �޲����q�y �·��ĪG
				end
			end

		elseif YY >= 30 and YY < 65 then   --35%  --  �������
			local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_PID  )  

			local staff = LuaFunc_CreateObjByObj ( 101273 , OwnerID() )	
			SetFightMode(  staff , 0, 0, 0, 0 )
			SetModeEx( staff , EM_SetModeType_Mark, false )--�аO
			SetModeEx( staff , EM_SetModeType_HideName, true )--�W��
			SetModeEx( staff , EM_SetModeType_ShowRoleHead, false )--�Y����
			AddToPartition( staff, RoomID) 
			Hide( staff )
			Show( staff,RoomID )

			sleep(10)
			for i = 0, 19 do
				if checkid(F[i]) == true then
					CastSpelllv( F[i],  staff  , 492454, 0)	-- �޲������K						
				end
			end
			sleep(20)

			if YY >= 45 and YY < 65 then
				CastSpelllv( staff ,  staff , 492456, 0)  -- �������i	
				sleep(10)		
				Delobj(staff)
			else
				Delobj(staff)	
			end


		else --30�H   --����
			local G = 100
			local XX = Rand( G )   
			local magicid = 492455  -- �ŷx���q�y
				if XX >= 75 and XX < 100 then   --25%  
						CastSpelllv( F[17] , F[11] , magicid , 1)
						CastSpelllv( F[11] , F[2] , magicid , 1)
						CastSpelllv( F[2] , F[14] , magicid , 1)
						CastSpelllv( F[14] , F[9] , magicid , 1)
						CastSpelllv( F[9] , F[17] , magicid , 1)

				elseif XX >= 50 and XX < 75 then   --25%  
						CastSpelllv( F[12] , F[8] , magicid , 1)
						CastSpelllv( F[8] , F[17] , magicid , 1)
						CastSpelllv( F[17] , F[5] , magicid , 1)
						CastSpelllv( F[5] , F[3] , magicid , 1)
						CastSpelllv( F[3] , F[12] , magicid , 1)

				elseif XX >= 25 and XX < 50 then   --25%  
						CastSpelllv( F[0], F[12], magicid, 1)
						CastSpelllv( F[12], F[3] , magicid, 1)
						CastSpelllv( F[3], F[7], magicid, 1)
						CastSpelllv( F[7], F[16], magicid, 1)
						CastSpelllv( F[16], F[0], magicid, 1)
				else --25�H  
						CastSpelllv( F[19], F[7], magicid, 1)
						CastSpelllv( F[7], F[16] , magicid, 1)
						CastSpelllv( F[16], F[2], magicid, 1)
						CastSpelllv( F[2], F[11], magicid, 1)
						CastSpelllv( F[11], F[19], magicid, 1)
				end
		end
	end
end


function LuaYU_101489_2()  --�����ҫ����`�@��1
	BeginPlot( OwnerID() , "LuaYU_101489_3" , 0 )  
	return false
end

function LuaYU_101489_3()  --�����ҫ����`�@��2
	local stone = OwnerID() -- �޲��������ҫ�
	local stone_x = ReadRoleValue(stone, EM_RoleValue_X)
	local stone_y = ReadRoleValue(stone, EM_RoleValue_Y)
	local stone_z = ReadRoleValue(stone, EM_RoleValue_Z)
	local stone_dir = ReadRoleValue(stone, EM_RoleValue_dir)
	local RoomID = ReadRoleValue(stone, EM_RoleValue_RoomID )

	local PlayerLV = ReadRoleValue( stone , EM_RoleValue_Register+5  )    -- ���a�D¾����
	local MonsterLV 
		if PlayerLV <= 4 then
			MonsterLV = 5
		else
			MonsterLV = PlayerLV - (PlayerLV%5)
		end
--	Say(Player, "1 PlayerLV = "..PlayerLV )
--	Say(Player, "1 MonsterLV = "..MonsterLV )
	local MonsterID  = 101269  -- �u�@���F (�쥻26�H�U��)

	PlayMotion( stone , 19) 
	sleep(10)
	PlayMotion( stone , 19) 
	sleep(10)
	PlayMotion( stone , 19) 
	sleep(20)
	CastSpell( stone, stone, 491002)  -- �z���S��
	sleep(20)

	local Monster =  CreateObj( MonsterID, stone_x, stone_y, stone_z, stone_dir, 1 )
	WriteRoleValue( Monster , EM_RoleValue_LV , MonsterLV )	-- �g�J���� 
	SetModeEx( Monster    , EM_SetModeType_Strikback, true )--����
	SetModeEx( Monster    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Monster    , EM_SetModeType_Obstruct, false )--����
	SetModeEx( Monster    , EM_SetModeType_Mark, true )--�аO
	SetModeEx( Monster    , EM_SetModeType_Move, true )--����
	SetModeEx( Monster    , EM_SetModeType_Searchenemy, true )--����
	SetModeEx( Monster    , EM_SetModeType_HideName, false )--�W��
	SetModeEx( Monster , EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( Monster , EM_SetModeType_Fight , true )--�i�������
	MoveToFlagEnabled( Monster , false )   	       --�}�������޼@��
	AddToPartition( Monster, RoomID )	--�����󲣥�  
		
	sleep(10)
	Delobj(stone)  -- �R���ҫ�
end	
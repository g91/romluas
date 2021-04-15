--�h�|��AI_SCRIPT

function LuaB_DSL_AI_SYSYTEM()
--	Say( OWnerID() , "RunPlot OK " )
	local FlagID = 780072--�n�ǰe���X�l�s��
	local CheckTime = 30 -- 3 ���ˬd�@��
	local CastingDelay = 300 --30 ��I�k�@��
	local Count = 0
 	local Guard = {}--�l�ꪺ�Ǫ��}�C
	local Monster = 100594 --�l�ꪺ�Ǫ��s��
	local M_Flag_ID = 780070--�Ǫ��X�ͪ��X�l�s���]�P���ʪ��X�l�s���@�Ρ^
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )

	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�
--			Say( OwnerID() , "Check" )
			local DSL_MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )
			local DSL_HP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
			local DSL_HPRate = ( DSL_HP/DSL_MaxHP ) * 100
			local count = 0

			for i = 1 , 6 , 1 do --�ˬd�ͽìO�_�s�b
				if Guard[i] == nill or CheckID( Guard[i] ) == false then
					count = count + 1
				end
--				Say( OwnerID() , count )
			end

			if Count >= 6 then --�l�ꤻ���ͽ�
				Say( OwnerID() , GetString("SAY_100611_1") )
				for i = 1 , 6 , 1 do
					Guard[i] = CreateObjByFlag(Monster,M_Flag_ID, i ,1)
					AddToPartition( Guard[i] , RoomID )
					SetAttack( Guard[i] , AttackTarget)
					MoveToFlagEnabled( Guard[i] ,false )
				end
				count = 0
			end
			
			if DSL_HPRate < 10 then --��C��10�H�w�ɶǰe
				if Count == math.ceil(CastingDelay/CheckTime)  then 
					SetPosByFlag( OwnerID(),FlagID, 0 ) --�ǰe���H
					LuaFunc_Random_TransportEX(AttackTarget ,FlagID,6) 
					Say( OwnerID() , GetString("SAY_100611_0") )
					CastSpellLV( OwnerID() , OwnerID() ,491104,250)
				end				
			elseif DSL_HPRate < 50 then --��C��50%�~�}�l�P�_
				if Rand( 50 ) > 30 then --�� 40 % ���v�ǰe
					SetPosByFlag( OwnerID(),FlagID, 0 ) --�ǰe���H
					LuaFunc_Random_TransportEX(AttackTarget ,FlagID,6) 
					Say( OwnerID() , GetString("SAY_100611_0") )
					CastSpellLV( OwnerID() , OwnerID() ,491104,250)
				end
			end

		else
			for i = 1 , table.getn( Guard )  , 1 do --���}�԰���R���h�l���ͽ�
				if CheckID( Guard[i] ) then
					DelObj( Guard[i] )
				end
			end

		end

		if Count == math.ceil(CastingDelay/CheckTime) then
			Count = 0
		else
			Count = Count + 1
		end

		sleep( CheckTime )
	end 
end

function LuaI_103_DSL_GUARD()
	SetPlot( OwnerID() , "range" , "LuaI_103_DSL_GUARD_2" , 70 )
end

function LuaI_103_DSL_GUARD_2()
	SetPlot( TargetID() , "range" , "" , 0 )
	BeginPlot( TargetID() , "LuaB_Summon_SYS" , 0 )
end

function LuaB_Summon_SYS()
	local M_Flag_ID = 780070--�Ǫ��X�ͪ�FLAG
	local Guard = {}
	local Monster = 100606 --�l�ꪺ�Ǥ�ID
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local n = 1
	for i = 1 , 12 , 1 do
		Guard[i] = CreateObjByFlag( Monster , M_Flag_ID , n , 1 )
		AddToPartition( Guard[i] , RoomID )
		MoveToFlagEnabled( Guard[i], false )
		WriteRoleValue( Guard[i] , EM_RoleValue_PID , i )
		BeginPlot( Guard[i] , "LuaB_Summon_SYS_GO" , 0 )
		if n == 1 then
			n = 2
		else
			n = 1
		end
		sleep( 5 )
	end

end

function LuaB_Summon_SYS_GO()
	local StandPoint = 780071 --�Ǫ���F���X��
	local Flag = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 0 )
	Say( OwnerID() , GetString("SAY_100611_2") )
	LuaFunc_MoveToFlag( OwnerID(), StandPoint , Flag ,0 )
	AdjustFaceDir( OwnerID(), TargetID(), 0 )
end
	
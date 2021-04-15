--多魯梭AI_SCRIPT

function LuaB_DSL_AI_SYSYTEM()
--	Say( OWnerID() , "RunPlot OK " )
	local FlagID = 780072--要傳送的旗子編號
	local CheckTime = 30 -- 3 秒檢查一次
	local CastingDelay = 300 --30 秒施法一次
	local Count = 0
 	local Guard = {}--召喚的怪物陣列
	local Monster = 100594 --召喚的怪物編號
	local M_Flag_ID = 780070--怪物出生的旗子編號（與移動的旗子編號共用）
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )

	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
--			Say( OwnerID() , "Check" )
			local DSL_MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )
			local DSL_HP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
			local DSL_HPRate = ( DSL_HP/DSL_MaxHP ) * 100
			local count = 0

			for i = 1 , 6 , 1 do --檢查侍衛是否存在
				if Guard[i] == nill or CheckID( Guard[i] ) == false then
					count = count + 1
				end
--				Say( OwnerID() , count )
			end

			if Count >= 6 then --召喚六隻侍衛
				Say( OwnerID() , GetString("SAY_100611_1") )
				for i = 1 , 6 , 1 do
					Guard[i] = CreateObjByFlag(Monster,M_Flag_ID, i ,1)
					AddToPartition( Guard[i] , RoomID )
					SetAttack( Guard[i] , AttackTarget)
					MoveToFlagEnabled( Guard[i] ,false )
				end
				count = 0
			end
			
			if DSL_HPRate < 10 then --血低於10％定時傳送
				if Count == math.ceil(CastingDelay/CheckTime)  then 
					SetPosByFlag( OwnerID(),FlagID, 0 ) --傳送六人
					LuaFunc_Random_TransportEX(AttackTarget ,FlagID,6) 
					Say( OwnerID() , GetString("SAY_100611_0") )
					CastSpellLV( OwnerID() , OwnerID() ,491104,250)
				end				
			elseif DSL_HPRate < 50 then --血低於50%才開始判斷
				if Rand( 50 ) > 30 then --有 40 % 機率傳送
					SetPosByFlag( OwnerID(),FlagID, 0 ) --傳送六人
					LuaFunc_Random_TransportEX(AttackTarget ,FlagID,6) 
					Say( OwnerID() , GetString("SAY_100611_0") )
					CastSpellLV( OwnerID() , OwnerID() ,491104,250)
				end
			end

		else
			for i = 1 , table.getn( Guard )  , 1 do --離開戰鬥後刪掉多餘的侍衛
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
	local M_Flag_ID = 780070--怪物出生的FLAG
	local Guard = {}
	local Monster = 100606 --召喚的怪之ID
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
	local StandPoint = 780071 --怪物到達的旗標
	local Flag = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 0 )
	Say( OwnerID() , GetString("SAY_100611_2") )
	LuaFunc_MoveToFlag( OwnerID(), StandPoint , Flag ,0 )
	AdjustFaceDir( OwnerID(), TargetID(), 0 )
end
	
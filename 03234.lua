function Cl_Call_Priest()
	local OwnerID = OwnerID()
	say( OwnerID , "OwnerID" )
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local X,Y,Z,Dir = Cl_GetPositionByObj( OwnerID , 90 , 20 )
	local Priest = CreateObj( 104692 , X , Y , Z , Dir , 1 )
	SetModeEx( Priest , EM_SetModeType_Strikback, false) ---§œ¿ª(ß_)
	SetModeEx( Priest , EM_SetModeType_Searchenemy, false)
	SetModeEx( Priest , EM_SetModeType_Fight, false)
	AddToPartition( Priest , RoomID )
	SetFollow( Priest, OwnerID )
	MoveToFlagEnabled( Priest, false )
	CallPlot( Priest , "Cl_Priest_AI" , OwnerID ) 
end
function Cl_Priest_Skill()
	local Skill = {}
	Skill.Hot = {ID=490269,Lv=0,CD=15}
	Skill.Fast={ID=491147,Lv=0,CD=1}
	Skill.heal={ID=490261,Lv=0,CD=2}
	Skill.AllHeal={ID=490281,Lv=0,CD=5}
	return Skill
end
function Cl_Priest_AI(MasterID)
	local OwnerID = OwnerID()
	local MaxHp = 0
	local NowHp = 0
	local AttackMode = 0
	local flag = false
	local time
	while true do
		sleep( 10 )
		AttackMode = ReadRoleValue ( MasterID , EM_RoleValue_IsAttackMode )
		if AttackMode == 0 then
			if flag == true then
				SetModeEx( OwnerID , EM_SetModeType_Fight, false)
				flag = false
			end
		elseif AttackMode == 1 then
			if flag == false then
				SetModeEx( OwnerID , EM_SetModeType_Fight, true)
				flag = true
			end
		end	
		
		
		MaxHp = ReadRoleValue ( MasterID , EM_RoleValue_MaxHP )
		NowHp = ReadRoleValue ( MasterID , EM_RoleValue_HP )
		
		say( OwnerID , "Hp:"..(NowHp/MaxHp)*100 )
	end
end
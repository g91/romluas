function bico_154_103364_hidebuff()
	while 1 do
	sleep(10)
		if HateListCount( OwnerID() ) == 0 and CheckBuff(OwnerID(), 624234) == false then
			CastSpell( OwnerID(), OwnerID(), 850784)
		elseif HateListCount( OwnerID() ) ~= 0 and CheckBuff(OwnerID(), 624234) == true then
			CastSpell( OwnerID(), OwnerID(), 850790)			
		end
	end
end

function bico_154_103364_cancelhidebuff()
	CancelBuff( OwnerID(), 624234)
end

function bico_154_103363_StoneFight_0()

SetPlot( OwnerID(), "collision", "bico_154_103363_StoneFight_1", 20 )

end

function bico_154_103363_StoneFight_1()

SysCastSpellLv(OwnerID(), OwnerID(), 496169, 0)

end

function bico_103032_496595_mindcrash()
	local hate_table ={}
	local RandPlayer 
	local TempGID = 0
	local Fightflag = 0
	SysCastSpellLv( OwnerID() , OwnerID() ,496854 , 0 )
	Sleep(5)
	SetModeEx( OwnerID() , EM_SetModeType_show, false )
	while 1 do
	sleep(10)
			hate_table = HateListCount( OwnerID() )
			RandPlayer = Rand(hate_table)
			TempGID = HateListInfo( OwnerID(), RandPlayer, EM_HateListInfoType_GItemID )
			x = ReadRoleValue( TempGID, EM_RoleValue_X )
			y = ReadRoleValue( TempGID, EM_RoleValue_Y )
			z = ReadRoleValue( TempGID, EM_RoleValue_Z )
			dir = ReadRoleValue( TempGID, EM_RoleValue_Dir )
			if ReadRoleValue( TempGID, EM_RoleValue_IsPlayer ) == 1 and
				ReadRoleValue( TempGID, EM_RoleValue_IsDead) == 0 	and 
				CheckBuff( TempGID, 624271 ) == False then
				SetPos( OwnerID(), x, y, z+20, dir+180 )
				SysCastSpellLv( OwnerID() , OwnerID() ,496854 , 0 )
				SetModeEx( OwnerID() , EM_SetModeType_show, true )
				CastSpellLV( OwnerID() , TempGID , 496595, 0 )
				sleep(50)
				SysCastSpellLv( OwnerID() , OwnerID() ,496854 , 0 )
				Sleep(5)
				SetModeEx( OwnerID() , EM_SetModeType_show, false )
				Fightflag =1
			end
		if Fightflag ==1 and HateListCount( OwnerID() ) == 0 then
			SysCastSpellLv( OwnerID() , OwnerID() ,496854 , 0 )
			Sleep(5)
			SetModeEx( OwnerID() , EM_SetModeType_show, false )
		Fightflag = 0
		end
	end
end

function bico_154_103077_killself()
	if TargetID() == OwnerID() then
		return true
	end
end

function bico_154_103077_attackflag()
	local Max_HP = ReadRoleValue( OwnerID() , EM_RoleValue_MAxHP )
	while 1 do 
	sleep(10)
	local Now_HP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
	local HP_P = (Now_HP/Max_HP)*100
	
		if HP_P <= 25 then		
		--say(OwnerID(),"HP_P="..HP_P)
		AddBuff( OwnerID() , 624259 , 0 , 7 )
		break
		end
	end
end

function bico_154_103078_850817_eleattack()
	--say(TargetID(), "Hi")
	SysCastSpellLv( TargetID(), TargetID(), 850817, 0 )
end
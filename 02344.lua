function Zone14_weapon_Shop() --ªZ¾¹
	SetMinimapIcon(OwnerID(),EM_MapIconType_Weapon)
	SetShop(OwnerID(),600273,"Test_Shop_Close")
end

function Zone14_medicine_Shop() --ÃÄ¤ô
	SetMinimapIcon(OwnerID(),EM_MapIconType_Potion)
	SetShop(OwnerID(),600274,"Test_Shop_Close")
end

function Zone14_goods_Shop() --Âø³f
	SetMinimapIcon(OwnerID(),EM_MapIconType_Shop)
	SetShop(OwnerID(),600275,"Test_Shop_Close")
end

------Perform------
function LuaAS_perform_01()	
	SetDefIdleMotion( OwnerID() ,ruFUSION_MIME_CRAFTING_LOOP)
	while 1 do
		CastSpell( OwnerID(), OwnerID(), 497513)
		Sleep(600)
	end
end

function LuaAS_perform_02()	
	SetDefIdleMotion( OwnerID() ,ruFUSION_MIME_CRAFTING_LOOP)
	while 1 do
		CastSpell( OwnerID(), OwnerID(), 497514)
		Sleep(600)
	end
end

function LuaAS_perform_03()
	PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_BUFF_BEGIN , ruFUSION_ACTORSTATE_BUFF_LOOP )
	while 1 do
		CastSpell( OwnerID(), OwnerID(), 497515)
		Sleep(50)
	end
end

Function LuaAS_1hAttack()
	while 1 do
		PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_ATTACK_1H)
		sleep(10)
	end
end

function LuaS_117884()
	local range = 40
	WriteRoleValue( OwnerID(), EM_RoleValue_Register+1, LuaFunc_SearchNPCbyOrgID( OwnerID() ,117809  , 1000 , 0) )
	WriteRoleValue( OwnerID(), EM_RoleValue_Register+2,range)
	setplot(OwnerID(),"range","LuaS_117884_1",range)
end

function LuaS_117884_1()
	local com = ReadRoleValue( TargetID(), EM_RoleValue_Register+1)	
	local range = ReadRoleValue( TargetID(), EM_RoleValue_Register+2)	
	sleep(5)
	if	ReadRoleValue( com , EM_RoleValue_Register+2 ) == 0	then
		WriteRoleValue( com , EM_RoleValue_Register+2, 1 )
		AdjustFaceDir( com ,OwnerID(),0 )		
		PlayMotion(com,ruFUSION_ACTORSTATE_EMOTE_POINT)	
		sleep(5)
		NPCsay(com ,"[SC_117809_01]")	
		WriteRoleValue( com , EM_RoleValue_Register+2, 0 )
	end
	sleep(10)
	if	GetDistance( OwnerID() , TargetID() ) < range	then
		SetPosByFlag( OwnerID(), 780774 , 1 )	
		if	ReadRoleValue( com, EM_RoleValue_Register+2 ) == 0	then
			WriteRoleValue( com , EM_RoleValue_Register+2, 1 )
			AdjustFaceDir( com ,OwnerID(),0 )		
			PlayMotion(com,ruFUSION_ACTORSTATE_EMOTE_POINT)	
			NPCsay(com ,"[SC_117809_02]")			
			WriteRoleValue( com , EM_RoleValue_Register+2, 0 )
		end
	end
end
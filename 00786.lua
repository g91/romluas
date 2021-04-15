function LuaN_421420_1()
	DisableQuest( OwnerID() , true )
	local DBID = ReadRoleValue( TargetID(), EM_RoleValue_DBID ) 
	CastSpell( OwnerID(),OwnerID(),490098)
	sleep( 10 )
	SetFlag( TargetID() , 541792, 0 )
	local XX = LuaFunc_CreateObjByObj ( 100891 , OwnerID() )
	MoveToFlagEnabled ( OwnerID() , false )
	Hide( OwnerID() )
	SetPlot(XX,"dead" , "LuaN_421420_2",0)
	BeginPlot(XX,"LuaS_421420_5",0)
	SetAttack( XX , TargetID() )
	sleep( 10 )
	while true do
		if CheckID(XX) == false then
			sleep( 10 )
			Show( OwnerID() , 0 )
			--CastSpell( OwnerID(),OwnerID(),490098)
			sleep( 10 )
			if  Luafunc_Player_Alive( TargetID(),DBID,250 ) == true and ReadRoleValue( TargetID(), EM_RoleValue_IsDead) ~= 1 and CheckFlag( TargetID() , 541792 ) == true then 
				Say( OwnerID() , GetString("SAY_110279_3") ) --/*停停停～我投降！不要再打了！
				SetFlag( TargetID() , 542288, 1 )
				PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SURRENDER )
			end
			sleep( 50 )
			MoveToFlagEnabled ( OwnerID() , true )
			DisableQuest( OwnerID() , false )
			break
		end
		sleep( 10 )
	end
end

function LuaN_421420_2()
	if  ReadRoleValue( TargetID(), EM_RoleValue_IsDead) ~= 1 then 
		SetFlag( TargetID() , 541792, 1 )
	end	
	Delobj( OwnerID() )
	return false
end

function LuaN_421420_3()
	LoadQuestOption(OwnerID())
	local b=CheckAcceptQuest(OwnerID(),421420);
	local c=CheckFlag( OwnerID() , 541792 )
	if b == true and c == false then
	AddSpeakOption(OwnerID(),TargetID(),GetString("SC_421420_0"),"LuaS_421420_4",0)
	end
end

function LuaS_421420_4()
	CloseSpeak(OwnerID())
	BeginPlot(TargetID(),"LuaN_421420_1",0)
end
function LuaS_421420_5()
	LuaFunc_Obj_Suicide(50)
end
function LuaS_421420_6()
	SetFlag( OwnerID() , 541792, 0 )
end
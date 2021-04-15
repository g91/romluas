function LuaI_101801()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
	SetModeEX( OwnerID() , EM_SetModeType_Fight , false )
	SetPlot( OwnerID() , "Dead" , "LuaI_101801_Dead" , 0 )
	Hide( OwnerID() )
	Show( OwnerID() , Room )
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	sleep( 5 )
	local Guard = {}
	Guard[1] = Lua_CreateObjByDir( OwnerID() , 101775 , 50 , 0) 
	Guard[2] = Lua_CreateObjByDir( OwnerID() , 101775 , -50 , 0) 
	for i = 1 , 2 , 1 do
		SetModeEX( Guard[i] ,EM_SetModeType_Searchenemy ,false)
		AddToPartition( Guard[i] , Room )
		BeginPlot( Guard[i] , "LuaI_101775" , 0 )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register + i  , Guard[i] )
		SetPlot(  Guard[i]  , "Dead" , "LuaI_101775_Dead" , 0 )
	end
end

function LuaI_101775()
	local Type = 0
	while 1 do
		if HateListCount( OwnerID() ) == 0 and Type == 0 then
			AddBuff( TargetID() , 503248 , 1 , 10 )
			CastSpell( OwnerID() , TargetID() , 492184 )
		else
			if Type == 0 then
				AddBuff( OwnerID() , 502383 , 1 , 1 )
				Type = 1
			end
		end
		if CheckID( TargetID() ) == false or ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 1 then
			break
		end
		if ReadRoleValue( TargetID() , EM_RoleValue_PID ) > 0 or ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1 then
			break
		end
		sleep( 60 )
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 0 then
		DelObj( OwnerID() )
	end
end

function LuaI_101775_Dead()
	AddBuff( OwnerID() , 502383 , 1 , 1 )
	return true
end

function LuaI_101801_Spell()
	BeginPlot( OwnerID() , "LuaI_101801_Play" , 0 )
end

function LuaI_101801_Play()
	ScriptMessage( OwnerID(),0 , 0, "[SC_420938_0]", 0 ) --[101801]失去控制，掙脫了魔法護罩！
	ScriptMessage( OwnerID(),0 , 1, "[SC_420938_0]", 0 )
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_NORMAL, ruFUSION_ACTORSTATE_NORMAL)
	CancelBuff( OwnerID() , 503248 )
	SetModeEX( OwnerID() , EM_SetModeType_Fight , true )
	Hide( OwnerID() )
	Show( OwnerID() , Room )
	local AT = ReadRoleValue(OwnerID() , EM_RoleValue_AttackTargetID ) 
	local Obj
	for i = 1 , 2 , 1 do
		Obj = ReadRoleValue(OwnerID() , EM_RoleValue_Register + i ) 
		if CheckID( ReadRoleValue( Obj , EM_RoleValue_AttackTargetID ) ) == true then
			AT = ReadRoleValue( Obj , EM_RoleValue_AttackTargetID ) 
			break
		end
	end
	SetAttack( OwnerID() , AT)
	for i = 1 , 10 , 1 do
		sleep( 60 )
		if  HateListCount( OwnerID() ) == 0 and ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 0 then
			break
		end
		if i == 10 then
			ScriptMessage( OwnerID(),0 , 0, "[SC_420938_4]", 0 ) --[101801]的身體因為承受不了自己的力量而崩解了
			ScriptMessage( OwnerID(),0 , 1, "[SC_420938_4]", 0 ) --[101801]的身體因為承受不了自己的力量而崩解了
			if HateListCount( OwnerID() ) > 0 then
				LuaI_101801_Dead()
			end
			break
		end
	end
	for i = 1 , 2 , 1 do
		local Guard = ReadRoleValue( OwnerID() , EM_RoleValue_Register + i )
		if CheckID( Guard  ) == true and ReadRoleValue(Guard , EM_RoleValue_IsDead ) == 0 and ReadRoleValue(Guard , EM_RoleValue_OrgID) == 101775 then
			DelObj( Guard )
		end 
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 )
	LuaFunc_ResetObj( OwnerID() )
end

function LuaI_101801_Dead()
	local Member = HateListCount( OwnerID() )
	local Counter = 0
	if Zone11PQ_ValueGroup_Drama["Quest938"] ~= nil then
		Counter = Zone11PQ_ValueGroup_Drama["Quest938"] 
	end
	for i = 0 , Member-1 , 1 do
		local Player =  HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )
		if CheckAcceptQuest( Player , 420938 ) == true and CheckFlag(  Player ,  542627 ) == false and GetDistance( OwnerID() , Player ) < 300 then
			Zone11PQ_ValueGroup_Drama["Quest938"] = Counter +1
		end
	end 
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 )	
	return true
end

function LuaI_101774_0()
	Zone11PQ_ValueGroup_Drama = {}
	Zone11PQ_ValueGroup_Drama["Quest938"] = 0
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register + 1 , Obj:X() )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register + 2 , Obj:Y() )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register + 3 , Obj:Z() )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register + 4 , Obj:Dir() )
	SetPlot( OwnerID() , "dead" , "LuaI_101774_Dead" , 0 )
	Hide( OwnerID() )
	while 1 do
		if Zone11PQ_ValueGroup_Drama["Quest938"] >= 3 then
			Show( OwnerID() , Room )
			break
		end
		sleep( 60 )
	end
	Yell( OwnerID() , "[SC_420938_1]" , 5 ) --/*是誰膽敢擾亂我的實驗室！
	sleep( 900 )
	while 1 do
		if HateListCount( OwnerID() ) == 0 then
			break
		end
		sleep( 10 )
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) == 0 then
		SetPos( OwnerID(),  Obj:X() ,  Obj:Y() ,  Obj:Z()  ,  Obj:Dir()  )
		BeginPlot( OwnerID() , "LuaI_101774_Do" , 0 )
	end
end 

function LuaI_101774_Dead()
	local Member = HateListCount( OwnerID() )
	for i = 0 , Member-1 , 1 do
		local Player =  HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )
		if CheckAcceptQuest( Player , 420938 ) == true and CheckFlag(  Player ,  542627 ) == false and GetDistance( OwnerID() , Player ) < 300 then
			SetFlag(  Player , 542627 , 1 )
		end
	end 
	SetStopAttack( OwnerID() )
	Lua_CancelAllBuff( OwnerID() ) 
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 )
	BeginPlot( OwnerID() , "LuaI_101774_Reset" , 0 )
	return false
end

function LuaI_101774_Reset()
	local Pos ={}
	Pos["X"] = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 1 )
	Pos["Y"] = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 2 )
	Pos["Z"] = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 3 )
	Pos["Dir"] = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 4 )
	SetRoleCamp( OwnerID() , "Visitor" )
	Yell( OwnerID() , "[SC_420938_2]" , 5 ) --/*你們果然很有兩下子，但光憑這樣是破壞不了主人賜與我的這副身體。
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	sleep( 20 )
	Yell( OwnerID() , "[SC_420938_3]" , 5 ) --/*再見了！愚蠢的凡人們！
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CAST_INSTANT )
	sleep( 10 )
	CastSpell( OwnerID() , OwnerID() , 491922 )
	sleep( 10 )
	Hide( OwnerID() )
	SetPos( OwnerID(),  Pos["X"] , Pos["Y"] ,  Pos["Z"] ,  Pos["Dir"] )
	SetRoleCamp( OwnerID() , "Monster" )
	BeginPlot( OwnerID() , "LuaI_101774_Do" , 0)
end

function LuaI_101774_Do()
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
	BeginPlot( OwnerID() , "LuaI_101774_0" , 0)
end

function LuaQ_AcceptQuest_420940()
	Hide( OwnerID() )
	local Dummy = LuaFunc_CreateObjByObj( 112821 , OwnerID() )
	Lua_ObjDontTouch( Dummy) 
	Move( Dummy , 12755 , 21 , 23193 )
	sleep( 100 )
	Delobj( Dummy )
	Show( OwnerID() , 0 )
end
function LuaS_423300()		----player => owner   ;  隱形球 => target	
	SetPlot(OwnerID() , "range","LuaS_423300_0",300)
end

function LuaS_423300_0()		----player => owner   ;  隱形球 => target	
	if 	CheckAcceptQuest( OwnerID() , 423300 ) == true	and	----有接423320
		CheckFlag( OwnerID() , 544184) == false	and	----沒有任務flag
		CheckBuff(OwnerID() , 507165) == false	then	----沒有演戲buff
		if	ReadRoleValue(TargetID(),EM_RoleValue_Register +1) == 0	then	----not buzy then 演戲,給演戲buff
				BeginPlot(TargetID(),"LuaS_423300_1",1)
		else									----buzy then 給等待buff
				BeginPlot(TargetID(),"LuaS_423300_false",1)
		end
	end 
end

function LuaS_423300_false()		----player => target   ;  隱形球 => Owner	
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423300_11]" ,  "0xFFFFFF00" ) 		-----菲恩彌爾說在這裡等他，不妨在這裡多等一會。
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423300_11]" ,  "0xFFFFFF00" ) 
	AddBuff(TargetID(),507165,1,-1)				---給予等待BUFF
end

function LuaS_423300_1()
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,1 )
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423300_11]" ,  "0xFFFFFF00" ) 		-----菲恩彌爾說在這裡等他，不妨在這裡多等一會。
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423300_11]" ,  "0xFFFFFF00" ) 
	AddBuff(TargetID(),507165,1,-1)				---給予等待BUFF
	local samu1 = Lua_DW_CreateObj("obj",115788,OwnerID())   --samu1假人
	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID(),115792 , 200 , 0)
	--say(samu1,NPC)
	local samu2 = Lua_DW_CreateObj("obj",115787,NPC)   --samu2假人
	local NPC1 = LuaFunc_SearchNPCbyOrgID( OwnerID(),115677 ,200 , 0)
	local tony = Lua_DW_CreateObj("obj",115789,NPC1)   --tony假人	
	local NPC2 = LuaFunc_SearchNPCbyOrgID( OwnerID(),115678 , 200 , 0)
	local ith = Lua_DW_CreateObj("obj",115790,NPC2)   --ith假人	
	DisableQuest( tony , true )
	DisableQuest( samu1 , true )	
	DisableQuest( samu2 , true )	
	DisableQuest( ith , true )
	MoveToFlagEnabled(tony,false)
	MoveToFlagEnabled(ith,false)
	MoveToFlagEnabled(samu1,false)
	MoveToFlagEnabled(samu2,false)
	AdjustFaceDir( tony ,samu1, 0 )	
	AdjustFaceDir( ith ,samu1, 0 )	
	AdjustFaceDir( samu1 ,tony, 0 )	
	AdjustFaceDir( samu2 ,tony, 0 )	
	PlayMotion(samu1,ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(5)
	yell(samu1,"[SC_423300_0]",3)	---
	sleep(15)
	PlayMotion(ith,ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(5)
	yell(ith,"[SC_423300_1]",3)	---
	local Player = SearchRangePlayer ( OwnerID() , 300 )
		for i = 0 , table.getn(Player) do								---
			if	CheckBuff(player[i] , 507165) == true	and	CheckAcceptQuest( player[i] , 423300 ) == true	and	GetDistance( player[i]  , OwnerID() ) < 300	then
				ScriptMessage( player[i] , player[i] , 0 , "[SC_423300_2]" ,  "0xFFFFFF00" ) 		-----
				ScriptMessage( player[i] , player[i] , 1 , "[SC_423300_2]" ,  "0xFFFFFF00" ) 
			end
		end
	sleep(50)
	PlayMotion( tony,ruFUSION_ACTORSTATE_EMOTE_SPEAK )	
	yell(tony,"[SC_423300_3]",3)			---
	sleep(35)
	yell(samu2,"[SC_423300_4]",3)	---
	sleep(30)
	yell(tony,"[SC_423300_5]",3)			---
	sleep(35)
	PlayMotion(samu1,ruFUSION_ACTORSTATE_EMOTE_THINK)
	Yell(samu1,"[SC_423300_6]",3)						---
	sleep(40)
	AdjustFaceDir( samu2 ,samu1, 0 )
	sleep(5)
	AdjustFaceDir( samu1 ,samu2, 0 )	
	PlayMotion(samu2,ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	yell(samu2,"[SC_423300_7]",3)	---
	sleep(40)
	PlayMotion(samu1,ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	yell(samu1,"[SC_423300_8]",3)	---
	sleep(30)
	AdjustFaceDir( samu1 ,tony, 0 )	
	AdjustFaceDir( samu2 ,tony, 0 )	
	PlayMotion(samu1,ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(5)
	yell(samu1,"[SC_423300_9]",3)	---
	sleep(30)

	delobj(samu1)
	delobj(samu2)
	delobj(tony)
	delobj(ith)
	local Player = SetSearchAllPlayer ( 0 )			----刪除所有玩家的演戲BUFF
	for i = 1 , Player , 1 do 
		local ID = GetSearchResult()
		if CheckID(ID) == true and CheckBuff(	ID , 507165) == true	and	GetDistance( ID  , OwnerID() ) < 300	then
			SetFlag(ID,544184,1)
		end
		CancelBuff( ID  , 507165  ) 	--
	end
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0)
end







function LuaS_423300_plus()		----player => owner   ;  隱形球 => target	
	SetPlot(OwnerID() , "range","LuaS_423300_2",50)
end

function LuaS_423300_2()		----player => owner   ;  隱形球 => target
	if 	CheckCompleteQuest( OwnerID() , 423302 ) == false	and	ReadRoleValue(TargetID(),EM_RoleValue_Register +1) == 0	then	----有接423302	----有接423320
		CallPlot(TargetID(),"LuaS_423300_3",OwnerID())
	end 
end

function LuaS_423300_3(player)
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,1 )
	AdjustFaceDir( OwnerID(),player, 0 )	
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_POINT)	
	sleep(5)
	if	CheckCompleteQuest( player , 423300 ) == true	or	CheckFlag( player , 544184 ) == true	then
		Yell(OwnerID(),"[SC_423300_10]",3)
	else
		Yell(OwnerID(),"[SC_423300_12]",3)
	end
	sleep(30)
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )
end

function LuaS_angerfighter()
	beginplot(OwnerID(),"LuaS_angerfighter_1",0)
end
function LuaS_angerfighter_1()
	while 	true	do
		local fighter
		local x = ReadRoleValue ( OwnerID() , EM_RoleValue_X)
		local y = ReadRoleValue ( OwnerID()  , EM_RoleValue_Y)
		local z = ReadRoleValue ( OwnerID()  , EM_RoleValue_Z)	
		local count
		local Array = {x-100,y,z}
		local Array2 = {x+100,y,z}
		local ra = rand(2)
		if	ra == 0	then
			fighter = Lua_DW_CreateObj( "xyz" , 104147 , Array , 1 , 0 , 1 )
		else
			fighter = Lua_DW_CreateObj( "xyz" , 104148 , Array , 1 , 0 , 1 )
		end
		local elf = Lua_DW_CreateObj( "xyz" , 103993 , Array2 , 1 , 0 , 1 )
		SetRoleCamp(fighter,"SNPC")
		SetPlot(fighter , "Dead","LuaS_angerdead",100)
		SetPlot(elf , "Dead","LuaS_showelfdead",100)
		MoveDirect(fighter,x,y,z)
		MoveDirect(elf,x,y,z)
		SetAttack(elf,fighter)	
		count = 0
			while	count < 30	do	
				if	CheckID(fighter) == true	and	ReadRoleValue( fighter ,EM_RoleValue_Register +1) == 1	then
					SetRoleCamp(fighter,"Visitor")
					LuaFunc_WaitMoveTo(fighter,x-100,y,z)
					delobj(fighter)	
					break				
				end
				count = count +1
				sleep(10)
			end
		if	CheckID(fighter) == true	then	
			SetRoleCamp(fighter,"Visitor")
			LuaFunc_WaitMoveTo(fighter,x-100,y,z)
			delobj(fighter)	
		end
		if	CheckID(elf) == true	then
			delobj(elf)	
		end
		sleep(200)

	end
end
function LuaS_angerdead()
	Lua_CancelAllBuff( OwnerID() )
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,1 )
	return false
end

function LuaS_showelfdead()
	Lua_CancelAllBuff( OwnerID() )
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	delobj(OwnerID())
	return false
end
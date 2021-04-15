function LuaI_110341()
	local Wingman = {}
	for i = 0 , 3 , 1 do
		Wingman[i] = CreateObjByFlag( 100417, 780073 , i , 1 );
		SetRoleCamp( Wingman[i] , "Visitor" )
		MoveToFlagEnabled( Wingman[i] ,false )
		AddToPartition( Wingman[i] , 0 )
		sleep( 5 )
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end

function LuaS_110341_0()
	SetSpeakDetail( OwnerID(), GetString("ST_110341_0")   );
	--/*冒險者，我們正在巡邏，你們這樣會干擾我工作的。
	if CountBodyItem( OwnerID() , 200933 ) > 0 and CountBodyItem(OwnerID(),200934) == 0 then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110341_1") , "LuaS_110341_1", 0 ); --/*給他看克雷斯的命令。
	end
end

function LuaS_110341_1()
	CloseSpeak( OwnerID() ) --關閉對話劇情
	if DelBodyItem( OwnerID() , 200933 , 1 ) then 
		DisableQuest( TargetID() , true )
		BeginPlot(TargetID(),"LuaQ_420348_StepA", 0 )
	end
end

function LuaS_110341_EXIT()
	CloseSpeak( OwnerID() ) --關閉對話劇情
end

function LuaQ_420348_StepA()
	MoveToFlagEnabled( OwnerID() , false )
	if ReadRoleValue( OwnerID() , EM_RoleValue_IsNPC ) == 1 then
		WriteRoleValue( OwnerID() ,EM_RoleValue_Money , 0 )
	end
	local Wingman = LuaFunc_SearchNPCbyOrgID( OwnerID() , 100417 , 150 , 1 )
	local Check = "No"
	local TimeCount = 0
	AdjustFaceDir( OwnerID(),TargetID() , 0 ) 
	Yell( OwnerID() , GetString("SAY_110341_0"), 3 ) --/*首領下達要捉我的命令？
	sleep( 10 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_CRY )
	Yell( OwnerID() , GetString("SAY_110341_1"),3) --/*怎麼會這樣……我這些年來那麼忠於騎士團，並努力的為騎士團作事，沒想到現在竟然得到這樣的處置……
	sleep( 30 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	Yell( OwnerID() , GetString("SAY_110341_2"),3) --/*那我這麼辛苦的潛伏，不就一點意義也沒有了！
	sleep( 30 )
	local i = 0
	while 1 do
		if Wingman[i] == -1 then
			break
		end
		SetRoleCamp( WingMan[i] , "Monster" )
		Hide( WingMan[i])
		Show( WingMan[i] , 0 )
		SetAttack( WingMan[i], TargetID() )
		i = i + 1
	end
	local Class = LuaFunc_CreateObjByObj( 100416, OwnerID() )
	WriteRoleValue( Class, EM_RoleValue_PID,OwnerID() )
	Hide( OwnerID() )
	SetAttack( Class,TargetID() )
	MoveToFlagEnabled( Class, false )
	SetPlot( Class, "dead" , "LuaQ_420348_StepB" , 40 )
	while 1 do
		if TimeCount >= 600 then
			Check = "Yes" 
		end
		if ReadRoleValue( Class, EM_RoleValue_AttackTargetID ) == 0 and ReadRoleValue( Class, EM_RoleValue_Register ) == 0 and ReadRoleValue( OwnerID() , EM_RoleValue_PID ) == 0 then
			Check = "Yes" 
		end
		if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) > 0 then
			break
		end
		if Check == "Yes" then
			if CheckID( Class ) == true and ReadRoleValue( Class , EM_RoleValue_OrgID ) ==  100416 then
				DelObj( Class )
			end
			Show( OwnerID() , 0 )
			DisableQuest( OwnerID() , false )
			--i = 0
			for i = 0 , table.getn(Wingman) , 1  do
				if Wingman[i] == -1 then
					break
				end
				if CheckID( Wingman[i] ) == true and ReadRoleValue( Wingman[i] , EM_RoleValue_OrgID ) ==  100417 and ReadRoleValue( Wingman[i] , EM_RoleValue_IsDead ) ==  0  then
					Delobj( Wingman[i] )
				end
				Wingman[i] = CreateObjByFlag( 100417, 780073 , i , 1 );
				AddToPartition( Wingman[i] , 0 )
				MoveToFlagEnabled( Wingman[i] ,false )
				SetRoleCamp( WingMan[i] , "Visitor" )
				Hide( WingMan[i])
				Show( WingMan[i] , 0 )
				SetPosByFlag(WingMan[i], 780073 , i )
				AdjustFaceDir( WingMan[i] ,OwnerID(), 0 ) 
				--i = i + 1
			end
			MoveToFlagEnabled( OwnerID() , true )
			break
		end
		sleep( 30 )
		TimeCount = TimeCount + 3	
	end
	TimeCount = nil
	Check = nil
end

function LuaQ_420348_StepB()
	if ReadRoleValue( OwnerID() , EM_RoleValue_IsNPC ) == 1 then
		WriteRoleValue( OwnerID() ,EM_RoleValue_Register , TargetID() )
	end
	local Wingman = LuaFunc_SearchNPCbyOrgID( OwnerID() , 100417 , 150 , 1 )
	local PlayerTeam = HateListCount( OwnerID() )
	for i = 1 , PlayerTeam, 1 do
		local ID = HateListInfo(OwnerID() ,i-1 , EM_HateListInfoType_GItemID );
		if CheckAcceptQuest( ID, 420348) == true and CountBodyItem(ID, 200934 ) == 0 then
			GiveBodyItem( ID , 200934 , 1 )
		end 
		local Party = LuaFunc_PartyData(ID)
		for i = 1 , Party[0] , 1 do
			if CheckAcceptQuest( Party[i] , 420348) == true and CountBodyItem( Party[i] , 200934 ) == 0 and GetDistance( OwnerID() , Party[i] ) < 500 then
				GiveBodyItem( Party[i] , 200934 , 1 )
			end 
		end
	end 
	local i = 0
	for i = 0 , table.getn(Wingman) , 1  do
		if Wingman[i] == -1 then
			break
		end
		if ReadRoleValue( Wingman[i] , EM_RoleValue_IsDead ) == 0 then
			SetRoleCamp( WingMan[i] , "Visitor" )
			Lua_CancelAllBuff( WingMan[i]  ) 
			--Hide( WingMan[i])
			--Show( WingMan[i] , 0 )
			PlayMotion( WingMan[i] ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)
		end
	end
	SetRoleCamp( OwnerID() , "Visitor" )
	Lua_CancelAllBuff( OwnerID() ) 
	Yell( OwnerID() , GetString("SAY_110341_3") , 3 ) --/*可惡！沒想到敗在這裡……
	BeginPlot( OwnerID() , "LuaQ_420348_StepC" , 0 )
	return false
end

function LuaQ_420348_StepC()
--	SetPlot( OwnerID() , "dead" , "LuaQ_420348_Redead" , 40 )
	Local Player = 	ReadRoleValue( OwnerID() ,EM_RoleValue_Register )
	local Wingman = LuaFunc_SearchNPCbyOrgID( OwnerID() , 100417, 150 , 1 )
	local Class = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Killer = {}
	local Role = Role:new( OwnerID() )
	local X 
	local Y
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN)	
	sleep( 30 )
	Say( OwnerID() , GetString("SAY_110341_4")) --/*等等！你不可以拿走那個徽章！那個徽章是………
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_END)
	sleep( 5 )
	local i = 0
	for i = 0 , table.getn(Wingman) , 1  do
		if Wingman[i] == -1 then
			break
		end
		if CheckID(Wingman[i] ) == true and ReadRoleValue( Wingman[i] , EM_RoleValue_IsDead ) ==  0 then
			PlayMotion( Wingman[i] , ruFUSION_ACTORSTATE_CROUCH_END)
		end
		--i = i + 1
	end
	Castspell( OwnerID() , OwnerID() ,491034)
	sleep( 30 )
	i = 0 
	for i = 0 , table.getn(Wingman) , 1  do
		if Wingman[i] == -1 then
			break
		end
		if CheckID(Wingman[i] ) == true and ReadRoleValue( Wingman[i] , EM_RoleValue_IsDead ) ==  0 then
			Castspell( Wingman[i] , Wingman[i] , 491034)
			PlayMotion( Wingman[i] , ruFUSION_ACTORSTATE_DYING )
			BeginPlot( Wingman[i]  , "LuaQ_420348_Sui" , 0 )
			--DelObj( Wingman[i] )
		end
		--i = i + 1
	end
	Yell( OwnerID() , GetString("SAY_110341_5"), 3 ) --/*你...你們...
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_DYING )
	sleep( 30 )
	for i = 0 , 3 , 1 do
		if i == 0 then
			X = Role:X()+50
			Z = Role:Z()
		elseif i == 1 then
			X = Role:X()-50
			Z = Role:Z()
		elseif i == 2 then
			X = Role:X()
			Z = Role:Z()+50
		else
			X = Role:X()
			Z = Role:Z()-50
		end
		Killer[i] = CreateObj( 100418 , X , Role:Y() , Z , 0 , 1)
		BeginPlot( Killer[i] ,"LuaQ_420348_Sui" , 0 )
		AddToPartition( Killer[i] , 0 )
		SetAttack( Killer[i] , Player )
	end
	BeginPlot( Class, "LuaQ_420348_Show" , 0 )	
--	Say( OwnerID() , Class)
	sleep( 50 )
	DelObj( OwnerID()  )
end

function LuaQ_420348_Sui()
	LuaFunc_Obj_Suicide(30)
end

function LuaQ_420348_Redead()
	return true
end

function LuaQ_420348_Show()
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 7 )
	sleep( 600 )
	Show( OwnerID() , 0 )
	DisableQuest( OwnerID() , false )
	MoveToFlagEnabled( OwnerID() , true )
	BeginPlot( OwnerID() , "LuaI_110341" , 0 )
end
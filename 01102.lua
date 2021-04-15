function LuaS_111796_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 421607 ) == true and CheckCompleteQuest( OwnerID() , 421607 ) == false and CheckFlag(OwnerID() , 542229 ) == false then
		AddSpeakOption( OwnerID(), TargetID(),  "[SC_111796_0]","LuaS_111796_1", 0 ); --我準備好了。
	end
end

function LuaS_111796_1()
	CloseSpeak(OwnerID())
	BeginPlot( TargetID() , "LuaQ_421607_Accept" , 0 )
end

function LuaQ_421607_Accept()
	DisableQuest( OwnerID() , true )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 ) --PID 歸零
	local Player = LuaFunc_PartyData(TargetID())  
	local DBID = {}
	local Flag = 780217

	for i = 1 , Player[0] , 1 do
		DBID[i] = ReadRoleValue( Player[i] , EM_RoleValue_DBID )
	end 
	Say( OwnerID() , "[SC_111796_1]") --那開始吧！柴列克大人已經過來了。
	local CLK = CreateObjByFlag( 101249, flag , 5 , 1 )
	local Pri = {}
	Pri[1] = CreateObjByFlag( 101251, flag , 6 , 1 )
	Pri[2] = CreateObjByFlag( 101250, flag , 7 , 1 )
	Pri[3] = CreateObjByFlag( 101251, flag , 8 , 1 )
	Pri[4] = CreateObjByFlag( 101251, flag , 9 , 1 )
	SetFightMode ( CLK,0, 1, 1,0 )
	AddToPartition( CLK , 0 )
	BeginPlot( CLK , "LuaQ_421607_CLK" , 0 )
	SetPlot( CLK , "dead" , "LuaQ_421607_Dead" , 0 )

	for i = 1 , 4 , 1 do
		WriteRoleValue( Pri[i] , EM_RoleValue_Register , i )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register + i , Pri[i] )
		SetFightMode ( Pri[i] ,0, 1, 1,0 )
		AddToPartition( Pri[i] , 0 )
		BeginPlot( Pri[i] , "LuaQ_421607_Pri" , 0 )
		SetPlot( Pri[i] , "dead" , "LuaFunc_DeadPlay" , 0 )
	end
	
	local Count = 0
	local State = 0
	local Enermy = {}
	local EnermyCount = 1
	local Fight = "Doing"

	While 1 do

		if CheckID( CLK ) == false or ReadRoleValue(CLK,EM_RoleValue_IsNPC) == 0 then
			break
		end
		if ReadRoleValue( CLK , EM_RoleValue_PID ) == 7  then
			if Count == 10 and State < 3  and Fight == "Doing" then
				Say( OwnerID() , "[SC_111796_2]") --小心！是那些蒙面的傢伙！
				for i = 1 , 3 , 1 do
					Enermy[EnermyCount] = CreateObjByFlag( 101252, flag , 5 + i , 1 )
					WriteRoleValue( Enermy[EnermyCount] , EM_RoleValue_Register , i )
					WriteRoleValue( Enermy[EnermyCount] , EM_RoleValue_PID , CLK )
					AddToPartition( Enermy[EnermyCount] , 0 )
					BeginPlot( Enermy[EnermyCount] , "LuaQ_421607_Enermy" , 0 )
					if i == 1 then
						if HateListCount( Pri[i] ) < 1 then
							SetAttack( Pri[i] , Enermy[EnermyCount] )
						end
					else
						if HateListCount( Pri[i] ) < 1 then
							SetAttack( Pri[i+1] , Enermy[EnermyCount] )
						end
					end
					EnermyCount = EnermyCount + 1
				end
			end

			if Count == 15  and State < 3 and Fight == "Doing" then
				Enermy[EnermyCount]  = CreateObjByFlag( 101253, flag , 7 , 1 )
				WriteRoleValue( Enermy[EnermyCount] , EM_RoleValue_PID , CLK )
				AddToPartition( Enermy[EnermyCount] , 0 )
				BeginPlot( Enermy[EnermyCount] , "LuaQ_421607_Boss" , 0 )
				if HateListCount( Pri[2] ) < 1 then
					SetAttack( Pri[2] , Enermy[EnermyCount] )
				end
				EnermyCount = EnermyCount + 1
				State = State + 1
			end
			if State > 2 and Fight ~= "Over" then
				Fight = "Over"
				for i = 1 , table.getn(Enermy) , 1 do
					if CheckID(Enermy[i]) == true and ReadRoleValue( Enermy[i] ,EM_roleValue_IsDead ) == 0 then
						Fight = "Doing"
					end
				end
				if Fight == "Over" then
					WriteRoleValue( CLK , EM_RoleValue_PID , 17 )
				end
			end
			if Count == 30 then
				Count = 0
			end

			Count = Count + 1
		end
		Sleep(10)
	end

	if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) ~= 700 then --檢測用，由柴列克消失前給予
		for i = 1 , Player[0] , 1 do
			if LuaFunc_PlayerCheck( Player[i]  , DBID[i])== true and ReadRoleValue(Player[i] , EM_RoleValue_IsDead) ~= 1 then
				if CheckAcceptQuest( Player[i] , 421607 ) == true and CheckCompleteQuest(Player[i]  , 421607 ) == false and CheckFlag(Player[i] , 542229 ) == false then
					SetFlag( Player[i] , 542229 , 1 )
				end
			end
		end
	end
	DisableQuest( OwnerID() , false)
end

function LuaQ_421607_CLK()
	MoveToFlagEnabled( OwnerID() , false )
	local Flag = 780217
	local Pri = {}
	for i = 1 , 4 , 1 do
		Pri[i] = ReadRoleValue( TargetID() , EM_RoleValue_Register + i )
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 1 ) 
	LuaFunc_MoveToFlag( OwnerID(), 780217 , 0 ,0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 0 ) 
	SetFightMode( OwnerID() , 0 , 1 , 1 ,1 )
	Say( OwnerID() , "[SC_111796_7]") --儀式即將開始，我的背後就交給你們了...
	sleep(15)
	CastSpell( OwnerID() , OwnerID() ,490102)
	sleep(15)
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 7 )
	local Fight = "NO"
	while 1 do
		if HateListCount( OwnerID() ) > 0 and Fight == "NO" then
			CancelBuff( OwnerID() , 500902 )
			Say( OwnerID() , "[SC_111796_6]") --煩人的蟲子出現了...
			SetFightMode( OwnerID() , 1 , 1 , 1 ,1 )
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 700 )
			Fight = "YES"
		end

		if Fight == "YES" and HateListCount( OwnerID() ) < 1 then
			for i = 1 , 4  , 1 do
				if HateListCount( Pri[i] ) > 0 then
					local tar = HateListInfo(Pri[i] ,0 , EM_HateListInfoType_GItemID );
					SetAttack( OwnerID() , tar )
					CastSpell( OwnerID() , tar , 492180 )
					break
				end
			end
		end

		if ReadRoleValue(OwnerID() , EM_RoleValue_PID ) > 7  then
			WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 1 ) 	
			break
		end
		sleep( 10 )
	end
	if CheckBuff( OwnerID() , 500902 ) == true then
		CancelBuff( OwnerID() , 500902 )
	end
	Say( OwnerID() , "[SC_111796_3]") --儀式已經結束了...
	SetStopAttack(OwnerID() )
	SetFightMode( OwnerID() , 0 , 1 , 1 ,0 )
	LuaFunc_MoveToFlag( OwnerID(), 780217 , 10 ,0 )
	for i = 1 , 4 , 1 do
		if CheckID( Pri[i] ) == true and ReadRoleValue( Pri[i] , EM_RoleValue_IsNPC ) == 1 then
			SetStopAttack(Pri[i] )
			SetFightMode( Pri[i] , 0 , 1 , 1 ,0 )
			WriteRoleValue(Pri[i] , EM_RoleValue_IsWalk , 1 ) 
			BeginPlot( Pri[i] ,"LuaQ_421607_GoHome" , 0)
		end
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_PID ) == 700 then
		Say( OwnerID() , "[SC_111796_4]") --很遺憾，中途被干擾，我們得重新準備儀式才行。
	else
		Say( OwnerID() , "[SC_111796_5]") --「巴斯索維爾」，根據占卜，風之靈給我了這個名字。
	end
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(20)
	LuaFunc_MoveToFlag( OwnerID(), 780217 , 5 ,0 )	
	DelObj( OwnerID() )
end

function LuaQ_421607_Pri()
	MoveToflagEnabled( OwnerID() , false )
	local Flag = 780217
	local num = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 1 ) 
	LuaFunc_MoveToFlag( OwnerID(), 780217 , num ,0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 0 ) 
	AdjustDir( OwnerID(), 180 )
	SetFightMode( OwnerID() , 1 , 1 , 1 ,1 )
end

function LuaQ_421607_Enermy()
	MoveToflagEnabled( OwnerID() , false )
	local num = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	local tar = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Obj = Role:new(tar)
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 0 ) 
	while 1 do
		if HateListCount( OwnerID() ) < 1 then
			SetAttack( OwnerID() , tar )
			MoveDirect( OwnerID(), Obj:X() , Obj:Y() , Obj:Z() )
		end
		sleep(5)
	end	
end

function LuaQ_421607_Boss()
	MoveToflagEnabled( OwnerID() , false )
	local tar = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Obj = Role:new(tar)
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 0 ) 
	while 1 do
		if HateListCount( OwnerID() ) < 1 then
			SetAttack( OwnerID() , tar )
			MoveDirect( OwnerID(), Obj:X() , Obj:Y() , Obj:Z() )
		end
		sleep(5)
	end
end

function LuaQ_421607_GoHome()
	
	LuaFunc_MoveToFlag( OwnerID(), 780217 , 5 ,0 )
	DelObj( OwnerID() )
end

function LuaQ_421607_Dead()
	return false
end
function LuaI_110458() 
	SetPlot( OwnerID() , "touch" , "LuaQ_420346_Start" , 40 )
end

function LuaQ_420346_Start()
	if CheckAcceptQuest( OwnerID() , 420346 ) and CountBodyItem( OwnerID() ,200932 ) == 0 then
		SetPlot( TargetID() , "touch" , "LuaFunc_Obj_Nothing" , 40 )
		BeginPlot( TargetID() , "LuaQ_420346_StepA" , 0 )
	end
end

function LuaQ_420346_StepA()
	Hide( OwnerID() )
	local Conniver = CreateObjByFlag(100424,780039, 0 , 0 )
	SetPlot( Conniver ,"dead","LuaQ_420346_StepB",40)
	AddToPartition( Conniver , 0 )
	SetAttack( Conniver , TargetID() )
	SAY( Conniver , GetString("EM_420346_2") ) --/*不管你們是誰派來的，想偷走這個文件？去死吧！
	BeginPlot( Conniver,"LuaQ_420346_Sui",0 )
	WriteRoleValue( Conniver , EM_RoleValue_PID , OwnerID() ) --傳遞自己的代號
end

function LuaQ_420346_StepB()
	BeginPlot( TargetID(), "LuaQ_420346_StepC", 0 )
	return true
end

function LuaQ_420346_StepC()
	local OBMT = CreateObjByFlag(100423,780039, 0 , 0 )
	local Paper = ReadRoleValue( TargetID() , EM_RoleValue_PID )
	SetRoleCamp(OBMT,"Visitor")
	AddToPartition( OBMT , 0 )
	BeginPlot( OBMT, "LuaQ_420346_StepD", 0 )
	SetPlot( OBMT , "dead", "LuaQ_420346_Dead" , 40 )
	WriteRoleValue( OBMT , EM_RoleValue_PID , Paper ) --傳遞計畫書的代號
end

function LuaQ_420346_StepD()

	local Player = TargetID()
	local Paper = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local DBID = ReadRoleValue( Player , EM_RoleValue_DBID )
	MoveToFlagEnabled( OwnerID() ,false)
	WriteRoleValue( OwnerID(),EM_RoleValue_IsWalk , 0 )
	SAY( OwnerID() , GetString("EM_420346_3") ) --/*入侵者！黑曜騎士團派人來突襲我們了！
	LuaFunc_MoveToFlag( OwnerID(), 780039 , 1 ,0 )
	SetRoleCamp( OwnerID() , "Monster" )
	Hide(OwnerID() )
	Show(OwnerID() , 0)
	SetAttack( OwnerID() , player )
	local Guard = {}
	local i = 0
	local t = 4
	while 1 do
		if  Luafunc_Player_Alive( Player,DBID,300 ) == false or ReadRoleValue( Player, EM_RoleValue_IsDead) == 1 then 
			--檢查玩家是否存活或是離開
--			Say( OwnerID(),"任務失敗")
			BeginPlot( Paper , "LuaQ_420346_Fin" , 0 )
			DelObj( OwnerID() )
			break
		elseif CheckID(OwnerID()) == false or ReadRoleValue( OwnerID(), EM_RoleValue_IsDead) == 1 then
			BeginPlot( Paper , "LuaQ_420346_Fin" , 0 )
			break
		else
			if t == 4 then
				if i ~= 12 then
					SAY( OwnerID() , GetString("EM_420346_3") ) --/*入侵者！黑曜騎士團派人來突襲我們了！
					for j = 2 , 4 , 1 do
						if CheckID( Guard[i] ) == false then
							Guard[i] = CreateObjByFlag( 100421 , 780039 , j , 1 )
							AddToPartition( Guard[i] , 0 )
							SetPlot( Guard[i],"dead","LuaQ_420346_Dead2",0)
							BeginPlot( Guard[i],"LuaQ_420346_Sui2",0 )
							SetAttack( Guard[i] , Player )
						end
						i = i + 1
					end
					
				else
					i = 0
				end
				t = 0
			else
				t = t+1
			end
		end
		sleep( 60 )
	end
end

function LuaQ_420346_Fin()
	sleep( 200 )
	Show( OwnerID() , 0 )
	SetPlot( OwnerID() , "touch" , "LuaQ_420346_Start" , 40 )	
end

function LuaQ_420346_Dead()
	local Paper = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
--	local Player = LuaFunc_PartyData(TargetID())
--	for i = 1 , Player[0] , 1 do
--		if CheckAcceptQuest( Player[i] , 420346) == true and CountBodyItem( Player[i] , 200932 ) == 0 then
--			GiveBodyItem( Player[i] , 200932 , 1 )
--		end 
--	end
	BeginPlot( Paper ,"LuaQ_420346_Fin" , 0 )

end

function LuaQ_420346_Dead2()
	BeginPlot( OwnerID() , "LuaFunc_DeadPlay" , 0 )
	return false
end

function LuaQ_420346_Sui()
	local Paper = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	Sleep(30)
	while 1 do
		sleep(1)
		if ReadRoleValue( OwnerID(), EM_RoleValue_AttackTargetID ) ~= 0 then 
			sleep(60)	-- 六秒檢查一次	
		else
			BeginPlot( Paper , "LuaQ_420346_Fin" , 0 )
			DelObj( OwnerID() )
			break		
		end
	sleep(1)
	end
end
function LuaQ_420346_Sui2()
	LuaFunc_Obj_Suicide(30)
end
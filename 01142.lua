function LuaS_203575_MonsterSummoner( Option )
	local PlayerID = OwnerID()
	local PackageID = 203575		-- 怪物召喚者

	if ( Option == "CHECK" ) then
		if ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		BeginPlot( PlayerID , "LuaS_203575_MonsterSummon" , 0 )
	end

end

function LuaS_203575_MonsterSummon()
	local PlayerID = OwnerID()
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	local CheckTime = 1
	local RunTime = 1
	local MonsterAreaGroup = { "LV24 Mob" , "LV24 + LV 19 *2 Mobs" , "LV35 + LV 30 *3 Mobs" , "LV35 + LV 30 *4 Mobs" , "LV 40 Boss" , "LV20 Small Boss" , "Exit MENU" }

	DialogCreate( PlayerID , EM_LuaDialogType_Select , " Which Group of MONSTER will You want to summon ? " )
	for i = 1 , table.getn( MonsterAreaGroup ) do
		--Say(PlayerID , i)
		--Say(PlayerID , MonsterAreaGroup[i])
		DialogSelectStr( PlayerID , MonsterAreaGroup[i] )
	end
	if( DialogSendOpen( PlayerID ) == false ) then 
		ScriptMessage( PlayerID , PlayerID , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--資料送出有問題
		return 0
	end

	while true do
		Sleep( CheckTime )
		RunTime = RunTime + 1
		if RunTime  > 600 then -- 防無窮迴圈，600 = 一分鐘

			DebugMsg( 0, RoomID ,"Exit the MENU because IDLE a long Time !!")
			DialogClose( PlayerID )
			break
		end

		DialogStatus = DialogGetResult( PlayerID )
		--Say( PlayerID , DialogStatus )

		if DialogStatus == -2 then
			-- DO nothing
		elseif DialogStatus == 6 or DialogStatus == -1 then
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 0 then
			CallPlot( PlayerID , "LuaS_203575_SummonMonster" , "ZONE1" )
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 1 then
			CallPlot( PlayerID , "LuaS_203575_SummonMonster" , "ZONE2" )
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 2 then
			CallPlot( PlayerID , "LuaS_203575_SummonMonster" , "ZONE3" )
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 3 then
			CallPlot( PlayerID , "LuaS_203575_SummonMonster" , "ZONE4" )
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 4 then
			CallPlot( PlayerID , "LuaS_203575_SummonMonster" , "BOSS" )
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 5 then
			CallPlot( PlayerID , "LuaS_203575_SummonMonster" , "sBoss" )
			DialogClose( PlayerID )
			break
		end
	end

end

function LuaS_203575_SummonMonster( ZONE )
	local PlayerID = OwnerID()
	local MonsterID = { 101478 ,  101478 , 101480 , 101480 , 101476 , 101477 }
	local mMonsterID = { 101479 ,  101479 , 101481 , 101481 }
	local mX={ -20, 20, -20, 20 }
	local mZ={ -20, -20, 20, 20 }

	if ZONE == "ZONE1" then
		local Boss = CreateMonsterByBOSSBatch( MonsterID[1] , PlayerID , 0 , 0 )

	elseif ZONE == "ZONE2" then
		local Boss = CreateMonsterByBOSSBatch( MonsterID[2] , PlayerID , 0 , 0 )
			for i = 1, 2 do
		                        CreateMonsterByBOSSBatch( mMonsterID[i] , Boss , mX[i] , mZ[i] )
			end
	elseif ZONE == "ZONE3" then
		local Boss = CreateMonsterByBOSSBatch( MonsterID[3] , PlayerID , 0 , 0 )
			for i = 1, 3 do
		                        CreateMonsterByBOSSBatch( mMonsterID[i] , Boss , mX[i] , mZ[i] )
			end
	elseif ZONE == "ZONE4" then
		local Boss = CreateMonsterByBOSSBatch( MonsterID[4] , PlayerID , 0 , 0 )
			for i = 1, 4 do
		                        CreateMonsterByBOSSBatch( mMonsterID[i] , Boss , mX[i] , mZ[i] )
			end
	elseif ZONE == "BOSS" then
		local Boss = CreateMonsterByBOSSBatch( MonsterID[5] , PlayerID , 0 , 0 )

	elseif ZONE == "sBoss" then
		local Boss = CreateMonsterByBOSSBatch( MonsterID[6] , PlayerID , 0 , 0 )

	end
end
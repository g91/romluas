function LuaS_421429_0()
	DisableQuest( OwnerID() , true )--關閉接任務
	Discowood_421429 = 0

	CastSpell( OwnerID() , OwnerID() , 491276 )
	sleep(40)


	local Monster = {}
	local ClassHighNo = LuaS_Discowood_FlagShowMonster( 100889 , "NoTarget" , 780089 , 3 , "LuaS_421429_1" )
	local Chailek = LuaS_Discowood_FlagShowMonster( 100888 , ClassHighNo , 780094 , 2 , "LuaS_421429_3" )
	Monster = {
			[1] = LuaS_Discowood_FlagShowMonster( 100887 , ClassHighNo , 780089 , 2 , "LuaS_421429_5" ),
			[2] = LuaS_Discowood_FlagShowMonster( 100887 , ClassHighNo , 780090 , 2  , "LuaS_421429_5" ),
			[3] = LuaS_Discowood_FlagShowMonster( 100887 , ClassHighNo , 780091 , 2  , "LuaS_421429_5" ),
			[4] = LuaS_Discowood_FlagShowMonster( 100886 , ClassHighNo , 780092 , 2  , "LuaS_421429_5" ),
			[5] = LuaS_Discowood_FlagShowMonster( 100886 , ClassHighNo , 780093 , 2  , "LuaS_421429_5" )
			}
	WriteRoleValue( ClassHighNo , EM_RoleValue_PID , TargetID() )--要記得改回target
	WriteRoleValue( Chailek , EM_RoleValue_PID , TargetID() )--要記得改回target


	local Array = {}

	while true do
		Array = LuaFunc_PartyData( TargetID() )

		if	Discowood_421429 == 1 then
------------------------------戰鬥結束，將風野聚落的人變友善
			Hide(Chailek)
			SetRoleCamp( Chailek  , "SNPC" )--改變陣營
			Show(Chailek , 0)
			for i=1 , table.getn(Monster) do
				if CheckID( Monster[i] ) then
					Hide( Monster[i] )
					SetRoleCamp( Monster[i]  , "SNPC" )--改變陣營
					Show( Monster[i]  , 0)
				end
			end
----------------------------------演出劇情
			Say( Chailek , GetString("SC_421429_1")  )--停手！
			sleep(20)
			Say( Chailek , GetString("SC_421429_2")  )--我今日來此，並不是要和你一決生死。

			sleep(20)
			Say( ClassHighNo , GetString("SC_421429_3")  )--風之子民……那麼你想談和？

			sleep(20)
			Say( Chailek , GetString("SC_421429_4")  )--沒錯，我想你們來此的目的也不是趕盡殺絕吧！
			sleep(20)
			Say( ClassHighNo , GetString("SC_421429_5")  )--那……我們就以伊卡奧勒斯河為界，我的人會退到南邊。

			sleep(20)
			Say( Chailek , GetString("SC_421429_6")  )--如果你能約束手下，我想我們可以維持永久的和平……

			sleep(20)
			Say( ClassHighNo , GetString("SC_421429_7")  )--那就這麼說定了，睿智的酋長，我很高興今天能和你見面。

			sleep(20)
			Say( Chailek , GetString("SC_421429_8")  )--我也是。還有，今天是我打過最艱難的一仗。

			sleep(20)
			Say( ClassHighNo , GetString("SC_421429_9")  )--哈哈哈！我又何嘗不是……
			sleep(35)
-------------------------------------------------
			DelObj( ClassHighNo )
			DelObj( Chailek )
			for i=1 , table.getn(Monster) do
				if CheckID( Monster[i] ) then
					DelObj( Monster[i] )
				end
			end
-------------------------------------------
			for i=1 , Array[0] do
				if 	(  Checkflag ( Array[i] , 541593 ) or CheckFlag( Array[i] , 541594 )  ) and -- 戰鬥中止的時候他要在
					CheckDistance( OwnerID(), Array[i] , 500 ) and --不能離的太遠
					CheckAcceptQuest( Array[i] , 421429 ) and -- 身上有任務
					ReadRoleValue( Array[i] , EM_RoleValue_IsDead ) == 0 then -- 必須是活著的

					SetFlag( Array[i] , 541793 , 1 )
				end
			end
			break


		end

		sleep(20)

	end

	DisableQuest( OwnerID() , false )--開放接任務
end

function LuaS_421429_1()
	SetPlot( OwnerID() , "dead" , "LuaS_421429_2" , 30 )
end

function LuaS_421429_2()
	local Target = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local HP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP)
	local Array = LuaFunc_PartyData( Target )

	for i=1 , Array[0] do

		if 	CheckDistance( OwnerID(), Array[i] , 500 ) and
			CheckAcceptQuest( Array[i] , 421429 ) and
			ReadRoleValue( Array[i] , EM_RoleValue_IsDead) == 0 then

			SetFlag( Array[i] , 541593 , 1 )
		end
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_HP ,  HP )
	Discowood_421429 = 1
	return false
end




function LuaS_421429_3()
	SetPlot( OwnerID() , "dead" , "LuaS_421429_4" , 30 )
end

function LuaS_421429_4()
	local Target = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local HP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP)
	local Array = LuaFunc_PartyData( Target )


	for i=1 , Array[0] do
		if 	CheckDistance( OwnerID(), Array[i] , 500 ) and
			CheckAcceptQuest( Array[i] , 421429 ) and
			ReadRoleValue( Array[i] , EM_RoleValue_IsDead) == 0 then

			SetFlag( Array[i] , 541594 , 1 )
		end
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_HP ,  HP )
	Discowood_421429 = 1
	return false
end

function LuaS_421429_5()
	SetPlot(OwnerID() , "dead" , "LuaS_421429_6" , 30)
end

function LuaS_421429_6()
	DelObj(OwnerID())
	return false
end
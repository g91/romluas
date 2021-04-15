
function LuaS_421102_0()
	Hide(OwnerID())
	local Car = LuaFunc_CreateObjByObj ( 100807 , OwnerID() )--創造車子
	AddToPartition( Car ,    0 )
	SetFightMode ( Car,0,0,0,1 )
	BeginPlot(Car , "LuaS_421102_1" , 0 )


	local No1 = LuaS_Discowood_CreateMonster( 101343, Car , -36009.4 , 44.2 , 3903.2 , 277 , "LuaS_Discowood_CheckPeace" , "SNPC" )
	local No2 = LuaS_Discowood_CreateMonster( 101343, Car , -35985.5 , 52 , 3918 , 239 , "LuaS_Discowood_CheckPeace" , "SNPC"  )

	while true do
		sleep(10)
		if ReadRoleValue(Car , EM_RoleValue_IsDead ) == 1 then
			ScriptMessage( TargetID(), TargetID(), 0, GetString("SC_421102_2"), 0 ) --巨狼徹底破壞了候榭偶的貨車然後揚長而去……
			DelObj(Car)
		end
		if CheckID(No1) or CheckID(No2) then
		else
			DelObj(Car)
			sleep(50)
			Show(OwnerID() , 0 )
			break
		end
	end	
	
end

function LuaS_421102_1()
	while true do
		sleep(1)
		if ReadRoleValue(OwnerID() , EM_RoleValue_IsDead ) == 1 then
			DelObj(OwnerID())
		end
	end
end

function LuaS_421102_2()
	if CheckAcceptQuest( OwnerID() , 421102) == true and CountBodyItem( OwnerID(), 202260)>=1 and CheckFlag( OwnerID(), 541131 ) == false then
		LoadQuestOption(OwnerID())
		AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_421102_0") , "LuaS_421102_3", 0 ) --玩家選項：將小袋子塞進貨車
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaS_421102_3()
	CloseSpeak(OwnerID())
	DelBodyItem( OwnerID(), 202260, 1 )
	BeginPlot( TargetID() , "LuaS_421102_0", 0 )--叫貨車執行自毀程序
	SetFlag( OwnerID()  , 541131 , 1 )
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421102_3"), 0 ) --你聽到山坡上傳來一聲狼嚎……
end





function LuaS_421102_5()
	SetFlag(OwnerID() , 541131 , 0 )
end
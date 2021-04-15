function LuaQ_421610_Accept()
	DisableQuest( OwnerID() , True )
	Hide( OwnerID() )
	local BathShowWear = LuaFunc_CreateObjByObj ( 101386 , OwnerID() )
	SetAttack( BathShowWear , TargetID() )
	SetPlot( BathShowWear , "dead" , "Lua_101386_Dead" , 0 )
	BeginPlot( BathShowWear , "Lua_BathShowWear_Battle" , 0 )
	WriteRoleValue( BathShowWear , EM_RoleValue_PID , OwnerID() )
end

function Lua_101386_Dead()
	local Mala_rake = LuaFunc_CreateObjByObj ( 111829 , OwnerID() )
	local BathShowWear = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	WriteRoleValue( Mala_rake , EM_RoleValue_PID , BathShowWear )
	WriteRoleValue( Mala_rake , EM_RoleValue_Register , TargetID() )
	DisableQuest(Mala_rake,True )
	BeginPlot( Mala_rake , "Lua_Mala_rake_111829" , 0 )
	return true
end

function Lua_BathShowWear_Battle()
	Local Owner = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	Sleep(150)

	while 1 do
		sleep(1)
		if ReadRoleValue( OwnerID(), EM_RoleValue_AttackTargetID ) ~= 0 then 
			sleep(60)	-- 六秒檢查一次	
		else
			if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)  == 0 then
				Hide( OwnerID() )
				Show( Owner , 0 )
				DisableQuest(  Owner, False )	
				DelObj( OwnerID() )
			end
			break		
		end
	sleep(1)
	end
end

function Lua_Mala_rake_111829()
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register)
	local BathShowWear = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	sleep(30)
	Say( OwnerID() , "[SC_111829_00]" ) --讓我瞧瞧是哪些訪客，又把我寄宿的身體給毀壞？
	AdjustFaceDir( OwnerID(), Player, 0 ) 
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CAST_BEGIN)	
	sleep(40)
	Say( OwnerID() , "[SC_111829_01]" ) --你們在尋找那把強大的符文劍？
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CAST_END)
	sleep(30)
	Say( OwnerID() , "[SC_111829_02]" ) --噢～別告訴我「血之禮讚」這個名字，我是不會承認的......
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_BUFF_INSTANT)
	sleep(20)
	Say( OwnerID() , "[SC_111829_03]" ) --這把由我傾盡全力製造出來的符文劍，他該有的名字是「符文劍‧瑪拉瑞克」。
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_COMBAT_UNARMED)
	sleep(30)
	Say( OwnerID() , "[SC_111829_04]" ) --絕對不會是那個安德薩斯污穢他所取的名字……
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_ATTACK_UNARMED)
	sleep(50)
	Say( OwnerID() , "[SC_111829_05]" ) --雖然，你們能夠找到這裡是一件值得讚賞的事情。
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE1)
	sleep(20)
	Say( OwnerID() , "[SC_111829_06]" ) --但是「符文劍‧瑪拉瑞克」已經不在我手上。
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CAST_BEGIN)
	sleep(20)
	Say( OwnerID() , "[SC_111829_07]" ) --當初，在封印之戰前，安德薩斯確實捨棄了那把劍，輾轉又被我拿回來......
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_CAST_END)
	sleep(20)
	Say( OwnerID() , "[SC_111829_08]" ) --但是，監護者，那些可惡的監護者......
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_BUFF_INSTANT)
	sleep(30)
	Say( OwnerID() , "[SC_111829_09]" ) --卻在大屠殺時毀壞了我的身體，並且奪走符文劍！
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE0)
	sleep(30)
	Say( OwnerID() , "[SC_111829_10]" ) --而我，只能利用蟻穴裡剩餘的魔法能量，讓自己的靈魂寄宿於這些後來失去動力的監護者身上……
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE1)
	sleep(50)
	Say( OwnerID() , "[SC_111829_11]" ) --哈哈哈～安德薩斯怎麼也料想不到，當初他殘殺我的同伴們奪走的符文劍，最後卻成為控制他重傷諾芙的武器吧～
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_BUFF_INSTANT)
	sleep(30)
	Say( OwnerID() , "[SC_111829_12]" ) --這就是我的詛咒，詛咒……
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_DYING)
	sleep(15)
	Hide(OwnerID() )
	sleep( 150 )
	Show( BathShowWear , 0 )
	DisableQuest( BathShowWear, False )	
	DelObj( OwnerID() )
end

function LuaS_111797_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 421610 ) == true and CheckCompleteQuest( OwnerID() , 421610 ) == false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_111797_0]","LuaS_111797_1",0)
	end
end

function LuaS_111797_1()
	CloseSpeak( OwnerID() )
	Say( TargetID() , "[SC_111797_1]" ) --血之禮讚！血之禮讚！血之禮讚！吼~~~~~
	BeginPlot( TargetID() , "LuaQ_421610_Accept" , 0)
end
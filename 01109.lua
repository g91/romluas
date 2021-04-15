function LuaS_110243_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,421612 ) == true and CheckFlag(OwnerID(),542286) == false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_110243_0]","LuaS_110243_1",0) --請告訴我關於監護者的一切。
	elseif  CheckFlag(OwnerID(),542286) == true then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_110243_1]","LuaS_110243_1",0) --我想再聽一次關於監護者的事情。
	end

	if CheckAcceptQuest( OwnerID() ,422666 ) == true and CheckFlag(OwnerID(),543265) == false then ----十萬火急任務
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422628_0]","LuaS_422666",0) --發生什麼事？
	end
end

function LuaS_110243_1()
	SetSpeakDetail( OwnerID(), "[SC_110243_2]"   );
	--在封印之戰以後，人類為了避免重蹈覆轍，於是結合了當時的強大技術，製造出立場獨立於一切之外，擁有強大到讓人無法抵擋的力量，並且能夠自我思考及加以判斷的完美魔像-監護者。
	--當時的人類用「監護者」來搜索殘餘的魔族，保護封印虛界的裝置，並監視魔族殘留的物品，以及制裁想濫用符文魔法的人們。
	--不過，後來因為一些錯誤，導致監護者亦將擁有魔法與符文力量的古代先民們當作摧毀的對象，而開始不分青紅皂白地進行大規模的屠殺，最後，古代的王國，就在「監護者」的破壞下，滅亡了……
	SetFlag( OwnerID() , 542286 , 1 )
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]","LuaS_110243_0",0) --回上一頁
end

function LuaQ_421602_Complete()
	DisableQuest( OwnerID() , true )
	local Flag = 780221
	local X = ReadRoleValue( OwnerID() , EM_RoleValue_X )
	local Y = ReadRoleValue( OwnerID() , EM_RoleValue_Y )
	local Z = ReadRoleValue( OwnerID() , EM_RoleValue_Z )
	local Dir = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )
	local Mallsource = {}
	Mallsource[1] = CreateObjByFlag(110243,Flag,0,1)
	Mallsource[2] = CreateObjByFlag(110245,Flag,4,1)
	Mallsource[3] = CreateObjByFlag(110182,Flag,8,1)
	for i = 1 , 3 , 1 do
		DisableQuest( Mallsource[i] , true )
		WriteRoleValue( Mallsource[i] , EM_RoleValue_PID , 0 + (i-1)*4 )
		WriteRoleValue( Mallsource[i] , EM_RoleValue_IsWalk , 1 )
		MoveToFlagEnabled( Mallsource[i] , false )
		AddToPartition( Mallsource[i] , 0 )
		BeginPlot( Mallsource[i] , "Lua_Mallsource_MoveA" , 0 )
	end
	local FlagX = GetMoveFlagValue( Flag , 1 , EM_RoleValue_X )
	local FlagY = GetMoveFlagValue( Flag , 1 , EM_RoleValue_Y )
	for i = 0 , 120 , 1 do
		local Pos_X = ReadRoleValue( Mallsource[1] , EM_RoleValue_X )
		local Pos_Y = ReadRoleValue( Mallsource[1] , EM_RoleValue_Y )
		if Abs(FlagX-Pos_X) < 10 and Abs(FlagY-Pos_Y) < 10 then
			break
		end
		sleep(5)
	end

	sleep(15)
	Say( OwnerID() , "[SC_421602_0]") --歡迎您的前來，賢者之眼的書記長，瑪爾索思。
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	sleep(30)
	Say( Mallsource[1] , "[SC_421602_1]") --我已經看過信件，希望這次黑曜騎士團與賢者之眼的合作，能夠讓尋找傳說之劍的進度有大突破。
	PlayMotion( Mallsource[1], ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(30)
	Say( OwnerID() , "[SC_421602_2]") --我相信答案會是肯定的，讓我們好好聊聊吧，這邊請。
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	sleep(15)
	MoveToFlagEnabled( OwnerID() , false )
	BeginPlot( Mallsource[1] , "Lua_Mallsource_MoveB" , 30)
	BeginPlot( Mallsource[2] , "Lua_Mallsource_MoveB" , 50)
	BeginPlot( Mallsource[3] , "Lua_Mallsource_MoveB" , 50)
	Hide( OwnerID() )
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 1 )
	Show(OwnerID() , 0 )
	LuaFunc_MoveToFlag( OwnerID(), Flag , 2 ,0 )
	sleep( 10 )
	LuaFunc_MoveToFlag( OwnerID(), Flag , 3 ,0 )
	sleep( 10 )
	Hide( OwnerID() )
	sleep( 100 )
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 1 )
	Show(OwnerID() , 0 )
	LuaFunc_MoveToFlag( OwnerID(), Flag , 2 ,0 )
	sleep(10)
	MoveDirect( OwnerID(), X , Y , Z )
	for i = 0 , 120 , 1 do
		local CLS_X = ReadRoleValue( OwnerID() , EM_RoleValue_X )
		local CLS_Y = ReadRoleValue( OwnerID() , EM_RoleValue_Y )
		if Abs(X-CLS_X) < 10 and Abs(Y-CLS_Y) < 10 then
			break
		end
		sleep(5)
	end
	MoveDirect( OwnerID(), X , Y , Z )
	sleep(10)
	SetDir( OwnerID(), Dir )
	sleep(10)
	MoveToFlagEnabled( OwnerID() , true )
	DisableQuest( OwnerID() , false )
end

function Lua_Mallsource_MoveA()
	local M = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Flag = 780221
	LuaFunc_MoveToFlag( OwnerID(), Flag , 1+M ,0 )
end

function Lua_Mallsource_MoveB()
	local M = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Flag = 780221
	for i = 2 , 3 , 1 do
		LuaFunc_MoveToFlag( OwnerID(), Flag , i+M ,0 )
		if M == 4 and i == 2 then
			sleep( 25 )	
		end
		sleep(10)
	end
	DelObj( OwnerID() )
end
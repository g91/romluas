function LuaS_113015_0()
	LoadQuestOption( OwnerID() );
	if CheckAcceptQuest( OwnerID() , 422362 ) == true or CheckCompleteQuest( OwnerID() , 422362 ) == true then
		AddSpeakOption(  OwnerID(), OwnerID(), "[SC_113015_0]",  "LuaS_113015_2",  0 );
		AddSpeakOption(  OwnerID(), OwnerID(), "[SC_113015_5]",  "LuaS_113015_1",  0 );
		AddSpeakOption(  OwnerID(), OwnerID(), "[SC_113015_11]",  "LuaS_113015_3",  0 );
	end
end


function LuaS_113015_1()
	if	CountBodyItem(OwnerID(),204862) >0	then
		SetSpeakDetail ( OwnerID() ,"[SC_113015_1]" )
	elseif	CountItem(OwnerID(),204861 ) > 0	or
		CountItem(OwnerID(),204870   ) > 0	then
		SetSpeakDetail ( OwnerID() ,"[SC_113015]" )
	else
		SetSpeakDetail ( OwnerID() ,"[SC_113015_6]" )
		CancelBuff_NoEvent( OwnerID() , 503614 )
		CancelBuff_NoEvent( OwnerID() , 503615 )
		CancelBuff_NoEvent( OwnerID() , 504225 )
		CancelBuff_NoEvent( OwnerID() , 504226 )
		GiveBodyItem(OwnerID(),204861,1)
	--	AddBuff( OwnerID() , 504225 , 0 , 1295400 )
		AddBuff( OwnerID() , 504225 , 0 , 1260000 )	-- 2013.06.17 阿浩：調整基本法術持續時間至-1，並調整lua控制的Buff時間。
	end
	AddSpeakOption(  OwnerID(), OwnerID(), "[SC_113015_4]",  "LuaS_113015_0",  0 );
end

function LuaS_113015_2()
	SetSpeakDetail ( OwnerID() ,"[SC_113015_10]" )
	AddSpeakOption(  OwnerID(), OwnerID(), "[SC_113015_4]",  "LuaS_113015_0",  0 );
end

function LuaQ_422362_Accept()
	DisableQuest( OwnerID() , true )
	local Dir = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )
	ScriptMessage( TargetID() , TargetID() , 0 ,"[SC_113015_2]" , 0 )
	ScriptMessage( TargetID() , TargetID() , 1 ,"[SC_113015_2]" , 0 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_WAVE )
	AdjustFaceDir( OwnerID(), TargetID(), 0 ) 
	Tell( TargetID() , OwnerID() , "[SC_113015_3]" )
	sleep( 20 )
	Tell( TargetID() , OwnerID() , "[SC_113015_7]" )
	sleep( 5 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	sleep(10)
	Tell( TargetID() , OwnerID() , "[SC_113015_8]" )
	sleep( 20 )
	Tell( TargetID() , OwnerID() , "[SC_113015_9]" )
	SetDir( OwnerID(), Dir)
	sleep( 5 )
	DisableQuest( OwnerID() , false )
end	

function LuaS_113015_3()
	SetSpeakDetail ( OwnerID() ,"[SC_113015_12]" )
	AddSpeakOption(  OwnerID(), OwnerID(), "[SC_113015_4]",  "LuaS_113015_0",  0 );
end
--------------------------- 將 Buff 替換為時間比較短的 Buff -----------------------------------------------
function Lua_503614and503615BuffChange()
	BeginPlot( OwnerID() , "Lua_503614and503615BuffChange_Next" , 0 )
end

function Lua_503614and503615BuffChange_Next()
	local PosA = Lua_BuffPosSearch( OwnerID() , 503614 )
	local PosB = Lua_BuffPosSearch( OwnerID() , 503615 )
	local Pos = -1
	local Buff
	local C_Buff

	if PosA >= 0 then 
		Pos = PosA 
		Buff = 504225
		C_Buff = 503614
	elseif PosB >= 0 then 
		Pos = PosB 
		Buff = 504226
		C_Buff = 503615
	end

	if Pos >= 0 then
		local Time = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_Time ) - 600
		if Time > 0 then
			AddBuff( OwnerID() , Buff , 0 , Time )
		end
		CancelBuff_NoEvent( OwnerID() , C_Buff )
	end
end

function Lua_503614and503615BuffChange_Test()
	local PosA = Lua_BuffPosSearch( OwnerID() , 503614 )
	local PosB = Lua_BuffPosSearch( OwnerID() , 503615 )
	local PosC = Lua_BuffPosSearch( OwnerID() , 504225 )
	local PosD = Lua_BuffPosSearch( OwnerID() , 504226 )
	Say( OwnerID() , "Buff 503614 : "..PosA )
	Say( OwnerID() , "Buff 503615 : "..PosB )
	Say( OwnerID() , "Buff 504225 : "..PosC )
	Say( OwnerID() , "Buff 504226 : "..PosD )
end
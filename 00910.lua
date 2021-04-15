--洛奇之書

function LuaS_421260() --洛奇的書
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), GetQuestDetail( 421260, 1  ) )
	ShowBorder( OwnerID(), 421260, "[421260]", "ScriptBorder_Texture_Paper" )
end

------
function LuaS_421252_0()
	if CheckAcceptQuest( OwnerID() , 421252) == true then
		LoadQuestOption(OwnerID())
	else
		SetSpeakDetail ( OwnerID(), GetString ( "SC_421252_0" )   )--該死，我的腳斷了！啊！你幹什麼？不要動它！
	end
end


function LuaS_421252_1()
	if CheckAcceptQuest( OwnerID() , 421252) == true then
		SetSpeakDetail ( OwnerID(), GetString ( "SC_421252_1" )   )--((這個人似乎剛死去不久，從他的穿著看來應該是高登佣兵團的一員，你注意到他的領口袖著「提克」……))
		SetFlag( OwnerID()  , 540959 , 1 )
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaS_421252_2()
	if CheckAcceptQuest( OwnerID() , 421252) == true then
		SetSpeakDetail ( OwnerID(), GetString ( "SC_421252_2" )   )--你是誰？這裡很危險的！
		AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_421252_3") , "LuaS_421252_3", 0 ) --玩家選項：是高登派我來救你的
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaS_421252_3()
	SetFlag( OwnerID()  , 540958 , 1 )
	SetSpeakDetail ( OwnerID(), GetString ( "SC_421252_4" )   )--哈！那真是太好了！剛好你把附近的豺狼人都解決了，我會自己找到回去的路，謝啦！
	BeginPlot( TargetID() , "LuaS_421252_4", 0 )	--逃跑
end

function LuaS_421252_4()--洛札用
	local fx = GetMoveFlagValue( 780096 , 0 , EM_RoleValue_X )--抓階段旗的x
	local fy = GetMoveFlagValue( 780096 , 0 , EM_RoleValue_Y )--抓階段旗的y
	local fz = GetMoveFlagValue( 780096 , 0 , EM_RoleValue_Z )--抓階段旗的 z

	MoveToFlagEnabled( OwnerID() , false )--關閉巡邏劇情
	Move ( OwnerID() , fx , fy , fz )--往旗子跑去
	sleep(100)
	ReSetNPCInfo( OwnerID() )
end

function LuaS_421263_0() --被抓住的斥候
	if CheckAcceptQuest( OwnerID() , 421263 ) then
		SetSpeakDetail ( OwnerID(), GetString ( "SC_421263_1" )   )
		--你解決了這些豺狼人!是山德要你來的嗎？真是太感謝你了！你已經解決了大部份的豺狼人，接下來我會自己逃回去的！
		SetFlag( OwnerID()  , 540961 , 1 )
	else
		LoadQuestOption(OwnerID())
	end
end


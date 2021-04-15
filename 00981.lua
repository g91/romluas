----------------塞爾特．朗伯
function LuaS_111540_0()
LoadQuestOption( OwnerID() )
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_DIALOG1") , "LuaS_111490_1", 0 ) --我想了解南瓜節的由來
local BuffType = 0
local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
			BuffType = GameObjInfo_int ( BuffID , "AssistType" )
			break
		end
	end
	if BuffType == 58 then		--/*有變身出現對話選項
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111540_1", 0 ) --不給糖，就搗蛋！
	end
end
function LuaS_111540_1()
	if CheckFlag( OwnerID()  , 542143 ) == false then --/*檢查是否拿過
		SetFlag( OwnerID()  , 542143 , 1 )	--/*拿過給旗標
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*給糖果
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--嚇死我了！打扮的真不錯，這個糖果給你！
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--你今天已經拿過糖果了！明天再來吧！
	end
end
----------------塞爾特．蘭斯洛特
function LuaS_111541_0()
LoadQuestOption( OwnerID() )
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_DIALOG1") , "LuaS_111490_1", 0 ) --我想了解南瓜節的由來
local BuffType = 0
local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
			BuffType = GameObjInfo_int ( BuffID , "AssistType" )
			break
		end
	end
	if BuffType == 58 then		--/*有變身出現對話選項
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111541_1", 0 ) --不給糖，就搗蛋！
	end
end
function LuaS_111541_1()
	if CheckFlag( OwnerID()  , 542144 ) == false then --/*檢查是否拿過
		SetFlag( OwnerID()  , 542144 , 1 )	--/*拿過給旗標
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*給糖果
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--嚇死我了！打扮的真不錯，這個糖果給你！
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--你今天已經拿過糖果了！明天再來吧！
	end
end
----------------塞爾特．蘭登
function LuaS_111542_0()
LoadQuestOption( OwnerID() )
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_DIALOG1") , "LuaS_111490_1", 0 ) --我想了解南瓜節的由來
local BuffType = 0
local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
			BuffType = GameObjInfo_int ( BuffID , "AssistType" )
			break
		end
	end
	if BuffType == 58 then		--/*有變身出現對話選項
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111542_1", 0 ) --不給糖，就搗蛋！
	end
end
function LuaS_111542_1()
	if CheckFlag( OwnerID()  , 542145 ) == false then --/*檢查是否拿過
		SetFlag( OwnerID()  , 542145 , 1 )	--/*拿過給旗標
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*給糖果
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--嚇死我了！打扮的真不錯，這個糖果給你！
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--你今天已經拿過糖果了！明天再來吧！
	end
end
----------------塞爾特．拉金
function LuaS_111543_0()
LoadQuestOption( OwnerID() )
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_DIALOG1") , "LuaS_111490_1", 0 ) --我想了解南瓜節的由來
local BuffType = 0
local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
			BuffType = GameObjInfo_int ( BuffID , "AssistType" )
			break
		end
	end
	if BuffType == 58 then		--/*有變身出現對話選項
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111543_1", 0 ) --不給糖，就搗蛋！
	end
end
function LuaS_111543_1()
	if CheckFlag( OwnerID()  , 542146 ) == false then --/*檢查是否拿過
		SetFlag( OwnerID()  , 542146 , 1 )	--/*拿過給旗標
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*給糖果
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--嚇死我了！打扮的真不錯，這個糖果給你！
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--你今天已經拿過糖果了！明天再來吧！
	end
end
----------------塞爾特．勞倫斯
function LuaS_111544_0()
LoadQuestOption( OwnerID() )
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_DIALOG1") , "LuaS_111490_1", 0 ) --我想了解南瓜節的由來
local BuffType = 0
local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
			BuffType = GameObjInfo_int ( BuffID , "AssistType" )
			break
		end
	end
	if BuffType == 58 then		--/*有變身出現對話選項
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111544_1", 0 ) --不給糖，就搗蛋！
	end
end
function LuaS_111544_1()
	if CheckFlag( OwnerID()  , 542147 ) == false then --/*檢查是否拿過
		SetFlag( OwnerID()  , 542147 , 1 )	--/*拿過給旗標
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*給糖果
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--嚇死我了！打扮的真不錯，這個糖果給你！
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--你今天已經拿過糖果了！明天再來吧！
	end
end
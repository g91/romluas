----------------塞爾特．基茨
function LuaS_111525_0()
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
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111525_1", 0 ) --不給糖，就搗蛋！
	end
end
function LuaS_111525_1()
	if CheckFlag( OwnerID()  , 542128 ) == false then --/*檢查是否拿過
		SetFlag( OwnerID()  , 542128 , 1 )	--/*拿過給旗標
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*給糖果
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--嚇死我了！打扮的真不錯，這個糖果給你！
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--你今天已經拿過糖果了！明天再來吧！
	end
end
----------------塞爾特．凱利
function LuaS_111526_0()
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
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111526_1", 0 ) --不給糖，就搗蛋！
	end
end
function LuaS_111526_1()
	if CheckFlag( OwnerID()  , 542129 ) == false then --/*檢查是否拿過
		SetFlag( OwnerID()  , 542129 , 1 )	--/*拿過給旗標
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*給糖果
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--嚇死我了！打扮的真不錯，這個糖果給你！
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--你今天已經拿過糖果了！明天再來吧！
	end
end
----------------塞爾特．凱洛格
function LuaS_111527_0()
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
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111527_1", 0 ) --不給糖，就搗蛋！
	end
end
function LuaS_111527_1()
	if CheckFlag( OwnerID()  , 542130 ) == false then --/*檢查是否拿過
		SetFlag( OwnerID()  , 542130 , 1 )	--/*拿過給旗標
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*給糖果
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--嚇死我了！打扮的真不錯，這個糖果給你！
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--你今天已經拿過糖果了！明天再來吧！
	end
end
----------------塞爾特．凱爾森
function LuaS_111528_0()
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
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111528_1", 0 ) --不給糖，就搗蛋！
	end
end
function LuaS_111528_1()
	if CheckFlag( OwnerID()  , 542131 ) == false then --/*檢查是否拿過
		SetFlag( OwnerID()  , 542131 , 1 )	--/*拿過給旗標
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*給糖果
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--嚇死我了！打扮的真不錯，這個糖果給你！
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--你今天已經拿過糖果了！明天再來吧！
	end
end
----------------塞爾特．凱爾文
function LuaS_111529_0()
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
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111529_1", 0 ) --不給糖，就搗蛋！
	end
end
function LuaS_111529_1()
	if CheckFlag( OwnerID()  , 542132 ) == false then --/*檢查是否拿過
		SetFlag( OwnerID()  , 542132 , 1 )	--/*拿過給旗標
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*給糖果
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--嚇死我了！打扮的真不錯，這個糖果給你！
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--你今天已經拿過糖果了！明天再來吧！
	end
end
----------------塞爾特．凱南
function LuaS_111530_0()
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
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111530_1", 0 ) --不給糖，就搗蛋！
	end
end
function LuaS_111530_1()
	if CheckFlag( OwnerID()  , 542133 ) == false then --/*檢查是否拿過
		SetFlag( OwnerID()  , 542133 , 1 )	--/*拿過給旗標
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*給糖果
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--嚇死我了！打扮的真不錯，這個糖果給你！
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--你今天已經拿過糖果了！明天再來吧！
	end
end
----------------塞爾特．肯尼迪
function LuaS_111531_0()
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
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111531_1", 0 ) --不給糖，就搗蛋！
	end
end
function LuaS_111531_1()
	if CheckFlag( OwnerID()  , 542134 ) == false then --/*檢查是否拿過
		SetFlag( OwnerID()  , 542134 , 1 )	--/*拿過給旗標
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*給糖果
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--嚇死我了！打扮的真不錯，這個糖果給你！
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--你今天已經拿過糖果了！明天再來吧！
	end
end

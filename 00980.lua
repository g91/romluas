----------------塞爾特．凱佩爾
function LuaS_111532_0()
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
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111532_1", 0 ) --不給糖，就搗蛋！
	end
end
function LuaS_111532_1()
	if CheckFlag( OwnerID()  , 542135 ) == false then --/*檢查是否拿過
		SetFlag( OwnerID()  , 542135 , 1 )	--/*拿過給旗標
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*給糖果
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--嚇死我了！打扮的真不錯，這個糖果給你！
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--你今天已經拿過糖果了！明天再來吧！
	end
end
----------------塞爾特．凱恩斯
function LuaS_111533_0()
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
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111533_1", 0 ) --不給糖，就搗蛋！
	end
end
function LuaS_111533_1()
	if CheckFlag( OwnerID()  , 542136 ) == false then --/*檢查是否拿過
		SetFlag( OwnerID()  , 542136 , 1 )	--/*拿過給旗標
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*給糖果
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--嚇死我了！打扮的真不錯，這個糖果給你！
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--你今天已經拿過糖果了！明天再來吧！
	end
end
----------------塞爾特．金斯利
function LuaS_111534_0()
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
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111534_1", 0 ) --不給糖，就搗蛋！
	end
end
function LuaS_111534_1()
	if CheckFlag( OwnerID()  , 542137 ) == false then --/*檢查是否拿過
		SetFlag( OwnerID()  , 542137 , 1 )	--/*拿過給旗標
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*給糖果
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--嚇死我了！打扮的真不錯，這個糖果給你！
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--你今天已經拿過糖果了！明天再來吧！
	end
end
----------------塞爾特．基普林
function LuaS_111535_0()
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
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111535_1", 0 ) --不給糖，就搗蛋！
	end
end
function LuaS_111535_1()
	if CheckFlag( OwnerID()  , 542138 ) == false then --/*檢查是否拿過
		SetFlag( OwnerID()  , 542138 , 1 )	--/*拿過給旗標
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*給糖果
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--嚇死我了！打扮的真不錯，這個糖果給你！
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--你今天已經拿過糖果了！明天再來吧！
	end
end
----------------塞爾特．基特
function LuaS_111536_0()
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
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111536_1", 0 ) --不給糖，就搗蛋！
	end
end
function LuaS_111536_1()
	if CheckFlag( OwnerID()  , 542139 ) == false then --/*檢查是否拿過
		SetFlag( OwnerID()  , 542139 , 1 )	--/*拿過給旗標
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*給糖果
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--嚇死我了！打扮的真不錯，這個糖果給你！
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--你今天已經拿過糖果了！明天再來吧！
	end
end
----------------塞爾特．基托
function LuaS_111537_0()
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
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111537_1", 0 ) --不給糖，就搗蛋！
	end
end
function LuaS_111537_1()
	if CheckFlag( OwnerID()  , 542140 ) == false then --/*檢查是否拿過
		SetFlag( OwnerID()  , 542140 , 1 )	--/*拿過給旗標
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*給糖果
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--嚇死我了！打扮的真不錯，這個糖果給你！
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--你今天已經拿過糖果了！明天再來吧！
	end
end
----------------塞爾特．基蒂
function LuaS_111538_0()
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
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111538_1", 0 ) --不給糖，就搗蛋！
	end
end
function LuaS_111538_1()
	if CheckFlag( OwnerID()  , 542141 ) == false then --/*檢查是否拿過
		SetFlag( OwnerID()  , 542141 , 1 )	--/*拿過給旗標
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*給糖果
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--嚇死我了！打扮的真不錯，這個糖果給你！
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--你今天已經拿過糖果了！明天再來吧！
	end
end
----------------塞爾特．蘭姆
function LuaS_111539_0()
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
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111539_1", 0 ) --不給糖，就搗蛋！
	end
end
function LuaS_111539_1()
	if CheckFlag( OwnerID()  , 542142 ) == false then --/*檢查是否拿過
		SetFlag( OwnerID()  , 542142 , 1 )	--/*拿過給旗標
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*給糖果
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--嚇死我了！打扮的真不錯，這個糖果給你！
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--你今天已經拿過糖果了！明天再來吧！
	end
end
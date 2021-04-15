----------------艾菲爾．海倫戴爾
function LuaS_111575_Sweets0()
LoadQuestOption( OwnerID() )
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
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111575_Sweets0_1", 0 ) --不給糖，就搗蛋！
	end
end

function LuaS_111575_Sweets0_1()

	if CheckFlag( OwnerID()  , 542148 ) == false then --/*檢查是否拿過
		SetFlag( OwnerID()  , 542148 , 1 )	--/*拿過給旗標


		local P = 100
		local XX = Rand( P )      
			if XX >= 50 and XX < 100 then   --50%	
				GiveBodyItem( OwnerID() , 203140 , 1 )	--/*給奇怪的軟糖

			elseif XX >= 5 and XX < 50 then --45%
				GiveBodyItem( OwnerID() , 203139 , 1 )	--/*給普通的軟糖
	
			elseif XX >= 0 and XX < 5 then --5%	
				GiveBodyItem( OwnerID() , 203138 , 1 )	--/*給高級軟糖
			end


		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--嚇死我了！打扮的真不錯，這個糖果給你！
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--你今天已經拿過糖果了！明天再來吧！
	end		
end

----------------阿蜜特．海倫戴爾
function LuaS_111575_Sweets1()
LoadQuestOption( OwnerID() )
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
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111575_Sweets1_1", 0 ) --不給糖，就搗蛋！
	end
end

function LuaS_111575_Sweets1_1()

	if CheckFlag( OwnerID()  , 542149 ) == false then --/*檢查是否拿過
		SetFlag( OwnerID()  , 542149 , 1 )	--/*拿過給旗標


		local P = 100
		local XX = Rand( P )      
			if XX >= 30 and XX < 100 then   --70%	
				GiveBodyItem( OwnerID() , 203139 , 1 )	--/*給普通的軟糖

			elseif XX >= 20 and XX < 30 then --10%
				GiveBodyItem( OwnerID() , 203138 , 1 )	--/*給高級軟糖
	
			elseif XX >= 0 and XX < 20 then --20%	
				GiveBodyItem( OwnerID() , 203140 , 1 )	--/*給奇怪的軟糖
			end


		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--嚇死我了！打扮的真不錯，這個糖果給你！
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--你今天已經拿過糖果了！明天再來吧！
	end		
end

----------------帕妃．海倫戴爾
function LuaS_111575_Sweets2()
LoadQuestOption( OwnerID() )
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
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111575_Sweets2_1", 0 ) --不給糖，就搗蛋！
	end
end

function LuaS_111575_Sweets2_1()

	if CheckFlag( OwnerID()  , 542150 ) == false then --/*檢查是否拿過
		SetFlag( OwnerID()  , 542150 , 1 )	--/*拿過給旗標


		local P = 100
		local XX = Rand( P )      
			if XX >= 50 and XX < 100 then   --50%	
				GiveBodyItem( OwnerID() , 203139 , 1 )	--/*給普通的軟糖

			elseif XX >= 5 and XX < 50 then --45%
				GiveBodyItem( OwnerID() , 203140 , 1 )	--/*給奇怪的軟糖
	
			elseif XX >= 0 and XX < 5 then --5%	
				GiveBodyItem( OwnerID() , 203138 , 1 )	--/*給高級軟糖
			end


		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--嚇死我了！打扮的真不錯，這個糖果給你！
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--你今天已經拿過糖果了！明天再來吧！
	end		
end

----------------安娜．海倫戴爾
function LuaS_111575_Sweets3()
LoadQuestOption( OwnerID() )
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
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111575_Sweets3_1", 0 ) --不給糖，就搗蛋！
	end
end

function LuaS_111575_Sweets3_1()

	if CheckFlag( OwnerID()  , 542151 ) == false then --/*檢查是否拿過
		SetFlag( OwnerID()  , 542151 , 1 )	--/*拿過給旗標


		local P = 100
		local XX = Rand( P )      
			if XX >= 55 and XX < 100 then   --45%	
				GiveBodyItem( OwnerID() , 203139 , 1 )	--/*給普通的軟糖

			elseif XX >= 5 and XX < 55 then --50%
				GiveBodyItem( OwnerID() , 203140 , 1 )	--/*給奇怪的軟糖
	
			elseif XX >= 0 and XX < 5 then --5 %	
				GiveBodyItem( OwnerID() , 203138 , 1 )	--/*給高級軟糖
			end


		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--嚇死我了！打扮的真不錯，這個糖果給你！
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--你今天已經拿過糖果了！明天再來吧！
	end		
end

----------------史考特．海倫戴爾
function LuaS_111575_Sweets4()
LoadQuestOption( OwnerID() )
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
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111575_Sweets4_1", 0 ) --不給糖，就搗蛋！
	end
end

function LuaS_111575_Sweets4_1()

	if CheckFlag( OwnerID()  , 542152 ) == false then --/*檢查是否拿過
		SetFlag( OwnerID()  , 542152 , 1 )	--/*拿過給旗標


		local P = 100
		local XX = Rand( P )      
			if XX >= 35 and XX < 100 then   --65%	
				GiveBodyItem( OwnerID() , 203139 , 1 )	--/*給普通的軟糖

			elseif XX >= 5 and XX < 35 then --30%
				GiveBodyItem( OwnerID() , 203140 , 1 )	--/*給奇怪的軟糖
	
			elseif XX >= 0 and XX < 5 then --5 %	
				GiveBodyItem( OwnerID() , 203138 , 1 )	--/*給高級軟糖
			end


		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--嚇死我了！打扮的真不錯，這個糖果給你！
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--你今天已經拿過糖果了！明天再來吧！
	end		
end
function LuaYU_111575_0()
	local Owner = OwnerID()
	local Target = TargetID()
	local BuffType = 0
	local Count = BuffCount ( Owner)
		for i = 0 , Count do
			local BuffID = BuffInfo ( Owner , i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end
		if BuffType == 58 then		--/*有變身出現對話選項
		SetSpeakDetail( Owner, GetString("SC_111575_YU_000")   )--小安妮對話內文
		AddSpeakOption( Owner, Target, GetString("SC_111575_YU_00") , "LuaYU_111575_1", 0 ) --給糖
		AddSpeakOption( Owner, Target, GetString("SC_111575_YU_01") , "LuaYU_111575_2", 0 ) --沒糖
		else
		LoadQuestOption( Owner )
		end

end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111575_1()
	local Softsweets01 =  CountBodyItem( OwnerID() , 203138 )
	local Softsweets02 =  CountBodyItem( OwnerID() , 203139 )
	local Softsweets03 =  CountBodyItem( OwnerID() , 203140 )
	local Softsweets = Softsweets01 + Softsweets02 + Softsweets03

	if Softsweets >= 5 then
		SetSpeakDetail( OwnerID(), GetString("SC_111575_YU_00_0")   )  --玩遊戲
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111575_YU_00_1") , "LuaYU_111575_1_0", 0 ) --好！我會加油的！


	elseif Softsweets >0 and Softsweets <= 4 then
		SetSpeakDetail( OwnerID(), GetString("SC_111575_YU_00_2")   )  --糖不夠

	else
		SetSpeakDetail( OwnerID(), GetString("SC_111575_YU_00_3")   ) --沒糖
	end

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111575_2()

	local Softsweets01 =  CountBodyItem( OwnerID() , 203138 )
	local Softsweets02 =  CountBodyItem( OwnerID() , 203139 )
	local Softsweets03 =  CountBodyItem( OwnerID() , 203140 )
	local Softsweets = Softsweets01 + Softsweets02 + Softsweets03

	if Softsweets > 0 and Softsweets <= 5 then
		SetSpeakDetail( OwnerID(), GetString("SC_111575_YU_01_1")   )  --明明有糖
	else
		SetSpeakDetail( OwnerID(), GetString("SC_111575_YU_01_0")   ) --討糖
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111575_1_0()


	ChangeZone( OwnerID(), 2, 0, 4994.2, 103.1, -2314.3, 56 )
	CloseSpeak( OwnerID() )                     --關閉對話模版
end
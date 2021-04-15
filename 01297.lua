function LuaS_422094_Accept()	-- 低語森林的枯骨
	Hide( OwnerID() )
	Sleep( 150 )
	Show( OwnerID() , 0 )

	return true
end

function LuaS_422109_Accept()	--重塑枯骨形體

	DisableQuest( OwnerID() , true )

	PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_LOOP )

	local Obj = Role:new( OwnerID() ) 
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local BaseRoom = Obj:RoomID()

	local Skeleton = CreateObj( 112542 , BaseX+10 , BaseY, BaseZ-15 , BaseDir+180 , 1 )	-- 產生枯骨
	AddToPartition( Skeleton , BaseRoom )

	Sleep( 20 )

	local NiKo = LuaFunc_CreateObjByObj ( 112541 , Skeleton )	-- 尼可．帕斯拉

	Sleep( 20 )

	PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_LOOP , ruFUSION_ACTORSTATE_CRAFTING_END )

	Sleep( 20 )
	if Skeleton ~= nil then
		if CheckID( Skeleton ) == true then DelObj( Skeleton ) end
	end
	if NiKo ~= nil then
		if CheckID( NiKo ) == true then DelObj( NiKo ) end
	end

	SetFlag( TargetID() , 542479 , 1 )	-- 重新塑造形體

	DisableQuest( OwnerID() , false )
	LuaFunc_ResetObj( OwnerID() )

	return true
end

function LuaS_204177_CHECK()
	local Target = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	if CheckAcceptQuest( OwnerID() , 422098 ) == false or CheckCompleteQuest( OwnerID() , 422098 ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204177_1]", 0 )	-- 這個時候不需要使用[204177]。
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204177_1]" , C_DEFAULT )
		return false
	elseif CountBodyItem( OwnerID() , 204166 ) >= 10 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204177_2]" , 0 )	-- 你已經取得足夠的數量的[204166]。
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204177_2]" , C_DEFAULT )
		return false
	elseif Target ~= 101739 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204177_3]" , 0 )	-- 你必須針對[101739]才能使用。
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204177_3]" , C_DEFAULT )
		return false
	else
		return true
	end
end

function LuaS_204177_USE()
	BeginPlot( TargetID() , "LuaS_204177_Reset" , 0 )
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204177_4]" , 0 )	-- 你成功地吸吮到[204166]！
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204177_4]" , C_SYSTEM )
	UseItemDestroy()	-- 吸吮瓶
	GiveBodyItem( OwnerID() , 204166 , 1 )		-- 洋流波動
end

function LuaS_204177_Reset()
	LuaFunc_ResetObj( OwnerID() )
end

function LuaS_204178_CHECK()	-- 透光晶瓶
	if CheckAcceptQuest( OwnerID() , 422100 ) == false or CheckCompleteQuest( OwnerID() , 422100 ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204178_1]", 0 )	-- 這個時候不需要使用[204178]。
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204178_1]" , C_DEFAULT )
		return false
	else
		local YoSen = LuaFunc_SearchNPCbyOrgID( OwnerID() , 112660 , 50 )
		if YoSen ~= -1 then
			return true
		else
			return false
		end
	end
end

function LuaS_204178_DO()

	local YoSen = LuaFunc_SearchNPCbyOrgID( OwnerID() , 112548 , 50 )
	if YoSen == -1 then
		local Obj = Role:new( OwnerID() ) 
		local BaseX = Obj :X()
	 	local BaseY = Obj :Y()
	 	local BaseZ = Obj :Z()
		local BaseDir = Obj:Dir()
		local BaseRoom = Obj:RoomID()

		local YoSen = CreateObj( 112548 , BaseX+10 , BaseY, BaseZ-15 , BaseDir+180 , 1 )	-- 產生低語森林妖精
		AddToPartition( YoSen , BaseRoom )
		BeginPlot( YoSen , "LuaS_112660_YosenLifeTime" , 0 )

		SetFlag( OwnerID() , 542499 , 1 )	-- 發現低語森林妖精
	end

end

function LuaS_204179_CHECK()	-- 妖精羅盤
	if CheckAcceptQuest( OwnerID() , 422100 ) == false or CheckCompleteQuest( OwnerID() , 422100 ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204179_1]", 0 )	-- 這個時候不需要使用[204179]。
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204179_1]" , C_DEFAULT )
		return false
	else
		return true
	end
end

function LuaS_204179_DO()
	local YoSen = LuaFunc_SearchNPCbyOrgID( OwnerID() , 112660 , 500 )
	--Say(OwnerID(), YoSen )
	if YoSen == -1 then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204179_2]", 0 )	-- 這附近一點妖精的氣息都沒有！
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204179_2]" , C_SYSTEM )
	else
		local Distance = GetDistance( OwnerID() , YoSen )
		if Distance <= 50 then
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204179_6]", 0 )	-- 羅盤顯示這裡隱藏著妖精！
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204179_6]" , C_SYSTEM )
		elseif Distance <= 100 then
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204179_5]", 0 )	-- 羅盤感受到這附近累積了相當多妖精的氣息！
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204179_5]" , C_SYSTEM )
		elseif Distance <= 300 then
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204179_4]", 0 )	-- 羅盤感受到這附近有許多妖精的氣息！
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204179_4]" , C_SYSTEM )
		elseif Distance <= 500 then
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204179_3]", 0 )	-- 羅盤感受到這附近有一些妖精的氣息！
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204179_3]" , C_SYSTEM )
		end
	end
end

function LuaI_112660_Range()
	SetPlot( OwnerID() , "Range", "LuaS_112660_Range", 50 )
end

function LuaS_112660_Range()
	local YoSen = LuaFunc_SearchNPCbyOrgID( OwnerID() , 112548 , 100 )
	--Say(OwnerID(), YoSen )
	if YoSen == -1 then
		if CheckCompleteQuest( OwnerID() , 422100 ) == true or CheckCompleteQuest( OwnerID() , 422101 ) == false or CheckCompleteQuest( OwnerID() , 422102 ) == false then
			local Obj = Role:new( OwnerID() ) 
			local BaseX = Obj :X()
	 		local BaseY = Obj :Y()
	 		local BaseZ = Obj :Z()
			local BaseDir = Obj:Dir()
			local BaseRoom = Obj:RoomID()

			local YoSen = CreateObj( 112548 , BaseX+10 , BaseY, BaseZ-15 , BaseDir+180 , 1 )	-- 產生低語森林妖精
			AddToPartition( YoSen , BaseRoom )
			BeginPlot( YoSen , "LuaS_112660_YosenLifeTime" , 0 )
		end
	end
end

function LuaS_112660_YosenLifeTime()
	Sleep( 300 )
	if CheckID( OwnerID() ) == true then 
		DelObj( OwnerID()) 
	end
end

function LuaS_204175_CHECK()
	local X = ReadRoleValue( OwnerID() , EM_RoleValue_X )
	local Z = ReadRoleValue( OwnerID() , EM_RoleValue_Z )

	if CheckFlag( OwnerID() , 542493 ) == true then	-- 善意的謊言
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204175_1]", 0 )	-- 現在不需要使用[204175]！
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204175_1]" , C_DEFAULT )
		return false
	end

	if X < 19650 or X > 19800 then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204175_1]", 0 )	-- 現在不需要使用[204175]！
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204175_1]" , C_DEFAULT )
		return false
	end
	if Z < 22790 or Z > 22950 then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204175_1]", 0 )	-- 現在不需要使用[204175]！
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204175_1]" , C_DEFAULT )
		return false
	end

	return true
end

function LuaS_204175_DO()
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204175_2]", 0 )	-- 你使用[204175]，變身成為[112541]！
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204175_2]" , C_SYSTEM )
	AddBuff( OwnerID() , 503142 , 0 , -1 )
	return true
end

function LuaS_204175_CHECKRange()
	local X = ReadRoleValue( OwnerID() , EM_RoleValue_X )
	local Z = ReadRoleValue( OwnerID() , EM_RoleValue_Z )

	if X < 19650 or X > 19800 then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204175_3]", 0 )	-- [204175]的效果消失，你恢復成原樣！
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204175_3]" , C_SYSTEM )
		CancelBuff( OwnerID() , 503142 )
	end

	if Z < 22790 or Z > 22950 then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204175_3]", 0 )	-- [204175]的效果消失，你恢復成原樣！
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204175_3]" , C_SYSTEM )
		CancelBuff( OwnerID() , 503142 )
	end
end

function LuaS_112543()
	LoadQuestOption( OwnerID() )	--載入任務模板
	if CheckBuff( OwnerID() , 503142 ) == true and CheckFlag( OwnerID() , 542493 ) == false and CheckCompleteQuest( OwnerID() , 422104 ) == false  then
		AddSpeakOption( OwnerID() , TargetID() , "[SC_112543_1]" , "LuaS_112543_Talk1" , 0 )	-- 增加一個選項：我回來了，[112543]。
	end
end

function LuaS_112543_Talk1()
	SetSpeakDetail( OwnerID() , "[SC_112543_2]" )	-- 嗯，我一直在這邊等你，我有遵守我們的約定......
	AddSpeakOption( OwnerID() , TargetID() , "[SC_112543_3]" , "LuaS_112543_Talk2" , 0 )	-- 增加一個選項：...接下來我還需要去一個很遠的地方...
end

function LuaS_112543_Talk2()
	SetSpeakDetail( OwnerID() , "[SC_112543_4]" )	-- 為什麼才剛回來又要離開？......我知道了，我會在這邊繼續等著你回來的！
	AddSpeakOption( OwnerID() , TargetID() , "[SC_112543_5]" , "LuaS_112543_Talk3" , 0 )	-- 增加一個選項：呃，妳不要...
end

function LuaS_112543_Talk3()
	CloseSpeak( OwnerID() )	--關閉對話視窗
	SetFlag( OwnerID() , 542493 , 1 ) 	-- 善意的謊言
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204175_3]", 0 )	-- [204175]的效果消失，你恢復成原樣！
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204175_3]" , C_SYSTEM )
	CancelBuff( OwnerID() , 503142 )
end
function LuaS_111397()

	LoadQuestOption( OwnerID() )	--載入任務模板

	AddSpeakOption( OwnerID(), TargetID(), GetString("SC_111397_04") , "LuaS_111397_GetTP" , 0 )		-- 選項，我想索取「技能重置符文」
	AddSpeakOption( OwnerID(), TargetID(), GetString("SC_111397_05") , "LuaS_111397_GetDeb" , 0 )	-- 選項，我想索取「神賜贖罪券」

end

function LuaS_111397_GetTP()

	CloseSpeak( OwnerID() )

	local PlayerID = OwnerID()
	local PackageID = 203035		-- 技能重置符文
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( NeedSpaceStatus  == false ) then
		ScriptMessage( PlayerID , PlayerID , 1, GetString("SC_111397_01") , C_DEFAULT )	-- 你的背包已滿，請先整理你的背包！！
	elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
		ScriptMessage( PlayerID , PlayerID , 1, GetString("SC_111397_02") , C_DEFAULT )	-- 抱歉，這個物品無法同時取得一個以上！！
	else
		Say( TargetID() , GetString("SC_111397_03") )	-- 來，這是技能重置符文，使用後將會重置你的技能TP點數，讓你可以重新分配。請好好的使用！！
		GiveBodyItem( PlayerID , PackageID , 1 )
	end

end

function LuaS_111397_GetDeb()

	CloseSpeak( OwnerID() )

	local PlayerID = OwnerID()
	local PackageID = 203525		-- 神賜贖罪券
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( NeedSpaceStatus  == false ) then
		ScriptMessage( PlayerID , PlayerID , 1, GetString("SC_111397_01") , C_DEFAULT )	-- 你的背包已滿，請先整理你的背包！！
	elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
		ScriptMessage( PlayerID , PlayerID , 1, GetString("SC_111397_02") , C_DEFAULT )	-- 抱歉，這個物品無法同時取得一個以上！！
	else
		Say( TargetID() , GetString("SC_111397_06") )	-- 來，這是神賜贖罪券，使用後將會清空你的負債，請好好的使用！！
		GiveBodyItem( PlayerID , PackageID , 1 )
	end

end

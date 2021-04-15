function LuaS_111307()

	LoadQuestOption( OwnerID() )	--載入任務模板

	SetSpeakDetail( OwnerID(), GetString("ST_111307_0") )
	AddSpeakOption( OwnerID(), TargetID(), GetString("SC_111307_1") , "LuaS_111307_1" , 0 )	--選項，我要交換＜去死團團員＞的稱號
	AddSpeakOption( OwnerID(), TargetID(), GetString("SC_111307_2") , "LuaS_111307_2" , 0 )	--選項，我要交換＜去死去死團團員＞的稱號
	AddSpeakOption( OwnerID(), TargetID(), GetString("SC_111307_3") , "LuaS_111307_3" , 0 )	--選項，我要交換＜我是好人＞的稱號
	AddSpeakOption( OwnerID(), TargetID(), GetString("SC_111307_4") , "LuaS_111307_4" , 0 )	--選項，我要交換＜我是爛好人＞的稱號

end

function LuaS_111307_1()
	CloseSpeak( OwnerID() )	-- 關閉對話視窗
	if CountBodyItem( OwnerID() , 202694 ) >= 10 then	-- 愛意之戒
		if DelBodyItem( OwnerID() , 202694 , 10 ) then
			GiveBodyItem( OwnerID() , 530354 , 1 )	-- 去死團團員
		end
	else
		Say( TargetID() , ReplaceString( GetString("SC_111307_33") , "ItemName" , GetString("SC_111307_32") ) )	-- 對不起，你沒有足夠的ItemName，無法兌換這個稱號！
	end
end

function LuaS_111307_2()
	CloseSpeak( OwnerID() )	-- 關閉對話視窗
	if CountBodyItem( OwnerID() , 202694 ) >= 100 then	-- 愛意之戒
		if DelBodyItem( OwnerID() , 202694 , 100 ) then
			GiveBodyItem( OwnerID() , 530355 , 1 )	-- 去死去死團團員
		end
	else
		Say( TargetID() , ReplaceString( GetString("SC_111307_33") , "ItemName" , GetString("SC_111307_32") ) )	-- 對不起，你沒有足夠的ItemName，無法兌換這個稱號！
	end
end

function LuaS_111307_3()
	CloseSpeak( OwnerID() )	-- 關閉對話視窗
	if CountBodyItem( OwnerID() , 202695 ) >= 10 then	-- 好人卡
		if DelBodyItem( OwnerID() , 202695 , 10 ) then
			GiveBodyItem( OwnerID() , 530356 , 1 )	-- 我是好人
		end
	else
		Say( TargetID() , ReplaceString( GetString("SC_111307_33") , "ItemName" , GetString("SC_111307_31") ) )	-- 對不起，你沒有足夠的ItemName，無法兌換這個稱號！
	end
end

function LuaS_111307_4()
	CloseSpeak( OwnerID() )	-- 關閉對話視窗
	if CountBodyItem( OwnerID() , 202695 ) >= 100 then	-- 好人卡
		if DelBodyItem( OwnerID() , 202695 , 100 ) then
			GiveBodyItem( OwnerID() , 530357 , 1 )	-- 我是爛好人
		end
	else
		Say( TargetID() , ReplaceString( GetString("SC_111307_33") , "ItemName" , GetString("SC_111307_31") ) )	-- 對不起，你沒有足夠的ItemName，無法兌換這個稱號！
	end
end

function LuaS_202691( Option )	-- 巧果

	local PlayerID = OwnerID()
	local PackageID = 202691		-- 巧果

	if ( Option == "CHECK" ) then
		if CheckFlag( OwnerID(), 541325 ) == false then
			ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_111307_29") , 0 )	-- 你無須重置七夕＜我是真的最愛你＞任務！
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		SetFlag( OwnerID(), 541325 , 0 )
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_111307_28") , C_SYSTEM )	-- 你已經可以重新接取七夕＜我是真的最愛你＞任務。
	end

end

function LuaS_202692( Option )	-- 七夕情人禮包

	local PlayerID = OwnerID()
	local PackageID = 202692		-- 七夕情人禮包
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local Item1 = 202691	-- 巧果
	local Item2 = 201445	-- 世界頻道喊話儀

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if ( Item1 ~= nil  ) then		GiveBodyItem( PlayerID , Item1 , 1 )			end
		if ( Item2 ~= nil  ) then		GiveBodyItem( PlayerID , Item2 , 7 )			end
		AddRoleValue( PlayerID , EM_RoleValue_Money , 70707 )
	end


end



function LuaS_110609()	-- 羅密

	local hour = GetSystime(1)
	--local min = GetSystime(2)

	if CheckFlag( OwnerID() , 541325 ) == true then
		SetSpeakDetail( OwnerID(), GetString("SC_111307_26") )
	elseif  ( hour >= 18 and hour < 20 ) and ( CheckFlag( OwnerID() , 541324 ) == false ) then
		LoadQuestOption( OwnerID() )	--載入任務模板
		--SetSpeakDetail( OwnerID(), GetString("SC_111307_9") )
		-- 先前因為對感情的困惑，我沒有好好的珍惜茱莉，而讓她非常的傷心。
		-- 現在我終於釐清了自己的心意，為了挽回我們之間的感情，我訂購了一枚傳說的愛意之戒要送給茱莉。
		-- 看時間也差不多該送到了，請你到凡瑞娜絲城門口，找達克取得愛意之戒，然後幫我將它交給茱莉，好嗎？
		--AddSpeakOption( OwnerID(), TargetID(), GetString("SC_111307_8") , "LuaS_110609_1" , 0 )		-- 選項，接受任務-我是真的最愛你
	elseif ( CountBodyItem( OwnerID() , 202696 ) >= 1 ) and ( CheckFlag( OwnerID() , 541324 ) == false )  then		-- 七夕不思議奇花
		LoadQuestOption( OwnerID() )	--載入任務模板
		--SetSpeakDetail( OwnerID(), GetString("SC_111307_9") )
		--AddSpeakOption( OwnerID(), TargetID(), GetString("SC_111307_8") , "LuaS_110609_1" , 0 )		-- 選項，接受任務-我是真的最愛你
	elseif ( CheckFlag( OwnerID() , 541324 ) == true ) and ( CheckFlag( OwnerID() , 541326 ) == false ) and CheckAcceptQuest( OwnerID() , 421346 ) == false then
		SetFlag( OwnerID() , 541324 , 0 )
		LoadQuestOption( OwnerID() )	--載入任務模板
	elseif CheckFlag( OwnerID() , 541324 ) == true and CheckFlag( OwnerID() , 541326 ) == true then
		SetSpeakDetail( OwnerID(), GetString("SC_111307_6") )	-- 茱莉，對不起…我…我…我是真的…對不起，對不起，我喜歡的人…真的是妳啊！
	elseif CheckFlag( OwnerID() , 541324 ) == true then
		SetSpeakDetail( OwnerID(), GetString("SC_111307_15") )
	else
		SetSpeakDetail( OwnerID(), GetString("SC_111307_6") )	-- 茱莉，對不起…我…我…我是真的…對不起，對不起，我喜歡的人…真的是妳啊！
	end

end

function LuaS_110609_1()
	CloseSpeak( OwnerID() )	-- 關閉對話視窗
	SetFlag( OwnerID() , 541324 , 1 )	-- 2008七夕情人任務接受
end

function LuaS_110610()	-- 茱莉
	if CheckFlag( OwnerID() , 541323 ) == true then
		LoadQuestOption( OwnerID() )	--載入任務模板
	elseif CheckFlag( OwnerID() , 541325 ) == true and CheckFlag( OwnerID() , 541326 ) == false then
		SetSpeakDetail( OwnerID(), GetString("SC_111307_27") )
	elseif CheckFlag( OwnerID() , 541326 ) == true then 
		SetSpeakDetail( OwnerID(), GetString("SC_111307_21") )
		AddSpeakOption( OwnerID(), TargetID(), GetString("SC_111307_22") , "LuaS_110610_1" , 0 )
		AddSpeakOption( OwnerID(), TargetID(), GetString("SC_111307_23") , "LuaS_110610_2" , 0 )
	else
		SetSpeakDetail( OwnerID(), GetString("SC_111307_7") )
	end
end

function LuaS_110610_1()
	CloseSpeak( OwnerID() )	-- 關閉對話視窗
	if DelBodyItem( OwnerID() , 202694 , 1 ) then	-- 愛意之戒
		GiveBodyItem( OwnerID() , 202695 , 1 )	-- 好人卡
		tell( OwnerID() , TargetID() , GetString("SC_111307_24") )
		SetFlag( OwnerID(), 541323 , 1 )
		SetFlag( OwnerID(), 541324 , 0 )
		SetFlag( OwnerID(), 541325 , 1 )
		SetFlag( OwnerID() , 541326 , 0 )
	end
end

function LuaS_110610_2()
	CloseSpeak( OwnerID() )	-- 關閉對話視窗
	if DelBodyItem( OwnerID() , 202694 , 1 ) then	-- 愛意之戒
		if ReadRoleValue( OwnerID() , EM_RoleValue_SEX ) == 0 then
			GiveBodyItem( OwnerID() , 221391 , 1 )	-- 七夕耳環
		elseif ReadRoleValue( OwnerID() , EM_RoleValue_SEX ) == 1 then
			GiveBodyItem( OwnerID() , 221392 , 1 )	-- 七夕戒指
		end
		tell( OwnerID() , TargetID() , GetString("SC_111307_25") )
		SetFlag( OwnerID(), 541323 , 1 )
		SetFlag( OwnerID(), 541324 , 0 )
		SetFlag( OwnerID(), 541325 , 1 )
		SetFlag( OwnerID() , 541326 , 0 )
	end
end

function LuaS_110020()	-- 達克
	local hour = GetSystime(1)
	--local min = GetSystime(2)

	if ( hour >= 18 and hour < 20 ) and CheckFlag( OwnerID() , 541324 ) == true and CheckFlag( OwnerID() , 541326 ) == false then		-- 2008七夕情人任務接受
		SetSpeakDetail( OwnerID(), GetString("SC_111307_10") )
		AddSpeakOption( OwnerID(), TargetID(), GetString("SC_111307_11") , "LuaS_110020_1" , 0 )		-- 選項，接受任務-護送密語包裹
	elseif CountBodyItem( OwnerID() , 202696 ) >= 1 and CheckFlag( OwnerID() , 541324 ) == true and CheckFlag( OwnerID() , 541326 ) == false then
		SetSpeakDetail( OwnerID(), GetString("SC_111307_10") )
		AddSpeakOption( OwnerID(), TargetID(), GetString("SC_111307_11") , "LuaS_110020_1" , 0 )		-- 選項，接受任務-護送密語包裹
	else
		LoadQuestOption( OwnerID() )	--載入任務模板
	end
end

function LuaS_110020_1()
	CloseSpeak( OwnerID() )	-- 關閉對話視窗
	if ( EmptyPacketCount( OwnerID() ) < 1 ) and QueuePacketCount( OwnerID() ) == 0 then
		tell( OwnerID() , TargetID() , GetString("SC_111307_16") )		-- 你的背包似乎已經沒有空位了，請清理一下再過來找我！
	else

		local MessageString = ReplaceString( GetString("SC_111307_19") , "PlayerName" , GetName( OwnerID() ) )
		local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
		local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
		if CountBodyItem( OwnerID() , 202693 ) < 1 then
			tell( OwnerID() , TargetID() , GetString("SC_111307_18") )
			-- 請儘速將這個冒險協會密語包裹，送到凡瑞娜絲城的職業大廳，交給達莉絲會長。
			GiveBodyItem( OwnerID() , 202693 , 1 )	-- 冒險協會密語包裹
			CastSpell( TargetID() , OwnerID() , 491270 )
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsg( OwnerID() , 2 , MessageString )
			end
		else
			tell( OwnerID() , TargetID() , GetString("SC_111307_17") )
			-- 你的身上已有冒險協會密語包裹，請儘速送到凡瑞娜絲城的職業大廳，交給達莉絲會長。
			CastSpell( TargetID() , OwnerID() , 491270 )
			--if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				-- RunningMsg( OwnerID() , 2 , MessageString )
			--end
		end
	end
end

function LuaS_110167_6()	-- 達莉絲
	CloseSpeak( OwnerID() )	-- 關閉對話視窗

	local MessageString = ReplaceString( GetString("SC_111307_20") , "PlayerName" , GetName( OwnerID() ) )

	if CheckBuff( OwnerID() , 501666 ) == true or CheckFlag( OwnerID() , 541327 ) == true then
		if DelBodyItem( OwnerID() , 202693 , 1 ) then 	-- 冒險協會密語包裹
			CancelBuff( OwnerID() , 501666 ) --取消BUFF
			CancelBuff( OwnerID() , 501668 )
			GiveBodyItem( OwnerID() , 202694 , 1 )	-- 愛意之戒
			tell( OwnerID() , TargetID() , GetString("SC_111307_14") )
			SetFlag( OwnerID() , 541326 , 1 )
			SetFlag( OwnerID(), 541327 , 0 )
			local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
			local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsg( OwnerID() , 2 , MessageString )
			end
		--else --超過時間回來的訊息
		--	ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SAY_110989_1"), 0 );
		end
	end
end


function LuaPK_Love_Action_Killer()

	local MessageString = ""
	MessageString = ReplaceString( GetString("SC_111307_30") , "KillerName" , GetName( TargetID() ) )
	MessageString = ReplaceString( MessageString  , "PlayerName" , GetName( OwnerID() ) )

	if CountBodyItem( OwnerID() , 202695 ) >= 1 then	-- 好人卡
		if DelBodyItem( OwnerID() , 202695 , 1 ) then
			GiveBodyItem( TargetID() , 202695 , 1 )
			SetFlag( OwnerID(), 541327 , 1 )
			MessageString = ReplaceString( MessageString  , "ItemName" , GetString("SC_111307_31") )
		end
	elseif CountBodyItem( OwnerID() , 202693 ) >= 1 then 	-- 冒險協會密語包裹
		if DelBodyItem( OwnerID() , 202693 , 1 ) then
			GiveBodyItem( TargetID() , 202694 , 1 )	-- 愛意之戒
			MessageString = ReplaceString( MessageString  , "ItemName" , GetString("SC_111307_32") )
		end
	end

	SetFlag( OwnerID(), 541324 , 0 )
	SetFlag( OwnerID(), 541325 , 1 )
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsg( TargetID() , 2 , MessageString )
	end
end
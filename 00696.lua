function LuaS_111082()
	LoadQuestOption( OwnerID() )	--載入任務模板
	if CheckAcceptQuest( OwnerID() , 421011 ) == true or CheckAcceptQuest( OwnerID() , 421012 ) == true then
		if CountBodyItem ( OwnerID() , 202223 ) <= 10 then	-- 10棵沼地蕨
			AddSpeakOption( OwnerID() , TargetID() , GetString("SO_111082_1") , "LuaS_111082_BUY" , 0 )	-- 增加一個選項：收買沼地蕨
		end
	end
end

function LuaS_111082_BUY()
	CloseSpeak( OwnerID() )	--關閉對話視窗
	BeginPlot( OwnerID(), "LuaS_111082_Dialog", 1 )
end

function LuaS_111082_Dialog()
	local n = 0
	local DialogResult = ""
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , GetString("SO_111082_2") )	-- 想買沼地蕨？ 10 棵的價格是 50 銀，你要買嗎？
		DialogSelectStr( OwnerID() , GetString("SO_111082_3") )	-- 沒問題，我買了！
		DialogSelectStr( OwnerID() , GetString("SO_111082_4") )	-- 太貴了不想買！
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF

		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--資料送出有問題
			return 0
		end
		
		while true do
			Sleep( 5 )
			local DialogStatus = DialogGetResult( OwnerID() );
			n = n + 1
			if n > 60 then -- 防無窮迴圈，60 = 半分鐘
				--ScriptMessage( OwnerID(), OwnerID(), 0, "無窮迴圈", 0 )
				DialogClose( OwnerID() )
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				break
			else
				--ScriptMessage( OwnerID(), OwnerID(), 0, "合法迴圈", 0 )
			end

			if ( DialogStatus >-2 ) then 
				if ( DialogStatus == 0 ) then
					DialogResult = "Yes"
					DialogClose( OwnerID() )
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					break;
				elseif ( DialogStatus == 1 ) or (DialogStatus==-1) then
					DialogResult = "No"
					DialogClose( OwnerID() )
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					break;
				end
			end
		end

		if ( DialogResult == "Yes" ) then
			local Money = Read_Role_Money( OwnerID() )
			--ScriptMessage( OwnerID(), TargetID(), 0, "You Have Money："..Money , 0 )

			if ( Money < 5000 ) then
				Say ( OwnerID() , GetString("SO_111082_5") )	-- 你身上的金錢不足，我無法賣給你！
			else
				Role_MoneyChange( OwnerID(), -5000 )
				GiveBodyItem ( OwnerID() , 202223 , 10 )	-- 10棵沼地蕨
			end
		elseif ( DialogResult == "No" ) then

		else
			Say ( OwnerID() , GetString("SO_111082_6") )	-- 還是下次再來買吧！
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end

end

function LuaS421012_CHECK()
	local ClickObj = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	if ( ClickObj == 111101 ) then
		if CountBodyItem( OwnerID() , 202198 ) >= 5 then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_421012_5") , 0 )	-- 已經取得五份原汁，不需再進行燒烤了！
			return false
		elseif CountBodyItem( OwnerID() , 200295 ) < 1 then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_421012_1") , 0 )	-- 缺乏柳木，無法進行燒烤！
			return false
		elseif CountBodyItem( OwnerID() , 202223 ) < 1 then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_421012_2") , 0 )	-- 缺乏沼地蕨，無法進行燒烤！
			return false
		else
			return true
		end
	elseif ( ClickObj == 111086 ) then
		return true
	end

end

function LuaS421012_CLICK()
	local ClickObj = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	if ( ClickObj == 111101 ) then
		local RND =  Rand( 99 ) + 1	-- 產生 1~100 的亂數
		--Say( TargetID() , RND )
		if ( RND <= 50 ) then
			if DelBodyItem ( OwnerID() , 200295 , 1 ) and DelBodyItem ( OwnerID() , 202223 , 1 ) then
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_421012_3") , 0 )	-- 順利完成燒烤！
				GiveBodyItem ( OwnerID() , 202198 , 1 )
				return true
			end
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_421012_4") , 0 )	-- 燒烤的不太順利，浪費了柳木與沼地蕨…
			DelBodyItem ( OwnerID() , 200295 , 1 )
			DelBodyItem ( OwnerID() , 202223 , 1 )
			return false
		end
	elseif ( ClickObj == 111086 ) then
		return true
	end
end
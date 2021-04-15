function LuaI_421452_A_Check()

	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local MonsterID = 100992

	if CheckAcceptQuest( OwnerID() , 421452 ) == false then
		return false							--沒有任務的狀態
	elseif CountBodyItem( OwnerID() , 202919 ) >= 10 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_421452_1") , 0 )	--你已經達成野生蘑菇人捕捉的數量
		return false
	elseif ( CheckID( TargetID() ) == false ) or ( TargetID() == OwnerID() ) or  ( OrgID ~= MonsterID ) then
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_421452_2") , 0 )	--你所捕捉對象不是野生蘑菇人！
		return false
	else
		return true
	end

end

function LuaC_421452_A_Effect()

	BeginPlot( TargetID() , "LuaI_421452_Reset" , 0 )
	ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_421452_3") , 0 )	--你成功的捕捉到一隻普通野生蘑菇人！
	GiveBodyItem( OwnerID() , 202919 , 1 )
	BeginPlot( OwnerID() , "LuaS_421452_SetFlag" , 0 )

end

function LuaI_421452_B_Check()

	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local MonsterID = 100992

	if CheckAcceptQuest( OwnerID() , 421452 ) == false then
		return false							--沒有任務的狀態
	elseif CountBodyItem( OwnerID() , 202920 ) >= 1 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_421452_1") , 0 )	--你已經達成野生蘑菇人捕捉的數量
		return false
	elseif ( CheckID( TargetID() ) == false ) or ( TargetID() == OwnerID() ) or  ( OrgID ~= MonsterID ) then
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_421452_2") , 0 )	--你所捕捉對象不是野生蘑菇人！
		return false	
	else
		return true
	end

end

function LuaC_421452_B_Effect()

	BeginPlot( TargetID() , "LuaI_421452_Reset" , 0 )
	ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_421452_4") , 0 )	--你成功的捕捉到一隻黃金野生蘑菇人！
	GiveBodyItem( OwnerID() , 202920 , 1 )
	BeginPlot( OwnerID() , "LuaS_421452_SetFlag" , 0 )

end

function LuaI_421452_Reset()
	LuaFunc_ResetObj( OwnerID() )
end

function LuaS_421452_SetFlag()

	Sleep( 10 )
	if CountBodyItem( OwnerID() , 202919 ) >= 10 then
		SetFlag( OwnerID() , 541797 , 1 )	--野生蘑菇人捕捉完畢
	end
	if CountBodyItem( OwnerID() , 202920 ) >= 1 then
		SetFlag( OwnerID() , 541797 , 1 )	--野生蘑菇人捕捉完畢
	end

end

function LuaQ_421452_Complete()

	DelBodyItem( TargetID() , 202919 , CountBodyItem( TargetID() , 202919 ) )
	DelBodyItem( TargetID() , 202937 , CountBodyItem( TargetID() , 202937 ) )

	if DelBodyItem( TargetID() , 202920 , 1 ) then
		local RND =  Rand( 1000 ) + 1	-- 產生 1~1000 的亂數
		local ItemID
		if RND > 0 and RND <= 400 then
			ItemID = 202921
		elseif RND > 400 and RND <= 600 then
			ItemID = 202922
		elseif RND > 600 and RND <= 800 then
			ItemID = 202923
		elseif RND > 800 and RND <= 900 then
			ItemID = 202924
		elseif RND > 900 and RND <= 950 then
			ItemID = 202925
		elseif RND > 950 and RND <= 999 then
			ItemID = 202926
		elseif RND > 999 and RND <= 1000 then
			ItemID = 202927
		else
			Say( TargetID() , "Somrthing Error !!")
		end

		GiveBodyItem( TargetID() , ItemID , 1 )
	end
end

function LuaS_111377()

	LoadQuestOption( OwnerID() )	--載入任務模板
	if	GetServerDataLanguage()  ~= "kr"	then--如果不是韓版的才秀
		if CheckAcceptQuest( OwnerID() , 421452 ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString("SC_421452_5"), "LuaS_111377_BUY" , 0 )	--選項，我要購買黃金套繩
		end
	end
end

function LuaS_111377_BUY()
	CloseSpeak( OwnerID() )	--關閉對話視窗
	BeginPlot( OwnerID(), "LuaS_111377_Dialog", 1 )
end

function LuaS_111377_Dialog()
	local n = 0
	local DialogResult = ""
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷

		if CheckFlag( OwnerID() , 541799 ) == false then
			DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , GetString("SC_421452_6") )	-- 黃金套繩只需花費您 1 元的符文幣，你想要購買嗎？
		else
			DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , GetString("SC_421452_10") )	-- 黃金套繩只需花費您 10 元的符文幣，你想要購買嗎？
		end
		DialogSelectStr( OwnerID() , GetString("SC_421452_7") )	-- 沒問題，我買了！
		DialogSelectStr( OwnerID() , GetString("SC_421452_8") )	-- 太貴了不想買！
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF

		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--資料送出有問題
			return 0
		end
		
		while true do
			Sleep( 5 )
			local DialogStatus = DialogGetResult( OwnerID() );
			n = n + 1
			if n > 120 then -- 防無窮迴圈，120 = 1分鐘
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
			local AccountMoney = ReadRoleValue( OwnerID() , EM_RoleValue_Money_Account )
			--ScriptMessage( OwnerID(), TargetID(), 0, "You Have Money："..AccountMoney , 0 )

			if CheckFlag( OwnerID() , 541799 ) == false then
				if ( AccountMoney < 1 ) then
					ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_421452_9") , C_DEFAULT )	-- 你身上的符文幣不足，請進行儲值！
					--Say ( TargetID() , GetString("SC_421452_9") )	-- 你身上的符文幣不足，請進行儲值！
				else
		 			if AddMoney_Account( OwnerID() ,  EM_ActionType_PlotGive , -1 )==true then--玩家付1晶鑽，給他黃金套繩抓蘑菇人當寵物(第1次購買優惠)
						SetFlag( OwnerID() , 541799 , 1 )
						GiveBodyItem ( OwnerID() , 202938 , 1 )	-- 黃金套繩
					else
						ScriptMessage(OwnerID(),OwnerID(),1,"[SC_EXCHANGE_FAIL]",0);
					end
				end
			else
				if ( AccountMoney < 10 ) then
					ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_421452_9") , C_DEFAULT )	-- 你身上的符文幣不足，請進行儲值！
					--Say ( TargetID() , GetString("SC_421452_9") )	-- 你身上的符文幣不足，請進行儲值！
				else
		 			if AddMoney_Account( OwnerID() ,  EM_ActionType_PlotGive , -10 )==true then--玩家付10晶鑽，給他黃金套繩抓蘑菇人當寵物
						GiveBodyItem ( OwnerID() , 202938 , 1 )	-- 黃金套繩
					else
						ScriptMessage(OwnerID(),OwnerID(),1,"[SC_EXCHANGE_FAIL]",0);
					end
				end	
			end			
		elseif ( DialogResult == "No" ) then

		else
			--Say ( OwnerID() , GetString("SO_111082_6") )	-- 還是下次再來買吧！
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end

end

function LuaI_Enter_Myconid_Farm()
	SetPlot( OwnerID() , "Collision" , "Enter_Myconid_Farm" ,  0 )
end

function Enter_Myconid_Farm()
	if ChangeZone( OwnerID() , 301 , -1 , 1114 , 0 , 1075 , 305 ) then
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					--取得玩家等級
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--取得玩家副職等級
		DesignLog(OwnerID(),301,"last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)	--紀錄進入人次
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
	end
end

function LuaI_Outer_Myconid_Farm()
	SetPlot( OwnerID() , "Collision" , "Outer_Myconid_Farm" ,  0 )
end

function Outer_Myconid_Farm()
	ChangeZone( OwnerID() , 1 , 0 , -1953 , 191 , -7700 , 90 )
end

function LuaI_Myconid_Pet()
	local Seed = 491310
	local RND = Rand( 5 ) + 1
	CastSpell( OwnerID() , OwnerID() , Seed + RND )
end
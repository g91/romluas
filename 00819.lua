

--婚禮ready (只有異性)
function Marry_Start_Begin2()
--	Say(OwnerID(), "OwnerID 2") -- npc
--	Say(TargetID(), "TargetID 2" ) -- player
	local PartyNum = GetPartyID(TargetID() , -1 )
	local Couple1 = GetPartyID( TargetID() , 1 )
	local Couple2 = GetPartyID( TargetID() , 2 )
	local Relation = GetRelation(Couple1, Couple2)  --檢查雙方關係
	local Relation2 = GetRelation(Couple2, Couple1) -- 檢查雙方關係

	local P1LV = ReadRoleValue( Couple1, EM_RoleValue_LV)
	local P2LV = ReadRoleValue( Couple2, EM_RoleValue_LV)
	local P1Sex = ReadRoleValue(Couple1, EM_RoleValue_SEX)
	local P2Sex = ReadRoleValue(Couple2, EM_RoleValue_SEX)

	local P1_DBID = ReadRoleValue(Couple1, EM_RoleValue_DBID ) --1P的DBID
	local P2_DBID = ReadRoleValue(Couple2, EM_RoleValue_DBID ) --2P的DBID
	local P1_online =  CheckOnlinePlayer(P1_DBID )  -- 在不在線上
	local P2_online =  CheckOnlinePlayer(P2_DBID )  -- 在不在線上

	local IamS = Check_Relation( Couple1 , EM_RelationType_Student )  --1P是S
	local IamT = Check_Relation( Couple1, EM_RelationType_Teacher )  --1P是T
	local IamH = Check_Relation( Couple1 , EM_RelationType_Husband )  --
	local IamW = Check_Relation( Couple1 , EM_RelationType_Wife  )  --
	local IamL = Check_Relation( Couple1 , EM_RelationType_Lover )  --
	local IamF = Check_Relation( Couple1 , EM_RelationType_Family  )  --
	local IamB = Check_Relation( Couple1 , EM_RelationType_BestFriend  )  --
---------------
	local YouS = Check_Relation( Couple2 , EM_RelationType_Student )  --
	local YouT = Check_Relation( Couple2, EM_RelationType_Teacher )  --
	local YouH = Check_Relation( Couple2 , EM_RelationType_Husband )  --
	local YouW = Check_Relation( Couple2 , EM_RelationType_Wife  )  --
	local YouL = Check_Relation( Couple2 , EM_RelationType_Lover )  --
	local YouF = Check_Relation( Couple2 , EM_RelationType_Family  )  --
	local YouB = Check_Relation( Couple2 , EM_RelationType_BestFriend  )  --

	local P1_POS19_DBID  = GetRelation_DBID( Couple1 , 19 )
	local P2_POS19_DBID  = GetRelation_DBID( Couple2 , 19 )
--------------
--	Say(TargetID(), Relation )
--	Say(TargetID(), Relation2 )
	if ( PartyNum == 0 ) then
		ScriptMessage( TargetID(), TargetID(), 2, "[SC_MARRY_7]" , C_SYSTEM )	--畫面中間訊息  新郎與新娘必須維持兩人小隊，才可以開始婚禮。
		ScriptMessage( TargetID(), TargetID(), 0, "[SC_MARRY_7]" , C_SYSTEM )	--訊息欄
	elseif ( PartyNum == 1 ) then
		ScriptMessage( TargetID(), TargetID() , 2, "[SC_RELATION_OFFLINE]" , C_SYSTEM )	--畫面中間訊息   與你申請結婚的對象不在線上，無法申請。
		ScriptMessage( TargetID(), TargetID() , 0, "[SC_RELATION_OFFLINE]" , C_SYSTEM )	--訊息欄
	elseif ( PartyNum == 2 ) then
		if GetDistance( Couple1 , OwnerID() ) <= 200 and GetDistance( Couple2 , OwnerID() ) <= 200 and GetDistance( Couple1 , OwnerID() ) ~= -1 and GetDistance( Couple2 , OwnerID() ) ~= -1 then
			if P1LV  < 18 or P2LV  < 18 then   -- 未滿 LV18
				ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_34]" , C_SYSTEM )	--畫面中間訊息  雙方所有職業其中之一的職業等級必須在LV18以上
				ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_34]" , C_SYSTEM )	--訊息欄
				ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_34]" , C_SYSTEM )	--畫面中間訊息  雙方所有職業其中之一的職業等級必須在LV18以上
				ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_34]" , C_SYSTEM )	--訊息欄
			elseif P1Sex == 0 and P2Sex == 0 then -- 兩個角色都是男的
				ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_46]" , C_SYSTEM )	--畫面中間訊息  申請結婚的雙方角色為同性別，無法申請結婚。
				ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_46]" , C_SYSTEM )	--訊息欄
				ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_46]" , C_SYSTEM )	--畫面中間訊息  申請結婚的雙方角色為同性別，無法申請結婚。
				ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_46]" , C_SYSTEM )	--訊息欄
			elseif P1Sex == 1 and P2Sex == 1 then -- 兩個角色都是女的
				ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_46]" , C_SYSTEM )	--畫面中間訊息  申請結婚的雙方角色為同性別，無法申請結婚。
				ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_46]" , C_SYSTEM )	--訊息欄
				ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_46]" , C_SYSTEM )	--畫面中間訊息  申請結婚的雙方角色為同性別，無法申請結婚。
				ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_46]" , C_SYSTEM )	--訊息欄
			elseif P1_POS19_DBID ~= 0 then  --如果此值不等於0 (表示此玩家已有20個特殊關係角色)
				ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_COUNTOVER]" , C_SYSTEM )	--畫面中間訊息  你的特殊關係數量已達上限，無法建立關係。
				ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_COUNTOVER]" , C_SYSTEM )	--訊息欄
				ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_COUNTOVER]" , C_SYSTEM )	--畫面中間訊息  你的特殊關係數量已達上限，無法建立關係。
				ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_COUNTOVER]" , C_SYSTEM )	--訊息欄
			elseif P2_POS19_DBID ~= 0 then  --如果此值不等於0 (表示此玩家已有20個特殊關係角色)
				ScriptMessage( Couple1, Couple1, 2, "[SC_RELATION_COUNTOVER]" , C_SYSTEM )	--畫面中間訊息  你的特殊關係數量已達上限，無法建立關係。
				ScriptMessage( Couple1, Couple1, 0, "[SC_RELATION_COUNTOVER]" , C_SYSTEM )	--訊息欄
				ScriptMessage( Couple2, Couple2, 2, "[SC_RELATION_COUNTOVER]" , C_SYSTEM )	--畫面中間訊息  你的特殊關係數量已達上限，無法建立關係。
				ScriptMessage( Couple2, Couple2, 0, "[SC_RELATION_COUNTOVER]" , C_SYSTEM )	--訊息欄
			elseif  ( IamH == true or YouW == true ) or ( IamW == true or YouH == true ) then  -- 雙方或其中之一為已婚狀態
				ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_39]" , C_SYSTEM )	--畫面中間訊息  雙方或其中之一為已婚狀態，無法進行婚禮。
				ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_39]" , C_SYSTEM )	--訊息欄
				ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_39]" , C_SYSTEM )	--畫面中間訊息  雙方或其中之一為已婚狀態，無法進行婚禮。
				ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_39]" , C_SYSTEM )	--訊息欄
			elseif Relation == -1 and Relation2 == -1 then 	--雙方沒有任何關係
			--可結婚
				BeginPlot(TargetID(), "Marry_Start_Begin3" , 0)  --結婚
			else
			--不可結婚 訊息
				ScriptMessage(  Couple1,  Couple1, 2, "[SC_MARRY_41]" , C_SYSTEM )	--畫面中間訊息  雙方或其中之一已有其它關係，無法進行婚禮。
				ScriptMessage(  Couple1,  Couple1, 0, "[SC_MARRY_41]" , C_SYSTEM )	--訊息欄
				ScriptMessage(  Couple2,  Couple2, 2, "[SC_MARRY_41]" , C_SYSTEM )	--畫面中間訊息  雙方或其中之一已有其它關係，無法進行婚禮。
				ScriptMessage(  Couple2,  Couple2, 0, "[SC_MARRY_41]" , C_SYSTEM )	--訊息欄
			end
		else
			ScriptMessage( Couple1, Couple1 , 2, "[SC_MARRY_8]" , C_SYSTEM )	--畫面中間訊息   新郎與新娘必須在我的附近，我才能為你們證婚。
			ScriptMessage( Couple1, Couple1 , 0, "[SC_MARRY_8]" , C_SYSTEM )	--訊息欄
			ScriptMessage( Couple2, Couple2 , 2, "[SC_MARRY_8]" , C_SYSTEM )	--畫面中間訊息   新郎與新娘必須在我的附近，我才能為你們證婚。
			ScriptMessage( Couple2, Couple2 , 0, "[SC_MARRY_8]" , C_SYSTEM )	--訊息欄
		end
	elseif ( PartyNum >= 3 ) then
		ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_7]" , C_SYSTEM )	--畫面中間訊息  新郎與新娘必須維持兩人小隊，才可以開始婚禮。
		ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_7]" , C_SYSTEM )	--訊息欄
		ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_7]" , C_SYSTEM )	--畫面中間訊息  新郎與新娘必須維持兩人小隊，才可以開始婚禮。
		ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_7]" , C_SYSTEM )	--訊息欄
	end
end



--婚禮進行式
function Marry_Start_Begin_Combo( Couple1 , Couple2 )
--	Say(OwnerID(), "OwnerID") -- player
--	Say(TargetID(), "TargetID" ) -- npc
	local BoyName = GetName( Couple1 )
	local GirlName =  GetName( Couple2 )
	local PartyNum = GetPartyID(Couple1 , -1 )
	local Message1 = "[SC_MARRY_14][$SETVAR1="..BoyName.."][$SETVAR2="..GirlName.."]"  --BoyName，你願意娶GirlName為你的妻子？
	local Message2=  "[SC_MARRY_17][$SETVAR1="..BoyName.."][$SETVAR2="..GirlName.."]"  --GirlName，你願意嫁給BoyName做為他的妻子？
	local Message3=  "[SC_MARRY_30][$SETVAR1="..BoyName.."][$SETVAR2="..GirlName.."]"  --恭喜 BoyName 與 GirlName 完成婚禮，祝福他們永結同心、永浴愛河！

	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		DialogCreate( Couple1 , EM_LuaDialogType_YesNo , Message1 )	-- BoyName，你願意娶GirlName為你的妻子？照顧她，愛護她，無論貧窮還是富有，疾病還是健康，相愛相敬，不離不棄，永遠在一起？
		DialogSelectStr( Couple1 , GetString("SC_MARRY_15") )			-- 是的，我願意
		DialogSelectStr( Couple1 , GetString("SC_MARRY_16") )			-- 我需要考慮！
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		local Ask_For_Boy = Marry_Ask( Couple1 )
		if Ask_For_Boy == "Yes" then
			if ( PartyNum == 0 ) then
				ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_7]" , C_SYSTEM )	--畫面中間訊息  新郎與新娘必須維持兩人小隊，才可以開始婚禮。
				ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_7]" , C_SYSTEM )	--訊息欄
				ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_7]" , C_SYSTEM )	--畫面中間訊息  新郎與新娘必須維持兩人小隊，才可以開始婚禮。
				ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_7]" , C_SYSTEM )	--訊息欄
			elseif ( PartyNum == 1 ) then
				ScriptMessage( OwnerID(), OwnerID() , 2, "[SC_RELATION_OFFLINE]" , C_SYSTEM )	--畫面中間訊息   與你申請結婚的對象不在線上，無法申請。
				ScriptMessage( OwnerID(), OwnerID() , 0, "[SC_RELATION_OFFLINE]" , C_SYSTEM )	--訊息欄
			elseif  ( PartyNum >= 3 ) then
				ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_7]" , C_SYSTEM )	--畫面中間訊息  新郎與新娘必須維持兩人小隊，才可以開始婚禮。
				ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_7]" , C_SYSTEM )	--訊息欄
				ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_7]" , C_SYSTEM )	--畫面中間訊息  新郎與新娘必須維持兩人小隊，才可以開始婚禮。
				ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_7]" , C_SYSTEM )	--訊息欄
			elseif  ( PartyNum == 2 ) then 
				Say( Couple1 , GetString("SC_MARRY_15") )
				if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
					DialogCreate( Couple2 , EM_LuaDialogType_YesNo , Message2 )	-- GirlName，你願意嫁給BoyName做為他的妻子？跟隨他，扶持他，無論貧窮還是富有，疾病還是健康，相愛相敬，不離不棄，永遠在一起？
					DialogSelectStr( Couple2 , GetString("SC_MARRY_15") )			-- 是的，我願意
					DialogSelectStr( Couple2 , GetString("SC_MARRY_16") )			-- 我需要考慮！
					AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
					local Ask_For_Girl = Marry_Ask(Couple2 )
					if Ask_For_Girl == "Yes" then
						if ( PartyNum == 0 ) then
							ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_7]" , C_SYSTEM )	--畫面中間訊息  新郎與新娘必須維持兩人小隊，才可以開始婚禮。
							ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_7]" , C_SYSTEM )	--訊息欄
							ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_7]" , C_SYSTEM )	--畫面中間訊息  新郎與新娘必須維持兩人小隊，才可以開始婚禮。
							ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_7]" , C_SYSTEM )	--訊息欄
						elseif  ( PartyNum >= 3 ) then
							ScriptMessage( Couple1, Couple1, 2, "[SC_MARRY_7]" , C_SYSTEM )	--畫面中間訊息  新郎與新娘必須維持兩人小隊，才可以開始婚禮。
							ScriptMessage( Couple1, Couple1, 0, "[SC_MARRY_7]" , C_SYSTEM )	--訊息欄
							ScriptMessage( Couple2, Couple2, 2, "[SC_MARRY_7]" , C_SYSTEM )	--畫面中間訊息  新郎與新娘必須維持兩人小隊，才可以開始婚禮。
							ScriptMessage( Couple2, Couple2, 0, "[SC_MARRY_7]" , C_SYSTEM )	--訊息欄
						elseif  ( PartyNum == 2 ) then 
							if SetRelation( Couple1  , Couple2 , EM_RelationType_Husband , 0 , EM_RelationType_Wife , 0 ) then	-- 設定夫妻關係
								Say( Couple2 , GetString("SC_MARRY_15") )
								Say( TargetID() , GetString("SC_MARRY_18") )			-- 我現在宣佈，你們正式成為合法的夫妻。恭喜你們！	
								local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
								local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
								if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
									RunningMsg( Couple1 , 2 , Message3 ) 	-- 恭喜 BoyName 與 GirlName 完成婚禮，祝福他們永結同心、永浴愛河！
								end
								SetFlag( Couple1 , 541321 , 1 ) --今天參加過婚禮
								SetFlag( Couple2 , 541321 , 1 ) --今天參加過婚禮
								-- 5.0.6 新版會場事件判斷 ----------------------
								if CheckBuff(Couple1, 623790 ) == true and CheckBuff(Couple2, 623790 ) == true then  -- 有私人婚禮會場租借憑證buff 
									GiveBodyItem(Couple1, 202898, 1 )  -- 給男方氣球
									GiveBodyItem(Couple2, 202899, 1 )  -- 給女方捧花	
								else
									SetFlag( Couple1 , 541320 , 0 )
									SetFlag( Couple2 , 541320 , 0 )		
								end
							end
						end
					end
				else
					ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
				end
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end

----離開結婚會場
function  lua_mika_merry_exit01()  --離開結婚會場(npc)
	SetSpeakDetail(OwnerID(), "[SC_LOSTTREASURE_LEAVE]" )  --你確定要離開這裡嗎？
	AddSpeakOption( OwnerID(), TargetID(), "[SC_MERRY_LEAVE]" , "lua_mika_merry_exit02" , 0 )	--確定
end

function lua_mika_merry_exit02() --離開選項Yesno
	CloseSpeak(OwnerID())
--	BeginPlot(OwnerID()  , "Lua_Clockending" , 0 )   --呼叫clockclose
	CancelBuff(OwnerID(), 501770 )	
	ChangeZone( OwnerID(), 2 , 0 , 4677.3, 109.3 , -2220.9, 326.3)    --ChangeZone 回到凡瑞娜絲城中央廣場
end

function Marry_Ask( Player )
	if( DialogSendOpen( Player ) == false ) then 
		ScriptMessage( Player , Player , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--資料送出有問題
		return 0
	end

	local n = 0
	local DialogResult = ""

	while true do
		Sleep( 10 )
		local DialogStatus = DialogGetResult( Player )
		n = n + 1
	--	Say(OwnerID(), "n")
		if n > 10 then -- 防無窮迴圈，10sec
			--ScriptMessage( Player , Player , 0, "Infinity Loop", 0 )
			DialogClose( Player )
			CancelBuff( OwnerID(), 501570 );--最後清除BUFF
			break
		else
			--ScriptMessage( Player , Player , 0, "OK", 0 )
		end

		if ( DialogStatus >-2) then
			if ( DialogStatus == 0 ) then
				DialogResult = "Yes"
				DialogClose( Player )
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				break
			elseif ( DialogStatus == 1 ) or ( DialogStatus == -1 )then
				DialogResult = "No"
				DialogClose( Player )
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				break
			else
				DialogResult = "Etc"
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				break
			end
		end
	end

	return DialogResult

end
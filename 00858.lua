function LuaI_111367()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Mat );
	SetShop( OwnerID() , 600127 , "Test_Shop_Close" );
end

function LuaS_111367()

	LoadQuestOption( OwnerID() )	--載入任務模板

	if CheckCompleteQuest( OwnerID(), 421450 ) == true then
		AddSpeakOption( OwnerID(), TargetID(), GetString("SC_OLDBRINGNEW_12") , "LuaS_111367_intro" , 0 )		-- 選項，如何進行榮譽組隊？
		AddSpeakOption( OwnerID(), TargetID(), GetString("SC_OLDBRINGNEW_07") , "LuaS_111367_BUY" , 0 )		-- 選項，購買「導師證明」
		AddSpeakOption( OwnerID(), TargetID(), GetString("SC_OLDBRINGNEW_02") , "LuaS_111367_ADDPoint" , 0 )	-- 選項，兌換永久增加基本點數
	end
	if CheckCompleteQuest( OwnerID(), 421457 ) == true then
		AddSpeakOption( OwnerID(), TargetID(), GetString("SC_MAGICBOXEX_01") , "LuaS_111367_MagicBoxEx" , 0 )	-- 選項，兌換魔幻寶盒能量
	end
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111367_0]" , "LuaS_111367_1" , 0 )	-- 選項，詢問溶解石
end

-- 選項，詢問溶解石
function LuaS_111367_1()
	SetSpeakDetail( OwnerID(), "[SC_111367_1]"   )
	AddSpeakOption( OwnerID(), TargetID(), "[SO_110068_2]" , "LuaS_111367" , 0 )	-- 選項，回到上一頁
end

function LuaS_111367_intro()
	SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_13]"   )
	AddSpeakOption( OwnerID(), TargetID(), "[SO_110068_2]" , "LuaS_111367" , 0 )	-- 選項，回到上一頁
end


--選項 - 購買導師證明1
function LuaS_111367_BUY()
	if CheckFlag( OwnerID() , 541800 ) == true and CheckFlag( OwnerID() , 541801 ) == true then
		CloseSpeak( OwnerID() )	--關閉對話視窗
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_OLDBRINGNEW_11]" , 0 )	--畫面中間訊息 你無法再購買，一天只能購買 2 張導師證明！
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_OLDBRINGNEW_11]" , 0 )	--訊息欄
	else
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_08]"   ) 	-- 導師證明一張只需 5000 金，你想要購買嗎？
		AddSpeakOption( OwnerID(), TargetID(), "[SC_OLDBRINGNEW_09]" , "LuaS_111367_BUY2" , 0 )	-- 沒問題，我要買！
		AddSpeakOption( OwnerID(), TargetID(), "[SO_110068_2]" , "LuaS_111367" , 0 )	-- 選項，回到上一頁
	end
end

function LuaS_111367_BUY2()
	CloseSpeak( OwnerID() )	--關閉對話視窗
	local Money = Read_Role_Money( OwnerID() )
	if ( Money < 5000 ) then
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SO_111082_5]" , 0 )	--畫面中間訊息  你身上的金錢不足，我無法賣給你！
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SO_111082_5]" , 0 )	--訊息欄
	else
		Role_MoneyChange( OwnerID(), -5000 )
		if CheckFlag( OwnerID() , 541800 ) == false then
			SetFlag( OwnerID() , 541800 , 1 )
		elseif CheckFlag( OwnerID() , 541800 ) == true then
			SetFlag( OwnerID() , 541801 , 1 )
		end
		GiveBodyItem ( OwnerID() , 202879 , 1 )	-- 導師證明
	end
end

-- 選項，兌換永久增加基本點數
function LuaS_111367_ADDPoint()
	local STR = ReadRoleValue( OwnerID() , EM_RoleValue_STR )  --力量
	local AGI = ReadRoleValue( OwnerID() , EM_RoleValue_AGI )  --敏捷
	local STA = ReadRoleValue( OwnerID() , EM_RoleValue_STA )  --耐力
	local INT = ReadRoleValue( OwnerID() , EM_RoleValue_INT )  --智慧
	local MND = ReadRoleValue( OwnerID() , EM_RoleValue_MND ) --精神
	local time1 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem15 )  --老帶新系統 兌換力量次數
	local time2 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem16 )  --老帶新系統 兌換敏捷次數
	local time3 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem17 )  --老帶新系統 兌換耐力次數
	local time4 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem18 )  --老帶新系統 兌換智慧次數
	local time5 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem19 )  --老帶新系統 兌換精神次數

	local LV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )   -- 主職等級

--	LoadQuestOption( OwnerID() )	--載入任務模板
	if LV < 50 then  --等級低於50
		if  time1 == 50 and time2 == 50 and time3  == 50 and time4 == 50 and time5 == 50  then  --各項數值都加到50
			SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_ALLCHANGE]"   )   --沒有可兌換的項目，所有項目的能力值已兌換完畢。
		else
			SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_MENU]"   )  --你需要兌換哪一種項目呢？
			if time1 <50 then
				AddSpeakOption(OwnerID(), TargetID(), "[SC_OLDBRINGNEW_03_01STR]" , "LuaS_111367_ADDSTR", 0 ) -- 以榮譽積分兌換力量
			end
			if time2 <50 then
				AddSpeakOption(OwnerID(), TargetID(), "[SC_OLDBRINGNEW_03_02AGI]" , "LuaS_111367_ADDAGI", 0 ) -- 以[榮譽積分兌換敏捷
			end
			if time3 <50 then
				AddSpeakOption(OwnerID(), TargetID(), "[SC_OLDBRINGNEW_03_03STA]" , "LuaS_111367_ADDSTA", 0 ) -- 以榮譽積分兌換耐力
			end
			if time4 <50 then
				AddSpeakOption(OwnerID(), TargetID(), "[SC_OLDBRINGNEW_03_04INT]" , "LuaS_111367_ADDINT", 0 ) -- 以榮譽積分兌換智慧
			end
			if time5 <50 then
				AddSpeakOption(OwnerID(), TargetID(), "[SC_OLDBRINGNEW_03_05MND]" , "LuaS_111367_ADDMND", 0 ) -- 以榮譽積分兌換精神
			end
		end
	else -- 主職大於50
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_MENU]"   )  --你需要兌換哪一種項目呢？
		if time1 <50 then
			AddSpeakOption(OwnerID(), TargetID(), "[SC_OLDBRINGNEW_03_01STR]" , "LuaS_111367_ADDSTR", 0 ) -- 以榮譽積分兌換力量
		end
		if time2 <50 then
			AddSpeakOption(OwnerID(), TargetID(), "[SC_OLDBRINGNEW_03_02AGI]" , "LuaS_111367_ADDAGI", 0 ) -- 以[榮譽積分兌換敏捷
		end
		if time3 <50 then
			AddSpeakOption(OwnerID(), TargetID(), "[SC_OLDBRINGNEW_03_03STA]" , "LuaS_111367_ADDSTA", 0 ) -- 以榮譽積分兌換耐力
		end
		if time4 <50 then
			AddSpeakOption(OwnerID(), TargetID(), "[SC_OLDBRINGNEW_03_04INT]" , "LuaS_111367_ADDINT", 0 ) -- 以榮譽積分兌換智慧
		end
		if time5 <50 then
			AddSpeakOption(OwnerID(), TargetID(), "[SC_OLDBRINGNEW_03_05MND]" , "LuaS_111367_ADDMND", 0 ) -- 以榮譽積分兌換精神
		end
		AddSpeakOption(OwnerID(), TargetID(), "[SC_OLDBRINGNEW_03_06TPEXP]" , "LuaS_111367_ADDTP", 0 ) -- 以榮譽積分兌換技能點數
	end
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367", 0 ) --回到上一層
end





--導師證明
function OldBringNew_Tech( Option )
	local PlayerID = OwnerID()
	local PackageID = 202879   -- 導師證明

	if ( Option == "CHECK" ) then
		if CountBodyItem( PlayerID , PackageID ) >= 1 then
			local TechTime = ReadRoleValue( OwnerID() , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_HonorParty )
			local PartyNum = GetPartyID( OwnerID() , -1 )
			if ( PartyNum > 0 ) then
				ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_OLDBRINGNEW_15]" , C_DEFAULT )	-- 持有隊伍狀態下，無法使用此物品。
				return false
			elseif TechTime > 0 or CheckBuff( PlayerID , 506841) == true  then
				--Say( OwnerID() , "TechTime = "..TechTime )
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_OLDBRINGNEW_01") , C_DEFAULT )	-- 無法使用，你目前還處在榮譽組隊的效果之中！！
				return false
			elseif TechTime <= 0 then
				return true
			else
			--	Say( OwnerID() , "Something Error !!")
			end
		else
			return false
		end
	elseif ( Option == "USE" ) then
		WriteRoleValue( OwnerID() , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_HonorParty , 180 )		-- 180分 = 3小時
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_OLDBRINGNEW_14]" , C_SYSTEM )	--畫面中間訊息  你獲得了榮譽組隊效果，現在可帶領新手玩家進行榮譽組隊了！
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_OLDBRINGNEW_14]" , C_SYSTEM )	--訊息欄
		CancelBuff(OwnerID(), 506841)	--20141008新增
		AddBuff( OwnerID() , 506841 , 0 , 10800 )  --3小時
	end
end


function lua_mika_delhonorparty()  --取消榮譽組隊狀態 506841結束時觸發
	WriteRoleValue( OwnerID() , EM_RoleValue_TimeFlag + EM_TimeFlagEffect_HonorParty , -1 )
--	Say(OwnerID(), "Cacel honor party ")
	CancelBuff(OwnerID(), 506841)
end
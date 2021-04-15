
-- 702238-詠火獎勵兌換

-- 詠火祝福禮盒242164 (5.0.8)
Function LuaI_242164()
	local itemset  = {	25 ,"" 	, { 725632 , 1 }	
				,35 ,"" 	, { 725633 , 1 }	
				,57 ,"" 	, { 726942 , 1 }	
				,72 ,"" 	, { 725634 , 1 }	
				,97 ,"" 	, { 725449 , 1 }	
				,100 ,""	, { 241451 , 1 } }

	return BaseTressureProc(   itemset , 1  )
end

--------------------------刪flag----------------------------------------------------
function lua_fireday_delflag()
	local OID = OwnerID()

	----- 符文棋盤  2013 (5.0.8 )
	Setflag(OID, 547380, 0 )  -- 清除完成FLAG

	----- 奔跑吧火焰 2013 (5.0.8 )
	Setflag(OID, 547369, 0 )  -- 清除完成FLAG

	----- 全民升火趣
	SetFlag( OID , 544702, 0 ) --參加券
	SetFlag( OID, 544707, 0 ) --X火堆重複
	SetFlag( OID, 544728, 0 ) --X領獎重複
	SetFlag( OID, 544731, 0 ) --範圍外
	----- 驅趕宴會搗蛋者
	SetFlag( OID, 544706, 0)--完成趕老鼠領過獎
	SetFlag( OID, 544705, 0)--趕老鼠完成
	SetFlag( OID, 544704, 0)--以接任務
	CancelBuff( OID, 508510) --刪詠火BUFF
	CancelBuff( OID, 508614) 

	--聖火祈福投擲樂
	SetFlag( OID, 546122, 0)
	SetFlag( OID, 546140, 0)
	SetFlag( OID, 546121, 0)

	--淨化驅疫
	local Count = CountBodyItem( OID , 240510 ) --符文陷阱數量
	DelBodyItem( OID , 240510 , Count ) --符文陷阱
	DelBodyItem( OID , 240509 , 1 )  --火焰粉末
	CancelBuff( OID , 621833 ) --刪除好心人(報名BUFF)
	SetFlag( OID , 546014 , 0 ) --刪除參加key

	ScriptMessage( OID , OID , 1 , "[SC_FIREDAY_09]" , C_SYSTEM )
end

------------------------獎勵兌換----------------------------------------------------
function lua_fireday_changegoods()
	local needcount = 5
	local Language = GetServerDataLanguage() 
--	if Language ~= "rw" then  -- 台版專屬沒有重置選項  測試用
	if Language ~= "tw" then  -- 台版專屬沒有重置選項  正式版
		SetSpeakDetail( OwnerID(), "[SC_FIREDAY_03][$SETVAR1="..needcount.."]" ) --感謝你熱烈參與各活動，這是我們提供的酬謝！
	else  
		SetSpeakDetail( OwnerID(), "[SC_FIREDAY_03_TW][$SETVAR1="..needcount.."]" ) --沒重置字串
	end

	AddSpeakOption( OwnerID(), TargetID( ), "[SC_FIREDAY_04]", "lua_fireday_rewards", 0 ) --獎券兌換


--	if Language ~= "rw" then  -- 台版專屬沒有重置選項  測試用
	if Language ~= "tw" then  -- 台版專屬沒有重置選項  正式版
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_FIREDAY_05]" , "lua_fireday_changegame", 0 ) --活動重置--買商城的來兌換 202904
	end
end

 ----------------------獎券兌換----------------------------------------------------------
function lua_fireday_rewards()
	local needcount = 5
	local R = Rand(100)+1

	if CountBodyItem ( OwnerID() , 208918 ) >= needcount then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			-- 5.0.8 變更 -----------------
			DesignLog( OwnerID() , 1217373 , " 2013 Firegame , reward change " )	--  紀錄獎勵兌換次數(5.0.8開始才有)
			GiveBodyItem(OwnerID(), 242164, 1) --詠火節慶祝包
			GiveBodyItem(OwnerID(), 241482, 20 )   -- 星座寵材料 山岩元素(241482)
			---------------------------------
			DelBodyItem( OwnerID() , 208918 , needcount )
			if R<6 then  -- 5%機率額外給重置券
				GiveBodyItem(OwnerID(), 208919, 1) -- 重置券
			end
			
			SetSpeakDetail( OwnerID(), GetString("SC_FIREDAY_08")  ) --感謝參與
		else
			SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG10")   )--您的背包空間不足，請清理一下再來吧。
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , " lua_fireday_changegoods", 0 ) --回上一頁
		end

	else
		SetSpeakDetail( OwnerID(), GetString("SC_0908SEANSON_26") ) --數量不足
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , " lua_fireday_changegoods", 0 ) --回上一頁
	end
end

---------------------重置兌換----------------------------------------------------------
function lua_fireday_changegame()
	if  CountBodyItem( OwnerID() , 202904 ) >= 1 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			GiveBodyItem(OwnerID(), 208919, 1) 
			DelBodyItem( OwnerID() , 202904 , 1 )
			SetSpeakDetail( OwnerID(), GetString("SC_FIREDAY_08")  ) --感謝參與
		else
			SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG10")   )--您的背包空間不足，請清理一下再來吧。
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , " lua_fireday_changegoods", 0 ) --回上一頁
		end
	else
		SetSpeakDetail( OwnerID(), GetString("SC_FIREDAY_07") ) --數量不足
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , " lua_fireday_changegoods", 0 ) --回上一頁
	end
end
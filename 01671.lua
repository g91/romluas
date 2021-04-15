--抽籤活動
function Lua_FN_JPNewYear_Q1_Main() 
	LoadQuestOption( OwnerID() )
	SetSpeakDetail( OwnerID(), "[SC_JPNEWYEAR_Q1_1]" ) --每當到了新年這時候，城裏頭的人都會互相拜年以及求籤來占卜今日的運勢，你要不要也來抽一支呢？
	AddSpeakOption( OwnerID(), TargetID(), "[SC_JPNEWYEAR_Q1_2]", "Lua_FN_JPNewYear_Q1_GiveItem", 0) --我要抽支籤看看今日運勢!
	AddSpeakOption( OwnerID(), TargetID(), "[SC_JPNEWYEAR_Q1_4]", "Lua_FN_JPNewYear_Q1_BuyItem", 0) --購買可以去除霉運的鹽
end

----------------------------------------------------------------------------------------------------
function Lua_FN_JPNewYear_Q1_GiveItem()
	local Signed_Flag = CheckFlag(OwnerID()  , 543508) --看看今天是不是已經抽過籤
	if Signed_Flag == false then
		if CountBodyItem( OwnerID(), 206411) >= 1 then  --檢查玩家身上有沒有未開的籤
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_JPNEWYEAR_Q1_6]", 0 )
			CloseSpeak( OwnerID() )
		else
			SetFlag( OwnerID()  , 543508 , 1 )
			if CheckCompleteQuest( OwnerID(), 422861 ) == false then -- 看看是不是已經完成超大福袋任務
				if CheckFlag( OwnerID(), 543549 ) == true then
					if CheckFlag( OwnerID(), 543550 ) == true then
						if CheckFlag( OwnerID(), 543551 ) == true then
							if CheckFlag( OwnerID(), 543552 ) == true then
								if CheckFlag( OwnerID(), 543553 ) == true then
									if CheckFlag( OwnerID(), 543554 ) == true then
										if CheckFlag( OwnerID(), 543555 ) == false then
											SetFlag( OwnerID()  , 543555 , 1 )
										end
									else
										SetFlag( OwnerID()  , 543554 , 1 )
									end
								else
									SetFlag( OwnerID()  , 543553 , 1 )
								end
							else
								SetFlag( OwnerID()  , 543552 , 1 )
							end
						else
							SetFlag( OwnerID()  , 543551 , 1 )
						end
					else
						SetFlag( OwnerID()  , 543550 , 1 )
					end
				else
					SetFlag( OwnerID()  , 543549 , 1 )
				end
			end
			GiveBodyItem( OwnerID() , 206411 , 1 )
			CloseSpeak( OwnerID() )
		end
	else
		SetSpeakDetail (OwnerID(), "[SC_JPNEWYEAR_Q1_3]") --你今天已經抽過籤囉！
	end
end
----------------------------------------------------------------------------------------------------
function Lua_FN_JPNewYear_Q1_BuyItem()
	CloseSpeak( OwnerID() )
	OpenShop()
end
----------------------------------------------------------------------------------------------------
function LuaN_JPNewYearshop() -- 掛 物件產生劇情 --物品
	SetShop(OwnerID() , 600166 , "Test_Shop_Close" ); 
end
----------------------------------------------------------------------------------------------------
--使用206411後，執行隨機給籤的動作
function LuaI_FN_JPNewYear_206411( Option )
	local PlayerID = OwnerID()
	local PackageID = 206411
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		local RANDOM1 = rand(6)	--隨機給予大吉~大凶的籤
		local RANDOM2 = rand(5)
		if CheckBuff( PlayerID , 505416) == true or CheckBuff( PlayerID , 505415) == true or CheckBuff( PlayerID , 505414) == true or CheckBuff( PlayerID , 505413) == true or CheckBuff( PlayerID , 505412) == true or CheckBuff( PlayerID , 505411) == true then
			CancelBuff_NoEvent( PlayerID, 505416 )
			CancelBuff_NoEvent( PlayerID, 505415 )
			CancelBuff_NoEvent( PlayerID, 505414 )
			CancelBuff_NoEvent( PlayerID, 505413 )
			CancelBuff_NoEvent( PlayerID, 505412 )
			CancelBuff_NoEvent( PlayerID, 505411 )
		end

		if RANDOM1 == 0 then	--凶
			AddBuff( PlayerID ,505416 ,0 ,3600 )
			if RANDOM2 == 0 then
				GiveBodyItem( PlayerID , 206520 , 1 )
			end
			if RANDOM2 == 1 then
				GiveBodyItem( PlayerID , 206615 , 1 )
			end
			if RANDOM2 == 2 then
				GiveBodyItem( PlayerID , 206617 , 1 )
			end
			if RANDOM2 == 3 then
				GiveBodyItem( PlayerID , 206520 , 1 )
			end
			if RANDOM2 == 4 then
				GiveBodyItem( PlayerID , 206615 , 1 )
			end
		end
		if RANDOM1 == 1 then	--末吉
			AddBuff( PlayerID ,505415 ,0 ,3600 )
			if RANDOM2 == 0 then
				GiveBodyItem( PlayerID , 206519 , 1 )
			end
			if RANDOM2 == 1 then
				GiveBodyItem( PlayerID , 206612 , 1 )
			end
			if RANDOM2 == 2 then
				GiveBodyItem( PlayerID , 206613 , 1 )
			end
			if RANDOM2 == 3 then
				GiveBodyItem( PlayerID , 206614 , 1 )
			end
			if RANDOM2 == 4 then
				GiveBodyItem( PlayerID , 206614 , 1 )
			end
		end
		if RANDOM1 == 2 then	--吉
			AddBuff( PlayerID ,505414 ,0 ,3600 )
			if RANDOM2 == 0 then
				GiveBodyItem( PlayerID , 206518 , 1 )
			end
			if RANDOM2 == 1 then
				GiveBodyItem( PlayerID , 206610 , 1 )
			end
			if RANDOM2 == 2 then
				GiveBodyItem( PlayerID , 206611 , 1 )
			end
			if RANDOM2 == 3 then
				GiveBodyItem( PlayerID , 206616 , 1 )
			end
			if RANDOM2 == 4 then
				GiveBodyItem( PlayerID , 206616 , 1 )
			end
		end
		if RANDOM1 == 3 then	--小吉
			AddBuff( PlayerID ,505413 ,0 ,3600 )
			if RANDOM2 == 0 then
				GiveBodyItem( PlayerID , 206517 , 1 )
			end
			if RANDOM2 == 1 then
				GiveBodyItem( PlayerID , 206607 , 1 )
			end
			if RANDOM2 == 2 then
				GiveBodyItem( PlayerID , 206608 , 1 )
			end
			if RANDOM2 == 3 then
				GiveBodyItem( PlayerID , 206609 , 1 )
			end
			if RANDOM2 == 4 then
				GiveBodyItem( PlayerID , 206609 , 1 )
			end
		end
		if RANDOM1 == 4 then	--中吉
			AddBuff( PlayerID ,505412 ,0 ,3600 )
			if RANDOM2 == 0 then
				GiveBodyItem( PlayerID , 206516 , 1 )
			end
			if RANDOM2 == 1 then
				GiveBodyItem( PlayerID , 206603 , 1 )
			end
			if RANDOM2 == 2 then
				GiveBodyItem( PlayerID , 206604 , 1 )
			end
			if RANDOM2 == 3 then
				GiveBodyItem( PlayerID , 206605 , 1 )
			end
			if RANDOM2 == 4 then
				GiveBodyItem( PlayerID , 206606 , 1 )
			end
		end
		if RANDOM1 == 5 then	--大吉
			AddBuff( PlayerID ,505411 ,0 ,3600 )
			if RANDOM2 == 0 then
				GiveBodyItem( PlayerID , 206515 , 1 )
			end
			if RANDOM2 == 1 then
				GiveBodyItem( PlayerID , 206599 , 1 )
			end
			if RANDOM2 == 2 then
				GiveBodyItem( PlayerID , 206600 , 1 )
			end
			if RANDOM2 == 3 then
				GiveBodyItem( PlayerID , 206601 , 1 )
			end
			if RANDOM2 == 4 then
				GiveBodyItem( PlayerID , 206602 , 1 )
			end
		end
			
	end
end
----------------------------------------------------------------------------------------------------
--使用鹽
function LuaI_FN_JPNewYear_206522(Option)
	local PlayerID = OwnerID()
	if  (Option == "CHECK") then
		if CheckBuff( PlayerID , 505416) == true then
			return true
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_JPNEWYEAR_Q1_5]", 0 )
			return false
		end
	elseif (Option == "USE") then
		local RANDOM = rand(5)
		CancelBuff( PlayerID , 505416)
		if RANDOM == 0 then
			AddBuff( PlayerID ,505411 ,1 ,3600 )
		end
		if RANDOM == 1 then
			AddBuff( PlayerID ,505412 ,1 ,3600 )
		end
		if RANDOM == 2 then
			AddBuff( PlayerID ,505413 ,1 ,3600 )
		end
		if RANDOM == 3 then
			AddBuff( PlayerID ,505414 ,1 ,3600 )
		end
		if RANDOM == 4 then
			AddBuff( PlayerID ,505415 ,1 ,3600 )
		end
	end
end
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
--拜年活動
function Lua_FN_JPNewYear_Q2_1_1() --菈克依．瑟魁
	SetSpeakDetail( OwnerID(), "[SC_JPNEWYEAR_Q2_1_SPEAK]" ) 
	if CheckAcceptQuest( OwnerID(), 422860) == true and CheckFlag( OwnerID(), 543544) == false then
		AddSpeakOption( OwnerID(), TargetID(), "[SC_JPNEWYEAR_Q2]", "Lua_FN_JPNewYear_Q2_1_2", 0) --我代替菲特伊．瑟魁來跟您拜年
	end
end

function Lua_FN_JPNewYear_Q2_1_2()
	SetSpeakDetail( OwnerID(), "[SC_JPNEWYEAR_Q2_1]" )
	SetFlag( OwnerID()  , 543544 , 1 )
end
------------
function Lua_FN_JPNewYear_Q2_2_1() --蒂絲特尼．瑟魁
	SetSpeakDetail( OwnerID(), "[SC_JPNEWYEAR_Q2_2_SPEAK]" )
	if CheckAcceptQuest( OwnerID(), 422860) == true and CheckFlag( OwnerID(), 543545) == false then
		AddSpeakOption( OwnerID(), TargetID(), "[SC_JPNEWYEAR_Q2]", "Lua_FN_JPNewYear_Q2_2_2", 0) --我代替菲特伊．瑟魁來跟您拜年
	end
end

function Lua_FN_JPNewYear_Q2_2_2()
	SetSpeakDetail( OwnerID(), "[SC_JPNEWYEAR_Q2_2]" )
	SetFlag( OwnerID()  , 543545 , 1 )
end
------------
function Lua_FN_JPNewYear_Q2_3_1() --符瓊．瑟魁
	SetSpeakDetail( OwnerID(), "[SC_JPNEWYEAR_Q2_3_SPEAK]" )
	if CheckAcceptQuest( OwnerID(), 422860) == true and CheckFlag( OwnerID(), 543546) == false then
		AddSpeakOption( OwnerID(), TargetID(), "[SC_JPNEWYEAR_Q2]", "Lua_FN_JPNewYear_Q2_3_2", 0) --我代替菲特伊．瑟魁來跟您拜年
	end
end

function Lua_FN_JPNewYear_Q2_3_2()
	SetSpeakDetail( OwnerID(), "[SC_JPNEWYEAR_Q2_3]" )
	SetFlag( OwnerID()  , 543546 , 1 )
end
------------
function Lua_FN_JPNewYear_Q2_4_1() --蘿特莉．瑟魁
	SetSpeakDetail( OwnerID(), "[SC_JPNEWYEAR_Q2_4_SPEAK]" )
	if CheckAcceptQuest( OwnerID(), 422860) == true and CheckFlag( OwnerID(), 543547) == false then
		AddSpeakOption( OwnerID(), TargetID(), "[SC_JPNEWYEAR_Q2]", "Lua_FN_JPNewYear_Q2_4_2", 0) --我代替菲特伊．瑟魁來跟您拜年
	end
end

function Lua_FN_JPNewYear_Q2_4_2()
	SetSpeakDetail( OwnerID(), "[SC_JPNEWYEAR_Q2_4]" )
	SetFlag( OwnerID()  , 543547 , 1 )
end
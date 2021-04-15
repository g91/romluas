--稱號兌換npc
--update 2011.06.17 (4.0.1)
-------------------------------------------------------------------------
function LuaN_mika_titlegetnpc() --稱號兌換NPC
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_00]" )--想知道你現在能取得什麼稱號嗎？來看看以下的兌換條件吧！
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_01]", "LuaN_mika_titlegetnpc01", 0) --什麼是稱號？
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_02]", "LuaN_mika_titlegetnpc02", 0) --取得種植稱號  
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc01() --什麼是稱號？
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_011]" )--在冒險中，當<CP>完成特定任務</CP>或<CP>達成特定條件</CP>時就可取得<CN>稱號</CN>。(後略)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc", 0 ) --回到上一層
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02() --取得種植稱號
	local item1 = CountBodyItem(OwnerID(), 530109 ); -- 檢查是否有 植物的摯友
	local item2 = CountBodyItem(OwnerID(), 530110 ); -- 檢查是否有 百花之主
	local item3 = CountBodyItem(OwnerID(), 530118 ); -- 檢查是否有 綠意感受者
	local item4 = CountBodyItem(OwnerID(), 530119 ); -- 檢查是否有 綠意追求者

	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_012]" )--根據這本書上提到， (後略) 
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_13]", "LuaN_mika_titlegetnpc02_1", 0) --園藝系列
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_14]", "LuaN_mika_titlegetnpc02_2", 0) --植物好友系列
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_15]", "LuaN_mika_titlegetnpc02_3", 0) --指定系列
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_16]", "LuaN_mika_titlegetnpc02_4", 0) --園丁系列
	if item1 == 1 or item2 == 1 or item3 == 1 or item4 == 1 then
		AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_17]", "LuaN_mika_titlegetnpc02_5", 0) --綠意系列(二階)
	end
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc", 0 ) --回到上一層
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_1() --園藝系列
	local item1 = CountBodyItem(OwnerID(), 530104 ); -- 檢查是否有 園藝專家
	local item2 = CountBodyItem(OwnerID(), 530105 ); -- 檢查是否有 園藝國寶大師

	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_017]" )--請選擇你想兌換的稱號。
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_18]", "LuaN_mika_titlegetnpc02_18", 0) --關於「園藝初學者」
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_19]", "LuaN_mika_titlegetnpc02_19", 0) --關於「園藝進階者」
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_20]", "LuaN_mika_titlegetnpc02_20", 0) --關於「園藝精進者」(二階)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_21]", "LuaN_mika_titlegetnpc02_21", 0) --關於「園藝專家 」(二階)
	if item2 == 0 and item1 == 1 then
		AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_22]", "LuaN_mika_titlegetnpc02_22", 0) --關於「園藝國寶大師」 (三階 4.0.1)
	end
--	if item2 == 1 then
--		AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_23]", "LuaN_mika_titlegetnpc02_23", 0) --關於「園藝之神」  (未開放)
--	end

	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02", 0 ) --回到上一層
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_2() --植物好友系列
	local item1 = CountBodyItem(OwnerID(), 530109 ); -- 檢查是否有 植物的摯友

	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_017]" )--請選擇你想兌換的稱號。
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_24]", "LuaN_mika_titlegetnpc02_24", 0) --關於「與綠葉相遇」
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_25]", "LuaN_mika_titlegetnpc02_25", 0) --關於「花朵芳鄰」
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_26]", "LuaN_mika_titlegetnpc02_26", 0) --關於「植物的摯友」 (二階)

	if item1 == 1 then
		AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_27]", "LuaN_mika_titlegetnpc02_27", 0) --關於「百花之主」 (三階 4.0.1)
	end

	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02", 0 ) --回到上一層
end
--------------------------------------------
function LuaN_mika_titlegetnpc02_3() --指定系列
	local item1 = CountBodyItem(OwnerID(), 530112 ); -- 檢查是否有 你這朵花
	local item2 = CountBodyItem(OwnerID(), 530113 ); -- 檢查是否有 你這朵花

	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_017]" )--請選擇你想兌換的稱號。
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_28]", "LuaN_mika_titlegetnpc02_28", 0) --關於「你這根草」
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_29]", "LuaN_mika_titlegetnpc02_29", 0) --關於「你這朵花」

	if  item1 == 1 or item2 == 1 then --已有 你這朵花 稱號
		AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_30]", "LuaN_mika_titlegetnpc02_30", 0) --關於「你這棵木頭」 (二階)
	end

	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02", 0 ) --回到上一層
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_4() --園丁系列
	local item1 = CountBodyItem(OwnerID(), 530116 ); -- 檢查是否有 我是辛勤園丁
	local item2 = CountBodyItem(OwnerID(), 530117 ); -- 檢查是否有 我是辛勤園丁

	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_017]" )--請選擇你想兌換的稱號。
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_31]", "LuaN_mika_titlegetnpc02_31", 0) --關於「我是小園丁」
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_32]", "LuaN_mika_titlegetnpc02_32", 0) --關於「我是好園丁」
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_33]", "LuaN_mika_titlegetnpc02_33", 0) --關於「我是辛勤園丁」(二階)

	if  item1 == 1 or item2 == 1 then --已有 我是辛勤園丁稱號
		AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_34]", "LuaN_mika_titlegetnpc02_34", 0) --關於「我是園丁代表」(二階)
	end

	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02", 0 ) --回到上一層
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_5() --綠意系列
	local item1 = CountBodyItem(OwnerID(), 530109 ); -- 檢查是否有 植物的摯友
	local item2 = CountBodyItem(OwnerID(), 530110 ); -- 檢查是否有 百花之主
	local item3 = CountBodyItem(OwnerID(), 530118 ); -- 檢查是否有 綠意感受者
	local item4 = CountBodyItem(OwnerID(), 530119 ); -- 檢查是否有 綠意追求者

	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_017]" )--請選擇你想兌換的稱號。

	if ( item4 == 0 and item3 == 0 and item1 == 1 ) or ( item4 == 0 and item3 == 0 and item2 == 1 ) then
		AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_35]", "LuaN_mika_titlegetnpc02_35", 0) --關於「綠意感受者」 (二階)
	end
	if item4 == 0 and item3 == 1 then
		AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_36]", "LuaN_mika_titlegetnpc02_36", 0) --關於「綠意追求者」 (三階 4.0.1 )
	end
--	if item4 == 1 then
	--	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_37]", "LuaN_mika_titlegetnpc02_37", 0) --關於「綠意創造者」 (未開放)
--	end
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02", 0 ) --回到上一層
end

---園藝系列--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_18() -- 園藝初學者
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_18A]" )--說明內容(略)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_18c", 0) --取得稱號
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --回到上一層
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_19() --  園藝進階者
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_19A]" )--說明內容(略)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_19c", 0) --取得稱號
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --回到上一層
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_20() --  園藝精進者
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_20A]" )--說明內容(略)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_20c", 0) --取得稱號
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --回到上一層
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_21() --  園藝專家
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_21A]" )--說明內容(略)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_21c", 0) --取得稱號
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --回到上一層
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_22() --  園藝國寶大師
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_22A]" )--說明內容(略)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_22c", 0) --取得稱號
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --回到上一層
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_23() --  園藝之神
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_23A]" )--說明內容(略)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_23c", 0) --取得稱號
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --回到上一層
end

---植物好友系列--------------------------------------------------------------------------

function LuaN_mika_titlegetnpc02_24() --  與綠葉相遇
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_24A]" )--說明內容(略)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_24c", 0) --取得稱號
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --回到上一層
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_25() --  花朵芳鄰
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_25A]" )--說明內容(略)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_25c", 0) --取得稱號
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --回到上一層
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_26() --  植物的摯友
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_26A]" )--說明內容(略)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_26c", 0) --取得稱號
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --回到上一層
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_27() --  百花之主
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_27A]" )--說明內容(略)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_27c", 0) --取得稱號
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --回到上一層
end

---指定系列--------------------------------------------------------------------------

function LuaN_mika_titlegetnpc02_28() --  你這根草
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_28A]" )--說明內容(略)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_28c", 0) --取得稱號
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_3", 0 ) --回到上一層
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_29() --  你這朵花
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_29A]" )--說明內容(略)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_29c", 0) --取得稱號
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_3", 0 ) --回到上一層
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_30() --  你這棵木頭
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_30A]" )--說明內容(略)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_30c", 0) --取得稱號
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_3", 0 ) --回到上一層
end
---園藝系列--------------------------------------------------------------------------
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_31() --  我是小園丁
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_31A]" )--說明內容(略)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_31c", 0) --取得稱號
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --回到上一層
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_32() --  我是好園丁
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_32A]" )--說明內容(略)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_32c", 0) --取得稱號
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --回到上一層
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_33() --  我是辛勤園丁
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_33A]" )--說明內容(略)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_33c", 0) --取得稱號
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --回到上一層
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_34() --  我是園丁代表
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_34A]" )--說明內容(略)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_34c", 0) --取得稱號
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --回到上一層
end
---綠意系列--------------------------------------------------------------------------

function LuaN_mika_titlegetnpc02_35() --  綠意感受者
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_35A]" )--說明內容(略)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_35c", 0) --取得稱號
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_5", 0 ) --回到上一層
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_36() --  綠意追求者
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_36A]" )--說明內容(略)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_36c", 0) --取得稱號
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_5", 0 ) --回到上一層
end
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_37() --  綠意創造者
	SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_37A]" )--說明內容(略)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_QTITLENPC_016]", "LuaN_mika_titlegetnpc02_37c", 0) --取得稱號
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_5", 0 ) --回到上一層
end
--------------------------------------------
--稱號兌換

---園藝系列--------------------------------------------------------------
function LuaN_mika_titlegetnpc02_18c() --兌換稱號 園藝初學者
	local item1 = CountBodyItem(OwnerID(), 205084 ); -- 檢查是否有 綠葉露珠
	local item2 = CountBodyItem(OwnerID(), 205085 ); -- 檢查是否有 特殊果實
	local title1 = CountBodyItem(OwnerID(), 530101 ); -- 檢查是否有 稱號 園藝初學者
	local title2 = CountBodyItem(OwnerID(), 530102 ); -- 檢查是否有 稱號 園藝專家
	local title3 = CountBodyItem(OwnerID(), 530103 ); -- 檢查是否有 稱號 園藝專家
	local title4 = CountBodyItem(OwnerID(), 530104 ); -- 檢查是否有 稱號 園藝專家


	if title4 == 1 or title3 == 1 or title2 == 1 then --如果有同系列高階稱號
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--你已經兌換過此稱號。
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --回到上一層
	else
		if title1 == 1 then --如果已經有稱號 
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--你已經有這個稱號囉。
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --回到上一層
		else
			if item1 >= 10 then  --數量未定
				GiveBodyItem(OwnerID(), 530101 , 1 )  --給稱號
				DelBodyItem(OwnerID(), 205084 , 10 ) --扣物品 綠葉露珠 X10
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--恭喜你取得此稱號！
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --回到上一層
			else 
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--抱歉，你所持物品的數量還不夠喔，請繼續加油！
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --回到上一層
			end		
		end
	end
end 
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_19c() --兌換稱號 園藝進階者
	local item1 = CountBodyItem(OwnerID(), 205084 ); -- 檢查是否有 綠葉露珠
	local item2 = CountBodyItem(OwnerID(), 205085 ); -- 檢查是否有 特殊果實
	local title1 = CountBodyItem(OwnerID(), 530102 ); -- 檢查是否有 稱號 園藝進階者
	local title2 = CountBodyItem(OwnerID(), 530101 ); -- 檢查是否有 稱號 園藝初學者
	local title3 = CountBodyItem(OwnerID(), 530103 ); -- 檢查是否有 稱號 園藝專家
	local title4 = CountBodyItem(OwnerID(), 530104 ); -- 檢查是否有 稱號 園藝專家

	if title4 == 1 or title3 == 1  then --如果有同系列高階稱號
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--你已經兌換過此稱號。
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --回到上一層
	else
		if title1 == 1 then --如果已經有稱號 
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--你已經有這個稱號囉。
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --回到上一層
		else
			if title2 == 1 and item1 >= 20 then  --數量未定
				GiveBodyItem(OwnerID(), 530102 , 1 )  --給稱號
				DelBodyItem(OwnerID(), 205084 , 20 ) --扣物品 綠葉露珠 X20
				DelBodyItem(OwnerID(), 530101 , 1 ) --刪除稱號 園藝初學者
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--恭喜你取得此稱號！
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --回到上一層
			else 
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--抱歉，你所持物品的數量還不夠喔，請繼續加油！
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --回到上一層
			end		
		end
	end
end 
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_20c() --兌換稱號 園藝精進者
	local item2 = CountBodyItem(OwnerID(), 205085 ); -- 檢查是否有 特殊果實
	local title1 = CountBodyItem(OwnerID(), 530103 ); -- 檢查是否有 稱號 園藝精進者
	local title2 = CountBodyItem(OwnerID(), 530102 ); -- 檢查是否有 稱號 園藝進階者
	local title4 = CountBodyItem(OwnerID(), 530104 ); -- 檢查是否有 稱號 園藝專家

	if title4 == 1  then --如果有同系列高階稱號
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--你已經兌換過此稱號。
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --回到上一層
	else
		if title1 == 1 then --如果已經有稱號 
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--你已經有這個稱號囉。
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --回到上一層
		else
			if title2 == 1 and item2 >= 30 then  --數量未定
				GiveBodyItem(OwnerID(), 530103 , 1 )  --給稱號
				DelBodyItem(OwnerID(), 205085 , 30 ) --扣物品 特殊果實 X30
				DelBodyItem(OwnerID(), 530102 , 1 ) --刪除稱號 園藝初學者
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--恭喜你取得此稱號！
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --回到上一層
			else 
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--抱歉，你所持物品的數量還不夠喔，請繼續加油！
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --回到上一層
			end		
		end
	end
end 
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_21c() --兌換稱號 園藝專家
	local item2 = CountBodyItem(OwnerID(), 205085 ); -- 檢查是否有 特殊果實
	local title1 = CountBodyItem(OwnerID(), 530104 ); -- 檢查是否有 稱號 園藝專家
	local title2 = CountBodyItem(OwnerID(), 530103 ); -- 檢查是否有 稱號 園藝精進者

	if title1 == 1 then --如果已經有稱號 
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--你已經有這個稱號囉。
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --回到上一層
	else
		if title2 == 1 and item2 >=50 then  
			GiveBodyItem(OwnerID(), 530104 , 1 )  --給稱號
			DelBodyItem(OwnerID(), 205085 , 50 ) --扣物品 特殊果實 50
			DelBodyItem(OwnerID(), 530103, 1 ) --刪除稱號 園藝精進者
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--恭喜你取得此稱號！
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --回到上一層
		else 
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--抱歉，你所持物品的數量還不夠喔，請繼續加油！
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --回到上一層
		end		
	end
end 
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_22c() --兌換稱號 園藝國寶大師
	local item3 = CountBodyItem(OwnerID(), 205086 ); -- 檢查是否有 花果精華

	local title1 = CountBodyItem(OwnerID(), 530104 ); -- 檢查是否有 稱號 園藝專家
	local title2 = CountBodyItem(OwnerID(), 530105 ); -- 檢查是否有 稱號 園藝國寶大師

	if title2 == 1 then --如果已經有稱號 
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--你已經有這個稱號囉。
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --回到上一層
	else
		if title1 == 1 then 
			if item3 >=10 then  
				GiveBodyItem(OwnerID(), 530105 , 1 )  --給稱號 園藝國寶大師
				DelBodyItem(OwnerID(), 205086 , 10 ) --扣物品 花果菁華 x10
				DelBodyItem(OwnerID(), 530104, 1 ) --刪除稱號 園藝專家

				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--恭喜你取得此稱號！
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --回到上一層
			else 
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--抱歉，你所持物品的數量還不夠喔，請繼續加油！
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --回到上一層
			end
		else
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_018]" )--抱歉，你沒有換取稱號所需的稱號。
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --回到上一層
		end		
	end
end 

--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_23c() --兌換稱號 園藝之神
	local item3 = CountBodyItem(OwnerID(), 205086 ); -- 檢查是否有 花果精華

	local title1 = CountBodyItem(OwnerID(), 530105 ); -- 檢查是否有 稱號 園藝國寶大師
	local title2 = CountBodyItem(OwnerID(), 530106 ); -- 檢查是否有 稱號 園藝之神

	if title2 == 1 then --如果已經有稱號 
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--你已經有這個稱號囉。
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --回到上一層
	else
		if title1 == 1 then 
			if item3 >= 50 then  
				GiveBodyItem(OwnerID(), 530106 , 1 )  --給稱號 園藝之神
				DelBodyItem(OwnerID(), 205086 , 50 ) --扣物品 花果菁華 x50
				DelBodyItem(OwnerID(), 530105, 1 ) --刪除稱號 園藝國寶大師

				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--恭喜你取得此稱號！
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --回到上一層
			else 
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--抱歉，你所持物品的數量還不夠喔，請繼續加油！
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_1", 0 ) --回到上一層
			end
		else
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_018]" )--抱歉，你沒有換取稱號所需的稱號。
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --回到上一層
		end		
	end
end 

--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_24c() --兌換稱號 與綠葉相遇
	local item1 = CountBodyItem(OwnerID(), 205084 ); -- 檢查是否有 綠葉露珠
	local item2 = CountBodyItem(OwnerID(), 205085 ); -- 檢查是否有 特殊果實
	local title2_1 = CountBodyItem(OwnerID(), 530101 ); -- 檢查是否有 稱號 園藝系列
	local title2_2 = CountBodyItem(OwnerID(), 530102 ); -- 檢查是否有 稱號 
	local title2_3 = CountBodyItem(OwnerID(), 530103 ); -- 檢查是否有 稱號 
	local title2_4 = CountBodyItem(OwnerID(), 530104 ); -- 檢查是否有 稱號 
	local title2_5 = CountBodyItem(OwnerID(), 530105 ); -- 檢查是否有 稱號 
	local title2_6 = CountBodyItem(OwnerID(), 530106 ); -- 檢查是否有 稱號 
	local title1 = CountBodyItem(OwnerID(), 530107 ); -- 檢查是否有 稱號 與綠葉相遇
	local title2 = CountBodyItem(OwnerID(), 530108 ); -- 檢查是否有 稱號 花朵芳鄰
	local title3 = CountBodyItem(OwnerID(), 530109 ); -- 檢查是否有 稱號 植物的摯友

	if title3 == 1 or title2 == 1 then --如果有更高階的稱號 (表曾兌換過)
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--你已經兌換過此稱號囉。
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --回到上一層	
	else
		if title1 == 1 then --如果已經有稱號 
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--你已經有這個稱號囉。
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --回到上一層
		else
			if title2_1 == 1 or title2_2 == 1 or title2_3 == 1 or title2_4 == 1 or title2_5 == 1 or title2_6 == 1 then --如果有園藝系列任何稱號
				if item1 >= 5 and item2 >= 5 then  --
					GiveBodyItem(OwnerID(), 530107 , 1 )  --給稱號
					DelBodyItem(OwnerID(), 205084 , 5 ) --扣物品 綠葉露珠 X5
					DelBodyItem(OwnerID(), 205085 , 5 ) --扣物品 特殊果實 X5
					SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--恭喜你取得此稱號！
					AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --回到上一層
				else 
					SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--抱歉，你所持物品的數量還不夠喔，請繼續加油！
					AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --回到上一層
				end
			else
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_018]" )--抱歉，你沒有換取稱號所需的稱號。
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --回到上一層
			end		
		end
	end
end 
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_25c() --兌換稱號 花朵芳鄰
	local item1 = CountBodyItem(OwnerID(), 205084 ); -- 檢查是否有 綠葉露珠
	local item2 = CountBodyItem(OwnerID(), 205085 ); -- 檢查是否有 特殊果實
	local title1 = CountBodyItem(OwnerID(), 530108 ); -- 檢查是否有 稱號 花朵芳鄰
	local title2 = CountBodyItem(OwnerID(), 530107 ); -- 檢查是否有 稱號 與綠葉相遇
	local title3 = CountBodyItem(OwnerID(), 530109 ); -- 檢查是否有 稱號 植物的摯友

	if title3 == 1  then --如果有更高階的稱號 (表曾兌換過)
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--你已經兌換過此稱號囉。
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --回到上一層	
	else
		if title1 == 1 then --如果已經有稱號 
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--你已經有這個稱號囉。
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --回到上一層
		else
			if title2 == 1 and item1 >= 10 and item2 >= 5 then  --數量未定
				GiveBodyItem(OwnerID(), 530108 , 1 )  --給稱號
				DelBodyItem(OwnerID(), 205084 , 10 ) --扣物品 綠葉露珠 X10
				DelBodyItem(OwnerID(), 205085 , 5 ) --扣物品 特殊果實 X5
				DelBodyItem(OwnerID(), 530107 , 1 ) --刪 稱號 與綠葉相遇
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--恭喜你取得此稱號！
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --回到上一層
			else 
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--換稱號所需的物品不足喔，請繼續加油！
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --回到上一層
			end		
		end
	end
end 
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_26c() --兌換稱號  植物的摯友
	local item3 = CountBodyItem(OwnerID(), 205086 ); -- 檢查是否有 花果精華
	local item2 = CountBodyItem(OwnerID(), 205085 ); -- 檢查是否有 特殊果實
	local title1 = CountBodyItem(OwnerID(), 530109 ); -- 檢查是否有 稱號 植物的摯友
	local title2 = CountBodyItem(OwnerID(), 530108 ); -- 檢查是否有 稱號 花朵芳鄰

	if title1 == 1 then --如果已經有稱號 
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--你已經有這個稱號囉。
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --回到上一層
	else
		if title2 == 1 and item2 >= 30 and item3 >= 15 then  --數量未定
			GiveBodyItem(OwnerID(), 530109 , 1 )  --給稱號
			DelBodyItem(OwnerID(), 205085 , 30 ) --扣物品 特殊果實  X30
			DelBodyItem(OwnerID(), 205086 , 15 ) --扣物品 花果精華 X15
			DelBodyItem(OwnerID(), 530108 , 1 ) --刪 稱號 植物的摯友
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--恭喜你取得此稱號！
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --回到上一層
		else 
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--換稱號所需的物品不足喔，請繼續加油！
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --回到上一層
		end		
	end
end 
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_27c() --兌換稱號  百花之主
	local item3 = CountBodyItem(OwnerID(), 205086 ); -- 檢查是否有 花果精華
	local item2 = CountBodyItem(OwnerID(), 205085 ); -- 檢查是否有 特殊果實
	local title1 = CountBodyItem(OwnerID(), 530109 ); -- 檢查是否有 稱號 植物的摯友
	local title2 = CountBodyItem(OwnerID(), 530110 ); -- 檢查是否有 稱號 百花之主

	if title2 == 1 then --如果已經有稱號 
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--你已經有這個稱號囉。
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --回到上一層
	else
		if title1 == 1 then
			if  item2 >= 50 and item3 >= 30 then  
				GiveBodyItem(OwnerID(), 530110 , 1 )  --給稱號 百花之主
				DelBodyItem(OwnerID(), 205085 , 50 ) --扣物品 特殊果實  X50
				DelBodyItem(OwnerID(), 205086 , 30 ) --扣物品 花果精華 X30
				DelBodyItem(OwnerID(), 530109 , 1 ) --刪 稱號 植物的摯友
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--恭喜你取得此稱號！
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --回到上一層
			else 
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--換稱號所需的物品不足喔，請繼續加油！
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --回到上一層
			end		
		else	
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_018]" )--抱歉，你沒有換取稱號所需的稱號。
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_2", 0 ) --回到上一層
		end
	end
end 

--------------------------
function LuaN_mika_titlegetnpc02_28c() --兌換稱號 你這根草
	local item1 = CountBodyItem(OwnerID(), 205084 ); -- 檢查是否有 綠葉露珠
	local item2 = CountBodyItem(OwnerID(), 205085 ); -- 檢查是否有 特殊果實
	local title1 = CountBodyItem(OwnerID(), 530111 ); -- 檢查是否有 稱號
	local title2 = CountBodyItem(OwnerID(), 530112 ); -- 檢查是否有 稱號
	local title3 = CountBodyItem(OwnerID(), 530113 ); -- 檢查是否有 稱號

	if title3 == 1 or title2 == 1 then --如果有更高階的稱號 (表曾兌換過)
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--你已經兌換過此稱號囉。
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_3", 0 ) --回到上一層	
	else
		if title1 == 1 then --如果已經有稱號 
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--你已經有這個稱號囉。
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_3", 0 ) --回到上一層
		else
			if item1 >= 5 then  --數量未定
				GiveBodyItem(OwnerID(), 530111 , 1 )  --給稱號
				DelBodyItem(OwnerID(), 205084 , 5 ) --扣物品 綠葉露珠 X5
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--恭喜你取得此稱號！
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_3", 0 ) --回到上一層
			else 
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--換稱號所需的物品不足喔，請繼續加油！
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_3", 0 ) --回到上一層
			end		
		end
	end
end 
-----------------------------
function LuaN_mika_titlegetnpc02_29c() --兌換稱號 你這朵花
	local item1 = CountBodyItem(OwnerID(), 205084 ); -- 檢查是否有 綠葉露珠
	local item2 = CountBodyItem(OwnerID(), 205085 ); -- 檢查是否有 特殊果實
	local title1 = CountBodyItem(OwnerID(), 530112 ); -- 檢查是否有 稱號 你這朵花
	local title2 = CountBodyItem(OwnerID(), 530111 ); -- 檢查是否有 稱號 你這根草
	local title3 = CountBodyItem(OwnerID(), 530113 ); -- 檢查是否有 稱號

	if title3 == 1  then --如果有更高階的稱號 (表曾兌換過)
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--你已經兌換過此稱號囉。
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_3", 0 ) --回到上一層	
	else
		if title1 == 1 then --如果已經有稱號 
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--你已經有這個稱號囉。
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_3", 0 ) --回到上一層
		else
			if title2 == 1 and item1 >= 15 then  --數量未定
				GiveBodyItem(OwnerID(), 530112 , 1 )  --給稱號
				DelBodyItem(OwnerID(), 205084 , 15 ) --扣物品 綠葉露珠 X15
				DelBodyItem(OwnerID(), 530111 , 1 ) --刪稱號 你這根草
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--恭喜你取得此稱號！
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_3", 0 ) --回到上一層
			else 
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--換稱號所需的物品不足喔，請繼續加油！
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_3", 0 ) --回到上一層
			end		
		end
	end
end 
---------------------
function LuaN_mika_titlegetnpc02_30c() --兌換稱號 你這棵木頭
	local item1 = CountBodyItem(OwnerID(), 205084 ); -- 檢查是否有 綠葉露珠
	local title1 = CountBodyItem(OwnerID(), 530113 ); -- 檢查是否有 稱號 你這棵木頭
	local title2 = CountBodyItem(OwnerID(), 530112 ); -- 檢查是否有 稱號 你這朵花

	if title1 == 1 then --如果已經有稱號 
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--你已經有這個稱號囉。
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_3", 0 ) --回到上一層
	else
		if title2 == 1 and item1 >= 35 then  --數量未定
			GiveBodyItem(OwnerID(), 530113 , 1 )  --給稱號 你這棵木頭
			DelBodyItem(OwnerID(), 205084 , 35 ) --扣物品 綠葉露珠 X15
			DelBodyItem(OwnerID(), 530112 , 1 ) --刪稱號  你這朵花
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--恭喜你取得此稱號！
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_3", 0 ) --回到上一層
		else 
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--換稱號所需的物品不足喔，請繼續加油！
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_3", 0 ) --回到上一層
		end		
	end
end 
---------------------------------
function LuaN_mika_titlegetnpc02_31c() --兌換稱號 我是小園丁
	local item1 = CountBodyItem(OwnerID(), 205084 ); -- 檢查是否有 綠葉露珠
	local item2 = CountBodyItem(OwnerID(), 205085 ); -- 檢查是否有 特殊果實
	local title1 = CountBodyItem(OwnerID(), 530114 ); -- 檢查是否有 稱號 我是小園丁
	local title2 = CountBodyItem(OwnerID(), 530115 ); -- 檢查是否有 稱號 我是好園丁
	local title3 = CountBodyItem(OwnerID(), 530116 ); -- 檢查是否有 稱號 我是好園丁
	local title4 = CountBodyItem(OwnerID(), 530117 ); -- 檢查是否有 稱號 我是好園丁

	if title4 ==1 or title3 == 1 or title2 == 1 then --如果有更高階的稱號 (表曾兌換過)
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--你已經兌換過此稱號囉。
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --回到上一層	
	else
		if title1 == 1 then --如果已經有稱號 
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--你已經有這個稱號囉。
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --回到上一層
		else
			if item2 >= 6 then  --數量未定
				GiveBodyItem(OwnerID(), 530114 , 1 )  --給稱號
				DelBodyItem(OwnerID(), 205085 , 6 ) --扣物品 特殊果實 X 6
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--恭喜你取得此稱號！
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --回到上一層
			else 
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--換稱號所需的物品不足喔，請繼續加油！
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --回到上一層
			end		
		end
	end
end 
------------------
function LuaN_mika_titlegetnpc02_32c() --兌換稱號 我是好園丁
	local item1 = CountBodyItem(OwnerID(), 205084 ); -- 檢查是否有 綠葉露珠
	local item2 = CountBodyItem(OwnerID(), 205085 ); -- 檢查是否有 特殊果實
	local title1 = CountBodyItem(OwnerID(), 530115 ); -- 檢查是否有 稱號 我是好園丁
	local title2 = CountBodyItem(OwnerID(), 530114 ); -- 檢查是否有 稱號 我是小園丁
	local title3 = CountBodyItem(OwnerID(), 530116 ); -- 檢查是否有 稱號 我是辛勤園丁
	local title4 = CountBodyItem(OwnerID(), 530117 ); -- 檢查是否有 稱號 我是園丁代表

	if title4 == 1 or title3 == 1  then --如果有更高階的稱號 (表曾兌換過)
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--你已經兌換過此稱號囉。
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --回到上一層	
	else
		if title1 == 1 then --如果已經有稱號 
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--你已經有這個稱號囉。
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --回到上一層
		else
			if title2 == 1 and item2 >= 12 then  --數量未定
				GiveBodyItem(OwnerID(), 530115 , 1 )  --給稱號
				DelBodyItem(OwnerID(), 205085 , 12 ) --扣物品 特殊果實 X12
				DelBodyItem(OwnerID(), 530114 , 1 ) --刪稱號 我是小園丁
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--恭喜你取得此稱號！
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --回到上一層
			else 
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--換稱號所需的物品不足喔，請繼續加油！
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --回到上一層
			end		
		end
	end
end 
------------------
function LuaN_mika_titlegetnpc02_33c() --兌換稱號 我是辛勤園丁
	local item2 = CountBodyItem(OwnerID(), 205085 ); -- 檢查是否有 特殊果實
	local title1 = CountBodyItem(OwnerID(), 530116 ); -- 檢查是否有 稱號 我是辛勤園丁
	local title2 = CountBodyItem(OwnerID(), 530115 ); -- 檢查是否有 稱號 我是好園丁
	local title3 = CountBodyItem(OwnerID(), 530117 ); -- 檢查是否有 稱號 我是園丁代表

	if title3 == 1  then --如果有更高階的稱號 (表曾兌換過)
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--你已經兌換過此稱號囉。
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --回到上一層	
	else
		if title1 == 1 then --如果已經有稱號 
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--你已經有這個稱號囉。
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --回到上一層
		else
			if title2 == 1 and item2 >= 24 then  --數量未定
				GiveBodyItem(OwnerID(), 530116 , 1 )  --給稱號  我是辛勤園丁
				DelBodyItem(OwnerID(), 205085 , 24 ) --扣物品 特殊果實 X24
				DelBodyItem(OwnerID(), 530115, 1 ) --刪稱號  我是好園丁
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--恭喜你取得此稱號！
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --回到上一層
			else 
				SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--換稱號所需的物品不足喔，請繼續加油！
				AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --回到上一層
			end		
		end
	end
end 
----------------------------------
function LuaN_mika_titlegetnpc02_34c() --兌換稱號 我是園丁代表
	local item2 = CountBodyItem(OwnerID(), 205085 ); -- 檢查是否有 特殊果實 
	local title1 = CountBodyItem(OwnerID(), 530117 ); -- 檢查是否有 稱號 我是園丁代表
	local title2 = CountBodyItem(OwnerID(), 530116 ); -- 檢查是否有 稱號  我是辛勤園丁
	if title1 == 1 then --如果已經有稱號 
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--你已經有這個稱號囉。
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --回到上一層
	else
		if title2 == 1 and item2 >= 60 then  --數量未定
			GiveBodyItem(OwnerID(), 530117 , 1 )  --給稱號  我是園丁代表
			DelBodyItem(OwnerID(), 205085 , 60 ) --扣物品 特殊果實 X60
			DelBodyItem(OwnerID(), 530116, 1 ) --刪稱號  我是辛勤園丁
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--恭喜你取得此稱號！
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --回到上一層
		else 
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--換稱號所需的物品不足喔，請繼續加油！
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_4", 0 ) --回到上一層
		end		
	end
end 
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_35c() --兌換稱號 綠意感受者
	local item1 = CountBodyItem(OwnerID(), 205084); -- 檢查是否有 綠葉露珠
	local item2 = CountBodyItem(OwnerID(), 205085 ); -- 檢查是否有 特殊果實 
	local item3 = CountBodyItem(OwnerID(), 205086 ); -- 檢查是否有 花果精華
	local title1 = CountBodyItem(OwnerID(), 530118 ); -- 檢查是否有 稱號 綠意感受者
	local title2 = CountBodyItem(OwnerID(), 530109 ); -- 檢查是否有 稱號  植物的摯友
	local title3 = CountBodyItem(OwnerID(), 530110 ); -- 檢查是否有 稱號  百花之主
	if title1 == 1 then --如果已經有稱號 
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--你已經有這個稱號囉。
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_5", 0 ) --回到上一層
	else
		if title2 == 1 or  title3 == 1 then --如果有稱號
 				if item1 >= 20 and item2 >= 10 and item3 >= 5 then  --數量未定
					GiveBodyItem(OwnerID(), 530118 , 1 )  --給稱號  綠意感受者
					DelBodyItem(OwnerID(), 205084 , 20 ) --扣物品 綠葉露珠x20
					DelBodyItem(OwnerID(), 205085 , 10 ) --扣物品 特殊果實 X10
					DelBodyItem(OwnerID(), 205086 , 5 ) --扣物品  花果精華X5
					SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--恭喜你取得此稱號！
					AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_5", 0 ) --回到上一層
				else 
					SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--換稱號所需的物品不足喔，請繼續加油！
					AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_5", 0 ) --回到上一層
				end
		else	
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_018]" )--抱歉，你沒有換取稱號所需的稱號。
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_5", 0 ) --回到上一層
		end	
	end
end 
--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_36c() --兌換稱號 綠意感受者
	local item1 = CountBodyItem(OwnerID(), 205084); -- 檢查是否有 綠葉露珠
	local item2 = CountBodyItem(OwnerID(), 205085 ); -- 檢查是否有 特殊果實 
	local item3 = CountBodyItem(OwnerID(), 205086 ); -- 檢查是否有 花果精華

	local title1 = CountBodyItem(OwnerID(), 530118 ); -- 檢查是否有 稱號 綠意感受者
	local title2 = CountBodyItem(OwnerID(), 530119 ); -- 檢查是否有 稱號  綠意追求者

	if title2 == 1 then --如果已經有稱號 
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--你已經有這個稱號囉。
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_5", 0 ) --回到上一層
	else
		if title1 == 1 then -- 有上一個稱號
 				if item1 >= 50 and item2 >= 30 and item3 >= 10 then 
					GiveBodyItem(OwnerID(), 530119 , 1 )  --給稱號  綠意追求者
					DelBodyItem(OwnerID(), 530118 , 1 )  --刪稱號  綠意感受者
					DelBodyItem(OwnerID(), 205084 , 50 ) --扣物品 綠葉露珠x50
					DelBodyItem(OwnerID(), 205085 , 30 ) --扣物品 特殊果實 X50
					DelBodyItem(OwnerID(), 205086 , 10 ) --扣物品  花果精華X10
					SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--恭喜你取得此稱號！
					AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_5", 0 ) --回到上一層
				else 
					SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--換稱號所需的物品不足喔，請繼續加油！
					AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_5", 0 ) --回到上一層
				end
		else	
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_018]" )--抱歉，你沒有換取稱號所需的稱號。
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_5", 0 ) --回到上一層
		end	
	end
end 

--------------------------------------------------------------------------
function LuaN_mika_titlegetnpc02_37c() --兌換稱號 綠意創造者
	local item1 = CountBodyItem(OwnerID(), 205084); -- 檢查是否有 綠葉露珠
	local item2 = CountBodyItem(OwnerID(), 205085 ); -- 檢查是否有 特殊果實 
	local item3 = CountBodyItem(OwnerID(), 205086 ); -- 檢查是否有 花果精華

	local title1 = CountBodyItem(OwnerID(), 530119 ); -- 檢查是否有 稱號 綠意感受者
	local title2 = CountBodyItem(OwnerID(), 530120 ); -- 檢查是否有 稱號 綠意創造者

	if title2 == 1 then --如果已經有稱號 
		SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_013]" )--你已經有這個稱號囉。
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_5", 0 ) --回到上一層
	else
		if title1 == 1 then -- 有上一個稱號
 				if item1 >= 100 and item2 >= 50 and item3 >= 30 then 
					GiveBodyItem(OwnerID(), 530120 , 1 )  --給稱號  綠意創造者
					DelBodyItem(OwnerID(), 530119 , 1 )  --刪稱號  綠意感受者
					DelBodyItem(OwnerID(), 205084 , 100 ) --扣物品 綠葉露珠x100
					DelBodyItem(OwnerID(), 205085 , 50 ) --扣物品 特殊果實 X50
					DelBodyItem(OwnerID(), 205086 , 30 ) --扣物品  花果精華X30
					SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_014]" )--恭喜你取得此稱號！
					AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_5", 0 ) --回到上一層
				else 
					SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_015]" )--換稱號所需的物品不足喔，請繼續加油！
					AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_5", 0 ) --回到上一層
				end
		else	
			SetSpeakDetail(OwnerID(), "[SC_QTITLENPC_018]" )--抱歉，你沒有換取稱號所需的稱號。
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_titlegetnpc02_5", 0 ) --回到上一層
		end	
	end
end 

--------------------------------------------------------------------------
function LuaN_mika_titledelall_plant() -- 測試用指令 刪除全部種植稱號
	DelBodyItem(OwnerID(), 530101 , 1 ) 
	DelBodyItem(OwnerID(), 530102 , 1 ) 
	DelBodyItem(OwnerID(), 530103 , 1 ) 
	DelBodyItem(OwnerID(), 530104 , 1 ) 
	DelBodyItem(OwnerID(), 530105 , 1 ) 
	DelBodyItem(OwnerID(), 530106 , 1 ) 
	DelBodyItem(OwnerID(), 530107 , 1 ) 
	DelBodyItem(OwnerID(), 530108 , 1 ) 
	DelBodyItem(OwnerID(), 530109 , 1 ) 
	DelBodyItem(OwnerID(), 530110 , 1 ) 
	DelBodyItem(OwnerID(), 530111 , 1 ) 
	DelBodyItem(OwnerID(), 530112 , 1 ) 
	DelBodyItem(OwnerID(), 530113 , 1 ) 
	DelBodyItem(OwnerID(), 530114 , 1 ) 
	DelBodyItem(OwnerID(), 530115 , 1 ) 
	DelBodyItem(OwnerID(), 530116 , 1 ) 
	DelBodyItem(OwnerID(), 530117 , 1 ) 
	DelBodyItem(OwnerID(), 530118 , 1 ) 
	DelBodyItem(OwnerID(), 530119 , 1 ) 
	DelBodyItem(OwnerID(), 530120 , 1 ) 
	Say(OwnerID(),"title all clear") 
end
--------------------------------------------------------------------------
function LuaN_mika_titleitem_plant() -- 測試用指令 給種植稱號道具各100
	GiveBodyItem(OwnerID(), 205084 , 100 )  
	GiveBodyItem(OwnerID(), 205085 , 100 )  
	GiveBodyItem(OwnerID(), 205086 , 100 )  
--	Say(OwnerID(),"give all item 100") 
end
--------------------------------------------------------------------------
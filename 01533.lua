function Test_Mika_weddingCard_NPC1()
	local Player = OwnerID()
	local Count = {1, 5, 10 }

	SetSpeakDetail(Player, "[SC_2012MARRY_SHOPSNPC01]")   --一生只有一次的結婚典禮，親朋好友的祝福是不可或缺的，需要購買婚禮邀請函發送給好友嗎？
	AddSpeakOption(Player,Player,"[SC_2012MARRY_SHOPSNPC02][$SETVAR1="..Count[1].."]","test_Mika_weddingCard_NPC2("..Count[1]..")", 0)  -- 我要購買邀請函[$VAR1]張
	AddSpeakOption(Player,Player,"[SC_2012MARRY_SHOPSNPC02][$SETVAR1="..Count[2].."]","test_Mika_weddingCard_NPC2("..Count[2]..")", 0)  
	AddSpeakOption(Player,Player,"[SC_2012MARRY_SHOPSNPC02][$SETVAR1="..Count[3].."]","test_Mika_weddingCard_NPC2("..Count[3]..")", 0)  

end

function test_Mika_weddingCard_NPC2(count)
	local Player = OwnerID()
	local NPC = TargetID()
	local box = LuaFunc_SearchNPCbyOrgID( NPC , 121515, 200 , 0)       -- box 
	local limit =1501  -- 限制剩餘時間 25分鐘以上才可再購買 入場券是20分鐘 
--	local limit =300  -- 測試用時間
	local timer =ReadRoleValue(box, EM_RoleValue_Register+1 )  -- 目前剩餘時間

	local money = 5000
	local pay = count*money

	SetSpeakDetail(Player, "[SC_2012MARRY_SHOPSNPC03][$SETVAR1="..count.."][$SETVAR2="..pay.."]")   --你選擇購買邀請函[$VAR1]張，總共是[$VAR2]元，確定要購買嗎？
	AddSpeakOption( Player, Player, "[SC_GETTITLE_1]" , "test_Mika_weddingCard_NPC3("..pay..")", 0 )  -- 確定
end

function test_Mika_weddingCard_NPC3(pay)
	local Player = OwnerID()
	local NPC = TargetID()
	local box = LuaFunc_SearchNPCbyOrgID( NPC , 121515, 200 , 0)       -- box 
	local limit =1501  -- 限制剩餘時間 25分鐘以上才可再購買 入場券是20分鐘 
--	local limit =300  -- 測試用時間
	local timer =ReadRoleValue(box, EM_RoleValue_Register+1 )  -- 目前剩餘時間

	local money = 5000
	local count = pay/money  -- 個數
	local SN = ReadRoleValue(NPC, EM_RoleValue_PID )   --- 1 ~ 9 	say(box, "pid = "..pid )
	local itemid = 241977
	local NeedSpace = count  -- 需要背包空間數
	local NeedSpaceStatus  = Check_Bag_Space( Player , NeedSpace  )   -- 檢查格數是否夠 true = 夠 , false = 不夠

	CloseSpeak(Player)

	if NeedSpaceStatus == true then  -- 背包空間數量夠
		if ReadRoleValue( Player , EM_RoleValue_Money ) < pay then  -- 持有金額不足
			ScriptMessage( player, player, 1, "[SC_BUY_MONEY]" , 0 )	-- 你沒有足夠的金錢！
			ScriptMessage( player, player, 0, "[SC_BUY_MONEY]" , 0 )
		else
			Say(Player, "itemid ="..itemid.." , count = "..count.. ", pay = "..pay )
			AddRoleValue( Player , EM_RoleValue_Money , -(pay) ) 
			for i = 1 , count do -- 按照個數跑次數
				GiveBodyItem(Player, itemid, 1 )
			end
		end
	end
end

function mika_testmsg_0925()
	ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_22]".. "|r" , 0 ) --呦～唧唧唧唧～是[101272]！你居然解除了他的封印！雖然擊敗他能夠獲得非常稀有的飾品，但我勸你還是跑吧！
	ScriptMessage( OwnerID() , -1 , 0 , "|cffff00ff" .."[SC_111813_YU_22]".. "|r" , 0 ) --呦～唧唧唧唧～是[101272]！你居然解除了他的封印！雖然擊敗他能夠獲得非常稀有的飾品，但我勸你還是跑吧！
end

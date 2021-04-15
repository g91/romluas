function LuaYU_111353_0()

	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), GetString("YU_111353_DIALOG1") , "LuaYU_111353_1", 0 ) --神祕老人的過去
	AddSpeakOption( OwnerID(), TargetID( ), GetString("YU_111353_DIALOG6") , "LuaYU_111353_2", 0 ) --關於風車祕室
	AddSpeakOption( OwnerID(), TargetID( ), GetString("YU_111353_DIALOG10") , "LuaYU_111353_10", 0 ) --我要進去風車祕室
	AddSpeakOption( OwnerID(), TargetID( ), GetString("YU_111353_DIALOG5") , "LuaYU_RecipeList", 0 ) --關於生產配方



end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111353_1()
	SetSpeakDetail( OwnerID(), GetString("YU_111353_D1")   )--神祕老人的過去內文
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111353_0", 0 ) --回到上一頁
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111353_2()
	SetSpeakDetail( OwnerID(), GetString("YU_111353_D6")   )--關於風車祕室內文
	AddSpeakOption( OwnerID(), TargetID( ), GetString("YU_111353_DIALOG2") , "LuaYU_111353_3", 0 ) --關於風車祕室的魔物
	AddSpeakOption( OwnerID(), TargetID( ), GetString("YU_111353_DIALOG3") , "LuaYU_111353_4", 0 ) --如何取得稀有的特殊材料
	AddSpeakOption( OwnerID(), TargetID( ), GetString("YU_111353_DIALOG4") , "LuaYU_111353_5", 0 ) --關於祕魔石
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("YU_111353_DIALOG9") , "LuaYU_111353_9", 0 ) --關於魔拉酋卡
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111353_0", 0 ) --回到上一頁
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111353_3()
	SetSpeakDetail( OwnerID(), GetString("YU_111353_D2")   )--關於風車祕室的魔物
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111353_2", 0 ) --回到上一頁
end


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111353_4()
	SetSpeakDetail( OwnerID(), GetString("YU_111353_D3")   )--關於特殊材料
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111353_2", 0 ) --回到上一頁
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111353_5()
	SetSpeakDetail( OwnerID(), GetString("YU_111353_D4")   )--關於祕魔石
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111353_2", 0 ) --回到上一頁
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111353_9()
	SetSpeakDetail( OwnerID(), GetString("YU_111353_D9")   )--關於魔拉酋卡
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111353_2", 0 ) --回到上一頁
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111353_10()
	SetSpeakDetail( OwnerID(), GetString("YU_111353_D10")   )--我要進去風車祕室
	AddSpeakOption( OwnerID(), TargetID( ), GetString("YU_111353_DIALOG7") , "LuaYU_111353_7", 0 ) --兌換祕魔石
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111353_0", 0 ) --回到上一頁
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111353_7()
		if CountBodyItem( OwnerID() , 202982 ) >= 1 then
			SetSpeakDetail( OwnerID(), GetString("YU_111353_D13")   )--
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111353_10", 0 ) --回到上一頁


		elseif CountBodyItem( OwnerID() , 202980 ) >= 1 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then			
				DelBodyItem( OwnerID() , 202980 , 1 )
				GiveBodyItem( OwnerID() , 202982  , 1 )
				SetSpeakDetail( OwnerID(), GetString("YU_111353_D7")   )--
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111353_10", 0 ) --回到上一頁
			else
				SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG8")   )--您的背包空間不足，請清理一下再來吧。
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111353_10", 0 ) --回到上一頁
			end
		else
			SetSpeakDetail( OwnerID(), GetString("YU_111353_D12")   )--數量不足，不能兌換。
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111353_10", 0 ) --回到上一頁	
	end

end

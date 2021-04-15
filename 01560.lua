function Lua_apon_113597() ---魔龍NPC
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_01]" , "Lua_apon_113597_1_1", 0 ) --主文
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_02]" , "Lua_apon_113597_1_2", 0 ) --材料轉化說明簡介
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03]" , "Lua_apon_113597_1_3", 0 ) --進行材料轉化
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113596_00]" , "Lua_apon_113597_1_4", 0 ) --販售配方表
end

function Lua_apon_113597_1_1()
	SetSpeakDetail( OwnerID(), "[SC_113595_01_1]"   )--主文，魔龍的背景簡介，內容
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597", 0 ) --回到上一頁
end

function Lua_apon_113597_1_2()
	SetSpeakDetail( OwnerID(), "[SC_113595_02_1]"   )--材料轉化說明簡介，內容
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597", 0 ) --回到上一頁
end

function Lua_apon_113597_1_3()----所有魔龍相關轉化的物品在此列
	SetSpeakDetail( OwnerID(), "[SC_113595_03_1]"   )--我想進行材料轉化。
	
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113597_03]" , "Lua_apon_113597_1_3_6" , 0 ) ---盛燄龍血
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113597_04]" , "Lua_apon_113597_1_3_7" , 0 ) ---熾紅龍鱗
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113597_1_1]" , "Lua_apon_113597_1_3_8" , 0 ) ---尖銳的火龍利爪
	
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113597_1_3_1]" , "Lua_apon_113597_1_3_1" , 0 ) ---力量之源
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113597_1_3_2]" , "Lua_apon_113597_1_3_2" , 0 ) ---魔力之源
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113597_1_3_3]" , "Lua_apon_113597_1_3_3" , 0 ) ---迅捷之源
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113597_1_3_4]" , "Lua_apon_113597_1_3_4" , 0 ) ---精純龍血
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113597_1_3_5]" , "Lua_apon_113597_1_3_5" , 0 ) ---完美的龍鱗
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597", 0 ) --回到上一頁
end

-------力量之源------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113597_1_3_1() ---轉化所需材料內容
	SetSpeakDetail( OwnerID(), "[SC_113597_1_3_1_1]"   )--此次轉化的所需材料如下
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_7]" , "Lua_apon_113597_1_3_1_1" , 0 ) ---是的，我要進行轉化。
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
end

function Lua_apon_113597_1_3_1_1()
	local Money = ReadRoleValue(OwnerID() , EM_RoleValue_Money)
	if (Money < 50000) then
		SetSpeakDetail( OwnerID(), "[SC_113595_03_5]" )---你身上的金錢不夠支付這次的轉化費用
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
	else
		if CountBodyItem( OwnerID() , 206036 ) >= 10 and CountBodyItem( OwnerID() , 206028 ) >= 10 and CountBodyItem( OwnerID() , 206027 ) >= 2 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then	
				DelBodyItem( OwnerID() , 206036 , 10 )
				DelBodyItem( OwnerID() , 206028 , 10 )
				DelBodyItem( OwnerID() , 206027 , 2 )
				GiveBodyItem( OwnerID(), 206039, 1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Money   , Money - 50000 ) ---扣錢
				SetSpeakDetail( OwnerID(), "[SC_113595_03_3]" )---完成轉化
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
			else
				SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]")--您的背包空間不足，請清理一下再來吧。
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_113595_03_4]"   )--數量不足，不能兌換。
			AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
		end
	end
end
-------魔力之源------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113597_1_3_2() ---轉化所需材料內容
	SetSpeakDetail( OwnerID(), "[SC_113597_1_3_2_1]"   )--此次轉化的所需材料如下
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_7]" , "Lua_apon_113597_1_3_2_1" , 0 ) ---是的，我要進行轉化。
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
end

function Lua_apon_113597_1_3_2_1()
	local Money = ReadRoleValue(OwnerID() , EM_RoleValue_Money)
	if (Money < 50000) then
		SetSpeakDetail( OwnerID(), "[SC_113595_03_5]" )---你身上的金錢不夠支付這次的轉化費用
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
	else
		if CountBodyItem( OwnerID() , 206037 ) >= 10 and CountBodyItem( OwnerID() , 206031 ) >= 10 and CountBodyItem( OwnerID() , 205998 ) >= 2 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then	
				DelBodyItem( OwnerID() , 206037 , 10 )
				DelBodyItem( OwnerID() , 206031 , 10 )
				DelBodyItem( OwnerID() , 205998 , 2 )
				GiveBodyItem( OwnerID(), 206040, 1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Money   , Money - 50000 ) ---扣錢
				SetSpeakDetail( OwnerID(), "[SC_113595_03_3]" )---完成轉化
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
			else
				SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]")--您的背包空間不足，請清理一下再來吧。
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_113595_03_4]"   )--數量不足，不能兌換。
			AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
		end
	end
end
-------迅捷之源------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113597_1_3_3() ---轉化所需材料內容
	SetSpeakDetail( OwnerID(), "[SC_113597_1_3_3_1]"   )--此次轉化的所需材料如下
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_7]" , "Lua_apon_113597_1_3_3_1" , 0 ) ---是的，我要進行轉化。
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
end

function Lua_apon_113597_1_3_3_1()
	local Money = ReadRoleValue(OwnerID() , EM_RoleValue_Money)
	if (Money < 50000) then
		SetSpeakDetail( OwnerID(), "[SC_113595_03_5]" )---你身上的金錢不夠支付這次的轉化費用
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
	else
		if CountBodyItem( OwnerID() , 206038 ) >= 10 and CountBodyItem( OwnerID() , 206030 ) >= 10 and CountBodyItem( OwnerID() , 206026 ) >= 2 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then	
				DelBodyItem( OwnerID() , 206038 , 10 )
				DelBodyItem( OwnerID() , 206030 , 10 )
				DelBodyItem( OwnerID() , 206026 , 2 )
				GiveBodyItem( OwnerID(), 206041, 1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Money   , Money - 50000 ) ---扣錢
				SetSpeakDetail( OwnerID(), "[SC_113595_03_3]" )---完成轉化
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
			else
				SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]")--您的背包空間不足，請清理一下再來吧。
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_113595_03_4]"   )--數量不足，不能兌換。
			AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
		end
	end
end
-------精純龍血------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113597_1_3_4() ---轉化所需材料內容
	SetSpeakDetail( OwnerID(), "[SC_113597_1_3_4_1]"   )--此次轉化的所需材料如下
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_7]" , "Lua_apon_113597_1_3_4_1" , 0 ) ---是的，我要進行轉化。
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
end

function Lua_apon_113597_1_3_4_1()
	local Money = ReadRoleValue(OwnerID() , EM_RoleValue_Money)
	if (Money < 25000) then
		SetSpeakDetail( OwnerID(), "[SC_113595_03_5]" )---你身上的金錢不夠支付這次的轉化費用
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
	else
		if CountBodyItem( OwnerID() , 205998 ) >= 1 and CountBodyItem( OwnerID() , 205989 ) >= 6 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then	
				DelBodyItem( OwnerID() , 205998 , 1 )
				DelBodyItem( OwnerID() , 205989 , 6 )
				--DelBodyItem( OwnerID() , 206026 , 3 )
				GiveBodyItem( OwnerID(), 205979, 3 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Money   , Money - 25000 ) ---扣錢
				SetSpeakDetail( OwnerID(), "[SC_113595_03_3]" )---完成轉化
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
			else
				SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]")--您的背包空間不足，請清理一下再來吧。
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_113595_03_4]"   )--數量不足，不能兌換。
			AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
		end
	end
end
-------完美的龍鱗------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113597_1_3_5() ---轉化所需材料內容
	SetSpeakDetail( OwnerID(), "[SC_113597_1_3_5_1]"   )--此次轉化的所需材料如下
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_7]" , "Lua_apon_113597_1_3_5_1" , 0 ) ---是的，我要進行轉化。
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
end

function Lua_apon_113597_1_3_5_1()
	local Money = ReadRoleValue(OwnerID() , EM_RoleValue_Money)
	if (Money < 25000) then
		SetSpeakDetail( OwnerID(), "[SC_113595_03_5]" )---你身上的金錢不夠支付這次的轉化費用
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
	else
		if CountBodyItem( OwnerID() , 206026 ) >= 1 and CountBodyItem( OwnerID() , 205991 ) >= 6 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then	
				DelBodyItem( OwnerID() , 206026 , 1 )
				DelBodyItem( OwnerID() , 205991 , 6 )
				--DelBodyItem( OwnerID() , 206026 , 3 )
				GiveBodyItem( OwnerID(), 205981, 3 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Money   , Money - 25000 ) ---扣錢
				SetSpeakDetail( OwnerID(), "[SC_113595_03_3]" )---完成轉化
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
			else
				SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]")--您的背包空間不足，請清理一下再來吧。
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_113595_03_4]"   )--數量不足，不能兌換。
			AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
		end
	end
end

-------盛燄龍血------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113597_1_3_6() ---轉化所需材料內容
	SetSpeakDetail( OwnerID(), "[SC_113597_1_2]"   )--此次轉化的所需材料如下
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_7]" , "Lua_apon_113597_1_3_6_1" , 0 ) ---是的，我要進行轉化。
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
end

function Lua_apon_113597_1_3_6_1()
	local Money = ReadRoleValue(OwnerID() , EM_RoleValue_Money)
	if (Money < 30000) then
		SetSpeakDetail( OwnerID(), "[SC_113595_03_5]" )---你身上的金錢不夠支付這次的轉化費用
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
	else
		if CountBodyItem( OwnerID() , 206028 ) >= 9 and CountBodyItem( OwnerID() , 206031 ) >= 9 and CountBodyItem( OwnerID() , 206030 ) >= 9 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then	
				DelBodyItem( OwnerID() , 206028 , 9 )
				DelBodyItem( OwnerID() , 206031 , 9 )
				DelBodyItem( OwnerID() , 206030 , 9 )
				GiveBodyItem( OwnerID(), 205998, 1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Money   , Money - 30000 ) ---扣錢
				SetSpeakDetail( OwnerID(), "[SC_113595_03_3]" )---完成轉化
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
			else
				SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]")--您的背包空間不足，請清理一下再來吧。
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_113595_03_4]"   )--數量不足，不能兌換。
			AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
		end
	end
end


-------熾紅龍鱗------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113597_1_3_7() ---轉化所需材料內容
	SetSpeakDetail( OwnerID(), "[SC_113597_1_3]"   )--此次轉化的所需材料如下
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_7]" , "Lua_apon_113597_1_3_7_1" , 0 ) ---是的，我要進行轉化。
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
end

function Lua_apon_113597_1_3_7_1()
	local Money = ReadRoleValue(OwnerID() , EM_RoleValue_Money)
	if (Money < 30000) then
		SetSpeakDetail( OwnerID(), "[SC_113595_03_5]" )---你身上的金錢不夠支付這次的轉化費用
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
	else
		if CountBodyItem( OwnerID() , 206029 ) >= 9 and CountBodyItem( OwnerID() , 206031 ) >= 9 and CountBodyItem( OwnerID() , 206028 ) >= 9 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then	
				DelBodyItem( OwnerID() , 206029 , 9 )
				DelBodyItem( OwnerID() , 206031 , 9 )
				DelBodyItem( OwnerID() , 206028 , 9 )
				GiveBodyItem( OwnerID(), 206026, 1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Money   , Money - 30000 ) ---扣錢
				SetSpeakDetail( OwnerID(), "[SC_113595_03_3]" )---完成轉化
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
			else
				SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]")--您的背包空間不足，請清理一下再來吧。
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_113595_03_4]"   )--數量不足，不能兌換。
			AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
		end
	end
end


-------尖銳的火龍利爪------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113597_1_3_8() ---轉化所需材料內容
	SetSpeakDetail( OwnerID(), "[SC_113597_1_3_8]"   )--此次轉化的所需材料如下
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_7]" , "Lua_apon_113597_1_3_8_1" , 0 ) ---是的，我要進行轉化。
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
end

function Lua_apon_113597_1_3_8_1()
	local Money = ReadRoleValue(OwnerID() , EM_RoleValue_Money)
	if (Money < 30000) then
		SetSpeakDetail( OwnerID(), "[SC_113595_03_5]" )---你身上的金錢不夠支付這次的轉化費用
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
	else
		if CountBodyItem( OwnerID() , 206030 ) >= 9 and CountBodyItem( OwnerID() , 206029 ) >= 9 and CountBodyItem( OwnerID() , 206028 ) >= 9 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then	
				DelBodyItem( OwnerID() , 206030 , 9 )
				DelBodyItem( OwnerID() , 206029 , 9 )
				DelBodyItem( OwnerID() , 206028 , 9 )
				GiveBodyItem( OwnerID(), 206027, 1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Money   , Money - 30000 ) ---扣錢
				SetSpeakDetail( OwnerID(), "[SC_113595_03_3]" )---完成轉化
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
			else
				SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]")--您的背包空間不足，請清理一下再來吧。
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_113595_03_4]"   )--數量不足，不能兌換。
			AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_3", 0 ) --回到上一頁
		end
	end
end



-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function Lua_apon_113597_1_4() 

	SetSpeakDetail( OwnerID(), "[SC_113596_1]" )--關於生產配方
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113596_00]" , "Lua_apon_113597_1_4_00", 0 ) --配方的源由
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113597_1_4_01]" , "Lua_apon_113597_1_4_01", 0 ) --武器配方
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_113597_1_4_02]" , "Lua_apon_113597_1_4_02", 0 ) --飾品配方
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597", 0 ) --回到上一頁

end

function Lua_apon_113597_1_4_00()--武器NPC
	SetSpeakDetail( OwnerID(), "[SC_113596_00_1]"   )--主文
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113597_1_4", 0 ) --回到上一頁
end

function Lua_apon_113597_1_4_01()                                                                                               
	local GAHO0 = LuaFunc_SearchNPCbyOrgID(TargetID(), 113602, 200 , 1) 
	BeginPlot( GAHO0[0],  "Lua_apon_113597_1_4_01_1" , 0 )    
end

function Lua_apon_113597_1_4_01_1()
	BeginPlot( TargetID(), "Lua_apon_touch" , 0 )
	AddRecipe( OwnerID() , 551026)
	AddRecipe( OwnerID() , 551027)
	AddRecipe( OwnerID() , 551028)
	AddRecipe( OwnerID() , 551029)
	AddRecipe( OwnerID() , 551030)
	AddRecipe( OwnerID() , 551031)
	AddRecipe( OwnerID() , 551331)
end

function Lua_apon_113597_1_4_02()--飾品NPC                                                                                               
	local GAHO1 = LuaFunc_SearchNPCbyOrgID(TargetID(), 113603, 200 , 1) 
	BeginPlot( GAHO1[0],  "Lua_apon_113597_1_4_02_1" , 0 )    
end

function Lua_apon_113597_1_4_02_1()
	BeginPlot( TargetID(), "Lua_apon_touch" , 0 )
	AddRecipe( OwnerID() , 551332)
	AddRecipe( OwnerID() , 551333)
	AddRecipe( OwnerID() , 551334)
	AddRecipe( OwnerID() , 551335)
	AddRecipe( OwnerID() , 551336)
	AddRecipe( OwnerID() , 551337)
	AddRecipe( OwnerID() , 551338)
	AddRecipe( OwnerID() , 551339)
	AddRecipe( OwnerID() , 551340)
	AddRecipe( OwnerID() , 551341)
end













function Lua_apon_113595() ---水龍轉化用NPC
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_01]" , "Lua_apon_113595_1_1", 0 ) --主文，水龍的背景簡介
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_02]" , "Lua_apon_113595_1_2", 0 ) --材料轉化說明簡介
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03]" , "Lua_apon_113595_1_3", 0 ) --進行材料轉化
end

function Lua_apon_113595_1_1()
	SetSpeakDetail( OwnerID(), "[SC_113595_01_1]"   )--主文，水龍的背景簡介，內容
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595", 0 ) --回到上一頁
end

function Lua_apon_113595_1_2()
	SetSpeakDetail( OwnerID(), "[SC_113595_02_1]"   )--材料轉化說明簡介，內容
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595", 0 ) --回到上一頁
end

function Lua_apon_113595_1_3()----所有水龍相關轉化的物品在此列
	SetSpeakDetail( OwnerID(), "[SC_113595_03_1]"   )--我想進行材料轉化。
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_10]" , "Lua_apon_113595_1_3_01" , 0 ) ---精純龍血前表
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_11]" , "Lua_apon_113595_1_3_02" , 0 ) ---完美的龍鱗
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_12]" , "Lua_apon_113595_1_3_03" , 0 ) ---尖銳的水龍利爪
	--AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_10]" , "Lua_apon_113595_1_3_4" , 0 ) ---精純龍血
	--AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_11]" , "Lua_apon_113595_1_3_5" , 0 ) ---完美的龍鱗
	--AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_12]" , "Lua_apon_113595_1_3_6" , 0 ) ---尖銳的水龍利爪
	--AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_2]" , "Lua_apon_113595_1_3_1" , 0 ) ---精純龍血
	--AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_8]" , "Lua_apon_113595_1_3_2" , 0 ) ---完美的龍鱗
	--AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_9]" , "Lua_apon_113595_1_3_3" , 0 ) ---尖銳的水龍利爪
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_13]" , "Lua_apon_113595_1_3_7" , 0 ) ---熾紅龍鱗
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_14]" , "Lua_apon_113595_1_3_8" , 0 ) ---盛燄龍血
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595", 0 ) --回到上一頁
end

-------精純龍血前表------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113595_1_3_01() ---轉化所需材料內容
	SetSpeakDetail( OwnerID(), "[SC_113595_1_3_01]"   )--此次轉化的所需材料如下
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_1_3_02]" , "Lua_apon_113595_1_3_4" , 0 ) ---是的，我要進行轉化。
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_1_3_03]" , "Lua_apon_113595_1_3_1" , 0 ) ---是的，我要進行轉化。
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3", 0 ) --回到上一頁
end

-------完美的龍鱗前表------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113595_1_3_02() ---轉化所需材料內容
	SetSpeakDetail( OwnerID(), "[SC_113595_1_3_01]"   )--此次轉化的所需材料如下
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_1_3_02]" , "Lua_apon_113595_1_3_5" , 0 ) ---是的，我要進行轉化。
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_1_3_03]" , "Lua_apon_113595_1_3_2" , 0 ) ---是的，我要進行轉化。
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3", 0 ) --回到上一頁
end

-------尖銳的水龍利爪前表------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113595_1_3_03() ---轉化所需材料內容
	SetSpeakDetail( OwnerID(), "[SC_113595_1_3_01]"   )--此次轉化的所需材料如下
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_1_3_02]" , "Lua_apon_113595_1_3_6" , 0 ) ---是的，我要進行轉化。
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_1_3_03]" , "Lua_apon_113595_1_3_3" , 0 ) ---是的，我要進行轉化。
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3", 0 ) --回到上一頁
end

-------精純龍血------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113595_1_3_1() ---轉化所需材料內容
	SetSpeakDetail( OwnerID(), "[SC_113595_03_6]"   )--此次轉化的所需材料如下
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_7]" , "Lua_apon_113595_1_3_1_1" , 0 ) ---是的，我要進行轉化。
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_01", 0 ) --回到上一頁
end

function Lua_apon_113595_1_3_1_1()
	local Money = ReadRoleValue(OwnerID() , EM_RoleValue_Money)
	if (Money < 6000) then
		SetSpeakDetail( OwnerID(), "[SC_113595_03_5]" )---你身上的金錢不夠支付這次的轉化費用
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_01", 0 ) --回到上一頁
	else
		if CountBodyItem( OwnerID() , 205980 ) >= 3 and CountBodyItem( OwnerID() , 205987 ) >= 6 and CountBodyItem( OwnerID() , 205986 ) >= 6 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then	
				DelBodyItem( OwnerID() , 205980 , 3 )
				DelBodyItem( OwnerID() , 205987 , 6 )
				DelBodyItem( OwnerID() , 205986 , 6 )
				GiveBodyItem( OwnerID(), 205979, 1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Money   , Money - 6000 ) ---扣錢
				SetSpeakDetail( OwnerID(), "[SC_113595_03_3]" )---完成轉化
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_01", 0 ) --回到上一頁
			else
				SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]")--您的背包空間不足，請清理一下再來吧。
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_01", 0 ) --回到上一頁
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_113595_03_4]"   )--數量不足，不能兌換。
			AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_01", 0 ) --回到上一頁
		end
	end
end
------完美的龍鱗-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113595_1_3_2() ---轉化所需材料內容
	SetSpeakDetail( OwnerID(), "[SC_113595_1_3_2]"   )--此次轉化的所需材料如下
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_7]" , "Lua_apon_113595_1_3_2_1" , 0 ) ---是的，我要進行轉化。
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_02", 0 ) --回到上一頁
end

function Lua_apon_113595_1_3_2_1()
	local Money = ReadRoleValue(OwnerID() , EM_RoleValue_Money)
	if (Money < 6000) then
		SetSpeakDetail( OwnerID(), "[SC_113595_03_5]" )---你身上的金錢不夠支付這次的轉化費用
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_02", 0 ) --回到上一頁
	else
		if CountBodyItem( OwnerID() , 205982 ) >= 3 and CountBodyItem( OwnerID() , 205985 ) >= 6 and CountBodyItem( OwnerID() , 205987 ) >= 6 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then	
				DelBodyItem( OwnerID() , 205982 , 3 )
				DelBodyItem( OwnerID() , 205985 , 6 )
				DelBodyItem( OwnerID() , 205987 , 6 )
				GiveBodyItem( OwnerID(), 205981, 1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Money   , Money - 6000 ) ---扣錢
				SetSpeakDetail( OwnerID(), "[SC_113595_03_3]" )---完成轉化
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_02", 0 ) --回到上一頁
			else
				SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]")--您的背包空間不足，請清理一下再來吧。
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_02", 0 ) --回到上一頁
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_113595_03_4]"   )--數量不足，不能兌換。
			AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_02", 0 ) --回到上一頁
		end
	end
end
-------尖銳的水龍利爪------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113595_1_3_3() ---轉化所需材料內容
	SetSpeakDetail( OwnerID(), "[SC_113595_1_3_3]"   )--此次轉化的所需材料如下
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_7]" , "Lua_apon_113595_1_3_3_1" , 0 ) ---是的，我要進行轉化。
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_03", 0 ) --回到上一頁
end

function Lua_apon_113595_1_3_3_1()
	local Money = ReadRoleValue(OwnerID() , EM_RoleValue_Money)
	if (Money < 6000) then
		SetSpeakDetail( OwnerID(), "[SC_113595_03_5]" )---你身上的金錢不夠支付這次的轉化費用
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_03", 0 ) --回到上一頁
	else
		if CountBodyItem( OwnerID() , 205984 ) >= 3 and CountBodyItem( OwnerID() , 205986 ) >= 6 and CountBodyItem( OwnerID() , 205985 ) >= 6 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then	
				DelBodyItem( OwnerID() , 205984 , 3 )
				DelBodyItem( OwnerID() , 205986 , 6 )
				DelBodyItem( OwnerID() , 205985 , 6 )
				GiveBodyItem( OwnerID(), 205983, 1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Money   , Money - 6000 ) ---扣錢
				SetSpeakDetail( OwnerID(), "[SC_113595_03_3]" )---完成轉化
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_03", 0 ) --回到上一頁
			else
				SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]")--您的背包空間不足，請清理一下再來吧。
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_03", 0 ) --回到上一頁
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_113595_03_4]"   )--數量不足，不能兌換。
			AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_03", 0 ) --回到上一頁
		end
	end
end
-------精純龍血 - 2 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113595_1_3_4() ---轉化所需材料內容
	SetSpeakDetail( OwnerID(), "[SC_113595_1_3_4]"   )--此次轉化的所需材料如下
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_7]" , "Lua_apon_113595_1_3_4_1" , 0 ) ---是的，我要進行轉化。
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_01", 0 ) --回到上一頁
end

function Lua_apon_113595_1_3_4_1()
	local Money = ReadRoleValue(OwnerID() , EM_RoleValue_Money)
	if (Money < 6000) then
		SetSpeakDetail( OwnerID(), "[SC_113595_03_5]" )---你身上的金錢不夠支付這次的轉化費用
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_01", 0 ) --回到上一頁
	else
		if CountBodyItem( OwnerID() , 205980 ) >= 6 and CountBodyItem( OwnerID() , 205989 ) >= 30 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then	
				DelBodyItem( OwnerID() , 205980 , 3 )
				DelBodyItem( OwnerID() , 205989 , 30 )
				--DelBodyItem( OwnerID() , 205989 , 3 )
				GiveBodyItem( OwnerID(), 205979, 1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Money   , Money - 6000 ) ---扣錢
				SetSpeakDetail( OwnerID(), "[SC_113595_03_3]" )---完成轉化
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_01", 0 ) --回到上一頁
			else
				SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]")--您的背包空間不足，請清理一下再來吧。
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_01", 0 ) --回到上一頁
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_113595_03_4]"   )--數量不足，不能兌換。
			AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_01", 0 ) --回到上一頁
		end
	end
end
-------完美的龍鱗 - 2 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113595_1_3_5() ---轉化所需材料內容
	SetSpeakDetail( OwnerID(), "[SC_113595_1_3_5]"   )--此次轉化的所需材料如下
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_7]" , "Lua_apon_113595_1_3_5_1" , 0 ) ---是的，我要進行轉化。
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_02", 0 ) --回到上一頁
end

function Lua_apon_113595_1_3_5_1()
	local Money = ReadRoleValue(OwnerID() , EM_RoleValue_Money)
	if (Money < 6000) then
		SetSpeakDetail( OwnerID(), "[SC_113595_03_5]" )---你身上的金錢不夠支付這次的轉化費用
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_02", 0 ) --回到上一頁
	else
		if CountBodyItem( OwnerID() , 205982 ) >= 6 and CountBodyItem( OwnerID() , 205991 ) >= 30 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then	
				DelBodyItem( OwnerID() , 205982 , 6 )
				DelBodyItem( OwnerID() , 205991 , 30 )
				--DelBodyItem( OwnerID() , 205990 , 3 )
				GiveBodyItem( OwnerID(), 205981, 1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Money   , Money - 6000 ) ---扣錢
				SetSpeakDetail( OwnerID(), "[SC_113595_03_3]" )---完成轉化
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_02", 0 ) --回到上一頁
			else
				SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]")--您的背包空間不足，請清理一下再來吧。
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_02", 0 ) --回到上一頁
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_113595_03_4]"   )--數量不足，不能兌換。
			AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_02", 0 ) --回到上一頁
		end
	end
end
-------尖銳的水龍利爪 -2 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113595_1_3_6() ---轉化所需材料內容
	SetSpeakDetail( OwnerID(), "[SC_113595_1_3_6]"   )--此次轉化的所需材料如下
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_7]" , "Lua_apon_113595_1_3_6_1" , 0 ) ---是的，我要進行轉化。
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_03", 0 ) --回到上一頁
end

function Lua_apon_113595_1_3_6_1()
	local Money = ReadRoleValue(OwnerID() , EM_RoleValue_Money)
	if (Money < 6000) then
		SetSpeakDetail( OwnerID(), "[SC_113595_03_5]" )---你身上的金錢不夠支付這次的轉化費用
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_03", 0 ) --回到上一頁
	else
		if CountBodyItem( OwnerID() , 205984 ) >= 6 and CountBodyItem( OwnerID() , 205990 ) >= 30 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then	
				DelBodyItem( OwnerID() , 205984 , 6 )
				DelBodyItem( OwnerID() , 205990 , 30 )
				--DelBodyItem( OwnerID() , 205991 , 3 )
				GiveBodyItem( OwnerID(), 205983, 1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Money   , Money - 6000 ) ---扣錢
				SetSpeakDetail( OwnerID(), "[SC_113595_03_3]" )---完成轉化
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_03", 0 ) --回到上一頁
			else
				SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]")--您的背包空間不足，請清理一下再來吧。
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_03", 0 ) --回到上一頁
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_113595_03_4]"   )--數量不足，不能兌換。
			AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3_03", 0 ) --回到上一頁
		end
	end
end
-------熾紅龍鱗------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113595_1_3_7() ---轉化所需材料內容
	SetSpeakDetail( OwnerID(), "[SC_113595_1_3_7]"   )--此次轉化的所需材料如下
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_7]" , "Lua_apon_113595_1_3_7_1" , 0 ) ---是的，我要進行轉化。
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3", 0 ) --回到上一頁
end

function Lua_apon_113595_1_3_7_1()
	local Money = ReadRoleValue(OwnerID() , EM_RoleValue_Money)
	if (Money < 25000) then
		SetSpeakDetail( OwnerID(), "[SC_113595_03_5]" )---你身上的金錢不夠支付這次的轉化費用
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3", 0 ) --回到上一頁
	else
		if CountBodyItem( OwnerID() , 205981 ) >= 6 and CountBodyItem( OwnerID() , 206031 ) >= 6 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then	
				DelBodyItem( OwnerID() , 205981 , 6 )
				DelBodyItem( OwnerID() , 206031 , 6 )
				--DelBodyItem( OwnerID() , 205991 , 3 )
				GiveBodyItem( OwnerID(), 206026, 1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Money   , Money - 25000 ) ---扣錢
				SetSpeakDetail( OwnerID(), "[SC_113595_03_3]" )---完成轉化
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3", 0 ) --回到上一頁
			else
				SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]")--您的背包空間不足，請清理一下再來吧。
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3", 0 ) --回到上一頁
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_113595_03_4]"   )--數量不足，不能兌換。
			AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3", 0 ) --回到上一頁
		end
	end
end
-------盛燄龍血------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_113595_1_3_8() ---轉化所需材料內容
	SetSpeakDetail( OwnerID(), "[SC_113595_1_3_8]"   )--此次轉化的所需材料如下
	AddSpeakOption( OwnerID(), TargetID(), "[SC_113595_03_7]" , "Lua_apon_113595_1_3_8_1" , 0 ) ---是的，我要進行轉化。
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3", 0 ) --回到上一頁
end

function Lua_apon_113595_1_3_8_1()
	local Money = ReadRoleValue(OwnerID() , EM_RoleValue_Money)
	if (Money < 25000) then
		SetSpeakDetail( OwnerID(), "[SC_113595_03_5]" )---你身上的金錢不夠支付這次的轉化費用
		AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3", 0 ) --回到上一頁
	else
		if CountBodyItem( OwnerID() , 205979 ) >= 6 and CountBodyItem( OwnerID() , 206031 ) >= 3 and CountBodyItem( OwnerID() , 206030 ) >= 3 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then	
				DelBodyItem( OwnerID() , 205979 , 6 )
				DelBodyItem( OwnerID() , 206031 , 3 )
				DelBodyItem( OwnerID() , 206030 , 3 )
				GiveBodyItem( OwnerID(), 205998, 1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Money   , Money - 25000 ) ---扣錢
				SetSpeakDetail( OwnerID(), "[SC_113595_03_3]" )---完成轉化
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3", 0 ) --回到上一頁
			else
				SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]")--您的背包空間不足，請清理一下再來吧。
				AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3", 0 ) --回到上一頁
			end
		else
			SetSpeakDetail( OwnerID(), "[SC_113595_03_4]"   )--數量不足，不能兌換。
			AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "Lua_apon_113595_1_3", 0 ) --回到上一頁
		end
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
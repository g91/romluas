function LuaYU_tonytony_0()

	local Oil =  CountBodyItem( OwnerID() , 203466 )  --滑溜溜的豬油
	local Oil2 =  CountBodyItem( OwnerID() , 203475 )  --特調豬油溶液

	local Gola =  CountBodyItem( OwnerID() , 530368 ) --有該稱號

	local Save01 =  CheckFlag( OwnerID()  , 542163 ) --稱號任務
	local Save02 =  CheckFlag( OwnerID()  , 542164 )
	local Save03 =  CheckFlag( OwnerID()  , 542165 )
	local Save04 =  CheckFlag( OwnerID()  , 542166 )
	local Save05 =  CheckFlag( OwnerID()  , 542167 )
	local Save06 =  CheckFlag( OwnerID()  , 542168 )
	local Save07 =  CheckFlag( OwnerID()  , 542169 )
	local Save08 =  CheckFlag( OwnerID()  , 542170 )
	local Save09 =  CheckFlag( OwnerID()  , 542171 )
	local Save10 =  CheckFlag( OwnerID()  , 542172 )


	local daySave01 =  CheckFlag( OwnerID()  , 542232 ) --每日重置
	local daySave02 =  CheckFlag( OwnerID()  , 542233 )
	local daySave03 =  CheckFlag( OwnerID()  , 542234 )
	local daySave04 =  CheckFlag( OwnerID()  , 542235 )
	local daySave05 =  CheckFlag( OwnerID()  , 542236 )
	local daySave06 =  CheckFlag( OwnerID()  , 542237 )
	local daySave07 =  CheckFlag( OwnerID()  , 542238 )
	local daySave08 =  CheckFlag( OwnerID()  , 542239 )
	local daySave09 =  CheckFlag( OwnerID()  , 542240 )
	local daySave10 =  CheckFlag( OwnerID()  , 542241 )

	local Oilsearch =  CheckFlag( OwnerID()  , 542243 ) --玩家願意收集油
	local SelfSave =  CheckFlag( OwnerID()  , 542242 ) --讓喬巴自己救

	local ZoneID = math.mod( ReadRoleValue(OwnerID() ,EM_RoleValue_ZoneID ), 1000);

	local Xcount =  4
	local Ycount =  3
	local Zcount =  3

	if daySave01 == true then
		Xcount = Xcount -1
	end

	if daySave02 == true then
		Xcount = Xcount -1
	end

	if daySave03 == true then
		Xcount = Xcount -1
	end

	if daySave04 == true then
		Xcount = Xcount -1
	end

	if daySave05 == true then
		Zcount = Zcount -1
	end

	if daySave06 == true then
		Zcount = Zcount -1
	end

	if daySave07 == true then
		Zcount = Zcount -1
	end

	if daySave08 == true then
		Ycount = Ycount -1
	end

	if daySave09 == true then
		Ycount = Ycount -1
	end

	if daySave10 == true then
		Ycount = Ycount -1
	end


		if Gola == 1 and  Save01 == true and Save02 == true and Save03 == true and Save04 == true and Save05 == true and Save06 == true and Save07 == true and Save08 == true and Save09 == true and Save10 == true then

			SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_00")   )  --你太厲害了！必爾汀叔叔們全部再次順利獲救了呢！看到你奇蹟似的表現，我也相信你會飛！
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_01") , "LuaYU_tonytony_1", 0 ) --接受表揚

		elseif  Save01 == true and Save02 == true and Save03 == true and Save04 == true and Save05 == true and Save06 == true and Save07 == true and Save08 == true and Save09 == true and Save10 == true then

			SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_02")   )  --你太厲害了！必爾汀叔叔們全部都順利獲救了呢！看到你奇蹟似的表現，難道...你真的會飛！？
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_01") , "LuaYU_tonytony_2", 0 ) --接受表揚

		elseif  Gola == 1  and  daySave01 == true and daySave02 == true and daySave03 == true and daySave04 == true and daySave05 == true and daySave06 == true and daySave07 == true and daySave08 == true and daySave09 == true and daySave10 == true then

			SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_03")   )  --謝謝你喔！必爾汀叔叔說他要開始減肥了，不然明年再卡在煙囪禮物送不完小朋友會失望的呢！
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_32") , "LuaYU_tonytony_11", 0 ) --前往羅格鎮
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_33") , "LuaYU_tonytony_12", 0 ) --前往銀瀑村
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_37") , "LuaYU_tonytony_14", 0 ) --前往哈沃夫交易站
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_34") , "LuaYU_tonytony_13", 0 ) --回中央廣場
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_OKAY") , "LuaYU_tonytony_6", 0 ) --確定(關閉對話)

		elseif Oilsearch == false and Oil >= 0 and  SelfSave == false and daySave01 == false and daySave02 == false and daySave03 == false and daySave04 == false and daySave05 == false and daySave06 == false and daySave07 == false and daySave08 == false and daySave09 == false and daySave10 == false then

			SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_04")   )  --嗚...可以請你幫個忙嗎...今年冬天太冷了...必爾汀叔叔們多穿了兩件外套...結果爬煙囪送禮物的時候...就...就卡在上面下不來了啦！嗚...他們現在很難過你不要笑嘛～幫幫忙～好嗎？
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_05") , "LuaYU_tonytony_3", 0 ) --包在我身上

		elseif Oilsearch == true and Oil == 0 and Oil2 == 0 and  SelfSave == false  then

			SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_13")   )  --我想可能需要一些潤滑油才能讓必爾汀叔叔滑下來...要去哪裡找油呀！？油...油...啊！豬油！可以請你從[100061]身上取一些[203466]來嗎！我想所有的豬應該都有吧！10份，10份應該就可以了！
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_05") , "LuaYU_tonytony_6", 0 ) --包在我身上(關閉對話)

		elseif Oilsearch == true and Oil < 10 and Oil > 0 and Oil2 == 0 and  SelfSave == false  then

			SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_06")   )  --哇！你拿到豬油了！但是數量好像不太夠耶...
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_OKAY") , "LuaYU_tonytony_6", 0 ) --確定(關閉對話)


		elseif Oilsearch == true and Oil >= 10 and SelfSave == false then

			if Xcount == 0 then
				SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_07") .. GetString("SC_111584_YU_14_1") .. GetString("SC_111584_YU_14_2") .. "|cffff00ff" .. Xcount .. "|r" .. GetString("SC_111584_YU_14_3") .. "|cffff00ff" .. Ycount .. "|r" .. GetString("SC_111584_YU_14_4") .. "|cffff00ff" .. Zcount .. "|r" ..  GetString("SC_111584_YU_14_5")  )  --哇！你拿到豬油了耶！太好了！得快點把必爾汀叔叔救下來才行！報告人數
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_08") , "LuaYU_tonytony_4", 0 ) --自願前往救援
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_09") , "LuaYU_tonytony_5", 0 ) --直接交付豬油
			elseif Ycount == 0 then
				SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_07") .. GetString("SC_111584_YU_14_1") .. GetString("SC_111584_YU_14_2") .. "|cffff00ff" .. Xcount .. "|r" .. GetString("SC_111584_YU_14_3") .. "|cffff00ff" .. Ycount .. "|r" .. GetString("SC_111584_YU_14_4") .. "|cffff00ff" .. Zcount .. "|r" ..  GetString("SC_111584_YU_14_5")  )  --哇！你拿到豬油了耶！太好了！得快點把必爾汀叔叔救下來才行！報告人數
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_08") , "LuaYU_tonytony_4", 0 ) --自願前往救援
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_09") , "LuaYU_tonytony_5", 0 ) --直接交付豬油

			elseif Zcount == 0 then
				SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_07") .. GetString("SC_111584_YU_14_1") .. GetString("SC_111584_YU_14_2") .. "|cffff00ff" .. Xcount .. "|r" .. GetString("SC_111584_YU_14_3") .. "|cffff00ff" .. Ycount .. "|r" .. GetString("SC_111584_YU_14_4") .. "|cffff00ff" .. Zcount .. "|r" ..  GetString("SC_111584_YU_14_5")  )  --哇！你拿到豬油了耶！太好了！得快點把必爾汀叔叔救下來才行！報告人數
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_08") , "LuaYU_tonytony_4", 0 ) --自願前往救援
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_09") , "LuaYU_tonytony_5", 0 ) --直接交付豬油
			else
				SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_07") .. GetString("SC_111584_YU_14_1") .. GetString("SC_111584_YU_14_2") .. "|cffff00ff" .. Xcount .. "|r" .. GetString("SC_111584_YU_14_3") .. "|cffff00ff" .. Ycount .. "|r" .. GetString("SC_111584_YU_14_4") .. "|cffff00ff" .. Zcount .. "|r" ..  GetString("SC_111584_YU_14_5")  )  --哇！你拿到豬油了耶！太好了！得快點把必爾汀叔叔救下來才行！報告人數
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_08") , "LuaYU_tonytony_4", 0 ) --自願前往救援
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_09") , "LuaYU_tonytony_5", 0 ) --直接交付豬油
			end

		elseif Oil2 >= 1 and SelfSave == false then

			if Xcount == 0 then
				SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_14_1") .. GetString("SC_111584_YU_14_2") .. "|cffff00ff" .. Xcount .. "|r" .. GetString("SC_111584_YU_14_3") .. "|cffff00ff" .. Ycount .. "|r" .. GetString("SC_111584_YU_14_4") .. "|cffff00ff" .. Zcount .. "|r" ..  GetString("SC_111584_YU_14_5")  )  --哇！你拿到豬油了耶！太好了！得快點把必爾汀叔叔救下來才行！報告人數
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_OKAY") , "LuaYU_tonytony_6", 0 ) --確定(關閉對話)
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_35") , "LuaYU_tonytony_10", 0 ) --希望前往別處救援
			elseif Ycount == 0 then
				SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_14_1") .. GetString("SC_111584_YU_14_2") .. "|cffff00ff" .. Xcount .. "|r" .. GetString("SC_111584_YU_14_3") .. "|cffff00ff" .. Ycount .. "|r" .. GetString("SC_111584_YU_14_4") .. "|cffff00ff" .. Zcount .. "|r" ..  GetString("SC_111584_YU_14_5")  )  --哇！你拿到豬油了耶！太好了！得快點把必爾汀叔叔救下來才行！報告人數
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_OKAY") , "LuaYU_tonytony_6", 0 ) --確定(關閉對話)
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_35") , "LuaYU_tonytony_10", 0 ) --希望前往別處救援
			elseif Zcount == 0 then
				SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_14_1") .. GetString("SC_111584_YU_14_2") .. "|cffff00ff" .. Xcount .. "|r" .. GetString("SC_111584_YU_14_3") .. "|cffff00ff" .. Ycount .. "|r" .. GetString("SC_111584_YU_14_4") .. "|cffff00ff" .. Zcount .. "|r" ..  GetString("SC_111584_YU_14_5")  )  --哇！你拿到豬油了耶！太好了！得快點把必爾汀叔叔救下來才行！報告人數
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_OKAY") , "LuaYU_tonytony_6", 0 ) --確定(關閉對話)
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_35") , "LuaYU_tonytony_10", 0 ) --希望前往別處救援
			else
				SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_14_1") .. GetString("SC_111584_YU_14_2") .. "|cffff00ff" .. Xcount .. "|r" .. GetString("SC_111584_YU_14_3") .. "|cffff00ff" .. Ycount .. "|r" .. GetString("SC_111584_YU_14_4") .. "|cffff00ff" .. Zcount .. "|r" ..  GetString("SC_111584_YU_14_5")  )  --哇！你拿到豬油了耶！太好了！得快點把必爾汀叔叔救下來才行！報告人數
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_OKAY") , "LuaYU_tonytony_6", 0 ) --確定(關閉對話)
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_35") , "LuaYU_tonytony_10", 0 ) --希望前往別處救援
			end


		elseif SelfSave == true then

			if ZoneID == 1 or ZoneID == 4 or ZoneID == 5 then
				SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_10")   )  --謝謝你的協助，如果明天必爾汀叔叔又卡住的話...希望你還能夠幫忙喔！
				--AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_05") , "LuaYU_tonytony_6", 0 ) --包在我身上(關閉對話)
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_34") , "LuaYU_tonytony_13", 0 ) --回中央廣場
			else

				SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_10")   )  --謝謝你的協助，如果明天必爾汀叔叔又卡住的話...希望你還能夠幫忙喔！
				--AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_05") , "LuaYU_tonytony_6", 0 ) --包在我身上(關閉對話)
			end

		elseif Oilsearch == false and SelfSave == false then

			SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_04")   )  --嗚...可以請你幫個忙嗎...今年冬天太冷了...必爾汀叔叔們多穿了兩件外套...結果爬煙囪送禮物的時候...就...就卡在上面下不來了啦！嗚...他們現在很難過你不要笑嘛～幫幫忙～好嗎？
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_05") , "LuaYU_tonytony_3", 0 ) --包在我身上

		else
			SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_04")   )  --嗚...可以請你幫個忙嗎...今年冬天太冷了...必爾汀叔叔們多穿了兩件外套...結果爬煙囪送禮物的時候...就...就卡在上面下不來了啦！嗚...他們現在很難過你不要笑嘛～幫幫忙～好嗎？
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_05") , "LuaYU_tonytony_3", 0 ) --包在我身上
		end






--				SetFlag( OwnerID()  , 542154 , 1 )  --沒走過給旗標



end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_tonytony_1()

	Local Playername = GetName( OwnerID() ) 

	if EmptyPacketCount( OwnerID() ) >= 2  and QueuePacketCount( OwnerID() ) == 0 then
		
		local Playername = "|cffffff20"..GetName( OwnerID() ).."|r"
		local str = "[SC_111584_YU_11][$SETVAR1="..Playername.."]"

		SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_00")   )  --你太厲害了！必爾汀叔叔們全部再次順利獲救了呢！看到你奇蹟似的表現，我也相信你會飛！

		local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
		local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
		if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
			RunningMsg( OwnerID() , 2 ,  Str )--XXX再次拯救了所有卡在煙囪裡的必爾汀叔叔，他是暖冬節的英雄！
		end
		
		sleep(10)
		GiveBodyItem( OwnerID() ,  203468  , 1 ) --小馴鹿禮盒
		sleep(10)
		GiveBodyItem( OwnerID() ,  203467  , 1 ) --小馴鹿鈴鐺
		sleep(10)
		SetFlag( OwnerID()  , 542163 , 0 )
		SetFlag( OwnerID()  , 542164 , 0 )
		SetFlag( OwnerID()  , 542165 , 0 )
		SetFlag( OwnerID()  , 542166 , 0 )
		SetFlag( OwnerID()  , 542167 , 0 )
		SetFlag( OwnerID()  , 542168 , 0 )
		SetFlag( OwnerID()  , 542169 , 0 )
		SetFlag( OwnerID()  , 542170 , 0 )
		SetFlag( OwnerID()  , 542171 , 0 )
		SetFlag( OwnerID()  , 542172 , 0 )

	else
		SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_05")   )--哇，你的背包沒有空間囉！請先整理一下再來喔！
	end


--"[$VAR2]拯救了所有卡在煙囪裡的必爾汀叔叔，他是暖冬節的英雄！"
end


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_tonytony_2()

	if EmptyPacketCount( OwnerID() ) >= 2  and QueuePacketCount( OwnerID() ) == 0 then

--		local Playername = "|cffff00ff"..GetName( OwnerID() ).."|r"
		local Playername = "|cffffff20"..GetName( OwnerID() ).."|r"
		local str = "[SC_111584_YU_12][$SETVAR1="..Playername.."]"


		SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_02")   )  --你太厲害了！必爾汀叔叔們全部都順利獲救了呢！看到你奇蹟似的表現，難道...你真的會飛！？
		sleep(10)
		local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
		local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
		if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
			RunningMsg( OwnerID() , 2 ,  Str ) --XXX拯救了所有卡在煙囪裡的必爾汀叔叔，他是暖冬節的英雄！
		end
		sleep(10)
		GiveBodyItem( OwnerID() ,  203468  , 1 ) --小馴鹿禮盒
		sleep(10)
		GiveBodyItem( OwnerID() ,  203467  , 1 ) --小馴鹿鈴鐺
		sleep(10)
		GiveBodyItem( OwnerID() ,  530368  , 1 ) --稱號
		SetFlag( OwnerID()  , 542163 , 0 )
		SetFlag( OwnerID()  , 542164 , 0 )
		SetFlag( OwnerID()  , 542165 , 0 )
		SetFlag( OwnerID()  , 542166 , 0 )
		SetFlag( OwnerID()  , 542167 , 0 )
		SetFlag( OwnerID()  , 542168 , 0 )
		SetFlag( OwnerID()  , 542169 , 0 )
		SetFlag( OwnerID()  , 542170 , 0 )
		SetFlag( OwnerID()  , 542171 , 0 )
		SetFlag( OwnerID()  , 542172 , 0 )

	else
		SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_05")   )--哇，你的背包沒有空間囉！請先整理一下再來喔！
	end


end


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_tonytony_3()

	SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_13")   )  --我想可能需要一些潤滑油才能讓必爾汀叔叔滑下來...要去哪裡找油呀！？油...油...啊！豬油！可以請你從[100061]身上取一些[203466]來嗎！我想所有的豬應該都有吧！10份，10份應該就可以了！
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_05") , "LuaYU_tonytony_6", 0 ) --包在我身上(關閉對話)
	SetFlag( OwnerID()  , 542243 , 1 )


end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_tonytony_4()

	if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then

		SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_36")   )  --那就麻煩你了
		sleep(10)
		DelBodyItem( OwnerID() , 203466 , 10 ) --滑溜豬油
		GiveBodyItem( OwnerID() ,  203475  , 10 ) --特調豬油溶液
		sleep(10)		
		SetFlag( OwnerID()  , 542243 , 0 )
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_OKAY") , "LuaYU_tonytony_6", 0 ) --確定(關閉對話)
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_35") , "LuaYU_tonytony_10", 0 ) --希望前往別處救援
	else
		SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_05")   )--哇，你的背包沒有空間囉！請先整理一下再來喔！
	end

end


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_tonytony_5()

	if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then

		SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_15")   )  --謝謝你的協助，有這些應該就足夠了吧！我會把你的大名告訴必爾汀叔叔們的！謝謝你喔！
		sleep(10)
		DelBodyItem( OwnerID() , 203466 , 10 ) --滑溜豬油
		sleep(10)
		GiveBodyItem( OwnerID() ,  202839  , 1 ) --暖冬禮盒
		SetFlag( OwnerID()  , 542242 , 1 )

		SetFlag( OwnerID()  , 542232 , 1 )
		SetFlag( OwnerID()  , 542233 , 1 )
		SetFlag( OwnerID()  , 542234 , 1 )
		SetFlag( OwnerID()  , 542235 , 1 )
		SetFlag( OwnerID()  , 542236 , 1 )
		SetFlag( OwnerID()  , 542237 , 1 )
		SetFlag( OwnerID()  , 542238 , 1 )
		SetFlag( OwnerID()  , 542239 , 1 )
		SetFlag( OwnerID()  , 542240 , 1 )
		SetFlag( OwnerID()  , 542241 , 1 )

	else
		SetSpeakDetail( OwnerID(), GetString("SC_111576_YU_05")   )--哇，你的背包沒有空間囉！請先整理一下再來喔！
	end

end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_tonytony_6()

	CloseSpeak( OwnerID() )                     --關閉對話模版


end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_tonytony_10()

	local ZoneID = math.mod( ReadRoleValue(OwnerID() ,EM_RoleValue_ZoneID ), 1000);

	local daySave01 =  CheckFlag( OwnerID()  , 542232 ) --每日重置
	local daySave02 =  CheckFlag( OwnerID()  , 542233 )
	local daySave03 =  CheckFlag( OwnerID()  , 542234 )
	local daySave04 =  CheckFlag( OwnerID()  , 542235 )
	local daySave05 =  CheckFlag( OwnerID()  , 542236 )
	local daySave06 =  CheckFlag( OwnerID()  , 542237 )
	local daySave07 =  CheckFlag( OwnerID()  , 542238 )
	local daySave08 =  CheckFlag( OwnerID()  , 542239 )
	local daySave09 =  CheckFlag( OwnerID()  , 542240 )
	local daySave10 =  CheckFlag( OwnerID()  , 542241 )

	if ZoneID == 1 then
		SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_31")   )  --那麼讓我送你一程吧！

		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_33") , "LuaYU_tonytony_12", 0 ) --前往銀瀑村
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_37") , "LuaYU_tonytony_14", 0 ) --前往哈沃夫交易站


	elseif ZoneID == 2 then
		SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_31")   )  --那麼讓我送你一程吧！

		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_32") , "LuaYU_tonytony_11", 0 ) --前往羅格鎮
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_33") , "LuaYU_tonytony_12", 0 ) --前往銀瀑村
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_37") , "LuaYU_tonytony_14", 0 ) --前往哈沃夫交易站


	elseif ZoneID == 4 then
		SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_31")   )  --那麼讓我送你一程吧！

		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_32") , "LuaYU_tonytony_11", 0 ) --前往羅格鎮
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_37") , "LuaYU_tonytony_14", 0 ) --前往哈沃夫交易站

	elseif ZoneID == 5 then
		SetSpeakDetail( OwnerID(), GetString("SC_111584_YU_31")   )  --那麼讓我送你一程吧！

		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_32") , "LuaYU_tonytony_11", 0 ) --前往羅格鎮
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111584_YU_33") , "LuaYU_tonytony_12", 0 ) --前往銀瀑村

	end



end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_tonytony_11()

	ChangeZone( OwnerID(), 1, 0, -611.6, 26.2, -5946.0, 245 )  --前往羅格鎮
	CloseSpeak( OwnerID() )                     --關閉對話模版

end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_tonytony_12()


	ChangeZone( OwnerID(), 4, 0, -5344.5, 553.0, 3198.8, 163 ) --前往銀瀑村
	CloseSpeak( OwnerID() )                     --關閉對話模版

end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_tonytony_13()


	ChangeZone( OwnerID(), 2, 0, 5083.8, 112.8, -2330.9, 26 )  --回中央廣場
	CloseSpeak( OwnerID() )                     --關閉對話模版

end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_tonytony_14()


	ChangeZone( OwnerID(), 5, 0, -14236.3, 770.7, -699.5 , 184 )  --回哈沃夫交易站
	CloseSpeak( OwnerID() )                     --關閉對話模版

end
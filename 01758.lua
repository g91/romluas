function LuaI_Z15_TO_Z209_0()
	SetPlot( OwnerID() , "range" , "LuaI_Z15_TO_Z209_1" , 50 )
end

function LuaI_Z15_TO_Z209_1()
	ChangeZone( OwnerID() , 209 , 0 , 135 , 858 , -820 , 90 )
end

function LuaI_Z209_TO_Z15_0()
	SetPlot( OwnerID() , "range" , "LuaI_Z209_TO_Z15_1" , 50 )
end

function LuaI_Z209_TO_Z15_1()
	ChangeZone( OwnerID() , 15 , 0 , -2908 , -97 , 7247 , 360 )
end

function LuaI_Z209_TO_DNG_0()
	SetPlot( OwnerID() , "range" , "LuaI_Z209_TO_DNG_1" , 70 )
end

function LuaI_Z209_TO_DNG_1()
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_209_TO_DNG_ERROR]" , 0 )
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_209_TO_DNG_ERROR]" , 0 )
end

--達拉尼斯與黑曜石要塞間的傳送劇情

function LuaS_114776_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption( OwnerID() , TargetID()  , "[SC_114776_0]" , "LuaS_114776_1", 0 ) --請送我去達拉尼斯王城
	AddSpeakOption( OwnerID() , TargetID()  , "[SC_114776_1]" , "LuaS_114776_2", 0 ) --詢問黑曜騎士團來這裡的原因
	if CheckCompleteQuest( OwnerID() , 422969 ) == true then
		AddSpeakOption( OwnerID() , TargetID()  , "[SC_114776_2]" , "LuaS_114776_3", 0 ) --詢問她與[114509]之間的關係
	end
end

function LuaS_114776_1()
	CloseSpeak(OwnerID())
	ChangeZone( OwnerID() , 6 , 0 , -20623 , -179 , 4212 , 45 )
end

function LuaS_114776_2()
	SetSpeakDetail( OwnerID(), "[SC_114776_3]" ) 
	--現在達拉尼斯王國的兵力並不足以解決周遭的困難，而我們黑曜騎士團是世界上最大的傭兵組織，他們找上我們是理所當然的事情。
	--話是這樣說啦！但其實我們騎士團裡面有很多元老都是來自於這個國家，他們對於這塊土地還是有感情，所以這次的合作有很大一部份也是他們的意思。
	AddSpeakOption( OwnerID() , TargetID()  , "[SO_BACK]" , "LuaS_114776_0", 0 ) 
end

function LuaS_114776_3()
	SetSpeakDetail( OwnerID(), "[SC_114776_4]" ) 
	--喔？你遇到我弟弟了啊？
	--他很讓人頭痛吧！其實我們凱因斯家族在過去就離開了薩維爾大陸，並跟隨著[110317]團長在[ZONE_YGGNO LAND]建立新的家園。
	--不過我弟弟可能從小就聽爺爺講太多達拉尼斯流傳的英雄故事，長大後說要追求什麼『騎士精神的起源』就離開家裡。
	--後來他就到了這裡，聽說現在在獅心騎士團裡還蠻受重用的。
	--嗯......
	--之前見面也發現他成熟許多，不過那股傻勁倒一點也沒變。
	AddSpeakOption( OwnerID() , TargetID()  , "[SO_BACK]" , "LuaS_114776_0", 0 ) 
end

function LuaS_114777_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption( OwnerID() , TargetID()  , "[SC_114777_0]" , "LuaS_114777_1", 0 ) --詢問達拉尼斯王國的事情
	AddSpeakOption( OwnerID() , TargetID()  , "[SC_114777_1]" , "LuaS_114777_2", 0 ) --請送我去達拉尼斯王城
end

function LuaS_114777_1()
	SetSpeakDetail( OwnerID(), "[SC_114777_2]" ) 
	--我們達拉尼斯王國是擁有悠久歷史的國家，我們的領導者繼承了榮耀的人王『卡薩姆』的血脈，而我們各領主國的人民也是當時英雄的後裔。
	--在榮耀的人王『卡薩姆』的智慧之下，我們國家是一個各種人種彼此融洽相處的國度，也是真正瞭解以及發揚『騎士精神』的地方......咳咳......
	--不過畢竟我們的歷史太久了，有些麻煩事情總是會發生的......
	--為了恢復過去的榮耀，我們需要你們這些知名冒險者的力量。
	AddSpeakOption( OwnerID() , TargetID()  , "[SO_BACK]" , "LuaS_114777_0", 0 ) 
end

function LuaS_114777_2()
	CloseSpeak(OwnerID())
	ChangeZone( OwnerID() , 15 , 0 , -4639 , 100 , 7600 , 180 )
end

function LuaS_114778_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption( OwnerID() , TargetID()  , "[SC_114778_0]" , "LuaS_114778_1", 0 ) --詢問達拉尼斯王國與黑曜騎士團的關係
end

function LuaS_114778_1()
	SetSpeakDetail( OwnerID(), "[SC_114778_1]" ) 
	--我們黑曜騎士團的團長過去曾經在達拉尼斯王國受過戰鬥訓練，聽說我們騎士團中很多偉大的英雄就是團長在那個時期認識的。
	--所以我們騎士團與達拉尼斯王國之間的關係一直很不錯。
	--現在那裡似乎發生了不得了的事情，需要很多有經驗的傭兵，而這正是我們騎士團能夠幫得上忙的地方。
	AddSpeakOption( OwnerID() , TargetID()  , "[SO_BACK]" , "LuaS_114778_0", 0 ) 
end

function LuaI_15_6_TRANSFER_0()
--	SetPlot( OwnerID() , "range" , "LuaI_15_6_TRANSFER_1" , 150 )
end

-----	貓捉老鼠
function LuaS_102815_0()
	if	ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==1	then
		return
	end
	local RandX=DW_Rand(10)
	local Cat
DeBugMSG(0,0,"RandX="..RandX)
	if	RandX<4	then
		Cat = Lua_CreateObjByDir( OwnerID() , 102754 , DW_Rand(50)+50 , 0) 
		AddToPartition(Cat,0)
		WriteRoleValue(Cat,EM_RoleValue_LiveTime,8)
		SetAttack(Cat,OwnerID())
	end
end

------ 吟遊詩人
function LuaI_Bard_Usually()
	while 1 do
		for i = 1 , 12 , 1 do
			PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_DANCE )
			sleep( 50 )
		end
		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		sleep( 30 )
	end
end

------ 酒客
function LuaI_DrinkGuest_1()
	while 1 do
		local Num = DW_Rand( 2 )
		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_DRINK )		
		sleep( 30 )
		if Num == 1 then
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_DRINK )	
		else
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		end
		sleep( 30 )
		if Num == 1 then
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_DRINK )	
		else
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		end
		sleep( 30 )
		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		sleep( 30 )
		if Num == 1 then
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_DRINK )	
		else
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		end
		sleep( 30 )
	end
end

---引導員
function LuaS_114952_0()
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID(), "[SC_114952_0]" , "LuaS_114952_1", 0 )	--詢問廢城區的位置 	
	AddSpeakOption( OwnerID(), TargetID(), "[SC_114952_1]" , "LuaS_114952_2", 0 )	--詢問中城區的位置 	
	AddSpeakOption( OwnerID(), TargetID(), "[SC_114952_2]" , "LuaS_114952_3", 0 )	--詢問舊城區的位置 	
	AddSpeakOption( OwnerID(), TargetID(), "[SC_114952_3]" , "LuaS_114952_4", 0 )	--詢問暗巷區的位置 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_114952_4]" , "LuaS_114952_5", 0 )	--詢問下水道的位置
	AddSpeakOption( OwnerID(), TargetID(), "[SC_114952_5]" , "LuaS_114952_6", 0 )	--詢問各種設施的位置 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_114952_6]" , "LuaS_114952_7", 0 )	--詢問回到[ZONE_YGGNO LAND]的方法
end

function LuaS_114952_1()
	local PID = ReadRoleValue( TargetID() , EM_RoleValue_PID )
	local Str = "[SC_114952_1_ANS_"..PID.."]"
	SetSpeakDetail(OwnerID(),Str)	
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_114952_0", 0 )
end

function LuaS_114952_2()
	local PID = ReadRoleValue( TargetID() , EM_RoleValue_PID )
	local Str = "[SC_114952_2_ANS_"..PID.."]"
	SetSpeakDetail(OwnerID(),Str)	
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_114952_0", 0 )
end

function LuaS_114952_3()
	local PID = ReadRoleValue( TargetID() , EM_RoleValue_PID )
	local Str = "[SC_114952_3_ANS_"..PID.."]"
	SetSpeakDetail(OwnerID(),Str)	
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_114952_0", 0 )
end

function LuaS_114952_4()
	local PID = ReadRoleValue( TargetID() , EM_RoleValue_PID )
	local Str = "[SC_114952_4_ANS_"..PID.."]"
	SetSpeakDetail(OwnerID(),Str)	
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_114952_0", 0 )
end

function LuaS_114952_5()
	local PID = ReadRoleValue( TargetID() , EM_RoleValue_PID )
	local Str = "[SC_114952_5_ANS_"..PID.."]"
	SetSpeakDetail(OwnerID(),Str)	
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_114952_0", 0 )
end

function LuaS_114952_6()
	SetSpeakDetail(OwnerID(),"[SC_114952_7]")	--你想問哪個設施？
	AddSpeakOption( OwnerID(), TargetID(), "[SC_114952_8]" , "LuaS_114952_8", 0 )	--詢問[114829]的位置 	
	AddSpeakOption( OwnerID(), TargetID(), "[SC_114952_9]" , "LuaS_114952_9", 0 )	--詢問[114830]的位置 	
	AddSpeakOption( OwnerID(), TargetID(), "[SC_114952_10]" , "LuaS_114952_10", 0 )	--詢問交易所的位置 	
	AddSpeakOption( OwnerID(), TargetID(), "[SC_114952_11]" , "LuaS_114952_11", 0 )	--詢問房屋管理員的位置 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_114952_12]" , "LuaS_114952_12", 0 )	--詢問公會城管理員的位置
	AddSpeakOption( OwnerID(), TargetID(), "[SC_114952_13]" , "LuaS_114952_13", 0 )	--詢問銀行的位置
	AddSpeakOption( OwnerID(), TargetID(), "[SC_114952_14]" , "LuaS_114952_14", 0 )	--詢問各種商店的位置
	AddSpeakOption( OwnerID(), TargetID(), "[SC_114952_15]" , "LuaS_114952_15", 0 )	--詢問各種製造器具的位置 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_114952_16]" , "LuaS_114952_16", 0 )	--詢問[ZONE_DAELANIS_PALACE]的位置 
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "LuaS_114952_0", 0 )
end

function LuaS_114952_7()
	SetSpeakDetail(OwnerID(),"[SC_114952_17]")	--在[ZONE_DAELANIS_OLD_TOWN]的西側大使館有黑曜石要塞的使節，他們能夠幫助冒險者來回[ZONE_YGGNO LAND]，你可以去那邊看看。
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_114952_0", 0 )
end
function LuaS_114952_8()
	SetSpeakDetail(OwnerID(),"[SC_114952_18]")	--[114829]嗎？位置就在[ZONE_DAELANIS_MIDTOWN]的市場南端，你會看到門口有信箱以及交易所行員。
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_114952_6", 0 )
end

function LuaS_114952_9()
	SetSpeakDetail(OwnerID(),"[SC_114952_19]")	--[114830]嗎？你沿著[ZONE_DAELANIS_ALLEY]的道路一直往東走到底，它就在那裡。
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_114952_6", 0 )
end

function LuaS_114952_10()
	SetSpeakDetail(OwnerID(),"[SC_114952_20]")	--交易所的人進駐在[114829]，你可以在[ZONE_DAELANIS_MIDTOWN]的市場南端看到他們就站在那裡。
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_114952_6", 0 )
end

function LuaS_114952_11()
	SetSpeakDetail(OwnerID(),"[SC_114952_21]")	--房屋管理員？喔！我記得是黑曜石要塞的使節帶來的人員，他們都在[ZONE_DAELANIS_OLD_TOWN]西側的大使館那裡。
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_114952_6", 0 )
end

function LuaS_114952_12()
	SetSpeakDetail(OwnerID(),"[SC_114952_22]")	--房屋管理員？喔！我記得是公會城管理員的使節帶來的人員，他們都在[ZONE_DAELANIS_OLD_TOWN]西側的大使館那裡。
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_114952_6", 0 )
end

function LuaS_114952_13()
	SetSpeakDetail(OwnerID(),"[SC_114952_23]")	--銀行嗎？穿過[ZONE_DAELANIS_OLD_TOWN]的入口之後往西邊看就看得到了。
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_114952_6", 0 )
end

function LuaS_114952_14()
	SetSpeakDetail(OwnerID(),"[SC_114952_24]")	--除了馬廄和藥水、煉金相關的商店是在[ZONE_DAELANIS_MIDTOWN]與[ZONE_DAELANIS_ALLEY]交界的廣場週邊外，其他你所需要的商店你都可以在[ZONE_DAELANIS_MIDTOWN]的市場找到。
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_114952_6", 0 )
end

function LuaS_114952_15()
	SetSpeakDetail(OwnerID(),"[SC_114952_25]")	--製造器具的話，你可以跟商店的人借用。除了煉金商店是在[ZONE_DAELANIS_MIDTOWN]與[ZONE_DAELANIS_ALLEY]交界的廣場週邊外，其他商店都在[ZONE_DAELANIS_MIDTOWN]的市場中。
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_114952_6", 0 )
end

function LuaS_114952_16()
	SetSpeakDetail(OwnerID(),"[SC_114952_26]")	--你可以看到[ZONE_DAELANIS_PALACE]就在[ZONE_DAELANIS_OLD_TOWN]北方，但要到達那裡你必須從[ZONE_DAELANIS_OLD_TOWN]東側的階梯上去。
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_114952_6", 0 )
end
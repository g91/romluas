-------亞班諾死孩子丟石頭
function LuaS_422985_Complete()
	DisableQuest( OwnerID() ,true )
	local Kid = Lua_DW_CreateObj("flag" , 114535 ,780542 , 2 )		--種出死孩子
	WriteRoleValue(Kid , EM_RoleValue_IsWalk, 0 )
	Hide( Kid )
	Show( Kid ,0)
	MoveToFlagEnabled( Kid , false )
	LuaFunc_MoveToFlag( Kid , 780542 , 3 ,  0 )
	CastSpell(Kid,OwnerID(),494805)	
	Say( Kid , "[SC_422985_1]")			--你們，走開，滾出去～都是你們害的！
	sleep(25)
	PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_DODGE)
	Say( Kid , "[SC_422985_2]")			--亞班諾不歡迎你們，走開！
	sleep(10)
	CastSpell(Kid,OwnerID(),494805)
	sleep(25)
	Say( OwnerID() , "[SC_422985_3]")		--唉唷～
	PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_DODGE)
	sleep(20)
	local Woman = Lua_DW_CreateObj("flag" , 114536 ,780542 , 2 )		--種出婦人
	WriteRoleValue(Woman , EM_RoleValue_IsWalk, 0 )
	Hide( Woman )
	Show( Woman ,0)
	MoveToFlagEnabled( Woman , false )
	LuaFunc_MoveToFlag( Woman , 780542 , 4 ,  0 )
	Say( Woman , "[SC_422985_4]")		--亞連，不可以！
	AdjustFaceDir( Kid , Woman, 0 )
	AdjustFaceDir( Woman , Kid, 0 )
	sleep(20)
	Say( Woman , "[SC_422985_5]")		--萬一惹他們生氣怎麼辦？
	sleep(30)
	Say( Kid , "[SC_422985_6]")			--我才不怕他們呢！都是他們害的！獅心騎士團最可惡了
	sleep(30)
	Say( Woman , "[SC_422985_7]")			--噓！別說了，我們快走～	
	WriteRoleValue(Kid , EM_RoleValue_IsWalk, 0 )
	WriteRoleValue(Woman , EM_RoleValue_IsWalk, 0 )
	sleep(15)
	LuaFunc_MoveToFlag( Kid , 780542 , 5 ,  0 )
	Delobj( Kid )
	LuaFunc_MoveToFlag( Woman , 780542 , 5 ,  0 )
	Delobj( Woman )
	DisableQuest( OwnerID() ,false )
end


-------詢問亞班諾居民
function LuaS_422986_Woman()
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422986 ) == true	then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_422986_0]" , "LuaS_422986_Woman_Answer", 0 )	--請問你知道為什麼剛剛那位小孩要對著我們丟石頭嗎？
	end
end

function LuaS_422986_Woman_Answer()
	SetSpeakDetail(OwnerID(),"[SC_422986_1]")	--（婦人怨恨的看了你一眼。）...
	SetFlag(OwnerID() , 543669 , 1 )
end

function LuaS_422986_Oldman()
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422986 ) == true	then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_422986_0]" , "LuaS_422986_Oldman_Answer", 0 )	--請問你知道為什麼剛剛那位小孩要對著我們丟石頭嗎？
	end
end

function LuaS_422986_Oldman_Answer()
	SetSpeakDetail(OwnerID(),"[SC_422986_2]")	--唉～達拉尼斯城來的大人...
	SetFlag(OwnerID() , 543670 , 1 )
end

function LuaS_422986_Boy()
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422986 ) == true	then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_422986_0]" , "LuaS_422986_Boy_Answer", 0 )	--請問你知道為什麼剛剛那位小孩要對著我們丟石頭嗎？
	end
end

function LuaS_422986_Boy_Answer()
	SetSpeakDetail(OwnerID(),"[SC_422986_3]")	--這是個愚蠢萬分的問題...
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422986_4]" , "LuaS_422986_Boy_Answer_1", 0 )		--為什麼大家會這麼怨恨獅心騎士團？
end

function LuaS_422986_Boy_Answer_1()
	SetSpeakDetail(OwnerID(),"[SC_422986_5]")	--我們不只怨恨獅心騎士團，還怨恨著人王！...
	SetFlag(OwnerID() , 543671 , 1 )
end

-------大將軍蘭斯的對話
function LuaS_422989()
	LoadQuestOption( OwnerID() )
	if 	CheckAcceptQuest(OwnerID(),424223) == true 	and
		CountBodyItem(OwnerID(),209473) == 0 		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424213_01]","LuaAS_424223_02",0)
	end
	if 	CheckAcceptQuest(OwnerID(),424214) == true 	and
		CountBodyItem(OwnerID(),209413) == 0 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_424214_01]","LuaAS_424214_01")
	end
	if	CheckAcceptQuest( OwnerID() ,422989 ) == true	and
		CheckFlag( OwnerID() , 543672) == false	then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_0]" , "LuaS_422989_0", 0 )	--您要問我什麼問題？蘭斯閣下。
	end
	if	(CheckAcceptQuest(OwnerID(),423012)==true )and( CheckCompleteQuest( OwnerID(),423012)==false)	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423012_0]","LuaS_423012_1",0)	--我應該要知道什麼？
	end
	if	CheckAcceptQuest( OwnerID() , 422990 ) == true and CheckFlag( OwnerID() , 543750 ) == false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422990_0]","LuaS_422990_1",0)	--我已經準備好了
	end
	if	CheckAcceptQuest( OwnerID() , 423222 ) == true and CheckFlag( OwnerID() , 543928) == false	then                                              --有接423222且大將軍不忙
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423222_0]","LuaS_423222_0",0)	--大將軍?
	end
	if	CheckAcceptQuest( OwnerID() ,423291 ) == true	and    CountBodyItem ( OwnerID() , 207341 ) >0	then  
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_423291_0_0]" , "LuaS_423291_0", 0 )	
	end	
end

function LuaS_422989_0()
	SetSpeakDetail(OwnerID(),"[SC_422989_1]")		--你的過去是什麼，我不在乎...
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_2]" , "LuaS_422989_1", 0 )		--重振獅心騎士團的名聲。
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_3]" , "LuaS_422989_2", 0 )		--我有非殺不可的對象。
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_4]" , "LuaS_422989_3", 0 )		--提升自我實力，成為一流騎士。
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_5]" , "LuaS_422989_4", 0 )		--哪裡有好玩的哪裡去。
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_6]" , "LuaS_422989_5", 0 )		--暫時什麼也不想做。
end

function LuaS_422989_1()
	SetSpeakDetail(OwnerID(),"[SC_422989_7]")		--（你看見蘭斯露出興味富饒的神情。）...
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_8]" , "LuaS_422989_1_1", 0 )		--我不會畏懼磨練的！
end

function LuaS_422989_1_1()
	SetSpeakDetail(OwnerID(),"[SC_422989_9]")		--（雖然短暫，但這次你清楚的看見這位大將軍難得的笑容了。）...
	SetFlag(OwnerID() , 543672 , 1 )			--任務完成旗標
	SetFlag(OwnerID() , 543673 , 1 )			--重振獅心騎士團的名聲
end

function LuaS_422989_2()
	SetSpeakDetail(OwnerID(),"[SC_422989_10]")		--復仇會使一個人堅強...
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_11]" , "LuaS_422989_2_1", 0 )		--我絕不會濫殺無辜！
end

function LuaS_422989_2_1()
	SetSpeakDetail(OwnerID(),"[SC_422989_12]")		--如果有一天你在復仇...
	SetFlag(OwnerID() , 543672 , 1 )			--任務完成旗標
	SetFlag(OwnerID() , 543674 , 1 )			--重振獅心騎士團的名聲
end

function LuaS_422989_3()
	SetSpeakDetail(OwnerID(),"[SC_422989_13]")		--喔？獅心騎士團裡，可有你視為榜樣的目標？
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_14]" , "LuaS_422989_3_1", 0 )		--有，大將軍你就是我的目標。
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_15]" , "LuaS_422989_3_2", 0 )		--有，我想成為像副團長伊崔妮那樣的一流騎士！
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_16]" , "LuaS_422989_3_3", 0 )		--有，我想成為凱‧凱因斯那樣的一流騎士！
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_17]" , "LuaS_422989_3_4", 0 )		--有，我想成為像約翰‧霍夫曼那樣的一流騎士！
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_18]" , "LuaS_422989_3_5", 0 )		--沒有，我的目標另有其人，並非獅心騎士團裡的騎士。
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_19]" , "LuaS_422989_3_6", 0 )		--沒有，我想走自己的騎士之路。
end

function LuaS_422989_3_1()
	SetSpeakDetail(OwnerID(),"[SC_422989_20]")		--（蘭斯眼神銳利的審視著你，最後，他只是淡淡一笑，沒有多說什麼。）
	SetFlag(OwnerID() , 543672 , 1 )			--任務完成旗標
	SetFlag(OwnerID() , 543675 , 1 )			--想成為蘭斯
end

function LuaS_422989_3_2()
	SetSpeakDetail(OwnerID(),"[SC_422989_21]")		--伊崔妮是個非常有責任感的騎士...
	SetFlag(OwnerID() , 543672 , 1 )			--任務完成旗標
	SetFlag(OwnerID() , 543676 , 1 )			--想成為伊崔妮
end

function LuaS_422989_3_3()
	SetSpeakDetail(OwnerID(),"[SC_422989_22]")		--你可知道凱秉持的意念是什麼？...
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_23]" , "LuaS_422989_3_3_1", 0 )		--維護愛與和平！	
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_24]" , "LuaS_422989_3_3_2", 0 )		--正義無所不在！捍衛正義！
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_25]" , "LuaS_422989_3_3_3", 0 )		--順從自己的直覺！
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_422989_26]" , "LuaS_422989_3_3_4", 0 )		--我....我不是很清楚......	
end

function LuaS_422989_3_3_1()
	SetSpeakDetail(OwnerID(),"[SC_422989_27]")		--嗯，期待你有一天也會成為如同凱這般溫暖...
	SetFlag(OwnerID() , 543672 , 1 )			--任務完成旗標
	SetFlag(OwnerID() , 543677 , 1 )			--想成為阿凱
end

function LuaS_422989_3_3_2()
	SetSpeakDetail(OwnerID(),"[SC_422989_28]")		--在面對摧毀正義的邪惡時...
	SetFlag(OwnerID() , 543672 , 1 )			--任務完成旗標
	SetFlag(OwnerID() , 543677 , 1 )			--想成為阿凱
end

function LuaS_422989_3_3_3()
	SetSpeakDetail(OwnerID(),"[SC_422989_29]")		--或許....你真的是最一個接近凱本質的騎士....
	SetFlag(OwnerID() , 543672 , 1 )			--任務完成旗標
	SetFlag(OwnerID() , 543677 , 1 )			--想成為阿凱
end

function LuaS_422989_3_3_4()
	SetSpeakDetail(OwnerID(),"[SC_422989_30]")		--那麼，好好的觀察凱，他會是你很好的典範。...
	SetFlag(OwnerID() , 543672 , 1 )			--任務完成旗標
	SetFlag(OwnerID() , 543677 , 1 )			--想成為阿凱
end

function LuaS_422989_3_4()
	SetSpeakDetail(OwnerID(),"[SC_422989_31]")		--（蘭斯似乎冷冷的笑了。）...
	SetFlag(OwnerID() , 543672 , 1 )			--任務完成旗標
	SetFlag(OwnerID() , 543678 , 1 )			--想成為約翰
end

function LuaS_422989_3_5()
	SetSpeakDetail(OwnerID(),"[SC_422989_32]")		--能夠讓你如此推崇？...
	SetFlag(OwnerID() , 543672 , 1 )			--任務完成旗標
	SetFlag(OwnerID() , 543679 , 1 )			--其他騎士
end

function LuaS_422989_3_6()
	SetSpeakDetail(OwnerID(),"[SC_422989_33]")		--（蘭斯笑了，笑容難得流露出絲絲暖意。）...
	SetFlag(OwnerID() , 543672 , 1 )			--任務完成旗標
	SetFlag(OwnerID() , 543680 , 1 )			--走自己的路
end


function LuaS_422989_4()
	SetSpeakDetail(OwnerID(),"[SC_422989_34]")		--在還是和平的時代...
	SetFlag(OwnerID() , 543672 , 1 )			--任務完成旗標
	SetFlag(OwnerID() , 543681 , 1 )			--到處玩
end

function LuaS_422989_5()
	SetSpeakDetail(OwnerID(),"[SC_422989_35]")		--在實踐騎士的道路上，總有一天你會找到你的目標。...
	SetFlag(OwnerID() , 543672 , 1 )			--任務完成旗標
	SetFlag(OwnerID() , 543702 , 1 )			--都不做
end


--------------------------------------------------------------------
--15副本任務--深宮秘史的後續對話

function LuaS_423291_0()
	SetSpeakDetail(OwnerID(),"[SC_423291_0]")	
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423291_1]" , "LuaS_423291_1", 0 )
end

function LuaS_423291_1()
	SetSpeakDetail(OwnerID(),"[SC_423291_2]")	
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423291_3]" , "LuaS_423291_2", 0 )
end

function LuaS_423291_2()
	SetSpeakDetail(OwnerID(),"[SC_423291_4]")	
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423291_5]" , "LuaS_423291_3", 0 )
end

function LuaS_423291_3()
	SetSpeakDetail(OwnerID(),"[SC_423291_6]")	
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_423291_7]" , "LuaS_423291_4", 0 )
end


function LuaS_423291_4()
	SetFlag(OwnerID(), 543917, 1 )
	SetSpeakDetail(OwnerID(),"[SC_423291_8]")

end
------------------------------------------------------------------------------




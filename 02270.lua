--======================================================================================================
--與族長對話，掛在LuaAS_423809_05(小灰的)之下
--======================================================================================================
--(1)
--AddSpeakOption(OwnerID(),TargetID(),"[SC_423894_0]","LuaZ13WS_117328_0",0)
--xx族長，您好，很榮幸能認識蘭薩德驍勇的朋友們。
function LuaZ13WS_117328_0()
	SetSpeakDetail(OwnerID(),"[SC_423894_1]")
	--歡迎你來到蘭薩德氏族，年輕的冒險者。
	SetFlag(OwnerID(),544744,1)
end 

--(2)
--if CheckAcceptQuest(OwnerID(),423830)==true	then
--AddSpeakOption(OwnerID(),TargetID(),"[SC_423830_0]","LuaZ13WS_117328_1",0)
--我願意加入探查行動，請問該從何處著手？
--end 
function LuaZ13WS_117328_1()
	SetSpeakDetail(OwnerID(),"[SC_423830_1]")
	--村子前方有個水潭，似是蛇群的巢穴，你不妨從那附近查起。你從村口出去左轉，過橋往前走，就能看到潭內有三株死木的水潭，蛇巢的入口在水底。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423830_2]","LuaZ13WS_117328_2",0)
	--好的，我將前去探查蛇群異常活動的原因。
end 

function LuaZ13WS_117328_2()
	CloseSpeak(OwnerID())
end 
---------------
function LuaZ13WS_423830_0()
	SetPlot(OwnerID(),"range","LuaZ13WS_423830_1",200 )
end 

function LuaZ13WS_423830_1()
	Beginplot(TargetID(),"LuaZ13WS_423830_2",0)
end 

function LuaZ13WS_423830_2()
	SetPlot(TargetID(),"range","LuaZ13WS_423830_0",0 )
	Local X = ReadRoleValue(TargetID(),EM_RoleValue_X)
	Local Y = ReadRoleValue(TargetID(),EM_RoleValue_Y)
	Local Z = ReadRoleValue(TargetID(),EM_RoleValue_Z)
	if	CheckAcceptQuest(TargetID(),423830)==true		and
		CheckCompleteQuest(TargetID(),423830)==false	and
		Checkflag(TargetID(),544735)== false		then
		Local Snake1  = CreateObj ( 105162 , X+100 , Y , Z+100 , 0 , 1) 
		Local Snake2  = CreateObj ( 105157 , X+150 , Y , Z+50 , 0 , 1)   
		Local Snake3  = LuaFunc_CreateObjByObj( 105348, OwnerID() )
		Local Snake4  = CreateObj ( 105157 , X+100 , Y , Z , 0 , 1)  
		ks_ActSetMode( Snake1)
		ks_ActSetMode( Snake2)
		ks_ActSetMode( Snake3)
		ks_ActSetMode( Snake4)
		BeginPlot(Snake1,"LuaZ13WS_423830_3",0)
		BeginPlot(Snake2,"LuaZ13WS_423830_3",0)
		BeginPlot(Snake3,"LuaZ13WS_423830_3",0)
		BeginPlot(Snake4,"LuaZ13WS_423830_3",0)
		ScriptMessage(TargetID(),TargetID(),2,"[SC_423830_3]",0)
		ScriptMessage(TargetID(),TargetID(),0,"[SC_423830_3]",0)
		-- 蛇群不停從你面前經過，請注意蛇來的方向。
		Sleep(200)
		Delobj(Snake1)
		Delobj(Snake2)
		Delobj(Snake3)
		Delobj(Snake4)
		BeginPlot(OwnerID(),"LuaZ13WS_423830_5",0)
	end 
end

function LuaZ13WS_423830_3()
	DW_MoveToFlag(OwnerID(),780878,1,0,1)
end 

function LuaZ13WS_423830_5()
	Sleep(60)
	SetPlot(OwnerID(),"range","LuaZ13WS_423830_1",200 )
end 


--探蛇洞
function  LuaZ13WS_423830_flag0()
	SetPlot(OwnerID(),"range","LuaZ13WS_423830_flag1",80 )
end 

function LuaZ13WS_423830_flag1()
	if	CheckAcceptQuest(OwnerID(),423830)==true		and
		CheckCompleteQuest(OwnerID(),423830)==false	and
		Checkflag(OwnerID(),544735)== false		then
		SetFlag(OwnerID(),544735,1)
		ScriptMessage(TargetID(),TargetID(),2,"[SC_423830_4]",0)
		ScriptMessage(TargetID(),TargetID(),0,"[SC_423830_4]",0)
		--你發現前方有個奇怪的石柱，發出令人煩燥欲嘔的能壓。
	end
end 


--======================================================================================================
--防蛇焚香
--======================================================================================================

function LuaZ13WS_423832_0()	
	--掛在作用物品的模版下>物品使用>使用效果類型：Server端劇情>使用效果
	Beginplot(TargetID(),"LuaZ13WS_423832_1",0)
end

function LuaZ13WS_423832_1()
	if	CountBodyItem(TargetID(),209021)>0	and
		CountBodyItem(TargetID(),209022)>0	then
		GiveBodyItem( TargetID() ,209023 , 1 )
		UseItemDestroy()	
		--模版中不要勾選_可消耗_，此指令可刪除使用中的物品，最好放在給了新物品之後，這樣才不會有舊物用掉，新物卻未入袋的窘況。
		DelBodyItem(TargetID(),209021,1)
		DelBodyItem(TargetID(),209022,1)
	else
		if	CountBodyItem(TargetID(),209021)<1	then
			ScriptMessage( TargetID(), TargetID(), 2,"[SC_423832_0]", 0 )	
			ScriptMessage( TargetID(), TargetID(), 0,"[SC_423832_0]", 0 )
			--你缺少[209021],無法製作[209023]。
		end
		if	CountBodyItem(TargetID(),209022)<1	then
			ScriptMessage( TargetID(), TargetID(), 2,"[SC_423832_1]", 0 )	
			ScriptMessage( TargetID(), TargetID(), 0,"[SC_423832_1]", 0 )
			--你缺少[209022],無法製作[209023]。
		end
	end
end	
	

--======================================================================================================
--危險任務
--======================================================================================================

function LuaZ13WS_423834_accept_0()
	DisableQuest(OwnerID(), true )
	AddBuff(TargetID(),508928,1,600)
	local Sapans= LuaFunc_CreateObjByObj( 117355 , OwnerID() )
	local Waysli=Lua_DW_CreateObj("flag" ,115400,780810,2)
	DisableQuest(Sapans, true )
	DisableQuest(Waysli, true )
	Hide(Sapans)
	Hide(Waysli)
	Show(Sapans,0)
	Show(Waysli,0)
	if	CheckBuff(TargetID(),508932)==true	then
		Cancelbuff(TargetID(),508932)
	end
	if	CheckBuff(TargetID(),508933)==true	then	
		Cancelbuff(TargetID(),508933)
	end
	DisableQuest(Sapans, true )
	BeginPlot(Sapans,"LuaZ13WS_423834_accept_1",0)
	Sleep(15)
	BeginPlot(Waysli,"LuaZ13WS_423834_accept_1",0)
	Sleep(80)
	Delobj(Sapans)
	Delobj(Waysli)
	Cancelbuff(TargetID(),508928)
	DisableQuest(OwnerID(), false )
end

function LuaZ13WS_423834_accept_1()
	WriteRoleValue(OwnerID(), EM_RoleValue_IsWalk, 1)
	DW_MoveToFlag(OwnerID(),780810,1,0,1)
end 

--======================================================================================================
--偉大的傳送術
--======================================================================================================
function LuaZ13WS_423835_0()
	LoadQuestOption(OwnerID())
--	say(OwnerID(),"OO")
	if	CheckAcceptQuest(OwnerID(),423835)==true		and
		CheckCompleteQuest(OwnerID(),423835)==false	and
		CountBodyItem(OwnerID(),209148)==0		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423835_0]","LuaZ13WS_423835_1",0)
		--你好，傳送師[117357]要我過來向你拿一個貝殼。
	
	end
end 

function LuaZ13WS_423835_1()
	SetSpeakDetail(OwnerID(),"[SC_423835_1]")	
	--喔，你是初次使用傳送陣的冒險者，是不是覺得傳送陣很神奇啊？以後你一定會習慣的，這個世界是很大的，有了傳送陣之後，
	--你要去哪裡都很方便，不過，如果不趕時間的話，我還是比較喜歡邁動自己的腳走去目的地，傳送陣可沒辦法給我涼風、明月和花香吶
	GiveBodyItem(OwnerID(),209148,1)
end 


--======================================================================================================
--燉肉
--======================================================================================================
function LuaZ13WS_423836_0()

	if 	CheckBuff(TargetID(),509020)==true	then
		CancelBuff(TargetID(),509020)
		AddBuff(TargetID(),509020,1,120)
	else
		AddBuff(TargetID(),509020,1,120)
	end 
	sleep(20)
	ScriptMessage( TargetID(), TargetID(), 2,"[SC_423836_1]", 0 )	
	ScriptMessage( TargetID(), TargetID(), 0,"[SC_423836_1]", 0 )
			--時間不等人，你最好趕快行動，別讓燉肉涼了！！
	sleep(20)
	ScriptMessage( TargetID(), TargetID(), 2,"[SC_423836_2]", 0 )	
	ScriptMessage( TargetID(), TargetID(), 0,"[SC_423836_2]", 0 )
			--(限時任務，已開始倒數計時)
end

function LuaZ13WS_423836_R0()
	SetPlot(OwnerID(),"range","LuaZ13WS_423836_R1",80 )
end

function LuaZ13WS_423836_R1()
	if	CheckAcceptQuest(OwnerID(),423836)==true		and
		CheckCompleteQuest(OwnerID(),423836)==false	and
		CheckFlag(OwnerID(),544774)==false		and
		CountBodyItem(OwnerID(),209149)>0		then
			if	CheckBuff(OwnerID(),509020)==true	then
				SetFlag(OwnerID(),544774,1)
			else
				ScriptMessage( OwnerID(), OwnerID(), 2,"[SC_423836_0]", 0 )	
				ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_423836_0]", 0 )
				--喔哦，燉肉涼了，請放棄任務再重試一次。
			end
	end
end  

function LuaZ13WS_423836_R2()
	local Obj = OwnerID()	
	local Target = TargetID()		
	CancelBuff(Target,509020)		--完成任務就不需要buff
end

--======================================================================================================
--信件 
--======================================================================================================
function LuaZ13WS_423837_209150_ItemUse()	
	--掛在作用物品的模版下>物品使用>使用效果類型：Server端劇情>使用效果
	Beginplot(TargetID(),"LuaZ13WS_423837_209150_ItemUse_1",0)
end

function LuaZ13WS_423837_209150_ItemUse_1()
	ClearBorder( TargetID() );		
	AddBorderPage( TargetID(), "[SC_423837]" )
	--親愛的朋友，我得說，你真是個要得的冒險者，熱心助人，不畏艱難，似乎什麼難題遇到你就不見了，蘭薩德族長也常向我提起你，對你讚不絕口。
	--說真的，你讓我想起我年輕的時候。
	--這兒的蛇災問題已不成大患，像你這樣的人才應該繼續往前走，迎接其他的挑戰。
	--祝福你，前途遠大的年輕人！
	--誠摰的[117303] 
	ShowBorder( TargetID(), 0, "[209150]", "ScriptBorder_Texture_Paper" )
	if	CountBodyItem(TargetID(),209150)>0	then
		GiveBodyItem( TargetID() ,209151 , 1 )
		GiveBodyItem( TargetID() ,209152 , 1 )
		UseItemDestroy()	
		--模版中不要勾選_可消耗_，此指令可刪除使用中的物品，最好放在給了新物品之後，這樣才不會有舊物用掉，新物卻未入袋的窘況。
		DelBodyItem(TargetID(),209150,1)
	end
end
function LuaZ13WS_423837_209152_ItemUse()
	ClearBorder( OwnerID() );		
	AddBorderPage( OwnerID(), "[SC_423837]" )
	ShowBorder( OwnerID(), 0, "[209150]", "ScriptBorder_Texture_Paper" )
end







		

















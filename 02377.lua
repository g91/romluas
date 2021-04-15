function LuaS_424286_Accept()
	local player = TargetID()
	if	CheckCompleteQuest( player , 424234 ) == TRUE	then
		SetFlag ( player , 545060 , 1 )
	end
end

function LuaS_424241_Accept()
	local player = TargetID()
	if	CheckCompleteQuest( player , 424242 ) == TRUE	then
		SetFlag ( player , 545057 , 1 )
		SetFlag ( player , 545058 , 1 )
	end
end

------------讓守門人冷靜
function LuaS_424286_0()
	local player = OwnerID()
	if	CheckFlag ( player , 545077 ) == FALSE	and
		CheckAcceptQuest( player , 424286 ) == true then
		SetSpeakDetail( player,"[SC_424286_0]")
		AddSpeakOption( player, TargetID(), "[SC_424286_1]" , "LuaS_424286_1", 0 )
	end
	LoadQuestOption( player )
end
	
function LuaS_424286_1()
	local player = OwnerID()
	local td = TargetID()

	if	ReadRoleValue( TD, EM_RoleValue_Register1 ) == 1 then
		ScriptMessage ( player , player , 0 , "[SC_422804]" , 0 )
		ScriptMessage ( player , player , 1 , "[SC_422804]" , 0 )
		return -1
	else
		WriteRoleValue( td, EM_RoleValue_Register1, 1 )
		SetSpeakDetail( player,"[SC_424286_2]")			---雖然你看起來不像軍人，誰知道你實際上是不是軍人？
		SetFlag( player , 545059 , 1 )
		CallPlot( td , "LuaS_424234_0" , player )
	end
end


function LuaS_424234_0( player )
	local	KP1
	local	KP2
	local	PE1
	local	PE2
	local	mar								--演員：kp2、pe2、mar

	if	CheckFlag ( player , 545059 ) == TRUE	then		--確認flag後開始表演

		KP1 = LuaFunc_SearchNPCbyOrgID( player , 118377 , 200 )	--定義守門人一號的位置
		KP2 = Lua_DW_CreateObj( "obj" , 118338 , KP1 , 1 , 1 )		--在守門人一號的地方種出守門人二號
		pe1 = LuaFunc_SearchNPCbyOrgID( player , 118345 , 200 )	--定義佩雷斯一號的位置
		pe2 = Lua_DW_CreateObj( "obj" , 118346 , pe1 , 1 , 1 )		--在佩雷斯一號的地方種出佩雷斯二號
		Ach = Lua_DW_CreateObj( "flag" , 105857 , 780949 , 0 , 1 , 1 )	--在旗標1上種出1個馬汀
		
		DelFromPartition( KP1 )
		DelFromPartition( PE1 )						--守門人一號、佩雷斯一號消失
		MoveToFlagEnabled( KP2 , false )
		MoveToFlagEnabled( pe2 , false )				--守門人二號、佩雷斯二號不亂跑
		AdjustFaceDir( KP2 , Ach , 0 )
		AdjustFaceDir( Pe2 , Ach , 0 )					--守門人二號、佩雷斯二號面向馬汀
		SetModeEx( Ach , EM_SetModeType_Fight , FALSE )

		Say( Ach , "[SC_424234_1]")					--阿瑪多爾！那些宣亡者我們快檔不住了，要衝進村裡了！
		DW_MoveToFlag( Ach , 780949 , 1 , 0 , 1 )			--馬汀走向旗標2，且不亂跑		
		SetDefIdleMotion( KP2, ruFUSION_ACTORSTATE_ATTACK_UNARMED)
		Say( KP2 , "[SC_424234_2]")					--啥？嫌我事情不夠多，現在又冒出新的問題來了！？
		Sleep(20)
		SetDefIdleMotion( Ach, ruFUSION_MIME_EMOTE_BEG)
		Say( Ach , "[SC_424234_3]")					--馬汀：啊啊，抱歉給你添麻煩了...... (下略)
		Sleep(20)
		SetDefIdleMotion( Ach, ruFUSION_ACTORSTATE_ATTACK_UNARMED)	--馬汀生氣
		say( Ach , "[SC_424234_4]")
		Sleep(20)
		say( Ach , "[SC_424234_5]")
		Sleep(20)
		SetDefIdleMotion( Ach, ruFUSION_MIME_NONE)			--馬汀動作取消
		DW_MoveToFlag( Ach , 780949 , 0 , 0 , 1 )			--馬汀走回旗標2，且不亂跑
		
		DelObj( Ach )
		DelObj( Pe2 )
		DelObj( KP2 )							--刪除演員
		AddToPartition( KP1 , 0 )
		AddToPartition( Pe1 , 0 )					--任務NPC出現
		WriteRoleValue( KP1 , EM_RoleValue_Register1 , 0 )
		AdjustFaceDir( KP1 , player , 0 )
		AdjustFaceDir( Pe1 , player , 0 )				--任務NPC轉向玩家
		SetFlag( player , 545077 , 1)				--演戲完畢、獲得keyitem 545077
	end
end

function LuaS_424234_completed()
	if	CheckCompleteQuest( TargetID() ,424234) == TRUE	then
		SetFlag( TargetID() , 545060 , 1 )
	end
end

------------收集奇聞軼事
function LuaS_424236_00()
	local od = OwnerID()
	local td = TargetID()
	if	CheckAcceptQuest ( od , 424236 ) == TRUE	and
		CheckFlag (od , 545054 ) == FALSE		then
		SetFlag( od , 545124 , 1 )
		AddSpeakOption ( od , td , "[SC_424236_00]" , "LuaS_424236_01" , 0 )
	end
	LoadQuestOption( od )
end

function LuaS_424236_01()
	local od = OwnerID()
	local td = TargetID()
	SetSpeakDetail( od , "[SC_424236_01]" )
	if	Checkflag ( od , 545054 ) == TRUE	then
		LuaS_424236_exit()
	else
		AddSpeakOption ( od , td , "[SC_424236_02]" , "LuaS_424236_03" , 0 )
		SetFlag ( od , 545052 , 1 )
	end
end

function LuaS_424236_03()
	local od = OwnerID()
	local td = TargetID()
	SetSpeakDetail( od , "[SC_424236_03]" )
	if	Checkflag ( od , 545054 ) == TRUE	then
		LuaS_424236_exit()
	else
		AddSpeakOption ( od , td , "[SC_424236_04]" , "LuaS_424236_05" , 0 )
		AddSpeakOption ( od , td , "[SC_424236_BACK]" , "LuaS_424236_01" , 0 )
	end
end

function LuaS_424236_05()
	local od = OwnerID()
	local td = TargetID()
	SetSpeakDetail( od , "[SC_424236_05]" )
	if	Checkflag ( od , 545054 ) == TRUE	then
		LuaS_424236_exit()
	else
		AddSpeakOption ( od , td , "[SC_424236_06]" , "LuaS_424236_07" , 0 )
		AddSpeakOption ( od , td , "[SC_424236_BACK]" , "LuaS_424236_03" , 0 )
		SetFlag ( od , 545053 , 1 )
	end
end

function LuaS_424236_07()
	local od = OwnerID()
	local td = TargetID()
	SetSpeakDetail( od , "[SC_424236_07]" )
	if	Checkflag ( od , 545054 ) == TRUE	then
		LuaS_424236_exit()
	else
		AddSpeakOption ( od , td , "[SC_424236_08]" , "LuaS_424236_09" , 0 )
		AddSpeakOption ( od , td , "[SC_424236_BACK]" , "LuaS_424236_05" , 0 )
	end
end

function LuaS_424236_09()
	local od = OwnerID()
	local td = TargetID()
	SetSpeakDetail( od , "[SC_424236_09]" )
	SetFlag	( od , 544905 , 1)
	if	Checkflag ( od , 545054 ) == TRUE	then
		LuaS_424236_exit()
	else
		SetFlag (od ,544905 , 1 )
		AddSpeakOption ( od , td , "[SC_424236_10]" , "LuaS_424236_11" , 0 )
		AddSpeakOption ( od , td , "[SC_424236_BACK]" , "LuaS_424236_07" , 0 )
	end
end

function LuaS_424236_11()
	local od = OwnerID()
	local td = TargetID()
	SetSpeakDetail( od , "[SC_424236_11] [SC_424236_ANYTHINGELSE]" )
	SetFlag ( od , 545054 , 1 )
	LuaS_424236_exit()
end

function LuaS_424236_questions()
	local od = OwnerID()
	local td = TargetID()
	SetSpeakDetail( od , "[SC_424236_QNA]" )
	AddSpeakOption ( od , td , "[SC_424236_WANNA] [SC_424236_00]" , "LuaS_424236_01" , 0 )
	AddSpeakOption ( od , td , "[SC_424236_02]" , "LuaS_424236_03" , 0 )
	AddSpeakOption ( od , td , "[SC_424236_04]" , "LuaS_424236_05" , 0 )
	AddSpeakOption ( od , td , "[SC_424236_06]" , "LuaS_424236_07" , 0 )
	AddSpeakOption ( od , td , "[SC_424236_08]" , "LuaS_424236_09" , 0 )
end

function LuaS_424236_quit()
	CloseSpeak( OwnerID() )
end

function LuaS_424236_exit()
	local od = OwnerID()
	local td = TargetID()
	AddSpeakOption ( od , td , "[SC_424236_QUESTIONS]" , "LuaS_424236_questions" , 0 )
	AddSpeakOption ( od , td , "[SC_424236_QUIT]" , "LuaS_424236_quit" , 0 )
end

--------------撿垃圾-----------
function LuaS_424249_OnClick()	-- 檢查是否可撿垃圾
	local od = OwnerID()
	local Bags = { [1]=240005 , [2]=240006 }			-- 1 = 空垃圾袋 2 = 有垃圾的垃圾袋
	local DoneFlag = 545156

	if 	CountBodyItem( od ,Bags[1] ) == 0	and
		CountBodyItem( od ,Bags[2] ) == 0	then
		ScriptMessage( od , od , 1 , "[SC_424249_0]" , 0 )	--你沒有垃圾袋裝垃圾，回去和阿赫利婭‧內梅西奧拿垃圾袋
		ScriptMessage( od , od , 0 , "[SC_424249_0]" , 0 )
		return -1

	elseif CheckFlag ( od, DoneFlag ) == TRUE	then
		DelBodyItem ( od , Bags[1] , 1 )
		DelBodyItem ( od , Bags[2] , 1 )
		GiveBodyItem ( od, Bags[2] , 1 )
		ScriptMessage( od , od , 1 , "[SC_424249_1]" , 0 )	--你的垃圾袋已經滿了，放不了更多垃圾
		ScriptMessage( od , od , 0 , "[SC_424249_1]" , 0 )
		return -1
	else
		return 1
	end
end

function LuaS_424249_ClearFlag()	-- 將flag清除
	local od = TargetID()
	local MomTable = { 545150 , 545151 , 545152 , 545153 , 545154 }
	for i = 1 , table.getn( MomTable ) do
		SetFlag( od , MomTable[i] , 0 )
	end
	SetFlag( od , 545156 , 0 )
end

function LuaS_424249_AfterClick()	-- Touch劇情
	local td = TargetID()
	local od = OwnerID()
	local MomTable = {	[118520] = 545150 ,		---- 垃圾堆table
				[118549] = 545151 ,
				[118550] = 545152 ,
				[118551] = 545153 ,
				[118552] = 545154	}
	local Bags = { [1]=240005 , [2]=240006 }
	local WhichOne = ReadRoleValue( td , EM_RoleValue_OrgID )
-------------------------把空袋子置換成有裝垃圾的袋子------------------------------
	if	CountBodyItem ( od , Bags[1] ) > 0 then
		DelBodyItem ( od , Bags[1] , 1 )
		GiveBodyItem ( od , Bags[2] , 1 )
		ScriptMessage( od, od, 1,"[SC_424249_3][$SETVAR1=["..WhichOne.."]".."]", 0 )	-- 你把 OO 裝進垃圾袋裡
		ScriptMessage( od, od, 0,"[SC_424249_3][$SETVAR1=["..WhichOne.."]".."]", 0 )
		SetFlag( od ,  MomTable[WhichOne] , 1)
		BeginPlot( od , "LuaS_424249_CheckFlags" , 0)
		return 1
	elseif	CountBodyItem ( od , Bags[2] ) > 0 then
		DelBodyItem ( od , Bags[2] , 1 )
		GiveBodyItem ( od , Bags[2] , 1 )
		ScriptMessage( od, od, 1,"[SC_424249_3][$SETVAR1=["..WhichOne.."]".."]", 0 )	-- 你把 OO 裝進垃圾袋裡
		ScriptMessage( od, od, 0,"[SC_424249_3][$SETVAR1=["..WhichOne.."]".."]", 0 )
		SetFlag( od ,  MomTable[WhichOne] , 1)
		BeginPlot( od , "LuaS_424249_CheckFlags" , 0)
		return 1
	end
end
----------------------------判斷所有垃圾都檢完後發動--------------------------------
function LuaS_424249_CheckFlags()
	local od = OwnerID()
	local DoneFlag = 545156

	if	CheckFlag( od , 545150 )== true	and
		CheckFlag( od , 545151 )== true and
		CheckFlag( od , 545152 )== true and
		CheckFlag( od , 545153 )== true and
		CheckFlag( od , 545154 )== true	then
		if	CheckFlag( od , DoneFlag) == TRUE	then
			ScriptMessage( od , od , 1 , "[SC_424249_2]" , 0 )		--你把周遭的垃圾清理完了，向阿赫利婭‧內梅西奧回報
			ScriptMessage( od , od , 0 , "[SC_424249_2]" , 0 )
			SetFlag( od , DoneFlag , 1 )
		else	ScriptMessage( od , od , 1 , "[SC_424249_2]" , 0 )
			ScriptMessage( od , od , 0 , "[SC_424249_2]" , 0 )
			SetFlag( od , DoneFlag , 1 )
		end
	end
end

---------------巴蒂斯塔‧阿吉雷部分
function luaS_424241_0()
	local player = OwnerID()
	local creatrue = TargetID()

	if	CheckAcceptQuest( player , 424240 ) == TRUE	and
		CheckFlag( player , 545055 ) == FALSE	and
		CheckFlag( player , 545058 ) == FALSE	then
		SetSpeakDetail( player,"[SC_424241_2]")
		AddSpeakOption( player , creatrue , "[SC_424241_3]" , "luaS_424241_3" , 0)
	end
	LoadQuestOption( player )
end


function luaS_424241_3()
	local creatrue2 = TargetID()
	local od = OwnerID()

	SetSpeakDetail( od , "[SC_424241_4]" )
	SetFlag( od , 545055 , 1 )
	AddSpeakOption( od , creatrue2 , "[SC_424241_5]" , "luaS_424241_4" , 0)
end

function luaS_424241_4()
	local creatrue2 = TargetID()
	local od = OwnerID()

	SetSpeakDetail( od , "[SC_424241_6]" )
	SetFlag ( od , 545055 , 1)
	AddSpeakOption( od ,creatrue2 , "[SC_424241_7]" , "LuaS_424236_quit" , 0)
end

--埃德爾米羅‧阿吉雷部分
function luaS_424242_0()
	local od = OwnerID()
	local td = TargetID()

	if	CheckAcceptQuest( od , 424241) == TRUE	and
		CheckFlag ( od , 545057 ) == FALSE	and
		CountBodyItem ( od , 209595 ) == 1 	then
		AddSpeakOption( od , td , "[SC_424242_2]" , "LuaS_424242_1" , 0 )
	end
	LoadQuestOption( od )
end

function LuaS_424242_1()
	local od = OwnerID()
	local td = TargetID()

	SetSpeakDetail ( od , "[SC_424242_0]")
	AddSpeakOption( od , td , "[SC_424242_1]" , "luaS_424242_flag" , 0 )
end

function luaS_424242_flag()
	local od = OwnerID()

	SetFlag( od , 545057 , 1 )
	SetFlag( od , 545093 , 1 )
	DelBodyItem ( od , 209595 , 1 )
	CloseSpeak( od )
end

function luaS_424242_compeleted()
	SetFlag ( TargetID() , 545058 , 1)
end

--真理之手是烏龜熱愛組織
---文件群
function LuaI_424243_01()
	CallPlot ( OwnerID() , "LuaI_424243_data" , "[SC_424243_DATA01]" )
end

function LuaI_424243_02()
	CallPlot ( OwnerID() , "LuaI_424243_data" , "[SC_424243_DATA02]" )
end

function LuaI_424243_03()
	CallPlot ( OwnerID() , "LuaI_424243_data" , "[SC_424243_DATA03]" )
end

function LuaI_424243_04()
	CallPlot ( OwnerID() , "LuaI_424243_data" , "[SC_424243_DATA04]" )
end

function LuaI_424243_data( dataID )
	local od = OwnerID()

	ClearBorder( od )
	AddBorderPage( od, dataID )
	ShowBorder( od, 0, "[SC_424243_TLTTLE]", "ScriptBorder_Texture_Paper" )
end
---文件群結束

function LuaS_424242_AfterClick()	-- Touch劇情
	local td = TargetID()
	local od = OwnerID()
	local MomTable = {	[118285] = 240001 ,		---- 文件堆table
				[118527] = 240002 ,
				[118528] = 240003 ,
				[118529] = 240004 ,	}
	local WhichOne = ReadRoleValue( td , EM_RoleValue_OrgID )
----------------------------判斷Click哪個物件並給予相對應的文件---------------------
	if	CountBodyItem( od ,  MomTable[WhichOne] ) > 0	then
		ScriptMessage( od, od, 1,"[SC_424243_02]" , 0 )
		ScriptMessage( od, od, 0,"[SC_424243_02]" , 0 )
		beginPlot( od , "LuaS_424242_DoneCheck" , 10 )
		--這個文件堆裡找不到其他還有辦法讀懂的文件了	

	elseif	CountBodyItem( od ,  MomTable[WhichOne] ) < 1	then
		ScriptMessage( od, od, 1,"[SC_424243_00][$SETVAR1=["..WhichOne.."]][$SETVAR2=["..MomTable[WhichOne].."]]" , 0 )
		ScriptMessage( od, od, 0,"[SC_424243_00][$SETVAR1=["..WhichOne.."]][$SETVAR2=["..MomTable[WhichOne].."]]" , 0 )
		GiveBodyItem( od ,  MomTable[WhichOne] , 1)
		beginPlot( od , "LuaS_424242_DoneCheck" , 10 )
		return 1
		--你在這個 "文件堆" 裡找到 OO
	end
end

function LuaS_424242_DoneCheck()
	local DoneFlag = 545144
	local od = OwnerID()
----------------------------判斷所有文件都檢完後發動--------------------------------
	if	CountBodyItem( od , 240001 )> 0	and
		CountBodyItem( od , 240002 )> 0	and
		CountBodyItem( od , 240003 )> 0	and
		CountBodyItem( od , 240004 )> 0	then

		if	CheckFlag( od , DoneFlag) == TRUE	then

			ScriptMessage( od , od , 1 , "[SC_424243_03]" , 0 )		--從門口傳來摩瑞克的聲音
			ScriptMessage( od , od , 0 , "[SC_424243_03]" , 0 )
			SetFlag( od , DoneFlag , 1 )

		else	ScriptMessage( od , od , 1 , "[SC_424243_03]" , 0 )
			ScriptMessage( od , od , 0 , "[SC_424243_03]" , 0 )
			SetFlag( od , DoneFlag , 1 )
		end
	end
end


function LuaS_424243_end()
	local Morick = OwnerID()
	local Player = TargetID()

	setFlag( Player , 545056 , 1)
	BeginPlot( Morick , "LuaS_424244_born", 0 )
end

function LuaS_424244_born()
	local Morick = OwnerID()
	local Morick2

	say ( Morick , "[SC_424244_01]" )			--光看這些文件根本毫無頭緒，還是進去找找看有沒有別的線索好了
	Morick2 = Lua_DW_CreateObj ( "obj" , 118489 , Morick , 1, 1 )

	Sleep (20)
	say ( Morick2 , "[SC_424244_02]" )			--你先去忙其他的事，如果我這邊有什麼進展會再和你聯絡。
	DW_MoveToFlag( Morick2 , 780949 , 2 , 0 , 1 )


	DelObj(Morick2)

	WriteRoleValue( Morick, EM_RoleValue_Register1, 0 )
end

Function LuaS_Thiefting()
	local Morick = OwnerID()
	local DialogTable = {	[1] = "[SC_424244_03]" ,	--還是只找得到蟑螂之類的蟲子......
				[2] = "[SC_424244_04]" ,	--怎麼這文件又提到烏龜？
				[3] = "[SC_424244_05]" ,	--可惡，只留下一堆垃圾，沒半點有用的線索。
				[4] = "[SC_424244_06]"	}	--到底烏龜是指什麼？為什麼這麼多文件裡都有烏龜的字眼......
	local DialogID = Rand(4)+1

	PlayMotionEX( Morick , ruFUSION_ACTORSTATE_CRAFTING_BEGIN,ruFUSION_ACTORSTATE_CRAFTING_LOOP)
	say( Morick , DialogTable[DialogID] )
	sleep(30)
end

-----救傷兵118585
function LuaS_424350_flag()
	local player = TargetID()
	if	CheckCompleteQuest( player , 425351 ) == TRUE	then
		SetFlag(player , 545201 , 1)
	end
	if	CheckCompleteQuest( player , 424357 ) == TRUE	then
		SetFlag(player , 545202, 1)
	end
	SetFlag(player , 545167 , 1)
end


function LuaS_118585()
	local player = OwnerID()
	local feifei = TargetID()

	if	CheckCompleteQuest( player , 424352 ) == FALSE	and
		CheckCompleteQuest( player , 424354 ) == TRUE	and
		CountBodyItem( player , 240009 ) <5		then
		AddSpeakOption( player , feifei , "[SC_118585_0][240009]" , "LuaS_118585_0" , 0 )

	elseif	CheckCompleteQuest( player , 424352 ) == FALSE	and
		CheckCompleteQuest( player , 424355 ) == TRUE	and
		CountBodyItem( player , 240008 ) <1		then
		AddSpeakOption( player , feifei , "[SC_118585_0][240008]" , "LuaS_118585_1" , 0  )

	elseif	CheckCompleteQuest( player , 424352 ) == FALSE	and
		CheckCompleteQuest( player , 424356 ) == TRUE	and
		CountBodyItem( player , 240018 ) <1		then
		AddSpeakOption( player , feifei , "[SC_118585_0][240018]" , "LuaS_118585_2" , 0 )

	elseif	CheckCompleteQuest( player , 424408 ) == FALSE	and
		CheckCompleteQuest( player , 424410 ) == TRUE	and
		CountBodyItem( player , 240009 ) <5		then
		AddSpeakOption( player , feifei , "[SC_118585_0][240009]" , "LuaS_118585_0" , 0 )
	end
	LoadQuestOption( player )
end

function LuaS_118585_0()
	local player = OwnerID()

	SetSpeakDetail( player , "[SC_118585_1]" ) -- 真拿你沒辦法，這次不要再弄丟了喔！
	GiveBodyItem( player , 240009 , 5 )
end

function LuaS_118585_1()
	local player = OwnerID()

	SetSpeakDetail( player , "[SC_118585_1]" )
	GiveBodyItem( player , 240008 , 1 )
end

function LuaS_118585_2()
	local player = OwnerID()

	SetSpeakDetail( player , "[SC_118585_1]" )
	GiveBodyItem( player , 240018 , 1 )
end
-----------------------------------------------------------
function LuaS_118581()
	local player = OwnerID()
	local Nei = TargetID()

	if	CheckCompleteQuest( player , 424351 ) == FALSE	and
		CheckCompleteQuest( player , 424352 ) == TRUE	and
		CountBodyItem( player , 240010 ) <2		then
		AddSpeakOption( player , Nei , "[SC_118585_0][240010]" , "LuaS_118581_0" , 0 )
	end
	LoadQuestOption(player)
end

function LuaS_118581_0()
	local player = OwnerID()

	SetSpeakDetail( player , "[SC_118585_1]" )
	GiveBodyItem( player , 240010 , 2 )
end
-----------------------------------------------------------
function LuaS_118596()
	local player = OwnerID()
	local bopuraisa = TargetID()

	if	CheckCompleteQuest( player , 424357 ) == FALSE	and
		CheckCompleteQuest( player , 424358 ) == TRUE	and
		CountBodyItem( player , 240017 ) <2		then
		AddSpeakOption( player , bopuraisa , "[SC_118585_0][240017]" , "LuaS_118596_0" , 0 )
	end
	LoadQuestOption(player)
end

function LuaS_118597()
	local player = OwnerID()
	local forio = TargetID()

	if	CheckCompleteQuest( player , 424358 ) == FALSE	and
		CheckCompleteQuest( player , 424359 ) == TRUE	and
		CountBodyItem( player , 240016 ) <1		then
		AddSpeakOption( player , forio , "[SC_118585_0][240016]" , "LuaS_118597_0" , 0 )
	end
	LoadQuestOption(player)
end

function LuaS_118596_0()
	local player = OwnerID()

	SetSpeakDetail( player , "[SC_118596]" ) --  這次不要再弄丟了！
	GiveBodyItem( player , 240017 , 2 )
end

function LuaS_118597_0()
	local player = OwnerID()

	SetSpeakDetail( player , "[SC_118596]" )
	GiveBodyItem( player , 240016 , 1 )
end
-----------------------------------------------------------

function LuaS_424351_touch( wichone , itemID )
	local od = OwnerID()
	local hurted = TargetID()
	local cured

	DW_QietKillOne ( 0 , wichone )
	DelBodyItem ( od , itemID , 1 )
	cured = Lua_DW_CreateObj( "obj" , ReadRoleValue ( hurted , EM_RoleValue_OrgID ) +2 , hurted , 1 , 1 )
	CallPlot( cured , "LuaS_424351_cured", od )
	return 1
end

function LuaS_424351_check( itemID )
	local od = OwnerID()

	if	CountBodyItem ( od , itemID ) == 0	then
		ScriptMessage ( od , od , 0 , "[SC_424351_0]" , 0 )
		ScriptMessage ( od , od , 1 , "[SC_424351_0]" , 0 )
		return -1
	end
	return 1
end

function LuaS_424351_cured( od )
	local cured = OwnerID()
	MoveToFlagEnabled ( cured , false)
	sleep(15)
	AdjustFaceDir ( cured , od , 0)
	Say ( cured , "[SC_423020_0]" )
	Sleep(85)
	DelObj(cured)
end

function LuaS_424365_accept()
	local player = TargetID()

	if	CheckCompleteQuest( player , 424366 ) == TRUE	then
		SetFlag ( player , 544579 , 1 )
	end

	if	CheckCompleteQuest( player , 424367 ) == TRUE	then
		SetFlag ( player , 544580 , 1 )
	end
	     
	if	CheckCompleteQuest( player , 424368 ) == TRUE	then
		SetFlag ( player , 544581 , 1 )
	end
end

function LuaS_424408_accept()
	local player = TargetID()

	if	CheckCompleteQuest( player , 424409 ) == TRUE	then
		SetFlag ( player , 545223 , 1 )
	end

	if	CheckCompleteQuest( player , 424410 ) == TRUE	then
		SetFlag ( player , 545224 , 1 )
	end
	     
	if	CheckCompleteQuest( player , 424411 ) == TRUE	then
		SetFlag ( player , 545225 , 1 )
	end
end

function LuaS_424350_accept()
	local player = TargetID()

	if	CheckCompleteQuest( player , 424351 ) == TRUE	then
		SetFlag ( player , 545201 , 1 )
	end

	if	CheckCompleteQuest( player , 424357 ) == TRUE	then
		SetFlag ( player , 545202 , 1 )
	end
end

function LuaS_424351_accept()
	SetFlag ( TargetID() , 545169 , 1 )
end

function LuaS_424351_end()
	SetFlag ( TargetID() , 545201 , 1 )
end

function LuaS_424357_accept()
	SetFlag ( TargetID() , 545170 , 1 )
end


function LuaS_424357_end()
	SetFlag ( TargetID() , 545202 , 1 )
end


function LuaS_424397_AfterClick()	-- Touch劇情
	local td = TargetID()
	local od = OwnerID()
	local MomTable = {	[118285] = 240001 ,		---- 文件堆table
				[118528] = 240003 ,
				[118529] = 240004 ,	}
	local WhichOne = ReadRoleValue( td , EM_RoleValue_OrgID )
----------------------------判斷Click哪個物件並給予相對應的文件---------------------
	if	CountBodyItem( od ,  MomTable[WhichOne] ) > 0	then
		ScriptMessage( od, od, 1,"[SC_424243_02]" , 0 )
		ScriptMessage( od, od, 0,"[SC_424243_02]" , 0 )
		--這個文件堆裡找不到其他還有辦法讀懂的文件了	

	elseif	CountBodyItem( od ,  MomTable[WhichOne] ) < 1	then
		ScriptMessage( od, od, 1,"[SC_424243_00] ["..WhichOne.."] [SC_424243_01] ["..MomTable[WhichOne].."]" , 0 )
		ScriptMessage( od, od, 0,"[SC_424243_00] ["..WhichOne.."] [SC_424243_01] ["..MomTable[WhichOne].."]" , 0 )
		GiveBodyItem( od ,  MomTable[WhichOne] , 1)
		return 1
		--你在這個 "文件堆" 裡找到 OO
	end
end

--------------扁商人任務
------------------開扁前
function LuaS_424247_0()
	local od = OwnerID()
	local td = TargetID()

	if	CheckAcceptQuest( od , 424247 ) == true			and		----如果有接任務且
		CheckFlag( od , 544780 ) == false			and		----沒有得到談判完的flag、且
		ReadRoleValue( od , EM_RoleValue_IsAttackMode )==0	then		----商人NPC並未做出攻擊動作，則

		if	ReadRoleValue( TD, EM_RoleValue_Register1 ) == 1 then
			ScriptMessage ( od , od , 0 , "[SC_422804]" , 0 )
			ScriptMessage ( od , od , 1 , "[SC_422804]" , 0 )
			return -1
		else
			AddSpeakOption( od , td , "[SC_424247_0]" , "LuaS_424247_1" , 0 )	----增加對話選項：(動手扁他！)
		end
	end

	LoadQuestOption ( od )
end

----------------準備開扁


function LuaS_424247_1()
	local od = OwnerID()
	local td = TargetID()
	local NewOne

	CloseSpeak( od )	
	AddBuff( od , 620376 , 1 , -1)						---金托斯換人clinet用buff
	WriteRoleValue( td, EM_RoleValue_Register1, 1 )

	NewOne = Lua_DW_CreateObj( "obj", 118471 , td , 1 , 1)			----在原地種出新的商人沙包
	SetModeEx( NewOne , EM_SetModeType_Strikback , false)				----不反擊、不移動
	SetModeEx( NewOne , EM_SetModeType_Move , false) 
	SetPlot( NewOne , "dead","LuaS_424247_undead" , 0 )				----沙包不死術
	AddBuff( NewOne , 507210 , 0 , -1 )

	CallPlot( NewOne , "LuaS_424247_end" , td  , od)
	Say( NewOne , "[SC_424247_1]" )							----商人沙包：你想做什麼！？
end


-----------以下為掛在棍子下
-----判斷棍子能不能扁人
function LuaI_424247_0()
	local od = OwnerID()
	local td = TargetID()

	if	CheckAcceptQuest( td , 424247 ) == FALSE	and
		CheckFlag( td , 544780 ) == TRUE		then
		ScriptMessage( od , od , 0 , "[SC_424247_5]" , 0 )	----你不需要拿棍子打人
		ScriptMessage( od , od , 1 , "[SC_424247_5]" , 0 )	----你不需要拿棍子打人
		return false
	end

	if	ReadRoleValue( td , EM_RoleValue_OrgID ) ~= 118471	then
		ScriptMessage( od , od , 0 , "[SC_424247_6]" , 0 )	----你不能隨便亂打人
		ScriptMessage( od , od , 1 , "[SC_424247_6]" , 0 )	----你不能隨便亂打人
		return false
	end

	if	GetDistance( od , td ) > 50	then
		ScriptMessage( od , od , 0 , "[SC_424247_7]" , 0 )	----你的棍子不夠長，打不到
		ScriptMessage( od , od , 1 , "[SC_424247_7]" , 0 )	----你的棍子不夠長，打不到
		return false
	end

	if	ReadRoleValue( td , EM_RoleValue_Register ) > 0	then
		ScriptMessage( od , od , 0 , "[SC_424247_7]" , 0 )	----你的棍子不夠長，打不到
		ScriptMessage( od , od , 1 , "[SC_424247_7]" , 0 )	----你的棍子不夠長，打不到
		return false
	end

	return true
end


-----------檢查開扁次數 (check again)
function LuaI_424247_1()
	local BuffPos
	local BuffCount
	local td = TargetID()

	AddBuff( td , 509106 , 0 , 10 )								--上buff、有效時間為10秒
	BuffPos = Lua_BuffPosSearch( td , 509106 )						--令BuffPos為檢查對象身上是否有Buff

	if	BuffPos~=-1	then								--如果沒有這個Buff則
		BuffCount = BuffInfo( td , BuffPos , EM_BuffInfoType_Power )			--開始檢查此對象身上堆疊了多少此Buff
----------開扁第四次
		if	BuffCount > 5		then
			SetFlag( OwnerID() , 544780 , 1 )					--給予扁人flag
			PlayMotion( td , ruFUSION_ACTORSTATE_EMOTE_SURRENDER )			
			PlayMotion( td , ruFUSION_ACTORSTATE_EMOTE_BEG )
			Say( td, "[SC_424247_8]" )						----商人沙包：我降價就是了，別再打了！！
			return
		end
----------開扁第三次
		if	BuffCount > 3		then
			Say( td , "[SC_424247_4]" )						--商人沙包：好痛，怎麼大家都在旁邊看著、不來阻止他！？
			return
		end
----------開扁第二次
		if	BuffCount > 1		then
			Say( td , "[SC_424247_3]" )						--商人沙包：噢嗚！別打我的臉，我靠臉吃飯的啊！
			return
		end
----------開扁第一次
		if	BuffCount >= 0		then
			Say( td , "[SC_424247_2]" )						--商人沙包：你居然真的打我！？
			return
		end
------開扁結束，收攤
	end
end
---------------以上為掛在棍子下


-----沙包扁爽爽、沙包退場
function LuaS_424247_end( OldOne , player)

	sleep(100)
	DelObj( OwnerID() )
	CancelBuff( player , 620376)						---取消金托斯換人clinet用buff
	WriteRoleValue( OldOne , EM_RoleValue_Register1, 0 )
end

----沙包不死術(當沙包死亡時啟動此plot)
function LuaS_424247_undead()
	WriteRoleValue(OwnerID(),EM_RoleValue_HP,ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP))
	return false
end

----------任務結束、給予談判flag
function LuaS_424247_completed()
	local Player = TargetID()
	SetFlag( Player , 545071 , 1 )
end

function LuaS_424246_accpet()
	local Player = TargetID()
	if	CheckCompleteQuest( Player , 424247) == TRUE	then
		SetFlag( Player , 545071 , 1 )
	end

end

-----------------------------
---------------扁商人任務結束

---------------------鹽巴分發
Function LuaS_424248_118289()
	Local od = OwnerID()
	local td = TargetID()

	If	CheckAcceptQuest ( od , 424349 ) == TRUE	and
		CheckFlag( od , 545045 ) == FALSE		and
		CountBodyItem ( od , 209596 ) > 0		Then
		AddSpeakOption ( od , td , "[SC_424248_3]" , "LuaS_424248_04" , 0 )

	elseif	CheckAcceptQuest ( od , 424248 ) == TRUE	And
		CheckFlag( od , 545045 ) == FALSE		and
		CountBodyItem ( od , 209596 ) > 0		Then
		AddSpeakOption ( od , td , "[SC_424248_3]" , "LuaS_424248_04" , 0 )
	End
	LoadQuestOption(od)
End

Function LuaS_424248_118291()
	Local od = OwnerID()
	local td = TargetID()

	If	CheckAcceptQuest ( od , 424349 ) == TRUE	and
		CheckFlag( od , 545061 ) == FALSE		and
		CountBodyItem ( od , 209596 ) > 0		Then
		AddSpeakOption ( od , td , "[SC_424248_3]" , "LuaS_424248_05" , 0 )

	elseif	CheckAcceptQuest ( od , 424248 ) == TRUE	And
		CheckFlag( od , 545061 ) == FALSE		and
		CountBodyItem ( od , 209596 ) > 0		Then
		AddSpeakOption ( od , td , "[SC_424248_3]" , "LuaS_424248_05" , 0 )
	End
	LoadQuestOption(od)
End

Function LuaS_424248_118293()
	Local od = OwnerID()
	local td = TargetID()

	If	CheckAcceptQuest ( od , 424349 ) == TRUE	and
		CheckFlag( od , 545062 ) == FALSE		and
		CountBodyItem ( od , 209597 ) > 0		Then
		AddSpeakOption ( od , td , "[SC_424248_3]" , "LuaS_424248_06" , 0 )

	elseif	CheckAcceptQuest ( od , 424248 ) == TRUE	And
		CheckFlag( od , 545062 ) == FALSE		and
		CountBodyItem ( od , 209597 ) > 0		Then
		AddSpeakOption ( od , td , "[SC_424248_3]" , "LuaS_424248_06" , 0 )

	End
	LoadQuestOption(od)
End

function LuaS_424248_04()
	Local od = OwnerID()

	DelBodyItem ( od , 209596 , 1 )
	SetSpeakDetail ( od , "[SC_424248_0]" )
	BeginPlot( od , "LuaS_424248_Flag" , 0 )
	SetFlag ( od , 545045 , 1 )
end

function LuaS_424248_05()
	Local od = OwnerID()

	delBodyItem ( od , 209596 , 1 )
	SetSpeakDetail ( od , "[SC_424248_1]" )
	BeginPlot( od , "LuaS_424248_Flag" , 0 )
	SetFlag ( od , 545061 , 1 )
end

function LuaS_424248_06()
	Local od = OwnerID()
	DelBodyItem ( od , 209597 , 1 )
	SetSpeakDetail ( od , "[SC_424248_2]" )
	BeginPlot( od , "LuaS_424248_Flag" , 0 )
	SetFlag ( od , 545062 , 1 )
end


Function LuaS_424248_Flag()
	Local od = OwnerID()

	if	CheckFlag( od , 545045 ) == TRUE		and
		CheckFlag( od , 545061 ) == TRUE		and
		CheckFlag( od , 545062 ) == TRUE		then
		SetFlag( od , 545094 , 1)
	end
end

function LuaS_424248_end()
	local td = TargetID()
	SetFlag ( td , 545045 , 0 )
	SetFlag ( td , 545061 , 0 )
	SetFlag ( td , 545062 , 0 )
end


-------------送鹽名單
function LuaI_240221()
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), "[SC_424248_SALT]")
	ShowBorder( OwnerID(), 0, "[SC_424248_TLTTLE]", "ScriptBorder_Texture_Paper" )
end

function LuaS_424358_flag()
	SetFlag( TargetID() , 545168 , 1)
end

------多里斯料理
function LuaS_424408_flag()
	SetFlag ( TargetID() , 545226 , 1)
end

function LuaS_424408_00()
	SetFlag ( TargetID() , 545223 , 1 )
end

function LuaS_424408_01()
	SetFlag ( TargetID() , 545224 , 1 )
end

function LuaS_424408_02()
	SetFlag ( TargetID() , 545225 , 1 )
end

function LuaS_424408_end()
	SetFlag ( TargetID() , 545229 , 1 )
end
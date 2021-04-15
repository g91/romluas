--422972完成任務後	旗子：780481	1-3

function LuaS_422972_Complete()
	if (CheckCompleteQuest(TargetID(),422971)==true )and( CheckCompleteQuest( TargetID(),422972)==true ) 	then
		if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) > 0 then		--設定成場上有NPC就不再種
			return
		end
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 2 )
		local BEDI = Lua_DW_CreateObj("flag",114501 ,780481,1 )
		MoveToFlagEnabled(BEDI , false )
		WriteRoleValue( BEDI ,EM_RoleValue_IsWalk , 1 )
		sleep(20)
		LuaFunc_MoveToFlag( BEDI,780481,2,0)
		PlayMotion( BEDI, ruFUSION_ACTORSTATE_DAZED_BEGIN)	--做表現蹣跚、疲累的動作
		sleep(10)
		PlayMotion( BEDI, ruFUSION_ACTORSTATE_DAZED_END)	--做表現蹣跚、疲累的動作
		LuaFunc_MoveToFlag( BEDI,780481,3,0)	
		PlayMotion(  BEDI, ruFUSION_ACTORSTATE_HURT_CRITICAL )
		sleep( 10 )
		PlayMotion( BEDI, ruFUSION_ACTORSTATE_DAZED_BEGIN)	--做表現蹣跚、疲累的動作
		sleep(20)
		PlayMotion( BEDI, ruFUSION_ACTORSTATE_DAZED_END)
				--PlayMotion( BEDI ,ruFUSION_ACTORSTATE_EMOTE_CRY)
				--PlayMotion( BEDI ,ruFUSION_ACTORSTATE_EMOTE_DRINK)
		
				--PlayMotion( BEDI, ruFUSION_ACTORSTATE_DAZED_END)
		
				--PlayMotion( BEDI , ruFUSION_ACTORSTATE_DAZED_END)
				--sleep(10)
		SetDefIdleMotion(BEDI ,ruFUSION_MIME_IDLE_SIT)	--持續跪坐在地
				--SetDefIdleMotion(BEDI ,ruFUSION_MIME_CROUCH_BEGIN)
				--SetDefIdleMotion(BEDI ,ruFUSION_MIME_READING_BEGIN)
				--SetDefIdleMotion(BEDI ,ruFUSION_MIME_DEATH_DOWN)
		sleep( 10 )
		AdjustFaceDir( OwnerID(),BEDI  , 0 )
		Yell( OwnerID() , "[SC_422972_99]" , 3 )				--啊？有一名女性跪倒在地上！
		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_POINT)	--指點動作
		SetFlag( TargetID() , 543693, 1 )
		Delobj( BEDI )
		sleep( 20 )
		AdjustFaceDir( OwnerID(),TargetID(), 0 )
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)		--動作
		Yell( OwnerID() , "[SC_422972_98]" , 3 )				--你去關心一下人家～這也是身為騎士…
		sleep( 20 )
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)	--動作
		Yell( OwnerID() , "[SC_422972_97]" , 3 )				--不、不、不，是身為一個愛與正義的使者應該要做的事情！
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
		sleep(20)
		AdjustFaceDir( OwnerID(),BEDI  , 0 )
		sleep( 20 )	
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
	end
end

function LuaS_114527_99()	--貝蒂的初始劇情
	--LuaP_Crouch()
	--LuaP_Crafting
	LuaP_Sitting()
end

--放在114510凱的對話劇情
function LuaS_114510_99()
	LoadQuestOption( OwnerID() )
	if (CheckCompleteQuest(TargetID(),422971)==true )and( CheckCompleteQuest( TargetID(),422972)==true ) 	then
		if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) > 0 then		--設定成場上有NPC就不再種
			ScriptMessage( OwnerID()   ,  OwnerID()   , 0 , "[SAY_NPC_BUSY]" , 0 )
		--	return
		end
	end
		if ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 ) > 0 then	--設定成場上有NPC就不再種
			ScriptMessage( OwnerID()   ,  OwnerID()   , 0 , "[SAY_NPC_BUSY]" , 0 )
		--return
	end
	
end

--422973
function LuaS_422973()
	LoadQuestOption( OwnerID() )
	if	(CheckAcceptQuest(OwnerID(),422973)==true )and( CheckCompleteQuest( OwnerID(),422973)==false)	and
		(Checkflag(OwnerID(),543692)==false) 		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422973_0]","LuaS_422973_1",0) --妳還好嗎？還站得起來嗎？
	end	
end

function LuaS_422973_1()
	SetSpeakDetail(OwnerID(),"[SC_422973_1]")				--…別管我…已經不需要了…這身盔甲…你是騎士團的人吧？			
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422973_2]","LuaS_422973_2",0)--別擔心，現在有我們在。
end

function LuaS_422973_2()
	SetSpeakDetail(OwnerID(),"[SC_422973_3]")				--…有你們在？
	SetFlag( OwnerID() , 543692, 1 )					--給旗標
end

--422973完成任務後	旗子：780481 9、10
function LuaS_422973_Complete()
	if CheckID( TargetID() ) == true then				--參考505457--有BUFF看得見演戲--原本的CLIENT
		AddBuff( TargetID() , 506214, 0 , 20 )
	end
	
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 ) > 0 then	--設定成場上有NPC就不再種
		return
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 2 )
	local KKINS = Lua_DW_CreateObj("flag",114526 ,780481,9 )
	MoveToFlagEnabled(KKINS , false )
	WriteRoleValue( KKINS ,EM_RoleValue_IsWalk , 1 )
	sleep(20)
	LuaFunc_MoveToFlag( KKINS,780481,10,0)
	PlayMotion( KKINS, ruFUSION_ACTORSTATE_CROUCH_BEGIN)--蹲下動作
	sleep(20)
	SetFlag( TargetID() , 543694, 1 )
	PlayMotion( KKINS, ruFUSION_ACTORSTATE_CROUCH_END)
	sleep(20)
	LuaFunc_MoveToFlag( KKINS,780481,11,0)
	Delobj( KKINS )
	CancelBuff( TargetID()  , 506214) 	
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 0 )
end

--阿凱的出生劇情：
function LuaS_114529()
	local BEDI = CreateObjByFlag( 114528 , 780510 , 1 , 1 )	 	
	AddToPartition(  BEDI , 0 )
	DisableQuest( BEDI , true )					--關閉對話
	MoveToFlagEnabled(BEDI , false )				--關閉巡邏
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+3,BEDI )	--將貝蒂寫進阿凱裡
end

--422975 更重要的事！ 接受任務後執行	旗子：780510	1-3

function LuaS_422975()		--到時候跟422974合併
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422975)==true )and( CheckCompleteQuest( OwnerID(),422975)==false)	and	(Checkflag(OwnerID(),543695)==false) 	then
		if (ReadRoleValue( TargetID() , EM_RoleValue_Register+2 )  == 0)	 then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422975_99]","LuaS_422975_2",0) --老師？不是要去致歉？
		else
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422975_99]","LuaS_422975_1",0) --老師？不是要去致歉？
		end	
	end
	if CheckAcceptQuest( OwnerID() , 422974 ) == true then
		AddSpeakOption(  OwnerID(), TargetID(),"[SC_422974_0]" ,  "LuaS_114510_1",  0 );  --我準備好了。
	end
end

function LuaS_422975_1()
	SetSpeakDetail(OwnerID(),"[SC_422975_98]")					--對！但要等等～現在過去會打擾人家母子團聚～
										--我們怎麼可以做出破壞「愛」的行動！
end

function LuaS_422975_2()
	CloseSpeak( OwnerID() )
	BeginPlot(TargetID()  , "LuaS_422975_4" , 0 )
end

function LuaS_422975_4()			--可插入檢查
	AddBuff( TargetID()  , 506213, 1 , 60 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 , 2 )			--OwnerID是凱、TargetID是玩家
	local BEDI = ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 )
	MoveToFlagEnabled(BEDI , false )
	local WW = Lua_DW_CreateObj("flag",114502 ,780510,2 )
	MoveToFlagEnabled(WW , false )
	local KK = Lua_DW_CreateObj("flag",114503,780510,3 )
	MoveToFlagEnabled(KK , false )
	WriteRoleValue( KK ,EM_RoleValue_IsWalk , 1 )
	sleep(20)
	Yell( KK , "[SC_422975_97]" , 3 )				--對，我們過去吧～
	AdjustFaceDir( KK,BEDI, 0 )
	sleep(10)
	--LuaFunc_MoveToFlag( KK,780510,4,0)
	BeginPlot(KK   , "LuaS_422975_3" , 0 )
	sleep(60)
	AdjustFaceDir( KK ,BEDI  , 0 )
	Yell( KK , "[SC_422975_0]" , 3 )					--貝蒂．愛倫女士…
	sleep(20)	
	AdjustFaceDir( BEDI ,KK , 0 )	
	--插入檢查
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),422975)==false) 	then--TargetID() 是玩家
		DelObj(KK )	--刪除演戲凱
		DelObj(WW )	--刪除演戲威利
		CancelBuff( TargetID()  , 506213) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 , 0 )
		return
	end						
	Yell( BEDI , "[SC_422975_1]" , 3 )					--…謝謝你們救回我的兒子。
	PlayMotion( BEDI ,ruFUSION_ACTORSTATE_EMOTE_CUTE2)	--貝蒂向阿凱鞠躬
	sleep(20)
	Yell( KK , "[SC_422975_2]" , 3 )					--是我失職了，沒有在你們最需要援手的時候出現，我正式向妳道歉。
	PlayMotion( KK ,ruFUSION_ACTORSTATE_EMOTE_SALUTE2)  	--阿凱向貝蒂鞠躬(做出emote_cute02或emote_salute02動作)
	sleep(20)
	Yell( BEDI , "[SAY_110329_0]" , 3 )					--......
	sleep(20)
	SetDefIdleMotion(KK ,ruFUSION_MIME_EMOTE_SPEAK)
	Yell( KK , "[SC_422975_3]" , 3 )					--獅心騎士團成員歷經幾次戰亂犧牲，沒有保護到所有人民，這是我們的過失。
	sleep(30)
	SetDefIdleMotion(KK ,ruFUSION_MIME_EMOTE_SPEAK)
	Yell( KK , "[SC_422975_4]" , 3 )					--我正在積極尋找適合人才培養、訓練，對我們來說，所有人民都應該被保護，不是只有達拉尼斯城裡的。
	SetDefIdleMotion(KK ,ruFUSION_MIME_NONE)
	sleep(30)
	--插入檢查
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),422975)==false) 	then--TargetID() 是玩家
		DelObj(KK )	--刪除演戲凱
		DelObj(WW )	--刪除演戲威利
		CancelBuff( TargetID()  , 506213) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 , 0 )
		return
	end	
	PlayMotion( BEDI ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( BEDI , "[SC_422975_5]" , 3 )					--我…我可以信任你們嗎？
	sleep(20)
	PlayMotion( KK ,ruFUSION_ACTORSTATE_EMOTE_SALUTE2)
	Yell( KK , "[SC_422975_6]" , 3 )					--如果妳願意，這將是我們的榮幸。
	sleep(20)
	--SetDefIdleMotion(KK ,ruFUSION_MIME_EMOTE_SPEAK)
	PlayMotion( KK ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( KK , "[SC_422975_7]" , 3 )					--未來～在人王與大將軍的帶領下，獅心騎士團會傾盡全力為薩維爾大陸回復和平盛世，
	--插入檢查
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),422975)==false) 	then	--TargetID() 是玩家
		DelObj(KK )	--刪除演戲凱
		DelObj(WW )	--刪除演戲威利
		CancelBuff( TargetID()  , 506213) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 , 0 )
		return
	end
	sleep(50)
	PlayMotion( KK ,ruFUSION_ACTORSTATE_BUFF_SP01)
	Yell( KK , "[SC_422975_8]" , 3 )					--我們以毅力及時間證明我們的承諾！
	SetDefIdleMotion(KK ,ruFUSION_MIME_IDLE_STAND)
	sleep(20)
	PlayMotion( BEDI ,ruFUSION_ACTORSTATE_EMOTE_IDLE0)
	sleep(10)
	ScriptMessage( TargetID()   ,  TargetID()   , 1 , "[SC_422975_14]" , 0 )		 --貝蒂終於放鬆緊繃情緒，輕吁一口氣…
	ScriptMessage( TargetID()   ,  TargetID()   , 0 , "[SC_422975_14]" , 0 ) 
	sleep(20)
	--插入檢查
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),422975)==false) 	then--TargetID() 是玩家
		DelObj(KK )	--刪除演戲凱
		DelObj(WW )	--刪除演戲威利
		CancelBuff( TargetID()  , 506213) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 , 0 )
		return
	end
	SetDefIdleMotion(BEDI ,ruFUSION_MIME_EMOTE_SPEAK)
	Yell( BEDI , "[SC_422975_9]" , 3 )					--騎士師範親口對像我這樣的女子說出承諾，我還有什麼好懷疑的呢？
	sleep(20)
	Yell( BEDI , "[SC_422975_10]" , 3 )					--不求富裕生活，其實我們也只是想要一個安心的生活，我…願意相信你述說的未來…
	sleep(30)
	Yell( BEDI , "[SC_422975_11]" , 3 )					--能否請您答應我一個無理請求，讓我唯一的兒子，威利．路易斯接受您的訓練
	--插入檢查
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),422975)==false) 	then--TargetID() 是玩家
		DelObj(KK )	--刪除演戲凱
		DelObj(WW )	--刪除演戲威利
		CancelBuff( TargetID()  , 506213) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 , 0 )
		return
	end
	sleep(30)
	SetDefIdleMotion(BEDI ,ruFUSION_MIME_NONE)
	PlayMotion( WW ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( WW , "[SC_422975_12]" , 3 )					--母親…我、我…
	sleep(20)
	PlayMotion( KK ,ruFUSION_ACTORSTATE_EMOTE_APPROVAL)   	--(做出emote_approval動作)
	Yell( KK , "[SC_422975_13]" , 3 )					--當然沒問題！以我的榮耀為名，我會認真訓練他成為一名出色的騎士！
	sleep(20)
	Yell( KK , "[SC_422975_15]" , 3 )					--走吧
	LuaFunc_MoveToFlag( KK ,780510,3,0)
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 , 0 )
	SetFlag( TargetID(), 543695, 1 )
	if	CheckBuff( TargetID() , 506213 ) == true then
		CancelBuff( TargetID() , 506213 )  
	end
	Delobj( WW )
	Delobj( KK )
end

function LuaS_422975_3()
	LuaFunc_MoveToFlag( OwnerID(),780510,4,0)
end

--422890 「簡單」任務	點擊重傷的尼古拉114530		
function LuaS_114530()
		LoadQuestOption( OwnerID() )
	if	(CheckAcceptQuest(OwnerID(),422980)==true )and( CheckCompleteQuest( OwnerID(),422980)==false) then	
		
		if 	(CheckFlag( OwnerID(), 543696)==false) 	then
			SetFlag( OwnerID() , 543696, 1 )
		end
		if	(CountBodyItem( OwnerID(),206816) <1) 	 then
			GiveBodyItem( OwnerID(), 206816, 1 )
			ScriptMessage( OwnerID()   ,  OwnerID()   , 1 , "[SC_422980_0]" , 0 ) 	--一顆鈕釦從尼古拉手中滑落...
			ScriptMessage( OwnerID()   ,  OwnerID()   , 0 , "[SC_422980_0]" , 0 )
		end
	end
end

function LuaS_114530_1()	--倒地尼古拉
	LuaP_DW_Dead()
	--while true do
	--	sleep(30)
	--	CastSpell( OwnerID(), OwnerID(), 492667 )
	--end
end

function LuaS_114827()
	if	CheckAcceptQuest( OwnerID() , 422980) == true  	then
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422980_2]" , 0 ) 		--你正在查探...
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422980_2]" , 0 ) 
		return true
	else
	return true
	end
end

function LuaS_114827_1()
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422980_1]" , 0 ) 		--木桶看起來像是剛被打壞，這附近有打鬥的跡象...
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422980_1]" , 0 ) 
	return true
end


---封授儀式	旗子：780451	1-5
function LuaS_422984()
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422984)==true )and( CheckCompleteQuest( OwnerID(),422984)==false) 	then
		if (ReadRoleValue( TargetID() , EM_RoleValue_Register+9 )  == 0)	 then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422984_0]","LuaS_422984_1",0) --我確定，我不後悔踏上這條道路。
		else
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422984_0]","LuaS_422984_2",0) --我確定，我不後悔踏上這條道路。
		end	
	end
	if (CheckAcceptQuest(OwnerID(),422983)==true )and( CheckCompleteQuest( OwnerID(),422983)==false) 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422983_0]","LuaS_422983",0) ----副團長，關於此次的行動，其實是......
	end
end

function LuaS_422984_2()
	SetSpeakDetail(OwnerID(),"[SC_422984_1]")				--很好！
									 --屬於你的封授儀式要再等一下，我會引領你過去。
end

function LuaS_422984_1()
	CloseSpeak( OwnerID())
	BeginPlot(TargetID()  , "LuaS_422984_3" , 0 )
end


function LuaS_422984_3()
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 2 )	--TargetID是玩家、OwnerID是薔薇
	AddBuff( TargetID()  , 506216, 1 , 120)				--給玩家BUFF （可見演戲的、看不見原本的）
	local Lan = Lua_DW_CreateObj("flag" ,114531,780451,1,1)		--產生蘭斯
	MoveToFlagEnabled(Lan , false )
	WriteRoleValue( Lan ,EM_RoleValue_IsWalk , 1 )
	local EE = Lua_DW_CreateObj("flag" ,114566,780451,2,1)		--產生鐵薔薇
	MoveToFlagEnabled(EE , false )
	WriteRoleValue( EE ,EM_RoleValue_IsWalk , 1 )
	PlayMotion( EE  ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Yell( EE  , "[SC_422984_2]" , 3 )				--很好！我相信你可以，跟我來吧。
	sleep(20)
	LuaFunc_MoveToFlag( EE,780451,6,0)				--(伊崔妮走向殿上，向卡拉維、蘭斯)
	LuaFunc_MoveToFlag( EE,780451,3,0)	
	PlayMotion( EE, ruFUSION_ACTORSTATE_CROUCH_BEGIN)	--伊崔妮跪下
	sleep(10)
	--插入檢查
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),422984)==false) 	then	--TargetID() 是玩家
		DelObj(EE )	--刪除演戲伊崔妮
		DelObj(Lan )	--刪除演戲蘭斯
		CancelBuff( TargetID()  , 506216) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )
		return
	end
	Yell( EE  , "[SC_422984_3]" , 3 )				--見習騎士們已經準備好接受初階騎士的封授儀式。
	sleep(20)
	PlayMotion( EE, ruFUSION_ACTORSTATE_CROUCH_END)		--伊崔妮站起
	sleep(10)
	LuaFunc_MoveToFlag( EE,780451,6,0)	
	LuaFunc_MoveToFlag( EE,780451,4,0)				--走到一旁候著
	SetDefIdleMotion(EE  ,ruFUSION_MIME_IDLE_STAND)
	SetPosByFlag( TargetID()  , 780460 , 1 )				--傳送玩家
	AdjustFaceDir( EE,TargetID(), 0 )
	AdjustFaceDir( TargetID(),Lan , 0 )
	--插入檢查
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),422984)==false) 	then	--TargetID() 是玩家
		DelObj(EE )	--刪除演戲伊崔妮
		DelObj(Lan )	--刪除演戲蘭斯
		CancelBuff( TargetID()  , 506216) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )
		return
	end
	AddBuff( TargetID()  , 503977 , 1 , 120 )				--玩家被定在地上
	AdjustFaceDir( Lan,TargetID() , 0 )				--面向玩家
	LuaFunc_MoveToFlag( Lan,780451,5,0)			--蘭斯緩緩步下
	sleep(20)
	PlayMotion( Lan ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( Lan , "[SC_422984_4]" , 3 )				--你的機智與勇氣，為你帶來與責任等重的地位，身為一名騎士…
	sleep(30)
	SetDefIdleMotion(Lan,ruFUSION_MIME_PARRY_2H)
	Yell( Lan , "[SC_422984_5]" , 3 )				--獻上你的忠誠，效忠唯一的人王—卡薩姆王室
	sleep(30)
	Yell( Lan , "[SC_422984_6]" , 3 )				--維護你的榮譽，坦蕩之心不畏戰、不退卻
	sleep(20)
	--插入檢查
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),422984)==false) 	then	--TargetID() 是玩家
		DelObj(EE )	--刪除演戲伊崔妮
		DelObj(Lan )	--刪除演戲蘭斯
		CancelBuff( TargetID()  , 506216) 
		CancelBuff( TargetID()  , 503977 ) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )
		return
	end
	Yell( Lan , "[SC_422984_7]" , 3 )				--在此…
	sleep(5)
	SetDefIdleMotion(Lan ,ruFUSION_MIME_IDLE_STAND)
	sleep(10)
	PlayMotion( Lan ,ruFUSION_ACTORSTATE_EMOTE_IDLE1)
	Yell( Lan , "[SC_422984_8]" , 3 )				--以人王卡拉維．卡薩姆之名，特授予你?騎士
	sleep(40)
	--插入檢查
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),422984)==false) 	then	--TargetID() 是玩家
		DelObj(EE )	--刪除演戲伊崔妮
		DelObj(Lan )	--刪除演戲蘭斯
		CancelBuff( TargetID()  , 506216) 
		CancelBuff( TargetID()  , 503977 ) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )
		return
	end
	PlayMotion( Lan , ruFUSION_ACTORSTATE_EMOTE_POINT)
	Yell( Lan , "[SC_422984_9]" , 3 )				--從現在開始，別背棄你身為獅心騎士團一分子的尊嚴。
	sleep(30)
	--插入檢查
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),422984)==false) 	then	--TargetID() 是玩家
		DelObj(EE )	--刪除演戲伊崔妮
		DelObj(Lan )	--刪除演戲蘭斯
		CancelBuff( TargetID()  , 506216) 
		CancelBuff( TargetID()  , 503977 ) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )
		return
	end
	SetFlag( TargetID() , 543697 , 1 )				--給旗標
	sleep(20)
	PlayMotion( EE,ruFUSION_ACTORSTATE_EMOTE_APPLAUSE)--旁邊觀禮的人鼓掌	
	LuaFunc_MoveToFlag( Lan ,780451,1,0)	
	Delobj(EE)
	Delobj(Lan)
	if	CheckBuff( TargetID() , 506216) == true then
		CancelBuff( TargetID() , 506216)  
	end

	if	CheckBuff( TargetID() , 503977 ) == true then
		CancelBuff( TargetID() , 503977 )  
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )
end

----------------422982擊潰！--點擊NPC後，種出5之NPC，判斷NPC死給旗標	780453	1-4

function LuaS_207012_0()
	ClearBorder( OwnerID())	--初始化石碑介面
	AddBorderPage( OwnerID(), "[SC_207012_0]" )
	ShowBorder( OwnerID(), 0, "[207012]", "ScriptBorder_Texture_Paper" )	
end

function LuaS_422982_0()
	LoadQuestOption( OwnerID() )
	if	(CheckAcceptQuest(OwnerID(),422982)==true )and( CheckCompleteQuest( OwnerID(),422982)==false)	and
		CheckFlag( OwnerID() , 543709 ) ==false	then
		BeginPlot(TargetID()  , "LuaS_422982_1" , 0 )
	end
end

		
function LuaS_422982_1()
	DisableQuest( OwnerID() , true )					--關閉接任務
      	Hide( OwnerID() ) 							   --隱藏任務NPC                  
	local BRO = Lua_DW_CreateObj("obj" , 103309, OwnerID() )  		  --叫出怪物NPC
	AddToPartition(  BRO, 0 )
	WriteRoleValue ( OwnerID(), EM_RoleValue_PID, BRO)
	BeginPlot(OwnerID(), "LuaS_422982_3" , 0 )      
	SetAttack(BRO , TargetID() )
	BeginPlot(BRO  , "LuaS_Discowood_CheckPeace" , 0 )
	SetPlot(BRO,"dead","LuaS_422982_2",0 )
	PlayMotion( BRO,ruFUSION_ACTORSTATE_EMOTE_ANGRY)	
	say(BRO,"[SC_422982_0]")						--快來幫忙！獅心騎士團的傢伙找到這裡來了！
	local NPCMA = {}
		for i=1,4,1 do
		NPCMA[i] = CreateObjByFlag( 103303, 780480 , i , 0 )		--4隻馬龍盜賊
		AddToPartition( NPCMA[i] , 0 )
		SetAttack(NPCMA[i] , TargetID() )
	end
	BeginPlot(NPCMA[1]  , "LuaS_Discowood_CheckPeace" , 0 )
	BeginPlot(NPCMA[2]  , "LuaS_Discowood_CheckPeace" , 0 )
	BeginPlot(NPCMA[3]  , "LuaS_Discowood_CheckPeace" , 0 )
	BeginPlot(NPCMA[4]  , "LuaS_Discowood_CheckPeace" , 0 )

	sleep(30)
	while true do
		sleep(10)
		if	 CheckID( TargetID() ) == false or ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1	or	CheckFlag( TargetID() , 543709 ) ==true	
			or	(  HateListCount( BRO )== 0 ) 	then
			DelObj( BRO)
			DelObj( NPCMA[1])
			DelObj( NPCMA[2])			
			DelObj( NPCMA[3])
			DelObj( NPCMA[4])
			Show(OwnerID() , 0)
			DisableQuest( OwnerID() , false )		--打開接任務
			break	
		end
	end
	return true		
end


function LuaS_422982_2() --怪的死亡劇情
	local Player 
	for i=0, HateListCount( OwnerID() )-1 do
		Player = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest ( Player   , 422982 )	then
			SetFlag( Player   , 543709, 1 )
	
		end
	end
	return true
End

function LuaS_422982_3()
	local NPC =ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	while true do
		sleep(10)
		if	CheckID(NPC)==false then
			Show(OwnerID(),0)
			DisableQuest( OwnerID() , false )		--打開接任務
			break
		end
	end
	return true
end 



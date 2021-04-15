--======================================================================================================================================
--======================================================================================================================================
--熱泉
--======================================================================================================================================
function LuaS_116449()							---拉卡克．鬃牙對話
	if	ZONE18_PE01_Phase < 2	then
		LoadQuestOption( OwnerID() )					---讀取任務模板
		AddSpeakOption(OwnerID(),TargetID(),"[SC_116449_1]","LuaS_116449_1",0)	--你在這裡做什麼？
	else
		SetSpeakDetail(OwnerID(),"[SC_116449_3]")	---跑上來幹嘛！站這麼高沒看到亞基丁已經爬過來了嗎？還不去幫忙！？
	end
end

function LuaS_116449_1()
	SetSpeakDetail(OwnerID(),"[SC_116449_2]")			---一看就知道，我在監視周圍的狀況，順便跟獵人打訊號，不然那些在沙漠狩獵的夥伴們可是會被亞基丁無聲無息的一口吃掉！
end
--======================================================================================================================================
function LuaS_116451()							---凡迪．赤眼對話
	LoadQuestOption( OwnerID() )					---讀取任務模板
	if	ZONE18_PE01_Phase > 1	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_116451_1]","LuaS_116451_1",0)	--你不去幫忙嗎？
	end
end

function LuaS_116451_1()
	SetSpeakDetail(OwnerID(),"[SC_116451_2]")			---開什麼玩笑？弄髒了這身盔甲怎麼辦？你賠得起嗎？
								---放心啦！只要我們在岩盤上那群怪蟲也奈何不了我們！
end
--======================================================================================================================================
function LuaS_116453()							---文森．札德拉對話
	LoadQuestOption( OwnerID() )					---讀取任務模板
	if	ZONE18_PE01_Phase > 1	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_116451_1]","LuaS_116453_1",0)	--你不去幫忙嗎？		
	end	
end

function LuaS_116453_1()
	SetSpeakDetail(OwnerID(),"[SC_116453_1]")			---雖然我很想...可是我腳上的傷可不這麼想...
end
--======================================================================================================================================
function LuaS_116455()							---芮妮塔．鬃牙對話
	LoadQuestOption( OwnerID() )					---讀取任務模板
	if	ZONE18_PE01_Phase > 1	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_116451_1]","LuaS_116455_1",0)	--你不去幫忙嗎？		
	else
		AddSpeakOption(OwnerID(),TargetID(),"[SC_116451_3]","LuaS_116455_2",0)	--你不去幫忙嗎？		
	end
end

function LuaS_116455_1()
	SetSpeakDetail(OwnerID(),"[SC_116455_1]")			---我好像看到了...霧氣中有些影子。
end
function LuaS_116455_2()
	SetSpeakDetail(OwnerID(),"[SC_116455_4]")			---我好像看到了...霧氣中有些影子。
end
--======================================================================================================================================
function LuaS_116458()
	if	ZONE18_PE01_Phase < 2	then
		LoadQuestOption( OwnerID() )					---讀取任務模板
		AddSpeakOption(OwnerID(),TargetID(),"[SC_116458_1]","LuaS_116458_1",0)	--你在這裡做什麼？
	else
		SetSpeakDetail(OwnerID(),"[SC_116458_3]")	---
	end	
end

function LuaS_116458_1()
	SetSpeakDetail(OwnerID(),"[SC_116458_2]")			---我好像看到了...霧氣中有些影子。
end

--======================================================================================================================================
function LuaS_116461()
	LoadQuestOption( OwnerID() )					---讀取任務模板
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116461_1]","LuaS_116461_1",0)	--拍他！
end

function LuaS_116461_1()
	if	ZONE18_PE01_Phase < 2	then	
		SetSpeakDetail(OwnerID(),"[SC_116461_2]")			---(受到驚嚇的樣子)
		AddSpeakOption(OwnerID(),TargetID(),"[SC_116461_3]","LuaS_116461_2",0)	--(詢問在水池邊的行為)
	else
		SetSpeakDetail(OwnerID(),"[SC_116461_5]")			---小聲點...不然會被那群[116402]聽到，他們可是連熱泉都不怕的瘋狂傢伙，只是有點
	end	
end

function LuaS_116461_2()
	SetSpeakDetail(OwnerID(),"[SC_116461_4]")			---噢！我在煮食物！
end
--======================================================================================================================================
function LuaS_116594()
	LoadQuestOption( OwnerID() )					---讀取任務模板
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116594_1]","LuaS_116594_1",0)	--那些沒有眼睛的傢伙是什麼？
end

function LuaS_116594_1()
	SetSpeakDetail(OwnerID(),"[SC_116594_2]")			---
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116594_3]","LuaS_116594_2",0)	--那些沒有眼睛的傢伙是什麼？
end

function LuaS_116594_2()
	SetSpeakDetail(OwnerID(),"[SC_116594_4]")			---
end
--======================================================================================================================================
function LuaP_116454()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_SLEEP_BEGIN,ruFUSION_ACTORSTATE_SLEEP_LOOP)
	sleep(30)
	while 1 do
		sleep(rand(150)+150)
		NPCSAY(OwnerID(),"[SC_116454_1]")
	end
end

function LuaP_116449()
	while 1 do
		sleep(rand(150)+150)
		if	ZONE18_PE01_Phase < 2	then
			NPCSAY(OwnerID(),"[SC_116449_4]")
		else
			NPCSAY(OwnerID(),"[SC_116449_5]")
		end
	end
end

function LuaP_116458()
	SetPlot( OwnerID() , "range" , "LuaP_116458_1" , 150 );
	while 1 do
		sleep(rand(150)+150)
		if	ZONE18_PE01_Phase < 2	and	ReadRoleValue( OwnerID() , EM_RoleValue_Register1) ~= 0	then
			AdjustFaceDir( OwnerID(), ReadRoleValue( OwnerID() , EM_RoleValue_Register1) , 0 )
			PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_WAVE)
			NPCSAY(OwnerID(),"[SC_116458_4]")
		end		
	end

end

function LuaP_116458_1()
	WriteRoleValue( TargetID() , EM_RoleValue_Register1 , OwnerID() )
end

function LuaP_116597()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_SIT_BEGIN,ruFUSION_ACTORSTATE_SIT_LOOP)
	While	1	do

		sleep(10)
		if	ZONE18_PE01_Phase < 2	then
			Show( OwnerID(),0 )
		else	
			Hide(OwnerID())			
		end
	end
end

function LuaP_116600()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	While	1	do

		sleep(10)
		if	ZONE18_PE01_Phase < 2	then
			Show( OwnerID(),0 )
		else	
			Hide(OwnerID())			
		end
	end
end

function LuaP_116602()
	While	1	do
		sleep(10)
		if	ZONE18_PE01_Phase < 2	then
			Show( OwnerID(),0 )
		else	
			Hide(OwnerID())			
		end
		if	ReadRoleValue(OwnerID(),EM_RoleValue_HP)/ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP) < 0.3	then
			WriteRoleValue(OwnerID(),EM_RoleValue_HP,ReadRoleValue(OwnerID(),EM_RoleValue_HP)*3)
		end
	end
end

function LuaS_DeadVisitor()
	SetRoleCamp( OwnerID() , "Visitor" )	
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_DEATH_LOOP)
end

function LuaS_PociCall()
	sleep(30)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_BUFF_SP01)
end


function LuaS_continuous_buff()
	SetDefIdleMotion( OwnerID() ,ruFUSION_MIME_BUFF_LOOP)
end


function Lua_disert_Attack()
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE2)
end
--======================================================================================================================================
--======================================================================================================================================
---綠洲
--======================================================================================================================================
function LuaS_116636()
	LoadQuestOption( OwnerID() )					---讀取任務模板
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116636_1]","LuaS_116636_1",0)	--
end

function LuaS_116636_1()
	SetSpeakDetail(OwnerID(),"[SC_116636_2]")			---	
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116636_3]","LuaS_116636_2",0)	--
end

function LuaS_116636_2()
	SetSpeakDetail(OwnerID(),"[SC_116636_4]")			---	
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116636_5]","LuaS_116636_3",0)	--
end

function LuaS_116636_3()
	SetSpeakDetail(OwnerID(),"[SC_116636_6]")			---	
end

function LuaS_116640()
	LoadQuestOption( OwnerID() )					---讀取任務模板
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116640_1]","LuaS_116640_1",0)	--
end

function LuaS_116640_1()
	SetSpeakDetail(OwnerID(),"[SC_116640_2]")			---
	setflag(OwnerID(),544571,1)		
end

function LuaS_116642()
	While 1 do
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_DODGE )
		sleep(20)
		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE2)		
		sleep(140)
	end
end

function LuaS_116678_Start()
	local red = LuaFunc_SearchNPCbyOrgID( OwnerID() ,116677  , 1000 , 0)	
	while	1	do
		AdjustFaceDir( OwnerID() ,red,0 )	
		AdjustFaceDir( red ,OwnerID(),0 )		
		NPCsay(red ,"[SC_116678_0]")
		sleep(30)
		PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		sleep(5)
		NPCsay(OwnerID() ,"[SC_116678_1]")
		sleep(30)
		PlayMotion(red,ruFUSION_ACTORSTATE_EMOTE_ANGRY)
		NPCsay(red ,"[SC_116678_2]")	
		sleep(30)
		NPCsay(OwnerID() ,"[SC_116678_3]")
		sleep(30)
		AdjustFaceDir( red ,OwnerID(),180 )
		NPCsay(red ,"[SC_116678_4]")
		sleep(30)
		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE2)		
		NPCsay(OwnerID() ,"[SC_116678_5]")
		sleep(2000)
	end
end

function LuaS_116445()
	LoadQuestOption( OwnerID() )					---讀取任務模板	
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116445_1]","LuaS_116445_1",0)			--(詢問關於飲用水)
end

function LuaS_116445_1()
	SetPosByFlag( OwnerID(), 780774 , 1 )
	SetSpeakDetail(OwnerID(),"[SC_116445_2]")						---你先站過來我再告訴你。
												---我得好好告訴你，免得你又跟上次不知道哪來的年輕人一樣撲通一聲跳下去。
												---我們這裡大部分的泉水都是燙的，而且大都居住著溫泉龜，不然就是哪些沒腦帶的亞基丁一股腦的跳進去，根本就不能喝！
												---所以說一個乾淨的泉水是多麼珍貴的！
	AddSpeakOption(OwnerID(),TargetID(),"[SC_1166445_3]","LuaS_116445_2",0)	--		---(詢問關於熱泉)
end

function LuaS_116445_2()
	SetSpeakDetail(OwnerID(),"[SC_116445_4]")						---如果你要看熱泉的話，從這裡繼續往西方走就到了，許多獵人都在那邊狩獵附近的動物，雖然經常聽他們說[116402]偶而會集合起來攻擊他們，但總是有驚無險。
												---如果有興趣就自己去看看吧。
end

function LuaS_116680()
	LoadQuestOption( OwnerID() )					---讀取任務模板	
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116680_1]","LuaS_116680_1",0)			--(詢問如何殺死[116402])	
end

function LuaS_116680_1()
	SetSpeakDetail(OwnerID(),"[SC_116680_2]")			---你該不會以為一刀一刀砍吧！
									---哈哈哈！別瞪我～你當然可以這麼做，但我會建議讓這些[116402]去泡泡熱水，他們身上的硬殼會變軟，軟到你可以一口咬下去的時候，宰了他們就像吞口水一樣容易～
end

function LuaS_116681()
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_STAND_02)
end

function LuaS_116682()
	local cookie = LuaFunc_SearchNPCbyOrgID( OwnerID() ,116445  , 1000 , 0)		
	WriteRoleValue( OwnerID(), EM_RoleValue_Register+1, cookie )
	setplot(OwnerID(),"range","LuaS_116682_1",47)
end

function LuaS_116682_1()
	local cookie = ReadRoleValue( TargetID(), EM_RoleValue_Register+1)	
	sleep(5)
	if	ReadRoleValue( cookie , EM_RoleValue_Register+2 ) == 0	then
		WriteRoleValue( cookie , EM_RoleValue_Register+2, 1 )
		AdjustFaceDir( cookie ,OwnerID(),0 )		
		PlayMotion(cookie,ruFUSION_ACTORSTATE_EMOTE_POINT)	
		sleep(5)
		NPCsay(cookie ,"[SC_116445_5]")	
		WriteRoleValue( cookie , EM_RoleValue_Register+2, 0 )
	end
	sleep(30)
	if	GetDistance( OwnerID() , TargetID() ) < 50	then
		SetPosByFlag( OwnerID(), 780774 , 1 )	
		if	ReadRoleValue( cookie, EM_RoleValue_Register+2 ) == 0	then
			WriteRoleValue( cookie , EM_RoleValue_Register+2, 1 )
			AdjustFaceDir( cookie ,OwnerID(),0 )		
			PlayMotion(cookie,ruFUSION_ACTORSTATE_EMOTE_POINT)	
			NPCsay(cookie ,"[SC_116445_6]")			
			WriteRoleValue( cookie , EM_RoleValue_Register+2, 0 )
		end
	end
end

function LuaS_116682_2()
	callplot(OwnerID(),"Lua_MK_423574_Quest_Checker" )
	local cookie = LuaFunc_SearchNPCbyOrgID( OwnerID() ,116445  , 1000 , 0)		
	WriteRoleValue( OwnerID(), EM_RoleValue_Register+1, cookie )
	setplot(OwnerID(),"range","LuaS_116682_3",13)
end

function LuaS_116682_3()
	local cookie = ReadRoleValue( TargetID(), EM_RoleValue_Register+1)	
	sleep(5)
	if	ReadRoleValue( cookie , EM_RoleValue_Register+2 ) == 0	then
		WriteRoleValue( cookie , EM_RoleValue_Register+2, 1 )
		AdjustFaceDir( cookie ,OwnerID(),0 )		
		PlayMotion(cookie,ruFUSION_ACTORSTATE_EMOTE_POINT)	
		sleep(5)
		NPCsay(cookie ,"[SC_116445_5]")	
		WriteRoleValue( cookie , EM_RoleValue_Register+2, 0 )
	end
	sleep(30)
	if	GetDistance( OwnerID() , TargetID() ) < 13	then
		SetPosByFlag( OwnerID(), 780774 , 1 )	
		if	ReadRoleValue( cookie, EM_RoleValue_Register+2 ) == 0	then
			WriteRoleValue( cookie , EM_RoleValue_Register+2, 1 )
			AdjustFaceDir( cookie ,OwnerID(),0 )		
			PlayMotion(cookie,ruFUSION_ACTORSTATE_EMOTE_POINT)	
			NPCsay(cookie ,"[SC_116445_6]")			
			WriteRoleValue( cookie , EM_RoleValue_Register+2, 0 )
		end
	end
end

function LuaS_116636_motion()
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_CRY )
end

function LuaS_Gray1()
	setplot(OwnerID(),"dead","LuaS_Gray2",100)
end

function LuaS_Gray2()
	SetRoleCamp( OwnerID() , "Visitor" );
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	Lua_ObjDontTouch( OwnerID() )
	Say(OwnerID(),"My god! i dead!!")
	return false
end
--============================================================================================
function LuaS_MK_423570_accept()
	SetFlag(TargetID(),544682,1)
end

function LuaS_MK_423570_complete()
	SetFlag(TargetID(),544682,0)
	if	CheckAcceptQuest( TargetID() , 423571 ) == false	and
		CheckFlag ( TargetID() , 544682 ) == false	and
		CheckFlag ( TargetID() , 544683 ) == false	and	
		CheckCompleteQuest( TargetID(), 423516 ) == true	then
		AddBuff(TargetID(),508317,0,-1)
		local inf = Lua_DW_CreateObj( "obj" , 117170 , OwnerID() , 1 , 1 )
		Lua_ObjDontTouch( inf  )
		NPCSAY(inf,"[SC_116724_9]")
		PlayMotion(inf,ruFUSION_ACTORSTATE_USE	)	--使cookie播放	
		sleep(20)
		CastSpell(inf,inf,495735)
		sleep(10)
		delobj(inf)
		sleep(20)
		CancelBuff(TargetID(),508317)
	end
end

function LuaS_MK_423571_accept()
	SetFlag(TargetID(),544683,1)
end

function LuaS_MK_423571_complete()
	SetFlag(TargetID(),544683,0)
	if	CheckAcceptQuest( TargetID() , 423570 ) == false	and
		CheckFlag ( TargetID() , 544682 ) == false	and
		CheckFlag ( TargetID() , 544683 ) == false	and	
		CheckCompleteQuest( TargetID(), 423516 ) == true	then
		AddBuff(TargetID(),508317,0,-1)
		local inf = Lua_DW_CreateObj( "obj" , 117170 , OwnerID() , 1 , 1 )
		Lua_ObjDontTouch( inf  )
		NPCSAY(inf,"[SC_116724_9]")
		PlayMotion(inf,ruFUSION_ACTORSTATE_USE	)	--使cookie播放	
		sleep(20)
		CastSpell(inf,inf,495735)
		sleep(10)
		delobj(inf)
		sleep(20)
		CancelBuff(TargetID(),508317)
	end
end

function Lua_MK_423574_Quest_Checker()
	while	true	do
		sleep(30)
		local HowManyPlayer = SetSearchAllPlayer(0)
		local player
		for i = 1,HowManyPlayer,1 do
			Player = GetSearchResult()
			if	CheckCompleteQuest( player , 423570 ) == true	or	CheckAcceptQuest( player , 423570 ) == false	then
				setflag(player,544682,0)
			end
			if	CheckCompleteQuest( player , 423571 ) == true	or	CheckAcceptQuest( player , 423571 ) == false	then
				setflag(player,544683,0)
			end
		end
	end

end
function LuaS_MK_116818()
	LoadQuestOption( OwnerID() )
	AdjustFaceDir(TargetID(),OwnerID(),0)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_116818_1]", 	"LuaS_MK_116818_1", 0 )		--(詢問關於這些蜘蛛)
end

function LuaS_MK_116818_1()
	SetSpeakDetail(OwnerID(),"[SC_116818_2]")								--你要找這些蜘蛛？你從這裡往西邊走，在黑沼湖那邊就可以看到了。
end														


function LuaS_MK_116824()
	LoadQuestOption( OwnerID() )
	AdjustFaceDir(TargetID(),OwnerID(),0)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_116824_1]", 	"LuaS_MK_116824_1", 0 )		--(詢問關於神廟)
end

function LuaS_MK_116824_1()

	SetSpeakDetail(OwnerID(),"[SC_116824_2]")								--雖說是神廟，那也只是我們的稱呼而已，實際上那座建築物的功能依舊是迷...
end

function LuaS_MK_116825()
	LoadQuestOption( OwnerID() )
	AdjustFaceDir(TargetID(),OwnerID(),0)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_116825_1]", 	"LuaS_MK_116825_1", 0 )		--(詢問關於遺跡)
end

function LuaS_MK_116825_1()
	SetSpeakDetail(OwnerID(),"[SC_116825_2]")								--什麼？難道你對那遺跡有興趣？
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_116825_1]", 	"LuaS_MK_116825_2", 0 )		--(詢問關於遺跡)
end

function LuaS_MK_116825_2()
	if	CheckCompleteQuest(OwnerID(),423701) == true	or	CheckAcceptQuest(OwnerID(),423701) == true	then
		SetSpeakDetail(OwnerID(),"[SC_116825_know]")			
	else
		SetSpeakDetail(OwnerID(),"[SC_116825_3]")								--古代遺跡的研究權是我們艾力克研究團
		if	CheckCompleteQuest(OwnerID(),423205) == true	then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_116825_4]", 	"LuaS_MK_116825_3", 0 )		--(表明自己跟厄里巴．希爾是朋友)
		end
	end
end

function LuaS_MK_116825_3()
	SetSpeakDetail(OwnerID(),"[SC_116825_5]")								--
end

function LuaS_MK_116826()
	local talk = 0
	while	1	do
		PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_ROFL)
		sleep(55)
		if	talk == 0	then
			NPCSAY(OwnerID(),"[SC_116826_1]")
			talk = talk +1
		elseif	talk == 1	then
			NPCSAY(OwnerID(),"[SC_116826_2]")
			talk = talk +1
		elseif	talk == 2	then
			NPCSAY(OwnerID(),"[SC_116826_3]")
			talk = 0
		end
	end
end

function LuaS_MK_116827()
	local talk = 0
	while	1	do
		sleep(200)
		if	talk == 0	then
			NPCSAY(OwnerID(),"[SC_116827_1]")
			talk = talk +1
		elseif	talk == 1	then
			NPCSAY(OwnerID(),"[SC_116827_2]")
			talk = talk +1
		elseif	talk == 2	then
			NPCSAY(OwnerID(),"[SC_116827_3]")
			talk = 0
		end		
	end
end

function LuaS_MK_116828()
	AddBuff(OwnerID(),504935,0,-1)
	AddBuff(OwnerID(),504936,0,-1)
	SetDefIdleMotion( OwnerID() ,ruFUSION_MIME_CHANNEL_LOOP	)	
end

function LuaS_MK_116828_1()
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_116828_1]", 	"LuaS_MK_116828_2", 0 )		--你在做什麼？
end

function LuaS_MK_116828_2()
	SetSpeakDetail(OwnerID(),"[SC_116828_2]")								--看不出來嗎？我在幫他治療，與其在這邊礙事，不如去找其他需要幫忙的人吧！
end

function LuaS_MK_116837()
	local cookie = LuaFunc_SearchNPCbyOrgID( OwnerID() ,116835  , 1000 , 0)	--以OwnerID為中心搜尋範圍RANGE內目標NPC模板ID
	local cookie2 = LuaFunc_SearchNPCbyOrgID( OwnerID() ,116836  , 1000 , 0)	--以OwnerID為中心搜尋範圍RANGE內目標NPC模板ID
	--宣告cookie為LuaFunc_SearchNPCbyOrgID(也就是要用來當搜尋中心的NPC)
	WriteRoleValue( OwnerID(), EM_RoleValue_Register+1, cookie )
	WriteRoleValue( OwnerID(), EM_RoleValue_Register+2, cookie2 )
	setplot(OwnerID(),"range","LuaS_MK_116837_2",60) --設定範圍劇情
end

function LuaS_MK_116837_2()
	local cookie1 = ReadRoleValue( TargetID(), EM_RoleValue_Register+1)
	local cookie2 = ReadRoleValue( TargetID(), EM_RoleValue_Register+2)
	if	ReadRoleValue( TargetID() , EM_RoleValue_Register+3 ) == 0	then
		WriteRoleValue( TargetID(), EM_RoleValue_Register+3, 1 )
		AdjustFaceDir( TargetID() ,OwnerID(),0 ) --使cookie面對OWNERID
		PlayMotion(TargetID() , ruFUSION_ACTORSTATE_EMOTE_POINT)	--使cookie播放
		sleep(5)
		NPCSAY(TargetID(),"[SC_423582_1]")
		sleep(25)
		WriteRoleValue( TargetID(), EM_RoleValue_Register+3, 0 )
	end
	SetPosByFlag( OwnerID(), 780799 , 1 )		--將OwnerID傳送至旗標位置
	AddBuff(OwnerID(),503977,0,-1)
	if	ReadRoleValue( cookie1 , EM_RoleValue_Register+1 ) == 0	then
		WriteRoleValue( cookie1, EM_RoleValue_Register+1, 1 )
		AdjustFaceDir( cookie1 ,OwnerID(),0 ) --使cookie面對OWNERID	
		AdjustFaceDir( cookie2 ,OwnerID(),0 ) --使cookie面對OWNERID	
		PlayMotion(cookie1 , ruFUSION_ACTORSTATE_EMOTE_POINT)	--使cookie播放
		NPCSAY(cookie1,"[SC_116837_1]")		
		sleep(30)
		PlayMotion( cookie2,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
		NPCSAY(cookie2 ,"[SC_116837_2]")
		sleep(30)		
		WriteRoleValue( cookie1, EM_RoleValue_Register+1, 0 )
	end
	CancelBuff(OwnerID(),503977)
end

function LuaS_MK_117057()
	while	1	do
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_STRETCH)
		sleep(140)
	end
end

function LuaS_MK_117060()
	while	1	do
		sleep(50)
		NPCSAY(OwnerID(),"[SC_117060_1]")
		PlayMotion(OwnerID(),	ruFUSION_ACTORSTATE_EMOTE_SPEAK)


		sleep(150)
	end
end

function LuaS_MK_117062()
	local temp = 0
	while	1	do
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_BEG)
		if	temp == 0	then
			NPCSAY(OwnerID(),"[SC_117062_1]")
			temp = temp +1
		else
			NPCSAY(OwnerID(),"[SC_117062_2]")
			temp = temp -1			
		end
		sleep(100)
	end
end

function LuaS_MK_117064()
	PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_COMBAT_UNARMED, ruFUSION_ACTORSTATE_COMBAT_UNARMED)
	while	1	do
		NPCSAY(OwnerID(),"[SC_117064_1]")
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_ATTACK_UNARMED)
		sleep(20)
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_ATTACK_UNARMED_SP)		
		sleep(180)	
	end
end

function LuaS_MK_117065()
	while	1	do
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_ANGRY)
		sleep(70)
	end
end

function LuaS_MK_117065_C()
	LoadQuestOption( OwnerID() )
	setflag(OwnerID(),544645,1)	
end

function LuaS_MK_117066()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	while	1	do
		NPCSAY(OwnerID(),"[SC_117066_1]")
		sleep(rand(70)+140)
	end
end

function LuaS_MK_117066_C()
	LoadQuestOption( OwnerID() )
	if	CheckFlag(OwnerID(),544645) == true	then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_117066_2]", 	"LuaS_MK_117066_C_2", 0 )		--你老婆在找你		
	end
end

function LuaS_MK_117066_C_2()
	SetSpeakDetail(OwnerID(),"[SC_117066_3]")								--我老婆?
end

function LuaS_MK_117067()
	while	1	do
		sleep(70)
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_VICTORY)
		NPCSAY(OwnerID(),"[SC_117067_1]")
		sleep(rand(50)+50)
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	end	
end



function LuaS_MK_117071()
	if	CheckCompleteQuest(OwnerID(),423578) == true	then
		SetSpeakDetail(OwnerID(),"[SC_117071_1]")	
	else
		LoadQuestOption( OwnerID() )								--	
	end
end

function LuaS_MK_117100()
	AddBuff( OwnerID() ,502280,1 ,-1)
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)	
end

function LuaS_MK_117045()
	while	1	do
		 PlayMotion( OwnerID(),   ruFUSION_ACTORSTATE_EMOTE_DANCE)
		sleep(57)
	end
end

function LuaS_MK_116970()
	sleep(10)
	local snake = {}
	for i = 1 , 4 , 1 do
		snake[i] = Lua_DW_CreateObj("flag" , 116490 ,780803,i)
		SetDefIdleMotion( snake[i] , ruFUSION_MIME_IDLE_STAND_02 )	
		Lua_ObjDontTouch( snake[i] )
--		say(snake[i-1],"i am "..i)
	end
--	say(OwnerID(),snakeNum)	
	while	1	do
		for i = 1 , 4 , 1 do
			PlayMotion( snake[i] ,   ruFUSION_ACTORSTATE_ATTACK_UNARMED)
			sleep(10)	
		end
		for i = 1 , 4 , 1 do
			PlayMotion( snake[i] ,   ruFUSION_ACTORSTATE_BUFF_SP01)
			sleep(10)	
		end
		for i = 1 , 4 , 1 do
			DW_MoveToFlag( snake[i]  , 780803, 4+i , 0,0  )
		end
		for i = 1 , 4 , 1 do
			DW_MoveToFlag( snake[i]  , 780803, i , 0,0)
		end
	end
	
end

function LuaS_MK_117020()
	while	1	do
		PlayMotion( OwnerID() ,   ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		sleep(40)
		PlayMotion( OwnerID() ,   ruFUSION_ACTORSTATE_EMOTE_PLAY_GUITAR	)
		sleep(50)
		PlayMotion( OwnerID() ,   ruFUSION_ACTORSTATE_EMOTE_APPLAUSE)
		sleep(50)
		PlayMotion( OwnerID() ,   ruFUSION_ACTORSTATE_EMOTE_ANGRY)
		sleep(50)		
		PlayMotion( OwnerID() ,   ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
		sleep(50)	
		PlayMotion( OwnerID() ,   ruFUSION_ACTORSTATE_EMOTE_BEG)
		sleep(50)			
		PlayMotion( OwnerID() ,   ruFUSION_ACTORSTATE_EMOTE_CRY)
		sleep(50)		
		PlayMotion( OwnerID() ,   ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
		sleep(50)	
		PlayMotion( OwnerID() ,   ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
		sleep(50)
		PlayMotion( OwnerID() ,   ruFUSION_ACTORSTATE_EMOTE_LAUGH)
		sleep(50)		
		PlayMotion( OwnerID() ,   ruFUSION_ACTORSTATE_EMOTE_POINT)
		sleep(50)	
		PlayMotion( OwnerID() ,   ruFUSION_ACTORSTATE_EMOTE_PROVOKE)
		sleep(50)
		PlayMotion( OwnerID() ,   ruFUSION_ACTORSTATE_EMOTE_SALUTE)
		sleep(50)
		PlayMotion( OwnerID() ,   ruFUSION_ACTORSTATE_EMOTE_SURRENDER)
		sleep(50)
		PlayMotion( OwnerID() ,   ruFUSION_ACTORSTATE_EMOTE_THREATEN)
		sleep(50)
		PlayMotion( OwnerID() ,   ruFUSION_ACTORSTATE_EMOTE_VICTORY)
		sleep(50)
		PlayMotion( OwnerID() ,   ruFUSION_ACTORSTATE_EMOTE_WAVE)
		sleep(50)
	end
end

function LuaS_MK_116984()
	local fal = LuaFunc_SearchNPCbyOrgID( OwnerID() , 117132 , 200 , 0)
	while	1	do
		CastSpell(OwnerID(),fal,496674)
		sleep(20+rand(20))
	end	
end

function LuaS_MK_Show117049()
	local shower1 = Lua_DW_CreateObj("flag" , 117047 ,780828,1)
	local shower2 = Lua_DW_CreateObj("flag" , 117049 ,780828,3)
	while	1	do
		CallPlot( Shower1 ,"DW_MoveToFlag" , Shower1 , 780828, 2 ,0)
		DW_MoveToFlag( Shower2 , 780828, 4 ,0 )
		sleep(5)
		AdjustFaceDir(shower1,shower2,0)
		AdjustFaceDir(shower2,shower1,0)
		sleep(5)
		PlayMotion( shower1 ,   ruFUSION_ACTORSTATE_EMOTE_SALUTE2)
		PlayMotion( shower2 ,   ruFUSION_ACTORSTATE_EMOTE_SALUTE2)
		sleep(25)
		CallPlot( Shower1 ,"DW_MoveToFlag" , Shower1 , 780828, 3 ,0)
		DW_MoveToFlag( Shower2 , 780828, 1 ,0 )
		sleep(5)
		AdjustFaceDir(shower1,shower2,0)
		AdjustFaceDir(shower2,shower1,0)
		sleep(5)
		PlayMotion( shower1 ,   ruFUSION_ACTORSTATE_EMOTE_BREAKDANCE)
		PlayMotion( shower2 ,   ruFUSION_ACTORSTATE_EMOTE_BREAKDANCE)
		sleep(45)
		CallPlot( Shower1 ,"DW_MoveToFlag" , Shower1 , 780828, 5 ,0)
		DW_MoveToFlag( Shower2 , 780828, 6 ,0 )
		sleep(5)
		AdjustFaceDir(shower1,OwnerID(),0)
		AdjustFaceDir(shower2,OwnerID(),0)
		sleep(5)
		PlayMotion( shower1 ,   ruFUSION_ACTORSTATE_EMOTE_TAPDANCE)
		PlayMotion( shower2 ,   ruFUSION_ACTORSTATE_EMOTE_TAPDANCE)
		sleep(40)
		CallPlot( Shower1 ,"DW_MoveToFlag" , Shower1 , 780828, 1 ,0)
		DW_MoveToFlag( Shower2 , 780828, 3 ,0 )
		sleep(5)	
		AdjustFaceDir(shower1,OwnerID(),0)
		AdjustFaceDir(shower2,OwnerID(),0)
		sleep(5)
		PlayMotion( shower1 ,   ruFUSION_ACTORSTATE_EMOTE_WAVE)	
		PlayMotion( shower2 ,   ruFUSION_ACTORSTATE_EMOTE_WAVE)	
		sleep(20)
		PlayMotion( shower1 ,   ruFUSION_ACTORSTATE_EMOTE_WAVE)	
		PlayMotion( shower2 ,   ruFUSION_ACTORSTATE_EMOTE_WAVE)	
		sleep(40)				
	end
end

function LuaS_423587()
	SetFlag(TargetID(),544665,1)
end


function LuaS_208713_book_0()	--208281整理過的實驗檔案
	local Str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), "[SC_208713_BOOK_1]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_208713_BOOK_2]" )	--下一頁，字串為書頁內文
	ShowBorder( OwnerID(), 0, str,"ScriptBorder_Texture_Paper" )
end

function LuaS_208748_book_0()	--208281整理過的實驗檔案
	local Str = "["..GetUseItemGUID(OwnerID()).."]"
	if	CheckFlag( OwnerID(), 544669 ) == false	and	CheckFlag( OwnerID(), 544673 ) == false	then
		setflag(OwnerID(),544669,1)
	end
	if	CheckFlag( OwnerID(), 544669 ) == true	and	CheckFlag( OwnerID(), 544670 ) == true	and	CheckFlag( OwnerID(), 544671 ) == true	and	CheckFlag( OwnerID(), 544672 ) == true	then
		setflag(OwnerID(),544673,1)
		setflag(OwnerID(),544669,0)
		setflag(OwnerID(),544670,0)
		setflag(OwnerID(),544671,0)
		setflag(OwnerID(),544672,0)		
	end
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), "[SC_208748_BOOK_1]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_208748_BOOK_2]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_208748_BOOK_3]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_208748_BOOK_4]" )	--下一頁，字串為書頁內文
	ShowBorder( OwnerID(), 0, str,"ScriptBorder_Texture_Paper" )
end

function LuaS_208749_book_0()	--208281整理過的實驗檔案
	local Str = "["..GetUseItemGUID(OwnerID()).."]"
	if	CheckFlag( OwnerID(), 544670 ) == false	and	CheckFlag( OwnerID(), 544673 ) == false	then
		setflag(OwnerID(),544670,1)
	end
	if	CheckFlag( OwnerID(), 544669 ) == true	and	CheckFlag( OwnerID(), 544670 ) == true	and	CheckFlag( OwnerID(), 544671 ) == true	and	CheckFlag( OwnerID(), 544672 ) == true	then
		setflag(OwnerID(),544673,1)
		setflag(OwnerID(),544669,0)
		setflag(OwnerID(),544670,0)
		setflag(OwnerID(),544671,0)
		setflag(OwnerID(),544672,0)		
	end
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), "[SC_208749_BOOK_1]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_208749_BOOK_2]" )	--下一頁，字串為書頁內文
	ShowBorder( OwnerID(), 0, str,"ScriptBorder_Texture_Paper" )
end

function LuaS_208750_book_0()	--208281整理過的實驗檔案
	local Str = "["..GetUseItemGUID(OwnerID()).."]"
	if	CheckFlag( OwnerID(), 544671 ) == false	and	CheckFlag( OwnerID(), 544673 ) == false	then
		setflag(OwnerID(),544671,1)
	end
	if	CheckFlag( OwnerID(), 544669 ) == true	and	CheckFlag( OwnerID(), 544670 ) == true	and	CheckFlag( OwnerID(), 544671 ) == true	and	CheckFlag( OwnerID(), 544672 ) == true	then
		setflag(OwnerID(),544673,1)
		setflag(OwnerID(),544669,0)
		setflag(OwnerID(),544670,0)
		setflag(OwnerID(),544671,0)
		setflag(OwnerID(),544672,0)		
	end
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), "[SC_208750_BOOK_1]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_208750_BOOK_2]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_208750_BOOK_3]" )	--下一頁，字串為書頁內文
	ShowBorder( OwnerID(), 0, str,"ScriptBorder_Texture_Paper" )
end

function LuaS_208751_book_0()	--208281整理過的實驗檔案
	local Str = "["..GetUseItemGUID(OwnerID()).."]"
	if	CheckFlag( OwnerID(), 544672 ) == false	and	CheckFlag( OwnerID(), 544673 ) == false	then
		setflag(OwnerID(),544672,1)
	end
	if	CheckFlag( OwnerID(), 544669 ) == true	and	CheckFlag( OwnerID(), 544670 ) == true	and	CheckFlag( OwnerID(), 544671 ) == true	and	CheckFlag( OwnerID(), 544672 ) == true	then
		setflag(OwnerID(),544673,1)
		setflag(OwnerID(),544669,0)
		setflag(OwnerID(),544670,0)
		setflag(OwnerID(),544671,0)
		setflag(OwnerID(),544672,0)		
	end
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), "[SC_208751_BOOK_1]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_208751_BOOK_2]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_208751_BOOK_3]" )	--下一頁，字串為書頁內文
	ShowBorder( OwnerID(), 0, str,"ScriptBorder_Texture_Paper" )
end

function LuaS_MK_117213()
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID(), "[SC_117213_1]" , "LuaS_MK_117213_1",0 )
	MoveToFlagEnabled(OwnerID(),false)
end

function LuaS_MK_117213_1()
	AdjustFaceDir(TargetID(),OwnerID(),180)
	SetSpeakDetail(OwnerID(),"[SC_117213_2]")
	AddSpeakOption( OwnerID(), TargetID(), "[SC_117213_3]" , "LuaS_MK_117213_2",0 )	
end

function LuaS_MK_117213_2()
	AdjustFaceDir(TargetID(),OwnerID(),0)
	SetSpeakDetail(OwnerID(),"[SC_117213_4]")
	AddSpeakOption( OwnerID(), TargetID(), "[SC_117213_1]" , "LuaS_MK_117213_1",0 )	
end

function Lua_Zone19_MK_CheckNotBoss()
	local a = ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) 
	if	a == 104705	or	a == 104916	or	a == 116392	or	a==107187	or a==107189	or a==104989 or a==107188 then
		return	false
	else
		return	true
	end
end


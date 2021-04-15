---423348
----使用物品 給BUFF
function LuaS_423348_0()---使用物品給BUFF507169。
	AddBuff( OwnerID(),507169,1,60)
end
--水的範圍劇情 115851 分為有BUFF 以及沒BUFF 有BUFF 給與 旗標
function LuaS_423348_1()---115851--544253
 	SetPlot( OwnerID() , "Range" , "LuaS_423348_2" , 150 )
end
function LuaS_423348_2()
	if(CheckAcceptQuest( OwnerID() , 423348 ) == true ) and (CheckFlag(OwnerID(),544253)==false) and (CheckBuff( OwnerID() , 507169)==true) then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423348_1]" , 0 )---
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423348_1]" , 0 )---
		SetFlag(OwnerID() ,544253, 1 )--
	end
	if(CheckAcceptQuest( OwnerID() , 423348 ) == true ) and (CheckFlag(OwnerID(),544253)==false) and (CheckBuff( OwnerID() , 507169)==false) then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423348_2]" , 0 )---
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423348_2]" , 0 )---
	end
end
---------------------
---地的魔法陣  範圍劇情 有怪追殺。
function LuaS_423348_3()---115852--544254
 	SetPlot( OwnerID() , "Range" , "LuaS_423348_4" , 150)
end
function LuaS_423348_4()
	if	CheckAcceptQuest(OwnerID(),423348)==true  and ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 and  (CheckFlag(OwnerID(),544254)==false) and (CheckBuff( OwnerID() , 507169)==true)then
		WriteRoleValue( TargetID() , EM_RoleValue_Register , 77)
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423348_3]" , 0 )---
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423348_3]" , 0 )---這個地方的結界水晶，像是失去力量，不再泛出光芒。
		BeginPlot( TargetID() , "LuaS_423348_5" , 0 )
		SetFlag(OwnerID() ,544254, 1 )--
	end
	if	CheckAcceptQuest(OwnerID(),423348)==true  and ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 and  (CheckFlag(OwnerID(),544254)==false) and (CheckBuff( OwnerID() , 507169)==false)then
	---	WriteRoleValue( TargetID() , EM_RoleValue_Register , 77 )
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423348_2]" , 0 )---
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423348_2]" , 0 )---
	end
	if	CheckAcceptQuest(OwnerID(),423348)==true  and ReadRoleValue( TargetID() , EM_RoleValue_Register ) > 0 and  (CheckFlag(OwnerID(),544254)==false) and (CheckBuff( OwnerID() , 507169)==true)then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423348_8]" , 0 )---
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423348_8]" , 0 )---這個地方的結界水晶，像是失去力量，不再泛出光芒。

	end

end

function LuaS_423348_5()
		local Obj = Role:new( TargetID()  )
		local BaseX = Obj :X()		
		local BaseY = Obj :Y();		
		local BaseZ = Obj :Z();		
		local BaseDir = Obj:Dir();		
		local DD= CreateObj(104080, BaseX+80, BaseY, BaseZ+80, BaseDir, 1 )        
		local CC= CreateObj(104080, BaseX+50, BaseY, BaseZ+50, BaseDir, 1 )  
		local KK= CreateObj(104080, BaseX+75, BaseY, BaseZ+75, BaseDir, 1 )  		      
		AddToPartition( DD,0)    
		AddToPartition( CC,0)
		AddToPartition( KK,0)  
		SetAttack( DD , TargetID()  )     
		SetAttack( CC , TargetID()  ) 
		SetAttack( KK , TargetID()  )
		Yell(  DD , "[SC_423348_4]" , 3 )---幻術，對他似乎起不了反應。
		sleep(10)
   		Yell(  CC , "[SC_423348_5]" , 3 )---那麼直接幹掉他吧     
		BeginPlot(DD,"LuaQ_421177_Sui",0)
		BeginPlot(CC,"LuaQ_421177_Sui",0)
		BeginPlot(KK,"LuaQ_421177_Sui",0)
		for i=1, 180, 1 do
			if (CheckID( DD) == true   or  CheckID( KK) == true or  CheckID(CC)==true)    and  i==180  then
				Delobj( DD ) 
				Delobj( CC)
				Delobj( KK)
				break
			end
			if (CheckID( DD) == false   and  CheckID( KK) == false or  CheckID(CC)==false)   then
				break
			end
			sleep(10)
		end
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end
---------------------------
---風之魔法陣。
function LuaS_423348_6()
 	SetPlot( OwnerID() , "Range" , "LuaS_423348_7" , 150)
end
function LuaS_423348_7()
	if	CheckAcceptQuest(OwnerID(),423348)==true   and  (CheckFlag(OwnerID(),544255)==false) and (CheckBuff( OwnerID() , 507169)==true) and  (CheckFlag(OwnerID(),544254)==true) and  (CheckFlag(OwnerID(),544253)==true)  then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423348_6]" , 0 )---
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423348_6]" , 0 )---[115854]皺起了眉頭，注視著眼前被破壞的結界。
		SetFlag(OwnerID() ,544255, 1 )--
	end
	if	(CheckAcceptQuest( OwnerID() , 423348 ) == true ) and (CheckFlag(OwnerID(),544255)==false) and (CheckBuff( OwnerID() , 507169)==false) and  (CheckFlag(OwnerID(),544254)==true) and  (CheckFlag(OwnerID(),544253)==true)  then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423348_7]" , 0 )---
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423348_7]" , 0 )---[115854]帶著憂慮的看著前方，或許你該使用[207699]看看結界到底發生了什麼事？
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------
---------423349
---------423349
function LuaS_423349_0()---利用這個780546 旗子
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),423349)==true )and  (CheckFlag(OwnerID(),544256)==false )then
 		if	ReadRoleValue( TargetID() , EM_RoleValue_Register+1  ) == 0 then
			AddSpeakOption(OwnerID(),TargetID()," [SC_423349_1]","LuaS_423349_2",0)--- 怎麼了嗎？
		end
		if	ReadRoleValue( TargetID() , EM_RoleValue_Register+1  ) == 1 then
			AddSpeakOption(OwnerID(),TargetID()," [SC_423349_1]","LuaS_423349_1",0)--- 怎麼了嗎？
		end
	end
end
function LuaS_423349_1()---有人在演戲時，所出現的對話。
	SetSpeakDetail(OwnerID(),"[SC_423349_2]")---
end

function LuaS_423349_2()---沒有人演戲，要開演。
	CloseSpeak( OwnerID() )
--	if	ReadRoleValue( TargetID() , EM_RoleValue_Register+1  ) == 0 then
	if (CheckAcceptQuest(OwnerID(),423349)==true )and  (CheckFlag(OwnerID(),544256)==false )then
		BeginPlot( TargetID() , "LuaS_423349_3" , 0 )
	end
end
function LuaS_423349_3()---種出兩隻演戲。 KK是阿雷斯奔爾 MT是安特克羅 115857  ---
	WriteRoleValue( OwnerID(), EM_RoleValue_Register+1 ,1) 
 	AddBuff(TargetID(),507170,1,60)
	local KK = Lua_DW_CreateObj("flag" ,115972,780546,0,0 )---
	SetModeEx(KK ,EM_SetModeType_ShowRoleHead ,false) -----------秀出頭像框
	SetModeEx(KK ,EM_SetModeType_HideName ,true) -----------秀出名稱
	WriteRoleValue (OwnerID()  , EM_RoleValue_Register9,TargetID() )
	WriteRoleValue (KK , EM_RoleValue_Register9,TargetID() )
	WriteRoleValue (OwnerID()  , EM_RoleValue_Register7,KK  )
	BeginPlot(OwnerID(),"LuaS_423349_owner",0)	
	BeginPlot(KK,"LuaS_423349_4",0)	
end
function LuaS_423349_4()---
	local TargetID = ReadRoleValue(OwnerID(),EM_RoleValue_Register9)--	
	local KK = Lua_DW_CreateObj("flag" ,115856,780546,0,1 )---
	WriteRoleValue (OwnerID(),EM_RoleValue_Register1,KK )
	DisableQuest( KK ,true )
	local MT = Lua_DW_CreateObj("flag" ,115857,780546,1,0 )---
	WriteRoleValue (OwnerID(),EM_RoleValue_Register3,MT )
	DisableQuest( MT ,true )
----	local DD = Lua_DW_CreateObj("flag" ,115921,780546,22,0 )---	local KK = Lua_DW_CreateObj("flag" ,115921,80546,0,1 )---115921 115972,
	local DD = Lua_DW_CreateObj("flag" ,115903,780546,22,0 )---
	WriteRoleValue (OwnerID(),EM_RoleValue_Register2,DD )
	Lua_ObjDontTouch( DD ) ----不讓玩家看到
	DisableQuest( DD ,true )
	SAY(KK,"[SC_423349_3]")---
	sleep(10)
	ScriptMessage(TargetID ,TargetID , 0, "[SC_422897_8]" , 0 )---
	ScriptMessage(TargetID ,TargetID , 2, "[SC_422897_8]" , 0 )---
	BeginPlot(OwnerID(),"LuaS_423349_KK",0)
	AddToPartition( MT,0)   
	DW_MoveToFlag(MT ,780546,2, 0,1)
	SAY(KK,"[SC_423349_4]")	---哼，又是幻影...別以為用相同的臉孔，就能騙得倒我。
	SetDefIdleMotion(OwnerID(), ruFUSION_MIME_ATTACK_1H )
---shield_bash
	PlayMotion( KK ,    ruFUSION_ACTORSTATE_SHIELD_BASH  )
	DW_MoveToFlag(KK ,780546,3, 0,1)
--動作 砍殺 unarmed_attack04
--	PlayMotionEX( YA , ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
PlayMotion( KK ,   ruFUSION_ACTORSTATE_ATTACK_1H)
--安特克羅做動作回應 
	PlayMotion( MT,    ruFUSION_ACTORSTATE_BUFF_SP01)
	CastSpell( MT, MT,495920)
---PlayMotion(MT ,ruFUSION_ACTORSTATE_CAST_LOOP)
	sleep(25)
----安特 cast01 continuous_cast
	SAY(MT,"[SC_423349_5]")---[115858]，我們有多少年沒見面？
	sleep(25)
	PlayMotion( KK ,   ruFUSION_ACTORSTATE_ATTACK_1H)	
	SAY(KK,"[SC_423349_6]")
	sleep(25)
--動做 砍殺
	SAY(KK,"[SC_423349_7]")--你這怪物想讓我上當，是絕對不可能的。
	PlayMotion( KK ,   ruFUSION_ACTORSTATE_ATTACK_1H)
	sleep(30)
	SAY(MT,"[SC_423349_8]")---[115858]，還記得聖王之沁嗎？那時我們灌入了這個，引來了貝登雪的怒視，還記得吧？
---法術
	CastSpell( MT, MT,492664)
	AddToPartition( DD,0)   
	---SetModeEx(DD ,EM_SetModeType_ShowRoleHead ,false) -----------關頭像框
	---SetModeEx(DD ,EM_SetModeType_HideName ,true) -----------隱名稱-
	AddBuff( DD , 505464  , 0 , -1 )----580921	505464 
	SetDefIdleMotion(KK,ruFUSION_MIME_IDLE_STAND)
	sleep(50)	
	SAY(KK,"[SC_423349_9]")---不可能...這怎麼可能？這是精靈聖王的玩笑嗎？
	PlayMotion( KK ,   ruFUSION_ACTORSTATE_EMOTE_SPEAK)	
	sleep(30)
	SAY(MT,"[SC_423349_10]")---[115858]，我由大地中甦醒過來。
	PlayMotion( MT ,   ruFUSION_ACTORSTATE_EMOTE_SPEAK)	
	if 	CheckID(TargetID)== true  and CheckAcceptQuest(  TargetID,423349 ) == true and GetDistance(TargetID , OwnerID() ) < 250 and CheckBuff(TargetID , 507170 )== true  	 then
		SetFlag(TargetID , 544256 , 1 )
		CancelBuff( TargetID , 507170)
	end
	if 	CheckID(TargetID)== true  and CheckAcceptQuest(  TargetID,423349 ) == true and GetDistance(TargetID , OwnerID() ) > 250	and CheckBuff(TargetID , 507170 )== true   then
			CancelBuff( TargetID() , 507170)
			ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423349_11]" , 0 ) --超出距離，您沒有完成任務。
			ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423191_11]" , 0 ) --超出距離，您沒有完成任務。
	end
	sleep(10)
	delobj(DD)
	delobj(KK)
	delobj(MT)
	delobj(OwnerID())
---	WriteRoleValue( OwnerID(), EM_RoleValue_Register+1 ,0) 
end

function LuaS_423349_owner()
	local KK = ReadRoleValue(OwnerID(),EM_RoleValue_Register7)--
	while true do
		if 	CheckID( KK)== false	then
			WriteRoleValue( OwnerID(),  EM_RoleValue_Register+1   ,0) 
			break
		end
	sleep(10)
	end
end
function LuaS_423349_KK()--檢查用
	local KK = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)--
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register9)--
	local MT= ReadRoleValue(OwnerID(),EM_RoleValue_Register3)--
	local DD=ReadRoleValue(OwnerID(),EM_RoleValue_Register2)--
	for i=1,60,1 do
		sleep(10)
		if 	CheckID( player)== false or (CheckAcceptQuest(player,423349)==false) then

				break
		end
		if 	CheckID( player)== true  and CheckAcceptQuest(   player,423349 ) == true and GetDistance( player , OwnerID() ) > 250	then
			ScriptMessage( player, player, 1 , "[SC_423349_11]" , 0 ) --超出距離，您沒有完成任務。
			ScriptMessage( player , player , 0 , "[SC_423191_11]" , 0 ) --超出距離，您沒有完成任務。
				break
		end
	end
	if CheckID( player)== true then
		CancelBuff( player, 507170)
	end
	if 	CheckID( DD)== true then
			delobj(DD)
	end
	if 	CheckID( MT)== true then
					delobj(MT)
	end
	if 	CheckID( KK)== true then
			delobj(KK)
	end
	delobj(OwnerID())	
end
--------------------------------------
function LuaS_423350_0()--115860安特克羅的傳送劇情。 使用旗子780697。
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),423350)==true )and  (CheckFlag(OwnerID(),544247)==false )then
		AddSpeakOption(OwnerID(),TargetID()," [SC_423007_4]","LuaS_423350_1",0)--- 這是什麼意思？
	end
end

function LuaS_423350_1()	
	CloseSpeak( OwnerID() )	
	if (CheckAcceptQuest(OwnerID(),423350)==true )and  (CheckFlag(OwnerID(),544247)==false ) and 	ReadRoleValue(OwnerID(), EM_RoleValue_IsDead)~=1	then
		BeginPlot( OwnerID(), "LuaS_423350_2", 0)
	end
end
function LuaS_423350_2()
	if  	ReadRoleValue(OwnerID(), EM_RoleValue_IsDead)~=1	then
		SetPosByFlag( OwnerID(), 780697 , 0)
		SetFlag( OwnerID() , 544257, 1 )
	end
end
-----
--妮克絲的對話劇情。115862
function LuaS_423350_3()
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),423350)==true )and  (CheckFlag(OwnerID(),544258)==false) then
 		if	ReadRoleValue( TargetID() , EM_RoleValue_Register+1  ) == 0 then
			AddSpeakOption(OwnerID(),TargetID()," [SC_423350_1]","LuaS_423350_5",0)--- (向[115862]轉告結界的相關事宜。)
		end
		if	ReadRoleValue( TargetID() , EM_RoleValue_Register+1  ) == 1 then
			AddSpeakOption(OwnerID(),TargetID()," [SC_423350_1]","LuaS_423350_4",0)--- 怎麼了嗎？
		end
	end
end
function LuaS_423350_4()
	SetSpeakDetail(OwnerID(),"[SC_423350_2]")---
end

function LuaS_423350_5()---
	CloseSpeak( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),423350)==true )and  (CheckFlag(OwnerID(),544258)==false) then
		WriteRoleValue( TargetID(), EM_RoleValue_Register+1 ,1) 
		BeginPlot( TargetID() , "LuaS_423350_6" , 0 )
	end
end

function LuaS_423350_6()---
	local KK = Lua_DW_CreateObj("flag" ,115923,780697,1,1 )---種出一個掌控全部的NPC的魔王。
	Lua_ObjDontTouch( KK )
	DisableQuest( KK ,true )
	----SetModeEx(KK ,EM_SetModeType_ShowRoleHead ,false) -----------	
	---SetModeEx(KK ,EM_SetModeType_HideName ,true) -----------
	WriteRoleValue( KK, EM_RoleValue_Register7 ,TargetID()) 
	BeginPlot( KK , "LuaS_423350_7" , 0 )
	while true do
		sleep(10)
		if 	CheckID( KK)== false  then
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 ,0) 
		break
		end
	end
end

function LuaS_423350_7()---把玩家固定起來。使用BUFF507171  115867安特MT 115866艾貝AB 115865妮克NK 115864 阿雷-TT
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register7)--
	SetPosByFlag(  player ,780697 , 23)
	AddBuff(player,507171,1,60)
	local MT = Lua_DW_CreateObj("flag" ,115867,780697,1,1 )---
	local AB = Lua_DW_CreateObj("flag" ,115866,780697,2,1 )---
	local NK = Lua_DW_CreateObj("flag" ,115865,780697,3,1 )---
	local TT = Lua_DW_CreateObj("flag" ,115864,780697,4,1 )---
	DisableQuest( MT ,true )
	DisableQuest( AB ,true )
	DisableQuest( NK ,true )
	DisableQuest( TT ,true )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register2 ,MT) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register3 ,AB) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register4 ,NK) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register5 ,TT) 
	BeginPlot(OwnerID() , "LuaS_423350_8" , 0 )
	SAY(NK,"[SC_423350_3]")---結界果然被破壞了～在你們離開後，我們受到黑影的襲擊，所幸精靈王現身拯救了我們。
	sleep(35)
	SAY(AB,"[SC_423350_4]")---精靈王[115859]？您的樣貌似乎未曾改變過，與我在書中看見的圖象一模一樣。
---emote_salute02   ruFUSION_ACTORSTATE_EMOTE_SALUTE
PlayMotion(AB ,ruFUSION_ACTORSTATE_EMOTE_SALUTE)
	AdjustFaceDir( AB , MT , 0 )
	sleep(35)
	AdjustFaceDir( TT , MT , 0 )
	SAY(TT,"[SC_423350_5]")---我王，我必須告訴你一個沉痛的事實，在你沉睡的這段日子，我族墮入了深沉的黑暗裡
PlayMotionEX( TT  , ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	sleep(30)
	AdjustFaceDir( MT , TT , 0 )
	SAY(TT,"[SC_423350_6]")--我污辱了你所贈與的配劍，無法捍衛住我族的榮耀。
	sleep(25)
	SAY(MT,"[SC_423350_7]")---[115858]，這並不是你的錯，而是精靈聖王給予的試煉。
PlayMotion(MT , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(25)
	SAY(MT,"[SC_423350_8]")---還記得不違合、萬物順其自然而生，仰望心中不變的信念？
PlayMotion(MT , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(25)
	SAY(TT,"[SC_423350_9]")--但，我仍沒做到堅定信念...為榮耀獻身...
	sleep(25)
	SAY(NK,"[SC_423350_10]")--做錯的也許是我，精靈王。如果不是我由森林中吸取生命之力化為自然之力，或許這些精靈就不會如此渴求自然之力。
	sleep(40)
	AdjustFaceDir( MT , NK , 0 )
	SAY(MT,"[SC_423350_11]")--生命依循著自我的軌道，自然的導引讓我來到了這，扭曲的能量在森林蔓延，現在需要做的是彌平森林的傷痛。
	PlayMotion(MT , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
--PlayMotion(MT , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
---PlayMotion(MT ,  ruFUSION_MIME_EMOTE_HEAD_SHAKE )
	sleep(30)
	SAY(MT,"[SC_423350_12]")--生命依循著自我的軌道，自然的導引讓我來到了這，扭曲的能量在森林蔓延，現在需要做的是彌平森林的傷痛。
PlayMotion(MT , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(40)
	SAY(AB,"[SC_423350_13]")--或許還參雜黑影的影響？偉大的精靈王。您還記得您的兄弟精靈王[112852]嗎？我代表[112852]王室而來...
-------emote_speak01
PlayMotion(AB , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(50)
	AdjustFaceDir( MT , AB , 0 )
	SAY(AB,"[SC_423350_14]")--在您動手處這些事前，是否能請您暫時聆聽我族的故事與請求呢？
PlayMotion(AB , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
---emote_speak01
	sleep(40)

	SAY(AB,"[SC_423350_15]")--在您動手處這些事前，是否能請您暫時聆聽我族的故事與請求呢？
----emote_beg
PlayMotion(AB , ruFUSION_ACTORSTATE_EMOTE_BEG)
	sleep(30)
	if 	CheckID( player)== true  and CheckAcceptQuest(  player,423350 ) == true and	CheckBuff(player , 507171 )== true then
		SetFlag(player ,544258, 1 ) 
		CancelBuff( player , 507171)
	end
	sleep(20)
	delobj(MT)
	delobj(AB)
	delobj(NK)
	delobj(TT)
	delobj(OwnerID())
end

function LuaS_423350_8()
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register7)--
	local MT =ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
	local AB =ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
	local NK =ReadRoleValue(OwnerID(),EM_RoleValue_Register4)
	local TT =ReadRoleValue(OwnerID(),EM_RoleValue_Register5)
	for i=1,60,1 do
		sleep(10)
		if 	CheckID( player)== false  or (CheckAcceptQuest(player,423350)==false) then
			break
		end
	end
	if CheckID( player)== true then
		CancelBuff( player, 507171)
	end
	if 	CheckID(MT)== true then
		delobj(MT)
	end
	if 	CheckID(AB)== true then
		delobj(AB)
	end
	if 	CheckID(NK)== true then
		delobj(NK)
	end
	if 	CheckID(TT)== true then
		delobj(TT)
	end
	delobj(OwnerID())
end
--------------423351--------使用780432
---紙條的石碑介面
function LuaS_207702()--
	ClearBorder( OwnerID());	--初始化石碑介面
	AddBorderPage( OwnerID(), "[SC_207702]")
	ShowBorder( OwnerID(), 0, "[207702]", "ScriptBorder_Texture_Paper" );
end
---點擊石頭的劇情  讓石頭 和小精靈  獲得到某個東西就CLIENT
function LuaS_423351_USECHECK()
	if	  CountBodyItem( OwnerID(), 207704 )<1 then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423351_1]", 0 )--缺乏[207704]，[115899]沒有起任何的反應。
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423351_1]", 0 )--缺乏[207704]，[115899]沒有起任何的反應。
		return -1
	elseif	 CountBodyItem( OwnerID(), 207704 )>=1 and CountBodyItem( OwnerID(), 207705 )<5 then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423351_2]", 0 )--缺乏[<S>207705]，[115899]沒有起任何的反應。
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423351_2]", 0 )--缺乏[<S>207705]，[115899]沒有起任何的反應。
		return -1
	else	
		return 1
	end
end
function LuaS_423351_USEOK()
	if	(CheckAcceptQuest(OwnerID(),423351)==true )and   CountBodyItem( OwnerID(), 207705 )>=5 then 
		DelBodyItem( OwnerID() , 207705 , 5)
		BeginPlot( TargetID(),"LuaS_423351_1", 0)
		return 1
	else
		return -1
	end
end
function LuaS_423351_1()
	Hide(OwnerID())
	local COCO = Lua_DW_CreateObj("flag" ,115900,780432,1,1 )---
	DisableQuest( COCO ,true )
	SAY(COCO,"[SC_423351_3]")--艾艾，妳還好嗎？
	sleep(20)
	SAY(COCO,"[SC_423351_4]")--不是艾艾，是艾艾的幫手？
	sleep(20)
	if 	CheckID( TargetID())== false or CheckAcceptQuest(TargetID(),423351)==false	then
		delobj(COCO)
		Show(OwnerID(),0)
		LuaFunc_ResetObj( OwnerID() )
	end
	SAY(COCO,"[SC_423351_5]")---艾艾的東西，我有好好的保管起來了。
----	CastSpell( OwnerID(), OwnerID(), 494493)
	local BAG = Lua_DW_CreateObj("flag" ,115898,780432,2,1 )
	sleep(10)
	SAY(COCO,"[SC_423351_6]")---現在就趕快把它帶走吧！
	sleep(20)
	if 	CheckID( TargetID())== false or CheckAcceptQuest(TargetID(),423351)==false then
		delobj(COCO)
		Show(OwnerID(),0)
		LuaFunc_ResetObj( OwnerID() )
	end
	SAY(COCO,"[SC_423351_7]")--我也要跟著你，回到艾艾身邊。
	DW_MoveToFlag(COCO ,780432,2, 0,1)
	sleep(20)
----	CastSpell( OwnerID(), OwnerID(), 494493)
	delobj(COCO)
	SetPlot( BAG,"touch","LuaS_423351_BAG", 20)
	BeginPlot( BAG,"LuaS_423351_BAG_1" ,0)
	for i=1,18,1 do
		if CheckID( BAG)== false then
			break	 
		end
		sleep(10)
	end
	Show(OwnerID(),0)
	LuaFunc_ResetObj( OwnerID() )
end

function LuaS_423351_BAG()
	if CountBodyItem ( OwnerID(), 207703 ) == 0 then
		GiveBodyItem(OwnerID(),207703,1)
	end
end
function LuaS_423351_BAG_1()
	Group = SearchRangePlayer(OwnerID() , 250)
	for i=1,15,1 do
	sleep(10)
		Num = 0
		for i=0,table.getn(Group)-1 do
			if	CheckAcceptQuest( Group[i], 423351 ) == true	and
				CountBodyItem( Group[i] , 207703 ) ==0	then
				Num = Num + 1
			end
		end
		if	Num == 0		then
			break
		end
		if	 i==13 then
			for i=0,table.getn(Group)-1 do
				if	CheckAcceptQuest( Group[i],  423351)==true and CountBodyItem( Group[i] , 207703 ) ==0 then
					ScriptMessage( Group[i], Group[i], 0, "[SC_423351_8]", 0 )--由於你緩慢的動作，讓[115900]感到不耐煩，她將[115898]收了起來，並又躲回結界之中。
					ScriptMessage( Group[i], Group[i], 1, "[SC_423351_8]", 0 )--由於你緩慢的動作，讓[115900]感到不耐煩，她收了起來，並又躲回了結界之中。
				end
			end	
		break
		end
	end
	delobj(OwnerID())
end

----------------結束的演戲507172 愛貝 AB 安特MT 780432 4
function LuaS_423351_complete()
	AddBuff(TargetID(),507172,1,50)
	DisableQuest( OwnerID() ,true )
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 50 )
	local MT = Lua_DW_CreateObj("flag" ,115901,780697,1,1 )---
	local AB = Lua_DW_CreateObj("flag" ,115902,780697,2,1 )---
	DisableQuest( MT ,true )
	DisableQuest( AB ,true )
	DW_MoveToFlag(AB ,780432,4, 0,1)
	SAY(AB,"[SC_423351_9]")---精靈王，為了代表我王對您的敬意，我王令我帶來屬於過去的信物，也就是精靈王[112852]當初與您共同使用過的配劍瑞居託斯。
PlayMotionEX( AB  , ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	sleep(25)
	SAY(AB,"[SC_423351_18]")---精靈王，為了代表我王對您的敬意，我王令我帶來屬於過去的信物，也就是精靈王[112852]當初與您共同使用過的配劍瑞居託斯。
	sleep(25)
	SAY(AB,"[SC_423351_10]")---另外還有個務必請您收下的東西，這是[ZONE_THE GREEN TOWER]長老託我交付給您的聖土。
	sleep(30)
	SAY(MT,"[SC_423351_11]")
PlayMotion(MT , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(25)
	SAY(AB,"[SC_423351_12]")---
	sleep(25)
	SAY(MT,"[SC_423351_13]")---你們的心意，我都感受到了。
PlayMotion( MT , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	sleep(25)
	SAY(AB,"[SC_423351_14]")--另外，我王由衷的希冀您能回到王國，教導所有精靈更高雅的精靈戰技，並一敘千年來的時光。
	sleep(30)
	SAY(AB,"[SC_423351_15]")--當然這個答覆，並不急於一時，現在更重要的是解救在此的族人，讓他們再度恢復精靈之傲。
	sleep(30)
	SAY(AB,"[SC_423351_16]")--我也會盡一己之力，成為你們的助手，希望你們能接受這個提議。
	sleep(30)
	SAY(MT,"[SC_423351_17]")--我明白妳的心意，那麼接下來就有勞你們了。
PlayMotion( MT , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	sleep(30)
	if 	CheckID( TargetID() ) == true  then
		CancelBuff( TargetID() , 507172)
	end
	sleep(10)
	delobj(MT)
	delobj(AB)
	SetPlot( OwnerID() , "touch" , "" , 50 )
	DisableQuest( OwnerID() ,false )
end

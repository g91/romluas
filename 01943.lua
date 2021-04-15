------------------423352
---淨化凝石
function LuaS_423352_USECHECK()
	if	CountBodyItem( OwnerID(), 207738 )<1	then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423352_1]", 0 )--沒有[207739]，無法淨化。
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423352_1]", 0 )--
		return -1
	elseif	 CountBodyItem( OwnerID(), 207739 )>=5  then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423352_2]", 0 )--或許你該盡快將你的淨化成果，告知精靈王。
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423352_2]", 0 )--
		return -1
	else	
		return 1
	end
end
function LuaS_423352_USEOK()
	IF  CountBodyItem( OwnerID(), 207738 )>=1   and CheckAcceptQuest( OwnerID() , 423352 ) == true then
		DelBodyItem( OwnerID() , 207738 , 1)
		GiveBodyItem( OwnerID() ,  207739 , 1 ) 
		BeginPlot( TargetID(),"LuaS_207738_1", 0)
		return 1
	else
		return -1
	end
end
function LuaS_207738_1()
	Hide( OwnerID())
	local KK = LuaFunc_CreateObjByOBj(115905 ,  OwnerID() )
--施放法術
	BeginPlot(  OwnerID(), "LuaS_207738_2" , 0 )
	ScriptMessage( TargetID(), TargetID(), 1, "[SC_423352_3]", 0 ); -------這個[115904]被您淨化了。
	ScriptMessage( TargetID(), TargetID(), 0, "[SC_423352_3]", 0 )
end

function LuaS_207738_2()
	sleep(300)
	LuaFunc_ResetObj( OwnerID() )
end
----使用BUFF 507173  種出 MT(115906) KK(115907)
function LuaS_423352_complete()
	AddBuff(TargetID(),507173,1,30)	
	DisableQuest( OwnerID() ,true )
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 50 )
	local MT = Lua_DW_CreateObj("flag" ,115906,780697,1,1 )---
	local KK = Lua_DW_CreateObj("flag" ,115907,780697,4,1 )---	
	DisableQuest( MT ,true )
	DisableQuest( KK ,true )
	AdjustFaceDir( KK , MT , 0 )
	AdjustFaceDir( MT , KK , 0 )
	SAY(MT,"[SC_423352_4]")--接下來，我打算與王妃見面。阿爾霍，這裡就先交給你了。
	PlayMotion(MT , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	SAY(MT,"[SC_423352_5]")--不要擔憂、恐懼，一切都迎刃而解，我們會安然度過精靈聖王的試煉。
	PlayMotion(MT , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	PlayMotion( KK , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	SAY(KK,"[SC_423352_6]")---我知道了...但伊利雅爾不同於以前，你絕不能忽視這一點。
	PlayMotion( KK, ruFUSION_ACTORSTATE_EMOTE_SALUTE2)
	sleep(30)
	SAY(MT,"[SC_423352_7]")--我明白，妮克絲與艾貝洛妮雅、[$PLAYERNAME]，就交給你了。
	PlayMotion(MT , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	SAY(MT,"[SC_423352_8]")--謹記我所訴說的...讓萬物回歸原始。
	PlayMotion( MT ,  ruFUSION_ACTORSTATE_EMOTE_POINT)	
--做特效。移動 消失。
 	sleep(10)
	DW_MoveToFlag(MT ,780697,25, 0,1)--要在加動作
	delobj(MT)
	sleep(30)
	SAY(KK,"[SC_423352_9]")--
	sleep(20)
--	ScriptMessage( TargetID(), TargetID(), 0 , "[SC_423352_9]" , 0 )
	local Player = SearchRangePlayer ( OwnerID() , 500 )
	for i=0,table.getn(Player)-1 do
		if (CheckCompleteQuest( player[i], 423352 )==true) and	(CheckAcceptQuest( player[i] , 423353 ) == false ) and CheckFlag( player[i],544291)==false and CheckBuff(player[i] , 507173 )== true  then
			SetFlag(player[i],544291,1)
		end
	end
	if 	CheckID( TargetID() ) == true  then
		CancelBuff( TargetID() , 507173)
	end
	delobj(KK)
	SetPlot( OwnerID() , "touch" , "" , 50 )
end

----------------------------------------------------------------------------------------
----------------423353

function LuaS_423353_1()
	SetSpeakDetail(OwnerID(),"[SC_423353_2]")---
 	if	CheckAcceptQuest( OwnerID() , 423353 ) == true	and	CheckFlag( OwnerID(),544259) == false and	CountBodyItem( OwnerID(), 207740)>=1 and ReadRoleValue(OwnerID(), EM_RoleValue_IsDead)~=1  then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423353_3]","LuaS_423353_2",0)
	end
end

function LuaS_423353_2()	
	CloseSpeak( OwnerID() )
	if	CheckAcceptQuest( OwnerID() , 423353 ) == true	and	CheckFlag( OwnerID(),544259) == false and	 CountBodyItem( OwnerID(), 207740)>=1  and ReadRoleValue(OwnerID(), EM_RoleValue_IsDead)~=1 	then
		DelBodyItem( OwnerID() , 207740 , 1)
		BeginPlot( TargetID(), "LuaS_423353_3", 0)
	end
end
function LuaS_423353_3()
	DisableQuest(OwnerID(),true)	
---	Hide(OwnerID())
	SetModeEx(OwnerID(),EM_SetModeType_ShowRoleHead ,false) -----------	
	SetModeEx(OwnerID(),EM_SetModeType_HideName ,true) -----------
	SetModeEx(OwnerID(),EM_SetModeType_Show,false) 

--建立戰鬥用替身 &防止戰鬥後留存的問題 &指定目標 &完成條件
	local NPC = Lua_DW_CreateObj("obj",104078,OwnerID())
--	local MM = Lua_DW_CreateObj("obj",115972,OwnerID())
	SetRoleCamp( NPC  , "Visitor" ) 
	Say(NPC,"[SC_423353_4]")--滾開！誰都不能阻止我轉化大地的氣息，為了精靈...為了生存...阻礙在我面前的，都得死...
	sleep(30)
	Say(NPC,"[SC_423353_5]")---你對我做了什麼？好痛苦...
	SetRoleCamp( NPC  , "Monster" ) 
	SetPlot(NPC,"dead","LuaS_423353_4",0)
	BeginPlot(NPC,"LuaS_Discowood_CheckPeace",0)
	SetAttack(NPC,TargetID())	
--檢查附近沒有玩家接任務 沒有了中段劇情 或是妮克絲死了?
	local Group = {}
	local Num = 0
	Group = SearchRangePlayer(OwnerID(), 350)
---	Group = SearchRangePlayer(MM, 350)
	for i=1, 360, 1 do
		for K=0,table.getn(Group)-1 do

			if	CheckAcceptQuest( Group[K], 423353 ) == true	and
				CheckFlag( Group[K], 544259) == false	then
				Num = Num + 1
			end
		end
		if	Num == 0 or CheckID(NPC)==false or ReadRoleValue( NPC , EM_RoleValue_IsDead  )== 1 then
				if  ReadRoleValue( NPC , EM_RoleValue_IsDead  )== 1 then
					AddBuff(OwnerID() , 507173,1,40)	
				end
			break
		end
		if CheckID( NPC ) == true and i==360 then
			for M=0,table.getn(Group)-1 do
				if	CheckAcceptQuest( Group[M], 423353 ) == true	and
					CheckFlag( Group[M], 544259) == false	then
					ScriptMessage(Group[M], Group[M],  1 , "[SC_423353_6]" , 0 ) --超出時間，劇情中斷。
					ScriptMessage( Group[M], Group[M], 0 , "[SC_423353_6]" , 0 )

				end
			end
			break
		end
		sleep(10)
	end
---	Delobj( MM)
	Delobj( NPC )
---	Show(OwnerID(),0)
	SetModeEx(OwnerID(),EM_SetModeType_ShowRoleHead ,true) -----------	
	SetModeEx(OwnerID(),EM_SetModeType_HideName ,false) -----------
	SetModeEx(OwnerID(),EM_SetModeType_Show,true) 
	sleep(20)
	if  CheckBuff( OwnerID() , 507173) ==true then
		Yell(OwnerID(),"[SC_423353_7]",6)--心頭的鬱悶，像是紓解了些，樹人之歌在空中蕩漾著。
		sleep(30)
		Yell(OwnerID(),"[SC_423353_8]",6)--是你？[$PLAYERNAME]，我曾經見過你。
		sleep(30)
		Yell(OwnerID(),"[SC_423353_9]",6)---風在讚嘆你的作為，我知道你...
		sleep(30)
		Lua_CancelAllBuff( OwnerID() ) 
	end
	sleep(20)
	DisableQuest(OwnerID(),false)
end


function LuaS_423353_4() --死亡劇情 給完成旗標
	local Tar
	for i=0,HateListCount(OwnerID())-1,1	do
		Tar = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest(Tar,423353)	and
			CheckFlag(Tar,544259)==false	then
			SetFlag(Tar,544259,1)
		end
	end	
	DelObj(OwnerID())
	return true
end
-------------------------------------------------------------------------------------------------------------
--------------423354
---function LuaS_423354_1()---544260徽印  使用的BUFF507174確認
--	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423354_1]" , 0 ) --我已在你身上印上徽記。
--	ScriptMessage(TargetID() , TargetID() , 0 ,  "[SC_423354_1]" , 0 )
--	SetFlag(TargetID(),444260,1)
----end

---
function LuaS_423354_2()
	LoadQuestOption( OwnerID() )		--
	if	CheckAcceptQuest( OwnerID() , 423354 ) == true	and	CountBodyItem( OwnerID(), 207741 )>=1 and	CheckFlag( OwnerID(),544289) == false and ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 and	ReadRoleValue(OwnerID(), EM_RoleValue_IsDead)~=1 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423354_2]","LuaS_423354_4",0)	--(放入[207741]。)
	end
	if	CheckAcceptQuest( OwnerID() , 423354 ) == true	and	CountBodyItem( OwnerID(), 207741 )>=1  and	CheckFlag( OwnerID(),544289) == false and ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 1 and	ReadRoleValue(OwnerID(), EM_RoleValue_IsDead)~=1 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423354_2]","LuaS_423354_3",0)	--(放入[207741]。)
	end
end

function LuaS_423354_3()
	SetSpeakDetail(OwnerID(),"[SC_423354_3]")---你發覺[207741]，發出了異樣的光芒，或許你該稍等一會兒，仔細觀察[207741]或者[115920]，發生了什麼異狀。
end

function LuaS_423354_4()---施放法術 讓周遭有 有接任務尚未有544289的玩家 上BUFF。 使用780698 有機率的 EZ 依利雅爾  MT 安特
	CloseSpeak( OwnerID() )
	if	CheckAcceptQuest( OwnerID() , 423354 ) == true	and	CheckFlag( OwnerID(),544289) == false    and	ReadRoleValue(OwnerID(), EM_RoleValue_IsDead)~=1 then	
		WriteRoleValue( TargetID(), EM_RoleValue_Register ,1) 
		BeginPlot( TargetID(), "LuaS_423354_5", 0)
	end
end

function LuaS_423354_5()
--	CastSpell( OwnerID(), OwnerID(), 495913)
	DelBodyItem( TargetID(), 207741 , 1 )
	local Player = SearchRangePlayer( OwnerID() , 400 )
	for i=0,table.getn(Player)-1 do
		if	(CheckAcceptQuest( player[i] , 423354 ) == true ) and CheckFlag( player[i],544289)==false   and CheckBuff( player[i]  , 507174)==false   then
			local BUFF = { 507175, 507197, 507198}
			local Num = DW_Rand( 3 )--math.floor：取整數
------			if Num ~=nil then debugmsg( 0,0, "Num = "..Num) end
			DW_CancelTypeBuff(68, player[i] )
			AddBuff( player[i] , BUFF[Num] , 1, 60)
		end
	end
	sleep(10)
	for i=0,table.getn(Player)-1 do
		if	(CheckAcceptQuest( player[i] , 423354 ) == true ) and CheckFlag( player[i],544289)==false and CheckBuff( player[i]  , 507174)==false  then
			DW_CancelTypeBuff(68, player[i] )
			AddBuff(player[i] ,507174,1,60)
		end
	end

----	CastSpell( OwnerID(), OwnerID(), 495914)
	local KK = Lua_DW_CreateObj("flag" ,115921,780698,1,1 )---種出一個掌控全部的NPC的魔王。
	Lua_ObjDontTouch( KK ) ----
--	SetModeEx(KK ,EM_SetModeType_ShowRoleHead ,false) -----------	
--	SetModeEx(KK ,EM_SetModeType_HideName ,true) -----------
	WriteRoleValue( KK, EM_RoleValue_Register7 ,TargetID()) 
	BeginPlot( KK, "LuaS_423354_6", 0)
	while true do
		sleep(10)
		if 	CheckID( KK)== false  then
				WriteRoleValue( OwnerID(), EM_RoleValue_Register ,0) 
			break
		end
	end
end
function LuaS_423354_6()
	local EZ = Lua_DW_CreateObj("flag" ,115636,780698,1,1 )---
	WriteRoleValue(OwnerID() , EM_RoleValue_Register2 ,EZ) 
	DisableQuest( EZ ,true )
	local MT = Lua_DW_CreateObj("flag" ,115922,780698,0,1 ,0)---
	WriteRoleValue(OwnerID() , EM_RoleValue_Register3 ,MT) 
	---Hide(MT)
	DisableQuest( MT ,true )
	BeginPlot( OwnerID(), "LuaS_423354_7" , 0 )
	DW_MoveToFlag(EZ ,780698,4, 0,1)--
	Say(EZ ,"[SC_423354_15]")---王...已經過了千年了...
	sleep(25)
	Say(EZ ,"[SC_423354_16]")---王...已經過了千年了...
	sleep(30)
	Say(EZ ,"[SC_423354_17]")---王...已經過了千年了...
	AddToPartition( MT , 0 )
	DW_MoveToFlag(MT ,780698,2, 0,1)--
	sleep(20)
	Say(MT,"[SC_423354_4]")---伊利雅爾...
	PlayMotion(MT , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(20)
	AdjustFaceDir( EZ , MT , 0 )
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423354_1]" , 0 ) --[115636]看著眼前皺起了眉頭。
	ScriptMessage(TargetID() , TargetID() , 0 ,  "[SC_423354_1]" , 0 )
	Say(EZ,"[SC_423354_5]")--又是幻影？
	PlayMotion(EZ ,  ruFUSION_ACTORSTATE_CAST_BEGIN )
--PlayMotion(EZ , ruFUSION_ACTORSTATE_BUFF_BEGIN )
	sleep(20)
	Say(EZ,"[SC_423354_6]")--哼，我不會再被你所迷惑，過去的經驗還不夠慘嗎？以你們這些無恥的生物，還想侵犯踐踏我族？
	PlayMotion( EZ ,  ruFUSION_ACTORSTATE_EMOTE_POINT)	
	sleep(30)
	Say(MT,"[SC_423354_7]")--是我，妳不認得了嗎？還記得精靈聖王的教誨吧？
	PlayMotion(MT , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say(EZ,"[SC_423354_8]")--別以為擺出同樣的態度就能迷惑我，他並不是你這種只會化為幻影迷惑他人的低等生物，所能比擬的
	PlayMotion( EZ ,    ruFUSION_ACTORSTATE_SHIELD_BASH  )
	sleep(30)
	Say(EZ,"[SC_423354_9]")--帶著你的爪牙，回歸於陰暗角落去吧！有我在此，容不得你繼續靠近繁星湧泉一步。
	PlayMotion( EZ ,    ruFUSION_ACTORSTATE_SHIELD_BASH  )
	sleep(30)
	Say(MT,"[SC_423354_4]")---伊利雅爾...
	CastSpell( EZ, MT, 495954)
	sleep(10)
	CastSpell( MT, MT, 495920)
	sleep(10)
	local Player = SearchRangePlayer( OwnerID() , 300 )
	for i=0,table.getn(Player)-1 do
		if(CheckAcceptQuest( player[i] , 423354 ) == true ) and CheckFlag( player[i],544289)==false then
			CastSpell( EZ,  player[i], 495954)
			--CastSpell( player[i], player[i], 494493)
			if	CheckBuff(player[i]  ,  507175)==true  then
				CastSpell( player[i], player[i], 495955)
				CancelBuff( player[i] , 507175)
			end
			if	CheckBuff( player[i]  ,  507197)==true  then
				CastSpell( player[i], player[i], 495955)
				CancelBuff( player[i] , 507197)
			end
			if	CheckBuff( player[i]  ,  507198)==true  then
				CastSpell( player[i], player[i], 495955)
				CancelBuff( player[i] , 507198)
			end
		end
	end
	Say(EZ,"[SC_423354_10]")---不可能......你怎麼可能還活著。
	PlayMotion( EZ ,  ruFUSION_ACTORSTATE_SHIELD_BASH  )
	sleep(30)
	AddBuff(MT ,507271,1,10)
	Say(EZ,"[SC_423354_11]")---我會取得更多的力量擊退你，你...最好選擇馬上離去。
	PlayMotion( EZ ,  ruFUSION_ACTORSTATE_EMOTE_POINT )
	DW_MoveToFlag(EZ ,780698,5, 0,1)--
---	CastSpell( EZ, EZ, 494839)
	CastSpell( EZ, EZ, 495980)
--轉身離開。495980
	sleep(20)
	delobj(EZ)
	for i=0,table.getn(Player)-1 do
		if	(CheckAcceptQuest( player[i] , 423354 ) == true ) and CheckFlag( player[i],544289)==false and CheckBuff( player[i]  , 507174)==true  then
			SetFlag(player[i],544289,1)
			CancelBuff( player[i], 507174)
			ScriptMessage( player[i] ,player[i] , 1 , "[SC_423354_12]" , 0 ) --安特克羅閉上雙眼，微微嘆息。
			ScriptMessage(player[i] , player[i] , 0 ,  "[SC_423354_12]" , 0 )---
		end
	end
	CancelBuff( MT  ,  507197)
	PlayMotion( MT ,  ruFUSION_ACTORSTATE_EMOTE_IDLE2   )
	Say(MT,"[SC_423354_13]")---果然還是你..那麼[115635]...
	sleep(30)
end

function LuaS_423354_7()
	local MT = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)--
	local EZ = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)--
	local Group = {}
	local Num = 0
	Group = SearchRangePlayer(OwnerID(), 300)
	for i=1, 60, 1 do
		Num = 0
		for K=0,table.getn(Group)-1 do
			if	CheckAcceptQuest( Group[K], 423354 ) == true	and
				CheckFlag( Group[K], 544289) == false and GetDistance( Group[K] , OwnerID() ) < 300  	then
				Num = Num + 1
			end
			if	CheckAcceptQuest( Group[K], 423354 ) == true	and
				CheckFlag( Group[K], 544289) == false and GetDistance( Group[K] , OwnerID() ) >300		then
				ScriptMessage( Group[K], Group[K], 1 , "[SC_423349_11]" , 0 ) --超出距離，您沒有完成任務。
				ScriptMessage( Group[K] , Group[K], 0 , "[SC_423191_11]" , 0 ) --超出距離，您沒有完成任務。
				CancelBuff( Group[K], 507174)		
							if	CheckBuff(Group[K],  507175)==true  then
								CancelBuff(Group[K] , 507175)
							end
							if	CheckBuff( Group[K]  ,  507197)==true  then
								CancelBuff( Group[K], 507197)

							end
							if	CheckBuff( Group[K],  507198)==true  then
								CancelBuff( Group[K], 507198)
							end
			end
		end
		if	Num == 0  then
			break
		end
		sleep(10)
	end
	delobj(OwnerID())
	delobj(MT)
	delobj(EZ)

end

function LuaS_423354_8()
	if	CheckAcceptQuest( targetID(), 423354 )==true	and	CheckFlag(  targetID(), 544289) == flase  then
 --BuffTypeNum 輸入想解除的buff 類型
--68 騎乘
--58 變身
--ObjID 輸入想解除的目標  若不填 預設為 IDNum
--填1 則預設為 TargetID()
		DW_CancelTypeBuff(68, targetID())
		return true
	end
	return false
end


-----------------------
function Lua_ObjAreaCheck_507236_0() --偽裝偵測地點
	if	CheckAcceptQuest( OwnerID() , 423354 ) == false  then
		CancelBuff_NoEvent( OwnerID() , 507175 )
		CancelBuff_NoEvent( OwnerID() , 507174 )
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423354_14]", 0 ) --覆蓋你身上的氣息瞬間減弱。
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423354_14]", 0 )
	end
end
function Lua_ObjAreaCheck_507237_0() --偽裝偵測地點
	if	CheckAcceptQuest( OwnerID() , 423354 ) == false then
		CancelBuff_NoEvent( OwnerID() , 507197 )
		CancelBuff_NoEvent( OwnerID() , 507174 )
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423354_14]", 0 ) --覆蓋你身上的氣息瞬間減弱。
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423354_14]", 0 )
	end
end
function Lua_ObjAreaCheck_507238_0() --偽裝偵測地點
	if	CheckAcceptQuest( OwnerID() , 423354 ) == false  then
		CancelBuff_NoEvent( OwnerID() , 507198 )
		CancelBuff_NoEvent( OwnerID() , 507174 )
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423354_14]", 0 ) --覆蓋你身上的氣息瞬間減弱。
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423354_14]", 0 )
	end
end
function Lua_ObjAreaCheck_507174_0() --偽裝偵測地點
	if	CheckAcceptQuest( OwnerID() , 423354 ) == false  then
		CancelBuff_NoEvent( OwnerID() , 507174 )
	end
end
----酒保[114438]的對話。
function LuaS_423026()------
             	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest(OwnerID(),423025)==true	then
		if	CountBodyItem(OwnerID(),203461)==0		or
			CountBodyItem(OwnerID(),203462)==0		then
--(詢問這裡有沒有單賣油和活老鼠)
			AddSpeakOption(OwnerID(),OwnerID(),"[SC_423025_0]","LuaS_423025_1", 0 )
		end
	end

	if (CheckAcceptQuest(OwnerID(),423026)==true )and  (CheckFlag(OwnerID(),543644)==false )then
		SetSpeakDetail( OwnerID(), "[SC_423026_0]"  );  ---生面孔，你想喝些什麼？
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423026_1]","LuaS_423026_1",0)    ---奧歐
	end
end
function LuaS_423026_1()
	SetSpeakDetail( OwnerID(), "[SC_423026_2]"  )---奧歐？這可是非常昂貴的調酒，你確定你付得起這酒錢？
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423026_3]","LuaS_423026_2",0)  ----是的，我確定。
end
function LuaS_423026_2()
	SetSpeakDetail( OwnerID(), "[SC_423026_4]"  )---那麼我會為你將這杯酒的放置在最右側的座位上，期待你的好運。
	SetFlag( OwnerID() , 543644, 1 )
end

---杯子的對話劇情。
function LuaS_423026_3()
	if 	 CheckAcceptQuest(OwnerID(),423026)==true	and CheckFlag( OwnerID(), 543645)==false  then
			if 	CountBodyItem( OwnerID(), 206793 )==0 then
					SetSpeakDetail( OwnerID(), "[SC_423026_6]"  )--它看起來只像普通的調酒，也許你該將[206793]擺放在它身上。
			end
			if 	CountBodyItem( OwnerID(), 206793 )>0 then
					LoadQuestOption( OwnerID())
					AddSpeakOption(OwnerID(),TargetID(),"[SC_423026_5]","LuaS_423026_4",0) --- 在酒杯上放置[206793]。
			end
	else
		LoadQuestOption( OwnerID())
	end
	
	
---	and 	CountBodyItem( OwnerID(), 206793 )==0 then
--		SetSpeakDetail( OwnerID(), "[SC_423026_6]"  )--它看起來只像普通的調酒，也許你該將[206793]擺放在它身上。
--	end
--	if	 CheckAcceptQuest(OwnerID(),423026)==true and CheckFlag( OwnerID(), 543645)==false and     CountBodyItem( OwnerID(), 206793 )>0 	then
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_423026_5]","LuaS_423026_4",0) --- 在酒杯上放置[206793]。
--	end
--		LoadQuestOption( OwnerID() )
end
function LuaS_423026_4()
	CloseSpeak( OwnerID() )
	DelBodyItem( OwnerID(), 206793, 1 )
	BeginPlot( TargetID(), "LuaS_423026_5", 0)
end
function LuaS_423026_5()
---DN是丹尼‧克布朗
---使用旗子 780545
	DisableQuest( OwnerID() , true )
	SetPlot(  OwnerID()  ,   "touch" ,  "LuaFunc_Obj_BUSY"  , 40  )
	DisableQuest( OwnerID() , true)
	if 	CheckID( TargetID() ) == true  then
		AddBuff( TargetID(), 505978 , 1 , 10 )---當有這個BUFF的時候 看得見演戲的助手[114440]
	end
	local DN = Lua_DW_CreateObj("flag" ,114440,780545,0,1 )
	DW_MoveToFlag( DN,780545,1, 0,1)
	Yell( DN , "[SC_423026_7]" , 3 )--嘖～這東西……
	sleep(20)
	DW_MoveToFlag( DN,780545,21, 0,1)
	DW_MoveToFlag( DN,780545,22, 0,1)
	DW_MoveToFlag( DN,780545,2, 0,1)
	AdjustFaceDir( DN , TargetID() , 0 )
	Yell( DN , "[SC_423026_8]" , 3 )--小子，你想交易什麼？
	PlayMotion( DN, ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(20)
	if 	CheckID( TargetID() ) == true  then
		SetFlag(TargetID(), 543645, 1 )----當有這個旗標 看得見可以接任務的助手[114439]
	end
	sleep(10)
	DelObj( DN)
	SetPlot(  OwnerID()  ,   "touch" ,  ""  , 0  )
	DisableQuest( OwnerID() , false)
end


-----423028---
--刀刃的觸碰劇情
function LuaS_423028_0()----觸碰劇情
		SetPlot( OwnerID() , "touch" , "LuaS_423028_1" , 10)----
	end
	
function LuaS_423028_1()
	if	CheckAcceptQuest( OwnerID(),423028)==true and  CheckFlag( OwnerID(), 543646)==false then
		BeginPlot( TargetID(), "LuaS_423028_3", 0 )----白頻。
	else
		ScriptMessage( OwnerID(), TargetID(), 0, "SC_423028_25", 0 )--這把匕首毫無反應。
	end	
end

function LuaFunc_423028_LOVE() -- 有訊息
	ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_423028_28]", 0 );
	ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_423028_28]", 0 );

end

function LuaS_423028_3()	
		SetPlot(  OwnerID()  ,   "touch" ,  "LuaFunc_423028_LOVE"  , 20  )
---		BeginPlot( OwnerID(), "LuaS_423028_2", 50 )----白頻。
----夜梟是CA  114012
----助手是DN
		if 	CheckID( TargetID() ) == true  then
			AddBuff( TargetID(), 505992 , 1 , 90)----給玩家上BUFF  只有擁有這個 才能看到以下的劇情 CA DN
		end
		local KK = Lua_DW_CreateObj("flag" ,114484,780545,4,1 )---種特效隱形球
		SetModeEx(KK, EM_SetModeType_Mark,false)  
		local CA = Lua_DW_CreateObj("flag" ,114012,780545,0,1 )
		local DN = Lua_DW_CreateObj("flag" ,114442,780545,2,1 )
		WriteRoleValue( KK, EM_RoleValue_Register ,targetID() )---在隱型物件身上寫入玩家的ID。
		BeginPlot( KK, "LuaS_423028_2", 50 )----白頻。
		DW_MoveToFlag( CA,780545,1, 0,1)
		DW_MoveToFlag( CA,780545,3, 0,1)
		AdjustFaceDir( DN , CA, 0 )
		Yell( DN , "[SC_423028_1]" , 3 )--主人。
		PlayMotion( DN, ruFUSION_ACTORSTATE_EMOTE_SALUTE2	)
		sleep(20)
		AdjustFaceDir( CA , TargetID(), 0 )
		if 	CheckID( TargetID() ) == true  and CheckAcceptQuest(OwnerID(),423028)==true then
			ScriptMessage( OwnerID(), TargetID(), 0, "[SC_423028_2]", 0 )----夜梟神情嚴肅的打量著你。
			ScriptMessage( OwnerID(), TargetID(), 1, "[SC_423028_2]", 0  )
		end	
		sleep(20)	
		Yell( CA , "[SC_423028_3]" , 3 )----就是他？
		PlayMotion( CA, ruFUSION_ACTORSTATE_EMOTE_IDLE2	)
		sleep(20)
		Yell( DN , "[SC_423028_4]" , 3 )--是的。
		PlayMotion( DN, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD	)
		sleep(20)
		Yell( CA , "[SC_423028_5]" , 3 )---東西在哪？
		sleep(10)
		DW_MoveToFlag( DN ,780545,5, 0,1)
		AdjustFaceDir( DN , CA, 0 )
		sleep(10)
		PlayMotion( DN, ruFUSION_ACTORSTATE_CRAFTING_LOOP)
		sleep(20)
		PlayMotion( DN, ruFUSION_ACTORSTATE_CRAFTING_END)
		sleep(10)
		if 	CheckID( TargetID() ) == true  and CheckAcceptQuest(OwnerID(),423028)==true then
			ScriptMessage( OwnerID(), TargetID(), 0, "[SC_423028_6]", 0  )--丹尼‧克布朗將箭頭給夜梟，夜梟拿著把玩了一下。
			ScriptMessage( OwnerID(), TargetID(), 1, "[SC_423028_6]", 0 )
		end
		DW_MoveToFlag( DN ,780545,2, 0,1)
		sleep(10)
		AdjustFaceDir( DN , TargetID(), 0 )
		sleep(50)
		Yell( CA , "[SC_423028_7]" , 3 )---嗯～帶著鋸齒、內部呈現中空放射狀，接下來內部應該有刻字。
		PlayMotion( CA ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		sleep(30)
		Yell( CA , "[SC_423028_8]" , 3 )---果然是他的作品。
		sleep(30)
		Yell( CA , "[SC_423028_9]" , 3 )---聞起來還帶著點焦味的迷迭花香，應該是裡頭的粉末因為疾速發揮作用。
		PlayMotion( CA ,ruFUSION_ACTORSTATE_PARRY_BOW )
		sleep(30)
		Yell( CA , "[SC_423028_10]" , 3 )--這麼說來艾伯拉果然是被馬修‧艾德華給擄走的。
		sleep(30)
		if 	CheckID( TargetID() ) == true  and CheckAcceptQuest(OwnerID(),423028)==true then
			ScriptMessage( OwnerID(), TargetID(), 0, "[SC_423028_11]",0)--夜梟看向了你
			ScriptMessage( OwnerID(), TargetID(), 1, "[SC_423028_11]", 0 )
			AdjustFaceDir( CA , TargetID(), 0 )
		end
		sleep(10)
		Yell( CA , "[SC_423028_12]" , 3 )---是亞班諾的特種部隊，我經手的迷迭花，近年來也只有那一批。
		---PlayMotion( CA ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		sleep(30)
		Yell( CA , "[SC_423028_13]" , 3 )---接下來你打算怎麼做？ 
		sleep(30)
		Yell( CA , "[SC_423028_14]" , 3 )---如果你感到茫然，我可以稍微的幫助你。
		sleep(30)
		Yell( CA , "[SC_423028_15]" , 3 )---[114442]，指引他去找艾可，他會解開所有的疑問。
		---PlayMotion( CA ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		sleep(30)
		Yell( DN , "[SC_423028_16]" , 3 )---是。
		PlayMotion( DN, ruFUSION_ACTORSTATE_EMOTE_SALUTE2)
		sleep(30)	
		Yell( CA , "[SC_423028_17]" , 3 )---亞班諾特種部隊縱使沒用，但對你可能是艱鉅的挑戰。
		sleep(30)	
		AdjustFaceDir( CA , TargetID(), 0 )
		Yell( CA , "[SC_423028_18]" , 3 )---在下次見面之前，你最好努力活下來。
		PlayMotion( CA, ruFUSION_ACTORSTATE_EMOTE_POINT)
		sleep(30)	
		Yell( CA , "[SC_423028_19]" , 3 )---剩下就交給你處理了，[114442]。
		DW_MoveToFlag( CA,780545,0, 0,1)
		sleep(20)
		DelObj( CA)
		DelObj( DN)
		DelObj( KK)
		sleep(10)
		SetPlot(  OwnerID()  ,   "touch" ,  "LuaS_423028_1"  , 40  )
		if 	CheckID( TargetID() ) == true  and CheckAcceptQuest(TargetID(),423028)==true then
			SetFlag( TargetID() , 543646, 1 )---
			CancelBuff( TargetID(), 505992  )
		end
end

function LuaS_423028_2()
	local MM = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	ScriptMessage( OwnerID(), MM, 0, "[SC_423028_20]",  "0xFFFFFF00")---薄喀拉：這是怎麼回事？
	sleep(30)
	ScriptMessage( OwnerID(), MM, 0, "[SC_423028_21]",   "0xFFFFFF00")--亞希伯：剛剛那是什麼？
	sleep(30)
	ScriptMessage( OwnerID(), MM, 0, "[SC_423028_22]",  "0xFFFFFF00")--亞希伯：第一次看到這把匕首發光。
	sleep(30)
	ScriptMessage( OwnerID(),MM, 0, "[SC_423028_23]",  "0xFFFFFF00")--薄喀拉：是啊。之前好像也看過其他人過來，但這匕首從未像現在這樣發光。
	sleep(30)
	ScriptMessage( OwnerID(), MM, 0, "[SC_423028_24]",  "0xFFFFFF00" )--亞希伯：到底是？
end
-------------------423029--
----與流浪漢的對話介面--掛在114443身上。
---543648.543650 為判斷 114444的旗標
function LuaS_423029_1()
             	LoadQuestOption( OwnerID() )
	if 	CheckAcceptQuest(OwnerID(),423029)==true   and CountBodyItem ( OwnerID(),  206795)>=1 and  CheckFlag( OwnerID(),  543647)==false	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423029_1]","LuaS_423029_2",0)----(將放置在[206795]的眼前，並觀察他的反應。)
	end
	if 	CheckAcceptQuest(OwnerID(),423029)==true   and CountBodyItem ( OwnerID(),  206795)>=1 and  CheckFlag( OwnerID(),  543647)==true	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423029_1]","LuaS_423029_3",0)----(將放置在[206795]的眼前，並觀察他的反應。)
	end
end
function LuaS_423029_2()	
	SetSpeakDetail( OwnerID(), "[SC_423029_2]"  )----別殺我，別拿著那個東西對著我。
	SetFlag( OwnerID() , 543647, 1 )---
end

function LuaS_423029_3()	
	SetSpeakDetail( OwnerID(), "[SC_423029_3]"  )---好心的人，施捨點金幣給我吧。
	SetFlag( OwnerID() , 543648, 1 )---用來判斷能不能看到114444的旗標
end
----與流浪漢的對話介面--掛在114457身上。
function LuaS_423029_4()
             	LoadQuestOption( OwnerID() )
	if 	CheckAcceptQuest(OwnerID(),423029)==true   and CountBodyItem ( OwnerID(),  206795)>=1 and  CheckFlag( OwnerID(),  543649)==false	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423029_1]","LuaS_423029_5",0)----(將放置在[206795]的眼前，並觀察他的反應。)
	end
	if 	CheckAcceptQuest(OwnerID(),423029)==true   and CountBodyItem ( OwnerID(),  206795)>=1 and  CheckFlag( OwnerID(),  543649)==true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423029_1]","LuaS_423029_6",0)----(將放置在[206795]的眼前，並觀察他的反應。)
	end
end
function LuaS_423029_5()	
	SetSpeakDetail( OwnerID(), "[SC_423029_4]"  )----這是什麼，小子？別以為你拿了刀，我就會怕你！如果你不想挨揍的話，就別擋住我的陽光。
	SetFlag( OwnerID() , 543649, 1 )---
end

---關上對話、種出可以打人的NPC、當場上的NPC不見後  原本的NPC才會出現。
function LuaS_423029_6()	
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID(), "LuaS_423029_7", 0)
end
function LuaS_423029_7()
	DisableQuest(OwnerID(),true)	
	Hide(OwnerID())
--建立戰鬥用替身 &防止戰鬥後留存的問題 &指定目標 &完成條件
	local NPC = Lua_DW_CreateObj("obj",103294,OwnerID())
	SetPlot(NPC,"dead","LuaS_423029_8",0)
	WriteRoleValue( NPC , EM_RoleValue_PID , OwnerID() )
	Say(NPC,"[SC_423029_5]")---滾，這是我的了。
	if 	CheckID( TargetID() ) == true  then
		DelBodyItem( TargetID(),206795, 1 )
	end
	BeginPlot(NPC,"LuaS_Discowood_CheckPeace",0)
	SetAttack(NPC,TargetID())
	Lua_Drama_Radar( NPC , 423029 )
--檢查何時結束
	while	CheckID(NPC) AND ReadRoleValue( NPC , EM_RoleValue_IsDead  )== 0 and Lua_Check_Drama_Statu( NPC) ==true do
		sleep(10)
	end
--現出本尊	&重啟互動
	if CheckID( NPC ) == true then
		Delobj( NPC )
	end
	Show(OwnerID(),0)
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) > 0 then
	--	say(OwnerID(),"[SC_423029_10]")---我認輸！別打了！
	--臣服的動作
		PlayMotion( OwnerID(), 	ruFUSION_ACTORSTATE_EMOTE_SURRENDER	)
		sleep(40)
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
	DisableQuest(OwnerID(),false)
end

function LuaS_423029_8() --死亡劇情 給完成旗標
	local Tar
	local NPC = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	for i=0,HateListCount(OwnerID())-1,1	do
		Tar = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest(Tar,423029)	and
			CheckFlag(Tar,543650)==false	then
			SetFlag(Tar,543650,1)
		end
		if  	CountBodyItem(Tar,206795)==0	then
			GiveBodyItem (Tar, 206795, 1 )
		end
	end
	WriteRoleValue( NPC , EM_RoleValue_Register , 1 )
	DelObj(OwnerID())
	return true
end
----晨星助手的對話劇情
function LuaS_423029_9()
             	LoadQuestOption( OwnerID() )
	if 	CheckAcceptQuest(OwnerID(),423029)==true  and CheckFlag( OwnerID(),  543651)==false 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423029_1]","LuaS_423029_10",0)----(將放置在[206795]的眼前，並觀察他的反應。)
	end
	if	CheckAcceptQuest(OwnerID(),423030)==true and  ReadRoleValue( TargetID() , EM_RoleValue_Register+1  ) == 0 and CheckFlag( OwnerID(),  543652)==false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423030_1]","LuaS_423030",0)---我們該出發了嗎？
	end	
	if	CheckAcceptQuest(OwnerID(),423030)==true and  ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 1 and CheckFlag( OwnerID(),  543652)==false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423030_1]","LuaS_423030_1",0)---我們該出發了嗎？
	end	
	if CheckCompleteQuest( OwnerID() , 423029 ) == true and CheckAcceptQuest( OwnerID() , 423030 ) == false and CheckCompleteQuest( OwnerID() , 423030 ) == false then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_DRAMA_REPLY]",  "LuaS_423029_11",  0 ); --（再次觀看劇情演出）		
	end
end
function LuaS_423029_10()	
	SetSpeakDetail( OwnerID(), "[SC_423029_6]"  )----這是……您要把它交給我？那真是再好不過了，看來今天又有不錯的收穫。
	SetFlag( OwnerID() , 543651, 1 )---
end
function LuaS_423029_11()
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID() , "LuaS_423029_Complete" , 0 )
end

----使用780432旗子
---摩瑞克mak
function LuaS_423029_Complete()	
	if 	CheckID( TargetID() ) == true  then
		AddBuff( TargetID(), 505979 , 1 , 17)----給玩家上BUFF  只有擁有這個505979 才能看到   
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) > 0 then
		return	
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) == 0 then
		DisableQuest(OwnerID(),true)
		SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 50 )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 7 )
		local MAK = Lua_DW_CreateObj("flag" ,114445,780432,0,1 )
		DW_MoveToFlag(MAK,780432,1, 0,1)	
		sleep(20)
		Yell( MAK , "[SC_423029_7]" , 3 )---終於找到你了。
		PlayMotion( MAK, 	ruFUSION_ACTORSTATE_EMOTE_SPEAK		)	
		sleep(30)
		Yell( OwnerID() , "[SC_423029_8]" , 3 )---總算人都到齊了，那麼接下來，我將帶領您與您的同伴與主人會合。
		PlayMotion(  OwnerID() , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
			if 	CheckID( TargetID() ) == true  then
				CancelBuff( TargetID(), 505979 )
			end
		delobj(MAK)
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		SetPlot( OwnerID() , "touch" , "" , 0 )
		DisableQuest(OwnerID(),false)
	else
		ScriptMessage( TargetID() , TargetID() , 1 , "[SAY_NPC_BUSY]" , 0 )
		ScriptMessage( TargetID() ,  TargetID() ,0 , "[SAY_NPC_BUSY]" , 0 )
	end
	
end	

------------------------------------------------------------------------------------
------423030任務---
---晨星手下帶著玩家、摩瑞克去見晨星-----(1)晨星同步演戲(接了任務 獲得BUFF 都能看見這段戲。)
--使用旗標780543
---(1)晨星手下會給一旁 有接任務  沒有旗標的人BUFF
---(2)當晨星手下在走路帶領你去時  前方晨星已經在演戲了
---(2)晨星自己演戲 演起來

function LuaS_423030_1()
	SetSpeakDetail( OwnerID(), "[SC_423030_2]"  )---好的，請稍等一會兒，當我將東西收拾好，就立刻為您帶路。
end	
function LuaS_423030()
	CloseSpeak( OwnerID() )
	WriteRoleValue( TargetID()  ,  EM_RoleValue_Register + 1 , 1)
	BeginPlot( TargetID(), "LuaS_423030_2", 0)
end
function LuaS_423030_2()	
----LM=流浪漢=114568  摩瑞克=MAK=114448    AK=流浪漢艾可=114569
	local LM    = Lua_DW_CreateObj("flag" ,114568,780543,0,1 )
	local MAK = Lua_DW_CreateObj("flag" ,114448,780432,1,1 )
	local AK   = Lua_DW_CreateObj("flag" ,114569 ,780543,2,1)
	CastSpell(OwnerID() ,OwnerID() ,495227)---給附近有接423030任務 還沒獲得543652的玩家全都貼上BUFF(505980)。---BUFF 用秒數來計算。
	DW_MoveToFlag(LM ,780543,6, 0,1)

	Yell( LM , "[SC_423030_14]" , 3 )---請跟著我走！
	PlayMotion( LM , ruFUSION_ACTORSTATE_EMOTE_WAVE)
	sleep(10)
	BeginPlot( AK, "LuaS_423030_3", 0)	
	BeginPlot( MAK, "LuaS_423030_5", 0)---讓MAK跟著走
--	DW_MoveToFlag( MAK,780543,6, 0,1)
	sleep(10)
	DW_MoveToFlag( LM,780543,7, 0,1)
	sleep(10)

--	DW_MoveToFlag( MAK,780543,7, 0,1)
	Yell(  LM , "[SC_423030_15]" , 3 )--請等等！
	sleep(90)
	PlayMotion( LM , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	DW_MoveToFlag( LM,780543,8, 0,1)
--	DW_MoveToFlag( MAK,780543,9, 0,1)
	sleep(10)
	AdjustFaceDir( LM , AK, 0 )
	sleep(10)
	Yell(  LM , "[SC_423030_16]" , 3 )---主人，這對我來說並不是種有趣的說法。
	PlayMotion( LM ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	sleep(30)
	Yell(  LM , "[SC_423030_17]" , 3 )---貴客已經到達了，這是夜梟大人轉交給您的寶物。
	PlayMotion( LM ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(40)
	Yell(  LM , "[SC_423030_18]" , 3 )----那麼我先告退了。
	PlayMotion( LM, ruFUSION_ACTORSTATE_EMOTE_SALUTE2)
	sleep(20)

	while true do--檢查
		sleep( 10 )
		if	 CheckID(AK) == false   then  --不在場上。
			break
		end
	end
	DW_MoveToFlag( LM,780543,5, 0,1)
	sleep(10)
	Delobj(LM)
	Delobj(MAK)
	writeRoleValue( OwnerID() ,  EM_RoleValue_Register + 1 ,0 )  
end

function LuaS_423030_5()
		WriteRoleValue(  OwnerID() , EM_RoleValue_IsWalk , 1 )--- 摩瑞克用走的。
		DW_MoveToFlag( OwnerID() ,780543,6, 0,1)
		SLEEP(20)
		DW_MoveToFlag( OwnerID(),780543,7, 0,1)
		sleep(50)
		DW_MoveToFlag( OwnerID(),780543,9, 0,1)
end
function LuaS_423030_3()
--- 貴族少女A=MM1=114570  貴族少女B=MM2=114571 
	local MM1= Lua_DW_CreateObj("flag" ,114570 ,780543,3,1)
	local MM2= Lua_DW_CreateObj("flag" ,114571 ,780543,4,1)
	BeginPlot( MM1, "LuaS_423030_6", 0)	
	BeginPlot( MM2, "LuaS_423030_6", 0)	
 	sleep(230)
	Yell( MM2 , "[SC_423030_3]" , 3 )---我真的好迷惘～愛情折磨得我好痛苦…… 
	PlayMotion( MM2 ,ruFUSION_ACTORSTATE_EMOTE_CRY )
	sleep(30)
	Yell( MM1 , "[SC_423030_4]" , 3 )---艾可，真的不能請你為我的妹妹「預言」嗎？
	PlayMotion( MM1 ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell(  OwnerID() , "[SC_423030_5]" , 3 )--哎呀，我只是個流浪漢，又怎麼會懂得那些高超的預言之術呢？
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(40)
	Yell(  OwnerID() , "[SC_423030_6]" , 3 )--但如果您真的這麼迷惘，我也不願看這美麗的小姐為愛所苦。
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(40)
	Yell(  OwnerID() , "[SC_423030_7]" , 3 )--這樣吧！請您先去準備占卜所需要的材料。
	PlayMotion( OwnerID() ,	ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	sleep(30)
	Yell(  OwnerID() , "[SC_423030_8]" , 3 )--我願意為小姐進行占卜……
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)	
	Yell(  OwnerID() , "[SC_423030_9]" , 3 )---那麼現在請兩位美麗的小姐先回去準備這張紙上的材料吧！
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell(  OwnerID() , "[SC_423030_10]" , 3 )---艾可，有朋友到了，不能再多陪您們了喔～
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(20)
	BeginPlot( MM1, "LuaS_423030_4", 0)	
	BeginPlot( MM2, "LuaS_423030_4", 0)	
	sleep(30)
	Yell(  OwnerID() , "[SC_423030_11]" , 3 )---波比，你終於到了。我還以為你又被其他老鼠困住了呢？
	PlayMotion( OwnerID() ,	ruFUSION_ACTORSTATE_EMOTE_IDLE2 )
	sleep(70)
	Yell(  OwnerID() , "[SC_423030_12]" , 3 )---嗯~很純粹的光芒，不會有錯，是他。
	local Player = SearchRangePlayer ( OwnerID() , 150 )
	for i=0,table.getn(Player)-1 do
		if	CheckAcceptQuest( Player[i],   423030)==true and CheckBuff(Player[i], 505980)==true	then
			SetFlag(Player[i],  543652,1)
		end
	end
	sleep(50)
	delobj(  OwnerID())
end

function LuaS_423030_4()---少女離開
	Yell( OwnerID()  , "[SC_423030_13]" , 3 )---好吧......
	sleep(20)
	DW_MoveToFlag( OwnerID(),780543,5, 0,1)---少女消失的地方
	sleep(10)
	delobj( OwnerID() )
end

function LuaS_423030_6()---少女離開
	
	for i = 1 , 120 , 1 do
		if CheckID( TargetID() ) == false then
			break
		end
		sleep( 10 )
	end
	
	DW_MoveToFlag( OwnerID(),780543,5, 0,1)---少女消失的地方
	sleep(10)
	delobj( OwnerID() )
end

function LuaS_423030_KK()---
	If	CheckAcceptQuest( targetID(), 423030)==true	and  CheckFlag( targetID(),543652 )== false  then
		return true
	end
	return false
end
---------------------------------------------
---------423031---
----晨星 對話劇情--詢問3個情報 都要問過 才會獲得旗標  占卜給的BUFF 要亂數
function LuaS_423031()
             	LoadQuestOption( OwnerID() )
	if 	CheckAcceptQuest(OwnerID(),423031)==true and   CheckFlag( OwnerID(), 543653 )==false	then----543653 阻止玩家一直得到占卜BUFF
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423031_1]","LuaS_423031_1",0)---我想詢問如何找到亞班諾特種部隊
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423031_2]","LuaS_423031_2",0)----我想詢問亞班諾這個國家
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423031_3]","LuaS_423031_3",0)---我想請你為我占卜運勢。
	end
	if 	CheckAcceptQuest(OwnerID(),423031)==true and   CheckFlag( OwnerID(), 543653 )==true	then----543653 阻止玩家一直得到占卜BUFF
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423031_1]","LuaS_423031_1",0)
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423031_2]","LuaS_423031_2",0)
	end
end
function LuaS_423031_1()
	SetSpeakDetail(OwnerID(),"[SC_423031_4]")---1.	如何尋找到亞班諾特種部隊？這是個不錯的問題。深溝裡的老鼠特別難防，牠總愛在每個熟悉的巷道徘迴穿梭。但只要你追尋著星星的指引，失落的羔羊與溝鼠將會在你的旅途中出現蹤跡，回應羔羊的眼淚，你會獲得所有解答。呵～一副迷惑的表情呀，好吧～卡爾的貴客，今天給你大優待，我再說給你準確一點的提示，達拉尼斯城外、溝鼠、羔羊，就這些。
	SetFlag( OwnerID() , 543654, 1 )
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]","LuaS_423031",0)---543654
end
 function LuaS_423031_2()
	SetSpeakDetail(OwnerID(),"[SC_423031_5]")--2.	亞班諾這個國家？呵～是個被血色染上的國度，最後落到了[103292]這惡鬼手上，當然也只有極速衰敗，你沒有躬逢其盛過，無法明白那境內發生許多吊詭的事情，比如說領主旗下的騎士團搶奪境內良民的慘況，那時我可是做了不少有關於[103292]的情報交易呢。可惜的是~在大將軍蘭斯擊敗[103292]後，心高氣傲的[103292]就開始匿跡，進行他一切的復仇大記。呵～接下來的就是秘密了，說破一切事情就不好玩了。你好好想想，如果沒有星星怎能襯出黑夜的美麗，而惡鬼當如是。
	SetFlag( OwnerID() , 543655, 1 )	
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]","LuaS_423031",0)---543655
end
function LuaS_423031_3()
	SetSpeakDetail(OwnerID(),"[SC_423031_6]")---呵～你早該一開始就這麼做了嘛～那麼來個符石占卜好了，就三顆石頭來做你的運勢占卜的材料好了。好，現在在你面前放著三個石頭。請告訴我，你所選擇的是左邊、中邊、右邊？
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423031_7]","LuaS_423031_4",0)---※	左邊
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423031_8]","LuaS_423031_4",0)---※	中間：不好不壞，未來的旅程就如同走入平坦的道路上，羔羊與溝鼠將隨著你的步伐相繼出現，而輔助你的星芒也將帶著你，突破限制與難關。呵～中庸的運氣，只能中庸平板的回答你。為了讓旅途更加有趣，讓我為你加點運氣吧。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423031_9]","LuaS_423031_4",0)---右邊
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]","LuaS_423031",0)
end

function LuaS_423031_4()
	local string={"[SC_423031_12]","[SC_423031_10]","[SC_423031_11]"}---讓回答亂數。
	local KK = math.floor(DW_Rand( 100 )/33 ) +1--math.floor：取整數
		SetSpeakDetail(OwnerID(),string[KK])
	if	CheckFlag( OwnerID(), 543653 )==false then
		local BUFF = {505981,505982,505983}
		local Num = math.floor(DW_Rand( 100 )/33 ) +1--math.floor：取整數
		AddBuff( OwnerID() , BUFF[Num] , 1, 1800 )
		SetFlag( OwnerID() , 543653, 1 )
	end
end
----------------------------------------------------------------------
-----423032任務 114449接
---範圍劇情 有接到任務的人 進入會觸發被追殺的劇情

function LuaS_423032_0()---隱形物件。
	SetPlot( OwnerID(), "range","LuaS_423032_1", 150 )
end
function LuaS_423032_1()---103295
	if	CheckAcceptQuest(OwnerID(),423032)==true  and ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 then
		WriteRoleValue( TargetID() , EM_RoleValue_Register , 777 )
		BeginPlot( TargetID() , "LuaS_423032_1_PLUS" , 0 )
	end
end
function LuaS_423032_1_PLUS()
		local Obj = Role:new( TargetID()  )
		local BaseX = Obj :X()		
		local BaseY = Obj :Y();		
		local BaseZ = Obj :Z();		
		local BaseDir = Obj:Dir();		
		local DD= CreateObj(103295, BaseX+80, BaseY, BaseZ+80, BaseDir, 1 )        
		local CC= CreateObj(103295, BaseX+50, BaseY, BaseZ+50, BaseDir, 1 )  
		local KK= CreateObj(103295, BaseX+75, BaseY, BaseZ+75, BaseDir, 1 )  		      
		AddToPartition( DD,0)    
		AddToPartition( CC,0)
		AddToPartition( KK,0)  
		SetAttack( DD , TargetID()  )     
		SetAttack( CC , TargetID()  ) 
		SetAttack( KK , TargetID()  )
		Yell(  DD , "[SC_423032_1]" , 3 )---找到礙事者了！
		sleep(10)
   		Yell(  CC , "[SC_423032_2]" , 3 )---幹掉他們吧！     
		BeginPlot(DD,"LuaQ_421177_Sui",0)
		BeginPlot(CC,"LuaQ_421177_Sui",0)
		BeginPlot(KK,"LuaQ_421177_Sui",0)
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end
---在路上的範圍劇情   偵查周遭 得到旗標 才能看見摩瑞克
function LuaS_423032_2()	
	SetPlot( OwnerID(), "range","LuaS_423032_3", 150 )
end
function LuaS_423032_3()---103295
	if	CheckAcceptQuest(OwnerID(),423032)==true  then
		ScriptMessage(OwnerID() ,  OwnerID(),  1 , "[SC_423032_3]" , 0 )---前方傳來一陣陣女孩的啜氣聲。
		ScriptMessage( OwnerID() ,   OwnerID(), 0 , "[SC_423032_3]" , 0 )---
		SetFlag( OwnerID() , 543656, 1 )	
	end
end


----423033---交代摩瑞克的先行探查
function LuaS_423033()---
---種出隱型物件 摩瑞克
	Local KK = Lua_DW_CreateObj("flag" ,114574,780547,0,1 )
	Tell(TargetID(), KK,"[SC_423033_1]")
	sleep(40)
	Delobj(KK)
end

---------------------------------------------------------------------------------------
-------------423034-------旗子：780544
---結束劇情
function LuaS_423034_1()	
	CloseSpeak( TargetID() )
	DisableQuest( OwnerID() , true )
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 50 )
---種出 弗蘿拉‧庫歐=FF   摩瑞克==KK
	Local FF = Lua_DW_CreateObj("flag" ,114573,780544,0,1 )---114573
	Local KK = Lua_DW_CreateObj("flag" ,103296,780544,1,1 )
	DisableQuest( FF , true )
	DW_MoveToFlag( FF,780544,2, 0,1)
	AdjustFaceDir( FF , OwnerID() , 0 )
	Yell(  FF , "[SC_423034]" , 3 )--嗚嗚.......爸爸......我們被壞蛋襲擊，[114451]姐姐為了保護我......
	PlayMotion( FF ,ruFUSION_ACTORSTATE_EMOTE_CRY )
	sleep(30)
	Yell(   OwnerID(), "[SC_423034_1]" , 3 )---是誰幹的？是哪個盜賊團幹的？告訴我。	
	sleep(30)			
	Yell(  FF , "[SC_423034_2]" , 3 )---是……最近來到村裡的那群壞蛋……
	PlayMotion( FF ,ruFUSION_ACTORSTATE_EMOTE_CRY )
	sleep(30)
	Yell(  FF , "[SC_423034_3]" , 3 )---雖然好人把他們都打跑了，但是[114451]姐姐已經回不來了……
	PlayMotion( FF ,ruFUSION_ACTORSTATE_EMOTE_CRY )
	sleep(30)	
	BeginPlot( KK, "LuaS_423034_2", 0)
	Yell(  FF , "[SC_423034_4]" , 3 )--嗚嗚嗚嗚嗚……
	PlayMotion( FF ,ruFUSION_ACTORSTATE_EMOTE_CRY )
	sleep(40)
	DW_MoveToFlag( FF,780544,0, 0,1)
	DisableQuest( FF , false )
	sleep(10)
	delobj(FF)
	while true do--檢查
	sleep( 10 )
	if	 CheckID(KK) == false   then  --不在場上。
		DisableQuest( OwnerID() , false )
		SetPlot( OwnerID() , "touch" , "" , 0 )
		break
		end
	end
end

function LuaS_423034_2()	
	local Player = SearchRangePlayer ( OwnerID() , 350 )
	for i=0,table.getn(Player)-1 do
		if	CheckCompleteQuest( Player[i],  423034)==true and CheckAcceptQuest( Player[i], 423035)==false then
			Tell(player[i], OwnerID(),"[SC_423034_5]")----你有發現什麼線索嗎？
			sleep(30)
			ScriptMessage( player[i],  player[i],0 , "[SC_423032_6]" , 0 )---(你將剛才的情況向[103296]轉述。)
			sleep(30)
			Tell(player[i], OwnerID(),"[SC_423034_7]")---嗯，這個村莊果然與亞班諾有關。
			sleep(20)
			Tell(player[i], OwnerID(),"[SC_423034_8]")---羔羊的眼淚與解答……
			sleep(30)
			Tell(player[i], OwnerID(),"[SC_423034_9]")--[$PLAYERNAME]，抓住這個時機，詢問出村長與亞班諾之間的關聯吧！我會在暗中協助你的。
			delobj(OwnerID())
		end
	end
	sleep(80)
	if	 CheckID(OwnerID()) == true then 
		delobj(OwnerID())
	end
end




------------------------------------------------------------------
-----423035---聆聽村長的苦衷
function LuaS_423035()------
             	LoadQuestOption( OwnerID() )
	if 	(CheckAcceptQuest(OwnerID(),423035)==true )and  (CheckFlag(OwnerID(),543658)==false )then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423035_1]","LuaS_423035_1",0)    ---我答應幫助你們，但你必須先告訴我所有的詳情。
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423035_2]","LuaS_423035_2",0)    ---我不同意你們的看法，還是先向獅心騎士團回報這個狀態吧！
	end
end

function LuaS_423035_1()------
	SetSpeakDetail( OwnerID(), "[SC_423035_3]"  )-----詳情？這要從何說起？將錯都歸咎於你們獅心騎士團的漫不經心上？還是要怪罪於存在這世上的盜賊團？要不是獅心騎士團的漫不經心久久才來這裡巡視，我們村莊或許不會落得如此下場，一次又一次的盜賊肆虐、襲擊，打擊著村民的身心，再加上大將軍蘭斯與亞班諾領主的那一役，徹底將我們打入了地獄。 的確，在大將軍蘭斯將亞班諾的騎士團擊潰後，我們過著一段還算安逸的生活，我們從沒想到我們必須為這段安逸生活，付出更多的代價，亞班諾的士兵捲土而來，這次他們不是搶奪，而是不斷的索求，要我們獻上所有的收成的兩倍，他們吃定了我們無法反抗，恣意妄為，之前他們似乎還有些忌憚獅心騎士團，不准我們將消息外露，但現在……陸續的有村民死去，我們不能再忍受下去……
	SetFlag( OwnerID() , 543658, 1 )
end

function LuaS_423035_2()------
	SetSpeakDetail( OwnerID(), "[SC_423035_4]"  )---你走吧！哼～我就知道獅心騎士團是無法依賴的，回報的時間要花多久？最後只會以人手不足來敷衍我們，你們根本沒把我們村民的性命看在眼裡。
	BeginPlot(TargetID(), "LuaS_423035_3", 0)	
end

function LuaS_423035_3()------
	Local KK = Lua_DW_CreateObj("flag" ,114574,780544,0,1 )
	if	CheckAcceptQuest( TargetID(),  423035)==true and  CheckFlag(TargetID(),543658)==false  then
		Tell(TargetID(),KK,"[SC_423035_5]")----協助他們，揪出那群士兵，才能獲得其他訊息。
		sleep(10)
		Tell(TargetID(),KK,"[SC_423035_6]")---我會從旁協助你
	end
	sleep(50)
	delobj(KK)
end
-------------------------------------------------------------------
-----423036---結束的劇情。---給周圍BUFF 當擁有這個BUFF看得見演戲的摩瑞克---修改，只給一人看到摩瑞克。	
--function LuaS_423036_1()
---種出演戲用的摩瑞克	利用旗子780544：3
---	DisableQuest( OwnerID() , true )	
---	Local MAK = Lua_DW_CreateObj("flag" ,114445,780544,3,1 )
--	AddBuff( TargetID(), 505985 , 1 , 11)
---	CastSpell( OwnerID()  , OwnerID()  , 495235 )---檢查是不是完成423036 是不是尚未接 423037   利用505985來進行判斷
--	DW_MoveToFlag( MAK,780544,4, 0,1)
--	Yell(  MAK, "[SC_423036_1]" , 3 )----摩瑞克：我感覺得出有股混亂的元素再逼近。
--	sleep(30)
--	Yell( OwnerID() , "[SC_423036_2]" , 3 )---菲利：你是什麼人？
--	sleep(30)
--	Yell(  MAK, "[SC_423036_3]" , 3 )---摩瑞克：我和[$PLAYERNAME]，是伙伴，都是來協助你們的人。
--	SLEEP(20)
--	Yell( OwnerID() , "[SC_423036_4]" , 3 )---菲利：很好，讓我們奮力一戰吧！
--	delobj(MAK)
--	DisableQuest( OwnerID() , false )
---end

---780544的檢查
---function LuaS_423036_2()
--	if  CheckCompleteQuest( TargetID(), 423036) ==true and CheckAcceptQuest( TargetID(), 423037 )==false then
--		return true
--	end
--		return false
--end

------------------------------------------------------------------
----423038----
-----亂數對話演戲
---一開始鎖住對話 然後演戲 還要檢查NPC是否還在動作

------分為兩個
--function LuaI_114576()---初始劇情
--	local Num = DW_Rand(2)
--	WriteRoleValue( OwnerID() , EM_RoleValue_PID , Num )

--end
function LuaS_114576_0()
	local String = {"[SC_114576_1]" , "[SC_114576_2]"  }---對話前的說話
	SetSpeakDetail( OwnerID(), String[DW_Rand(2)] )
		if CheckAcceptQuest( OwnerID() , 423038 ) == true then
			AddSpeakOption( OwnerID() , TargetID() , "[SC_114576_0]" , "LuaS_114576_1",0 ) --請問你有沒有看到亞班諾領主[103292]？
		end
end

function LuaS_114576_1()
	local LUA = {"LuaS_114576_2" , "LuaS_114576_3"  }
	local PID = ReadRoleValue( TargetID() , EM_RoleValue_PID )
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID(),  LUA[PID], 0)
end
function LuaS_114576_2()
	DisableQuest( OwnerID() , true )
	AdjustFaceDir( OwnerID()  , TargetID(), 0 )
	YELL( OwnerID() , "[SC_114576_4]",3)---沒有，不過你找他做什麼？
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	sleep(30)
	YELL( OwnerID() , "[SC_114576_5]",3 )---	像他那種人早該消失了，最好死了算了！
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_BUFF_BEGIN)	
	sleep(30)
	YELL( OwnerID() , "[SC_114576_6]",3 )----像他那種讓騎士團搶劫自己人民也配稱作領主。
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	YELL( OwnerID() , "[SC_114576_7]",3 )--我呸～簡直比強盜都還要不如。
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_ATTACK_1H_SP)		
	sleep(30)	
	YELL( OwnerID() , "[SC_114576_8]",3 )---你最好不是他手下的人，否則我今天就代替這邊的居民收拾你。
	sleep(30)	
	local Player = SearchRangePlayer ( OwnerID() , 150 )
	for i=0,table.getn(Player)-1 do
		if	CheckAcceptQuest( Player[i],   423038)==true and    CheckFlag( Player[i], 543660 )==false	then
			SetFlag(Player[i], 543660,1)
		end
	end
	DisableQuest( OwnerID() , false )
end
function LuaS_114576_3()
	DisableQuest( OwnerID() , true )
	AdjustFaceDir( OwnerID()  , TargetID(), 0 )
	YELL( OwnerID() , "[SC_114576_9]",3)---什麼[103292]那個垃圾還沒死嗎？
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_HURT_CRITICAL )	
	sleep(30)
	YELL( OwnerID() , "[SC_114576_10]",3)---這麼說來，我前陣子還有看見他的副官[103293]在城內游晃。
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE2 )	
	sleep(30)
	YELL( OwnerID() , "[SC_114576_11]",3)---該死，那些狗娘養的一個比一個還要混帳。
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_ATTACK_1H_SP)
	sleep(30)
	YELL( OwnerID() , "[SC_114576_12]",3)--尤其是[103293]。
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)	
	YELL( OwnerID() , "[SC_114576_13]",3)---在他輔佐[103292]後，讓我們生活的更加艱困、痛苦。
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)	
	YELL( OwnerID() , "[SC_114576_14]",3)---可惡，我那天真該衝上去斃了他。
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_ATTACK_1H_SP)	
	sleep(30)	
	YELL( OwnerID() , "[SC_114576_15]",3)---就像殺掉那些可惡的盜賊一樣。
	
	local Player = SearchRangePlayer ( OwnerID() , 150 )
	for i=0,table.getn(Player)-1 do
		if	CheckAcceptQuest( Player[i],   423038)==true   and  CheckFlag( Player[i], 543661 )==false	then
			SetFlag(Player[i], 543661,1)
		end
	end
	sleep(30)	
	DisableQuest( OwnerID() , false )
end	
--------	
function LuaI_114611()---初始劇情
	local Num = DW_Rand(2)
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , Num )
end
 function LuaS_114611_0()
	local String = {"SC_114611_1" , "SC_114611_2" , "SC_114611_3"  }---對話前的說話
	SetSpeakDetail( OwnerID(), "["..String[DW_Rand(3)].."]" )
	if CheckAcceptQuest( OwnerID() , 423038 ) == true then
		AddSpeakOption( OwnerID() , TargetID() , "[SC_114576_0]" , "LuaS_114611_2",0 ) --請問你有沒有看到亞班諾領主[103292]？
	end
end

function LuaS_114611_2()
	CloseSpeak( OwnerID() )
	local LUA = {"LuaS_114611_3" , "LuaS_114611_4"  }
	local PID = ReadRoleValue( TargetID() , EM_RoleValue_PID )
	BeginPlot( TargetID(),  LUA[PID], 0)
end

function LuaS_114611_3()
	DisableQuest( OwnerID() , true )
	AdjustFaceDir( OwnerID()  , TargetID(), 0 )
	yell( OwnerID() , "[SC_114611_4]",3)---沒有……沒有……
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)	
	sleep(30)
	YELL( OwnerID() , "[SC_114611_5]",3)---我什麼都不知道，什麼都沒看見。
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)	
	sleep(30)
	SetFlag( TargetID() , 543662, 1 )
	DisableQuest( OwnerID() , false )
end

function LuaS_114611_4()
	DisableQuest( OwnerID() , true )
	AdjustFaceDir( OwnerID()  , TargetID(), 0 )
	YELL( OwnerID() , "[SC_114611_6]",3)---你.......是說領主[103292]嗎？
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE1)	
	sleep(30)
	YELL( OwnerID() , "[SC_114611_7]",3)---沒有……沒看見。
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)	
	SetFlag( TargetID() , 543662, 1 )
	sleep(30)
	DisableQuest( OwnerID() , false )
end
------------------------------
---------------------------------------------------------------------
------------423043
function LuaS_423043()
             	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),423043)==true )and (CheckFlag(OwnerID(),543725)==false ) then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423043_1]","LuaS_423043_1",0)---[ZONE_YGGNO LAND]
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421962_2]","LuaS_423043_1",0)---[ZONE_YGGNO LAND]
	end
	if (CheckAcceptQuest(OwnerID(),423049)==true )and  (CheckFlag(OwnerID(),543726)==false ) and CheckBuff(OwnerID(),505987)==false then
		 AddSpeakOption(OwnerID(),TargetID(),"[SC_423049_1]","LuaS_423049_1",0)----你有想到什麼好方法嗎？
	end

	if  (CheckAcceptQuest(OwnerID(),423045)==true )and CountBodyItem( OwnerID(), 206801)==0 then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423043_4]","LuaS_423043_2",0)
	end

	if  (CheckAcceptQuest(OwnerID(),423048)==true )and CountBodyItem( OwnerID(), 206806)<4  then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423043_5]","LuaS_423043_3",0)
	end
end

function LuaS_423043_2()
	SetSpeakDetail(OwnerID(),"[SC_423043_3]")
	GiveBodyItem( OwnerID(), 206801, 1 )
end
function LuaS_423043_3()
	SetSpeakDetail(OwnerID(),"[SC_423043_6]")
	GiveBodyItem( OwnerID(),206805, 1 )
end
function LuaS_423043_1()
	SetSpeakDetail(OwnerID(),"[SC_423043_2]")
	SetFlag( OwnerID() , 543725, 1 )
end

----------------------------------------------------------------------------------------------
---------------423046
---對話劇情
function LuaS_423046()--
	if CheckCompleteQuest(OwnerID(),423046)==true then
			SetSpeakDetail(OwnerID(),"[SC_423046_8]")
	else
             	LoadQuestOption( OwnerID() )
    end
	if (CheckAcceptQuest(OwnerID(),423046)==true )and (CountBodyItem( OwnerID(), 206804)<1) then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423046_1]","LuaS_423046_1",0)-----我是來為[114614]取回他的書籍[206804]。
	end
end

function LuaS_423046_1()
	SetSpeakDetail(OwnerID(),"[SC_423046_2]")---呿~[114614]那個沒用的蠢貨，終於還是耐不住性子了？那本[206804]明明就是我透過關係好不容易才向S.S.S.E詢問到的，是他不知道用什麼樣卑鄙的手段讓S.S.S.E誤解並把書賣給了他。這樣你還要幫他嗎？
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423046_3]","LuaS_423046_2",0)---無論如何搶人東西就是不對！
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423046_4]","LuaS_423046_3",0)---(還是先不要惹他好了。)
end
function LuaS_423046_2()
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID(), "LuaS_423046_4", 0)
end
function LuaS_423046_4()
	DisableQuest(OwnerID(),true)	
	Hide(OwnerID())
--建立戰鬥用替身 &防止戰鬥後留存的問題 &指定目標 &完成條件
	local NPC = Lua_DW_CreateObj("obj",103300,OwnerID())
	WriteRoleValue(NPC  ,  EM_RoleValue_PID , OwnerID())
	SetPlot(NPC,"dead","LuaS_423046_5",0)
	Say(NPC,"[SC_423046_5]")---看樣子你聽不懂人話，只能用拳頭讓你聽話了。
	BeginPlot(NPC,"LuaS_Discowood_CheckPeace",0)
	Lua_Drama_Radar( NPC , 423046 ) 
	SetAttack(NPC,TargetID())
--檢查何時結束
	while	CheckID(NPC)  and ReadRoleValue( NPC , EM_RoleValue_IsDead  )== 0	do
		sleep(10)
		if Lua_Check_Drama_Statu( NPC ) == false then
			DelObj( NPC )
			break
		end
	end
----現出本尊	&重啟互動
	Show(OwnerID(),0)
	if  	CheckBuff(OwnerID(), 504004)==true then
		say(OwnerID(),"[SC_423046_6]")---不要打了~已經給了！不要再打了！
		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_BEG)		
		sleep(10)
		CancelBuff( OwnerID(), 504004 )
	end
	sleep(10)
	DisableQuest(OwnerID(),false)
end

function LuaS_423046_5() --死亡劇情 給完成旗標
	local MM = ReadRoleValue( OwnerID() , EM_RoleValue_PID  )
	local Tar
	for i=0,HateListCount(OwnerID())-1,1	do
		Tar = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest(Tar,423046)== true	and	(CountBodyItem( Tar, 206804)<1) then
			GiveBodyItem( Tar, 206804, 1 )
		end
	end
	AddBuff( MM , 504004 , 0 , 10 )
	sleep(10)
	DelObj(OwnerID())
---	BeginPlot(OwnerID(),"LuaS_423046_6",0)
---	return  false
end
---function LuaS_423046_6() --
---	Hide(OwnerID())
--	Show(MM,0)
---	DisableQuest(MM,true)	
---	say(MM,"[SC_423046_6]")---不要打了~已經給了！不要再打了！
---	PlayMotion( MM , ruFUSION_ACTORSTATE_EMOTE_BEG)		
---	sleep(10)
---	DisableQuest(MM,false)
		----SetRoleCamp( Rouge , "Visitor" )
---		PlayMotion( MM, 	ruFUSION_ACTORSTATE_EMOTE_SURRENDER	)
---		say(OwnerID(),"[SC_423046_6]")---不要打了~已經給了！不要再打了！
---		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_BEG)		
---		sleep(20)
--		DelObj(OwnerID())
---end
function LuaS_423046_3()
	SetSpeakDetail(OwnerID(),"[SC_423046_7]")---明白就好，在我還沒發怒前，你最好滾得遠遠。
end
---------------------------------------------------------------------
-------423047
------接受任務後劇情

function LuaS_423047_1()
	if CountBodyItem( OwnerID(), 206802)<1  then
		GiveBodyItem(  OwnerID(), 206802, 1 )
		return 1
	end
	if 	 CountBodyItem( OwnerID(), 206803)<1 then
		GiveBodyItem(  OwnerID(), 206803, 1 )
		return 1
	end
	if 	 CountBodyItem( OwnerID(), 206803)>=1 and CountBodyItem( OwnerID(), 206802)>=1 then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423047_5]", 0 )
		return 1
	end
end

function LuaS_423047()---接受任務的演戲 利用旗子780544：3
	DisableQuest( OwnerID() , true )
	Local KK = Lua_DW_CreateObj("flag" ,114626,780544,3,0 )
	SetModeEx(KK ,EM_SetModeType_ShowRoleHead ,true) -----------秀出頭像框
	SetModeEx(KK ,EM_SetModeType_HideName ,false) -----------秀出名稱
	AddToPartition(KK,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
	DW_MoveToFlag( KK,780544,4, 0,1)
	Yell( KK, "[SC_423047]", 3 )--丹尼金：[114614]……你剛切的乳酪絲，味道不錯！還有嗎？
	PlayMotion( KK ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell( OwnerID(), "[SC_423047_1]", 3)---[114614]：沒了，剛剛有個貴族溜過來買書時，順便把它買走了。
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell( OwnerID(),  "[SC_423047_2]", 3 )---[114614]：出乎我意料的值錢，讓你猜我賣了多少錢？
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell( KK, "[SC_423047_3]", 3 )---丹尼金：多少錢？
	PlayMotion( KK ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell( OwnerID(),  "[SC_423047_4]", 3 )---[114614]：5萬金，哈哈哈哈，那個蠢蛋！
	PlayMotion( OwnerID() , ruFUSION_MIME_EMOTE_LAUGH)	
	sleep(30)
	delobj(KK)
	DisableQuest( OwnerID() , false )
end
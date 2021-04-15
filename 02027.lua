
--======================================================================================================
--423548
--======================================================================================================
function LuaS_423548_0()
	Sleep(30)
	ScriptMessage( OwnerID(), TargetID(), 1,"[SC_423548_0]", 0 )
	ScriptMessage( OwnerID(), TargetID(), 0,"[SC_423548_0]", 0 )
	AddBuff(TargetID(),503977,1,100)
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_DYING)
	Sleep(30)

	AddBuff(TargetID(),506098,1,100)
	ChangeZone( TargetID() , 18 , 0 , 7949.2  , -153.5  , 50030.9   , 9.2 )
	Sleep(40)
	
	CancelBuff( TargetID()  , 506098 )	
	
		local NPC =SearchRangeNPC ( TargetID() , 200 )				
		--搜尋玩家身邊 200範圍內的npc，放入npc的陣列內
		local S1	
		for i=0,table.getn(NPC),1 do
			if ReadRoleValue(NPC[i], EM_RoleValue_PID ) == 116235 then
				S1= NPC[i]	--伊崔妮
			end
		end
		
		Yell(S1,"[SC_423548_1]",1)
		Sleep(30)
		CastSpell(S1 , TargetID(),494518)
		Sleep(20)
		PlayMotion(TargetID(),ruFUSION_ACTORSTATE_REVIVING)
	CancelBuff( TargetID()  , 503977 )
end

--======================================================================================================
--423517
--======================================================================================================
	
function LuaWS_423541_E0()	--780739.2
	DisableQuest(OwnerID(), true )
	AddBuff(TargetID(),507547,1,400)	
		Local Ton  = LuaFunc_CreateObjByObj( 116372 , OwnerID() )
		Hide(Ton)
		local NPC =SearchRangeNPC ( OwnerID() , 50 )				
			--搜尋玩家身邊 200範圍內的npc，放入npc的陣列內
			local S1	
			for i=0,table.getn(NPC),1 do
				if ReadRoleValue(NPC[i], EM_RoleValue_PID ) == 116235 then
					S1= NPC[i]	--伊崔妮
				end
			end
		Local Rose  = LuaFunc_CreateObjByObj( 116371 , S1 )
	
	Hide(Rose)
	DisableQuest(Ton, true )
	DisableQuest(Rose, true )
	Show(Ton,0)
	Show(Rose,0)

	Adjustfacedir(Ton,Rose,0)
	Adjustfacedir(Rose,Ton,0)
	PlayMotion(Rose,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Sleep(30)
	WriteRoleValue(Ton, EM_RoleValue_IsWalk, 1)
	WriteRoleValue(Rose, EM_RoleValue_IsWalk, 1)
	Adjustfacedir(Ton,TargetID(),0)
	Adjustfacedir(Rose,TargetID(),0)
	Beginplot(Rose,"LuaWS_423541_E1",0)
	Yell(Ton,"[SC_423541_0]",1)
	--我們先行一步。
	PlayMotion(Ton,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Sleep(20)
	DW_MoveToFlag(Ton,780739,2,0,1)
	Delobj(Ton)
	
	CancelBuff( TargetID()  , 507547  ) 
	DisableQuest(OwnerID(), false )
end	

function LuaWS_423541_E1()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Sleep(50)
	DW_MoveToFlag(OwnerID(),780739,2,0,1)
	Delobj(OwnerID())
end
	
--======================================================================================================
--423542	544380 200金	544372 50金
--======================================================================================================
function LuaS_423542_0()
	LoadQuestOption(OwnerID())
	--你還有任何想了解的嗎？
		if 	(CheckAcceptQuest(OwnerID(),423542)== true )	then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_423542_0]","LuaS_423542_1",0)
				--謝謝你，我沒有其他想知道的事情了。  
		end
		if 	(CheckAcceptQuest(OwnerID(),423542)== true )	or
			(CheckCompleteQuest(OwnerID(),423542)== true ) 	then

				AddSpeakOption(OwnerID(),TargetID(),"[SC_423542_1]","LuaS_423542_2",0)
				--請告訴我沙卡巴當年的計劃。
				AddSpeakOption(OwnerID(),TargetID(),"[SC_423542_3]","LuaS_423542_3",0)
				--德銳克．怒牙真的死了嗎？
				AddSpeakOption(OwnerID(),TargetID(),"[SC_423542_7]","LuaS_423542_4",0)
				--腐眼部族曾被清剿，你是如何逃過那一劫的？
		end
		if 	(CheckAcceptQuest(OwnerID(),423543)==true)		and
			(CheckCompleteQuest(OwnerID(),423543)== false )	and
			CountBodyItem( OwnerID(), 208141)<1				then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423543_0]","LuaS_423543",0)
		end
end

function LuaS_423542_1()
	SetSpeakDetail(OwnerID(),"[SC_423542_12]")
	--謝謝你的傾聽，無論何時，只要你想知道我族當年的遭遇，我都會在這裡為你回答。
	SetFlag(OwnerID(),544383,1)

end

function LuaS_423542_2()
	--請告訴我沙卡巴當年的計劃。
	SetSpeakDetail(OwnerID(),"[SC_423542_2]")
	--十五、十六年前，族長及族老們未聽我的勸告......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423542_5]","LuaS_423542_5",0)
	--為什麼不揭發沙卡巴？
end

function LuaS_423542_3()
	--德銳克．怒牙真的死了嗎？
	SetSpeakDetail(OwnerID(),"[SC_423542_4]")
	--這個我不敢肯定，只是，我聽曾參與那次行動的族人說過，
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423542_14]","LuaS_423542_0",0)
		--可以再多告訴我一些嗎？
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423542_0]","LuaS_423542_1",0)
		--謝謝你，我沒有其他想知道的事情了。 
end

function LuaS_423542_4()
	--腐眼部族曾被清剿，你是如何逃過那一劫的？
	SetSpeakDetail(OwnerID(),"[SC_423542_8]")
	--我沒有參與那場計畫，而且先離開萊慕恩隱居到岩鹽村，
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423542_9]","LuaS_423542_6",0)
		--現在腐眼部族還有多少人，都在這裡嗎？
end	
	

function LuaS_423542_5()
	SetSpeakDetail(OwnerID(),"[SC_423542_6]")
	--我族被清剿當時，我衝動的立刻公佈沙卡巴與我族往來的書信
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423542_14]","LuaS_423542_0",0)
		--可以再多告訴我一些嗎？
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423542_0]","LuaS_423542_1",0)
		--謝謝你，我沒有其他想知道的事情了。 
end

function LuaS_423542_6()
	SetSpeakDetail(OwnerID(),"[SC_423542_10]")
	--少許從屠殺裡活下來的族人，一一來到我這裡請求庇護
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423542_14]","LuaS_423542_0",0)
		--可以再多告訴我一些嗎？
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423542_0]","LuaS_423542_1",0)
		--謝謝你，我沒有其他想知道的事情了。 
end
	
		
function LuaS_423542_x()

		if 	Checkflag(TargetID(),544372)== true	and
			Checkflag(TargetID(),544380)== true	then
			Say(OwnerID(),"[SC_423542_11]")	
			--這是原屬於你的金錢，請你收下。
			AddRoleValue(TargetID(),EM_RoleValue_Money,250)
			SetFlag(TargetID(),544372,0)
			SetFlag(TargetID(),544380,0)
			ScriptMessage( OwnerID()   , TargetID()   , 0 , "[SC_423542_X1]" , 0 )	
			ScriptMessage( OwnerID()   , TargetID()   , 2 , "[SC_423542_X1]" , 0 )	
			--你拿回250金幣。
		end
		
		if	Checkflag(TargetID(),544372)== true	then
			Say(OwnerID(),"[SC_423542_11]")	
			--這是原屬於你的金錢，請你收下。
			AddRoleValue(TargetID(),EM_RoleValue_Money,50)
			SetFlag(TargetID(),544372,0)
			ScriptMessage(  OwnerID()   , TargetID()    , 0 , "[SC_423542_X2]" , 0 )
			ScriptMessage(  OwnerID()   , TargetID()    , 2 , "[SC_423542_X2]" , 0 )			
			--你拿回50金幣。
			
		end
		
		if	Checkflag(TargetID(),544380)== true	then
			Say(OwnerID(),"[SC_423542_11]")	
			--這是原屬於你的金錢，請你收下。
			AddRoleValue(TargetID(),EM_RoleValue_Money,200)
			SetFlag(TargetID(),544380,0)
			ScriptMessage(  OwnerID()   , TargetID()    , 0 , "[SC_423542_X3]" , 0 )
			ScriptMessage(  OwnerID()   , TargetID()    , 2 , "[SC_423542_X3]" , 0 )			
			--你拿回200金幣。
		end
end


--======================================================================================================
--423543
--======================================================================================================
function LuaS_423543()
	SetSpeakDetail(OwnerID(),"[SC_423543_1]")
		if	CountBodyItem( OwnerID(), 208141)<1		then
			GiveBodyItem( OwnerID() , 208141 , 1 )
		end
end
	

--======================================================================================================
--423549	玩家丟掉傳送石
--======================================================================================================
function LuaS_423549_0()
	LoadQuestOption(OwnerID())
		if 	(CheckCompleteQuest(OwnerID(),423549)== true ) 			and (CountBodyItem( OwnerID(), 208142)<1	)			then
			if	((CheckAcceptQuest(OwnerID(),423543)== true )		and	(CheckCompleteQuest(OwnerID(),423543)== false ))	or
				((CheckCompleteQuest(OwnerID(),423543)== true )		and	(CheckCompleteQuest(OwnerID(),423544)== false ))	then
					if		CountBodyItem( OwnerID(), 208174)<1			then
							AddSpeakOption(OwnerID(),TargetID(),"[SC_423549_0]","LuaS_423549_1",0)
							--我弄丟前往達拉尼斯的傳送晶石了。
							--Say(OwnerID(),CountBodyItem( OwnerID(), 208196))
					end
					if		CountBodyItem( OwnerID(), 208196)<1			then
							
							AddSpeakOption(OwnerID(),TargetID(),"[SC_423549_1]","LuaS_423549_2",0)
							--我弄丟回到岩鹽村的傳送晶石了。
							--Say(OwnerID(),"Rock2")
					end
			end
		end
		
end
			
function LuaS_423549_1()
	SetSpeakDetail(OwnerID(),"[SC_423549_2]")
	--這東西很珍貴的，小心收著，別再掉了。
		if	CountBodyItem( OwnerID(), 208174)<1		then
			GiveBodyItem( OwnerID() , 208174 , 1 )
		end
end

function LuaS_423549_2()
	SetSpeakDetail(OwnerID(),"[SC_423549_2]")
	--這東西很珍貴的，小心收著，別再掉了。
		if	CountBodyItem( OwnerID(), 208196)<1		then
			GiveBodyItem( OwnerID() , 208196 , 1)
		end
end

-----------------------------------

function LuaI_s7_208174_0()	
	--傳至達拉尼斯的晶石
	--掛在作用物品的模版下>物品使用>使用效果類型：Server端劇情>使用效果
	Beginplot(TargetID(),"LuaI_s7_208174_1",0)
end


function LuaI_s7_208174_1()
	if	(CountBodyItem(TargetID(),208174))>0 then
		if 	ReadRoleValue(TargetID() , EM_RoleValue_ZoneID)==18	then
			CastSpell( TargetID() , TargetID() , 496116 )
			Sleep(30)
			ChangeZone( TargetID() , 15 , 0 , -3516.2  , -107.2  , 8103.4   , 342.6 )
			DelBodyItem(TargetID(),208174,1)
		else
			ScriptMessage(  TargetID()   , TargetID()    , 0 , "[SC_208174_0]" , 0 )
		end
	end
end

function LuaI_s7_208196_0()	
	--傳至達拉尼斯的晶石
	--掛在作用物品的模版下>物品使用>使用效果類型：Server端劇情>使用效果
	Beginplot(TargetID(),"LuaI_s7_208196_1",0)
end


function LuaI_s7_208196_1()
	if	(CountBodyItem(TargetID(),208196))>0 then
		if 	ReadRoleValue(TargetID() , EM_RoleValue_ZoneID)==15	then
			CastSpell( TargetID() , TargetID() , 496116 )
			Sleep(30)
			ChangeZone( TargetID() , 18 , 0 , 7949.2  , -153.5  , 50030.9   , 9.2 )
			DelBodyItem(TargetID(),208196,1)
		else
			ScriptMessage(  TargetID()   , TargetID()    , 0 , "[SC_208196_0]" , 0 )	
		end
	end
end




--======================================================================================================
--423546
--======================================================================================================
function LuaWS_423546_0()
	LoadQuestOption(OwnerID())
		if	(CheckAcceptQuest(OwnerID(),423546)== true )		and
			(CheckCompleteQuest(OwnerID(),423546)== false )		and
			Checkflag(OwnerID(),544387)== false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423546_0]","LuaWS_423546_1",0)
			--黑洛卡，這裡有些東西，你應該會感興趣。
		end
end

function LuaWS_423546_1()
	SetSpeakDetail(OwnerID(),"[SC_423546_1]")
	--這是......這些是沙卡巴當年與腐眼的密謀信件！你、你怎麼拿到的？
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423546_2]","LuaWS_423546_2",0)
		--腐眼已向陛下投誠，這是他們自願交出來的。
end

function LuaWS_423546_2()
	SetSpeakDetail(OwnerID(),"[SC_423546_3]")
	--哼！腐眼就是腐眼，就像以前一樣，最會趨炎附勢，騎士，你得告訴陛下小心提防那些小人
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423546_4]","LuaWS_423546_3",0)
		--相信陛下自有判斷，不過，謝謝你的提醒，我會帶給陛下。
end

function LuaWS_423546_3()
	SetSpeakDetail(OwnerID(),"[SC_423546_5]")
	--是的，陛下少年有為，是我多慮了......
	SetFlag(OwnerID(),544387,1)
end


--======================================================================================================
--423547
--======================================================================================================

function LuaWS_423547_E0()	--780739.3

	DisableQuest(OwnerID(), true )
	AddBuff(TargetID(),507550,1,400)	

		Local Ton  = LuaFunc_CreateObjByObj( 116419 , OwnerID() )
		Hide(Ton)
		local NPC =SearchRangeNPC ( OwnerID() , 50 )				
			--搜尋玩家身邊 200範圍內的npc，放入npc的陣列內
			local S1	
			for i=0,table.getn(NPC),1 do
				if ReadRoleValue(NPC[i], EM_RoleValue_PID ) == 116240 then
					S1= NPC[i]	--伊崔妮
				end
			end
		Local Rose  = LuaFunc_CreateObjByObj( 116418 , S1 )
	
		Hide(Rose)
		DisableQuest(Ton, true )
		DisableQuest(Rose, true )
		Show(Ton,0)
		Show(Rose,0)

	Adjustfacedir(Ton,Rose,0)
	Adjustfacedir(Rose,Ton,0)
	PlayMotion(Rose,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Sleep(30)
	WriteRoleValue(Ton, EM_RoleValue_IsWalk, 1)
	WriteRoleValue(Rose, EM_RoleValue_IsWalk, 1)
	Adjustfacedir(Ton,TargetID(),0)
	Adjustfacedir(Rose,TargetID(),0)
	Beginplot(Rose,"LuaWS_423547_E1",0)
	Yell(Ton,"[SC_423547_0]",1)
	--我們先行一步。
	PlayMotion(Ton,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Sleep(20)
	DW_MoveToFlag(Ton,780739,3,0,1)
	Delobj(Ton)
	
	CancelBuff( TargetID()  , 507550  ) 
	DisableQuest(OwnerID(), false )
	
end	

function LuaWS_423547_E1()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Sleep(50)
	DW_MoveToFlag(OwnerID(),780739,3,0,1)
	Delobj(OwnerID())
end
	


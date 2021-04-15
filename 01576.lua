function LuaS_422807_1()
	SetSpeakDetail(OwnerID(),"[SC_422807_2]")-------
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422807_3]","LuaS_422807_2",0)---1
end
function LuaS_422807_2()
	SetSpeakDetail(OwnerID(),"[SC_422807_4]")
	SetFlag( OwnerID() , 543420 , 1 )
end
function LuaS_422807_3()--結束後
	DisableQuest( OwnerID() , true)
	SetPlot(  OwnerID()  ,   "touch" ,  "LuaFunc_Obj_BUSY"  , 40  )
	local KK = Lua_DW_CreateObj("flag" ,113687,780432,0,1 )
	DW_MoveToFlag( KK,780432,1, 0,1)
	PlayMotion(  KK ,ruFUSION_ACTORSTATE_CAST_BEGIN)    
	Yell( KK , "[SC_422807_5]" , 3 ) ----嗚嗚嗚~神，糟糕！糟糕！ruFUSION_ACTORSTATE_CAST_SP03
	PlayMotion(  KK ,ruFUSION_ACTORSTATE_CAST_BEGIN) 
	DW_MoveToFlag( KK,780432,2, 0,1)
	Yell( OwnerID() , "[SC_422807_6]" , 3 ) ---發生了什麼事？[113687]？不要著急，慢慢說。ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE
	PlayMotion( OwnerID()  ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(30)
	Yell( KK , "[SC_422807_7]" , 3 ) --[113687]～[113687]，看到好多壞人在圍剿森林裡的被淨化後的[101795]！
	PlayMotion(  KK ,ruFUSION_ACTORSTATE_CAST_BEGIN) 
	sleep(30)
	Yell( KK , "[SC_422807_8]" , 3 ) --他們好壞，好壞！[113687]，只是走過去叫他們不要欺負牠們！
	PlayMotion(  KK ,ruFUSION_ACTORSTATE_CAST_INSTANT)  
	sleep(30)
	Yell( KK , "[SC_422807_9]" , 3 ) --就被他們踢到一旁，他們還說要將[113687]的血抽乾，和牠們一起做成血清。
	PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_EMOTE_EAT)  
	sleep(30)
	Yell( KK , "[SC_422807_10]" , 3 ) --嗚嗚嗚~[113687]聽到他們說接下來要對[102754]下手，奪取牠身上的能量，所以[113687]很努力的跑回來，要告訴神。
	PlayMotion(  KK ,ruFUSION_ACTORSTATE_CAST_SP03)    
	sleep(30)
	Yell( OwnerID() , "[SC_422807_11]" , 3 ) ---我知道了。不要再說了，[113687]，先讓我為你治癒傷口。
	PlayMotion( OwnerID()  ,ruFUSION_ACTORSTATE_USE)
	sleep(20)
	CastSpell(KK,OwnerID(),494494)--施放技能。
	sleep(20)
	Yell( KK , "[SC_422807_12]" , 3 )---痛～好痛喔！
	PlayMotion(  KK ,ruFUSION_ACTORSTATE_CAST_SP02)  
	sleep(20)
	Yell( OwnerID() , "[SC_422807_13]" , 3 ) ---[113687]，忍耐住，再過一會兒就不疼了。
--	PlayMotion( OwnerID()  ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	PlayMotion( OwnerID()  ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	sleep(20)
	Yell( KK , "[SC_422807_14]" , 3 )---[113687]，不痛，一點都不痛。神......不要為[113687]難過。
	PlayMotion(  KK ,ruFUSION_ACTORSTATE_CAST_SP02)  
	sleep(20)
	Yell( KK , "[SC_422807_15]" , 3 ) ---[113687]就要和[[113634]一樣大了！可以為神做好多好多事情！所以[113687]不痛，一點都不痛！
	sleep(20)
--	PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_EMOTE_EAT)  
	Yell(  OwnerID()   , "[SC_422807_16]" , 3 )----[113687]……
	sleep(20)
	DW_MoveToFlag( KK,780432,2, 0,0)
	Yell( KK , "[SC_422807_17]" , 3 )---[113687]一點都不痛，[113687]還要繼續為神監視森林，[113687]要馬上去！這次[113687]會躲在暗處，神不要難過。
	sleep(20)
	PlayMotion( OwnerID()  ,ruFUSION_ACTORSTATE_CROUCH_END)
	DW_MoveToFlag( KK,780432,1, 0,0)
	DisableQuest(OwnerID(),false)
	SetPlot(  OwnerID()  ,   "touch" ,  ""  , 0  )
	DW_MoveToFlag( KK,780432,3, 0,1)
	sleep(20)
	delobj(kk)
end

--------------------------------------------------------
function LuaS_422808_0() --物件上的初始	範圍劇情
	SetPlot(OwnerID(),"range","LuaS_422808_1",150)
end

function LuaS_422808_1() -- 範圍劇情	執行
--觸碰者是否	有接任務&尚未完成
	if	CheckAcceptQuest(OwnerID(),422808)	and
		CheckFlag(OwnerID(),543446)==false	then
--顯示字串提示
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422808]", 0 );
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422808]", 0 );---似乎就是就是這裡了！
--給予完成任務旗標
	end
end

function LuaS_422808_2()--物品使用	檢查劇情
--判斷距離是否過遠
	if	CheckAcceptQuest( OwnerID() , 422808 ) == false or CheckCompleteQuest( OwnerID() , 422808 ) == true or CheckFlag( OwnerID() , 543446 ) == true then
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_422808_7]",0)
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_422808_7]",0)
		return false
	end
	if	not	DW_CheckDis(OwnerID(),780432,4,600)	then
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_422808_3]",0)
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_422808_3]",0)
		return false
	end
	if	not	DW_CheckDis(OwnerID(),780432,4,400)	then
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_422808_4]",0)
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_422808_4]",0)
		return false
	end
	if	not	DW_CheckDis(OwnerID(),780432,4,300)	then
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_422808_5]",0)
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_422808_5]",0)
		return false
	end
	if	not	DW_CheckDis(OwnerID(),780432,4,150)	then
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_422808_6]",0)
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_422808_6]",0)
		return false
	end
	return true
end


function LuaS_422808_3()--物品使用	執行劇情
	--AddBuff( OwnerID(),505052 , 1 , 10 )---
--劇情表現	種出一個土堆
	castspell(OwnerID(),OwnerID(),490098)---法術
--字串回饋
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422808_2]", 0 )----你設下了結界。
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422808_2]", 0 )-----你設下了結界。
--給予完成旗標
	SetFlag(OwnerID(),543446,1)
	--return true
end
function LuaS_422808_4()
	while 1 do
		AddBuff(OwnerID() , 500902 , 0 , 60 )
		sleep( 600 )
	end
end
function LuaI_113667_0()
	local KK = Lua_DW_CreateObj("flag" ,113907,780432,5,1 )
	 Lua_ObjDontTouch( KK ) 
	BeginPlot( KK , "LuaS_422808_4",0 )
	SetPlot(OwnerID(),"range","LuaS_422808_1",150)
	SetIdleMotion( OwnerID() , ruFUSION_ACTORSTATE_CAST_BEGIN )
end
function LuaS_113667_0()
	if CheckFlag( OwnerID() , 543446 ) ==true or CheckCompleteQuest( OwnerID() , 422808 ) == true then
		LoadQuestOption( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_422808_8]")
	end
end

function LuaS_113907()	--水元
--	while true do
--		sleep(20)
--		CastSpell( OwnerID(), OwnerID(), 494492)
--	end
end
-------------------------------------------------------------------------------------------------------
function LuaS_422809_1()---掛在林精身上。
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422809)==true )and  (CheckFlag(OwnerID(),543421)==false )then
		AddSpeakOption(OwnerID(),TargetID()," [SC_422579_1]","LuaS_422809_2",0)--- 願意
	end
	if (CheckAcceptQuest(OwnerID(),422811)==true )and (CheckFlag(OwnerID(),543426)==false )and(ReadRoleValue( TargetID() , EM_RoleValue_PID )  == 0)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422811_1]","LuaS_422811_1",0)----我準備好了，我們走吧！ 
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422811_2]","LuaS_422811_2",0)----還沒～等等我，再稍等我一下！ 
	end
	if (CheckAcceptQuest(OwnerID(),422811)==true )and (CheckFlag(OwnerID(),543426)==false )and(ReadRoleValue( TargetID() , EM_RoleValue_PID )  == 1)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422811_1]","LuaS_422811_3",0) 
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422811_2]","LuaS_422811_2",0)----還沒～等等我，再稍等我一下！ 
	end

end

function LuaS_422809_2()
	SetSpeakDetail(OwnerID(),"[SC_422809_1]")---好
end

function LuaS_422809_3()---掛在箱子上。
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422809)==true )and  (CheckCompleteQuest( OwnerID(), 422809) ==false ) and CheckBuff( OwnerID() , 505024) == false then
		if (ReadRoleValue( TargetID() , EM_RoleValue_PID )  == 0) and CheckFlag( OwnerID() ,543421) == false then
			AddSpeakOption(OwnerID(),TargetID()," [SC_422809_2]","LuaS_422809_4",0)---躲進去。
		else
			AddSpeakOption(OwnerID(),TargetID()," [SC_422809_2]","LuaS_422809_5",0)---躲進去。			
		end
	end
end

function LuaS_422809_4()
	CloseSpeak( OwnerID() )
	WriteRoleValue(TargetID(),EM_RoleValue_PID,1)
    	BeginPlot( TargetID(), "LuaS_422809_6", 0)
end

function LuaS_422809_5()
	SetSpeakDetail(OwnerID(),"[SC_422809_3]")----你無法躲進[113763]，裡頭似乎已經裝滿了物品。
end

function LuaS_422809_6()---旗標使用780466--演戲用的兩隻。給重要旗標，CLIENT 不見原本的那隻。出現演戲的那兩隻。113705
	local KK = Lua_DW_CreateObj("flag" ,113705,780466,0,1 )
	local FF = Lua_DW_CreateObj("flag" ,113813,780466,1,1 )
	local lk = Lua_DW_CreateObj("flag" ,113568,780466,3,1 )----
-----	WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
	AddBuff( TargetID(), 505024 , 1 , 600)---讓玩家變成箱子，BUFF還未設。固定住。並把原本的NPC用CLIENT 隱藏起來。如果有BUFF，看不到箱子。
	AddBuff( TargetID(), 505053 , 1 , 600)---
	local Me = Role:new( OwnerID() )
	ChangeZone( TargetID() , Me:ZoneID() , Me:RoomID() , Me:X() , Me:Y() , Me:Z() , Me:Dir() )
	sleep(20)
	Yell( KK , "[SC_422809_4]" , 3 )---神～快看看！快看看！[113685]在水池裡找到了什麼東西。
	PlayMotion(  KK ,ruFUSION_ACTORSTATE_CAST_BEGIN) 
    sleep(30)
	Yell( FF , "[SC_422809_5]" , 3 )---什麼東西？
	sleep(25)
	Yell( KK , "[SC_422809_6]" , 3 )---秘密。[113685]將這個東西放在旁邊！神要在[113685]離開後，在打開。ruFUSION_ACTORSTATE_EMOTE_IDLE1
	PlayMotion(  KK ,ruFUSION_ACTORSTATE_CAST_SP02)
	sleep(30)
	Yell( FF , "[SC_422809_7]" , 3 )---嗯......我知道了，[113685]。
	sleep(25)
	Yell( KK , "[SC_422809_8]" , 3 )---還不能打開喔，要等[113685]離開......
    DW_MoveToFlag( KK,780466,2, 0,1)---跑走
    sleep(20)
	Yell( FF , "[SC_422809_9]" , 3 )---會是什麼呢？
	PlayMotion(  FF,ruFUSION_ACTORSTATE_CRAFTING_BEGIN)
	sleep(35)
	ScriptMessage( TargetID()  , TargetID(), 0 , "[SC_422809_10]" ,  "0xffbe9649" ) ---[113633]拿起擱置在一旁的物品後，發出了微微的歎息聲。
	ScriptMessage( TargetID()  , TargetID(), 1 , "[SC_422809_10]" ,  "0xffbe9649" ) 
	PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_EMOTE_EAT) 
	sleep(30)
	Yell( FF , "[SC_422809_11]" , 3 )---這條手鍊……
	PlayMotion(  FF,ruFUSION_ACTORSTATE_CRAFTING_LOOP)
	PlayMotion(  FF,ruFUSION_ACTORSTATE_CRAFTING_END)
	sleep(20)
	Yell( FF , "[SC_422809_12]" , 3 )----看來時間似乎還過得不夠久，還沒久到讓我忘了你，[102775]。
	local lk = Lua_DW_CreateObj("flag" ,113936,780466,3,1 )----
	CastSpell(lk,FF,493688)---諾芙對影行物件施法？諾芙手上連過去有東西？[尚未挑法術]
	sleep(10)
	local SS = Lua_DW_CreateObj("flag" ,113908,780466,3,1 )----安德薩斯總裁豋場。
	sleep(20)
	Yell( FF , "[SC_422809_13]" , 3 )--一眨眼就過了千年，但在此刻我還是從未忘卻你……[102775]。
	sleep(30)
	Yell( SS , "[SC_422809_14]" , 3 )---[113633]，思念......
	sleep(20)
	Yell( FF , "[SC_422809_15]" , 3 )---直到最後，我還是沒將這條灌注你思念的手鍊給丟去。
	PlayMotion(  FF,ruFUSION_ACTORSTATE_CRAFTING_LOOP)
	sleep(30)
	PlayMotion(  FF,ruFUSION_ACTORSTATE_CRAFTING_END)
	Yell( SS , "[SC_422809_16]" , 3 )---我該如何對你表明我的思慕？如果你所珍視的花朵，能代替我的思慕，那麼這世界上的花朵，夠不夠？ruFUSION_ACTORSTATE_EMOTE_POINT
	PlayMotion(  SS,ruFUSION_ACTORSTATE_PARRY_BOW)
	sleep(30)
	Yell( SS , "[SC_422809_17]" , 3 )---我曾向妳提起「獲得恆久的生命是否等同於恆久的孤獨」的疑問。
	PlayMotion(  SS,ruFUSION_ACTORSTATE_PARRY_BOW)
	sleep(30)
	Yell( SS , "[SC_422809_18]" , 3 )---現在已經有完美解答。
	PlayMotion(  SS,ruFUSION_ACTORSTATE_PARRY_BOW)
	sleep(30)
	Yell( SS , "[SC_422809_19]" , 3 )---答應了我，妳的生命將獲得完整。
	Yell( FF , "[SC_422809_19]" , 3 )---答應了我，妳的生命將獲得完整。
	sleep(30)
	Yell( FF , "[SC_422809_20]" , 3 )--我到現在還記得你說這些話的神情。然而我還是不明白……	ruFUSION_ACTORSTATE_EMOTE_SALUTE
	PlayMotion(  FF,ruFUSION_ACTORSTATE_EMOTE_SALUTE)
	sleep(30)
	Yell( FF , "[SC_422809_21]" , 3 )--不明白這些情感……就如同不明白[113691]之於你的情感。
	PlayMotion(  FF,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(30)
	Yell( FF , "[SC_422809_22]" , 3 )--那些濃郁炙烈的情感，終將會傷害你、我。人類如果不節制自身的情感，終將導致毀滅……
	PlayMotion(  FF,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(30)
	Yell( FF , "[SC_422809_23]" , 3 )--而你，總是讓我感覺到懼怕。緩慢的心將隨著你一同起舞。
	PlayMotion(  FF,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(30)
	Yell( SS , "[SC_422809_24]" , 3 )--[113633]，你只是神使，並不是神！卸下了神使的身分，妳只是個人，讓我視為珍寶的女人，所以拋棄你那些無私的愛，和我一起離開這。
	sleep(40)
	Yell( FF , "[SC_422809_25]" , 3 )--然而你說錯了……我不只是個女人，而且是個身為神使的人類，神賜與我知識，傳播知識、拯救崩潰的心靈這就是我應盡的使命。
	sleep(30)
	Yell( FF , "[SC_422809_26]" , 3 )--我無法與你一同離開……我從沒後悔過我的選擇。
	PlayMotion(  FF,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(30)
	Yell( FF , "[SC_422809_27]" , 3 )---然而[113691]出現後卻改變了我的想法，她讓我發覺自己黑暗、自私的那一面……以及無能為力……
	sleep(30)
	Yell( FF , "[SC_422809_28]" , 3 )--[102775]......如果時間能夠倒流......
   	sleep(30)
	SAY(SS,"[SC_422809_30]")--[113633]，我說過會保護妳。即使是這份對妳思念，也能化為守護妳的力量。
	DW_MoveToFlag( KK,780466,3, 0,1)
	Tell(TargetID() ,KK, "[SC_4227809_29]")------就是現在，[$PLAYERNAME]，和[113685]一起抓住那個奇怪的人。
	if 	CheckID(targetID()) == true and CheckBuff( targetID() , 505024)==true	then
   			CancelBuff(targetID() , 505024 )
	end
	PlayMotion(  KK ,ruFUSION_ACTORSTATE_CAST_SP02)
--	SetRoleCamp(SS,"Monster")
--	SetFollow( KK ,SS )
--	SetAttack(SS,TargetID())
--	BeginPlot( SS, "LuaS_422809_7", 0 )
--	CallPlot(SS,"LuaFunc_Obj_Suicide",50)
	
--	while true do--檢查
		sleep( 10 )
--			if CheckID(SS) == false then
--				SetFollow( KK , -1 )
				if	CheckID( TargetID()) == true and CheckAcceptQuest( TargetID() , 422809)==true 	then
					SetFlag(TargetID() ,543421,1)
				end
				Delobj(SS)
				CastSpell(lk,FF,493688)---諾芙對影行物件施法？諾芙手上連過去有東西？[尚未挑法術]
				sleep( 10)
				Delobj( lk)
				Yell( FF , "[SC_422809_31]" , 3 )---[$PLAYERNAME]？[113685]？
				PlayMotion(  KK ,ruFUSION_ACTORSTATE_CAST_BEGIN) 
				sleep(20)
				Yell( KK , "[SC_422809_32]" , 3 )---不是的，不是的，[113685]，只是想抓住那個人。 
				PlayMotion(  KK ,ruFUSION_ACTORSTATE_CAST_BEGIN)      
				sleep(20)
				Yell( KK , "[SC_422809_33]" , 3 )---做錯了嗎？[113685]？嗚嗚嗚嗚～神不要討厭[113685]。
				PlayMotion(  KK ,ruFUSION_ACTORSTATE_CAST_BEGIN) 
				sleep(20)
				DW_MoveToFlag( KK,780466,0, 0,1)
				sleep(20)
				if CheckID(targetID()) == true and CheckBuff( targetID() , 505053)==true	then
   					CancelBuff(targetID() , 505053 )
				end
				delobj(KK)
				delobj(FF)
				WriteRoleValue(OwnerID(), EM_RoleValue_PID,0)
--				break
--			end
--	end
end

-----掛在安德薩斯身上的 
function LuaS_422809_7()---給予旗標。
	local TempID
	for	i=0 , HateListCount( OwnerID() )-1 do----- 一開始的時候 要求"回傳"OwnerID()的「仇恨列表」中 "有多少個物件"假設我抓到的是x   跑一個for迴圈 i=1,x-1  讓他跑這麼多次
		TempID = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )-----，EM_HateListInfoType_GItemID==>取得"仇恨列表"「該位置的物件」的「遊戲內ID」(打他的人的ID)----去找  OwnerID() 的仇恨列表 中的第 i 個位置的物件的「遊戲內 ID」
		if	CheckAcceptQuest( TempID , 422809)==true 	then
			SetFlag(TempID,543421,1)
		end
	end
end
---------
function LuaS_422809_8()---諾芙
	BeginPlot( TargetID() , "LuaS_422809_9" , 0 )
end
function LuaS_422809_9()
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422809_34]",  "0xffbe9649"   )--[113685]：你並沒有做錯什麼。別哭了……
	sleep(30)
	ScriptMessage( OwnerID(), OwnerID(),  0, "[SC_422809_35]",  "0xffbe9649"   )---[113683]：你的關心我收到了，我能感覺到其中的溫暖，所以別哭了。
end

--------------------------------------------------------------------------------------------------------------------------
function LuaS_422810_check()---掛在物品上 先行檢查使用對象。

	if CountBodyItem( OwnerID() , 206186 ) > 0 or CheckAcceptQuest(OwneRID() , 422810 ) == false or CheckCompleteQuest( OwnerID() ,422810 ) == true then
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_422808_7]",0)
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_422808_7]",0)
		return false
	end
	if ReadRoleValue(TargetID(),EM_RoleValue_OrgID) ~= 102755	then -------
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422810_0]", 0 ); -----這個[206166]無法對[102755]以外的生物使用。
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422810_0]", 0 ); -----這個[206166]無法對[102755]以外的生物使用。
		return false
	end

	if GetDistance(TargetID(), OwnerID() ) > 70  then -------距離
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422810_1]", 0 ); -----距離太過遙遠，無法使用。
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422810_1]", 0 ); -----距離太過遙遠，無法使用。
		return false
	end
	

	if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)	>0.5	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422810_2]", 0 ); ----[102755]仍在抵抗中，你無法順利使用[206166]。
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422810_2]", 0 ); ----[102755]仍在抵抗中，你無法順利使用[206166]。
		return false
	end

	if	ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 1 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204638_6]" , 0 ) --牠已經死了。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204638_6]" , 0 )
		return false
	end
	UseItemDestroy() 
	return true
end	
function LuaS_422810_1()
	--CastSpell( TargetID() , OwnerID() , 492681 )----尚未選擇捕捉的特效。492184
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422810_3]", 0 ); -------你抓到[206166]了！
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422810_3]", 0 ); 
	--sleep(10)
	--DelBodyItem(OwnerID(),206166,1)
	GiveBodyItem(OwnerID(),206186,1)
	CallPlot(TargetID(),"LuaFunc_ResetObj",TargetID())
end

function LuaS_422810_2()---蜘蛛跑出來，諾芙流血的特效。
	DisableQuest( OwnerID() , true )
	AddBuff( TargetID() ,505050 ,1 ,150 )
	SetPlot(  OwnerID()  ,   "touch" ,  "LuaFunc_Obj_BUSY"  , 40  )
	--Local FF = Lua_DW_CreateObj("flag" ,113684,780466,1,1 )
	Local TT = Lua_DW_CreateObj("flag" ,113686,780466,0,1 )
	Yell( OwnerID() , "[SC_422810_4]" , 3 )---這是......
	sleep(10)
	local KK = Lua_DW_CreateObj("flag" ,102755,780466,1,1 )---
	WriteRoleValue( KK , EM_RoleValue_LiveTime , 5 )
	SetRoleCamp( KK  , "Visitor" ) 	
	DisableQuest( KK , true )
	PlayMotion(  OwnerID() ,ruFUSION_ACTORSTATE_HURT_CRITICAL) 
	CastSpell(OwnerID()  , OwnerID()   , 492667)---諾芙 血流滿地ruFUSION_ACTORSTATE_HURT_CRITICAL
	BeginPlot( KK,"LuaS_422810_4" , 0)
	AddBuff( OwnerID()  , 503974 , 1 , 60 )
	Yell( OwnerID()  , "[SC_422810_5]" , 3 )---原來真的是妳......緹亞娜.，我來不及挽救的可憐靈魂......
	sleep(30)
	Yell( TT , "[SC_422810_6]" , 3 )---神！怎麼了？流了好多血......
	PlayMotion(  TT ,ruFUSION_ACTORSTATE_CAST_BEGIN) 
	sleep(25)
	Yell(OwnerID()  , "[SC_422810_7]" , 3 )---不要慌張......[113685].......我沒事.....
	local MM = Lua_DW_CreateObj("flag" ,113814,780466,5,1 )----亞米雷克的出現。
	sleep(10)
	BeginPlot( MM,"LuaS_422810_3" , 0)
	sleep(50)
	Yell(OwnerID()  , "[SC_422810_20]" , 3 )---發生了什麼事？導致你有如此疑問？
	PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(70)
	Yell( OwnerID()  , "[SC_422810_12]" , 3 )---也許是淨化不夠完善......[113690]別憂心，我將盡我所能的將他們治癒完全。
	PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(30)
	Yell( TT , "[SC_422810_14]" , 3 )---神，不要！妳剛才流了好多血，讓[113685]去！神留在這裡休息！
	PlayMotion(  TT ,ruFUSION_ACTORSTATE_CAST_SP02)
	sleep(30)
	Yell(OwnerID()  , "[SC_422810_15]" , 3 )---[113685]......生命不是遊戲。
	sleep(30)
	Yell( TT , "[SC_422810_16]" , 3 )---但神呢？神的生命就是遊戲了嗎？[113685]，不懂！不要懂！不要讓神陷入危險之中！
	PlayMotion(  TT ,ruFUSION_ACTORSTATE_CAST_BEGIN)
	sleep(30)
	Yell( TT , "[SC_422810_17]" , 3 )---[113685]會和[$PLAYERNAME]一起去！[113685]和[$PLAYERNAME]會幫忙[113690]淨化、探查。
	PlayMotion(  TT ,ruFUSION_ACTORSTATE_CAST_SP01)
	sleep(20)
	Yell( TT , "[SC_422810_18]" , 3 )----神答應要[113685]，待在這裡休息。
	PlayMotion(  TT ,ruFUSION_ACTORSTATE_CAST_SP01)
	sleep(30)
	Yell( OwnerID()   , "[SC_422810_19]" , 3 )----[113685].......
	if 	checkID(TargetID())==true then
		CancelBuff( TargetID() ,505050  )
	end
	delobj(TT)
	--delobj(FF)
	SetPlot(  OwnerID()  ,   "touch"   ,  ""  ,  0 )
	DisableQuest( OwnerID() , false )
end

function LuaS_422810_3()
	Yell( OwnerID() , "[SC_422810_8]" , 3 )--諾芙，我有話想問你！
	sleep(10)
	DW_MoveToFlag( OWNERID(),780466,3, 0,1)
	Yell( OwnerID() , "[SC_422810_9]" , 3 )--你之前所說的淨化的事情都是在欺騙我嗎？
	sleep(30)
	Yell(OwnerID() , "[SC_422810_10]" , 3)--之前你所要我淨化的那些怪物，如今更加鼓譟聚集在這穴口附近，襲擊著所有的路人。
	sleep(30)
	Yell(OwnerID() , "[SC_422810_11]" , 3)---他們的心靈並沒有因此而沉寂下來，這究竟是怎麼回事？
	sleep(30)
	Yell(OwnerID() , "[SC_422810_13]" , 3)---你最好快一點！
	DW_MoveToFlag( OWNERID(),780466,6, 0,1)
    	DW_MoveToFlag( OWNERID(),780466,7, 0,1)
    	delobj(OwnerID() )
end

function LuaS_422810_4()
	MoveToFlagEnabled( OwnerID() ,false )
	DW_MoveToFlag( OwnerID() ,780466,5, 0,0)
	DisableQuest( OwnerID()  , false )
	DELobj(OwnerID() )
end
-----------------------------------------------------------


function LuaS_422811_2()
	SetSpeakDetail(OwnerID(),"[SC_422811_3]")---哈～啾～哈啾～哈～～哈～啾，[113685]好久沒連打好幾個妖精噴嚏。[$PLAYERNAME]好了嗎？神說過冒險者的一下，就是一個妖精噴嚏，[113685]已經打了好幾個妖精噴嚏，已經過了好幾下
end
function LuaS_422811_3()
	SetSpeakDetail(OwnerID(),"[SC_422811_4]")---等等，[$PLAYERNAME]！[113685]想等神恢復一些再去，[113685]不想讓神遭遇危險，再幾個妖精噴嚏就好了！好不好？
end
function LuaS_422811_1()
    CloseSpeak( OwnerID())
	if (CheckAcceptQuest(OwnerID(),422811)==true )and (CheckFlag(OwnerID(),543426)==false )and(ReadRoleValue( TargetID() , EM_RoleValue_PID )  == 0)then
		BeginPlot( TargetID(), "LuaS_422811_4", 0)
	end
end
function LuaS_422811_4()---以BUFF控制，當玩家下線、旗子780468 。隱型物件--如果身上有BUFF 才出現怪物。
	CastSpell(OwnerID(),OwnerID(),   494470 )
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,1)----在113685身上寫入，不讓下一個人接。
	local KK = Lua_DW_CreateObj("flag" ,113643,780466,0,1 )--招喚出KK
	SetModeEX( KK , EM_SetModeType_Strikback	 , true )
	SetModeEX( KK , EM_SetModeType_Fight	 , true )
	DisableQuest( KK , true )
--	WriteRoleValue( KK , EM_RoleValue_Register ,TargetID() )----在KK身上寫入玩家。
	SetPlot( KK , "dead" , "LuaS_KK_Dead" , 0 )
	BeginPlot(KK , "LuaS_422811_5" , 0 )
	while true do--檢查
		sleep( 10 )
		if CheckID(KK) == false or ReadRoleValue( KK , EM_RoleValue_IsDead)== true  then  --死亡 
		   writeRoleValue( OwnerID() , EM_RoleValue_PID,0)  
			break
		end
	end
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
end

function LuaS_KK_Dead()
	if ReadRoleValue( OwnerID() , EM_RoleValue_OrgID ) == 102804 then
		local TempID
		for	i=0 , HateListCount( OwnerID() )-1 do 
			TempID = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )----
			if	CheckAcceptQuest( TempID , 422813)==true	then
				SetFlag( TempID, 543445, 1 )
			end
		end
	end
	return false
end


function LuaS_MM_Dead()
	SetAttack( OwnerID() , TargetID() )
	return false
end

function LuaS_422811_5()--KK設法術,法術集合 給BUFF  BUFF 分兩段 第一段是看不看得見OO 第二段是有沒有看到戲。有第1.2個BUFF 再給旗標。
	local KK = OwnerID() 
	sleep(20)
	Yell( KK , "[SC_422811_5]" , 3 )-----[$PLAYERNAME]，我們......我們走吧。
	sleep(20)
	DW_MoveToFlag( KK,780468,0, 0,1)
	Yell( KK , "[SC_422811_6]" , 3 )----[113685]要走在前面！
	sleep(20)
	DW_MoveToFlag( KK,780468,1, 0,1)
	Yell( KK , "[SC_422811_7]" , 3 )----[113685]好喜歡神，所以一定要保護神。知道嗎？神是世界上最好的！
	sleep(20)
	DW_MoveToFlag( KK,780468,2, 0,1)
	Yell( KK , "[SC_422811_8]" , 3 )---[113685]對自己說過，要勇敢堅強！
	sleep(20)
	DW_MoveToFlag( KK,780468,3, 0,1)
	Yell( KK , "[SC_422811_9]" , 3 )---神說過不要輸給薄弱的誘惑！永遠都要相信自己是最堅強的！
	sleep(20)
	DW_MoveToFlag( KK,780468,4, 0,1)------
	sleep(20) 
	local MON = {}---怪物陣列
	for i=1,4,1 do
		MON[i]= Lua_DW_CreateObj("flag",102799,780468,4+i)
		SetPlot( MON[i], "dead" , "LuaS_MM_Dead" , 0 )
		SetAttack( KK,MON[i])
		SetAttack( MON[i],KK)	
	end
---	CastSpell( OwnerID()  , OwnerID()  , 494470 )--持續施法。15秒。
	local TT=ReadRoleValue(KK,EM_RoleValue_MaxHP)
	local MM = ReadRoleValue(KK,EM_RoleValue_HP)
	for i =1 ,20 ,1 do
		TT=ReadRoleValue(KK,EM_RoleValue_MaxHP)
		 MM = ReadRoleValue(KK,EM_RoleValue_HP)

		if MM/TT <0.7   then
				BREAK
		end
		sleep(10)
	end
	local Player = SearchRangePlayer( KK , 350 )
	if MM/TT <0.7   then
		SetStopAttack(KK)
		SetModeEX( KK , EM_SetModeType_Strikback	 , false )
		SetModeEX( KK , EM_SetModeType_Fight	 , false)
		Yell( KK , "[SC_422811_10]" , 3 )---太強了......[113685]沒辦法成功淨化[113685]！
		PlayMotion(  KK,ruFUSION_ACTORSTATE_CAST_SP01)
		sleep(30)
		Yell( KK , "[SC_422811_11]" , 3 )---[$PLAYERNAME]，快走！
		for i=0 , table.getn(Player)-1 do
			if	CheckBuff(Player[i], 505006)==true	and CheckFlag(Player[i] ,543426) == false then
				ScriptMessage( OwnerID(), Player[i], 0, "[SC_422811_15]", 0 )
				ScriptMessage( OwnerID(), Player[i], 1, "[SC_422811_15]", 0 )
			end
		end
		sleep(30)
		delobj(KK)
		for i =1,table.getn(MON),1	do
			SetFightMode (MON[i],0, 0, 0,0 )
			SetStopAttack(MON[i])
			WriteRoleValue( Mon[i] , EM_RoleValue_LiveTime , 3 )
		end
	END
	if MM/TT >0.7   then
		for i=1,table.getn(MON),1	do
			BeginPlot(MON[i] , "LuaS_422811_0" , 0 )
		end
		sleep(20)
		SetStopAttack(KK)
		SetModeEX( KK , EM_SetModeType_Strikback	 , false )
		SetModeEX( KK , EM_SetModeType_Fight	 , false)
		PlayMotion(  KK ,ruFUSION_ACTORSTATE_CAST_SP01)
		Yell( KK , "[SC_422811_10]" , 3 )---太強了......[113685]沒辦法成功淨化[113685]！
		sleep(30)
		Yell( KK , "[SC_422811_11]" , 3 )---[$PLAYERNAME]，快走！
		DW_MoveToFlag( KK,780468,3, 0,1)
		for i=0 , table.getn(Player)-1 do
			if	CheckBuff(Player[i], 505006)==true	and CheckFlag(Player[i] ,543426) == false then
				ScriptMessage( OwnerID(), Player[i], 0, "[SC_422811_16]", 0 )
				ScriptMessage( OwnerID(), Player[i], 1, "[SC_422811_16]", 0 )
			end
		end
		sleep(30)
		DW_MoveToFlag( KK,780468,3, 0,1)
		delobj(KK)
	end
end

function LuaS_422811_0()--
	local TempID
	for	i=0 , HateListCount(OwnerID())-1 DO
		TempID = HateListInfo(OwnerID(), i , EM_HateListInfoType_GItemID )----
		if	CheckAcceptQuest( TempID , 422811)==true and CheckBuff(TempID, 505006)==true 	then
			SetFlag(TempID,543426,1)
		end
	end
	Sleep(60)
	SetFightMode (OwnerID(),0, 0, 0,0 )
	SetStopAttack(OwnerID())
	sleep(70)
	Delobj(OwnerID()) 

end



function LuaS_422811_6()--演戲旗標。---也可以不要，尚未決定。 scriptmaseg：打上名稱，在左下角。給旗標！
	ScriptMessage( OwnerID(), TargetID(), 0, "[SC_422811_12]",  "0xFFFFFFFF" );	--[113685]：嗚嗚嗚嗚~[113685]好沒用......出現好多好多的怪物。
	sleep(20)
	ScriptMessage( OwnerID(), TargetID(), 0, "[SC_422811_13]",  "0xFFFFFFFF"  );-----[113633]：別哭了，[113685]，只要盡了全力，就是對自己負責，你做得很好。
	sleep(30)
	ScriptMessage( OwnerID(), TargetID(), 0, "[SC_422811_14]",  "0xFFFFFFFF"  )---[113633]：不用擔心，我已經好多了，讓我來淨化那些生物吧！
	sleep(30)
END

-------------------------------------------------
function LuaS_422812_2()
	SetSpeakDetail(OwnerID(),"[SC_422812_1]")---咳咳~[113685]有些不對勁，請稍等我一會兒。(諾芙看起來似乎很虛弱。)
	end
function LuaS_422812_1()
   	 CloseSpeak( OwnerID())
   	 if (CheckAcceptQuest(OwnerID(),422812)==true )and (CheckFlag(OwnerID(),543447)==false )and (ReadRoleValue( TargetID() , EM_RoleValue_Register)  == 0) then
		BeginPlot( TargetID(), "LuaS_422812_3", 0)
	end
end
function LuaS_422812_3()---以BUFF控制，當玩家下線、旗子780468 。隱型物件--如果身上有BUFF 才出現怪物。
	WriteRoleValue(OwnerID(),EM_RoleValue_Register,1)----在113685身上寫入，不讓下一個人接。
	local KK = Lua_DW_CreateObj("flag" ,113719,780466,1,1 )--招喚出KK。
	BeginPlot(KK , "LuaS_422812_4" , 0 )
	while true do--檢查
		sleep( 10 )
		if CheckID(KK) == false or ReadRoleValue( KK , EM_RoleValue_IsDead)== true  then  --死亡 
		   	writeRoleValue( OwnerID() ,EM_RoleValue_Register,0 ) 
			break
		end
	end
	WriteRoleValue(OwnerID(),EM_RoleValue_Register,0)
end

function LuaS_422812_4()--KK設法術,法術集合 給BUFF  BUFF 分兩段 第一段是看不看得見OO 第二段是有沒有看到戲。有第1.2個BUFF 再給旗標。780472--旗子
	CastSpell( OwnerID()  , OwnerID()  , 494488 )---
	sleep(30)
	Yell( OwnerID() , "[SC_422812_2]" , 3 )-----[$PLAYERNAME]，跟隨著我。
	sleep(20)
	DW_MoveToFlag(OwnerID() ,780468,0, 0,1)
	DW_MoveToFlag( OwnerID(),780468,1, 0,1)
	DW_MoveToFlag( OwnerID(),780468,2, 0,1)
	DW_MoveToFlag( OwnerID(),780468,3, 0,1)
	Yell( OwnerID() , "[SC_422812_3]" , 3 )---[$PLAYERNAME]，不用太過緊張，淨化過後，一切將會恢復平靜。
	sleep(20)
	DW_MoveToFlag( OwnerID(),780468,4, 0,1)
	Yell( OwnerID() , "[SC_422812_4]" , 3 )------等會兒，我將先進行和緩心靈治癒。
	sleep(10)
	DW_MoveToFlag( OwnerID(),780472,0, 0,1)------我需要你先行減弱它的力量，我才能繼續深層的淨化工作。當牠們力量越薄弱，淨化的力量將更為強大。
	Yell( OwnerID() , "[SC_422812_5]" , 3 )
	sleep(20) 
	DW_MoveToFlag( OwnerID(),780472,1, 0,1)---當牠們力量越薄弱，淨化的力量將更為強大。
	local MON = {}---怪物陣列
	for i=1,4,1 do
		MON[i]= Lua_DW_CreateObj("flag",102799,780472,2+i)---接下來出現。
		SetPlot( MON[i] , "dead" , "LuaS_KK_Dead" , 0 )
		if i == 1 or i == 2 then
			SetAttack(MON[i],TargetID())
		else
			SetAttack(MON[i],OwnerID())
		end
		CastSpell( MON[i] , OwnerID()  , 494494 )--持續施法。向怪物們，貼上BUFF，並持續動作。(15秒)
	end
	SLEEP(140)
	for i =1,table.getn(MON),1	do
	BeginPlot(MON[i] , "LuaS_422812_5" , 0 )
	end
	Yell( OwnerID() , "[SC_422812_6]" , 3 )--你做得很好，可以開始深層淨化了。
	sleep(30)
	for i =1,table.getn(MON),1	do
		CastSpell( MON[i] , OwnerID()  , 494495 )---做假象。
	end
	sleep(20)
	for i =1,table.getn(MON),1	do
		SetPlot( MON[i] , "dead" , "" , 0 )
		NPCDead( MON[i] , OwnerID())
	end
	local Player = SearchRangePlayer ( OwnerID() , 350 )
	for i=0,table.getn(Player)-1 do
		if	CheckAcceptQuest( Player[i],   422812)==true and CheckBuff(Player[i], 505045)==true  	then
			SetFlag(Player[i], 543447,1)
		end
	end
	sleep(10)
	Yell( OwnerID() , "[SC_422812_7]" , 3 )---淨化加速這些生物滅亡......ruFUSION_ACTORSTATE_EMOTE_IDLE2
	PlayMotion(  OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_IDLE1)
	sleep(30)
	Yell(OwnerID() , "[SC_422812_8]" ,3 )---而我竟然沒察覺它們身上所被施予的反淨化之術。
	sleep(30)
	Yell(OwnerID() , "[SC_422812_9]" ,3 )--讓這些無辜的生物枉送性命。
	sleep(30)
	Yell(OwnerID() , "[SC_422812_10]" ,3 )--這是屬於我的罪惡。ruFUSION_ACTORSTATE_EMOTE_SALUTE
	PlayMotion(  OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SALUTE)
	--local Player = SearchRangePlayer (OwnerID()    , 350 )
	sleep(20)
	Yell(OwnerID() , "[SC_422812_11]" ,3 )--無法躲避......我需要一些準備......
	sleep(20)
	Yell(OwnerID() , "[SC_422812_12]" ,3 )--[$PLAYERNAME]，走吧。
	DW_MoveToFlag( OwnerID(),780468,2, 0,1)
	for i =1,table.getn(MON),1	do
		delobj(MON[i] )
	end
 	delobj(OwnerID())
 end

function LuaS_422812_5()
	local TempID
	for	i=0 , HateListCount(OwnerID())-1 DO
		TempID = HateListInfo(OwnerID(),i , EM_HateListInfoType_GItemID )----

		if	CheckAcceptQuest( TempID , 422812)==true and CheckBuff(TempID, 505045)==true 	then
			AddBuff( TempID ,505030 ,1 ,900 )--給予好的BUFF
		end
	end
end


--------------------------------------
function LuaS_206168_Check()---	
--	if  Lua_ExGetZone( OwnerID())  ~= 7  then
--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206168_0]" , 1 ) ------你不能在[ZONE_WEEPING COAST]之外的地方使用此物品
--		return false
--	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode ) ~= 0  then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205953_1]" , 1 ) ------你不能在戰鬥中使用此物品
		return false
	end
	if	CheckAcceptQuest( OwnerID(),   422813)==false or  CheckCompleteQuest( OwnerID(), 422813 )==true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_0]" , 0 )
		return false
	end
	return true
end
function LuaI_206168_Use()---凝能石
	CastSpell( OwnerID() , OwnerID() , 494409) 
	if CheckFlag( OwnerID(),543445)==false  then
	   SetPosByFlag( OwnerID(), 780473 , 3 )---到現場。
	end
	if CheckFlag( OwnerID(),543445)==true  then
	   SetPosByFlag( OwnerID(), 780473 , 4 )----回諾芙那邊。
	end
end


function LuaS_422813_0()---隱形物件。
	SetPlot( OwnerID(), "range","LuaS_422813_1", 150 )
end

function LuaS_422813_1()
	if	(CheckAcceptQuest( OwnerID() , 422813 ) == false )  or ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 1 then
			return false
	end
	if(CheckAcceptQuest( OwnerID() , 422813 ) == true ) and CheckFlag( OwnerID(),543445)==false and ReadRoleValue(TargetID() , EM_RoleValue_Register) == 0 then
		WriteRoleValue(  targetID(), EM_RoleValue_Register ,OwnerID() )---在隱型物件身上寫入玩家的ID。
		SetPlot( targetID(), "range","", 0 )	
		BeginPlot( targetID() , "LuaS_422813_2" , 0 )
	end
end

function LuaS_422813_2()
	local KK = Lua_DW_CreateObj("flag" ,102804,780473,0,1 )---緹亞娜。
	local CC = Lua_DW_CreateObj("flag" ,102805,780473,1,1 )
	local MM=ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	BeginPlot(OwnerID() , "LuaS_422813_2_1" , 0 )	
	BeginPlot( KK, "LuaS_422813_TELL", 0 )
	YELL(KK,"[SC_422813_20]",3)---看來我們有意外的訪客。
	PlayMotion(  KK,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(25)
	YELL(CC,"[SC_422813_21]",3)---是你？那時與諾芙一同殘害生物的傢伙?
	sleep(30)
	if 	checkID(MM)==true	then
		YELL(MM,"[SC_422813_1]",3)---別再誆騙無辜的人！[102804]！
	end
	sleep(25)
	YELL(KK,"[SC_422813_2]",3)---你在胡說什麼？我的名字是艾薇莎。
	PlayMotion(  KK,ruFUSION_ACTORSTATE_ATTACK_1H)
	sleep(30)
	if 	checkID(MM)==true	then
		YELL(MM,"[SC_422813_3]",3)---[102805]，清醒一點吧！這一切的事件都是你身旁的她所引起的！
		sleep(30)
		YELL(MM,"[SC_422813_4]",3)--她一直在利用你來傷害諾芙、傷害一切生物。
		sleep(30)
	end
	YELL(CC,"[SC_422813_5]",3)---我並不相信你，[$PLAYERNAME]！我都親眼看見了！那個女人親手殺死了那些生物。
	sleep(35)
	BeginPlot( KK, "LuaS_422813_TELL_1", 0 )
	sleep(20)
	YELL(MM,"[SC_422813_7]",3)---清醒過來吧！冒險者！那些生物全都是那女人故意安排的。把牠們變成只要使用淨化力量就會死亡，讓諾芙因此傷心自責～
	sleep(30)
	YELL(CC,"[SC_422813_8]",3)---我憑什麼要相信你？
	PlayMotion(  KK,ruFUSION_ACTORSTATE_ATTACK_1H)
	sleep(30)
	PlayMotion(  KK,ruFUSION_ACTORSTATE_EMOTE_CRY)
	YELL(KK,"[SC_422813_9]",3)----那個女人一直都在破壞我的所有，殘害無數的生命......
	sleep(30)
	PlayMotion(  KK,ruFUSION_ACTORSTATE_EMOTE_CRY)
	YELL(KK,"[SC_422813_10]",3)---甚至蠱惑了這名可憐的冒險者，[102805]，也許你該讓他清醒一點？他才會知道自己做下了多麼不可饒恕的事？
	sleep(30)
	BeginPlot( KK, "LuaS_422813_TELL_2", 0 )
	SLEEP(30)
	SetRoleCamp(KK,"Monster")
	SetRoleCamp(CC,"Monster")
	SetFightMode ( KK,1, 1, 1,1 )
	SetFightMode ( CC,1, 1, 1,1 )
	SetPlot( KK ,"dead" , "LuaS_KK_Dead" , 0 )
	SetPlot( CC, "dead" , "LuaS_KK_Dead" , 0 )
	local  TT=ReadRoleValue(KK,EM_RoleValue_MaxHP)
	local  EE= ReadRoleValue(KK,EM_RoleValue_HP)
	for i=0,180,1 do--檢查
 		TT=ReadRoleValue(KK,EM_RoleValue_MaxHP)
		 EE= ReadRoleValue(KK,EM_RoleValue_HP)

		if 	EE/TT<0.6	then
			break
		end
		sleep(10)
		if i > 10 and HateListCount( kk ) == 0 and HateListCount( CC ) == 0 then
			break
		end
	end
	if 	EE/TT<0.6	then
		local TempID
			for	i=0 , HateListCount( KK )-1 do 
				TempID = HateListInfo(KK ,i , EM_HateListInfoType_GItemID )----
					if	CheckAcceptQuest( TempID , 422813)==true	then
						SetFlag( TempID, 543445, 1 )
					end
				end
		sleep(20)	
		SetStopAttack(KK)
		SetStopAttack(CC)
		SetRoleCamp(KK,"Visitor")
		SetRoleCamp(CC,"Visitor")
		SetFightMode ( KK,0, 1, 0,0 )
		SetFightMode ( CC,0, 1, 0,0 )
		YELL(KK,"[SC_422813_13]",3)---清醒過來吧～不要被表象迷惑。PlayMotion(  KK,ruFUSION_ACTORSTATE_CAST_SP01)ruFUSION_ACTORSTATE_CAST_SP01
		PlayMotion(  KK,ruFUSION_ACTORSTATE_CAST_SP01)
		sleep(30)
		YELL(CC,"[SC_422813_14]",3)---你被矇騙了......再打下去，一點意義都沒有。艾薇莎，我們快走！
		sleep(30)
		BeginPlot( KK, "LuaS_422813_TELL_3", 0 )
		YELL(KK,"[SC_422813_15]",3)---好吧......
		sleep(20)
		BeginPlot( KK, "LuaS_422813_2_2", 0 )
		DW_MoveToFlag( CC,780473,2, 0,1)
		DELOBJ(CC)
		sleep(300)
		SetPlot( OwnerID(), "range","LuaS_422813_1", 150 )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
	else
		local Player = SearchRangePlayer ( OwnerID() , 400 )
		for i=0,table.getn(Player)-1 do
				if(CheckAcceptQuest( player[i] , 422813 ) == true ) and CheckFlag( player[i],543445)==false then
					ScriptMessage( OwnerID(), player[i] , 0, "[SC_422813_22]", 0 )
					ScriptMessage( OwnerID(), player[i] , 1, "[SC_422813_22]", 0 )
				end
		end
		sleep(20)	
		SetStopAttack(KK)
		SetStopAttack(CC)
		SetRoleCamp(KK,"Visitor")
		SetRoleCamp(CC,"Visitor")
		SetFightMode ( KK,0, 1, 0,0 )
		SetFightMode ( CC,0, 1, 0,0 )
		YELL(KK,"[SC_422813_13]",3)---清醒過來吧～不要被表象迷惑。
		sleep(30)
		YELL(CC,"[SC_422813_14]",3)---你被矇騙了......再打下去，一點意義都沒有。艾薇莎，我們快走！
		BeginPlot( KK, "LuaS_422813_TELL_3", 0 )
		sleep(30)
		YELL(KK,"[SC_422813_15]",3)---好吧......
		sleep(20)
		BeginPlot( KK, "LuaS_422813_2_2", 0 )
		DW_MoveToFlag( CC,780473,2, 0,1)
		DELOBJ(CC)
--		Lua_DW_CreateObj("obj",113690,OwnerID())
		sleep(200)
		SetPlot( OwnerID(), "range","LuaS_422813_1", 150 )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
	end
end


function LuaS_422813_TELL()
	local Player = SearchRangePlayer ( OwnerID() , 200 )
	for i=0,table.getn(Player)-1 do
		if	CheckAcceptQuest( Player[i],   422813)==true and CheckFlag( player[i],543445)==false then
			Tell(player[i],OwnerID(),"[SC_422813_0]")------你看起來就像是[113633]那個女人派來的，一副可笑的正義之士模樣。
		end
	end
end


function LuaS_422813_TELL_1()
	local Player = SearchRangePlayer ( OwnerID() , 200 )
	for i=0,table.getn(Player)-1 do
		if(CheckAcceptQuest( player[i] , 422813 ) == true ) and CheckFlag( player[i],543445)==false then
			Tell(player[i],OwnerID() , "[SC_422813_6]")---呵～諾芙親手害死生物的表情如何？可惜我不能親眼看見，受傷還不夠，她還要再更痛苦一點～
		end
	end
end
function LuaS_422813_TELL_2()
	local Player = SearchRangePlayer ( OwnerID() , 200 )
	for i=0,table.getn(Player)-1 do
		if(CheckAcceptQuest( player[i] , 422813 ) == true ) and CheckFlag( player[i],543445)==false then
			Tell(player[i],OwnerID() , "[SC_422813_11]")---哼~口口聲聲使命、救贖，她真正做了什麼？
			sleep(30)
			Tell(player[i],OwnerID() , "[SC_422813_12]")----那個自以為是的女人總是高傲的俯視著一切，把其它人踐踏在深淵裡。
		end
	end
end

function LuaS_422813_TELL_3()
	local Player = SearchRangePlayer( OwnerID() , 200 )
	for i=0,table.getn(Player)-1 do
		if(CheckAcceptQuest( player[i] , 422813 ) == true ) and CheckFlag( player[i],543445)==false then
			Tell(player[i], OwnerID(), "[SC_422813_16]")----盡情享受目前的安逸吧～回去告訴那個偽善女人，等待安德薩斯甦醒後，第一個要殺的就是她！再繼續幫她，你也逃不掉的，[$PLAYERNAME]！
		end
	end
end

function LuaS_422813_2_1()--掛上檢查迴圈。 如果npc不見 就刪掉
	while true do--檢查
	sleep( 10 )
	local KK = LuaFunc_SearchNPCbyOrgID( OwnerID() ,102804 ,500 )
	local CC = LuaFunc_SearchNPCbyOrgID( OwnerID() ,102805 ,500 )
	local MM=ReadRoleValue( OwnerID() , EM_RoleValue_Register )	
		if CheckID(MM) == false  then
			YELL(CC,"[SC_422813_14]",3)---
			YELL(KK,"[SC_422813_15]",3)---
			DELOBJ(KK)
			DELOBJ(CC)
			Lua_DW_CreateObj("obj",113690,OwnerID())
			delobj(OwnerID())
		break
		end
	end
end
function LuaS_422813_2_2()--
	DW_MoveToFlag( OwnerID() ,780473,2, 0,1)
	Delobj( OwnerID() )
END
-------------------------------------------------------------------------
function LuaS_422815_0()
	LoadQuestOption(OwnerID())
	if	(CheckAcceptQuest(OwnerID(),422815)==true )and  (CheckFlag(OwnerID(),543450)==false ) and  (ReadRoleValue( TargetID() , EM_RoleValue_PID )  == 0)       then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422815_0]","LuaS_422815_1",0)---我可以的！請將我傳送過去吧！
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422815_1]","LuaS_422815_2",0)---讓我再想想？
	end
	if (CheckAcceptQuest(OwnerID(),422815)==true )and  (CheckFlag(OwnerID(),543450)==false ) and  (ReadRoleValue( TargetID() , EM_RoleValue_PID )  == 1)       then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422815_0]","LuaS_422815_4",0)---我可以的！請將我傳送過去吧！
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422815_1]","LuaS_422815_2",0)---讓我再想想？
	end
end
function LuaS_422815_1()
	CloseSpeak( OwnerID())
	if (CheckAcceptQuest(OwnerID(),422815)==true )and  (CheckFlag(OwnerID(),543450)==false ) and  (ReadRoleValue( TargetID() , EM_RoleValue_PID )  == 0)       then
		SetFlag(OwnerID() ,543450,0)
		SetPosByFlag( OwnerID(), 780477 , 2 )
		BeginPlot( targetID() , "LuaS_422815_3" , 0 )
	end
end

function LuaS_422815_2()
	SetSpeakDetail(OwnerID(),"[SC_422815_4]")---好，你再仔細考慮。而我也會盡快讓我的體力恢復，與你一同前去。
end

function LuaS_422815_4()
	SetSpeakDetail(OwnerID(),"[SC_422815_2]")---[113736]所殘留下的水元素之力太過稀疏，我仍無法找到正確的方向。
end

function LuaS_422815_3()
	WriteRoleValue( OwnerID() , EM_RoleValue_PID ,1)
	local KK = Lua_DW_CreateObj("flag" ,113691,780477,0,1 )---緹亞娜。
	local CC = Lua_DW_CreateObj("flag" ,102805,780477,1,1 )---冒險者。
	MoveToFlagEnabled( KK , false )
	PlayMotionEX(  CC ,ruFUSION_ACTORSTATE_DAZED_BEGIN , ruFUSION_ACTORSTATE_DAZED_LOOP)
	AddBuff( targetID() ,505049 ,1 ,12 )------定身術。隱藏氣息、不可打怪。
	sleep(35)
	AdjustFaceDir( KK, CC, 0 )
	yell(KK,"[SC_422815_5]",3)---[102804]，你可知道最後一個素材是什麼？
	PlayMotion(  KK,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(30)
	yell(KK,"[SC_422815_6]",3)----一個絕佳的靈魂碎片。這是最關鍵也是最難的部分，我一直在思考要從哪裡獲得...
	PlayMotion(  KK,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(30)
	yell(KK,"[SC_422815_7]",3)-----但現在...一個美麗的魂魄不就近在咫尺嗎？	ruFUSION_ACTORSTATE_EMOTE_POINT	
	PlayMotion(  KK,ruFUSION_ACTORSTATE_EMOTE_POINT	)
	sleep(20)
	delobj(KK)
	local TT = Lua_DW_CreateObj("flag" ,102804,780477,0,1 )
	SetPlot( TT , "dead" , "LuaS_KK_Dead" , 0 )
	if CheckID(TargetID()) == true then
		CancelBuff_NOEvent(TargetID() , 505049 )
	end

	SetRoleCamp(TT,"Monster")
	SetFightMode ( TT,0, 1, 1,1 )---
	CastSpell( TT , CC , 494491 )--吸取碎片的動作。
	for	 i=0,15,1	do
		IF  ReadRoleValue( TT , EM_RoleValue_AttackTargetID ) ~= 0 or ReadRoleValue( TT , EM_RoleValue_HP ) <= 100 Then
			AddBuff( TT , 502383 , 0 , 1 )
			break
		end
		sleep(10)
	end
	if  ReadRoleValue( TT , EM_RoleValue_AttackTargetID ) == 0 and ReadRoleValue( TT , EM_RoleValue_HP ) > 100 then
		SetStopAttack(TT)
		SetRoleCamp(TT,"Visitor")
		SetFightMode ( TT,0, 1, 0,0 )
		scriptmessage(TT, 0, 0, "[SC_422815_8]",  "0xFFF00000" )--[113691]順利取得[102804]的靈魂碎片。
		scriptmessage(TT, 0, 1, "[SC_422815_8]",  "0xFFF00000" )--[113691]順利取得[102804]的靈魂碎片。
		sleep(20)
		NPCDead( CC, TT )
		yell(TT,"[SC_422815_9]",3)---我的[102775]，我將再度讓你復甦。
		PlayMotion(  TT,	ruFUSION_ACTORSTATE_EMOTE_LAUGH	)	
		sleep(20)
		scriptmessage(TT, 0, 0, "[SC_422815_10]", 0)--你的任務沒有成功。
		scriptmessage(TT, 0, 1, "[SC_422815_10]", 0)--你的任務沒有成功。
		DW_MoveToFlag( TT,780477,2, 0,1)
		delobj(TT)
		delobj(CC)
		WriteRoleValue( OwnerID() , EM_RoleValue_PID ,0)
		return false
		
	else
		SetStopAttack(TT)
		SetFightMode ( TT,0, 1, 0,0 )
		SetRoleCamp(TT,"Visitor")
		yell(TT,"[SC_422815_11]",3)---我見過你！諾芙的走狗，你也來破壞我嗎？ruFUSION_ACTORSTATE_ATTACK_1H_PIERCE
		PlayMotion(  TT,ruFUSION_ACTORSTATE_ATTACK_1H_PIERCE	)
		sleep(20)
		local MM = Lua_DW_CreateObj("flag" ,113812,780477,3,1 )----
		yell(MM,"[SC_422815_12]",3)------住手，[113691]！
		MoveToFlagEnabled( MM , false )
		--CastSpell( TT , MM , XXXX)---假象？
		AdjustFaceDir( MM, TT, 0 ) 
		sleep(10)
		AdjustFaceDir( TT, MM, 0 ) 
		sleep(10)
		yell(TT,"[SC_422815_13]",3)---妳又來妨礙我了？
		PlayMotion(  TT,ruFUSION_ACTORSTATE_EMOTE_POINT	)
		sleep(30)
		yell(TT,"[SC_422815_14]",3)---哼！之前那些不過是送妳的小禮物，妳還滿意嗎？
		PlayMotion(  TT,	ruFUSION_ACTORSTATE_EMOTE_LAUGH	)
		sleep(30)
		yell(TT,"[SC_422815_20]",3)--接下來就沒有這麼簡單了，妳看著好了！我絕對會讓妳嚐到比我當時更痛苦的心情。
		PlayMotion(  TT,ruFUSION_ACTORSTATE_ATTACK_1H_PIERCE	)
		--CastSpell( TT , TT , XXXX)--光芒。
		DW_MoveToFlag( TT,780477,4, 0,1)
		if CheckID( TargetID() ) == true and CheckAcceptQuest( TargetID(),422815) == true and ReadRoleValue( TargetID() , EM_RoleValue_IsDead) == 0 then
			Setflag(TargetID(),543450,1)
		end
		delobj(TT)
		PlayMotion(  CC ,ruFUSION_ACTORSTATE_DAZED_END )
		sleep(20)
		yell(CC,"[SC_422815_15]",3)---我到底都做了些什麼？ruFUSION_ACTORSTATE_SHIELD_BASH
		PlayMotion(  CC ,ruFUSION_ACTORSTATE_SHIELD_BASH)
		Sleep(20)
		yell(CC,"[SC_422815_16]",3)--我......我......
		PlayMotion(  CC ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)    	
		AdjustFaceDir( MM, CC , 0 ) 
		PlayMotion(  MM ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)  
		sleep(20)
		yell(MM,"[SC_422815_17]",3)--[102804]承受不了刺激而暈厥，必須盡快治療。
		sleep(20)
		if CheckID( TargetID() ) == true then
			AdjustFaceDir( MM, TargetID(), 0 ) 
		end
		PlayMotion(  MM ,ruFUSION_ACTORSTATE_CROUCH_END)  
		yell(MM,"[SC_422815_18]",3)--讓我先將他帶回英雄之墓。
		sleep(20)
		CastSpell(MM,MM,491276)
		yell(MM,"[SC_422815_19]",3)---而你隨後跟上好嗎？
		SLEEP(35)
		delobj(MM)
		delobj(CC)
		WriteRoleValue( OwnerID() , EM_RoleValue_PID ,0)
	end
end
-------------------------
function LuaS_422827_AF()
	if CountBodyItem( TargetID() , 206187 ) > 0 then
		GiveBodyItem( targetID(), 543452, 1 )
		DelBodyItem( targetID(),  206187 , 1 ) 
	end
END



----------------------
function LuaS_KK_LOVE()	--特效
	while true do
		sleep(20)
		CastSpell( OwnerID(), OwnerID(), 494493)
	end
end
---------
function LuaS_102796_KK()
	If	CheckAcceptQuest( targetID(), 422814 )==true	and	CountBodyItem (  targetID(),206169)>=1  and CheckBuff(targetID()  , 505051)==false  then
	return true
	end
	return false
end
-------------
function LuaS_422811_KK()---
	If	CheckAcceptQuest( targetID(), 422811 )==true	and  CheckFlag( targetID(),543426 )== false  then
	return true
	end
	return false
end
----------------------
function LuaS_422812_KK()---
	If	CheckAcceptQuest( targetID(), 422812 )==true	and  CheckFlag( targetID(),543447 )== false  then
	return true
	end
	return false
end
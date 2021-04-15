
--============================================================================================================
--採藥營地
--============================================================================================================

function LuaS_421032_114432()
--掛在npc114432珍之下，OWNER 是NPC
	SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_SIT_LOOP  )
	
	while 1 do
		Say(OwnerID(),"[SC_421032_0]")	--朱得......你就這樣丟下我了？
		Sleep(100)
		Say(OwnerID(),"[SC_421032_1]")	--朱得......你怎麼敢在婚禮之前丟下我？
		Sleep(100)
		Say(OwnerID(),"[SC_421032_2]")	--告訴你，我會好好的活著，比有你在我身邊活的更好
		Sleep(100)

	Sleep(3000)
	end
end

--------------------------------

function LuaS_421032_114431()
--掛在npc採藥人下
	SetDefIdleMotion( OwnerID() ,ruFUSION_MIME_MINING_LOOP )			

end



--------------------------------


function LuaS_421032_114418() --掛在任務NPC採藥的喬治114418的對話劇情
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),421031)==true		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421031_13]","LuaS_421032_114418_1",0)		--「這是香料訂單，請將貨品交給我。」
	end
end

function LuaS_421032_114418_1()
	SetSpeakDetail(OwnerID(),"[SC_421031_14]")	--
end


--============================================================================================================
--421031 沼地裡的野豬任務
--============================================================================================================
--Rand( Value )在一定範圍內取亂數
--204042沼地裡的豬


function LuaS_421031_0()	--掛在物件沼地裡的豬的使用物品script之下，owner是玩家

--	Say(OwnerID(),"0..0")
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_EAT)
	Sleep(30)
	Beginplot(TargetID(),"LuaS_421031_1",0)
	UseItemDestroy()
end

function LuaS_421031_1()	--owner是??

	local R=RandRange(1,82)

 	for i=1,84,1 do
		if R <10	then		--太好吃了！你差點連自己的舌頭都吞下去了。
			ScriptMessage( TargetID(), TargetID(), 1, "[SC_421031_1]", 0 )
			ScriptMessage( TargetID(), TargetID(), 0, "[SC_421031_1]", 0 )
			AddBuff(OwnerID(),506118,1,60)
			break	
		end
		
		if R==10 Or ( R>10 and R <20)	then	--你吃一口，又接著一口，每一口都讓你想要吃更多。
			AddBuff(OwnerID(),506118,1,60)
			ScriptMessage( TargetID(), TargetID(), 1, "[SC_421031_2]", 0 )
			ScriptMessage( TargetID(), TargetID(), 0, "[SC_421031_2]", 0 )			
			break
		end
		
		if R==20 Or (R>20 and R <30)	then	--你細細品嚐，濃郁的肉香在你口腔散發開來，這是讓人上癮的好滋味。
			AddBuff(OwnerID(),506118,1,60)
			ScriptMessage( TargetID(), TargetID(), 1, "[SC_421031_3]", 0 )
			ScriptMessage( TargetID(), TargetID(), 0, "[SC_421031_3]", 0 )
			break
		end
		
		if R==30 Or (R>30 and R <40)	then	--好吃極了！你快速的將噴香的烤豬肉填進你的胃袋。
			AddBuff(OwnerID(),506118,1,60)
			ScriptMessage( TargetID(), TargetID(), 1, "[SC_421031_4]", 0 )
			ScriptMessage( TargetID(), TargetID(), 0, "[SC_421031_4]", 0 )			
			break
		end
		
		if R==40 Or (R>40 and R <50)	then	--一口氣將美餐吃完，你意猶未盡的看著空盤打了一個響亮的飽嗝。
			AddBuff(OwnerID(),506118,1,60)
			ScriptMessage( TargetID(), TargetID(), 1, "[SC_421031_5]", 0 )
			ScriptMessage( TargetID(), TargetID(), 0, "[SC_421031_5]", 0 )			
			break
		end
		
		if R==50 Or (R>50 and R <60)	then	--這是什麼？你不敢相信烤豬肉會這麼美味。
			AddBuff(OwnerID(),506118,1,60)
			ScriptMessage( TargetID(), TargetID(), 1, "[SC_421031_6]", 0 )
			ScriptMessage( TargetID(), TargetID(), 0, "[SC_421031_6]", 0 )			
			break
		end
		
		if R==60 Or (R>60 and R <70)	then	--哇！皮脆肉嫩，肉汁橫流，簡直美味到沒有天理！
			AddBuff(OwnerID(),506118,1,60)
			ScriptMessage( TargetID(), TargetID(), 1, "[SC_421031_7]", 0 )
			ScriptMessage( TargetID(), TargetID(), 0, "[SC_421031_7]", 0 )
			break
		end
		
		if R==70 Or (R>70 and R <80)	then	--該死！你被剛出爐的好菜燙傷了，卻還是忍不住大快朵頤。
			AddBuff(OwnerID(),506117,1,100)
			ScriptMessage( TargetID(), TargetID(), 1, "[SC_421031_8]", 0 )
			ScriptMessage( TargetID(), TargetID(), 0, "[SC_421031_8]", 0 )
			
			break
		end
		
		if R==80 Or (R>80 and R <85)	then	--你聞著香氣，咬下一口，立刻被它驚人的美味擄獲，彷彿陷入夢境一般~~~
			AddBuff(OwnerID(),506116,1,300)
		ScriptMessage( TargetID(), TargetID(), 1, "[SC_421031_9]", 0 )
		ScriptMessage( TargetID(), TargetID(), 0, "[SC_421031_9]", 0 )

			AddBuff( OwnerID()  , 503977 , 1 , 300 ) 	--使玩家不動

			Sleep(10)
			
			local Cook = Lua_CreateObjByDir( OwnerID()  , 114428, 20 , 0 )
			Hide(Cook)
			Beginplot(Cook,"LuaS_421031_2",0)
			Sleep(140)

			CancelBuff( OwnerID()  , 503977  )
		ScriptMessage( TargetID(), TargetID(), 1, "[SC_421031_11]", 0 )	--突然，你的眼前一閃，並從幻象中回過神來。
		ScriptMessage( TargetID(), TargetID(), 0, "[SC_421031_11]", 0 )
	
		Delobj(Cook)
		break
		end
	end
end



function LuaS_421031_2()
	Local X = ReadRoleValue(TargetID(),EM_RoleValue_X)
	Local Y = ReadRoleValue(TargetID(),EM_RoleValue_Y)
	Local Z = ReadRoleValue(TargetID(),EM_RoleValue_Z)
	
	local DANCER1 = CreateObj(114427,  X-5, Y, Z+30, 0 ,1)
	local DANCER2 = CreateObj(114427,  X+30, Y, Z+5, 0 ,1)
	local DANCER3 = CreateObj(114427,  X+5, Y, Z-30, 0 ,1)
	local DANCER4 = CreateObj(114427,  X-30, Y, Z-5, 0 ,1)
	
	AdjustFaceDir( DANCER1 , TargetID() ,0 )
	AdjustFaceDir( DANCER2 , TargetID() ,0 )
	AdjustFaceDir( DANCER3 , TargetID() ,0 )
	AdjustFaceDir( DANCER4 , TargetID() ,0 )
	
	AddToPartition(DANCER1,0)
	AddToPartition(DANCER2,0)
	AddToPartition(DANCER3,0)
	AddToPartition(DANCER4,0)
	Sleep(10)
	Beginplot( DANCER1,"LuaS_421031_3",0)
	Beginplot( DANCER2,"LuaS_421031_4",0)
	Beginplot( DANCER3,"LuaS_421031_3",0)
	Beginplot( DANCER4,"LuaS_421031_4",0)
	Sleep(20)
	
	PlayMotion(OwnerID() ,ruFUSION_ACTORSTATE_ATTACK_1H)
	Sleep(20)
	Show(OwnerID(),0)
	Yell(OwnerID(),"[SC_421031_10]",3)
	--這麼好吃的烤豬肉~~~~
	PlayMotion(OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_KISS)
	Sleep(20)
	PlayMotion(OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SURRENDER)
	Sleep(20)
	Yell(OwnerID(),"[SC_421031_12]",3)	
	--以後再也吃不到要怎麼辦？
	
	Sleep(10)
	PlayMotion(OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_ANGRY)	
	CastSpell(OwnerID(),OwnerID(),491276)
	Sleep(30)
	Hide(OwnerID() )
	Sleep(10)
	Delobj(DANCER2)
	Delobj(DANCER3)
	Delobj(DANCER4)
	Delobj(DANCER1)

end
	


function LuaS_421031_3()
	AdjustFaceDir( OwnerID() , TargetID() ,0 )
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_PLAY_TAMBOURINE)
	Sleep(40)
	PlayMotionEX( OwnerID() ,ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	Sleep(10)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_END)
	Sleep(10)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_UNHOLSTER)
	Sleep(20)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_STRETCH)
	Sleep(10)	
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_KISS)
	Sleep(20)
	Hide(OwnerID())

end

function LuaS_421031_4()	

	AdjustFaceDir( OwnerID() , TargetID() ,0 )
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_STRETCH)
	Sleep(20)
	PlayMotionEX( OwnerID() ,ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	Sleep(10)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_END)
	Sleep(10)	
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_PLAY_TAMBOURINE)
	Sleep(40)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_KISS)
	Sleep(20)
	Hide(OwnerID())
end


--============================================================================================================
--屠龍者酒吧
--============================================================================================================

function LuaS_421033_114433()
	SetIdleMotion( OwnerID() ,ruFUSION_MIME_IDLE_SIT)
	while 1 do
		Say(OwnerID(),"[SC_421033_0]")	--"再來一杯......忘、忘情水！"	
		Sleep(200)
		PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_SIT_BEGIN  )
		PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_SIT_LOOP )
		Say(OwnerID(),"[SC_421033_1]")
		Sleep(3000)
	end
end


function LuaS_421033_114434()	--喝酒的姿勢
	SetIdleMotion(OwnerID(),ruFUSION_MIME_EMOTE_DRINK)
	Sleep(50)
end

function LuaS_421033_114435()	--趴桌上
	SetIdleMotion(OwnerID(),ruFUSION_MIME_SIT_CHAIR_LOOP)
	Sleep(50)
end


--============================================================================================================
--中毒的村民
--============================================================================================================

function LuaS_422051_114463()
--掛在npc114463/npc114464中毒的村民之下
	SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_SLEEP_LOOP )	--躺著的動作emote_sleep_down
end


--============================================================================================================
--捉卻普瑞
--============================================================================================================	
-------------------待調整(走路旗標、狗的動作)
--掛在114425小璐嘉的初始劇情
--小瑞克的演出,780569/  缽缽,780570
--透明的114357

function LuaS_422113_3()
--Owner是114425
	SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_IDLE0	)

	while 1 do
		Local Ric=Lua_DW_CreateObj("flag" ,114465,780569,1)
		Sleep(30)
		DW_MoveToFlag(Ric,780569,2,0,1)
		AdjustDir( Ric , 180)
		Yell(Ric,"[SC_422113_0]",3)	
		--缽缽，快來快來!
		Local Bou=Lua_DW_CreateObj("flag" ,114466,780570,1)
		Sleep(10)
		DW_MoveToFlag(Bou,780570,2,0,1)
		
		Yell(Ric,"[SC_422113_1]",3)
		--缽缽，你和我，我們要一起去打強盜！
		PlayMotion(Ric,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		PlayMotion(Bou,ruFUSION_ACTORSTATE_DODGE)
		Sleep(30)
		
		BeginPlot(Ric,"LuaS_422113_4",0)	--780569.3
		Sleep(10)
		BeginPlot(Bou,"LuaS_422113_5",0)	--780570.3
		Sleep(50)
		
		PlayMotion(Ric,ruFUSION_ACTORSTATE_EMOTE_IDLE1)
		Yell(Ric,"[SC_422113_4]",3)
		--等我長大，就換我和你來保護大家了。
		PlayMotion(Bou,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Sleep(40)
		
		Yell(Ric,"[SC_422113_5]",3)
		--嘿！臭強盜，給你好看！
		--CastSpell(Ric,OwnerID(),490591)
		Sleep(30)
		BeginPlot(Bou,"LuaS_422113_6",0)	--讓缽缽亂跑動--780570.4
		
		DW_MoveToFlag(Ric,780569,4,0,1)
		AdjustFaceDir(Ric,OwnerID(),0)
		Yell(Ric,"[SC_422113_6]",3)
		--哇！
		
		DisableQuest(OwnerID(),true)
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_DODGE)
		Sleep(30)
		AdjustFaceDir(OwnerID(),Ric,0)
		Yell(Ric,"[SC_422113_2]",3)
		--小璐嘉，嘟嘟嘴，想摸缽缽，我偏不給，哇哇哭了變醜鬼！
		DW_MoveToFlag(Ric,780569,5,0,1)
		AdjustFaceDir(Ric,OwnerID(),0)
		AdjustFaceDir(OwnerID(),Ric,0)
		Sleep(30)
		Yell(OwnerID(),"[SC_422113_3]",3)
		--人家最討厭瑞克了啦！臭瑞克，小氣鬼！
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Sleep(30)
		Yell(Ric,"[SC_422113_2]",3)
		--小璐嘉，嘟嘟嘴，想摸缽缽，我偏不給，哇哇哭了變醜鬼！
		DW_MoveToFlag(Ric,780569,6,0,1)
		DisableQuest(OwnerID(),false)
	
		Yell(Ric,"[SC_422113_0]",3)	
		--缽缽，快來快來!
		DW_MoveToFlag(Bou,780570,5,0,1)
		Sleep(50)
		Delobj(Ric)
		Delobj(Bou)
	
	Sleep(2000)
	end
end

	
Function LuaS_422113_4()
	DW_MoveToFlag(OwnerID(),780569,3,0,1)
	AdjustDir( OwnerID() , 180)
end

Function LuaS_422113_5()
	DW_MoveToFlag(OwnerID(),780570,3,0,1)
	SetRandMove(OwnerID(),500, 1500,20  )
end	
	
Function LuaS_422113_6()
	DW_MoveToFlag(OwnerID(),780570,4,0,1)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	SetRandMove(OwnerID(),5000, 10,20  )

end	


-------------------




--◆捉卻普瑞的script+放掉卻普瑞

function LuaS_422113_0()-----掛在物品204046使用下的<檢查lua>之下。103498
	local OrgID = 0
	if CheckAcceptQuest( OwnerID() , 422113 ) == false or CountBodyItem( OwnerID() ,206407) >= 5 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206446_0]" , 0 ) --你不需要使用此物品
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206446_0]" , 0 )
		return false
	end
	
	if CheckID( TargetID() ) == true then
		OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	end
	
	if  CheckBuff( TargetID() , 504004 ) == true  then
		return false
	end
	
	if   OrgID ~= 103498 then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_204425_1]", 0 ); -----這個[205871]似乎只能對[113447]使用。
		return false
	end

	if GetDistance(TargetID(), OwnerID() ) > 120  then -------距離
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_204425_5]", 0 ); -----距離太過遙遠，無法使用[205871]。
		return false
	end

	if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)	>0.5	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422113_7]", 0 ); ----目標奮力掙扎中，你無法順利捉住你的目標！
		return false
	end


	if	ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 1 or  CheckBuff( TargetID() , 504004 ) == true  then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422565_2]" , 0 ) --目標已經死了。
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422565_2]" , 0 )
		return false
	end
	return true
end

function LuaS_422113_1()	--掛在<使用效果類型:server端劇情>下的使用效果下
	if GiveBodyItem( OwnerID() , 206407 , 1 ) then
		AddBuff( TargetID() , 504004 , 0 , 30 )
		UseItemDestroy( OwnerID() )---正在使用的物品
	end
	Hide(TargetID())
---	CallPlot(TargetID(),"LuaFunc_ResetObj",TargetID())
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422113_8]", 0 ); -------你抓到[103301]了！
	CallPlot(TargetID(),"LuaFunc_ResetObj",TargetID())

end



--完成任務後
function LuaS_422113_2()	--掛在任務422113的完成任務之徵
	if	 CountBodyItem( TargetID(), 204046)>0	 then 
		 DelBodyItem( TargetID(), 204046, 1 )
	end
	
end



--============================================================================================================	
--422857 閃星石任務
--============================================================================================================	
--Rand( Value )在一定範圍內取亂數
--閃星石206408


function LuaS_422857_0()	--掛在物件閃星石的使用物品script之下，owner是玩家

--	Say(OwnerID(),"0..0")
	Beginplot(TargetID(),"LuaS_422857_1",0)
	UseItemDestroy()
	ScriptMessage( OwnerID()  , OwnerID()   , 1 , "[SC_422857_0]" , 0 )
	CastSpell( OwnerID() , OwnerID() , 491008 )
	
end

function LuaS_422857_1()

	local R=RandRange(1,20)
	local A={}
	A[1]=206831
	A[2]=206849
	A[3]=206850
	A[4]=206851
	A[5]=206852
	A[6]=206853
	A[7]=206854
	A[8]=206855
	A[9]=206856
	A[10]=206857
	A[11]=206858
	A[12]=206859
	A[13]=206860
	A[14]=206861
	A[15]=206862
	A[16]=206863
	A[17]=206864
	A[18]=206865
	A[19]=206866
	A[20]=206867
		
	local B=0
		for i=1,20,1 do	
			if R==i	then
				GiveBodyItem( TargetID() , A[i] , 1 )
				ClearBorder( TargetID() );		
				AddBorderPage( TargetID(), "[SC_422857_"..i.."]" )			
				ShowBorder( TargetID(), 0, "[206408]", "ScriptBorder_Texture_Paper" )
			end	
			
			if CountBodyitem(TargetID(),A[i])>0 then
				Setflag(TargetID(),543791,1)	--現在改開了一個就給旗標，以判斷對話劇情開啟否....
--				B=B+1(原本是設開了3個才給旗標才這樣寫_1)
			end
		end		

--	if B>2 then(原本是設開了3個才給旗標才這樣寫_2)
--		Setflag(TargetID(),543721,1)
--	end
end

-------------


	
function LuaS_422857_2()	--掛在人馬安卓美達．藍星對話之下 
	LoadQuestOption(OwnerID())
	if 	Checkflag(OwnerID(),543791)== true	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422857_22]","LuaS_422857_3",0)		--「我看過閃星石了，現在想將這些石頭還給妳。」

	else
		return false
	end
		
end

function LuaS_422857_3()



	local A={}
	A[1]=206831		--1好的木材並不在順境中生長，風越強你越茁壯。
	A[2]=206849		--2慎選與你同行的人。
	A[3]=206850		--3小人物易發怒。
	A[4]=206851		--4一知半解最危險。
	A[5]=206852		--5不停漂浪的冒險者從未選擇方向，而是優雅地接受〞無限〞的邀請。
	A[6]=206853		--6凡是內心能夠想到、相信的，都是可以達到的。
	A[7]=206854		--7從最淺的淺灘，跨越眼前的溪流。
	A[8]=206855		--8在你的心靈深處有許多沈睡的力量，喚醒它、巧妙的運用它。
	A[9]=206856		--9貪吃的魚最容易上鉤。
	A[10]=206857	--10僥倖之財難久留。
	A[11]=206858	--11即使黑暗終會吞噬一切，在此之前更要盡力對抗它！
	A[12]=206859	--12欲速則不達。
	A[13]=206860	--13往事的鬼魂會再次來訪。
	A[14]=206861	--14獲得你想要的，享受你獲得的。
	A[15]=206862	--15睜大你的眼，靜水深流。
	A[16]=206863	--16看看廣闊的天空和閃爍的星星，你的心將會平靜下來。
	A[17]=206864	--17好運伴隨著今天的你。
	A[18]=206865	--18這是一顆空白的閃星石，表示你的命運有著無限的可能。
	A[19]=206866	--19星芒引領著你，讓你不迷失在陌生的小徑上。
	A[20]=206867	--20偉大的獵人從不玩弄獵物，這就是為什麼從未有人說過慾望是偉大的。
	
	for i=1,20,1 do

		if 	(CountBodyitem(OwnerID(),A[i]))== false then
			SetSpeakDetail(OwnerID(),"[SC_422857_23]")		--嗯，你忘了將閃星石帶在身上？
			return false
		else			
		
			DelBodyItem(OwnerID(),A[i],1)	
		end
		SetSpeakDetail(OwnerID(),"[SC_422857_24]")		--請將星星告訴你的話語記在心上，即將遠行的旅行者，星光永遠在你前方的天空閃爍。
	end
end


		
		
--============================================================================================================
--巡邏劇情421273
--============================================================================================================


function LuaS_421273_543687()	--巡邏一站
---DebugMSG(0,0,"!!!!")
	--Say(OwnerID(),"0..01")
	--Say(TargetID(),"TT1")
	Setplot(OwnerID(),"range","LuaS_421273_543687_1",50)
	local Mark1 = LuaFunc_CreateObjByObj( 114895 , OwnerID() )
	Lua_ObjDontTouch( Mark1 ) 	
end

function LuaS_421273_543687_1()	
	--Say(OwnerID(),"0..02")
	--Say(TargetID(),"T_T2")
	if CheckAcceptQuest(OwnerID(),421273)== true and
		CheckFlag( OwnerID() , 543687 )==false	then
		SetFlag(OwnerID(),543687,1)
		Beginplot(TargetID(),"LuaS_421273_2",0)	--有掛機率出怪	
		
	end
end

--------------

function LuaS_421273_543688()	--巡邏二站
--DebugMSG(0,0,"!!!!")
	--Say(OwnerID(),"0..01")
	--Say(TargetID(),"TT1")
	Setplot(OwnerID(),"range","LuaS_421273_543688_1",50)	
	local Mark2 =  LuaFunc_CreateObjByObj( 114895 , OwnerID() )	
	Lua_ObjDontTouch( Mark2 ) 	
end

function LuaS_421273_543688_1()	
	--Say(OwnerID(),"0..02")
	--Say(TargetID(),"T_T2")
	if CheckAcceptQuest(OwnerID(),421273)== true and
		CheckFlag( OwnerID() , 543688 )==false	then
		SetFlag(OwnerID(),543688,1)
		Beginplot(TargetID(),"LuaS_421273_2",0)	--有掛機率出怪	
	end
end

--------------

function LuaS_421273_543689()	--巡邏三站
--DebugMSG(0,0,"!!!!")
	--Say(OwnerID(),"0..01")
	--Say(TargetID(),"TT1")
	Setplot(OwnerID(),"range","LuaS_421273_543689_1",50)	
	local Mark3 =  LuaFunc_CreateObjByObj( 114895 , OwnerID() )
	Lua_ObjDontTouch( Mark3 ) 	
end

function LuaS_421273_543689_1()	
	--Say(OwnerID(),"0..02")
	--Say(TargetID(),"T_T2")

	if CheckAcceptQuest(OwnerID(),421273)== true and
		CheckFlag( OwnerID() , 543689 )==false	then
		SetFlag(OwnerID(),543689,1)
		Beginplot(TargetID(),"LuaS_421273_2",0)	--有掛機率出怪	
	end
end

--------------

function LuaS_421273_543690()	--巡邏四站
--DebugMSG(0,0,"!!!!")
	--Say(OwnerID(),"0..01")
	--Say(TargetID(),"TT1")
	Setplot(OwnerID(),"range","LuaS_421273_543690_1",50)
	local Mark4 =  LuaFunc_CreateObjByObj( 114895 , OwnerID() )
	Lua_ObjDontTouch( Mark4 ) 		--這個指令是使物品不會被點到(當圖形沒有參考點，另設一隱形圖片，而此圖片不想被點到時，用此函式)
end

function LuaS_421273_543690_1()	
	--Say(OwnerID(),"0..02")
	--Say(TargetID(),"T_T2")	
	if CheckAcceptQuest(OwnerID(),421273)== true and
		CheckFlag( OwnerID() , 543690 )==false	then
		SetFlag(OwnerID(),543690,1)
		--Beginplot(TargetID(),"LuaS_421273_2",0)	--因為種在舊城區入口，故不掛機率出怪	
	end
end


function LuaS_421273_2()	--
	--Say(OwnerID(),"0..03")
	--Say(TargetID(),"T_T3")
	local R=RandRange(1,5)
	local L=RandRange(1,6)
	local S=RandRange(1,7)
	local B=RandRange(1,4)
	
	local Looser1 = Lua_CreateObjByDir( OwnerID()  , 103526, 20 , 0 )
	Hide(Looser1)
	local Looser2 = Lua_CreateObjByDir( OwnerID()  ,103527, 30 , 0 )	
	Hide(Looser2)
	AdjustFaceDir( Looser1 , TargetID() ,3 )	
	AdjustFaceDir( Looser2 , TargetID() ,3 )	
		
	if R==1 then
		--Say(OwnerID(),"0..04")
		--Say(TargetID(),"T_T4")
		Sleep(10)
		AdjustFaceDir( Looser1 , TargetID() ,3 )	
		AdjustFaceDir( Looser2 , TargetID() ,3 )	
		Show(Looser1,0)
		Show(Looser2,0)
		Yell(Looser1,"[SC_421273_"..L.."]",1)		--你看，新來的見習騎士，瞧他那個跩樣。
		Sleep(30)
		Yell(Looser2,"[SC_421273_1"..S.."]",1)		--菜鳥一個，弄他！
		SetAttack(Looser1 , TargetID())
		SetAttack(Looser2 , TargetID())
		
	elseif R==2 then
		--Say(OwnerID(),"0..05")
		--Say(TargetID(),"T_T5")
		Local X = ReadRoleValue(TargetID(),EM_RoleValue_X)
		Local Y = ReadRoleValue(TargetID(),EM_RoleValue_Y)
		Local Z = ReadRoleValue(TargetID(),EM_RoleValue_Z)
		Sleep(10)
		SetStopAttack(Looser1)	
		Sleep(20)
		Show(Looser1,0)		
		Yell(Looser1,"[SC_421273_2"..B.."]",1)		--我、我什麼壞事也沒有做，不要抓我！
		Sleep(30)
		LuaFunc_WaitMoveTo( Looser1, X+100 , Y , Z-200)		
		Hide(Looser1)
	end



	for i=1,200,1 do
		if 	GetDistance( TargetID(), OwnerID()) >70   or
			ReadRoleValue(TargetID() , EM_RoleValue_IsDead)==1 	or
			CheckID(TargetID()) == false	then
		--Say(OwnerID(),"0..06")
		--Say(TargetID(),"T_T6")
			break	
		end
		Sleep(30)
	end
		
	
	if 	CheckID(Looser1)== true then
		Sleep(50)
		Hide(Looser1)
		DelObj(Looser1)
	end
	
	if 	CheckID(Looser2)== true then
		Sleep(50)
		Hide(Looser2)
		DelObj(Looser2)
	end

end

--L=1 	你看，是新來的見習騎士，瞧他那副跩樣。						s=	1	菜鳥一個，搞死他！			
--	2	喂！巡邏的人過來了。											2	小子，今天就是你的死期，誰教你加入獅心騎士團！
--	3	瞧瞧那一身裝備，這個見習騎士很有油水的樣子。					3	我們兩個，他一個，圍也圍死他！
--	4	快走吧，那邊有人過來巡邏了。									4	就一個菜鳥，是給我們送菜來了，上！
--	5	兄弟！是巡邏的人......呼～還好，不是[114368]那個瘋婆娘。		5	別廢話，砍死他！
--	6	看看這個過來的人是誰？原來是新上任的見習騎士大人，哈哈！		6	哼哼！碰上我們兩個，是他不幸的開始。

--B=1	我、我什麼壞事也沒有做，不要抓我！
--	2	我在這裡不是要伏擊新來的見習騎士......
--	3	看什麼看？我不能經過這裡嗎？
--	4	你沒有看到我、你沒有看到我......
	

	
	
--============================================================================================================
--猥瑣盜賊114421(任務421614
--============================================================================================================	
	
function LuaS_421614_0() --掛在任務NPC川普的對話劇情
	LoadQuestOption(OwnerID())
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421614_0]","LuaS_421614_1",0)		--「看看你賣什麼......」
		if CheckAcceptQuest(OwnerID(),421597)==true 	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_421614_2]","LuaS_421614_2",0)	--你認識[114841]嗎？
		end
end

function LuaS_421614_1()
	SetSpeakDetail(OwnerID(),"[SC_421614_1]")	--
end	

--巨鼠的尾巴		巨鼠的胃囊		
--巨鼠的鬍鬚		蟑螂的翅膀		
--蟑螂的腺體		蜘蛛的利牙		
--蜘蛛的體毛		蜘蛛的卵
--老灶的爐灰 		舊鍋的鐵鏽
--死屍脂肪蠟燭	
--妖精的頭髮
--河怪的手指
--......


function LuaS_421614_2()
	SetSpeakDetail(OwnerID(),"[SC_421614_3]")	--我是認識幾個駝背的老怪物，[114841]這個名字有點耳熟
	AddSpeakOption(OwnerID(),TargetID(),"[SC_421614_4]","LuaS_421614_3",0)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_421614_5]","LuaS_421614_4",0)
end

function LuaS_421614_3()
	SetSpeakDetail(OwnerID(),"[SC_421614_6]")
	SetFlag(OwnerID(),543760,1)	
end

function LuaS_421614_4()
	SetSpeakDetail(OwnerID(),"[SC_421614_7]")
	SetFlag(OwnerID(),543760,1)	
end

--============================================================================================================	

function LuaS_Deadmen()
--掛在死人下
	SetDefIdleMotion( OwnerID() ,ruFUSION_MIME_IDLE_DEAD)			

end
function LuaS_422743()----
	if  CheckFlag(OwnerID(), 543336) == false and CheckAcceptQuest( OwnerID(),  422743 ) == true then
		if CountBodyItem( OwnerID() , 205890) <1 then  
			SetSpeakDetail( OwnerID(), "[SC_422743_0]"  ) --你怎麼會在這？
		end
		if  CheckFlag(OwnerID(), 543336) == false and CheckAcceptQuest( OwnerID(),  422743 ) == true and CountBodyItem( OwnerID() , 205890 ) >0 then
			SetSpeakDetail(OwnerID(),"[SC_422743_2]")---你......竟然沒死？
			AddSpeakOption( OwnerID(), TargetID(), "[SC_422743_1]" , "LuaS_422743_1", 0)--- [113443]，託我將酒轉送回給你。
		end
	else
		LoadQuestOption( OwnerID() )
	end
end

function LuaS_422743_1()
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID(), "LuaS_422743_2", 0)
end
function LuaS_422743_2()------
	DisableQuest(OwnerID() ,true)
	DelBodyItem ( TargetID(), 205890 , 1 )	
	SAY(OwnerID(),"[SC_422743_3]" )-----既然你沒死，也就代表不再信任我......
	sleep(20)
	SAY(OwnerID(),"[SC_422743_4]" )----從以前我一直等待著這一天的到來。
	sleep(20)
	SAY(OwnerID(),"[SC_422743_5]" )----然而此刻，卻悵然若失。
	sleep(20)
	SAY(OwnerID(),"[SC_422743_6]" )----罷了酒，我就收下！
	sleep(20)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_POINT)
	SAY(OwnerID(),"[SC_422743_7]" )----喪家犬，回去告訴
	sleep(20)
	SAY(OwnerID(),"[SC_422743_8]" )---他欠我的那條命，從現在起一筆勾消！
	sleep(20)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_SHIELD_BASH)
	SAY(OwnerID(),"[SC_422743_9]" )--下次在見面，就是死敵。
	sleep(20)
	CastSpell(OwnerID(),TargetID(),491276)
	sleep(20)
	Hide(OwnerID())
	sleep(60)
	if CheckID( TargetID() ) == true and CheckAcceptQuest( TargetID(),422743) == true then
	Setflag(TargetID(),543336,1)
	end
	sleep(20)
	Show( OwnerID() , 0 )
	DisableQuest(OwnerID() ,false)
end
---------------------------------------------------
---------------------------------揮別過去
function LuaQ_422744()
	SetPlot( OwnerID() , "touch" , "LuaQ_422744_1" , 40 )
end
function LuaQ_422744_1()
	if (CheckAcceptQuest(OwnerID(),422744)==true )and(CheckFlag(OwnerID(),543343)==false )and(CountBodyItem (OwnerID() ,204067)>0) then
		DisableQuest( TargetID(), true )
		DelBodyItem ( OwnerID() , 204067 , 1 )
		local Ball = LuaFunc_CreateObjByObj( 113440, TargetID() ) 
		local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		Lua_ObjDontTouch( Ball ) 
		AddToPartition( Ball , RoomID )
		CastSpell( Ball , Ball , 493776 )
		sleep(20)
		ScriptMessage( Ball ,  0 , 1 , "[SC_422744_1]" , "0xffffc600" )--- 已經很累了.......我不想再欺騙你！我的摯友[113443]！所以我選擇了這種方式……來告訴你，我的苦衷！
		ScriptMessage( Ball ,  0 ,  0, "[SC_422744_1]" , "0xffffc600" )--- 已經很累了.......我不想再欺騙你！我的摯友[113443]！所以我選擇了這種方式……來告訴你，我的苦衷！
		sleep(40)
		ScriptMessage( Ball , 0 , 1 ,  "[SC_422744_2]" , "0xffffc600"  )---以前我總是認為強大的力量才是我生命的一切！直到認識了你，認識了葛雷西妮蒂，我才改變自己的想法。
		ScriptMessage( Ball , 0 , 0 ,  "[SC_422744_2]" , "0xffffc600"  )---以前我總是認為強大的力量才是我生命的一切！直到認識了你，認識了葛雷西妮蒂，我才改變自己的想法。
		sleep(30)
		ScriptMessage( Ball ,  0 , 1 , "[SC_422744_3]" ,"0xffffc600" )--[113443]......你曾經說過人類的情感很奇妙，任何事物只要投入了感情，就會讓事物本身變得不一樣。
		ScriptMessage( Ball ,  0 , 0 , "[SC_422744_3]" ,"0xffffc600" )--[113443]......你曾經說過人類的情感很奇妙，任何事物只要投入了感情，就會讓事物本身變得不一樣。
		sleep(30)
		ScriptMessage( Ball , 0 , 1 ,  "[SC_422744_4]" , "0xffffc600"  )--現在的我就在體會這種心境……對我而言，你和葛雷西妮蒂都是我生命中最重要的人。
		ScriptMessage( Ball , 0 , 0 ,  "[SC_422744_4]" , "0xffffc600"  )--現在的我就在體會這種心境……對我而言，你和葛雷西妮蒂都是我生命中最重要的人。
		sleep(40)
		ScriptMessage( Ball , 0 , 1 ,  "[SC_422744_5]" , "0xffffc600"  )--所以我決定選擇對你坦白，並將這條魔法項鍊轉送給你，讓命運來決定接下來事情的發展
		ScriptMessage( Ball , 0 , 0 ,  "[SC_422744_5]" , "0xffffc600"  )--所以我決定選擇對你坦白，並將這條魔法項鍊轉送給你，讓命運來決定接下來事情的發展
		sleep(30)
		ScriptMessage( Ball ,  0 , 1 , "[SC_422744_6]" , "0xffffc600"  )--我以及數十年的那批外來者，事實上是來自某個追求強大力量的組織的成員。
		ScriptMessage( Ball ,  0 , 0 , "[SC_422744_6]" , "0xffffc600"  )--我以及數十年的那批外來者，事實上是來自某個追求強大力量的組織的成員。
		sleep(30)
		ScriptMessage( Ball ,  0 , 1 , "[SC_422744_7]" , "0xffffc600"  )--我們受命來到[ZONE_DIMARKA]，並在此展開研究探查，以及取得[ZONE_DIMARKA]的古物……以及執行所有得到的指令
		ScriptMessage( Ball ,  0 , 0 , "[SC_422744_7]" , "0xffffc600"  )--我們受命來到[ZONE_DIMARKA]，並在此展開研究探查，以及取得[ZONE_DIMARKA]的古物……以及執行所有得到的指令
		sleep(60)
		if CheckID( OwnerID() ) == true and CheckAcceptQuest( OwnerID() , 422744) == true then
		SetFlag(OwnerID(),543343,1)
		end
		ScriptMessage( Ball ,  0 , 1 , "[SC_422744_8]" , "0xffffc600" )--我必須服膺於所有的命令……然而，我的心卻時常在你與組織間擺盪著。
		ScriptMessage( Ball ,  0 , 0 , "[SC_422744_8]" , "0xffffc600" )--我必須服膺於所有的命令……然而，我的心卻時常在你與組織間擺盪著。
		sleep(40)
		ScriptMessage( Ball , 0 , 1 ,  "[SC_422744_9]" , "0xffffc600"  )--我曾告訴你過我是孤兒……一生之中沒有什麼親人，在葛雷西妮蒂死後，我就把你當成我的親人了……
		ScriptMessage( Ball , 0 , 0 ,  "[SC_422744_9]" , "0xffffc600"  )--我曾告訴你過我是孤兒……一生之中沒有什麼親人，在葛雷西妮蒂死後，我就把你當成我的親人了……
		sleep(40)
		ScriptMessage( Ball , 0 , 1 ,  "[SC_422744_10]" , "0xffffc600"  )--然而組織卻是我從小到大所依靠的信仰以及依靠……
		ScriptMessage( Ball , 0 , 0 ,  "[SC_422744_10]" , "0xffffc600"  )--然而組織卻是我從小到大所依靠的信仰以及依靠……
		sleep(40)
		ScriptMessage( Ball ,  0 , 1 , "[SC_422744_11]" , "0xffffc600" )--我無法取捨於任何一邊，只能想出這樣可笑的辦法，讓命運來決定一切……
		ScriptMessage( Ball ,  0 , 0 , "[SC_422744_11]" , "0xffffc600" )--我無法取捨於任何一邊，只能想出這樣可笑的辦法，讓命運來決定一切……
		sleep(40)
		ScriptMessage( Ball, 0 , 1 ,  "[SC_422744_12]" ,"0xffffc600" )--呵～當你發現這個東西裡隱藏的秘密時，也許我們已經撕破臉了？也許還沒有？
		ScriptMessage( Ball, 0 , 0 ,  "[SC_422744_12]" ,"0xffffc600" )--呵～當你發現這個東西裡隱藏的秘密時，也許我們已經撕破臉了？也許還沒有？
		sleep(30)
		ScriptMessage( Ball , 0 , 1 ,  "[SC_422744_13]" , "0xffffc600"  )--哼！不過誰在意呢？我只希望你能諒解我的苦衷！
		ScriptMessage( Ball , 0 , 0 ,  "[SC_422744_13]" , "0xffffc600"  )--哼！不過誰在意呢？我只希望你能諒解我的苦衷！
		sleep(30)
		ScriptMessage( Ball , 0 , 1 ,  "[SC_422744_14]" , "0xffffc600"  )--[113443]，你曾經說過對於朋友，你將給予無比的信任，然而我背叛了你的信任。
		ScriptMessage( Ball , 0 , 0 ,  "[SC_422744_14]" , "0xffffc600"  )--[113443]，你曾經說過對於朋友，你將給予無比的信任，然而我背叛了你的信任。
		sleep(30)
		ScriptMessage( Ball , 0 , 1 ,  "[SC_422744_15]" , "0xffffc600" )--我並非不重視你.......只是.......
		ScriptMessage( Ball , 0 , 0 ,  "[SC_422744_15]" , "0xffffc600" )--我並非不重視你.......只是.......
		sleep(40)
		CastSpell( Ball , Ball , 493776 )
		sleep( 10)
		Delobj( Ball )
		DisableQuest( TargetID(), false )
		else
		ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_421177_16]", 0 )-------你沒有任何東西需要燃燒！
		ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_421177_16]", 0 )-------
		end
end
--------------------------------------------------------------------------------------
function LuaS_422772_AK()
	DisableQuest( OwnerID() , true )
	Say( OwnerID() , "[SC_422772_AK1]" )----咳咳咳～該死！真該死！
	SLEEP(20)
	Say( OwnerID() , "[SC_422772_AK2]" )----我真是個混帳.......因為我的緣故，讓我的摯友蒙受危難......
	---PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_CRY)
	SLEEP(20)
	Say( OwnerID() , "[SC_422772_AK3]" )---咳咳～我根本沒有資格，在這裡養病！
	---PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_CRY)
	SLEEP(20)
	DisableQuest( OwnerID() , false ) 
END


















--====================================================================================================
--掛在任務NPC米娜薇絲的對話劇情
--====================================================================================================

--function LuaS_421962_4() --掛在任務NPC米娜薇絲的對話劇情
--	LoadQuestOption(OwnerID())
--如果有接任務卻還沒完成
--
--	if	(CheckAcceptQuest(OwnerID(),422841)==true ) and					--史詩四任務
--		(CheckCompleteQuest( OwnerID() , 422841) == false ) and
--		(CheckFlag(OwnerID(),543467)==false)  then
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_422841_0]","LuaS_422841_2",0) 		--「能為[113282]女士您效勞，是我的榮幸。」
--	end
--
--	if	(CheckAcceptQuest(OwnerID(),422844)==true ) and
--		(CheckCompleteQuest( OwnerID() , 422844) == false ) and
--		(CheckFlag(OwnerID(),543541)==false)  then
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_422844_0]","LuaS_422844_1",0)		--「記得，但是[113274]長老說，拿走聖劍的是英雄席格斯啊。」
--	end
--end


---------------------

function LuaS_422841_2()		
	SetSpeakDetail(OwnerID(),"[SC_422841_1]")		
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422841_2]","LuaS_422841_3",0) 		--「女士，這件事就讓我來，您留下來安撫薩滿們吧。」
end

function LuaS_422841_3()		
	SetSpeakDetail(OwnerID(),"[SC_422841_3]")
--	Say( OwnerID() , "Test" ) 
	Setflag( OwnerID() , 543467 , 1 ) --給重要物品：請教亞爾弗列德，以完成任務422841
end

--------------------

function LuaS_422844_1()		
	SetSpeakDetail(OwnerID(),"[SC_422844_1]")					--席格斯，因對抗獨眼巨人，在犧牲之後獲得英雄之名...
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422844_2]","LuaS_422844_2",0)		--「這是數十年前的事，應該和現在的問題無關。」
end

function LuaS_422844_2()		
	SetSpeakDetail(OwnerID(),"[SC_422844_3]")					--雖說如此，但這點我們仍然不能將之排除...
	setflag(OwnerID(),543541 , 1 )							--給重要物品：英雄的真名，以完成任務422844
end







--===========================================================================================================
--亞爾弗列德的對話劇情
--===========================================================================================================

--function LuaS_422572_0() --掛在任務NPC亞爾弗列德的對話劇情
--	LoadQuestOption(OwnerID())
--
--	if	(CheckAcceptQuest(OwnerID(),422842)==true ) 		and
--		(CheckCompleteQuest( OwnerID() , 422842) == false ) 	and
--		(CheckFlag(OwnerID(),543468)==false)			then
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_422842_0]","LuaS_422842_1",0) 		--「波多村的元素混亂，會是禁制之壁開啟的關係嗎？」
--	end
--
--	if	(CheckAcceptQuest(OwnerID(),422855)==true ) 		and
--		(CheckCompleteQuest( OwnerID() , 422855) == false )	and
--		(CheckFlag(OwnerID(),543427)==false)		then
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_422855_0]","LuaS_422855_1",0) 		--「還沒有，我準備等一下去拜訪她。」
--	end
--		
--end



------422482-------

function LuaS_422842_1()		
	SetSpeakDetail(OwnerID(),"[SC_422842_1]")					--亞爾：我很希望能回答你這個問題，但我對禁制之壁的了解實在不多...
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422842_2]","LuaS_422842_2",0) 		--「沒關係，不管是多小的線索，都請您告訴我。」
end

function LuaS_422842_2()		
	SetSpeakDetail(OwnerID(),"[SC_422842_3]")					--其他的嘛……嗯...數十年前，.....
	setflag(OwnerID(),543468,1)							--給重要物品：亞爾弗列德的答案
end

------422855-------------------

function LuaS_422855_1()		
	SetSpeakDetail(OwnerID(),"[SC_422855_1]")					--亞爾：這樣......[$playername]，我一會兒...
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422855_2]","LuaS_422855_2",0) 		--「好的，亞爾弗列德長老。」
end

function LuaS_422855_2()	--OwnerID是玩家	
	CloseSpeak( OwnerID() )
	if ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 then
		Tell(OwnerID(),TargetID() , "[SC_422855_3]")					--出發前，記得先做好遠行的補給。.....
		WriteRoleValue( TargetID() , EM_RoleValue_Register  , 1 )
		Beginplot(TargetID(),"LuaS_422855_3",0)
	else
		ScriptMessage( OwnerID(), OwnerID(), 1 , "[SAY_NPC_BUSY]" , 0 )
		ScriptMessage( OwnerID(), OwnerID(), 0 , "[SAY_NPC_BUSY]" , 0 )
	end
end

function LuaS_422855_3()
	--sleep( 30 )
	--Say(OwnerID(),"0..0")
	--Say(TargetID(),"T_T")
	if CheckID( TargetID() ) == true then	
		AddBuff( TargetID()  , 503977 , 1 , 300 ) 			--讓玩家不動
	end
	local Rufri= Lua_DW_CreateObj("flag" ,113945,780496,4)
	DW_MoveToFlag(Rufri,780496,5,0,1)
	AdjustFaceDir(Rufri,OwnerID(),0)		
	Sleep(20)
	Yell(Rufri,"[SC_422855_4]",3)			--魯弗提克：父親，請允許我與這位冒險者同去奧圖拉傑火山。
	Sleep(30)
	AdjustFaceDir(OwnerID(),Rufri,0)	
	Yell(OwnerID(),"[SC_422855_5]",3)		--亞爾弗列德：越過禁制之壁，佈滿蛇人和未知的危險。魯弗提克，你想清楚了？
	Sleep(30)
	Yell(Rufri,"[SC_422855_6]",3)			--魯弗提克：尋回自然之石一事我族不能缺席，父親，守護禁制之壁，不正是我族千年來的使命嗎？
	Sleep(30)
	Yell(OwnerID(),"[SC_422855_7]",3)		--亞爾弗列德：好，我答應你，為了榮耀我族，為了我王的使命，這就是我兒！
	Sleep(30)
	Yell(Rufri,"[SC_422855_8]",3)			--魯弗提克：謝謝父親，我不會讓你失望的。
	Sleep(30)
	AdjustFaceDir(Rufri,TargetID(),0)
	Sleep(10)
	Yell(Rufri,"[SC_422855_9]",3)			--魯弗提克：冒險者，我們直接在禁制之壁的另一邊，奧圖拉傑火山的土地上會合。
	Sleep(20)
	DW_MoveToFlag(Rufri,780496,6,0,1)
	Delobj(Rufri)
	if CheckID( TargetID() ) == true then
		AdjustFaceDir(OwnerID(),TargetID(),0)
	end
	Yell(OwnerID(),"[SC_422855_10]",3)		--亞爾弗列德： [$playername]，魯弗提克將與你同行，他能幫助你，願精靈聖王佑你們此行平安。

	if (CheckFlag(OwnerID(),543427)==false) then
		Setflag(TargetID(),543427,1)
	end

	if CheckID( TargetID() ) == true then
		CancelBuff( TargetID()  , 503977)
	end
	WriteRoleValue(OwnerID() , EM_RoleValue_Register  , 0 )
			
end





--===================================================================================================================================================
--422846找齊靈土
--===================================================================================================================================================
---接任務：呃拉滿	還任務：呃拉滿
---[206368][114008]水裡泥
---[206369][114009]樹下土
---[206370][114010]山之石
---[206371][114011]元素沙
---[206372]世界塵
---[206373][114020]儀式小刀


function LuaS_422846_0()	--掛在任務npc呃拉滿的對話劇情
	LoadQuestOption( OwnerID() )
	
	if	(CheckAcceptQuest( OwnerID(), 422846) == true) 	and
		(CheckCompleteQuest(OwnerID(),422846)==false  ) then	
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422846_0]"," LuaS_422846_1",0)	--「水裡泥要去哪裡找？」
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422846_2]"," LuaS_422846_2",0)	--「樹下土要去哪裡找？」
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422846_4]"," LuaS_422846_3",0)	--「山之石要去哪裡找？」
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422846_6]"," LuaS_422846_4",0)	--「元素沙要去哪裡找？」
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422846_8]"," LuaS_422846_5",0)	--「世界塵要去哪裡找？」
	end

	if	(CheckAcceptQuest( OwnerID(), 422848) == true) 	and		--當接過422848任務卻未完成時
		(CheckCompleteQuest(OwnerID(),422848)==false  ) and
		CountBodyItem( OwnerID(), 206374)<1		then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422848_0]"," LuaS_422848_1",0)		--「那麼，地母有指示我接下來該去哪裡嗎？」
		end

	if	CheckAcceptQuest(OwnerID(),422847)== true	and		--當接過422847任務卻未完成時
		(CheckCompleteQuest(OwnerID(),422847)==false)	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422847_11]","LuaS_422847_2", 0 )
	end


end

function LuaS_422846_1()
	SetSpeakDetail(OwnerID(),"[SC_422846_1]")				--這麼簡單的事你也來問我？水、裡、泥！就是水裡的泥巴啊......
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_422846_10]"," LuaS_422846_0",0)  	--「(問呃拉滿其他靈土在哪裡。)」
end

function LuaS_422846_2()
	SetSpeakDetail(OwnerID(),"[SC_422846_3]")					--可憐的孩子，你出生的時候一定把腦子留在媽媽的肚子裡，你去附近隨便找一棵樹，在樹根旁邊挖一點土壤，那就是了。
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_422846_10]"," LuaS_422846_0",0)  	--「問呃拉滿其他靈土在哪裡。」
end

function LuaS_422846_3()
	SetSpeakDetail(OwnerID(),"[SC_422846_5]")					--偉大的地母告訴過我們，鬆軟的土壤經過萬年的歲月將會變成堅硬的岩石，去山壁邊撿些石頭回來吧。
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_422846_10]"," LuaS_422846_0",0)  	--「問呃拉滿其他靈土在哪裡。」
end

function LuaS_422846_4()
	SetSpeakDetail(OwnerID(),"[SC_422846_7]")				--元素最聚集的地方就會有元素沙的產生，你去圖騰柱旁邊看看吧。現在元素亂成這樣，不知道還能不能找到元素沙......
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_422846_10]"," LuaS_422846_0",0)  	--「問呃拉滿其他靈土在哪裡。」
end

function LuaS_422846_5()
	if 	(CountBodyItem( OwnerID(),206373) ==0)  then
		if 	CountBodyItem( OwnerID(),206372) >0  then
			if 	(CountBodyItem(OwnerID(),206372) >7)	then
				SetSpeakDetail(OwnerID(),"[SC_422846_11]")					--嘿～再削下去，你就快禿頭了耶。	
				AddSpeakOption(OwnerID(),OwnerID(),"[SC_422846_10]"," LuaS_422846_0",0)  	--「問呃拉滿其他靈土在哪裡。」
			else
				SetSpeakDetail(OwnerID(),"[SC_422846_12]")			--頭髮是你的，你要削多少是隨你便啦.....
				GiveBodyItem(OwnerID(), 206373, 1 )				--給小刀
			end
		else
			SetSpeakDetail(OwnerID(),"[SC_422846_9]")				--你過來，用小刀削一點你的頭髮。我們波多早就從偉大的地母啟示中知道....
			GiveBodyItem(OwnerID(), 206373, 1 )					--給小刀
		end
	else
		SetSpeakDetail(OwnerID(),"[SC_422846_14]")		--你已經有小刀了。
	end
end


--===================================================================================================================================================
--422848
--===================================================================================================================================================

function LuaS_422848_1()		--嚕耳滿對話
	SetSpeakDetail(OwnerID(),"[SC_422848_1]")					--是沒有，不過......咳咳...這個......
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_422848_2]"," LuaS_422848_2",0)  	--「你們是一起長大的童年好友......真難以想像。」
end

function LuaS_422848_2()
	if 	CountBodyItem( OwnerID(),206376) <1  then
		SetSpeakDetail(OwnerID(),"[SC_422848_3]")		--你不相信？說的也是啦，誰會相信......
		GiveBodyItem(OwnerID(),206376, 1 )
	else
		SetSpeakDetail(OwnerID(),"[SC_422848_5]")		--我已經給你地圖啦！	
	end
end





--===========================================================================================================
------隱士的對話任務
--===========================================================================================================

function LuaS_422854_0() --掛在任務NPC隱士的對話劇情
	LoadQuestOption(OwnerID())
	if	(CheckAcceptQuest(OwnerID(),422854)==true )		and
		(CheckCompleteQuest( OwnerID() , 422854) == false ) 	then
		if	CountBodyItem( OwnerID(), 206382)<1			then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422854_0]","LuaS_422854_1",0)		--「我很樂意接受你的提議，請告訴我該怎麼做。」
		else
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422854_9]","LuaS_422854_5",0)		--「好的，我立刻動身前往[ZONE_THE GREEN TOWER] 。」
		end
	end

	
end


function LuaS_422854_1() 
	SetSpeakDetail(OwnerID(),"[SC_422854_1]")					--你我兵分兩路，你拿著這個，前往奧圖拉傑火山.....
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422854_2]","LuaS_422854_2",0)		--「咦？這一顆小石頭是什麼，為什麼要尋找它的另一半？」
end

function LuaS_422854_2()
	SetSpeakDetail(OwnerID(),"[SC_422854_3]")					--這是自然之石，安特克羅設置禁制之壁.....
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422854_4]","LuaS_422854_3",0)		--「我聽不懂，但好像能將問題完美的解決，我們快出發吧！」
end

function LuaS_422854_3()
	SetSpeakDetail(OwnerID(),"[SC_422854_5]")					--[$playname]，莫急，綠之塔應該有人等待著你的調查結果。.....
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422854_6]","LuaS_422854_4",0)		--「是啊，我該向米娜薇絲女士說這個好消息的，我能先......」
end

function LuaS_422854_4()
	if 	CountBodyItem( OwnerID(), 206382)<1	then
		SetSpeakDetail(OwnerID(),"[SC_422854_7]")				--好，你去吧，這裡有封信箋，請你順道帶給亞爾弗列德。.....
		GiveBodyItem( OwnerID(), 206382, 1 )
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422854_9]","LuaS_422854_5",0)		--「好的，我立刻動身前往[ZONE_THE GREEN TOWER] 。」
	else
		CloseSpeak( OwnerID() )
		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_422854_8]" , 0 )		--任務物品已存在。
	end
end

function LuaS_422854_5()
	CloseSpeak( OwnerID() )
	Yell(TargetID(),"[SC_422854_10]",3)		--讓我送你一程吧。
	BeginPlot(OwnerID()  , "LuaS_422854_6" , 0 )
end

function LuaS_422854_6()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	sleep( 5 )
	ChangeZone( OwnerID() , 8 , 0 , 4043, 261 , 21530 , 166 )
end


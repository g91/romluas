function LuaS_116168_sleep()	--倒地的萊慕
	LuaP_Sleeping()
end

function Lua_423469_before()
	local NPC = SearchRangeNPC ( OwnerID() , 50 )
	for i=0,table.getn(NPC)-1 do
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) ==116157	then
			if	(CheckAcceptQuest(OwnerID(),423469)==true )and( CheckCompleteQuest( OwnerID(),423469)==false) 	then
				if	CheckFlag( OwnerID() , 544334) ==false	then
					if	CountBodyItem(OwnerID(),208099) > 0 	then
						return true
						else
						ScriptMessage(OwnerID(),OwnerID(), 1, "[SC_423469_0]",0) --你身上沒有託送的貨物！
						return false
					end
				else
				return false
				end
			end
		end
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) ==116158	then
			if	CheckFlag( OwnerID() , 544334) ==true	then
				if	CheckFlag( OwnerID() , 544335) ==false	then
					if 	(ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0)	then
						if	CountBodyItem(OwnerID(),208098) > 0		then
							return true
							else
							ScriptMessage(OwnerID(),OwnerID(), 1, "[SC_423469_1]",0) --你身上沒有澎澎卡的麻醉藥！
							return false
						end
					else
					ScriptMessage(OwnerID(),OwnerID(), 1, "[SAY_NPC_BUSY]",0) --目標正在忙碌中
					return false
					end
				
				else
				return false
				end
			else
			ScriptMessage(OwnerID(),OwnerID(), 1, "[SC_423469_4]",0) --必須先放置萊慕人購買的貨物！
			return false
			end
		end
	end
end

function LuaS_423469_PONPON()	--向澎澎卡拿麻醉藥
	LoadQuestOption( OwnerID() )
	if	(CheckAcceptQuest(OwnerID(),423469)==true )and( CheckCompleteQuest( OwnerID(),423469)==false) 	then
		if	CheckFlag( OwnerID() , 544335) ==false	then
			if	CountBodyItem(OwnerID(),208098) < 1		then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_423469_2]","LuaS_423469_PONPON_1",0)	--我需要一瓶[208098]。
			end
		end
	end	
	if	(CheckAcceptQuest(OwnerID(),423470)==true )and( CheckCompleteQuest( OwnerID(),423470)==false) 	then
		if	CheckFlag( OwnerID() , 544337) ==false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423470_0]","LuaS_423470_PONPON_1",0)	--我已經把麻醉藥放好了。
		end
	end		
end

function LuaS_423469_PONPON_1()	
	SetSpeakDetail(OwnerID(),"[SC_423469_3]")--你弄丟了？那可是我費了一番心力才弄來的好貨啊！再弄丟別怪我從你的酬勞扣哦！
	GiveBodyItem(OwnerID(),208098,1) 
end

--點擊物品後：
function Lua_423469_after()
	local NPC = SearchRangeNPC ( OwnerID() , 50 )
	for i=0,table.getn(NPC)-1 do
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) ==116157	then
			if	CheckAcceptQuest( OwnerID() , 423469) == true	and	CheckFlag( OwnerID() , 544334) ==false	then
				DelBodyItem(OwnerID(), 208099, 1 )
				SetFlag(OwnerID() , 544334, 1 )		
				return true
			end
		end	
	
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) ==116158	then
			if	CheckAcceptQuest( OwnerID() , 423469) == true	and	CheckFlag( OwnerID() , 544335) ==false	then
				WriteRoleValue( TargetID() , EM_RoleValue_Register+1 , 2 )
				DelBodyItem(OwnerID(), 208098, 1 )
				local WATER= LuaFunc_CreateObjByOBj(116160, TargetID() )				--出現演戲的土堆116160
				DisableQuest( WATER, true )
				WriteRoleValue( WATER,EM_RoleValue_Register+2,OwnerID())				--把玩家寫進演戲水
				WriteRoleValue( WATER,EM_RoleValue_Register+3,TargetID())				--把原水寫進演戲水
				BeginPlot( WATER, "Lua_423469_end" , 0 )
				return true
			end
		end
	end
end

function Lua_423469_end()
--OwnerID 演戲水
	local QWATER = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)	
	if 	CheckAcceptQuest( TargetID() , 423469) == true		and
		GetDistance(TargetID(), OwnerID() ) < 250		and 
		ReadRoleValue(TargetID() ,EM_RoleValue_IsDead) == 0	then
		SetFlag(TargetID() , 544336, 1 )					--544336判斷距離用		
		AddBuff(TargetID() , 507473, 1 , 120 )  						
	end
	BeginPlot( OwnerID() , "LuaS_423469_Range_CHECK" , 0 )			--掛演戲水迴圈檢查--玩家不在就刪除演戲水
	local WHITE = Lua_DW_CreateObj("flag" ,116161,780723,1,1)			--116161白牙、旗子編號780723、1
	DisableQuest(  WHITE , true )							--開關NPC頭上的任務提示以及對話劇情(true關閉)
	MoveToFlagEnabled( WHITE , false )
	WriteRoleValue(  WHITE ,EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( WHITE,EM_RoleValue_Register+2,OwnerID())			--把玩家寫進演戲水
	WriteRoleValue(  WHITE,EM_RoleValue_Register+3,OwnerID())			--把演戲水寫進演戲白牙
	BeginPlot(WHITE, "LuaS_423469_MO_CHECK" , 0 )	
	
	Yell( WHITE , "[SC_423469_5]" , 3 )						--萊慕：抓住你了...欺騙者......
	sleep(30)
	AddBuff(TargetID() , 507474 , 1 , 35 )  						--玩家被定住--行動不能505110
	ScriptMessage( TargetID(),TargetID(), 0,"[SC_423469_11]", 0 )
	ScriptMessage( TargetID(),TargetID(), 1,"[SC_423469_11]", 0 )			--你被突然出現的[116155]震懾，無法移動腳步！

	Yell( WHITE , "[SC_423469_6]" , 3 )						--萊慕：外族人不知道，我們擁有識破謊言的雙眼，自稱送貨...帶著惡意前來的你...詳細說出雷安卡人的意圖吧！
	DisableQuest(  WHITE , false)	
	local Time = 0
		for i = 1, 40 , 1 do							--時間到就刪除其餘NPC，回復原狀
		Time = Time + 1

			if	Time>30		then
				WriteRoleValue( QWATER  , EM_RoleValue_Register+1 , 0 )
				DelObj (OwnerID())
				if	CheckBuff( TargetID() , 507473) == true	then
					CancelBuff( TargetID() , 507473)  
				end
				if	CheckBuff( TargetID() , 507474 ) == true	then
					CancelBuff( TargetID() , 507474 )  
				end	
				ScriptMessage( TargetID() , TargetID(), 1 , "[SC_423469_10]" , 0 )	--超過時間，任務失敗！
				break
			end
			if	CheckFlag( TargetID() , 544335 ) == true 	then
				WriteRoleValue( QWATER  , EM_RoleValue_Register+1 , 0 )
				Delobj( OwnerID() )
				break		
			end
		sleep(10)
		end
end
	
function LuaS_423469_WHITE_0()--萊慕身上的對話劇情
	LoadQuestOption( OwnerID() )
	if	(CheckAcceptQuest(OwnerID(),423469)==true )and( CheckCompleteQuest( OwnerID(),423469)==false) 	then
		if 	CheckFlag( OwnerID()  , 544335) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423469_9]","LuaS_423469_WHITE_1",0)	--（告訴他實情。）
		end	
	end		
end

function LuaS_423469_WHITE_1()
	SetSpeakDetail(OwnerID(),"[SC_423469_7]")--哈！雷安卡人心地善良、無私奉獻？這真是一個值得悲泣的笑話。
					--雷安卡人真正出了名的是陰險、狡詐，輕賤生命、眼中只看得見利益，他們是連被我們稱為「朋友」的資格都沒有的種族。
					--萊慕恩人擅長武力取勝，也同樣擅長思考騙術，對付只敢躲藏在背後的小人...將計就計...比武力更容易令他們忌憚。
					--與他們同夥的你...抉擇吧，加入我的反策計畫，好或不好...
					--我認為，答案只有一個。
	
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423469_8]","LuaS_423469_WHITE_2",0)	--好。
end
	
function LuaS_423469_WHITE_2()	
	closespeak(OwnerID())
	if	CheckAcceptQuest( OwnerID(), 423469) == true	and
		CheckFlag( OwnerID(), 544336) == true		then
		CancelBuff( OwnerID(), 507474 )
		CancelBuff( OwnerID(), 507473 )
		SetFlag(OwnerID(), 544335, 1 )
	end
end

function LuaS_423469_Range_CHECK()
	local QWATER = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)	
	local play  = ReadRoleValue(OwnerID(),EM_RoleValue_Register+2)	
	local Num
	for i = 0 , 60 , 1 do
		Num = 0
			if	CheckAcceptQuest( play, 423469) == true	and
				CheckFlag( play , 544336) == true		then
				Num = Num + 1
			end
		if	Num == 0		then
			break
		end
		sleep(20)
	end
	writerolevalue(QWATER, EM_RoleValue_Register+1, 0 )
	Delobj( OwnerID() )
end

function LuaS_423469_Player_CHECK()
	if	(CheckAcceptQuest(OwnerID(),423469)==false )	then
		if 	CheckBuff( OwnerID(), 507473) == true	then
			CancelBuff( OwnerID() , 507473)  
		end
		if 	CheckBuff( OwnerID(), 507474 ) == true	then
			CancelBuff( OwnerID() , 507474 )  
		end
		return false
	end
	local WATER= {}
	WATER= SearchRangeNPC(OwnerID() , 250)
	for i=0,table.getn(WATER)-1 do
		if	ReadRoleValue(WATER[i] , EM_RoleValue_OrgID) == 116158	then
			return false
		end
		if	i == table.getn(WATER)	then
			return true
		end
	end
end

function LuaS_423469_Player_CHECK_FINAL()
	CancelBuff( OwnerID() , 507473 )
	ScriptMessage(OwnerID() , OwnerID() , 2 , "[SC_423177_10]" , 0 )	--距離太遠，任務失敗！
	ScriptMessage( OwnerID() , OwnerID(), 0 , "[SC_423177_10]" , 0 )
	SetFlag(OwnerID() , 544336, 0 )
end

function LuaS_423469_MO_CHECK()	
	local WATER = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)		--演戲水
	for i = 0 , 60 , 1 do
		if	CheckID(WATER) == false	then
			break
		end
		sleep( 20 )
	end
	Delobj( OwnerID() )
end

---------423470
--function LuaS_423470_PONPON()
--	if	(CheckAcceptQuest(OwnerID(),423470)==true )and( CheckCompleteQuest( OwnerID(),423470)==false) 	then
--		if	CheckFlag( OwnerID() , 544337) ==false	then
--			AddSpeakOption(OwnerID(),TargetID(),"[SC_423470_0]","LuaS_423470_PONPON_1",0)	--我已經把麻醉藥放好了。
--		end
--	end	
--end

function LuaS_423470_PONPON_1()	
	closespeak(OwnerID())
	SetFlag(OwnerID()  , 544337, 1 )
	BeginPlot(TargetID() , "LuaS_423470_PONPON_2" , 0 )	
end	
	
function LuaS_423470_PONPON_2()	
	AddBuff(TargetID() , 507539, 1 , 15 )  	
	local PONPON= LuaFunc_CreateObjByOBj(116163, OwnerID() )			--出現演戲的澎澎卡116163
	AddToPartition( PONPON , 0 )
	WriteRoleValue(  PONPON ,EM_RoleValue_IsWalk , 1 )
	MoveToFlagEnabled( PONPON , false )
	DisableQuest( PONPON, true )
	sleep(10)
	Yell( PONPON , "[SC_423470_1]" , 3 )						--哦！做得不錯，接下來就輪到善良的雷安卡人登場啦～
	sleep(10)
	LuaFunc_MoveToFlag(PONPON, 780723,2,0)
	Yell( PONPON , "[SC_423470_2]" , 3 )						--你要跟上我的腳步，我還需要你呢！
	LuaFunc_MoveToFlag(PONPON, 780723,3,0)
	SetFlag(TargetID() , 544339, 1 )						--544339澎澎卡的可見與否判斷
	DelObj (PONPON)	
	CancelBuff( TargetID() , 507539)  
end

--------------------423472
function LuaS_423472_PONPON()	--向澎澎卡拿袋子
	LoadQuestOption( OwnerID() )
	if	(CheckAcceptQuest(OwnerID(),423472)==true )and( CheckCompleteQuest( OwnerID(),423472)==false) 	then
		if	CheckFlag( OwnerID() , 544338) ==false	then
			if	CountBodyItem(OwnerID(),208168) < 1		then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_423472_0]","LuaS_423472_PONPON_1",0)	--你說要給我酬勞。
			end
		end
	end		
end

function LuaS_423472_PONPON_1()	
	SetSpeakDetail(OwnerID(),"[SC_423472_1]")--嗯...有一個[208168]，決定了！這份還沒確認過的物資屬於你，隨便你怎麼處置。不過你要在我旁邊打開，我也想看看裡頭裝了什麼～
	GiveBodyItem(OwnerID(),208168,1) 
end

--使用物品前檢查
function LuaS_423472_208168_1()	
	local NPC = {}

	if	CheckAcceptQuest( OwnerID() , 423472) == true	and	CheckFlag( OwnerID() , 544338) ==false	then
		 NPC = SearchRangeNPC ( OwnerID() , 250 )
		for i=0,table.getn(NPC) do
			if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) ==116170	then
				return true 
			end
			if	i==table.getn(NPC)	then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423472_2]" , 0 ) --你必須在澎澎卡.蟲眼附近打開。
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423472_2]" , 0 ) 
				return false
			end
		end
	else
	return false 
	end
end

--使用物品後
function LuaS_423472_208168_2()
	UseItemDestroy() -- 刪掉使用中的
	BeginPlot( TargetID() , "LuaS_423472_208168_3" , 0 )
end
function LuaS_423472_208168_3()
	AddBuff(TargetID() , 507540, 1 , 20 )  
	local NPC = SearchRangeNPC ( OwnerID() , 250 )
		for i=0,table.getn(NPC)-1 do
			if  ReadRoleValue(NPC[i],EM_RoleValue_OrgID) ==116171	then
				return flase
			end
		end
	local PON = Lua_DW_CreateObj("flag",116171 ,780723,4 )
	MoveToFlagEnabled( PON , false )
	DisableQuest(  PON  , false)	
	WriteRoleValue( PON ,EM_RoleValue_IsWalk , 1 )
	CastSpell( PON , PON ,  496128 )							--施法爆炸496128--494226煙塵
	ScriptMessage( TargetID() , TargetID() , 2 , "[SC_423472_3]" , 0 ) 				--轟炸聲從澎澎卡.蟲眼檢視的箱子傳來......
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423472_3]" , 0 ) 
	sleep(20)
	Yell( PON , "[SC_423472_4]" , 3 )							--澎澎卡：咳、咳！呸～～咳！			
	sleep(20)
	Yell( PON , "[SC_423472_5]" , 3 )							--澎澎卡：搞什麼？
	sleep(10)
	if	CheckID( TargetID() ) == true then							--給旗標
		SetFlag( TargetID() , 544338 , 1 )
	end
	DelObj (PON)
	CancelBuff( TargetID() , 507540)  
end


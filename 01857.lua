--======================================================================================================
--423241	問村民找長老
--======================================================================================================
function LuaS_423241_0() 	--掛在村民A
	LoadQuestOption(OwnerID())	--你是做什麼的？
	if CheckAcceptQuest(OwnerID(),423241)==true 	and
		Checkflag(OwnerID(),543936)==false			then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423241_0]","LuaS_423241_1",0)		
		--「我是從夏多爾來幫助你們的。」
	end
end

function LuaS_423241_1()	--掛在村民B
	SetSpeakDetail(OwnerID(),"[SC_423241_1]")	
	--夏多爾？我們向夏多爾求援多日，現在才跑來幾個......
	--你說你們是誰？連個正式身份也沒有的冒險者，說來幫助我們？
	--免了！我看啊，你們八成只不過是夏多爾叫來隨便瞭解一下卡雅村狀況，跑個過場的小兵罷了。
	SetFlag(OwnerID(),543936,1)	--給隱形旗標
end

function LuaS_423241_2()
	LoadQuestOption(OwnerID())	--你想幹什麼？
	if CheckAcceptQuest(OwnerID(),423241)==true 	and
		Checkflag(OwnerID(),543937)==false			then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423241_2]","LuaS_423241_3",0)	
		--「我沒有惡意，只是想幫助你們解決問題。」
	end
end

function LuaS_423241_3()
	SetSpeakDetail(OwnerID(),"[SC_423241_3]")	
	--別假惺惺了，你這番鬼話還是留著去騙村裡的另一群人吧。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423241_4]","LuaS_423241_4",0)	
	--「另一群人？」
end

function LuaS_423241_4()
	SetSpeakDetail(OwnerID(),"[SC_423241_5]")	
	--對，要不是那些〞 難民〞的出現，今天的卡雅村也不會落得這種下場，長老竟然站在他們那邊，真是老糊塗！
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423241_6]","LuaS_423241_5",0)	
	--......（這個似乎村子除了失蹤事件外，還有村莊內鬥）
end

function LuaS_423241_5()
	SetSpeakDetail(OwnerID(),"[SC_423241_7]")	
	--閃開一點！
	SetFlag(OwnerID(),543937,1)	--給隱形旗標
end
	
function LuaS_423241_6()
	LoadQuestOption(OwnerID())	--有事嗎？
	if CheckAcceptQuest(OwnerID(),423241)==true 	and
		Checkflag(OwnerID(),543938)==false			then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423241_8]","LuaS_423241_7",0)
		--「聽說村內不停有村民失蹤......」
	end
end
	
function LuaS_423241_7()
	SetSpeakDetail(OwnerID(),"[SC_423241_9]")	
	--別跟我說話，你去找艾文．條頓吧。他是村子裡的長老，卻傻傻敞開大門歡迎外來者，
	--完全不管他們是從哪個陰暗污穢的角落鑽出來的，會不會危害我們的安危，哼！（得條件旗標）
	SetFlag(OwnerID(),543938,1)	--給隱形旗標
end
	
	
function LuaS_423241_8()
	LoadQuestOption(OwnerID())	--
		if 	CheckAcceptQuest(OwnerID(),423254)== true 		and
			CheckCompleteQuest(OwnerID(),423254)== false 		and
			CheckAcceptQuest(OwnerID(),423255)==false		and
			Checkflag(OwnerID(),543933)==false		and
			CountBodyItem(OwnerID(),207311)<1				then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423254_2]","LuaS_423254_Quest1",0)
			--長老，想向您請教一件事，請問您是否聽說過[ZONE_WARNORKEN_FORT]的[115302]？
		end
		
		if 	CheckCompleteQuest(OwnerID(),423255)==true 		and
			CheckCompleteQuest(OwnerID(),423254)==false		and
			CountBodyItem( OwnerID(), 207311)<1	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423254_0]","LuaS_423254_SPEAK_1",0)
			--「長老，日記本不見了。」
		
		end
		if 	CheckAcceptQuest(OwnerID(),423241)==true 	and
			Checkflag(OwnerID(),543941)==false	and
			Checkflag(OwnerID(),543938)==true	and
			Checkflag(OwnerID(),543937)==true	and
			Checkflag(OwnerID(),543936)==true	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423241_10]","LuaS_423241_9",0)
			--「敵意......是因為失蹤事件造成村民心中的不安吧？」
		end
end

function LuaS_423241_9()
	SetSpeakDetail(OwnerID(),"[SC_423241_11]")
	--其實不單純是這個原因，我想，你之前遇見的都是些排外的村民吧，我們這個村子裡，
	--有一半的人是十多年前從瓦那多肯碉堡逃出來的難民，當時村民就分成了兩派，一派主張接納難民，
	--一派則主張拒絕他們，後來接納的聲音佔了上風，這麼多年下來，除了在某些話題上偶有小摩擦，
	--村民們相處的還算融洽，只是在失蹤案件發生後，這表面上的和諧還是因為猜忌恐懼而被幾句沒有根據的懷疑打破了。
	SetFlag(OwnerID(),543941,1)	--得任務完成旗標
end



function LuaS_423254_SPEAK_1()	
	SetSpeakDetail(OwnerID(),"[SC_423254_1]")	--「日記本不見啦？放心，剛剛有人撿到給我送來，拿去吧，小心別再弄丟啦！」
	GiveBodyItem(OwnerID(),207311,1)
end

function LuaS_423254_Quest1()
	SetSpeakDetail(OwnerID(),"[SC_423254_3]")
	--這個名字......在這裡已經很久沒有人提起了，年輕的冒險者，你怎麼會問起他呢？
	--哈哈，我不追問你為什麼想打聽[115302]，也許你曾聽過村裡某些人低語過這個名字，而勾起你的好奇心，
	--就算不是因為這樣，而是有別的原因，你也不用告訴我，能夠和年輕人聊聊，可是我這老人家最開心的事呢......
	SetFlag(OwnerID(),543933,1)	--得任務觸發旗標

end


--======================================================================================================
--423242	和村長對話
--======================================================================================================
function LuaS_423242_0()
	LoadQuestOption(OwnerID())	--陌生人，有事快說，沒事的立刻離開。
	if CheckAcceptQuest(OwnerID(),423242)==true 	and
		Checkflag(OwnerID(),543939)==false			then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423242_0]","LuaS_423242_1",0)
		--「你是村長嗎？我是從夏多爾前來支援卡雅村的冒險者。」
	end
end

function LuaS_423242_1()
	SetSpeakDetail(OwnerID(),"[SC_423242_1]")
	--哼！事情剛發生的時候，我們便派人去向夏多爾求援，但是遲遲等不到回音，
	-- 現在你說自己是從夏多爾來支援我們的冒險者？這其中的疑點太多了。
	--雖然我很不想將每個人都當成兇手看，但是在失蹤事件頻傳的現在，我無法輕易的信任一個陌生人。
	--再說，卡雅村目前不需要外來者的干預。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423242_2]","LuaS_423242_2",0) 
	--「聽說你打算一一訊問村民來調查失蹤的──」
end

function LuaS_423242_2()
	SetSpeakDetail(OwnerID(),"[SC_423242_3]")
	--是誰造謠？一定是那些嫌村子還不夠亂的瓦那多肯人，看來我該認真考慮執行他們給我的〞 建議〞。
	SetFlag(OwnerID(),543939,1)	--給勸說村長旗標
end

--======================================================================================================
--423242	任務完成後劇情		 ownerID=115108	湯尼(村長門)		村長，阿丹父母求救
--======================================================================================================
function LuaS_423242_ACT0()
						--鎖住npc
	DisableQuest( OwnerID() , true )	
	AddBuff( TargetID()  , 503977 , 1 , 300 ) 	--定住玩家

	local Arnimo = Lua_DW_CreateObj("flag" ,115092,780626,1)	--結束任務後村長消失在村長原地種此旗子
	local Older = Lua_DW_CreateObj("flag" ,115089,780626,3)
	DisableQuest( Arnimo , true )					--關閉對話
	DisableQuest( Older , true )					--關閉對話

	DW_MoveToFlag(Older,780626,5,0,1)
	
	AdjustFaceDir( Older , Arnimo,3 )
	Say(Older,"[SC_423242_ACT0]")						--阿尼莫，阿丹不見了，快組織人手把他找回來吧！
	Sleep(30)
	AdjustFaceDir( Arnimo , Older ,3 )
	Say(Arnimo,"[SC_423242_ACT6]")						--我馬上去！
	PlayMotion(Arnimo,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Sleep(30)
	DW_MoveToFlag(Arnimo,780626,6,0,1)
	Sleep(40)
	Hide(Arnimo)
	
	SetFlag(TargetID(), 543930 , 1)	--給旗標，讓發任務的長老現身
	CancelBuff( TargetID()  , 503977  ) 	--還玩家自由	
	Delobj(Older)
	Delobj(Arnimo)
	DisableQuest( OwnerID() , false)
end

function Lua_20130627_FlagAdd()
	local Player = OwnerID()
	LoadQuestOption(Player)
	if CheckCompleteQuest( Player , 423242) == true	and
	CheckFlag(Player, 543930)==false			then	
		SetFlag(Player, 543930, 1)
	end
end	


--======================================================================================================
--423243	範圍劇情*3	一個指走對、一個指走錯
--======================================================================================================
function LuaS_423243_0()	--Right way
	Setplot(OwnerID(),"range","LuaS_423243_1",50)	--設定觸發範圍：在進入該npc50內，執行LuaS_423243_1
end

function LuaS_423243_1()
	Local R=RandRange(1,3)		--設亂數
	if CheckAcceptQuest(OwnerID(),423243)== true 	and
		CountBodyItem( OwnerID(), 207305)<1			then
		--DisableQuest( TargetID() , true )					--關閉對話
		Say(TargetID(),"[SC_423243_A"..R.."]")			--依亂數來讀取string
			--A1:你們是要找阿丹那個孩子的嗎？走這邊沒錯.......巨神吶！那些"難民"就會給孩子壞影響，都是他們把阿丹帶野了。
			--A2:說不定阿丹就是被"難民"騙了，才傻傻的往灰煙森林去了，那裡很危險，好多人都在那兒失蹤的。
			--A3:村民不停的失蹤，肯定是這些"難民下的手.....冒險者，往這兒走沒錯，巨神保祐！希望你們早點把阿丹帶回來啊！
	end
	Sleep(50)
end	

function LuaS_423243_2()	--Right way
	Setplot(OwnerID(),"range","LuaS_423243_3",50)	--設定觸發範圍：在進入該npc50內，執行LuaS_423243_1
end

function LuaS_423243_3()
	Local R=RandRange(1,3)		--設亂數
	if CheckAcceptQuest(OwnerID(),423243)== true 	and
		CountBodyItem( OwnerID(), 207305)<1			then
				--DisableQuest( TargetID() , true )					--關閉對話
		Say(TargetID(),"[SC_423243_B"..R.."]")			--依亂數來讀取string
			--B1:別聽這些石頭腦袋張嘴亂說，冒險者，拜託你把阿丹找回來，去灰煙森林看看吧！
			--B2:石頭腦袋，閉嘴！冒險者，阿丹今天早上從這裡經過，早知道他.....哎！我就會阻止他了......
			--B3:都什麼時候了，這些人就只會吵.....冒險者，聽人說曾看到阿丹往這方向走，請你找到那孩子啊！
	end
	Sleep(50)
end	


function LuaS_423243_4()	--WRONG way
	Setplot(OwnerID(),"range","LuaS_423243_5",50)	--設定觸發範圍：在進入該npc50內，執行LuaS_423243_1
end	

function LuaS_423243_5()
	Local R=RandRange(1,4)		--設亂數
	if CheckAcceptQuest(OwnerID(),423243)== true 	and
		CountBodyItem( OwnerID(), 207305)<1			then
				--DisableQuest( TargetID() , true )					--關閉對話
		Say(TargetID(),"[SC_423243_C"..R.."]")			--依亂數來讀取string
			--C1:你也是來找阿丹的嗎？這個方向有那些石頭腦袋找過，你去別的地方吧...
			--C2:謝謝你幫忙找阿丹，他最怕巨獸了，怎樣都不會去卻普瑞谷地，可以請你去別的地方找找嗎？
			--C3:阿丹那孩子最怕卻普瑞谷地的巨獸傳說，不會往那兒去，你到灰煙森林看看，謝謝你了！
			--C4:我一直在這裡，到現在都沒看見阿丹，難道他往灰煙森林去啦？
	end
	Sleep(50)
end		

function LuaS_423243_6()	--WRONG way
	Setplot(OwnerID(),"range","LuaS_423243_7",50)	--設定觸發範圍：在進入該npc50內，執行LuaS_423243_1
end	

function LuaS_423243_7()
	Local R=RandRange(1,3)		--設亂數
	if CheckAcceptQuest(OwnerID(),423243)== true 	and
		CountBodyItem( OwnerID(),207305)<1			then
				--DisableQuest( TargetID() , true )					--關閉對話
		Say(TargetID(),"[SC_423243_D"..R.."]")			--依亂數來讀取string
			--D1:你也是冒險者吧？我剛從卻普瑞谷地的方向回來，沒找到那個不見的孩子。
			--D2：這個地方我找了，沒看到孩子的影子，不過啊，這村子的人也真奇怪，在這種時候還不忘彼此吵嚷....
			--D3:有傳言說村裡失蹤的人是"難民"做的，那孩子該不會也是被他們......
	end
	Sleep(50)
end	





--======================================================================================================
--423244	任務完成後劇情	螢火登場，ownerid是湯尼
--======================================================================================================
function LuaS_423244_ACT0()
	DisableQuest( OwnerID() , true )	
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register4 , TargetID() )	--配合下方的check 函式
	AddBuff( TargetID()  , 503977 , 1 , 300 ) 
	AddBuff( TargetID()  , 506812, 1 , 300 ) 
	Beginplot(OwnerID(),"LuaS_423244_AK_CHECK",0)
		
	local Jx = Lua_DW_CreateObj("flag" ,115082,780627,1)	
		DisableQuest( Jx , true )					--關閉對話
	Sleep(30)
	WriteRoleValue(Jx, EM_RoleValue_IsWalk, 1)
	Hide(Jx)
	Show(Jx,0)		--hide再show可使WriteRoleValue成功
	
	Say(Jx,"[SC_423244_ACT0]")				--村長在嗎？	
	local Arnimo = Lua_DW_CreateObj("flag" ,115266,780627,2)
		DisableQuest( Arnimo , true )					--關閉對話

	Sleep(20)
	WriteRoleValue(Arnimo, EM_RoleValue_IsWalk, 1)
	
	Hide(Arnimo)
	Show(Arnimo,0)		--hide再show可使WriteRoleValue成功	
	DW_MoveToFlag(Jx,780627,3,0,1)
	Adjustfacedir(Jx,Arnimo,0)
	Adjustfacedir(Arnimo,Jx,0)
	Beginplot(Arnimo,"LuaS_423244_ACT1",0)
	Sleep(30)
	Say(Arnimo,"[SC_423244_ACT1]")						--找到人了嗎？...你是誰？算了，我現在沒空理你。
	PlayMotion(Arnimo,ruFUSION_ACTORSTATE_EMOTE_SPEAK)	--搖手
	Sleep(30)
	Say(Jx,"[SC_423244_ACT2]")							--一個孩子不見了。
	Sleep(30)
	Say(Arnimo,"[SC_423244_ACT3]")						--是的，阿丹他......莫非、莫非你知道阿丹他在哪裡？
	Sleep(30)
	Say(Jx,"[SC_423244_ACT4]")							--他是你最珍視的寶貝嗎？
	Sleep(30)
	Say(Arnimo,"[SC_423244_ACT5]")						--陌生人，如果你是來找麻煩的，請快點離開。
	PlayMotion(Arnimo,ruFUSION_ACTORSTATE_PARRY_1H)	--揮手
	Sleep(30)
	Say(Jx,"[SC_423244_ACT6]")							--我是寶藏獵人，不找麻煩，只幫人尋找珍貴的事物。
	Sleep(30)
	Say(Arnimo,"[SC_423244_ACT7]")						--是，他是我最重要的外甥，請幫我把他找回來吧！
	PlayMotion(Arnimo,ruFUSION_ACTORSTATE_EMOTE_SPEAK)	--說話pose
	Say(Jx,"[SC_423244_ACT8]")							--米奧。
	local Mio = Lua_DW_CreateObj("flag" ,115093,780627,5)
		DisableQuest( Mio , true )					--關閉對話
	local Dan = Lua_DW_CreateObj("flag" ,115094,780627,6)
		DisableQuest( Dan , true )					--關閉對話
	Sleep(20)
	WriteRoleValue(Mio, EM_RoleValue_IsWalk, 1)
	WriteRoleValue(Dan, EM_RoleValue_IsWalk, 0)
	
	Hide(Mio)
	Show(Mio,0)		--hide再show可使WriteRoleValue成功
	Hide(Dan)
	Show(Dan,0)		--hide再show可使WriteRoleValue成功
	
	DW_MoveToFlag(Dan,780627,7,0,1)
	Beginplot(Mio,"LuaS_423244_ACT2",0)
--	Sleep(30)
	
	Say(Dan,"[SC_423244_ACT9]")						--舅舅！
	Sleep(30)
	AdjustFaceDir( Mio, Arnimo,3 )
	Say(Arnimo,"[SC_423244_ACT10]")						--阿丹！.....這位女士，謝謝你。
	PlayMotion(Arnimo,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)	--蹲下
	Sleep(30)
	Say(Jx,"[SC_423244_ACT11]")							--不用謝，你得為此付出金幣，米奧。
	Sleep(30)
	Say(Mio,"[SC_423244_ACT12]")						--是。
	Beginplot(Jx,"LuaS_423244_ACT3",0)
	--DW_MoveToFlag(Mio,旗,旗號,0,1)
	Sleep(30)
	AdjustFaceDir( Arnimo,Mio, 3 )
	AdjustFaceDir( Mio, Arnimo,3 )
	Say(Mio,"[SC_423244_ACT13]")						--村長，請和我談談尋找寶物的價碼。
	PlayMotion(Mio,ruFUSION_ACTORSTATE_EMOTE_SPEAK)	--做請的pose
	Sleep(30)
	Say(Arnimo,"[SC_423244_ACT14]")						--阿丹，快跟我來。
	
	Beginplot(Arnimo,"LuaS_423244_ACT4",0)
	Sleep(10)
	Beginplot(Mio,"LuaS_423244_ACT1",0)
	Beginplot(Dan,"LuaS_423244_ACT4",0)
	Sleep(40)
	Delobj(Arnimo)
	Delobj(Mio)
	Delobj(Dan)
	Delobj(Jx)
	
	local P = {}
	P = SearchRangePlayer(OwnerID() , 350)	--搜尋附近玩家
	For i=0,table.getn(P)-1 do
		if	CheckAcceptQuest( P[i], 423244 )==true	then
			SetFlag(P[i] , 543942 , 1)	--給下一個任務的前置旗標
		end
	end
	CancelBuff( TargetID()  , 503977   )
	CancelBuff( TargetID()  , 506812   )
	DisableQuest( OwnerID() , false )
	
end


function LuaS_423244_ACT1()
	DW_MoveToFlag(OwnerID(),780627,4,0,1)
end	

function LuaS_423244_ACT2()
	DW_MoveToFlag(OwnerID(),780627,8,0,1)
end	

function LuaS_423244_ACT3()
	DW_MoveToFlag(OwnerID(),780627,9,0,1)
	Sleep(30)
	Hide(OwnerID())
end	

function LuaS_423244_ACT4()
	DW_MoveToFlag(OwnerID(),780627,10,0,1)
	Sleep(30)
	Hide(OwnerID())
end	

function LuaS_423244_AK_CHECK()
local Player = ReadRoleValue(OwnerID(),EM_RoleValue_Register4 )	
	for i = 0 , 100 , 1 do
		if	CheckAcceptQuest( Player, 423244)==false		and	
			CheckBuff( Player , 506812) == true		then
			break
		end
		if	CheckBuff( Player , 506812) == false		then
			break
		end
		sleep( 20 )
	end
	CancelBuff( Player  ,506812  )
	CancelBuff( Player  ,503977   )	
end

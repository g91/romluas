	
--======================================================================================================
--423245	和阿丹對話
--======================================================================================================
function LuaS_423245_0()
	LoadQuestOption(OwnerID())
	--爸爸剛剛打我屁股，說我不應該跑到灰煙森林裡去，好痛喔！
	if CheckAcceptQuest(OwnerID(),423245)==true 	and
		Checkflag(OwnerID(),543943)==false			then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423245_0]","LuaS_423245_1",0)
		--「為什麼你要一個人去那裡？」
	end
end
		
function LuaS_423245_1()
	SetSpeakDetail(OwnerID(),"[SC_423245_1]")
	--人馬不都住在森林嗎？我要像潔妮．吉昂特一樣，和人馬學習弓術，
	--成為好厲害的神箭手，舅舅阿尼莫最崇拜她了，可是舅舅阿尼莫最近心情不好，
	--大家都以為我年紀小，什麼都不知道，不過其實我知道喔！
	--舅舅對潔妮．吉昂特的子孫，就是夏多爾的人，不來幫我們找壞人捉壞人，
	--覺得很難過，我就想，如果我是神箭手，就能幫舅舅了...... 
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423245_2]","LuaS_423245_2",0)
	--「你還記得你是怎麼被人找到的嗎？」
end

function LuaS_423245_2()
	SetSpeakDetail(OwnerID(),"[SC_423245_3]")
	--那時候啊，我躲在一棵大樹和大石頭後面，看到一群穿著一樣衣服的人，和長的怪怪的獸人打架，
	--後來獸人打輸就全部被抓走......然後我的眼前就黑黑的，好像睡著了，醒來的時候，已經和米奧回到村子裡了。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423245_4]","LuaS_423245_3",0)
	--「發現自己在陌生人身邊醒來，你怕不怕？」
end

function LuaS_423245_3()
	SetSpeakDetail(OwnerID(),"[SC_423245_5]")
	--我不怕米奧和螢火姐姐，因為他們是好人，米奧說，如果那些士兵發現我，
	--會連我都一起捉走......那個，村子裡不見的人也是他們捉的嗎？
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423245_6]","LuaS_423245_4",0)
	--「我不知道，不過，我會努力找到答案的。」
end

function LuaS_423245_4()
	SetSpeakDetail(OwnerID(),"[SC_423245_7]")
	--那和我打勾勾，約好了喔！
	SetFlag(OwnerID(),543943,1)	--得到任務完成旗標
end




--======================================================================================================
--423246	玩家踏入，捉人的士兵跳出攻擊
--======================================================================================================
function LuaS_423246_0()	--種透明物件115265，掛範圍劇情
	Setplot(OwnerID(),"range","LuaS_423246_1",50)	--設定觸發範圍：在進入該npc50內，執行Lua
end	

function LuaS_423246_1()	--OWNER是玩家
	Setplot(OwnerID(),"range","",0)

	if CheckAcceptQuest(OwnerID(),423246)== true 	and
		ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==0	and
		CountBodyItem( OwnerID(), 207307)<1			then
		Beginplot(TargetID(),"LuaS_423246_2",0)
	end
	Setplot(OwnerID(),"range","LuaS_423246_1",100)
end

function LuaS_423246_2()	--OwnerID是115265

	Setplot(OwnerID(),"range","",0)

	Local player="here"
	local R=RandRange(1,5)
	local So = LuaFunc_CreateObjByObj( 103558 , OwnerID() )	--種透明物件處直接生出打人的怪
	--		DisableQuest( So , true )					--關閉對話
	Yell(So,"[SC_423246_"..R.."]",1)
	SetAttack(So , TargetID())
	
	while 1 do

		if 	GetDistance( TargetID(), OwnerID()) >300   or
			ReadRoleValue(TargetID() , EM_RoleValue_IsDead)==1 	or
			CheckID(TargetID()) == false	then
			player="Nothere"
			break	
		end
		if 	CheckID(So) == false	then
			break
		end
		Sleep(10)
	end
	
	if player=="Nothere" then
		Sleep(50)
		delobj(So)
	end
	Setplot(OwnerID(),"range","LuaS_423246_1",50)
end




--======================================================================================================
--423247	和女畫家薇朵卡對話
--======================================================================================================
function LuaS_423247_0()	
	LoadQuestOption(OwnerID())
	--美麗的畫作能夠讓看畫的人心情愉快，你同意我的話嗎？
	if CheckAcceptQuest(OwnerID(),423247)==true 	and
		Checkflag(OwnerID(),543944)==false			then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423247_0]","LuaS_423247_1",0)
		--「我同意。請問你是薇朵卡．潔兒嗎？請看這個指環。」
	end
end
		
function LuaS_423247_1()
	if  CountBodyItem(OwnerID(),207307)==1			and
		CountBodyItem(OwnerID(),206403)==1			then
		SetSpeakDetail(OwnerID(),"[SC_423247_1]")
		--玉牡丹、鐵薔薇、水蓮花，這個指環是沾了哪朵花的芳香？
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423247_2]","LuaS_423247_2",0)	--「是玉牡丹吧。」
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423247_3]","LuaS_423247_3",0)	--「是鐵薔薇吧。」
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423247_4]","LuaS_423247_4",0)	--「是水蓮花吧。」
	else
		Beginplot(OwnerID(),"LuaS_423247_7",0)
	end
	
end	
	
function LuaS_423247_2()
	SetSpeakDetail(OwnerID(),"[SC_423247_5]")
	--有趣的答案，牡丹是花中王者，它的芳香只會纏繞在王冠或者權杖之上。
	--你再想想，誰是指環的主人，想清楚之後再過來找我。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423247_6]","LuaS_423247_5",0)
	--(想想再過來)
end
	
function LuaS_423247_3()
	SetSpeakDetail(OwnerID(),"[SC_423247_7]")
	--把指環收起來，再把東西拿給我，等我把它處理好會直接送給指環的原主人，你可以走了。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423247_8]","LuaS_423247_6",0)
	--(將指環交給薇朵卡．潔兒)
end
	
function LuaS_423247_4()
	SetSpeakDetail(OwnerID(),"[SC_423247_9]")
	--奇特的選擇，蓮花生於水中，纖弱脫俗，它的芳香只為自己散發。
	--你再想想，誰是指環的主人，想清楚之後再過來找我。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423247_6]","LuaS_423247_5",0)
	--(想想再過來)
end
	
function LuaS_423247_5()
	CloseSpeak(OwnerID())	--關掉對話頁面
end

function LuaS_423247_6()
	CloseSpeak(OwnerID())
	SetFlag(OwnerID(),543944,1)	--得到任務完成旗標
	DelBodyItem(OwnerID(),207307,1)		--刪除背包中的密信

end

function LuaS_423247_7()
	CloseSpeak(OwnerID())
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_110497_5]" , 0 )
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_110497_5]" , 0 )
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_QUESTSTRING_09]" , 0 )
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_QUESTSTRING_09]" , 0 )
end
	




--======================================================================================================
--423249	捕捉乓骨
--======================================================================================================
function LuaI_423249_207308_Check()		--掛在物品使用下的<檢查lua>之下。
	local OrgID = 0
	if CheckAcceptQuest( OwnerID() , 423249 ) == false or CountBodyItem( OwnerID() , 207309 ) >= 10 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206446_0]" , 0 ) --你不需要使用此物品
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206446_0]" , 0 )
		return false
	end

	if CheckID( TargetID() ) == true then
		OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	end
	
	if OrgID == 0 or ( OrgID ~= 103595 ) or CheckBuff( TargetID() , 504004 ) == true then
		if OrgID == 103595 then
			if ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1 then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423249_0]" , 0 ) --死亡的乓骨無法圈養
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423249_0]" , 0 )
				return false
			else
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423249_1]" , 0 ) --光憑[207308]可能無法困住[103595]
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423249_1]" , 0 )
				return false
			end
		end
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423249_2]" , 0 ) --此物品必須對[103595]使用
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423249_2]" , 0 )
		return false
	end
	if 	ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423249_0]" , 0 ) --死亡的乓骨無法圈養
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423249_0]" , 0 )
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_HP ) > 0.5*ReadRoleValue( TargetID() , EM_RoleValue_MaxHP ) then
--		local Str = "[SC_206446_5][$SETVAR1="..GetName(TargetID()).."]"
		ScriptMessage( OwnerID() , OwnerID() , 1 ,"[SC_423249_3]" , 0 ) --你試圖制服[103595]，但牠極力掙開了。
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423249_3]" , 0 )
		if HateListCount( TargetID() ) == 0  then
			SetAttack( TargetID() , OwnerID() )
		end
		return false
	end
	return true
end

function LuaI_207308_Use()	--掛在<使用效果類型:server端劇情>下的使用效果下
	if GiveBodyItem( OwnerID() , 207309 , 1 ) then
		AddBuff( TargetID() , 504004 , 0 , 3 )
		UseItemDestroy( OwnerID() )
	end
	ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_423249_4]" , 0 ) --你成功捕捉到一隻[103595]！
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423249_4]" , 0 )
	CallPlot(TargetID(),"LuaFunc_ResetObj",TargetID())
end

--完成任務後
function LuaS_423249_USECHECK()	--掛在任務完成
	if	 CountBodyItem( TargetID(), 207308)>0	 then 
		 DelBodyItem( TargetID(), 207308, 1 )
	end
	
end



--======================================================================================================
--423251	接下任務後劇情		少年傳話
--======================================================================================================

function LuaS_423251_ACT0()	
	AddBuff( TargetID()  , 503977 , 1 , 300 ) 				--凍住玩家
	local boy = Lua_DW_CreateObj("flag" ,115095,780628,1)
	DisableQuest( boy , true )					--關閉對話
	DW_MoveToFlag(boy,780628,2,0,1)
	
	AdjustFaceDir( boy, TargetID(),3 )
	Sleep(30)
	Say(boy,"[SC_423251_ACT0]")
	--就是你，曾經在灰煙森林裡和奇怪的人交手吧？有人在村外打聽你的事，說想找你聊一聊。
	Sleep(40)
	AdjustFaceDir( OwnerID(), TargetID(),3 )
	Say(OwnerID(),"[SC_423251_ACT1]")
	--嗯......你去看看吧，說不定會得到什麼新的線索。
	Sleep(30)
	Say(boy,"[SC_423251_ACT2]")
	--我話己經帶到，去不去隨便你。
	Sleep(30)
	DW_MoveToFlag(boy,780628,3,0,1)
	SetFlag(TargetID(),544010,1)	--得到旗標(開啟下個任務）
	CancelBuff( TargetID()  , 503977  ) 		--還玩家自由


	Delobj(boy)
end


	

--======================================================================================================
--423251	和夜梟在卡雅村外對話
--======================================================================================================
function LuaS_423251_0()	
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),423251)==true	and
		Checkflag(OwnerID(),543931)==false			then
		
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423251_0]","LuaS_423251_1",0)
			--「請問，你找我有事嗎？」
		
	end
end

function LuaS_423251_1()
	SetSpeakDetail(OwnerID(),"[SC_423251_1]")
	--聽說你曾經到灰煙森林，遇到一些士兵，說說他們的樣子。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423251_2]","LuaS_423251_2",0)
	--「他們的制式盔甲很尋常，就連武器也很普通。」
end

function LuaS_423251_2()
	SetSpeakDetail(OwnerID(),"[SC_423251_3]")
	--你見過他們的武器，可以形容一下嗎？

	AddSpeakOption(OwnerID(),TargetID(),"[SC_423251_4]","LuaS_423251_3",0)
	--「這裡有一柄他們遺落的鐵劍。」

end

function LuaS_423251_3()
	if 	CountBodyItem(OwnerID(),207306)==1			then
		SetSpeakDetail(OwnerID(),"[SC_423251_5]")
		--嗯，這的確是一把很平凡的鐵劍，不過，出現在這塊區域就不平常了。這裡缺乏鐵器，拿著鐵劍雖不少見，但會將鐵劍丟棄的少之又少，除非他來自一個不缺乏這種裝備的地方，一般的私兵絕對沒有這種條件，只可能是......(夜梟將纏在劍柄上沾滿乾涸暗紅血跡的布條解開，看向晨星)果然，是代表瓦納多肯的徽記。
		--晨星，我們需要和你的朋友談談。	(給任務旗標，以觸發下個任務)
		DelBodyItem(OwnerID(),207306,1)		--刪除背包中的鐵劍
		SetFlag(OwnerID(),543931,1)	--得到旗標(開啟下個任務）
	else
		Beginplot(OwnerID(),"LuaS_423251_4",0)
	end
end

function LuaS_423251_4()
	CloseSpeak(OwnerID())
	ScriptMessage(OwnerID(), TargetID() , 0 , "[SC_110497_5]" , 0 )
	ScriptMessage(OwnerID(), TargetID() , 1 , "[SC_110497_5]" , 0 )

end

--======================================================================================================
--423252	任務接受後劇情		湯尼，晨星、夜梟告知是瓦納多肯捉人的
--======================================================================================================



function LuaS_423252_ACT0()
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register4 , TargetID() )
	AddBuff( TargetID()  , 506805 , 1 , 300 ) 	--定住玩家
	Beginplot(OwnerID(),"LuaS_423252_AK_CHECK",0)
	DisableQuest( OwnerID() , true )	

	local Star = Lua_DW_CreateObj("flag" ,115085,780629,1)
	local Cral = Lua_DW_CreateObj("flag" ,115084,780629,2)
	local Ton = LuaFunc_CreateObjByObj( 115119 , OwnerID() )


	DisableQuest( Star , true )					--關閉對話
	DisableQuest(Cral  , true )					--關閉對話
	DisableQuest( Ton , true )					--關閉對話
	AdjustFaceDir(  OwnerID() , Star ,3 )
--		AddBuff( TargetID()  , 506805 , 1 , 300 ) 	--定住玩家
--	Hide(OwnerID())
	Beginplot(Star,"LuaS_423252_ACT1",0)
	Beginplot(Cral,"LuaS_423252_ACT2",0)
	Sleep(60)
--	AdjustFaceDir( Star , OwnerID() ,3 )
--	AdjustFaceDir( Cral , OwnerID() ,3 )
	PlayMotion(Star,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say(Star,"[SC_423252_ACT0]")						--湯尼，我看見憤怒的火焰在你的眼中燃燒，怎麼啦？不歡迎我嗎？
	Sleep(30)
	AdjustFaceDir(  Ton , Star ,3 )
	
	PlayMotion(Ton,ruFUSION_ACTORSTATE_EMOTE_SPEAK)		--說話的pose
	Say(Ton,"[SC_423252_ACT1]")							--不，我氣的不是你，是那些任意捉人的混帳！
	Sleep(30)
	
	PlayMotion(Cral,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say(Cral,"[SC_423252_ACT2]")						--看來[$playername]已經告訴你了，不過就算我不說，你們遲早也推敲的出來。 
	Sleep(40)
	
	PlayMotion(Cral,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say(Cral,"[SC_423252_ACT3]")						--你們撿到的命令信有瑪拉琪的署名，她是瓦那多肯現任的執政官。
	Sleep(30)
	
	PlayMotion(Ton,ruFUSION_ACTORSTATE_USE	)	--揮手
	Say(Ton,"[SC_423252_ACT4]")							--能提早知道更好，現在只要揮軍將瓦那多肯堡踏平，這片土地將重獲原有的平靜。
	Sleep(50)
	
	PlayMotion(Cral,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say(Cral,"[SC_423252_ACT5]")						--這就是你解決問題的方法？
	Sleep(20)
	
	PlayMotion(Cral,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say(Cral,"[SC_423252_ACT6]")						--你不先了解瓦那多肯堡的現況、主導捉人行動的是誰，以及捉人的背後原因，就要直訴諸武力，簡直就像蒙著眼睛摘蜂巢一樣盲──
	Sleep(50)
	
--	ScriptMessage(OwnerID(), TargetID() , 0 , "[SC_423252_ACT7]" , 0 )	--(湯尼打斷夜梟的話)
--	ScriptMessage(OwnerID(), TargetID() , 1 , "[SC_423252_ACT7]" , 0 )	--(湯尼打斷夜梟的話)
	
	PlayMotion(Ton,ruFUSION_ACTORSTATE_SHIELD_BASH)		--拍胸口 
	Say(Ton,"[SC_423252_ACT8]")							--瓦那多肯堡只是小小領主國，能抵擋得了我達拉尼斯最精銳的獅心騎士團，加上鐵壁艾翁及千羽夏多爾的大軍嗎？
	Sleep(50)
	
	PlayMotion(Cral,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)			--揮手
	Say(Cral,"[SC_423252_ACT9]")						--戰爭永遠是最後的手段，再強大的武器，都不會是解決問題的最好方法。
	Sleep(30)
	
	PlayMotion(Cral,ruFUSION_ACTORSTATE_UNHOLSTER)
	Say(Cral,"[SC_423252_ACT10]")						--不知所謂的出征，將造成無謂的犧牲！
	Sleep(30)
	
	Say(Ton,"[SC_423252_ACT11]")						--不知所謂？
	Sleep(10)
	
	PlayMotion(Ton,ruFUSION_ACTORSTATE_EMOTE_POINT)	--揮手
	Say(Ton,"[SC_423252_ACT12]")						--罪名是捉捕無辜人民，罪證則有瑪拉琪的命令信還有你的證詞，還有什麼疑慮？拔除毒瘤，當然得用雷霆手段
	Sleep(50)
	
	DW_MoveToFlag(Cral,780629,5,0,1)	--轉身
	Sleep(20)
	
	PlayMotion(Cral,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Say(Cral,"[SC_423252_ACT13]")						--哼！只有一直被保護在王宮內的王，才會輕易說出這種輕賤人民性命的話！
	Sleep(30)
	
	AdjustFaceDir(  Star ,Cral , 3 )
	DW_MoveToFlag(Cral,780629,6,0,1)	--走遠
	Hide(Cral)
	PlayMotion(Ton,ruFUSION_ACTORSTATE_EMOTE_POINT)
	Say(Ton,"[SC_423252_ACT14]")	--你...站住！
	

		if	CheckAcceptQuest( TargetID(), 423252 )==true	and
			CheckBuff( TargetID() , 506805) == true		then

			SetFlag(TargetID() , 543932 , 1)	--給下一個任務的前置旗標，令發任務的晨星出現，下面任由湯尼碎唸，玩家可不予理會，直接接任務
			SetFlag(TargetID() , 544038 , 1)
		end
	
	CancelBuff( TargetID()  , 506805  ) 	--還玩家自由
	Hide(Star)

	Sleep(30)	
	Delobj(Cral)
	Delobj(Star)
--	Show(OwnerID(),0)
	
	writerolevalue( OwnerID() , EM_RoleValue_PID , 0 )	--因為在判斷函式裡function LuaS_423253_Check裡設為1，為使下一位玩家好繼任務，記得設回為0
	Delobj(Ton)
	DisableQuest( OwnerID() , false )	
end

function LuaS_423252_ACT1()
	DW_MoveToFlag(OwnerID(),780629,3,0,1)
end

function LuaS_423252_ACT2()
	DW_MoveToFlag(OwnerID(),780629,4,0,1)
end

function LuaS_423252_AK_CHECK()
local Player = ReadRoleValue(OwnerID(),EM_RoleValue_Register4 )	
	for i = 0 , 100 , 1 do
		if	CheckAcceptQuest( Player, 423252 )==false		and	
			CheckBuff( Player , 506805) == true		then
			break
		end
		if	CheckBuff( Player , 506805) == false		then
			break
		end
		sleep( 20 )
	end
	CancelBuff( Player  , 506805  )	
end

--======================================================================================================
--423253
--======================================================================================================
function LuaS_423253_0()
	LoadQuestOption(OwnerID()) 	--沒有人可以看輕我！
	if CheckAcceptQuest(OwnerID(),423253)==true 	and
		Checkflag(OwnerID(),543947)==false			then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423253_0]","LuaS_423253_1",0)
		--「晨星讓我問你，是否還記得豹與稚鳥的故事？」
	end
		
	if 	CheckAcceptQuest(OwnerID(),423252)==true	and		
		CheckCompleteQuest(OwnerID(),423252)==false	and
		Checkflag(OwnerID(),543932)==false	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423252_TON1]","LuaS_423252_TON1",0)
	end
end

function LuaS_423253_Check()		--判斷掛劇情演出的npc是否忙碌中，如果不忙則演出劇情，忙則送他一句話，請他等待，掛在連接演出script的當段函式
	if	ReadRoleValue( TargetID() ,EM_RoleValue_PID ) == 0	then
		writerolevalue( TargetID() , EM_RoleValue_PID , 1 )
		BeginPlot( TargetID() , "LuaS_423252_ACT0" , 0 )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[GATHER_MSG_OBJBUSY]")			--目標正在忙碌中。
	end
end



function LuaS_423252_TON1()
	SetSpeakDetail(OwnerID(),"[SC_423252_TON2]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423252_TON3]","LuaS_423253_Check",0)
end




function LuaS_423253_1()
	SetSpeakDetail(OwnerID(),"[SC_423253_1]")
	--怎麼突然問起這個？還記得大概，就是森林之主豹遇見一隻孱弱的沒毛稚鳥，好笑的是，]
	--豹居然帶牠回家認作兒子，然後...我想想 ...豹為了維護森林裡子民的平安，到處去挑戰怪獸，
	--稚鳥在豹和森林其他小動物的照顧下，過著幸福的日子。
	--直到有一天，豹突然瘋了，牠尖銳的利牙對牠的子民張開，還下令要宰了稚鳥，然後一隻猴子老臣跳出來，
	--冒死把稚鳥偷偷送走，稚鳥在悲傷、困惑下離開森林，日復一日，想找出豹改變的原因，
	--牠開始積蓄自己的力量，學會在最黑的夜裡潛伏，成為一隻眼光銳利的梟......
	--(卡拉維說到這裡，若有所思的瞥了晨星一眼)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423253_2]","LuaS_423253_2",0)
	--「這是全部的故事？」
end

function LuaS_423253_2()
	SetSpeakDetail(OwnerID(),"[SC_423253_3]")
	--不，還沒說到最後。
	--在只有微光的夜交接至日的時刻，一顆星星指引了梟，帶牠找到流有奇異血脈的人，因為牠要找的答案，
	--只有在與這個人同行之後，才會被揭開......晨星，這是夜梟的故事吧？
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423253_4]","LuaS_423253_3",0)
	--「是這樣的嗎？」
end
	
function LuaS_423253_3()	--關閉對話頁面，開始劇情演出
	CloseSpeak(OwnerID())
	Beginplot(TargetID(),"LuaS_423253_4",0)
end	
	
function LuaS_423253_4()
	DisableQuest( OwnerID() , true )		
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register4 , TargetID() )
	AddBuff( TargetID()  , 506806 , 1 , 300 ) 	--定住玩家
	Beginplot(OwnerID(),"LuaS_423253_AK_CHECK",0)
	local Star = Lua_DW_CreateObj("flag" ,115267,780629,3)
	local Ton = LuaFunc_CreateObjByObj( 115439 , OwnerID() )
		DisableQuest( Ton , true )					--關閉對話
			DisableQuest(Star , true )				--關閉對話
--	Setflag(TargetID(),544039,1)					--給看不見115130湯尼的旗標		
--	Hide(OwnerID())
--	SetFlag(TargetID(),543946,1)		--給旗標，讓原來的晨星client起作用，此旗標在下個任務會回收，所以設旗標要雙重條件
	
	Sleep(30)
	WriteRoleValue(Star, EM_RoleValue_IsWalk, 1)
	Hide(Star)
	Show(Star,0)		--hide再show可使WriteRoleValue成功	
	
	PlayMotion(Star,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say(Star,"[SC_423253_5]")
	--呵呵，就像故事中所說的，稚鳥成長為剽悍的夜梟啦。
	Sleep(30)
	
	PlayMotion(Ton,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Say(Ton,"[SC_423253_6]")
	--怪不得他反應這麼大，晨星，如果是以前的我，大概會因此放棄出兵的念頭，但是現在......我需要想一想。	
	Sleep(40)
	
	PlayMotion(Star,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say(Star,"[SC_423253_7]")
	--為了朋友，就算什麼也不做，任憑時光從指縫間流逝，也並非是毫無收穫的啊，呵呵。
	Sleep(40)
	
	AdjustFaceDir(  Ton ,TargetID() , 3 )
	Sleep(50)
	AdjustFaceDir(  Ton ,Star , 3 )
	Say(Ton,"[SC_423253_8]")
	--PlayMotion(Ton,ruFUSION_ACTORSTATE_SLUMBER_END)
	
	PlayMotion(Ton,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	--好吧，我試著想想，有沒有出征以外的方式可以解決瓦那多肯堡的問題。
	Sleep(40)
	
	PlayMotion(Ton,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say(Ton,"[SC_423253_9]")
	--不過，雖然我同情夜梟，但是村民不停被捉是事實，如果情形開始變糟，我仍會帶著大軍前去瓦那多肯堡。
	Sleep(50)
	
	PlayMotion(Star,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say(Star,"[SC_423253_10]")
	--呵，那一天是否到來，現在還沒有任何徵兆呢。
	Sleep(40)
	
	PlayMotion(Star,ruFUSION_ACTORSTATE_EMOTE_KISS)	
	Say(Star,"[SC_423253_11]")
	--現在讓我們先暫時分別吧，我的朋友，相信我，這不會太久的。

	Sleep(40)
	DW_MoveToFlag(Star,780629,6,0,1)
	Delobj(Star)
--	Show(OwnerID(),0)


if	CheckAcceptQuest( TargetID(), 423253 )==true	and
	CheckBuff( TargetID() , 506806) == true		then
		SetFlag(TargetID(),543947,1)
end

--	Setflag(TargetID(),544039,0)
	Delobj(Ton)
	CancelBuff( TargetID()  , 506806  ) 	--還玩家自由
	DisableQuest( OwnerID() , false )	
	
end

function LuaS_423253_AK_CHECK()
local Player = ReadRoleValue(OwnerID(),EM_RoleValue_Register4 )	
	for i = 0 , 100 , 1 do
		if	CheckAcceptQuest( Player, 423253 )==false		and	
			CheckBuff( Player , 506806) == true		then
			break
		end
		if	CheckBuff( Player , 506806) == false		then
			break
		end
		sleep( 20 )
	end
	CancelBuff( Player  , 506806  )	
end	
	
	
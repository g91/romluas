-----獅魚人死亡劇情，給予史詩三開頭旗標543439

function LuaS_102797()  
	local Party = LuaFunc_PartyData(TargetID())
	for i = 1 , Party[0] , 1 do
		if 	GetDistance(Party[i] , TargetID() ) < 200 and 
			ReadRoleValue(Party[i] ,EM_RoleValue_IsDead) == 0 then
				SetFlag(Party[i] , 543439 , 1)	
		end
	end
	return true
end


--422775解救古布斯	所需編號：古布斯113634	達拉斯113635	泉水藥劑206140
function LuaI_113634_0()
	SetPlot( OwnerID() , "range" , "LuaI_113634_1" , 120 )
end

function LuaI_113634_1()
	if CheckFlag( OwnerID() , 543439 ) == false then
		if LuaFunc_SearchNPCbyOrgID( TargetID() ,102797, 50 ) ~= -1 then
			Tell( OwnerID() , TargetID() , "[SC_422775_PRE]" )
		end
	end
end

function LuaS_422775_0()  
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422775)== true )and( CheckCompleteQuest( OwnerID(),422775)== false) 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422775_0]","LuaS_422775_1",0) 	--需要我幫你什麼忙？古布斯。
	end

	if (CheckAcceptQuest(OwnerID(),422775)== true )and( CheckCompleteQuest( OwnerID(),422775)== false) 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422775_2]","LuaS_422775_2",0)		 --古布斯，你為何不先使用泉水藥劑來治療自己的腳？	
	end


end

function LuaS_422775_1()
	SetSpeakDetail(OwnerID(),"[SC_422775_1]")						--古布斯正要把泉水藥劑送去給達拉斯，他就在魚嘴灣上方的警備駐紮營地旁
	if	CountBodyItem( OwnerID(), 206140)<1	then
		GiveBodyItem( OwnerID(), 206140, 1 )	
	end
	AddSpeakOption(OwnerID(),TargetID(),"[SC_113495_16]","LuaS_422775_0",0)		--詢問其他問題
end


function LuaS_422775_2()
	SetSpeakDetail(OwnerID(),"[SC_422775_3]")						--大好人，謝謝你為古布斯著想，你果真是個大好人！
end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------422776
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------妖精的禮物？	
--422776 妖精的禮物？	所需編號：凡瑞娜絲警備隊員113641	凡瑞娜絲警備隊員113642	堅固的木箱113662	泉水藥劑113644	旗子780451(1-4)	780452(1-3)

function LuaS_422776_CHECK()  		--掛在點擊物品後<113662堅固的木箱>，成功，給予完成旗標，引發後續劇情

	if ReadRoleValue( TargetID() ,EM_RoleValue_Register  ) == 0 then
		if (CheckAcceptQuest(OwnerID(),422776)==true )and( CheckCompleteQuest( OwnerID(),422776)==false)	then
			if (CountBodyItem( OwnerID(),206140) >0) and(CheckFlag( OwnerID(), 543382 )==false)	then
				return true	
			end
			if (CountBodyItem( OwnerID(),206140) <1) and(CheckFlag( OwnerID(), 543382 )==false)		then
				ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_422776_0]" , 0 )		--你沒有泉水藥劑206140
				return false
			end
			if CheckFlag( OwnerID(),543382 )== true	  	then	
				ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_422776_1]" , 0 )		--你已經放過泉水藥劑206140
				return false
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_TARGETBUSY_DW]" , 0 )			--目標執行劇情中！
		return false
	end
end

function LuaS_422776_0()  
	DelBodyItem( OwnerID(), 206140, 1 )
	AddBuff( OwnerID() , 505033 , 10 , -1 )
	SetFlag( OwnerID() , 543382  , 1 )
	if ReadRoleValue( TargetID() ,EM_RoleValue_Register  ) == 0 then
		BeginPlot( TargetID() , "LuaS_422776_1" , 0 )				--執行隊員閒聊劇情
	end
	return true
end	
-----------------

function LuaS_422776_1()  									--OwnerID是木箱.TargetID是玩家
	WriteRoleValue(  OwnerID() , EM_RoleValue_Register , 1 )		
	local Aa = Lua_DW_CreateObj("flag" ,113641,780451,2 ) 					--種出阿甲(沒有出來的話再addtopartition(XX,0))
	local Bb = Lua_DW_CreateObj("flag" ,113642,780452,1 ) 					--種出阿乙
	WriteRoleValue ( Aa  , EM_RoleValue_PID, Bb)						--把阿乙的PID寫進阿甲，方便以後操縱阿乙	
	MoveToFlagEnabled(Aa , false )							--關閉巡邏<從現在開始，阿甲的行動都在旗子掌握中>
	WriteRoleValue( Aa ,EM_RoleValue_IsWalk , 1 )						--用走的
	MoveToFlagEnabled(Bb , false )	
	WriteRoleValue( Bb ,EM_RoleValue_IsWalk , 0 )
	LuaFunc_MoveToFlag( Aa,780451,3,0)							--移動<阿甲走到箱子前>
	PlayMotion(  Aa ,ruFUSION_ACTORSTATE_EMOTE_POINT)		
	Yell( Aa , "[SC_113641_0]" , 3 )							--阿甲跟阿乙開始閒聊(偷懶的警備隊員...)															--快來看！特效藥又出現了！
	LuaFunc_MoveToFlag( Bb,780452,2,0)							--阿乙可以晚一點走到箱子前<小跑步？>
	sleep(20)												
	AdjustFaceDir( Bb , OwnerID() , 0 )
	Yell( Bb , "[SC_113642_0]" , 3 )							--說來真奇怪，每次只要有隊員染上那怪病，這藥就會出現。
	sleep(30)
	AdjustFaceDir( Aa , Bb , 0 )
	PlayMotion(  Aa ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( Aa , "[SC_113641_1]" , 3 )							--是啊！就像這裡的居民傳說的。
	sleep(30)
	PlayMotion(  Bb ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( Bb , "[SC_113642_1]" , 3 )							--你說送藥的森林妖精嗎？我剛聽時還不相信，現在倒有點覺得是真的。
	sleep(30)
	PlayMotion(  Aa ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( Aa , "[SC_113641_2]" , 3 )							--而且這個藥非常有效，實在是幫了大忙。	
	sleep(30)	
	PlayMotion(  Bb ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( Bb , "[SC_113642_2]" , 3 )							--到底是誰送來的？真想看看他們……
	sleep(30)
	Yell( Aa , "[SC_113641_3]" , 3 )							--快，需要用藥的人還在等著，我們快把藥送過去吧！
	if CheckID( TargetID() ) == true then
		CancelBuff( TargetID() , 505033 )
	end
	PlayMotion(Aa,ruFUSION_ACTORSTATE_CRAFTING_BEGIN)
	PlayMotion(Aa,ruFUSION_ACTORSTATE_CRAFTING_LOOP)
	sleep(20)
	PlayMotion(Aa,ruFUSION_ACTORSTATE_CRAFTING_END)
	PlayMotion(Aa,ruFUSION_ACTORSTATE_PARRY_1H)
	sleep(30)
	BeginPlot(Aa,"LuaS_422776_2",0)							--阿乙開始準備要前往下一個地方摸魚...
	LuaFunc_MoveToFlag( Aa,780451,4,0)							
	DelObj (Aa)									--刪除阿甲
	writerolevalue( OwnerID() , EM_RoleValue_Register  , 0 )	
end

function LuaS_422776_2() 
	Local Bb = ReadRoleValue(OwnerID(),EM_RoleValue_PID)					--讀取之前存在阿甲身上的PID
	LuaFunc_MoveToFlag( Bb,780452,3,0)
	DelObj (Bb)									--刪除阿乙
end


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------422777
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------沼泥村也需要藥	
--422777 沼泥村也需要藥	

function LuaS_422777_CHECK()  		--掛在點擊物品後<113663居尼爾的置物櫃>，成功，給予完成旗標，引發後續劇情

	if ReadRoleValue( TargetID() ,EM_RoleValue_Register  ) == 0 then
		if (CheckAcceptQuest(OwnerID(),422777)==true )and( CheckCompleteQuest( OwnerID(),422777)==false)	then
			if (CountBodyItem( OwnerID(),206140) >0) and(CheckFlag( OwnerID(), 543392 )==false)	then
				return true	
			end
			if (CountBodyItem( OwnerID(),206140) <1) and(CheckFlag( OwnerID(), 543392 )==false)		then
				ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_422776_0]" , 0 )		--你沒有泉水藥劑206140
				return false
			end
			if CheckFlag( OwnerID(),543392 )== true	  	then	
				ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_422776_1]" , 0 )		--你已經放過泉水藥劑206140
				return false
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_TARGETBUSY_DW]" , 0 )			--目標執行劇情中！
		return false
	end
end




function LuaS_422777_0()  		--掛在點擊物品後<113663居尼爾的置物櫃>，成功，給予完成旗標，引發後續劇情
	WriteRoleValue( TargetID() , EM_RoleValue_Register , 1 )	
	AddBuff( OwnerID() , 505033 , 10 , -1 )
	SetFlag( OwnerID() , 543392  , 1 )					--給旗標
	DelBodyItem( OwnerID(), 206140, 1 )
	BeginPlot( TargetID() , "LuaS_422777_1" , 0 )																
	return true
end


function LuaS_422777_99()	--掛在置物櫃初始劇情
	local GI = Lua_DW_CreateObj("flag" ,113636,780454,2 )	--置物櫃出生，製造居尼爾
	PlayMotionEX( GI, ruFUSION_ACTORSTATE_SLEEP_BEGIN,ruFUSION_ACTORSTATE_SLEEP_LOOP)
	WriteRoleValue ( OwnerID() , EM_RoleValue_PID,GI )	--將OwnerID()<置物櫃>寫進GI居尼爾裡
	WriteRoleValue ( GI , EM_RoleValue_PID, OwnerID())
end

function LuaS_422777_1()
	local BOT = Lua_DW_CreateObj("flag" ,113640,780454,3 )					--柏特出生
	local GI = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	DisableQuest(GI ,true )
	MoveToFlagEnabled(BOT , false )							--關閉巡邏<從現在開始，丙子柏特的行動都在旗子掌握中>
	WriteRoleValue( BOT ,EM_RoleValue_IsWalk , 1 )					--用走的
	LuaFunc_MoveToFlag( BOT,780454,4,0)						--移動<丙子走到藥草師面前>
	say(BOT,"[SC_422777_0]")								--你......是居尼爾的舊識嗎？自從他染了病，就失去了自信，他其實是個優秀的草藥師。
	sleep(20)
--	say(TargetID(),"[SC_422777_1]")							--TargetID是玩家--不，我是受人之託，要送藥劑給草藥師居尼爾的。
	sleep(20)
	say(GI ,"[SC_422777_2]")								--不......我沒用......
	sleep(20)
	say(BOT,"[SC_422777_3]")								--等一下，這位冒險者，你拿來的是森林妖精的藥劑嗎？
	sleep(20)			
	PlayMotion( BOT,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)				
	say(BOT,"[SC_422777_4]")							--沒錯。						
	sleep(20)
	PlayMotion(BOT, ruFUSION_ACTORSTATE_EMOTE_CRY)
	say(BOT,"[SC_422777_5]")								--居尼爾有救了！
	CancelBuff( TargetID() , 505033 )
	sleep(20)
	PlayMotion(BOT, ruFUSION_ACTORSTATE_CRAFTING_LOOP)
	sleep(20)
	AdjustFaceDir( BOT,GI , 0 ) 
	PlayMotion(BOT, ruFUSION_ACTORSTATE_CRAFTING_END)
	sleep(10)
	PlayMotion(BOT,ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	PlayMotion(BOT,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	sleep(20)
	PlayMotion(BOT,ruFUSION_ACTORSTATE_CROUCH_END)				--柏特將藥劑給居尼爾喝下。
	sleep(20)
	PlayMotion( GI  ,ruFUSION_MIME_SLEEP_UP)
	sleep(10)
	PlayMotion( GI ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	say(GI ,"[SC_422777_6]")								--喔，謝謝好心的森林妖精啊！
	sleep(20)	
	PlayMotion( GI ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	say(GI ,"[SC_422777_7]")								--謝謝好心的森林妖精，其他生病的人也有救了，柏特，請你將藥分送給病人吧！
	sleep(15)
	PlayMotion(BOT, ruFUSION_ACTORSTATE_EMOTE_EAT)
	say(BOT,"[SC_422777_8]")
	sleep(20)
	say(BOT,"[SC_422777_9]")								--[113636]你剛康復，還是躺下多休息一會兒吧！
	sleep(20)
	say(GI ,"[SC_422777_10]")							--好
	sleep(20)
	PlayMotionEX( GI, ruFUSION_ACTORSTATE_SLEEP_BEGIN,ruFUSION_ACTORSTATE_SLEEP_LOOP)
	sleep(20)
	LuaFunc_MoveToFlag( BOT,780454,5,0)						--移動<丙子走到視線外>	
	DelObj (BOT)
	--PlayMotion( GI  ,ruFUSION_ACTORSTATE_SLEEP_BEGIN)
	writerolevalue( OwnerID() , EM_RoleValue_Register  , 0 )	
	DisableQuest(GI ,false )
end




----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------422778
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------森林妖精傳說
--422778 森林妖精傳說	居尼爾113636	達拉斯113635

function LuaS_422778_0()  
	--say(OwnerID(),"O..O")
	--say(TargetID(),"T_T")
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422778)== true )and( CheckCompleteQuest( OwnerID(),422778)== false) 	then
		--say(OwnerID(),"O..O")
		--say(TargetID(),"T_T")
--		PlayMotion(  OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
--		PlayMotion(  TargetID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422778_0]","LuaS_422778_1",0)		 --嗯......怎麼說呢？是一些頭大大的、綠色皮膚的小傢伙給我的。
		
	end	
end

function LuaS_422778_1()
	SetSpeakDetail(OwnerID(),"[SC_422778_1]")						--這......呃，跟我想像中的森林妖精不太相同啊！記得我還小的時候，我母親就曾...				
--	PlayMotion(  OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
--	PlayMotion(  TargetID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
				
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422778_2]","LuaS_422778_2",0) 		--什麼樣的傳說，可以告訴我嗎？（你覺得達拉斯或許會對這個“傳說故事”感興趣）
end

function LuaS_422778_2()
	SetSpeakDetail(OwnerID(),"[SC_422778_3]")						--當然，我很樂意這麼做。我還記得我母親是這麼告訴我的──很久很久以前...	
	SetFlag( OwnerID() , 543393 , 1 )							--給旗標
end


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------422779
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------草藥師的謝意
--422779 草藥師的謝意

function LuaS_422779()
	playmotion(OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_idle)
end


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------422780
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------送藥到安亞卡
--422780 送藥到安亞卡

function LuaS_422780_0()  
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422780)== true )and( CheckCompleteQuest( OwnerID(),422780)== false) 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422780_0]","LuaS_422780_1",0) 	--好啊，我想想居尼爾是怎麼說的。嗯，在很久很久以前……(你一五一十的轉述居尼爾告訴你的故事)
	end	
end

function LuaS_422780_1()
	SetSpeakDetail(OwnerID(),"[SC_422780_1]")						--啊哈！達拉斯就說那些人類笨笨的吧，送藥劑給他們的才不是森林妖精，達拉斯是林精喔，林精！
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422780_2]","LuaS_422780_2",0) 		--你們是林精……和森林妖精是……？
end


function LuaS_422780_2()
	SetSpeakDetail(OwnerID(),"[SC_422780_3]")						--你是好人，哈、哈、哈～～啾！達拉斯就浪費一些妖精噴嚏告訴你吧！									
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422780_4]","LuaS_422780_3",0) 		--達拉斯，你們林精真是了不起，那麼，關於居尼爾說的讓他染病的血污野獸，你知道些什麼嗎？
end


function LuaS_422780_3()
	SetSpeakDetail(OwnerID(),"[SC_422780_5]")						--了不起的是美麗的神啦！
	SetFlag( OwnerID() , 543400 , 1 )							--給旗標
end


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------422781
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------淨化污穢
--422781 淨化污穢		所需編號：旗子780453 (1-2)	哈尼斯113637	迪爾斯113638

function LuaS_422781_0()  --完成任務後執行
	WriteRoleValue( OwnerID(), EM_RoleValue_PID , TargetID() )
	BeginPlot( OwnerID() , "LuaS_422781_1" , 0 )						--執行檢查<OwnerID是哈尼斯>
	local DIR = Lua_DW_CreateObj("flag" ,113638,780453,1 ) 					--種出迪爾斯
	Yell( DIR , "[SC_422781_0]" , 3 )							--哈尼斯...
	PlayMotion(  DIR ,ruFUSION_ACTORSTATE_CAST_BEGIN)
	MoveToFlagEnabled(DIR , false )							--關閉巡邏
	WriteRoleValue( DIR ,EM_RoleValue_IsWalk, 1  )					--用走的
	LuaFunc_MoveToFlag( DIR,780453,2,0)						--移動<迪爾斯走到哈尼斯面前>
	PlayMotion(  DIR ,ruFUSION_ACTORSTATE_CAST_LOOP)
	AdjustFaceDir( DIR,OwnerID()  , 0 ) 
	Yell( DIR , "[SC_422781_3]" , 3 )							--嗚嗚......有怪獸、有怪獸咬迪爾斯......好恐怖喔......
	sleep(20)
	Yell( OwnerID() , "[SC_422781_4]" , 3 )						--是什麼怪獸？
	AdjustFaceDir( OwnerID(),DIR  , 0 ) 
	sleep(20)
	PlayMotion(  DIR  ,ruFUSION_ACTORSTATE_CAST_END)
	sleep(10)
	PlayMotion(  DIR  ,ruFUSION_ACTORSTATE_CAST_SP02)
	Yell( DIR , "[SC_422781_5]" , 3 )							--不曉得......怪獸、怪獸的嘴巴大大的，牙齒好尖，迪爾斯還沒看清楚就被咬了一口，好痛好痛喔......神救救迪爾斯，迪爾斯不想死......
	sleep(40)
	SetDefIdleMotion( DIR, ruFUSION_MIME_DEATH_LOOP)					--倒下動作
	--PlayMotion(  DIR ,ruFUSION_ACTORSTATE_DEATH)
	Yell( DIR , "[SC_422781_1]" , 3 )							--哈尼斯...哈尼斯...
	PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_HURT_NORMAL)	
	Yell( OwnerID() , "[SC_422781_2]" , 3 )						--迪爾斯你怎麼了？你不要嚇哈尼斯啊！						sleep(10)					
	Yell( OwnerID() , "[SC_422781_6]" , 3 )						--迪爾斯！
	sleep(20)
	AdjustFaceDir( OwnerID(),TargetID()  , 0 ) 
	PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_HURT_NORMAL)
	Yell( OwnerID() , "[SC_422781_7]" , 3 )						--迪爾斯昏過去了，不知道他是被什麼東西攻擊，好像還中毒了！
	sleep(50)							
	DelObj (DIR)									--刪除迪爾斯	
end

--檢查：<玩家在才演下去> 

function LuaS_422781_1()	
	local player =ReadRoleValue( OwnerID() , EM_RoleValue_PID )						
	for i = 1, 30 , 1 do								--秒數配合劇情調整
		if  CheckID( TargetID()) == false	then
			break
		end
		sleep(10)
	end
end

function LuaS_422781_2()
	if (CheckAcceptQuest(OwnerID(),422781)==true )and(CheckFlag( OwnerID(), 543396)==false) then	
		if	(CountBodyItem( OwnerID(),206141) >0)  then
			DelBodyItem( OwnerID(), 206141, 1 )
			CastSpell(TargetID(),TargetID(),494399)	--施法特效
			SetFlag( OwnerID() , 543396, 1 )
			return true
		else
			ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_422781_9]" , 0 )		--你缺少[206141]！
			return false
		end
	else
		ScriptMessage( OwnerID() , OwnerID(), 1, "[SC_422781_8]" , 0 )		--你已經施展過[206141]！
		return false
	end
end


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------422782
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------神的救贖
--422782 神的救贖		所需編號：旗子780455(1-10)	半透明諾芙113678	演戲用諾芙113679	迪爾斯113638	瑞紫蓓 	檢查用BUFF：504952

function LuaS_422782_0()  --完成任務後執行
	WriteRoleValue( OwnerID(), EM_RoleValue_PID , TargetID() )
	BeginPlot( OwnerID() , "LuaS_422782_1" , 0 )						--執行檢查<OwnerID是瑞紫蓓>	<原地種一根780455的1號旗子>
	Addbuff(TargetID() ,504952 ,0 ,-1)						--秒數調整
	local DIR = Lua_DW_CreateObj("flag" ,113638,780455,2 ) 					--種出迪爾斯
	SetDefIdleMotion( DIR, ruFUSION_MIME_DEATH_LOOP)					--倒下動作
	DisableQuest( OwnerID() , true )							--關閉對話
	MoveToFlagEnabled(OwnerID() , false )							--關閉巡邏
	WriteRoleValue( OwnerID() ,EM_RoleValue_IsWalk , 1 )					--用走的
	LuaFunc_MoveToFlag( OwnerID(),780455,3,0)						--移動<瑞紫蓓走到要召喚的地方-英雄之墓的涼亭前>
	PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_CAST_BEGIN)				--使用物品的動作
	sleep(30)	
	--PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_CAST_LOOP)				--召喚的動作
	PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_CAST_END)						
	sleep(30)
	--水泉地上冒起								--特效
	local NO = Lua_DW_CreateObj("flag" ,113733,780455,4 ) 					--產生成熟的諾芙身影<藏在水泉之間<考慮半透明>>
	CastSpell(NO,NO,494506)
	--AdjustFaceDir( NO ,OwnerID()  , 0 ) 
	sleep(50)
										--光的特效
	delobj(NO)									--刪除水泉中的諾芙
	local NOF = Lua_DW_CreateObj("flag" ,113679,780455,4) 					--同樣的點產生新的諾芙	
	AddBuff(NOF,505067,1,4)
--	AddBuff(NOF,505073,1,8)
	DisableQuest( NOF , true )								--關閉對話
	MoveToFlagEnabled(NOF , false )							--關閉巡邏
	LuaFunc_MoveToFlag( NOF,780455,5,0)						--諾芙移動
	ScriptMessage( TargetID() , TargetID(), 1, "[SC_422782_0]" , 0 )				--神降臨了，她純淨的雙眼向你看來。
	sleep(20)	
	Yell( OwnerID() , "[SC_422782_1]" , 3 )						--諾芙大人，請您救救迪爾斯吧。	
	sleep(20)
	Yell( NOF , "[SC_422782_2]" , 3 )							--迪爾斯受傷了？別慌張，帶我去看看他。	
	sleep(10)			
	LuaFunc_MoveToFlag( OwnerID(),780455,6,0)						--瑞紫蓓移動
	LuaFunc_MoveToFlag( NOF,780455,7,0)						--諾芙移動
	Yell( NOF , "[SC_422782_3]" , 3 )							--可憐的迪爾斯……
	sleep(20)						
	Castspell(NOF,DIR,494518)								--諾芙施法特效
	sleep(50)
	Yell( DIR , "[SC_422782_4]" , 3 )							--美麗的神救救迪爾斯！
	sleep(20)
	Yell( OwnerID() , "[SC_422782_5]" , 3 )						--笨蛋，諾芙大人不就在你面前，你已經全部都好了。
	sleep(20)
	DelObj (DIR)
	local DIR2 = Lua_DW_CreateObj("flag" ,113638,780455,2 ) 	
	MoveToFlagEnabled(DIR2 , false )	
--	SetDefIdleMotion(  DIR ,ruFUSION_MIME_IDLE_STAND)
--	Hide( DIR )
--	Show( DIR ,0)
	LuaFunc_MoveToFlag( DIR2,780455,8,0)						--迪爾斯跑動
--	PlayMotion(  DIR2 ,ruFUSION_ACTORSTATE_JUMP)					--迪爾斯跳起來
	Yell( DIR2 , "[SC_422782_6]" , 3 )							--一邊SAY謝謝美麗的神，美麗的神最好了！
	LuaFunc_MoveToFlag( DIR2,780455,9,0)
	sleep(20)
	Yell( NOF , "[SC_422782_7]" , 3 )							--好了，迪爾斯，你的傷剛好，要記得多休息，瑞紫蓓，你帶迪爾斯回去吧。
	SetFollow(DIR2 , OwnerID() )						--迪爾斯跟隨
	sleep(20)
	Yell( OwnerID() , "[SC_422782_8]" , 3 )						--好的，我很樂意遵照您的願望去做。
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_IDLE2)				--???瑞紫蓓鞠躬???			
	LuaFunc_MoveToFlag( OwnerID(),780455,10,0)						--瑞紫蓓移動

	DelObj (NOF)									--諾芙NOF消失
	if	CheckID( TargetID() ) == true then
		SetFlag( TargetID() , 543430 , 1 )						--給看見諾芙2的旗標---client SCRIPT 諾芙出現  可還任務的113633
		CancelBuff( TargetID(), 504952 )
	end										
	LuaFunc_ResetObj( OwnerID() )							--重置瑞紫蓓
	DelObj (DIR2)									--迪爾斯消失
	DelObj (NOF)								
end

--檢查：
function LuaS_422782_1()								--秒數配合劇情調整

	local player =ReadRoleValue( OwnerID() , EM_RoleValue_PID )	
	for i = 1, 30 , 1 do
		if  CheckID( player ) == false	then
			break
		end
		sleep(10)
	end
end

function LuaS_422782_2()	--NPC的範圍劇情：檢查附近玩家，有完成任務的卻沒有旗標<看到諾芙113633的旗標>，給旗標
	SetPlot(OwnerID(),"range","LuaS_422782_3",250)				--調整範圍
end

function LuaS_422782_3()

	if ( CheckCompleteQuest(OwnerID(),422782)== true )and 	CheckBuff( OwnerID() , 504952)==false 	and	CheckFlag( OwnerID(), 543430 )==false	then
		SetFlag( OwnerID() , 543430 , 1 )
	end
	
end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------422783
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------神使諾芙
--422783 神使諾芙		所需編號：諾芙113633	旗標543394

function LuaS_422783_0()  
	LoadQuestOption( OwnerID() )

	if	CheckAcceptQuest( OwnerID() , 422828 ) == true	and 
		CheckCompleteQuest( OwnerID() , 422828) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422828_0]","LuaS_422828_0",0)	--那麼後來怎麼了？[113686]為何會變成鮮血之王。
	end


	if 	(CheckAcceptQuest(OwnerID(),422783)==true )and( CheckCompleteQuest( OwnerID(),422783)==false) 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422783_0]","LuaS_422783_1",0) 	--能與神交談是我的榮幸。
	end

	if	 (CheckAcceptQuest(OwnerID(),422783)==true )and( CheckCompleteQuest( OwnerID(),422783)==false) 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422783_2]","LuaS_422783_2",0) 	--並非故意冒犯您，我還有攸關生死的急事要處理......
	end

 	if 	(CheckAcceptQuest(OwnerID(),422807)==true )and  (CheckFlag(OwnerID(),543420)==false )then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422807_1]","LuaS_422807_1",0)---[113633]～[113633]……[113633]？
	end
		
	if 	(CheckAcceptQuest(OwnerID(),422812)==true )and (CheckFlag(OwnerID(),543447)==false )and(ReadRoleValue( TargetID() ,  EM_RoleValue_Register )==0)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422811_1]","LuaS_422812_1",0)----我準備好了，我們走吧！ 
	end
	if	 (CheckAcceptQuest(OwnerID(),422812)==true )and (CheckFlag(OwnerID(),543447)==false )and(ReadRoleValue( TargetID() , EM_RoleValue_Register )==1)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422811_1]","LuaS_422812_2",0) ----我準備好了，我們走吧！
	end

	if	CheckAcceptQuest( OwnerID() ,422821 ) == true and CheckFlag(OwnerID(),543422) == true	then
		 if	 CheckFlag(OwnerID(),543423) == false and CheckFlag(OwnerID(),543434) == false and CheckFlag(OwnerID(),543435) == false and CheckFlag(OwnerID(),543436) == false	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422821_6]","LuaS_422821_1",0) 	--妳之前說的淨化、治療那些事情真的都是騙我的？
		end
	end
	
	if	CheckAcceptQuest( OwnerID() ,422821 ) == true and CheckFlag(OwnerID(),543422) == true	 then
		if	CheckFlag(OwnerID(),543423) == false and CheckFlag(OwnerID(),543433) == false and CheckFlag(OwnerID(),543435) == false and CheckFlag(OwnerID(),543436) == false 	then	
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422821_7]","LuaS_422821_2",0) 	--我曾經相信過妳…沒想到妳是這種人…
		end
	end

	if	CheckAcceptQuest( OwnerID() ,422821 ) == true and CheckFlag(OwnerID(),543422) == true	then
		if	CheckFlag(OwnerID(),543423) == false and CheckFlag(OwnerID(),543433) == false and CheckFlag(OwnerID(),543434) == false and CheckFlag(OwnerID(),543436) == false	then	
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422821_8]","LuaS_422821_3",0)	 	--我看到英雄之墓外有一些…妳曾說過遭到血污污染的焦油獸。
		end
	end
	
	if	CheckAcceptQuest( OwnerID() ,422821 ) == true and CheckFlag(OwnerID(),543422) == true	then 	
		if	CheckFlag(OwnerID(),543423) == false and CheckFlag(OwnerID(),543433) == false and CheckFlag(OwnerID(),543434) == false and CheckFlag(OwnerID(),543435) == false 	 	then	
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422821_9]","LuaS_422821_4",0)		 --妳在我眼前淨化過焦油獸，但牠們大部分是逃離或消失…現在英雄之墓外又有一批生物…
		end
	end

	if	( CheckCompleteQuest( OwnerID(),422783)==true) and  CheckAcceptQuest( OwnerID() ,422784 ) == true  and CountBodyItem( OwnerID(), 206156 )<1	then
		if	( CheckCompleteQuest( OwnerID(),422784)==false) or	( CheckCompleteQuest( OwnerID(),422785)==false)	or
			( CheckCompleteQuest( OwnerID(),422786)==false) or	( CheckCompleteQuest( OwnerID(),422787)==false)	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422784_10]","LuaS_422784_1",0)		--請給我一個[206156]。
		end
	end

end

function LuaS_422783_1()
	SetSpeakDetail(OwnerID(),"[SC_422783_1]")						--稱我為諾芙吧，這曾是我的名字。林精們一直喚我為神，其實我只是平凡的人類，就像你一樣。							
	SetFlag( OwnerID() , 543394 , 1 )							--給旗標
end	

function LuaS_422783_2()
	SetSpeakDetail(OwnerID(),"[SC_422783_3]")						--好吧，會停留下來的自會停留，想要離去的腳步，我不會阻攔。
end

function LuaS_422783_3()
	CloseSpeak( OwnerID() )
end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------422784
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------污血的變異
--422784 污血的變異	所需編號：寄影靈石206156	半透明諾芙113678	赤紅蠑螈102792	血污焦油102793	旗標：543398

--function LuaS_422784_0()	--諾芙身上多設定　遺失寄影靈石　多要一顆選項
--	LoadQuestOption( OwnerID() )
--	if	( CheckCompleteQuest( OwnerID(),422783)==true) 	then
--		if	( CheckCompleteQuest( OwnerID(),422784)==false) or	( CheckCompleteQuest( OwnerID(),422785)==false)	or
--			( CheckCompleteQuest( OwnerID(),422786)==false) or	( CheckCompleteQuest( OwnerID(),422787)==false)	then
--			if	CountBodyItem( OwnerID(), 206156 )<1	then
--			AddSpeakOption(OwnerID(),TargetID(),"[SC_422784_0]","LuaS_422784_1",0)		--請再給我一個[206156]。
--			end
--		end
--	end
--end

function LuaS_422784_1()
	GiveBodyItem( OwnerID(), 206156, 1 )
	CloseSpeak( OwnerID() )
end


function LuaS_422784_2()
	if		CountBodyItem( TargetID(), 206156 )<1	then
			GiveBodyItem( TargetID(), 206156, 1 )
	end
end

--寄影靈石使用檢查
function LuaI_206156_Check()
	if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode ) ~= 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205535_0]" , 0 ) --你正在戰鬥
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205535_0]" , 0 ) 
		return false
	end
	if CheckBuff( OwnerID() , 504953 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206156_1]" , 0 ) --[113678]的精神擬體已經在附近。
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206156_1]" , 0 ) 
		return false
	end
	if	Lua_ObjAreaCheck(OwnerID() , 574) ==false  then
--	if	Lua_ObjAreaCheck(OwnerID() , 1) ==false  then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_206156_2]", 0 ) --你必須在[ZONE_POOL OF BLOOD]召喚[113678]。
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_206156_2]", 0 )
		return false
	end
	return true
end

--寄影靈石的使用
function LuaI_206156_Use()
	local NOFF = Lua_CreateObjByDir( OwnerID()  , 113678, 25 , 0 ) 
	local DBID = ReadRoleValue(OwnerID(),EM_RoleValue_DBID)
	AddToPartition( NOFF , 0 )
	AddBuff( OwnerID() , 504953 , 1 , -1 )							
	WriteRoleValue( NOFF , EM_RoleValue_PID , OwnerID() )
	WriteRoleValue( NOFF , EM_RoleValue_Register , DBID )
	BeginPlot( NOFF , "LuaI_206156_0" , 0 )
end

function LuaI_206156_0()
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_PID )				--OwnerID是諾芙，Player 是玩家
	local DBID = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	CastSpell( OwnerID() , OwnerID() , 493776 )						--493776 出場的施法特效
	--SetFollow( OwnerID() ,Player )
	if CheckAcceptQuest( Player , 422784 ) == true and CheckFlag( Player , 543398 ) == false and  CheckCompleteQuest( Player ,422784)== false	then
		BeginPlot( OwnerID(), "LuaI_206156_1" , 0 )
	end
	for i = 0 , 36  , 1 do
		if CheckID( Player  ) == false or ReadRoleValue( Player , EM_RoleValue_DBID ) ~= DBID then
			break
		end
		if ReadRoleValue( Player , EM_RoleValue_IsDead ) == 1 or CheckBuff( Player , 504953) == false then
			break
		end
		if GetDistance( OwnerID(), Player  )>400 then
			break
		end
		if ReadRoleValue( OwnerID() , EM_RoleValue_Register+1) > 0 then
			sleep(300)
			break
		end
		sleep( 50 )
	end
	if CheckID( Player ) == true and CheckBuff( Player  , 504953) == true and ReadRoleValue( Player , EM_RoleValue_DBID ) == DBID	then
		CancelBuff_NoEvent( Player , 504953 )
	end
	CastSpell( OwnerID() , OwnerID() , 493776  )
	sleep( 15 )
	DelObj( OwnerID() )
end

--在422784叫出來,確認玩家沒完成,開始執行下一段ＳＣＲＩＰＴ
function LuaI_206156_1()
	local BLOOD = 0
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_PID )				--OwnerID是諾芙，Player 是玩家
	local Forg  = {}
	if CheckAcceptQuest( Player , 422784 ) == true and CheckFlag( Player , 543398 ) == false and  CheckCompleteQuest( Player ,422784)== false	then	
		DisableQuest( OwnerID() , true )
		AdjustFaceDir( OwnerID(),Player  , 0 ) 						--面向玩家
		sleep(10)
		tell(Player ,OwnerID(),"[SC_422784_0]")					--請跟我來，我帶你去看血污的源頭，路上會遇到沾染血污的變異生物，一定要小心。
		DW_MoveToFlag( OwnerID() , 780479 , DW_Rand(12) ,70 , 1  )
		sleep(30)
		say(OwnerID(),"[SC_422784_1]")						--原本這裡的生物都很溫馴，從前的赤紅蠑螈是食草為生，喜愛親近人類的……	
		sleep(30)
	end

	if CheckID(Player  ) == true and  CheckAcceptQuest( Player , 422784 ) == true and  CheckCompleteQuest( Player ,422784)== false	and CheckFlag( Player , 543398 ) == false  then
		Forg[1] = Lua_CreateObjByDir( OwnerID()  , 102792, 100 , 0 ) 			--種出兩隻二隻赤紅蠑螈
		AddToPartition( Forg[1] , 0 )
		Forg[2] = Lua_CreateObjByDir( OwnerID()  , 102792, 75, 0 ) 
		AddToPartition( Forg[2] , 0 )	
		sleep(10)
		--SetAttack( Forg[1] , Player  )
		SetFollow( Forg[1] , Player  )						--跑向玩家Player  
		SetFollow( Forg[2] , Player  )		
		ScriptMessage( Player   , Player   , 1 , "[SC_422784_2]" , 0 ) 	--赤紅蠑螈快速接近你，像是準備攻擊！
		ScriptMessage( Player    , Player   , 0 , "[SC_422784_2]" , 0 ) 
	else
		if CheckID( Player ) == true and CheckBuff( Player  , 504953) == true then
			CancelBuff_NoEvent( Player , 504953 )
		end
		DelObj(Forg[1] )
		DelObj(Forg[2] )
		DelObj(OwnerID())
		return	
	end	
					
		tell(Player   ,OwnerID(),"[SC_422784_3]")					--請不要傷害牠們，讓我平撫牠們受血污感染的心。
		AdjustFaceDir( OwnerID(),Forg[1], 0 ) 		
		sleep(10)
		PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_CAST_BEGIN)	
		sleep(30)
		PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_CAST_END)	
		--諾芙施法發出淨化之光
		PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_BUFF_SP01)
		AddBuff(Forg[1]  , 500980 , 10 , -1 )  						--赤紅蠑螈掉頭離開
		AddBuff(Forg[2] , 500980 , 10 , -1 ) 
		sleep(50)									
		DelObj(Forg[1] )	
		DelObj(Forg[2])
		sleep(10)	
		PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_EMOTE_CRY)
		ScriptMessage( Player , Player , 1, "[SC_422784_4]" , 0 )				--諾芙拭去額上的汗，臉色有些蒼白。
		sleep(20)
		DW_MoveToFlag( OwnerID() , 780479 , DW_Rand(5) ,40 , 1  )
		sleep(10)

	if CheckID(Player  ) == true and  CheckAcceptQuest( Player , 422784 ) == true and  CheckCompleteQuest( Player ,422784)== false	and CheckFlag( Player , 543398 ) == false  then
		BLOOD = Lua_CreateObjByDir( OwnerID()  , 102793, 100 , 0 ) 			-- 種出一隻血污焦油獸
		AddToPartition( BLOOD , 0 )
		sleep(10)
		SetFollow( BLOOD, Player    )							--跑向玩家
	else
		if CheckID( Player ) == true and CheckBuff( Player  , 504953) == true then
			CancelBuff_NoEvent( Player , 504953 )
		end
		DelObj(BLOOD)
		DelObj(OwnerID())
		return	
	end		
	
		tell(Player   ,OwnerID(),"[SC_422784_5]")					--焦油獸其實是怕生的，牠們最常沉在沼澤底慵懶的吞吐氣泡，與世無爭的生活。
		sleep(30)	
		AddBuff(Player    , 503994 , 10 , -1)--玩家身上ＢＵＦＦ　　扣血
		AdjustFaceDir( OwnerID(),BLOOD , 0 ) 
		PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_CAST_BEGIN)	
		sleep(30)
		PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_CAST_END)	
		--諾芙對血污獸施法
		AddBuff(BLOOD , 500980 , 10 , -1 )  						--血污獸跑開
		sleep(50)
		DelObj(BLOOD)
		PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_CROUCH_BEGIN)
		sleep(20)
		ScriptMessage( Player     , Player    , 1, "[SC_422784_6]" , 0 )			--諾芙微微喘息，面容更蒼白了。
		sleep(20)
		tell(Player    ,OwnerID(),"[SC_422784_7]")					--無妨，我最近做了太多淨化工具和藥劑，休息一會就好。
		sleep(20)
		playMotion(  OwnerID(),ruFUSION_ACTORSTATE_CROUCH_END)
		--諾芙站起
		DW_MoveToFlag( OwnerID() , 780479 , DW_Rand(5) ,40 , 1  )
		sleep(10)
		tell(Player    ,OwnerID(),"[SC_422784_8]")--這裡是血污之池，感受到了嗎？略帶血色的池水中盈滿的負面能量，這，全都來自一把魔劍……
		sleep(20)
		--諾芙對水池施法
		--特效著重在水的流動、白光
		tell(Player    ,OwnerID(),"[SC_422784_9]")--Pe-ertei Tista-antei【淨化】……劍與持劍的英雄已杳，時光如流泉，吾……洗滌了什麼，又治癒了什麼？
		sleep(30)
		DisableQuest( OwnerID() ,false )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 777 )
	if	CheckID(Player    ) == true then
		SetFlag( Player     , 543398 , 1 )
	end
end


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------422785
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 淨化焦油獸
--422785 淨化焦油獸	所需編號：543399首先淨化焦油獸 	206142淨化石

--使用物品檢查
function LuaS_206142_0()	
	if	CheckAcceptQuest( OwnerID() , 422785 ) == true then
		if	CheckFlag( OwnerID() , 543399 ) == true	then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206142_0]" , 0 ) 		--你已經淨化成功。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206142_0]" , 0 ) 
			return false
		end

		if	ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 1 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422202_4]" , 0 ) 		--目標已經死了。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422202_4]" , 0 )
			return false
		end

		local XX =  LuaFunc_SearchNPCbyOrgID( OwnerID() , 101795 , 60 )
		if Type(XX) == "number" and CheckID(XX) == false then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206142_1]" , 0 ) 		--你必須靠近血污焦油使用淨化石。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206142_1]" , 0 ) 
			return false 
		end

		if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)	> 0.5	then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_101614_2]" ,  C_SYSTEM )
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206142_2]" , 0 )		--血污焦油奮力抵抗！
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206142_2]" , 0 ) 		
			return false
		else			
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206142_3]" , 0 )		--血污焦油的抵抗似乎變弱了，趕快趁機淨化！
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206142_3]" , 0 ) 
			return true
		end
	end
			return false 
end

--成功使用
function LuaS_206142_2()
	if CheckID( TargetID() ) == true then
		SetFlag( OwnerID() , 543399 , 1 )						--給旗標
	end
	sleep(10)
	CallPlot( TargetID(), "LuaFunc_ResetObj", TargetID() )
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206142_4]" , 0 )				--恢復平靜的焦油獸沉到水底爛泥中了。
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206142_4]" , 0 ) 

end



-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------422787
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------淨化赤紅蠑螈
--422787 淨化赤紅蠑螈		所需編號：206143掛在手編的蛛絲網

--接任務後
--function LuaS_422787_0() 
	--給諾芙化為水珠飄散特效
--	setflag(OwnerID(),543401,1)					--給玩家旗標543401，client script讓諾芙不見
--end
	
function LuaS_206143_0()	--使用物品檢查
	if	CheckAcceptQuest( OwnerID() , 422787 ) == true then
		if	(CountBodyItem( OwnerID(),206144) >0)  then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206143_0]" , 0 )		 --你已經捕捉了一隻赤紅蠑螈，趕快帶去給瑞紫蓓淨化。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206143_0]" , 0 ) 
			return false
		end

		if	ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 1 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422202_4]" , 0 ) 		--目標已經死了。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422202_4]" , 0 )
			return false
		end

		local XX =  LuaFunc_SearchNPCbyOrgID( OwnerID() , 101796 , 50 )
		if Type(XX) == "number" and CheckID(XX) == false then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206143_1]" , 0 ) 		--你必須先接近赤紅蠑螈才能使用手編的蛛絲網
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206143_1]" , 0 ) 
			return false 
		else		
			return true	
		end
	end
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422625_0]" , 0 ) 		--你目前不需要這麼做
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422625_0]" , 0 ) 
 	return false
end



--物品成功使用
function LuaS_206143_1()
	if	CheckID( TargetID() ) == true then
		if	(CountBodyItem( OwnerID(),206144) <1)  then	
			CallPlot( TargetID(), "LuaFunc_ResetObj", TargetID() )
			GiveBodyItem( OwnerID(),206144, 1 )
		end
	end
end

--完成任務後
function LuaS_206143_2()
	if	 CountBodyItem( TargetID(), 206156)>0	 then 
		 DelBodyItem( TargetID(), 206156, 1 )
	end
end
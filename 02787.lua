--/GM ? delkeyitem 547228 Q1判斷對話
--/GM ? delkeyitem 547230 完成
--/GM ? delkeyitem 547190 找到雷歐
--/GM ? delkeyitem 547226 Q2可否接

function sasa_121598_quest()
	local OID = OwnerID()	--player
	local TID = TargetID()  --Target
	local Down = CheckFlag( OID , 547230 )		--完成
	local Q1 = CheckFlag( OID , 547228 )		--可接Q1
	
	if Down == true then		--完成任務
		SetSpeakDetail( OID , "[SC_121600_7]" )   --對話
		--你有什麼事嗎？
	elseif Q1 == true then
		LoadQuestOption(OwnerID())	--讀取任務模板
	else
		SetSpeakDetail( OID , "[SC_121600_5]" )   --對話
		--冷冽的空氣正考驗著生存本能！你來的正好，想必你也是個勇猛精銳的冒險者。請留下腳步聽聽我的請求，好嗎？
		AddSpeakOption( OID , TID , "[SC_121600_6]" , "sasa_121598_quest_2" , 0 )
		--好吧，雖然我很忙…
	end
end

function sasa_121598_quest_2()
	SetFlag( OwnerID() , 547228 , 1 )
	LoadQuestOption( OwnerID())	--讀取任務模板
	CloseSpeak(OwnerID())
end

--LuaP_Sleeping

function sasa_121600_quest()
	LoadQuestOption( OwnerID() )
	if ( CheckAcceptQuest( OwnerID() , 425784 ) == true )
	 and CheckFlag( OwnerID() , 547190 ) == false then
		AddSpeakOption( OwnerID() , TargetID() , "[SC_121600_1]" , "sasa_121600_01" , 0 )
		--……（盯著對方）
		AddSpeakOption( OwnerID() , TargetID() , "[SC_121600_2]" , "sasa_121600_02" , 0 )
		--請問，你是[121600]是嗎？
	end
end

function sasa_121600_01()
	CloseSpeak( OwnerID() )
end
	
function sasa_121600_02()
	SetSpeakDetail( OwnerID() , "[SC_121600_3]" )
	--我，我就是[121600]！你是來救我的嗎？說來慚愧，本來稍早正準備回營，卻被雪熊追逃到這裡來，
	--回營的路也看不清，視線變得越來越模糊，我還以為自己要死在這了呢！
	--唉…我的腳似乎扭到了，請幫我通知[121598]派人協助[QUEST_DIR_038]，
	--對了…那邊那些白晶雪亮的正是傳說中的[242040]，你順便幫我摘個幾朵送至[121598]那吧！
	--一切就拜託你了…咳！
	AddSpeakOption( OwnerID() , TargetID() , "[SC_121600_4]" , "sasa_121600_03" , 0 )
	--別說了…這碗熱湯先喝下吧！
end
	
function sasa_121600_03()
	local Soup = 242039
	local Count = CountBodyItem ( OwnerID(), Soup )
	
	if Count >= 1 then
		DelBodyItem( OwnerID() , Soup , 1 )	--刪熱湯
		SetFlag( OwnerID() , 547190 , 1 )	--給旗標(對話)
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421029_5]" , 2 )
	end
	CloseSpeak( OwnerID() )
end

function sasa_425783_Winter()
	SetFlag( TargetID() , 547226 , 1 )
	SetFlag( TargetID() , 547228 , 0 )
	SetFlag( TargetID() , 547230 , 1 )
	SetFlag( TargetID() , 547330 , 1 )
	local Lv = ReadRoleValue( TargetID() , EM_RoleValue_Lv )
	DesignLog( TargetID() , 121599 , "Winter Game01 Lv"..Lv )
end

function sasa_425783_Winter_2()
	SetFlag( TargetID() , 547226 , 0 )
	SetFlag( TargetID() , 547331 , 1 )
	local LLv = ReadRoleValue( TargetID() , EM_RoleValue_Lv )
	DesignLog( TargetID() , 121599 , "Winter Game02 LLv"..LLv )
end
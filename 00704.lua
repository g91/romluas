function LuaI_110167() 
	local Obj = OwnerID()
	LoadQuestOption( OwnerID() )
	--任務：424962 賢者之眼加入
	if	CheckAcceptQuest(Obj,424962)==true	and
		CheckAcceptQuest(Obj,424963)==false	and 
		CheckCompleteQuest(Obj,424963)==false	then
		AddSpeakOption(Obj,Obj,"[SC_424962_A]","LuaS_424962_TalkPlotSP", 0 )
	end

	-- 七夕活動追加
	--local hour = GetSystime(1)
	-- CheckBuff( OwnerID() ,501666 ) == true 
	--if ( hour >= 18 and hour < 20 ) and ( CheckBuff( OwnerID() , 501666 ) == true or CheckFlag( OwnerID() , 541327 ) == true ) then	-- 冒險協會密語包裹
	--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111307_12") , "LuaS_110167_6", 0 )	-- 完成任務-護送密語包裹
	--elseif ( CountBodyItem( OwnerID() , 202696 ) >= 1 ) and ( CheckBuff( OwnerID() , 501666 ) == true or CheckFlag( OwnerID() , 541327 ) == true ) then	-- 冒險協會密語包裹
	--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111307_12") , "LuaS_110167_6", 0 )	-- 完成任務-護送密語包裹
	--end

	if CheckFlag( OwnerID()  , 540820 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110167_3") , "LuaS_110167_3", 0 )	-- 轉職後的注意事項！
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110167_4") , "LuaS_110167_4", 0 )	-- 我如何回到開墾聚落？
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_GET_NEWBIE_TRAN") , "LuaS_Get_Newbie", 0 );
	end
  	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110167_1") , "LuaS_110167_1", 0 );--/轉職介紹
  	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110167_2") , "LuaS_110167_2", 0 );--/生活技能介紹
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_CHANGEJOB]" , "LuaS_ChangeJob_Intro", 0 )

end

function LuaS_110167_1() 
	SetSpeakDetail( OwnerID(), GetString("ST_110167_1") )
	--/經過這段時間的歷練之後，想必你對目前職業的特性有了一定程度的瞭解了吧？
	--/往後的冒險生涯你將面臨更多的危險，當然你選擇繼續深入研究你所擁有的職業。或者，你也可以試著學習其他的職業，兩種職業搭配得宜的話，有時可以發出意想不到的威力。
	--/不過，想要學習其他職業的技能的話，必須先達到該職業導師的要求，目前我身邊就有騎士、戰士、盜賊、遊俠、法師、祭司等六個職業導師。
	--/如果你對某個職業有興趣的話，就去找他們談談吧！
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACKTALK") , "LuaI_110167", 0 ); --/我想回到剛剛的對話
end

function LuaS_110167_2() 
	SetSpeakDetail( OwnerID(), GetString("ST_110167_2") )
	--/我們冒險者，大部分的時候是武器、裝備與補給品的消耗者，但同時也可以是個優秀的生產者。
	--/透過生活技能的學習，我們可以親手製造這些武器、裝備與補給品，或是採集到製造這些產品的原料。
	--/由我們親手製造的產品，通常會比一般野外冒險所得，具有更多的符文空間，這些符文空間鑲嵌入符文之後，便能得到符文所帶來的力量。
	--/而且若是技術與運氣都達到了頂點的話，還會做出精品級的產品，不僅符文空間更多，原始威力也比一般的產品強大。
	--/凡瑞娜絲城的城下區，集合了各種生活技能的專家們，我想他們都會很樂意提供他們的知識。建議你可以先嘗試每種生活技能，找出你最喜歡的項目再深入去研究。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACKTALK") , "LuaI_110167", 0 ); --/我想回到剛剛的對話
end

function LuaS_110167_3() 
	SetSpeakDetail( OwnerID(), GetString("ST_110167_3") )
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACKTALK") , "LuaI_110167", 0 ); --/我想回到剛剛的對話
end

function LuaS_110167_4() 
	SetSpeakDetail( OwnerID(), GetString("ST_110167_4") )
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACKTALK") , "LuaI_110167", 0 ); --/我想回到剛剛的對話
end

function LuaS_Get_Newbie()
	SetSpeakDetail( OwnerID(), GetString("SC_GET_NEWBIE_TRAN_1") )
	if CheckFlag( OwnerID() , 540190 ) == false and ReadRoleValue( OwnerID() , EM_RoleValue_Race ) == 0 then
		SetFlag(OwnerID(),540190,1)
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_JOBGIVETRANSPORT][$SETVAR1=[491891]]" , C_SYSTEM )
	end
	if CheckFlag( OwnerID() , 540191 ) == false then
		SetFlag(OwnerID(),540191,1)
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_JOBGIVETRANSPORT][$SETVAR1=[491913]]" , C_SYSTEM )
	end
	if CheckFlag( OwnerID() , 540192 ) == false and ReadRoleValue( OwnerID() , EM_RoleValue_Race ) == 1 then
		SetFlag(OwnerID(),540192,1)
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_JOBGIVETRANSPORT][$SETVAR1=[493899]]" , C_SYSTEM )
	end

	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACKTALK") , "LuaI_110167", 0 ); --/我想回到剛剛的對話	
end
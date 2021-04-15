function LuaS_422740()------
             	LoadQuestOption( OwnerID() )
                if (CheckAcceptQuest(OwnerID(),422740)==true )and  (CheckFlag(OwnerID(),543305)==false )then
                    AddSpeakOption(OwnerID(),TargetID(),"[SC_422740_1]","LuaS_422740_1",0)        ---尤米多葛
                    AddSpeakOption(OwnerID(),TargetID(),"[SC_422740_2]","LuaS_422740_2",0)------自己
               end
               if (CheckAcceptQuest(OwnerID(),422741)==true )and  (CheckFlag(OwnerID(),543307)==false ) then   ---打破靜謐
                    AddSpeakOption(OwnerID(),TargetID(),"[SC_422628_0]","LuaS_422741_1",0)-------.發生什麼事？
              end

	if CheckAcceptQuest( OwnerID() ,422698 ) == true and CheckCompleteQuest( OwnerID() , 422698) == false then --尋求達馬蓋的協助任務
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422698]","LuaS_422698",0) --村長，請您給予我們協助。
	end

end

function LuaS_422740_1()-----FLAG 433 演戲用的尤米 113441
             CloseSpeak( OwnerID() )
             CallPlot( OwnerID(),"LuaS_422740_5",TargetID())
end

function LuaS_422740_2()-----FLAG 433 演戲用的尤米 113441
             CloseSpeak( OwnerID() )
             CallPlot( OwnerID(),"LuaS_422740_6",TargetID())
end
function LuaS_422740_5(LY)-----
             DisableQuest( LY,  true)
             local KK = Lua_DW_CreateObj("flag" ,113432,780433,0,1 )
             DisableQuest( KK , true )
             --PlayMotion( LY,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
             SAY( LY, "[SC_422740_1_1]" ) ----嗯，我知道了！那麼你也知道這酒有毒嗎？
             Sleep(30)
             PlayMotion( LY,ruFUSION_ACTORSTATE_CAST_INSTANT)
             SAY( LY,"[SC_422740_1_2]" )----這絕不可能是[113442]準備的。
             sleep(30)
             --PlayMotion( LY,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
             SAY( LY, "[SC_422740_1_3]" )------[113432]，去叫[113442]過來！
             Sleep(10)
             DW_MoveToFlag( KK,780433, 1 , 0,1)
             SAY( KK, "[SC_422740_1_4]" )----是的！
             DW_MoveToFlag( KK,780433,2, 0,1)
	DW_MoveToFlag( KK,780433,8, 0,1)
	DW_MoveToFlag( Kk,780433,7, 0,1)
	DW_MoveToFlag( KK,780433,6, 0,1)
	DW_MoveToFlag( KK,780433,5, 0,1)
	DW_MoveToFlag( Kk,780433,4, 0,1)
	DW_MoveToFlag( KK,780433,3, 0,1)
             SAY( LY , "[SC_422740_1_5]" )----
             DelObj(KK)
             SLEEP(25)
            BeginPlot( LY,"LuaS_422740_3", 0)
end

function LuaS_422740_6(LY)-----
	DisableQuest( LY,  true)
	local KK = Lua_DW_CreateObj("flag" ,113432,780433,0 ,1)
	DisableQuest( KK , true )
	PlayMotion( LY,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	SAY( LY, "[SC_422740_2_1]" ) ----嗯，我知道了！酒是你準備的.......那麼酒裡的毒一定也是你下的對不對？
	Sleep(30)
	PlayMotion( LY,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	SAY( LY,"[SC_422740_2_2]" )----你同時還殺了守護著我們不被蛇人侵襲的獅龍獸……
	sleep(30)
	--PlayMotion( LY,ruFUSION_ACTORSTATE_BOW_PARRY)
	SAY( LY, "[SC_422740_2_3]" )------外來者，這算是在對[ZONE_DIMARKA]村挑釁或者.......是宣戰前的示威？為了侵略[ZONE_DIMARKA]前的序曲？
	sleep(30)
	SAY( TargetID(), "[SC_422740_2_4]" )------不～不是我！是[113442]！是他要我送這些東西來的！
	sleep(30)
	PlayMotion( LY,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	SAY( LY, "[SC_422740_2_5]" )---你覺得我會相信你？還是會信任他？
	Sleep(20)
	SAY( LY, "[SC_422740_2_6]" )---呵～不過我還是會給你機會！
	Sleep(20)
	SAY( LY, "[SC_422740_1_3]" )---[113432]，去請[113442]過來！
	Sleep(20)
	DW_MoveToFlag( KK,780433,1, 0,1)
	SAY( KK, "[SC_422740_1_4]" )----是的！
	DW_MoveToFlag( KK,780433,2, 0,1)
	DW_MoveToFlag( KK,780433,8, 0,1)
	DW_MoveToFlag( KK,780433,7, 0,1)
	DW_MoveToFlag( KK,780433,6, 0,1)
	DW_MoveToFlag( KK,780433,5, 0,1)
	DW_MoveToFlag( KK,780433,4, 0,1)
	DW_MoveToFlag( KK,780433,3, 0,1)
             	SAY( LY , "[SC_422740_1_5]" )----
             	DelObj(KK)
             	SLEEP(25)
            	BeginPlot( LY,"LuaS_422740_3", 0)
end
--------------------------------------------------------------------


function LuaS_422740_3()----尤米出現
             local CC = Lua_DW_CreateObj("flag" ,113441,780433,3,1)
	DisableQuest( CC , true )
	DW_MoveToFlag( CC,780433,4, 0,1)
	DW_MoveToFlag( CC,780433,5, 0,1)
	DW_MoveToFlag( CC,780433,6, 0,1)
	DW_MoveToFlag( CC,780433,7, 0,1)
	SAY( CC, "[SC_422741_21]"  )----你找我啊？[113443]？
	sleep(10)
	DW_MoveToFlag( CC,780433,8, 0,1)
	SAY( CC, "[SC_422729_1]"  )----怎麼了嗎？
	sleep(10)
	DW_MoveToFlag( CC,780433,9, 0,1)
	AdjustFaceDir( CC , OwnerID(), 0 )
             sleep(10)
	SAY( CC, "[SC_422741_1]"  )----[113443]，這是怎麼回事？好沉重的氣氛。
	sleep(10)
	PlayMotion(  OwnerID()  ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	SAY( OwnerID()  ,  "[SC_422740_1_6]" )-----這外來者說，你要他將這毒酒和獅龍獸骨交給我？ 
	sleep(30)
	PlayMotion(  CC ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	SAY( CC , "[SC_422740_1_7]"  )-----毒酒？我怎麼可能這樣對你？殺害獅龍獸那就更不必說了！
	sleep(30)      
	PlayMotion(  CC  ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	SAY( CC , "[SC_422740_1_8]")-----牠們是守護[ZONE_DIMARKA]不被蛇人騷擾的自然防線，我怎麼可能會做出這種事來？	
	sleep(30)      
	PlayMotion(  CC  ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)	
	SAY( CC , "[SC_422740_1_9]"  )-----天啊！我從沒想過這些外來者心機這麼深，他們一定是想挑起[ZONE_DIMARKA]的內亂，好趁機佔領村莊。
	sleep(30)  
	PlayMotion(  CC  ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)    	
	SAY( CC , "[SC_422740_1_10]" )---[113443]，我必須向你致歉，我之前還不聽你的命令暗自幫忙這些外來者。                                                         	
	sleep(30)         	
	PlayMotion(  OwnerID()  ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	SAY( CC , "[SC_422740_1_16]" )---現在我徹底的體悟到這些外來者的可怕，他們個個都心懷不軌，想要侵略[ZONE_DIMARKA]，一定要好好處理他們才行！	
	sleep(30)    
	SAY( OwnerID(), "[SC_422740_1_11]"  )---我知道了.......這個人我會處裡，你先去忙你的吧！
	sleep(30)         	
	SAY( CC , "[SC_422740_1_12]"  )---既然你這麼說，那麼我就先走了！只不過[113443]，你自己一定要小心一點。
            	BeginPlot( CC,"LuaS_422740_11", 0)
	sleep(10)
             SAY( OwnerID() , "[SC_422740_1_13]"  )---[$PLAYERNAME]，現在你還有什麼話好說的？
             sleep(30)
             SAY( OwnerID(), "[SC_422740_1_14]" )---乖乖，被束縛吧！
             PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_EMOTE_POINT)
             CastSpell(TargetID(),OwnerID(),491276)
             AddBuff( TargetID(), 504669,1,35)-----最後一個是秒數
	sleep(80)
             if CheckID( TargetID() ) == true and CheckAcceptQuest( TargetID(),  422740) == true then
             SetFlag( TargetID(),543305,1)  
	end
             Tell(  TargetID(),OwnerID() , "[SC_422740_1_15]")------
             DisableQuest( OwnerID() , false )
END


function LuaS_422740_11()-----
             sleep(20)
	DW_MoveToFlag( OwnerID() ,780433,8, 0,1)
	DW_MoveToFlag(  OwnerID() ,780433,7, 0,1)
	sleep(10)
	DW_MoveToFlag( OwnerID() ,780433,6, 0,1)
	DW_MoveToFlag(  OwnerID() ,780433,5, 0,1)
	DW_MoveToFlag(  OwnerID() ,780433,4, 0,1)
	DW_MoveToFlag(  OwnerID() ,780433,3, 0,1)
             DelObj(OwnerID()) 
end

----------------------------------------------------------------
function LuaS_422741_1()
             	SetSpeakDetail(OwnerID(),"[SC_422741_2]")      
	            SetFlag(OwnerID(),543307,1)
end
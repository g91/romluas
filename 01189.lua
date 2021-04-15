function LuaS_421750_1()---喀米爾
	if  CheckFlag(OwnerID(), 542316) == false and CheckAcceptQuest( OwnerID(),  421750 ) == true then  
		SetSpeakDetail( OwnerID(), "[SC_421750_0]"  );--/*潘尼西亞？我當然知道~只不過~
		if  CountBodyItem( OwnerID() , 203644 ) > 1 then
			AddSpeakOption( OwnerID(), TargetID(), "[SC_421750_1]" , "LuaS_421750_2", 0 )  ---這是報酬，請給我相關的情報吧。
		end
	else
		LoadQuestOption( OwnerID() )  --載入任務模板
	end
	
end

function LuaS_421750_2()
                DelBodyItem ( OwnerID(),   203644, 1 )	
               SetSpeakDetail( OwnerID(), "[SC_421750_2]" )	
	AddSpeakOption( OwnerID(), TargetID() ,  "[SC_421750_3]" , "LuaS_421750_3", 0 ) 	

end

function LuaS_421750_3()
	CloseSpeak( OwnerID() );	--關閉對話視窗
	SetFlag( OwnerID(),542316, 1 ); --給予完成任務的旗標


end
--------------------------------------------------------------------------------------------------------------------------------------------
function LuaS_421750_4()---薩隆德
          	if  CheckFlag(OwnerID(), 542317) == false and CheckAcceptQuest( OwnerID(),  421750 ) == true and CountBodyItem( OwnerID() , 203644 ) > 1 then  
		SetSpeakDetail( OwnerID(), "[SC_421750_4]"  );--/*潘尼西亞？呵~你想用多少報酬換取這個情報?
		if  CountBodyItem( OwnerID() , 203644 ) > 1 then
			AddSpeakOption( OwnerID(), TargetID(), "[SC_421750_1]" , "LuaS_421750_5", 0 )  ---這是報酬，請給我相關的情報吧。
		end
	else
		LoadQuestOption( OwnerID() )  --載入任務模板
	end
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_421750_5()
              DelBodyItem ( OwnerID(),   203644, 1 )	
               SetSpeakDetail( OwnerID(), "[SC_421750_5]" )---紅珠石？這倒是個不錯的交易！

	AddSpeakOption( OwnerID(), TargetID() ,  "[SC_421750_3]" , "LuaS_421750_6", 0 ) 	

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_421750_6()
	CloseSpeak( OwnerID() );	--關閉對話視窗
	SetFlag( OwnerID(),542317, 1 ); --給予完成任務的旗標
END

---------------------------------------------------------------------------------------------------
function LuaS_421718()---亞尼哈
	if   CountBodyItem( OwnerID() , 203631 )< 1  and CheckCompleteQuest( OwnerID(),  421802  ) == true  and    CheckCompleteQuest( OwnerID(),  421750  ) ==  FALSE    and CheckCompleteQuest( OwnerID(),  421718  ) == FALSE      then  
                               LoadQuestOption( OwnerID() )
		AddSpeakOption( OwnerID(), TargetID(), "[SC_421718_1]" , "LuaS_421718_1", 0 )  ---請問你有看到打開寶箱後的那張[203631]嗎？
else
		LoadQuestOption( OwnerID() )  --載入任務模板

	end
end

function LuaS_421718_1()
	SetSpeakDetail( OwnerID(),   "[SC_421718_2]" ) ----  難怪內容有些熟悉，拿去吧！不要再掉了！
	GiveBodyItem( OwnerID(),  203631 , 1 ); --給予物品
END

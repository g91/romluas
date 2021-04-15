function LuaS_421930()---貝尼
	if   CountBodyItem( OwnerID() , 203952 )< 1  and CheckAcceptQuest( OwnerID(),  421930 ) == true then  
                                LoadQuestOption( OwnerID() )
		AddSpeakOption( OwnerID(), TargetID(), "[SC_421930_1]" , "LuaS_421930_1", 0 )  ---貝尼，請我過來向您借取古代事典
else
		LoadQuestOption( OwnerID() )  --載入任務模板

	end
end
function LuaS_421930_1()
	SetSpeakDetail( OwnerID(),   "[SC_421930_2]" ) 
	GiveBodyItem( OwnerID(),203952, 1 ); --給予完成任務的旗標
END

-----------------------------------------------------------------------------------
function LuaS_112409()---席拉
	if  CheckFlag(OwnerID(), 542409 ) == false and CheckAcceptQuest( OwnerID(),  421933 ) == true then  
                                      LoadQuestOption( OwnerID() )
		AddSpeakOption( OwnerID(), TargetID(), "[SC_421933_1]"  , "LuaS_112409_1" ,  0 )  ---請問你知道有關魅影魔珠或路易的相關資訊嗎？
else
		LoadQuestOption( OwnerID() )  --載入任務模板

	end
end
function LuaS_112409_1()
	SetSpeakDetail( OwnerID(),   "[SC_421933_2]"  ) ---魔珠～哈哈哈哈哈 那是什麼東西？來～喝酒～喝酒～

END
-----------------------------------------------------------
function LuaS_112359()---
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_SIT_CHAIR_BEGIN,ruFUSION_ACTORSTATE_SIT_CHAIR_BEGIN)
	sleep(30)
                BeginPlot(TargetID() , "LuaS_421932_0" , 0)
end


function LuaS_421933()---艾洛哈
	if  CheckFlag(OwnerID(), 542409 ) == false and CheckAcceptQuest( OwnerID(),  421933 ) == true then  
                                 LoadQuestOption( OwnerID() )
		AddSpeakOption( OwnerID(), TargetID(), "[SC_421933_1]"  , "LuaS_421933_1" ,  0 )  ---請問你知道有關魅影魔珠或路易的相關資訊嗎？
		
	else
		LoadQuestOption( OwnerID() )  --載入任務模板
	end
end

function LuaS_421933_1()

	SetSpeakDetail( OwnerID(),   "[SC_421933_3]" ) 
                SetFlag( OwnerID(),542409, 1 );
END

-----------------------------------------------

function LuaS_112355()---羅爾
	if   CountBodyItem( OwnerID() , 203945 )< 1  and CheckAcceptQuest( OwnerID(),  421929 ) == true then  
                               LoadQuestOption( OwnerID() )
		AddSpeakOption( OwnerID(), TargetID(), "[SC_421929_1]" , "LuaS_421929_1", 0 )  ---請問你有沒有到我所帶來的古文件？
else
		LoadQuestOption( OwnerID() )  --載入任務模板

	end
end
function LuaS_421929_1()
	SetSpeakDetail( OwnerID(),   "[SC_421929_2]" ) ----這份文件果然是你的，記得拿好不要再掉了！
	GiveBodyItem( OwnerID(), 203945, 1 ); --給予完成任務的旗標
END
------------------------------------------------
function LuaS_203978_0(Check)---榮耀之鍊
	if Check == 1 then
	               if   CountBodyItem( OwnerID() , 203962) >=1 then
			return  true
		else
			return false
		end
	else
		if DelBodyItem( OwnerID() , 203962 , 1 ) == true then
			GiveBodyItem(OwnerID() , 223728 , 1)
		end
	end
end


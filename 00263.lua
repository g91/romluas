function LuaS_110111_0()

	LoadQuestOption( OwnerID() );
	if CheckFlag( OwnerID(), 540227 ) then  
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_2") , "LuaS_110111_2", 0 ) 
		--/*領取報酬
	else
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_1") , "LuaS_110111_1", 0 ) 
		--/*有什麼工作？
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_0") , "LuaS_110111_EXIT", 0 ); --/*結束對話
	end
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110111_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110111_1")   );
	--/*長羽莊園現在正需要人手幫忙，如果你幫助我們收集物資，就會獲得【長羽莊園證明】。
	--  將【長羽莊園證明】拿來這裡便可領取酬勞，不同的任務會給予不同數量的收據。
	--
	--  如果你要幫忙的話，就請在這裡簽上你的大名。  

	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_3") , "LuaS_110111_3", 0 ) 
	--/*簽字
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_8") , "LuaS_110111_EXIT", 0 ); --/*再考慮

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110111_2()

	SetSpeakDetail( OwnerID(), GetString("ST_110111_2")   );
	--/*你要繳交多少【長羽莊園證明】呢？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_4") , "LuaS_110111_4", 0 ) 
	--/*繳交一張
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_5") , "LuaS_110111_5", 0 ) 
	--/*繳交兩張
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_6") , "LuaS_110111_6", 0 ) 
	--/*繳交五張
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_7") , "LuaS_110111_7", 0 ) 
	--/*繳交十張
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_9") , "LuaS_110111_0", 0 ); --/*回上一頁
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_0") , "LuaS_110111_EXIT", 0 ); --/*結束對話

end
--------------------------------------------------------------------------------------------------------------------
function LuaS_110111_3()

	SetSpeakDetail( OwnerID(), GetString("ST_110111_3")   );
	--/*好，這樣就可以了，感謝你的幫助。
	--  當你蒐集到足夠的【長羽莊園證明】，請來找我領取你的報酬。
	SetFlag( OwnerID() , 540227 , 1)
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_0") , "LuaS_110111_EXIT", 0 ); --/*結束對話

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110111_4()
	if CountBodyItem( OwnerID() , 200582 ) < 1 then
		SetSpeakDetail( OwnerID(), GetString("ST_110111_4")   ); 
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_9") , "LuaS_110111_2", 0 ); --/*回上一頁
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_0") , "LuaS_110111_EXIT", 0 ); --/*結束對話
	else
		CloseSpeak( OwnerID() );
		DelBodyItem( OwnerID() , 200582 , 1 )
		AddRoleValue( OwnerID() , EM_RoleValue_Money , 50 )
	end
end
--------------------------------------------------------------------------------------------------------------------
function LuaS_110111_5()
	if CountBodyItem( OwnerID() , 200582 ) < 2 then
		SetSpeakDetail( OwnerID(), GetString("ST_110111_4")   ); 
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_9") , "LuaS_110111_2", 0 ); --/*回上一頁
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_0") , "LuaS_110111_EXIT", 0 ); --/*結束對話
	else
		CloseSpeak( OwnerID() );
		DelBodyItem( OwnerID() , 200582 , 2 )
		AddRoleValue( OwnerID() , EM_RoleValue_Money , 100 )
	end
end
--------------------------------------------------------------------------------------------------------------------
function LuaS_110111_6()
	if CountBodyItem( OwnerID() , 200582 ) < 5 then
		SetSpeakDetail( OwnerID(), GetString("ST_110111_4")   ); 
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_9") , "LuaS_110111_2", 0 ); --/*回上一頁
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_0") , "LuaS_110111_EXIT", 0 ); --/*結束對話
	else
		CloseSpeak( OwnerID() );
		DelBodyItem( OwnerID() , 200582 , 5 )
		AddRoleValue( OwnerID() , EM_RoleValue_Money , 250 )
	end
end

--------------------------------------------------------------------------------------------------------------------
function LuaS_110111_7()
	if CountBodyItem( OwnerID() , 200582 ) < 10 then
		SetSpeakDetail( OwnerID(), GetString("ST_110111_4")   ); 
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_9") , "LuaS_110111_2", 0 ); --/*回上一頁
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110111_0") , "LuaS_110111_EXIT", 0 ); --/*結束對話
	else
		CloseSpeak( OwnerID() );
		DelBodyItem( OwnerID() , 200582 , 10 )
		AddRoleValue( OwnerID() , EM_RoleValue_Money , 500 )
	end
end
--------------------------------------------------------------------------------------------------------------------
function LuaS_110111_EXIT()

	CloseSpeak( OwnerID() );	--關閉對話視窗
end
--------------------------------------------------------------------------------------------------------------------


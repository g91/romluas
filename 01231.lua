function LuaI_203782_Quest()---華美徽章
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());	--初始化石碑介面
	AddBorderPage( OwnerID(), "[SC_421914]")
                      ShowBorder( OwnerID(), 421914,str , "ScriptBorder_Texture_Paper" )	

end

function LuaS_421922_1()---路凡的回應
	if  CheckFlag(OwnerID(), 542402 ) == false and CheckAcceptQuest( OwnerID(),  421922 ) == true then  
                                LoadQuestOption( OwnerID() )  
		AddSpeakOption( OwnerID(), TargetID(), "[SC_421922_1]" , "LuaS_421922_2", 0 )  ---路易似乎失蹤了，請問你有任何的相關情報嗎？
	else
		LoadQuestOption( OwnerID() )  --載入任務模板

end
end
function LuaS_421922_2()
	SetSpeakDetail( OwnerID(),   "[SC_421922_2]"  ) 
	SetFlag( OwnerID(),542402, 1 ); --給予完成任務的旗標
END


function LuaS_421922_3()---狄瑞莎的回應
	if  CheckFlag(OwnerID(), 542403 ) == false and CheckAcceptQuest( OwnerID(),  421922 ) == true then  
                                LoadQuestOption( OwnerID() )  
		AddSpeakOption( OwnerID(), TargetID(), "[SC_421922_1]" , "LuaS_421922_4", 0 )  ---路易似乎失蹤了，請問你有任何的相關情報嗎？
else
		LoadQuestOption( OwnerID() )  --載入任務模板
end
end
function LuaS_421922_4()
	SetSpeakDetail ( OwnerID(),   "[SC_421922_3]" ) 	
	SetFlag( OwnerID(),542403, 1 ); --給予完成任務的旗標
END

function LuaS_421922_5()---希歷的回應
	if  CheckFlag(OwnerID(), 542404 ) == false and CheckAcceptQuest( OwnerID(),  421922 ) == true then  
                                LoadQuestOption( OwnerID() )  
		AddSpeakOption( OwnerID(), TargetID(), "[SC_421922_1]" , "LuaS_421922_6", 0 )  ---路易似乎失蹤了，請問你有任何的相關情報嗎？
else
		LoadQuestOption( OwnerID() )  --載入任務模板

end
end
function LuaS_421922_6()
	SetSpeakDetail ( OwnerID(),   "[SC_421922_4]" ) 	
	SetFlag( OwnerID(),542404, 1 ); --給予完成任務的旗標
END

function LuaS_421922_7()---伊克斯的回應
	if  CheckFlag(OwnerID(), 542405 ) == false and CheckAcceptQuest( OwnerID(),  421922 ) == true then  
                      LoadQuestOption( OwnerID() )  
	     AddSpeakOption( OwnerID(), TargetID(), "[SC_421922_1]" , "LuaS_421922_8", 0 )  ---路易似乎失蹤了，請問你有任何的相關情報嗎？
else
		LoadQuestOption( OwnerID() )  --載入任務模板
end
end
function LuaS_421922_8()
	SetSpeakDetail ( OwnerID(),  "[SC_421922_5]" ) 	
	SetFlag( OwnerID(),542405, 1 ); --給予完成任務的旗標
END

----------------------------判斷是否達到19級

function LuaI_421923_Quest()
	LoadQuestOption( OwnerID() )
	local PLAYERLV = ReadRoleValue( OwnerID() , EM_RoleValue_Lv )
	if (PLAYERLV > 18 )and(CheckFlag( OwnerID() , 542406 )==false)then
		SetFlag(OwnerID() , 542406 , 1 )
	end
end

---------------------------
function LuaI_203923() --名單203923
	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), "[SC_203923]");
	ShowBorder( OwnerID(), 0, "[203923]", "ScriptBorder_Texture_Paper" );
end



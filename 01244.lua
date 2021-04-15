-----function LuaI_204068_Quest()---紙籤
------	ClearBorder( OwnerID());	--初始化石碑介面
-------	AddBorderPage( OwnerID(), "[SC_204068]")
--------                    ShowBorder( OwnerID(), 421941, GetObjNameByGUID(GetUseItemGUID(OwnerID())), "ScriptBorder_Texture_Paper" )	

------end


function LuaS_111257()---維斯塔妮
	if   CountBodyItem( OwnerID() , 203961 )< 1  and CheckAcceptQuest( OwnerID(),  421943 ) == true then  
                                LoadQuestOption( OwnerID() )
		AddSpeakOption( OwnerID(), TargetID(), "[SC_421943_1]" , "LuaS_421943_1", 0 )  ---路易，請我過來向你借取優暗之儀！
else
		LoadQuestOption( OwnerID() )  --載入任務模板

	end
end
function LuaS_421943_1()
	SetSpeakDetail( OwnerID(),   "[SC_421943_2]" ) ---路易想借取優暗之儀？我是這麼的仰慕他，不要說借了，我甚至願意將幽暗之儀送他！這就是幽暗之儀，你幫我拿給他吧！不用環也沒關係，只要我能幫上忙的地方，儘管說吧！
                                                                     
	GiveBodyItem( OwnerID() , 203961 , 1 ); --給予完成任務的旗標
END
-------------------------------------------------------------------------------------------------

function LuaI_203984() --秘密信件
	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), "[SC_203984]");
	ShowBorder( OwnerID(), 0, "[203984]", "ScriptBorder_Texture_Paper" );
end
--------------------------------------------------------------------------------------------------
function LuaI_112404_0()----守護者召喚石
 	SetPlot( OwnerID() , "Range" , "LuaI_112404_1" , 50 )
end
function LuaI_112404_1()
	if(CheckAcceptQuest( OwnerID() , 421948 ) == true and Countbodyitem( OwnerID() , 203964 ) >=1)  then
	BeginPlot( OwnerID() , "LuaI_112404_2" , 0 )
	end
end
function LuaI_112404_2()
	if Countbodyitem( OwnerID() , 203964 ) >=1  and CountBodyItem( OwnerID() , 203977 ) ==0 then
	    ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_112404]", 0)
	     GiveBodyItem( OwnerID() , 203977 , 1 )
                      DelBodyItem ( OwnerID() , 203964 , 1 )	

	END
END


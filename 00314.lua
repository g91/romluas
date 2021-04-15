--------------------------------------------------------------------------------------------------------------
--瑪爾斯軍旅日記
Function LuaI_200936_Quest()
	local Str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());	--初始化石碑介面
	AddBorderPage( OwnerID(), GetString("ST_200936_1"));
	AddBorderPage( OwnerID(), GetString("ST_200936_2"));
	AddBorderPage( OwnerID(), GetString("ST_200936_0"));
	AddBorderPage( OwnerID(), GetString("ST_200936_3"));
	AddBorderPage( OwnerID(), GetString("ST_200936_4"));
	AddBorderPage( OwnerID(), GetString("ST_200936_5"));
	AddBorderPage( OwnerID(), GetString("ST_200936_0"));
	AddBorderPage( OwnerID(), GetString("ST_200936_6"));
	AddBorderPage( OwnerID(), GetString("ST_200936_0"));
	AddBorderPage( OwnerID(), GetString("ST_200936_7"));
	AddBorderPage( OwnerID(), GetString("ST_200936_8"));
	AddBorderPage( OwnerID(), GetString("ST_200936_0"));
	AddBorderPage( OwnerID(), GetString("ST_200936_9"));
	AddBorderPage( OwnerID(), GetQuestDetail( 420349, 1 ));

	ShowBorder( OwnerID(), 420349, str,"ScriptBorder_Texture_Paper" )	

end

--------------------------------------------------------------------------------------------------------------
--阿耶羅的羽毛
Function LuaI_201635_Quest()
	local Str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());	--初始化石碑介面
	AddBorderPage( OwnerID(), GetQuestDetail( 420733, 1 ));

	ShowBorder( OwnerID(), 420733, str , "ScriptBorder_Texture_Paper" )	

end
--詔告天下
function LuaQ_420733_Complete()
	local Name = GetName( TargetID() )
	local String = "[SAY_420733_0][$SETVAR1="..Name.."]"
	RunningMsg( OwnerID() , 1 , String )
end
--------------------------------------------------------------------------------------------------------------
--怪異的信
Function LuaI_201646_Quest()
	local Str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());	--初始化石碑介面
	AddBorderPage( OwnerID(), GetQuestDetail( 420761, 1 ));

	ShowBorder( OwnerID(), 420761, Str, "ScriptBorder_Texture_Paper" )	

end

--------------------------------------------------------------------------------------------------------------
function LuaS_110913_0()
	LoadQuestOption(OwnerID())
	if CheckCompleteQuest(OwnerID(),420761) == false and CountBodyItem(OwnerID(),201646) == 0 then
		AddSpeakOption(  OwnerID(), TargetID( ), GetString("SO_110913_1"),  "LuaS_110913_1",  0 );
		--/*仔細檢查屍體
	end
end
--------------------------------------------------------------------------------------------------------------
function LuaS_110913_1()
	SetSpeakDetail( OwnerID(), GetString("ST_110913_1")   ); --/*你發現屍體的懷中有一份摺起來的紙。
	if CheckCompleteQuest(OwnerID(),420761) == false and CountBodyItem(OwnerID(),201646) == 0 then
		AddSpeakOption(  OwnerID(), TargetID( ), GetString("SO_110913_2"),  "LuaS_110913_2",  0 );
		--/*將摺起來的紙抽出
	end
end
--------------------------------------------------------------------------------------------------------------
function LuaS_110913_2()
	CloseSpeak( OwnerID() )
	GiveBodyItem( OwnerID() ,201646, 1 )
end
--------------------------------------------------------------------------------------------------------------
function LuaS_110919_0()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),420761) == true then
		SetSpeakDetail( OwnerID(), GetString("ST_110919_1")   ); 
		--/*這個土堆看得出來被野獸挖過，你從挖開的土壤中看到下方似乎埋藏了什麼東西。
	elseif CheckCompleteQuest(OwnerID(),420761) == true then 
		SetSpeakDetail( OwnerID(), GetString("ST_110919_2")   ); 
		--/*這個土堆中已經沒有什麼你感興趣的東西了。
	end
end
--------------------------------------------------------------------------------------------------------------
function LuaS_110917_0()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),420740) == true then
		AddSpeakOption(OwnerID(),TargetID(),GetString("SO_420740_1"),"LuaS_110917_1",0)
	end
end
--------------------------------------------------------------------------------------------------------------
function LuaS_110917_1()
	SetSpeakDetail( OwnerID(), GetString("ST_420740_1")   ); 
	GiveBodyItem(OwnerID(),201668,1)
end
--------------------------------------------------------------------------------------------------------------
--卡沙喀的回應
Function LuaI_200432_Quest()
	local Str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());	--初始化石碑介面
	AddBorderPage( OwnerID(), GetString("ST_200432_1"));
	AddBorderPage( OwnerID(), GetString("ST_200432_2"));
	ShowBorder( OwnerID(), 0,str,"ScriptBorder_Texture_Paper" )	

end
--------------------------------------------------------------------------------------------------------------
function LuaS_Kasak_A()
	if CheckCompleteQuest(OwnerID(),420339) == false then
		SetSpeakDetail( OwnerID(), GetString("ST_KASAK_1")   ); 
	else
		SetSpeakDetail( OwnerID(), GetString("ST_KASAK_2")   ); 
	end
end
--------------------------------------------------------------------------------------------------------------
function LuaS_Kasak_B()
	if CheckCompleteQuest(OwnerID(),420339) == false then
		SetSpeakDetail( OwnerID(), GetString("ST_KASAK_3")   ); 
	else
		SetSpeakDetail( OwnerID(), GetString("ST_KASAK_4")   ); 
	end
end
--------------------------------------------------------------------------------------------------------------
--掉落的情書
Function LuaI_202787_Quest()
	local Str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());	--初始化石碑介面
	AddBorderPage( OwnerID(), GetString( "SC_202787_1" ));

	ShowBorder( OwnerID(), 421388,Str,"ScriptBorder_Texture_Paper" )	

end

--------------------------------------------------------------------------------------------------------------
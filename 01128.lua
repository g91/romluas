Function LuaI_203544_Quest()---羊皮卷軸
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());	--初始化石碑介面
	AddBorderPage( OwnerID(), GetQuestDetail( 421665 , 1 ) );
	ShowBorder( OwnerID(), 421665, str , "ScriptBorder_Texture_Paper" )	

end

function LuaS_421665_Quest()
	LoadQuestOption( OwnerID() )
	if ( CheckAcceptQuest(OwnerID() , 421665) == true ) and (CheckFlag( OwnerID() , 542294 )== false) then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_112043_1]","LuaS_421665_1",0)
	end
--	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_OPENSHOP") , "LuaS_112051_1" , 0 )	-- 增加一個選項：開啟商店
end


function LuaS_421665_1()
	SetSpeakDetail( OwnerID() ,"[SC_112043_2]")
               AddSpeakOption(OwnerID(),TargetID(),"[SC_112043_3]","LuaS_421665_2",0)	
end


function LuaS_421665_2()
	SetSpeakDetail(OwnerID(),"[SC_112043_4]")
                SetFlag(OwnerID() , 542294 , 1 )
end

function LuaS_421665_3()
	HighBora_SHOP()
	LuaP_Sitting()
end

function LuaS_112051_0()	--海波拉古城商人
		LoadQuestOption( OwnerID() )	
		AddSpeakOption( OwnerID() , TargetID() , GetString("SO_OPENSHOP") , "LuaS_112051_1" , 0 )	-- 增加一個選項：開啟商店
end

function LuaS_112051_1()
	CloseSpeak( OwnerID() )			-- 關閉對話視窗
	OpenShop()
end




function LuaS_421665_book_0()
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), "[SC_421665_6]" )
	AddBorderPage( OwnerID(), "[SC_421665_7]" )
	AddBorderPage( OwnerID(), "[SC_421665_8]" )
	AddBorderPage( OwnerID(), "[SC_421665_9]" )
	ShowBorder( OwnerID(), 0, "[SC_421665_10]" , "ScriptBorder_Texture_Paper" )
end


function LuaS_421665_book_1()
	BeginPlot(OwnerID() , "LuaS_421665_book_2" , 0)
end


function LuaS_421665_book_2()
	ScriptMessage( OwnerID(), OwnerID(),  2 , "[SC_421665_5]", 0 )
	ScriptMessage( OwnerID(), OwnerID(),  0 , "[SC_421665_5]", 0 )
	CastSpell(OwnerID() , OwnerID() , 491276)
	sleep(30)
	BeginPlot(OwnerID() , "LuaS_421665_book_0" , 0 )
end

function Lua_mika_dancefes_mailok() -- 邀請函郵差完成後 劇情 掛任務模板
	SetFlag( TargetID()  , 542390 , 0 )  --刪 任務進行中 flag	
	SetFlag( TargetID()  , 543767, 1 )  --給 今天已完成任務 flag
	local letter =  CountBodyItem(  TargetID() , 203865 ) --舞會邀請函			
	DelBodyItem(  TargetID() , 203865 , letter ) --邀請函
end

function Lua_mika_dancefes_mission1ok() -- 春之禮讚完成後劇情  掛任務模板
	SetFlag( TargetID()  , 543766, 1 )  --給 今天已完成任務 flag
end

function Lua_mika_dancefes_delquest() -- 刪兩個任務的完成flag
	SetFlag( TargetID()  , 543766, 0 )  --
	SetFlag( TargetID()  , 543767, 0 )  --
end


function Lua_mika_dancefes_mail() 
	LoadQuestOption(OwnerID())  --載入任務模板
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_112311_011]" , "LuaN_112311_1", 0 ) --我想了解歡舞節的來源 
end
----------------------------------------------------------------------------------------------
function Lua_mika_dancefes_mail1() --112314 戴妮．史拉德
	local mission = CheckFlag(OwnerID(), 542390)
	local ok = CheckFlag(OwnerID(), 542393)
	if ok == true then 
		SetSpeakDetail( OwnerID(), "[SC_112314_02]" ) 
	else
		SetSpeakDetail( OwnerID(), "[SC_112314_03]" )--  
		if mission == true then --任務進行中
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_DANCEFES_MAIL01]" , "Lua_mika_dancefes_mail11", 0 ) --交付[203865]
		end
	end
end

function Lua_mika_dancefes_mail11() 
	local letter =  CountBodyItem( OwnerID() , 203865 ) --舞會邀請函
	if letter > 0 then
		Closespeak(OwnerID())
		DelBodyItem( OwnerID() , 203865 , 1 ) --邀請函
		SetFlag( OwnerID()  , 542393 , 1 ) -- 給玩家 getnpc1 Flag
	else
		SetSpeakDetail( OwnerID(), "[SC_1123_LOST]" )-- 什麼？你說把邀請函搞丟了？我沒聽錯吧？
	end
end
-----------------------------------------------------------------------------------------
function Lua_mika_dancefes_mail2() --112315 沙菲．羅捷
	local mission = CheckFlag(OwnerID(), 542390)
	local ok = CheckFlag(OwnerID(), 542391)
	if ok == true then 
		SetSpeakDetail( OwnerID(), "[SC_DANCEFES_MAIL02]" )
	else
		SetSpeakDetail( OwnerID(), "[SC_112315_01]" )--  
		if mission == true then --任務進行中
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_DANCEFES_MAIL01]" , "Lua_mika_dancefes_mail12", 0 ) --交付[203865]
		end
	end
end

function Lua_mika_dancefes_mail12() 
	local letter =  CountBodyItem( OwnerID() , 203865 ) --舞會邀請函
	if letter > 0 then
		Closespeak(OwnerID())
		DelBodyItem( OwnerID() , 203865 , 1 ) --邀請函
		SetFlag( OwnerID()  , 542391 , 1 ) -- 給玩家 getnpc1 Flag
	else
		SetSpeakDetail( OwnerID(), "[SC_1123_LOST]" )-- 什麼？你說把邀請函搞丟了？我沒聽錯吧？
	end
end
-----------------------------------------------------------------------------------------
function Lua_mika_dancefes_mail3() --112316 可利雅．伍德
	local mission = CheckFlag(OwnerID(), 542390)
	local ok = CheckFlag(OwnerID(), 542392)
	if ok == true then 
		SetSpeakDetail( OwnerID(), "[SC_112316_02]" )
	else
		SetSpeakDetail( OwnerID(), "[SC_112316_01]" )--  
		if mission == true then --任務進行中
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_DANCEFES_MAIL01]" , "Lua_mika_dancefes_mail13", 0 ) --交付[203865]
		end
	end
end

function Lua_mika_dancefes_mail13() 
	local letter =  CountBodyItem( OwnerID() , 203865 ) --舞會邀請函
	if letter > 0 then
		Closespeak(OwnerID())
		DelBodyItem( OwnerID() , 203865 , 1 ) --邀請函
		SetFlag( OwnerID()  , 542392 , 1 ) -- 給玩家 getnpc1 Flag
	else
		SetSpeakDetail( OwnerID(), "[SC_1123_LOST]" )-- 什麼？你說把邀請函搞丟了？我沒聽錯吧？
	end
end
-----------------------------------------------------------------------------------------
function Lua_mika_dancefes_mail4() --112317 傑德．弗瑞奇
	local mission = CheckFlag(OwnerID(), 542390)
	local ok = CheckFlag(OwnerID(), 542394)
	if ok == true then 
		SetSpeakDetail( OwnerID(), "[SC_112317_03]" )
	else
		SetSpeakDetail( OwnerID(), "[SC_DANCEFES_MAIL03]" )--  
		if mission == true then --任務進行中
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_DANCEFES_MAIL01]" , "Lua_mika_dancefes_mail14", 0 ) --交付[203865]
		end
	end
end

function Lua_mika_dancefes_mail14() 
	local letter =  CountBodyItem( OwnerID() , 203865 ) --舞會邀請函
	if letter > 0 then
		Closespeak(OwnerID())			
		DelBodyItem( OwnerID() , 203865 , 1 ) --邀請函
		SetFlag( OwnerID()  , 542394 , 1 ) -- 給玩家 getnpc1 Flag
	else
		SetSpeakDetail( OwnerID(), "[SC_1123_LOST]" )-- 什麼？你說把邀請函搞丟了？我沒聽錯吧？
	end
end
-----------------------------------------------------------------------------------------
function Lua_mika_dancefes_mail5() --112318 繆茲．菲塔
	local mission = CheckFlag(OwnerID(), 542390)
	local ok = CheckFlag(OwnerID(), 542395)
	if ok == true then 
		SetSpeakDetail( OwnerID(), "[SC_112318_03]" )
	else
		SetSpeakDetail( OwnerID(), "[SC_112318_01]" )--  
		if mission == true then --任務進行中
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_DANCEFES_MAIL01]" , "Lua_mika_dancefes_mail15", 0 ) --交付[203865]
		end
	end
end

function Lua_mika_dancefes_mail15() 
	local letter =  CountBodyItem( OwnerID() , 203865 ) --舞會邀請函
	if letter > 0 then
		Closespeak(OwnerID())
		DelBodyItem( OwnerID() , 203865 , 1 ) --邀請函
		SetFlag( OwnerID()  , 542395 , 1 ) -- 給玩家 getnpc1 Flag
	else
		SetSpeakDetail( OwnerID(), "[SC_1123_LOST]" )-- 什麼？你說把邀請函搞丟了？我沒聽錯吧？
	end
end
-----------------------------------------------------------------------------------------
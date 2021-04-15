function LuaS_421774()
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),421774)==true )and( CheckCompleteQuest( OwnerID() , 421774) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421774]","LuaS_421774_2",0)--好吧，請告訴我你的想法。
	end
end


function LuaS_421774_2()  

	SetSpeakDetail(OwnerID(),"[SC_421774_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_421774_2]","LuaS_421774_3",0)--原來如此，我明白了。
		
end

function LuaS_421774_3() 
	SetFlag(OwnerID() , 542422 , 1 )
	CloseSpeak( OwnerID())
end

function LuaS_421775_9()
	local ball = Lua_DW_CreateObj("flag" ,112412, 780293,1 )	--法曼提出生製造一顆魔法能量暫存晶球
	WriteRoleValue ( ball , EM_RoleValue_PID,OwnerID()  )	--將OwnerID()<法曼提>寫進ball裡
end


function LuaS_421775()	--使用火之能量
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==112412		then
		CastSpell( TargetID(),TargetID(),492671)	--施法特效
		BeginPlot( TargetID(), "LuaS_421775_1", 0 )		
	end
	return 1
end

function LuaS_421775_1()
	Sleep(10)
	SetFlag( TargetID(),542423, 1 )
	Local FMT= ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	Say(FMT,"[SC_421775]")
end


function LuaS_421778()	--使用水之能量
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==112412		then	
		CastSpell( TargetID(),TargetID(),492672)
		BeginPlot( TargetID(), "LuaS_421778_1", 0 )
	end
	return 1
end

function LuaS_421778_1()
	Sleep(10)
	SetFlag( TargetID(),542424, 1 )
	Local FMT= ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	Say(FMT,"[SC_421778]")
end



function LuaS_421780()	--使用風之能量
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==112412		then
	CastSpell( TargetID(),OwnerID(),492673)	--施法
	AddBuff(OwnerID() , 502944 , 0 , 60 ) 
             
	end	
	return 1	
end


function LuaS_421780_2()

	if ReadRoleValue(TargetID() , EM_RoleValue_OrgID) ~= 100443 then
	
		return false
	end

	if ReadRoleValue(TargetID() , EM_RoleValue_AttackTargetID ) ~= OwnerID() then
	
		return false
	end
	SetFlag( OwnerID(),542425, 1 )
	return true
end

function LuaS_421780_3()
	AddBuff(TargetID() ,502943 , 0 , 10 ) 
end



function LuaS_422043()	--使用驅蠍劑

	AddBuff(OwnerID() , 502948 , 0 , 60 )  
end

function LuaS_422043_1()

	if ReadRoleValue(TargetID() , EM_RoleValue_OrgID) ~= 100443 then
	
		return false
	end

	if ReadRoleValue(TargetID() , EM_RoleValue_AttackTargetID ) ~= OwnerID() then
	
		return false
	end
	SetFlag( OwnerID(),542426, 1 )
	return true
end

function LuaS_422043_2()

	AddBuff(TargetID() , 502949 , 0 , 10 )  
end


function LuaS_422044()	--使用魔法能量暫存晶球
	CastSpell( OwnerID(),OwnerID(),492676)
	BeginPlot( TargetID(), "LuaS_422044_1", 0 )
end

function LuaS_422044_1()
	Sleep(10)
	SetFlag( TargetID(),542381, 1 )
		
end


function LuaS_422044_2()
	local NPC = SearchRangeNPC ( OwnerID() , 30 )
	for i=0,table.getn(NPC)-1 do
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==112415	then
			return true
		end
	end
	ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_422044]", 0 )
	return false
end



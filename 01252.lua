function LuaS_421774()
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),421774)==true )and( CheckCompleteQuest( OwnerID() , 421774) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421774]","LuaS_421774_2",0)--�n�a�A�Чi�D�ڧA���Q�k�C
	end
end


function LuaS_421774_2()  

	SetSpeakDetail(OwnerID(),"[SC_421774_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_421774_2]","LuaS_421774_3",0)--��Ӧp���A�ک��դF�C
		
end

function LuaS_421774_3() 
	SetFlag(OwnerID() , 542422 , 1 )
	CloseSpeak( OwnerID())
end

function LuaS_421775_9()
	local ball = Lua_DW_CreateObj("flag" ,112412, 780293,1 )	--�k�Ҵ��X�ͻs�y�@���]�k��q�Ȧs���y
	WriteRoleValue ( ball , EM_RoleValue_PID,OwnerID()  )	--�NOwnerID()<�k�Ҵ�>�g�iball��
end


function LuaS_421775()	--�ϥΤ�����q
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==112412		then
		CastSpell( TargetID(),TargetID(),492671)	--�I�k�S��
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


function LuaS_421778()	--�ϥΤ�����q
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



function LuaS_421780()	--�ϥέ�����q
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==112412		then
	CastSpell( TargetID(),OwnerID(),492673)	--�I�k
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



function LuaS_422043()	--�ϥ��X�Ⱦ�

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


function LuaS_422044()	--�ϥ��]�k��q�Ȧs���y
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



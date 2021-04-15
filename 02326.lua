function dr_drama_01()  		--礦穴內布魯斯‧雷
	local own=ownerID()
	local tar =targetID()
	CastSpell( own, tar, 497426 ) 
	local ObjID = Lua_DW_CreateObj( "flag" , 117936 , 780913 , 0 , 1 , 1 )
		DW_MoveDirectToFlag( ObjID , 780913 , 1 , 1  )
		sleep(10)
		npcsay(ObjID,"[SC_117723_01]")
		sleep(50)
		DelObj(ObjID)
end

function dr_drama_02() 		--符文學者
	local own = ownerID()
	local tar = TargetID()
	PlayMotion( own,132)
	sleep(30)
	PlayMotion( own,133)
	sleep(5)
	local ObjID = Lua_DW_CreateObj( "flag" , 117912 , 780913 , 2 , 1 , 1 )
		AdjustFaceDir ( ObjID , own ,0 )
		DW_MoveDirectToFlag( ObjID , 780913 , 3 , 1  )
		sleep(10)
		AdjustFaceDir ( ObjID , own ,0 )
		NPCSay( ObjID, "[SC_117912_01]" )
		PlayMotion( ObjID, 105)
		sleep(50)
		AdjustFaceDir ( ObjID , own ,0 )
		NPCSay( ObjID, "[SC_117912_02]" )
		PlayMotion( ObjID, 101)
		sleep(50)
		AdjustFaceDir ( ObjID , own ,0 )
		NPCSay( ObjID, "[SC_117912_03]" )
		PlayMotion( ObjID, 105)
		sleep(50)
		AdjustFaceDir ( ObjID , own ,0 )
		NPCSay( ObjID, "[SC_117912_04]" )
		PlayMotion( ObjID, 263)
		sleep(50)
		DelObj(ObjID)
end


function dr_drama_03()  		--幽靈少女
	local own = ownerID()
	local tar = TargetID()
	PlayMotion( own,132)
	sleep(30)
	PlayMotion( own,133)
	sleep(5)
	local ObjID = Lua_DW_CreateObj( "flag" , 117911 , 780913 , 4 , 1 , 1 )
		AdjustFaceDir ( ObjID , own ,0 )
		DW_MoveDirectToFlag( ObjID , 780913 , 5 , 1  )
		sleep(10)
		AdjustFaceDir ( ObjID , own ,0 )
		NPCSay( ObjID,"[SC_117911_01]" )
		PlayMotion( ObjID, 105)
		sleep(50)
		AdjustFaceDir ( ObjID , own ,0 )
		NPCSay( ObjID,"[SC_117911_02]" )
		PlayMotion( ObjID, 105)
		sleep(50)
		AdjustFaceDir ( ObjID , own ,0 )
		NPCSay( ObjID,"[SC_117911_03]" )
		PlayMotion( ObjID, 105)
		sleep(50)
		AdjustFaceDir ( ObjID , own ,0 )
		NPCSay( ObjID,"[SC_117911_04]" )
		PlayMotion( ObjID, 101)
		sleep(50)
		DelObj(ObjID)
end



function LuaQdr_drama_04()		--迪林塔克冒險者營地
	local own=ownerID()
	local tar =targetID()
	CastSpell( own, tar, 497426 ) 
	local ObjID01 = Lua_DW_CreateObj( "flag" , 118011 , 780913 , 6 , 1 , 1 )
		SetModeEx(ObjID01,EM_SetModeType_Mark,false) 
		DW_MoveDirectToFlag( ObjID01 , 780913 , 7 , 1  )	
	local ObjID02 = Lua_DW_CreateObj( "flag" , 118010 , 780913 , 8 , 1 , 1 )
		SetModeEx(ObjID02,EM_SetModeType_Mark,false) 
		DW_MoveDirectToFlag( ObjID02 , 780913 , 9 , 1  )
	local ObjID03 = Lua_DW_CreateObj( "flag" , 118010 , 780913 , 10 , 1 , 1 )
		SetModeEx(ObjID03,EM_SetModeType_Mark,false) 
		DW_MoveDirectToFlag( ObjID03 , 780913 , 11 , 1  )
	local ObjID04 = Lua_DW_CreateObj( "flag" , 118012 , 780913 , 12, 1 , 1 )
		SetModeEx(ObjID04,EM_SetModeType_Mark,false) 
		DW_MoveDirectToFlag( ObjID04 , 780913 , 13 , 1  )
	local ObjID05 = Lua_DW_CreateObj( "flag" , 118012 , 780913 , 14 , 1 , 1 )
		SetModeEx(ObjID05,EM_SetModeType_Mark,false) 
		DW_MoveDirectToFlag( ObjID05 , 780913 , 15 , 1  )
	local ObjID06 = Lua_DW_CreateObj( "flag" , 118009 , 780913 , 20 , 1 , 1 )
		SetModeEx(ObjID06,EM_SetModeType_Mark,false) 
		DW_MoveDirectToFlag( ObjID06 , 780913 , 21 , 1  )
	local ObjID07 = Lua_DW_CreateObj( "flag" , 118012 , 780913 , 22 , 1 , 1 )
		SetModeEx(ObjID07,EM_SetModeType_Mark,false) 
		DW_MoveDirectToFlag( ObjID07 , 780913 , 23 , 1  )
	local ObjID08 = Lua_DW_CreateObj( "flag" , 118012 , 780913 , 24 , 1 , 1 )
		SetModeEx(ObjID08,EM_SetModeType_Mark,false) 
		DW_MoveDirectToFlag( ObjID08 , 780913 , 25 , 1  )
	local ObjID09 = Lua_DW_CreateObj( "flag" , 118012 , 780913 , 26 , 1 , 1 )
		SetModeEx(ObjID09,EM_SetModeType_Mark,false) 
		DW_MoveDirectToFlag( ObjID09 , 780913 , 27 , 1  )
		sleep(10)
		Tell(tar,ObjID06,"[SC_118009_01]")
		sleep(70)
		DelObj(ObjID01)
		DelObj(ObjID02)
		DelObj(ObjID03)
		DelObj(ObjID04)
		DelObj(ObjID05)
		DelObj(ObjID06)
		DelObj(ObjID07)
		DelObj(ObjID08)
		DelObj(ObjID09)	
end


function LuaQdr_drama_05()  		--424190奧克拉夫
	local ObjID = Lua_DW_CreateObj( "flag" , 118009 , 780913 , 18 , 1 , 1 )
		DW_MoveDirectToFlag( ObjID , 780913 , 19 , 1  )
		sleep(10)
		say(ObjID,"[SC_118009_02]")
		sleep(70)
		DelObj(ObjID)
end
--------------------------------------------------------------------------------------------------------
function LuaQ_drspell_02()			--法陣維持術
	local obj = ownerID()
	local objbuff = CastSpell(obj,obj,497245)
	while 1 do
	sleep(120)	
	PlayMotion(obj, ruFUSION_ACTORSTATE_BUFF_BEGIN )
		if	objbuff == true		then

			AddBuff(obj,509383,0,12) 
		
		end
	end
end
--------------------------------------------------------------------------------------------------------
function LuaQ_drspell_03()			--能量注入	
	local obj = ownerID()
	local objbuff = CastSpell(obj,obj,497480)
	while 1 do
	sleep(120)	
	PlayMotion(obj, ruFUSION_ACTORSTATE_BUFF_BEGIN )
		if	objbuff == true		then

			AddBuff(obj,509384,0,12) 
		
		end
	end
end

--------------------------------------------------------------------------------------------------------
 function LuaQ_drseed_01()    --植入土壤
	local npc = {}
	local a = 0
	local obj = OwnerID()
	local npc=searchrangenpc(obj,30)
	for i=0 , table.getn(npc) do
		if ReadRoleValue(npc[i],EM_RoleValue_OrgID) == 117886  then
			a=a+1
		end
	end
	
	if a>0 then
		return true
	else
		return false
	end
end
--------------------------------------------------------------------------------------------------------
 function LuaQ_drmedicine_01()  --治療傷患
	local npc = {}
	local a = 0
	local obj = OwnerID()
	local tar=TargetID()
	if ReadRoleValue(tar,EM_RoleValue_OrgID)== 117825 then

		return true
	else
		ScriptMessage( obj,  obj , 2 ,"[SC_117825_01]" , 2 ) 
		return false
	end
end
--------------------------------------------------------------------------------------------------------
function LuaQ_drthanks_01()				--說謝謝後消失
	local own = OwnerID()
	local obj = TargetID()
	Npcsay(obj,"[SC_RESCUE_STRING_NPC02]")
	Hide(obj)
	beginplot (obj,"LuaQ_show_01",0)
end

function LuaQ_show_01()				--消失後20秒出現
	local own = OwnerID()
	sleep(200)
	show (own,0)
end

--------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------

function Lua_drsaying_01()				--棒極了+鼓掌
	local own = OwnerID()
	PlayMotion(own,102)
	NpcSay(own,"[SC_424191_0]")
end



function Lua_drsaying_02()				--感謝+致敬
	local own = OwnerID()
	PlayMotion(own,251)
	NpcSay(own,"[SC_118009_03]")
end
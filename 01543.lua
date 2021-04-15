
---獅龍獸變身檢查
function LuaI_422704_Check()

	if CheckBuff( OwnerID() , 504667 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422704]" , 0 ) --你已經換上獅龍獸套裝
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422704]" , 0 ) 
		return false
	end

	if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode ) ~= 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205426_1]" , 0 ) --你正在戰鬥！
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205426_1]" , 0 ) 
		return false
	end

	if	Lua_ObjAreaCheck(OwnerID() , 732 ) ==false then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422704_1]", 0 ) --你只能在[ZONE_TOWER OF RAGE]使用！
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422704_1]", 0 )
		return false
	end

	return true
end

function LuaM_422704_0() --獅龍獸變裝偵測地點

	if	Lua_ObjAreaCheck(OwnerID() , 732 ) ==false then
		CancelBuff_NoEvent( OwnerID() , 504667 )
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422704_1]", 0 ) --你只能在[ZONE_TOWER OF RAGE]使用！
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422704_1]", 0 )
	end
end

function LuaM_422704_Range_0() --請掛在檢查點上
	SetPlot( OwnerID() , "range" , "LuaM_422704_Range_1" , 80 ) --調整最後的數字以改變偵測範圍
end

function LuaM_422704_Range_1()

	if CheckAcceptQuest( OwnerID() , 422704 ) == true and CheckFlag( OwnerID() , 543311 ) == false then
		local NPC,Tar
		local Monster = 102533
		while true do
			sleep(10)
			NPC = SearchRangeNPC (OwnerID(),100)
			for i=0,table.getn(NPC)	do
				if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==Monster and ReadRoleValue(NPC[i],EM_RoleValue_IsAttackMode) == 0 and ReadRoleValue( NPC[i] , EM_RoleValue_IsDead ) == 0  then
					SetFlag( OwnerID() , 543311  , 1 )
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422704_2]" , 0 ) --你發現幼獅龍正津津有味的吃著人類製作的食物！
					ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422704_2]" , 0 )
					return
				end
			end
		end
	end
end

-------餵食獅龍獸

function LuaS_205939_check()
	if CheckAcceptQuest( OwnerID() , 422705 ) == false or CheckFlag(OwnerID(),543335) == true  then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422507_0]" , 0 ) --你目前不需要這麼做
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422507_0]" , 0 ) 
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) ~= 102533 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422507_1]" , 0 ) --這不是你要帶回去的對象
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422507_1]" , 0 ) 
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1  then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422701_1]" , 0 ) --[102533]已經死了
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422701_1]" , 0 ) 
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_AttackTargetID ) ~= OwnerID() then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422701_2]" , 0 ) --你必須先讓[102533]注意到你！
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422701_2]" , 0 ) 
		return false
	end
	return true
end

function LuaM_205939_Effect()
	BeginPlot( TargetID() , "LuaM_205939_Reset" , 0 )
end

function LuaM_205939_Reset()
	local obj = LuaFunc_CreateObjByObj ( 113519 , OwnerID() )
	AddToPartition( obj , 0 )
	BeginPlot( OwnerID() , "LuaM_205939_Effect_1" , 0 )
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_205939]" , 1 ) 
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_205939]" , 1 ) --[102533]對你的食物感到興趣，開心地向你跑來！
	SetFollow( obj, TargetID() )
	DelObj(obj)
	SetFlag( TargetID() , 543335  , 1 )
end

function LuaM_205939_Effect_1()
	LuaFunc_ResetObj( OwnerID() ) 
end

-----獅龍獸兇殺案
function LuaM_205959_check()

	if CheckAcceptQuest( OwnerID() , 422706 ) == false or CheckFlag(OwnerID(),543337) == true  then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422507_0]" , 0 ) --你目前不需要這麼做
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422507_0]" , 0 ) 
		return false
	end

	local X = ReadRoleValue(OwnerID() , EM_RoleValue_X)
	local Z = ReadRoleValue(OwnerID() , EM_RoleValue_Z)

	if X > -12500 and X < -12150 then
		if Z > 31400 and Z < 31700 then
			return true
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205959]" , 0 ) --這不是靠近血沸哨站的空地！
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205959]" , 0 ) 
			return false
		end
	else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205959]" , 0 ) --這不是靠近血沸哨站的空地！
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205959]" , 0 ) 
			return false
	end
end

function LuaM_205959()

	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205959_1]" , 0 ) --獅龍獸因你的呼喚而來！
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205959_1]" , 0 ) 
	SetFlag( OwnerID() , 543337  , 1 )
	BeginPlot( OwnerID() , "LuaM_205959_1" , 0 )
end

function LuaM_205959_1()

	AddBuff(OwnerID() , 504756 , 10 , -1 )  
	local NPC = LuaFunc_CreateObjByObj ( 113519 , OwnerID() )
	AddToPartition( NPC , 0 )
	BeginPlot( NPC , "LuaM_205959_2" , 0 )
end
function LuaM_205959_2()
	sleep(20)

	local snake = {}

	for i=1,3,1 do
		snake[i] = Lua_CreateObjByDir( TargetID() ,102522 , 80 , 0 ) 
		AddToPartition( snake[i] , 0 )
	end

	sleep(10)
	Say(snake[1],"[SC_205959_2]") --瞧！有一隻落單的獅龍獸！
	sleep(20)
	SetFollow( snake[1], OwnerID() )
	PlayMotion(OwnerID()  , ruFUSION_ACTORSTATE_CAST_SP01)
	if CheckID(TargetID() ) == true then
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_205959_5]" , 0 ) --獅龍獸為了保護你，將你藏在他的身下！
		ScriptMessage( TargetID()  , TargetID() , 0 , "[SC_205959_5]" , 0 ) 
		AddBuff(TargetID() , 504762 , 10 , -1 )  
	else
		DelObj(snake[1])
		DelObj(snake[2])
		DelObj(snake[3])
		DelObj( OwnerID() )
		return
	end
	sleep(20)
	SetFollow( snake[2], OwnerID() )
	Say(snake[2],"[SC_205959_3]") --哈哈！太好了！殺了牠！
	sleep(10)
	SetFollow( snake[3], OwnerID() )
	Say(snake[3],"[SC_205959_4]") --殺了那頭獅龍獸！
	sleep(20)
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_BUFF_SP01)

	CastSpell( snake[1] , OwnerID(),  494231 )
	sleep(20)
	FaceObj ( OwnerID(), snake[1] )
	PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_CAST_SP01)
	CastSpell( snake[2] ,OwnerID(), 494231 )
	sleep(10)
	PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_BUFF_SP01)
	CastSpell( snake[3] ,OwnerID(), 494232 )
	sleep(10)
	CastSpell( snake[1] , OwnerID() , 494231 )
	sleep(20)
	PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_BUFF_SP01)
	CastSpell( snake[2] , OwnerID() , 494232 )
	sleep(20)
	if CheckID(TargetID() ) == true then
		ScriptMessage(  TargetID() , TargetID() ,  1 , "[SC_205959_8]" , 0 ) --獅龍獸的生命垂危！
		ScriptMessage(  TargetID() , TargetID() ,  0 , "[SC_205959_8]" , 0 ) 
	else
		DelObj(snake[1])
		DelObj(snake[2])
		DelObj(snake[3])
		DelObj( OwnerID() )
		return
	end

	PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_BUFF_SP01)
	sleep(10)
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_DEATH_LOOP)
	sleep(30)
	Say(snake[1],"[SC_205959_6]") --哈！落單的獅龍獸根本不可怕！
	sleep(20)
	Say(snake[2],"[SC_205959_7]") --沒錯！報仇了！我們走吧！
	sleep(30)
	DelObj(snake[1])
	DelObj(snake[2])
	DelObj(snake[3])
	if CheckID(TargetID() ) == true then
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_205959_9]" , 0 ) --獅龍獸被蛇人攻擊而亡！
		ScriptMessage( TargetID() , TargetID() , 0 , "[SC_205959_9]" , 0 ) 
	else
		DelObj( OwnerID() )
		return
	end
	sleep(20)
	if CheckID(TargetID() ) == true then
		CancelBuff( TargetID() , 504756 )
		CancelBuff( TargetID(), 504762 )
	end
	DelObj(OwnerID())
end






















---------------------------------------------------------------------------------
function LuaS_102622_0()--掛在索雷爾頓魔像的初始劇情
---------------------------------------------------------------------------------

--780078
--780079
--780080
--絕對不死
--移動勾掉
	SetPlot(OwnerID(),"dead","LuaS_102622_5",0)
	SetModeEx(OwnerID(),EM_SetModeType_Move,false) 
--產生赤蛇將
--並確定他在魔像死亡時候會消失
	local RedSnake = Lua_DW_CreateObj("flag",102526,780078,1,0)
	MoveToFlagEnabled(RedSnake, false)
	SetFightMode ( RedSnake,0,0,0,0 )
	SetModeEx(RedSnake,EM_SetModeType_Gravity,false) 
	WriteRoleValue(RedSnake,EM_RoleValue_Y,ReadRoleValue(RedSnake,EM_RoleValue_Y)+120)
	AddToPartition(RedSnake,0)
	BeginPlot(RedSnake,"LuaS_102622_1",0)
	CallPlot(RedSnake,"LuaS_102622_3",OwnerID())
--持續產生索雷爾頓
--持續產生蛇人
--都要確定赤蛇將軍消失之後會消失
	local Snake = {}  --存放蛇人的id
	local SankeCount = 9 -- 一次產生多少蛇人
	local So = {}	--存放索雷爾頓的id
	local SoCount = 3 -- 一次產生多少索雷爾頓
	while	true	do
		sleep(100+DW_Rand(50))
		for i=1,SankeCount,1 do
			Snake[i] = Lua_DW_CreateObj("flag",102523,780079,i)
			SetPlot(Snake[i],"dead","LuaFunc_DeadPlay",0)
			WriteRoleValue(Snake[i],EM_RoleValue_LiveTime,60)
			CallPlot(Snake[i],"LuaS_102622_2",RedSnake)
			SetAttack(Snake[i],OwnerID())
		end
		for i=1,SoCount,1 do
			So[i] = Lua_DW_CreateObj("flag",102494,780080,i)
			SetPlot(So[i],"dead","LuaFunc_DeadPlay",0)
			WriteRoleValue(So[i],EM_RoleValue_LiveTime,60)
			CallPlot(So[i],"LuaS_102622_2",RedSnake)
			SetAttack(So[i],OwnerID())
		end
	end
end

---------------------------------------------------------------------------------
function LuaS_102622_1() --赤蛇將軍的刪除劇情
---------------------------------------------------------------------------------
	while CheckID(TargetID()) do
		sleep(10)
		if	ReadRoleValue(TargetID(),EM_RoleValue_IsDead) == 1	then
			break
		end
	end
	sleep(20)
	Yell(OwnerID(),"[SC_102622_0]",3)
	sleep(30)
	DelObj(OwnerID())
end

---------------------------------------------------------------------------------
function LuaS_102622_2(Obj) -- 確認  參數id 是否存在或死亡
---------------------------------------------------------------------------------
	while CheckID(Obj) do
		sleep(10)
		if	ReadRoleValue(Obj,EM_RoleValue_IsDead) == 1	then
			break
		end
	end
	sleep(20)
	DelObj(OwnerID())
end


---------------------------------------------------------------------------------
function LuaS_102622_3(Obj) -- 赤蛇將軍的台詞
---------------------------------------------------------------------------------
	local String
	local X
	local Y = 0
	while	CheckID(Obj)  do
		if	ReadRoleValue(Obj,EM_RoleValue_IsDead)==1	then
			break
		end
		sleep(70+DW_Rand(40))
		if	ReadRoleValue(Obj,EM_RoleValue_IsDead)==1	then
			break
		end
		X = DW_Rand(5)
		while	X == Y	do
			X = DW_Rand(5)
			sleep(1)
		end
		Y = X
		String = "SC_102622_"..X
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_IDLE0+Rand(2))
		Yell(OwnerID(),"["..String.."]",3)
	end
end


---------------------------------------------------------------------------------
function LuaS_102622_4() -- 法術檢查
---------------------------------------------------------------------------------
	if	CheckRelation( OwnerID(),TargetID() , EM_CheckRelationType_Attackable )==false	then
		return false
	end
	return true
end

---------------------------------------------------------------------------------
function LuaS_102622_5() --不死劇情
---------------------------------------------------------------------------------
	return false
end

---------------------------------------------------------------------------------
function LuaS_102622_6() -- 範圍劇情
---------------------------------------------------------------------------------
	SetPlot(OwnerID(),"range","LuaS_102622_7",100)
end

---------------------------------------------------------------------------------
function LuaS_102622_7() -- 範圍劇情
---------------------------------------------------------------------------------
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_102622_6]", C_Red )
end

----------------------------------------------------------------------
function LuaI_ExitBloodyVal()
	local Me = Role:new( OwnerID() )
	local Auro = CreateObj( 102459 , Me:X() , Me:Y() , Me:Z() , Me:Dir() , 1 )
	Lua_ObjDontTouch( Auro ) 
	AddToPartition( Auro , 0 )
	SetPlot( Auro , "range" , "LuaI_ExitBloodyVal_GO" , 50 )
end

function LuaI_ExitBloodyVal_GO()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	ChangeZone( OwnerID() , 9 , 0 ,-12394 , 1082 , 31253,325)	--賢者之眼
end
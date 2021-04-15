

---------------------------------------------------------------------------------
function LuaS_102622_0()--���b���p���y�]������l�@��
---------------------------------------------------------------------------------

--780078
--780079
--780080
--���藍��
--���ʤı�
	SetPlot(OwnerID(),"dead","LuaS_102622_5",0)
	SetModeEx(OwnerID(),EM_SetModeType_Move,false) 
--���ͨ��D�N
--�ýT�w�L�b�]�����`�ɭԷ|����
	local RedSnake = Lua_DW_CreateObj("flag",102526,780078,1,0)
	MoveToFlagEnabled(RedSnake, false)
	SetFightMode ( RedSnake,0,0,0,0 )
	SetModeEx(RedSnake,EM_SetModeType_Gravity,false) 
	WriteRoleValue(RedSnake,EM_RoleValue_Y,ReadRoleValue(RedSnake,EM_RoleValue_Y)+120)
	AddToPartition(RedSnake,0)
	BeginPlot(RedSnake,"LuaS_102622_1",0)
	CallPlot(RedSnake,"LuaS_102622_3",OwnerID())
--���򲣥ͯ��p���y
--���򲣥ͳD�H
--���n�T�w���D�N�x��������|����
	local Snake = {}  --�s��D�H��id
	local SankeCount = 9 -- �@�����ͦh�ֳD�H
	local So = {}	--�s����p���y��id
	local SoCount = 3 -- �@�����ͦh�֯��p���y
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
function LuaS_102622_1() --���D�N�x���R���@��
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
function LuaS_102622_2(Obj) -- �T�{  �Ѽ�id �O�_�s�b�Φ��`
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
function LuaS_102622_3(Obj) -- ���D�N�x���x��
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
function LuaS_102622_4() -- �k�N�ˬd
---------------------------------------------------------------------------------
	if	CheckRelation( OwnerID(),TargetID() , EM_CheckRelationType_Attackable )==false	then
		return false
	end
	return true
end

---------------------------------------------------------------------------------
function LuaS_102622_5() --�����@��
---------------------------------------------------------------------------------
	return false
end

---------------------------------------------------------------------------------
function LuaS_102622_6() -- �d��@��
---------------------------------------------------------------------------------
	SetPlot(OwnerID(),"range","LuaS_102622_7",100)
end

---------------------------------------------------------------------------------
function LuaS_102622_7() -- �d��@��
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
	ChangeZone( OwnerID() , 9 , 0 ,-12394 , 1082 , 31253,325)	--��̤���
end
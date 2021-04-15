
---���s�~�ܨ��ˬd
function LuaI_422704_Check()

	if CheckBuff( OwnerID() , 504667 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422704]" , 0 ) --�A�w�g���W���s�~�M��
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422704]" , 0 ) 
		return false
	end

	if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode ) ~= 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205426_1]" , 0 ) --�A���b�԰��I
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205426_1]" , 0 ) 
		return false
	end

	if	Lua_ObjAreaCheck(OwnerID() , 732 ) ==false then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422704_1]", 0 ) --�A�u��b[ZONE_TOWER OF RAGE]�ϥΡI
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422704_1]", 0 )
		return false
	end

	return true
end

function LuaM_422704_0() --���s�~�ܸ˰����a�I

	if	Lua_ObjAreaCheck(OwnerID() , 732 ) ==false then
		CancelBuff_NoEvent( OwnerID() , 504667 )
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422704_1]", 0 ) --�A�u��b[ZONE_TOWER OF RAGE]�ϥΡI
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422704_1]", 0 )
	end
end

function LuaM_422704_Range_0() --�б��b�ˬd�I�W
	SetPlot( OwnerID() , "range" , "LuaM_422704_Range_1" , 80 ) --�վ�̫᪺�Ʀr�H���ܰ����d��
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
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422704_2]" , 0 ) --�A�o�{�����s���z�z�������Y�ۤH���s�@�������I
					ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422704_2]" , 0 )
					return
				end
			end
		end
	end
end

-------�������s�~

function LuaS_205939_check()
	if CheckAcceptQuest( OwnerID() , 422705 ) == false or CheckFlag(OwnerID(),543335) == true  then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422507_0]" , 0 ) --�A�ثe���ݭn�o��
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422507_0]" , 0 ) 
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) ~= 102533 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422507_1]" , 0 ) --�o���O�A�n�a�^�h����H
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422507_1]" , 0 ) 
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1  then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422701_1]" , 0 ) --[102533]�w�g���F
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422701_1]" , 0 ) 
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_AttackTargetID ) ~= OwnerID() then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422701_2]" , 0 ) --�A��������[102533]�`�N��A�I
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
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_205939]" , 1 ) --[102533]��A�������P�쿳��A�}�ߦa�V�A�]�ӡI
	SetFollow( obj, TargetID() )
	DelObj(obj)
	SetFlag( TargetID() , 543335  , 1 )
end

function LuaM_205939_Effect_1()
	LuaFunc_ResetObj( OwnerID() ) 
end

-----���s�~������
function LuaM_205959_check()

	if CheckAcceptQuest( OwnerID() , 422706 ) == false or CheckFlag(OwnerID(),543337) == true  then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422507_0]" , 0 ) --�A�ثe���ݭn�o��
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422507_0]" , 0 ) 
		return false
	end

	local X = ReadRoleValue(OwnerID() , EM_RoleValue_X)
	local Z = ReadRoleValue(OwnerID() , EM_RoleValue_Z)

	if X > -12500 and X < -12150 then
		if Z > 31400 and Z < 31700 then
			return true
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205959]" , 0 ) --�o���O�a���m�ﯸ���Ŧa�I
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205959]" , 0 ) 
			return false
		end
	else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205959]" , 0 ) --�o���O�a���m�ﯸ���Ŧa�I
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205959]" , 0 ) 
			return false
	end
end

function LuaM_205959()

	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205959_1]" , 0 ) --���s�~�]�A���I��ӨӡI
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
	Say(snake[1],"[SC_205959_2]") --�@�I���@�����檺���s�~�I
	sleep(20)
	SetFollow( snake[1], OwnerID() )
	PlayMotion(OwnerID()  , ruFUSION_ACTORSTATE_CAST_SP01)
	if CheckID(TargetID() ) == true then
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_205959_5]" , 0 ) --���s�~���F�O�@�A�A�N�A�æb�L�����U�I
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
	Say(snake[2],"[SC_205959_3]") --�����I�Ӧn�F�I���F�e�I
	sleep(10)
	SetFollow( snake[3], OwnerID() )
	Say(snake[3],"[SC_205959_4]") --���F���Y���s�~�I
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
		ScriptMessage(  TargetID() , TargetID() ,  1 , "[SC_205959_8]" , 0 ) --���s�~���ͩR���M�I
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
	Say(snake[1],"[SC_205959_6]") --���I���檺���s�~�ڥ����i�ȡI
	sleep(20)
	Say(snake[2],"[SC_205959_7]") --�S���I�����F�I�ڭ̨��a�I
	sleep(30)
	DelObj(snake[1])
	DelObj(snake[2])
	DelObj(snake[3])
	if CheckID(TargetID() ) == true then
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_205959_9]" , 0 ) --���s�~�Q�D�H�����Ӥ`�I
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




















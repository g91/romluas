function LuaS_110292_0()
	LoadQuestOption(OwnerID())
	if CheckFlag( OwnerID(), 540258 ) == false and CheckAcceptQuest( OwnerID() , 420309 ) == true then
		AddSpeakOption(OwnerID(),TargetID(),GetString("SO_110292_1"),"LuaS_110292_1",0);
		--/*���}�ۧX
	end
end

function LuaS_110292_1()
	CloseSpeak( OwnerID() )
	DisableQuest( TargetID() , true )
	BeginPlot( TargetID() , "LuaQ_420309_0" , 0 )
end

function LuaQ_420309_0()
	WriteRoleValue( OwnerID() , EM_RoleValue_PID, 0 )
	sleep( 30 )
	local Priest = {}
	for i = 1 , 4 , 1 do
		Priest[i] = CreateObjByFlag( 100358 , 780035 , i , 1)
		AddToPartition( Priest[i] , 0 )
		SetAttack( Priest[i] , TargetID() )
		SetPlot( Priest[i] , "Dead" , "LuaQ_420309_CHECK" , 40 )
		WriteRoleValue( Priest[i] , EM_RoleValue_PID , OwnerID() )
		BeginPlot( Priest[i] , "LuaQ_420309_Sui" , 0 )
		Say( Priest[i] , GetString("EM_420309_0") ) --/*�Y�d�ǡI��d���Թp���I��Ԧh����i�J�I
	end
	local n 
	while 1 do --�Ĥ@�q�A�ˬd���q�O�_�s�b�A���Q�����N�i��ĤG�q
		n = 0
		for i = 1 , 4 , 1 do
			if CheckID(Priest[i]) ~= true then
				n = n+1
			end
		end
		if n == 4 then
			break
		end
		sleep( 60 )
	end
	local Zombie = CreateObjByFlag( 100673 , 780035 , 0 , 1 )
	if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) == 200 then --�nĲ�I(200/20)��
		CastSpell( OwnerID() , OwnerID() ,490101)
		ScriptMessage( OwnerID(), TargetID(), 0, GetString("EM_420309_5"), 0 ) --/*�ۧX�o�X�F�޲������~�A�b�Ԥ����q������W���E�X�@�Ӷ·t������I
		AddToPartition( Zombie , 0 )
		SetPlot( Zombie , "Dead","LuaQ_420309_DeBuff" , 40 )
		SetAttack( Zombie , TargetID() )
		WriteRoleValue( Zombie , EM_RoleValue_PID , OwnerID() )
		BeginPlot( Zombie , "LuaQ_420309_Sui" , 0 )
		SetPlot( OwnerID() , "touch" , "LuaQ_420309_Touch",50 )
	else
		WriteRoleValue( OwnerID(),EM_RoleValue_PID , 0 )
		SetPlot( OwnerID() , "touch" , "",0 )
		SetFlag( OwnerID() , 540605 , 0 )
		DisableQuest( OwnerID() , false )
		return
	end
	local n = 0
	local Check = "OK"
	while 1 do --�ĤG�q�A�ˬd���e�Ԥ�
--		SAY( OwnerID() , " CHECK BEGIN" )
		if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) == 0 and Check == "OK" then
			ScriptMessage( OwnerID(), TargetID(), 0, GetString("EM_420309_2"), 0 ) --/*�`�������~��M���u�F�I
			SetPlot( OwnerID() , "touch" , "" ,0)
			CancelBuff( OwnerID() ,500900 )
			SetPlot( Zombie , "Dead","LuaQ_420309_Last" , 40 ) 
			CHECK = "NO"
		end
--		SAY( OwnerID() , CheckID(Zombie) )
		if CheckID(Zombie) == false then
--			SAY( OwnerID() , " LUA END " )
			WriteRoleValue( OwnerID(),EM_RoleValue_PID , 0 )
			if CheckBuff( OwnerID() , 500900 ) then
				CancelBuff( OwnerID() ,500900 )
			end
			SetPlot( OwnerID() , "touch" , "" ,0)
			SetFlag( OwnerID() , 540605 , 0 )
			CastSpell(OwnerID() , OwnerID()  , 491002 ) --�`���}�a�᪺�S��
			DisableQuest( OwnerID() , false )
			break			
		end
		if n == 2 then
			SetFlag( OwnerID() , 540605 , 0 )
		end
		if n == 5 and ReadRoleValue( OwnerID() , EM_RoleValue_PID ) > 0 then
			ScriptMessage( OwnerID(), 0, 0, GetString("EM_420309_1"), 0 ) --�㺸�ᾥ�����n���b�A�����T�_�G�ߦ��`�����O�q�A��i�ԳӤ`�����O�q�F�h�IĲ�`���A�����n�Q�`���ұ���C
			SetFlag( OwnerID() , 540605 , 0 )
			n = 0
		end
		sleep( 60 )
		n = n + 1
	end

	return
end

function LuaQ_420309_Sui()
	LuaFunc_Obj_Suicide(200)
end

function LuaQ_420309_CHECK()
	local Box = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local PID = ReadRoleValue( Box , EM_RoleValue_PID) + 50
	WriteRoleValue( Box , EM_RoleValue_PID, PID )
end

function LuaQ_420309_DeBuff()
	ScriptMessage( OwnerID(), TargetID(), 0, GetString("EM_420309_3"), 0 ) --/*���e�Ԥ��]���`�������̦ӫ�_�F�O�q�I
	return false
end

function LuaQ_420309_Touch()
	if CheckFlag(TargetID() , 540605 ) == true then
		ScriptMessage( TargetID(), OwnerID(), 0, GetString("EM_420309_7"), 0 ) --/*�`���ܩڧA���IĲ�C
	elseif CheckBuff( OwnerID() , 500998 ) then
		ScriptMessage( TargetID(), OwnerID(), 0, GetString("EM_420309_6"), 0 ) --/*�㺸�ᾥ�����n���b�A�����T�_�G�A����A��Ĳ��h�`�����O�q�A�_�h�A�N�Q�`���ұ���
	else
		local PID = ReadRoleValue( TargetID(), EM_RoleValue_PID) - 20
		ScriptMessage( TargetID(), OwnerID(), 0, GetString("EM_420309_4"), 0 ) --/*�H�ۧA���IĲ�A�`�����O�q�@�����y�J�F�A���餺�I
		WriteRoleValue( TargetID() , EM_RoleValue_PID , PID )
		CastSpell(TargetID() , OwnerID() , 490196 ) 
		SetFlag( TargetID() , 540605 , 1 )
	end
end

function LuaQ_420309_Last()
	local BOX = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local PPL = LuaFunc_PartyData(TargetID())
--	CastSpell( BOX , BOX , 491002 ) --�`���}�a�᪺�S��
	for i = 1 , PPL[0] , 1 do 	--�����Ҧ��֦����Ȫ����a�������ȩһݺX��
		if CheckAcceptQuest( PPL[i] , 420309 ) == true then
			SetFlag( PPL[i] , 540258 , 1 )
		end
	end
	return true
end

function LUA_TEST_420309()
		SetPlot( OwnerID() , "touch" , "LuaQ_420309_Touch",40 )
end
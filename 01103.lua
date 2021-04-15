
------�q�|�̪����K


function LuaI_111749_1()	
	BeginPlot( OwnerID() , "LuaI_111749_2" , 0 )
	BeginPlot( OwnerID() , "LuaI_111749_4" , 0 )
	return true
end

function LuaI_111749_2()
	local MonA = LuaFunc_CreateObjByObj ( 101368 , TargetID() )
	AddToPartition( MonA ,    0 )
	SetAttack( MonA , OwnerID() )
	Say( MonA , "[SC_111749]" )	--���m��Ƥ���Q�ܨ��I	
	BeginPlot(MonA , "LuaI_111749_3" , 0 )	
end

function LuaI_111749_4()
	local MonB = LuaFunc_CreateObjByObj ( 101369 , TargetID() )
	AddToPartition( MonB ,    0 )
	SetAttack( MonB , OwnerID() )
	BeginPlot(MonB , "LuaI_111749_3" , 0 )	
end

function LuaI_111749_3()
	local Monster = OwnerID()
	while true do
		if ReadRoleValue( Monster , EM_RoleValue_AttackTargetID ) ~= 0 and CheckID( Monster ) == true then  --�ˬd�O�_���}�԰�
			Sleep( 10 )	-- �@���ˬd�@��	
		else
			if CheckID( Monster ) == true then	DelObj( Monster )	end 
			break
		end
	end
end

------------------�H�ժ�����(�֦��ժܪ����~)

function LuaI_421570()
	if(CountItem ( OwnerID(), 222958 ) == 1 ) or (CountBodyItem( OwnerID(), 222958 ) == 1)  then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_421570]" , 0 )	--  �A�]���֦��u�ժܪ����~�v�A�H�զb�A���W�P�������O�C
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421570]" , C_SYSTEM )
		SetFlag(OwnerID() , 542208 , 1 )
	end
end

function LuaS_203407_CHECK()
	if CheckFlag( OwnerID() , 542208 ) == true then
	 	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_421570_3]" , 0 )	--  �A�w�g��o�����{�P�I�I
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421570_3]" , C_SYSTEM )
	elseif CheckFlag( OwnerID() , 542208 ) == false then
		if CountBodyItem( OwnerID(), 203407 ) >= 1 then	-- �y������
			return true
		else
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_421570_2]" , 0 )	--  �A�S���i�H�l������Ϫ̪����~�I�I
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421570_2]" , C_DEFAULT )
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "Something Error" , C_DEFAULT )
	end
	return false
end

function LuaS_203407_USE()


	local Monster = CreateMonsterByBOSSBatch( 101370 , TargetID() , -5 , 5 )	-- �����Ϫ�
	SetPlot( Monster , "Dead" , "LuaS_203407_Dead" , 10 )
	SetAttack( Monster , OwnerID() )
	Say( TargetID() , "[SC_111751_1]" )				--�Q�n�o�쯫���{�P�A�N���ѧڨ��ҩ��A����O�C
	BeginPlot( Monster , "LuaS_203407_Monster" , 0 )
	return true
end

function LuaS_203407_Monster()
	local Monster = OwnerID()
	while true do
		if ReadRoleValue( Monster , EM_RoleValue_AttackTargetID ) ~= 0 and CheckID( Monster ) == true then  --�ˬd�O�_���}�԰�
			Sleep( 10 )	-- �@���ˬd�@��	
		else
			if CheckID( Monster ) == true then	DelObj( Monster )	end 
			break
		end
	end
end

function LuaS_203407_Dead()
	SetFlag( TargetID() , 542208 , 1 )
end


----------------------------�P�_�O�_�F��28��

function LuaI_110037_Quest()
	LoadQuestOption( OwnerID() )
	local PLAYERLV = ReadRoleValue( OwnerID() , EM_RoleValue_Lv )
	if (PLAYERLV > 27 )and(CheckFlag( OwnerID() , 542285 )==false)then
		SetFlag(OwnerID() , 542285 , 1 )
	end
end

-----ù�L������

function LuaI_203431_Quest()

	GiveBodyItem( OwnerID(), 203432, 1 )
	UseItemDestroy() 		--�R���ϥΤ������~
	
end

----------------------------�P�_�O�_�F��38��

function LuaI_110896_Quest()
	LoadQuestOption( OwnerID() )
	local PLAYERLV = ReadRoleValue( OwnerID() , EM_RoleValue_Lv )
	if (PLAYERLV > 37 )and(CheckFlag( OwnerID() , 542293 )==false)then
		SetFlag(OwnerID() , 542293 , 1 )
	end
end


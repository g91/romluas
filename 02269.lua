

--======================================================================================================
--���ť�
--======================================================================================================

function LUAZ13WS_117361_0()
	Sleep(30)
	local NPC =SearchRangeNPC ( OwnerID() , 200 )				
			--�j�Mnpc���� 400�d�򤺪�NPC�A��J�}�C��
	local stone	
	for i=0,table.getn(NPC),1 do
		if 	ReadRoleValue(NPC[i], EM_RoleValue_PID ) == 117361 then
			stone= NPC[i]
			break	
		end
	end
	
	while 1 do
		CastSpell(OwnerID(),stone,497134)--492184
		sleep(600)
	end
end


function LUAZ13WS_117361_1()
	while 1 do
		Addbuff(OwnerID(),507927,1,10)
		Sleep(5)
		Addbuff(OwnerID(),504098,1,10)
	end
end
		
		
---***---�X�D---***---


function LUAZ13WS_423834_0()
	SetPlot( OwnerID(),"Range","LUAZ13WS_423834_1",150 )
end

function LUAZ13WS_423834_1()
	local Ctrl = TargetID()--�d��@��������
	local Player = OwnerID()--���a

	if	CheckAcceptQuest(Player,423834)== true	and
		CheckCompleteQuest(Player,423834)==false	and
		Checkflag(Player,544742) ==false		and
		CheckBuff(Player,508932)==false		then
				
		if	CheckBuff(Ctrl,508932)==false	then 
			Addbuff(Ctrl, 508932, 0,-1)
			CallPlot( Ctrl,"Lua_Z13_423834_Start",0)
		else
			ScriptMessage( Player, Player, 2,"[SC_423834_begun]", 0 )
			ScriptMessage( Player, Player, 0,"[SC_423834_begun]", 0 )
			--����w�}�l�����T�ҲŤ��ʡA�[�J��ܳD�s����C�a�I
		end
	end
end

function LuaZ13WS_423834_Message( Msg)
	local Player = SearchRangePlayer( OwnerID(), 200 )
	local num = 0
	for i=0, table.getn(Player)-1 do
		if	CheckAcceptQuest( Player[i], 423834)== true	and
			CheckCompleteQuest( Player[i], 423834)==false	and
			Checkflag( Player[i], 544742) ==false		then
			
			if Msg ~= nil then
				ScriptMessage( Player[i], Player[i], 2, Msg, 0 )
				ScriptMessage( Player[i], Player[i], 0, Msg, 0 )
			end
			num = num+1
		end
	end
	return num
end

function Lua_Z13_423834_Start()--�}�l
	local ObjArray = {};
	local rock;
	local snake;
	local fighter;
	
	for i=1, 200 do
		Sleep(10)

		if i%3 and LuaZ13WS_423834_Message() == 0 then--�ˬd�P�򪱮a
			LuaZ13WS_423834_Break( ObjArray )--�R������
			return
		else
			LuaZ13WS_423834_Attack( ObjArray )--�԰�
		end
		
		if i ==1 then
			LuaZ13WS_423834_Message("[SC_423834_A1]")
			--1.����ɮv�j�ۡG�����T�ҲŤ�ݭn�ɶ��A�O���D�s���Z�ڡI
			for j=1, 2 do
				snake = Lua_DW_CreateObj("flag" ,105276,780802, RandRange( 1 , 7 )  )
				WriteRoleValue( snake, EM_RoleValue_IsWalk, 0 )
				MoveToFlagEnabled(snake, false )
				table.insert( ObjArray, snake )
				KS_Move( snake, 30, 5104, 88, -2263 );
			end
		elseif i == 10 then
			LuaZ13WS_423834_Message("[SC_423834_A2]")
			--2.����ɮv�j�ۡG�ťۦb�ܩڦ������O�q�A�ڻݭn�M�`�H��A�_�I�̡A�ֲM���D�s�I
			for j=1,4 do
				snake = Lua_DW_CreateObj("flag" ,105277,780802, RandRange( 1 , 7))
				WriteRoleValue( snake, EM_RoleValue_IsWalk, 0 )
				MoveToFlagEnabled(snake, false )
				table.insert( ObjArray, snake )
				KS_Move( snake, 30, 5104, 88, -2263 );
			end
			Sleep(10)
			LuaZ13WS_423834_Message( "[SC_423834_B1]")--���ļw�i�h�����e�ӡI�I
			for j=1,4 do
				fighter = Lua_DW_CreateObj("flag" ,105281,780802,10+j)
				SetDefIdleMotion( fighter, ruFUSION_MIME_IDLE_COMBAT_1H )
				WriteRoleValue( fighter, EM_RoleValue_IsWalk, 0 )
				MoveToFlagEnabled(fighter, false )
				table.insert( ObjArray, fighter )
				KS_Move( fighter, 15, 5104, 88, -2263 );
			end
		elseif i == 20 then
			LuaZ13WS_423834_Message("[SC_423834_A3]")
			--3.����ɮv�j�ۡG�ť۪��ܤO�}�l��z�A�D�s�w��ı�A�p�߹�ݨe�̪��ƨg�ϼ��I�֩I�s���ļw���i�h���U�I
			for j=1,6 do
				snake = Lua_DW_CreateObj("flag" ,105278,780802,RandRange( 1 , 7))
				WriteRoleValue( snake, EM_RoleValue_IsWalk, 0 )
				MoveToFlagEnabled(snake, false )
				table.insert( ObjArray, snake )
				KS_Move( snake, 30, 5104, 88, -2263 );
			end
			Sleep(20)
			LuaZ13WS_423834_Message( "[SC_423834_B1]")--���ļw�i�h�����e�ӡI�I
			for j=1,6 do
				fighter = Lua_DW_CreateObj("flag" ,105281,780802,10+j)
				SetDefIdleMotion( fighter, ruFUSION_MIME_IDLE_COMBAT_1H )
				WriteRoleValue( fighter, EM_RoleValue_IsWalk, 0 )
				MoveToFlagEnabled(fighter, false )
				table.insert( ObjArray, fighter  )
				KS_Move( fighter, 15, 5104, 88, -2263 );
			end
		elseif i == 21 then
			LuaZ13WS_423834_Message( "[SC_423834_A4]" )
			--����ɮv�j�ۡG�ťۦ�����̫ᶥ�q�A�������۬W�ܮz�B�A��X�`�ê��ťۡI
			rock = Lua_DW_CreateObj("flag" ,105279,780802,10)
			table.insert( ObjArray,  rock )
		end
		
		if i > 21 then
			if i%60 == 0 then
				LuaZ13WS_423834_Message( "[SC_423834_4]")--�Ч����۬W�z�ƳB�A�_�h���ȱN���ѡC		
			elseif CheckID( rock ) ~= true or ReadRoleValue( rock, EM_RoleValue_IsDead ) == 1 then				
				LuaZ13WS_423834_End()--���� ���X��
				LuaZ13WS_423834_Break( ObjArray )--�R������
				return
			end
		end
	end
	LuaZ13WS_423834_Message( "[SC_423834_5]")--�A�å������۬W�z�ƳB�A�޲����۬W�w�ۦ�״_�A���ȥ��ѡC
	LuaZ13WS_423834_Break( ObjArray )--�R������
end	

function LuaZ13WS_423834_Break( ObjArray )--�R������
	for i=1, table.getn(ObjArray) do
		if CheckID(ObjArray[i]) == true then
			DelObj(ObjArray[i])
		end
	end
	CancelBuff( OwnerID(), 508932 )
end

function LuaZ13WS_423834_Attack( ObjArray )--�԰�
	for i=1, table.getn(ObjArray) do
		if	CheckID(ObjArray[i]) == true and 
			ReadRoleValue( ObjArray[i], EM_RoleValue_AttackTargetID ) == 0 then
			
			for j=1, table.getn(ObjArray) do
				if CheckRelation( ObjArray[j], ObjArray[i], EM_CheckRelationType_Enemy ) == true then
					SetAttack( ObjArray[j], ObjArray[i] )
					break
				end
			end
		end
	end
end

function LuaZ13WS_423834_End()--���� ���X��
	local Player = SearchRangePlayer( OwnerID(), 200 )
	for i=0, table.getn(Player)-1 do
		if	CheckAcceptQuest( Player[i], 423834)== true	and
			CheckCompleteQuest( Player[i], 423834)==false	and
			Checkflag( Player[i], 544742) ==false		then
			
			ScriptMessage( Player[i], Player[i], 2,"[SC_423834_A5]", 0 )
			ScriptMessage( Player[i], Player[i], 0,"[SC_423834_A5]", 0 )
			--�ô��z�D�F��_�y�j�ۡG�A�వ�쪺�Ƥw�����A�ְh�X�D�}�A�^��a���ݲ���ɮv�C
			Setflag( Player[i],544742,1)
		end
	end
end
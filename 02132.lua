function cl_762_193304AI() -------->�����������
	local AI = OwnerID() ------->�R�W����s��AI
	local RoomID = ReadRoleValue( AI , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local mob = ReadRoleValue( AI ,EM_RoleValue_Register4) --------����Ѫ��i������ͥX��
	local npcboss = ReadRoleValue( AI ,EM_RoleValue_Register6)
	local open = 0
	open = DW_Rand(100)  ----->��100�Ӷüƥh�H���@�ӭȥX��
	if (open >=1 and open <=10 ) or
		( open >=21 and open <= 30 ) or
		( open >= 41 and open <= 50 ) or 
		( open >= 61 and open <= 70 ) or
		( open >= 81 and open <= 90 ) then
		--BeginPlot( AI,"cl_762_193304AIDOWN", 0 )		
		local boss = CreateObjByFlag( 104897 , 780805 , 20 , 1 ) ------------�ŧi�b�o�ӺX�Ц�m�ͥX��~�کR�W����BOSS
		AddToPartition ( boss,RoomID )  ---------�⪫��[�J������----�n�b�o�Ӧa�貣�ͤ@�ӷs���F�賣�����n���o�Ӱʧ@��
		WriteRoleValue ( boss , EM_RoleValue_PID, AI ) --------��BOSS���O������AI���ͪ�
		WriteRoleValue( boss ,EM_RoleValue_Register6 , npcboss )
		BeginPlot( boss,"cl_193304B_1", 0 )  -----------�N����scpipt��i�h�����W,��������
		BeginPlot( boss,"cl_193304w_1", 0 )  -----------�P�ɶ�����������scpipt�@�_
		BeginPlot( boss,"cl_192boss_bon", 0 ) ----------����p��360���n�I�k�ǰe�쥻��NPC�Ǫ��������L
		ScriptMessage( boss , -1 , 2 ,"[SC_19204_01]" , 2 ) ----�}������
		while 1 do
		sleep ( 10 )
			local del = ReadRoleValue( AI ,EM_RoleValue_Register8) ---delŪ��R8����
			if del == 1 then ---�p�G=1�N�����ۧa
				WriteRoleValue( mob , EM_RoleValue_Register9 , 4 ) ---���N�b���i���������g�J =4
			end
			local kil = ReadRoleValue( AI ,EM_RoleValue_Register2) ---kill
			if kil == 1 then
			elseif kil == 2 then
				local kk = SetSearchAllNPC(RoomID )---���ϰ��NPC
				local ID=GetSearchResult()
				local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
				for i = 0 , kk do
					ID=GetSearchResult()
					ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					if ID2 == 104898 or ID2 == 104899 or ID2 == 104901 then
						DelObj(ID)
					end
				end
				BeginPlot( AI,"cl_762_AIchbuff", 0 )
				sleep ( 10 )
				WriteRoleValue ( AI , EM_RoleValue_Register2 , 0 )
			elseif kil == 3 then
				local kk = SetSearchAllNPC(RoomID )---���ϰ��NPC
				local ID=GetSearchResult()
				local ID2=ReadRoleValue( ID , EM_RoleValue_OrgID )
				for i = 0 , kk do
					ID=GetSearchResult()
					ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					if ID2 == 104898 or ID2 == 104899 or ID2 == 104901 then
						DelObj(ID)
					end
				end
				BeginPlot( AI,"cl_762_AIchbuff", 0 )
				sleep ( 10 )
				WriteRoleValue ( AI , EM_RoleValue_Register2 , 0 )
			end
		end
	elseif (open >= 11 and open <= 20 ) or
		( open >= 31 and open <= 40 ) or
		( open >= 51 and open <= 60 ) or
		( open >= 70 and open <= 80 ) or
		( open >= 91 and open <= 100 ) then
		---BeginPlot( AI,"cl_762_193304AIUP", 0 )
		local boss = CreateObjByFlag( 104897 , 780805 , 23 , 1 ) ------------�ŧi�b�o�ӺX�Ц�m�ͥX��~�کR�W����BOSS
		AddToPartition ( boss,RoomID )  ---------�⪫��[�J������----�n�b�o�Ӧa�貣�ͤ@�ӷs���F�賣�����n���o�Ӱʧ@��
		WriteRoleValue ( boss , EM_RoleValue_PID, AI ) --------��BOSS���O���������ͪ�
		WriteRoleValue( boss ,EM_RoleValue_Register6 , npcboss )
		BeginPlot( boss,"cl_193304B_1", 0 )  -----------�N����scpipt��i�h�����W,��������
		BeginPlot( boss,"cl_193304w_2", 0 )  -----------�N����scpipt��i�h�����W,��������
		BeginPlot( boss,"cl_192boss_bon", 0 )
		ScriptMessage( boss, -1 , 2 ,"[SC_19204_01]" , 2 )
		while 1 do
		sleep ( 10 )
			local del = ReadRoleValue( AI ,EM_RoleValue_Register8)
			if del == 1 then
				WriteRoleValue( mob , EM_RoleValue_Register9 , 4 )
			end
			local kil = ReadRoleValue( AI ,EM_RoleValue_Register2)
			if kil == 1 then
			elseif kil == 2 then
				local kk = SetSearchAllNPC(RoomID )---���ϰ��NPC
				local ID=GetSearchResult()
				local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
				for i = 0 , kk do
					ID=GetSearchResult()
					ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					if ID2 == 104898 or ID2 == 104899 or ID2 == 104901 then
						DelObj(ID)
					end
				end
				BeginPlot( AI,"cl_762_AIchbuff", 0 )
				sleep ( 10 )
				WriteRoleValue ( AI , EM_RoleValue_Register2 , 0 )
			elseif kil == 3 then
				local kk = SetSearchAllNPC(RoomID )---���ϰ��NPC
				local ID=GetSearchResult()
				local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
				for i = 0 , kk do
					ID=GetSearchResult()
					ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					if ID2 == 104898 or ID2 == 104899 or ID2 == 104901 then
						DelObj(ID)
					end
				end
				BeginPlot( AI,"cl_762_AIchbuff", 0 )
				sleep ( 10 )
				WriteRoleValue ( AI , EM_RoleValue_Register2 , 0 )
			end
		end
	end
end
function cl_193304B_1()  ----�԰���
    local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID)  ------>�ڥhŪ������̭���PID�ȧi�DBOSS���O����ͥX�Ӫ�
	local skill = 0 ----->�����CD�ɶ�
	local skill1 = 0 ----->�����CD�ɶ�
	local skill2 = 0 ---->����AE CD�ɶ�
	local skill3 = 0 ----->���ۧ���
	local skill4 = 0
	local Six_Table = {}  -----��J����L�᪺�����
	local Six_Table2 = {}  -----��J����L�᪺�����
	local Rand_Num = 0 ---Rand �Ʀr��
	local Finel_Table = {} --��X�Ӫ������H���ؼЩ�m��Table
	local CombatBegin = 0
	local X1 = 0
	local Y1 = 0
	local Z1 = 0
	local bkma = 0
	local Finel_Num = 0
	local ggyy = 0
	local hot = 0
	SetPlot( OwnerID(),"dead","cl_762_193304B_dead",10 )
	while 1 do   ------�����԰��j��,�o�̭n�i�D���C�j�h�[�N�ˬd�@��
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )-----�C�@���M����������ؼ�
		--Six_Table2 = star_HateListSort(OwnerID())  ----�N����������a�̷Ӥ��밪�C�ƦC
		--hot=table.getn(Six_Table2) ----����o��Table
		if HateListCount( OwnerID() ) ~= 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 0 then   -----�p�G������������H~�N�N�o�ӭȧ���
			   CombatBegin = 1       ------�N�����԰��}�l���A�ȧ令1~�N��N�O���i�J�԰��F
			   WriteRoleValue ( AI , EM_RoleValue_Register2 , 1 )
			end
				if CombatBegin == 1 then
					--skill = skill + 1   ----->skill�C��N+1�W�h 
					--if skill >= 3 then ----->��Skill���Ȥj�󵥩�3���ɭ�
						--CastSpelllv ( OwnerID() , OwnerID(), 496488 , 15 )----���e�ؼ�����@�ӥ��j�ˮ`
						--sleep ( 10 )   --------->�񪱪k�N���Ӱj�鰱���
						--skill = 0
					--end
					skill1 = skill1 + 1
					if skill1 >= 5 then
						CastSpelllv ( OwnerID() , OwnerID(), 496488 , 35  )----���e�ؼ�����@�ӥ��j�ˮ`  AE
						sleep ( 10 )   --------->�񪱪k�N���Ӱj�鰱���
						skill1 = 0
					end
					skill2 = skill2 + 1
					if skill2 >= 13 then
						CastSpelllv ( OwnerID() , AttackTarget, 496489 , 100 )----���e�ؼ�����@�ӥ��j�ˮ`
						sleep ( 20 )
						skill2 = 0
					end
					skill3 = skill3 + 1
					if skill3 >= 28 then ----->��]��7���ɭԴN���H�U���Ʊ�
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
							sleep(10)
						end
						ScriptMessage( OwnerID(), -1 , 2 ,"[SC_19204_04]" , 2 )
						--Six_Table = star_HateListSort(OwnerID())  ----�N����������a�̷Ӥ��밪�C�ƦC
						Six_Table = DW_HateRemain(1)  ----�N����������a�̷Ӥ��밪�C�ƦC
						--ggyy=table.getn(Six_Table) ----����o��Table
						--table.remove ( Six_Table , 1 ) ----�ư��Ĥ@����
						bkma=table.getn(Six_Table) ----����o��Table
						for i = 0 , 5 , 1 do ---�H����X���ӤH
							Rand_Num = DW_Rand(bkma)
							if bkma > 0 then
								table.insert( Finel_Table , Six_Table[Rand_Num] )
								table.remove ( Six_Table , Rand_Num )
								bkma=table.getn(Six_Table)
							end
						end
						Finel_Num = table.getn(Finel_Table)
						for i = 1 , Finel_Num , 1 do
							Addbuff (  Finel_Table[i] , 508054 , 0 ,-1 ) ---�I�����BUFF
							X1 = ReadRoleValue ( Finel_Table[i], EM_RoleValue_X)
							Y1 = ReadRoleValue ( Finel_Table[i], EM_RoleValue_Y)
							Z1 = ReadRoleValue ( Finel_Table[i], EM_RoleValue_Z)   ---------�o�̬O���XAttackplayer�̭������ӤH���y��
							local ball = CreateObj( 104899 , X1, Y1 , Z1 , 0 , 1 )  ------------
							SetModeEx( ball , EM_SetModeType_Strikback, false) ---����(�_)
							SetModeEx( ball , EM_SetModeType_Move, false) ---����	(�_)
							SetModeEx( ball , EM_SetModeType_Searchenemy, false)--����(�_)
							SetModeEx( ball , EM_SetModeType_Mark, false)			---�i�I��(�O)
							SetModeEx( ball , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
							SetModeEx( ball , EM_SetModeType_Fight, false) ---�i���(�O)
							SetModeEx( ball , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
							AddToPartition(ball,RoomID)
							WriteRoleValue ( ball , EM_RoleValue_Register7 , OwnerID() ) --------��ball���O���ͪ�
							local fin = Finel_Table[i]
							WriteRoleValue ( ball , EM_RoleValue_Register5 , fin )
							BeginPlot( ball,"cl_CancelBuff", 0 )
							sleep ( 1 )
						end
						skill3 = 0
						Rand_Num = 0
						Finel_Num = 0
						bkma = 0
						Finel_Table = {}
						Six_Table = {}
					end
					skill4 = skill4 + 1
					if skill4 >= 19 then
						ScriptMessage( OwnerID(), -1 , 2 ,"[SC_19204_03]" , 2 )
						sysCastSpelllv ( OwnerID() , AttackTarget , 496490 , 0 )  --�P�V
						sleep ( 10 )
						skill4 = 0
					end
				end
		elseif HateListCount ( OwnerID() ) == 0 then --�D�԰��� ---�p�G����������S���H�N�n�Ǧ^��������
			if CombatBegin == 1 then  ----�p�G��������S���H�F~�N�N�o�ӭȧ���
				CombatBegin = 0 ------�ҥH�]������������S���H�N�����}�԰��F~�o�ɭԴN�����N�o�ӭȼg�^�h��Ӫ�0~���M���|�@���O���԰����A
				WriteRoleValue ( AI , EM_RoleValue_Register2 , 3 )
			end
		end
		sleep (10)
	end
end

function cl_762_193304B_dead() ----Boss �������@��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	ScriptMessage( OwnerID(), -1 , 2 ,"[SC_19204_02]" , 2 )
	WriteRoleValue ( AI , EM_RoleValue_Register8 , 1 )
	WriteRoleValue ( AI , EM_RoleValue_Register2 , 2 )
end
function cl_762_AIchbuff() ----Boss �������@��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local TempPlayer = SetSearchAllPlayer(RoomID)----��ϰ�Ҧ����a
	local ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
		if CheckID( ThesePlayer[i] )  == true and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) ==  0 and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) ==  1 then--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
			if CheckBuff( ThesePlayer[i] , 508052 ) or CheckBuff( ThesePlayer[i] , 508054 ) ==  true then
				CancelBuff(ThesePlayer[i], 508052)
				CancelBuff(ThesePlayer[i], 508054)
			end
		end					
	end
end
function cl_CancelBuff() ----�z���y
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local boss = ReadRoleValue( OwnerID() , EM_RoleValue_register7)  ------>Ū���O���@�ڥX�Ӫ�
	local time1 = 0
	local player = ReadRoleValue( OwnerID() , EM_RoleValue_register5)
	sleep ( 40 )
	if CheckBuff(  player , 508054 ) == true then
		sleep (10)
		X1 = ReadRoleValue (  player, EM_RoleValue_X)
		Y1 = ReadRoleValue (  player, EM_RoleValue_Y)
		Z1 = ReadRoleValue (  player, EM_RoleValue_Z)   ---------�o�̬O���XAttackplayer�̭������ӤH���y��
		local bil = CreateObj( 104898 , X1, Y1 , Z1 , 0 , 1 )  ------------
		SetModeEx( bil , EM_SetModeType_Strikback, false) ---����(�_)
		SetModeEx( bil , EM_SetModeType_Move, false) ---����	(�_)
		SetModeEx( bil , EM_SetModeType_Searchenemy, true)--����(�_)
		SetModeEx( bil , EM_SetModeType_Mark, true)			---�i�I��(�O)
		SetModeEx( bil , EM_SetModeType_ShowRoleHead, true) 		---�Y����(�O)
		SetModeEx( bil , EM_SetModeType_Fight, true) ---�i���(�O)
		SetModeEx( bil , EM_SetModeType_NotShowHPMP , true) ----����ܼg��
		AddToPartition(bil,RoomID)
		WriteRoleValue ( bil , EM_RoleValue_Register3 , OwnerID() ) --------��BOSS���O���������ͪ�
		BeginPlot( bil,"cl_19205bon", 0 )
		SetPlot( bil,"dead","cl_bil_dead",10 )
	elseif CheckBuff(  player , 508054 ) == false then
		sleep ( 10 )
		delobj ( OwnerID() )
	end
end
function cl_19205bon() ----�����Ϊ�
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local ball = ReadRoleValue( OwnerID() , EM_RoleValue_register3)  ------>Ū���O���@�ڥX�Ӫ�
	local boss = ReadRoleValue( ball , EM_RoleValue_register7)
	local time2 = 0
	addbuff ( OwnerID() , 508120 , 0 , -1 )
	local most = {}
	local mostbon = {}
	most = SearchRangeNPC ( OwnerID() , 30 )
	local mostno = table.getn(most)
	for i=1 , mostno , 1 do
		if ReadRoleValue( most[i] , EM_RoleValue_OrgID ) == 104898 then
			table.insert( mostbon , most[i] )
		end	
	end
	local belin = table.getn(mostbon)
	if belin >= 2 then
		CastSpelllv ( OwnerID() , OwnerID() , 496789 , 0 )
	end
	while 1 do
		sleep ( 10 )
		time2 = time2 + 1
		if time2 >= 15 then
			CastSpelllv ( OwnerID() , boss , 496492 , 0 )
			sysCastSpelllv ( OwnerID() , OwnerID() , 496493 , 0 )
			sleep ( 10 )
			delobj ( ball )
			sleep ( 10 )
			delobj ( OwnerID() )
		end
	end
end
function cl_bil_dead() ----Boss �������@��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local ball = ReadRoleValue( OwnerID() , EM_RoleValue_register3)
	X1 = ReadRoleValue ( OwnerID(), EM_RoleValue_X)
	Y1 = ReadRoleValue ( OwnerID(), EM_RoleValue_Y)
	Z1 = ReadRoleValue ( OwnerID(), EM_RoleValue_Z)   ---------�o�̬O���XAttackplayer�̭������ӤH���y��
	local hide = CreateObj( 104901 , X1, Y1 , Z1 , 0 , 1 )  ------------
	SetModeEx( hide , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( hide , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( hide , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( hide , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( hide , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( hide , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( hide , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
	AddToPartition( hide , RoomID )
	BeginPlot( hide,"cl_Bon_2", 0 )
	delobj ( ball )
	delobj ( OwnerID() )
end
function cl_Bon_2()  -----�S�ĨD�I��k�N
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	CastSpelllv ( OwnerID() , OwnerID() , 496493 , 0 )
	sleep ( 20 )
	delobj ( OwnerID() )
end
function cl_193304w_1()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID)  ------>�ڥhŪ������̭���PID�ȧi�DBOSS���O����ͥX�Ӫ�
	local go = 0
	while 1 do
		sleep ( 10 )
		if	HateListCount( OwnerID())~= 0 and ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode )== 1	then --�D�԰���
			StopMove(OwnerID(),false)
			if go == 0 then
				go = 1
			end
		elseif HateListCount( OwnerID() )== 0 and ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode )== 0	then --�D�԰��� 
			if go == 1 then
				go = 0
			end
			if go == 0 then
				MoveToFlagEnabled(OwnerID(), false) ---�t�Τ��ت����|����
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 , 21 , 0 )
				WriteRoleValue(OwnerID(),EM_RoleValue_register3,go+1)
			end
		end
	end
end
function cl_193304w_2()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID)  ------>�ڥhŪ������̭���PID�ȧi�DBOSS���O����ͥX�Ӫ�
	local go = 0
	while 1 do
		sleep ( 10 )
		if	HateListCount( OwnerID())~= 0 and ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode )== 1	then --�D�԰���
			StopMove(OwnerID(),false)
			if go == 0 then
				go = 1
			end
		elseif HateListCount( OwnerID() )== 0 and ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode )== 0	then --�D�԰���
			if go == 1 then
				go = 0
			end
			if go == 0 then
				MoveToFlagEnabled(OwnerID(), false) ---�t�Τ��ت����|����
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 , 24 , 0 )
				WriteRoleValue(OwnerID(),EM_RoleValue_register3,go+1)
			end
		end
	end
end
function cl_192boss_bon()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID)  ------>�ڥhŪ������̭���PID�ȧi�DBOSS���O����ͥX�Ӫ� 
	local skill = 0 ----->�����CD�ɶ�
	local CombatBegin = 0
	local open = 0
	local npcboss = ReadRoleValue( OwnerID() ,EM_RoleValue_Register6)
	while 1 do
		sleep ( 10 )
		skill = skill + 1
		if skill >= 360 then
			while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
				sleep(10)
			end
			if open == 0 and CombatBegin == 0 then
				ScriptMessage( OwnerID(), -1 , 2 ,"[SC_19204_05]" , 2 )
				Addbuff ( OwnerID() , 508056 , 0 , -1 )
				CastSpelllv ( OwnerID() , OwnerID() , 496495 , 0 )
				sleep ( 30 )
				local Xnpcboss=0
				local Ynpcboss=0
				local Znpcboss=0
				Xnpcboss=ReadRoleValue(npcboss ,EM_RoleValue_X)
				Ynpcboss=ReadRoleValue(npcboss ,EM_RoleValue_Y)
				Znpcboss=ReadRoleValue(npcboss ,EM_RoleValue_Z)
				SetPos( OwnerID(), Xnpcboss-90, Ynpcboss, Znpcboss , 0 )
				AddToPartition(OwnerID(),RoomID)
				SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---����	(�_)
				for i = 0 , 3 do
					sleep ( 20 )
					CastSpelllv ( OwnerID() , npcboss , 496494 , 0 )
				end
				open = 1
				CombatBegin = 1
				SetModeEx( OwnerID() , EM_SetModeType_Strikback, false) ---����(�_)
			end
		end
	end 
end
function cl_762_193304AIUP() -------->�����������
	local AI = OwnerID() ------->�R�W����s��AI
	local RoomID = ReadRoleValue( AI , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local mob = ReadRoleValue( AI ,EM_RoleValue_Register4) --------����Ѫ��i������ͥX��
	local npcboss = ReadRoleValue( AI ,EM_RoleValue_Register6)
	local boss = CreateObjByFlag( 104897 , 780805 , 23 , 1 ) ------------�ŧi�b�o�ӺX�Ц�m�ͥX��~�کR�W����BOSS
	AddToPartition ( boss,RoomID )  ---------�⪫��[�J������----�n�b�o�Ӧa�貣�ͤ@�ӷs���F�賣�����n���o�Ӱʧ@��
	WriteRoleValue ( boss , EM_RoleValue_PID, AI ) --------��BOSS���O���������ͪ�
	SetPlot( boss,"dead","cl_762_193304B_dead",10 )
	WriteRoleValue( boss ,EM_RoleValue_Register6 , npcboss )
	BeginPlot( boss,"cl_193304B_1", 0 )  -----------�N����scpipt��i�h�����W,��������
	BeginPlot( boss,"cl_193304w_2", 0 )  -----------�N����scpipt��i�h�����W,��������
	BeginPlot( boss,"cl_192boss_bon", 0 )
	ScriptMessage( OwnerID(), -1 , 2 ,"[SC_19204_01]" , 2 )
	while 1 do
	sleep ( 10 )
		local del = ReadRoleValue( AI ,EM_RoleValue_Register8)
		if del == 1 then
			WriteRoleValue( mob , EM_RoleValue_Register9 , 4 )
		end
		local kil = ReadRoleValue( AI ,EM_RoleValue_Register2)
		if kil == 1 then
		elseif kil == 2 then
			local kk = SetSearchAllNPC(RoomID )---���ϰ��NPC
			local ID=GetSearchResult()
			local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
			for i = 0 , kk do
				ID=GetSearchResult()
				ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
				if ID2 == 104898 or ID2 == 104899 or ID2 == 104901 then
					DelObj(ID)
				end
			end
			BeginPlot( AI,"cl_762_AIchbuff", 0 )
			sleep ( 10 )
			WriteRoleValue ( AI , EM_RoleValue_Register2 , 0 )
		elseif kil == 3 then
			local kk = SetSearchAllNPC(RoomID )---���ϰ��NPC
			local ID=GetSearchResult()
			local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
			for i = 0 , kk do
				ID=GetSearchResult()
				ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
				if ID2 == 104898 or ID2 == 104899 or ID2 == 104901 then
					DelObj(ID)
				end
			end
			BeginPlot( AI,"cl_762_AIchbuff", 0 )
			sleep ( 10 )
			WriteRoleValue ( AI , EM_RoleValue_Register2 , 0 )
		end
	end
end
function cl_762_193304AIDOWN() -------->�����������
	local AI = OwnerID() ------->�R�W����s��AI
	local RoomID = ReadRoleValue( AI , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local mob = ReadRoleValue( AI ,EM_RoleValue_Register4) --------����Ѫ��i������ͥX��
	local npcboss = ReadRoleValue( AI ,EM_RoleValue_Register6)
	local boss = CreateObjByFlag( 104897 , 780805 , 20 , 1 ) ------------�ŧi�b�o�ӺX�Ц�m�ͥX��~�کR�W����BOSS
	AddToPartition ( boss,RoomID )  ---------�⪫��[�J������----�n�b�o�Ӧa�貣�ͤ@�ӷs���F�賣�����n���o�Ӱʧ@��
	SetPlot( boss,"dead","cl_762_193304B_dead",10 )----�ͥX�ӴN�[�J���`�@��
	WriteRoleValue ( boss , EM_RoleValue_PID, AI ) --------��BOSS���O������AI���ͪ�
	WriteRoleValue( boss ,EM_RoleValue_Register6 , npcboss )
	BeginPlot( boss,"cl_193304B_1", 0 )  -----------�N����scpipt��i�h�����W,��������
	BeginPlot( boss,"cl_193304w_1", 0 )  -----------�P�ɶ�����������scpipt�@�_
	BeginPlot( boss,"cl_192boss_bon", 0 ) ----------����p��360���n�I�k�ǰe�쥻��NPC�Ǫ��������L
	ScriptMessage( OwnerID(), -1 , 2 ,"[SC_19204_01]" , 2 ) ----�}������
	while 1 do
	sleep ( 10 )
		local del = ReadRoleValue( AI ,EM_RoleValue_Register8) ---delŪ��R8����
		if del == 1 then ---�p�G=1�N�����ۧa
			WriteRoleValue( mob , EM_RoleValue_Register9 , 4 ) ---���N�b���i���������g�J =4
		end
		local kil = ReadRoleValue( AI ,EM_RoleValue_Register2) ---kill
		if kil == 1 then
		elseif kil == 2 then
			local kk = SetSearchAllNPC(RoomID )---���ϰ��NPC
			local ID=GetSearchResult()
			local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
			for i = 0 , kk do
				ID=GetSearchResult()
				ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
				if ID2 == 104898 or ID2 == 104899 or ID2 == 104901 then
					DelObj(ID)
				end
			end
			BeginPlot( AI,"cl_762_AIchbuff", 0 )
			sleep ( 10 )
			WriteRoleValue ( AI , EM_RoleValue_Register2 , 0 )
		elseif kil == 3 then
			local kk = SetSearchAllNPC(RoomID )---���ϰ��NPC
			local ID=GetSearchResult()
			local ID2=ReadRoleValue( ID , EM_RoleValue_OrgID )
			for i = 0 , kk do
				ID=GetSearchResult()
				ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
				if ID2 == 104898 or ID2 == 104899 or ID2 == 104901 then
					DelObj(ID)
				end
			end
			BeginPlot( AI,"cl_762_AIchbuff", 0 )
			sleep ( 10 )
			WriteRoleValue ( AI , EM_RoleValue_Register2 , 0 )
		end
	end
end
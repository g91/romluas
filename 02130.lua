function un_762_190001AI() -------->�h���L�����
    --local AI = OwnerID() ------->�R�W����s��AI
    local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local open = 0 ---->�}�ԺX�� �ͥX�e�����X��
	---local door2 = 0 ------>�e��
	local bossrand = DW_rand(2)
	local timeup = 0
	local mob1 = ReadRoleValue( OwnerID() , EM_RoleValue_Register1)
	if bossrand ==1 then
		local boss = CreateObjByFlag( 104920 , 780794 , 5 , 1 )   -------�α���N���ͦb�o�ӺX�Ъ���m
		AddToPartition ( boss,RoomID )  ---------�⪫��[�J������----�n�b�o�Ӧa�貣�ͤ@�ӷs���F�賣�����n���o�Ӱʧ@��
	WriteRoleValue ( boss , EM_RoleValue_PID, OwnerID() )  -----�b����PID���W�g�J�o�ӭ�,�i�D���֬O���
	WriteRoleValue ( boss , EM_RoleValue_Register1, mob1 )
	BeginPlot( boss,"un_762_190001B", 10 )  -----------�N����scpipt��i�h�����W,��������
	
		WriteRoleValue ( boss , EM_RoleValue_Register4,1 )
	elseif bossrand == 2 then
		local boss = CreateObjByFlag( 104920 , 780794 , 7 , 1 )   -------�α���N���ͦb�o�ӺX�Ъ���m
		AddToPartition ( boss,RoomID )  ---------�⪫��[�J������----�n�b�o�Ӧa�貣�ͤ@�ӷs���F�賣�����n���o�Ӱʧ@��
	WriteRoleValue ( boss , EM_RoleValue_PID, OwnerID() )  -----�b����PID���W�g�J�o�ӭ�,�i�D���֬O���
	WriteRoleValue ( boss , EM_RoleValue_Register1, mob1 )
	BeginPlot( boss,"un_762_190001B", 10 )  -----------�N����scpipt��i�h�����W,��������
	
		WriteRoleValue ( boss , EM_RoleValue_Register4,2 )
	end
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register2 ,0 )  -----��ڧ���ͥX�ӫ�N�}�l�hŪ�������W����,��ȧ��ܴN�|�Q�ڥs�h�����w���Ʊ�
	
	
	while 1 do   -------�C�j�h�[�N�]�@���o�Ӱj��
	    sleep (10)   -----�C�j1��N�ˬd�@���o�Ӱj��
		--local AttackTarget = ReadRoleValue( boss , EM_RoleValue_AttackTargetID )-----�C�@���M����������ؼ�
		local p = ReadRoleValue( OwnerID() , EM_RoleValue_Register2)  ------>P�̭����ȥN��̭��n���ƻ�Ʊ�~~����hŪ��Register1����
		if p == 1 then   -------�qp�̭��h���X�ӧڭn����(���|�A�����԰����ɭԤ~�|��ȶi�h�ҥH�o�̧ڬO�C���b�P�_���{�b�f�U�̪���)�]�����i�J�԰��F~�ȴN�|�ܦ�1�ҥH�o�̤��ΰ�����Ʊ�
			if open == 0 then  ------->��ͪ����X�е���0���ɭԴN�ͥX�e��
				ScriptMessage( OWNERID(), -1 , 2 , "[SC_104920_01]" , 2 )
			open = 1 ------->�ͧ�����~�N�N�X�мg��1,�קK���@����
			end
			--timeup=timeup+1
		elseif p == 2 then ------�qp�̭��h���X�ӧڭn����~������`����o2����~�N�|�R���e��� , �åB�M�����W�Ҧ�����
			---DelObj ( door1 ) ------�R�����
			---delobj (door2) -----�R���e��
			open = 0 ----->�n�N�}�ԺX�мg�^�h0
		elseif p == 3 then ------�qP�̭��h���X�ӧڭn����~������}�԰������o3���Ȫ���~�N�n�R����~�åB�ؤ@��s�����O�ѰO�h�N���[�J����~�åB�i�D��~���O�������ͥX�Ӫ�~�]�n��J����script	
			WriteRoleValue ( OwnerID() , EM_RoleValue_Register2 ,0 )  ---->�NRegister1�g�^�h0
			open = 0 ----->�n�N�}�ԺX�мg�^�h0
			--timeup=0
		end
		--if timeup>=300 then
			--if checkID(boss) == true then
				--addbuff(boss,507663,0,-1)
			--elseif	checkID(boss)==false then
			--	delobj(OwnerID())
		--	end
		--end
	end
end
function un_762_190001B()
    local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID)  ------>�ڥhŪ������̭���PID�ȧi�DBOSS���O����ͥX�Ӫ�
	local skill = 0 ----->�����CD�ɶ�
	local skill2 = 0 ---->����AE CD�ɶ�
	local skill3 = 0 ----->���ۧ���
	local skill4 = 0 
	local mots  -------->�ŧi�֬O�z���S�Ĳy
	local CombatBegin = 0  ------>�ŧi�����}�ԺX��
	local X1 = 0
	local Y1 = 0
	local Z1 = 0
	local bossrand = ReadRoleValue ( OwnerID() , EM_RoleValue_Register4)
	if bossrand == 1 then
		beginplot(OwnerID(),"un_PE3MOB1_9898",0) --����1
	elseif bossrand ==2 then
		beginplot(OwnerID(),"un_PE3MOB1_9898_1",0) --����2
	end
	--local mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
	SetPlot( OwnerID(),"dead","un_762_190001B_dead",10 )  ------>������`�����o�q�����@��
	while 1 do   ------�����԰��j��,�o�̭n�i�D���C�j�h�[�N�ˬd�@��
		sleep (10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )-----�C�@���M����������ؼ�
		if HateListCount( OwnerID() ) ~= 0 then ---�p�G������������H�N�~��԰�
			StopMove(OwnerID(),false)
			if CombatBegin == 0 then   -----�p�G������������H~�N�N�o�ӭȧ���
			   CombatBegin = 1       ------�N�����԰��}�l���A�ȧ令1~�N��N�O���i�J�԰��F
			   WriteRoleValue ( AI , EM_RoleValue_Register2 ,1 ) ------����i�J�԰��F~�ҥH�ڭn���A�Ĥ@�Ӥf�U���g�i�h1�N��L�i�J�԰�~�o�ɭԫe���n�ͥX��
			end
			   if CombatBegin == 1 then  ----->��}�ԺX�Ф������ܦ�1���ɭ԰���H�U�R�O
				   skill = skill + 1   ----->skill�C��N+1�W�h 
				   if skill >= 3 then ----->��Skill���Ȥj�󵥩�5���ɭ�
					  Luck = DW_Rand(100)  ----->��100�Ӷüƥh�H���@�ӭȥX��
						if ( Luck >= 1 and Luck <= 10) or( Luck >=21 and Luck <= 30 ) or
						   ( Luck >= 41 and Luck <= 50 ) or ( Luck >= 61 and Luck <= 70 ) or
						   ( Luck >= 81 and Luck <= 90 ) then      ------------>���H���X�Ӫ��ȵ���H�W���üƴN�I��Ĥ@��
						   CastSpell ( OwnerID() , AttackTarget , 496412  )----���e�ؼ�����@�ӥ��j�ˮ`
						   sleep ( 20 )   --------->�񪱪k�N���Ӱj�鰱���
						elseif ( Luck >= 11 and Luck <= 20 ) or( Luck >= 31 and Luck <= 40 ) or
							   ( Luck >= 51 and Luck <= 60 ) or( Luck >= 70 and Luck <= 80 ) or
							   ( Luck >= 91 and Luck <= 100 ) then   ------------>���H���X�Ӫ��ȵ���H�W���üƴN�I��ĤG��
							   CastSpelllv ( OwnerID() , OwnerID() , 496411 , 19 )----�e�记��
							sleep ( 20 )
						end
						skill = 0
					end
					sleep (10)   ------>�W�@�Ӥ��j��]���@�鰱�@��
					skill2 = skill2 + 1  ------>Skill2�C�@��N+1�W�h
					if skill2 >= 7 then ----->��]��7���ɭԴN���H�U���Ʊ�
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
							sleep(10)
						end
						local Attackplayer = Lua_AP_HateTargetID( OwnerID() )  -----���������H���@�ӤH,�o�̬O�]�n��function ,Attackplayer=�O�ڧ�X�Ӫ����ӤH
						X1 = ReadRoleValue ( Attackplayer, EM_RoleValue_X)
						Y1 = ReadRoleValue ( Attackplayer, EM_RoleValue_Y)
						Z1 = ReadRoleValue ( Attackplayer, EM_RoleValue_Z)   ---------�o�̬O���XAttackplayer�̭������ӤH���y��
						mots = CreateObj( 104820 , X1, Y1 , Z1 , 0 , 1 )  ------------
						SetModeEx( mots , EM_SetModeType_Strikback, false) ---����(�_)
						SetModeEx( mots , EM_SetModeType_Move, false) ---����	(�_)
						SetModeEx( mots , EM_SetModeType_Searchenemy, false)--����(�_)
						SetModeEx( mots , EM_SetModeType_Mark, false)			---�i�I��(�O)
						SetModeEx( mots , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
						SetModeEx( mots , EM_SetModeType_Fight, false) ---�i���(�O)
						SetModeEx( mots , EM_SetModeType_NotShowHPMP , false) ----�����HP��
						AddToPartition(mots,RoomID)
						CastSpell ( OwnerID() , mots , 496413 )
						BeginPlot( mots , "un_762_190000most" , 0 )
						sleep ( 30 )
						skill2 = 0
					end
					skill3 = skill3 + 1
					if skill3 >= 11 then
					   CastSpelllv ( OwnerID() , AttackTarget , 496410 , 13 )
					   sleep ( 30 )
					   skill3 = 0
					end
					skill4 = skill4+1
					if skill4>=20 then
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
							sleep(10)
						end
						CastSpelllv ( OwnerID() , OwnerID() , 495621 , 12 )
							sleep(55)
						skill4 = 0
					end
				end
		elseif HateListCount ( OwnerID() ) == 0 then ---�p�G����������S���H�N�n�Ǧ^��������
			if CombatBegin == 1 then  ----�p�G��������S���H�F~�N�N�o�ӭȧ���
			   CombatBegin = 0 ------�ҥH�]������������S���H�N�����}�԰��F~�o�ɭԴN�����N�o�ӭȼg�^�h��Ӫ�0~���M���|�@���O���԰����A
			   WriteRoleValue ( AI , EM_RoleValue_Register2 ,3)  ----���a���}�԰���~���n���m~�ҥH�^��3���ȵ��Ĥ@�Ӥf�U
			end
		end
	end
end

function un_762_190001B_dead() ----Boss �������@��
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local bossmon =  ReadRoleValue(OwnerID() , EM_RoleValue_Register1)
	ScriptMessage( OWNERID(), -1 , 2 , "[SC_104920_2]" , 2 )
	WriteRoleValue ( AI , EM_RoleValue_Register2, 2 )
	WriteRoleValue ( bossmon , EM_RoleValue_Register9, 1 )
	--say(OwnerID(),"return  for "..bossmon.." regest9 = 1")
end

function un_762_190000most()  -----�S�ĨD�I��k�N
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	sleep ( 30 )
	CastSpelllv ( OwnerID() , OwnerID() , 496414 , 13 )
	sleep ( 20 )
	killid ( OwnerID() , OwnerID() )
end
function un_PE3MOB1_9898()---���X��
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_Register3)		
	while true do
		mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
		if hatelistcount(OwnerID())~=0 	then
			StopMove(OwnerID(),false)
		elseif hatelistcount(OwnerID())==0 	then
			MoveToFlagEnabled(OwnerID(), false)
			--say(OwnerID(),"mob9898="..mob9898)
			if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)==0	then
				if mob9898==0 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,1,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_Register3,mob9898+1)
				--SetPosByFlag( OwnerID() , 780716, 2 )
				sleep(10)
				elseif mob9898==1 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,2,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_Register3,mob9898+1)
				SetPosByFlag( OwnerID() , 780805, 3 )
				elseif mob9898==2 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,21,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_Register3,mob9898+1)
				end
			end
		end	
		sleep(10)
	end
end
function un_PE3MOB1_9898_1()---���X��
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_Register3)		
	while true do
		mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
		if hatelistcount(OwnerID())~=0 	then
			StopMove(OwnerID(),false)
		elseif hatelistcount(OwnerID())==0 	then
			MoveToFlagEnabled(OwnerID(), false)
			--say(OwnerID(),"mob9898="..mob9898)
			if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)==0	then
				if mob9898==0 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,4,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_Register3,mob9898+1)
				--SetPosByFlag( OwnerID() , 780716, 2 )
				sleep(10)
				elseif mob9898==1 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,5,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_Register3,mob9898+1)
				SetPosByFlag( OwnerID() , 780805,6 )
				elseif mob9898==2 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,24,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_Register3,mob9898+1)
				end
			end
		end	
		sleep(10)
	end
end	
function cl_762_190001AI() -------->�h���L�����
    local AI = OwnerID() ------->�R�W����s��AI
    local RoomID = ReadRoleValue( AI , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local open = 0 ---->�}�ԺX�� �ͥX�e�����X��
	local fiag = 0
	local mobtime1 = 0
	local mobtime2 = 0 
	local mob1 = 0
	local luck = 0
	local luck2 = 0
	local luck3 = 0
	local luck4 = 0
	local ID
	local fun = {"cl_762_1901mob1","cl_762_1901mob2","cl_762_1901mob3"}
	local rand={}
	local mon = {}
	local monster = {105000,105001,105002}--��ǰ}�C
	local monster1
	local boss = CreateObjByFlag( 104786 , 780767 , 1 , 1 )   -------�α���N���ͦb�o�ӺX�Ъ���m
	AddToPartition ( boss,RoomID )  ---------�⪫��[�J������----�n�b�o�Ӧa�貣�ͤ@�ӷs���F�賣�����n���o�Ӱʧ@��
	WriteRoleValue ( boss , EM_RoleValue_PID, AI )  -----�b����PID���W�g�J�o�ӭ�,�i�D���֬O���
	BeginPlot( boss,"cl_762_190001B", 10 )  -----------�N����scpipt��i�h�����W,��������
	WriteRoleValue ( AI , EM_RoleValue_Register2 ,0 )
	WriteRoleValue ( AI , EM_RoleValue_Register3 , boss )
	local cck = CreateObjByFlag( 105036 , 780767 , 2 , 1 )  ------------
	SetModeEx( cck , EM_SetModeType_Show, false) ----�q�X
	SetModeEx( cck , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( cck , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( cck , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( cck , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( cck , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( cck , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( cck , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
	AddToPartition(cck,RoomID)
	WriteRoleValue ( cck , EM_RoleValue_PID, AI )
	WriteRoleValue ( cck , EM_RoleValue_Register1, boss )
	BeginPlot( cck , "cl_762_chack" , 0 )
	while 1 do   -------�C�j�h�[�N�]�@���o�Ӱj��
	    sleep (10)   -----�C�j1��N�ˬd�@���o�Ӱj��
		local p = ReadRoleValue( AI , EM_RoleValue_Register1)  ------>P�̭����ȥN��̭��n���ƻ�Ʊ�~~����hŪ��Register1����
		if p == 1 then   -------�qp�̭��h���X�ӧڭn����(���|�A�����԰����ɭԤ~�|��ȶi�h�ҥH�o�̧ڬO�C���b�P�_���{�b�f�U�̪���)�]�����i�J�԰��F~�ȴN�|�ܦ�1�ҥH�o�̤��ΰ�����Ʊ�
			if open == 0 then  ------->��ͪ����X�е���0���ɭԴN�ͥX�e��
				open = 1 ------->�ͧ�����~�N�N�X�мg��1,�קK���@����
			end
			if open == 1 then
				mobtime2 = mobtime2 + 1
				if mobtime2 >= 15 then
					for i=1,table.getn(monster) do
						local x = ReadRoleValue (boss, EM_RoleValue_X)
						local y = ReadRoleValue (boss, EM_RoleValue_Y)
						local z = ReadRoleValue (boss, EM_RoleValue_Z)
						rand = Az_RND_Ary(-150,150,2)
						monster1 = CreateObj ( monster[i] , x+rand[1] , y , z+rand[2] , 0 , 1) --�H���r���P��ͩ�
						AddToPartition(monster1,roomID )
						WriteRoleValue(monster1,EM_RoleValue_Livetime,20)  --�s���ɶ�
						WriteRoleValue ( monster1 , EM_RoleValue_PID, OwnerID())----
						WriteRoleValue ( monster1 , EM_RoleValue_Register3, boss )
						BeginPlot( monster1,fun[i], 10 )
						table.insert( mon , monster1 )
						sleep ( 2 )
					end
					mobtime2 = 0
				end
			end
		elseif p == 2 then ------�qp�̭��h���X�ӧڭn����~������`����o2����~�N�|�R���e��� , �åB�M�����W�Ҧ�����
			open = 0 ----->�n�N�}�ԺX�мg�^�h0
			WriteRoleValue ( AI , EM_RoleValue_Register2 ,1 )
			WriteRoleValue ( AI , EM_RoleValue_Register4 ,0 )
			mobtime1 = 0
			mobtime2 = 0
			--local kk = SetSearchAllNPC(RoomID )---���ϰ��NPC
			--ID=GetSearchResult()
			--local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
			--for i = 0 , kk do
				--ID=GetSearchResult()
				--ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
				--if ID2 == 105003 or ID2 == 105000 or ID2 == 105001 or ID2 == 105002 or ID2 == 105003 then
					--DelObj(ID)
				--end
			--end
			for i = 1 , table.getn(mon), 1 do
				if mon[i] ~= nil then
					DelObj ( mon[i] )
				end
			end
			delobj ( cck )
			sleep ( 100 )
			delobj ( AI )
		elseif p == 3 then ------�qP�̭��h���X�ӧڭn����~������}�԰������o3���Ȫ���~�N�n�R����~�åB�ؤ@��s�����O�ѰO�h�N���[�J����~�åB�i�D��~���O�������ͥX�Ӫ�~�]�n��J����script
			for i = 1 , table.getn(mon), 1 do
				if mon[i] ~= nil then
					DelObj ( mon[i] )
				end
			end
			delobj (boss)  ----�R��BOSS
			delobj ( cck )
			mobtime1 = 0
			mobtime2 = 0
			sleep (50) ----��2���A�ͥX��
			boss = CreateObjByFlag( 104786 , 780767 , 1 , 1 )   -------�α���N���ͦb�o�ӺX�Ъ���m
			AddToPartition ( boss,RoomID )  ---------�⪫��[�J������----�n�b�o�Ӧa�貣�ͤ@�ӷs���F�賣�����n���o�Ӱʧ@��
			WriteRoleValue ( boss , EM_RoleValue_PID, AI )  -----�b����PID���W�g�J�o�ӭ�,�i�D���֬O���
			BeginPlot( boss,"cl_762_190001B", 10 )  -----------�N����scpipt��i�h�����W,��������
			WriteRoleValue ( AI , EM_RoleValue_Register2 ,0 )
			WriteRoleValue ( AI , EM_RoleValue_Register3 ,boss )
			cck = CreateObjByFlag( 105036 , 780767 , 2 , 1 )  ------------
			SetModeEx( cck , EM_SetModeType_Show, false) ----�q�X
			SetModeEx( cck , EM_SetModeType_Strikback, false) ---����(�_)
			SetModeEx( cck , EM_SetModeType_Move, false) ---����	(�_)
			SetModeEx( cck , EM_SetModeType_Searchenemy, false)--����(�_)
			SetModeEx( cck , EM_SetModeType_Mark, false)			---�i�I��(�O)
			SetModeEx( cck , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
			SetModeEx( cck , EM_SetModeType_Fight, false) ---�i���(�O)
			SetModeEx( cck , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
			AddToPartition(cck,RoomID)
			WriteRoleValue ( cck , EM_RoleValue_PID, AI )
			WriteRoleValue ( cck , EM_RoleValue_Register1, boss )
			BeginPlot( cck , "cl_762_chack" , 0 )
			WriteRoleValue ( AI , EM_RoleValue_Register1 ,0 )  ---->�NRegister1�g�^�h0
			WriteRoleValue ( AI , EM_RoleValue_Register4 ,0 )
			open = 0 ----->�n�N�}�ԺX�мg�^�h0
		end
		local black = ReadRoleValue( AI , EM_RoleValue_Register2)  ------>P�̭����ȥN��̭��n���ƻ�Ʊ�~~����hŪ��Register1����
		if black == 1 then
		elseif black == 2 then
			delobj ( boss )
			sleep ( 20 )
			delobj ( AI )
		end
	end
end
function cl_762_190001B()
    local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID)  ------>�ڥhŪ������̭���PID�ȧi�DBOSS���O����ͥX�Ӫ�
	local skill = 0 ----->�����CD�ɶ�
	local skill2 = 0 ---->����AE CD�ɶ�
	local skill3 = 0 ----->���ۧ���
	local mots  -------->�ŧi�֬O�z���S�Ĳy
	local CombatBegin = 0  ------>�ŧi�����}�ԺX��
	local X1 = 0
	local Y1 = 0
	local Z1 = 0
	local PlayerInHate2 = {}
	SetPlot( OwnerID(),"dead","cl_762_190001B_dead",10 )  ------>������`�����o�q�����@��
	while 1 do   ------�����԰��j��,�o�̭n�i�D���C�j�h�[�N�ˬd�@��
		sleep (10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )-----�C�@���M����������ؼ�
		if HateListCount( OwnerID() ) ~= 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 0 then   -----�p�G������������H~�N�N�o�ӭȧ���
				CombatBegin = 1       ------�N�����԰��}�l���A�ȧ令1~�N��N�O���i�J�԰��F
				WriteRoleValue ( AI , EM_RoleValue_Register1 ,1 ) ------����i�J�԰��F~�ҥH�ڭn���A�Ĥ@�Ӥf�U���g�i�h1�N��L�i�J�԰�~�o�ɭԫe���n�ͥX��
				ScriptMessage( OwnerID(), -1 , 2 ,"[SC_19001_02]" , 2 )
			end
			   if CombatBegin == 1 then  ----->��}�ԺX�Ф������ܦ�1���ɭ԰���H�U�R�O
				   skill = skill + 1   ----->skill�C��N+1�W�h 
				   if skill >= 3 then ----->��Skill���Ȥj�󵥩�5���ɭ�
						ScriptMessage( OwnerID(), -1 , 2 ,"[SC_19001_05]" , 2 )
						Luck = DW_Rand(100)  ----->��100�Ӷüƥh�H���@�ӭȥX��
						if ( Luck >= 1 and Luck <= 10) or( Luck >=21 and Luck <= 30 ) or
						   ( Luck >= 41 and Luck <= 50 ) or ( Luck >= 61 and Luck <= 70 ) or
						   ( Luck >= 81 and Luck <= 90 ) then      ------------>���H���X�Ӫ��ȵ���H�W���üƴN�I��Ĥ@��
						   CastSpell ( OwnerID() , AttackTarget , 496412  )----���e�ؼ�����@�ӥ��j�ˮ`
						   sleep ( 20 )   --------->�񪱪k�N���Ӱj�鰱���
						elseif ( Luck >= 11 and Luck <= 20 ) or( Luck >= 31 and Luck <= 40 ) or
						   ( Luck >= 51 and Luck <= 60 ) or( Luck >= 70 and Luck <= 80 ) or
						   ( Luck >= 91 and Luck <= 100 ) then   ------------>���H���X�Ӫ��ȵ���H�W���üƴN�I��ĤG��
						   CastSpelllv ( OwnerID() , OwnerID() , 496411 , 10 )----�e�记��
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
						local PlayerName=GetName(Attackplayer)
						local MsgStr="[SC_19001_01][$SETVAR1="..PlayerName.."]"
						ScriptMessage( Attackplayer, -1 , 2 ,MsgStr , 2 )
						X1 = ReadRoleValue ( Attackplayer, EM_RoleValue_X)
						Y1 = ReadRoleValue ( Attackplayer, EM_RoleValue_Y)
						Z1 = ReadRoleValue ( Attackplayer, EM_RoleValue_Z)   ---------�o�̬O���XAttackplayer�̭������ӤH���y�� cl_bon
						mots = CreateObj( 104820 , X1, Y1 , Z1 , 0 , 1 )  -----------
						SetModeEx( mots , EM_SetModeType_Strikback, false) ---����(�_)
						SetModeEx( mots , EM_SetModeType_Move, false) ---����	(�_)
						SetModeEx( mots , EM_SetModeType_Searchenemy, false)--����(�_)
						SetModeEx( mots , EM_SetModeType_Mark, false)			---�i�I��(�O)
						SetModeEx( mots , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
						SetModeEx( mots , EM_SetModeType_Fight, false) ---�i���(�O)
						SetModeEx( mots , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
						AddToPartition(mots,RoomID)
						CastSpell ( OwnerID() , mots , 496413 )
						BeginPlot( mots , "cl_762_190000most" , 0 )
						sleep ( 30 )
						skill2 = 0
					end
					skill3 = skill3 + 1
					if skill3 >= 11 then
						ScriptMessage( OwnerID(), -1 , 2 ,"[SC_19001_06]" , 2 )
						CastSpelllv ( OwnerID() , AttackTarget , 496410 , 0 )
						sleep ( 30 )
						skill3 = 0
					end
				end
		elseif HateListCount ( OwnerID() ) == 0 then ---�p�G����������S���H�N�n�Ǧ^��������
			if CombatBegin == 1 then  ----�p�G��������S���H�F~�N�N�o�ӭȧ���
				CombatBegin = 0 ------�ҥH�]������������S���H�N�����}�԰��F~�o�ɭԴN�����N�o�ӭȼg�^�h��Ӫ�0~���M���|�@���O���԰����A
				WriteRoleValue ( AI , EM_RoleValue_Register1 ,3)  ----���a���}�԰���~���n���m~�ҥH�^��3���ȵ��Ĥ@�Ӥf�U
				ScriptMessage( OwnerID(), -1 , 2 ,"[SC_19001_03]" , 2 )
				--delobj ( mots )
				skill = 0 ----->�����CD�ɶ�
				skill2 = 0 ---->����AE CD�ɶ�
				skill3 = 0 ----->���ۧ���
			end
		end
	end
end
function cl_762_190001B_dead() ----Boss �������@��
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	ScriptMessage( OwnerID(), -1 , 2 ,"[SC_19001_04]" , 2 )
	WriteRoleValue ( AI , EM_RoleValue_Register1, 2 )
end
function cl_762_190000most()  -----�S�ĨD�I��k�N
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	sleep ( 30 )
	CastSpelllv ( OwnerID() , OwnerID() , 496414 , 0 )
	sleep ( 20 )
	delobj ( OwnerID() )
end

function cl_762_1901mob1()  ---����
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register3 )
	local skill = 0
	local Attackplayer = Lua_AP_HateTargetID( boss )  -----���������H���@�ӤH,�o�̬O�]�n��function ,Attackplayer=�O�ڧ�X�Ӫ����ӤH
	SetAttack( ownerid() , Attackplayer)
	Addbuff (  ownerid() , 508131 , 0 , -1 )
	sysCastSpelllv (  Attackplayer , ownerid() , 496575 , 0 )
	Addbuff (   Attackplayer , 508179 , 0 , 5 )
	while 1 do   ------�����԰��j��,�o�̭n�i�D���C�j�h�[�N�ˬd�@��
		sleep (10)
		skill = skill + 1
		if skill >= 5 then
			Attackplayer = Lua_AP_HateTargetID( boss )
			SetAttack( ownerid() , Attackplayer)
			SysCastSpelllv (  Attackplayer , ownerid() , 496575 , 0 )
			Addbuff (   Attackplayer , 508179 , 0 , 5 )
			CastSpelllv ( OwnerID() , Attackplayer , 496542 , 0 )
			sleep ( 10 )
			skill = 0
		end
	end
end
function cl_762_1901mob2() ----�C�L
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register3 )
	local skill = 0
    local Attackplayer = Lua_AP_HateTargetID( boss )  -----���������H���@�ӤH,�o�̬O�]�n��function ,Attackplayer=�O�ڧ�X�Ӫ����ӤH
	SetAttack( ownerid() ,Attackplayer)
	Addbuff (  ownerid() , 508131 , 0 , 5 )
	SysCastSpelllv (  Attackplayer , ownerid() , 496575 , 0 )
	Addbuff (   Attackplayer , 508180 , 0 , 5 )
	while 1 do   ------�����԰��j��,�o�̭n�i�D���C�j�h�[�N�ˬd�@��
		sleep (10)
		skill = skill + 1
		if skill >= 5 then
			Attackplayer = Lua_AP_HateTargetID( boss )
			SetAttack( ownerid() , Attackplayer)
			SysCastSpelllv (  Attackplayer , ownerid() , 496575 , 0 )
			Addbuff (   Attackplayer , 508180 , 0 , 5 )
			CastSpelllv ( OwnerID() , Attackplayer , 496543 , 0 )
			sleep ( 10 )
			skill = 0
		end
	end
end
function cl_762_1901mob3()  ---�äh
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register3 )
	local skill = 0
	local Attackplayer = Lua_AP_HateTargetID( boss )  -----���������H���@�ӤH,�o�̬O�]�n��function ,Attackplayer=�O�ڧ�X�Ӫ����ӤH
	SetAttack( ownerid() , Attackplayer)
	Addbuff (  ownerid() , 508131 , 0 , -1 )
	while 1 do   ------�����԰��j��,�o�̭n�i�D���C�j�h�[�N�ˬd�@��
		sleep (10)
		skill = skill + 1
		if skill >= 10 then
			Attackplayer = Lua_AP_HateTargetID( boss )
			SetAttack( ownerid() , Attackplayer)
			CastSpelllv ( OwnerID() , OwnerID() , 496544 , 0 )
			sleep ( 40 )
			skill = 0
		end	
	end
end

function cl_762_chack()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID)  ------>�ڥhŪ������̭���PID�ȧi�DBOSS���O����ͥX�Ӫ�
	local boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
	while 1 do
		sleep (50)
		if ReadRoleValue( boss , EM_RoleValue_IsDead ) ==  0 then
			local oo = GetDistance( OwnerID(), boss );
			if oo >= 1000 then
				WriteRoleValue ( AI , EM_RoleValue_Register1 ,3 )
			end
		elseif ReadRoleValue( boss , EM_RoleValue_IsDead ) ~=  0 then
			delobj ( OwnerID() )
		end
	end
end
function cl762random()  --��Beginplot(OwnerID(),"",0)����N�n
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local boss = ReadRoleValue( OwnerID() ,EM_RoleValue_Register3 )
local fun = {"cl_762_1901mob1","cl_762_1901mob2","cl_762_1901mob3"}
local rand={}
local mon = {}
local monster = {105000,105001,105002}--��ǰ}�C
local monster1
	for i=1,table.getn(monster) do
		local x = ReadRoleValue (boss, EM_RoleValue_X)
		local y = ReadRoleValue (boss, EM_RoleValue_Y)
		local z = ReadRoleValue (boss, EM_RoleValue_Z)
		rand = Az_RND_Ary(-150,150,2)
		monster1 = CreateObj ( monster[i] , x+rand[1] , y , z+rand[2] , 0 , 1) --�H���r���P��ͩ�
		AddToPartition(monster1,roomID )
		WriteRoleValue(monster1,EM_RoleValue_Livetime,20)  --�s���ɶ�
		WriteRoleValue ( monster1 , EM_RoleValue_PID, OwnerID())----
		WriteRoleValue ( monster1 , EM_RoleValue_Register3, boss )
		BeginPlot( monster1,fun[i], 10 )
		sleep ( 2 )
	end
end
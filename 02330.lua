function cl_136_105205_N() ---���AI
	local AI = OwnerID() ----�ڥs��AI
	local RoomID = ReadRoleValue( AI , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	local boss = 0
	local attackflag = 0 ---�԰��}�l 
	local door_1 = 0 ---���ת�
	local cck = 0 ----���q�Z����,�קKBOSS�]�h�l�Q��i�U�l���H
	local AI2 = 0 -----�U�l�̪�������m��I��ޯೣ�a�L
	local Rand_Num = 0
	local wark_rand = 0
	local cazry = 0
	local kill_Table = {}
	local kill_rabbit = 0
	local ThesePlayer = {} -----��԰������ɩҦ����a��table,�n�ˬd���a���W��BUFF
	WriteRoleValue ( AI , EM_RoleValue_Register7, 0 )
	local door = CreateObjByFlag( 105207 , 780844 , 1 , 1 ) ------------�֬Oboss�n�b���̲���
	WriteRoleValue ( AI , EM_RoleValue_Register8, 0 ) --------��BOSS���O������AI���ͪ�
	SetModeEx ( door , EM_SetModeType_Obstruct, true) 		---����(�O)
	SetModeEx( door , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( door , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( door , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( door , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( door , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( door , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( door , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
	AddToPartition ( door,RoomID ) ----����[�J����,�Ҧ椽��
	for i = 1 , 6 do
		wark_rand = DW_Rand(30)
		local rabbit = CreateObjByFlag( 117377 , 780767 , wark_rand , 1 ) ------------�֬Oboss�n�b���̲���
		SetModeEx( rabbit , EM_SetModeType_Strikback, false) ---����(�_)
		SetModeEx( rabbit , EM_SetModeType_Searchenemy, false)--����(�_)
		SetModeEx( rabbit , EM_SetModeType_Mark, true)			---�i�I��(�O)
		SetModeEx( rabbit , EM_SetModeType_ShowRoleHead, true) 		---�Y����(�O)
		SetModeEx( rabbit , EM_SetModeType_Fight, false) ---�i���(�O)
		SetModeEx( rabbit , EM_SetModeType_NotShowHPMP , true) ----����ܼg��
		AddToPartition ( rabbit , RoomID ) ----����[�J����,�Ҧ椽��
		WriteRoleValue ( rabbit , EM_RoleValue_PID, AI )
		table.insert( kill_Table , rabbit )
		BeginPlot( rabbit,"cl_136_rabbit_N", 0 )
		SetPlot( rabbit, "dead","cl_136_opendoor_dead_N", 0 ) --boss���榺�`�@��,�N���Ǧ^���������P�_���q
		sleep ( 1 )
	end
	while ReadRoleValue ( AI , EM_RoleValue_Register1 ) ~= 4 do
		sleep ( 5 )
		local showAI = ReadRoleValue ( AI , EM_RoleValue_Register5 )
		local player = ReadRoleValue ( AI , EM_RoleValue_Register6 )
		local kill_rabbit_GM = ReadRoleValue ( AI , EM_RoleValue_Register7 )
		if kill_rabbit_GM == 1 then
			kill_rabbit = table.getn(kill_Table) ----����o��Table
			for i = 1 , kill_rabbit , 1 do
				if CheckID(kill_Table[i]) == true then
					delobj ( kill_Table[i] )
				end
			end
			WriteRoleValue ( AI , EM_RoleValue_Register5, 6 )
			WriteRoleValue ( AI , EM_RoleValue_Register7, 0 )
		end
		if showAI >= 6 then
			wark_rand = DW_Rand(30)
			boss = CreateObjByFlag( 105560 , 780767 , wark_rand , 1 )  ------------�ͥX�]�N�U
			AddToPartition ( boss,RoomID ) ----����[�J����,�Ҧ椽��
			WriteRoleValue ( boss , EM_RoleValue_PID, AI ) --------��BOSS���O������AI���ͪ�
			BeginPlot( boss,"cl_136_105204_N", 0 )  -----------�N����scpipt��i�h�����W,��������
			SetPlot( boss, "dead","cl_136_105204_dead_N", 0 ) --boss���榺�`�@��,�N���Ǧ^���������P�_���q
			SetAttack( boss , player)
			WriteRoleValue ( AI , EM_RoleValue_Register5, 0 ) --------��BOSS���O������AI���ͪ�
		end
		local stage = ReadRoleValue ( AI , EM_RoleValue_Register1 )  ----stage=1 �԰��}�l stage=2 BOSS���` stage=3 BOSS���}�԰����m
		if stage == 1 then --�p�Gstage����1����H�U
			cazry = cazry + 1
			if cazry >= 760 then
				WriteRoleValue ( AI , EM_RoleValue_Register9, 9 ) --------�n�NR5�����ȧ��ܧ_�hBOSS�|���_����
				Addbuff (  boss , 507744 , 0 ,-1 ) ---
				cazry = 0
			end
			if attackflag == 0 then --�p�G�԰��}�l����0����H�U
				door_1 = CreateObjByFlag( 105207 , 780844 , 2 , 1 ) ------------�֬Oboss�n�b���̲���
				SetModeEx ( door_1 , EM_SetModeType_Obstruct, true) 		---����(�O)
				SetModeEx( door_1 , EM_SetModeType_Strikback, false) ---����(�_)
				SetModeEx( door_1 , EM_SetModeType_Move, false) ---����	(�_)
				SetModeEx( door_1 , EM_SetModeType_Searchenemy, false)--����(�_)
				SetModeEx( door_1 , EM_SetModeType_Mark, false)			---�i�I��(�O)
				SetModeEx( door_1 , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
				SetModeEx( door_1 , EM_SetModeType_Fight, false) ---�i���(�O)
				SetModeEx( door_1 , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
				AddToPartition ( door_1,RoomID ) ----����[�J����,�Ҧ椽��
				cck = CreateObjByFlag( 105209 , 780844 , 11 , 1 )  ------------�ͥX���Z�����z���y
				SetModeEx( cck , EM_SetModeType_Show, false ) ----�q�X
				SetModeEx( cck , EM_SetModeType_Strikback, false) ---����(�_)
				SetModeEx( cck , EM_SetModeType_Move, false) ---����	(�_)
				SetModeEx( cck , EM_SetModeType_Searchenemy, false)--����(�_)
				SetModeEx( cck , EM_SetModeType_Mark, false) ---�i�I��(�O)
				SetModeEx( cck , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
				SetModeEx( cck , EM_SetModeType_Fight, false) ---�i���(�O)
				SetModeEx( cck , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
				AddToPartition(cck,RoomID) --������X�{�b�����W
				WriteRoleValue ( cck , EM_RoleValue_PID, AI ) ---�b�z���y��PID���g�JAI��GID
				WriteRoleValue ( cck , EM_RoleValue_Register1, boss ) ---�b�z���N��Register1�g�JBOSS��GID
				BeginPlot( cck , "cl_105209_chack_N" , 0 ) ----�����ˬdBOSS�Z���O�_�W�X�ж�
				sleep ( 1 ) --Sleep 0.1���קK�P�ɶ�����ӦhBeginPlot�y��LAG
				AI2 = CreateObjByFlag( 105209 , 780844 , 9 , 1 ) ------------���ʹU�l�������
				SetModeEx ( AI2 , EM_SetModeType_Obstruct, false) 		---����(�O)
				SetModeEx( AI2 , EM_SetModeType_Strikback, false) ---����(�_)
				SetModeEx( AI2 , EM_SetModeType_Move, false) ---����	(�_)
				SetModeEx( AI2 , EM_SetModeType_Searchenemy, false)--����(�_)
				SetModeEx( AI2 , EM_SetModeType_Mark, false)			---�i�I��(�O)
				SetModeEx( AI2 , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
				SetModeEx( AI2 , EM_SetModeType_Fight, false) ---�i���(�O)
				SetModeEx( AI2 , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
				AddToPartition ( AI2,RoomID ) ----����[�J����,�Ҧ椽��
				WriteRoleValue ( AI2 , EM_RoleValue_PID, AI ) ---�bAI2��PID�g�J�֬OAI
				WriteRoleValue ( AI2 , EM_RoleValue_Register1, boss ) ---�bAI2��Register1���g�J�֬OBOSS
				WriteRoleValue ( boss , EM_RoleValue_Register2, AI2 ) ---����AI2�ԦbBOSS��GID�g�JAI2��GID
				BeginPlot( AI2 , "cl_105209_P_N" , 0 ) --------����C���ˬdAI��stage�����O�h��
				attackflag = 1 ---�N�԰��}�l�g��1�קK���ư�
			end
			local del_boss = ReadRoleValue ( AI , EM_RoleValue_Register8 )
			if del_boss == 1 then
				local xx1 = ReadRoleValue ( boss, EM_RoleValue_X)
				local yy2 = ReadRoleValue ( boss, EM_RoleValue_Y)
				local zz3 = ReadRoleValue ( boss, EM_RoleValue_Z)   ---------�o�̬O���XAttackplayer�̭������ӤH���y��
				local MaxHP = ReadRoleValue( boss , EM_RoleValue_MaxHP )
				local bosshp = ReadRoleValue( boss , EM_RoleValue_HP )						--��e��q
				local AttackTarget = ReadRoleValue( boss , EM_RoleValue_AttackTargetID )-----AttackTarget=��e�����ؼ�
				local HPPercent = ( bosshp / MaxHP )*100
				if HPPercent >= 1 then
					sleep ( 30 )
					delobj ( boss )
					boss = CreateObj( 105560 , xx1, yy2 , zz3 , 0 , 1 )
					AddToPartition ( boss,RoomID ) ----����[�J����,�Ҧ椽��
					WriteRoleValue ( boss , EM_RoleValue_HP , bosshp )
					addbuff ( boss , 508517 , 0 , -1 )
					WriteRoleValue ( boss , EM_RoleValue_PID, AI ) --------��BOSS���O������AI���ͪ�
					WriteRoleValue ( cck , EM_RoleValue_Register1, boss ) --------��BOSS���O������AI���ͪ�
					if ReadRoleValue ( AI , EM_RoleValue_Register9 ) == 9 then
						Addbuff (  boss , 507744 , 0 ,-1 ) ---�KADD�g��BUFF��BOSS
					end
					BeginPlot( boss,"cl_136_105204_N", 0 )  -----------�N����scpipt��i�h�����W,��������
					SetAttack( boss , AttackTarget)
					sleep ( 10 )
				elseif HPPercent < 1 then
					SetModeEx( boss , EM_SetModeType_Fight, true) ---�i���(�O)
				end	
				WriteRoleValue ( AI , EM_RoleValue_Register8 , 0 )
			end
		elseif stage == 2 then ----�p�Gstage�ȵ���2����H�U--BOSS���`�@�����ɭԷ|�^�ǳo�ӭ��ܦ�2
			if ReadRoleValue ( AI , EM_RoleValue_Register8 ) ~= 1 then
				ScriptMessage( boss , -1 , 2 ,"[SC_13604_07]" , 2 )----�ڡD�D�b�������t�A�׷|�����D�D�D
				sleep ( 20 )
				local TempPlayer = SetSearchAllPlayer(RoomID)----��ϰ�Ҧ����a
				for i=1,TempPlayer do ---TempPlayer����ƶq�N��for�j��n���X��
					ThesePlayer[i] = GetSearchResult() --�N��쪺���aGID�Ȯɦs��o�ӭȤ�
					if CheckID( ThesePlayer[i] )  == true and  ---�ˬdGID
						ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) ==  0 and 
						ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) ==  1 then--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
						if CheckBuff( ThesePlayer[i] , 508522 ) or 
							CheckBuff( ThesePlayer[i] , 509438 ) or 
							CheckBuff( ThesePlayer[i] , 508523 ) or 
							CheckBuff( ThesePlayer[i] , 508603 ) or
							CheckBuff( ThesePlayer[i] , 509437 ) or
							CheckBuff( ThesePlayer[i] , 508520 ) ==  true then ---�ˬd�����a���W�O�_���H�W��BUFF�p�G�����ܰ���H�U
							CancelBuff(ThesePlayer[i], 508520)
							CancelBuff(ThesePlayer[i], 509438)
							CancelBuff(ThesePlayer[i], 508522)
							CancelBuff(ThesePlayer[i], 508523)  ---�M�������a���W��BUFF
							CancelBuff(ThesePlayer[i], 508603)
							CancelBuff(ThesePlayer[i], 509437)
						end
					end					
				end
				delobj ( door ) --�R�������
				delobj ( door_1 ) --�R�����e��
				cazry = 0
				WriteRoleValue ( AI , EM_RoleValue_Register1 , 4 ) ---�NRegister1���W�����g�^�h0���M�|�@�Ȧb�o�Ӷ��q
				attackflag = 0 ---�N�԰��}�l�g��0
			elseif ReadRoleValue ( AI , EM_RoleValue_Register8 ) == 1 then
				WriteRoleValue ( AI , EM_RoleValue_Register1 , 1 ) ---�NRegister1���W�����g�^�h0���M�|�@�Ȧb�o�Ӷ��q
			end
		elseif stage == 3 then ---�p�Gstage����3�N��i�J���m���q---BOSS���}�԰���|�^��3
			ScriptMessage( boss , -1 , 2 ,"[SC_13604_08]" , 2 )----�A�̪��s�z�n�A��x�n�٥O�H���K�ڡI
			delobj ( boss ) --�R��BOSS
			local TempPlayer = SetSearchAllPlayer(RoomID)----��ϰ�Ҧ����a
			for i=1,TempPlayer do ---TempPlayer����ƶq�N��for�j��n���X��
				ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
				if CheckID( ThesePlayer[i] )  == true and 
					ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) ==  0 and 
					ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) ==  1 then--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
					if CheckBuff( ThesePlayer[i] , 508522 ) or 
						CheckBuff( ThesePlayer[i] , 509438 ) or 
						CheckBuff( ThesePlayer[i] , 508523 ) or 
						CheckBuff( ThesePlayer[i] , 508603 ) or
						CheckBuff( ThesePlayer[i] , 509437 ) or
						CheckBuff( ThesePlayer[i] , 508520 ) ==  true then
						CancelBuff(ThesePlayer[i], 508520)
						CancelBuff(ThesePlayer[i], 509438)
						CancelBuff(ThesePlayer[i], 508522)
						CancelBuff(ThesePlayer[i], 508523)
						CancelBuff(ThesePlayer[i], 508603)
						CancelBuff(ThesePlayer[i], 509437)
					else
					end
				end					
			end
			delobj ( door_1 ) --�R���e��
			sleep ( 30 ) ---���d3��
			WriteRoleValue ( AI , EM_RoleValue_Register9, 0 ) --------�n�NR5�����ȧ��ܧ_�hBOSS�|���_����
			cazry = 0
			boss = CreateObjByFlag( 105560 , 780844 , 0 , 1 ) ------------���s����BOSS
			AddToPartition ( boss,RoomID ) ----����[�J����,�Ҧ椽��
			WriteRoleValue ( boss , EM_RoleValue_PID, AI ) --------��BOSS���O������AI���ͪ�
			WriteRoleValue ( cck , EM_RoleValue_Register1, boss ) --------��BOSS���O������AI���ͪ�
			BeginPlot( boss,"cl_136_105204_N", 0 )  -----------�N����scpipt��i�h�����W,��������
			WriteRoleValue ( AI , EM_RoleValue_Register1 , 0 ) ---�NAI��Register1�g�^�h0
			attackflag = 0
		end
	end
end
function cl_136_105204_N() ---bossAI
	local boss = OwnerID() ----�ڥs��boss
	local RoomID = ReadRoleValue( boss , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	local AI = ReadRoleValue ( boss , EM_RoleValue_PID ) --PID���ȥN������
	local AI2 = ReadRoleValue ( boss , EM_RoleValue_Register2 ) ---Ū���ڪ�Register2�̭���GID�N��AI2
	local skill = 28 ---�ߴU
	local skill2 = 0 ---�I��M����ޯ�~����AE
	local skill3 = 0 ---�d��150AE����U�l�n��HP
	local skill7 = 0 ---����ޯ�
	local skill22 = 0 ---�᤻�H�ȵP
	local skill99 = 0
	local skill99_9 = 0
	local opentime = 0 --�}�Үɶ�
	local CombatBegin = 0 ----�԰��ǳ�
	local bosstime = 0
	local luck = 0
	local skill9 = 0
	local Flag_OP = 780839
	SetPlot( boss, "dead","cl_136_105204_dead_N", 0 ) ------PlotType Ĳ�o���� (����"touch"Ĳ�I�B"range"�d��B"dead"���`�B"collision"�I���|��)
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( boss , EM_RoleValue_AttackTargetID )-----AttackTarget=��e�����ؼ�
		--local openskill2 = ReadRoleValue( boss , EM_RoleValue_Register3 )-----�I��M���몺�ɾ�
		if HateListCount( boss ) ~= 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 0 then   -----�p�G������������H~�N�N�o�ӭȧ���
				CombatBegin = 1       ------�N�����԰��}�l���A�ȧ令1~�N��N�O���i�J�԰��F
				local stage = ReadRoleValue ( AI , EM_RoleValue_Register1 )  ----stage=1 �԰��}�l stage=2 BOSS���` stage=3 BOSS���}�԰����m
				if stage == 0 then
					WriteRoleValue ( AI , EM_RoleValue_Register1 , 1 ) ----�b��������Register1�̼g�J1��AI�i�J�԰����q
					local PPL = SetSearchAllPlayer(RoomID ) -----Ū�����ZONE���Ҧ����a�o��Ū���쪺�O�ƶq
					local Flag = 1  ------�ŧi�X�Ъ��s��
					for i = 1 , PPL , 1 do ---�⪱�a��J�ж��� Ū���쪺���a�ƶq�U�h�M�wfor�j��]�X��
						local ID = GetSearchResult()  ---�N����ZONE�̪��Ҧ����a�̧Ǧs�J�o�ӼȦs��
						if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1 and ---Ū���ӦW���a�O�_���`
							ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0  and  ---�O�_��GM
							ReadRoleValue( ID , EM_RoleValue_RoomID  ) == RoomID then  ---RoomID�O�_�PBOSS��eRoomID�ۦP
							SetPosByFlag( ID , Flag_OP , Flag ) ----�N���a�Ǩ�o�Ӧ�m
							Flag = Flag + 1  ----Fiag�N��X�и��X����,������@���N+1
							if Flag > GetMoveFlagCount(Flag_OP) -1 then  --- Ū��780839���X���`��...�p�Gflag�w�g�j��o�ӭȪ���
								Flag = 1  ----�N�NFlag��g�^1-----�ηN�O�קK���a�H�ƶW�L�X���`�ƾɭP�o�ͩ��
							end
							sysCastSpelllv ( ID , boss , 496773 , 0 )  ---�Ѩt�������a��BOSS�I��@�Ӽv�ê��k�N~�Ψ���BOSS�}���԰���T�O�Ҧ����a���i�J�����
						end
					end
					ScriptMessage( boss , -1 , 2 ,"[SC_13604_02]" , 2 )----SHOW TIME �I��t�}�l�I
					CastSpelllv ( boss , boss , 496920 , 40 ) ---�ޯ�-�}���q
					sleep ( 30 )
				end
			end
			if CombatBegin == 1 then 
				skill = skill + 1
				skill3 = skill3 + 1
				skill22 = skill22 + 1
				skill7 = skill7 + 1
				skill9 = skill9 + 1
				if skill7 >= 7 then ---����޻P�����������H���@��
					CastSpelllv ( boss , AttackTarget , 496927 , 30  )----���e�ؼ�����@�ӥ��j�ˮ`
					sleep ( 10 )
					skill7 = 0
				end
				if skill9 >= 9 then
					CastSpelllv ( boss , boss , 497011 , 40  )----�e�记��
					sleep ( 20 )
					skill9 = 0
				end
				if skill3 >= 13 then --�C13�����H�U
					ScriptMessage( boss , -1 , 2 ,"[SC_13604_03]" , 2 )----�C�j�A�̪������I�ݥJ�ӳo�����R���q�a�I
					CastSpelllv ( boss , boss , 496924 , 40 ) ---�I��d��50�X��AE
					sleep ( 20 ) --slee0.8��
					cl_496924_N() ---�ˬd�d�򤺬O�_���U�l
					sleep ( 10 )
					skill3 = 0
				end
				if skill22 >= 17 then 
					ScriptMessage( boss , -1 , 2 ,"[SC_13604_04]" , 2 )----���R�������q�I���I�x�n���y�a�I
					cl_136_496926_N() ---�H���줻�ӤH�I��ȵP
					sleep ( 30 )
					skill22 = 0
				end
				if skill >= 33 then --�C33��@��N�N���a�δU�l�\�_
					while 	ReadRoleValue( boss , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(10)
					end
					CastSpelllv ( boss , boss , 496923 , 0 ) --BOSS��ۤv�I��@�Ӫ�t�ߴU���ʧ@
					cl_magicInHand_BIG_NOL() ----Ū��������֭n�\�U�֭n�ܤj
					skill99_9 = 2
					sleep ( 30 ) --
					skill = 0
					skill2 = 0
				end
				if skill99_9 == 2 then ---�ˬd�ۨ���Register3�p�G���ӭȵ���2�N���M���몺�Ʊ�ps�b����cl_105204_105206���ɭԷ|�^�ǭȦ^��
					skill99 = skill99 + 1
					if skill99 >= 22 then
						while 	ReadRoleValue( boss , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
							sleep(10)
						end
						ScriptMessage( boss , -1 , 2 ,"[SC_13604_06]" , 2 )----�ǹǡI���s�~�P�I�o�P�I�ǹ�
						sleep ( 10 )
						CastSpelllv ( boss , boss , 496921 , 0 ) ---BOSS ����W�Ҧ����a�I��N����M��1
						SetModeEx( boss , EM_SetModeType_Fight, false) ---�i���(�O)
						WriteRoleValue ( AI , EM_RoleValue_Register8 , 1 )
						sleep ( 10 ) --�I�k���n�����
						--WriteRoleValue ( boss , EM_RoleValue_Register3 , 0 )  ----�bRegister3���g�^0
						--delobj ( boss )
						skill99_9 = 0
						skill99 = 0
					end
				end
			end
		elseif HateListCount ( boss ) == 0 then ---�p�G����������S���H�N�n�Ǧ^��������
			if CombatBegin == 1 then  ----�p�G��������S���H�F~�N�N�o�ӭȧ���
				CombatBegin = 0
				WriteRoleValue ( AI , EM_RoleValue_Register1 , 3 ) ----�b��������Register1�̼g�J1��AI�i�J���m���q
				skill = 0
				skill2 = 0
				skill9 = 0
				skill3 = 0
				skill7 = 0
				openskill2 = 0
				skill99_9 = 0
				skill99 = 0
			end
		end
	end
end
function cl_magicInHand_BIG_NOL()
	local boss = OwnerID()
	local RoomID = ReadRoleValue( boss , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	local AI = ReadRoleValue ( boss , EM_RoleValue_PID ) --PID���ȥN������
	local player_table = {}
	local Migic_table = {}
	local BigBuff_table = {}
	local Rand_big = 0
	local hate_table = DW_HateRemain(0)  ----�N����������a�̷Ӥ��밪�C�ƦC�åB�ư��D�Z
	local hate_number = table.getn(hate_table)  ---���X�ƶq
	for i = 1 , hate_number , 1 do
		if ReadRoleValue ( hate_table[i] ,  EM_RoleValue_IsPlayer ) == 1 then
			table.insert( player_table , hate_table[i] )  ----�p�G���a���W�S���H�WBUFF�åB�s��~�N�N�L���t�~�@��TABLE
		end
	end
	local player_number = table.getn(player_table)  ---���X�ƶq
	if player_number < 3 then
		ScriptMessage( boss , -1 , 2 ,"[SC_13604_01]" , 2 )----����h���[���A�ڤ~����t���ʤO�A�A�̦A�h�h���I�H�ӧa�I
		local kill_table = DW_HateRemain(0)  ----�N����������a�̷Ӥ��밪�C�ƦC�åB�ư��D�Z
		local kill_nob=table.getn(kill_table) ----����o��Table
		for i = 1 , kill_nob , 1 do ---���X�Ӧh�ּƶq�N���h�֦�
			Addbuff (  kill_table[i] , 508516 , 0 ,-1 ) ---���Ҧ����a�W�@�өw����BUFF�ηN�O���Ʊ檱�a����m�ݰ_�Ӹ��]�N�U����m���t��
			sleep ( 20 ) ---������---�ηN�O�T�O���a�w�g������󪺲���
			local xx = ReadRoleValue ( kill_table[i], EM_RoleValue_X)
			local yy = ReadRoleValue ( kill_table[i], EM_RoleValue_Y)
			local zz = ReadRoleValue ( kill_table[i], EM_RoleValue_Z)   ---------Ū���ؼЪ��y��
			local headgear = CreateObj( 117260 , xx, yy , zz , 0 , 1 )  ------------�̷�Ū���쪺�y�в��ͳz���y
			SetModeEx( headgear , EM_SetModeType_Strikback, false) ---����(�_)
			SetModeEx( headgear , EM_SetModeType_Move, false) ---����	(�_)
			SetModeEx( headgear , EM_SetModeType_Searchenemy, false)--����(�_)
			SetModeEx( headgear , EM_SetModeType_Mark, true)			---�i�I��(�O)
			SetModeEx( headgear , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
			SetModeEx( headgear , EM_SetModeType_Fight, false) ---�i���(�O)
			SetModeEx( headgear , EM_SetModeType_NotShowHPMP , true ) ----����ܼg��
			AddToPartition( headgear,RoomID )  ---�N���󲣥ͦb�P�@��RoomID
			WriteRoleValue ( headgear , EM_RoleValue_PID , boss )  ---�bPID������BOSS
			WriteRoleValue ( headgear , EM_RoleValue_Register1 , kill_table[i] ) ---�bR1�����ؼЪ��a
			WriteRoleValue ( headgear , EM_RoleValue_Register2 , AI )  ---�bR2��������������
			BeginPlot( headgear,"cl_105206_N", 0 )  ----����20���N���a�ǥX�Ӫ��ʧ@
			sleep ( 1 )
			if ReadRoleValue( kill_table[i] , EM_RoleValue_RoomID  ) == RoomID then ----Ū���ӥؼЪ��a�O�_��BOSS���P�@��RoonID
				SetPosByFlag( kill_table[i], 780844 , i+2 ) -----�p�G�P�@��RoomID���ܴN�ǰe��X�Ц�}~
			end
			local rabbit = CreateObjByFlag( 105208 , 780844 , i+5 , 1 )  ------------�����ǤJ�����a����ù���
			AddToPartition( rabbit,RoomID ) ----
			WriteRoleValue ( rabbit , EM_RoleValue_Register1 , kill_table[i] ) ------�b�ߤl��R1�����������ؼЪ��a
			WriteRoleValue( rabbit , EM_RoleValue_Livetime, 20 )  --�s���ɶ�20��~
			BeginPlot( rabbit , "cl_136_105208_N" , 0 )  ----����ߤl������SCRIPT
			sleep ( 1 )
		end
	elseif player_number > 3 then
		ScriptMessage( boss , -1 , 2 ,"[SC_13604_05]" , 2 )----�[���O�o���]�N�q�����n������I�n�n�ɨ��a�I�ǹǹǡI�I
		local player_IN_table = {}
		local TK_TANK_table = DW_HateRemain(1)  ----�N����������a�̷Ӥ��밪�C�ƦC�åB�ư��D�Z
		local TK_TANK=table.getn(TK_TANK_table) ----����o��Table
		for i = 1 , TK_TANK , 1 do
			if ReadRoleValue ( TK_TANK_table[i] ,  EM_RoleValue_IsPlayer ) == 1 then
				table.insert( player_IN_table , TK_TANK_table[i] )  ----�p�G���a���W�S���H�WBUFF�åB�s��~�N�N�L���t�~�@��TABLE
			end
		end
		local del_P_and_D = table.getn(player_IN_table) ----���X��������ƶq
		for i = 1 , del_P_and_D , 1 do ---���X�Ӧh�ּƶq�N���h�֦�
			if ReadRoleValue( player_IN_table[i] , EM_RoleValue_VOC ) ~= 0 then --�ˬd�p�G���OGM�~����H�U
				if ReadRoleValue( player_IN_table[i] , EM_RoleValue_VOC ) == 5 or
					ReadRoleValue( player_IN_table[i] , EM_RoleValue_VOC ) == 8 then --�ˬd¾�~�O�_�����q�Ϊ̯��x
					table.remove ( player_IN_table , i ) ---�p�G�ƪ��ܴN�N�L�qtable������
					break ---�M����Ĥ@�Ӹ�¾��N�������}�^��
				end
			end
		end
		local Nobuff_play = table.getn( player_IN_table ) ----�A���s���X�@���ƶq~�o�Ӽƶq�w�g�ư����䤤�@��
		local magic_hand_table = {}
		if Nobuff_play > 0 then
			for i = 1 , Nobuff_play , 1 do
				if	CheckBuff( player_IN_table[i] , 508520 ) ~=  true then
					if CheckBuff( player_IN_table[i] , 508522 ) ~=  true then
						if CheckBuff( player_IN_table[i] , 508603 ) ~=  true then
							if CheckBuff( player_IN_table[i] , 508646 ) ~=  true then  ---�n�ˬd�ؼЪ��a�O�_���W����&�Q��%�ߤl��BUFF
								if ReadRoleValue( player_IN_table[i] , EM_RoleValue_IsDead ) ~= 1 then  ---�ˬd�O�_�����`���A
									table.insert( magic_hand_table , player_IN_table[i] )  ----�p�G���a���W�S���H�WBUFF�åB�s��~�N�N�L���t�~�@��TABLE
								end
							end
						end
					end
				end
			end
			local magic_hand = table.getn( magic_hand_table ) ----�A���s���X�@���ƶq~�o�Ӽƶq�w�g�ư����䤤�@��
			if magic_hand > 0 then
				Rand_big = DW_Rand(magic_hand)  ---���H��TABLE����m
				if magic_hand > 0 then
					table.insert( BigBuff_table , magic_hand_table[Rand_big] )  ----�p�G���a���W�S���H�WBUFF�åB�s��~�N�N�L���t�~�@��TABLE
					table.remove ( magic_hand_table , Rand_big ) --�h������
					magic_hand = table.getn( magic_hand_table ) ----�A���s���X�@���ƶq~�o�Ӽƶq�w�g�ư����䤤�@��
					local Rand_magic = DW_Rand(magic_hand)  ---���H��TABLE����m
					if magic_hand > 0 then
						table.insert( Migic_table , magic_hand_table[Rand_magic] )  ----�p�G���a���W�S���H�WBUFF�åB�s��~�N�N�L���t�~�@��TABLE
						table.remove ( magic_hand_table , Rand_magic ) --�h������
						magic_hand = table.getn( magic_hand_table ) ----�A���s���X�@���ƶq~�o�Ӽƶq�w�g�ư����䤤�@��
					end
				end
			end
			local BUFF_BIG = table.getn(BigBuff_table) ----�N�n�\�_�Ӫ����aTABLE��Ū���@���ƶq
			if BUFF_BIG > 0 then
				for i = 1 , BUFF_BIG , 1 do ----�̷�TABLE�̭����ƶq�U�h��for�j��
					addbuff ( BigBuff_table[i] , 508520 , 0 , -1 )  ---��o�Ǫ��a�ܤj~
				end
			end
			local In_magic = table.getn(Migic_table) ----�N�n�\�_�Ӫ����aTABLE��Ū���@���ƶq
			if In_magic > 0 then ----Ū���쪺�ƶq�j��0���ܴN����
				for i = 1 , In_magic , 1 do ----������X�ƶq���j�馸��
					Addbuff (  Migic_table[i] , 508516 , 0 ,-1 ) ---���W�@�өw��BUFF
				end
				sleep ( 20 )  ---
				for i = 1 , In_magic , 1 do
					local xx = ReadRoleValue ( Migic_table[i], EM_RoleValue_X)
					local yy = ReadRoleValue ( Migic_table[i], EM_RoleValue_Y)
					local zz = ReadRoleValue ( Migic_table[i], EM_RoleValue_Z)   ---------Ū���ؼЪ��a���y��
					local headgear = CreateObj( 117260 , xx, yy , zz , 0 , 1 )  ------------���ͳz���y
					SetModeEx( headgear , EM_SetModeType_Strikback, false) ---����(�_)
					SetModeEx( headgear , EM_SetModeType_Move, false) ---����	(�_)
					SetModeEx( headgear , EM_SetModeType_Searchenemy, false)--����(�_)
					SetModeEx( headgear , EM_SetModeType_Mark, true)			---�i�I��(�O)
					SetModeEx( headgear , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
					SetModeEx( headgear , EM_SetModeType_Fight, false) ---�i���(�O)
					SetModeEx( headgear , EM_SetModeType_NotShowHPMP , true ) ----����ܼg��
					AddToPartition( headgear,RoomID ) ----�Ϫ���X�{�b�����W
					WriteRoleValue ( headgear , EM_RoleValue_PID , boss ) ----�bPID������BOSS����
					WriteRoleValue ( headgear , EM_RoleValue_Register1 , Migic_table[i] ) ----�bR1�����ؼЪ��a����
					WriteRoleValue ( headgear , EM_RoleValue_Register2 , AI ) ---�bR2��������������
					BeginPlot( headgear,"cl_105206_N", 0 ) ---����U�l�b20���ǥX���a���ʧ@
					sleep ( 1 )
					if ReadRoleValue( Migic_table[i] , EM_RoleValue_RoomID  ) == RoomID then
						SetPosByFlag( Migic_table[i], 780844 , i+2 ) ----------------�����ǤJ�����a����ù���
					end
					local rabbit = CreateObjByFlag( 105208 , 780844 , i+5 , 1 )  ------------�ͥXù���
					AddToPartition( rabbit,RoomID ) ---�Ϫ���X�{�b�����W
					WriteRoleValue ( rabbit , EM_RoleValue_Register1 , Migic_table[i] ) ----������e�ؼЪ��a
					WriteRoleValue( rabbit , EM_RoleValue_Livetime, 20 )  --�s���ɶ�
					BeginPlot( rabbit , "cl_136_105208_N" , 0 )
					sleep ( 1 )
				end
			end
		end
	end
end
function cl_105206_N()  ----�]�N�U25����H��X��
	local headgear = OwnerID()
	local boss = ReadRoleValue( headgear , EM_RoleValue_PID )
	local player = ReadRoleValue( headgear , EM_RoleValue_Register1 )
	local AI = ReadRoleValue ( headgear , EM_RoleValue_Register2)
	local RoomID = ReadRoleValue( headgear , EM_RoleValue_RoomID )
	local skill = 1
	local xx = 0
	local yy = 0
	local zz = 0
	sysCastSpelllv ( headgear , headgear , 496882 , 0 )
	SetPlot( headgear, "touch","cl_105206_touch_N", 40 ) ------PlotType Ĳ�o���� (����"touch"Ĳ�I�B"range"�d��B"dead"���`�B"collision"�I���|��)
	while 1 do
	sleep ( 10 )
		local stage = ReadRoleValue ( AI , EM_RoleValue_Register1 )
		if stage == 1 then
			skill = skill +1
			if skill >= 20 then
				cl_chbuff_117260_N() ----20������N���a�ǥX�ӨåB�ˬdBUFF���ʧ@
				xx = ReadRoleValue ( headgear, EM_RoleValue_X)
				yy = ReadRoleValue ( headgear, EM_RoleValue_Y)
				zz = ReadRoleValue ( headgear, EM_RoleValue_Z)   ---------�o�̬O���XAttackplayer�̭������ӤH���y��
				local ball = CreateObj( 105566 , xx, yy , zz , 0 , 1 )  ------------�ͥX�]�N�U
				SetModeEx( ball , EM_SetModeType_Strikback, false) ---����(�_)
				SetModeEx( ball , EM_SetModeType_Move, false) ---����	(�_)
				SetModeEx( ball , EM_SetModeType_Searchenemy, false)--����(�_)
				SetModeEx( ball , EM_SetModeType_Mark, true)			---�i�I��(�O)
				SetModeEx( ball , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
				SetModeEx( ball , EM_SetModeType_Fight, false) ---�i���(�O)
				SetModeEx( ball , EM_SetModeType_NotShowHPMP , true ) ----����ܼg��
				AddToPartition( ball,RoomID )
				WriteRoleValue( ball , EM_RoleValue_Livetime, 5 )  --�s���ɶ�
				BeginPlot( ball , "cl_136_105242ball_N" , 0 )
			end
		else
			delobj( headgear )
		end
	end
end
function cl_105206_touch_N()  --Ĳ�I�@���n�����a��t�I�k�ʧ@,�M�����p�ߤl��B�ö]cl_136_496883
	local player = OwnerID()
	local headgear = TargetID()
	local AI = ReadRoleValue( headgear , EM_RoleValue_PID )
	--CastSpelllv ( player , headgear , 496928 , 0 )
	if CheckBuff(  player , 508520 ) == true then
		if	BeginCastBarEvent( player , headgear , "[SC_13604_12]" , 20 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END,0 , "cl_136_117377_N") ~=1	then
			ScriptMessage( player, player, 1,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
		end
	elseif CheckBuff(  player , 508520 ) == false then
		ScriptMessage( player, player, 1,"[SC_13604_11]", 0 );		--�o�U�l�Ӥj�F�I�A�S��k�h�ʥ��D�D
	end
end
function cl_136_117377_N(Executer,Result) ---���յۧ���ߤl
	if	Result > 0 then --���\���A
		EndCastBar(Executer,Result)--�M���I�k��
		BeginPlot( TargetID() , "cl_136_496883_N" , 0)
	else --���Ѫ��A
		EndCastBar(Executer,Result)--�M���I�k��
	end
end
function cl_136_105204_dead_N()  ---boss�����`�@��
	local AI = ReadRoleValue ( OwnerID() , EM_RoleValue_PID ) --PID���ȥN������
	WriteRoleValue ( AI , EM_RoleValue_Register1 , 2 )
end
function cl_136_496883_N()  ----�I�k�������ˬd�дU�l����N���a�ǰe�X�Ӫ��ʧ@
	local headgear= OwnerID()
	local player = TargetID()
	CancelBuff( player , 508520 )
	BeginPlot( headgear,"cl_chbuff_117260_N", 0 )
end
function cl_chbuff_117260_N() ---�N���a�ǰe�X��~�ˬd���W���S��BUFF�S�����ܸɤ@���ܨ��k�N�����a
	local headgear = OwnerID()
	local RoomID = ReadRoleValue( headgear , EM_RoleValue_RoomID )
	local player = ReadRoleValue( headgear , EM_RoleValue_Register1 )
	local boss = ReadRoleValue( headgear , EM_RoleValue_PID )
	local xx = 0
	local yy = 0
	local zz = 0
	local xx1 = 0
	local yy1 = 0
	local zz1 = 0
	local randbuff = { 508522 , 508603 , 509437 }
	local rbuff = 0
	xx = ReadRoleValue ( headgear, EM_RoleValue_X)
	yy = ReadRoleValue ( headgear, EM_RoleValue_Y)
	zz = ReadRoleValue ( headgear, EM_RoleValue_Z)   ---------�o�̬O���XAttackplayer�̭������ӤH���y��
	if ReadRoleValue( player , EM_RoleValue_RoomID  ) == RoomID then
		SetPos( player , xx , yy , zz , 0 )
	end
	sleep ( 5 )
	if CheckBuff(  player , 509438 ) == true then
		CancelBuff_NoEvent( player , 509438 ) ---�M��BUFF
		sysCastSpelllv ( headgear , headgear , 496884 , 0 ) ---�U�l�ۤv��t�@��
		--WriteRoleValue ( boss , EM_RoleValue_Register3 , 2 )
		sleep ( 5 )
	elseif CheckBuff(  player , 509438 ) == false then
		if ReadRoleValue( player , EM_RoleValue_IsDead ) ~= 1 then
			rbuff = DW_Rand ( 3 )
			addbuff ( player , randbuff[rbuff] , 0 , -1 ) ----�����ܨ�
			xx1 = ReadRoleValue ( headgear, EM_RoleValue_X)
			yy2 = ReadRoleValue ( headgear, EM_RoleValue_Y)
			zz3 = ReadRoleValue ( headgear, EM_RoleValue_Z)   ---------�o�̬O���XAttackplayer�̭������ӤH���y��
			local ball = CreateObj( 105566 , xx, yy , zz , 0 , 1 )  ------------�ͥX�]�N�U
			SetModeEx( ball , EM_SetModeType_Strikback, false) ---����(�_)
			SetModeEx( ball , EM_SetModeType_Move, false) ---����	(�_)
			SetModeEx( ball , EM_SetModeType_Searchenemy, false)--����(�_)
			SetModeEx( ball , EM_SetModeType_Mark, true)			---�i�I��(�O)
			SetModeEx( ball , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
			SetModeEx( ball , EM_SetModeType_Fight, false) ---�i���(�O)
			SetModeEx( ball , EM_SetModeType_NotShowHPMP , true ) ----����ܼg��
			AddToPartition( ball,RoomID )
			WriteRoleValue( ball , EM_RoleValue_Livetime, 5 )  --�s���ɶ�
			BeginPlot( ball , "cl_136_105242ball_N" , 0 )
			--WriteRoleValue ( boss , EM_RoleValue_Register3 , 2 )
			sleep ( 5 )
		end
	end
	delobj( headgear )
end
function cl_105208_dead_N() ----�ߤl�����`�@���n�����a�@���ˬd��BUFF
	addbuff ( TargetID() , 509438 , 0 , -1 )
	delobj ( OwnerID() )
end
function cl_136_105209_AI2_N() ---BOSS���}�԰��n�Ǩ�o��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local TempPlayer = 0
	local xx = 0
	for YY = 1 , 2 , 1 do 
		TempPlayer = SearchRangePlayer ( OwnerID() , 200 )----���]�N�U�̭����Ҧ����a"TempPlayer"�o�O�@��TABLE
		xx=table.getn(TempPlayer) ----Ū��TABLE�̧�쪺�ƶq
		for i=0,xx-1 do
			if ReadRoleValue( TempPlayer[i] , EM_RoleValue_RoomID  ) == RoomID then
				SetPosByFlag( TempPlayer[i], 780844 , 10 )  ----�̧ǱN���a�ǰe��J�f�I
			end
		end
		sleep ( 50 )
	end
	delobj ( OwnerID() )
end
function cl_105209_chack_N() ---�ˬdBOSS�O�_�Z���W�X�ж��קKBOSS�l�h���Q�ǤJ�U�l�������a
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID)  ------>�ڥhŪ������̭���PID�ȧi�DBOSS���O����ͥX�Ӫ�
	while 1 do
		sleep (30)
		local boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
		if ReadRoleValue( boss , EM_RoleValue_IsDead ) ==  0 then
			local oo = GetDistance( OwnerID(), boss );
			if oo >= 600 then
				WriteRoleValue ( AI , EM_RoleValue_Register1 ,3 )
			end
		elseif ReadRoleValue( boss , EM_RoleValue_IsDead ) ~=  0 then
			delobj ( OwnerID() )
		end
	end
end
function cl_105209_P_N() ----�ˬdAI��stage�����O�h��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID)  ------>�ڥhŪ������̭���PID�ȧi�DBOSS���O����ͥX�Ӫ�
	while 1 do
		sleep (5)
		local stage = ReadRoleValue ( AI , EM_RoleValue_Register1 )  ----stage=1 �԰��}�l stage=2 BOSS���` stage=3 BOSS���}�԰����m
		if stage == 1 then
		elseif stage == 2 then
			cl_136_105209_AI2_N()
		elseif stage == 3 then
			cl_136_105209_AI2_N()
		end
	end
end
function cl_136_105208_N() ---�ߤl��AI
	local rabbit = OwnerID() ----�ڥs��AI
	local RoomID = ReadRoleValue( rabbit , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	local skill = 0
	Addbuff (  rabbit , 508599 , 0 ,-1 ) ---508602
	SetPlot( rabbit, "dead","cl_105208_dead_N", 0 )
	while 1 do
		sleep ( 10 )
		skill = skill + 1
	end
end
function cl_496924_N() --�ˬd�d�򤺦��S���U�l
	local boss = OwnerID() ----�ڥs��boss
	local AI = ReadRoleValue ( boss , EM_RoleValue_PID ) --PID���ȥN������
	local AI2 = ReadRoleValue ( boss , EM_RoleValue_Register2 ) ---�ڪ�Register2�̪��Ȭ�AI2
	local most = {} --most�O��table
	most = SearchRangeNPC ( boss , 75 ) --most�O��Ū���d�򤺪�NPC
	local mostno = table.getn(most) ---�ŧimostno�O���Xmost�̪��ƶq
	for i=1 , mostno , 1 do ---���X�Ӫ��ƶq�N��n���X��
		if ReadRoleValue( most[i] , EM_RoleValue_OrgID ) == 117260 then --�p�G�̧ǧ�쪺NPC�̭���117260�U�l���ܴN����H�U
			sysCastSpelllv ( most[i] , most[i] , 496925 , 0 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
			sysCastSpelllv ( AI2 , AI2 , 496929 , 0 ) --��AI2���U�l�̭����Ҧ����a�I��-80%�ˮ`��AE
		end
	end
end
function cl_136_496926_N()  ---�줻�ӤH��P
	local boss = OwnerID() ----�ڥs��boss
	local RoomID = ReadRoleValue( boss , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	local AI = ReadRoleValue ( boss , EM_RoleValue_PID ) --PID���ȥN������
	local AI2 = ReadRoleValue ( boss , EM_RoleValue_Register2 ) ---�ڪ�Register2�̪��Ȭ�AI2
	local hset_table = {}
	local rand={}
	local hset2_table = {}
	local hset2 = 0
	local z = 0
	local y = 0
	local x = 0
	--local boss2 = 0
	hset_table = DW_HateRemain(0)
	local hset = table.getn(hset_table)
	if hset >= 1 then
		for i = 1 , 6 , 1 do ----��T�Ӫ��a
			Rand_Num = DW_Rand(hset)
			if hset >= 1 then
				table.insert( hset2_table , hset_table[Rand_Num] )
				table.remove ( hset_table , Rand_Num )
				hset=table.getn(hset_table)
			end
		end
	end
	hset2 = table.getn(hset2_table)
	if hset2 >= 1 then
		for i = 1 , hset2 , 1 do
			x = ReadRoleValue (boss, EM_RoleValue_X)
			y = ReadRoleValue (boss, EM_RoleValue_Y)
			z = ReadRoleValue (boss, EM_RoleValue_Z)
			rand = Az_RND_Ary(-150,150,2)
			local boss2 = CreateObj ( 105560 , x+rand[1] , y+30 , z+rand[2] , 0 , 1) --�H���r���P��ͩ�
			--local boss2 = CreateObjByFlag( 105204 , 780852 , i , 1 )  ------------�ͥX�]�N�U
			SetModeEx( boss2 , EM_SetModeType_Strikback, false) ---����(�_)
			SetModeEx( boss2 , EM_SetModeType_Move, false) ---����	(�_)
			SetModeEx( boss2 , EM_SetModeType_Searchenemy, false)--����(�_)
			SetModeEx( boss2 , EM_SetModeType_Mark, true)			---�i�I��(�O)
			SetModeEx( boss2 , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
			SetModeEx( boss2 , EM_SetModeType_Fight, false) ---�i���(�O)
			SetModeEx( boss2 , EM_SetModeType_NotShowHPMP , false ) ----����ܼg��
			SetModeEx( boss2 , EM_SetModeType_Gravity , false ) ---���Q
			AddToPartition( boss2,RoomID )
			WriteRoleValue ( boss2 , EM_RoleValue_PID , boss )
			WriteRoleValue ( boss2 , EM_RoleValue_Register1 , hset2_table[i] )
			WriteRoleValue ( boss2 , EM_RoleValue_Register2 , AI )
			--WriteRoleValue ( boss2 , EM_RoleValue_Livetime , 3 )
			BeginPlot( boss2,"cl_136_hset2_table_N", 0 )
			sleep ( 1 )
		end
	end
end
function cl_136_hset2_table_N() ---�����缾�a�I��ȵP�ޯ�
	local player = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 )
	CastSpelllv ( OwnerID() , player , 496926 , 5 )
	sleep ( 30 )
	delobj ( OwnerID() )
end
function cl_117377_touch_N()  --Ĳ�I�@���n�����a��t�I�k�ʧ@,�M�����p�ߤl��B�ö]
	local player = OwnerID()
	local headgear = TargetID()
	local AI = ReadRoleValue( headgear , EM_RoleValue_PID )
	--CastSpelllv ( player , headgear , 496928 , 0 )
	if	BeginCastBarEvent( player , headgear , "[SC_13604_09]" , 20 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END,0 , "cl_136_496928_N") ~=1	then
		ScriptMessage( player, player, 1,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
	end
end
function cl_496928_N() ---�I�k������s�ߤl�ۤv����@��
	local headgear = OwnerID() --SC_13604_08
	local player  = TargetID()
	local AI = ReadRoleValue( headgear , EM_RoleValue_PID )
	BeginPlot( headgear , "cl_117377_rabbit_N" , 0)
end
function cl_117377_rabbit_N() --���ۤv�ϥθI�k�N�b�ܤj�M��R���ۤv
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	StopMove( OwnerID() , false )
	Addbuff (  OwnerID() , 508523 , 0 ,-1 ) ---�ߤl�ܤj
	CastSpelllv ( OwnerID() , OwnerID() , 496884 , 0 )
	sleep ( 10 )
	local showAI = ReadRoleValue ( AI , EM_RoleValue_Register5 )
	WriteRoleValue ( AI , EM_RoleValue_Register5 , showAI+1 )
	WriteRoleValue ( AI , EM_RoleValue_Register6 , TargetID() )
	delobj ( OwnerID() )
end
function cl_136_rabbit_N() ---���u���ߤl�~�|�ܥXBOSS��
	local rabbit = OwnerID()
	local RoomID = ReadRoleValue( rabbit , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local AI = ReadRoleValue( rabbit , EM_RoleValue_PID )
	local fiag = 0
	SetPlot( rabbit, "touch","cl_117377_touch_N", 20 ) ------PlotType Ĳ�o���� (����"touch"Ĳ�I�B"range"�d��B"dead"���`�B"collision"�I���|��)
	while 1 do   ------�����԰��j��,�o�̭n�i�D���C�j�h�[�N�ˬd�@��
		sleep ( 10 )
		fiag = DW_Rand(30)
		WriteRoleValue( rabbit,EM_RoleValue_IsWalk,0)
		Hide(rabbit)
		Show(rabbit,RoomID)
		DW_MoveToFlag( rabbit , 780767 , fiag , 0 ) ----�H��Rand�X�l����
		sleep ( 10 )
	end
end
function cl_136_496928_N(Executer,Result) ---���յۧ���ߤl
	if	Result > 0 then --���\���A
		local oo = GetDistance( OwnerID() , TargetID() );
		if oo <= 40 then ----------------------------------------------------------------------------------------------------------�n�ק�^20
			EndCastBar(Executer,Result)--�M���I�k��
			BeginPlot( TargetID() , "cl_496928_N" , 0)
		else
			EndCastBar(Executer,-1)--�M���I�k��
			ScriptMessage( TargetID() , -1 , 2 ,"[SC_13604_10]" , 2 )----SHOW TIME �I��t�}�l�I
		end
	else --���Ѫ��A
		EndCastBar(Executer,Result)--�M���I�k��
	end
end
function cl_136_105242ball_N()  --��?
	CastSpelllv ( OwnerID() , OwnerID() , 496928 , 0 )  -----�o�O�֩�?
end
function cl_508603_N()  ----�ǬV��BUFF�ˬd�@�U
	if CheckBuff( TargetID() , 509437 ) == false and
		CheckBuff( TargetID() , 508603 ) == false and
		CheckBuff( TargetID() , 508991 ) == false and
		CheckBuff( TargetID() , 508522 ) == false then
		return true
	elseif CheckBuff( TargetID() , 509437 ) == true or
		CheckBuff( TargetID() , 508603 ) == true or
		CheckBuff( TargetID() , 508522 ) == true or
		CheckBuff( TargetID() , 508991 ) == true or
		ReadRoleValue( TargetID() , EM_RoleValue_VOC ) == 0 then
		return false
	end
end
function cl_136_opendoor_dead_N()
	local rabbit = OwnerID()
	local AI = ReadRoleValue ( rabbit , EM_RoleValue_PID )
	WriteRoleValue ( AI , EM_RoleValue_Register7, 1 )
end
function cl_136_105205() ---���AI
	local AI = OwnerID() ----�ڥs��AI
	local RoomID = ReadRoleValue( AI , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	local boss = 0
	local attackflag = 0 ---�԰��}�l 
	local door_1 = 0 ---���ת�
	local cck = 0 ----���q�Z����,�קKBOSS�]�h�l�Q��i�U�l���H
	local AI2 = 0 -----�U�l�̪�������m��I��ޯೣ�a�L
	local wark_rand = 0
	local cazry = 0
	local cazry_flag = 0
	local kill_Table = {}
	local kill_rabbit = 0
	local ThesePlayer = {} -----��԰������ɩҦ����a��table,�n�ˬd���a���W��BUFF
	WriteRoleValue ( AI , EM_RoleValue_Register7, 0 ) ---�b�ۤv���W��R7�̰O��"0"
	local door = CreateObjByFlag( 105207 , 780844 , 1 , 1 ) ------------���ͫ��
	WriteRoleValue ( AI , EM_RoleValue_Register8, 0 ) --------�b�ۤv���W��R8�̰O��"0"
	SetModeEx ( door , EM_SetModeType_Obstruct, true) 		---����(�O)
	SetModeEx( door , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( door , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( door , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( door , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( door , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( door , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( door , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
	AddToPartition ( door,RoomID ) ----����[�J����,�Ҧ椽��
	for i = 1 , 6 do   ----for�j��n�B�z6��
		wark_rand = DW_Rand(30)  ----�H���@�Ӫ�
		local rabbit = CreateObjByFlag( 117377 , 780767 , wark_rand , 1 ) ------------�H���X�Ц�m����"�_�Ǫ��ߤl"
		SetModeEx( rabbit , EM_SetModeType_Strikback, false) ---����(�_)
		SetModeEx( rabbit , EM_SetModeType_Searchenemy, false)--����(�_)
		SetModeEx( rabbit , EM_SetModeType_Mark, true)			---�i�I��(�O)
		SetModeEx( rabbit , EM_SetModeType_ShowRoleHead, true) 		---�Y����(�O)
		SetModeEx( rabbit , EM_SetModeType_Fight, false) ---�i���(�O)
		SetModeEx( rabbit , EM_SetModeType_NotShowHPMP , true) ----����ܼg��
		AddToPartition ( rabbit , RoomID ) ----����[�J����,�Ҧ椽��
		WriteRoleValue ( rabbit , EM_RoleValue_PID, AI ) ---�b�ߤl��PID�̰O��AI
		table.insert( kill_Table , rabbit ) ---��J"kill_Table"�o��table
		BeginPlot( rabbit,"cl_136_rabbit", 0 )  ---�����H�����X��
		SetPlot( rabbit, "dead","cl_136_opendoor_dead", 0 ) --���`��n�^�Ǫ���������---GM�~�������ߤl--��BOSS�����X�{
		sleep ( 1 )  ---�C����@��"BeginPlot"�N�nSleep�_�h�|�ɭP�Y��LAG
	end
	while ReadRoleValue ( AI , EM_RoleValue_Register1 ) ~= 4 do
		sleep ( 5 )
		local showAI = ReadRoleValue ( AI , EM_RoleValue_Register5 )  ---�C��Ū��R5���ȧP�_�ߤl�ѤU�X�����ɭ������X��(��C���ߤl�Q���a��쪺�ɭԳ��|�N�o�ӭ�+1,���W��6���ҥH�ȭn+��6�H�WBOSS�~�|�X�{)
		local player = ReadRoleValue ( AI , EM_RoleValue_Register6 )  ----Ū��R6����~�o�Ӫ��O�̫�@���I��ߤl�����a
		local kill_rabbit_GM = ReadRoleValue ( AI , EM_RoleValue_Register7 ) ---��ߤl�O�Q�ϥ�GM���O�������ܷ|�^�ǳo�Ӫ����N�n�R�����W�٨S�I���ߤl�åB����BOSS
		if kill_rabbit_GM == 1 then  ----�ߤl�Q������o�Ӫ��|�ܦ�1
			kill_rabbit = table.getn(kill_Table) ----���X�_�Ǫ��ߤl���ƶq
			for i = 1 , kill_rabbit , 1 do  ---���`�@�X���ߤl�NFOR�j��N���X��
				if CheckID(kill_Table[i]) == true then ------�ˬd�ߤl�O�_�٦s�b
					delobj ( kill_Table[i] )  ---�٦b���ܴN�R����
				end
			end
			WriteRoleValue ( AI , EM_RoleValue_Register5, 6 )  ----�b��������R5�g�J6�ǳƲ���BOSS
			WriteRoleValue ( AI , EM_RoleValue_Register7, 0 )  -----�b��������R7�g�J0,�o�ˤ~���|�@������R���ߤl��for�j��
		end
		if showAI >= 6 then  ---��R5�̪��Ȥj��6
			wark_rand = DW_Rand(30)  ---���W��30�ӺX�Эn�H����@�Ӹ��X
			boss = CreateObjByFlag( 105204 , 780767 , 0 , 1 )  ------------�b���W�H���X�Ц�m����BOSS
			AddToPartition ( boss,RoomID ) ----����[�J����,�Ҧ椽��
			WriteRoleValue ( boss , EM_RoleValue_PID, AI ) --------��BOSS���O������AI���ͪ�
			BeginPlot( boss,"cl_136_105204", 0 )  -----------�N����scpipt��i�h�����W,��������
			--SetPlot( boss, "dead","cl_136_105204_dead", 0 ) --boss���榺�`�@��,�N���Ǧ^���������P�_���q
			SetAttack( boss , player )  ----�@�}�lŪ���쪺R6�������a�n��BOSS������L����
			WriteRoleValue ( AI , EM_RoleValue_Register5, 0 ) --------�n�NR5�����ȧ��ܧ_�hBOSS�|���_����
		end
		local stage = ReadRoleValue ( AI , EM_RoleValue_Register1 )  ----stage=1 �԰��}�l stage=2 BOSS���` stage=3 BOSS���}�԰����m
		if stage == 1 then --�p�Gstage����1����H�U
			cazry = cazry + 1  ---�i�J�԰���g�ɮɶ��}�l�p��C�@��+1
			if cazry >= 960 then  ----��C��+1��8�����L��
				WriteRoleValue ( AI , EM_RoleValue_Register9, 9 ) --------�n�NR5�����ȧ��ܧ_�hBOSS�|���_����
				Addbuff (  boss , 507744 , 0 ,-1 ) ---�KADD�g��BUFF��BOSS
				cazry = 0  ---�g�ɫ�o�ӭȭn�g�^0�_�h�|�@��ADDBUFF
			end
			if attackflag == 0 then --�p�G�԰��}�l����0����H�U
				door_1 = CreateObjByFlag( 105207 , 780844 , 2 , 1 ) ------------�J�f��
				SetModeEx ( door_1 , EM_SetModeType_Obstruct, true) 		---����(�O)
				SetModeEx( door_1 , EM_SetModeType_Strikback, false) ---����(�_)
				SetModeEx( door_1 , EM_SetModeType_Move, false) ---����	(�_)
				SetModeEx( door_1 , EM_SetModeType_Searchenemy, false)--����(�_)
				SetModeEx( door_1 , EM_SetModeType_Mark, false)			---�i�I��(�O)
				SetModeEx( door_1 , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
				SetModeEx( door_1 , EM_SetModeType_Fight, false) ---�i���(�O)
				SetModeEx( door_1 , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
				AddToPartition ( door_1,RoomID ) ----����[�J����,�Ҧ椽��
				cck = CreateObjByFlag( 105209 , 780844 , 11 , 1 )  ------------Ū��BOSS���Z��
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
				BeginPlot( cck , "cl_105209_chack" , 0 ) ----�����ˬdBOSS�Z���O�_�W�X�ж�
				sleep ( 1 ) --Sleep 0.1���קK�P�ɶ�����ӦhBeginPlot�y��LAG
				AI2 = CreateObjByFlag( 105209 , 780844 , 9 , 1 ) -----------���ͤp�ж��������
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
				BeginPlot( AI2 , "cl_105209_P" , 0 ) --------����C���ˬdAI��stage�����O�h��
				attackflag = 1 ---�N�԰��}�l�g��1�קK���ư�
			end
			local del_boss = ReadRoleValue ( AI , EM_RoleValue_Register8 )  ----Ū����������R8,��BOSS�I�i�~�P���ɭԭn�R�����W�����ͤ@��s��
			if del_boss == 1 then  ----��Ū����BOSS�w�g�I��~�P
				local xx1 = ReadRoleValue ( boss, EM_RoleValue_X)
				local yy2 = ReadRoleValue ( boss, EM_RoleValue_Y)
				local zz3 = ReadRoleValue ( boss, EM_RoleValue_Z)   ---------Ū���ª�BOSS�������y�Ц�m
				local MaxHP = ReadRoleValue( boss , EM_RoleValue_MaxHP )
				local bosshp = ReadRoleValue( boss , EM_RoleValue_HP )	---�����ª�BOSS����e��q
				local AttackTarget = ReadRoleValue( AI , EM_RoleValue_Register4 )-----Ū���ª�BOSS����e�����ؼ�
				local HPPercent = ( bosshp / MaxHP )*100
				if HPPercent >= 1 then
					sleep ( 30 )
					delobj ( boss )
					boss = CreateObj( 105204 , xx1, yy2 , zz3 , 0 , 1 )  ----���eŪ���ª�BOSS���y�Ц�m�W���ͷs��BOSS
					AddToPartition ( boss,RoomID ) ----����[�J����,�Ҧ椽��
					WriteRoleValue ( boss , EM_RoleValue_HP , bosshp )----�N�s��BOSS��e��q��g���ª�BOSS��e��q
					addbuff ( boss , 508517 , 0 , -1 )  -----���W�@�ӸT��^�媺BUFF�קK�u�����}�԰��y��BOSS�^����D
					WriteRoleValue ( boss , EM_RoleValue_PID, AI ) --------��BOSS���O������AI���ͪ�
					WriteRoleValue ( cck , EM_RoleValue_Register1, boss ) --------��BOSS���O������AI���ͪ�
					if ReadRoleValue ( AI , EM_RoleValue_Register9 ) == 9 then
						Addbuff (  boss , 507744 , 0 ,-1 ) ---�KADD�g��BUFF��BOSS
					end
					BeginPlot( boss,"cl_136_105204", 0 )  -----------�NBOSS��SCRIPT��^�h�~�����
					SetAttack( boss , AttackTarget)  ----�קKBOSS���}�԰��n�N��e�ؼе�BOSS
					sleep ( 10 )
				elseif HPPercent < 1 then
					SetModeEx( boss , EM_SetModeType_Fight, true) ---�i���(�O)
				end
				WriteRoleValue ( AI , EM_RoleValue_Register8 , 0 )----�n�N�ȰO�^�h0���M�٬O�|�@�����ͳ�
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
							CheckBuff( ThesePlayer[i] , 508521 ) or 
							CheckBuff( ThesePlayer[i] , 508523 ) or 
							CheckBuff( ThesePlayer[i] , 508603 ) or
							CheckBuff( ThesePlayer[i] , 508646 ) or
							CheckBuff( ThesePlayer[i] , 508520 ) ==  true then ---�ˬd�����a���W�O�_���H�W��BUFF�p�G�����ܰ���H�U
							CancelBuff(ThesePlayer[i], 508520)
							CancelBuff(ThesePlayer[i], 508521)
							CancelBuff(ThesePlayer[i], 508522)
							CancelBuff(ThesePlayer[i], 508523)  
							CancelBuff(ThesePlayer[i], 508603)
							CancelBuff(ThesePlayer[i], 508646)---�M�������a���W��BUFF
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
						CheckBuff( ThesePlayer[i] , 508521 ) or 
						CheckBuff( ThesePlayer[i] , 508523 ) or 
						CheckBuff( ThesePlayer[i] , 508603 ) or
						CheckBuff( ThesePlayer[i] , 508646 ) or
						CheckBuff( ThesePlayer[i] , 508520 ) ==  true then---�ˬd�����a���W�O�_���H�W��BUFF�p�G�����ܰ���H�U
						CancelBuff(ThesePlayer[i], 508520)
						CancelBuff(ThesePlayer[i], 508521)
						CancelBuff(ThesePlayer[i], 508522)
						CancelBuff(ThesePlayer[i], 508523)
						CancelBuff(ThesePlayer[i], 508603)
						CancelBuff(ThesePlayer[i], 508646)---�M�������a���W��BUFF
					else
					end
				end					
			end
			delobj ( door_1 ) --�R���e��
			sleep ( 30 ) ---���d3��
			WriteRoleValue ( AI , EM_RoleValue_Register9, 0 ) --------�n�NR5�����ȧ��ܧ_�hBOSS�|���_����
			cazry = 0
			boss = CreateObjByFlag( 105204 , 780844 , 0 , 1 ) ------------���s����BOSS
			AddToPartition ( boss,RoomID ) ----����[�J����,�Ҧ椽��
			WriteRoleValue ( boss , EM_RoleValue_PID, AI ) --------��BOSS���O������AI���ͪ�
			BeginPlot( boss,"cl_136_105204", 0 )  -----------�N����scpipt��i�h�����W,��������
			WriteRoleValue ( AI , EM_RoleValue_Register1 , 0 ) ---�NAI��Register1�g�^�h0
			attackflag = 0
		end
	end
end
function cl_136_105204() ---bossAI
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
	local Play_Table = {}
	local hateKey = 0
	local TempGID = 0
	local hate = 10
	SetPlot( boss, "dead","cl_136_105204_dead", 0 ) ------PlotType Ĳ�o���� (����"touch"Ĳ�I�B"range"�d��B"dead"���`�B"collision"�I���|��)
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
							table.insert( Play_Table , ID )  ----�p�G���a���W�S���H�WBUFF�åB�s��~�N�N�L���t�~�@��TABLE
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
				Cl_Z136_SetHate(Play_Table)
				if skill7 >= 7 then ---�I�����ޯ�
					CastSpelllv ( boss , AttackTarget , 496927 , 30  )----�_�ۤ��P
					sleep ( 10 )
					skill7 = 0
				end
				if skill9 >= 9 then  -----�e�记��
					CastSpelllv ( boss , boss , 497011 , 40  )----�]�N��k
					sleep ( 20 )
					skill9 = 0
				end
				if skill3 >= 13 then --�C13�����H�U
					ScriptMessage( boss , -1 , 2 ,"[SC_13604_03]" , 2 )----�C�j�A�̪������I�ݥJ�ӳo�����R���q�a�I
					CastSpelllv ( boss , boss , 496924 , 40 ) ---�]�N��q
					sleep ( 20 ) --slee0.8��
					cl_496924() ---�I���]�N��q����������o�q~�Ψ��ˬd�k�N�d�򤺬O�_���]�N�U
					sleep ( 10 )
					skill3 = 0
				end
				if skill22 >= 17 then 
					ScriptMessage( boss , -1 , 2 ,"[SC_13604_04]" , 2 )----���R�������q�I���I�x�n���y�a�I
					cl_136_496926() ---�H���줻�ӤH�I��ȵP
					sleep ( 30 )
					skill22 = 0
				end
				if skill >= 33 then --�C33��@��N�N���a�δU�l�\�_
					while 	ReadRoleValue( boss , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(10)
					end
					CastSpelllv ( boss , boss , 496923 , 0 ) --BOSS��ۤv�I��@�Ӫ�t�ߴU���ʧ@
					cl_magicInHand_BIG() ----Ū��������֭n�\�U�֭n�ܤj
					skill99_9 = 2  ----��I�񧹫�o��¾�~��J2�}�l�p����
					sleep ( 30 ) --
					skill = 0
					skill2 = 0
				end
				if skill99_9 == 2 then ---����ܦ�1���ɭԶi�J�j�餺�}�l�p��
					skill99 = skill99 + 1  ---�C�i�J�@���N+1
					if skill99 >= 22 then  ---��ɶ���F22��---PS�]�N�O���a�Q�ǥX�U�l�~
						while 	ReadRoleValue( boss , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
							sleep(10)
						end
						ScriptMessage( boss , -1 , 2 ,"[SC_13604_06]" , 2 )----�ǹǡI���s�~�P�I�o�P�I�ǹ�
						sleep ( 10 )
						CastSpelllv ( boss , boss , 496921 , 0 ) ---�I��~�P
						
						WriteRoleValue ( AI , EM_RoleValue_Register4 , AttackTarget )
						SetModeEx( boss , EM_SetModeType_Fight, false) ---�i���(�O)
						WriteRoleValue ( AI , EM_RoleValue_Register8 , 1 )  ---�N��������R8�令1--BOSS�n�R�����Ф@��s��
						--[[local buff = BUFFCount ( boss )
						--for i = 1 , buff , 1 do
						while 1 do
							sleep ( 1 )
							local buff_No = BUFFInfo( boss , 0 , EM_BuffInfoType_BuffID )
							CancelBuff( boss, buff_No )
						end]]--
						sleep ( 10 )
						skill99_9 = 0 --�n�N�ȧ��ܦ^0
						skill99 = 0 --�n�N�ȧ��ܦ^0
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
function cl_magicInHand_BIG()
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
			BeginPlot( headgear,"cl_105206", 0 )  ----����20���N���a�ǥX�Ӫ��ʧ@
			sleep ( 1 )
			if ReadRoleValue( kill_table[i] , EM_RoleValue_RoomID  ) == RoomID then ----Ū���ӥؼЪ��a�O�_��BOSS���P�@��RoonID
				SetPosByFlag( kill_table[i], 780844 , i+2 ) -----�p�G�P�@��RoomID���ܴN�ǰe��X�Ц�}~
			end
			local rabbit = CreateObjByFlag( 105208 , 780844 , i+5 , 1 )  ------------�����ǤJ�����a����ù���
			AddToPartition( rabbit,RoomID ) ----
			WriteRoleValue ( rabbit , EM_RoleValue_Register1 , kill_table[i] ) ------�b�ߤl��R1�����������ؼЪ��a
			WriteRoleValue( rabbit , EM_RoleValue_Livetime, 20 )  --�s���ɶ�20��~
			BeginPlot( rabbit , "cl_136_105208" , 0 )  ----����ߤl������SCRIPT
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
				for i = 1 , 3 , 1 do
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
					BeginPlot( headgear,"cl_105206", 0 ) ---����U�l�b20���ǥX���a���ʧ@
					sleep ( 1 )
					if ReadRoleValue( Migic_table[i] , EM_RoleValue_RoomID  ) == RoomID then
						SetPosByFlag( Migic_table[i], 780844 , i+2 ) ----------------�����ǤJ�����a����ù���
					end
					local rabbit = CreateObjByFlag( 105208 , 780844 , i+5 , 1 )  ------------�ͥXù���
					AddToPartition( rabbit,RoomID ) ---�Ϫ���X�{�b�����W
					WriteRoleValue ( rabbit , EM_RoleValue_Register1 , Migic_table[i] ) ----������e�ؼЪ��a
					WriteRoleValue( rabbit , EM_RoleValue_Livetime, 20 )  --�s���ɶ�
					BeginPlot( rabbit , "cl_136_105208" , 0 )
					sleep ( 1 )
				end
				return Migic_table
			end
		end
	end
end
function cl_105206()  ----�]�N�U25����H��X��
	local headgear = OwnerID()
	local boss = ReadRoleValue( headgear , EM_RoleValue_PID )
	local player = ReadRoleValue( headgear , EM_RoleValue_Register1 )
	local AI = ReadRoleValue ( headgear , EM_RoleValue_Register2)
	local RoomID = ReadRoleValue( headgear , EM_RoleValue_RoomID )
	local skill = 1
	local xx = 0
	local yy = 0
	local zz = 0
	sysCastSpelllv ( headgear , headgear , 496882 , 0 )  ----�ۤv��ۤv�I��@�Ӫk�N(��t��)
	SetPlot( headgear, "touch","cl_105206_touch", 40 ) ------PlotType Ĳ�o���� (����"touch"Ĳ�I�B"range"�d��B"dead"���`�B"collision"�I���|��)
	while 1 do
	sleep ( 10 )
		local stage = ReadRoleValue ( AI , EM_RoleValue_Register1 )  ---Ū��������R1���ȧP�_�{�b�O�_�԰����Ϊ����}�԰�
		if stage == 1 then  ----�b�԰����~����
			skill = skill +1  ----Ū�����~�C�@��+1
			if skill >= 20 then  ---��[��20��n�N���a�ǥX��
				cl_chbuff_117260() ----�ǥX�ӥΪ�SCRIPT�ѳo�@�q�B�z
				xx = ReadRoleValue ( headgear, EM_RoleValue_X)
				yy = ReadRoleValue ( headgear, EM_RoleValue_Y)
				zz = ReadRoleValue ( headgear, EM_RoleValue_Z)   ---------�o�̬O���X��X�z���y���y��
				local ball = CreateObj( 105242 , xx, yy , zz , 0 , 1 )  ------------���ͤ@�ӷs���z���y
				SetModeEx( ball , EM_SetModeType_Strikback, false) ---����(�_)
				SetModeEx( ball , EM_SetModeType_Move, false) ---����	(�_)
				SetModeEx( ball , EM_SetModeType_Searchenemy, false)--����(�_)
				SetModeEx( ball , EM_SetModeType_Mark, true)			---�i�I��(�O)
				SetModeEx( ball , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
				SetModeEx( ball , EM_SetModeType_Fight, false) ---�i���(�O)
				SetModeEx( ball , EM_SetModeType_NotShowHPMP , true ) ----����ܼg��
				AddToPartition( ball,RoomID )
				WriteRoleValue( ball , EM_RoleValue_Livetime, 5 )  --�s���ɶ�5��
				BeginPlot( ball , "cl_136_105242ball" , 0 ) ----����@�q�I��k�N���ޯ�
			end
		else ----�p�G�������{�b���B��԰������q�h�ȨǧR���ۤv
			delobj( headgear )
		end
	end
end
function cl_105206_touch()  --�U�l��Ĳ�I�@��
	local player = OwnerID()  ----�hĲ�I
	local headgear = TargetID() ----�QĲ�I����H
	local AI = ReadRoleValue( headgear , EM_RoleValue_PID )
	if CheckBuff(  player , 508520 ) == true then ----���ˬd�ۤv���W�O�_���]�N���H��BUFF
		if	BeginCastBarEvent( player , headgear , "[SC_13604_12]" , 20 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END,0 , "cl_136_117377") ~=1	then  
			ScriptMessage( player, player, 1,"[SAY_NPC_BUSY]", 0 );		--����@�Ӯɶ�����ɶ����]���N����
		end
	elseif CheckBuff(  player , 508520 ) == false then ----�S���]�N���H��BUFF�N���ܤ@�Ӧr��
		ScriptMessage( player, player, 1,"[SC_13604_11]", 0 );		--�o�U�l�Ӥj�F�I�A�S��k�h�ʥ��D�D
	end
end
function cl_136_117377(Executer,Result) ---���յۧ���ߤl
	if	Result > 0 then --���\���A
		EndCastBar(Executer,Result)--�M���I�k��
		BeginPlot( TargetID() , "cl_136_496883" , 0)  ----����N�U�l�ȶ}��ǰe���a�X��
	else --���Ѫ��A
		EndCastBar(Executer,Result)--�M���I�k��
	end
end
function cl_136_105204_dead()  ---boss�����`�@��
	local AI = ReadRoleValue ( OwnerID() , EM_RoleValue_PID ) --PID���ȥN������
	WriteRoleValue ( AI , EM_RoleValue_Register1 , 2 )  ----�ǭȵ��������i��BOSS�w���`
end
function cl_136_496883()  ----�I�k�������ˬd�дU�l����N���a�ǰe�X�Ӫ��ʧ@
	local headgear= OwnerID()
	local player = TargetID()
	CancelBuff( player , 508520 )  ----�M�����]�N���H��BUFF
	BeginPlot( headgear,"cl_chbuff_117260", 0 ) -----����N���a�Ǧ^���W���ʧ@
end
function cl_chbuff_117260() ---�N���a�ǰe�X��~�ˬd���W���S��BUFF�S�����ܸɤ@���ܨ��k�N�����a
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
	local randbuff = { 508522 , 508603 , 508646 }  ----��%�ߤl%�Q����BUFF
	local rbuff = 0
	xx = ReadRoleValue ( headgear, EM_RoleValue_X)
	yy = ReadRoleValue ( headgear, EM_RoleValue_Y)
	zz = ReadRoleValue ( headgear, EM_RoleValue_Z)   ---------Ū���]�N�U���y��
	if ReadRoleValue( player , EM_RoleValue_RoomID  ) == RoomID then
		SetPos( player , xx , yy , zz , 0 )  ----�N���a�ǰe���]�N�U����m
	end
	sleep ( 5 )
	if CheckBuff(  player , 508521 ) == true then ---�ˬd�O�_�������ߤl��BUFF
		CancelBuff_NoEvent( player , 508521 ) ---�M�������ߤl��BUFF  
		sysCastSpelllv ( headgear , headgear , 496884 , 0 ) ---�U�l�ۤv��t�@��
		--WriteRoleValue ( boss , EM_RoleValue_Register3 , 2 )
		sleep ( 5 )
	elseif CheckBuff(  player , 508521 ) == false then  ---�p�G���W�S�������ߤl��BUFF
		if ReadRoleValue( player , EM_RoleValue_IsDead ) ~= 1 then ----�ˬd���a�O�_�w�g���`
			rbuff = DW_Rand ( 3 )
			addbuff ( player , randbuff[rbuff] , 0 , -1 ) ----�����ܨ�
			xx1 = ReadRoleValue ( headgear, EM_RoleValue_X)
			yy2 = ReadRoleValue ( headgear, EM_RoleValue_Y)
			zz3 = ReadRoleValue ( headgear, EM_RoleValue_Z)   ---------Ū���]�N�U�����y��
			local ball = CreateObj( 105242 , xx, yy , zz , 0 , 1 )  ------------�ͥX�z���y
			SetModeEx( ball , EM_SetModeType_Strikback, false) ---����(�_)
			SetModeEx( ball , EM_SetModeType_Move, false) ---����	(�_)
			SetModeEx( ball , EM_SetModeType_Searchenemy, false)--����(�_)
			SetModeEx( ball , EM_SetModeType_Mark, true)			---�i�I��(�O)
			SetModeEx( ball , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
			SetModeEx( ball , EM_SetModeType_Fight, false) ---�i���(�O)
			SetModeEx( ball , EM_SetModeType_NotShowHPMP , true ) ----����ܼg��
			AddToPartition( ball,RoomID )
			WriteRoleValue( ball , EM_RoleValue_Livetime, 5 )  --�s���ɶ�
			BeginPlot( ball , "cl_136_105242ball" , 0 ) ----����S��BUFF���ܴN�������a�g�@,�z���y�I��30%AE
			--WriteRoleValue ( boss , EM_RoleValue_Register3 , 2 )
			sleep ( 5 )
		end
	end
	delobj( headgear )  ----�R���]�N�U
end
function cl_105208_dead() ----ù��ߪ����`�@���n�����a�@���ˬd��BUFF
	addbuff ( TargetID() , 508521 , 0 , -1 )  -----�������a�]�N�v���ݯd����BUFF
	delobj ( OwnerID() )  ----�R����ù��ߪ�����
end
function cl_136_105209_AI2() ---BOSS���}�԰��n�Ǩ�o��
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
function cl_105209_chack() ---�ˬdBOSS�O�_�Z���W�X�ж��קKBOSS�l�h���Q�ǤJ�U�l�������a
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID)  ------>�ڥhŪ������̭���PID�ȧi�DBOSS���O����ͥX�Ӫ�
	while 1 do
		sleep (20)
		local boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
		if ReadRoleValue( boss , EM_RoleValue_IsDead ) ==  0 then  ---�ˬdBOSS�O�_�w���`
			local oo = GetDistance( OwnerID(), boss );  ----�C�@��Ū���z���y�PBOSS���Z��
			if oo >= 600 then  ----�W�L600�X���ܴN����
				WriteRoleValue ( AI , EM_RoleValue_Register1 ,3 )  ----�i�����R3.�N����԰����m
			end
		elseif ReadRoleValue( boss , EM_RoleValue_IsDead ) ~=  0 then   ----�p�G�٨S���N�R���ۤv
			delobj ( OwnerID() )
		end
	end
end
function cl_105209_P() ----�U�l�̪�ù��߱���ˬdAI��stage�����O�h��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID)  ------>�ڥhŪ������̭���PID�ȧi�DBOSS���O����ͥX�Ӫ�
	while 1 do
		sleep (5)
		local stage = ReadRoleValue ( AI , EM_RoleValue_Register1 )  ----stage=1 �԰��}�l stage=2 BOSS���` stage=3 BOSS���}�԰����m
		if stage == 1 then
		elseif stage == 2 then
			cl_136_105209_AI2()  ----���`��ǰe�U�l�̩Ҧ����a��J�f�I
		elseif stage == 3 then
			cl_136_105209_AI2()  -----���}�԰���ǰe�U�l�̩Ҧ����a��J�f�I
		end
	end
end
function cl_136_105208() ---ù��ߪ�AI
	local rabbit = OwnerID() ----�ڥs��AI
	local RoomID = ReadRoleValue( rabbit , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	local skill = 0
	Addbuff (  rabbit , 508599 , 0 ,-1 ) ---���ۤv�W�@�ӫO�@�y~�n��10�U�~�|�}�y
	SetPlot( rabbit, "dead","cl_105208_dead", 0 )  ----�ߤl�����`�@��,�n���榺�`�ᵹ���ؼФ@���ˬd��BUFF
	while 1 do
		sleep ( 10 )
		skill = skill + 1
	end
end
function cl_496924() --�ˬd�d�򤺦��S���U�l
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
function cl_136_496926()  ---�줻�ӤH��P
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
		for i = 1 , 6 , 1 do ----��6�Ӫ��a
			Rand_Num = DW_Rand(hset)
			if hset >= 1 then
				table.insert( hset2_table , hset_table[Rand_Num] )  ---�N����쪺���a��J�@�ӷs��TABLE
				table.remove ( hset_table , Rand_Num )  ---���Ჾ�������Ӫ�
				hset=table.getn(hset_table) -----�M�᭫���@���ƶq
			end
		end
	end
	hset2 = table.getn(hset2_table)
	if hset2 >= 1 then
		for i = 1 , hset2 , 1 do
			x = ReadRoleValue (boss, EM_RoleValue_X)
			y = ReadRoleValue (boss, EM_RoleValue_Y)
			z = ReadRoleValue (boss, EM_RoleValue_Z)  ----Ū��BOSS�������y�Ц�m
			rand = Az_RND_Ary(-150,150,2)
			local boss2 = CreateObj ( 105204 , x+rand[1] , y+30 , z+rand[2] , 0 , 1) --�H���ۨ��P��ͩ�
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
			WriteRoleValue ( boss2 , EM_RoleValue_Register1 , hset2_table[i] ) ---�O���U�����������ؼ�
			WriteRoleValue ( boss2 , EM_RoleValue_Register2 , AI )
			--WriteRoleValue ( boss2 , EM_RoleValue_Livetime , 3 )
			BeginPlot( boss2,"cl_136_hset2_table", 0 )  ---��������缾�a�I��j�༳�J
			sleep ( 1 )
		end
	end
end
function cl_136_hset2_table() ---�����缾�a�I��ȵP�ޯ�
	local player = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 )
	CastSpelllv ( OwnerID() , player , 496926 , 5 )  ----�����w�ؼЪ��a�I��j�༳�J
	sleep ( 30 )---��3��
	delobj ( OwnerID() ) ---3���R���ۤv
end
function chbuff_508648() ---�Ѭy���ˬdBUFF�����ˬd�@��
	BeginPlot( TargetID() , "chbuff_508648_508649" , 0)
end
function chbuff_508648_508649() --�C���ˬdBUFF�b���b
	while 1 do
		if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead) == 1 or ReadRoleValue( OwnerID() , EM_RoleValue_IsPlayer) == 0 then
			break
		end
		if CheckBuff( OwnerID() , 508648 ) == false and CheckBuff( OwnerID() , 508648 ) == false then
			break
		end
		if ReadRoleValue( OwnerID() , EM_RoleValue_HP) >= ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP ) then  ------�p�G��eHP����̤jHP�h����
			CancelBuff_NoEvent( OwnerID() , 508648 ) ----�M�����y��BUFF
			CancelBuff_NoEvent( OwnerID() , 508649 ) ----�M�����y��BUFF
			break
		end
		sleep( 1 )
	end
end
function cl_117377_touch()  --Ĳ�I�@���n���}���e��t���_�Ǫ��ߤl�i�H�Q���aĲ�I---���a�n�h��_�Ǫ��ߤl
	local player = OwnerID()
	local headgear = TargetID()
	local AI = ReadRoleValue( headgear , EM_RoleValue_PID )
	--CastSpelllv ( player , headgear , 496928 , 0 )
	if	BeginCastBarEvent( player , headgear , "[SC_13604_09]" , 20 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END,0 , "cl_136_496928") ~=1	then
		ScriptMessage( player, player, 1,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
	end
end
function cl_496928() ---���a���\���ߤl���ܴN���ߤl����@��
	local headgear = OwnerID() --SC_13604_08
	local player  = TargetID()
	local AI = ReadRoleValue( headgear , EM_RoleValue_PID )
	BeginPlot( headgear , "cl_117377_rabbit" , 0)
end
function cl_117377_rabbit() --�_�Ǫ��ߤl��t�@�Ӫk�N�N�ۤv�ܤj��R���ۤv
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	StopMove( OwnerID() , false ) ----����_�Ǫ��ߤl������
	Addbuff (  OwnerID() , 508523 , 0 ,-1 ) ---�ߤl�ܤj
	CastSpelllv ( OwnerID() , OwnerID() , 496884 , 0 )
	sleep ( 10 )
	local showAI = ReadRoleValue ( AI , EM_RoleValue_Register5 )  ---Ū����������R5��e���ȬO�h��
	WriteRoleValue ( AI , EM_RoleValue_Register5 , showAI+1 ) -----�NŪ���쪺��+1�b�g�^�h��������R5
	WriteRoleValue ( AI , EM_RoleValue_Register6 , TargetID() ) ----�M��i���������O���Ӫ��a���ߤl��
	delobj ( OwnerID() )
end
function cl_136_rabbit() ---�_�Ǫ��ߤl�b���W�H���ö]
	local rabbit = OwnerID()
	local RoomID = ReadRoleValue( rabbit , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local AI = ReadRoleValue( rabbit , EM_RoleValue_PID )
	local fiag = 0
	SetPlot( rabbit, "touch","cl_117377_touch", 20 ) ------PlotType Ĳ�o���� (����"touch"Ĳ�I�B"range"�d��B"dead"���`�B"collision"�I���|��)
	while 1 do   ------�����԰��j��,�o�̭n�i�D���C�j�h�[�N�ˬd�@��
		sleep ( 10 )
		fiag = DW_Rand(30)  ---30���X���H����1
		WriteRoleValue( rabbit,EM_RoleValue_IsWalk,0)  ----�j��������ߤl�ζ]��
		Hide(rabbit) ----���F�X�Ы�~�n�O�o��HIDE�_��
		Show(rabbit,RoomID) ----�M��bSHOW�X��
		DW_MoveToFlag( rabbit , 780767 , fiag , 0 ) ----�H��Rand�X�l����
		sleep ( 10 )
	end
end
function cl_136_496928(Executer,Result) ---���յۧ���ߤl
	if	Result > 0 then --���\���A
		local oo = GetDistance( OwnerID() , TargetID() );
		if oo <= 40 then ----------------------------------------------------------------------------------------------------------�n�ק�^20
			EndCastBar(Executer,Result)--�M���I�k��
			BeginPlot( TargetID() , "cl_496928" , 0)
		else
			EndCastBar(Executer,-1)--�M���I�k��
			ScriptMessage( TargetID() , -1 , 2 ,"[SC_13604_10]" , 2 )----SHOW TIME �I��t�}�l�I
		end
	else --���Ѫ��A
		EndCastBar(Executer,Result)--�M���I�k��
	end
end
function cl_136_105242ball()  --��?
	CastSpelllv ( OwnerID() , OwnerID() , 496928 , 0 )  -----�o�O�֩�?
end
function cl_508603()
	if CheckBuff( TargetID() , 508646 ) == false and
		CheckBuff( TargetID() , 508603 ) == false and
		CheckBuff( TargetID() , 508991 ) == false and
		CheckBuff( TargetID() , 508522 ) == false then
		return true
	elseif CheckBuff( TargetID() , 508646 ) == true or
		CheckBuff( TargetID() , 508603 ) == true or
		CheckBuff( TargetID() , 508522 ) == true or
		CheckBuff( TargetID() , 508991 ) == true or
		ReadRoleValue( TargetID() , EM_RoleValue_VOC ) == 0 then
		return false
	end
end
function cl_136_opendoor_dead()
	local rabbit = OwnerID()
	local AI = ReadRoleValue ( rabbit , EM_RoleValue_PID )
	WriteRoleValue ( AI , EM_RoleValue_Register7, 1 )
end
function Cl_Z136_SetHate(Play_Table)
	local boss = OwnerID()
	local TempGID = 0
	local hateKey = 0
	for i = 1 , table.getn(Play_Table) , 1 do
		local hate_table = HateListCount( Play_Table[i] )
		for X = 0 , hate_table-1 do
			TempGID = HateListInfo( Play_Table[i] , X , EM_HateListInfoType_GItemID)
			if TempGID ~= TempGID then
			elseif TempGID == TempGID then
				hateKey = 1
				break
			end
		end
		if hateKey == 0 then
			SetHateListPoint( boss , Play_Table[i] , 10 )
		elseif hateKey == 1 then
			hateKey = 0
		end
	end
end
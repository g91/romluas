function Cl_Show_Stage()
	local Show_ctarlAI = OwnerID()
	local RoomID = ReadRoleValue ( Show_ctarlAI , EM_RoleValue_RoomID )
	local ctarlAI = ReadRoleValue ( Show_ctarlAI , EM_RoleValue_PID )
	local CrackID_Door = ReadRoleValue ( ctarlAI , EM_RoleValue_Register2 )
	local Npc_Table = {}
		Npc_Table["Big_Magic"] = 120216	--�d���p��
		Npc_Table["Magic"] = 120101		--��̤����k�v
		Npc_Table["Police"] = 120186		--120186
		Npc_Table["Big_PolicePolice"] = 120188--�گǦN
	local Show_Npc = {}
	local Police_Npc = {}
	local Magic_Npc = {}
	local Rand_Time = 0
	local FlagObjID = 781060
	local Dir_Table = {}
	local ShowTime_1 = 0
	local ShowTime_2 = 15
	local ShowTime_3 = 3
	local Rand = DW_Rand(30)  ---���H��TABLE����m
	local Rand_2 = DW_Rand(10)  ---���H��TABLE����m
	local Rand_3 = DW_Rand(10)  ---���H��TABLE����m
	local Rand_Npc = DW_Rand(4)  ---���H��TABLE����m
	local Rand_Flag = 0
	local CastSpell = 0
	local PlayMotion_Flag = 0
	local MonsterID = 106582
	local Monster = 0
	local CastSpell_Light = 0
	local Light_Ball = 0
	local Light_BallID = 120198
	local Light_BallID_2 = 120199
	local Light_Ball_3 = 0
	local Light_BallID_3 = 120204
	local Old_Magic_Npc = 0
	local Old_MagicID = 120201
	local Eric_Npc = 0
	local Eric_NpcID = 120205
	local HiDayton = 0
	local HiDaytonID = 120206
	local DelNpc_Table = {}   --
	local String_Table = {}
		String_Table[1] = "[SC_WBP3_SHOWNPC_01]" ---
		String_Table[2] = "[SC_WBP3_SHOWNPC_02]" ---�k�v: XXX���u�j�k�v�A�ڭ̲{�b�ӫ���?
		String_Table[3] = "[SC_WBP3_SHOWNPC_03]" ----�j�k�v: �u����Q��k�N��ʦL�_�ӡA���O�ʦL���覡�٤�����
		String_Table[4] = "[SC_WBP3_SHOWNPC_04]" ----�j�k�v: �����ڭ̹�ô����a���F���٤��h�A���L�¥۴������@���O�q
		String_Table[5] = "[SC_WBP3_SHOWNPC_05]" ----�j�k�v: �ڭ̤w�g�x��7-8���A�N�����Ѫk�v�N�̫᪺�ʦL�����Ѷ}
		String_Table[6] = "[SC_WBP3_SHOWNPC_06]" ----�k�v: ����ڭ̲{�b�వ���O.....?
		String_Table[7] = "[SC_WBP3_SHOWNPC_07]" ----�j�k�v:���Q��k���n�����_�b�~�򿱵ȤU�h�A�_�h�ô����a�����]���A�|���_��X
		String_Table[8] = "[SC_WBP3_SHOWNPC_08]" ----�k�v: ���L�P��̵M���\�h���쪺�����A�b�o��I�i�Ť大�O�A�~���̤��|����v�T��?
		String_Table[9] = "[SC_WBP3_SHOWNPC_09]" ----ĵ�ƶ�����: XXX���u�j�k�v�A���n�N��A�ڭ̻���F
		String_Table[10] = "[SC_WBP3_SHOWNPC_10]"  --�j�k�v: �S���Y�A��ӤZ��R�����{�����J�@�����W�A�ڤF�ѧA��ĵ�ƶ��H�⤣�������D
		String_Table[11] = "[SC_WBP3_SHOWNPC_11]"  ---ĵ�ƶ�����: �ثe�ڤ�W���H��N�ѤU�o�̡A�ڭ̲{�b�����W���򦣩O?
		String_Table[12] = "[SC_WBP3_SHOWNPC_12]"   ---�j�k�v: ���ЧA�̨�U�ڭ̡A���n�A���Z��R�������~���a��o��
		String_Table[13] = "[SC_WBP3_SHOWNPC_13]"   ---�j�k�v: �ӥB�{�b���_���򿱵ȡA�γ\�����|���ô����a���]���X���q���_���k�X
		String_Table[14] = "[SC_WBP3_SHOWNPC_14]"   ---�j�k�v: �����ٱo�ЧA�̫O�@�~��
		String_Table[15] = "[SC_WBP3_SHOWNPC_15]"   ---ĵ�ƶ�����: �n���A�ڭ̷|�ɤO�O�@�A�̪��w���H�Ϊ���~�����w��
		String_Table[16] = "[SC_WBP3_SHOWNPC_16]"   ---�j�k�v:���N�·ЧA�̤F
		String_Table[17] = "[SC_WBP3_SHOWNPC_17]"   ---ĵ�ƶ�����:�Ҧ��H�`�N��o��!!(���ܰʧ@)
		String_Table[18] = "[SC_WBP3_SHOWNPC_18]"   ---ĵ�ƶ�����:�ݷ|�ڭ̭t�d�O�@��̤����k�v���w��
		String_Table[19] = "[SC_WBP3_SHOWNPC_19]"   ---ĵ�ƶ�����:�p�G�������a�񪺸ܡA���F�w���_���A�i���X�����ʧ@
		String_Table[20] = "[SC_WBP3_SHOWNPC_20]"   ---ĵ�ƶ�����:�Ҧ��H���F�ѤF��?(�����e�i���ʧ@)
		String_Table[21] = "[SC_WBP3_SHOWNPC_21]"   ---����:���F�ѤF(�q§�ʧ@)
		String_Table[22] = "[SC_WBP3_SHOWNPC_22]"   ---ĵ�ƶ�����:���Ҧ��H�U�ۨ�ۤv���^��W�A�Z��R�������w�M�N�浹�A�̤F
		String_Table[23] = "[SC_WBP3_SHOWNPC_23]"   ---����:�O!!
		String_Table[24] = "[SC_WBP3_SHOWNPC_24]"   ---�j�k�v:���_�����X�i�ۡA�ڭ̥��յ������_�����X�i
		String_Table[25] = "[SC_WBP3_SHOWNPC_25]"   ---�j�k�v:�ǳƦn�A���O�n�ߦp���
		String_Table[26] = "[SC_WBP3_SHOWNPC_26]"   ---�k�v:�ǳƦn�F!
		String_Table[27] = "[SC_WBP3_SHOWNPC_27]"   ---�j�k�v:�٬O�����H������_�X�i��?
		String_Table[28] = "[SC_WBP3_SHOWNPC_28]"   ---�j�k�v:�𮧤@�|��A�����A�ӹL
		String_Table[29] = "[SC_WBP3_SHOWNPC_29]"   ---�k�v:�ڦn�h�F�A�ڭ��~��a
		String_Table[30] = "[SC_WBP3_SHOWNPC_30]"   ---�k�v:��!�@�@�@�@�@�@
		String_Table[31] = "[SC_WBP3_SHOWNPC_31]"   ---���r�s��:���_��M�ֳt���ȡA�@�Ѩ��c����q���o�X��
		String_Table[32] = "[SC_WBP3_SHOWNPC_32]"   ---ĵ�ƶ���:�M�I!!
		String_Table[33] = "[SC_WBP3_SHOWNPC_33]"   ---ĵ�ƶ���:�Ѩ�!�o�O���򰭪F��
		String_Table[34] = "[SC_WBP3_SHOWNPC_34]"   ---ĵ�ƶ���:�A�̨S�Ƨa?
		String_Table[35] = "[SC_WBP3_SHOWNPC_35]"   ---�k�v:___���u!!!
		String_Table[36] = "[SC_WBP3_SHOWNPC_36]"   ---ĵ�ƶ���:___���u���F
		String_Table[37] = "[SC_WBP3_SHOWNPC_37]"   ---�k�v:___���u�|���𮧡A�L���ӥu�O���L�h�F
		String_Table[38] = "[SC_WBP3_SHOWNPC_38]"   ---ĵ�ƶ���:�Ӥ@�ӱN___���u���a�U�h��
		String_Table[39] = "[SC_WBP3_SHOWNPC_39]"   ---ĵ�ƶ���:�o���_���G�S�ܱo��j�F�A�o�U�V�ӶV�M�I�F
		String_Table[40] = "[SC_WBP3_SHOWNPC_40]"   ---�k�v:��~�Үg�U�����ɤ]�}�l�Y�a
		String_Table[41] = "[SC_WBP3_SHOWNPC_41]"   ---�k�v:�o�U�Ӧp��O�n�A�u�O�O�H�Y�k...
		String_Table[42] = "[SC_WBP3_SHOWNPC_42]"   ---�j�]�k���s��:�¤����_�w�g�L�k�����F�A�ϥβ{�����Ť�޳N
		String_Table[43] = "[SC_WBP3_SHOWNPC_43]"   ---�j�]�k���s��:�w�g�L�k���¤����_�����_��
		String_Table[44] = "[SC_WBP3_SHOWNPC_44]"   ---ĵ�ƶ���:���o�˸ӫ���A�`�������L�@���o�ˤU�h
		String_Table[45] = "[SC_WBP3_SHOWNPC_45]"   ---ĵ�ƶ���:�`�O�o�Q�Q��k���r
		String_Table[46] = "[SC_WBP3_SHOWNPC_46]"   ---�j�]�k���s��:�ڲ{�b�n���s�[�c�s���Ť�k�}�A���Lí�w�U��
		String_Table[47] = "[SC_WBP3_SHOWNPC_47]"   ---�j�]�k���s��:���O�o�ǻݭn�A�̪���U
		String_Table[48] = "[SC_WBP3_SHOWNPC_48]"   ---�k�v:�n���A�ڭ̷|�ɤO��
		String_Table[49] = "[SC_WBP3_SHOWNPC_49]"   ---�j�]�k���s��:���O���O�o�˥u�Oí�w�U�ӬO�������A�ݭn���H�i�J���_���A����̲`�h���O�q�ӷ�
		String_Table[50] = "[SC_WBP3_SHOWNPC_50]"   ---ĵ�ƶ���:�̲`�h���O�q�ӷ�??
		String_Table[51] = "[SC_WBP3_SHOWNPC_51]"   ---�j�]�k���s��:�H�x�g���P���ߪ������洵�A���m�W���O���S�����ܡA���ӳ̲`�h���O�q�ӷ��N�O�L
		String_Table[52] = "[SC_WBP3_SHOWNPC_52]"   ---�j�]�k���s��:�ڥ��N���_�̳q�����Ŷ����q�Dí�w�U�ӡA�n���A�̥i�H���w���q�L
		String_Table[53] = "[SC_WBP3_SHOWNPC_53]"   ---�j�]�k���s��:�o�q�ɶ��A�A�N�ɧ֩۶��H���A�i�J�q�D���A�d�z"�����洵"
		String_Table[54] = "[SC_WBP3_SHOWNPC_54]"   ---ĵ�ƶ���:�n�A�ڳo�N���W�h�A�A�̤d�U�n�p��
		String_Table[55] = "[SC_WBP3_SHOWNPC_55]"   ---�n�a�A���ڭ̶}�l�a
		String_Table[56] = "[SC_WBP3_SHOWNPC_56]"   ---�·t���O�q����í�w�U�A���·t���`�B�S�X�{�F�s���z�Z
		String_Table[57] = "[SC_WBP3_SHOWNPC_57]"   ---���ӥi�H�F�A�q�D�w�g���\�}�ҡA���O�٬O�n�����[���
		String_Table[58] = "[SC_WBP3_SHOWNPC_58]"   ---�j���ѡA�ڤH���w�g�۶��n�F
		String_Table[59] = "[SC_WBP3_SHOWNPC_59]"   ---���F��ߧJ��s�ΡA�H�ή����y�u�K�ΥH�~�A�ٷ|���q�U�a�Ӫ��_�I�̨̭�U�ڭ�
		String_Table[60] = "[SC_WBP3_SHOWNPC_60]"   ---�ڭ��H�ɳ��i�H�X�o
		String_Table[61] = "[SC_WBP3_SHOWNPC_61]"   ---���ݷ|�A�̻P___�����@�P�i�J�����ô����a�P�~���s���A���n���ɭԨ�U�L�̺M�h
		String_Table[62] = "[SC_WBP3_SHOWNPC_62]"   ---���ڷ|�b�~�������q�D��í�w�A�n���A�̥i�H�w������^
		String_Table[63] = "[SC_WBP3_SHOWNPC_63]"   ---�F�ѤF
		String_Table[64] = "[SC_WBP3_SHOWNPC_64]"   ---___�����A�ڭ̦�O�J��s�Τw�g�ǳƦn�F
		String_Table[65] = "[SC_WBP3_SHOWNPC_65]"   ---___�����A�����ޤu�K�Τ]�ǳƦn�F
		String_Table[66] = "[SC_WBP3_SHOWNPC_66]"   ---ĵ�ƶ����`�N
		String_Table[67] = "[SC_WBP3_SHOWNPC_67]"   ---�ݷ|��ڤ@�P�i�J�ô����a�A�̭��D�`�M�I
		String_Table[68] = "[SC_WBP3_SHOWNPC_68]"   ---�ҥH�����A�̦ۤv�M�w�A���֭n�h��?
		String_Table[69] = "[SC_WBP3_SHOWNPC_69]"   ---___�����A�ڭ̥i�H�ۤv�^��
		String_Table[70] = "[SC_WBP3_SHOWNPC_70]"   ---�n!���ڭ̷ǳƥX�o
		String_Table[71] = "[SC_WBP3_SHOWNPC_71]"   ---___���ѡA�ڭ��H�ɥi�H�ʨ��F
		String_Table[72] = "[SC_WBP3_SHOWNPC_72]"   ---�n�A���A�̥��i�J�إߨ��u�A���n���ô����a���]����L�q�D
		String_Table[73] = "[SC_WBP3_SHOWNPC_73]"   ---�̭���"�����洵"�N���_�I�̭̥h�A���O�Z�Ƥp��
		String_Table[74] = "[SC_WBP3_SHOWNPC_74]"   ---�n�A���ڭ̴N���X�o�F!!
	--���ͤj�k�v
	local Big_Magic_Npc = cl_ObjShowNpc( Npc_Table["Big_Magic"],FlagObjID,50)
		Cl_MoveToFlag( Big_Magic_Npc , FlagObjID , 60 , 0 , 1 )
		say ( Big_Magic_Npc , String_Table[1] )
		PlayMotion ( Big_Magic_Npc , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	--�O�����V�H
	Dir_Table[1] = ReadRoleValue ( Big_Magic_Npc , EM_RoleValue_Dir )
	sleep ( 30 )
	for i = 1 , 4 , 1 do
		--���ͥ|����̤����k�v�ðO���_��
		Magic_Npc[i] = cl_ObjShowNpc( Npc_Table["Magic"],FlagObjID,50+i)
		if i == 1 then
			--�Ĥ@�����V�e
			Cl_MoveToFlag( Magic_Npc[i] , FlagObjID , 60+i , 0 , 1 )
		else
			--�䥦�T�����ʨ�X�l
			CallPlot( Magic_Npc[i], "Cl_MoveToFlag_for", 60+i )
		end
	end
	
		say ( Magic_Npc[1] , String_Table[2] )
		PlayMotion ( Magic_Npc[1] , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		AdjustFaceDir( Big_Magic_Npc , Magic_Npc[1] , 0 )
		sleep ( 30 )
		PlayMotion ( Big_Magic_Npc , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )

	for i = 3 , 5 , 1 do
		say (Big_Magic_Npc , String_Table[i] )
		sleep ( 40 )
	end

		say (Magic_Npc[1] , String_Table[6] )
		PlayMotion ( Magic_Npc[1] , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		sleep ( 30 )
		say (Big_Magic_Npc ,String_Table[7] )
		PlayMotion ( Big_Magic_Npc , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		sleep ( 30 )
		say (Magic_Npc[1] , String_Table[8])
		sleep ( 40 )

	for i = 1 , 4 , 1 do
		--���ͥ|���u�æV�e
		Police_Npc[i] = cl_ObjShowNpc( Npc_Table["Police"],FlagObjID,50+i)
		CallPlot( Police_Npc[i], "Cl_MoveToFlag_for", 70+i )
	end

	sleep ( 10 )
		--���ͤڦN��
	local Big_Police_Npc = cl_ObjShowNpc( Npc_Table["Big_PolicePolice"],FlagObjID,50)
		Cl_MoveToFlag( Big_Police_Npc , FlagObjID , 70 , 0 , 0 )
		say ( Big_Police_Npc , String_Table[9] )
		AdjustFaceDir( Big_Magic_Npc , Big_Police_Npc , 0 )
		sleep ( 30 )
	for i = 1 , 4 , 1 do
		Dir_Table[i+1] = ReadRoleValue ( Magic_Npc[i] , EM_RoleValue_Dir )
		AdjustFaceDir( Magic_Npc[i] , Big_Police_Npc , 0 )
	end
		sleep ( 20 )
		say ( Big_Magic_Npc ,String_Table[10] )
		sleep ( 30 )
		say ( Big_Police_Npc ,String_Table[11] )
		sleep ( 30 )
	for i = 12 , 14 , 1 do
		say ( Big_Magic_Npc ,String_Table[i] )
		sleep ( 30 )
	end
		say ( Big_Police_Npc ,String_Table[15] )
		sleep ( 30 )
		PlayMotion ( Big_Magic_Npc , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
		say ( Big_Magic_Npc ,String_Table[16] )
		sleep ( 30 )
		SetDir( Big_Magic_Npc , Dir_Table[1] )
	for i = 1 , 4 , 1 do
		SetDir( Magic_Npc[i] , Dir_Table[i+1] )
	end
		sleep ( 10 )
		SetDir( Big_Police_Npc , Dir_Table[1]-180 )
		sleep ( 20 )
	for i = 17 , 20 , 1 do
		if i == 17 then
			PlayMotion ( Big_Police_Npc , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
			sleep ( 10 )
			for i = 1 , 4 , 1 do
				AdjustFaceDir( Police_Npc[i] , Big_Police_Npc , 0 )
			end
		elseif i == 20 then
			PlayMotion ( Big_Police_Npc , ruFUSION_ACTORSTATE_EMOTE_POINT )
		end
		say ( Big_Police_Npc ,String_Table[i] )
		sleep ( 30 )
	end
	for i = 1 , 4 , 1 do
		PlayMotion ( Police_Npc[i] , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
		say ( Police_Npc[i] ,String_Table[21] )
	end
		sleep ( 20 )
		say ( Big_Police_Npc ,String_Table[22] )
		PlayMotion ( Big_Police_Npc , ruFUSION_ACTORSTATE_EMOTE_APPROVAL )
		sleep ( 20 )
	for i = 1 , 4 , 1 do
		say ( Police_Npc[i] ,String_Table[23] )
	end
	for i = 1 , 4 , 1 do
		CallPlot( Police_Npc[i], "Cl_MoveToFlag_for", 80+i )
	end
	--
	while 1 do
		sleep ( 10 )
		if ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 1 then
			ShowTime_1 = ShowTime_1 + 1
			ShowTime_2 = ShowTime_2 + 1
			if ShowTime_1 >= Rand + 15 then
				Rand_Flag = DW_Rand(4)
				Cl_Police_Npc_Expelled(FlagObjID,Rand_Flag,Police_Npc[Rand_Flag])
				Rand = DW_Rand(30)  ---���H��TABLE����m
				ShowTime_1 = 0
			end
			if ShowTime_2 >= Rand_2 +15 then
				if CastSpell == 0 then
					say ( Big_Magic_Npc ,String_Table[24] )
					CastSpell = 1
				elseif CastSpell == 1 then
					say ( Magic_Npc[Rand_Npc]  ,String_Table[29] )
					PlayMotion ( Magic_Npc[Rand_Npc] , ruFUSION_ACTORSTATE_CROUCH_END )
					sleep ( 10 )
				end
				for i = 1 , 5 , 1 do
					if i == 5 then
						AdjustFaceDir( Big_Magic_Npc , CrackID_Door , 0 )
					else
						AdjustFaceDir( Magic_Npc[i] , CrackID_Door , 0 )
					end
				end
				sleep ( 20 )
				say ( Big_Magic_Npc ,String_Table[25] )
				sleep ( 10 )
				for i = 1 , 4 , 1 do
					say ( Magic_Npc[i] ,String_Table[26] )
				end
				sleep ( 10 )
				for i = 1 , 5 , 1 do
					if i == 5 then
						CastSpelllv ( Big_Magic_Npc , CrackID_Door , 498925 , 0 ) 
						Addbuff (  CrackID_Door , 621746 , 0 , 3 ) 
					else
						CastSpelllv ( Magic_Npc[i] , CrackID_Door , 498925 , 0 ) 
					end
				end
				if CastSpell_Light == 0 then
					Light_Ball = Cl_CreateObjByFlag( Light_BallID , FlagObjID , 10 , RoomID ) ---��t�����
					CastSpell_Light = 1
				end				
				sleep ( 40 )
				Rand_Npc = DW_Rand(4)
				CastSpelllv ( Magic_Npc[Rand_Npc] , Magic_Npc[Rand_Npc] , 498923 , 0 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
				say ( Magic_Npc[Rand_Npc] , String_Table[30] )
				PlayMotion ( Magic_Npc[Rand_Npc] , ruFUSION_ACTORSTATE_CROUCH_BEGIN )
				sleep ( 10 )
				SetIdleMotion( Magic_Npc[Rand_Npc] , ruFUSION_ACTORSTATE_CROUCH_LOOP )----------------------�����ʧ@  589651
				for i = 1 , 5 , 1 do
					if i ~= Rand_Npc and i ~= 5 then
						AdjustFaceDir( Magic_Npc[i] , Magic_Npc[Rand_Npc] , 0 )
					elseif i == 5 then
						AdjustFaceDir( Big_Magic_Npc , Magic_Npc[Rand_Npc] , 0 )
					end
				end
				say ( Big_Magic_Npc ,String_Table[27] )
				sleep ( 20 )
				PlayMotion ( Big_Magic_Npc , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
				say ( Big_Magic_Npc ,String_Table[28] )
				Rand_2 = DW_Rand(10)  ---���H��TABLE����m
				ShowTime_2 = 0
			end
		elseif  ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 2 then
			if PlayMotion_Flag == 0 then
				ScriptMessage( ctarlAI , -1 , 2 , String_Table[31] , 2 ) 
				PlayMotion ( Magic_Npc[Rand_Npc] , ruFUSION_ACTORSTATE_CROUCH_END )
				Addbuff (  CrackID_Door , 621745 , 0 , -1 ) 
				PlayMotion_Flag = 1
				Monster = cl_ObjShowNpc( MonsterID , FlagObjID , 10 ) 
				CastSpelllv ( Monster , Monster , 498922 , 0 ) 
				for i = 1 , 4 , 1 do
					Addbuff (  Magic_Npc[i] , 621743 , 0 , 1 ) 
					say ( Magic_Npc[i] , String_Table[30] )
				end
				PlayMotion ( Big_Magic_Npc , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )
				sleep ( 5 )
				SetIdleMotion( Big_Magic_Npc , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )----------------------�����ʧ@  589651
				delobj ( Light_Ball )
				Cl_MoveToFlag( Monster , FlagObjID , 100 , 0 , 0 )
				say ( Big_Police_Npc , String_Table[32] )
				CastSpelllv ( Big_Police_Npc , Monster , 498921 , 0 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
				sleep ( 10 )
				killid ( Big_Police_Npc , Monster )
				for i = 1 , 4 , 1 do
					AdjustFaceDir(  Magic_Npc[i] , Big_Magic_Npc , 0 )
					say ( Magic_Npc[i] , String_Table[35] )
				end
				sleep ( 20 )
				say ( Big_Police_Npc , String_Table[33] )
				sleep ( 30 )
				AdjustFaceDir( Big_Police_Npc , Big_Magic_Npc , 0 )
				say ( Big_Police_Npc , String_Table[34] )
				sleep ( 20 )
				say ( Big_Police_Npc , String_Table[36] )
				sleep ( 30 )
				say ( Magic_Npc[1] , String_Table[37] )
				sleep ( 30 )
				say ( Big_Police_Npc , String_Table[38] )
				sleep ( 20 )
				Cl_MoveToFlag( Police_Npc[1] , FlagObjID , 101 , 0 , 0 )
				PlayMotion ( Police_Npc[1] , ruFUSION_ACTORSTATE_CROUCH_BEGIN )
				sleep ( 20 )
				delobj ( Big_Magic_Npc )
				PlayMotion ( Police_Npc[1] , ruFUSION_ACTORSTATE_CROUCH_END )
				sleep ( 10 )
				Cl_MoveToFlag( Police_Npc[1] , FlagObjID , 102 , 0 , 0 )
				delobj ( Police_Npc[1] )
				table.remove ( Police_Npc , 1 )
				say ( Big_Police_Npc , String_Table[39] )
				AdjustFaceDir(  Big_Police_Npc , CrackID_Door , 0 )
				for i = 1 , 4 , 1 do
					AdjustFaceDir(  Magic_Npc[i] , CrackID_Door , 0 )
				end
				sleep ( 30 )
				say ( Magic_Npc[1] , String_Table[40] )
				sleep ( 20 )
				say ( Magic_Npc[1] , String_Table[41] )
				sleep ( 20 )
				Old_Magic_Npc = cl_ObjShowNpc( Old_MagicID , FlagObjID , 102 )
				say ( Old_Magic_Npc , String_Table[42] )
				sleep ( 20 )
				say ( Old_Magic_Npc , String_Table[43] )
				Cl_MoveToFlag( Old_Magic_Npc , FlagObjID , 60 , 0 , 1 )
				AdjustFaceDir(  Old_Magic_Npc , Big_Police_Npc , 0 )
				say ( Big_Police_Npc , String_Table[44] )
				AdjustFaceDir(  Big_Police_Npc , Old_Magic_Npc , 0 )
				sleep ( 30 )
				say ( Big_Police_Npc , String_Table[45] )
				sleep ( 30 )
				say ( Old_Magic_Npc , String_Table[46] )
				sleep ( 30 )
				say ( Old_Magic_Npc , String_Table[47] )
				for i = 1 , 4 , 1 do
					say ( Magic_Npc[i] , String_Table[48] )
				end
				sleep ( 30 )
				say ( Old_Magic_Npc , String_Table[49] )
				sleep ( 30 )
				say ( Big_Police_Npc , String_Table[50] )
				sleep ( 30 )
				say ( Old_Magic_Npc , String_Table[51] )
				sleep ( 30 )
				say ( Old_Magic_Npc , String_Table[52] )
				sleep ( 30 )
				say ( Old_Magic_Npc , String_Table[53] )
				sleep ( 30 )
				say ( Big_Police_Npc , String_Table[54] )
				sleep ( 20 )
				Cl_MoveToFlag( Big_Police_Npc , FlagObjID , 50 , 0 , 0 )
				delobj ( Big_Police_Npc )
				AdjustFaceDir(  Old_Magic_Npc , CrackID_Door , 0 )
				say ( Old_Magic_Npc , String_Table[55] )
				for i = 1 , 4 , 1 do
					AdjustFaceDir(  Magic_Npc[i] , CrackID_Door , 0 )
				end
			end
			ShowTime_3 = ShowTime_3 + 1
			if ShowTime_3 >= 3 then
				CastSpelllv ( Old_Magic_Npc , Old_Magic_Npc , 498925 , 0 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
				for i = 1 , 4 , 1 do
					CastSpelllv ( Magic_Npc[i] , Magic_Npc[i] , 498925 , 0 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
				end
				if CastSpell_Light == 1 then
					Light_Ball = Cl_CreateObjByFlag( Light_BallID_2 , FlagObjID , 10 , RoomID ) ---��t�����
					CastSpell_Light = 2
				end
				ShowTime_3 = 0
			end
		elseif ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 3 then   ---�ϥΨ��110�H��
			if PlayMotion_Flag == 1 then
				Addbuff (  CrackID_Door , 621744 , 0 , -1 )
				ScriptMessage( CrackID_Door , -1 , 2 , String_Table[56] , 2 ) ----�}������
				Big_Police_Npc = cl_ObjShowNpc( Npc_Table["Big_PolicePolice"],FlagObjID,110)
				Cl_MoveToFlag( Big_Police_Npc , FlagObjID , 111 , 0 , 0 )
				say ( Big_Police_Npc , String_Table[57] )
				AdjustFaceDir(  Old_Magic_Npc , Big_Police_Npc , 0 )
				for i = 1 , 4 , 1 do
					AdjustFaceDir(  Magic_Npc[i] , Big_Police_Npc , 0 )
				end
				sleep ( 20 )
				for i = 58 , 60 , 1 do
					say ( Big_Police_Npc , String_Table[i] )
					sleep ( 20 )
				end
				AdjustFaceDir(  Old_Magic_Npc , Magic_Npc[1] , 0 )
				for i = 61 , 62 , 1 do
					say ( Old_Magic_Npc , String_Table[i] )
					sleep ( 20 )
				end
				for i = 1 , 4 , 1 do
					say ( Magic_Npc[i] , String_Table[63] )
				end
				sleep ( 20 )
				Eric_Npc = cl_ObjShowNpc( Eric_NpcID,FlagObjID,120)
				HiDayton = cl_ObjShowNpc( HiDaytonID,FlagObjID,130)
				Cl_MoveToFlag( Eric_Npc , FlagObjID , 121 , 0 , 1 )
				Cl_MoveToFlag( HiDayton , FlagObjID , 131 , 0 , 1 )
				say ( Eric_Npc , String_Table[64] )
				sleep ( 10 )
				say ( HiDayton , String_Table[65] )
				sleep ( 20 )
				AdjustFaceDir(  Big_Police_Npc , Police_Npc[1] , 0 )
				say ( Big_Police_Npc , String_Table[66] )
				for i = 1 , 3 , 1 do
					AdjustFaceDir(  Police_Npc[i] , Big_Police_Npc , 0 )
				end
				sleep ( 20 )
				for i = 67 , 68 , 1 do
					say ( Big_Police_Npc , String_Table[i] )
					sleep ( 20 )
				end
				say ( Police_Npc[3] , String_Table[69] )
				sleep ( 20 )
				say ( Big_Police_Npc , String_Table[70] )
				sleep ( 20 )
				AdjustFaceDir(  Big_Police_Npc , Old_Magic_Npc , 0 )
				sleep ( 10 )
				say ( Big_Police_Npc , String_Table[71] )
				sleep ( 20 )
				for i = 72 , 73 , 1 do
					say ( Old_Magic_Npc , String_Table[i] )
					sleep ( 20 )
				end
				say ( Big_Police_Npc ,  String_Table[74] )
				AdjustFaceDir(  Old_Magic_Npc , CrackID_Door , 0 )
				sleep ( 20 )
				Cl_MoveToFlag( Big_Police_Npc , FlagObjID , 10 , 0 , 0 )
				delobj ( Big_Police_Npc )
				for i = 1 , 3 , 1 do
					CallPlot( Police_Npc[i], "Cl_MoveToFlag_for", 10 )
					delobj ( Police_Npc[i] )
				end
				sleep ( 10 )
				for i = 1 , 4 , 1 do
					CallPlot( Magic_Npc[i], "Cl_MoveToFlag_for", 10 )
					delobj ( Magic_Npc[i] )
				end
				Cl_MoveToFlag( Eric_Npc , FlagObjID , 10 , 0 , 0 )
				delobj ( Eric_Npc )
				Cl_MoveToFlag( HiDayton , FlagObjID , 10 , 0 , 0 )
				delobj ( HiDayton )
				PlayMotion_Flag = 2
			end
			ShowTime_3 = ShowTime_3 + 1
			if ShowTime_3 >= 3 then
				CastSpelllv ( Old_Magic_Npc , Old_Magic_Npc , 498925 , 0 ) 
				ShowTime_3 = 0
			end
		elseif ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 4 then
			delobj ( Light_Ball )
			delobj ( Old_Magic_Npc )
			return	--�����o��function
--			ShowTime_3 = ShowTime_3 + 1
--			if ShowTime_3 >= 3 then
--				CastSpelllv ( Old_Magic_Npc , Old_Magic_Npc , 498925 , 0 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
--				ShowTime_3 = 0
--			end
--		elseif ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 5 then
--			delobj ( Light_Ball )
--			delobj ( Old_Magic_Npc )
		end
	end
end
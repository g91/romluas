--====================================================================================================
--�b����422840���ȫ�A���ݨ��o�t�i�h�����n���~(543542)�A�}�Ҫi�h�̪�client script�C
--�b�]�ĺ��ɴN�N�L�̪�pid�ȳ]�w�n   [113947]�c�Ժ�=1  [113956]�P�պ�=2  [113957]�U�k�ĺ�=3  [113958]�M�l�ĺ�=4
--���`�������٥��ȡA������422841�����ȮɡA��ݨ��o�t�i�h(543542)�@�ֵ��Ⱥ�(�b422840���ȱo)�A�N�ݤ������F���i�h�F
--���n���~[543467]�бШȺ����C�w
--====================================================================================================

function LuaS_422840_113956_0()			--���b�c�Ժ����W����l�@��
	Setplot(OwnerID(),"range","LuaS_422840_113956_1",100)	
end

function LuaS_422840_113956_1()
	Beginplot(TargetID(),"LuaS_422840_113956_2",0)
end

function LuaS_422840_113956_2()
	Setplot(OwnerID(),"range","",0)	
--	Say(OwnerID(),"0..02")
--	Say(TargetID(),"T_T2")

	Local S1= (OwnerID())
	local NPC =SearchRangeNPC ( S1 , 200 )				--�j�M�c�Ժ����� 100�d�򤺪�npc�A��Jnpc���}�C��
	
	local S2	
	local S3
	local S4

	for i=0,table.getn(NPC),1 do
		if ReadRoleValue(NPC[i], EM_RoleValue_PID ) == 113956 then
			S2= NPC[i]	--�P�պ�
		end
		if ReadRoleValue(NPC[i], EM_RoleValue_PID ) == 113957 then
			S3= NPC[i]	--�U�k�ĺ�
		end
		if ReadRoleValue(NPC[i], EM_RoleValue_PID ) == 113958 then
			S4= NPC[i]	--�M�l�ĺ�
		end
	end
		

		Yell(S4,  "[SC_422840_0]", 3 )		--�M�l�ĺ��G�̮R�����n���F�A�۱q�H���}�ҸT�����A���F���O�q�N�}�l�V�ð_�ӡK�K
		PlayMotion(S4,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Sleep(30)

		Yell(S1,  "[SC_422840_1]", 3 )		--�c�Ժ��G�äF�B���äF�աI�کԧJ���b�A�����������äC�K�V�F�K�O�d���a���@�w�O�o��F�I
		PlayMotion(S1,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Sleep(30)

		Yell(S2,  "[SC_422840_2]", 3 )		--�P�պ��G���F�B���J�F�o�I���l�̪����ˬW�@�U�U�_���A�@�U�U�Q�����K�K���j�������߱�ڭ̤F�ܡH
		PlayMotion(S2,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Sleep(40)

		Yell(S3, "[SC_422840_3]", 3 )		--�U�k�ĺ��G�a�F�B���a�F�r�I�ڭ̧��l�{�b�s�n�ͤ��N���������K�K�j�j�����F�O�q�q�ӨS�o������L�r�I
		PlayMotion(S3,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Sleep(40)

		Yell(S4,  "[SC_422840_4]", 3)		--�M�l�ĺ��G�V�F�B���V�F�ڡI���F���O�q���M�æ��@�ΡA�٦P�ɦb�|����ʡK�K�A�o�ˤU�h�A�|�o�ͤ���ơA�s�ڳ������Q�ڡI
		PlayMotion(S4,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Sleep(40)

		Yell(S1,  "[SC_422840_5]", 3 )		--�c�Ժ��G���O�کԧJ�Q�H���a���~�|�o�˪��I�a���ڡI�Ю���ڡI
		PlayMotion(S1,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Sleep(30)

		Yell(S2, "[SC_422840_6]", 3 )		--�P�պ��G�@�w�O���ǤH����ż�F�کԧJ�A�o�i�O�j�j�������ڡI�i�h�n���J�աI
		PlayMotion(S2,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		PlayMotion(S3,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Sleep(30)

		Yell(S2, "[SC_422840_9]", 3 )		--�P�պ��G��z�z~~���`�N�b���e�ڡI�I�I
		PlayMotion(S2,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Sleep(10)

		Yell(S4, "[SC_422840_10]", 3 )		--�M�l�ĺ��G�U���ĺ��̡A���R�@�R�B�R�@�R�I
		PlayMotion(S4,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Sleep(30)

		Yell(S4,  "[SC_422840_11]", 3 )		--�M�l�ĺ��G�A�̳o�˧n�A�̮R�����n���F���ť�o�M���ڭ̦b������O�H
		PlayMotion(S4,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Sleep(20)

		AdjustFaceDir( S1 , TargetID() ,3 )
		Yell(S1, "[SC_422840_12]", 3 )		--�c�Ժ��G�ڰO�_�ӤF�A�N�O�o�ӫ_�I�̮����کԧJ���I
		PlayMotion(S1,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Sleep(30)

		Yell(S2, "[SC_422840_13]", 3 )		--�P�պ��G���N�������کԧJ�Q�a���I
		PlayMotion(S2,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Sleep(30)

		Yell(S3,  "[SC_422840_14]", 3 )		--�U�k�ĺ��G�کԧJ��|�{�P�o�ӫ_�I�̩O?
		PlayMotion(S3,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Sleep(20)

		Yell(S4,  "[SC_422840_15]", 3 )		--�M�l�ĺ��G�u�u��U��A�o�O�ѷN�A�O�ǥL�H�o�C
		PlayMotion(S4,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Sleep(150)

	Setplot(OwnerID(),"range","LuaS_422840_113956_1",100)	
end



--=======================================================================
--422845  ���h�c�����լd
--�|�����J[113945]�X�l[780496]
--���n���~[543543]�|�����J���n�D
--CLIENT:����������422844���~�ݱo��إX���|�����J
--=======================================================================

function LuaS_422844_3()  --���b����422844����AOwnerID�O�̮R
	
			DisableQuest( OwnerID(), true)					--���̮R������Ĳ�I�@��
			AddBuff( TargetID()  , 503977 , 1 , 300 ) 				--����a
			local Rufri = Lua_DW_CreateObj("flag" ,113945,780496,1) 			--�إX�|�����J
			DW_MoveToFlag(Rufri,780496,2,0,1)					--�|�����J�N�t���w��

			AdjustFaceDir(Rufri,OwnerID(),0)
			Yell(Rufri,"[SC_422844_4]",3)				--�|�����J�G�k�h�A��p���_�p������p���A����ƻݭn�p��U�C
			Sleep(30)

			AdjustFaceDir(OwnerID(),Rufri,0)
			Yell(OwnerID(),"[SC_422844_5]", 3 )			--�̮R�����G�O����ƩO�H
			Sleep(20)

			Yell(Rufri,"[SC_422844_6]", 3 )				--�|�����J�G��I�d�����R�S�ת��X�Y�A�o���ܤF�C
			PlayMotion( Rufri ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
			Sleep(30)

			Yell(OwnerID(),"[SC_422844_7]", 3 )			--�̮R�����G�d���ͩʬ���A���ӬO�h����C���ѤF�ɶ��A���[�N�|�^�ӤF�a�C
			PlayMotion(OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
			Sleep(30)

			Yell(Rufri,"[SC_422844_8]", 3 )				--�|�����J�G�k�h�]���D�A��~�D�H�U�ӷU�s���A�ڤ��˴X�饼����o�A�N�Ȧo�Q���ǳD�H���F�C
			PlayMotion( Rufri ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)	--�q��x
			Sleep(30)

			Yell(Rufri,"[SC_422844_10]", 3 )				--�|�����J�G�P�o�̿˪񪺤H�N�O�k�h�p�A�ڤ��ˤ~���ڨӻP�p�۰Ӧo�i�઺�U���C
			PlayMotion( Rufri ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
			Sleep(20)

			ScriptMessage( TargetID()  , TargetID()   , 0 , "[SC_422844_9]" , 0 )	--�|�����J���ԭz
			Sleep(20)

			Yell(OwnerID(),"[SC_422844_11]", 3 )			--�̮R�����G��......�J�M�O�d�����ơA�S�O�Ⱥ����C�w���Ѫ��аU�A�ڷ�M���|����C
			PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)	
			Sleep(30)

			Yell(Rufri,"[SC_422844_12]", 3 )			--�|�����J�G�k�h�A���ڥ���@�B��ĳ�Ʃҵ��p�C
			PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)	--���`��
			Sleep(20)

			DW_MoveToFlag(Rufri,780496,3,0,1)
			Delobj(Rufri)
			if CheckID( TargetID() ) == true then
				Setflag(TargetID(),543543 , 1)			--�����n���~�G�|�����J���n�D�A�H��422845����
				CancelBuff( TargetID()  , 503977  ) 		--�٪��a�ۥ�
			end
			DisableQuest( OwnerID(), false)				--�Ѱ����̮R������Ĳ�I�@��		

end


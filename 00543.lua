function counterx()
	--test--
	--�ŧi�ϰ��ܼ�
	--�L�a�j�骺�p�ƭ�
	local n=0
	--Ret�O�ΨӬ����Ǫ�id���}�C
	local Ret = {}
	--�N �ۤv	�쥻�����A�ŧi
	local hp1=ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP)
	local mp1	=ReadRoleValue(OwnerID(),EM_RoleValue_MaxMP)
	--���@���٤��T�w���� �n���ŧi�H�Q�ϥ�
	local hp2=0 --�ΨӬ����̫᪺�ͩR���ٳѦh��
	local mp2=0--�ΨӬ����̫᪺�]�O���ٳѦh��	
	local dmg1=0 --�����Ǫ����̤j��q
	local dmg2=0--�����Ǫ����̫��q
	local sec=0--�����ۧA�i�J�԰��_���ɶ�
	local sec1=0--�����۩Ǫ��}�l�����_���ɶ�

	--�إ߰j��
	while 1 do
		--����L�a�j��
		if n>3000 then
			ScriptMessage(OwnerID(),OwnerID(),0,"�L�a�j��",0)
			break
		end
		--�P�_�O�_�b�԰����A
		if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode) == 1 then
			--�԰����A�O���򪺡A�H�U����u�ݤ@�����ʧ@
			if sec ==0 then
				--�i�J�԰����A ��]�O�ڧ����Ǫ� �ҥH�өǪ��ؼЬO�� �H�����зǷj�M�ؼЬO�ڪ��Ǫ�
				local Obj
				local Count = SetSearchRangeInfo( OwnerID() , 250 )
				local NPCCount = 0
				ScriptMessage( OwnerID(), OwnerID(), 0, "start", 0 )
				 for i = 1 , Count , 1 do
					local ID = GetSearchResult()
					Obj = Role:New( ID )
					if Obj:IsNPC() == True and Obj:AttackTargetID() == OwnerID() then
						Ret[NPCCount] = ID
						NPCCount = NPCCount + 1;
					end
				end	
				Ret[ NPCCount ] = -1;
				--�g�L�W�� �����l�o�XRet[0]�N�O�өǪ��� id
				--�R�O���Ǫ�����L�a�j��
				BeginPlot( Ret[0], "mobcounterx", 0 )
			end
			--�^��L���j��&�԰����A��
			--�p�ɶi�J�԰����A�g�L�F�h�[���ɶ�
			sec = sec+1
			--��hp2���ۤv�ثe����
			hp2=ReadRoleValue(OwnerID(),EM_RoleValue_HP)
			--�Q�ΧP�_�ۤv���妳�S�����ӽT�w�Ǫ��O�_�i�}����
			if hp1~= hp2 then
				--�p�ɩǪ��i�}��������L�F�h�[���ɶ�
				sec1=sec1+1
			end
		else
			--�D�԰����A
			--�D�԰����A&�w���i�J�԰����A���p��=���}�԰�
			if sec > 0 then
				--���o�{�b���԰����
				--���a�{�b����q
				hp2=ReadRoleValue(OwnerID(),EM_RoleValue_HP)
				--���a�ثe���k�O��
				mp2 = ReadRoleValue(OwnerID(),EM_RoleValue_MP)
				--�����a�o��^�����ƭ�
				--�q�ڶ}�������}�԰��L��h�[�A0.1��[�@���A�ҥH�̫ᰣ10�N�o����
				tell(TargetID(),OwnerID(),"Time="..sec/10);
				--�q�Ǫ����������}�԰��L��h�[�A0.1��[�@���A�ҥH�̫ᰣ10�N�o����			
				tell(TargetID(),OwnerID(),"Time1="..sec1/10);
				--�o���԰����ڷl���F�h�֪���
				tell(TargetID(),OwnerID(),"HP="..hp1-hp2);
				--�Ǫ��v���`�A�Ǫ�����q���h��
				tell(TargetID(),OwnerID(),"DMG="..dmg1);
				--�o���԰��ڥΤF�h�֪��]�O
				tell(TargetID(),OwnerID(),"MP="..mp1-mp2);
				--���@���Ȧ^�_�쪬
				--�p�ɾ��k�s
				sec = 0
				sec1=0
				--���⪺�ƭ�
				hp2=hp1
				mp2=mp1
				dmg1=0
				--�T�{�԰����A����
				WriteRoleValue( OwnerID() , EM_RoleValue_IsAttackMode,0)
			end
	
		end
		--���L�a�j�骺�p��
		n=n+1
		--����0.1��
		sleep(1)
	end
end


--�b�ǤŨ��W���檺�L�a�j��
function mobcounterx()
	--�ŧi�ϰ��ܼ�
	--�L�a�j�骺�p�ƭ�
	local n=0
	--�N �ۤv�쥻�����A�ŧi
	local hp1=ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)
	local mp1=ReadRoleValue(TargetID(),EM_RoleValue_MaxMP)
	--���@���٤��T�w���� �n���ŧi�H�Q�ϥ�
	local hp2=0 --�ΨӬ����̫᪺�ͩR���ٳѦh��
	local mp2=0--�ΨӬ����̫᪺�]�O���ٳѦh��
	local dmg1=0--�����Ǫ����̤j��q
	local dmg2=0--�����Ǫ����̫��q
	local sec=0--�����ۧA�i�J�԰��_���ɶ�
	local sec1=0--�����۩Ǫ��}�l�����_���ɶ�
	--�إ߰j��
	while 1 do
		--����L�a�j��
		if n>3000 then
			break
		end
		--�P�_�O�_�b�԰����A
		if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode) == 1 then
			ScriptMessage( OwnerID(), OwnerID(), 0, "start", 0 )

			--�԰����A���]�L�a�j��)
			--�p�ɶi�J�԰����A�g�L�F�h�[���ɶ�
			sec = sec+1
			--��hp2���ۤv�ثe����
			hp2=ReadRoleValue(TargetID(),EM_RoleValue_HP)
			--�Q�ΧP�_�ۤv���妳�S�����ӽT�w�Ǫ��O�_�i�}����
			if hp1~= hp2 then
				--�p�ɩǪ��i�}��������L�F�h�[���ɶ�
				sec1=sec1+1
			end
		else
			--�D�԰����A
			--�D�԰����A&�w���i�J�԰����A���p��=���}�԰�
			if sec > 0 then
				--���o�{�b���԰����
				--���a�{�b����q
				hp2=ReadRoleValue(TargetID(),EM_RoleValue_HP)
				--���a�ثe���k�O��
				mp2 = ReadRoleValue(TargetID(),EM_RoleValue_MP)
				--�Ǫ��ثe���ͩR�ƭ�
				dmg1=ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP)
				dmg2=ReadRoleValue(OwnerID(),EM_RoleValue_HP)
				--�����a�o��^�����ƭ�
				--�q�ڶ}�������}�԰��L��h�[�A0.1��[�@���A�ҥH�̫ᰣ10�N�o����
				ScriptMessage( TargetID(), TargetID(), 0,"Time="..sec/10 , 0 )
				--�q�Ǫ����������}�԰��L��h�[�A0.1��[�@���A�ҥH�̫ᰣ10�N�o����	
				ScriptMessage( TargetID(), TargetID(), 0,"Time1="..sec1/10 , 0 )		
				--�o���԰����ڷl���F�h�֪���
				ScriptMessage( TargetID(), TargetID(), 0,"HP="..hp1-hp2 , 0 )
				--�Ǫ��v���`�A�Ǫ�����q���h��
				ScriptMessage( TargetID(), TargetID(), 0,"DMG="..dmg1-dmg2 , 0 )
				--�o���԰��ڥΤF�h�֪��]�O
				ScriptMessage( TargetID(), TargetID(), 0,"MP="..mp1-mp2 , 0 )
				--���ȧ����A���X�L���j��
				break
			end

		end
		--���L�a�j�骺�p��
		n=n+1
		--����0.1��
		sleep(1)
	end

end


------------------�M�I���j�Ѻر�--------------
function LuaS_112625_0() --�ܴ��D�̥d�ܹ�ܼ@��

	LoadQuestOption( OwnerID() ) --���J����NPC�ҪO���e
	if CheckAcceptQuest( OwnerID() , 422197 ) == true then --�ˬd�O�_�w�g���F���� 422197
		AddSpeakOption( OwnerID(), TargetID(),  "[SC_112625_0]", "LuaS_112625_1",0 )	--/*���N�ЧA���ܵu�����i�D�ڧa�I
	end

end

function LuaS_112625_1() 
	SetSpeakDetail( OwnerID(), "[SC_112625_1]" ) --/*�]�ܴ��ΧA�X�G��ť���쪺�n���}�l��A���ܡ^......�]�H�U���^
	SetFlag( OwnerID() , 542508 , 1 ) --���}���n�X��
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "LuaS_112625_0",0 ); --/*��^�W�@��
end
--------------------���]���Ѽ�--------------------------
function LuaI_492897_Check() --�ϥλj��Ţ�᪺����k�N�ˬd SCRIPT �A���ˬd�ण������j�諸�ʧ@�AOwnerID()�O�I�k�̡ATargetID() �O�I�k�̪��ؼ�

	local Target = ReadRoleValue( TargetID() , EM_RoleValue_OrgID) --���o�ؼЪ� OrgID (��Ʈw�s��)

	--�N�C�@�Ӥ����\���a�I�k�����p�i���ˬd
	if CheckAcceptQuest( OwnerID() , 422202 ) == false or CheckCompleteQuest( OwnerID() , 422202 ) == true then --�ˬd���� 422202 ���]���Ѽ� �p�G�|�������Τw�g����
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422202_0]" , 0 ); --��ܰT���G�A���ݭn�ϥγo�Ӫ��~
		return false --�^�� false �Ө����I�k�A�õ���Script
	end
	if CountBodyItem( OwnerID() , 204408 ) >= 10 and Target == 101752 then--�ˬd�p�G�ؼЬO 101752 �ɡA���W�w�g�� 10 �ӥH�W�� 204408 ����
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422202_1]" , 0 );--��ܰT���G�A�w�g����������[101752]�F
		return false --�^�� false �Ө����I�k�A�õ���Script
	end
	if CountBodyItem( OwnerID() , 204409 ) >= 10 and Target == 101802 then --�ˬd�p�G�ؼЬO 101802 �ɡA���W�w�g�� 10 �ӥH�W�� 204409 ����
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422202_2]" , 0 );--��ܰT���G�A�w�g����������[101802]�F
		return false --�^�� false �Ө����I�k�A�õ���Script
	end
	if Target ~= 101752 and Target ~= 101802 then --�ˬd�p�G�ؼФ��O 101752 �]���O 101802 ����
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422202_5]" , 0 );--��ܰT���G�ؼп��~
		return false--�^�� false �Ө����I�k�A�õ���Script	
	elseif ReadRoleValue( TargetID() ,EM_RoleValue_IsAttackMode) > 0 then --�ؼЬO 101752 �� 101802 �A�ˬd�p�G�ؼЦb�԰�������
		--�ˬd�p�G�ϥΪ̦b�ؼЪ�����C��̪��ܡA�N���\�I�k�A�_�h�h�����\�I�k�A����m�O�H����
		local Count = HateListCount( TargetID() ) --���o�ؼЪ�����C�����h�֤H
		for i = 0 , Count -1 , 1 do --�}�lfor�j��Ai �q 0 �� Count -1 �A�@���� 1 
			if HateListInfo(TargetID() , i  , EM_HateListInfoType_GItemID ) == OwnerID() then --�ˬd�ؼФ���C�� i ��m�W���H�O���O OwnerID()
				return true --�^�� true �Ӳ��ͪk�N�ĪG �A�õ��� Script
			end
		end --�����j��
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422202_6]"  , 0 );  --��ܰT���G�j�諸�`�N�O�b��L�H���W�A�A�L�k�����e
		return false --�^�� false �Ө����I�k�A�õ���Script
	end

	--�p�G�H�W�����󳣳q�L�A�S���^�� false ���ܡA�h���\�I�k
	return true --�^�� true �Ӳ��ͪk�N�ĪG �A�õ��� Script
end

function LuaC_492897_Effect() --��b�ϥΪ��~�I�i�k�N�����j�����檺�򥻪k�N�]�򥻪k�N���������script�^�AOwnerID()�O�I�k�̡ATargetID() �O�I�k�̪��ؼ�
	local Target = ReadRoleValue( TargetID() , EM_RoleValue_OrgID) --���o�ؼЪ� OrgID (��Ʈw�s��)
	BeginPlot(TargetID() , "LuaI_492897_Reset" , 0 ) --�R�O�ؼа���禡 LuaI_492897_Reset
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422202_7]"  , 0 ); --��ܰT���G�A���\�ɧ��o���j��
	if Target == 101752  then --�ˬd�p�G�ؼЬO 101752 ����
		GiveBodyItem(OwnerID(), 204408, 1 )	--���� OwnerID() ���~ 204408 1��
	elseif Target == 101802 then --�ˬd�p�G�ؼФ��O 101752 �A�O 101802 ����
		GiveBodyItem(OwnerID() ,204409, 1 )	--���� OwnerID() ���~ 204409 1��
	end
end
function LuaI_492897_Reset() --���榹�禡������|���歫�ͪ��ʧ@
	LuaFunc_ResetObj( OwnerID() ) --�� OwnerID() ���歫�ͼ@�����@�Ψ禡
end
------------------�j��O���K�Z���H---------------------------------
function LuaI_492898_Check() --�ϥλj����G�᪺����k�N�ˬd SCRIPT 

	local Target = ReadRoleValue( TargetID() , EM_RoleValue_OrgID) --���o�ؼЪ� OrgID (��Ʈw�s��)

	--�N�C�@�Ӥ����\���a�I�k�����p�i���ˬd
	if CheckAcceptQuest( OwnerID() , 422203 ) == false or CheckCompleteQuest( OwnerID() ,422203) == true then --�ˬd���� 422203 �j��O���K�Z���H�p�G�|�������Τw�g����
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422203_0]" , 0 ); --��ܰT���G�A���ݭn�ϥγo�Ӫ��~
		return false --�^�� false �Ө����I�k�A�õ���Script
	end
	if CheckFlag( OwnerID() , 542509 ) == true then--�ˬd�O�_�w�g����L
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422203_1]" , 0 );--��ܰT���G�A�w�g���D�j����G���ĪG�A���ΦA�դF
		return false --�^�� false �Ө����I�k�A�õ���Script
	end

	if Target < 101755 or Target >101763 or Target == 101759 then --�ˬd�p�G�ؼФ��O�b 101755 �� 101763 �����A�άO�ؼЬO 101759 �]����b�T�^����
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422203_4]" , 0 );--��ܰT���G�ؼп��~
		return false--�^�� false �Ө����I�k�A�õ���Script
	end
	if CheckBuff( TargetID() , 501463 ) == true or CheckBuff( TargetID() ,500977 ) == true then --�ˬd�ؼЦp�G���g��(500977)�ή���(501463)��Buff
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_204425_3]" , 0 );--��ܰT���G�ؼв{�b�����A���A�X�@����
		return false--�^�� false �Ө����I�k�A�õ���Script		
	end
	--�p�G�H�W�����󳣳q�L�A�S���^�� false ���ܡA�h���\�I�k
	return true --�^�� true �Ӳ��ͪk�N�ĪG �A�õ��� Script
end

function LuaC_492898_Effect() --�ϥλj����G�᪺�ĪGscript
	--�N�ؼЪ��W�r������r��̭�
	local Str = "[SC_422203_5][$SETVAR1="..GetName(TargetID()).."]"  
	--/*[$VAR1]�ݰ_�Ӭ۷���I
	SetFlag( OwnerID() , 542509 , 1 ) --���}�X�� 542509
	AddBuff( TargetID() , 500977 , 1 , 10 ) --���ؼШ��W�@�� Buff 500977 (�g��) �A���� 1 ���� 10 ��
	ScriptMessage( OwnerID(), OwnerID(), 1, Str, 0 ); --��ܰT��
	SetAttack( TargetID() , OwnerID() ) --�R�O TargetID() ���� OwnerID() 

end
----------�t�@�ػj��H-------------
function LuaI_422204_0() --��b���󪺪�l�@���AOwnerID()�����󥻨��A�L TargetID()
	SetPlot( OwnerID() , "range" , "LuaI_422204_1" , 70 ) --�]�wĲ�oSCRIPT�AĲ�o�������d�� range �AĲ�o����檺 Script �� LuaI_422204_1 �AĲ�o���d��b�|�� 70
end

function LuaI_422204_1() --�d��@��Ĳ�o����檺Script�A�b���Ҥ� OwnerID() �����a�A TargetID() ���\��@��������
	if CheckAcceptQuest( OwnerID() , 422204 ) == true and CheckFlag( OwnerID() , 542510 ) == false then --�p�G�������� 422204 �åB�|�����o 542510 
		SetFlag( OwnerID() , 542510 , 1 ) --���}�X�� 542510
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422204_0]", 0 ); --��ܰT�� 
	end
end
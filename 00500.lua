--------------------------------------------------------------------------------------------------------------------------
function LuaS_DEGRADE() --����
	
	local NPC = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE" )  );
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK"), "LuaS_"..NPC.."_0", 0 ); --/*��^�W�@��
	
end
-------------------------------------------------------------------------------------------------------------------------
function LuaS_LIVING_SAY() --�ͬ��ޯ໡��

	local NPC = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
   	SetSpeakDetail( OwnerID(), GetString ( "SD_LIVING_SAY_NEW" )   );
								
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK"), "LuaS_"..NPC.."_0", 0 ); --/*��^�W�@��
		
end
-------------------------------------------------------------------------------------------------------------------------
function LuaS_LEARNING_SAY() --�ǲߥͬ��ޯ໡��

	local NPC = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
   	SetSpeakDetail( OwnerID(), GetString ( "SD_LEARNING_SAY" )   );
								
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK"), "LuaS_"..NPC.."_0", 0 ); --/*��^�W�@��
		
end
-------------------------------------------------------------------------------------------------------------------------
function LuaS_GATHER_SAY() --�p�a����ܱĶ��I����

	local NPC = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
   	SetSpeakDetail( OwnerID(), GetString ( "SD_GATHER_SAY" )   );--�A�i�H�b�p�a�ϤW���k��A�æb��椤��ܡu�Ķ��I��ܡv�A�M��Ŀ�A�ҷQ�n��ܪ��Ķ��I�]���q�I�B����I�α����I�^�C

					                             --����b�A�|�B���ʮɡA�N�i�H�b�p�a�Ϭݨ�Ķ��I����ڦ�m�F�C

	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK"), "LuaS_"..NPC.."_0", 0 ); --/*��^�W�@��
		
end

-------------------------------------------------------------------------------------------------------------------------
function LuaS_AFTER_GATHER_MINE()--���廡��

	local NPC = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
   	SetSpeakDetail( OwnerID(), GetString ( "SD_AFTER_GATHER_MINE" )   );

		--�@��s�y�����Ϋ��X�Ӫ��q�۴N�i�H�A�����Ƕi�����s�y�ݭn�«ק󰪪��q�ۡA�o�ӮɭԴN�ݭn�M�ҤF�C

		--�Y�A�n�����q�ۡA�ݭn�b�t�ΦC�����}�u�Ͳ��s�y�v�������A��ܡu�q�ۺ���v���ءA�M��A�q�C����ܧA�ҭn���媺�q�ۡA�u�n�A���䦳���K����N�i�H�����q�ۤF�C

		--�O���I�n�i���q�ۺ���A��������쥴�K����C

		--�A���w�g�Ƿ|�F�@�ǰ򥻪��q�ۺ���A�Ө�L�q�۪�����t��A�i�H�V�U�B���q�u��|�������ʶR�C


	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK"), "LuaS_"..NPC.."_0", 0 ); --/*��^�W�@��

end
-------------------------------------------------------------------------------------------------------------------------
function LuaS_AFTER_GATHER_WOOD()--�d�s����

	local NPC = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
   	SetSpeakDetail( OwnerID(), GetString ( "SD_AFTER_GATHER_WOOD" )   );

	--���M���U�Ӫ����Y�����K�i�s�y���֪��~�A���n����s���~�٬O�ݭn����ƶi��@�ǳB�z�A�o�ǳB�z�N�O�d�s�C

	--�ڥ��ЧA��i�P�h�쪺�d�s�A�����A�i�H�q�t�ΦC�����}�u�Ͳ��s�y�v�������A��ܡu����d�s�v���ءA�M��A�q�C����ܧA�ҭn�d�s�����Y�C

	--�u�n�A�����񦳤�u����A�N�i�H����Y�d�s������F�C

	--�d�s�n������A�N�i�H�Ψӻs�y�@�Ǥ�s���Z���B����Ψ�L����A���L�Q�ǻs�y���ܴN�o�n�a��L���M�a�F�C

	--�p�G�A�n��L������d�s�t��A�U�B���Ҩ�|���������i�H�R�o��C

	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK"), "LuaS_"..NPC.."_0", 0 ); --/*��^�W�@��

end
-------------------------------------------------------------------------------------------------------------------------
function LuaS_AFTER_GATHER_HERB()--���һ���

	local NPC = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
   	SetSpeakDetail( OwnerID(), GetString ( "SD_AFTER_GATHER_HERB" )   );

	--�į󪽱��ϥΪ��ĪG�����A�]�����ǰt��|�n�D�~��󰪪���ơF���F��o�o�ǭ�ơA�ڭ̻ݭn�ǲߦp�󴣷ҡC

	--�A�w�g�Ƿ|�F�p�󴣷ҭW�����s�]����A���U�ӥu�n���}�t�ΦC�����u�Ͳ��s�y�v�����A��ܡu���Ĵ��ҡv���ءA�M��A�q�C����ܧA�ҭn���Ҫ����ġC�u�n�A���䦳�Ҫ�����N�i�i����Ĵ��ҤF�A�����N�h�ոլݧa�I

	--�p�G�A�ٷQ�Ǩ�L�����Ĵ��ҡA�O�o�h���L���ĤH��|�������A�u�n��@�I�I�O�ΡA�L�̳����@�N�N�t��浹�A���I


	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK"), "LuaS_"..NPC.."_0", 0 ); --/*��^�W�@��

end
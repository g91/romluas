function Z32_Portworker_speak()	--��f�u�H���
	local Portworker = {
			[1]="[SC_Z32_PORTWORKER_1]",	--�C�ѳ��o�򨯭W�A�]�Ȥ��줰����A�ڷQ�N�󤣥λ��F�A�p�G�������A���ڥ[�I�~���N�n�F�C
			[2]="[SC_Z32_PORTWORKER_2]",	--�C�Ѩ��W�u�@......�̴��ݪ��N�O�U�u���ɭԡA���ɧڴN�i�H�h��߷R�������h�Q�F�A���ڳo�˪����Ū��H�A�ڥ��O�Q���ݯ��n�k�ĵ��B�C
			[3]="[SC_Z32_PORTWORKER_3]",	--�i�c......�ڤ�x�W��õ�S�ܲʤF�A�K�A�A���D�ڬ�����n���o�زʭ����u�@�ܡH�A��ı�o����ݵۨ��ǵ���S�y�ۦ����ݽ��A�O�ܥO�H�������ƶܡH�A�١A�A�i�O��H�û����C
			[4]="[SC_Z32_PORTWORKER_4]",	--�٦n�ڥu�O�ӽX�Y�u�H�A�n�O�J������ٶäU���O������A�N��ڦ��h�X���R�����������C
			[5]="[SC_Z32_PORTWORKER_5]",	--�ݵۧڤ麥���������]�ڴN�}�ߡA���Ȫ��o�ǿ��O�n���ڪ��a�H�L�W�n��l�A�p�G�����|�A�ڷQ�����ӷ|�}�l���I�p�R��a�A��������h�x���ͬ��I
			[6]="[SC_Z32_PORTWORKER_6]",	--�n����n�S�n���ण�Y��A�ڭ̳o�Ӱ�a������N�O�Q�d�a�F�A�n�O���`�O���ۡG�u�A�����٦��O�H�m�ۭn�u�@�O�I�v�A�C�����γo�ӫ¯٧ڭ̡I��I�n�O�H�~�]���A�i�O�s��I
			[7]="[SC_Z32_PORTWORKER_7]",	--���D�O�D�`���O���H�A�n���O�����D���G���Χڬݧڭ̨ǤH�����N�y�����ҤF�C
			[8]="[SC_Z32_PORTWORKER_8]"	--�A�ݳo���R�����䫰�A�O�ѧڭ̳o�s��h���Ҥu�ҥ��y�_�Ӫ��A�ҥH���n��������@�ӤH�A�O�o����۷P�����߬ݫݧA�Ҭݨ����H�C
			}
	SetSpeakDetail(OwnerID(),Portworker[DW_Rand(8)])
end

function Z32_Crew_speak()	--�C��������
	local Crew = {
			[1]="[SC_Z32_CREW_1]",	--���M���ڥ��ɳ��b���W�A�����٬O�Q�R�Фl�A���F�Фl�~�⦳�a�A�u�i���n�\�Фl������i���C�O......��ɤ~���a�O......
			[2]="[SC_Z32_CREW_2]",	--�b���W�ݤ[�F�A�a�䪺�ɭԳ̴��ݪ��Ʊ����@�N�O���O�H�y�s�Ѫ𪺷ŬX�m......�C
			[3]="[SC_Z32_CREW_3]",	--�n����W�k��i�S����²��A�����n����Ԩ��H�ɷn�̪���A�A�ӬO�ƤѨS���~��......�C
			[4]="[SC_Z32_CREW_4]",	--���¤@��ڤ@�w�n��W����A�}��i��T���Ȥj���I
			[5]="[SC_Z32_CREW_5]",	--�A�ݧڳo�@�ͪ���椤�̳��w���X�Ӧa��ڡH�Ĥ@��M�O�ڪ��G�m���Q���o�A�A�ӬO�p�_�Ҥ���A���۬O.....���L�ѹ껡�A�ڭ̨C���a�����������O���X�ӡA���S���|�W�����L�a�訫���O�I
			[6]="[SC_Z32_CREW_6]",	--�L�h�ڤ@���H���s����w���_�ì��ؼСA���O��e�~ť�����u�O���F���A���٦]���ˤߤF�n�[......�C
			[7]="[SC_Z32_CREW_7]",	--�ڤ��e�J�L�@�ӹw���̡A�L�_�����t���N�|�����j�ԡA���Lť�_�ӴN���O�F�H���A�t���C�I�֦��̰����޳N���������i��|�o��²��N�Q�𳴡H�@�w�O�Ӷû����F�F�����å�C
			[8]="[SC_Z32_CREW_8]"	--�A���n�n���B�͡A�`���@�ѷ|�����A�u�n�û��O�o�A�@�_�ɪ����n�A�ɱ`�p�����N�ܦn�F�A�p�G�n�@���@�_���騺���ݳ��u�O�z�Q�a�H�C
			}
	SetSpeakDetail(OwnerID(),Crew[DW_Rand(8)])
end

function Z32_Fishman_speak()	--���ҹ��
	local Fishman = {
			[1]="[SC_Z32_FISHMAN_1]",	--���M�ڤѤѮ����쥫���c��A���O���`ı�o�ڽ浹�ӤH������A��ӤH�c�⪺���榳�ܰ������t�A�p�G����֤F�o�ǭ�d�Ӧ��h�n......
			[2]="[SC_Z32_FISHMAN_2]",	--�ګܤ[�H�e��ť���L�@�ӬG�ơA���O�������n�h�ӷ೽�H����A���L��ӳQ�@�Ӥj���ǵ������F�A�o�u�O�i�����A�p�G���o���ǫ�򳣨S�H���L�O�H
			[3]="[SC_Z32_FISHMAN_3]",	--�u�n�C���X���ڳ��|�V�@���k������ë�A�Ȧ��گ७�w�k�ӡA�p�G�A�Q�ݬݤk�������ܡA���ۮ��y���N�ݪ����F�C
			[4]="[SC_Z32_FISHMAN_4]",	--���`ı�o�����@���k�������ǻ��O�u���A�����ڹJ�W�ɭ��B�A�b�M�椧�ڡA�ڤߤ��V�k������ë�A�A���D�ܡH�ڳ��M�b���W�ݨ��@�Ӵ��ۿO���֤k�A�ڪu�ۥ��~�E�h�A���M�^���f�A�o�u�O���_�O�I
			[5]="[SC_Z32_FISHMAN_5]",	--�ڥ��e�b����߹L�@�Ӳ~�l�A�����Y�릳�@�ʫH�A���G�O�Ӧ��ö����D�ϰT���O�A���L�j�a�����D���Ӧa���ۥ��c�����s�A�ݨӨD�Ϫ̬O���h�N�֤F�a�C
			[6]="[SC_Z32_FISHMAN_6]",	--�̪�����䳣�|�B�ۤ@�Ǧ��������ݤ��A�u�����D�U���W��o�ͤF����ơA�����w......����©���O�q�u�\�ɸ̬y�X�Ӫ��O�I�֪��D���ӥi�Ȫ��s���Y�æ�����C
			[7]="[SC_Z32_FISHMAN_7]",	--�ڪ��X�Ӧn�B�ͳ̪񳣥[�J�F�@�Ӥ���СA�u�d�����L�̡I���D�ѥ[���Ӳ�´�N�����Y�H
			[8]="[SC_Z32_FISHMAN_8]"	--�̪�ڦb��Ҥ@�ǰ��D�A�������Ӭ۷R���H�����H�N���b�@�_�A�٭n�U�{��P�D�H�������A���A��A���]���|���ժ���......�C
			}
	SetSpeakDetail(OwnerID(),Fishman[DW_Rand(8)])
end
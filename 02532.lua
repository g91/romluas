--�p���ϸ`�Ϊ��e�U
------------------------------------------------------------------------
function William_119526_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424976)==TRUE and	 --�ˬd���a�O�_�w���o����424976
		CheckFlag(OwnerID(),545760) == false then --�ˬd���a�O�_�w���o���ȺX��
		AddSpeakOption(OwnerID(), TargetID(),"[SC_424976_00]"," William_119526_02",0) --�W�[���s								
	end
end
------------------------------------------------------------------------
function William_119526_02()
	SetFlag(OwnerID(),545760,1) --���o���n���~��Z��R�������۶Ҷi��
	SetSpeakDetail( OwnerID(), "[SC_424976_01]" ) --�Z��R�������۶Ҷi�פ��e
end
------------------------------------------------------------------------
function William_119527_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424976)==TRUE and	 --�ˬd���a�O�_�w���o����424976
		CheckFlag(OwnerID(),545761) == false then --�ˬd���a�O�_�w���o���ȺX��
		AddSpeakOption(OwnerID(), TargetID(),"[SC_424976_00]"," William_119527_02",0) --�W�[���s								
	end
end
------------------------------------------------------------------------
function William_119527_02()
	SetFlag(OwnerID(),545761,1) --���o���n���~����`�ۭn�몺�۶Ҷi��
	SetSpeakDetail( OwnerID(), "[SC_424976_02]" ) --���`�ۭn�몺�۶Ҷi�פ��e
end
------------------------------------------------------------------------
function William_119528_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424976)==TRUE  and --�ˬd���a�O�_�w���o����424976
		CheckFlag(OwnerID(),545762) == false then --�ˬd���a�O�_�w���o���ȺX��
		AddSpeakOption(OwnerID(), TargetID(),"[SC_424976_00]"," William_119528_02",0) --�W�[���s								
	end
end
------------------------------------------------------------------------
function William_119528_02()
	SetFlag(OwnerID(),545762,1) --���o���n���~��F�ԥ������۶Ҷi��
	SetSpeakDetail( OwnerID(), "[SC_424976_03]" ) --�F�ԥ������۶Ҷi�פ��e
end
------------------------------------------------------------------------
function William_119529_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424976)==TRUE and --�ˬd���a�O�_�w���o����424976
		CheckFlag(OwnerID(),545763) == false then --�ˬd���a�O�_�w���o���ȺX��
		AddSpeakOption(OwnerID(), TargetID(),"[SC_424976_00]"," William_119529_02",0) --�W�[���s								
	end
end
------------------------------------------------------------------------
function William_119529_02()
	SetFlag(OwnerID(),545763,1) --���o���n���~����u���S���۶Ҷi��
	SetSpeakDetail( OwnerID(), "[SC_424976_04]" ) --���u���S���۶Ҷi�פ��e
end
------------------------------------------------------------------------
function William_NPC119759()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_05]" ) --�u�n��{���n��]�\�����|�����j�H���o�I
		end
	sleep(150)
	end
end
------------------------------------------------------------------------
function William_NPC119760()
	CallPlot( OwnerID(), "LuaP_Sitting", OwnerID() )
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_06]" ) --���x�h�_�I�a��d�U�O���ۤv���ҿ�ѧr...�C
		end
	sleep(200)
	end
end
------------------------------------------------------------------------
function William_NPC119761()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_07]" ) --������ڥi�O�q�S�Q�L�n���ۦ^�ӧr�I
		end
	sleep(150)
	end
end
------------------------------------------------------------------------
function William_NPC119762()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_08]" ) --�N��S���o���۶ҡA�ڭ̫_�I�̿𦭤]�O�|�h���̪�...�C
		end
	sleep(200)
	end
end
------------------------------------------------------------------------
function William_NPC119763()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_09]" ) --ť�����̪��ĤH�i�O�]�ڧo������u���ڷP�줣�w�ܡH
		end
	sleep(150)
	end
end
------------------------------------------------------------------------
function William_NPC119764()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_10]" ) --�]�ڡ�n�[�����ǻ��r��s���O�o�ͤF����ƩO�H
		end
	sleep(150)
	end
end
------------------------------------------------------------------------
function William_NPC119765()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_11]" ) --���@�@�ɩM����o�بƫ��i��֪��F�کO�I
		end
	sleep(200)
	end
end
------------------------------------------------------------------------
function William_NPC119766()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_12]" ) --�]�ڡI�H�ڦ��G��ť���L�o...�C
		end
	sleep(150)
	end
end
------------------------------------------------------------------------
function William_NPC119767()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_13]" ) --���u�Q�������L�̨��Ѩ�ڪ��F�`�r�I
		end
	sleep(200)
	end
end
------------------------------------------------------------------------
function William_NPC119768()
	CallPlot( OwnerID(), "LuaP_Sitting", OwnerID() )
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_14]" ) --�����F�溸�j����o�O�ڤ@���l�S��L���a��r�I
		end
	sleep(150)
	end
end
------------------------------------------------------------------------
function William_NPC119769()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_15]" ) --�o�i�O���ڭ�½�����j�n���|�o�I
		end
	sleep(150)
	end
end
------------------------------------------------------------------------
function William_NPC119770()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_16]" ) --�����]�ڧڥi����...�ڭˬO�n�ݬݥL�̨s���O���h�j���ơI
		end
	sleep(200)
	end
end
------------------------------------------------------------------------
function William_NPC119771()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_17]" ) --�ޥL�ĤH�O�֡A��ɭԨ��H�N���ǨS���I
		end
	sleep(150)
	end
end
------------------------------------------------------------------------
function William_NPC119772()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_18]" ) --�Ҧ����^���̳��b�|���إX�{...�A�u�O�H���ݧr�I
		end
	sleep(200)
	end
end
------------------------------------------------------------------------
function William_NPC119773()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_19]" ) --�ڭ̹F�ԥ����N�n����aģ�F�r...�I
		end
	sleep(150)
	end
end
------------------------------------------------------------------------
function William_NPC119774()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_20]" ) --�ڭ̤��u���aģ...�N�n���{�աI
		end
	sleep(150)
	end
end
------------------------------------------------------------------------
function William_NPC119775()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_21]" ) --�i�O�o��@�ӡA�ڭ̤��N�n�M���s���Y�@�_�@�ԤF...�C
		end
	sleep(200)
	end
end
------------------------------------------------------------------------
function William_NPC119776()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_22]" ) --�M���Y�êӧ@�ԡH���s���Y���|���o�p��@�ԡC
		end
	sleep(150)
	end
end
------------------------------------------------------------------------
function William_NPC119777()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_23]" ) --������ڨ�����Y�ש�ଣ�W�γ��F�r�I
		end
	sleep(200)
	end
end
------------------------------------------------------------------------
function William_NPC119778()
	while 1 do
	local num=dw_rand(5)
		if num==1 then
			Say( OwnerID(), "[SC_424976_24]" ) --ť���@�W�Ҧ����^���̳��b�|���اo��I
		end
	sleep(150)
	end
end
------------------------------------------------------------------------
function un_wepen75_01()   --�̤l�����ܿﶵ   �@�G
	local own = OwnerID()
	LoadQuestOption( own )  --show�X�ҪO���
	local choice = {"[SC_117939_12]","[SC_117939_18]","[SC_117939_30]",
					"[SC_117939_32]","[SC_117939_34]"}--�I����Ĳ�o��script
	local SpeakOption = {"un_wepen75_02","un_wepen75_04","un_wepen75_05",
						 "un_wepen75_08","un_wepen75"}--��ܿﶵ
	for i=1 , 5 do
		AddSpeakOption( own,TargetID( ),choice[i], SpeakOption[i], 0 )
	end
end
function un_wepen75_02()
SetSpeakDetail( OwnerID(), GetString("SC_117939_13") )--1.�]�~��ť�^�C�]�����B�^
AddSpeakOption( OwnerID(),TargetID(),"[SC_117939_14]", "un_wepen75_06", 0 )
end
function un_wepen75_03()
SetSpeakDetail( OwnerID(), GetString("SC_117940_02") )--2.�߰ݸԽСC�]�����D�^
end
function un_wepen75_04()
SetSpeakDetail( OwnerID(), GetString("SC_117939_19") )--3.�߰ݯ����M��C�]�����E�^
AddSpeakOption( OwnerID(),TargetID(),"[SC_117939_20]", "un_wepen75_04_1", 0 )
AddSpeakOption( OwnerID(),TargetID(),"[SC_117939_22]", "un_wepen75_04_2", 0 )
AddSpeakOption( OwnerID(),TargetID(),"[SC_117939_24]", "un_wepen75_04_3", 0 )
AddSpeakOption( OwnerID(),TargetID(),"[SC_117939_26]", "un_wepen75_04_4", 0 )
AddSpeakOption( OwnerID(),TargetID(),"[SC_117939_28]", "un_wepen75_04_5", 0 )
AddSpeakOption( OwnerID(),TargetID(),"[SC_117939_30]", "un_wepen75_05", 0 )
end
function un_wepen75_04_1()
SetSpeakDetail( OwnerID(), GetString("SC_117939_21") )
end
function un_wepen75_04_2()
SetSpeakDetail( OwnerID(), GetString("SC_117939_23") )
end
function un_wepen75_04_3()
SetSpeakDetail( OwnerID(), GetString("SC_117939_25") )
end
function un_wepen75_04_4()
SetSpeakDetail( OwnerID(), GetString("SC_117939_27") )
end
function un_wepen75_04_5()
SetSpeakDetail( OwnerID(), GetString("SC_117939_29") )
end
function un_wepen75_05()
SetSpeakDetail( OwnerID(), GetString("SC_117939_31") )--4.�߰ݨ��o�a�I�C�]�����F�^
AddSpeakOption( OwnerID(),TargetID(),"[SC_117939_18]", "un_wepen75_04", 0 )
end

---------------------------------------------------------------------------------------------��ܲĤ@�h*****
function un_wepen75_06()   --�O��
SetSpeakDetail( OwnerID(), GetString("SC_117939_15") )--5.�߰ݾ��ҡC�]�����G-0�^
AddSpeakOption( OwnerID(),TargetID(),"[SC_117939_16]", "un_wepen75_07", 0 )
AddSpeakOption( OwnerID(),TargetID(),"[SC_117939_18]", "un_wepen75_04", 0 )
AddSpeakOption( OwnerID(),TargetID(),"[SC_117939_30]", "un_wepen75_05", 0 )
end

function un_wepen75_07()
SetSpeakDetail( OwnerID(), GetString("SC_117939_17") )--5.�߰ݾ��ҡC�]�����G-0�^
AddSpeakOption( OwnerID(),TargetID(),"[SC_117939_18]", "un_wepen75_04", 0 )
AddSpeakOption( OwnerID(),TargetID(),"[SC_117939_30]", "un_wepen75_05", 0 )
end
function un_wepen75_08()   --�u�߰ݾ��ҡv�]���G-0�^
	SetSpeakDetail( OwnerID(), GetString("SC_117939_33") )
	AddSpeakOption( OwnerID(),TargetID(),"[SC_117939_34]", "un_wepen75", 0 )
end

--------------------------------------------------------------------------------------------------------------
function un_wepen75()                                 --6.�I�����ҡC�]�����G�^
	local own = OwnerID()
	LoadQuestOption( own )  --show�X�ҪO���
	local choice = {"[SC_117939_05]","[SC_117939_02]","[SC_117939_03]",
					"[SC_117939_04]","[SC_117939_01]"}--�I����Ĳ�o��script
	local SpeakOption = {"un_wepenchoice75_4","un_wepenchoice75_1","un_wepenchoice75_2",
						 "un_wepenchoice75_3","un_wepenchoice75_5"}--��ܿﶵ
	for i=1 , 5 do
		AddSpeakOption( own,TargetID( ),choice[i], SpeakOption[i], 0 )
	end
end
----------------------------------------------------------------------------------------------------------------
										--75�@����Z
----------------------------------------------------------------------------------------------------------------
function un_wepenchoice75_1()  --OwnerID() = Ĳ�o���H , TargetID() = NPC
	local own = OwnerID()
	local item = {209322,209323,209324,209325,209326}
	if CountBodyItem(own, item[1] )>=1 and CountBodyItem(own, item[2] )>=1 and
		CountBodyItem(own, item[3] )>=1 and CountBodyItem(own, item[4] )>=1 and
		CountBodyItem(own, item[5] )>=1 then                       --�ˬd�O�_��������
		for i=1 , 5 do
			DelBodyItem( own, item[i], 1 )                         --�R������
		end
		GiveBodyItem( own, 209392, 1 )                              --�������~
	else
		ScriptMessage( own, own, 1, "[SC_117939_11]" , 0 )   --�I�����Ƥ���
	end	
	CloseSpeak( own )
end
function un_wepenchoice75_2()
	local own = OwnerID()
	local item = {209327,209328,209329,209330,209331}
	if CountBodyItem(own, item[1] )>=1 and CountBodyItem(own, item[2] )>=1 and
		CountBodyItem(own, item[3] )>=1 and CountBodyItem(own, item[4] )>=1 and
		CountBodyItem(own, item[5] )>=1 then                       --�ˬd�O�_��������
		for i=1 , 5 do
			DelBodyItem( own, item[i], 1 )                         --�R������
		end
		GiveBodyItem( own, 209393, 1 )                              --�������~
	else
		ScriptMessage( own, own, 1, "[SC_117939_11]" , 0 )   --�I�����Ƥ���
	end	
	CloseSpeak( own )
end
function un_wepenchoice75_3()
	local own = OwnerID()
	local item = {209332,209333,209334,209335}
	if CountBodyItem(own, item[1] )>=1 and CountBodyItem(own, item[2] )>=1 and
		CountBodyItem(own, item[3] )>=1 and CountBodyItem(own, item[4] )>=1 then                       --�ˬd�O�_��������
		for i=1 , 4 do
			DelBodyItem( own, item[i], 1 )                         --�R������
		end
		GiveBodyItem( own, 209394, 1 )                              --�������~
	else
		ScriptMessage( own, own, 1, "[SC_117939_11]" , 0 )   --�I�����Ƥ���
	end	
	CloseSpeak( own )
end
function un_wepenchoice75_4() --¾�~�M��
	local own = OwnerID()
	local job = ReadRoleValue(own,EM_RoleValue_VOC)  --¾�~1.��2.�C3.�v4.�k5.��6.�M7.��8.��
	local item = {209336,209337,209338,209339,209340,209341,209342,209343}
	if job == 1 and CountBodyItem(own, item[5] )>=1 then
		GiveBodyItem( own, 209395, 1 )  
		DelBodyItem( own, item[5], 1 )
	elseif job == 2 and CountBodyItem(own, item[8] )>=1 then
		GiveBodyItem( own, 209395, 1 ) 
		DelBodyItem( own, item[8], 1 )
	elseif job == 3 and CountBodyItem(own, item[4] )>=1 then
		GiveBodyItem( own, 209395, 1 ) 
		DelBodyItem( own, item[4], 1 )
	elseif job == 4 and CountBodyItem(own, item[3] )>=1 then
		GiveBodyItem( own, 209395, 1)
		DelBodyItem( own, item[3], 1)		
	elseif job == 5 and CountBodyItem(own, item[2] )>=1 then
		GiveBodyItem( own, 209395, 1 ) 
		DelBodyItem( own, item[2], 1 )
	elseif job == 6 and CountBodyItem(own, item[1] )>=1 then
		GiveBodyItem( own, 209395, 1 ) 
		DelBodyItem( own, item[1], 1 )
	elseif job == 7 and CountBodyItem(own, item[7] )>=1 then
		GiveBodyItem( own, 209395, 1 ) 
		DelBodyItem( own, item[7], 1 )
	elseif job == 8 and CountBodyItem(own, item[6] )>=1 then
		GiveBodyItem( own, 209395, 1 ) 
		DelBodyItem( own, item[6], 1 )
	else
		ScriptMessage( own, own, 1, "[SC_117939_11]" , 0 )   --�I�����Ƥ���
		--CloseSpeak( own )
	end
	CloseSpeak( own )
	--[[if CountBodyItem(own, item[1] )>=1 and CountBodyItem(own, item[2] )>=1 and
		CountBodyItem(own, item[3] )>=1 and CountBodyItem(own, item[4] )>=1 and
		CountBodyItem(own, item[5] )>=1 then                       --�ˬd�O�_��������
		for i=1 , 5 do
			DelBodyItem( own, item[i], 1 )                         --�R������
		end
		GiveBodyItem( own, 209394, 1 )                              --�������~
	else
		ScriptMessage( own, TargetID(), 1, "[SC_117939_11]" , 0 )   --�I�����Ƥ���
	end	--]]
end
function un_wepenchoice75_5()    --�ؤl
	local own = OwnerID()
	local item = {209373}
	if CountBodyItem(own, item[1] )>=3 then                       --�ˬd�O�_��������
		for i=1 , 1 do
			DelBodyItem( own, item[i], 3 )                         --�R������
		end
		GiveBodyItem( own, 209391, 1 )                              --�������~
	else
		ScriptMessage( own, own, 1, "[SC_117939_11]" , 0 )   --�I�����Ƥ���	
	end	
	CloseSpeak( own )
end
----------------------------------------------------------------------------------------------------------------
										--75�G����Z
----------------------------------------------------------------------------------------------------------------
function un_wepenchoice75_6()
	local own = OwnerID()
	local item = {209344,209345,209346,209347,209364}
	if CountBodyItem(own, item[1] )>=1 and CountBodyItem(own, item[2] )>=1 and
		CountBodyItem(own, item[3] )>=1 and CountBodyItem(own, item[4] )>=1 and
		CountBodyItem(own, item[5] )>=1 then                       --�ˬd�O�_��������
		for i=1 , 5 do
			DelBodyItem( own, item[i], 1 )                         --�R������
		end
		GiveBodyItem( own, 209397, 1 )                              --�������~
	else
		ScriptMessage( own, own, 1, "[SC_117939_11]" , 0 )   --�I�����Ƥ���
	end	
	CloseSpeak( own )
end
function un_wepenchoice75_7()  --�ƺ��������M��
	local own = OwnerID()
	local job = ReadRoleValue(own,EM_RoleValue_VOC)  --¾�~1.��2.�C3.�v4.�k5.��6.�M7.��8.��
	local item = {209348,209349,209350,209351,209352,209353,209354,209355}
	if job == 1 and CountBodyItem(own, item[5] )>=1 then
		GiveBodyItem( own, 209398, 1 )  
		DelBodyItem( own, item[5], 1 )
	elseif job == 2 and CountBodyItem(own, item[8] )>=1 then
		GiveBodyItem( own, 209398, 1 ) 
		DelBodyItem( own, item[8], 1 )
	elseif job == 3 and CountBodyItem(own, item[4] )>=1 then
		GiveBodyItem( own, 209398, 1 ) 
		DelBodyItem( own, item[4], 1 )
	elseif job == 4 and CountBodyItem(own, item[3] )>=1 then
		GiveBodyItem( own, 209398, 1)
		DelBodyItem( own, item[3], 1)		
	elseif job == 5 and CountBodyItem(own, item[2] )>=1 then
		GiveBodyItem( own, 209398, 1 ) 
		DelBodyItem( own, item[2], 1 )
	elseif job == 6 and CountBodyItem(own, item[1] )>=1 then
		GiveBodyItem( own, 209398, 1 ) 
		DelBodyItem( own, item[1], 1 )
	elseif job == 7 and CountBodyItem(own, item[7] )>=1 then
		GiveBodyItem( own, 209398, 1 ) 
		DelBodyItem( own, item[7], 1 )
	elseif job == 8 and CountBodyItem(own, item[6] )>=1 then
		GiveBodyItem( own, 209398, 1 ) 
		DelBodyItem( own, item[6], 1 )
	else
		ScriptMessage( own, own, 1, "[SC_117939_11]" , 0 )   --�I�����Ƥ���
		--CloseSpeak( own )
	end
	CloseSpeak( own )
end
function un_wepenchoice75_8()  --���V�񴵱M��
	local own = OwnerID()
	local job = ReadRoleValue(own,EM_RoleValue_VOC)  --¾�~1.��2.�C3.�v4.�k5.��6.�M7.��8.��
	local item = {209356,209357,209358,209359,209360,209361,209362,209363}
	if job == 1 and CountBodyItem(own, item[5] )>=1 then
		GiveBodyItem( own, 209399, 1 )  
		DelBodyItem( own, item[5], 1 )
	elseif job == 2 and CountBodyItem(own, item[8] )>=1 then
		GiveBodyItem( own, 209399, 1 ) 
		DelBodyItem( own, item[8], 1 )
	elseif job == 3 and CountBodyItem(own, item[4] )>=1 then
		GiveBodyItem( own, 209399, 1 ) 
		DelBodyItem( own, item[4], 1 )
	elseif job == 4 and CountBodyItem(own, item[3] )>=1 then
		GiveBodyItem( own, 209399, 1)
		DelBodyItem( own, item[3], 1)		
	elseif job == 5 and CountBodyItem(own, item[2] )>=1 then
		GiveBodyItem( own, 209399, 1 ) 
		DelBodyItem( own, item[2], 1 )
	elseif job == 6 and CountBodyItem(own, item[1] )>=1 then
		GiveBodyItem( own, 209399, 1 ) 
		DelBodyItem( own, item[1], 1 )
	elseif job == 7 and CountBodyItem(own, item[7] )>=1 then
		GiveBodyItem( own, 209399, 1 ) 
		DelBodyItem( own, item[7], 1 )
	elseif job == 8 and CountBodyItem(own, item[6] )>=1 then
		GiveBodyItem( own, 209399, 1 ) 
		DelBodyItem( own, item[6], 1 )
	else
		ScriptMessage( own, own, 1, "[SC_117939_11]" , 0 )   --�I�����Ƥ���
		--CloseSpeak( own )
	end
	CloseSpeak( own )
end
function un_wepenchoice75_9()  --��R���ȱM��
	local own = OwnerID()
	local job = ReadRoleValue(own,EM_RoleValue_VOC)  --¾�~1.��2.�C3.�v4.�k5.��6.�M7.��8.��
	local item = {209365,209366,209367,209368,209369,209370,209371,209372}
	if job == 1 and CountBodyItem(own, item[5] )>=1 then
		GiveBodyItem( own, 209400, 1 )  
		DelBodyItem( own, item[5], 1 )
	elseif job == 2 and CountBodyItem(own, item[8] )>=1 then
		GiveBodyItem( own, 209400, 1 ) 
		DelBodyItem( own, item[8], 1 )
	elseif job == 3 and CountBodyItem(own, item[4] )>=1 then
		GiveBodyItem( own, 209400, 1 ) 
		DelBodyItem( own, item[4], 1 )
	elseif job == 4 and CountBodyItem(own, item[3] )>=1 then
		GiveBodyItem( own, 209400, 1)
		DelBodyItem( own, item[3], 1)		
	elseif job == 5 and CountBodyItem(own, item[2] )>=1 then
		GiveBodyItem( own, 209400, 1 ) 
		DelBodyItem( own, item[2], 1 )
	elseif job == 6 and CountBodyItem(own, item[1] )>=1 then
		GiveBodyItem( own, 209400, 1 ) 
		DelBodyItem( own, item[1], 1 )
	elseif job == 7 and CountBodyItem(own, item[7] )>=1 then
		GiveBodyItem( own, 209400, 1 ) 
		DelBodyItem( own, item[7], 1 )
	elseif job == 8 and CountBodyItem(own, item[6] )>=1 then
		GiveBodyItem( own, 209400, 1 ) 
		DelBodyItem( own, item[6], 1 )
	else
		ScriptMessage( own, own, 1, "[SC_117939_11]" , 0 )   --�I�����Ƥ���
		--CloseSpeak( own )
	end
	CloseSpeak( own )
end
function un_wepenchoice75_10()
	local own = OwnerID()
	local item = {209373}
	if CountBodyItem(own, item[1] )>=10 then                       --�ˬd�O�_��������
		for i=1 , 1 do
			DelBodyItem( own, item[i], 10 )                         --�R������
		end
		GiveBodyItem( own, 209396, 1 )                              --�������~
	else
		ScriptMessage( own, own, 1, "[SC_117939_11]" , 0 )   --�I�����Ƥ���	
	end	
	CloseSpeak( own )
end
----------------------------------------------------------------------------------------------------------------
										--�H�U����Z�I��II
----------------------------------------------------------------------------------------------------------------
function un_wepen75_2()
	local own = OwnerID()
	--local job = ReadRoleValue(own,EM_RoleValue_VOC)  --¾�~1.��2.�C3.�v4.�k5.��6.�M7.��8.��
	LoadQuestOption( own )  --show�X�ҪO���
	local choice = {"un_wepen75get_1","un_wepen75get_2","un_wepen75get_29","un_wepen75get_3"}--�I����Ĳ�o��script
	local SpeakOption = {"[SC_117940_27]","[SC_117940_28]","[SC_117940_31]","[SC_117939_36]"}--��ܿﶵ
	local job = ReadRoleValue(own,EM_RoleValue_VOC)  --¾�~1.��2.�C3.�v4.�k5.��6.�M7.��8.��
	local flag = {544927,544928,544929,544930,544931,544932,544933,544934}  --�˹�X��
	local item = {209396,209397,209398,209399,209400}
	AddSpeakOption( own,TargetID( ),"[SC_117939_55]","un_wepen75get_30", 0 )
	
	if	(job==1 and CheckFlag(own, flag[5])== true) or (job==2 and CheckFlag(own, flag[8])== true) or
		(job==3 and CheckFlag(own, flag[4])== true) or (job==4 and CheckFlag(own, flag[3])== true) or
		(job==5 and CheckFlag(own, flag[2])== true) or (job==6 and CheckFlag(own, flag[1])== true) or
		(job==7 and CheckFlag(own, flag[7])== true) or (job==8 and CheckFlag(own, flag[6])== true) then
		AddSpeakOption( own,TargetID( ),SpeakOption[4], choice[4], 0 )
		AddSpeakOption( own,TargetID( ),SpeakOption[3], choice[3], 0 )
		AddSpeakOption( own,TargetID( ),SpeakOption[1], choice[1], 0 )
	else
		AddSpeakOption( own,TargetID( ),SpeakOption[2], choice[2], 0 )  --�L�����Ȥ~�X�{���ﶵ
	end
end
function un_wepen75get_1()  --�ǻ��ﶵ******************************
	local own = OwnerID()
	local SpeakOption = {"un_wepen75get_01","un_wepen75get_02","un_wepen75get_03","un_wepen75get_04",
					"un_wepen75get_05","un_wepen75get_06","un_wepen75get_07","un_wepen75get_08",
					"un_wepen75get_09","un_wepen75get_10","un_wepen75get_11","un_wepen75get_12",
					"un_wepen75get_13"}--�I����Ĳ�o��script
	local choice = {"[SC_117940_01]","[SC_117940_02]","[SC_117940_03]","[SC_117940_04]",
						"[SC_117940_05]","[SC_117940_06]","[SC_117940_07]","[SC_117940_08]",
						"[SC_117940_09]","[SC_117940_10]","[SC_117940_11]","[SC_117940_12]",
						"[SC_117940_13]"}--��ܿﶵ
	local job = ReadRoleValue(own,EM_RoleValue_VOC)  --¾�~1.��2.�C3.�v4.�k5.��6.�M7.��8.��
	local flag = {544919,544920,544921,544922,544923,544924,544925,544926}  --�˹�X�� 
	
	local item = {209396,209397,209398,209399,209400}
	if 	CountBodyItem( own, item[1] )>=1 and CountBodyItem( own, item[2] )>=1 and
		CountBodyItem( own, item[3] )>=1 and CountBodyItem( own, item[4] )>=1 and
		CountBodyItem( own, item[5] )>=1 then
		
		--say(OWnerID(),"1")
		if 	(job==1 and CheckFlag(own, flag[5])== true) or (job==2 and CheckFlag(own, flag[8])== true) or
			(job==3 and CheckFlag(own, flag[4])== true) or (job==4 and CheckFlag(own, flag[3])== true) or
			(job==5 and CheckFlag(own, flag[2])== true) or (job==6 and CheckFlag(own, flag[1])== true) or
			(job==7 and CheckFlag(own, flag[7])== true) or (job==8 and CheckFlag(own, flag[6])== true) then
			ScriptMessage( own, own, 1, "[SC_117940_29]" , 0 )  --�I���L�Z��
			--say(OWnerID(),"2")
			CloseSpeak( own )
		else	
		SetSpeakDetail( OwnerID(), GetString("SC_117939_38"))
		--say(OWnerID(),"3")
			if job == 1 or job == 2 or job == 3 or job == 6 then  --���z
			--say(OWnerID(),"4")
				for i=1 , 9 do
					AddSpeakOption( own,TargetID( ),choice[i], SpeakOption[i], 0 )
				end
			end	
			if job == 4 or job == 5 or job == 8  then  --�k�t 
				for i=10 , 13 do
					AddSpeakOption( own,TargetID( ),choice[i], SpeakOption[i], 0 )
				end
			end
			if  job == 7 then
				for i=1 , 4 do
					AddSpeakOption( own,TargetID( ),choice[i], SpeakOption[i], 0 )
				end
				for i=7 , 9 do
					AddSpeakOption( own,TargetID( ),choice[i], SpeakOption[i], 0 )
				end
				for i=12 , 13 do
					AddSpeakOption( own,TargetID( ),choice[i], SpeakOption[i], 0 )
				end
			end
		end
	else
		--say(OWnerID(),"1")
		CloseSpeak( OWnerID() )
		ScriptMessage( own, own, 1, "[SC_117940_30]" , 0 ) --�һs����������O�ʤ@���i�A�~��V�O�a�C
	end	

end
function un_wepen75get_2()  --�j�N�ﶵ*********************************
	local own = OwnerID()
	local choice = {"un_wepen75get_14","un_wepen75get_15","un_wepen75get_16","un_wepen75get_17",
					"un_wepen75get_18","un_wepen75get_19","un_wepen75get_20","un_wepen75get_21",
					"un_wepen75get_22","un_wepen75get_23","un_wepen75get_24","un_wepen75get_25",
					"un_wepen75get_26"}--�I����Ĳ�o��script
	local SpeakOption = {"[SC_117940_14]","[SC_117940_15]","[SC_117940_16]","[SC_117940_17]",
						"[SC_117940_18]","[SC_117940_19]","[SC_117940_20]","[SC_117940_21]",
						"[SC_117940_22]","[SC_117940_23]","[SC_117940_24]","[SC_117940_25]",
						"[SC_117940_26]"}--��ܿﶵ
	local job = ReadRoleValue(own,EM_RoleValue_VOC)  --¾�~1.��2.�C3.�v4.�k5.��6.�M7.��8.��
	local flag = {544927,544928,544929,544930,544931,544932,544933,544934}  --�˹�X��
	local item = {209391,209392,209393,209394,209395}
	if  CountBodyItem( own, item[1] )>=1 and CountBodyItem( own, item[2] )>=1 and
		CountBodyItem( own, item[3] )>=1 and CountBodyItem( own, item[4] )>=1 and
		CountBodyItem( own, item[5] )>=1 then
		
		--say(OWnerID(),"1")
		if	(job==1 and CheckFlag(own, flag[5])== true) or (job==2 and CheckFlag(own, flag[8])== true) or
			(job==3 and CheckFlag(own, flag[4])== true) or (job==4 and CheckFlag(own, flag[3])== true) or
			(job==5 and CheckFlag(own, flag[2])== true) or (job==6 and CheckFlag(own, flag[1])== true) or
			(job==7 and CheckFlag(own, flag[7])== true) or (job==8 and CheckFlag(own, flag[6])== true) then
			ScriptMessage( own, own, 1, "[SC_117940_29]" , 0 )  --�I���L�Z��
			--say(OWnerID(),"2")
			CloseSpeak( own )
			else
			SetSpeakDetail( OwnerID(), GetString("SC_117939_37"))
			--say(OWnerID(),"3")
			if job == 1 or job == 2 or job == 3 or job == 6 then  --���z
			--say(OWnerID(),"4")
				for i=1 , 9 do
					AddSpeakOption( own,TargetID( ),SpeakOption[i], choice[i], 0 )
				end
			end	
			if job == 4 or job == 5 or job == 8  then  --�k�t 
				for i=10 , 13 do
					AddSpeakOption( own,TargetID( ),SpeakOption[i], choice[i], 0 )
				end
			end
			if  job == 7 then
				for i=1 , 4 do
					AddSpeakOption( own,TargetID( ),SpeakOption[i], choice[i], 0 )
				end
				for i=7 , 9 do
					AddSpeakOption( own,TargetID( ),SpeakOption[i], choice[i], 0 )
				end
				for i=12 , 13 do
					AddSpeakOption( own,TargetID( ),SpeakOption[i], choice[i], 0 )
				end
			end
		end	
	else
		ScriptMessage( own, own, 1, "[SC_117940_30]" , 0 ) --�һs����������O�ʤ@���i�A�~��V�O�a�C
		CloseSpeak( own )
	end	
end
function un_wepen75get_3()  --�߰ݧ�j���Z���C�]�����I�^
	local Own = OwnerID()
	SetSpeakDetail( OwnerID(), GetString("SC_117939_39"))
	AddSpeakOption( own,TargetID( ),"[SC_117939_16]", "un_wepen75get_3_1", 0 )--1.�߰ݯ����C�]�����J�^
	AddSpeakOption( own,TargetID( ),"[SC_117939_18]", "un_wepen75get_3_2", 0 )--2.�߰ݲM��C�]�����K�^
	AddSpeakOption( own,TargetID( ),"[SC_117939_30]", "un_wepen75get_3_3", 0 )--3.�߰ݨ��o�a�I�C�]�����L�^
	AddSpeakOption( own,TargetID( ),"[SC_117940_31]", "un_wepen75get_29", 0 )--4.�I���ǻ����ҡ]�����M�^
end
function un_wepen75get_3_1()  --�u�߰ݯ����v�]���J�^
local Own = OwnerID()
	SetSpeakDetail( OwnerID(), GetString("SC_117939_40"))
	AddSpeakOption( own,TargetID( ),"[SC_117939_18]", "un_wepen75get_3_2", 0 )
	AddSpeakOption( own,TargetID( ),"[SC_117939_30]", "un_wepen75get_3_3", 0 )
end
function un_wepen75get_3_2()  --�u�߰ݲM��v�]���K
local Own = OwnerID()
	SetSpeakDetail( OwnerID(), GetString("SC_117939_41"))
	AddSpeakOption( own,TargetID( ),"[SC_117939_42]", "un_wepen75get_3_2_1", 0 )
	AddSpeakOption( own,TargetID( ),"[SC_117939_43]", "un_wepen75get_3_2_2", 0 )
	AddSpeakOption( own,TargetID( ),"[SC_117939_44]", "un_wepen75get_3_2_3", 0 )
	AddSpeakOption( own,TargetID( ),"[SC_117939_45]", "un_wepen75get_3_2_4", 0 )
	AddSpeakOption( own,TargetID( ),"[SC_117939_46]", "un_wepen75get_3_2_5", 0 )

end
function un_wepen75get_3_2_1()  --��y�ﶵ1
	SetSpeakDetail( OwnerID(), GetString("SC_117939_47"))
end
function un_wepen75get_3_2_2()  --��y�ﶵ2
	SetSpeakDetail( OwnerID(), GetString("SC_117939_48"))
end
function un_wepen75get_3_2_3()  --��y�ﶵ3
	SetSpeakDetail( OwnerID(), GetString("SC_117939_49"))
end
function un_wepen75get_3_2_4()  --��y�ﶵ4
	SetSpeakDetail( OwnerID(), GetString("SC_117939_50"))
end
function un_wepen75get_3_2_5()  --��y�ﶵ5
	SetSpeakDetail( OwnerID(), GetString("SC_117939_51"))
end

function un_wepen75get_3_3() --�u�߰ݨ��o�a�I�v�]���L�^
	SetSpeakDetail( OwnerID(), GetString("SC_117939_52"))
end
function un_wepen75get_01() --�ǻ�����C
	local own = OwnerID()
	local item = {209396,209397,209398,209399,209400}
	local weapen = 212771   --�Z��
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_01]")  
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --���Z��
	un_wepen75get_27()
end
function un_wepen75get_02() --�ǻ����C
	local own = OwnerID()
	local item = {209396,209397,209398,209399,209400}
	local weapen = 212772   --�Z��
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_02]") 
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --���Z��
	un_wepen75get_27()
end
function un_wepen75get_03() --�ǻ������
	local own = OwnerID()
	local item = {209396,209397,209398,209399,209400}
	local weapen = 212773   --�Z��
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_03]") 
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --���Z��
	un_wepen75get_27()
end
function un_wepen75get_04() --�ǻ�����
	local own = OwnerID()
	local item = {209396,209397,209398,209399,209400}
	local weapen = 212774   --�Z��
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_04]") 	
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --���Z��
	un_wepen75get_27()
end
function un_wepen75get_05() --�ǻ�������
	local own = OwnerID()
	local item = {209396,209397,209398,209399,209400}
	local weapen = 212775   --�Z��
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_05]") 	
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --���Z��
	un_wepen75get_27()
end
function un_wepen75get_06() --�ǻ������
	local own = OwnerID()
	local item = {209396,209397,209398,209399,209400}
	local weapen = 212776   --�Z��
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_06]") 	
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --���Z��
	un_wepen75get_27()
end
function un_wepen75get_07() --�ǻ��}
	local own = OwnerID()
	local item = {209396,209397,209398,209399,209400}
	local weapen = 212777   --�Z��
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_07]") 	
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --���Z��
	un_wepen75get_27()
end
function un_wepen75get_08() --�ǻ���
	local own = OwnerID()
	local item = {209396,209397,209398,209399,209400}
	local weapen = 212778   --�Z��
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_08]") 	
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --���Z��
	un_wepen75get_27()
end
function un_wepen75get_09() --�ǻ��P��
	local own = OwnerID()
	local item = {209396,209397,209398,209399,209400}
	local weapen = 212779  --�Z��
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_09]") 	
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --���Z��
	un_wepen75get_27()
end
function un_wepen75get_10() --�ǻ��v��(�k)
	local own = OwnerID()
	local item = {209396,209397,209398,209399,209400}
	local weapen = 212780   --�Z��
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_10]") 	
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --���Z��
	un_wepen75get_27()
end
function un_wepen75get_11() --�ǻ��v��(��)
	local own = OwnerID()
	local item = {209396,209397,209398,209399,209400}
	local weapen = 212781   --�Z��
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_11]") 	
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --���Z��
	un_wepen75get_27()
end
function un_wepen75get_12() --�ǻ�����k��
	local own = OwnerID()
	local item = {209396,209397,209398,209399,209400}
	local weapen = 212782   --�Z��
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_12]") 	
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --���Z��
	un_wepen75get_27()
end
function un_wepen75get_13() --�ǻ�����ɧ�
	local own = OwnerID()
	local item = {209396,209397,209398,209399,209400}
	local weapen = 212783   --�Z��
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_13]") 	
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --���Z��
	un_wepen75get_27()
end
function un_wepen75get_14() --�j�N����C
	local own = OwnerID()
	local item = {209391,209392,209393,209394,209395}
	local weapen = 213165   --�Z��
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_14]") 	
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --���Z��
	un_wepen75get_28()
end
function un_wepen75get_15() --�j�N���C
	local own = OwnerID()
	local item = {209391,209392,209393,209394,209395}
	local weapen = 213166   --�Z��
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_15]") 
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --���Z��
	un_wepen75get_28()
end
function un_wepen75get_16() --�j�N�����
	local own = OwnerID()
	local item = {209391,209392,209393,209394,209395}
	local weapen = 213167   --�Z��
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_16]") 
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --���Z��
	un_wepen75get_28()
end
function un_wepen75get_17() --�j�N����
	local own = OwnerID()
	local item = {209391,209392,209393,209394,209395}
	local weapen = 213168   --�Z��
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_17]") 
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --���Z��
	un_wepen75get_28()
end
function un_wepen75get_18() --�j�N������
	local own = OwnerID()
	local item = {209391,209392,209393,209394,209395}
	local weapen = 213169   --�Z��
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_18]") 
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --���Z��
	un_wepen75get_28()
end
function un_wepen75get_19() --�j�N�����
	local own = OwnerID()
	local item = {209391,209392,209393,209394,209395}
	local weapen = 213170   --�Z��
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_19]") 
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --���Z��
	un_wepen75get_28()
end
function un_wepen75get_20() --�j�N�}
	local own = OwnerID()
	local item = {209391,209392,209393,209394,209395}
	local weapen = 213171   --�Z��
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_20]") 
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --���Z��
	un_wepen75get_28()
end
function un_wepen75get_21() --�j�N��
	local own = OwnerID()
	local item = {209391,209392,209393,209394,209395}
	local weapen = 213172   --�Z��
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_21]")
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --���Z��
	un_wepen75get_28()
end
function un_wepen75get_22() --�j�N�P��
	local own = OwnerID()
	local item = {209391,209392,209393,209394,209395}
	local weapen = 213173   --�Z��
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_22]")
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --���Z��
	un_wepen75get_28()
end
function un_wepen75get_23() --�j�N�v��(�k)
	local own = OwnerID()
	local item = {209391,209392,209393,209394,209395}
	local weapen = 213174   --�Z��
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_23]")
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --���Z��
	un_wepen75get_28()
end
function un_wepen75get_24() --�j�N�v��(��)
	local own = OwnerID()
	local item = {209391,209392,209393,209394,209395}
	local weapen = 213175   --�Z��
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_24]")
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --���Z��
	un_wepen75get_28()
end
function un_wepen75get_25() --�j�N����k��
	local own = OwnerID()
	local item = {209391,209392,209393,209394,209395}
	local weapen = 213176   --�Z��
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_25]")
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --���Z��
	un_wepen75get_28()
end
function un_wepen75get_26() --�j�N����ɧ�
	local own = OwnerID()
	local item = {209391,209392,209393,209394,209395}
	local weapen = 213177   --�Z��
	local PlayerName=GetName(OwnerID())
	local MsgStr="[SC_117939_54][$SETVAR1="..PlayerName.."]"
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		RunningMsg( OwnerID() , 2 , MsgStr.."[SC_117940_26]")
	end
	for i= 1 , 5 do
		DelBodyItem( own, item[i], 1 )
	end	
	GiveBodyItem(own, weapen, 1 )  --���Z��
	un_wepen75get_28()
end
function un_wepen75get_27() --�ǻ��`�P�_*******
	local own = OwnerID()
	local job = ReadRoleValue(own,EM_RoleValue_VOC)  --¾�~1.��2.�C3.�v4.�k5.��6.�M7.��8.��
	local flag = {544919,544920,544921,544922,544923,544924,544925,544926} 
	if job == 1 then SetFlag(own,flag[5],1)                        --�����a��������
	elseif 	job == 2 then SetFlag(own,flag[8],1)
	elseif 	job == 3 then SetFlag(own,flag[4],1)
	elseif 	job == 4 then SetFlag(own,flag[3],1)
	elseif 	job == 5 then SetFlag(own,flag[2],1)
	elseif 	job == 6 then SetFlag(own,flag[1],1)
	elseif 	job == 7 then SetFlag(own,flag[7],1)
	elseif 	job == 8 then SetFlag(own,flag[6],1)
	end
	CloseSpeak( own )
end
function un_wepen75get_28() --�j�N�`�P�_*******
	local own = OwnerID()
	local job = ReadRoleValue(own,EM_RoleValue_VOC)  --¾�~1.��2.�C3.�v4.�k5.��6.�M7.��8.��
	local flag ={544927,544928,544929,544930,544931,544932,544933,544934} 
	if job == 1 then SetFlag(own,flag[5],1)                        --�����a��������
	elseif 	job == 2 then SetFlag(own,flag[8],1)
	elseif 	job == 3 then SetFlag(own,flag[4],1)
	elseif 	job == 4 then SetFlag(own,flag[3],1)
	elseif 	job == 5 then SetFlag(own,flag[2],1)
	elseif 	job == 6 then SetFlag(own,flag[1],1)
	elseif 	job == 7 then SetFlag(own,flag[7],1)
	elseif 	job == 8 then SetFlag(own,flag[6],1)
	end
	CloseSpeak( own )
end
function un_wepen75get_29() --�ǻ����ҧI���ﶵ
	local own = OwnerID()
	LoadQuestOption( own )  --show�X�ҪO���
	local choice = {"[SC_117939_07]","[SC_117939_08]","[SC_117939_09]","[SC_117939_10]",
					"[SC_117939_06]"}--�I����Ĳ�o��script
	local SpeakOption = {"un_wepenchoice75_6","un_wepenchoice75_7","un_wepenchoice75_8",
						 "un_wepenchoice75_9","un_wepenchoice75_10"}--��ܿﶵ
	for i=1 , 5 do
		AddSpeakOption( own,TargetID( ),choice[i], SpeakOption[i], 0 )
	end
end
function un_wepen75get_30() --�[���
	SetShop( TargetID( ) , 600319 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() );  --������ܵ���
	OpenShop()
end
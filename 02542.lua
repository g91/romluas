------------------------------------------------------------------------
function William_240863_01()
	local Index={}
	Index[1]=545842 --Z01_�z�s�s�S
	Index[2]=545843 --Z02_�ȴ餧��
	Index[3]=545844 --Z03_���~���
	Index[4]=545845 --Z04_������ר�
	Index[5]=545846 --Z05_���i�԰���
	Index[6]=545847 --Z06_�Я�l��
	Index[7]=545848 --Z07_��F����
	Index[8]=545849 --Z08_��ͤ��a
	Index[9]=545850 --Z09_���ϩԳǤ��s
	Index[10]=545851 --Z10_Ĭ�ƾ��ȯ��
	Index[11]=545852 --Z11_�s���s��
	Index[12]=545853 --Z15_�p�ᤧ�C
	Index[13]=545854 --Z16_�n�ǿմ���˪L
	Index[14]=545855 --Z17_�_�ǿմ���˪L
	Index[15]=545856 --Z18_�ܼ}�F�z
	Index[16]=545857 --Z19_�ƥ����S���a
	Index[17]=545858 --Z20_���g�C��
	Index[18]=545859 --Z21_��ϦL���W
	local Num=table.getn(Index)
	for i=1,table.getn(Index),1 do
		if CheckFlag( OwnerID(), Index[i] )==False then
			Num=Num-1
		else break
		end
	end
	if Num==0 then
		local x=Rand(table.getn(Index))+1
		Setflag( OwnerID(), Index[x], 1 ) --�����H�����o�������v��
	end
	GiveBodyItem( OwnerID(), 240864, 1 ) --�̺X�нs�������۹��������Ȫ��~
end
------------------------------------------------------------------------
function William_240864_01()
	ClearBorder(OwnerID()) --�۸O���e��l��

	local ZONE={}
	ZONE[545842]="[ZONE_WAILING MOUNTAINS]" --Z01_�z�s�s�S
	ZONE[545843]="[ZONE_SILVERSPRING]" --Z02_�ȴ餧��
	ZONE[545844]="[ZONE_RAVENFELL]" --Z03_���~���
	ZONE[545845]="[ZONE_ASLAN NORTH]" --Z04_������ר�
	ZONE[545846]="[ZONE_HYBORA HIGHLANDS]" --Z05_���i�԰���
	ZONE[545847]="[ZONE_DUSTBLOOM CANYON]" --Z06_�Я�l��
	ZONE[545848]="[ZONE_WEEPING COAST]" --Z07_��F����
	ZONE[545849]="[ZONE_SAVAGE LANDS]" --Z08_��ͤ��a
	ZONE[545850]="[ZONE_MOUNT AL TURAJ]" --Z09_���ϩԳǤ��s
	ZONE[545851]="[ZONE_SASCILIA STEPPES]" --Z10_Ĭ�ƾ��ȯ��
	ZONE[545852]="[ZONE_DRAGONFANG RIDGE]" --Z11_�s���s��
	ZONE[545853]="[ZONE_THUNDERHOOF_MESA]" --Z15_�p�ᤧ�C
	ZONE[545854]="[ZONE_SOUTH_JENOTAR_FOREST]" --Z16_�n�ǿմ���˪L
	ZONE[545855]="[ZONE_NORTHERN_JANOST_FOREST]" --Z17_�_�ǿմ���˪L
	ZONE[545856]="[ZONE_LYMOR_DESERT]" --Z18_�ܼ}�F�z
	ZONE[545857]="[ZONE_SINISTER_LANDS]" --Z19_�ƥ����S���a
	ZONE[545858]="[ZONE_Z20_RED_HILLS]"--Z20_���g�C��
	ZONE[545859]="[ZONE_TATURIN_GULF]" --Z21_��ϦL���W

	local NPC={}
	NPC[545842]="[119886]" --Z01_ù��
	NPC[545843]="[119887]" --Z02_���S�p
	NPC[545844]="[119888]" --Z03_����
	NPC[545845]="[119889]" --Z04_�w�J���S
	NPC[545846]="[119890]" --Z05_�d���S
	NPC[545847]="[119891]" --Z06_���Ǻ�
	NPC[545848]="[119892]" --Z07_�էJ�S
	NPC[545849]="[119893]" --Z08_�ɪ�
	NPC[545850]="[119894]" --Z09_�����d
	NPC[545851]="[119895]" --Z10_�̵ܤ�
	NPC[545852]="[119896]" --Z11_�̹F��
	NPC[545853]="[119897]" --Z15_�k�ȴ��J
	NPC[545854]="[119898]" --Z16_�����گS
	NPC[545855]="[119899]" --Z17_�J�ܺ�
	NPC[545856]="[119900]" --Z18_�p���S
	NPC[545857]="[119901]" --Z19_��h��
	NPC[545858]="[119902]" --Z20_�Z��
	NPC[545859]="[119903]" --Z21_��_��

	for Flag ,Str in pairs(ZONE) do
		if CheckFlag( OwnerID(), Flag )==True then
			local Name=NPC[Flag]
				AddBorderPage(OwnerID(), "[SC_240864_CONTENT][$SETVAR1="..Str.."][$SetVAR2="..Name.."]") --�զX�۸O���e�P����r��
		end
	end
	ShowBorder(OwnerID(),0,"[SC_240864_TITLE]","ScriptBorder_Texture_Paper") --��ܥ۸O���D"��ʫ��O"	
end
------------------------------------------------------------------------
function William_NPC425000_01() --��l�@��
	local NPC={}
	NPC[119886]=545842
	NPC[119887]=545843
	NPC[119888]=545844
	NPC[119889]=545845
	NPC[119890]=545846
	NPC[119891]=545847
	NPC[119892]=545848
	NPC[119893]=545849
	NPC[119894]=545850
	NPC[119895]=545851
	NPC[119896]=545852
	NPC[119897]=545853
	NPC[119898]=545854
	NPC[119899]=545855
	NPC[119900]=545856
	NPC[119901]=545857
	NPC[119902]=545858
	NPC[119903]=545859

	for OrgId ,FlagID in pairs(NPC) do
		if 	OrgId==ReadRoleValue ( OwnerID() , EM_RoleValue_OrgID ) then
			WriteRoleValue ( OwnerID() , EM_RoleValue_Register1, FlagID ) 
		end
	end
end
------------------------------------------------------------------------
function William_NPC425000_02() --��ܼ@��
	LoadQuestOption(OwnerID())
	local FlagID=ReadRoleValue ( TargetID() , EM_RoleValue_Register1 ) 
	if	CheckAcceptQuest(OwnerID(),425000)==TRUE and --�ˬd���a�O�_�w���o����425000
		CheckFlag( OwnerID(), FlagID)==true then --�ˬd���a�O�_�w���o���ȺX��
		AddSpeakOption(OwnerID(), TargetID(),"[SC_424976_00]"," William_NPC425000_03",0) --�W�[���s
	end
end
------------------------------------------------------------------------
function William_NPC425000_03()
	local FlagID=ReadRoleValue ( TargetID() , EM_RoleValue_Register1 )
	local Detail={}
	Detail[545842]="[SC_425000_Z01]"
	Detail[545843]="[SC_425000_Z02]"
	Detail[545844]="[SC_425000_Z03]"
	Detail[545845]="[SC_425000_Z04]"
	Detail[545846]="[SC_425000_Z05]"
	Detail[545847]="[SC_425000_Z06]"
	Detail[545848]="[SC_425000_Z07]"
	Detail[545849]="[SC_425000_Z08]"
	Detail[545850]="[SC_425000_Z09]"
	Detail[545851]="[SC_425000_Z10]"
	Detail[545852]="[SC_425000_Z11]"
	Detail[545853]="[SC_425000_Z15]"
	Detail[545854]="[SC_425000_Z16]"
	Detail[545855]="[SC_425000_Z17]"
	Detail[545856]="[SC_425000_Z18]"
	Detail[545857]="[SC_425000_Z19]"
	Detail[545858]="[SC_425000_Z20]"
	Detail[545859]="[SC_425000_Z21]"

	for SpeakID ,StringID in pairs(Detail) do
		if SpeakID==FlagID then
		   SetSpeakDetail( OwnerID(),StringID) --�f�Y���d���i
		   GiveBodyItem( OwnerID(), 240865, 1 ) --�����������Ȫ��~
		   DelBodyItem( OwnerID(),FlagID, 1 ) --�R�������X��(�����v��)
		   DelBodyItem( OwnerID(),240864, 1 ) --�R�����ȴ��ܪ��~
		end
	end
end
------------------------------------------------------------------------
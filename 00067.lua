function NPC_DuelistRewardStore_Init()		--�i�h�����ө� - ���󲣥ͼ@��
  	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor  );	--�p�a�ϱ�����Icon
end

function NPC_DuelistRewardStore()		--�i�h�����ө� - ��ܼ@��
	local Player = OwnerID()
	local Npc = TargetID()
	AdjustFaceDir( Npc , Player , 0 ) --���V
	CloseShop( Npc )
	CloseSpeak( Player )
	SetSpeakDetail( Player , "[SC_121440_01]"   )	-- �A�n�A�_�I�̡A�ڥ��b��M�@�ئW��[241706]���}�����~�C
	AddSpeakOption( Player , Npc , "[SC_ARMORCATEGORY_01][SYS_ARMORTYPE_00]" , "NPC_DuelistRewardStore_01" , 5 )	--�u�@�Z�ҿﶵ
	AddSpeakOption( Player , Npc , "[SC_ARMORCATEGORY_02][SYS_ARMORTYPE_01]" , "NPC_DuelistRewardStore_02" , 5 )	--�ݱ���ҿﶵ
	AddSpeakOption( Player , Npc , "[SC_ARMORCATEGORY_03][SYS_ARMORTYPE_02]" , "NPC_DuelistRewardStore_03" , 5 )	--�����֥ҿﶵ
	AddSpeakOption( Player , Npc , "[SC_ARMORCATEGORY_04][SYS_ARMORTYPE_03]" , "NPC_DuelistRewardStore_04" , 5 )	--�]�ɥ���ﶵ
	AddSpeakOption( Player , Npc , "[SC_ARMORCATEGORY_05][SYS_ARMORTYPE_03]" , "NPC_DuelistRewardStore_05" , 5 )	--¡�X����ﶵ
	AddSpeakOption( Player , Npc , "[SC_DUELIST_REWARD][SYS_SPECIALSUIT]" , "NPC_DuelistRewardStore_06" , 5 )	--�i�h�����Ÿ˿ﶵ
	AddSpeakOption( Player , Npc , "[AC_ITEMTYPENAME_11][BOOTY]" , "NPC_DuelistRewardStore_07" , 5 )	--��L�ԧQ�~�ﶵ
end

function NPC_DuelistRewardStore_01()	--�i�h�����ө� - �u�@�Z�ҿﶵ
	SetShop( TargetID() , 600002 , "" )	--�i�h�����ө� - �u�@�Z��
	CloseSpeak( OwnerID() )
	OpenShop()
end

function NPC_DuelistRewardStore_02()	--�i�h�����ө� - �ݱ���ҿﶵ
	SetShop( TargetID() , 600003 , "" )	--�i�h�����ө� - �ݱ����
	CloseSpeak( OwnerID() )
	OpenShop()
end

function NPC_DuelistRewardStore_03()	--�i�h�����ө� - �����֥ҿﶵ
	SetShop( TargetID() , 600004 , "" )	--�i�h�����ө� - �����֥�
	CloseSpeak( OwnerID() )
	OpenShop()
end

function NPC_DuelistRewardStore_04()	--�i�h�����ө� - �]�ɥ���ﶵ
	SetShop( TargetID() , 600005 , "" )	--�i�h�����ө� - �]�ɥ���
	CloseSpeak( OwnerID() )
	OpenShop()
end

function NPC_DuelistRewardStore_05()	--�i�h�����ө� - ¡�X����ﶵ
	SetShop( TargetID() , 600006 , "" )	--�i�h�����ө� - ¡�X����
	CloseSpeak( OwnerID() )
	OpenShop()
end

function NPC_DuelistRewardStore_06()	--�i�h�����ө� - �i�h�����Ÿ˿ﶵ
	SetShop( TargetID() , 600427 , "" )	--�i�h�����Ÿ˰ө�
	CloseSpeak( OwnerID() )
	OpenShop()
end

function NPC_DuelistRewardStore_07()	--�i�h�����ө� - ��L�ԧQ�~�ﶵ
	SetShop( TargetID() , 600185 , "" )	--�i�h�����ԧQ�~�ө�
	CloseSpeak( OwnerID() )
	OpenShop()
end
function Lua_Hao_WorldBoss_EasyMode(SN)	-- �s��
	local BonusFlag = 546926
	local BossList = {}
		BossList[1] = Global_WorldBoss_SN1
		BossList[2] = Global_WorldBoss_SN2
	if BossList[SN]==nil then
		return false;
	end
	if CheckFlag( BossList[SN] , BonusFlag ) == true then
		ScriptMessage( BossList[SN], 0, 1, "[SC_WORLDBOSS_04]", C_YELLOW );--���ߧ���²��Ҧ�
		ScriptMessage( BossList[SN], 0, 0, "[SC_WORLDBOSS_04]", C_YELLOW );--���ߧ���²��Ҧ�
		ScriptMessage( BossList[SN], 0, 0, "[SC_WORLDBOSS_05][$SETVAR1="..Global_WorldBoss_HateListData[BossList[SN]].."]", C_YELLOW );--����
		DesignLog( BossList[SN] , ReadRoleValue(BossList[SN],EM_RoleValue_OrgID) , "EasyMode" );
		SetFlag( BossList[SN] , BonusFlag , 0 )
		return true
	end
	return false
end

function Lua_Hao_WorldBoss_NormalMode(SN)	-- �s��
	local BonusFlag = 546927
	local BossList = {}
		BossList[1] = Global_WorldBoss_SN1
		BossList[2] = Global_WorldBoss_SN2
	if BossList[SN]==nil then
		return false;
	end
	if CheckFlag( BossList[SN] , BonusFlag ) == true then
		ScriptMessage( BossList[SN], 0, 1, "[SC_WORLDBOSS_03]", C_YELLOW );--���ߧ������`�Ҧ�
		ScriptMessage( BossList[SN], 0, 0, "[SC_WORLDBOSS_03]", C_YELLOW );--���ߧ������`�Ҧ�
		ScriptMessage( BossList[SN], 0, 0, "[SC_WORLDBOSS_05][$SETVAR1="..Global_WorldBoss_HateListData[BossList[SN]].."]", C_YELLOW );--����
		DesignLog( BossList[SN] , ReadRoleValue(BossList[SN],EM_RoleValue_OrgID) , "NormalMode" );
		SetFlag( BossList[SN] , BonusFlag , 0 )
		return true
	end
	return false
end

function Lua_Hao_WorldBoss_HardMode(SN)	-- �s��
	local BonusFlag = 546928
	local BossList = {}
		BossList[1] = Global_WorldBoss_SN1
		BossList[2] = Global_WorldBoss_SN2
	if BossList[SN]==nil then
		return false;
	end
	if CheckFlag( BossList[SN] , BonusFlag ) == true then
		ScriptMessage( BossList[SN], 0, 1, "[SC_WORLDBOSS_02]", C_YELLOW );--���ߧ����x���Ҧ�
		ScriptMessage( BossList[SN], 0, 0, "[SC_WORLDBOSS_02]", C_YELLOW );--���ߧ����x���Ҧ�
		ScriptMessage( BossList[SN], 0, 0, "[SC_WORLDBOSS_05][$SETVAR1="..Global_WorldBoss_HateListData[BossList[SN]].."]", C_YELLOW );--����
		DesignLog( BossList[SN] , ReadRoleValue(BossList[SN],EM_RoleValue_OrgID) , "HardMode" );
		SetFlag( BossList[SN] , BonusFlag , 0 )
		return true
	end
	return false
end

function Lua_Hao_WorldBoss_Store()

	local Owner = OwnerID()	-- Player
	local Target = TargetID()	-- Npc

--	LoadQuestOption( Owner )
	AdjustFaceDir( Target , Owner , 0 ) --���V
	CloseShop( Target )
	CloseSpeak( Owner )
	SetSpeakDetail( Owner , "[SC_WORLDBOSS_01]"   )	-- �A�n�A�_�I�̡A�ڥ��b��M�@�ئW��[241706]���}�����~�C
	AddSpeakOption( Owner , Target , "[SYS_ARMORTYPE_00]" , "Lua_Hao_WorldBoss_Store_01", 5 )	-- �Z�Ұө��ﶵ
	AddSpeakOption( Owner , Target , "[SYS_ARMORTYPE_01]" , "Lua_Hao_WorldBoss_Store_02", 5 )	-- ��Ұө��ﶵ
	AddSpeakOption( Owner , Target , "[SYS_ARMORTYPE_02]" , "Lua_Hao_WorldBoss_Store_03", 5 )	-- �֥Ұө��ﶵ
	AddSpeakOption( Owner , Target , "[ARMOR_CLOTHTYPE_01][SYS_ARMORTYPE_03]" , "Lua_Hao_WorldBoss_Store_04", 5 )	-- �]�k������ө��ﶵ
	AddSpeakOption( Owner , Target , "[ARMOR_CLOTHTYPE_02][SYS_ARMORTYPE_03]" , "Lua_Hao_WorldBoss_Store_05", 5 )	-- �v��������ө��ﶵ
	AddSpeakOption( Owner , Target , "[EQUIP_NECK][AND][EQUIP_BACK]" , "Lua_Hao_WorldBoss_Store_06", 5 )	-- ����P�ܭ��ө��ﶵ
	AddSpeakOption( Owner , Target , "[EQUIP_RING][AND][EQUIP_EARRING]" , "Lua_Hao_WorldBoss_Store_07", 5 )	-- �٫��P�����ө��ﶵ
end

function Lua_Hao_WorldBoss_Store_01()	-- �Z�Ұө��ﶵ
	SetShop( TargetID() , 600399 , "" )	-- �ǩ_���Ұө� - �Z��
	CloseSpeak( OwnerID() )
	OpenShop()
end

function Lua_Hao_WorldBoss_Store_02()	-- ��Ұө��ﶵ
	SetShop( TargetID() , 600400 , "" )	-- �ǩ_���Ұө� - ���
	CloseSpeak( OwnerID() )
	OpenShop()
end

function Lua_Hao_WorldBoss_Store_03()	-- �֥Ұө��ﶵ
	SetShop( TargetID() , 600401 , "" )	-- �ǩ_���Ұө� - �֥�
	CloseSpeak( OwnerID() )
	OpenShop()
end

function Lua_Hao_WorldBoss_Store_04()	-- �]�k������ө��ﶵ
	SetShop( TargetID() , 600402, "" )	-- �ǩ_���Ұө� - ����k��
	CloseSpeak( OwnerID() )
	OpenShop()
end


function Lua_Hao_WorldBoss_Store_05()	-- �v��������ө��ﶵ
	SetShop( TargetID() , 600403 , "" )	-- �ǩ_���Ұө� - ����v��
	CloseSpeak( OwnerID() )
	OpenShop()
end

function Lua_Hao_WorldBoss_Store_06()	-- ����P�ܭ��ө��ﶵ
	SetShop( TargetID() , 600404 , "" )	-- �ǩ_���Ұө� - ����B�ܭ�
	CloseSpeak( OwnerID() )
	OpenShop()
end

function Lua_Hao_WorldBoss_Store_07()	-- �٫��P�����ө��ﶵ
	SetShop( TargetID() , 600405 , "" )	-- �ǩ_���Ұө� - �٫��B����
	CloseSpeak( OwnerID() )
	OpenShop()
end

function Lua_Hao_WorldBoss_Create(Bonus)

	local Boss = math.floor( Bonus / 10 )
	local LV = Bonus % 10

	local Player = OwnerID()
	local BonusLV = { 546926 , 546927 , 546928 }	-- �C �� ��
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local ObjID
	local X , Y , Z , Dir  =	ReadRoleValue( Player , EM_RoleValue_X ) ,
				ReadRoleValue( Player , EM_RoleValue_Y ) ,
				ReadRoleValue( Player , EM_RoleValue_Z ) ,
				ReadRoleValue( Player , EM_RoleValue_DIR )

	if Global_WorldBoss_SN1 == nil then  
		Global_WorldBoss_SN1 = 0
	end
	if Global_WorldBoss_SN2 == nil then
		Global_WorldBoss_SN2 = 0
	end

	if Boss == 0 then
		ObjID = CreateObj( 106954 , X , Y , Z , Dir , 1 )
		Global_WorldBoss_SN1 = ObjID
	elseif Boss == 1 then
		ObjID = CreateObj( 106955 , X , Y , Z , Dir , 1 )
		Global_WorldBoss_SN2 = ObjID
	end

	SetFlag( ObjID , BonusLV[LV] , 1 )
	SetModeEx( ObjID , EM_SetModeType_Mark , true )			--�аO
	SetModeEx( ObjID , EM_SetModeType_Gravity , true )			--���O
	SetModeEx( ObjID , EM_SetModeType_DisableRotate , false )		--�����۰ʭ��V
	SetModeEx( ObjID , EM_SetModeType_Show , true )			--���
	SetModeEx( ObjID , EM_SetModeType_Move , true )			--����
	SetModeEx( ObjID , EM_SetModeType_Drag , true )			--����
	SetModeEx( ObjID , EM_SetModeType_Searchenemy , false )		--����
	SetModeEx( ObjID , EM_SetModeType_Fight , true )			--���
	MoveToFlagEnabled( ObjID , false )					--�������޼@��
	AddToPartition( ObjID , Room )
end

function Lua_DW_WBLvCheck_Table(HateList,Boss)--�ˬd����������a���ŵ{�סA�ó]�ߺX�ХH�ѱ�����P�_
	if type(HateList)~="table" then
		return
	end

	if Boss == nil then	-- 2015.05.05 �s�W���ѼơA�ץ��H���������榹�禡�ɡA����Boss��A�L�k���o�ǩ_���Ҫ����D�C(���E)
		Boss = OwnerID();
	end

--	local Boss=OwnerID();
	local Highest=Global_WorldBoss_HateListData[Boss] or 0;
	local Lv
	for SN,Player in pairs(HateList) do
		Lv=ReadRoleValue(Player,EM_RoleValue_Lv);
		if Lv>Highest then
			Highest=Lv;
		end
	end
	local BossLv=ReadRoleValue(Boss,EM_RoleValue_Lv)
	local CheckVar=2
	if BossLv-Highest>CheckVar then
		SetFlag(Boss,546928,1);
		SetFlag(Boss,546927,0);
		SetFlag(Boss,546926,0);
	elseif BossLv-Highest>=-1*CheckVar then
		SetFlag(Boss,546928,0);
		SetFlag(Boss,546927,1);
		SetFlag(Boss,546926,0);
	else
		SetFlag(Boss,546928,0);
		SetFlag(Boss,546927,0);
		SetFlag(Boss,546926,1);
	end
	Global_WorldBoss_HateListData[Boss]=Highest;
end
function Lua_DW_WBGUIDRecord(SN)--�O���@�ɤ���GUID, �í��]��X��
	Global_WorldBoss_HateListData=Global_WorldBoss_HateListData or {}
	for GUID,Lv in pairs(Global_WorldBoss_HateListData) do
		if CheckID(GUID)==false then
			Global_WorldBoss_HateListData[GUID]=nil;
		end
	end
	local BossGUID=OwnerID();
	Global_WorldBoss_HateListData[BossGUID]=0
	SetFlag(BossGUID,546926,0);
	SetFlag(BossGUID,546927,0);
	SetFlag(BossGUID,546928,0);
	local RecordFunction={};
	RecordFunction[1]=	function()
					Global_WorldBoss_SN1=BossGUID;
				end
	RecordFunction[2]=	function()
					Global_WorldBoss_SN2=BossGUID;
				end
--�]�w�����ܼ�
	RecordFunction[SN]();
	return;
end
function Lua_DW_WBGUIDSwitch(SN,Corpse)--���ɭԡA���_���ëD����A�ӬO�t�~���������A�z�L���ӱN�X�аO���ഫ�A�`�N�A�@���bBoss���W�����O�����n�ӱ`�i��
	local Boss;
	if SN==1 then
		Boss=Global_WorldBoss_SN1;
		Global_WorldBoss_SN1=Corpse;
	elseif SN==2 then
		Boss=Global_WorldBoss_SN2;
		Global_WorldBoss_SN2=Corpse;
	end

	local Highest=Global_WorldBoss_HateListData[Boss];
	Global_WorldBoss_HateListData[Boss]=nil;
	Global_WorldBoss_HateListData[Corpse]=Highest;
	local FlagBaseNumber=546926;
	for PlusNum=0,2,1 do
		if CheckFlag(Boss,FlagBaseNumber+PlusNum)==true then
			SetFlag(Corpse,FlagBaseNumber+PlusNum,1);
		end
	end
end
----------------�̧�
function LuaS_InSideWorld_0()
local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
local PlayerMaxLv = ReadRoleValue( OwnerID() , EM_RoleValue_MaxLv )
LoadQuestOption( OwnerID() )
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_INSIDEWORLD_DIALOG") , "LuaS_InSideWorld_1", 0 ) --�ڷQ�F�n�i�J�u�إ@�ɡv
	if PlayerLV >= 50 then
		if PlayerMaxLv == 50 then
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_MAXLVUP") , "LuaS_InSideWorld_2", 0 ) --�ڷQ�n�Ѱ���O�ʦL
		end
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CHANGEGOOD") , "LuaS_InSideWorld_3", 0 ) --�ڷQ�I��¾�~�M��
	end
end
-----------------
function LuaS_InSideWorld_1()
local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
	if PlayerLV < 45 then
	SetSpeakDetail( OwnerID(), GetString("SC_INSIDEWORLD_DIALOG_LVERROR")   )--�A����O�����H�Ө��Ŷ��]�k�A���A����O�j�@�I�A�ӧ�ڧa�I
	else
		if ChangeZone( OwnerID() , 52 , 0 , 3214, 44, 157 , 270 ) then		--�Ǩ�52
		end
	end
end
-----------------
function LuaS_InSideWorld_2()
	WriteRoleValue(OwnerID(),EM_RoleValue_MaxLv, 60)
	SetSpeakDetail( OwnerID(), GetString("SC_MAXLVUP_1")   )--�ڤw�g�N�A�Q�ʦL����O�Ѷ}�F�A�֥h���ɧA����O�a�I
	ScriptMessage( OwnerID(), OwnerID() , 1, GetString("SC_MAXLVUP_2"), "0xFFFFF266" )--���ߧA�I�A���̰����ŭ���ɨ�60�šC
end
-----------------����
function LuaS_InSideWorldBlack_0()
local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
local PlayerMaxLv = ReadRoleValue( OwnerID() , EM_RoleValue_MaxLv )
LoadQuestOption( OwnerID() )
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_INSIDEWORLD_DIALOG") , "LuaS_InSideWorldBlack_1", 0 ) --�ڷQ�F�n�i�J�u�إ@�ɡv
	if PlayerLV >= 50 then
		if PlayerMaxLv == 50 then
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_MAXLVUP") , "LuaS_InSideWorld_2", 0 ) --�ڷQ�n�Ѱ���O�ʦL
		end
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CHANGEGOOD") , "LuaS_InSideWorld_3", 0 ) --�ڷQ�I��¾�~�M��
	end
end
-----------------
function LuaS_InSideWorldBlack_1()
local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
	if PlayerLV < 45 then
	SetSpeakDetail( OwnerID(), GetString("SC_INSIDEWORLD_DIALOG_LVERROR")   )--�A����O�����H�Ө��Ŷ��]�k�A���A����O�j�@�I�A�ӧ�ڧa�I
	else
		if ChangeZone( OwnerID() , 56 , 0 , -21108, -177, 5922 , 270 ) then		--�Ǩ�56
		end
	end
end
----------------�̧̥X
function LuaS_OutSideWorld_0()
LoadQuestOption( OwnerID() )
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_OUTSIDEWORLD_DIALOG") , "LuaS_OutSideWorld_1", 0 ) --�ڷQ�n���}�u�إ@�ɡv
end
-----------------
function LuaS_OutSideWorld_1()
	if ChangeZone( OwnerID() , 2 , 0 , 3214, 44, 157 , 270 ) then		--�Ǩ�2
	end
end
-----------------�����X
function LuaS_OutSideWorldBlack_0()
LoadQuestOption( OwnerID() )
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_OUTSIDEWORLD_DIALOG") , "LuaS_OutSideWorldBlack_1", 0 ) --�ڷQ�n���}�u�إ@�ɡv
end
-----------------
function LuaS_OutSideWorldBlack_1()
	if ChangeZone( OwnerID() , 6 , 0 , -21108, -177, 5922 , 270 ) then		--�Ǩ�6
	end
end

----------------�����X
function LuaS_OutSideWorlddady_0()
LoadQuestOption( OwnerID() )
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_OUTSIDEWORLD_DIALOG") , "LuaS_OutSideWorld_1", 0 ) --�ڷQ�n���}�u�إ@�ɡv
end
-----------------
function LuaS_OutSideWorlddady_1()
	if ChangeZone( OwnerID() , 2 , 0 , 3214, 44, 157 , 270 ) then		--�Ǩ�2
	end
end
---------------------------------
function LuaS_InSideWorld_3()
--�ڷQ�I�����~�M��
	SetSpeakDetail( OwnerID(), GetString("SC_CHANGEGOOD_0")   )--�аݧA�n�I�����@�ءC
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CHANGEGOOD_1") , "LuaS_InSideWorld_3_1", 0 ) --�ڭn�I���Ԥh�M��
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CHANGEGOOD_2") , "LuaS_InSideWorld_3_2", 0 ) --�ڭn�I���C�L�M��
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CHANGEGOOD_3") , "LuaS_InSideWorld_3_3", 0 ) --�ڭn�I���s��M��
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CHANGEGOOD_4") , "LuaS_InSideWorld_3_4", 0 ) --�ڭn�I���k�v�M��
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CHANGEGOOD_5") , "LuaS_InSideWorld_3_5", 0 ) --�ڭn�I�����q�M��
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_CHANGEGOOD_6") , "LuaS_InSideWorld_3_6", 0 ) --�ڭn�I���M�h�M��
end

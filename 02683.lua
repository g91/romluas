function lua_skwerl_mobius_npc_town() --���̶ǰeNPC
local player=OwnerID()

		SetSpeakDetail(player, "[SKWERL_MOBIUS_42]" )
		AddSpeakOption(player, TargetID( ), "[SKWERL_MOBIUS_24]" , "lua_skwerl_mobius_mode_time", 0)--�ǰe��w�w�����v��
		AddSpeakOption(player, TargetID( ), "[SKWERL_MOBIUS_47]" , "lua_FN_mobius_NPCtrade_reward", 0)--�ǰe��w�w�����v��

end

-----------�ǰe��v�����t��------------------------------
function lua_skwerl_mobius_timemodeconfirm() --��ܭp�ɼҦ�
	Callplot(OwnerID(), "DW_ChooseOneFromTwo", OwnerID(),"[SKWERL_MOBIUS_41]","lua_skwerl_mobius_mode_time","")
end


function lua_skwerl_mobius_mode_time()
	ChangeZone(OwnerID(), 360, -1, -37.2, 961.6, 324.8, 263.3) ---�⪱�a�Ǩ���a	
end



------------------------------------------------------------------------------------------------

function lua_skwerl_mobius_npc() ---���ʲ{��NPC
	local player=OwnerID()
	if CheckFlag( player, 546722) == true then --���a���Ѫ��L���ʪ��X��
		SetSpeakDetail(player, "[SKWERL_MOBIUS_30]" )-- �A�w�g�������Ѫ��V�m�F�A�Щ��ѦA�ӡC
--		AddSpeakOption(player, TargetID( ), "[SKWERL_MOBIUS_21]" , "lua_skwerl_mobius_restart_check", 0)--��魫�s
		AddSpeakOption(player, TargetID( ), "[SKWERL_MOBIUS_39]" , "lua_skwerl_mobius_rtb", 0)--��^�Z��Ǵ���
		
	else

		SetSpeakDetail(player, "[SKWERL_MOBIUS_16]" ) --�w��Ө�v���A�A�Q�ѻP���@�ӰV�m�H ���L�Ъ`�N�A���P���V�m�Ҧ��|�����P���зǻP���y�I
		AddSpeakOption(player, TargetID( ), "[SKWERL_MOBIUS_14]" , "lua_skwerl_mobius_timemodemenu", 0)--�p�ɼҦ�
		AddSpeakOption(player, TargetID( ), "[SKWERL_MOBIUS_15]" , "lua_skwerl_mobius_survivalmodemenu", 0)--�ͦs�Ҧ�
		AddSpeakOption(player, TargetID( ), "[SKWERL_MOBIUS_39]" , "lua_skwerl_mobius_rtb", 0)--��^�Z��Ǵ���

	end
end
-------------------------------��2�h----------------------------------------------
function lua_skwerl_mobius_timemodemenu() --�p�ɼҦ�
	local player= OwnerID()
	SetSpeakDetail(player, "[SKWERL_MOBIUS_26]" ) --�p�ɼҦ�
	AddSpeakOption(player, TargetID( ), "[SKWERL_MOBIUS_25]" , "lua_skwerl_mobius_start_check", 0) --�}�l�C��
	AddSpeakOption( player, TargetID( ), "[SKWERL_MOBIUS_28]" , "lua_skwerl_mobius_rulestime", 0)--�C���W�h�P����
	AddSpeakOption( player, TargetID(), "[SC_111352_2]" , "lua_skwerl_mobius_npc", 0 ) --�^�W�@��
end

function lua_skwerl_mobius_survivalmodemenu() --�ͦs�Ҧ�
	local player= OwnerID()
	SetSpeakDetail(player, "[SKWERL_MOBIUS_27]" )  ---�ͦs�Ҧ�
	AddSpeakOption(player, TargetID( ), "[SKWERL_MOBIUS_25]" , "lua_skwerl_mobius_start_check2", 0) --�}�l�C��
	AddSpeakOption(player, TargetID( ), "[SKWERL_MOBIUS_28]" , "lua_skwerl_mobius_rulessurvival", 0)--�C���W�h�P����
	AddSpeakOption( player, TargetID(), "[SC_111352_2]" , "lua_skwerl_mobius_npc", 0 ) --�^�W�@��
end

-------------------------------��3�h----------------------------------------------

function lua_skwerl_mobius_rulestime() --�C���W�h�P����
	SetSpeakDetail( OwnerID(), "[SKWERL_MOBIUS_29]" ) 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "lua_skwerl_mobius_timemodemenu", 0 ) --�^�W�@��
end

function lua_skwerl_mobius_rulessurvival() --�C���W�h�P����
	SetSpeakDetail( OwnerID(), "[SKWERL_MOBIUS_29]" ) 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "lua_skwerl_mobius_survivalmodemenu", 0 ) --�^�W�@��
end
----------------------�^���ǰe------------------------
function lua_skwerl_mobius_rtb()---�^���T�{
	Callplot(OwnerID(), "DW_ChooseOneFromTwo", OwnerID(),"[SKWERL_MOBIUS_40]","lua_skwerl_mobius_mode_returntotown","")
end





-------------------------�C������----------------------------------------------
function lua_skwerl_mobius_start_check() ---�p�ɼҦ��T�{����
   	local player=OwnerID()	
	SetSpeakDetail(player, "[SKWERL_MOBIUS_41]" ) --�ѥ[�V�m�ݭn30��[203038]�A�A�T�w�n�ѥ[�ܡH
	AddSpeakOption(player, TargetID( ), "[SKWERL_MOBIUS_23]" , "lua_skwerl_mobius_start", 0) --�T�w
	AddSpeakOption( player, TargetID(), "[SC_111352_2]" , "lua_skwerl_mobius_timemodemenu", 0 ) --�^�W�@��
end

function lua_skwerl_mobius_start_check2() ---�ͦs�����Ҧ��T�{����
   	local player=OwnerID()	
	SetSpeakDetail(player, "[SKWERL_MOBIUS_41]" ) --�ѥ[�V�m�ݭn30��[203038]�A�A�T�w�n�ѥ[�ܡH
	AddSpeakOption(player, TargetID( ), "[SKWERL_MOBIUS_23]" , "lua_skwerl_mobius_start2", 0) --�T�w
	AddSpeakOption( player, TargetID(), "[SC_111352_2]" , "lua_skwerl_mobius_survivalmodemenu", 0 ) --�^�W�@��
end


function lua_skwerl_mobius_start() ---�p�ɼҦ�
	local player=OwnerID()
	local npc= TargetID()
	local coincount=Countbodyitem(player, 203038) --�ˬd���a�������B�N���q

	if coincount<30 then --   �p�G�����B�N������
		Closespeak(player)
		ScriptMessage(player, player, 2, "[SKWERL_MOBIUS_43]", C_SYSTEM) --�ܩ�p�A�A�S���������N��
		ScriptMessage(player, player,0, "[SKWERL_MOBIUS_43]", C_SYSTEM) --�ܩ�p�A�A�S���������N��
		return false
	end

	Delbodyitem(player, 203038, 30) --�R��30�Ӳ����B�N��
	WriteRoleValue(player, EM_RoleValue_Register+3, 1 ) --�C����{���a��ܤF�p�ɼҦ�
	Callplot(npc, "lua_skwerl_mobius_loop", player, npc, 210) --�}�l����C���p�ɼҦ�
end

function lua_skwerl_mobius_start2() --�ͦs�����Ҧ�
	local player=OwnerID()
	local npc= TargetID()
	local coincount=Countbodyitem(player, 203038) --�ˬd���a�������B�N���q
	if coincount<30 then --   �p�G�����B�N������
		Closespeak(player)
		ScriptMessage(player, player, 2, "[SKWERL_MOBIUS_43]", C_SYSTEM) --�ܩ�p�A�A�S���������N��
		ScriptMessage(player, player,0, "[SKWERL_MOBIUS_43]", C_SYSTEM) --�ܩ�p�A�A�S���������N��
		return false
	end


	Delbodyitem(player, 203038, 30) --�R��30�Ӳ����B�N��
	Callplot(npc, "lua_skwerl_mobius_loop", player, npc, 220) --�}�l����C���ͦs�����Ҧ�
end

---------------------------------���s�t��----------------------------------------------------
function lua_skwerl_mobius_restart_check() ---�ͦs�����Ҧ��T�{����
  	local player=OwnerID()	
	Callplot(player, "DW_ChooseOneFromTwo", OwnerID(),"[SKWERL_MOBIUS_22]","lua_skwerl_mobius_restart","")
end


function lua_skwerl_mobius_restart() ---���s����
	local player=OwnerID()
	local ticketcount=Countbodyitem(player, 241649) --�ˬd���a�����s��
	if ticketcount<1 then
		ScriptMessage(player, player, 2, "[SKWERL_MOBIUS_45]", C_SYSTEM) ----�A�ݭn���s��
		ScriptMessage(player, player,0, "[SKWERL_MOBIUS_45]", C_SYSTEM) ---- �A�ݭn���s��
	else
		Delbodyitem(player, 546722, 1) --�R�����ʧ����X��
		delbodyitem(player, 241649, 1) --�R�����ʭ��s��x1	
		ScriptMessage(player, player, 2, "[SKWERL_MOBIUS_46]", C_SYSTEM) ----���m���\!
		ScriptMessage(player, player,0, "[SKWERL_MOBIUS_46]", C_SYSTEM) ---- ���m���\!
	end
end




----------------------------------------------------------------------------------------------------


function lua_skwerl_mobius_mode_returntotown() ---�^��
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+4, 0)--�M��register��
	ChangeZone(OwnerID() , 2, 0, 4947.5, 109.3, -1920.9, 121.4) ---�⪱�a�Ǩ���a	
end




-----�H�U�����եΫ��O---------------------------------------------------------------------



function lua_skwerl_mobius_cheat()
	addbuff(OwnerID(), 622646, 999, -1) --�������o�d���
	Addbuff(OwnerID(), 622601, 1, -1)--��AOE��
end

function lua_skwerl_boardtest1()
WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem38 , 0 ) --����Ʒs���O���U��
Billboard_Update (OwnerID(), EM_BillboardSortType_Range, 0)  --����Ʒs���g��p���O�W
--Billboard_Update (OwnerID(), EM_BillboardSortType_AncientDreamSpace , 50)
say(OwnerID(), "reset")

end

function lua_skwerl_boardtest2a()
--	Billboard_Update (OwnerID(), EM_BillboardSortType_Range_Survival, 999)  --����Ʒs���g��p���O�W
	Billboard_TopUpdate(OwnerID() , EM_BillboardSortType_Range, 1999 )
say(OwnerID(), "uploading2a time")
end

function lua_skwerl_boardtest2b()
	Billboard_TopUpdate(OwnerID() , EM_BillboardSortType_Range, 200 )
say(OwnerID(), "uploading2b time")
end

function lua_skwerl_boardtest2c()
Billboard_Update (OwnerID(), EM_BillboardSortType_Range_Survival,0)  --����Ʒs���g��p���O�W
say(OwnerID(), "reset survival")
end


function lua_skwerl_boardtest2d()
Billboard_Update (OwnerID(), EM_BillboardSortType_Range,300)  --����Ʒs���g��p���O�W
say(OwnerID(), "300 time")
end


function lua_skwerl_timereport()
	local hour
	local min
	hour = GetSystime(1) --���o�{�b�ɶ��G��
	min = GetSystime(2) --���o�{�b�ɶ��G��
	say(OwnerID(), hour..":"..min)

end


function lua_skwerl_mobius_achievementreset() --�R���ٸ�
local player=OwnerID()
	DelBodyItem(player, 530920, 1) 
	DelBodyItem(player, 530921, 1)
	DelBodyItem(player, 530922, 1)
	DelBodyItem(player, 530923, 1)
	DelBodyItem(player, 530924, 1)
	
end


--2013/11/20�s�W���m��
function Lua_na_361_241649()
	SetFlag( OwnerID() , 546722, 0 )
end
--========================================================================
--					���a���ʧޯ�S��
--========================================================================
function Lua_jiyi_2013Flower_buffid_goal()--���b�k�N���X���ϥ��ˬdLUA�A�ΥH�ˬd�ޯ�ؼЬO�_���Ī��
	local own = OwnerID()
	local tar = TargetID()
	local TOrgID = ReadRoleValue( tar , EM_RoleValue_OrgID ) --Ū���ؼЪ��~ID
	local FlowerThief = 121711 --�Ī��ID
	if TOrgID == FlowerThief then --��ؼЪ��~ID=�Ī��ID��	 
		return true
	else 
		ScriptMessage( own , own , 1 , "[SC_2013FLOWERS_NPC_121383_13]" , 0 )--�t�Χi��"�D���ĥؼ�"
		return false
	end
end

function Lua_jiyi_2013Flower_buffid_Kick() --���a�����@���ޯ�
	local Player = OwnerID() --���a
	local FlowerThief = TargetID() --�Ī��
	local Attack = ReadRoleValue( FlowerThief , EM_RoleValue_Register2 ) --�ΨӰO�����Q����������
	local Buff = 623703  --�o��BUFF

	if Attack ~= 0 then
		for i = 1 , table.getn(z2FlowerNpc121654) do
			if z2FlowerNpc121654[i] == Player then
				ScriptMessage( Player , Player , 1 , "[SC_2013FLOWERS_NPC_121383_14] " , 0 )--�t�Χi��"�p�������F"
				NPCSAY( FlowerThief , "[SC_2013FLOWERS_NPC_121383_15]" )
				PlayMotion ( FlowerThief , 18 ) --�Ī��w�t				
				AddBuff ( Player , Buff , 2 , -1 ) --�o3��
				AddRoleValue( FlowerThief , EM_RoleValue_Register2 , -1 )
			else
				ScriptMessage( Player , z2FlowerNpc121654[i] , 1 , "[SC_2013FLOWERS_NPC_121383_16]" , 0 )--�t�Χi��"���H�������F"
				AddBuff ( z2FlowerNpc121654[i] , Buff , 0 , -1 ) --�o1��
			end
		end
	elseif Attack == 0 then	
		for i = 1 , table.getn(z2FlowerNpc121654) do
			if z2FlowerNpc121654[i] == Player then
				ScriptMessage( Player , Player , 1 , "[SC_2013FLOWERS_NPC_121383_14]" , 0 )--�t�Χi��"�p�������F"
				NPCSAY( FlowerThief , "[SC_2013FLOWERS_NPC_121383_15]" )
				PlayMotion ( FlowerThief , 18 ) --�Ī��w�t			
				AddBuff ( Player , Buff , 2 , -1 ) --�o3��
				AddRoleValue( FlowerThief , EM_RoleValue_Register2 , -1 )
			else
				ScriptMessage( Player , z2FlowerNpc121654[i] , 1 , "[SC_2013FLOWERS_NPC_121383_16]" , 0 )--�t�Χi��"���H�������F"
				AddBuff ( z2FlowerNpc121654[i] , Buff , 0 , -1 ) --�o1��
			end
		end
		DelObj( FlowerThief ) --�R�����
	end					
end

Function Lua_jiyi_2013Flower_buffid_Kick2() --���a����@�x�ũR�ޯ�
	local Player = OwnerID() --���a
	local FlowerThief = TargetID() --�Ī��
	local Attack = ReadRoleValue( FlowerThief , EM_RoleValue_Register2 ) --�ΨӰO�����Q����������
	local Buff = 623703  --�o��BUFF

	if Attack ~= 0 then
		for i = 1 , table.getn(z2FlowerNpc121654) do
			if z2FlowerNpc121654[i] == Player then
				ScriptMessage( Player , Player , 1 , "[SC_2013FLOWERS_NPC_121383_17] " , 0 )--�A��[121711]�����A�P�ɷm�^6��[121715]
				NPCSAY( FlowerThief , "[SC_2013FLOWERS_NPC_121383_15]" )
				PlayMotion ( FlowerThief , 18 ) --�Ī��w�t				
				AddBuff ( Player , Buff , 4 , -1 ) --�o5��
				AddRoleValue( FlowerThief , EM_RoleValue_Register2 , -1 )
			else
				ScriptMessage( Player , z2FlowerNpc121654[i] , 1 , "[SC_2013FLOWERS_NPC_121383_16]" , 0 )--�t�Χi��"���H�������F"
				AddBuff ( z2FlowerNpc121654[i] , Buff , 0 , -1 ) --�o1��
			end
		end
	elseif Attack == 0 then	
		for i = 1 , table.getn(z2FlowerNpc121654) do
			if z2FlowerNpc121654[i] == Player then
				ScriptMessage( Player , Player , 1 , "[SC_2013FLOWERS_NPC_121383_17]" , 0 )--�A��[121711]�����A�P�ɷm�^6��[121715]
				NPCSAY( FlowerThief , "[SC_2013FLOWERS_NPC_121383_15]" )
				PlayMotion ( FlowerThief , 18 ) --�Ī��w�t			
				AddBuff ( Player , Buff , 4 , -1 ) --�o5��
				AddRoleValue( FlowerThief , EM_RoleValue_Register2 , -1 )
			else
				ScriptMessage( Player , z2FlowerNpc121654[i] , 1 , "[SC_2013FLOWERS_NPC_121383_16]" , 0 )--�t�Χi��"���H�������F"
				AddBuff ( z2FlowerNpc121654[i] , Buff , 0 , -1 ) --�o1��
			end
		end
		DelObj( FlowerThief ) --�R�����
	end
	CancelBuff( Player , 623921 ) --�R���B�~�ޯ�					
end
--===============================================================================
--					�Ī��ޯ�
--===============================================================================
function Lua_jiyi_2013Flower_buffid_goal2()--���b�k�N���X���ϥ��ˬdLUA�A�ΥH�ˬd�ޯ�ؼЬO�_������F
	local own = OwnerID()
	local tar = TargetID()
	local TOrgID = ReadRoleValue( tar , EM_RoleValue_OrgID ) --Ū���ؼЪ��~ID
	local FlowerNpc = 121654 --����FID
	if TOrgID == FlowerNpc then --��ؼЪ��~ID=�Ī��ID��	 
		return true
	else 
		return false
	end
end

function Lua_jiyi_2013Flower_buffid_FlowerThief() --�Ī�骺�����ޯ�
	local FlowerThief = OwnerID() --�Ī��
	local FlowerNpc = TargetID() --����F
	local FlowerNum = ReadRoleValue( FlowerNpc , EM_RoleValue_Register6 ) --��������F���W�᪺�ƶq�Ѧh��
	local FlowerNpcAttacked=ReadRoleValue( FlowerNpc , EM_RoleValue_Register7 ) --��������F�Q��������

	NPCSAY( FlowerNpc , "[SC_2013FLOWERS_NPC_121654_01]") --�i�c��[121711]�A�X�������ڪ���C
 	AddBuff( FlowerNpc , 623923 , 0 , -1 ) --����F������+1
	AddRoleValue( FlowerNpc , EM_RoleValue_Register6 , -5 )
	AddRoleValue( FlowerNpc , EM_RoleValue_Register7 , -1 )
--	DebugMsg( 0 , 0 , "Reg6="..FlowerNum )
--	DebugMsg( 0 , 0 , "Reg7="..FlowerNpcAttacked )
	NPCSAY( FlowerThief , "[SC_2013FLOWERS_NPC_121711_01]")
end
--==================================================================================
--					����F�����ޯ�
--==================================================================================
function Lua_jiyi_2013Flower_buffid_FlowerNpc()--����F�����F�ɤ����ޯ�
	local FlowerNpc = OwnerID() --����F
	local NPC = SearchRangeNPC( FlowerNpc , 300 )
	local FlowerThief = 121711 --�Ī��ID	
	local FlowerNum = ReadRoleValue( FlowerNpc , EM_RoleValue_Register6 ) --��������F���W�᪺�ƶq�Ѧh��
	for i = 0 , table.getn(NPC) do
		if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID ) == FlowerThief then
			NPCSAY( NPC[i] , "[SC_2013FLOWERS_NPC_121711_02]")
			Sleep(10)
			DelObj( NPC[i] )	
		end
	end
	AddRoleValue( FlowerNpc , EM_RoleValue_Register6 , -100 )
end

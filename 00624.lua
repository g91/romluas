
function LuaS_420635_callone()
	local playerID = TargetID() --���a��id�s�J
	local followobj = CreateObj ( 100650, ReadRoleValue( OwnerID(), EM_RoleValue_X) , ReadRoleValue( OwnerID(), EM_RoleValue_Y) ,     ReadRoleValue( OwnerID(), EM_RoleValue_Z) , 0 , 1 ) --�����ɪ����X��
	SetRoleCamp( followobj  , "SNPC" )--���ܰ}��
	AddToPartition( followobj ,    0 ) --��ɪ�����i����
	WriteRoleValue (  followobj , EM_RoleValue_PID ,  playerID ) --���a��id��i�ɪ������Ȧs
	BeginPlot( followobj , "LuaS_420635", 0 )	--�R�O�ɪ�������{��
	DisableQuest( OwnerID() , true )--����������
	while 1 do
		if CheckID( followobj ) then
			
		else
			DisableQuest( OwnerID() , false )--OPEN������
			break
		end

		Sleep(10)
	end
end

function LuaS_420635()
	local s = 0 --����L���j�骺�p���ܼ�
	local w = 0 --����a���ӻ����ܼ�
	local f = 0 --�ثe����ĴX�ںX�l
	local fc =  GetMoveFlagCount( 780074 )--���h�ְ��X�l 
	local playerID = ReadRoleValue ( OwnerID() , EM_RoleValue_PID ) --�q�Ȧs�Ϥ���X���aid
	local bitch = TargetID() --��ؼаO�J�FID
	WriteRoleValue( OwnerID() ,EM_RoleValue_IsWalk , 2  )--�Ψ���
	MoveToFlagEnabled( OwnerID() , false )--�������޼@��
	sleep(10)--���@��
	while 1 do--�L���j��
		local fx = GetMoveFlagValue( 780074 , f , EM_RoleValue_X )--�춥�q�X��x
		local fy = GetMoveFlagValue( 780074 , f , EM_RoleValue_Y )--�춥�q�X��y
		local fz = GetMoveFlagValue( 780074 , f , EM_RoleValue_Z )--�춥�q�X��z
		local ox = ReadRoleValue( OwnerID(), EM_RoleValue_X)--�ۤv��x
		local oy = ReadRoleValue( OwnerID(), EM_RoleValue_Y)--�ۤv��y
		local oz = ReadRoleValue( OwnerID(), EM_RoleValue_Z)--�ۤv��z
		local tx = ReadRoleValue( TargetID(), EM_RoleValue_X)--�ؼЪ�x
		local ty = ReadRoleValue( TargetID(), EM_RoleValue_Y)--�ؼЪ�y
		local tz = ReadRoleValue( TargetID(), EM_RoleValue_Z)--�ؼЪ�z
		local hp = ReadRoleValue( OwnerID(), EM_RoleValue_HP)--�ۤv��hp
		local maxhp = ReadRoleValue( OwnerID(), EM_RoleValue_MaxHP)--�ۤv��maxhp
		
		if s > 60000 then--�Y�w����60000(�L�a�j��)
			DisableQuest( bitch , false )--��_������
			DelObj(OwnerID())--��ۤv�R��
			break--���X
		else
			s = s + 1--�p��
		end
		--�Y���a���}�ӻ��W�L�Q��
		if w > 10 then
			ScriptMessage( OwnerID(), playerID, 2 ,GetString("SAY_420635_1"),1)--�e�T���s�L����
			Sleep(10)
			DisableQuest( bitch , false )--��_������w
			DelObj(OwnerID())--��ۤv�R��
			break
		end
		--���a���Z���O�_�b�d��
		if GetDistance( OwnerID(), playerID ) > 150 then--�W�L
			ScriptMessage( OwnerID(), playerID, 2 ,GetString("SAY_420635_0"),1)--�������a
			w = w + 1--�}�l�p��
			Move( OwnerID(), ox , oy ,oz )--����
		else--�b�d��
			w = 0
			--�ۤv���S���Q����
			if hp == maxhp then--�庡
				if ( (fz/10) == (oz/10) ) and ( (fx/10)==(ox/10) ) then--��F
					if f == fc -1 then --���I
						Sleep (27)
						Say ( OwnerID() , GetString("SAY_420635_2"))--�s�G��q�����I
						CastSpell( OwnerID() , OwnerID() , 491008 )--��Ӷǰe�S��
						DisableQuest( bitch , false )--��_������
						SetFlag( playerID , 540853 , 1 )--�����ȧ��������n���~
						DelObj(OwnerID())--��ۤv�R��
					else--���O���I
						f = f + 1 --���U�@�ګe�i
					end
	
				else--�t�o��
					Move ( OwnerID() , fx , fy , fz )--���X�l�]�h
				end
			else--�S��
				Move ( OwnerID() , tx , ty , tz )--���ؼ�
			end
		end
		WriteRoleValue( OwnerID() ,EM_RoleValue_IsWalk , 2  )--�Ψ���

		sleep(10)--���@��
		
	end
end
function LuaS_DialogRePort_OneChoose(Player)
--��ƪ�l��
--�O����ɪ�zoneid�Bx�٦�z
	local FX,FZ,PX,PZ,Dis,OZone,PZone
	FX = ReadRoleValue(Player,EM_RoleValue_X)
	FZ = ReadRoleValue(Player,EM_RoleValue_Z)
	OZone = Lua_ExGetZone(Player)

	if ( DialogSendOpen( Player ) == false ) then 
		ScriptMessage( Player , Player , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--��ưe�X�����D
		return 0
	end

	local HalfSec = 0
	local DialogResult = ""
	
	while true do
		Sleep( 5 )
--�j�骺�ˬd���[�J�ϰ쪺�P�_
--�Y�ϥζǰe�N��O��zone �|�������X
		PZone = Lua_ExGetZone(Player)
		if	OZone ~= PZone	then
			CancelBuff( Player, 501570 );--�̫�M��BUFF
			DialogClose( Player )
			return 0
		end
--�j�骺�ˬd���[�J�Z�����P�_
--�Y�Z���W�L100 �h�j��������
		PX = ReadRoleValue(Player,EM_RoleValue_X)
		PZ = ReadRoleValue(Player,EM_RoleValue_Z)
--�Z�������� = x����+z����
		x = (FX-PX)^2
		z = (FZ-PZ)^2
		Dis = math.floor((x+z)^0.5)
		if	Dis > 100	then
			CancelBuff( Player, 501570 );--�̫�M��BUFF
			DialogClose( Player )
			return 0
		end
--���ݪ��a�I��
--�p�G���a���I�� �@��������X
		local DialogStatus = DialogGetResult( Player )
		HalfSec = HalfSec + 1
		if HalfSec > 120 then -- ���L�a�j��A120 = �@����
			--ScriptMessage( Player , Player , 0, "Infinity Loop", 0 )
			CancelBuff( Player, 501570 );--�̫�M��BUFF
			DialogClose( Player )
			break
		else
			--ScriptMessage( Player , Player , 0, "OK", 0 )
		end

		if ( DialogStatus > -2 ) then
			if ( DialogStatus == 0 ) then
				DialogResult = "Yes"
				CancelBuff( Player, 501570 );--�̫�M��BUFF
				DialogClose( Player )
				break
			else
				DialogResult = "Etc"
				CancelBuff( Player, 501570 );--�̫�M��BUFF
				DialogClose( Player )
				break
			end
		end
	end

	return DialogResult	
end

function ks_DialogRePort_TwoChoose( Player, Range, time )--�s�����ܮ�
	local FX,FZ,PX,PZ,Dis,OZone,PZone	
	local DialogResult
	local Sec = 0
	
	FX = ReadRoleValue( Player, EM_RoleValue_X )--����y��x
	FZ = ReadRoleValue( Player, EM_RoleValue_Z )--����y��z
	OZone = Lua_ExGetZone( Player )

	if ( DialogSendOpen( Player ) == false ) then 
		ScriptMessage( Player , Player , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--��ưe�X�����D
		return
	end

	while true do		--���ݪ��a�I��
		PZone = Lua_ExGetZone(Player)--�ϰ쪺�P�_
		if	OZone ~= PZone	then
			CancelBuff( Player, 501570 );--�̫�M��BUFF
			DialogClose( Player )
			break
		end

		PX = ReadRoleValue(Player,EM_RoleValue_X)--�ˬd��e�y��
		PZ = ReadRoleValue(Player,EM_RoleValue_Z)--�ˬd��e�y��

		x = (FX-PX)^2
		z = (FZ-PZ)^2
		Dis = math.floor((x+z)^0.5)--�D�Z��
		
		if Range == nil or Range < 50 or Range > 250 then Range = 50 end -- �Z���d��50~250		
		if	Dis > Range	then --�Y�Z���W�LRange �h�j��������
			CancelBuff( Player, 501570 );--�̫�M��BUFF
			DialogClose( Player )
			break
		end
		
		Sec = Sec + 1
		if time == nil or time < 5 or time > 60 then time = 30 end	--�ɶ��d�� 5 ~ 60��	
		if Sec >= time then  --�p�G���a���I�� time�����X
			CancelBuff( Player, 501570 );--�̫�M��BUFF
			DialogClose( Player )
			break
		end
		
		local DialogStatus = DialogGetResult( Player )		
		if ( DialogStatus > -2 ) then
			if ( DialogStatus == 0 ) then
				DialogResult = "Yes"
				CancelBuff( Player, 501570 );--�̫�M��BUFF
				DialogClose( Player )
				break
			elseif ( DialogStatus == 1 ) then
				DialogResult = "No"
				CancelBuff( Player, 501570 );--�̫�M��BUFF
				DialogClose( Player )
				break
			else
				DialogResult = "Etc"
				DialogClose( Player )
				CancelBuff( Player, 501570 );--�̫�M��BUFF
				break
			end
		end
		Sleep( 10 )
	end
	return DialogResult	
end

function LuaS_DialogRePort_TwoChoose(Player)
--��ƪ�l��
--�O����ɪ�zoneid�Bx�٦�z
	local FX,FZ,PX,PZ,Dis,OZone,PZone
	FX = ReadRoleValue(Player,EM_RoleValue_X)
	FZ = ReadRoleValue(Player,EM_RoleValue_Z)
	OZone = Lua_ExGetZone(Player)


	if ( DialogSendOpen( Player ) == false ) then 
		ScriptMessage( Player , Player , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--��ưe�X�����D
		return 0
	end

	local HalfSec = 0
	local DialogResult = ""

	while true do
		Sleep( 5 )
--�j�骺�ˬd���[�J�ϰ쪺�P�_
--�Y�ϥζǰe�N��O��zone �|�������X
		PZone = Lua_ExGetZone(Player)
		if	OZone ~= PZone	then
			CancelBuff( Player, 501570 );--�̫�M��BUFF
			DialogClose( Player )
			return 0
		end
--�j�骺�ˬd���[�J�Z�����P�_
--�Y�Z���W�L100 �h�j��������
		PX = ReadRoleValue(Player,EM_RoleValue_X)
		PZ = ReadRoleValue(Player,EM_RoleValue_Z)
--�Z�������� = x����+z����
		x = (FX-PX)^2
		z = (FZ-PZ)^2
		Dis = math.floor((x+z)^0.5)
		if	Dis > 100	then
			CancelBuff( Player, 501570 );--�̫�M��BUFF
			DialogClose( Player )
			return 0
		end
--���ݪ��a�I��
--�p�G���a���I�� �@��������X
		local DialogStatus = DialogGetResult( Player )
		HalfSec = HalfSec + 1
		if HalfSec > 120 then -- ���L�a�j��A120 = �@����
			--ScriptMessage( Player , Player , 0, "Infinity Loop", 0 )
			CancelBuff( Player, 501570 );--�̫�M��BUFF
			DialogClose( Player )
			break
		else
			--ScriptMessage( Player , Player , 0, "OK", 0 )
		end

		if ( DialogStatus > -2 ) then
			if ( DialogStatus == 0 ) then
				DialogResult = "Yes"
				CancelBuff( Player, 501570 );--�̫�M��BUFF
				DialogClose( Player )
				break
			elseif ( DialogStatus == 1 ) then
				DialogResult = "No"
				CancelBuff( Player, 501570 );--�̫�M��BUFF
				DialogClose( Player )
				break
			else
				DialogResult = "Etc"
				CancelBuff( Player, 501570 );--�̫�M��BUFF
				DialogClose( Player )
				break
			end
		end
	end

	return DialogResult	
end

function LuaS_DialogRePort_TwoChoose_40s(Player)
--��ƪ�l��
--�O����ɪ�zoneid�Bx�٦�z
	local FX,FZ,PX,PZ,Dis,OZone,PZone
	FX = ReadRoleValue(Player,EM_RoleValue_X)
	FZ = ReadRoleValue(Player,EM_RoleValue_Z)
	OZone = Lua_ExGetZone(Player)


	if ( DialogSendOpen( Player ) == false ) then 
		ScriptMessage( Player , Player , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--��ưe�X�����D
		return 0
	end

	local HalfSec = 0
	local DialogResult = ""

	while true do
		Sleep( 5 )
--�j�骺�ˬd���[�J�ϰ쪺�P�_
--�Y�ϥζǰe�N��O��zone �|�������X
		PZone = Lua_ExGetZone(Player)
		if	OZone ~= PZone	then
			CancelBuff( Player, 501570 );--�̫�M��BUFF
			DialogClose( Player )
			return 0
		end
--�j�骺�ˬd���[�J�Z�����P�_
--�Y�Z���W�L100 �h�j��������
		PX = ReadRoleValue(Player,EM_RoleValue_X)
		PZ = ReadRoleValue(Player,EM_RoleValue_Z)
--�Z�������� = x����+z����
		x = (FX-PX)^2
		z = (FZ-PZ)^2
		Dis = math.floor((x+z)^0.5)
		if	Dis > 100	then
			CancelBuff( Player, 501570 );--�̫�M��BUFF
			DialogClose( Player )
			return 0
		end
--���ݪ��a�I��
--�p�G���a���I�� 40�����X
		local DialogStatus = DialogGetResult( Player )
		HalfSec = HalfSec + 1
		if HalfSec > 80 then -- ���L�a�j��A80 = 40��
			--ScriptMessage( Player , Player , 0, "Infinity Loop", 0 )
			CancelBuff( Player, 501570 );--�̫�M��BUFF
			DialogClose( Player )
			break
		else
			--ScriptMessage( Player , Player , 0, "OK", 0 )
		end

		if ( DialogStatus > -2 ) then
			if ( DialogStatus == 0 ) then
				DialogResult = "Yes"
				CancelBuff( Player, 501570 );--�̫�M��BUFF
				DialogClose( Player )
				ScriptMessage( Player , Player , 1, "[SC_QUESTSHOW_WAIT]", 0 )
				break
			elseif ( DialogStatus == 1 ) then
				DialogResult = "No"
				CancelBuff( Player, 501570 );--�̫�M��BUFF
				DialogClose( Player )
				break
			else
				DialogResult = "Etc"
				CancelBuff( Player, 501570 );--�̫�M��BUFF
				DialogClose( Player )
				break
			end
		end
	end

	return DialogResult	
end
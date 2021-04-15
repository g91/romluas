--====================================
--			����NPC�����W�X��
--====================================
function Lua_jiyi_2013Fire_121743_SignUp()
	local Player = OwnerID() --���a
	local Npc = TargetID() --NPC
	local FireFlag = { 547369 , 547370 , 547375 , 547385 , 547386 }  --��L���y�B�w���W�ľW�B�w�ѥ[���ʡBA���u�X�СBB���u�X��
	local GameBuff = { 623869 , 623702 }	--�P�K�t��(�p��BUFF) , �t�����l��
	local BuffLv =  FN_CountBuffLevel( Player , 623702 ) --�ˬd���a���W�t�����l��BUFF
	local RanNum = DW_Rand(10)

	if CheckFlag( Player , FireFlag[1] ) == true then --�����w����X�Ю�
		SetSpeakDetail( Player , "[SC_2013FIRE_NPC_121743_01]" )  --�ڥN���̪��H�̷P�§A�����}���A���j�a�I�U�t�����O�@���C
	elseif CheckFlag( Player , FireFlag[3] ) == true then --���w�ѥ[����(�w���W���ʩ|������e)�X�Ю�
		if BuffLv >= 0 then --�p�G���I�U���x�F	
			SetSpeakDetail( Player , "[SC_2013FIRE_NPC_121743_02]" )  --�w�g�I�U�t���x�F�ܡH
			AddSpeakOption( Player , Npc , "[SC_2013FIRE_PLAYER_121743_01] " , "Lua_jiyi_2013Fire_121743_reward" , 0 )  --�O���A�ڦ��\�I�U�t���x�F�C
		elseif BuffLv < 0 then --�p�G�@�Ӥ��x���S�I�U
			if CheckBuff ( Player , GameBuff[1] ) == true then --���t�����l�](�p��BUFF) ��		
				SetSpeakDetail( Player , "[SC_2013FIRE_NPC_121743_04]" )  --�Цܤ��I�U�@�Ӥ��x			
			elseif CheckFlag ( Player , FireFlag[2] ) ==  true then --���a���w���W�ľW�X��
				SetSpeakDetail( Player , "[SC_2013FIRE_NPC_121743_02]" )  --�w�g�I�U�t���x�F�ܡH
				AddSpeakOption( Player , Npc , "[SC_2013FIRE_PLAYER_121743_02]" , "Lua_jiyi_2013Fire_121743_reward" , 0 )  --�ڦ��h�����I�U�t���x�F�C			
			end
		end		
	else			
		SetSpeakDetail( Player , "[SC_2013FIRE_NPC_121743_05]" )  --�t���x�٨S�I�U
		AddSpeakOption( Player , Npc , "[SC_2013FIRE_PLAYER_121743_03]" , "Lua_jiyi_2013Fire_121743_SignUp2" , 0 )  --�o�ͬƻ�ƤF�ܡH
	end	
end	

function Lua_jiyi_2013Fire_121743_SignUp2()
	local Player = OwnerID() --���a
	local Npc = TargetID() --NPC
	CloseSpeak( Player )	--������ܵ���
	SetSpeakDetail( Player , "[SC_2013FIRE_NPC_121743_06]" )  --���ʻ���
	AddSpeakOption( Player , Npc , "[SC_2013FIRE_PLAYER_121743_04]", "Lua_jiyi_2013Fire_121743_SignUp3" , 0 )  --�n�ڡA�ڸոլݡC
end	

function Lua_jiyi_2013Fire_121743_SignUp3()
	local Player = OwnerID() --���a
	local Npc = TargetID() --NPC
	local FireFlag = { 547370 , 547375 , 547385 , 547386 }  --�w���W�ľW�B�w�ѥ[���ʡBA���u�X�СBB���u�X��
	local Buff = { 623869 , 623893 }	--�P�K�t��(�p��BUFF)�B�i�I��BUFF
	local RanNum = DW_Rand(10)
	if RanNum == 1 or RanNum == 3 or RanNum == 5 or RanNum == 7 or RanNum == 9 then
		SetFlag( Player , FireFlag[3] , 1 ) --�}��A���u�X��
	else
		SetFlag( Player , FireFlag[4] , 1 ) --�}��B���u�X��
	end		
	DesignLog( Player , 121743 , " 2013Firegame Light A Fire event STAR" )	--�O���ѥ[�H��
	SetSpeakDetail( Player , "[SC_2013FIRE_NPC_121743_07]" )  --�X[623869]�٨S�����e�A�֥h�ޱ�[107560]�A�u���I�U�t���x�a�C
	AddBuff( Player , Buff[1] , 0 , 60 )	--�P�K�t��(�p��BUFF)
	AddBuff( Player , Buff[2] , 9 , 180 )	--�i�I��BUFF	
	SetFlag( Player , FireFlag[1] , 1 ) --�}�ҳ��W�X��
	SetFlag( Player , FireFlag[2] , 1 ) --�}�Ҥw�ѥ[���ʺX��
end

function Lua_jiyi_2013Fire_Create() --���bNPC���W���͸���@��
	local Npc = OwnerID()
	local RoomID = ReadRoleValue( Npc , EM_RoleValue_RoomID )
	local Vehicle = {}
	AddBuff( Npc , 503217 , 1 , -1 ) --�`�y�Ÿ�
	Lua_jiyi_2013Fire_CancelVehicle() --���R�����W�Ҧ�����A�ͦ��s������
	for j = 0 , 2 do
		Vehicle[j] = CreateObjByFlag( 107560 , 781258 , j , 1 ) --���͸���
		WriteRoleValue( Vehicle[j] , EM_RoleValue_PID , j ) --����g�J�ۤv��PID��
		SetModeEx( Vehicle[j] , EM_SetModeType_Strikback , false )--����
		SetModeEx( Vehicle[j] , EM_SetModeType_SearchenemyIgnore , false )--�Q�j�M
		SetModeEx( Vehicle[j] , EM_SetModeType_Obstruct , false )--����
		SetModeEx( Vehicle[j] , EM_SetModeType_Mark , true )--�аO
		SetModeEx( Vehicle[j] , EM_SetModeType_Move , true )--����
		SetModeEx( Vehicle[j] , EM_SetModeType_Searchenemy , false )--����
		SetModeEx( Vehicle[j] , EM_SetModeType_HideName , true )--�W��
		SetModeEx( Vehicle[j] , EM_SetModeType_ShowRoleHead , true )--�Y����
		SetModeEx( Vehicle[j] , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( Vehicle[j] , EM_SetModeType_Drag , false )--���O
		SetModeEx( Vehicle[j] , EM_SetModeType_Show , true )--���
		AddToPartition( Vehicle[j] , RoomID )
	end
end

function Lua_jiyi_2013Fire_BuffHide() --���b���a���W���k�N�ɶ���Ĳ�o�@��
	local Player = OwnerID() --���a
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Vehicle = ReadRoleValue( Player , EM_RoleValue_PID )
	local VehiclePID = ReadRoleValue( Vehicle , EM_RoleValue_PID )
	local NewCar = CreateObjByFlag( 107560 , 781258 , VehiclePID , 1 ) --���͸���
	WriteRoleValue( NewCar , EM_RoleValue_PID , VehiclePID ) --����g�J�ۤv��PID��
	SetModeEx( NewCar , EM_SetModeType_Strikback , false )--����
	SetModeEx( NewCar , EM_SetModeType_SearchenemyIgnore , false )--�Q�j�M
	SetModeEx( NewCar , EM_SetModeType_Obstruct , false )--����
	SetModeEx( NewCar , EM_SetModeType_Mark , true )--�аO
	SetModeEx( NewCar , EM_SetModeType_Move , true )--����
	SetModeEx( NewCar , EM_SetModeType_Searchenemy , false )--����
	SetModeEx( NewCar , EM_SetModeType_HideName , true )--�W��
	SetModeEx( NewCar , EM_SetModeType_ShowRoleHead , true )--�Y����
	SetModeEx( NewCar , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( NewCar , EM_SetModeType_Drag , false )--���O
	SetModeEx( NewCar , EM_SetModeType_Show , true )--���
	AddToPartition( NewCar , RoomID )
	DelObj(Vehicle)	
end

function Lua_jiyi_2013Fire_BuffHide2() --���b���a���W���k�NBUFF�����@��
	local Player = OwnerID() --���a
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Vehicle = ReadRoleValue( Player , EM_RoleValue_PID )
	local VehiclePID = ReadRoleValue( Vehicle , EM_RoleValue_PID )
	local NewCar = CreateObjByFlag( 107560 , 781258 , VehiclePID , 1 ) --���͸���
	WriteRoleValue( NewCar , EM_RoleValue_PID , VehiclePID ) --����g�J�ۤv��PID��
	SetModeEx( NewCar , EM_SetModeType_Strikback , false )--����
	SetModeEx( NewCar , EM_SetModeType_SearchenemyIgnore , false )--�Q�j�M
	SetModeEx( NewCar , EM_SetModeType_Obstruct , false )--����
	SetModeEx( NewCar , EM_SetModeType_Mark , true )--�аO
	SetModeEx( NewCar , EM_SetModeType_Move , true )--����
	SetModeEx( NewCar , EM_SetModeType_Searchenemy , false )--����
	SetModeEx( NewCar , EM_SetModeType_HideName , true )--�W��
	SetModeEx( NewCar , EM_SetModeType_ShowRoleHead , true )--�Y����
	SetModeEx( NewCar , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( NewCar , EM_SetModeType_Drag , false )--���O
	SetModeEx( NewCar , EM_SetModeType_Show , true )--���
	AddToPartition( NewCar , RoomID )
end

function Lua_jiyi_2013Fire_CancelVehicle()  --�R������@��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = { 107560 }
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsNPC() == true then
				local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--�T�{�Ҧ�NPC���s��
				for j = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[j] then  --�Y���}�C������
						DelObj( ID )
					end
				end
			end
		end
	end
end

function Lua_jiyi_2013Fire_121743_reward() --����y
	local Player = OwnerID() --���a
	local FireFlag = { 547369 , 547370 , 547375  , 547385 , 547386 }  --��L���y�B�w���W�ľW�B�w�ѥ[���ʡBA���u�X�СBB���u�X��
	local GameBuff = { 623869 , 623702 }	--�P�K�t��(�p��BUFF) , �t�����l��(�p��)
	local BuffLv =  FN_CountBuffLevel( Player , 623702 ) --�ˬd���a���W�t�����l��BUFF
	local Reward = { 208918 , 725654 , 240995 , 240377 } --�����`����B�������Ĥ��B���K�Ť�B���S�]��
	CloseSpeak( Player )	--������ܵ���
	if BuffLv <= 0 then --BuffLv���1
		CancelBuff( Player , GameBuff[2] )
		GiveBodyItem( Player , Reward[2] , 1 ) --���Ĥ�
	elseif BuffLv >= 1 and BuffLv <= 3 then --BuffLv2~4
		CancelBuff( Player , GameBuff[2] )
		GiveBodyItem( Player , Reward[1] , 1 ) --���@�i���ʼ���
	elseif BuffLv >= 4 and BuffLv <= 5  then --BuffLv5~6
 		CancelBuff( Player , GameBuff[2] )
		GiveBodyItem( Player , Reward[1] , 1 ) --��1�i���ʼ���
		GiveBodyItem( Player , Reward[4] , 1 ) --��1�Ӿ��S�]��
	elseif BuffLv >= 6  then 
 		CancelBuff( Player , GameBuff[2] )
		GiveBodyItem( Player , Reward[1] , 2 ) --��2�i���ʼ���
		GiveBodyItem( Player , Reward[4] , 1 ) --��1�Ӿ��S�]��	
	end
	Lua_jiyi_2013Fire_testlua()	--�R�����ʥΪ��X�СBBUFF
	GiveBodyItem( Player , Reward[3] , 2 ) --��2�Ӥ��K�Ť�
	SetSpeakDetail( Player , "[SC_2013FIRE_NPC_121743_03]" ) --���§A����U�A�Ц��U�ڭ̬��A�ǳƪ���§�C
	SetFlag( Player , FireFlag[1] , 1 )	-- �w�g����L���y
	Lua_Festival_01_All(Player)  --���Լ�
	DesignLog( Player , 1217431 , " 2013Firegame Light A Fire event OVER" )	--�O�������H��
end
--==================================
--		����@��
--==================================
function Lua_jiyi_test_vehicle() --�W�����ˬd�@��
	local own = OwnerID()
	local tar = TargetID() --���a
	local Flag = { 547375 , 547364 } --�w�ѥ[���ʡB�W�U����X��
	local Buff = 623869
	if CheckBuff( tar , Buff ) == true and CheckFlag( tar , Flag[2] ) == false then 
		local secondseat = Lua_Mounts_Copilot( tar )--���L�M�����H�y�M
		if secondseat == false then --���b��y
			ScriptMessage( tar , tar , 1 , "[SC_2012_TEACATODO_WARNING6]" , 0 ) --"�M�����M�ɵL�k�i�榹�ʧ@�A�Х��Ѱ��M�����A�C"
			return false
		else
			return true
		end
	else 
		ScriptMessage( tar , tar , 1 , "[SC_2013FIRE_NPC_107560_01]" , 0 )--�t�Χi��"�L�k�ϥ�"
		return false
	end
end

function Lua_jiyi_test_vehicle2() --���եβM�������ˬd�κX�СB�j��Ѱ����a�P���㪺�s���P�ɧR������
	local Own = OwnerID() --���a
	local Flag = 547364 --�W�U����X��
	WriteRoleValue( Own , EM_RoleValue_Register5 , 0 ) --�N���a���W�O���k0
	DetachObj( Own ) --�R�����a�P���㪺�s��
	SetFlag( Own , Flag , 0 ) --�M���W����X��
end	

function Lua_jiyi_test_bufftest( seat , UpDown ) --�W����@��
	local Player = OwnerID() --���a
	local Vehicle = TargetID() --����
	local Buff = { 623869  , 623893 }	--�P�K�t��(�p��BUFF)�B�i�I��BUFF
	local Flag = { 547364 , 547385 , 547386 , 547390 , 547391 , 547392 , 547393 , 547394 , 547500 , 547501 }  --�W�U����X�СBA���u�X�СBB���u�X�СB���x1�B���x2�B���x3�B���x4�B���x5�B���x6�B���x7
	if UpDown == 1 then --�W����
		SetFlag( Player , Flag[1] , 1 ) --���a�W����X��
		AddBuff( Vehicle , 623892 , 0 , -1 )	 --���㲣�ͯS��
		AddBuff( Player , 623995 , 0 , 30 )	--�P�_����O�_����BUFF
		WriteRoleValue( Vehicle , EM_RoleValue_Register1 , 1 ) --����㪺�ȳ��g��1
		WriteRoleValue( Player , EM_RoleValue_PID , Vehicle ) --�����a�O�����	 
	elseif UpDown == 0 then --�U����
		for i = 1 , 10 do
			SetFlag( Player , Flag[i] , 0 ) --�����X��
		end
		CancelBuff( Player , Buff[2] ) --�R���i�I��BUFF
		WriteRoleValue( Player , EM_RoleValue_PID , 0 ) --�N���a���W�O���k0
		WriteRoleValue( Player , EM_RoleValue_Register5 , 0 ) --�N���a���W�O���k0
		WriteRoleValue( Player , EM_RoleValue_Register6 , 0 ) --�N���a���W�O���k0		
		CancelBuff( Player , Buff[1] )--�R���P�K�t��(�p��BUFF)	
		ScriptMessage( Player , Player , 1 , "[SC_2013FIRE_NPC_107560_02]" , 0 )--�t�Χi��"���ʵ����A�ЦV[121743]�^�Х��ȡC"	
		DelObj( Vehicle ) --�R������ 		
	end		
end
--============================================
--			���x��Ĳ�I�@��
--=============================================
function Lua_jiyi_A_FireTouch() --�S���������x
	local Fire = OwnerID()
	local Player = TargetID()
		
	SetPlot( Fire , "Range" , "Lua_jiyi_A_FireTouch2" , 30 )

end

function Lua_jiyi_A_FireTouch2()
	local Player = OwnerID() --���a
	local Fire = TargetID() --���x
	local FireFlag = { 547369 , 547370 , 547375 , 547364 , 547385 , 547386 }  --��L���y�B�w���W�ľW�B�w�ѥ[���ʡB�W�U����X�СBA���u�X�СBB���u�X��
	local Flag = { 547390 , 547391 , 547392 , 547393 , 547394 , 547500 , 547501 } --�U���x�X��
	local PID = ReadRoleValue( Fire , EM_RoleValue_PID ) --���xPID��
	local Torch = { 121828 , 121830 , 121831 , 121832 , 121833 , 121745 , 121749 } --���uA�Ӥ��x�������t���K
	local TorchB = { 121829 , 121834 , 121835 , 121836 , 121837 , 121770 , 121838 } --���uB�Ӥ��x�������t���K	
	local Buff = { 623869 , 623702 , 623870 , 623893 }	--�P�K�t��(�p��BUFF)�B�t�����l��(�p��BUFF)�B�I���S�ġB�i�I��BUFF
	local Count = ReadRoleValue( Player , EM_RoleValue_Register6 ) --�����a�O��ۤv�I�F�X�Ӥ��x
	local BuffLv =  FN_CountBuffLevel( Player , 623893 ) --�ˬd���a���W�i�I��BUFF
	
	if CheckFlag( Player , FireFlag[5] ) == true then --��A���u�X�Ю�
		if CheckFlag( Player , FireFlag[4] ) == true then --���W����X��
			if Count == 7 then
				ScriptMessage( Player , Player , 1 , "[SC_2013FIRE_NPC_107560_05]" , 0 )--�t�Χi��
			else	
				if Checkflag(Player, Flag[PID] )  == true then  -- ���a�w�I�U�����x
					ScriptMessage( Player , Player , 1 , "[SC_2013FIRE_NPC_107560_03]" , 0 )--�t�Χi���e�i�I�U�U�@�Ӹt���x�a�C	
				else  -- ���a�٨S�I�L�����x
					SetFlag( Player , Flag[PID] , 1 ) --���}���������x�X��
					AddBuff( Player , Buff[2] , 0 , -1 ) --�t�����l��(�p��BUFF)
					AddBuff( Fire , Buff[3] , 0 , 3 ) --�I�����S��						
					AddRoleValue( Player , EM_RoleValue_Register6 , 1 ) --���a�I���x����+1
					if BuffLv ~= 0 then
						local NewBuffLv = FN_CountBuffLevel( Player , Buff[4] ) --�ˬd���a���W�i�I��BUFF
						CancelBuff( Player , Buff[4] )
						AddBuff( Player , Buff[4] , (NewBuffLv - 1) , -1 ) --�i�I��BUFF
--					else
--						ScriptMessage( Player , Player , 1 , "[SC_2013FIRE_NPC_107560_06]" , 0 )--�Х���M�t���Ť�W�W�[�Ť��q
					end
				end
			end
		else
			ScriptMessage( Player , Player , 1 , "[SC_2013FIRE_NPC_107560_04]" , 0 )--�t�Χi���оޱ�[107560]�Ӷi�次�ʡC
		end
	end		
end 

function Lua_jiyi_B_FireTouch() --B���u���x
	local Fire = OwnerID()
	local Player = TargetID()
		
	SetPlot( Fire , "Range" , "Lua_jiyi_B_FireTouch2" , 30 )

end

function Lua_jiyi_B_FireTouch2() --B���u���x
	local Player = OwnerID() --���a
	local Fire = TargetID() --���x
	local FireFlag = { 547369 , 547370 , 547375 , 547364 , 547385 , 547386 }  --��L���y�B�w���W�ľW�B�w�ѥ[���ʡB�W�U����X�СBA���u�X�СBB���u�X��
	local Flag = { 547390 , 547391 , 547392 , 547393 , 547394 , 547500 , 547501 } --�U���x�X��
	local PID = ReadRoleValue( Fire , EM_RoleValue_PID ) --���xPID��
	local Torch = { 121828 , 121830 , 121831 , 121832 , 121833 , 121745 , 121749 } --���uA�Ӥ��x�������t���K
	local TorchB = { 121829 , 121834 , 121835 , 121836 , 121837 , 121770 , 121838 } --���uB�Ӥ��x�������t���K	
	local Buff = { 623869 , 623702 , 623870 , 623893 }	--�P�K�t��(�p��BUFF)�B�t�����l��(�p��BUFF)�B�I���S�ġB�i�I��BUFF
	local Count = ReadRoleValue( Player , EM_RoleValue_Register6 ) --�����a�O��ۤv�I�F�X�Ӥ��x
	local BuffLv =  FN_CountBuffLevel( Player , 623893 ) --�ˬd���a���W�i�I��BUFF
	
	if CheckFlag( Player , FireFlag[6] ) == true then --��B���u�X�Ю�
		if CheckFlag( Player , FireFlag[4] ) == true then --���W����X��
			if Count == 7 then
				ScriptMessage( Player , Player , 1 , "[SC_2013FIRE_NPC_107560_05]" , 0 )--�t�Χi��
			else	
				if Checkflag(Player, Flag[PID] )  == true then  -- ���a�w�I�U�����x
					ScriptMessage( Player , Player , 1 , "[SC_2013FIRE_NPC_107560_03]" , 0 )--�t�Χi���e�i�I�U�U�@�Ӹt���x�a�C	
				else  -- ���a�٨S�I�L�����x
					SetFlag( Player , Flag[PID] , 1 ) --���}���������x�X��
					AddBuff( Player , Buff[2] , 0 , -1 ) --�t�����l��(�p��BUFF)
					AddBuff( Fire , Buff[3] , 0 , 3 ) --�I�����S��						
					AddRoleValue( Player , EM_RoleValue_Register6 , 1 ) --���a�I���x����+1
					if BuffLv ~= 0 then
						local NewBuffLv = FN_CountBuffLevel( Player , Buff[4] ) --�ˬd���a���W�i�I��BUFF
						CancelBuff( Player , Buff[4] )
						AddBuff( Player , Buff[4] , (NewBuffLv - 1) , -1 ) --�i�I��BUFF
--					else
--						ScriptMessage( Player , Player , 1 , "[SC_2013FIRE_NPC_107560_06]" , 0 )--�Х���M�t���Ť�W�W�[�Ť��q
					end
				end
			end
		else
			ScriptMessage( Player , Player , 1 , "[SC_2013FIRE_NPC_107560_04]" , 0 )--�t�Χi���оޱ�[107560]�Ӷi�次�ʡC
		end
	end		
end 
--=============================================
--			���ի��O
--=============================================
function Lua_jiyi_2013Fire_testlua() --�R���Ҧ����a���W���X�СBBUFF
	local Player = OwnerID()
	local FireFlag = { 547369 , 547370 , 547364 , 547375 , 547385 , 547386 , 547390 , 547391 , 547392 , 547393 , 547394 , 547500 , 547501 }  --��L���y�B�w���W�ľW�B�W�U����X�СB�w�ѥ[���ʡBA���u�X�СBB���u�X�СB���x1�B���x2�B���x3�B���x4�B���x5�B���x6�B���x7
	local GameBuff = { 623869 , 623702 , 623893 , 623995 }	--�P�K�t��(�p��BUFF) , �t�����l�� , �t���]BUFF , �P�_����O�_����BUFF
	WriteRoleValue( Player , EM_RoleValue_PID , 0 ) --�N���a���W�O���k0
	WriteRoleValue( Player , EM_RoleValue_Register5 , 0 )
	WriteRoleValue( Player , EM_RoleValue_Register6 , 0 )	
	for i = 1 , 13 do
		setflag( Player , FireFlag[i] , 0 ) --�����Ҧ��X��
	end

	for i = 1 , 4 do
		CancelBuff( Player , GameBuff[i] ) --�R������BUFF
	end
end

function Lua_jiyi_2013Fire_testlua2(lv) --���դ���
	local Player = OwnerID()
	AddBuff( Player , 623702 , lv , -1 )
end

function Lua_jiyi_2013Fire_testlua3(lv) --���եi�I��BUFF
	local Player = OwnerID()
	AddBuff( Player , 623893 , lv , -1 )
end


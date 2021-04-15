--===========================================================
--				���WNPC121870��ܼ@��
--===========================================================
function Lua_jiyi_121870_4th()
	local Player = OwnerID() --���a
	local Npc = TargetID() --NPC
	local ActiveFlag = { 547574 , 547539 }--���w��L���y�B���ʶi�椤
	local ActiveBuff = { 624037 , 623871 , 624009 } --�����ʧޯ� , �o��BUFF , �l�ꥭ�x
--	AddBuff( Npc , 503217 , 1 , -1 ) --�`�y�Ÿ�
	if CheckFlag( Player , ActiveFlag[1] ) == true then --���w��L���y
		SetSpeakDetail( Player , "[SC_DE_4TH_NPC_121870_01]" ) --�P�§A���ڧ�Ӥ@��623871
	elseif CheckFlag( Player , ActiveFlag[2] ) == true then --���W�����ʶi�椤�X�Ю�
		if CheckBuff( Player , ActiveBuff[1] ) == true  then --�����ʧޯ�B�٨S���p���y
			SetSpeakDetail( Player , "[SC_DE_4TH_NPC_121870_02]" ) --��P�Űl�v[121865]�a�C  			 	
		elseif CheckBuff( Player , ActiveBuff[2] ) == true then --���o��BUFF(��������)
			SetSpeakDetail( Player , "[SC_DE_4TH_NPC_121870_03]" )  --�A���ڱa�^[623871]�F�ܡH
			AddSpeakOption( Player , Npc , "[SC_DE_4TH_NPC_121870_04]" , "Lua_jiyi_121870_4th_reward" , 0 )  --�ڧ��F
		else --�p���yBUFF������
			SetSpeakDetail( Player , "[SC_DE_4TH_NPC_121870_06]" ) --�A���Ѥw�g�����L[121865]�F�A����L�H�]�Ӹոլݧa�C
		end  			
	else
		SetSpeakDetail( Player , "[SC_DE_4TH_NPC_121870_07]" )  --�A�@�N���U�ڪ��P�ŹڷQ���u�ܡH
		AddSpeakOption( Player , Npc , "[SC_DE_4TH_NPC_121870_08]" , "Lua_jiyi_121870_4th_2" , 0 )  --�ڸӫ�����U�A�O�H
	end		
end

function Lua_jiyi_121870_4th_2()
	local Player = OwnerID() --���a
	local Npc = TargetID() --Npc
	CloseSpeak( Player )	--������ܵ���
	SetSpeakDetail( Player , "[SC_DE_4TH_NPC_121870_09]" )  --���ʻ���
	AddSpeakOption( Player , Npc , "[SC_DE_4TH_NPC_121870_10]", "Lua_jiyi_121870_4th_3" , 0 )  --�n�A�ڸոլݡC
end	

function Lua_jiyi_121870_4th_3()
	local Player = OwnerID() --���a
	local Npc = TargetID() --Npc
	local ActiveFlag = 547539 --���ʶi�椤
	local ActiveBuff = 624037 --�����ʧޯ� 
	CloseSpeak( Player )	--������ܵ���
	SetSpeakDetail( Player , "[SC_DE_4TH_NPC_121870_11]" )  --����A�֨�P�Űl�v[121865]�a�C
	AddBuff( Player , ActiveBuff , 0 , -1 ) --�����ʧޯ�
	SetFlag( Player , ActiveFlag , 1 ) --���}���ʶi�椤�X��
	DesignLog( Player , 121870 , "4th event STAR" )	--�O���ѥ[�H��
	Callplot( Player , "Hao_Check_Cancel_Buff_Distance", Npc , 250 , ActiveBuff , "[SC_DE_4TH_NPC_121870_17]" , 200 , "[SC_DE_4TH_NPC_121870_18]" )	-- �W�L�Z���Y�R�� Buff�B�ֶW�L�Z������
--Hao_Check_Cancel_Buff_Distance( Npc , Range , Buff , Msg , Range2 , Msg2 )
-- �����I��npc�B�ˬd�d��b�|�B�R��Buff�B���ܰT���r��B�ˬd�d��b�|2�B���ܰT���r��2�C
end	

function Lua_jiyi_121870_4th_reward()
	local Player = OwnerID() --���a
	local Npc = TargetID() --npc
	local ActiveFlag = { 547574 , 547539 }--���w��L���y�B���ʶi�椤
	local ActiveBuff = { 624037 , 623871 } --�����ʧޯ� , �o��BUFF
	local Reward = 209561  --���y�G���ʼ���
	CloseSpeak( Player )
	if CheckBuff( Player , ActiveBuff[2] ) == true then 
		CancelBuff( Player , ActiveBuff[1] ) --�R�����ʧޯ� 
		CancelBuff( Player , ActiveBuff[2] ) --�R���o��BUFF
		GiveBodyItem( Player , Reward , 1 ) 
	end
	SetSpeakDetail( Player , "[SC_DE_4TH_NPC_121870_05]" ) --�o�̦��@�i[209561]�N��@���§A���ڮ����s���ƪ���§�a�C
	SetFlag( Player , ActiveFlag[2] , 0 ) --�������ʶi�椤�X��
	SetFlag( Player , ActiveFlag[1] , 1 ) -- �w�g����L���y
	DesignLog( Player , 1218701 , "4th event OVER" )	--�O�������H��
end

--============================================================
--				NPC�g�Y�y�����󲣥�(����)�@��
--============================================================
function Lua_jiyi_test0128() --�g�Y�y���ʼҦ�
	local Ball = OwnerID()
	local Range = 20
	local BallX = ReadRoleValue( Ball , EM_RoleValue_X )
	local BallY = ReadRoleValue( Ball , EM_RoleValue_Y )
	local BallZ = ReadRoleValue( Ball , EM_RoleValue_Z )
	WriteRoleValue( Ball , EM_RoleValue_Register1 , BallX )
	WriteRoleValue( Ball , EM_RoleValue_Register2 , BallY )
	WriteRoleValue( Ball , EM_RoleValue_Register3 , BallZ )
--	SetModeEx( Ball  , EM_SetModeType_ShowRoleHead , false )--�Y����
	MoveToFlagEnabled( Ball , false )-- �������޼@�� 	
	Hao_Obj_Mobile( Ball , 3 , Range , 1 ) -- ����B���ʤ覡�B�Z���B�O�_�|�Ӧ^
						-- Mobile = 1 �ɡA���T�w�W�U���ʡB2 �ɬ��T�w���k���ʡB3�ɬ��H�@���I���_�l�I�A�üƲ��ʤW�U���k
end
--==============================================================
--				121866���󲣥ͼ@��
--==============================================================
function Lua_jiyi_121866_move()
	local Ball = OwnerID()

	local Range = 20 
	SetModeEx( Ball  , EM_SetModeType_ShowRoleHead , false )--�Y����
	CallPlot( Ball , "Lua_jiyi_121866_4th" , 0 )	
	MoveToFlagEnabled( Ball , false )-- �������޼@�� 	
	Hao_Obj_Mobile( Ball , 3 , Range , 1 ) -- ����B���ʤ覡�B�Z���B�O�_�|�Ӧ^
						-- Mobile = 1 �ɡA���T�w�W�U���ʡB2 �ɬ��T�w���k���ʡB3�ɬ��H�@���I���_�l�I�A�üƲ��ʤW�U���k�Bloop��0�榸�Ӧ^=1���ƨӦ^
end	

function Lua_jiyi_121866_4th()
	local Ball = OwnerID()
	local OldBall = 121865
	local RoomID = ReadRoleValue( Ball , EM_RoleValue_RoomID )
	local BallX = ReadRoleValue( Ball , EM_RoleValue_Register1 )
	local BallY = ReadRoleValue( Ball , EM_RoleValue_Register2 )
	local BallZ = ReadRoleValue( Ball , EM_RoleValue_Register3 )
	local Time = 0

	for i = 1 , 10 do
		Time = Time + 1
		if Time == 10 then
			Hide( Ball )
			SetPos( Ball , BallX , BallY , BallZ , 0 )
			WriteRoleValue( Ball , EM_RoleValue_IsWalk , 1 )
			Sleep(10)
			ChangeObjID( Ball , OldBall ) --�ܦ^�g�Y�y	
			show( OldBall , RoomID )
		end
	Sleep(10)
	end
end
--==============================================================
--				121867���󲣥ͼ@��
--==============================================================
function Lua_jiyi_121867_move()
	local Ball = OwnerID()
	local Range = 5 + rand( 20 ) 
	SetModeEx( Ball  , EM_SetModeType_ShowRoleHead , false )--�Y����
	CallPlot( Ball , "Lua_jiyi_121867_4th" , 0 )	
	MoveToFlagEnabled( Ball , false )-- �������޼@�� 	
	Hao_Obj_Mobile( Ball , 3 , Range , 1 ) -- ����B���ʤ覡�B�Z���B�O�_�|�Ӧ^
						-- Mobile = 1 �ɡA���T�w�W�U���ʡB2 �ɬ��T�w���k���ʡB3�ɬ��H�@���I���_�l�I�A�üƲ��ʤW�U���k�Bloop��0�榸�Ӧ^=1���ƨӦ^
end	

function Lua_jiyi_121867_4th()
	local Ball = OwnerID()
	local OldBall = 121865
	local RoomID = ReadRoleValue( Ball , EM_RoleValue_RoomID )
	local BallX = ReadRoleValue( Ball , EM_RoleValue_Register1 )
	local BallY = ReadRoleValue( Ball , EM_RoleValue_Register2 )
	local BallZ = ReadRoleValue( Ball , EM_RoleValue_Register3 )
	local Time = 0

	for i = 1 , 10 do
		Time = Time + 1
		if Time == 10 then
			Hide( Ball )
			SetPos( Ball , BallX , BallY , BallZ , 0 )
			WriteRoleValue( Ball , EM_RoleValue_IsWalk , 1 )
			Sleep(10)
			ChangeObjID( Ball , OldBall ) --�ܦ^�g�Y�y	
			show( OldBall , RoomID )
		end
	Sleep(10)
	end
end
--=================================================================
--				�����ޯ����@��
--=================================================================
function Lua_jiyi_850559_Germany4() --�����ޯ઺�ˬdLUA
	local own = OwnerID()
	local tar = TargetID()
	local TOrgID = ReadRoleValue( tar , EM_RoleValue_OrgID ) --Ū���ؼЪ��~ID
	local Ball = { 121866 , 121867 } --�i�������g�Y�yID
	for i = 1 , 2 do
		if TOrgID == Ball[i] then 
			return true
		end
	end
	ScriptMessage( own , own , 1 , "[SC_DE_4TH_NPC_121870_12]" , 0 )--�t�Χi��"�D���ĥؼ�"
	return false
end

function Lua_jiyi_850559_4th() --����������@��
	local Player = OwnerID() --���a
	local Ball = TargetID() --�g�Y�y
	local TOrgID = ReadRoleValue( Ball , EM_RoleValue_OrgID ) --Ū���ؼЪ��~ID
	local OldBall = 121865
	local NewBall = { 121866 , 121867 } --�i�������g�Y�yID
	local ActiveBuff = 624037 --�����ʧޯ�
	local RanNum = DW_Rand(10)
	local BallX = ReadRoleValue( Ball , EM_RoleValue_Register1 )
	local BallY = ReadRoleValue( Ball , EM_RoleValue_Register2 )
	local BallZ = ReadRoleValue( Ball , EM_RoleValue_Register3 )
	if TOrgID == NewBall[1] then --���e�e�g�Y�y
		ScriptMessage( Player , Player , 1 , "[SC_DE_4TH_NPC_121870_13]" , 0 ) --�A����[623871]�F�C
		AddBuff( Player , 623871 , 0 , 600 ) --���o��BUFF10����
		CancelBuff( Player , ActiveBuff )
		ScriptMessage( Player , Player , 2 , "[SC_DE_4TH_NPC_121870_14]" , 0 )--�t�Χi��"���ʵ���"		
		CallPlot( Ball , "Lua_jiyi_107328_show" , BallX , BallY , BallZ ) --���æA��{	
	elseif TOrgID == NewBall[2] then--�������g�Y�y
		if RanNum == 2 or RanNum == 4 or RanNum == 6 or RanNum == 9 then
			ScriptMessage( Player , Player , 1 , "[SC_DE_4TH_NPC_121870_13]" , 0 )--�A����[121865]�F�C
			AddBuff( Player , 623871 , 0 , 600 ) --���o��BUFF10����
			CancelBuff( Player , ActiveBuff )
			ScriptMessage( Player , Player , 2 , "[SC_DE_4TH_NPC_121870_14]" , 0 )--�t�Χi��"���ʵ���"
			CallPlot( Ball , "Lua_jiyi_107328_show" , BallX , BallY , BallZ ) --���æA��{				
		else
			ScriptMessage( Player , Player , 1 , "[SC_DE_4TH_NPC_121870_16]" , 0 ) --[121867]ĵ�٦a�����F�C
			WriteRoleValue( Ball , EM_RoleValue_IsWalk , 0 )
		end
	end
end

function Lua_jiyi_107328_show( BallX , BallY , BallZ )
	local Ball = OwnerID()
	local RoomID = ReadRoleValue( Ball , EM_RoleValue_RoomID )	
	local OldBall = 121865
	Hide( Ball )	
	SetPos( Ball , BallX , BallY , BallZ , 0 )
	Sleep(100)
	ChangeObjID( Ball , OldBall ) --�ܦ^�g�Y�y	
	show( OldBall , RoomID )
end
--===================================================================
--				�޻��ޯ����@��
--===================================================================
function Lua_jiyi_850556_Germany4() --�޻��ޯ�(���b�򥻪k�N)���ˬdLUA
	local own = OwnerID()
	local tar = TargetID()
	local TOrgID = ReadRoleValue( tar , EM_RoleValue_OrgID ) --Ū���ؼЪ��~ID
	local Ball = 121865--�i�޻����g�Y�yID

	if TOrgID == Ball then 
		return true
	else 
		ScriptMessage( own , own , 1 , "[SC_DE_4TH_NPC_121870_15]" , 0 )--�t�Χi��"�D[850556]�ϥΥؼСC"
		return false
	end		
end

function Lua_jiyi_850556_4th()
	local Player = OwnerID() --���a
	local Ball = TargetID() --�g�Y�y
	local BallX = ReadRoleValue( Ball , EM_RoleValue_Register1 )
	local BallY = ReadRoleValue( Ball , EM_RoleValue_Register2 )
	local BallZ = ReadRoleValue( Ball , EM_RoleValue_Register3 )
	local RanNum = DW_Rand(10)
	AdjustFaceDir( Ball , Player , 0 ) 	--�ϥؼЭ��V�ۤv
	Lua_MoveLine( Ball , RanNum )	--�ѦҪ���A�V�e���ʨ�Dis�Z������m(Dis��t�Ƭ��V�Ჾ��)
	if RanNum == 1 or RanNum == 2 or RanNum == 8 or RanNum == 4 or RanNum == 5 or RanNum == 9 then
		local NewBall = ChangeObjID( Ball , 121867 ) --�ܤ������g�Y�y	
	elseif RanNum == 3 or RanNum == 6 or RanNum == 7 or RanNum == 10 then
		local NewBall = ChangeObjID( Ball , 121866 ) --�ܲ��e�e�g�Y�y
	end				
end
--/gm ? pcall Hao_Germany_4th_Slate(1	1 �O ���� 0 �O �W�U
--Hao_Obj_Mobile(ObjID,Mobile,Distance,Loop) -- ����B���ʤ覡�B�Z���B�O�_�|�Ӧ^
-- Mobile = 1 �ɡA���T�w�W�U���ʡB2 �ɬ��T�w���k���ʡB3�ɬ��H�@���I���_�l�I�A�üƲ��ʤW�U���k 
--MoveToFlagEnabled( ObjID , false )-- �������޼@�� 
--Hao_Obj_To_Obj_Height(Height)
--�b�򥻪k�N�����u�ˬdlua�v���W��Lua�A�i�H�����I�k�̻P�Q�I�k�̪����׮t�Z�A�ϥΤ覡�O
--�pHao_Obj_To_Obj_Height(15)�A�p�G�j��15�A�N���P���k�N�L�ġC
-- AdjustFaceDir( OwnerID(), TargetID(), 0 ) --�Ϧۤv���V�ؼ�
--local Grass = Lua_Hao_NPC_Closest_Search( Sheep , 117052  , 50 )-- �HOwner�����߰��S��j�M�A�^�ǳ̱��񪺪���
--=========================================================================
--					���ի��O
--=========================================================================
function Lua_jiyi_4th_testcancel() --�R���Ҧ��X�СBBUFF
	local Player = OwnerID()
	local Flag = { 547539 , 547574 } --���ʶi�椤_�����, ��L���y_�����
	local Buff = { 624037, 623871 }  --�����ʧޯ�, �۷\�g�Y�y
	CancelBuff( Player , Buff[1] )
	CancelBuff( Player , Buff[2] )
	SetFlag( Player , Flag[1] , 0 ) --�������ʶi�椤�X��
	SetFlag( Player , Flag[2] , 0 ) --������L���y�X��
end		
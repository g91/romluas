--=============�Ŷ�NPC=============--
function BG_AA_NPC_Introduction_0()
	local player = OwnerID()
	SetSpeakDetail(player,"[BG_AA_NOTE_1]")
	AddSpeakOption(player,player,"[BG_AA_NOTE_0]","BG_AA_NPC_Introduction_1",0)
end

function BG_AA_NPC_Introduction_1()
	local player = OwnerID()
	SetSpeakDetail(player,"[BG_AA_NOTE_2]")
	AddSpeakOption(player,player,"[BG_AA_NOTE_0]","BG_AA_NPC_Introduction_2",0)
	AddSpeakOption(player,player,"[SO_BACK]","BG_AA_NPC_Introduction_0",0)
end

function BG_AA_NPC_Introduction_2()
	local player = OwnerID()
	SetSpeakDetail(player,"[BG_AA_NOTE_3]")
	AddSpeakOption(player,player,"[SO_BACK]","BG_AA_NPC_Introduction_1",0)
end

function LuaQ_GEMTEST_REWARD(Num)
	local player = OwnerID()
	local reward = ReadRoleValue(player,EM_RoleValue_DuelistReward)	-- Ū�����a�������i�h�����`�q
--	addRoleValue(player,EM_RoleValue_DuelistReward,(reward+Num))
	AddSpeicalCoin( Player , 11 , 14 , Num )	-- �����i�h���� 2014.04.29  �վ㬰�|�^�� Log ���禡
	DebugMsg( Player , "Reward = "..Num )
end

--=============�x����B�ݨD - �i�h�����`���̰ө�=============--
function YoYo_CallDRShop_0()	--�ϥιD��@��
	Beginplot( OwnerID() ,"YoYo_CallDRShop_1", 0 )
end

function YoYo_CallDRShop_1()	--��ܵ����@��
	local Player = OwnerID()
	-- �ˬd�ϥΪ̬O�_�� GM
	if ReadRoleValue( Player , EM_RoleValue_VOC ) ~= 0 then
		DebugMsg( Player , 0 , "GM only" )
		return false
	end

	if CheckBuff( Player , 501570) == true then 
		ScriptMessage( Player , Player , 0, "[SC_WINDOW_OPENED]", 0 )	--�����w�g���}�F
		return 0
	end
	
	local Time = 0 
	local Step = 0
	local DialogStatus = 0
	DialogCreate( OwnerID(), EM_LuaDialogType_Select, "[SC_DRSHOP_01]" )   --NPC������ܪ��
	AddBuff( Player , 501570,0,-1)	--��������ˬdBuff
 	DialogSelectStr( Player , "[SC_DRSHOP_02]")	-- �l��i�h�����ӤH
	DialogSelectStr( Player , "[SC_DRSHOP_03]")	--�R���i�h�����ӤH

	if ( DialogSendOpen( Player ) == false)  then  --���ϥο��~�A�^�ǿ��~�T��
		ScriptMessage ( Player , Player , 1, "[SYS_FIXEQ_DATA_ERROR]", 0) 
		return
	end
	
	while true do  	--���}�Ҥ���A����j��
	sleep(10)
		Time = Time + 1
		--say( Player , Time)
	 	if Time > 30 then	--30��L�ʧ@�A������ܵ���
			ScriptMessage( Player , Player , 0 , "[SC_DRSHOP_04]" , 0 )
			DialogClose( Player )
			CancelBuff( Player , 501570 )	--��������ˬdBuff
			break
		end
	
		DialogStatus = DialogGetResult( Player )  --�ˬd�ϥΪ̿��������
		if DialogStatus == -2  then	--��l��
		
		elseif DialogStatus == -1  then	--���_
			DialogClose( Player )
			CancelBuff( Player , 501570 )	--��������ˬdBuff
			break
		
		elseif DialogStatus == 0 then  --�l��u�i�h�����`���̡v
			CancelBuff( Player , 501570 )	--��������ˬdBuff
			Beginplot( Player , "YoYo_CallDRShop_2" , 0 )
			DialogClose( Player )
			Step = 1
		
		elseif DialogStatus == 1 then --�R���u�i�h�����`���̡v
			CancelBuff( Player , 501570 )	--��������ˬdBuff
			Beginplot( Player , "YoYo_CallDRShop_3" , 0 )
			DialogClose( Player )
			Step = 1
		end
		if Step == 1 then
			break
		end
	end
end

function YoYo_CallDRShop_2()	--�l��u�i�h�����`���̡v�@��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role : new( OwnerID() )  -- ���o���a X.Y.Z.Dir��
	local BaseX = Obj : X()
 	local BaseY = Obj : Y()
 	local BaseZ = Obj : Z()
	local BaseDir = Obj : Dir()
	local NPC = CreateObj(  112263  , BaseX, BaseY, BaseZ, BaseDir, 1 )	--�b���a�y�� X.Y.Z.Dir ���W�ǳƳХߡu�i�h�����`���̡v
	SetModeEx( NPC, EM_SetModeType_Strikback, false )	--����
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )	--�Q�j�M
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )	--����
	SetModeEx( NPC, EM_SetModeType_Mark, true )	--�аO
	SetModeEx( NPC, EM_SetModeType_Move, false )	--����
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )	--����
	SetModeEx( NPC, EM_SetModeType_HideName, false )	--�W��
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, true )	--�Y����
	SetModeEx( NPC, EM_SetModeType_Fight , false )	--�i�������
	SetModeEx( NPC, EM_SetModeType_Drag , false )	--���O
	SetModeEx( NPC, EM_SetModeType_Show, true )	--���
	AddToPartition( NPC , RoomID) -- �إߪ���
end

function YoYo_CallDRShop_3()	--�R���u�i�h�����`���̡v�@��

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	--�T�{���A�������y
	local Count = SetSearchAllNPC( RoomID )	--�M����y���Ҧ���NPC
	local NPC

	if  Count ~= 0 then
		for i = 1 , Count , 1 do	--�]�w�j�M�Ҧ�NPC���ƪ��j��
			local ObjID = GetSearchResult() --���o�j�MNPC�����G
			NPC = Role : New( ObjID )
			
			if NPC : IsNPC() == true then
			local GUID = ReadRoleValue(  ObjID , EM_RoleValue_OrgID )	--�T�{�Ҧ�NPC���s��
				if GUID == 112263  then  --�Y�O���S�wNPC
				DelObj( ObjID ) 
				end
			end
		end
	end
end

function YoYo_ShopNPC112263()	--�P�u�i�h�����`���̡v��ܼ@��
	local NPC = OwnerID()
	local Player = TargetID()
	SetSpeakDetail( NPC , "[SC_DRSHOP_05]" )
	AddSpeakOption( NPC , Player , "[SC_DRSHOP_06]" , "YoYo_ShopNPC112263_Shop1" , 5 )	--�ө���ܿﶵ
end

function YoYo_ShopNPC112263_Shop1()	--�}�ҫi�h�����ө��@��
	SetShop( TargetID() , 600185 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() )	--������ܵ���
	OpenShop()
end

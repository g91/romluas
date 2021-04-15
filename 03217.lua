--=============�x����B�ݨD - �^�i���Ҿ����`���̰ө�=============--
function Lua_na_CallPVShop()	--�ϥιD��@��
	Beginplot( OwnerID() ,"Lua_na_CallPVShop_OPEN", 0 )
end

function Lua_na_CallPVShop_OPEN()	--��ܵ����@��
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
 	DialogSelectStr( Player , "[SC_PVSHOP_01]")	-- �l��^�i���ҰӤH
	DialogSelectStr( Player , "[SC_PVSHOP_02]")	--�R���^�i���ҰӤH

	if ( DialogSendOpen( Player ) == false)  then  --���ϥο��~�A�^�ǿ��~�T��
		ScriptMessage ( Player , Player , 1, "[SYS_FIXEQ_DATA_ERROR]", 0) 
		return
	end
	
	while true do  	--���}�Ҥ���A����j��
	sleep(10)
		Time = Time + 1
		--say( Player , Time)
	 	if Time > 30 then	--30��L�ʧ@�A������ܵ���
			ScriptMessage( Player , Player , 0 , "[SC_DRSHOP_04]" , 0 ) --���m30��A��������
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
			Beginplot( Player , "Lua_na_CreatePVShop" , 0 )
			DialogClose( Player )
			Step = 1
		
		elseif DialogStatus == 1 then --�R���u�i�h�����`���̡v
			CancelBuff( Player , 501570 )	--��������ˬdBuff
			Beginplot( Player , "Lua_na_DelPVShop" , 0 )
			DialogClose( Player )
			Step = 1
		end
		if Step == 1 then
			break
		end
	end
end

function Lua_na_CreatePVShop()	--�l��u�^�i���ҰӤH�v�@��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role : new( OwnerID() )  -- ���o���a X.Y.Z.Dir��
	local BaseX = Obj : X()
 	local BaseY = Obj : Y()
 	local BaseZ = Obj : Z()
	local BaseDir = Obj : Dir()
	local NPC = CreateObj(  124122  , BaseX, BaseY, BaseZ, BaseDir, 1 )	--�b���a�y�� X.Y.Z.Dir ���W�ǳƳХߡu�^�i���ҰӤH�v
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

function Lua_na_DelPVShop()	--�R���u�^�i���ҰӤH�v�@��

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	--�T�{���A�������y
	local Count = SetSearchAllNPC( RoomID )	--�M����y���Ҧ���NPC
	local NPC

	if  Count ~= 0 then
		for i = 1 , Count , 1 do	--�]�w�j�M�Ҧ�NPC���ƪ��j��
			local ObjID = GetSearchResult() --���o�j�MNPC�����G
			NPC = Role : New( ObjID )
			
			if NPC : IsNPC() == true then
			local GUID = ReadRoleValue(  ObjID , EM_RoleValue_OrgID )	--�T�{�Ҧ�NPC���s��
				if GUID == 124122  then  --�Y�O���S�wNPC
				DelObj( ObjID ) 
				end
			end
		end
	end
end

function Lua_na_124122()	--�P�u�^�i���ҰӤH�v��ܼ@��
	local Owner = OwnerID()
	local Target = TargetID()
	if CheckAcceptQuest( Owner, 425709 ) == true then
		SetSpeakDetail( Owner , "[SC_PVSHOP_SPEAK]" )
		AddSpeakOption( Owner , Owner, "[SC_PVSHOP_03]" , "lua_na_124122_Shop" , 5 )	--�ө���ܿﶵ
	else
		SetSpeakDetail( Owner , "[SC_PVSHOP_SPEAK1]" )
	end
end

function Lua_na_124122_Shop()	--�}�ҭ^�i���Ұө��@��
	SetShop( TargetID() , 600477 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() )	--������ܵ���
	OpenShop()
end
--=============�x����B�ݨD - �g��y============--
function Lua_na_209977_EXPTP()	--�ϥιD��@��
	Beginplot( OwnerID() ,"Lua_na_209977_EXPTP_OPEN", 0 )
end

function Lua_na_209977_EXPTP_OPEN()	--��ܵ����@��
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
	DialogCreate( OwnerID(), EM_LuaDialogType_Select, "[SC_DRSHOP_01]" )   --��ܭn���檺�ʧ@
	AddBuff( Player , 501570,0,-1)	--��������ˬdBuff
 	DialogSelectStr( Player , "[SC_SELL_EXP]")	-- �l��g��y�ӤH
	DialogSelectStr( Player , "[SC_SELL_TP]")	-- �l��TP�g��y�ӤH

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
		
		elseif DialogStatus == 0 then  --�l��EXP�ӤH
			CancelBuff( Player , 501570 )	--��������ˬdBuff
			Beginplot( Player , "Lua_na_EXP_SELLNPC" , 0 )
			DialogClose( Player )
			Step = 1
		
		elseif DialogStatus == 1 then --�l��TP�ӤH
			CancelBuff( Player , 501570 )	--��������ˬdBuff
			Beginplot( Player , "Lua_na_TP_SELLNPC" , 0 )
			DialogClose( Player )
			Step = 1
		end	
		if Step == 1 then
			break
		end
	end
end


--������������������������������������������������������������������������������������������
-- �g���NPC���
function Lua_na_EXP_SELLNPC()
	local Player = OwnerID()
	-- �ˬd�ϥΪ̬O�_�� GM
	if CheckBuff( Player , 501570) == true then 
		ScriptMessage( Player , Player , 0, "[SC_WINDOW_OPENED]", 0 )	--�����w�g���}�F
		return 0
	end
	
	local Time = 0 
	local Step = 0
	local DialogStatus = 0
	DialogCreate( OwnerID(), EM_LuaDialogType_Select, "[SC_SELL_TYPE_EXP]" )   --�ǳƥl��g��y�ӤH�A�п�ܦ��������ȡC
	AddBuff( Player , 501570,0,-1)	--��������ˬdBuff
 	DialogSelectStr( Player , "[SC_SELL_TYPE1]")	-- �����ťN��
	DialogSelectStr( Player , "[SC_SELL_TYPE2]")	-- �����Ŷꨩ
	DialogSelectStr( Player , "[SC_SELL_TYPE3]")	-- ���q��q
	DialogSelectStr( Player , "[SC_SELL_TYPE4]")	-- �ڹҥ����L�O
	DialogSelectStr( Player , "[SC_SELL_TYPE5]")	-- �j�N��

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
		
		elseif DialogStatus == 0 then  --�����ťN�� [203038]
			CancelBuff( Player , 501570 )	--��������ˬdBuff
			CallPlot ( Player , "Lua_na_EXP_SELLNPC_Create" , 1)
			DialogClose( Player )
			Step = 1
		
		elseif DialogStatus == 1 then --�����Ŷꨩ [240181]
			CancelBuff( Player , 501570 )	--��������ˬdBuff
			CallPlot ( Player , "Lua_na_EXP_SELLNPC_Create" , 2)
			DialogClose( Player )
			Step = 1
		elseif DialogStatus == 2 then --���q��q [201545]
			CancelBuff( Player , 501570 )	--��������ˬdBuff
			CallPlot ( Player , "Lua_na_EXP_SELLNPC_Create" , 3)
			DialogClose( Player )
			Step = 1
		elseif DialogStatus == 3 then --�ڹҥ����L�O [208681]
			CancelBuff( Player , 501570 )	--��������ˬdBuff
			CallPlot ( Player , "Lua_na_EXP_SELLNPC_Create" , 4)
			DialogClose( Player )
			Step = 1
		elseif DialogStatus == 4 then --�j�N�� [242376]
			CancelBuff( Player , 501570 )	--��������ˬdBuff
			CallPlot ( Player , "Lua_na_EXP_SELLNPC_Create" , 5)
			DialogClose( Player )
			Step = 1
		end
	
		if Step == 1 then
			break
		end
	end
end


function Lua_na_EXP_SELLNPC_Create(num)	--�l��g��yNPC�@��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Type = {	[1] =	124132,
			[2] =	124133,
			[3] =	124134,
			[4] =	124135,
			[5] = 	124136	}

	local Obj = Role : new( OwnerID() )  -- ���o���a X.Y.Z.Dir��
	local BaseX = Obj : X()
 	local BaseY = Obj : Y()
 	local BaseZ = Obj : Z()
	local BaseDir = Obj : Dir()
	local NPC = CreateObj( Type[num]  , BaseX, BaseY, BaseZ, BaseDir, 1 )	--�b���a�y�� X.Y.Z.Dir ���W�ǳƳХ߸g��yNPC
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


--������������������������������������������������������������������������������������������
-- TP�g���NPC���
function Lua_na_TP_SELLNPC()
	local Player = OwnerID()
	-- �ˬd�ϥΪ̬O�_�� GM
	if CheckBuff( Player , 501570) == true then 
		ScriptMessage( Player , Player , 0, "[SC_WINDOW_OPENED]", 0 )	--�����w�g���}�F
		return 0
	end
	
	local Time = 0 
	local Step = 0
	local DialogStatus = 0
	DialogCreate( OwnerID(), EM_LuaDialogType_Select, "[SC_SELL_TYPE_TP]" )   --�ǳƥl��g��y�ӤH�A�п�ܦ��������ȡC
	AddBuff( Player , 501570,0,-1)	--��������ˬdBuff
 	DialogSelectStr( Player , "[SC_SELL_TYPE1]")	-- �����ťN��
	DialogSelectStr( Player , "[SC_SELL_TYPE2]")	-- �����Ŷꨩ
	DialogSelectStr( Player , "[SC_SELL_TYPE3]")	-- ���q��q
	DialogSelectStr( Player , "[SC_SELL_TYPE4]")	-- �ڹҥ����L�O
	DialogSelectStr( Player , "[SC_SELL_TYPE5]")	-- �j�N��

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
		
		elseif DialogStatus == 0 then  --�����ťN�� [203038]
			CancelBuff( Player , 501570 )	--��������ˬdBuff
			CallPlot ( Player , "Lua_na_TP_SELLNPC_Create" , 1)
			DialogClose( Player )
			Step = 1
		
		elseif DialogStatus == 1 then --�����Ŷꨩ [240181]
			CancelBuff( Player , 501570 )	--��������ˬdBuff
			CallPlot ( Player , "Lua_na_TP_SELLNPC_Create" , 2)
			DialogClose( Player )
			Step = 1
		elseif DialogStatus == 2 then --���q��q [201545]
			CancelBuff( Player , 501570 )	--��������ˬdBuff
			CallPlot ( Player , "Lua_na_TP_SELLNPC_Create" , 3)
			DialogClose( Player )
			Step = 1
		elseif DialogStatus == 3 then --�ڹҥ����L�O [208681]
			CancelBuff( Player , 501570 )	--��������ˬdBuff
			CallPlot ( Player , "Lua_na_TP_SELLNPC_Create" , 4)
			DialogClose( Player )
			Step = 1
		elseif DialogStatus == 4 then --�j�N�� [242376]
			CancelBuff( Player , 501570 )	--��������ˬdBuff
			CallPlot ( Player , "Lua_na_TP_SELLNPC_Create" , 5)
			DialogClose( Player )
			Step = 1
		end
		if Step == 1 then
			break
		end
	end
end



function Lua_na_TP_SELLNPC_Create(num)	--�l��g��yNPC�@��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Type = {	[1] =	124137,
			[2] =	124138,
			[3] =	124139,
			[4] =	124140,
			[5] = 	124141	}

	local Obj = Role : new( OwnerID() )  -- ���o���a X.Y.Z.Dir��
	local BaseX = Obj : X()
 	local BaseY = Obj : Y()
 	local BaseZ = Obj : Z()
	local BaseDir = Obj : Dir()
	local NPC = CreateObj( Type[num]  , BaseX, BaseY, BaseZ, BaseDir, 1 )	--�b���a�y�� X.Y.Z.Dir ���W�ǳƳХ߸g��yNPC
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



function Lua_na_EXPTP_NPCSPEAK(type)
	local Owner = OwnerID()
	local Target = TargetID()
	local Job = ReadRoleValue( Owner , EM_RoleValue_VOC)
	WriteRoleValue( Target , EM_RoleValue_PID, type)
	if type <= 5 then	
		SetSpeakDetail( Owner , "[SC_SELL_EXPTP_NPC1]")  --���
	else
		SetSpeakDetail( Owner , "[SC_SELL_EXPTP_NPC2]")  --���
	end
	AddSpeakOption( Owner , Owner, "[SO_110439_0]" , "Lua_na_EXPTP_NPCSPEAK2" , 5 )	--�ө���ܿﶵ
	if Job == 0 then
		AddSpeakOption( Owner ,Owner , "[SC_BUFFNPC_06]" , "Lua_na_EXPTP_NPCDel" , 0)  --�R��NPC
	end
end


function Lua_na_EXPTP_NPCSPEAK2()	--�}�Ұө��@��
	local Target = TargetID()
	local PID = ReadRoleValue( Target , EM_RoleValue_PID)	
	local Shop =  {	[1] = 600587,
			[2] = 600588,
			[3] = 600589,
			[4] = 600590,
			[5] = 600591,
			[6] = 600592,
			[7] = 600593,
			[8] = 600594,
			[9] = 600595,	
			[10] = 600596	}   --NPC�������ө� EXP*5 / TP*5
	SetShop( Target , SHOP[PID] , "Test_Shop_Close" )
	CloseSpeak( OwnerID() )	--������ܵ���
	OpenShop()
end


function Lua_na_EXPTP_NPCDel()
	CloseSpeak( OwnerID())
	DelObj( TargetID())
end
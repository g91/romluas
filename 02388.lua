--���~����@��
function LuaBK_buffnpc_begin()
	BeginPlot( OwnerID(), "LuaBK_buffnpc", 0)
end
--�C��@��
function LuaBK_buffnpc()
	local Time = 0 
	local Step = 0
	local DialogStatus = 0
	local NPCIDList ={118501,118502,118503,118504,118505}
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		return 0
	end
	AddBuff(OwnerID() , 501570,0,-1);
	DialogCreate( OwnerID(), EM_LuaDialogType_Select, "[SC_BK_BUFFNPC_01]" )   --NPC������ܪ��
 	DialogSelectStr( OwnerID(), "[SC_BK_BUFFNPC_02]")  -- TP
	DialogSelectStr( OwnerID(), "[SC_BK_BUFFNPC_03]") --EXP
	DialogSelectStr( OwnerID(), "[SC_BK_BUFFNPC_04]") --DR
	DialogSelectStr( OwnerID(), "[SC_BK_BUFFNPC_05]") --����NPC
	DialogSelectStr( OwnerID(), "[SC_BK_BUFFNPC_07]") --�R��NPC
	--DialogSelectStr( OwnerID(), "[SC_BK_BUFFNPC_06]") --�ܨ�NPC
	if ( DialogSendOpen(OwnerID() ) == false)  then  --���ϥο��~�A�^�ǿ��~�T��
		ScriptMessage ( OwnerID(), OwnerID(), 1, "[SYS_FIXEQ_DATA_ERROR]", 0) 
		CancelBuff( OwnerID(), 501570 );--
		return
	end
	while true do  	--���}�Ҥ���A����j��
		sleep(10)
		Time = Time+1
	--	say( OwnerID() , Time)
	 	if Time > 30 then  -- 30��L�ʧ@�A������ܵ���
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BK_BUFFNPC_08]" , 0 )--���m�W�L30��,�۰����������C
			CancelBuff( OwnerID(), 501570 );--
			DialogClose( OwnerID() )
			break
		end
		DialogStatus = DialogGetResult( OwnerID() )  --�ˬd�ϥΪ̿��������
		if DialogStatus == -2  then -- ��l��
		elseif DialogStatus == -1  then--���_
			DialogClose( OwnerID() );
			CancelBuff( OwnerID(), 501570 );--
			break;
		elseif DialogStatus == 4  then
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "LuaBK_buffnpc_DelNPC_01" , 0 );
			DialogClose( OwnerID() );
			break;
		else
			CancelBuff( OwnerID(), 501570 );--
			CallPlot(OwnerID(),"LuaBK_buffnpc_CreateNPC",NPCIDList[DialogStatus+1]);
			DialogClose( OwnerID() );
			break;
		end
	end
end
--�إXNPC
function LuaBK_buffnpc_CreateNPC(NpcID)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local NPC = CreateObjByObj(NpcID,OwnerID()); --�b���a�y�� X.Y.Z.Dir ���W�ǳƳХߪ���
	SetModeEx( NPC, EM_SetModeType_Strikback, false )--����
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--����
	SetModeEx( NPC, EM_SetModeType_Mark, true )--�аO
	SetModeEx( NPC, EM_SetModeType_Move, false )--����
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--����
	SetModeEx( NPC, EM_SetModeType_HideName, false )--�W��
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( NPC, EM_SetModeType_Fight , false )--�i�������
	SetModeEx( NPC, EM_SetModeType_Drag , false )--���O
	SetModeEx( NPC, EM_SetModeType_Show, true )--���
	AddToPartition( NPC , RoomID) -- �إߪ���
	AddBuff(NPC,503217,0,-1);--�[����
end
-----�H�U��NPC�@��
--�T��BUFF���y�� NPC��l�@��
function LuaBK_BUFF_NPC()
	-- OwnerID = ���a
	-- TargetID = NPC
	local OrgID = ReadRoleValue(TargetID(),EM_RoleValue_OrgID);
	local OLv = ReadRoleValue(OwnerID(),EM_RoleValue_LV);
	local month = GetSystime(3)+1
	local day = GetSystime(4)
	local hour = GetSystime(1)
	local min = GetSystime(2)
	local NowTime = month*1000000+day*10000+hour*100+min;
	local StartTimeList = {"Luckystarttime_00", "Tpstarttime_00", "Expstarttime_00"}
	local EndTimeList = {"Luckyendtime_00", "Tpendtime_00", "Expendtime_00"}
	local NPCIDList ={118501,118502,118503};
	local Detaillist = {"[SC_BK_BUFFNPC_09]","[SC_BK_BUFFNPC_10]","[SC_BK_BUFFNPC_11]"};
	local MaxLvList = {"Tphighlv_00","Exphighlv_00","Luckyhighlv_00"};
	local MinLvList = {"Tplowlv_00","Explowlv_00","Luckylowlv_00"};
	AdjustFaceDir( TargetID() , OwnerID() , 0 ); -- ���V
	BeginPlot( TargetID() , "LuaBK_NPC_Ranger" , 0 );  --�ˬdNPC�P���a���Z��
	for i =1,table.getn(NPCIDList) do
		if OrgID == NPCIDList[i] then
			local StartTime = GetDBKeyValue(StartTimeList[i]);
			local EndTime = GetDBKeyValue(EndTimeList[i]);
			DebugMsg( 0 , 0 , "StartTime = "..StartTime.. "EndTime = "..EndTime.. "NowTime = "..NowTime );
			if NowTime > EndTime then
				SetSpeakDetail ( OwnerID(), "[SC_BK_BUFFNPC_20]" );	--�o�Ӭ��ʤw�g�����F!
				 CloseSpeak( OwnerID() );			
				break;
		 	elseif NowTime < StartTime then
				SetSpeakDetail ( OwnerID(), "[SC_BK_BUFFNPC_19]" );	--�o�Ӭ����٨S�}�l!
				 CloseSpeak( OwnerID() );			
				break;
			end
			local MaxLv = GetDBKeyValue(MaxLvList[i]);
			local MinLv = GetDBKeyValue(MinLvList[i]);
			if OLv>MaxLv or OLv<MinLv then
				--���Ť���
				SetSpeakDetail ( OwnerID(), "[SC_BK_BUFFNPC_13][$SETVAR1="..MinLv.."][$SETVAR2="..MaxLv.."]" );	--�A�����Ť��ŦX���ʭ���A�����ʭ�[$VAR1]��~[$VAR2]�Ū����a�ѻP�C
				 CloseSpeak( OwnerID() );			
				break;
			else
				SetSpeakDetail ( OwnerID(), Detaillist[i] );	--�A�n�A�Q�������TP�Ȫ����ֶ�?
				AddSpeakOption( OwnerID(), TargetID(), "[SC_BUFFNPC_39]", "LuaBK_AddBuff" ,0 );
				break;
			end
		end
	end
end
--����T��BUFF���y�@��
function LuaBK_AddBuff()
	--OwnerID = ���a
	-- TargetID = NPC
	local TransID = GetDBKeyValue("TransfigurationID_00");
	local TransRate = GetDBKeyValue("Transfigurationrate_00");
	local OrgID = ReadRoleValue(TargetID(),EM_RoleValue_OrgID);
	local NPCIDList ={118501,118502,118503};
	local Bufflist = {509683,509684,509685};
	local LvList = {	"Tpbufflv_00",
			"Expbufflv_00",
			"Luckybufflv_00"};
	local TimeList = {"Tpbufftime_00",
			"Expbufftime_00",
			"Luckybufftime_00"};
	for i =1,table.getn(NPCIDList) do
		if OrgID == NPCIDList[i] then
			local SkillLV = GetDBKeyValue(LvList[i]);
			local SkillTime = GetDBKeyValue(TimeList[i]);
			if CheckFlag( OwnerID(),544727) == true then
				SetSpeakDetail( OwnerID(), "[SC_BUFFNPC_27]"); --�A���Ѥw�g����L�F�A���ѦA�ӧa�C
				 CloseSpeak( OwnerID() );
			else
				if (Rand(100)+1)>TransRate then--�ܨ����v
					Addbuff( OwnerID(), Bufflist[i], SkillLV, SkillTime); --���� BUFF 2�p��
					SetFlag( OwnerID(), 544727, 1 );
					CloseSpeak( OwnerID() );
				else
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BK_BUFFNPC_21]" , C_SYSTEM );	--�A�w�g��o�e�������֡C
					Addbuff( OwnerID(), TransID, 0, 7200); --�����ܨ� BUFF 2�p��
					SetFlag( OwnerID(), 544727, 1)
					CancelBuff( OwnerID(), 501570 );--
					DialogClose( OwnerID() );
				end
			end
			break;
		end
	end
end
--���ż��y�� NPC��l�@��
function LuaBK_debt_NPC()
	--OwnerID = ���a
	-- TargetID = NPC
	local month = GetSystime(3)+1;
	local day = GetSystime(4);
	local hour = GetSystime(1);
	local min = GetSystime(2);
	local NowTime = month*1000000+day*10000+hour*100+min;
	local StartTimeList = "Debtexpstarttime_00";
	local EndTimeList = "Debtexpendtime_00";
	local MaxLvList = "Debthighlv_00";
	local MinLvList = "Debtlowlv_00";
	local OLv = ReadRoleValue(OwnerID(),EM_RoleValue_LV);
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- ���V
	BeginPlot( TargetID() , "LuaBK_NPC_Ranger" , 0 )
	local StartTime = GetDBKeyValue(StartTimeList);
	local EndTime = GetDBKeyValue(EndTimeList);
	--DebugMsg( 0 , 0 , "StartTime = "..StartTime.. "EndTime = "..EndTime.. "NowTime = "..NowTime );
	if NowTime > EndTime then
		SetSpeakDetail ( OwnerID(), "[SC_BK_BUFFNPC_20]" );	--�o�Ӭ��ʤw�g�����F!
		 CloseSpeak( OwnerID() );			
	elseif NowTime < StartTime then
		SetSpeakDetail ( OwnerID(), "[SC_BK_BUFFNPC_19]" );	--�o�Ӭ����٨S�}�l!
		 CloseSpeak( OwnerID() );			
	end
	local MaxLv = GetDBKeyValue(MaxLvList);
	local MinLv = GetDBKeyValue(MinLvList);
	if OLv>MaxLv or OLv<MinLv then
		--���Ť���
		SetSpeakDetail ( OwnerID(), "[SC_BK_BUFFNPC_13][$SETVAR1="..MinLv.."][$SETVAR2="..MaxLv.."]" );	--�A�����Ť��ŦX���ʭ���A�����ʭ�[$VAR1]��~[$VAR2]�Ū����a�ѻP�C
		 CloseSpeak( OwnerID() );			
	else
		SetSpeakDetail( OwnerID(), "[SC_BK_BUFFNPC_12]" );	--�A�n�A�Q����h�������ŰȪ����ֶ�?
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BUFFNPC_39]" , "LuaBK_debt_part_01", 0 );
	end
end
--����M�t�ů��ּ@��
function LuaBK_debt_part_01()
	local TransID = GetDBKeyValue("TransfigurationID_00");
	local TransRate = GetDBKeyValue("Transfigurationrate_00");
	local DebtEXP = ReadRoleValue( OwnerID(), EM_RoleValue_DebtExp); --�t��EXP
	local DebtTP = ReadRoleValue( OwnerID(), EM_RoleValue_DebtTP); --�t��TP
	local EXP = GetDBKeyValue("Expdebt_00");
	local TP = GetDBKeyValue("Tpdebt_00");
	local NewEXP = DebtEXP+EXP;
	local NewTP = DebtTP+TP;
	--Ū����x�ȧP�_�O�_�����M��
	if CheckFlag( OwnerID(), 544727) == true then
		SetSpeakDetail( OwnerID(), "[SC_BUFFNPC_27]" ) --�A���Ѥw�g����L�F�A���ѦA�ӧa�C
		CloseSpeak( OwnerID() );
	elseif DebtEXP>=0 and DebtTP >= 0 then
		SetSpeakDetail( OwnerID(), "[SC_BUFFNPC_37]") --�S���t��
		CloseSpeak( OwnerID() );
	else
		if (Rand(100)+1)>TransRate then--�ܨ����v
			if NewEXP >0 or EXP <0 then
				NewEXP = 0;
			end
			if NewTP >0 or TP <0 then
				NewTP = 0;
			end
			WriteRoleValue( OwnerID(), EM_RoleValue_DebtExp, NewEXP);
			WriteRoleValue( OwnerID(), EM_RoleValue_DebtTP, NewTP);
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BUFFNPC_38]" , C_SYSTEM );	--�A�w�g��o�e�������֡C
			SetFlag( OwnerID(), 544727, 1)
			CloseSpeak( OwnerID() );
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BK_BUFFNPC_21]" , C_SYSTEM );	--�A�w�g��o�e�������֡C
			Addbuff( OwnerID(), TransID, 0, 7200); --���� �ܨ�BUFF 2�p��
			SetFlag( OwnerID(), 544727, 1)
			CancelBuff( OwnerID(), 501570 );--
			DialogClose( OwnerID() );
		end
	end
end
--�R��NPC���
function LuaBK_buffnpc_DelNPC_01()
	local Time = 0 
	local DialogStatus = 0
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		return 0
	end
	AddBuff(OwnerID() , 501570,0,-1);
	DialogCreate( OwnerID(), EM_LuaDialogType_Select, "[SC_BUFFNPC_40]" )   --NPC������ܪ��
 	DialogSelectStr( OwnerID(), "[SC_BK_BUFFNPC_14]")  -- �T�w�R��[0]
 	DialogSelectStr( OwnerID(), "[SC_BK_BUFFNPC_15]")  -- �T�w�R��[1]
 	DialogSelectStr( OwnerID(), "[SC_BK_BUFFNPC_16]")  -- �T�w�R��[2]
 	DialogSelectStr( OwnerID(), "[SC_BK_BUFFNPC_17]")  -- �T�w�R��[3]
 	DialogSelectStr( OwnerID(), "[SC_BK_BUFFNPC_18]")  -- �T�w�R��[4]
	DialogSelectStr( OwnerID(), "[SC_BUFFNPC_12]")	--�^��W����[5]
	if ( DialogSendOpen(OwnerID() ) == false)  then  --���ϥο��~�A�^�ǿ��~�T��
		ScriptMessage ( OwnerID(), OwnerID(), 1, "[SYS_FIXEQ_DATA_ERROR]", 0) 
		CancelBuff( OwnerID(), 501570 );--
		return
	end
	while true do  	--���}�Ҥ���A����j��
		sleep(10)
		Time = Time+1
	--	say( OwnerID() , Time)
	 	if Time > 30 then  -- �@�����L�ʧ@�A������ܵ���
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BUFFNPC_07]" , 0 )
			DialogClose( OwnerID() )
			CancelBuff( OwnerID(), 501570 );--
			break
		end
		DialogStatus = DialogGetResult( OwnerID() )  --�ˬd�ϥΪ̿��������
		if DialogStatus == -2  then -- ��l��
		elseif DialogStatus == -1  then--���_
			DialogClose( OwnerID() );
			CancelBuff( OwnerID(), 501570 );--
			break;
		elseif DialogStatus == 5 then -- �^��W����
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "LuaBK_buffnpc",0 );
			DialogClose( OwnerID() );
			break;
		else
			CancelBuff( OwnerID(), 501570 );--
			CallPlot(OwnerID(),"LuaBK_buffnpc_DelNPC_02",DialogStatus+1)
			DialogClose( OwnerID() );
		--	Say( OwnerID() , DialogStatus );
			break;	
		end
	end
end  
--�R��NPC�@��
function LuaBK_buffnpc_DelNPC_02(DialogStatus) 	--�R��NPC
	local NPCIDList ={118501,118502,118503,118504,118505}
	if DialogStatus ==5 then
		Lua_DavisDelObj(NPCIDList);
	else
		Lua_DavisDelObj(NPCIDList[DialogStatus]);
	end
end
--���եέt�ŭ�
function LuaBK_buffnpc01(XX)
	WriteRoleValue( OwnerID(), EM_RoleValue_DebtExp, XX )	
	WriteRoleValue( OwnerID(), EM_RoleValue_DebtTP, XX/10 )	
end
--�ˬd�Z���@��
function LuaBK_NPC_Ranger()	-- �Z���W�L50�Y������ܵ���
	while true do
		if GetDistance( OwnerID() , TargetID() )  >= 50 then
			CloseSpeak( TargetID() )
			AdjustFaceDir( OwnerID(), TargetID() , 0 ) -- ���V
			PlayMotion( OwnerID() , 116 ) -- �A��
			break
		end
		sleep(5)
	end
end
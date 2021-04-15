function LuaS_TP_NPC_na() 	--�P�_���PTP���y�� NPC
	-- OwnerID = ���a
	-- TargetID = NPC

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- ���V

	BeginPlot( TargetID() , "LuaS_NPC_Ranger_na" , 0 )  --�ˬdNPC�P���a���Z��

	if ReadRoleValue ( TargetID() , EM_RoleValue_PID ) == 101 then
		SetSpeakDetail( OwnerID() , "[SC_BUFFNPC_24]" )	--�A�n�A�Q�������TP�Ȫ����ֶ�?
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BUFFNPC_39]" , "LuaS_TP_NPC_20", 0 )
	elseif ReadRoleValue ( TargetID(), EM_RoleValue_PID) == 102 then
		SetSpeakDetail ( OwnerID(), "[SC_BUFFNPC_25]" )	--�A�n�A�Q�������TP�Ȫ����ֶ�?
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BUFFNPC_39]", "LuaS_TP_NPC_50" ,0 )
	elseif ReadRoleValue ( TargetID(), EM_RoleValue_PID) == 103 then
		SetSpeakDetail ( OwnerID(), "[SC_BUFFNPC_26]" )	--�A�n�A�Q�������TP�Ȫ����ֶ�?
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BUFFNPC_39]", "LuaS_TP_NPC_100" ,0 )
	end
end



function LuaS_TP_NPC_20()  --����TP BUFF
	--OwnerID = ���a
	-- TargetID = NPC
	if CheckFlag( OwnerID(), 543962) == true then
		SetSpeakDetail( OwnerID(), "[SC_BUFFNPC_27]") --�A���Ѥw�g����L�F�A���ѦA�ӧa�C
		CloseSpeak( OwnerID() )
		return false
	else
		Addbuff( OwnerID(), 506825, 0, 7200) --���� TP 20% BUFF 2�p��
		SetFlag( OwnerID(), 543962, 1 )
		CloseSpeak( OwnerID() )
	end
end	
	

function LuaS_TP_NPC_50()
	--OwnerID = ���a
	-- TargetID = NPC
	if CheckFlag( OwnerID(), 543962) == true then
		SetSpeakDetail( OwnerID(),  "[SC_BUFFNPC_27]") --�A���Ѥw�g����L�F�A���ѦA�ӧa�C
		 CloseSpeak( OwnerID() )
		return false
	else
		Addbuff( OwnerID(), 506826, 0, 7200) --���� TP 50% BUFF 2�p��
		SetFlag( OwnerID(), 543962, 1 )
		CloseSpeak( OwnerID() )
	end
end


function LuaS_TP_NPC_100()
	--OwnerID = ���a
	-- TargetID = NPC
	if CheckFlag( OwnerID(), 543962) == true then
		SetSpeakDetail( OwnerID(), "[SC_BUFFNPC_27]") --�A���Ѥw�g����L�F�A���ѦA�ӧa�C
		 CloseSpeak( OwnerID() )
		return false
	else
		Addbuff( OwnerID(), 506827, 0, 7200) --���� TP 100% BUFF 2�p��
		SetFlag( OwnerID(), 543962, 1 )
		CloseSpeak( OwnerID() )
	end
end


function LuaS_EXP_NPC_na() 	--�P�_���PEXP���y�� NPC
	-- OwnerID = ���a
	-- TargetID = NPC

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- ���V

	BeginPlot( TargetID() , "LuaS_NPC_Ranger_na" , 0 )


	if ReadRoleValue ( TargetID(), EM_RoleValue_PID ) == 201 then
		SetSpeakDetail( OwnerID(), "[SC_BUFFNPC_28]" )	--�A�n�A�Q������ɸg��Ȫ����ֶ�?
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BUFFNPC_39]" , "LuaS_EXP_NPC_20", 0 )
	elseif ReadRoleValue ( TargetID(), EM_RoleValue_PID) == 202 then
		SetSpeakDetail ( OwnerID(), "[SC_BUFFNPC_29]" )	--�A�n�A�Q������ɸg��Ȫ����ֶ�?
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BUFFNPC_39]", "LuaS_EXP_NPC_50" ,0 )
	elseif ReadRoleValue ( TargetID(), EM_RoleValue_PID) == 203 then
		SetSpeakDetail ( OwnerID(), "[SC_BUFFNPC_30]" )	--�A�n�A�Q������ɸg��Ȫ����ֶ�?
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BUFFNPC_39]", "LuaS_EXP_NPC_100" ,0 )
	end
end



function LuaS_EXP_NPC_20() 	--����BUFF
	--OwnerID = ���a
	-- TargetID = NPC
	if CheckFlag( OwnerID(), 543963) == true then
		SetSpeakDetail( OwnerID(), "[SC_BUFFNPC_27]") --�A���Ѥw�g����L�F�A���ѦA�ӧa�C
		 CloseSpeak( OwnerID() )
		return false
	else
		Addbuff( OwnerID(), 506828, 0, 7200) --���� EXP 20% BUFF 2�p��
		SetFlag( OwnerID(), 543963, 1 )
		CloseSpeak( OwnerID() )
	end
end	
	

function LuaS_EXP_NPC_50()
	--OwnerID = ���a
	-- TargetID = NPC
	if CheckFlag( OwnerID(), 543963) == true then
		SetSpeakDetail( OwnerID(), "[SC_BUFFNPC_27]") --�A���Ѥw�g����L�F�A���ѦA�ӧa�C
		 CloseSpeak( OwnerID() )
		return false
	else
		Addbuff( OwnerID(), 506829, 0, 7200) --���� EXP 50% BUFF 2�p��
		SetFlag( OwnerID(), 543963, 1 )
		CloseSpeak( OwnerID() )
	end
end


function LuaS_EXP_NPC_100()
	--OwnerID = ���a
	-- TargetID = NPC
	if CheckFlag( OwnerID(), 543963) == true then
		SetSpeakDetail( OwnerID(), "[SC_BUFFNPC_27]") --�A���Ѥw�g����L�F�A���ѦA�ӧa�C
		 CloseSpeak( OwnerID() )
		return false
	else
		Addbuff( OwnerID(), 506830, 0, 7200) --���� EXP 100% BUFF 2�p��
		SetFlag( OwnerID(), 543963, 1 )
		CloseSpeak( OwnerID() )
	end
end


function LuaS_DR_NPC_na() 	--�P�_���PDR���y�� NPC
	--OwnerID = ���a
	-- TargetID = NPC

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- ���V

	BeginPlot( TargetID() , "LuaS_NPC_Ranger_na" , 0 )

	if ReadRoleValue ( TargetID(), EM_RoleValue_PID ) == 301 then
		SetSpeakDetail( OwnerID(),  "[SC_BUFFNPC_31]" )	--�A�n�A�Q������ɱ��_���v�����ֶ�?
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BUFFNPC_39]" , "LuaS_DR_NPC_20", 0 )
	elseif ReadRoleValue ( TargetID(), EM_RoleValue_PID) == 302 then
		SetSpeakDetail ( OwnerID(),"[SC_BUFFNPC_32]" )	--�A�n�A�Q������ɱ��_���v�����ֶ�?
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BUFFNPC_39]", "LuaS_DR_NPC_50" ,0 )
	elseif ReadRoleValue ( TargetID(), EM_RoleValue_PID) == 303 then
		SetSpeakDetail ( OwnerID(),  "[SC_BUFFNPC_33]" )	--�A�n�A�Q������ɱ��_���v�����ֶ�?
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BUFFNPC_39]", "LuaS_DR_NPC_100" ,0 )
	end
end



function LuaS_DR_NPC_20() 	--����BUFF
	--OwnerID = ���a
	-- TargetID = NPC
	if CheckFlag( OwnerID(), 543964) == true then
		SetSpeakDetail( OwnerID(), "[SC_BUFFNPC_27]") --�A���Ѥw�g����L�F�A���ѦA�ӧa�C
		 CloseSpeak( OwnerID() )
		return false
	else
		Addbuff( OwnerID(), 506831, 0, 7200) --���� DR 20% BUFF 2�p��
		SetFlag( OwnerID(), 543964, 1 )
		CloseSpeak( OwnerID() )
	end
end	
	

function LuaS_DR_NPC_50()
	--OwnerID = ���a
	-- TargetID = NPC
	if CheckFlag( OwnerID(), 543964) == true then
		SetSpeakDetail( OwnerID(), "[SC_BUFFNPC_27]") --�A���Ѥw�g����L�F�A���ѦA�ӧa�C
		 CloseSpeak( OwnerID() )
		return false
	else
		Addbuff( OwnerID(), 506832, 0, 7200) --���� DR 50% BUFF 2�p��
		SetFlag( OwnerID(), 543964, 1 )
		CloseSpeak( OwnerID() )
	end
end


function LuaS_DR_NPC_100()
	--OwnerID = ���a
	-- TargetID = NPC
	if CheckFlag( OwnerID(), 543964) == true then
		SetSpeakDetail( OwnerID(), "[SC_BUFFNPC_27]") --�A���Ѥw�g����L�F�A���ѦA�ӧa�C
		 CloseSpeak( OwnerID() )
		return false
	else
		Addbuff( OwnerID(), 506833, 0, 7200) --���� DR 100% BUFF 2�p��
		SetFlag( OwnerID(), 543964, 1 )
		CloseSpeak( OwnerID() )
	end
end


function LuaS_debt_NPC_na() 	--�P�_���P���ż��y�� NPC
	--OwnerID = ���a
	-- TargetID = NPC

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- ���V

	BeginPlot( TargetID() , "LuaS_NPC_Ranger_na" , 0 )



	if ReadRoleValue ( TargetID(), EM_RoleValue_PID ) == 401 then
		SetSpeakDetail( OwnerID(), "[SC_BUFFNPC_36]" )	--�A�n�A�Q����h�������ŰȪ����ֶ�?
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BUFFNPC_39]" , "LuaS_debt_na_part_01", 0 )
	elseif ReadRoleValue ( TargetID(), EM_RoleValue_PID) == 402 then
		SetSpeakDetail ( OwnerID(),  "[SC_BUFFNPC_35]" )	--�A�n�A�Q����M���Ҧ��ŰȪ����ֶ�?
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BUFFNPC_39]", "LuaS_debt_na_all_01" ,0 )
	end
end

		 
function LuaS_debt_na_part_01()
	local DebtEXP = ReadRoleValue( OwnerID(), EM_RoleValue_DebtExp) --�t��EXP
	local DebtTP = ReadRoleValue( OwnerID(), EM_RoleValue_DebtTP) --�t��TP
	local EXP = 5000
	local TP = 500
	local NewEXP = DebtEXP+EXP
	local NewTP = DebtTP+TP


	if CheckFlag( OwnerID(), 543965) == true then
		SetSpeakDetail( OwnerID(), "[SC_BUFFNPC_27]" ) --�A���Ѥw�g����L�F�A���ѦA�ӧa�C
		return false
	elseif DebtEXP>=0 and DebtTP >= 0 then
		SetSpeakDetail( OwnerID(), "[SC_BUFFNPC_37]") 
		--Say( OwnerID(), "Step=0" )
		return FALSE

	elseif  NewEXP < 0 and NewTP <0 then

		WriteRoleValue( OwnerID(), EM_RoleValue_DebtExp, NewEXP)
		WriteRoleValue( OwnerID(), EM_RoleValue_DebtTP, NewTP)
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BUFFNPC_38]" , C_SYSTEM )	--�A�w�g��o�e�������֡C
		SetFlag( OwnerID(), 543965, 1)
		CloseSpeak( OwnerID() )
		--Say( OwnerID(), "Step=1" )

	elseif  NewEXP >=0 or NewTP <0 then
		if NewEXP >0 then
			NewEXP = 0
		end
		if NewTP >0 then
			NewTP = 0
		end
		WriteRoleValue( OwnerID(), EM_RoleValue_DebtExp, NewEXP)
		WriteRoleValue( OwnerID(), EM_RoleValue_DebtTP, NewTP)
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BUFFNPC_38]" , C_SYSTEM )	--�A�w�g��o�e�������֡C
		SetFlag( OwnerID(), 543965, 1)
		CloseSpeak( OwnerID() )
		--Say( OwnerID(), "Step=2" )

	elseif  NewEXP <0 or NewTP >=0 then
		if NewEXP >0 then
			NewEXP = 0
		end
		if NewTP >0 then
			NewTP = 0
		end
		WriteRoleValue( OwnerID(), EM_RoleValue_DebtExp, NewEXP)
		WriteRoleValue( OwnerID(), EM_RoleValue_DebtTP, NewTP)
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BUFFNPC_38]" , C_SYSTEM )	--�A�w�g��o�e�������֡C
		SetFlag( OwnerID(), 543965, 1)
		CloseSpeak( OwnerID() )
		--Say( OwnerID(), "Step=3" )
	end
end


function LuaS_debt_na_all_01()
-- OwnerID = ���a
-- TargetID = NPC
	local DebtEXP = ReadRoleValue( OwnerID(), EM_RoleValue_DebtExp )
	local DebtTP = ReadRoleValue( OwnerID(), EM_RoleValue_DebtTP )
	if CheckFlag ( OwnerID(), 543965) == true then
		SetSpeakDetail( OwnerID() ,"[SC_BUFFNPC_27]")  --�A���Ѥw�g����L�F�A���ѦA�ӧa�C
		return false
	else
		WriteRoleValue( OwnerID(), EM_RoleValue_DebtExp, 0 )	--���aEXP�t���k0
		WriteRoleValue( OwnerID(), EM_RoleValue_DebtTP, 0 )	--���aTP�t���k0
		ScriptMessage( OwnerID(), OwnerID() , 1, "[SC_BUFFNPC_38]", C_SYSTEM )
		SetFlag( OwnerID(), 543965, 1)
		CloseSpeak( OwnerID() )
	end
end		
	


function LuaS_buffnpc_na_DelNPC_01()
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		return 0
	end
	local Time = 0 
	local Step = 0
	local DialogStatus = 0

	DialogCreate( OwnerID(), EM_LuaDialogType_Select, "[SC_BUFFNPC_40]" )   --NPC������ܪ��
	AddBuff(OwnerID() , 501570,0,-1);
 		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_39]")  -- �T�w�R��[0]
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_12]") --�^��W����[1]
	

	if ( DialogSendOpen(OwnerID() ) == false)  then  --���ϥο��~�A�^�ǿ��~�T��
		ScriptMessage ( OwnerID(), OwnerID(), 1, "[SYS_FIXEQ_DATA_ERROR]", 0) 
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
				CancelBuff( OwnerID(), 501570 );
				DialogClose( OwnerID() );
			elseif DialogStatus == 0 then  --TP
				CancelBuff( OwnerID(), 501570 );--
				Beginplot( OwnerID(), "LuaS_buffnpc_na_DelNPC_02" , 0 )
				DialogClose( OwnerID() )
			--	Say( OwnerID() , DialogStatus )			
				Step = 1			
			elseif DialogStatus == 1 then -- �^��W����
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "LuaS_buffnpc_na",0 )
			DialogClose( OwnerID() )
			Step= 1
			end
		if Step == 1 then
			break
		end
	end
end  



function LuaS_buffnpc_na_DelNPC_02() 	--�R��NPC

	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID) --�T�{���A�������y
	local Count = SetSearchAllNPC( RoomID) --�M����y���Ҧ���NPC
	local Obj

	if  Count ~= 0 then
		for i=1 , Count, 1 do  --�]�w�j�M�Ҧ�NPC���ƪ��j��
			local ID = GetSearchResult() --���o�j�MNPC�����G
			Obj=Role:New(ID)
			
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue(  ID, EM_RoleValue_OrgID)--�T�{�Ҧ�NPC���s��
				if Name == 115554 or Name == 115555 or Name == 115556 or Name == 115557  then  --�Y�O���S�wNPC
				DelObj(ID) 
				end
			end
		end
	end
end




--���եέt�ŭ�
function LuaS_buffnpc01_na()

		WriteRoleValue( OwnerID(), EM_RoleValue_DebtExp, -2000 )	
		WriteRoleValue( OwnerID(), EM_RoleValue_DebtTP, -200 )	
end


function LuaS_buffnpc02_na()

		WriteRoleValue( OwnerID(), EM_RoleValue_DebtExp, 0)	
		WriteRoleValue( OwnerID(), EM_RoleValue_DebtTP, -600 )
end


function LuaS_buffnpc03_na()

		WriteRoleValue( OwnerID(), EM_RoleValue_DebtExp, -60000)	
		WriteRoleValue( OwnerID(), EM_RoleValue_DebtTP, 0 )
end


function LuaS_buffnpc04_na()

		WriteRoleValue( OwnerID(), EM_RoleValue_DebtExp, -4000)	
		WriteRoleValue( OwnerID(), EM_RoleValue_DebtTP, -600 )
end


function LuaS_buffnpc05_na()

		WriteRoleValue( OwnerID(), EM_RoleValue_DebtExp, -8000)	
		WriteRoleValue( OwnerID(), EM_RoleValue_DebtTP, -300 )
end


function LuaS_NPC_Ranger_na()	-- �Z���W�L50�Y������ܵ���

	while true do
		if GetDistance( OwnerID() , TargetID() )  >= 50 then
			CloseSpeak( TargetID() )
			AdjustFaceDir( OwnerID(), TargetID() , 0 ) -- ���V
			PlayMotion( OwnerID() , 116 ) -- �A��
			break
		end
		sleep(10)
	end
end
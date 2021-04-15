function LuaI_421452_A_Check()

	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local MonsterID = 100992

	if CheckAcceptQuest( OwnerID() , 421452 ) == false then
		return false							--�S�����Ȫ����A
	elseif CountBodyItem( OwnerID() , 202919 ) >= 10 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_421452_1") , 0 )	--�A�w�g�F������Ĩۣ�H�������ƶq
		return false
	elseif ( CheckID( TargetID() ) == false ) or ( TargetID() == OwnerID() ) or  ( OrgID ~= MonsterID ) then
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_421452_2") , 0 )	--�A�Ү�����H���O����Ĩۣ�H�I
		return false
	else
		return true
	end

end

function LuaC_421452_A_Effect()

	BeginPlot( TargetID() , "LuaI_421452_Reset" , 0 )
	ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_421452_3") , 0 )	--�A���\��������@�����q����Ĩۣ�H�I
	GiveBodyItem( OwnerID() , 202919 , 1 )
	BeginPlot( OwnerID() , "LuaS_421452_SetFlag" , 0 )

end

function LuaI_421452_B_Check()

	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local MonsterID = 100992

	if CheckAcceptQuest( OwnerID() , 421452 ) == false then
		return false							--�S�����Ȫ����A
	elseif CountBodyItem( OwnerID() , 202920 ) >= 1 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_421452_1") , 0 )	--�A�w�g�F������Ĩۣ�H�������ƶq
		return false
	elseif ( CheckID( TargetID() ) == false ) or ( TargetID() == OwnerID() ) or  ( OrgID ~= MonsterID ) then
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_421452_2") , 0 )	--�A�Ү�����H���O����Ĩۣ�H�I
		return false	
	else
		return true
	end

end

function LuaC_421452_B_Effect()

	BeginPlot( TargetID() , "LuaI_421452_Reset" , 0 )
	ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_421452_4") , 0 )	--�A���\��������@����������Ĩۣ�H�I
	GiveBodyItem( OwnerID() , 202920 , 1 )
	BeginPlot( OwnerID() , "LuaS_421452_SetFlag" , 0 )

end

function LuaI_421452_Reset()
	LuaFunc_ResetObj( OwnerID() )
end

function LuaS_421452_SetFlag()

	Sleep( 10 )
	if CountBodyItem( OwnerID() , 202919 ) >= 10 then
		SetFlag( OwnerID() , 541797 , 1 )	--����Ĩۣ�H��������
	end
	if CountBodyItem( OwnerID() , 202920 ) >= 1 then
		SetFlag( OwnerID() , 541797 , 1 )	--����Ĩۣ�H��������
	end

end

function LuaQ_421452_Complete()

	DelBodyItem( TargetID() , 202919 , CountBodyItem( TargetID() , 202919 ) )
	DelBodyItem( TargetID() , 202937 , CountBodyItem( TargetID() , 202937 ) )

	if DelBodyItem( TargetID() , 202920 , 1 ) then
		local RND =  Rand( 1000 ) + 1	-- ���� 1~1000 ���ü�
		local ItemID
		if RND > 0 and RND <= 400 then
			ItemID = 202921
		elseif RND > 400 and RND <= 600 then
			ItemID = 202922
		elseif RND > 600 and RND <= 800 then
			ItemID = 202923
		elseif RND > 800 and RND <= 900 then
			ItemID = 202924
		elseif RND > 900 and RND <= 950 then
			ItemID = 202925
		elseif RND > 950 and RND <= 999 then
			ItemID = 202926
		elseif RND > 999 and RND <= 1000 then
			ItemID = 202927
		else
			Say( TargetID() , "Somrthing Error !!")
		end

		GiveBodyItem( TargetID() , ItemID , 1 )
	end
end

function LuaS_111377()

	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	if	GetServerDataLanguage()  ~= "kr"	then--�p�G���O�������~�q
		if CheckAcceptQuest( OwnerID() , 421452 ) == true then
			AddSpeakOption( OwnerID(), TargetID(), GetString("SC_421452_5"), "LuaS_111377_BUY" , 0 )	--�ﶵ�A�ڭn�ʶR�����M÷
		end
	end
end

function LuaS_111377_BUY()
	CloseSpeak( OwnerID() )	--������ܵ���
	BeginPlot( OwnerID(), "LuaS_111377_Dialog", 1 )
end

function LuaS_111377_Dialog()
	local n = 0
	local DialogResult = ""
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_

		if CheckFlag( OwnerID() , 541799 ) == false then
			DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , GetString("SC_421452_6") )	-- �����M÷�u�ݪ�O�z 1 �����Ť���A�A�Q�n�ʶR�ܡH
		else
			DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , GetString("SC_421452_10") )	-- �����M÷�u�ݪ�O�z 10 �����Ť���A�A�Q�n�ʶR�ܡH
		end
		DialogSelectStr( OwnerID() , GetString("SC_421452_7") )	-- �S���D�A�ڶR�F�I
		DialogSelectStr( OwnerID() , GetString("SC_421452_8") )	-- �ӶQ�F���Q�R�I
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF

		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--��ưe�X�����D
			return 0
		end
		
		while true do
			Sleep( 5 )
			local DialogStatus = DialogGetResult( OwnerID() );
			n = n + 1
			if n > 120 then -- ���L�a�j��A120 = 1����
				--ScriptMessage( OwnerID(), OwnerID(), 0, "�L�a�j��", 0 )
				DialogClose( OwnerID() )
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF

				break
			else
				--ScriptMessage( OwnerID(), OwnerID(), 0, "�X�k�j��", 0 )
			end

			if ( DialogStatus >-2 ) then 
				if ( DialogStatus == 0 ) then
					DialogResult = "Yes"
					DialogClose( OwnerID() )
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					break;
				elseif ( DialogStatus == 1 ) or (DialogStatus==-1) then
					DialogResult = "No"
					DialogClose( OwnerID() )
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					break;
				end
			end
		end

		if ( DialogResult == "Yes" ) then
			local AccountMoney = ReadRoleValue( OwnerID() , EM_RoleValue_Money_Account )
			--ScriptMessage( OwnerID(), TargetID(), 0, "You Have Money�G"..AccountMoney , 0 )

			if CheckFlag( OwnerID() , 541799 ) == false then
				if ( AccountMoney < 1 ) then
					ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_421452_9") , C_DEFAULT )	-- �A���W���Ť�������A�жi���x�ȡI
					--Say ( TargetID() , GetString("SC_421452_9") )	-- �A���W���Ť�������A�жi���x�ȡI
				else
		 			if AddMoney_Account( OwnerID() ,  EM_ActionType_PlotGive , -1 )==true then--���a�I1���p�A���L�����M÷��Ĩۣ�H���d��(��1���ʶR�u�f)
						SetFlag( OwnerID() , 541799 , 1 )
						GiveBodyItem ( OwnerID() , 202938 , 1 )	-- �����M÷
					else
						ScriptMessage(OwnerID(),OwnerID(),1,"[SC_EXCHANGE_FAIL]",0);
					end
				end
			else
				if ( AccountMoney < 10 ) then
					ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_421452_9") , C_DEFAULT )	-- �A���W���Ť�������A�жi���x�ȡI
					--Say ( TargetID() , GetString("SC_421452_9") )	-- �A���W���Ť�������A�жi���x�ȡI
				else
		 			if AddMoney_Account( OwnerID() ,  EM_ActionType_PlotGive , -10 )==true then--���a�I10���p�A���L�����M÷��Ĩۣ�H���d��
						GiveBodyItem ( OwnerID() , 202938 , 1 )	-- �����M÷
					else
						ScriptMessage(OwnerID(),OwnerID(),1,"[SC_EXCHANGE_FAIL]",0);
					end
				end	
			end			
		elseif ( DialogResult == "No" ) then

		else
			--Say ( OwnerID() , GetString("SO_111082_6") )	-- �٬O�U���A�ӶR�a�I
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end

end

function LuaI_Enter_Myconid_Farm()
	SetPlot( OwnerID() , "Collision" , "Enter_Myconid_Farm" ,  0 )
end

function Enter_Myconid_Farm()
	if ChangeZone( OwnerID() , 301 , -1 , 1114 , 0 , 1075 , 305 ) then
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					--���o���a����
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--���o���a��¾����
		DesignLog(OwnerID(),301,"last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)	--�����i�J�H��
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
	end
end

function LuaI_Outer_Myconid_Farm()
	SetPlot( OwnerID() , "Collision" , "Outer_Myconid_Farm" ,  0 )
end

function Outer_Myconid_Farm()
	ChangeZone( OwnerID() , 1 , 0 , -1953 , 191 , -7700 , 90 )
end

function LuaI_Myconid_Pet()
	local Seed = 491310
	local RND = Rand( 5 ) + 1
	CastSpell( OwnerID() , OwnerID() , Seed + RND )
end
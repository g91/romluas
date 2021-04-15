function Hao_Monetary_Union_240181(Player , Coin)	-- 6.0.0 �f����X ���a�B�榸�����f��

	local Maximun = 1000	-- �����Ŷꨩ���o�W���q
	local Coin_Total = ReadRoleValue( Player , EM_RoleValue_PhiriusShellCoin )	-- ���W�����q
	
	if Maximun > Coin_Total then	-- ���W�����q < �W���q��
		local Count = 0
		if (Maximun - Coin_Total) >= Coin then	-- ��W���q-�����q > Coin
			Count = Coin
		else
			Count = Maximun - Coin_Total
		end
		ScriptMessage( Player , Player , 0 , "[SC_240181_02][$SETVAR1="..Count.."]" , C_SYSTEM )	-- �D¾����50�H�W�A�B�~��o[$VAR1]��[240181]
		ScriptMessage( Player , Player , 1 , "[SC_240181_02][$SETVAR1="..Count.."]" , C_SYSTEM )	-- �D¾����50�H�W�A�B�~��o[$VAR1]��[240181]
		AddSpeicalCoin( Player , 11 , 11 , Count )	-- ����̡BAction Type(�@������)�B�����Ŷꨩ�N���B���������ƶq
		if Count < Coin then
			ScriptMessage( Player , Player , 0 , "[SC_240181_01]" , 0 )	-- �A�̦h�u��O�d1000�ӥ����Ŷꨩ�A�Ӫ��~���o�ƶq�w�F�W���C
			ScriptMessage( Player , Player , 2 , "[SC_240181_01]" , 0 )
		end
	else
		ScriptMessage( Player , Player , 0 , "[SC_240181_01]" , 0 )	-- �A�̦h�u��O�d1000�ӥ����Ŷꨩ�A�Ӫ��~���o�ƶq�w�F�W���C
		ScriptMessage( Player , Player , 2 , "[SC_240181_01]" , 0 )
	end	
end

function Hao_Monetary_Union_Adjust()	-- ���ի��O�A�վ�f��

	local Player = OwnerID()

	if CheckBuff( Player , 501570 ) == true then 
		ScriptMessage( Player , Player , 0 , "[SC_WINDOW_OPENED]", 0 )	--�����w�g���}�F
		return
	end
	
	local Time = 0
	local DialogStatus
	local Currency_Code = ""
	local List = {}
		List[0] = "Reset"			-- �M���Ҧ�
		List[1] = "Full"			-- ����
		List[2] = "[SYS_MONEY_TYPE_11]"	-- �����Ŷꨩ
		List[3] = "[SYS_MONEY_TYPE_12]"	-- ���q��q
		List[4] = "[SYS_MONEY_TYPE_10]"	-- �ڹҥ����L�O
		List[5] = "[SYS_MONEY_TYPE_9]"	-- �j�N��
		List[6] = "[SYS_MONEY_TYPE_13]"	-- �ǩ_����
		List[7] = "[SYS_MONEY_TYPE_4]"	-- �a�A�I��
		List[8] = "[SYS_MONEY_TYPE_8]"	-- �շ�����
		List[9] = "[SYS_MONEY_TYPE_14]"	-- �i�h����

	AddBuff( Player , 501570 , 0 , -1 )
	DialogCreate( Player , EM_LuaDialogType_Input , "Please enter Currency Code" )	-- �п�J�f���N��
	DialogSelectStr( Player , "Accept" )
	DialogSelectStr( Player , "Cancel" )

	for i = 0 , #List , 1 do
		Tell( Player , Player , String.format("%01d", i ).." = "..List[i] )
		if i == #List then
			Tell( Player , Player , "Enter Number : 0 ~ "..i )
		end
	end

	if DialogSendOpen(Player) == false then  --���ϥο��~�A�^�ǿ��~�T��
		ScriptMessage ( Player , Player , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )
		return
	end

	while true do
		sleep(1)
		Time = Time+1
	 	if Time > 600 then  -- 60��L�ʧ@�A������ܵ���
			ScriptMessage( Player , Player , 0 , "Idle for more than 60 sec , window will close automatically." , 0 ) -- ���m�W�L60��,�۰����������C
			break
		end
		DialogStatus = DialogGetResult( Player )  --�ˬd�ϥΪ̿��������
		if DialogStatus ~= -2 and DialogStatus ~= -1 then -- �������l�ƤΤ��_��
			Currency_Code = DialogGetInputResult( Player )
			if DialogStatus == 0 then  -- ����J�r��
				if tonumber(Currency_Code) == nil or Currency_Code == "" or math.abs(tonumber(Currency_Code)) > #List then	-- ��J���ɡA������r��Ϊťիh...

					Tell( Player , Player , "Nullity String Code." )	-- ��J���~
					break
				else
					Tell( Player , Player , List[tonumber(Currency_Code)] )
					CancelBuff( Player, 501570 )
					DialogClose( Player )
					return Hao_Monetary_Union_Adjust_01( Player , tonumber(Currency_Code) )
				end
			else
				break
			end
		elseif DialogStatus == -1 then	-- ���_
			break
		end
	end
	CancelBuff( Player , 501570 )
	DialogClose( Player )
end

function Hao_Monetary_Union_Adjust_01( Player , Currency_Code )

	if CheckBuff( Player , 501570 ) == true then
		ScriptMessage( Player , Player , 0 , "[SC_WINDOW_OPENED]" , 0 )	--�����w�g���}�F
		return
	end	
	
	local Time = 0
	local DialogStatus
	local Trading_Volume = ""
	local CoinDefine = {}
	CoinDefine[2] = { EM_RoleValue_PhiriusShellCoin , 11 , 1000 }		-- �����Ŷꨩ�B�f���s���B�f���W���G99999���ۭq�W��
	CoinDefine[3] = { EM_RoleValue_EnergyJusticeCoin , 12 , 99999 } 		-- ���q��q
	CoinDefine[4] = { EM_RoleValue_DreamlandCoin ,  10 , 99999 }		-- �ڹҥ����L�O
	CoinDefine[5] = { EM_RoleValue_RelicsCoin , 9 , 10000 }			-- �j�N��
	CoinDefine[6] = { EM_RoleValue_ProofLegendCoin , 13 , 99999 }		-- �ǩ_����
	CoinDefine[7] = { EM_RoleValue_Honor , 4 , 25000 }			-- �a�A�I��			
	CoinDefine[8] = { EM_RoleValue_TrialBadgeCoin , 8 , 99999 }		-- �շ�����
	CoinDefine[9] = { EM_RoleValue_DuelistReward , 14 , 20000 } 		-- �i�h����

	if Currency_Code == 0 or Currency_Code == 1 then	-- ��Ҧ����M���Υ����ɰ���
		for i = 2 , #CoinDefine , 1 do
			local Count = ReadRoleValue( Player , CoinDefine[i][1] )
			if Currency_Code == 0 then	-- ��ﶵ���M���ɫh ...
				AddSpeicalCoin( Player , 11 , CoinDefine[i][2] , -Count )
			else
				if CoinDefine[i][3] - Count > 0 then	-- ��ۭq�W�� - ���W�������f���ƶq > 0 �ɫh...
					AddSpeicalCoin( Player , 11 , CoinDefine[i][2] , CoinDefine[i][3] - Count )
				end
			end
		end
		return
	end				

	AddBuff( Player , 501570 , 0 , -1 )
	DialogCreate( Player , EM_LuaDialogType_Input , "Please enter Trading Volume" )	-- �п�J����q
	DialogSelectStr( Player , "Accept" )
	DialogSelectStr( Player , "Cancel" )

	if DialogSendOpen(Player) == false then  --���ϥο��~�A�^�ǿ��~�T��
		ScriptMessage ( Player , Player , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )
		return
	end

	while true do
		sleep(1)
		Time = Time+1
	 	if Time > 600 then  -- 60��L�ʧ@�A������ܵ���
			ScriptMessage( Player , Player , 0 , "Idle for more than 60 sec , window will close automatically." , 0 ) -- ���m�W�L60��,�۰����������C
			break
		end
		DialogStatus = DialogGetResult( Player )  --�ˬd�ϥΪ̿��������
		if DialogStatus ~= -2 and DialogStatus ~= -1 then -- �������l�ƤΤ��_��
			Trading_Volume = DialogGetInputResult( Player )
			if DialogStatus == 0 then  -- ����J�r��
				if Type(Trading_Volume) ~= "string" or Trading_Volume == "" or math.abs(tonumber(Trading_Volume)) > CoinDefine[tonumber(Currency_Code)][3] then
				-- ��J���ɡA������r��B�ťթμƭȨ�����ȫ�j��ۭq�W���ɫh...
					Tell( Player , Player , "Nullity String Code." )	-- ��J���~
					break
				else
   					AddSpeicalCoin( Player , 11 , CoinDefine[tonumber(Currency_Code)][2] , Trading_Volume )
					Tell( Player , Player , tonumber(Trading_Volume) )
					break
				end
			else
				break
			end
		elseif DialogStatus == -1 then	-- ���_
			break
		end
	end
	CancelBuff( Player , 501570 )
	DialogClose( Player )
end
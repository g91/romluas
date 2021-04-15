
-----------------------------------------------------------------------

function lua_beerfes_kors_00()--NPC��ܼ@��
--	DW_CancelTypeBuff( 68,  OwnerID() )-- �����M�����A

	local OID = OwnerID()
	local key = CheckFlag(OID,545614)  -- �w�ѥ[
	local key2 = CheckFlag(OID,545615)   -- �w�ܧ�
	local key3 = CheckFlag(OID,545616)    -- �w���
	local point = ReadRoleValue( OID, EM_RoleValue_Register )

	if key3 == TRUE then   --�w�^��
		SetSpeakDetail(OID,"[SC_BEERFE_KORS_10]")  --  ��Ѥw�����L���ʰT��
	else
		if key == true then  -- ���W�L�F
			if  key2 == true then
				SetSpeakDetail(OID,"[SC_BEERFE_KORS_08]")  -- �кɱ��ɥΥѧڭ̥������C�s���|���Ѫ��U����s�C
				AddSpeakOption(OID,TargetID(),"[SC_BEERFE_KORS_09]","lua_beerfes_kors_aw",0)   -- �ڤw�g�ܹL�F�C  (�^��)
			else  -- �����٨S����
				SetSpeakDetail(OID,"[SC_BEERFE_KORS_08]")  -- �кɱ��ɥΥѧڭ̥������C�s���|���Ѫ��U����s�C
			end
		else
			SetSpeakDetail(OID,"[SC_BEERFE_KORS_02]")  -- �{�b���b�|���s�^���v�ɡA�����D�A���S������ѥ[�O�H
			AddSpeakOption(OID,TargetID(),"[SC_BEERFE_KORS_03]","lua_beerfes_kors_01",0)  -- ��s�^���v�ɬO...�H  (����+ ���W)
			AddSpeakOption(OID,TargetID(),"[SC_BEERFE_KORS_05]","lua_beerfes_kors_gstar",0)  --   �ڷQ�ѥ[��s�^���v�ɡC   (  �������W)
		end
	end
end

function lua_beerfes_kors_01()--���ʶ}�l�e�ӱ��C
	SetSpeakDetail(OwnerID(),"[SC_BEERFE_KORS_04]")   -- ���ʳW�h
	AddSpeakOption(OwnerID(),TargetID(),"[SC_BEERFE_KORS_05]","lua_beerfes_kors_gstar",0)  -- �ڷQ�ѥ[[SC_BEERFE_KORS_00]�C
end


function lua_beerfes_kors_gstar()--���ʶ}�l�C
	local OID = OwnerID()
	CloseSpeak(OID)
	local Lv = ReadRoleValue( OID , EM_RoleValue_Lv )
	local SubLv = ReadRoleValue( OID , EM_RoleValue_LV_SUB )

	local bufftime = 90
	ScriptMessage(OID, OID,1,"[SC_BEERFE_KORS_18]", C_SYSTEM)      --    �{�b�N�I��s��A�ɱ��j�f�Z�֦a�ܧa�I
	AddBuff(OID,620973,1, bufftime )  -- buff  �L���Z����s����
	WriteRoleValue(OID,EM_RoleValue_Register,0)
	SetFlag(OID,545614,1)   --  ��KEY  ��Ѥw�ѥ[
	DesignLog( OID , 119548 , "Lv = "..Lv.." SubLv = "..SubLv )  --�^�Ǭ��ʰѻP��
end

-----------------------------------------------------------------------

-- �I�s��@��	
function lua_beerfes_kors_drinks()
	setplot(OwnerID(), "touch", "lua_beerfes_kors_drinks2", 30  )
end

function lua_beerfes_kors_drinks2()--���s
	local OID = OwnerID()
	local act = CheckBuff( OID,620973)

	if act == TRUE then 
		CastSpell(OID, OID, 498384)  --  �s �I�k
	else
		local point = ReadRoleValue( OID,EM_RoleValue_Register)
		if point > 0 then  -- ������
			ScriptMessage(OID,OID,1,"[SC_BEERFE_KORS_17]",C_SYSTEM )  -- �ЦV[119548]�^���A�����Z�a�C
		else
			ScriptMessage(OID,OID,1,"[SC_BEERFE_KORS_06]",0 )  -- �Х���[119548]���[620973]�~�ಱ�s
		end
	end
end

-- �򥻪k�N����
function lua_beerfes_kors_drinks3()
	local OID = OwnerID()
	local bufftime = 600

	local R = Rand(100)+1

--	PlayMotion( OID, ruFUSION_ACTORSTATE_EMOTE_DRINK ) --����ܪ��ʧ@
	AttachCastMotionTool( OID , 212075 ) --�m���Z������s�M

	if R <= 48 then
		local nowlv = FN_CountBuffLevel(OID, 620979 )  -- �s�K�ȵ���  
		CancelBuff(OID, 620979 )
		AddBuff (OID,620979, (nowlv+5), bufftime )    --  �W�[�s�K��
		local beerlv = FN_CountBuffLevel(OID, 620979 )  -- �s�K�ȵ���  
	--	Say(OID, "now beer lv is "..(nowlv+1).."to "..(beerlv+1) )	

		if (beerlv+1) > 99 then  -- �W�L99
			Beginplot(OID, "lua_beerfes_kors_over99",  0 )  -- �W�L99
		else
			if  (beerlv+1) >= 70 then
				ScriptMessage(OID, OID,1,"[SC_BEERFE_KORS_16]", 0 )     --	��s�T�ꤣ���A���O�A�Pı��@�ѾK�Nŧ�ӡC
			end
			AddRoleValue(OID, EM_RoleValue_Register, 1  )
			local point = ReadRoleValue( OID,EM_RoleValue_Register )
			ScriptMessage(OID, OID,1,"[SC_BEERFE_KORS_19]"..point, C_SYSTEM)      --    �ثe��o�����ƬO�G
		end
	elseif R >= 49 and R <= 83  then
		local nowlv = FN_CountBuffLevel(OID, 620979 )  -- �s�K�ȵ���  
		CancelBuff(OID, 620979 )
		AddBuff (OID,620979, (nowlv+10), bufftime )    --  �W�[�s�K��
		local beerlv = FN_CountBuffLevel(OID, 620979 )  -- �s�K�ȵ���  
	--	Say(OID, "now beer lv is "..(nowlv+1).."to "..(beerlv+1) )	

		if (beerlv+1) > 99 then  -- �W�L99
			Beginplot(OID, "lua_beerfes_kors_over99",  0 )  -- �W�L99
		else
			if  (beerlv+1) >= 70 then
				ScriptMessage(OID, OID,1,"[SC_BEERFE_KORS_16]", 0 )     --	��s�T�ꤣ���A���O�A�Pı��@�ѾK�Nŧ�ӡC
			end			
			AddRoleValue(OID, EM_RoleValue_Register, 1  )
			local point = ReadRoleValue( OID,EM_RoleValue_Register )
			ScriptMessage(OID, OID,1,"[SC_BEERFE_KORS_19]"..point, C_SYSTEM)      --    �ثe��o�����ƬO�G
		end
	elseif R >= 84 and R <= 93  then
		local nowlv = FN_CountBuffLevel(OID, 620979 )  -- �s�K�ȵ���  
		CancelBuff(OID, 620979 )
		AddBuff (OID,620979, (nowlv+20), bufftime )    --  �W�[�s�K��
		local beerlv = FN_CountBuffLevel(OID, 620979 )  -- �s�K�ȵ���  
	--	Say(OID, "now beer lv is "..(nowlv+1).."to "..(beerlv+1) )	

		if (beerlv+1) > 99 then  -- �W�L99
			Beginplot(OID, "lua_beerfes_kors_over99",  0 )  -- �W�L99
		else
			if  (beerlv+1) >= 70 then
				ScriptMessage(OID, OID,1,"[SC_BEERFE_KORS_16]", 0 )     --	��s�T�ꤣ���A���O�A�Pı��@�ѾK�Nŧ�ӡC
			end
			AddRoleValue(OID, EM_RoleValue_Register, 1  )
			local point = ReadRoleValue( OID,EM_RoleValue_Register )
			ScriptMessage(OID, OID,1,"[SC_BEERFE_KORS_19]"..point, C_SYSTEM)      --    �ثe��o�����ƬO�G
		end

	elseif R >= 94  and R<= 98 then
		local nowlv = FN_CountBuffLevel(OID, 620979 )  -- �s�K�ȵ���  
		CancelBuff(OID, 620979 )
		AddBuff (OID,620979, (nowlv+30), bufftime)    --  �W�[�s�K��
		local beerlv = FN_CountBuffLevel(OID, 620979 )  -- �s�K�ȵ���  
	--	Say(OID, "now beer lv is "..(nowlv+1).."to "..(beerlv+1) )	

		if (beerlv+1) > 99 then  -- �W�L99
			Beginplot(OID, "lua_beerfes_kors_over99",  0 )  -- �W�L99
		else
			if  (beerlv+1) >= 70 then
				ScriptMessage(OID, OID,1,"[SC_BEERFE_KORS_16]", 0 )     --	��s�T�ꤣ���A���O�A�Pı��@�ѾK�Nŧ�ӡC
			end
			AddRoleValue(OID, EM_RoleValue_Register, 1  )
			local point = ReadRoleValue( OID,EM_RoleValue_Register )
			ScriptMessage(OID, OID,1,"[SC_BEERFE_KORS_19]"..point, C_SYSTEM)      --    �ثe��o�����ƬO�G
		end
	elseif  R>= 99  then   --�����g�J99 
		local nowlv = FN_CountBuffLevel(OID, 620979 )  -- �s�K�ȵ���  
		CancelBuff(OID, 620979 )
		AddBuff (OID,620979, 98 , bufftime )    --  �W�[�s�K��99
		local beerlv = FN_CountBuffLevel(OID, 620979 )  -- �s�K�ȵ���  
	--	Say(OID, "now beer lv is "..(nowlv+1).."to "..(beerlv+1) )	
		ScriptMessage(OID, OID,1,"[SC_BEERFE_KORS_07]", 0 )     -- �A�w�����I���b�g�۪��K�N���A�h�M���@�U�a
		AddRoleValue(OID, EM_RoleValue_Register, 1  )
		local point = ReadRoleValue( OID,EM_RoleValue_Register )
		ScriptMessage(OID, OID,1,"[SC_BEERFE_KORS_19]"..point, C_SYSTEM)      --    �ثe��o�����ƬO�G
	end
end

function lua_beerfes_kors_over99()
	local OID = OwnerID()
	local beerlv = FN_CountBuffLevel(OID, 620979 )  -- �s�K�ȵ���  
	local point = ReadRoleValue(OID,EM_RoleValue_Register)

	ScriptMessage(OID,OID,1,"[SC_BEERFE_KORS_13]",0 )  -- �ܤF�o�M�A�Pı��@�}�ѱۦa��C���G�O����A�ܤF�C
	CancelBuff(OID,620973)  --���ʥΰs�M
end


-- �I����@��	
function lua_beerfes_kors_water()
	setplot(OwnerID(), "touch", "lua_beerfes_kors_water2", 30  )
end

function lua_beerfes_kors_water2() --����
	local OID = OwnerID()
	local act = CheckBuff( OID,620973)

	if act == TRUE then 
		local nowlv = FN_CountBuffLevel(OID, 620979 )  -- �s�K�ȵ���  

		if nowlv <= 0 or CheckBuff(OID, 620979) == false then
			ScriptMessage(OID,OID,1,"[SC_BEERFE_KORS_15]", 0 )  -- �A�٫ܲM���A���O�ܤ��a
		else  --  �s�K�Ȥj��71
				CastSpell(OID, OID, 498385)  --  �s �I�k
		end
	else
		local point = ReadRoleValue( OID,EM_RoleValue_Register)
		if point > 0 then  -- ������
			ScriptMessage(OID,OID,1,"[SC_BEERFE_KORS_17]",C_SYSTEM )  -- �ЦV[119548]�^���A�����Z�a�C
		else
			ScriptMessage(OID,OID,1,"[SC_BEERFE_KORS_06]",0 )  -- �Х���[119548]���[620973]�~�ಱ�s
		end
	end
end

-- �򥻪k�N����
function lua_beerfes_kors_water3()
	local OID = OwnerID()
	local beerlv = FN_CountBuffLevel(OID, 620979 )  -- �s�K�ȵ���  

		ScriptMessage(OID,OID,1,"[SC_BEERFE_KORS_14]", C_SYSTEM )  -- �ܤU�F�M���A�Pı��믫�n�F�@�I�C

		local R = Rand(100)+1
		AttachCastMotionTool( OID , 212075 ) --�m���Z������s�M

		if R <= 48 then
			local nowlv = FN_CountBuffLevel(OID, 620979 )  -- �s�K�ȵ���  
			local value = 5

			CancelBuff(OID, 620979 )
			if nowlv <= value then -- �ثebufflv <= 5 ,
				AddBuff (OID,620979, 0 , 300)    --   ���C�s�K��
			else	
				AddBuff (OID,620979, (nowlv-value), 300)    --   ���C�s�K��
			end
		elseif R >= 49 and R <= 83  then
			local nowlv = FN_CountBuffLevel(OID, 620979 )  -- �s�K�ȵ���  

			local value = 10
			CancelBuff(OID, 620979 )
			if nowlv <= value then -- �ثebufflv <= 5 ,
				AddBuff (OID,620979, 0 , 300)    --   ���C�s�K��
			else	
				AddBuff (OID,620979, (nowlv-value), 300)    --   ���C�s�K��
			end
		elseif R >= 84 and R <= 93  then
			local nowlv = FN_CountBuffLevel(OID, 620979 )  -- �s�K�ȵ���  

			local value = 20
			CancelBuff(OID, 620979 )
			if nowlv <= value then -- �ثebufflv <= 5 ,
				AddBuff (OID,620979, 0 , 300)    --   ���C�s�K��
			else	
				AddBuff (OID,620979, (nowlv-value), 300)    --   ���C�s�K��
			end
		elseif R >= 94  and R<= 98 then
			local nowlv = FN_CountBuffLevel(OID, 620979 )  -- �s�K�ȵ���  

			local value = 30
			CancelBuff(OID, 620979 )
			if nowlv <= value then -- �ثebufflv <= 5 ,
				AddBuff (OID,620979, 0 , 300)    --   ���C�s�K��
			else	
				AddBuff (OID,620979, (nowlv-value), 300)    --   ���C�s�K��
			end

		elseif  R>= 99 then   --�����g�J0
			local nowlv = FN_CountBuffLevel(OID, 620979 )  -- �s�K�ȵ���  
			CancelBuff(OID, 620979 )
			AddBuff (OID,620979, 0, 300)    --  �]��1
			local beerlv = FN_CountBuffLevel(OID, 620979 )  -- �s�K�ȵ���  
		--	Say(OID, "now beer lv is "..(nowlv+1).."to "..(beerlv+1) )	
		end

end
---------------------------------------------------------------------------------------------
 
-- �򥻪k�N-  ����buff����  ����@��
function lua_beerfes_kors_timeup()
	local OID = OwnerID()
	ScriptMessage(OID,OID,1,"[SC_BEERFE_KORS_11]", C_SYSTEM )  --  ���ʵ����A�ЦV[119548]�^���A�����Z�a�C
	SetFlag(OID,545615,1)   -- ��Ѥw����
	AttachCastMotionTool( OID , 212076 ) -- �N�Z���m�����Ť�
end

function lua_beerfes_kors_aw() --����
	local OID = OwnerID()
	local point = ReadRoleValue( OID, EM_RoleValue_Register )
	local Lv = ReadRoleValue( OID , EM_RoleValue_Lv )
	local SubLv = ReadRoleValue( OID , EM_RoleValue_LV_SUB )

 	if CheckBuff(OID, 620979) == true then  -- ���ʵ�����, �B���s�K��buff
		SetSpeakDetail( OID,"[SC_BEERFE_KORS_10]")  -- ��Ѥw�������ʰT��
		if point <= 5  then  
			GiveBodyItem(OID, 724509, 1)  -- �������Ĥ�X1
		elseif point >= 6  and point <= 15 then
			GiveBodyItem(OID, 205941, 1)
		elseif point >= 16 and point <= 25 then
			GiveBodyItem(OID, 205941, 1)
			GiveBodyItem(OID, 205895, 1)   -- �ᵲ��X1 EXP+ 10%
		elseif point >= 26 then
			GiveBodyItem(OID, 205941, 2 )
			GiveBodyItem(OID, 205895, 1)   -- �ᵲ��X1 EXP+ 10%
			GiveBodyItem(OID, 205897, 1)   -- �ܥ֭��zX1 TP+ 10%
			if point >= 31 then
				if CountBodyItem(OID, 530857)  == 0 then
					GiveBodyItem(OID,530857,1)
				end
			end

		end
		CancelBuff(OID, 620979 )  -- �s�K��
	else  -- ���w����
		SetSpeakDetail( OID,"[SC_BEERFE_KORS_12]")  --  �S���s�KBUFF ( �Ӥ[�S�^��, ���ϩ����u) 
		-- �ݰ_�ӧA�n���K�N��h�F���֡A�٬O�P�§A�ѻP�������ʡI
		GiveBodyItem(OID, 724509, 1)  -- �������Ĥ�X1
	end

	DesignLog( OID , 1195481 , "Lv = "..Lv.." SubLv = "..SubLv )  --�^�Ǭ��ʰѻP��
	SetFlag(OID,545616,1)
	WriteRoleValue(OID,EM_RoleValue_Register,0)
	Lua_Festival_09_All(OID)  
end


---------------    ���ի��O ---------------------------------

-- ���m����
function lua_beerfes_kors_re()
	local OID = OwnerID()
	SetFlag(OID,545614,0)	
	SetFlag(OID,545615,0)
	SetFlag(OID,545616,0)
	CancelBuff_NoEvent(OID, 620973)  -- ���ʥΰs�M
 	CancelBuff(OID, 620979 )  -- �s�K��
	AttachCastMotionTool( OID , 212076 ) -- �N�Z���m�����Ť�
	WriteRoleValue(OID,EM_RoleValue_Register,0)
end

-- ���s�K�Ȭ�99
function lua_beerfes_beerlv99test()
	local OID = OwnerID()
 	CancelBuff(OID, 620979 )  -- �s�K��
	AddBuff(OID, 620979, 98, 300 )
end

-- �����g�J���Ƭ��S�w��
function lua_beerfes_scoretest(score)
	local OID = OwnerID()
	WriteRoleValue(OID,EM_RoleValue_Register, score )
	local number = ReadRoleValue(OID, EM_RoleValue_Register )
	Say(OID, "beer score ="..number )
end

--------------------------  �n�ʸ`�Ϊ� ����� ----------------------

function luaI_BEERFES_240742()
	local lv = ReadRoleValue(OwnerID(),EM_RoleValue_LV)
	if lv <= 20 then
		BeginPlot(OwnerID(),"TPPill_203064",0)
	elseif lv > 20 and  lv<= 40 then
		BeginPlot(OwnerID(),"TPPill_203580",0)
	elseif lv >40 and lv <=50 then 	
		BeginPlot(OwnerID(),"TPPill_203065",0)
	elseif lv>50  and lv <=60 then
		BeginPlot(OwnerID(),"TPPill_203066",0)
	elseif lv>60 then
		BeginPlot(OwnerID(),"TPPill_203067",0)
	end
end


function luaI_BEERFES_240741()
	local lv = ReadRoleValue(OwnerID(),EM_RoleValue_LV)
	if lv <= 40 then
		BeginPlot(OwnerID(),"luaI_BEERFES_240741_1",0)
	elseif lv > 40 then
		BeginPlot(OwnerID(),"luaI_BEERFES_240741_2",0)
	end
end

function luaI_BEERFES_240741_1()
	local itemset = { 60 ,""	, { 240743,1 }
		        , 95 , ""	, { 240744,1 }
		       , 100,""	, { 240745,1 } }

	return BaseTressureProc(   itemset , 1  )
end

function luaI_BEERFES_240741_2()
	local itemset = { 50 ,""	, { 240743,1 }
		        , 85 , ""	, { 240744,1 }
		        , 95 , ""	, { 240745,1 }
		       , 100,""	, { 240746,1 } }

	return BaseTressureProc(   itemset , 1  )
end

--Serverscript  702594

-- ���եμ@�� 
-- 2011�x�V�`���y�I��npc
function lua_mika_xmas2011_reward()
	local OID = OwnerID()
	local keyid = 545688  --���Ѧ�����L����
	local checkkey = Checkflag(OID, keyid )
	local winkeyid  = 546141   -- ��Ĺboss
	local checkwinkey = Checkflag(OID, winkeyid )

	SetSpeakDetail( OID , "hello" )  

	if checkwinkey == true then  -- ����Ĺboss 
		AddSpeakOption( OID , OID , "[SC_FIREDAY_EV1_21]" , "lua_mika_xmas2011_reward02" , 0)   --  ������y
	end
end

-- 2011�x�V�`���y�I�� ��Ĺ�����
function lua_mika_xmas2011_reward02()
	local OID = OwnerID()
	local keyid = 545688  --���Ѧ�����L����
	local checkkey = Checkflag(OID, keyid )
	local winkeyid  = 546141   -- ��Ĺboss

	-- ������y
	local itemid = 209389 -- ���Ѵ���
	local count = 15
	local rewardid = 725527  -- �B�~�l�[��	
	-- �@����y
	local ticketid = 206437  --  �ڬO���_�_�Ү�

	-- ���ʤ��ƧI����
	local score = ReadRoleValue(OID, EM_RoleValue_Register2 ) 

	CloseSpeak(OID)

	-- ���ʤ��ƧI����


	local ticketcount 
		if score >= 1 and score <=  50 then  -- 0 ~ 50
			ticketcount = 1
			GiveBodyItem(OID, ticketid , ticketcount  )
		elseif score >= 51 and score <= 100 then -- 6 ~ 10
			ticketcount = 2
			GiveBodyItem(OID, ticketid , ticketcount  )
		elseif score >=101 and score <= 200 then -- 11 ~ 20
			ticketcount = 3
			GiveBodyItem(OID, ticketid , ticketcount  )
		elseif score >= 201  then --  
			ticketcount = 5
			GiveBodyItem(OID, ticketid , ticketcount  )
		end

	WriteRoleValue(OID, EM_RoleValue_Register2, 0 )
	local R = ReadRoleValue(OID, EM_RoleValue_Register2 )
	--Say(OID, "R = "..R )

	-- �C�鴹���
	if checkkey == false then
		GiveBodyItem(OID, itemid, count )  -- ������
		Setflag(OID, keyid , 1 )   -- �������ѻ���L���⪺KEY
	end

	-- ��Ĺboss����l�[��
	GiveBodyItem(OID, rewardid , 1  )
	Setflag(OID, winkeyid , 0 )   --  �R����Ĺboss��key 

--	Say(OID, "end")  

end


-- �H�U�����ի��O

function lua_mika_xmas2011_test(value)
	local OID = OwnerID()
--	local value
	if value == 0 then
		WriteRoleValue(OID, EM_RoleValue_Register2, 0 )
		local R = ReadRoleValue(OID, EM_RoleValue_Register2 )
		Say(OID, "R = "..R )
	else
		AddRoleValue(OID, EM_RoleValue_Register2 , value )
		local R = ReadRoleValue(OID, EM_RoleValue_Register2 )
		Say(OID, "R = "..R )
	end

end

-- ������NPC-������� (120085)�ܦ����ʵ��������A
function lua_mika_xmas2011_R()
	local OID = OwnerID()
	local Fairy = LuaFunc_SearchNPCbyOrgID( OID , 120085, 500 , 0)       --Fairy
--	Say(Fairy, "I am Fairy" )
	WriteRoleValue(Fairy, EM_RoleValue_Register1 , 2 )  
	local R = ReadRoleValue( Fairy , EM_RoleValue_Register1 )  
	Say(Fairy, "R= "..R )
end
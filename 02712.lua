
-- 2013 ��´�`���y�I��

-- what to do
function lua_mika_weave_reward01()
	local OID = OwnerID()  --player
	local TID = TargetID()  -- Target
	local sex = ReadRoleValue(OID, EM_RoleValue_SEX )
	local Status = ReadRoleValue(TID, EM_RoleValue_PID ) -- NPC���A , PID��1  = ��@��

	if Status == 1 then
		SetSpeakDetail( OID , "[SC_WEAVE_REWARD_05]" )   -- wait
	else
		SetSpeakDetail( OID , "[SC_WEAVE_REWARD2013_02]" )   -- intro  2013 ����  , SC_WEAVE_REWARD_01  -- 2012 ����
-- 		[$PLAYERNAME]�A�A�n�A�ڬO���~�~�覨����´���|���_�v��[121054]�C���W�o�M�ŸˬO�̪��ٺ⺡�N���@�~�A���M�O�o�˻��A�b�ŵ��ޥ��W���ٻݭn�A�ݦh�[��l�ڡC�p�G�A��o�M�A�˦�����A�u�n�A����������[241645]��[241646]�A�ڱN�ର�A�K�O�s�@�@���C
--		ť�������s������<CN>[121044]</CN>�P�����f����<CN>[120888]</CN>��<CN>[121088]</CN>�������o�ǧ��ơA�p�G������N�h��ť�ݬݡA���A����A�ӧ�ڧa�I
--		�t�~�A���~��´���|�ǳƤF���e�״I��§���@�����_�I�̪��^�X�A�p�G�A����[241645]10�ӧO�ѤF�M�ڧI����I

		AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD2013_01]" , "lua_mika_weave_reward07" , 0)    --  �ڷQ�I��§��  SC_WEAVE_REWARD2013_01
		if sex == 0 then   -- �k��

			AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[231996]]" , "mika_weave_reward_new1(".."1"..")" , 0)    -- �ڷQ�s�@[$VAR1]  �k�c�l
			AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[231997]]" , "mika_weave_reward_new1(".."2"..")" , 0)    -- �ڷQ�s�@[$VAR1]  �k�Ǥl
			AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[231999]]" , "mika_weave_reward_new1(".."3"..")" , 0)    -- �ڷQ�s�@[$VAR1]  �k�U�l
			AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[231998]]" , "mika_weave_reward_new1(".."4"..")" , 0)    -- �ڷQ�s�@[$VAR1]  �k�A��
		--	AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[231996]]" , "lua_mika_weave_reward02" , 0)    -- �ڷQ�s�@[$VAR1]  �k�c�l
		--	AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[231997]]" , "lua_mika_weave_reward03" , 0)    --  �k�Ǥl
		--	AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[231999]]" , "lua_mika_weave_reward05" , 0)    --  �k�U�l
		--	AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[231998]]" , "lua_mika_weave_reward04" , 0)    --  �k�A��
		else  -- �k��
			AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[232000]]" , "mika_weave_reward_new1(".."1"..")" , 0)    -- �ڷQ�s�@[$VAR1]  �k�c�l
			AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[232001]]" , "mika_weave_reward_new1(".."2"..")" , 0)    -- �ڷQ�s�@[$VAR1]  �k�Ǥl
			AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[232003]]" , "mika_weave_reward_new1(".."3"..")" , 0)    -- �ڷQ�s�@[$VAR1]  �k�U�l
			AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[232002]]" , "mika_weave_reward_new1(".."4"..")" , 0)    -- �ڷQ�s�@[$VAR1]  �k�A��
		--	AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[232000]]" , "lua_mika_weave_reward02" , 0)    -- �k�c�l
		--	AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[232001]]" , "lua_mika_weave_reward03" , 0)    -- �k�Ǥl
		--	AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[232003]]" , "lua_mika_weave_reward05" , 0)    --  �k�U�l
		--	AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[232002]]" , "lua_mika_weave_reward04" , 0)    -- �k�A��
		end

		AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[230763]]" , "mika_weave_reward_new11(".."1"..")" , 0)    --  �ͻH1
		AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[230764]]" , "mika_weave_reward_new11(".."2"..")" , 0)    --  �ͻH2
	end
end

-- �s�W�I���A�˨禡�g�k
function mika_weave_reward_new1(number)
	local OID = OwnerID()  --player
	local TID = TargetID()  -- Target
	local sex = ReadRoleValue(OID, EM_RoleValue_SEX )
	local item1id = 241645  -- ��ί�´���ƥ]
	local item2id = 241646  -- �k����´���ƥ]
	local item1need = { 6, 12, 9, 18 }  -- �Ÿ˻ݨD ��ί�´���ƥ] �ƶq  (�u, �Ǥl, �U ,��A)
	local item2need = { 2, 3, 3, 6 }      -- �Ÿ˻ݨD �k����´���ƥ] �ƶq  (�u, �Ǥl, �U ,��A)
	local product_male    =  { 231996, 231997, 231999, 231998 } -- �u, �Ǥl, �U ,��A (�k)
	local product_female =  { 232000, 232001, 232003, 232002 } -- �u, �Ǥl, �U ,��A (�k)

	-- VAR1 = �s�@���~  
	-- VAR2 =  ����1�ݨD�ƶq
	-- VAR3 = ����2�ݨD�ƶq

	-- �ϥ�<CN>[241645]</CN>�s�@<CS>[$VAR1]</CS>�A�ݭn[241645]<CN>[$VAR2]</CN>�ӡA���L...�s�@�W���@�w���Ѫ����I�C
 	-- �p�G�O��<CG>[241646]</CG>�s�@���ܧګO�Ҥ@�w�ন�\�A���ݭn[241646]<CG>[$VAR3]</CG>�ӡC
 	--����A�A�Ʊ�ڨϥέ��@�ا��ƻs�@�ڡH 

	if sex == 0 then   -- �k��
		SetSpeakDetail( OID , "[SC_WEAVE_REWARD_03][$SETVAR1 =".."["..product_male[number].."]".."][$SETVAR2="..item1need[number].."][$SETVAR3="..item2need[number].."]" )
	else  -- �k��
		SetSpeakDetail( OID , "[SC_WEAVE_REWARD_03][$SETVAR1=".."["..product_female[number].."]".."][$SETVAR2="..item1need[number].."][$SETVAR3="..item2need[number].."]" )
	end

	if number == 1 then
		AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_04][$SETVAR1=".."["..item1id.."]".."]" , "mika_weave_reward_new2(".."11"..")" , 0)    -- �ϥ�[$VAR1]�s�@  ���
		AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_04][$SETVAR1=".."["..item2id.."]".."]" , "mika_weave_reward_new2(".."12"..")" , 0)     -- �k��
	elseif number == 2 then
		AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_04][$SETVAR1=".."["..item1id.."]".."]" , "mika_weave_reward_new2(".."21"..")" , 0)    -- �ϥ�[$VAR1]�s�@  ���
		AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_04][$SETVAR1=".."["..item2id.."]".."]" , "mika_weave_reward_new2(".."22"..")" , 0)     -- �k��
	elseif number == 3 then
		AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_04][$SETVAR1=".."["..item1id.."]".."]" , "mika_weave_reward_new2(".."31"..")" , 0)    -- �ϥ�[$VAR1]�s�@  ���
		AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_04][$SETVAR1=".."["..item2id.."]".."]" , "mika_weave_reward_new2(".."32"..")" , 0)     -- �k��
	elseif number == 4 then
		AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_04][$SETVAR1=".."["..item1id.."]".."]" , "mika_weave_reward_new2(".."41"..")" , 0)    -- �ϥ�[$VAR1]�s�@  ���
		AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_04][$SETVAR1=".."["..item2id.."]".."]" , "mika_weave_reward_new2(".."42"..")" , 0)     -- �k��
	end
	AddSpeakOption( OID , OID , "[SO_BACK] " , "lua_mika_weave_reward01" , 0)    -- ��^�W�@��
end

function mika_weave_reward_new11(number)
	local OID = OwnerID()  --player
	local TID = TargetID()  -- Target
	local item2id = 241646  -- �k����´���ƥ]
	local product_wing = { 230763, 230764 }  -- ��, ��
	local needcount = 5  -- �ݭn���Ƽƶq

	if number == 1 then
		SetSpeakDetail( OID , "[SC_WEAVE_REWARD2013_03][$SETVAR1=".."["..product_wing[1].."]".."][$SETVAR2="..needcount.."]" )
-- 		�A�n�Чڻs�@<CR>[$VAR1]</CR>�ܡH
--		[230763]�P[230764]�o�ⶵ�˹��~���O���٥��b�վ㪺�@�~�A�]���s�@���L�{��������A���H�ڲ{�b���޳N�Y�ϥ�[241646]�s�@�]�ٵL�k�O�Ҧ��\�A�p�G�A�٬O�@�N���ڸլݬݡA�N��<CS>[241646]</CS>[$VAR2]�ӥ浹�ڧa�C
		AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[230763]]" , "mika_weave_reward_new12(".."1"..")" , 0)    
	elseif number == 2 then
		SetSpeakDetail( OID , "[SC_WEAVE_REWARD2013_03][$SETVAR1=".."["..product_wing[2].."]".."][$SETVAR2="..needcount.."]" )
-- 		�A�n�Чڻs�@<CR>[$VAR1]</CR>�ܡH
--		[230763]�P[230764]�o�ⶵ�˹��~���O���٥��b�վ㪺�@�~�A�]���s�@���L�{��������A���H�ڲ{�b���޳N�Y�ϥ�[241646]�s�@�]�ٵL�k�O�Ҧ��\�A�p�G�A�٬O�@�N���ڸլݬݡA�N��<CS>[241646]</CS>[$VAR2]�ӥ浹�ڧa�C
		AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[230764]]" , "mika_weave_reward_new12(".."2"..")" , 0)    
	end
end

function mika_weave_reward_new12(number)
	local OID = OwnerID()  --player
	local TID = TargetID()  -- Target
	local sex = ReadRoleValue(OID, EM_RoleValue_SEX )
	local item2id = 241646  -- �k����´���ƥ]
	local item2 = CountBodyItem(OID, item2id )  -- �k����´���ƥ]
	local needcount = 5  -- �ݭn���Ƽƶq
	local product_wing = { 230763, 230764 }  -- ��, ��
	local R = 3
	if number == 1 then  --  �Ŧ�
		if item2 < needcount then -- �ƶq���� 
			SetSpeakDetail( OID , "[SC_WEAVE_REWARD_06] " )   --  �A�ҫ������Ƽƶq������I
		else
			CloseSpeak(OID)
			WriteRoleValue(OID , EM_RoleValue_Register , TID )
			Callplot(OID, "mika_weave_reward_new3", item2id, needcount, R, product_wing[1] )
		end
	elseif number == 2 then  -- ����
		if item2 < needcount then -- �ƶq���� 
			SetSpeakDetail( OID , "[SC_WEAVE_REWARD_06] " )   --  �A�ҫ������Ƽƶq������I
		else
			CloseSpeak(OID)
			WriteRoleValue(OID , EM_RoleValue_Register , TID )
			Callplot(OID, "mika_weave_reward_new3", item2id, needcount, R, product_wing[2] )
		end
	end
end

function mika_weave_reward_new2(number)
	local OID = OwnerID()  --player
	local TID = TargetID()  -- Target
	local sex = ReadRoleValue(OID, EM_RoleValue_SEX )
	local item1id = 241645  -- ��ί�´���ƥ]
	local item2id = 241646  -- �k����´���ƥ]
	local item1 = CountBodyItem(OID, item1id )  -- ��ί�´���ƥ]
	local item2 = CountBodyItem(OID, item2id )  -- �k����´���ƥ]
	local item1need = { 6, 12, 9, 18 }  -- �Ÿ˻ݨD ��ί�´���ƥ] �ƶq  (�u, �Ǥl, �U ,��A)
	local item2need = { 2, 3, 3, 6 }      -- �Ÿ˻ݨD �k����´���ƥ] �ƶq  (�u, �Ǥl, �U ,��A)
	local product_male    =  { 231996, 231997, 231999, 231998 } -- �u, �Ǥl, �U ,��A (�k)
	local product_female =  { 232000, 232001, 232003, 232002 } -- �u, �Ǥl, �U ,��A (�k)
	local R1 = {35 ,30, 25, 25 }  -- ��ξ��v (�u, �Ǥl, �U ,��A)
	local R2 = {70, 50, 50, 45 }  -- �k�����v  (�u, �Ǥl, �U ,��A)

	if number == 11 then  -- ��� - �u
		if item1 < item1need[1] then -- �ƶq���� 
			SetSpeakDetail( OID , "[SC_WEAVE_REWARD_06] " )   --  �A�ҫ������Ƽƶq������I
		else	
			CloseSpeak(OID)
			WriteRoleValue(OID , EM_RoleValue_Register , TID )
			if sex == 0 then  -- �k��
				Callplot(OID, "mika_weave_reward_new3", item1id, item1need[1], R1[1], product_male[1] )
			else  -- �k��
				Callplot(OID, "mika_weave_reward_new3", item1id, item1need[1], R1[1], product_female[1] )
			end
		end
	elseif number == 12 then  -- �k�� - �u
		if item2 < item2need[1] then -- �ƶq���� 
			SetSpeakDetail( OID , "[SC_WEAVE_REWARD_06] " )   --  �A�ҫ������Ƽƶq������I
		else	
			CloseSpeak(OID)
			WriteRoleValue(OID , EM_RoleValue_Register , TID )
			if sex == 0 then  -- �k��
				Callplot(OID, "mika_weave_reward_new3", item2id, item2need[1], R2[1], product_male[1] )
			else  -- �k��
				Callplot(OID, "mika_weave_reward_new3", item2id, item2need[1], R2[1], product_female[1] )
			end
		end
	elseif number == 21 then  -- ��� - ��
		if item1 < item1need[2] then -- �ƶq���� 
			SetSpeakDetail( OID , "[SC_WEAVE_REWARD_06] " )   --  �A�ҫ������Ƽƶq������I
		else	
			CloseSpeak(OID)
			WriteRoleValue(OID , EM_RoleValue_Register , TID )
			if sex == 0 then  -- �k��
				Callplot(OID, "mika_weave_reward_new3", item1id, item1need[2], R1[2], product_male[2] )
			else  -- �k��
				Callplot(OID, "mika_weave_reward_new3", item1id, item1need[2], R1[2], product_female[2] )
			end
		end
	elseif number == 22 then  -- �k�� - ��
		if item2 < item2need[2] then -- �ƶq���� 
			SetSpeakDetail( OID , "[SC_WEAVE_REWARD_06] " )   --  �A�ҫ������Ƽƶq������I
		else	
			CloseSpeak(OID)
			WriteRoleValue(OID , EM_RoleValue_Register , TID )
			if sex == 0 then  -- �k��
				Callplot(OID, "mika_weave_reward_new3", item2id, item2need[2], R2[2], product_male[2] )
			else  -- �k��
				Callplot(OID, "mika_weave_reward_new3", item2id, item2need[2], R2[2], product_female[2] )
			end
		end
	elseif number == 31 then   -- ��� - �U
		if item1 < item1need[3] then -- �ƶq���� 
			SetSpeakDetail( OID , "[SC_WEAVE_REWARD_06] " )   --  �A�ҫ������Ƽƶq������I
		else	
			CloseSpeak(OID)
			WriteRoleValue(OID , EM_RoleValue_Register , TID )
			if sex == 0 then  -- �k��
				Callplot(OID, "mika_weave_reward_new3", item1id, item1need[3], R1[3], product_male[3] )
			else  -- �k��
				Callplot(OID, "mika_weave_reward_new3", item1id, item1need[3], R1[3], product_female[3] )
			end
		end
	elseif number == 32 then  -- �k�� - �U
		if item2 < item2need[3] then -- �ƶq���� 
			SetSpeakDetail( OID , "[SC_WEAVE_REWARD_06] " )   --  �A�ҫ������Ƽƶq������I
		else	
			CloseSpeak(OID)
			WriteRoleValue(OID , EM_RoleValue_Register , TID )
			if sex == 0 then  -- �k��
				Callplot(OID, "mika_weave_reward_new3", item2id, item2need[3], R2[3], product_male[3] )
			else  -- �k��
				Callplot(OID, "mika_weave_reward_new3", item2id, item2need[3], R2[3], product_female[3] )
			end
		end
	elseif number == 41 then  -- ��� - �W��
		if item1 < item1need[4] then -- �ƶq���� 
			SetSpeakDetail( OID , "[SC_WEAVE_REWARD_06] " )   --  �A�ҫ������Ƽƶq������I
		else	
			CloseSpeak(OID)
			WriteRoleValue(OID , EM_RoleValue_Register , TID )
			if sex == 0 then  -- �k��
				Callplot(OID, "mika_weave_reward_new3", item1id, item1need[4], R1[4], product_male[4] )
			else  -- �k��
				Callplot(OID, "mika_weave_reward_new3", item1id, item1need[4], R1[4], product_female[4] )
			end
		end
	elseif number == 42 then  -- �k�� - �W��
		if item2 < item2need[4] then -- �ƶq���� 
			SetSpeakDetail( OID , "[SC_WEAVE_REWARD_06] " )   --  �A�ҫ������Ƽƶq������I
		else	
			CloseSpeak(OID)
			WriteRoleValue(OID , EM_RoleValue_Register , TID )
			if sex == 0 then  -- �k��
				Callplot(OID, "mika_weave_reward_new3", item2id, item2need[4], R2[4], product_male[4] )
			else  -- �k��
				Callplot(OID, "mika_weave_reward_new3", item2id, item2need[4], R2[4], product_female[4] )
			end
		end
	end
end

function mika_weave_reward_new3(itemid, needcount, rate, productid )  -- ����ID, �ݨD���Ƽƶq, ���v,  ���~ID
	local OID = OwnerID()  --player
	local NPC = ReadRoleValue(OID, EM_RoleValue_Register )  -- NPC
	local RR =Rand(100)+1 
--	say(OID, "OID")
--	say(NPC, "NPC")
--	say(OID, "itemid = "..itemid..", needcount = "..needcount..",  rate = "..rate..", productid = "..productid )

	DelBodyItem(OID, itemid, needcount )  -- �R������

	if RR>= ( 100 - rate ) then -- ���\
		Tell(OID, NPC,  "[SC_WEAVE_REWARD_07]") -- �I�A�ש󶶧Q�����F�A�Ʊ�A�|���w�C
		GiveBodyItem(OID, productid, 1)  
		DesignLog( OID , 1210541 , "2013 weave festival suit success, id ="..productid )  -- �s�@�A�˦��\, �A��id
	else -- ����
		Tell(OID, NPC, "[SC_WEAVE_REWARD_08]")  -- �����K�o�����s�@�n���K���Ӷ��Q�K���ˤl�C��p�A�o�˪F��N�e���A�@�����v�a�C
		GiveBodyItem(OID, 726119, 1)  -- ���Ѯɱ��_  726119  -- 2013 ���Ѽ��y��
		DesignLog( OID , 1210542 , "2013 weave festival suit fail, id ="..productid )  -- �s�@�A�˥���, �A��id
	end

end

-- 2013�s�W �I�����y 
function lua_mika_weave_reward07()
	local OID = OwnerID()  --player
	local item1id = 241645  -- ��ί�´���ƥ]
	local needcount = 10
	local boxid = 242703

	if CountBodyItem(OID, item1id) < needcount then -- �ƶq���� 
		SetSpeakDetail( OID , "[SC_WEAVE_REWARD_06] " )   --  �A�ҫ������Ƽƶq������I
		AddSpeakOption( OID , OID , "[SO_BACK] " , "lua_mika_weave_reward01" , 0)    -- ��^�W�@��
	else	
		CloseSpeak(OID)
		DelBodyItem(OID, item1id, needcount )
		GiveBodyItem(OID, boxid, 1)
		DesignLog( OID , 121054 , "2013 weave festival reward get count. ")  -- �I�����y����

	end
end


---- ���ի��O  (���կͻH���v 1,  = �� , 2 = �� , ���վ��v��20%)
function mika_weave_reward_newtest(number)   -- ����ID, �ݨD���Ƽƶq, ���v,  ���~ID
	local OID = OwnerID()  --player

	local item2id = 241646  -- �k����´���ƥ]
	local product_wing = { 230763, 230764 }  -- ��, ��
	local needcount = 5  -- �ݭn���Ƽƶq
	local rate = 20 -- ���եξ��v
	local RR =Rand(100)+1 

	DelBodyItem(OID, item2id, needcount )  -- �R������

	if RR>= ( 100 - rate ) then -- ���\
		GiveBodyItem(OID, product_wing[number], 1)  
	else -- ����

		GiveBodyItem(OID, 726119, 1)  -- ���Ѯɱ��_  726119  -- 2013 ���Ѽ��y��
	end

end
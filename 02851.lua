
-- �Ķ��ƥ�
-- �C���Ķ��I�k��Ū�����|Ĳ�o���ƥ�
function gather_rewardevent_01()
	local Player = OwnerID()    -- ���a
	local GatherObj = TargetID()  -- �Ķ��ؼЪ�
	local GatherBuffID = 624075  -- �Ķ��ֿn���� BUFF
	local GatherBuffTime = 600
	local LimitLv = 100  -- bufflv�W����

	if CheckBuff(Player, 624076) == false then   -- �S�������ɶ�buff
		AddBuff(Player, GatherBuffID, 0 , GatherBuffTime )  -- ��buff

		local GatherBuffLV = FN_CountBuffLevel(Player,GatherBuffID )  -- buff lv 
		local RealBuffLv = GatherBuffLV+1
	--	say(Player, "GatherBuffLV = "..GatherBuffLV..", RealBuffLv = "..RealBuffLv  )

		if RealBuffLv == LimitLv then  -- �����ɶ�buff
			Beginplot(Player, "gather_rewardevent_04", 0 )  -- ����time buff
		else  
			if RealBuffLv%10 == 0 then  -- �CX1��Ĳ�o�ƥ�
				Beginplot(Player, "gather_rewardevent_02", 0 )
			end

			if RealBuffLv%20 == 0 then   -- �CX2��Ĳ�o�ƥ�
				if RealBuffLv >= 60 then
					Beginplot(Player, "gather_rewardevent_03_lv3", 0 )
				--	say(Player, "each LV10 Event - lv3 , bufflv = "..RealBuffLv )
				elseif RealBuffLv == 40  then
					Beginplot(Player, "gather_rewardevent_03_lv2", 0 )
				--	say(Player, "each LV10 Event - lv2 , bufflv = "..RealBuffLv )
				elseif RealBuffLv == 20  then
					Beginplot(Player, "gather_rewardevent_03_lv1", 0 )
				--	say(Player, "each LV10 Event - lv1 , bufflv = "..RealBuffLv )
				end
			end
		end
	end
end

-- �����ɶ� �ƥ�
function gather_rewardevent_04()
	local Player = OwnerID()    -- ���a
	local BuffID = 624076  -- �Ķ������ɶ�buff
	local BuffTime = 180
	local magicid = {850668, 850669, 850670 }  -- RUSH , �ƥ�2, �ƥ�1
	local Cancelbufflist = {624075,624078, 624079, 624080, 624081, 624082, 624083 }

	SysCastSpellLV( Player , Player , magicid[1] , 0  ) ---- �k�N�S�� - ���t
	for i = 1, #Cancelbufflist do
		CancelBuff(Player, Cancelbufflist[i] )
	end

	AddBuff(Player, BuffID, 0 , BuffTime )  -- ��buff
	ScriptMessage( Player , Player , 1 , "[SC_GATHEREVENT_06]" , C_System ) --  �g�L�����_�a�Ķ��A���æb�A�餺���Ķ����Q�E�o�F�I
	ScriptMessage( Player , Player , 0 , "[SC_GATHEREVENT_06]" , C_System ) 
end

-- LVX1 �ƥ�
function gather_rewardevent_02()
	local Player = OwnerID()    -- ���a
	local BuffID = 624077  -- �Ķ��t��BUFF
	local BuffTime = 300
	local magicid = {850668, 850669, 850670 }  -- RUSH , �ƥ�2, �ƥ�1
	local SpeedBuffLV = FN_CountBuffLevel(Player,BuffID )  -- buff lv 
	local RealBuffLv = SpeedBuffLV+1

	if  RealBuffLv <9 then
		SysCastSpellLV( Player , Player , magicid[3] , 0  ) ---- �k�N�S�� - �ƥ�1
		AddBuff(Player, BuffID, 0 , BuffTime )  -- ��buff
	end
end

-- LVX2 �ƥ�
function gather_rewardevent_03_lv1()
	local Player = OwnerID()    -- ���a

	local RR = Rand(100)+1
	-- lv1�ƥ� -- 
	if RR >= 31 then   --  70%   �ƥ�2
		Callplot(Player, "gather_rewardevent_03_ev2", 1 )  
	else   --30 % �ƥ�1 
		Callplot(Player, "gather_rewardevent_03_ev1", 1 )
	end
end

function gather_rewardevent_03_lv2()
	local Player = OwnerID()    -- ���a

	-- lv2�ƥ� -- 
	local RR = Rand(100)+1
	-- EventTypeRate_lv2 -- 30, 80, 92, 97 , 100
	if RR >= 97+1 then   --   �ƥ�[3] ��o�ĪG-�׬ձĦ�(�Ķ���ì���W�[)   X3 
		Callplot(Player, "gather_rewardevent_03_ev3" , 3 )

	elseif RR >= 92+1 and RR <= 97 then  --  �ƥ�[3] ��o�ĪG-�׬ձĦ�(�Ķ���ì���W�[) X2
		Callplot(Player, "gather_rewardevent_03_ev3" , 2 )

	elseif RR >=80+1 and RR <= 92 then  --  �ƥ�[3] ��o�ĪG-�׬ձĦ�(�Ķ���ì���W�[)  X1 
		Callplot(Player, "gather_rewardevent_03_ev3" , 1 )

	elseif RR >=30+1 and RR <= 80 then  ---  �ƥ�[2] ��o�D¾�g��¾�P�ޯ��I�� 
		Callplot(Player, "gather_rewardevent_03_ev2", 2 )  

	elseif RR <= 30 then    --   �ƥ�[1] ��o�ĪG-�F���Ħ�(�Ķ��g��ȼW�[) LEVE 2
		Callplot(Player, "gather_rewardevent_03_ev1",  2 )
	end

end

function gather_rewardevent_03_lv3()
	local Player = OwnerID()    -- ���a

	-- lv3�ƥ� -- 
	local RR = Rand(100)+1
	-- EventTypeRate_lv3  30 80 90 95 98 100 
	if RR >= 98+1 then   --  
		Callplot(Player, "gather_rewardevent_03_ev4", 0 )

	elseif RR >= 95+1 and RR <= 98 then  -- �ƥ�[3] ��o�ĪG-�׬ձĦ�(�Ķ���ì���W�[)
		Callplot(Player, "gather_rewardevent_03_ev3" , 3 )

	elseif RR >= 90+1 and RR <= 95 then   -- �ƥ�[3] ��o�ĪG-�׬ձĦ�(�Ķ���ì���W�[)
		Callplot(Player, "gather_rewardevent_03_ev3" , 2 )

	elseif RR >=80+1 and RR <= 90 then  -- �ƥ�[3] ��o�ĪG-�׬ձĦ�(�Ķ���ì���W�[)
		Callplot(Player, "gather_rewardevent_03_ev3" , 1 )

	elseif RR >=30+1 and RR <= 80 then     -- �ƥ�[2] ��o�D¾�g��¾�P�ޯ��I��
		Callplot(Player, "gather_rewardevent_03_ev2", 3 )  

	elseif RR <= 30 then    --   �ƥ�[1] ��o�ĪG-�F���Ħ�(�Ķ��g��ȼW�[) 
		Callplot(Player, "gather_rewardevent_03_ev1" , 3 )

	end

end

------------------------------------------------------------------------------------------------------------ 
-- �ƥ�[1] ��o�ĪG-�F���Ħ� (�Ķ��g��ȼW�[)
function gather_rewardevent_03_ev1(BuffLevel)
	local Player = OwnerID()    -- ���a
	local GatherExpBuffID = { 624078, 624079, 624080  } -- exp 20  30 50
	local GatherCountBuffID = { 624081, 624082, 624083 }  -- �Ķ�������+1 2  3
	local BuffTime = 30
	local magicid = {850668, 850669, 850670 }  -- RUSH , �ƥ�2, �ƥ�1

	SysCastSpellLV( Player , Player , magicid[2] , 0  ) ---- �k�N�S�� - �ƥ�2

	for i = 1, #GatherCountBuffID do	
		CancelBuff(Player, GatherCountBuffID[i] )
	end
	for k  = 1, #GatherExpBuffID do
		CancelBuff(Player, GatherExpBuffID[k] )
	end
	AddBuff(Player, GatherExpBuffID[BuffLevel], 0, BuffTime )  -- �Ķ�exp up buff lv1
	ScriptMessage( Player , Player , 1 , "[SC_GATHEREVENT_02]" , C_System ) --  [SC_GAHTEREVENT_01]�A��o�F[624078]���ĪG�C
	ScriptMessage( Player , Player , 0 , "[SC_GATHEREVENT_02]" , C_System ) 
end

-- �ƥ�[2] ��o�D¾�g��¾�P�ޯ��I��
function gather_rewardevent_03_ev2( ExpLevel )
	local Player = OwnerID()    -- ���a
	local PlayerJobLv = ReadRoleValue(Player, EM_RoleValue_LV )  -- ���a�D¾���� 
	local magicid = {850668, 850669, 850670 }  -- RUSH , �ƥ�2, �ƥ�1

	SysCastSpellLV( Player , Player , magicid[2] , 0  ) ---- �k�N�S�� - �ƥ�2
	-- 1 ~ 100�ť��ȸg��Ȫ�
	local QuestExpTable = {
		24, 50, 77, 106, 124, 150, 177, 228, 283, 390, 
		504, 590, 637, 740, 860, 976, 1067, 1257, 1469, 2003, 
		2613, 3009, 3522, 4123, 4626,5151, 5767, 6521, 7079, 7922, 
		8423, 9555, 10731, 13566, 16186, 18904,21373, 24622, 28689, 33331, 
		35777, 38260, 40772, 45248, 51754, 55851, 58943, 61998, 66527, 106443, 
		113894, 121866, 130396, 133003, 135663, 138376, 141143, 163725, 170339, 177220, 
		184379, 191827, 199576, 207638, 216026, 224753, 233833, 243279, 253107, 263332, 
		273970, 285038, 296553, 308533, 320997, 333965, 347457, 361494, 376098, 391292, 
		407100, 423546, 440657, 458459, 476980, 496249, 516297, 537155, 558856, 581433, 
		604922, 629360, 654786, 681239, 708761, 737394, 767184, 798178, 830424, 863973
		}

	local RewardExpRate = {10, 20, 30 }  -- �������ȸg��Ȫ����
	local OrginalExp = QuestExpTable[PlayerJobLv]  -- ���a����D�ȹ��������ȸg���
	local Exp = Math.floor(OrginalExp*(RewardExpRate[ExpLevel]/100))  -- ����exp��
	local Tp = Math.floor(Exp*0.1)  -- ������tp��
		if Tp == 0 then
			Tp = 1
		end

	AddRoleValue(Player, EM_RoleValue_EXP, Exp )
	AddRoleValue(Player, EM_RoleValue_TPEXP, Tp )
--	Say(Player, "get lv1 exptp ")
	ScriptMessage( Player , Player , 1 , "[SC_GATHEREVENT_04][$SETVAR1="..Exp.."][$SETVAR2="..Tp.."]" , C_System ) --  �A�b�Ķ����o�Q��s���԰��ޥ��A��o�g���[$VAR1]�I�P�ޯ��I��[$VAR2]�I�C
	ScriptMessage( Player , Player , 0 , "[SC_GATHEREVENT_04][$SETVAR1="..Exp.."][$SETVAR2="..Tp.."]" , C_System ) 
end

-- �ƥ�[3] ��o�ĪG-�׬ձĦ�(�Ķ���ì���W�[) 
function gather_rewardevent_03_ev3(BuffLevel)
	local Player = OwnerID()    -- ���a
	local GatherExpBuffID = { 624078, 624079, 624080  } -- exp 20  30 50
	local GatherCountBuffID = { 624081, 624082, 624083 }  -- �Ķ�������+1 2  3
	local BuffTime = 30
	local magicid = {850668, 850669, 850670 }  -- RUSH , �ƥ�2, �ƥ�1

	SysCastSpellLV( Player , Player , magicid[2] , 0  ) ---- �k�N�S�� - �ƥ�2

	for i = 1, #GatherCountBuffID do	
		CancelBuff(Player, GatherCountBuffID[i] )
	end
	for k  = 1, #GatherExpBuffID do
		CancelBuff(Player, GatherExpBuffID[k] )
	end

	AddBuff(Player, GatherCountBuffID[BuffLevel], 0, BuffTime)  -- �Ķ���ì
	ScriptMessage( Player , Player , 1 , "[SC_GATHEREVENT_03]" , C_System ) --  [SC_GAHTEREVENT_01]�A��o�F[624081]���ĪG�C
	ScriptMessage( Player , Player , 0 , "[SC_GATHEREVENT_03]" , C_System ) 

end

-- �ƥ�[4]  ��o���~ -�Ͳ��S�����(���@��)
function gather_rewardevent_03_ev4()
	local Player = OwnerID()    -- ���a
	GiveBodyItem(Player, 726944, 1 )  -- �Ͳ��S�����
	ScriptMessage( Player , Player , 1 , "[SC_GATHEREVENT_05]" , C_System ) --  �A�b�Ķ����N�~�o�{�F�}�����s�y���ơC
	ScriptMessage( Player , Player , 0 , "[SC_GATHEREVENT_05]" , C_System ) 
end

-- ���ի��O - �]�w�S�w������Ķ��ĪG����
function gather_rewardevent_test_01(GatherBuffLV)
	local Player = OwnerID()    -- ���a
	local GatherBuffID = 624075  -- �Ķ��ֿn���� BUFF
	local GatherBuffTime = 600
	local SpeedBuffID = 624077  -- �Ķ��t��BUFF
	local SpeedBuffTime = 300

--	CancelBuff(Player, 624076)  ---  �R�� ���t�Ħ�buff
	CancelBuff(Player, GatherBuffID)  ---  �R�� �Ķ��ֿn���� BUFF
	CancelBuff(Player, SpeedBuffID)  ---  �R�� �Ķ��t��BUFF

	local RealBuffLv = GatherBuffLV-1
	AddBuff(Player, GatherBuffID, RealBuffLv , GatherBuffTime )  -- ��buff

	if RealBuffLv >= 5 then
		local speedlv = math.floor((RealBuffLv+1)/10) 
		AddBuff(Player, SpeedBuffID, speedlv-1 , SpeedBuffTime )  -- ��buff
	end

end
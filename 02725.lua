function lua_skwerl_mobius_tp_stone(amount, mode, player) --�p�ɼҦ���TP�۩��(amount=��������) mode=�Ҧ� 
--�b�ͦs�Ҧ����A�C���@���s��A�o��s��A�����v�O30%�A�s��B�����v�O70%�C--mode= 0
--�b�p�ɼҦ����A�C���@���s��A�o��s��A�����v�O70%�A�s��B�����v�O30%�C--mode=1
	for i= 1, amount, 1 do
		local random=rand(10) --���
   		if random>2 then  --70%����
			if mode==0 then
				givebodyitem(player,  241648, 1)	--�b�ͦs�Ҧ����s��B�����v�O(70%)					
			elseif mode==1 then 
   				givebodyitem(player,  241647, 1)  --�b�p�ɼҦ������s��A���v (70%)
			end
   		else --30%��
			if mode==0 then
				givebodyitem(player,  241647, 1)  --�b�ͦs�Ҧ������s��A���v (30%)
			elseif mode==1 then 
   				givebodyitem(player,  241648, 1) --�b�p�ɼҦ������s��B���v (30%)
			end
   		end
	end
end

function lua_skwerl_mobius_prizeroll(player, mode, rank, playerscore) --�̷Ӥ��Ʀөw������t�� mode==�C���Ҧ�(0=�ͦs�Ҧ� 1=�p�ɼҦ�) rank==���ƪ�{�h�šB���a����
--�o�O�̷Ӽ��y���g�X�Ӫ��P�_�t�ΡA���ӥѪ��a����--(��o��function�M��C�����������y��function��)
	local Random= Rand(100)
	
	if rank=="A" then
		-- 2013.05.13 �s�W�A6.0.1 ���ʰƥ����y�վ�	������� 3300 �H�W
		Hao_Monetary_Union_240181( player , 30 )	-- ���������Ŷꨩ
		--
		if Random > 0 and  Random <=29 then
			lua_skwerl_mobius_time_prize_A(player, mode)
		else
			 lua_skwerl_mobius_time_prize_B(player, mode)
		end
	elseif rank=="B" then
		-- 2013.05.13 �s�W�A6.0.1 ���ʰƥ����y�վ�	������� 2700  ~ 3299
		Hao_Monetary_Union_240181( player , 30 )	-- ���������Ŷꨩ
		--	
		if Random > 0 and  Random <=10 then
			lua_skwerl_mobius_time_prize_A(player, mode)
		elseif Random > 10 and Random <=70 then
			 lua_skwerl_mobius_time_prize_B(player, mode)		
		else
			lua_skwerl_mobius_time_prize_C(player, mode)
		end
	elseif rank=="C" then
		-- 2013.05.13 �s�W�A6.0.1 ���ʰƥ����y�վ�	������� 2100 ~ 2699
		Hao_Monetary_Union_240181( player , 20 )	-- ���������Ŷꨩ
		--
		if Random > 0 and  Random <=6 then
			lua_skwerl_mobius_time_prize_A(player, mode)
		elseif Random > 6 and Random <=36 then
			 lua_skwerl_mobius_time_prize_B(player, mode)		
		elseif Random > 36 and Random <=76 then
			lua_skwerl_mobius_time_prize_C(player, mode)		
		else
			givebodyitem(player,  725449, 1) --�����|�귽
		end
	elseif rank=="D" then
		-- 2013.05.13 �s�W�A6.0.1 ���ʰƥ����y�վ�	������� 2099 �H�U
		if playerscore ~= 0 then
			Hao_Monetary_Union_240181( player , 10 )	-- ���������Ŷꨩ
		end
		--		
		if Random > 0 and  Random <=3 then
			lua_skwerl_mobius_time_prize_A(player, mode)
		elseif Random > 3 and Random <=13 then
			 lua_skwerl_mobius_time_prize_B(player, mode)		
		elseif Random > 13 and Random <=46 then
			lua_skwerl_mobius_time_prize_C(player, mode)
		else
			givebodyitem(player,  725449, 1) --�����|�귽
		end
	end
	-- 2013.05.13 �s�W�A6.0.1 ���ʰƥ����y�վ�	
	DesignLog( player , 360 , "Playerscore : "..playerscore )
	--
end
-------------------------------���yscript--------------------------------------
function lua_skwerl_mobius_time_prize_A(player, mode) --A�ż� (�s��x3 ���|�귽x3) mode=�C���Ҧ� �ͦs�Ҧ�=mode 0 �p�ɼҦ�=mode 1
	lua_skwerl_mobius_tp_stone(3, mode, player) --��3���s�� 
	givebodyitem(player,  725449, 1) --�����|�귽
	givebodyitem(player,  725449, 1) --�����|�귽
	givebodyitem(player,  725449, 1) --�����|�귽
end

function lua_skwerl_mobius_time_prize_B(player, mode) --B�ż�(�s��x2 ���|�귽x2)  mode=�C���Ҧ� �ͦs�Ҧ�=mode 0 �p�ɼҦ�=mode 1
	lua_skwerl_mobius_tp_stone(2, mode, player) --��2���s�� 
	givebodyitem(player,  725449, 1) --�����|�귽
	givebodyitem(player,  725449, 1) --�����|�귽
end

function lua_skwerl_mobius_time_prize_C(player, mode) --C�ż�(�s��x1 ���|�귽x1)mode=�C���Ҧ� �ͦs�Ҧ�=mode 0 �p�ɼҦ�=mode 1
	lua_skwerl_mobius_tp_stone(1, mode, player) --��1���s�� 
	givebodyitem(player,  725449, 1) --�����|�귽
end
-------------------------------�I�����Ҽ��yscript--------------------------------------
function lua_FN_mobius_NPCtrade_reward()
	local player = OwnerID()
	local CountA = CountBodyItem( player, 241647 )
	local CountB = CountBodyItem( player, 241648 )

	if CountA >= 1 and CountB >= 1 then
		DelBodyItem( player, 241647, 1 )
		DelBodyItem( player, 241648, 1 )
		if Rand(5) == 0 then
			GiveBodyItem( player, 725659, 1)
		else
			GiveBodyItem( player, 720612, 1)
		end
		-- 2013.05.13 �s�W�A6.0.1 ���ʰƥ����y�վ�
		GiveBodyItem( player , 726135, 1 )	-- ���|�u��c�t��
		GiveBodyItem( player , 205817, 1 )	-- ���A�̪��ԧQ�~
		--
	else
		SetSpeakDetail(player, "[SKWERL_MOBIUS_48]" )
	end
	CloseSpeak(player)
end

function Hao_mobius_set_score(Score)	-- 2013.05.13 ���եΫ��O�A�վ���ƨϥ�

	local Player = OwnerID()
	local BuffID = 622402	-- ����id

	if CheckBuff( Player , BuffID ) == true or Score == 0 then
		CancelBuff_NoEvent( Player , BuffID )
	end
	AddBuff( Player , BuffID , Score-1 , -1)	-- ��������
end
--�`�y���� 2009�~4��K�B�`
--�إ߮ɶ�: 2009/03/16
--�ק���: 2009/04/06
--�إߪ�  : ���ʥ��� ��ʨ�
------------------------------------------------------------------------------
function LuaN_112585_0() -- �������D����
	SetSpeakDetail(OwnerID(), "[SC_112585_0]" )--�Q���D�K�B�`���ѨӶܡH[112396]�i�H�i�D�A���I
end
------------------------------------------------------------------------------
function LuaN_112502_0() --NPC�N�w�D�w�洵 
	SetSpeakDetail(OwnerID(), "[SC_112502_1]" )--NPC���   �w��ѥ[���~���K�B�`���ʡ�I
	AddSpeakOption(OwnerID(), TargetID(), "[SC_112502_01]", "LuaN_112502_1", 0) --����a�ߤl�^�a�h����
end
------------------------------------------------------------------------------
function LuaN_112502_1() ----����a�ߤl�^�a�h���� 
	SetSpeakDetail(OwnerID(), "[SC_112502_111]" )--�P����K�B�`�w�Y����^�F�ܡH   
	AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
end
------------------------------------------------------------------------------
function Lua_Dan_112676_NPCchat() --���Z
	SetSpeakDetail(OwnerID(), "[SC_DAN_SR_111700_22]" ) 
end



--�U�謰����������
------------------------------------------------------------------------------
function LuaN_112502_2() ----����K�����y���� 
	SetSpeakDetail(OwnerID(), "[SC_112502_112]" )--�i�D�A�@�Ӧn����(��)  
	AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
end
------------------------------------------------------------------------------
function LuaN_112502_3()-----�ڷQ���D�K�����y���D��
	local Song1 = CountBodyItem( OwnerID() , 204123 ) --��ᤧ�q
	local Song2 = CountBodyItem( OwnerID() , 204124 ) --���a�줧�q
	local Song3 = CountBodyItem( OwnerID() , 204125 ) --�ŧѧڤ��q
	local Song4 = CountBodyItem( OwnerID() , 204126 ) --���Y�ᤧ�q
--------  ���ѱ����D�غX��
	local Q01= CheckFlag(OwnerID()  , 542451) -- Q01 Flag
	local Q02= CheckFlag(OwnerID()  , 542452) -- Q02 Flag
	local Q03= CheckFlag(OwnerID()  , 542453) -- Q03 Flag
	local Q04= CheckFlag(OwnerID()  , 542454) -- Q04 Flag
	local Q05= CheckFlag(OwnerID()  , 542455) -- Q05 Flag
	local Q06= CheckFlag(OwnerID()  , 542456) -- Q06 Flag
	local Q07= CheckFlag(OwnerID()  , 542457) -- Q07 Flag
	local Q08= CheckFlag(OwnerID()  , 542458) -- Q08 Flag
	local Q09= CheckFlag(OwnerID()  , 542459) -- Q09 Flag
	local Q10= CheckFlag(OwnerID()  , 542460) -- Q10 Flag
	local Q11= CheckFlag(OwnerID()  , 542461) -- Q11 Flag
	local Q12= CheckFlag(OwnerID()  , 542462) -- Q12 Flag
	local Q13= CheckFlag(OwnerID()  , 542463) -- Q13 Flag
	local Q14= CheckFlag(OwnerID()  , 542464) -- Q14 Flag
	local Q15= CheckFlag(OwnerID()  , 542465) -- Q15 Flag
	local Q16= CheckFlag(OwnerID()  , 542466) -- Q16 Flag
	local Q17= CheckFlag(OwnerID()  , 542467) -- Q17 Flag
	local Q18= CheckFlag(OwnerID()  , 542468) -- Q18 Flag
	local Q_end= CheckFlag(OwnerID()  , 542429) -- ���Ѥw�����L���ʺX�� 

	if Q_end == true then --�p�G���Ѥw�ѥ[�L����
		SetSpeakDetail(OwnerID(), "[SC_112502_END]" )-- �A���Ѥw�g�����L�o�Ӭ����o��I�w��A���Ѫ��ѻP�I
		AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
	elseif (Q01 == true) or (Q02 == true) or (Q03 == true) or (Q04 == true) or (Q05 == true) or (Q06 == true) or (Q07 == true) or (Q08 == true) or (Q09 == true) or (Q10 == true) or (Q11 == true) or (Q12 == true) or (Q13 == true) or (Q14 == true) or (Q15 == true) or (Q16 == true) or (Q17 == true) or (Q18 == true) then
			if Q01 == true then --Q1 �i�椤
					SetSpeakDetail(OwnerID(), "[SC_112502_001]" )-- ���Ѫ��ݨD���~�O2��[204123]�P2��[204125]��I--1
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			elseif Q02 == true then --Q2 �i�椤
					SetSpeakDetail(OwnerID(), "[SC_112502_002]" )-- ���Ѫ��ݨD���~�O2��[204123]�P3��[204125]��I--2
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			elseif Q03 == true then --Q3 �i�椤
					SetSpeakDetail(OwnerID(), "[SC_112502_003]" )-- ���Ѫ��ݨD���~�O2��[204123]�P4��[204125]��I--3
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			elseif Q04 == true then --Q4 �i�椤
					SetSpeakDetail(OwnerID(), "[SC_112502_004]" )-- ���Ѫ��ݨD���~�O3��[204123]�P2��[204125]��I--4
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			elseif Q05 == true then --Q5 �i�椤
					SetSpeakDetail(OwnerID(), "[SC_112502_005]" )-- ���Ѫ��ݨD���~�O3��[204123]�P3��[204125]��I--5
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			elseif Q06 == true then --Q6 �i�椤
					SetSpeakDetail(OwnerID(), "[SC_112502_006]" )-- ���Ѫ��ݨD���~�O3��[204123]�P4��[204125]��I--6
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			elseif Q07 == true then --Q7 �i�椤
					SetSpeakDetail(OwnerID(), "[SC_112502_007]" )-- ���Ѫ��ݨD���~�O4��[204123]�P2��[204125]��I--7
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			elseif Q08 == true then --Q8 �i�椤
					SetSpeakDetail(OwnerID(), "[SC_112502_008]" )-- ���Ѫ��ݨD���~�O4��[204123]�P3��[204125]��I--8
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			elseif Q09 == true then --Q9 �i�椤
					SetSpeakDetail(OwnerID(), "[SC_112502_009]" )-- ���Ѫ��ݨD���~�O4��[204123]�P4��[204125]��I--9
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			elseif Q10 == true then --Q10 �i�椤
					SetSpeakDetail(OwnerID(), "[SC_112502_010]" )-- ���Ѫ��ݨD���~�O2��[204124]�P2��[204126]��I--10
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			elseif Q11 == true then --Q11 �i�椤
					SetSpeakDetail(OwnerID(), "[SC_112502_011]" )-- ���Ѫ��ݨD���~�O2��[204124]�P3��[204126]��I--11
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			elseif Q12 == true then --Q12 �i�椤
					SetSpeakDetail(OwnerID(), "[SC_112502_012]" )-- ���Ѫ��ݨD���~�O2��[204124]�P4��[204126]��I--12
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			elseif Q13 == true then --Q13 �i�椤
					SetSpeakDetail(OwnerID(), "[SC_112502_013]" )-- ���Ѫ��ݨD���~�O3��[204124]�P2��[204126]��I--13
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			elseif Q14 == true then --Q14 �i�椤
					SetSpeakDetail(OwnerID(), "[SC_112502_014]" )-- ���Ѫ��ݨD���~�O3��[204124]�P3��[204126]��I--14
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			elseif Q15 == true then --Q15 �i�椤
					SetSpeakDetail(OwnerID(), "[SC_112502_015]" )-- ���Ѫ��ݨD���~�O3��[204124]�P4��[204126]��I--15
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			elseif Q16 == true then --Q16 �i�椤
					SetSpeakDetail(OwnerID(), "[SC_112502_016]" )-- ���Ѫ��ݨD���~�O4��[204124]�P2��[204126]��I--16
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			elseif Q17 == true then --Q17 �i�椤
					SetSpeakDetail(OwnerID(), "[SC_112502_017]" )-- ���Ѫ��ݨD���~�O4��[204124]�P3��[204126]��I--17
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			elseif Q18 == true then --Q18 �i�椤
					SetSpeakDetail(OwnerID(), "[SC_112502_018]" )-- ���Ѫ��ݨD���~�O4��[204124]�P4��[204126]��I--18
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			end
------------------�p�G�����L -----------------------------------------------------------------------
	elseif Q01 == false and Q02 == false and Q03 == false and Q04 == false and Q05 == false and Q06 == false and Q07 == false and Q08 == false and Q09 == false and Q10 == false and Q11 == false and Q12 == false and Q13 == false and Q14 == false and Q15 == false and Q16 == false and Q17 == false and Q18 == false then --�p�G�����L
			local RANDOWN = rand(18)
			if RANDOWN == 1 then  -- Q1
				SetSpeakDetail(OwnerID(), "[SC_112502_001]" )-- ���Ѫ��ݨD���~�O2��[204123]�P2��[204125]��I--1
				SetFlag( OwnerID()  , 542451 , 1 ) -- �����a Q1 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			elseif RANDOWN == 2 then --Q2
				SetSpeakDetail(OwnerID(), "[SC_112502_002]" )-- ���Ѫ��ݨD���~�O2��[204123]�P3��[204125]��I--2
				SetFlag( OwnerID()  , 542452 , 1 ) -- �����a Q2 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			elseif RANDOWN == 3 then --Q3
				SetSpeakDetail(OwnerID(), "[SC_112502_003]" )-- ���Ѫ��ݨD���~�O2��[204123]�P4��[204125]��I--3
				SetFlag( OwnerID()  , 542453 , 1 ) -- �����a Q3 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			elseif RANDOWN == 4 then --Q4
				SetSpeakDetail(OwnerID(), "[SC_112502_004]" )-- ���Ѫ��ݨD���~�O3��[204123]�P2��[204125]��I--4
				SetFlag( OwnerID()  , 542454 , 1 ) -- �����a Q4 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			elseif RANDOWN == 5 then --Q5
				SetSpeakDetail(OwnerID(), "[SC_112502_005]" )-- ���Ѫ��ݨD���~�O3��[204123]�P3��[204125]��I--5
				SetFlag( OwnerID()  , 542455 , 1 ) -- �����a Q5 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			elseif RANDOWN == 6 then --Q6
				SetSpeakDetail(OwnerID(), "[SC_112502_006]" )-- ���Ѫ��ݨD���~�O3��[204123]�P4��[204125]��I--6
				SetFlag( OwnerID()  , 542456 , 1 ) -- �����a Q6 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			elseif RANDOWN == 7 then --Q7
				SetSpeakDetail(OwnerID(), "[SC_112502_007]" )-- ���Ѫ��ݨD���~�O4��[204123]�P2��[204125]��I--7
				SetFlag( OwnerID()  , 542457 , 1 ) -- �����a Q7 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			elseif RANDOWN == 8 then --Q8
				SetSpeakDetail(OwnerID(), "[SC_112502_008]" )-- ���Ѫ��ݨD���~�O4��[204123]�P3��[204125]��I--8
				SetFlag( OwnerID()  , 542458 , 1 ) -- �����a Q8 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			elseif RANDOWN == 9 then --Q9
				SetSpeakDetail(OwnerID(), "[SC_112502_009]" )-- ���Ѫ��ݨD���~�O4��[204123]�P4��[204125]��I--9
				SetFlag( OwnerID()  , 542459 , 1 ) -- �����a Q9 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			elseif RANDOWN == 10 then --Q10
				SetSpeakDetail(OwnerID(), "[SC_112502_010]" )-- ���Ѫ��ݨD���~�O2��[204124]�P2��[204126]��I--10
				SetFlag( OwnerID()  , 542460 , 1 ) -- �����a Q10 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			elseif RANDOWN == 11 then --Q11
				SetSpeakDetail(OwnerID(), "[SC_112502_011]" )-- ���Ѫ��ݨD���~�O2��[204124]�P3��[204126]��I--11
				SetFlag( OwnerID()  , 542461 , 1 ) -- �����a Q11 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			elseif RANDOWN == 12 then --Q12
				SetSpeakDetail(OwnerID(), "[SC_112502_012]" )-- ���Ѫ��ݨD���~�O2��[204124]�P4��[204126]��I--12
				SetFlag( OwnerID()  , 542462 , 1 ) -- �����a Q12 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			elseif RANDOWN == 13 then --Q13
				SetSpeakDetail(OwnerID(), "[SC_112502_013]" )-- ���Ѫ��ݨD���~�O3��[204124]�P2��[204126]��I--13
				SetFlag( OwnerID()  , 542463 , 1 ) -- �����a Q13 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			elseif RANDOWN == 14 then --Q14
				SetSpeakDetail(OwnerID(), "[SC_112502_014]" )-- ���Ѫ��ݨD���~�O3��[204124]�P3��[204126]��I--14
				SetFlag( OwnerID()  , 542464 , 1 ) -- �����a Q14 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			elseif RANDOWN == 15 then --Q15
				SetSpeakDetail(OwnerID(), "[SC_112502_015]" )-- ���Ѫ��ݨD���~�O3��[204124]�P4��[204126]��I--15
				SetFlag( OwnerID()  , 542465 , 1 ) -- �����a Q15 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			elseif RANDOWN == 16 then --Q16
				SetSpeakDetail(OwnerID(), "[SC_112502_016]" )-- ���Ѫ��ݨD���~�O4��[204124]�P2��[204126]��I--16	
				SetFlag( OwnerID()  , 542466 , 1 ) -- �����a Q16 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			elseif RANDOWN == 17 then --Q17
				SetSpeakDetail(OwnerID(), "[SC_112502_017]" )-- ���Ѫ��ݨD���~�O4��[204124]�P3��[204126]��I--17
				SetFlag( OwnerID()  , 542467 , 1 ) -- �����a Q17 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			elseif RANDOWN == 18 then --Q18
				SetSpeakDetail(OwnerID(), "[SC_112502_018]" )-- ���Ѫ��ݨD���~�O4��[204124]�P4��[204126]��I--18
				SetFlag( OwnerID()  , 542468 , 1 ) -- �����a Q18 Flag
				AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
			end

	end
end
------------------------------------------------------------------------------
function LuaN_112502_4() ----�I���K�����y���ʼ��y
	local Song1 = CountBodyItem( OwnerID() , 204123 ) --��ᤧ�q
	local Song2 = CountBodyItem( OwnerID() , 204124 ) --���a�줧�q
	local Song3 = CountBodyItem( OwnerID() , 204125 ) --�ŧѧڤ��q
	local Song4 = CountBodyItem( OwnerID() , 204126 ) --���Y�ᤧ�q
--------  ���ѱ����D�غX��
	local Q01= CheckFlag(OwnerID()  , 542451) -- Q01 Flag
	local Q02= CheckFlag(OwnerID()  , 542452) -- Q02 Flag
	local Q03= CheckFlag(OwnerID()  , 542453) -- Q03 Flag
	local Q04= CheckFlag(OwnerID()  , 542454) -- Q04 Flag
	local Q05= CheckFlag(OwnerID()  , 542455) -- Q05 Flag
	local Q06= CheckFlag(OwnerID()  , 542456) -- Q06 Flag
	local Q07= CheckFlag(OwnerID()  , 542457) -- Q07 Flag
	local Q08= CheckFlag(OwnerID()  , 542458) -- Q08 Flag
	local Q09= CheckFlag(OwnerID()  , 542459) -- Q09 Flag
	local Q10= CheckFlag(OwnerID()  , 542460) -- Q10 Flag
	local Q11= CheckFlag(OwnerID()  , 542461) -- Q11 Flag
	local Q12= CheckFlag(OwnerID()  , 542462) -- Q12 Flag
	local Q13= CheckFlag(OwnerID()  , 542463) -- Q13 Flag
	local Q14= CheckFlag(OwnerID()  , 542464) -- Q14 Flag
	local Q15= CheckFlag(OwnerID()  , 542465) -- Q15 Flag
	local Q16= CheckFlag(OwnerID()  , 542466) -- Q16 Flag
	local Q17= CheckFlag(OwnerID()  , 542467) -- Q17 Flag
	local Q18= CheckFlag(OwnerID()  , 542468) -- Q18 Flag
--------- �w�������� 
	local Q_end= CheckFlag(OwnerID()  , 542429) -- ���Ѥw�����L���ʺX�� 
        if Q_end == true then --�p�G���Ѥw��������
		SetSpeakDetail(OwnerID(), "[SC_112502_END]" )-- �A���Ѥw�g�����L�o�Ӭ����o��I�w��A���Ѫ��ѻP�I
		AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
	elseif (Q01 == true) or (Q02 == true) or (Q03 == true) or (Q04 == true) or (Q05 == true) or (Q06 == true) or (Q07 == true) or (Q08 == true) or (Q09 == true) or (Q10 == true) or (Q11 == true) or (Q12 == true) or (Q13 == true) or (Q14 == true) or (Q15 == true) or (Q16 == true) or (Q17 == true) or (Q18 == true) then
			if Q01 == true then --Q1 �i�椤
				if Song1 >= 2 and Song3 >=2 then --�F��Q1���󪫫~
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--���A�K�B�`�ּ֡I 
					local RANDOWN_Magic = rand(4)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --���ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --���a��ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --�ŧѧڹڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --���Y��ڹ� �k�N���X�s�� 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- �귽�զX(3��)   
					DelBodyItem( OwnerID() , 204123 , 2 ) --��ᤧ�qx2
					DelBodyItem( OwnerID() , 204125 , 2 ) --�ŧѧڤ��qx2
					SetFlag( OwnerID()  , 542429 , 1 ) -- �����a ���Ѥw�����L���ʺX��
					SetFlag( OwnerID()  , 542451 , 0 ) -- �R���a Q1 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- �A���������~�ƶq������I
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				end
			elseif Q02 == true then --Q2 �i�椤
				if Song1 >= 2 and Song3 >=3 then --�F��Q2���󪫫~
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--���A�K�B�`�ּ֡I 
					local RANDOWN_Magic = rand(3)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --���ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --���a��ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --�ŧѧڹڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --���Y��ڹ� �k�N���X�s�� 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- �귽�զX(3��)   
					DelBodyItem( OwnerID() , 204123 , 2 ) --��ᤧ�qx2
					DelBodyItem( OwnerID() , 204125 , 3 ) --�ŧѧڤ��qx3
					SetFlag( OwnerID()  , 542429 , 1 ) -- �����a ���Ѥw�����L���ʺX��
					SetFlag( OwnerID()  , 542452 , 0 ) -- �R���a Q2 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- �A���������~�ƶq������I
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				end
			elseif Q03 == true then --Q3 �i�椤
				if Song1 >= 2 and Song3 >=3 then --�F��Q3���󪫫~
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--���A�K�B�`�ּ֡I 
					local RANDOWN_Magic = rand(3)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --���ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --���a��ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --�ŧѧڹڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --���Y��ڹ� �k�N���X�s�� 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- �귽�զX(3��)   
					DelBodyItem( OwnerID() , 204123 , 2 ) --��ᤧ�qx2
					DelBodyItem( OwnerID() , 204125 , 4 ) --�ŧѧڤ��qx4
					SetFlag( OwnerID()  , 542429 , 1 ) -- �����a ���Ѥw�����L���ʺX��
					SetFlag( OwnerID()  , 542453 , 0 ) -- �R���a Q3 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- �A���������~�ƶq������I
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				end
			elseif Q04 == true then --Q4 �i�椤
				if Song1 >=3 and Song3 >=2 then --�F��Q4���󪫫~
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--���A�K�B�`�ּ֡I 
					local RANDOWN_Magic = rand(3)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --���ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --���a��ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --�ŧѧڹڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --���Y��ڹ� �k�N���X�s�� 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- �귽�զX(3��)   
					DelBodyItem( OwnerID() , 204123 , 3 ) --��ᤧ�qx3
					DelBodyItem( OwnerID() , 204125 , 2 ) --�ŧѧڤ��qx2
					SetFlag( OwnerID()  , 542429 , 1 ) -- �����a ���Ѥw�����L���ʺX��
					SetFlag( OwnerID()  , 542454 , 0 ) -- �R���a Q4 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- �A���������~�ƶq������I
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				end
			elseif Q05 == true then --Q5 �i�椤
				if Song1 >=3 and Song3 >=3 then --�F��Q5���󪫫~
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--���A�K�B�`�ּ֡I 
					local RANDOWN_Magic = rand(3)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --���ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --���a��ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --�ŧѧڹڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --���Y��ڹ� �k�N���X�s�� 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- �귽�զX(3��)   
					DelBodyItem( OwnerID() , 204123 , 3 ) --��ᤧ�qx3
					DelBodyItem( OwnerID() , 204125 , 3 ) --�ŧѧڤ��qx3
					SetFlag( OwnerID()  , 542429 , 1 ) -- �����a ���Ѥw�����L���ʺX��
					SetFlag( OwnerID()  , 542455 , 0 ) -- �R���a Q5 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- �A���������~�ƶq������I
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				end
			elseif Q06 == true then --Q6 �i�椤
				if Song1 >=3 and Song3 >=4 then --�F��Q6���󪫫~
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--���A�K�B�`�ּ֡I 
					local RANDOWN_Magic = rand(3)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --���ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --���a��ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --�ŧѧڹڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --���Y��ڹ� �k�N���X�s�� 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- �귽�զX(3��)   
					DelBodyItem( OwnerID() , 204123 , 3 ) --��ᤧ�qx3
					DelBodyItem( OwnerID() , 204125 , 4 ) --�ŧѧڤ��qx4
					SetFlag( OwnerID()  , 542429 , 1 ) -- �����a ���Ѥw�����L���ʺX��
					SetFlag( OwnerID()  , 542456 , 0 ) -- �R���a Q6 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- �A���������~�ƶq������I
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				end
			elseif Q07 == true then --Q7 �i�椤
				if Song1 >=4 and Song3 >=2 then --�F��Q7���󪫫~
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--���A�K�B�`�ּ֡I 
					local RANDOWN_Magic = rand(3)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --���ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --���a��ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --�ŧѧڹڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --���Y��ڹ� �k�N���X�s�� 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- �귽�զX(3��)   
					DelBodyItem( OwnerID() , 204123 , 4 ) --��ᤧ�qx4
					DelBodyItem( OwnerID() , 204125 , 2 ) --�ŧѧڤ��qx2
					SetFlag( OwnerID()  , 542429 , 1 ) -- �����a ���Ѥw�����L���ʺX��
					SetFlag( OwnerID()  , 542457 , 0 ) -- �R���a Q7 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- �A���������~�ƶq������I
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				end
			elseif Q08 == true then --Q8 �i�椤
				if Song1 >=4 and Song3 >=3 then --�F��Q8���󪫫~
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--���A�K�B�`�ּ֡I 
					local RANDOWN_Magic = rand(3)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --���ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --���a��ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --�ŧѧڹڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --���Y��ڹ� �k�N���X�s�� 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- �귽�զX(3��)   
					DelBodyItem( OwnerID() , 204123 , 4 ) --��ᤧ�qx4
					DelBodyItem( OwnerID() , 204125 , 3 ) --�ŧѧڤ��qx3
					SetFlag( OwnerID()  , 542429 , 1 ) -- �����a ���Ѥw�����L���ʺX��
					SetFlag( OwnerID()  , 542458 , 0 ) -- �R���a Q8 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- �A���������~�ƶq������I
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				end
			elseif Q09 == true then --Q9 �i�椤
				if Song1 >=4 and Song3 >=4 then --�F��Q9���󪫫~
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--���A�K�B�`�ּ֡I 
					local RANDOWN_Magic = rand(3)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --���ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --���a��ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --�ŧѧڹڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --���Y��ڹ� �k�N���X�s�� 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- �귽�զX(3��)   
					DelBodyItem( OwnerID() , 204123 , 4 ) --��ᤧ�qx4
					DelBodyItem( OwnerID() , 204125 , 4 ) --�ŧѧڤ��qx4
					SetFlag( OwnerID()  , 542429 , 1 ) -- �����a ���Ѥw�����L���ʺX��
					SetFlag( OwnerID()  , 542459 , 0 ) -- �R���a Q9 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- �A���������~�ƶq������I
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				end
			elseif Q10 == true then --Q10 �i�椤
				if Song2 >=2 and Song4 >=2 then --�F��Q10���󪫫~
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--���A�K�B�`�ּ֡I 
					local RANDOWN_Magic = rand(3)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --���ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --���a��ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --�ŧѧڹڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --���Y��ڹ� �k�N���X�s�� 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- �귽�զX(3��)   
					DelBodyItem( OwnerID() , 204124 , 2 ) --���a�줧�qx2
					DelBodyItem( OwnerID() , 204126 , 2 ) --���Y�ᤧ�qx2
					SetFlag( OwnerID()  , 542429 , 1 ) -- �����a ���Ѥw�����L���ʺX��
					SetFlag( OwnerID()  , 542460 , 0 ) -- �R���a Q10 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- �A���������~�ƶq������I
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				end
			elseif Q11 == true then --Q11 �i�椤
				if Song2 >=2 and Song4 >=3 then --�F��Q11���󪫫~
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--���A�K�B�`�ּ֡I 
					local RANDOWN_Magic = rand(3)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --���ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --���a��ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --�ŧѧڹڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --���Y��ڹ� �k�N���X�s�� 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- �귽�զX(3��)   
					DelBodyItem( OwnerID() , 204124 , 2 ) --���a�줧�qx2
					DelBodyItem( OwnerID() , 204126 , 3 ) --���Y�ᤧ�qx3
					SetFlag( OwnerID()  , 542429 , 1 ) -- �����a ���Ѥw�����L���ʺX��
					SetFlag( OwnerID()  , 542461 , 0 ) -- �R���a Q11 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- �A���������~�ƶq������I
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				end
			elseif Q12 == true then --Q12 �i�椤
				if Song2 >=2 and Song4 >=4 then --�F��Q12���󪫫~
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--���A�K�B�`�ּ֡I 
					local RANDOWN_Magic = rand(3)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --���ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --���a��ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --�ŧѧڹڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --���Y��ڹ� �k�N���X�s�� 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- �귽�զX(3��)   
					DelBodyItem( OwnerID() , 204124 , 2 ) --���a�줧�qx2
					DelBodyItem( OwnerID() , 204126 , 4 ) --���Y�ᤧ�qx4
					SetFlag( OwnerID()  , 542429 , 1 ) -- �����a ���Ѥw�����L���ʺX��
					SetFlag( OwnerID()  , 542462 , 0 ) -- �R���a Q12 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- �A���������~�ƶq������I
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				end
			elseif Q13 == true then --Q13 �i�椤
				if Song2 >=3 and Song4 >=2 then --�F��Q13���󪫫~
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--���A�K�B�`�ּ֡I 
					local RANDOWN_Magic = rand(3)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --���ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --���a��ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --�ŧѧڹڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --���Y��ڹ� �k�N���X�s�� 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- �귽�զX(3��)   
					DelBodyItem( OwnerID() , 204124 , 3 ) --���a�줧�qx3
					DelBodyItem( OwnerID() , 204126 , 2 ) --���Y�ᤧ�qx2
					SetFlag( OwnerID()  , 542429 , 1 ) -- �����a ���Ѥw�����L���ʺX��
					SetFlag( OwnerID()  , 542463 , 0 ) -- �R���a Q13 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- �A���������~�ƶq������I
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				end
			elseif Q14 == true then --Q14 �i�椤
				if Song2 >=3 and Song4 >=3 then --�F��Q14���󪫫~
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--���A�K�B�`�ּ֡I 
					local RANDOWN_Magic = rand(3)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --���ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --���a��ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --�ŧѧڹڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --���Y��ڹ� �k�N���X�s�� 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- �귽�զX(3��)   
					DelBodyItem( OwnerID() , 204124 , 3 ) --���a�줧�qx3
					DelBodyItem( OwnerID() , 204126 , 3 ) --���Y�ᤧ�qx3
					SetFlag( OwnerID()  , 542429 , 1 ) -- �����a ���Ѥw�����L���ʺX��
					SetFlag( OwnerID()  , 542464 , 0 ) -- �R���a Q14 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- �A���������~�ƶq������I
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				end
			elseif Q15 == true then --Q15 �i�椤
				if Song2 >=3 and Song4 >=4 then --�F��Q15���󪫫~
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--���A�K�B�`�ּ֡I 
					local RANDOWN_Magic = rand(3)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --���ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --���a��ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --�ŧѧڹڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --���Y��ڹ� �k�N���X�s�� 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- �귽�զX(3��)   
					DelBodyItem( OwnerID() , 204124 , 3 ) --���a�줧�qx3
					DelBodyItem( OwnerID() , 204126 , 4 ) --���Y�ᤧ�qx4
					SetFlag( OwnerID()  , 542429 , 1 ) -- �����a ���Ѥw�����L���ʺX��
					SetFlag( OwnerID()  , 542465 , 0 ) -- �R���a Q15 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- �A���������~�ƶq������I
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				end
			elseif Q16 == true then --Q16 �i�椤
				if Song2 >=4 and Song4 >=2 then --�F��Q16���󪫫~
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--���A�K�B�`�ּ֡I 
					local RANDOWN_Magic = rand(3)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --���ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --���a��ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --�ŧѧڹڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --���Y��ڹ� �k�N���X�s�� 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- �귽�զX(3��)   
					DelBodyItem( OwnerID() , 204124 , 4 ) --���a�줧�qx4
					DelBodyItem( OwnerID() , 204126 , 2 ) --���Y�ᤧ�qx2
					SetFlag( OwnerID()  , 542429 , 1 ) -- �����a ���Ѥw�����L���ʺX��
					SetFlag( OwnerID()  , 542466 , 0 ) -- �R���a Q16 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- �A���������~�ƶq������I
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				end
			elseif Q17 == true then --Q17 �i�椤
				if Song2 >=4 and Song4 >=3 then --�F��Q17���󪫫~
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--���A�K�B�`�ּ֡I 
					local RANDOWN_Magic = rand(3)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --���ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --���a��ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --�ŧѧڹڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --���Y��ڹ� �k�N���X�s�� 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- �귽�զX(3��)   
					DelBodyItem( OwnerID() , 204124 , 4 ) --���a�줧�qx4
					DelBodyItem( OwnerID() , 204126 , 3 ) --���Y�ᤧ�qx3
					SetFlag( OwnerID()  , 542429 , 1 ) -- �����a ���Ѥw�����L���ʺX��
					SetFlag( OwnerID()  , 542467 , 0 ) -- �R���a Q17 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- �A���������~�ƶq������I
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				end
			elseif Q18 == true then --Q18 �i�椤
				if Song2 >=4 and Song4 >=4 then --�F��Q18���󪫫~
					SetSpeakDetail(OwnerID(), "[SC_112502_OK]" )--���A�K�B�`�ּ֡I 
					local RANDOWN_Magic = rand(3)
					if RANDOWN_Magic == 0 then
						CastSpell( TargetID(), OwnerID(), 492784 ) --���ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 1 then
						CastSpell( TargetID(), OwnerID(), 492785 ) --���a��ڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 2 then
						CastSpell( TargetID(), OwnerID(), 492786 ) --�ŧѧڹڹ� �k�N���X�s�� 
					elseif RANDOWN_Magic == 3 then
						CastSpell( TargetID(), OwnerID(), 492787 ) --���Y��ڹ� �k�N���X�s�� 
					end
					GiveBodyItem( OwnerID() , 720625  , 1 )   -- �귽�զX(3��)   
					DelBodyItem( OwnerID() , 204124 , 4 ) --���a�줧�qx4
					DelBodyItem( OwnerID() , 204126 , 4 ) --���Y�ᤧ�qx4
					SetFlag( OwnerID()  , 542429 , 1 ) -- �����a ���Ѥw�����L���ʺX��
					SetFlag( OwnerID()  , 542468 , 0 ) -- �R���a Q18 Flag
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				else
					SetSpeakDetail(OwnerID(), "[SC_112502_NO]" )-- �A���������~�ƶq������I
					AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 
				end
			end
	elseif Q01 == false and Q02 == false and Q03 == false and Q04 == false and Q05 == false and Q06 == false and Q07 == false and Q08 == false and Q09 == false and Q10 == false and Q11 == false and Q12 == false and Q13 == false and Q14 == false and Q15 == false and Q16 == false and Q17 == false and Q18 == false then --�p�G�����L
		SetSpeakDetail(OwnerID(), "[SC_112502_NOSTART]" )-- �A�٨S�ѥ[�o�Ӭ��ʳ��I
		AddSpeakOption(OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112502_0", 0 ) --�^��W�@�� 			
		
	end
end
--------------------------------------------------------------------------------------------------------------
function Lua_Hao_Germany_1year_01() -- ��ѥ������ȹL �i�ݨ즹�ﶵ
--	Say( OwnerID() , "1" ) -- ���a
--	Say( TargetID() , "2" ) -- NPC

--	local Key = Checkflag(OwnerID(), 543639 ) -- �w��@�P�~ ����Key �SKey�i���ӡC
--	local Accept = Checkflag(OwnerID(), 543641 ) -- �w��@�P�~ ���ȶi�椤�C
--	local Over = Checkflag(OwnerID(), 543638 ) -- �w��@�P�~ ���ȧ����C
--	local Key = Checkflag(OwnerID(), 544690 ) -- �w��C��G�g�~  ����Key �SKey�i���ӡC
--	local Accept = Checkflag(OwnerID(), 544691 ) -- �w��C��G�g�~  ���ȶi�椤�C
--	local Over = Checkflag(OwnerID(), 544689 ) -- �w��C��G�g�~ ���ȧ����C
	local Key = CheckFlag( OwnerID() , 546219 ) -- �w��T�g�~ �C�쬡�� ����Key
	local Accept = CheckFlag( OwnerID() , 546220 ) -- �w��T�g�~ �C�쬡�� ���ȶi�椤
	local Over = CheckFlag( OwnerID() , 546221 ) -- �w��T�g�~ �C�쬡�� ����w����

	if Over == true then
		AdjustFaceDir( TargetID(), OwnerID() , 0 ) --���V
		PlayMotion( TargetID() , 112 )
		SetSpeakDetail( OwnerID(), "[SC_THANKSGIVING_16]" ) -- �A���Ѥw�g�����F�o�ӥ��ȡA�ЧA���ѦA�ӧa�C
	else
		AdjustFaceDir( TargetID(), OwnerID() , 0 ) --���V
		PlayMotion( TargetID() , 106 )
		if Key == true then -- ����Key�A�i�D�Ԯɤ~���J
			LoadQuestOption(OwnerID())  --���J���ȼҪO
		else -- ����Key�A���i�D��
			if Accept == false then -- �������ȶi�椤��Key
				SetSpeakDetail( OwnerID(), "[SC_GERMANY_1YEAR_00]" ) -- �A�Q�F�ѧ�h����g�~�y���Ʊ��ܡH
				AddSpeakOption(  OwnerID(), TargetID( ), "[SC_GERMANY_1YEAR_01]" ,  "Lua_Hao_Germany_1year_02",  0 ); -- �O���A�ڷ�M�Q�C
			else 
				SetSpeakDetail( OwnerID(), "[SC_GERMANY_1YEAR_02]" ) -- �Ʊ�j�a������w�o�Ӭ��ʡC
			end
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Germany_1year_02() --�ﶵ  �O���A�ڷ�M�Q�C
--	Say( OwnerID() , "02 = 1" ) -- ���a
--	Say( TargetID() , "02 = 2" ) -- NPC
	CloseSpeak(OwnerID())
	sleep(10)
	tell(OwnerID() , TargetID() , "[SC_GERMANY_1YEAR_03]" )   -- �ڷQ�A�@�w�|���w�o�Ӭ��ʪ��C
--	Setflag(OwnerID() , 543639 , 1 ) -- �w��@�P�~ ����Key 
--	Setflag(OwnerID() , 544690 , 1 ) -- �w��G�g�~ �C�쬡�� ����Key 
	SetFlag( OwnerID() , 546219 , 1 ) -- �w��T�g�~ �C�쬡�� ����Key
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Germany_1year_03() --���U���Ȯ� ��questflag 
--	Say( OwnerID() , "03 = 1" ) -- NPC
--	Say( TargetID() , "03 = 2" ) -- ���a
--	Setflag( TargetID() , 543641, 1) -- �w��@�P�~ ���ȶi�椤
--	Setflag( TargetID() , 544691, 1) -- �w��G�g�~ �C�쬡�� ���ȶi�椤
	SetFlag( TargetID() , 546220 , 1 ) -- �w��T�g�~ �C�쬡�� ���ȶi�椤
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Germany_1year_Gifts()
--	Say( OwnerID() , "1" ) -- NPC
--	Say( TargetID() , "2" ) -- ���a
--	local Random = Rand(100)

	local Language = GetServerDataLanguage()	--����ثeserver���y�t
	local month = GetSystime(3)+1
	local day = GetSystime(4)
	local hour = GetSystime(1)
	local min = GetSystime(2)
	local Items = { }

--	Say( TargetID() , month.."/"..day.."/"..hour.."/"..min ) 

	if Language == "jp" then		-- �饻 �@�P�~�y����
		Items = {	{ 16 , 201134 , 1 } ,		-- �g���ľ�
				{ 17 , 203525 , 1 } ,		-- ����ū�o��
				{ 18 , 201610 , 1 } ,		-- �ޯ��ľ�
				{ 19 , 201141 , 1 } ,		-- �ᥧ�J������ū
				{ 20 , 201139 , 1 }	}	-- �j�ѨϪ��Į�
		local JudgeDay = 0
	--	Tell(TargetID(),TargetID(),month.."/"..day.." "..hour..":"..min)
	--	Say( TargetID() , Random ) 
		if month == 9 then
			for i = 1,table.getn(Items) do
				if Items[i][1] == day then
					if (hour >=00 and min >=0) then
						if CheckFlag( TargetID()  , 546221 ) ~= true then	-- �w��C�쬡�� - ���ȧ���
						--	SetFlag( TargetID() , 544690 , 0 ) -- �w��C�쬡�� �R������Key
						--	SetFlag( TargetID() , 544691 , 0 ) -- �w��C�쬡�� �R�����ȶi�椤
						--	SetFlag( TargetID() , 544689 , 1 ) -- �w��C�쬡�� ���ȧ���
							SetFlag( TargetID() , 546219 , 0 ) -- �w��T�g�~ �C�쬡�� �R������Key
							SetFlag( TargetID() , 546220 , 0 ) -- �w��T�g�~ �C�쬡�� �R�����ȶi�椤
							SetFlag( TargetID() , 546221 , 1 ) -- �w��T�g�~ �C�쬡�� ����w����
							GiveBodyItem(TargetID(),Items[i][2],Items[i][3])
	--						if Random < 10 then -- 0 ~ 9
							GiveBodyItem( TargetID() , 207008 , 1 )
							AdjustFaceDir( OwnerID(), TargetID() , 0 ) --���V
							PlayMotion( OwnerID() , 102 )
							JudgeDay = 1
						else
							Say( OwnerID() , "[SC_XMAS_OPENNOFLAG]" )	-- �o��§���A�A���Ѥw�g����L�F�C
						end
					end
				end
			end
			if JudgeDay == 0 then
			--	Say( OwnerID() , " The non-active time , Activity time is 9/16 ~ 9/20. " )	--�D���ʮɶ��A���ʮɶ��� 9/16 ~ 9/20 ���C
			--	Say( OwnerID() , "[SC_GERMANY_FROG_EVENT]")				--���ʮɶ��� 11/19 15:00 ~ 11/22 11:00�A�бz�@�ߵ��ݬ��ʶ}��C
			--	SetFlag( TargetID() , 543639 , 0 ) -- �w��@�P�~ �R������Key
			--	SetFlag( TargetID() , 543641 , 0 ) -- �w��@�P�~ �R�����ȶi�椤
			--	SetFlag( TargetID() , 543638 , 1 ) -- �w��@�P�~ ���ȧ���
				SetFlag( TargetID() , 546219 , 0 ) -- �w��T�g�~ �C�쬡�� �R������Key
				SetFlag( TargetID() , 546220 , 0 ) -- �w��T�g�~ �C�쬡�� �R�����ȶi�椤
				SetFlag( TargetID() , 546221 , 1 ) -- �w��T�g�~ �C�쬡�� ����w����
				AdjustFaceDir( OwnerID(), TargetID() , 0 ) --���V
				PlayMotion( OwnerID() , 107 )
				GiveBodyItem( TargetID() , 207007 , 50 )
			end
		end
	else
		if Language == "ru" then		-- Russia �@�P�~�y���ʡA2012.01.17 ru ���y�t�]�O eneu�A���F�T�g�~�Ȯɧאּ ru ... �ק��K -_-lll
			Items = {	{ 26, 202322, 1 , 5 },	--���ĩ��B�ľ�
					{ 27, 201134, 1 , 5 },	--�g���ľ�
					{ 28, 203525, 1 , 5 },	--����ū�o��
					{ 29, 201610, 1 , 5 },	--�ޯ��ľ�
					{ 30, 201141, 1 , 5 },	--�ᥧ�J������ū
					{ 31, 201139, 1 , 5 },	--�j�ѨϪ��Į�
					{ 1, 202928, 1 , 6 } }	-- �]���_����q10�I (4.0.8) �����Ыί�q, �קאּ 202928 �]���_����q10�I
		else
			Items = {	{ 19 , 202322 , 1 },	--���ĩ��B�ľ�
					{ 20 , 201134 , 1 },	--�g���ľ�
					{ 21 , 203525 , 1 },	--����ū�o��
					{ 22 , 201610 , 1 },	--�ޯ��ľ�
					{ 23 , 201141 , 1 },	--�ᥧ�J������ū
					{ 24 , 201139 , 1 },	--�j�ѨϪ��Į�
					{ 25 , 202928 , 1 } }	--�]���_����q10�I (4.0.8) �����Ыί�q, �קאּ 202928 �]���_����q10�I
		end

	--	local Items = {	{ 3 , 203066 , 1 } ,	-- 10000�I�ޯ�y
	--			{ 4 , 203066 , 1 } ,	-- 10000�I�ޯ�y
	--			{ 5 , 203066 , 1 } ,	-- 10000�I�ޯ�y
	--			{ 6 , 203066 , 1 }	}	-- 10000�I�ޯ�y

		local JudgeDay = 0
	--	Tell(TargetID(),TargetID(),month.."/"..day.." "..hour..":"..min)
	--	Say( TargetID() , Random ) 
	--	if month == 12 then
		if Language == "ru" then		-- Russia �@�P�~�y����
			for i = 1,table.getn(Items) do
				if Items[i][4] == month then
					if Items[i][1] == day then
						if ( hour >=00 and min >=0 ) then
							if CheckFlag( TargetID()  , 546221 ) ~= true then	-- �w��C�쬡�� - ���ȧ���
							--	SetFlag( TargetID() , 544690 , 0 ) -- �w��C�쬡�� �R������Key
							--	SetFlag( TargetID() , 544691 , 0 ) -- �w��C�쬡�� �R�����ȶi�椤
							--	SetFlag( TargetID() , 544689 , 1 ) -- �w��C�쬡�� ���ȧ���
								SetFlag( TargetID() , 546219 , 0 ) -- �w��T�g�~ �C�쬡�� �R������Key
								SetFlag( TargetID() , 546220 , 0 ) -- �w��T�g�~ �C�쬡�� �R�����ȶi�椤
								SetFlag( TargetID() , 546221 , 1 ) -- �w��T�g�~ �C�쬡�� ����w����
								GiveBodyItem(TargetID(),Items[i][2],Items[i][3])
							--	if Random < 10 then  -- 0 ~ 9
								GiveBodyItem( TargetID() , 207008 , 1 )
								AdjustFaceDir( OwnerID(), TargetID() , 0 ) --���V
								PlayMotion( OwnerID() , 102 )
								JudgeDay = 1
							else
								Say( OwnerID() , "[SC_XMAS_OPENNOFLAG]" )	-- �o��§���A�A���Ѥw�g����L�F�C
								JudgeDay = 1
							end
						end
					end
				end
			end
			if JudgeDay == 0 then
				Say( OwnerID() , "[SC_GERMANY_FROG_EVENT]")				--���ʮɶ��� 3/15 ~ 3/19�A�бz�@�ߵ��ݬ��ʶ}��C
			--	SetFlag( TargetID() , 544690 , 0 ) -- �w��G�g�~ �C�쬡�� �R������Key
			--	SetFlag( TargetID() , 544691 , 0 ) -- �w��G�g�~ �C�쬡�� �R�����ȶi�椤
				SetFlag( TargetID() , 546219 , 0 ) -- �w��T�g�~ �C�쬡�� �R������Key
				SetFlag( TargetID() , 546220 , 0 ) -- �w��T�g�~ �C�쬡�� �R�����ȶi�椤
				AdjustFaceDir( OwnerID(), TargetID() , 0 ) --���V
				PlayMotion( OwnerID() , 107 )
				GiveBodyItem( TargetID() , 207007 , 50 )
			end
		else
			if month == 3 or month == 2 then	-- 2012.02.21 �t�X���լ�N 2 ��[�J����
				for i = 1,table.getn(Items) do
					if Items[i][1] == day then
					--	if day == 3 and hour < 15 then
					--		JudgeDay = 0
						if ( day == 19 and hour == 0 and min == 0 ) or month == 2 then	-- 2012.02.21 �t�X���լ�N 2 ��[�J����
							JudgeDay = 0
						else
						--	if CheckFlag( TargetID()  , 543638) ~= true then	-- �w��@�P�~ - ���ȧ���
						--	if CheckFlag( TargetID()  , 544689) ~= true then	-- �w��G�g�~ �C�쬡�� - ���ȧ���
							if CheckFlag( TargetID()  , 544221) ~= true then	-- �w��T�g�~ �C�쬡�� - ���ȧ���
						--		SetFlag( TargetID() , 543639 , 0 ) -- �w��@�P�~ �R������Key
						--		SetFlag( TargetID() , 543641 , 0 ) -- �w��@�P�~ �R�����ȶi�椤
						--		SetFlag( TargetID() , 543638 , 1 ) -- �w��@�P�~ ���ȧ���
						--		SetFlag( TargetID() , 544690 , 0 ) -- �w��G�g�~ �C�쬡�� �R������Key
						--		SetFlag( TargetID() , 544691 , 0 ) -- �w��G�g�~ �C�쬡�� �R�����ȶi�椤
						--		SetFlag( TargetID() , 544689 , 1 ) -- �w��G�g�~ �C�쬡�� ���ȧ���
								SetFlag( TargetID() , 546219 , 0 ) -- �w��T�g�~ �C�쬡�� �R������Key
								SetFlag( TargetID() , 546220 , 0 ) -- �w��T�g�~ �C�쬡�� �R�����ȶi�椤
								SetFlag( TargetID() , 546221 , 1 ) -- �w��T�g�~ �C�쬡�� ����w����
								GiveBodyItem(TargetID(),Items[i][2],Items[i][3])
						--		if Random < 10 then  -- 0 ~ 9
								GiveBodyItem( TargetID() , 207008 , 1 )
								AdjustFaceDir( OwnerID(), TargetID() , 0 ) --���V
								PlayMotion( OwnerID() , 102 )
								JudgeDay = 1
							else
								Say( OwnerID() , "[SC_XMAS_OPENNOFLAG]" )	-- �o��§���A�A���Ѥw�g����L�F�C
								JudgeDay = 1
							end
						end
					end
				end
				if JudgeDay == 0 then
				--	Say( OwnerID() , " The non-active time , Activity time is 3/15 ~ 3/19. " )	--�D���ʮɶ��A���ʮɶ��� 3/15 ~ 3/19 ���C
				--	Say( OwnerID() , "[SC_GERMANY_FROG_EVENT]")				--���ʮɶ��� 11/19 15:00 ~ 11/22 11:00�A�бz�@�ߵ��ݬ��ʶ}��C
					Say( OwnerID() , "[SC_GERMANY_FROG_EVENT]")				--���ʮɶ��� 3/15 ~ 3/19�A�бz�@�ߵ��ݬ��ʶ}��C
				--	Say( OwnerID() , " The non-active time , Activity time is 11/19 15:00 ~ 11/22 11:00" )	--���ʮɶ��� 11/19 15:00 ~ 11/22 11:00�A�бz�@�ߵ��ݬ��ʶ}��C 
				--	SetFlag( TargetID() , 543639 , 0 ) -- �w��@�P�~ �R������Key
				--	SetFlag( TargetID() , 543641 , 0 ) -- �w��@�P�~ �R�����ȶi�椤
				--	SetFlag( TargetID() , 543638 , 1 ) -- �w��@�P�~ ���ȧ���
				--	SetFlag( TargetID() , 544690 , 0 ) -- �w��G�g�~ �C�쬡�� �R������Key
				--	SetFlag( TargetID() , 544691 , 0 ) -- �w��G�g�~ �C�쬡�� �R�����ȶi�椤
					SetFlag( TargetID() , 546219 , 0 ) -- �w��T�g�~ �C�쬡�� �R������Key
					SetFlag( TargetID() , 546220 , 0 ) -- �w��T�g�~ �C�쬡�� �R�����ȶi�椤
				--	SetFlag( TargetID() , 544689 , 1 ) -- �w��C�쬡�� ���ȧ���
					AdjustFaceDir( OwnerID(), TargetID() , 0 ) --���V
					PlayMotion( OwnerID() , 107 )
					GiveBodyItem( TargetID() , 207007 , 50 )
				end
			end
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Germany_Delkeyitem()
--	SetFlag( TargetID() , 543639 , 0 ) -- �w��@�P�~ �R������Key
--	SetFlag( TargetID() , 543641 , 0 ) -- �w��@�P�~ �R�����ȶi�椤
--	SetFlag( TargetID() , 543638 , 0 ) -- �w��@�P�~ �R������w����
--	SetFlag( TargetID() , 544690 , 0 ) -- �w��G�g�~ �C�쬡�� �R������Key
--	SetFlag( TargetID() , 544691 , 0 ) -- �w��G�g�~ �C�쬡�� �R�����ȶi�椤
--	SetFlag( TargetID() , 544689 , 0 ) -- �w��G�g�~ �C�쬡�� �R������w����
	SetFlag( TargetID() , 546219 , 0 ) -- �w��T�g�~ �C�쬡�� �R������Key
	SetFlag( TargetID() , 546220 , 0 ) -- �w��T�g�~ �C�쬡�� �R�����ȶi�椤
	SetFlag( TargetID() , 546221 , 0 ) -- �w��T�g�~ �C�쬡�� �R������w����
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_System_Time()

	local month = GetSystime(3)+1
	local day = GetSystime(4)
	local hour = GetSystime(1)
	local min = GetSystime(2)

	Tell( OwnerID() , OwnerID() , month.."/"..day.." "..hour..":"..min )  -- ���X�ɶ�
end
----------------------------------------------------------------------------------------------------------------------------------------------
Function LuaI_206997() --�w��@�g�~�y��߳J

	local RoleName = GetName( OwnerID() )
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[206997]][$SETVAR3=[201130]]" -- 206997 = �J 201130 = �ä[���I���M

	local itemset  = {	1 , Prize1Str 	, { 201130 , 1 }		-- �ä[���I���M		201130 ���v	1 / 10000
				, 300 ,""	, { 202434 , 3 }		-- �C����ȭ��m��*3	202434 ���v	299 / 10000
				, 800 ,""	, { 202434 , 1 } 	       	-- �C����ȭ��m��*1	202434 ���v      500 / 10000
				, 1300 ,""	, { 201141 , 1 }		-- �ᥧ�J������ū*1	201141 ���v	500 / 10000
				, 2300 ,""	, { 201458 , 3 }		-- �t���Z����*3		201458 ���v	1000 / 10000
				, 3300 ,""	, { 201459 , 3 }		-- �t���˳ƥ�*3		201459 ���v	1000 / 10000
				, 4300 ,""	, { 203043 , 3 }		-- �t��������*3		203043 ���v	1000 / 10000
				, 6200 ,""	, { 202435 , 5 }		-- �a������*5		202435 ���v	1900 / 10000
				, 8100 ,""	, { 202902 , 5 }		-- �Ŷ���������*5	202902 ���v	1900 / 10000
				, 10000 ,""	, { 202903 , 5 }	}	-- �ǰe�̲Ť�*5		202903 ���v	1900 / 10000

	return BaseTressureProc4(   itemset , 1  )

end
----------------------------------------------------------------------------------------------------------------------------------------------
Function LuaI_207011() --�w��G�g�~�y��߳J

	local RoleName = GetName( OwnerID() )
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[206997]][$SETVAR3=[201130]]" -- 206997 = �J 201130 = �ä[���I���M

	local itemset  = {	1 , Prize1Str 	, { 201130 , 1 }		-- �ä[���I���M		201130 ���v	1 / 10000
				, 300 ,""	, { 202434 , 3 }		-- �C����ȭ��m��*3	202434 ���v	299 / 10000
				, 800 ,""	, { 202434 , 1 } 	       	-- �C����ȭ��m��*1	202434 ���v      500 / 10000
				, 1300 ,""	, { 201141 , 1 }		-- �ᥧ�J������ū*1	201141 ���v	500 / 10000
				, 2300 ,""	, { 207761 , 3 }		-- �O��Z����*3		201458 ���v	1000 / 10000
				, 3300 ,""	, { 207762 , 3 }		-- �O��˳ƥ�*3		201459 ���v	1000 / 10000
				, 4300 ,""	, { 207763 , 3 }		-- �O�䭺����*3		203043 ���v	1000 / 10000
				, 6200 ,""	, { 202435 , 5 }		-- �a������*5		202435 ���v	1900 / 10000
				, 8100 ,""	, { 202902 , 5 }		-- �Ŷ���������*5	202902 ���v	1900 / 10000
				, 10000 ,""	, { 202903 , 5 }	}	-- �ǰe�̲Ť�*5		202903 ���v	1900 / 10000

	return BaseTressureProc4(   itemset , 1  )

end

----------------------------------------------------------------------------------------------------------------------------------------------
Function LuaI_241129() --�w��3�g�~�y��߳J

	local RoleName = GetName( OwnerID() )
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[241129]][$SETVAR3=[209487]]" -- 241129 = �J   / 209487 = �ä[�]�ۥ��짤�M

	local itemset  = {	1 , Prize1Str 	, { 209487 , 1 }		-- �ä[�]�ۥ��짤�M*1    209487
				, 201 ,""	, { 209486 , 1 }		-- 30���]�ۥ��짤�M*1	209486 
				, 500 ,""	, { 202434 , 3 }		-- �C����ȭ��m��*3	202434 
				, 1050 ,""	, { 202434 , 1 } 	       	-- �C����ȭ��m��*1	202434 
				, 1600 ,""	, { 201141 , 1 }		-- �ᥧ�J������ū*1	201141 
				, 2600 ,""	, { 207761 , 3 }		-- �O��Z����*3	207761 
				, 3600 ,""	, { 207762 , 3 }		-- �O��˳ƥ�*3	207762 
				, 4600 ,""	, { 207763 , 3 }		-- �O�䭺����*3	207763 
				, 6400 ,""	, { 202435 , 5 }		-- �a������*5		202435 
				, 8200 ,""	, { 202902 , 5 }		-- �Ŷ���������*5	202902
				, 10000 ,""	, { 202903 , 5 }	}	-- �ǰe�̲Ť�*5	202903 

	return BaseTressureProc4(   itemset , 1  )

end
----------------------------------------------------------------------------------------------------------------------------------------------
function BaseTressureProc4(   itemset  , maxprizecount )

	local RandValue = rand(10000)
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	
	for i = 1 , table.getn( itemset ),3 do
		if RandValue < itemset [i] then		

			--�ˬd�O�_�����			
			if Check_Bag_Space( OwnerID() , maxprizecount ) == false then
				return false
			end
			
			for j = 1 , table.getn( itemset[i+2] ) ,2 do
				GiveBodyItem( OwnerID() , itemset[i+2][j] , itemset[i+2][j+1 ] )
			end
	
			if itemset[i+1] ~= "" then
				if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
					RunningMsgEx( OwnerID() , 2 , 2 , itemset[i+1] )
			--		RunningMsg( OwnerID() , 2 , itemset[i+1] )
				end
			end
			return true;
		end
	end
	
	return false;
end
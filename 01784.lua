Function LuaI_207049() --7�ѭI�]§��

	local RoleName = GetName( OwnerID() )
	local itemset  = {	25 , "" , { 205547 , 1 } ,		-- 7�ѭI�]�Ŷ��� - III	���v	25 / 100
				50 , "" , { 205548 , 1 } ,		-- 7�ѭI�]�Ŷ��� - IV	���v	50 / 100
				75 , "" , { 205549 , 1 } ,	       	-- 7�ѭI�]�Ŷ��� - V	���v	75 / 100
				100 , ""	, { 205550 , 1 }	}	-- 7�ѭI�]�Ŷ��� - VI	���v	100 / 100

	return BaseTressureProc5(   itemset , 1  )

end
----------------------------------------------------------------------------------------------------------------------------------------------
Function LuaI_207050() --30�ѭI�]§��

	local RoleName = GetName( OwnerID() )
	local itemset  = {	25 , "" , { 205525 , 1 } ,		-- 30�ѭI�]�Ŷ��� - III	���v	25 / 100
				50 , "" , { 205526 , 1 } ,		-- 30�ѭI�]�Ŷ��� - IV	���v	50 / 100
				75 , "" , { 205527 , 1 } ,	       	-- 30�ѭI�]�Ŷ��� - V	���v	75 / 100
				100 , "" , { 205541 , 1 }	}	-- 30�ѭI�]�Ŷ��� - VI	���v	100 / 100

	return BaseTressureProc5(   itemset , 1  )

end
----------------------------------------------------------------------------------------------------------------------------------------------
Function LuaI_207219() -- �����@��§�� Day 1

	local RoleName = GetName( OwnerID() )
	local itemset  = {	20 , "" , { 207058 , 1 } ,		-- ���|�귽�զX�]	���v	20 / 100
				40 , "" , { 202903 , 3 } ,		-- �ǰe�̲Ť�*3		���v	40 / 100
				55 , "" , { 201610 , 1 } ,	       	-- �ޯ��ľ�		���v	55 / 100
				70 , "" , { 203487 , 3 } ,		-- �]���_����q*3	���v	70 / 100
				80 , "" , { 201607 , 1 } ,		-- �ĦX�֤�		���v	80 / 100
				90 , "" , { 202434 , 1 } ,	       	-- �C����ȭ��m��	���v	90 / 100
				95 , "" , { 207049 , 1 } ,		-- 7�ѭI�]§��		���v	95 / 100
				100 , "" , { 203591 , 1 }	}	-- 7�Ѥp���r���ľ�	���v	100 / 100

	return BaseTressureProc5(   itemset , 1  )

--[SC_SHOP_BAG_OPEN_ODDS][207058]�B[202903]3�ӡB[201610]�B[203487]3�ӡB[201607]�B[202434]�B[207049]�B[203591]�C


end
----------------------------------------------------------------------------------------------------------------------------------------------
Function LuaI_207220() -- ���֯��e§�� Day 2

	local RoleName = GetName( OwnerID() )
	local itemset  = {	20 , "" , { 207058 , 1 } ,		-- ���|�귽�զX�]	���v	20 / 100
				30 , "" , { 202903 , 5 } ,		-- �ǰe�̲Ť�*5		���v	30 / 100
				40 , "" , { 201610 , 1 } ,	       	-- �ޯ��ľ�		���v	40 / 100
				50 , "" , { 203487 , 5 } ,		-- �]���_����q*5	���v	50 / 100
				60 , "" , { 201607 , 1 } ,		-- �ĦX�֤�		���v	60 / 100
				70 , "" , { 202434 , 1 } ,	       	-- �C����ȭ��m��	���v	70 / 100
				80 , "" , { 202520 , 1 } ,		-- �Ѱ��j�w		���v	80 / 100
				85 , "" , { 203525 , 1 } ,	       	-- ����ū�o��		���v	85 / 100
				90 , "" , { 207049 , 1 } ,		-- 7�ѭI�]§��		���v	90 / 100
				95 , "" , { 203591 , 1 } ,		-- 7�Ѥp���r���ľ�	���v	95 / 100
				100 , "" , { 202881 , 1 }	}	-- �L�v���ѥ�		���v	100 / 100

	return BaseTressureProc5(   itemset , 1  )

end

--<SC_SHOP_BAG_OPEN_ODDS_�d�L���>���|�귽�զX�]�B�ǰe�̲Ť�5�ӡB�ޯ��ľ��B�]���_����q1�I5�ӡB�ĦX�֤ߡB�C����ȭ��m��B�Ѱ��j�w�B����ū�o��B7�ѭI�]§���B7�Ѥp���r���ľ��B�L�庲�ѥۡC

--[SC_SHOP_BAG_OPEN_ODDS][207058]�B[202903]5�ӡB[201610]�B[203487]5�ӡB[201607]�B[202434]�B[202520]�B[203525]�B[207049]�B[203591]�B[202881]�C

----------------------------------------------------------------------------------------------------------------------------------------------
Function LuaI_207221() -- �C���a�x§�� Day 3

	local RoleName = GetName( OwnerID() )
--	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[206997]][$SETVAR3=[201130]]" 
--	���� |cffff00ff[$VAR1]|r �q[$VAR2]���[$VAR3]�I
	local itemset  = {	10 , "" , { 207058 , 1 } ,		-- ���|�귽�զX�]	���v	10 / 100
				20 , "" , { 202903 , 5 } ,		-- �ǰe�̲Ť�*5		���v	20 / 100
				30 , "" , { 201610 , 1 } ,	       	-- �ޯ��ľ�		���v	30 / 100
				40 , "" , { 203577 , 1 } ,		-- �]���_����q*10	���v	40 / 100
				50 , "" , { 201607 , 1 } ,		-- �ĦX�֤�		���v	50 / 100
				60 , "" , { 202434 , 1 } ,	       	-- �C����ȭ��m��	���v	60 / 100
				70 , "" , { 202520 , 1 } ,		-- �Ѱ��j�w		���v	70 / 100
				80 , "" , { 203525 , 1 } ,	       	-- ����ū�o��		���v	80 / 100
				85 , "" , { 207049 , 1 } ,		-- 7�ѭI�]§��		���v	85 / 100
				90 , "" , { 202669 , 1 } ,		-- 7�Ѿr���ľ�		���v	90 / 100
				95 , "" , { 202881 , 1 } ,		-- �L�v���ѥ�		���v	95 / 100
				100 , "" , { 206294 , 1 }	}	-- 7�ѳ��I���M�]	���v	100 / 100

	return BaseTressureProc5(   itemset , 1  )

end

--[SC_SHOP_BAG_OPEN_ODDS][207058]�B[202903]5�ӡB[201610]�B[203577]�B[201607]�B[202434]�B[202520]�B[203525]�B[207049]�B[202669]�B[202881]�B[206294]�C

----------------------------------------------------------------------------------------------------------------------------------------------
function BaseTressureProc5(   itemset  , maxprizecount )

	local RandValue = rand(100)
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�

	for i = 1 , table.getn( itemset ) , 3 do
		if RandValue < itemset [i] then		
			--�ˬd�O�_�����			
			if Check_Bag_Space( OwnerID() , maxprizecount ) == false then
				return false
			end
			for j = 1 , table.getn( itemset[i+2] ) , 2 do
				GiveBodyItem( OwnerID() , itemset[i+2][j] , itemset[i+2][j+1 ] )
			end
			if itemset[i+1] ~= "" then
				if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
					RunningMsgEx( OwnerID() , 2 , 2 , itemset[i+1] )
			--		RunningMsg( OwnerID() , 2 , itemset[i+1] )
				end
			end
			return true
		end
	end
	return false
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Korea_Family() -- �̷�Buff���|�h�P�_�C -- ���ϥ�

	local BuffLv , BuffNumber
	local Count = BuffCount ( OwnerID())

	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if BuffID == 506601 then -- ����a�x��
			BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			BuffNumber = BuffLv
			Say( OwnerID() , BuffLv )
			Say( OwnerID() , BuffNumber )
		else
			Addbuff( OwnerID() , 506601 , 0 , -1 )
			return false
		end
	end

	if BuffNumber <= 2 then
			AddBuff( OwnerID() , 506601 , BuffNumber + 1 , -1 )
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Korea_Family_01() -- ����Script��A�A�������ȡC -- ���ϥ�

--	Say( TargetID() , "1" )	-- ���a
--	Say( OwnerID() , "2" )	-- NPC

--	LoadQuestOption( TargetID() )  --���J���ȼҪO
	AdjustFaceDir( OwnerID(), TargetID() , 0 ) --���V
	PlayMotion( OwnerID() , 106 )
	Sleep(20)
	PlayMotion( OwnerID() , 254 )

end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Korea_Family_02() -- �������ȫ�A�A���檺Script�C

	AdjustFaceDir( OwnerID(), TargetID() , 0 ) --���V
	PlayMotion( OwnerID() , 102 )

--	Say( TargetID() , "1" )	-- ���a
--	Say( OwnerID() , "2" )	-- NPC

	SetFlag( TargetID() , 543956 , 0 ) -- �R������Key
	SetFlag( TargetID() , 543957 , 0 ) -- �R�����ȶi�椤
	SetFlag( TargetID() , 543958 , 1 ) -- �������w���§�]�X��

	if CheckBuff( TargetID() , 506601 ) == true then
		CancelBuff( TargetID() , 506601 )
		AddBuff( TargetID() , 506602 , 0 , -1 ) -- �M�䩯��
		GiveBodyItem( TargetID() , 207219 , 1 ) -- �����@��§��
		GiveBodyItem( TargetID() , 207220 , 1 ) -- ���֯��e§��
		tell( TargetID() , OwnerID() ,"[SC_KOREA_FAMILY_05]" )
		--���֨ӳX�A�O�ѤF�L������A�]�\���U���٭n�A�·ЧA�O�C
	elseif CheckBuff( TargetID() , 506602 ) == true then
		CancelBuff( TargetID() , 506602 )
		AddBuff( TargetID() , 506603 , 0 , -1 ) -- �����a�x
		GiveBodyItem( TargetID() , 207219 , 1 ) -- �����@��§��
		GiveBodyItem( TargetID() , 207220 , 1 ) -- ���֯��e§��
		GiveBodyItem( TargetID() , 207221 , 1 ) -- �����a�x§��
		tell( TargetID() , OwnerID() ,"[SC_KOREA_FAMILY_06]" )
		--�������a�x�A�O���\����ۡA���e�o�ǸܡA��곣�O�ڪ��a�H�оɧڪ��A�Ʊ�A�]�|���w�C
	elseif CheckBuff( TargetID() , 506603 ) == true then
		AddBuff( TargetID() , 506603 , 0 , -1 ) -- �����a�x
		GiveBodyItem( TargetID() , 207219 , 1 ) -- �����@��§��
		GiveBodyItem( TargetID() , 207220 , 1 ) -- ���֯��e§��
		GiveBodyItem( TargetID() , 207221 , 1 ) -- �����a�x§��
		tell( TargetID() , OwnerID() ,"[SC_KOREA_FAMILY_07]" )
		--���F�A�u�Τ��~�A���ٯ໡�Ǥ���H
	else
		AddBuff( TargetID() , 506601 , 0 , -1 ) -- �M���@��
		GiveBodyItem( TargetID() , 207219 , 1 ) -- �����@��§��
		tell( TargetID() , OwnerID() ,"[SC_KOREA_FAMILY_04]" )
		--�ߦ����h�Ʊ�A�~��֩�ڷQ�A�~��O���U�h�A�A���ݤO�|�a�ӧ�j����ì�C
	end
	--[SC_KOREA_FAMILY_08]
	--�����w�A���U���٦�����n�ơA�֪��D�O�H
	Sleep(20)
	PlayMotion( OwnerID() , 251 )

end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Korea_Family_00() -- ��ѥ������ȹL �i�ݨ즹�ﶵ

--	Say( OwnerID() , "1" ) -- ���a
--	Say( TargetID() , "2" ) -- NPC

	BeginPlot( TargetID() , "Lua_Hao_Korea_Family_00_4" , 0 ) -- �Z���W�L50�Y������ܵ���

	local Key = Checkflag(OwnerID() , 543956 ) 	-- ����Key
	local Accept = Checkflag(OwnerID() , 543957 ) 	-- ���ȶi�椤
	local Over = Checkflag(OwnerID() , 543958 ) 	-- ���ȧ���
	if Over == true then
		AdjustFaceDir( TargetID() , OwnerID() , 0 ) --���V
		PlayMotion( TargetID() , 112 ) -- ��
		SetSpeakDetail( OwnerID() , "[SC_THANKSGIVING_16]" ) -- �A���Ѥw�g�����F�o�ӥ��ȡA�ЧA���ѦA�ӧa�C
	else
		AdjustFaceDir( TargetID(), OwnerID() , 0 ) --���V
		if Key == true then -- ����Key�A�i�D�Ԯɤ~���J
			PlayMotion( TargetID() , 106 ) -- �I�Y
			LoadQuestOption(OwnerID())  --���J���ȼҪO
			AddSpeakOption(  OwnerID() , TargetID( ) , "[SC_KOREA_FAMILY_03]" ,  "Lua_Hao_Korea_Family_00_0",  0 ) -- �ڸӥh���~����o[207222]�O�H
			AddSpeakOption(  OwnerID() , TargetID( ) , "[SC_KOREA_FAMILY_09]" ,  "Lua_Hao_Korea_Family_00_3",  0 ) -- �ҿת��p§���O����O�H
		else -- ����Key�A���i�D��
			if Accept == false then -- �������ȶi�椤��Key
				PlayMotion( TargetID() , 105 ) -- ��
				SetSpeakDetail( OwnerID() , "[SC_KOREA_FAMILY_00]" ) -- [SC_KOREA_FAMILY_00] �o����ͬݰ_�ӫܭW�o���ˤl...
				AddSpeakOption(  OwnerID() , TargetID( ) , "[SC_KOREA_FAMILY_01]" ,  "Lua_Hao_Korea_Family_00_1",  0 ) -- �аݡA������گ�����o�W�����a��ܡH
			end
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Korea_Family_00_0() -- �ﶵ �ڸӥh���~����o[207222]�O�H

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --���V
	SetSpeakDetail( OwnerID() , "[SC_THAILAND_SONGKRAN_007]" ) --�u�n���˻P�A���D¾���Ŭ۪񪺩Ǫ��A�N�����|��B�����~�ɨ��o�C
	AddSpeakOption( OwnerID() , TargetID( ) , GetString("SO_BACK") , "Lua_Hao_Korea_Family_00", 0 ) --�^��W�@��
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Korea_Family_00_1() --�ﶵ  �аݡA������گ�����o�W�����a��H

--	Say( OwnerID() , "02 = 1" ) -- ���a
--	Say( TargetID() , "02 = 2" ) -- NPC
	CloseSpeak( OwnerID() )
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --���V
	PlayMotion( TargetID() , 106 ) -- �I�Y
	Setflag( OwnerID() , 543956 , 1 ) -- ����Key 
	AddSpeakOption(  OwnerID() , TargetID( ) , "[SC_KOREA_FAMILY_03]" ,  "Lua_Hao_Korea_Family_00_0",  0 ) -- �ڸӥh���~����o[207222]�O�H
	AddSpeakOption(  OwnerID() , TargetID( ) , "[SC_KOREA_FAMILY_09]" ,  "Lua_Hao_Korea_Family_00_3",  0 ) -- �ҿת��p§���O����O�H
	LoadQuestOption( OwnerID() )  --���J���ȼҪO
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Korea_Family_00_2() --�������ȫ�A�A���檺Script�C

--	Say( OwnerID() , "03 = 1" ) -- NPC
--	Say( TargetID() , "03 = 2" ) -- ���a
	AdjustFaceDir( OwnerID() , TargetID() , 0 ) --���V
	PlayMotion( OwnerID() , 106 ) -- �I�Y
	Setflag( TargetID() , 543957, 1 ) -- ���ȶi�椤
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Korea_Family_00_3() --�ﶵ �ҿת��p§���O����O�H

--	Say( OwnerID() , "03 = 1" ) -- NPC
--	Say( TargetID() , "03 = 2" ) -- ���a
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --���V
	SetSpeakDetail( OwnerID() , "[SC_KOREA_FAMILY_10]" ) --�N�I�d�U�O��H���ڡA���...�o�O���໡�����K�I
	AddSpeakOption( OwnerID() , TargetID( ) , GetString("SO_BACK") , "Lua_Hao_Korea_Family_00", 0 ) --�^��W�@��
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Korea_Family_00_4() -- �Z���W�L50�Y������ܵ���

--	say(OwnerID() , "3" ) --NPC
--	say(TargetID() , "4" ) --���a

	while true do
		if GetDistance( OwnerID() , TargetID() )  >= 50 then
			CloseSpeak( TargetID() )

			if CheckAcceptQuest( TargetID(), 423078 ) == true then
				tell( TargetID() , OwnerID() ,"[SC_YU_NEWPLAYERGO_16]" ) --�@����A�@���N���U�A�F�C
				AdjustFaceDir( OwnerID(), TargetID() , 0 ) -- ���V
				PlayMotion( OwnerID() , 103 ) -- �|�u
				break
			else
				tell( TargetID() , OwnerID() ,"[SC_KOREA_FAMILY_11]" ) --�@��...��I���䦳�n�ߤH�@�N�����O�H
				AdjustFaceDir( OwnerID(), TargetID() , 0 ) --���V
				PlayMotion( OwnerID() , 113 ) -- �Y��
				break
			end
		end
		sleep(5)
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Korea_Family_CLS() -- �M���a�x����� - �R�O�ë�

	if CheckFlag( OwnerID() , 543958 ) == true then
		SetFlag( OwnerID() , 543958 , 0 ) -- �M�����w���§�]�X��
		PlayMotion( OwnerID() , 103 )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_KOREA_FAMILY_12]" , C_SYSTEM )	--�M������ - �R�O�ë� ���\�I
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_KOREA_FAMILY_13]" , C_SYSTEM )	--����|�����������ȡA�A�٤���o�˰��C
		return false
	end
end
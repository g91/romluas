function Lua_Hao_TitleSys_Give_Title(Num)

	local O_ID = OwnerID()
	local RoomID = ReadRoleValue( O_ID , EM_RoleValue_RoomID )
	local Obj = Role:new( O_ID )  -- ���o���a X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local QBOX = CreateObj( 113105 , BaseX , BaseY , BaseZ , BaseDir , 1 ) --�b���a(�y��)�y�� X.Y.Z.Dir ���W�ǳƳХߪ���
	SetModeEx( QBOX , EM_SetModeType_Strikback , false )--����
	SetModeEx( QBOX , EM_SetModeType_SearchenemyIgnore , false )--�Q�j�M
	SetModeEx( QBOX , EM_SetModeType_Obstruct , false )--����
	SetModeEx( QBOX , EM_SetModeType_Mark , false )--�аO
	SetModeEx( QBOX , EM_SetModeType_Move , false )--����
	SetModeEx( QBOX , EM_SetModeType_Searchenemy , false )--����
	SetModeEx( QBOX , EM_SetModeType_HideName , false )--�W��
	SetModeEx( QBOX , EM_SetModeType_ShowRoleHead , false )--�Y����
	SetModeEx( QBOX , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( QBOX , EM_SetModeType_Drag , false )--���O
	SetModeEx( QBOX , EM_SetModeType_Show , true )--���
	AddToPartition( QBOX , RoomID ) -- �إߪ���
	Hide(QBOX)
	CallPlot( QBOX , "Lua_Hao_TitleSys_Build_QBox" , O_ID , Num )
	CallPlot( QBOX , "Lua_Hao_TitleSys_Del_QBox" , O_ID )
end

function Lua_Hao_TitleSys_Build_QBox( Player , Num )

	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Count = 0

	if Num == nil then
		DebugMsg( Player , Room , "Entry error" )
		return
	elseif Num == 0 or Num == 100 then	-- �����ثe���}���ת������ٸ��B���������ٸ�
		for i = 530000 , 530999 , 1 do
			if CountBodyItem( Player , i ) < 1 then
				local Type = {}
				Type[1] = GameObjInfo_int( i , "Classify1" )
				Type[2] = GameObjInfo_int( i , "Classify2" )
				Type[3] = GameObjInfo_int( i , "OutputLanguage" )
				Type[4] = GameObjInfo_int( i , "Rare" )
			--	Type[4] = GameObjInfo_int( i , "Translate" )
			--	DebugMsg( Player , Room , i..", [1] = "..Type[1]..", [2] = "..Type[2]..", [3] = "..Type[3] )
				if Type[1] ~= nil then
					if Num == 100 then
						if Type[1] >= 0 and Type[2] >= 0 and Type[3] == -1 and Type[4] >= 1 then
						--	DebugMsg( Player , Room , i )
							GiveBodyItem( Player , i , 1 )
							Count = Count + 1
							DebugMsg( Player , Room , Count )
							Sleep(1)
						end
					else
						if Type[1] >= 0 and Type[2] >= 0 and Type[3] == -1 then
						--	DebugMsg( Player , Room , i )
							GiveBodyItem( Player , i , 1 )
							Count = Count + 1
							DebugMsg( Player , Room , Count )
							Sleep(1)
						end
					end
				end
			end
		end
		if Num == 0 then
			DebugMsg( Player , Room , "Get Rare Titles" )
		elseif Num == 100 then
			DebugMsg( Player , Room , "Get all Titles" )
		end
	elseif Num == 1 or Num == 101 then	-- �R���ثe���}���ת������ٸ��B�R�������ٸ�
		for i = 530000 , 530999 , 1 do
			if CountBodyItem( Player , i ) == 1 then
				local Type = {}
				Type[1] = GameObjInfo_int( i , "Rare" )
				if Num == 101 then
					if Type[1] >= 1 then 
						DelBodyItem( Player , i , 1 )
						Count = Count + 1
						DebugMsg( Player , Room , Count )
						if i % 100 == 0 then
							sleep(1)
						end
					end
				else
					if Type[1] ~= nil then 
						DelBodyItem( Player , i , 1 )
						Count = Count + 1
						DebugMsg( Player , Room , Count )
						if i % 100 == 0 then
							sleep(1)
						end
					end
				end
			end
		end
		if Num == 1 then
			DebugMsg( Player , Room , "Del Rare Titles" )
		elseif Num == 101 then
			DebugMsg( Player , Room , "Del all Titles" )
		end
	elseif Num >= 530000 and Num <= 530999 then
		if CountBodyItem( Player , i ) == 1 then
			DelBodyItem( Player , i , 1 )
		end
		DebugMsg( Player , Room , "Del Title "..Num )
	end
	DelObj(OwnerID())
end

function Lua_Hao_TitleSys_Del_QBox( Player )	-- 

	while CheckID(Player) == true do	--�� NPC �ۤv�P�_�O�_�n�R���ۤv
		sleep(10)
	end
	DelObj( OwnerID() )
end

function Lua_Hao_TitleSys_Check_Rare( Rare )	-- �^�Ǩ㦳���w�������Ū��ٸ��ƶq(���ձM��)

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Count = 0

	for i = 530000 , 530999 , 1 do
		if CountBodyItem( Player , i ) == 1 then
			local Type = GameObjInfo_int( i , "Rare" )
			if Type == Rare then
			--	DebugMsg( Player , Room , "Title = "..i )
				Say( Player , "Title "..i.." = ".."["..i.."]" )
				Count = Count + 1
			end
		end
	end
	DebugMsg( Player , Room , "Count = "..Count )
	return Count
end

function Lua_Hao_TitleSys_Q_Check_Rare( Obj , Rare )	-- �^�Ǩ㦳���w�������Ū��ٸ��ƶq(���ȧP�_��)

	local Room = ReadRoleValue( Obj , EM_RoleValue_RoomID )
	local Count = 0

	for i = 530000 , 530999 , 1 do
		if CountBodyItem( Obj , i ) == 1 then
			local Type = GameObjInfo_int( i , "Rare" )
			if Type == Rare then
			--	DebugMsg( Player , Room , "Title = "..i )
				Count = Count + 1
			end
		end
	end

	for i = 531000 , 531999 , 1 do
		if CountBodyItem( Obj , i ) == 1 then
			local Type = GameObjInfo_int( i , "Rare" )
			if Type == Rare then
			--	DebugMsg( Player , Room , "Title = "..i )
				Count = Count + 1
			end
		end
	end
	DebugMsg( Obj , Room , "Count = "..Count )
	return Count
end

function Lua_Hao_TitleSys_Return_Lv_Exp(Obj)	-- �^�ǥؼЪ��������ŻP�g���

	local Room = ReadRoleValue( Obj , EM_RoleValue_RoomID )

	local Lv = ReadRoleValue( Obj , EM_RoleValue_TitleSys_Lv )	-- ��������
	local Exp = ReadRoleValue( Obj , EM_RoleValue_TitleSys_Exp )	-- ��e�g���
	DebugMsg( Obj , Room , "Lv = "..Lv.." , ".."Exp = "..Exp )
	return Lv , Exp
end

function Lua_Hao_TitleSys_Return_Lv_Exp_2()	-- �^�ǥؼ�

	local Lv , Exp = Lua_Hao_TitleSys_Return_Lv_Exp(OwnerID())
end

function Lua_Hao_TitleSys_Set_Lv(Lv)		-- �g�J��������������
	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Value = {}
	Value[1] = ReadRoleValue( Player , EM_RoleValue_TitleSys_Lv )	-- �¦���������
	WriteRoleValue( Player , EM_RoleValue_TitleSys_Lv , Lv )	-- ��������
	Value[2] = ReadRoleValue( Player , EM_RoleValue_TitleSys_Lv )	-- �ק���������
	DebugMsg( Player , Room , "Lv = "..Value[1].." , New Lv = "..Value[2] )
end

function Lua_Hao_TitleSys_Set_Exp(Exp)	-- �g�J�����������g���
	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Value = {}
	Value[1] = ReadRoleValue( Player , EM_RoleValue_TitleSys_Exp )	-- �¦��g���
	WriteRoleValue( Player , EM_RoleValue_TitleSys_Exp , Exp )		-- �g�J�g���
	Value[2] = ReadRoleValue( Player , EM_RoleValue_TitleSys_Exp )	-- �ק�g���
	DebugMsg( Player , Room , "Exp = "..Value[1].." , New Exp = "..Value[2] )
end

function Lua_Hao_TitleSys_Set_Famous(Famous)	-- �g�J�����������W�n
	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Value = {}
	Value[1] = ReadRoleValue( Player , EM_RoleValue_TitleSys_Famous )	-- �¦��W�n
	WriteRoleValue( Player , EM_RoleValue_TitleSys_Famous , Famous )	-- �g�J�W�n
	Value[2] = ReadRoleValue( Player , EM_RoleValue_TitleSys_Famous )	-- �ק�W�n
	DebugMsg( Player , Room , "Famous = "..Value[1].." , New Famous = "..Value[2] )
end

function Lua_Hao_TitleSys_Return_Famous()	-- �^�������������W�n
	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Value = {}
	Value[1] = ReadRoleValue( Player , EM_RoleValue_TitleSys_Famous )	-- �¦��W�n
	DebugMsg( Player , Room , "Famous = "..Value[1] )
end

function Lua_Hao_TitleSys_Click_Tool( Player , KeyItemTable , TitleFlag )

	local Count = 0
	if CountBodyItem( Player , TitleFlag ) < 1 then
		for i = 1 , table.getn(KeyItemTable) , 1 do
			if CheckFlag( Player , KeyItemTable[i] ) == true then
				DebugMsg( 0 , 0 , "TitleFlag = "..TitleFlag )
				GiveBodyItem( Player , TitleFlag , 1 )
				Count = Count + 1
				break
			end
		end
	end
	return Count
end

function Lua_Hao_TitleSys_Click_Tool_2( Player , KeyItemTable , TitleFlag )

	local Count = 0
	if CountBodyItem( Player , TitleFlag ) < 1 then
		for i = 1 , table.getn(KeyItemTable) , 1 do
			if CountBodyItem( Player , KeyItemTable[i] ) >= 1 then
				DebugMsg( 0 , 0 , "TitleFlag = "..TitleFlag )
				GiveBodyItem( Player , TitleFlag , 1 )
				Count = Count + 1
				break
			end
		end
	end
	return Count
end

function Lua_Hao_TitleSys_Click_Check( Player )
-- 2011.08.22 �s�W�ٸ��t�κٸ� ----

	local KeyItemTable , Select , TitleFlag
	local Count , LifeisGood = 0 , 0
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Total = 0

	KeyItemTable = { 540269 , 540270 , 540333 }	-- ���n���~
	TitleFlag = 530016				-- �Y��
	Total = Total + Lua_Hao_TitleSys_Click_Tool( Player , KeyItemTable , TitleFlag )
	-- �Ķ�������O

	KeyItemTable = { 540340 , 540341 , 540342 }
	TitleFlag = 530017
	Total = Total + Lua_Hao_TitleSys_Click_Tool( Player , KeyItemTable , TitleFlag )
	-- �Ķ������F

	KeyItemTable = { 540349 , 540350 , 540351 }
	TitleFlag = 530043
	Total = Total + Lua_Hao_TitleSys_Click_Tool( Player , KeyItemTable , TitleFlag )
	-- �������

	KeyItemTable = { 540358 , 540359 , 540360 }
	TitleFlag = 530044
	Total = Total + Lua_Hao_TitleSys_Click_Tool( Player , KeyItemTable , TitleFlag )
	-- �s��X��

	KeyItemTable = { 540268 , 540334 , 540335 , 540336 , 540337 , 540338 }
	TitleFlag = 530045
	Total = Total + Lua_Hao_TitleSys_Click_Tool( Player , KeyItemTable , TitleFlag )
	-- �P�s�y����

	KeyItemTable = { 540343 , 540344 , 540345 , 540346 , 540347 , 540348 }
	TitleFlag = 530046
	Total = Total + Lua_Hao_TitleSys_Click_Tool( Player , KeyItemTable , TitleFlag )
	-- �s�y��{��

	KeyItemTable = { 540352 , 540353 , 540354 , 540355 , 540356 , 540357 }
	TitleFlag = 530047
	Total = Total + Lua_Hao_TitleSys_Click_Tool( Player , KeyItemTable , TitleFlag )
	-- �`�O�@�ӤH�m��

	KeyItemTable = { 540361 , 540362 , 540363 , 540364 , 540365 , 540366 }
	TitleFlag = 530048
	Total = Total + Lua_Hao_TitleSys_Click_Tool( Player , KeyItemTable , TitleFlag )
	-- �s�y�S������

	Count = 0
	KeyItemTable = { 540352 , 540353 , 540354 , 540355 , 540356 , 540357 }
	if CountBodyItem( Player , 530074 ) < 1 then
		for i = 1 , table.getn(KeyItemTable) , 1 do
			if CheckFlag( Player , KeyItemTable[i] ) == true then
				Count = Count + 1
				if Count >= 3 then
					GiveBodyItem( Player , 530074 , 1 )
					Total = Total + 1
					break
				end
			end
		end
	end
	-- �¤�u�s�y

	KeyItemTable = {}
	Select = { 6 , 3 , 1 }
	LifeisGood = 0
	KeyItemTable[1] = { 540340 , 540341 , 540342 , 540343 , 540344 , 540345 , 540346 , 540347 , 540348 , 542887 } -- �u�K
	KeyItemTable[2] = { 540349 , 540350 , 540351 , 540352 , 540353 , 540354 , 540355 , 540356 , 540357 , 542888 } -- �M��
	KeyItemTable[3] = { 540358 , 540359 , 540360 , 540361 , 540362 , 540363 , 540364 , 540365 , 540366 , 542889 } -- �j�v
	if CountBodyItem( Player , 530076 ) < 1 then
		for i = 1 , table.getn(KeyItemTable) , 1 do
			Count = 0
			for j = 1 , table.getn(KeyItemTable[i]) , 1 do
				if CheckFlag( Player , KeyItemTable[i][j] ) == true then
					Count = Count + 1
					if Count >= Select[i] then
						LifeisGood = LifeisGood+1
						break
					end
				end
			end
			if LifeisGood == 3 then
				GiveBodyItem( Player , 530076 , 1 )
				Total = Total + 1
			end
		end
	end
	-- 1%�Ѥ��A99%�V�O

	Count = 0
	KeyItemTable = { 540269 , 540270 , 540333 , 540268 , 540334 , 540335 , 540336 , 540337 , 540338 , 542886 }	-- �Ǯ{
	if CountBodyItem( Player , 530049 ) < 1 then
		for i = 1 , table.getn(KeyItemTable) , 1 do
			if CheckFlag( Player , KeyItemTable[i] ) == true then
				Count = Count + 1
				if Count >= 10 then
					GiveBodyItem( Player , 530049 , 1 )
					Total = Total + 1
					break
				end
			end
		end
	end
	-- �U�Ƭҥi�F

	Count = 0
	KeyItemTable = { 540343 , 540344 , 540345 , 540346 , 540347 , 540348 }	-- �s�y���u�K
	if CountBodyItem( Player , 530050 ) < 1 then
		for i = 1 , table.getn(KeyItemTable) , 1 do
			if CheckFlag( Player , KeyItemTable[i] ) == true then
				Count = Count + 1
				if Count >= 6 then
					GiveBodyItem( Player , 530050 , 1 )
					Total = Total + 1
					break
				end
			end
		end
	end
	-- �s�y�ʤ���

	Count = 0
	KeyItemTable = { 540340 , 540341 , 540342 }	-- �Ķ����u�K
	if CountBodyItem( Player , 530073 ) < 1 then
		for i = 1 , table.getn(KeyItemTable) , 1 do
			if CheckFlag( Player , KeyItemTable[i] ) == true then
				Count = Count + 1
				if Count >= 3 then
					GiveBodyItem( Player , 530073 , 1 )
					Total = Total + 1
					break
				end
			end
		end
	end
	-- �Ķ��U��!

	Count = 0
	KeyItemTable = { 540349 , 540350 , 540351 }	-- �Ķ����M��
	if CountBodyItem( Player , 530075 ) < 1 then
		for i = 1 , table.getn(KeyItemTable) , 1 do
			if CheckFlag( Player , KeyItemTable[i] ) == true then
				Count = Count + 1
				if Count >= 3 then
					GiveBodyItem( Player , 530075 , 1 )
					Total = Total + 1
					break
				end
			end
		end
	end
	-- �ڭn�����Ķ���

	KeyItemTable = { 530433 , 530434 , 530435 , 530436 , 530437 , 530438 , 530439 , 530440 , 530441 , 530442 } -- �L��
	TitleFlag = 530077
	Total = Total + Lua_Hao_TitleSys_Click_Tool_2( Player , KeyItemTable , TitleFlag )
	-- �ڭn���U�h

	KeyItemTable = { 530443 , 530444 , 530445 , 530446 , 530447 , 530448 , 530451 , 530452 , 530453 , 530454 , 530455 , 530456 , 530449 , 530450 , 530457 , 530458 , 530459 , 530460 } -- �կ�
	TitleFlag = 530078
	Total = Total + Lua_Hao_TitleSys_Click_Tool_2( Player , KeyItemTable , TitleFlag )
	-- ��������

	KeyItemTable = { 530461 , 530462 , 530463 , 530464 , 530465 , 530466 , 530467 , 530468 , 530469 , 530470 , 530471 , 530472 , 530473 , 530474 , 530475 , 530476 , 530477 , 530513 } -- �N��
	TitleFlag = 530079
	Total = Total + Lua_Hao_TitleSys_Click_Tool_2( Player , KeyItemTable , TitleFlag )
	-- ���a�ɨ�

	Count = 0
	while Count <= 90 do
		-- 2013.04.29 �ץ����a��ٸ����������U�ˬd��AScriptMsg�|���ܪ��a���o�ٸ��A���o���|���o����ٸ������D�C
		if CountBodyItem( Player , 530514+Count ) >= 1 and CountBodyItem( Player , 530080 ) == 0 then
			GiveBodyItem( Player , 530080 , 1 )
			Total = Total + 1
			break
		end
		Count = Count + 1
	end
	-- �Ԫ���D

	KeyItemTable = {}
	KeyItemTable[1] = { 530433 } -- �ֱL
	KeyItemTable[2] = { 530434 , 530435 , 530436 } -- ���L
	KeyItemTable[3] = { 530437 , 530438 , 530439 , 530440 , 530441 , 530442 } -- �W�L
	Count = 0
	for i = 1 , table.getn(KeyItemTable) , 1 do
		for j = 1 , table.getn(KeyItemTable[i]) , 1 do
			if CountBodyItem( Player , KeyItemTable[i][j] ) >= 1 then
				Count = Count + 1
				break
			end
		end
		-- 2013.04.29 �ץ����a��ٸ����������U�ˬd��AScriptMsg�|���ܪ��a���o�ٸ��A���o���|���o����ٸ������D�C
		if Count == 3 and CountBodyItem( Player , 530081 ) == 0 then
			GiveBodyItem( Player , 530081 , 1 )
			Total = Total + 1
		end
	end
	-- �D��i�h

	KeyItemTable = {}
	KeyItemTable[1] = { 530443 , 530444 , 530445 , 530449 , 530450 } -- �֮�
	KeyItemTable[2] = { 530446 , 530447 , 530448 , 530457 , 530458 } -- ����
	KeyItemTable[3] = { 530451 , 530452 , 530453 , 530454 , 530455 , 530456 , 530459 , 530460 } -- �W��
	Count = 0
	for i = 1 , table.getn(KeyItemTable) , 1 do
		for j = 1 , table.getn(KeyItemTable[i]) , 1 do
			if CountBodyItem( Player , KeyItemTable[i][j] ) >= 1 then
				Count = Count + 1
				break
			end
		end
		-- 2013.04.29 �ץ����a��ٸ����������U�ˬd��AScriptMsg�|���ܪ��a���o�ٸ��A���o���|���o����ٸ������D�C		
		if Count == 3 and CountBodyItem( Player , 530082 ) == 0 then
			GiveBodyItem( Player , 530082 , 1 )
			Total = Total + 1
		end
	end
	-- ���Զ���

	KeyItemTable = {}
	KeyItemTable[1] = { 530461 , 530462 , 530463 , 530473 , 530474 } -- �ֱN
	KeyItemTable[2] = { 530464 , 530465 , 530466 , 530475 , 530476 } -- ���N
	KeyItemTable[3] = { 530467 , 530468 , 530469 , 530470 , 530471 , 530472 , 530477 , 530513 } -- �W�N
	Count = 0
	for i = 1 , table.getn(KeyItemTable) , 1 do
		for j = 1 , table.getn(KeyItemTable[i]) , 1 do
			if CountBodyItem( Player , KeyItemTable[i][j] ) >= 1 then
				Count = Count + 1
				break
			end
		end
		-- 2013.04.29 �ץ����a��ٸ����������U�ˬd��AScriptMsg�|���ܪ��a���o�ٸ��A���o���|���o����ٸ������D�C		
		if Count == 3 and CountBodyItem( Player , 530083 )  == 0 then
			GiveBodyItem( Player , 530083 , 1 )
			Total = Total + 1
		end
	end
	-- ���ꤧ��

	KeyItemTable = {}
	KeyItemTable[1] = 530514 -- �k�� 530514 ~ 530531
	KeyItemTable[2] = 530532 -- �l�� 530532 ~ 530549
	KeyItemTable[3] = 530550 -- �B�� 530550 ~ 530567
	KeyItemTable[4] = 530568 -- �J�� 530568 ~ 530585
	KeyItemTable[5] = 530586 -- ���� 530586 ~ 530603
	Count = 0
	for i = 1 , table.getn(KeyItemTable) , 1 do
		for j = 0 , 17 , 1 do
			if CountBodyItem( Player , KeyItemTable[i]+j ) >= 1 then
				Count = Count + 1
				break
			end
		end
		-- 2013.04.29 �ץ����a��ٸ����������U�ˬd��AScriptMsg�|���ܪ��a���o�ٸ��A���o���|���o����ٸ������D�C		
		if Count == 5 and CountBodyItem( Player , 530084 ) == 0 then
			GiveBodyItem( Player , 530084 , 1 )
			Total = Total + 1
		end
	end
	-- �L�{�ѤU
	return Total
end
-- 1%�Ѥ��A99%�V�O �Ͳ����B�[�� �Ա��Ш� Script 701606
function Lua_TitleSys_530076(Check)

	local Player , Buff = OwnerID() , 508460
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )

	if Check == 0 then
		DebugMsg( Player , Room , "Effect disappeared" )
		CancelBuff( Player , Buff )
	elseif Check == 1 then
		DebugMsg( Player , Room , "Increases rarity for produced items by 25%" )
		AddBuff( Player , Buff , 0 , -1 )
	end
end
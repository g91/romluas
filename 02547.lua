function lua_kors_Pfes_Q2con()--Q2���Ȥ�����
local OID = OwnerID()
local pkmid 
local pkgid 

	while TRUE do
		local pkm = ReadRoleValue(OID , EM_RoleValue_Register1)
		local pkg = ReadRoleValue(OID,EM_RoleValue_Register2)
		local hr = GetSystime(1)-- ��p��
		local min = GetSystime(2)--��ثe����
		-- 2012.10.22 ����NPC���|���ͻP�]���O���|�X�{�����D
	--	if min == 0 then
	--		DesignLog( OID , 119996 , "Step1. "..String.format("%02d", hr ).." : "..String.format("%02d", min ) )
	--	end
		--
		-- 2012.10.22 ����NPC���|���ͻP�]���O���|�X�{�����D - ���ե�
		--	if hr%2 == 0 and min == 0 then	-- �����ƾ��I
			if hr == 12 or hr == 14 or hr == 16 or hr == 18 or hr ==20 or hr == 22 or hr == 24 then
			--	DesignLog( OID , 1199961 , "Step2. "..String.format("%02d", hr ).." : "..String.format("%02d", min ) )
				if min == 0 then --��NPC
				pkmid = CreateObjByFlag(119976,781053,0,1)
				WriteRoleValue(OID,EM_RoleValue_Register1,pkmid)
				AddToPartition (pkmid ,0 )
				pkgid = CreateObjByFlag(119975,781054,0,1)
				WriteRoleValue(OID,EM_RoleValue_Register2,pkgid)
				MoveToFlagEnabled(pkgid,FALSE)
				WriteRoleValue(pkgid,EM_RoleValue_IsWalk,0)
				AddToPartition(pkgid,0)
				local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
				local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
				if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
					RunningMsgEx( oid, 2 , 3 , "[SC_PFES_KORS_Q2_21]" ) 
				end
				
				-- 2012.10.22 ����NPC���|���ͻP�]���O���|�X�{�����D - ���ե�
			--	DesignLog( OID , 1199962 , "Step3. ".."pkmid = "..pkmid.." pkgid = "..pkgid )
				--
				elseif min == 59 and pkm ~= 0 then --�RNPC
				-- 2012.10.22 ����NPC���|���ͻP�]���O���|�X�{�����D - ���ե�
			--	DesignLog( OID , 1199963 , "Step4. ".."pkm = "..pkm.." pkg = "..pkg )
				--
				Hide (pkm)
				Hide(pkg)
				DelObj(pkm)
				DelObj(pkg)
				WriteRoleValue(OID,EM_RoleValue_Register1,0)
				WriteRoleValue(OID,EM_RoleValue_Register2,0)
				end
			end
	Sleep(600)
	end
end



function lua_kors_Pfes_Q2()-- Q2���
local OID = OwnerID()
local TID = TargetID()
local key = CheckFlag(OID,546005) --�ӱ�
local key2 = CheckFlag(OID,546006) --�����e�F
local key3 = CheckFlag(OID,546007) --�����e�F��^
local key4 = CheckFlag(OID,546008) --�����ȵ���
local keyO = CheckFlag(OID,546002) --���L�����e�@���ȡC
local keyGetC = CheckFlag(OID,546009)--��L�}�G

	if keyO == TRUE then --����
		if key4 == true then  -- �����L
			if key2 == TRUE then
				SetSpeakDetail(OID,"[SC_PFES_KORS_Q2_06]")
			elseif key3 == TRUE then
				SetSpeakDetail(OID,"[SC_PFES_KORS_Q2_05]")
			end
		else		
			if key == FALSE then  -- �٨S��
				SetSpeakDetail(OID, "[SC_PFES_KORS_Q2_00]")
				AddSpeakOption(OID,TID,"[SC_PFES_KORS_Q2_19]","lua_kors_Pfes_Q2APP",0)
			elseif key == TRUE then  -- ���F
				SetSpeakDetail(OID,"[SC_PFES_KORS_Q2_04]" )
				if key2 == TRUE then
					AddSpeakOption(OID,TID,"[SC_PFES_KORS_Q2_14]","lua_kors_Pfes_Q2arrive",0)
				elseif key3 == TRUE then
					AddSpeakOption(OID,TID,"[SC_PFES_KORS_Q2_15]","lua_kors_Pfes_Q2cancle",0)
				end
			end
		end

	elseif  keyO == FALSE then --���}�G
		if keyGetC == FALSE then
		SetSpeakDetail(OID,"[SC_PFES_KORS_Q2_01]")
		GiveBodyItem(OID,725748,1)
		SetFlag(OID,546009,1)
		elseif keyGetC == TRUE then
		SetSpeakDetail(OID,"[SC_PFES_KORS_Q2_02]")
		end
	end
end

function lua_kors_Pfes_Q2APP() --Q2��ܦP�N
local OID = OwnerID()
local TID = TargetID()
	SetSpeakDetail(OID,"[SC_PFES_KORS_Q2_03]")
	AddSpeakOption(OID,TID,"[SC_PFES_KORS_Q2_16]","lua_kors_Pfes_Q2star",0)
end

function lua_kors_Pfes_Q2star() --Q2�}�l
local OID = OwnerID()
local TID = TargetID()
	CloseSpeak(OID)
	GiveBodyItem(OID,240507,1)
	ScriptMessage( OID , OID , 2 , "[SC_PFES_KORS_Q2_20]", C_SYSTEM )
	SetFlag(OID,546005,1)
end

function lua_kors_Pfes_Q2pwalk() --�è����n�ʤp�j
local OID = OwnerID()
local flag = 781054
	while TRUE do
		local moveTar = Rand (10)+1
		local moveTime = Rand (10) * 600
		LuaFunc_MoveToFlag( OID, flag , moveTar ,20 )
	Sleep (moveTime)
	end
end 

function lua_kors_Pfes_Q2pG() --�n�ʤp�j���
	local OID = OwnerID()
	local TID = TargetID()
	local key = CheckFlag(OID,546005) --���S��������
	local key2 = CheckFlag(OID,546006) --��I
	local key3 = CheckFlag(OID,546007) --�k�� 
	local key4 = CheckFlag(OID,546008) --���ȵ���

	if key4 == FALSE  then  -- ��ѥ�����
		if key == TRUE then  -- ����
			if key2 == FALSE and key3 == FALSE then
				SetSpeakDetail(OID,"[SC_PFES_KORS_Q2_07]")
			--	AddSpeakOption(OID,TID,"[SC_PFES_KORS_Q2_17]","lua_kors_Pfes_Q2get",0)
				AddSpeakOption(OID,TID,"[SC_PFES_KORS_Q2_18]","lua_kors_Pfes_Q2back",0)
			else
				SetSpeakDetail(OID,"[SC_PFES_KORS_Q2_10]")
			end

		else  -- �S��
			SetSpeakDetail(OID,"[SC_PFES_KORS_Q2_11]")  --�][119975]���o�@�y�����ʡA���G���b�I��C�^
		end
	else
		SetSpeakDetail(OID,"[SC_PFES_KORS_Q2_11]")  --�][119975]���o�@�y�����ʡA���G���b�I��C�^
	end
end

function lua_kors_Pfes_Q2get() --��§���w��
	local OID = OwnerID()
 	SetSpeakDetail(OID,"[SC_PFES_KORS_Q2_08]")
	SetFlag(OID, 546006, 1)
	if CountBodyItem(OID, 240507) > 0 then	
		Sleep(10)
		DelBodyItem(OID, 240507, 1)
	--	say(OID,"123")
	end
--	say(OID,"456")
end

function lua_kors_Pfes_Q2back() --��§������
	local OID = OwnerID()
 	SetSpeakDetail(OID,"[SC_PFES_KORS_Q2_09]")
	SetFlag(OID,546007,1)
end

function lua_kors_Pfes_Q2arrive() --�e�F
local OID = OwnerID()
local TID = TargetID()
	SetSpeakDetail(OID,"[SC_PFES_KORS_Q2_12]")
	SetFlag(OID,546008,1)
	GiveBodyItem(OID,209433,3)
	GiveBodyItem(OID , 725749 ,1)
end	

function lua_kors_Pfes_Q2cancle() --�^��
local OID = OwnerID()
local TID = TargetID()
	SetSpeakDetail(OID,"[SC_PFES_KORS_Q2_13]")
	DelBodyItem(OID,240507,1)
	GiveBodyItem(OID,209433,3)
	GiveBodyItem(OID , 725749 ,1)
	SetFlag(OID,546008,1)
end

function lua_kors_Pfes_Q2TestON()	--���ն}�ҫ��O
local OID = OwnerID()
local pkmid
local pkgid
	pkmid = CreateObjByFlag(119976,781053,0,1)
	WriteRoleValue(OID,EM_RoleValue_Register1,pkmid)
	AddToPartition (pkmid ,0 )
	pkgid = CreateObjByFlag(119975,781054,0,1)
	WriteRoleValue(OID,EM_RoleValue_Register2,pkgid)
	MoveToFlagEnabled(pkgid,FALSE)
	WriteRoleValue(pkgid,EM_RoleValue_IsWalk,0)
	BeginPlot(pkgid,"lua_kors_Pfes_Q2pwalk",0)
	AddToPartition(pkgid,0)
end	

function lua_kors_Pfes_Q2GIVQ1F()	--��Q1FLAG
local OID = OwnerID()
local flag = {546000 , 546001 , 546002 , 546003 }
	for i = 1,4,1 do
		SetFlag( OID , flag[i] , 1)
	end
end

function lua_kors_Pfes_Q2TestEND()	--����TEST
local OID = OwnerID()
local room = ReadRoleValue (OID , EM_RoleValue_RoomID )
local count = SetSearchAllNPC( room )
	for i = 1, count ,1 do
		local NPC = GetSearchResult() 
		local OrgID = ReadRoleValue( NPC ,EM_RoleValue_OrgID )
			if OrgID == 119975 or OrgID == 119976 then			
				DelObj(NPC)
			end
	end	
end

function lua_kors_Pfes_Q2ReDo()
local OID = OwnerID()
local key = {546005 , 546006 , 546007, 546008 , 546009 }
	for i = 1, 5 ,1  do
		SetFlag(OID, key[i] ,0 )
	end
end
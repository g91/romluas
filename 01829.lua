--�n�J����A�ھڪ�l��ܪ��D¾�A�������w�X��
function DW_SetOccupationFlag()
	local Obj = OwnerID();
	local Job = ReadRoleValue( Obj , EM_RoleValue_VOC );
	if	Job==0 or Job >8	then
		return;
	end
	for i=0,7,1 do
		if	CheckFlag(Obj,540811+i)==true	then
			return;
		end
		if	i==7	then
			SetFlag( Obj , 540811+Job-1 , 1 );
		end
	end
end

function SuitSkillEqEvent(SkillID,Type) ----�M�˧ޯ����Q�ʧޥ�( SkillID: �k�NID . Type: 0�]�w, 1���� )
--2014/12/10 YoYo�G�אּ�ѵ{���ݨӰ���M�˧ޯ�Q�ʧު�����
--	if SuitSkillFunction[SkillID] ~= nil then
--		SuitSkillFunction[SkillID](Type)
--	end
end

function SuitSKillEqFunctionInit() ----�M�˧ޯ���U�s���B
	SuitSkillFunction = {}
	SuitSkillFunction[495476]  = SuitSkill495476 --�Ԥh--�Z�˨���
	SuitSkillFunction[495560]  = SuitSkill495560 --�C�L�M��--���ӷN��
	SuitSkillFunction[496104]  = SuitSkill496104 --�C�L--�y���u��
	SuitSkillFunction[497911]  = SuitSkill497911 --�C�L--�M�`���@��
	SuitSkillFunction[497913]  = SuitSkill497913 --�k�v--����
	SuitSkillFunction[495718]  = SuitSkill495718 --�M�h--�L�a���h
	SuitSkillFunction[496091]  = SuitSkill496091 --�M�h--�ɧg
	SuitSkillFunction[498343]  = SuitSkill498343 --�M�h--�L���Ͼ�
	SuitSkillFunction[495487]  = SuitSkill495487 --�˪L����--�d���j�v
	SuitSkillFunction[498344]  = SuitSkill498344 --�˪L����--��w����
	SuitSkillFunction[850876]  = SuitSkill850876 --�Ť�u�K--�ʤO�ɯ�
end

---------------�Ԥh---------------
function SuitSkill495476( Type )---�Ԥh--�Z�˨���
	if Type == 0 then
		AddBuff(OwnerID() , 506450 , 0 , -1)
	elseif  Type == 1 then
		if CheckBuff( OwnerID() , 506450) == true then 
			Cancelbuff(OwnerID(),506450)
		end
	end
end

---------------�C�L---------------
function SuitSkill495560( Type )---�C�L�M��--���ӷN��
	if Type == 0 then
		AddBuff(OwnerID() , 506523 , 0 , -1)
	elseif  Type == 1 then
		if CheckBuff( OwnerID() , 506523) == true then 
			Cancelbuff(OwnerID(),506523)
		end
	end
end
function SuitSkill496104( Type )---�C�L--�y���u��
	if Type == 0 then
		AddBuff(OwnerID() , 508528 , 0 , -1)
	elseif  Type == 1 then
		if CheckBuff( OwnerID() , 508528) == true then 
			Cancelbuff(OwnerID(), 508528)
		end
	end
end
function SuitSkill497911( Type )---�C�L--�M�`���@��
	if Type == 0 then
		AddBuff(OwnerID() , 620115 , 0 , -1)
	elseif  Type == 1 then
		if CheckBuff( OwnerID() , 620115) == true then 
			Cancelbuff(OwnerID(), 620115)
		end
	end
end

---------------�k�v---------------
function SuitSkill497913( Type )---�k�v--����
	if Type == 0 then
		AddBuff(OwnerID() , 620117 , 0 , -1)
	elseif  Type == 1 then
		if CheckBuff( OwnerID() , 620117) == true then 
			Cancelbuff(OwnerID(), 620117)
		end
	end
end

---------------�M�h---------------
function SuitSkill495718( Type )---�M�h--�L�a���h
	if Type == 0 then
		AddBuff(OwnerID() , 506871 , 0 , -1)
	elseif  Type == 1 then
		if CheckBuff( OwnerID() , 506871) == true then 
			Cancelbuff(OwnerID(), 506871)
		end
	end
end
function SuitSkill496091( Type )---�M�h--�ɧg
	if Type == 0 then
		AddBuff(OwnerID() , 507488 , 0 , -1)
	elseif  Type == 1 then
		if CheckBuff( OwnerID() , 507488) == true then 
			Cancelbuff(OwnerID(), 507488)
		end
	end
end
function SuitSkill498343( Type )---�M�h--�L���Ͼ�
	if Type == 0 then
		AddBuff(OwnerID() , 620950 , 0 , -1)
	elseif  Type == 1 then
		if CheckBuff( OwnerID() , 620950) == true then 
			Cancelbuff(OwnerID(), 620950)
		end
	end
end

---------------�˪L����---------------
function SuitSkill495487( Type )---�˪L����--�d���j�v
	if Type == 0 then
		AddBuff(OwnerID() , 506461 , 0 , -1)
	elseif  Type == 1 then
		if CheckBuff( OwnerID() , 506461) == true then 
			Cancelbuff(OwnerID(), 506461)
		end
	end
end
function SuitSkill498344( Type )---�˪L����--��w����
	if Type == 0 then
		AddBuff(OwnerID() , 620951 , 0 , -1)
	elseif  Type == 1 then
		if CheckBuff( OwnerID() , 620951) == true then 
			Cancelbuff(OwnerID(), 620951)
		end
	end
end

---------------�Ť�u�K---------------
function SuitSkill850876( Type )---�Ť�u�K--�ʤO�ɯ�
	if Type == 0 then
		AddBuff(OwnerID() , 624365 , 0 , -1)
	elseif  Type == 1 then
		if CheckBuff( OwnerID() , 624365) == true then 
			Cancelbuff(OwnerID(), 624365)
		end
	end
end

--===================== �����M�˧ޯ�P�_���a���ŨӶ}��X�檺Script	========================

function Apon_Suitskill_size_1_levelup()	--���U�b���a�ɯŨƥ�
	local Player = OwnerID()
	local PlayerLV = ReadRoleValue( Player, EM_RoleValue_LV ) 	--Ū�����a���D¾����
	local LVTable = { 50, 65, 80, 95 }					--���a�b�ɨ���ӵ��Ůɷ|�A�}��U�@��M�˧ޯ�
	local KeyItemTable = { 544009, 544970, 548000, 549125 }		--�P�_�O�_����o�L�ӵ��Ū��M�˧ޯ��
	local StringTable = { "[SC_SUITSKILL_START]", "[SC_SUITSKILL_START_65]", "[SC_SUITSKILL_START_65]", "[SC_SUITSKILL_START_65]" }	--��o�M�˧ޯ��ɪ��T��
	for i = 1, #LVTable do
		if PlayerLV >= LVTable[i] and CheckFlag( Player, KeyItemTable[i] ) == false then
			ScriptMessage( Player , Player , 3 , StringTable[i] , 1 )
			WriteRoleValue( Player, EM_RoleValue_SuitSkill_MaxEqSkillCount, (i+1) )
			SetFlag( Player, KeyItemTable[i], 1 )
		end
	end
end

function Apon_Suitskill_size_1_login()		--���U�b���a�n�J�ƥ�
	local Player = OwnerID()
	local PlayerLV = ReadRoleValue( Player , EM_RoleValue_LV ) 		--Ū�����a���D¾����
	local PlayerLV_Sub = ReadRoleValue( Player , EM_RoleValue_LV_SUB ) 	--Ū�����a����¾����
	local LVTable = { 50, 65, 80, 95 }						--���a�b�ɨ���ӵ��Ůɷ|�A�}��U�@��M�˧ޯ�
	local KeyItemTable = { 544009, 544970, 548000, 549125 }			--�P�_�O�_����o�L�ӵ��Ū��M�˧ޯ��
	local StringTable = { "[SC_SUITSKILL_START]", "[SC_SUITSKILL_START_65]", "[SC_SUITSKILL_START_65]", "[SC_SUITSKILL_START_65]" }	--��o�M�˧ޯ��ɪ��T��
	for i = 1, #LVTable do
		if PlayerLV >= LVTable[i] and CheckFlag( Player, KeyItemTable[i] ) == false then
			ScriptMessage( Player , Player , 3 , StringTable[i] , 1 )
			WriteRoleValue( Player, EM_RoleValue_SuitSkill_MaxEqSkillCount, (i+1) )
			SetFlag( Player, KeyItemTable[i], 1 )
		end
	end
end
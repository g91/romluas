function AI_MOCA()

	local CheckTime = 10	-- �C��P�_
	local SkillDelay = 2		-- �ޯੵ��ɶ�
	local BuffID = 502851	-- �����O�A
	local SkillID = { 492601, 492602, 492603 }	-- �ۦ�ID	
	-- �T�s����, �B�����Y, �����O�A
	local SkillLV = { 1, 1, 1 }			-- �ۦ�LV
	local SkillSay = { "[SC_101587_01]", "[SC_101587_02]", "[SC_101587_03]" }	-- �ۦ�����
	-- ���I���I�������I
	-- �ޡ�N�R�@�U�A�ЧA�Y���B�I
	-- �s�A�������A�̦n���W�B�_�ӡI

	local FireLuID = 112373
	local FireLu = LuaFunc_SearchNPCbyOrgID( OwnerID() , FireLuID , 1000 )	-- �j�M���l
	--if FireLu ~= -1 then
	--	WriteRoleValue( OwnerID() , EM_RoleValue_PID , FireLu )
	--end

	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�

			if ReadRoleValue( FireLu , EM_RoleValue_PID ) ~= 1 then
				WriteRoleValue( FireLu , EM_RoleValue_PID , 1 )
			end

			local SkillRND =  Rand( 100 )+1	-- ���Ͷü�
			local SkillShow = 1
			local MOCATarget = AttackTarget

			if SkillRND <= 100 and SkillRND > 60 then
				SkillShow = 1
				MOCATarget = AttackTarget		-- ����e�ؼ�
			elseif SkillRND <= 60 and SkillRND > 30 then
				SkillShow = 2
				MOCATarget = HateTargetID()	-- ��������H���@�ӥؼ�
			elseif SkillRND <= 30 and SkillRND > 0 then
				SkillShow = 3
				MOCATarget = HateTargetID()	-- ��������H���@�ӥؼ�
			end

			if CheckBuff( MOCATarget , BuffID ) == false then	-- �����O�A��Q�����u�����C
				Say( OwnerID() , SkillSay[SkillShow] )
				CastSpellLV( OwnerID() , MOCATarget , SkillID[SkillShow] , SkillLV[SkillShow] )
				Sleep( SkillDelay * CheckTime )
			end

		else

			if FireLu ~= -1 then
				if ReadRoleValue( FireLu , EM_RoleValue_PID ) ~= 0 then
					WriteRoleValue( FireLu , EM_RoleValue_PID , 0 )
				end
			end

		end

		Sleep( CheckTime )
	end

end

function AI_MOCA_FIRELU()

	local FireTime = 10 * 12		-- �C12���z�@��
	local BombDistance = 500
	local FireMagicID = 492604		-- ���l�z�o
	local FireMagicLV = 1000
	local FireShow = "[SC_101587_04]"
	-- ��}���l�Q�o���K�A�A����F���K���`�N�I

	SetPlot( OwnerID() , "Range" , "LuaS_MOCA_FIRELU_Range" , 25 )

	while true do

		if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) ~= 0 then
			ScriptMessage( OwnerID() , 0  , 1 , FireShow , C_DEFAULT )
			CastSpellLV( OwnerID() , OwnerID() , FireMagicID , FireMagicLV )
		end

	Sleep( FireTime )

	end

end

function LuaS_MOCA_FIRELU_Range()

	local BuffID = 502853	-- ���l���N
	local BuffLV = 1
	local BuffTime = 10
	local FireShow = "[SC_101587_05]"
	-- �A�Q��}���l�����K�`�N�A�o�ؤ��K�i�H�}�a�����O�A�C

	ScriptMessage( OwnerID() , 0  , 1 , FireShow , C_SYSTEM )
	AddBuff( OwnerID() , BuffID , BuffLV , BuffTime )

end

function LuaS_FireToIce_Do()	-- �}�a�O�A

	local IceBuffID = 502851	-- �����O�A
	local FireBuffID = 502853	-- ���l���N
	local Range = 50		-- �i�H�ѦB���d��
	local HaveNoIce = false	-- �٨S�ѦB�L

	local Player = SearchRangePlayer( OwnerID() , Range )
	for i = 0 , table.getn( Player ) do
		if Player[i] == -1 then 
			break
		end
		if Player[i] ~= OwnerID() then
--			Say( OwnerID() , GetName(Player[i]) )
			if CheckBuff( Player[i] , IceBuffID ) == true then
				CancelBuff( Player[i] , IceBuffID )
				HaveNoIce = true		-- ���ѦB�L�A���X��
			end
		end
	end
	
	if HaveNoIce == true then
		if CheckBuff( OwnerID() , FireBuffID ) == true then
			CancelBuff( OwnerID() , FireBuffID )
			HaveNoIce = false	-- �k�^�X��
		end
	end

end

function LuaS_MOCA_NoIce()	-- �}�a�O�A

	local IceBuffID = 502851	-- �����O�A

	if CheckBuff( OwnerID() , IceBuffID ) == true then
		CancelBuff( OwnerID() , IceBuffID )
	end

end

function AI_MOCA_Hero()

	local CheckTime = 10	-- �C��P�_
	local SkillDelay = 2		-- �ޯੵ��ɶ�
	local BuffID = 502851	-- �����O�A
	local SkillID = { 492601, 492602, 493241}	-- �ۦ�ID	
	-- �T�s����, �B�����Y, �����O�A
	local SkillLV = { 1, 1, 1 }			-- �ۦ�LV
	local SkillSay = { "[SC_101587_01]", "[SC_101587_02]", "[SC_101587_03]" }	-- �ۦ�����
	-- ���I���I�������I
	-- �ޡ�N�R�@�U�A�ЧA�Y���B�I
	-- �s�A�������A�̦n���W�B�_�ӡI

	local FireLuID = 112806
	local FireLu = LuaFunc_SearchNPCbyOrgID( OwnerID() , FireLuID , 1000 )	-- �j�M���l
	--if FireLu ~= -1 then
	--	WriteRoleValue( OwnerID() , EM_RoleValue_PID , FireLu )
	--end

	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�

			if ReadRoleValue( FireLu , EM_RoleValue_PID ) ~= 1 then
				WriteRoleValue( FireLu , EM_RoleValue_PID , 1 )
			end

			local SkillRND =  Rand( 100 )+1	-- ���Ͷü�
			local SkillShow = 1
			local MOCATarget = AttackTarget

			if SkillRND <= 100 and SkillRND > 60 then
				SkillShow = 1
				MOCATarget = AttackTarget		-- ����e�ؼ�
				if CheckBuff( MOCATarget , BuffID ) == false then	-- �����O�A��Q�����u�����C
					Say( OwnerID() , SkillSay[SkillShow] )
					CastSpellLV( OwnerID() , MOCATarget , SkillID[SkillShow] , SkillLV[SkillShow] )
					Sleep( SkillDelay * CheckTime )
				end
			elseif SkillRND <= 60 and SkillRND > 30 then
				SkillShow = 2
				MOCATarget = HateTargetID()	-- ��������H���@�ӥؼ�
				if CheckBuff( MOCATarget , BuffID ) == false then	-- �����O�A��Q�����u�����C
					Say( OwnerID() , SkillSay[SkillShow] )
					CastSpellLV( OwnerID() , MOCATarget , SkillID[SkillShow] , SkillLV[SkillShow] )
					Sleep( SkillDelay * CheckTime )
				end
			elseif SkillRND <= 30 and SkillRND > 0 then
				SkillShow = 3
				local PlayerNum = HateListCount( OwnerID() )
				if PlayerNum >= 2 then
					local HateListRand = HateListRandom( OwnerID() )
					-- �B 2 �ӤH
					if CheckBuff( HateListRand[1], BuffID ) == false then	-- �����O�A��Q�����u�����C
						Say( OwnerID() , SkillSay[SkillShow] )
						if CastSpellLV( OwnerID() , HateListRand[1], SkillID[SkillShow] , SkillLV[SkillShow] ) then
							-- AddBuff( HateListRand[2] , 502851 , 1 , 600 )
							Sleep( SkillDelay * CheckTime )
						end
					end
				else
					MOCATarget = HateTargetID()	-- ��������H���@�ӥؼ�
					if CheckBuff( MOCATarget , BuffID ) == false then	-- �����O�A��Q�����u�����C
						Say( OwnerID() , SkillSay[SkillShow] )
						CastSpellLV( OwnerID() , MOCATarget , SkillID[SkillShow] , SkillLV[SkillShow] )
						Sleep( SkillDelay * CheckTime )
					end
				end
			end

		else

			if FireLu ~= -1 then
				if ReadRoleValue( FireLu , EM_RoleValue_PID ) ~= 0 then
					WriteRoleValue( FireLu , EM_RoleValue_PID , 0 )
				end
			end

		end

		Sleep( CheckTime )
	end

end

function AI_MOCA_FIRELU_Hero()

	local FireTime = 10 * 12		-- �C12���z�@��
	local BombDistance = 500
	local FireMagicID = 493184		-- ���l�z�o�A�N492604�令493184�A�Ϥ��X35�ũM50�Ū����P
	local FireMagicLV = 2000                       --�N�쥻��3000�ק令2000
	local FireShow = "[SC_101587_04]"
	-- ��}���l�Q�o���K�A�A����F���K���`�N�I

	SetPlot( OwnerID() , "Range" , "LuaS_MOCA_FIRELU_Range_Hero" , 25 )

	while true do

		if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) ~= 0 then
			ScriptMessage( OwnerID() , 0  , 1 , FireShow , C_DEFAULT )
			CastSpellLV( OwnerID() , OwnerID() , FireMagicID , FireMagicLV )
		end

	Sleep( FireTime )

	end

end

function LuaS_MOCA_FIRELU_Range_Hero()

	local BuffID = 502853	-- ���l���N
	local BuffLV = 60
	local BuffTime = 10
	local FireShow = "[SC_101587_05]"
	-- �A�Q��}���l�����K�`�N�A�o�ؤ��K�i�H�}�a�����O�A�C

	ScriptMessage( OwnerID() , 0  , 1 , FireShow , C_SYSTEM )
	AddBuff( OwnerID() , BuffID , BuffLV , BuffTime )

end
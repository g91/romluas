--/gm ? createFlag 780995 0 
--/gm ? delflaglist 780995

function FN_ColorWeaveBoss_setbuff(type)	--�缾�a�v�T / type 0 ��� 1 �W�[ 
	local BuffID = 507944
	local BuffX = FN_CountBuffLevel(TargetID(),BuffID)

	CancelBuff(TargetID(),BuffID)
	if type == 0 then
		if BuffX == 0 or  BuffX == -1 then
			SetFlag(TargetID(), 545454, 0)
		else
			AddBuff(TargetID(),BuffID,BuffX-1,-1)
			if (BuffX-1) <= 1 then
				ScriptMessage( TargetID(), TargetID(), 1, "[SC_COLORWEAVE_FN_18]", 0 )
			end
		end

	elseif type == 1 then
		BuffX = BuffX+2
		if BuffX >= 4 then
			AddBuff(TargetID(),BuffID,4,-1)
		else
			AddBuff(TargetID(),BuffID,BuffX,-1)
		end
		CancelBuff( TargetID(), 509861)
	end
end

function FN_ColorWeaveBoss_DMG()	--���a��Boss�ˮ`
	local BuffID = 507945
	local BuffX = FN_CountBuffLevel(TargetID(),BuffID)

	CancelBuff(TargetID(),BuffID)
	if BuffX >= 1 then
		AddBuff(TargetID(),BuffID,BuffX-1,-1)
	else
		AddBuff(TargetID(),BuffID,0,-1)
	end
end

function FN_ColorWeaveBoss_spell_Check()	--�T�{���a���W�֦�Flag�~��L�y���v�T
	if CheckFlag( TargetID(), 545454) == FALSE then
		return FALSE
	end
	return TRUE
end

function FN_ColorWeaveBoss_490577_Check()
	if CheckFlag( TargetID(), 545454) == FALSE  or TargetID() == OwnerID() then
		return FALSE
	end
	return TRUE
end

--============================================
--				Boss AI
--============================================

function FN_ColorWeaveBoss_Main(TrueParty,CurrentParty,source)
	-- EM_RoleValue_Register1	����Boss�bP2�ɬO���O�w�g�Ұʧl����q
	-- EM_RoleValue_Register2	Boss���b�l�����ƶq
	-- EM_RoleValue_Register3	�DNPC ID
	local Boss = OwnerID()
	local NPC = ReadRoleValue( OwnerID(), EM_RoleValue_Register3)
	local timer = 0
	local part = 1
	local CastTime = 0
	local restTime = 10
	local p2Count = 0
	AddBuff( Boss, 502707, 0, -1 )	--�D�԰����^��
	SetModeEx( Boss, EM_SetModeType_Move, false)	--���� false
	SetModeEx( Boss, EM_SetModeType_Strikback, false)	--���� false
	--��set Boss
	local FlagX = GetMoveFlagValue( 780995,0, EM_RoleValue_X )
	local FlagY = GetMoveFlagValue( 780995,0, EM_RoleValue_Y )
	local FlagZ = GetMoveFlagValue( 780995,0, EM_RoleValue_Z )
	local FlagDir = GetMoveFlagValue( 780995,0, EM_RoleValue_Dir )	
	--������P2�n�Ϊ��X�I
	Say(NPC,"[SC_COLORWEAVE_FN_12]")
	Sleep(30)
	--���@�p�q��t
	while true do
		sleep(10)
		timer = timer+1
		if CastTime > 0 then CastTime = CastTime - 1 end
		--
		if timer%40 == 0 then	
			part = 2 
			SetPos( Boss, FlagX, FlagY, FlagZ, FlagDir )
			--�ǰeBoss�줤���I
			for i = 1,table.getn(CurrentParty) do
				ScriptMessage( Boss, CurrentParty[i], 1, "[SC_COLORWEAVE_FN_13]", 0 )
			end
			--ĵ�i���a
--			Say(Boss,"P2")
		end
		--���C40��|�����q�i�JP2
		if ReadRoleValue( Boss, EM_RoleValue_Register1) == 1 and ReadRoleValue( Boss, EM_RoleValue_Register2) == 0 then
			part = 3
--			Say(Boss,"P3")
		end
		--������
		if FN_CountBuffLevel( Boss, 507945) == 0 then
			part = 4
--			Say(Boss,"P4")
		end
		--���P�_Boss�O�_�Q����
		local PlayerAlive = FALSE
		for i = table.getn(CurrentParty), 1, -1 do
			if CheckFlag( CurrentParty[i], 545454) == TRUE then
				PlayerAlive = TRUE
			else
				table.remove(CurrentParty,i)	--�p�G���a���ѴN���X�h�H�K���M�Q���
			end
		end
		if PlayerAlive == FALSE then
			part =5
		end
		--���P�_player�O�_����
		if GetDistance(Boss, NPC) >= 300 then
			part =5
		end
		--���P�_Boss�O�_�Q�Ԩ�
		if part == 1 or part == 2 then
			if timer%15 == 0 then
				local RanX = DW_Rand( table.getn(CurrentParty) )
				local TargetPlayer = CurrentParty[RanX]
				AddBuff(TargetPlayer, 509861, 0, 5)
			end
			if part == 1 then--=====================���`���q=====================
				if timer%13 == 0 or timer%3 then
					local RanX = DW_Rand( table.getn(CurrentParty) )
					local TargetPlayer = CurrentParty[RanX]
					local FloatX = ReadRoleValue( TargetPlayer, EM_RoleValue_X )
					local FloatY = ReadRoleValue( TargetPlayer, EM_RoleValue_Y )
					local FloatZ = ReadRoleValue( TargetPlayer, EM_RoleValue_Z )
					local Dir = ReadRoleValue(TargetPlayer, EM_RoleValue_Dir )
					--��pick random player pos
					if timer%13 == 0 and CastTime == 0 then
						Say(Boss,"[SC_COLORWEAVE_FN_14]")
						SetPos( Boss, FloatX, FloatY, FloatZ, Dir )
						CastTime = 2
						Sleep(5)
						AddBuff( Boss,509692,0,2)
						Sleep(5)
						CastSpell( Boss, Boss, 490574 )
						
					elseif timer%3 == 0 and CastTime == 0 then
						CastSpellPos( Boss, FloatX, FloatY, FloatZ, 490573, 0 )
						CastTime = 1
					end
				end
			elseif part == 2 then--===================�l�����q=======================
				if ReadRoleValue( Boss, EM_RoleValue_Register1) == 0 then
					WriteRoleValue( Boss, EM_RoleValue_Register1, 1 )	--Boss�w�g�ҰʹL�l����q
					--PlayMotion(Boss,ruFUSION_continuous_buff) 
					for i=1,table.getn(source) do
						local X = ReadRoleValue( Boss, EM_RoleValue_Register2)	--Boss���b�l�����ƶq
						WriteRoleValue( Boss, EM_RoleValue_Register2, X+1 )
						WriteRoleValue( source[i], EM_RoleValue_Register2, 0 )
						CastSpell(source[i],Boss,490572)
					end
				end
				if ReadRoleValue( Boss, EM_RoleValue_Register2) == 0 then
					part = 3
				else
					p2Count = p2Count+1
					if p2Count == 3 then
						p2Count = 0
						SysCastSpellLv(Boss,Boss,490575,0)
					end
					--���P�_�O���OP2�ɶ��L�[
					if timer == 70 then
						Say(Boss,"[SC_COLORWEAVE_FN_15]")
						part = 1
						timer = 0
						CancelBuff(Boss,507945)
						AddBuff(Boss,507945,99,-1)
						for y=1,table.getn(source) do
							MagicInterrupt( source[y] )
						end
						WriteRoleValue( Boss, EM_RoleValue_Register1, 0 )
					end
				end
			end
		elseif part == 3 then--================���==========================
			--PlayMotion(Boss,ruFUSION_knockdown_end) 
			restTime = restTime-1
			Say(Boss,"[SC_COLORWEAVE_FN_16] "..restTime.." sec")
			if restTime == 0 then
				Say(Boss,"[SC_COLORWEAVE_FN_17]")
				restTime = 10
				WriteRoleValue( Boss, EM_RoleValue_Register1, 0)
				part = 1
				timer = 0
			end
		elseif part == 4 or part == 5 then--=========�Q���� / player����===============
			for i=1,table.getn(source) do
				DelObj( source[i] )
			end
			--���M�����
			if part == 4 then
				--PlayMotion(Boss,ruFUSION_dead)
				CallPlot( NPC, "FN_ColorWeave_BossDown", TrueParty, Boss)
			else
				SetModeEx( Boss, EM_SetModeType_Fight, false)	--�i��� false
				CallPlot( NPC, "FN_ColorWeave_PlayerDown", TrueParty, Boss)
			end
			--���⪱�a�����b�D�Ԥ�flag����
			for h=1,table.getn(TrueParty) do
				SetFlag( TrueParty[h], 545454, 0)
			end
			--
			return
		end
	end
end

--============================================
--				NPC��ܼ@��
--============================================
function FN_ColorWeave_NPC112456()
	if ReadRoleValue(TargetID(), EM_RoleValue_Register1) == 0 then
		SetSpeakDetail(OwnerID(), "[SC_COLORWEAVE_FN_10]")
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_COLORWEAVE_FN_01]", "FN_ColorWeave_NPC112456_ready", 0 );
	else
		SetSpeakDetail(OwnerID(), "[SC_COLORWEAVE_FN_19]")
	end
end

function FN_ColorWeave_NPC112456_ready()
	SetSpeakDetail(OwnerID(), "[SC_COLORWEAVE_FN_11]")
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_COLORWEAVE_FN_20]", "FN_ColorWeave_BossSummon", 0 )
end

function FN_ColorWeave_BossSummon()
--	Say(OwnerID(),"OwnerID")
--	Say(TargetID(),"TargetID")
	local Boss
	local BossID = 105956
	local SourceID = 112457
	local FlagID = 780995
	local source = {}
	local Party = {}
	--
	local PartyNum = GetPartyID(OwnerID() , -1)	--Ū�����a����H��
	for g=1,PartyNum do
		if CheckFlag(GetPartyID(OwnerID(), g), 545453) == TRUE then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_COLORWEAVE_FN_21]", 0 )
			CloseSpeak(OwnerID())
			return
		end
	end
	if PartyNum < 3 then
		SetSpeakDetail(OwnerID(),"[SC_COLORWEAVE_FN_02]")
		return
	elseif  PartyNum > 6 then
		SetSpeakDetail(OwnerID(),"[SC_COLORWEAVE_FN_03]")
		return
	else
		local TempGroup = SearchRangePlayer( TargetID(), 150 )	
		for k = 1,table.getn(TempGroup) do
			CloseSpeak(TempGroup[k])
		end
		WriteRoleValue(TargetID(), EM_RoleValue_Register1, 1)
		--��������L�H����ܵ����H�Χ���NPC���A
		Boss = Lua_DW_CreateObj( "flag" , BossID , FlagID , 0 , 1 , 1 )
		WriteRoleValue(Boss, EM_RoleValue_Register3, TargetID())
		AddBuff(Boss,507945,99,-1)
		AddBuff(Boss,509863,0,-1)
		--���гy�ó]�wBoss
		for i = 1,5 do	--�����Ҧ���q���
			source[i] = Lua_DW_CreateObj( "flag" , SourceID , FlagID , i , 1 , 1 )
			WriteRoleValue( source[i], EM_RoleValue_Register1, Boss)
			SetPlot( source[i], "touch", "FN_ColorWeave_touch", 40 )
		end
		for j = 1,PartyNum do	--�������a����
			SetFlag( GetPartyID(OwnerID(), j), 545454, 1)
			SetFlag( GetPartyID(OwnerID(), j), 545453, 1)
			AddBuff( GetPartyID(OwnerID(), j), 507944,4,-1)
			table.insert(Party,GetPartyID(OwnerID() , j))
		end
		--
		CallPlot( Boss, "FN_ColorWeaveBoss_Main", Party, Party, source)
	end
end

function FN_ColorWeave_touch()	--�I������ƥ�
	local Boss = ReadRoleValue( TargetID(), EM_RoleValue_Register1 )
	--
	if ReadRoleValue( TargetID(), EM_RoleValue_Register2 ) == 1 or ReadRoleValue( Boss, EM_RoleValue_Register1) == 0 or CheckFlag(OwnerID(), 545454) == FALSE then
		return
	end
	--���ϥιL�F�N������ �S�bP2�]������ ���O�D�Ԫ̤]���i��
	local TempX = ReadRoleValue( Boss, EM_RoleValue_Register2 )	--Boss���b�l�����ƶq
	if TempX == 0 then
		return
	else
		MagicInterrupt( TargetID() )
		WriteRoleValue( Boss, EM_RoleValue_Register2, TempX-1)
		WriteRoleValue( TargetID(), EM_RoleValue_Register2, 1)
	end
end

function FN_ColorWeave_BossDown(party,Boss)
	Say(OwnerID(),"[SC_COLORWEAVE_FN_04]")
	Sleep(15)
	Say(OwnerID(),"[SC_COLORWEAVE_FN_05]")
	Sleep(15)
	Say(OwnerID(),"[SC_COLORWEAVE_FN_06]")
	for i=1,table.getn(party) do
		CancelBuff(party[i],507944)
		GiveBodyItem( party[i], 240503, 1 )
		--�������ٸ� - �a����
		if CountBodyItem(party[i],530671) == 0 then
			GiveBodyItem( party[i], 530671, 1 )
		end
	end
	DelObj(Boss)
	--
	WriteRoleValue(OwnerID(), EM_RoleValue_Register1, 0)
end

function FN_ColorWeave_PlayerDown(party,Boss)
	Say(OwnerID(),"[SC_COLORWEAVE_FN_07]")
	Sleep(15)
	Say(OwnerID(),"[SC_COLORWEAVE_FN_08]")
	Sleep(15)
	Say(OwnerID(),"[SC_COLORWEAVE_FN_09]")
	for i=1,table.getn(party) do
		CancelBuff(party[i],507944)
		GiveBodyItem( party[i], 240504, 1 )
	end
	DelObj(Boss)
	--
	WriteRoleValue(OwnerID(), EM_RoleValue_Register1, 0)
end

--============================================
--				§��
--============================================
function FN_ColorWeave__I240504( Option ) --�D�Ԫ̤p�U
	local PlayerID = OwnerID()
	local PackageID = 209767		
	local NeedSpace = 2
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end

	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 203497 , 10 )
		GiveBodyItem( PlayerID , 203502 , 10 )
	end
end

function FN_ColorWeave__I240503( Option ) --�q�f�D��§��
	local PlayerID = OwnerID()
	local PackageID = 209767		
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end

	elseif ( Option == "USE" ) then
		local RanX = DW_Rand(2)
		if RanX == 1 then GiveBodyItem( PlayerID , 203497 , 10 ) else GiveBodyItem( PlayerID , 203502 , 10 ) end
		local RanY = DW_Rand(3)
		if RanY == 1 then GiveBodyItem( PlayerID , 203878 , 1 ) elseif RanY == 2 then GiveBodyItem( PlayerID , 201086 , 1 ) else GiveBodyItem( PlayerID , 202928 , 1 ) end
		local RanZ = DW_Rand(10)
		if RanZ == 10 then 
			GiveBodyItem( PlayerID , 240505 , 1 )
			--�������ٸ� - �a�����]����
			if CountBodyItem(PlayerID,530715) == 0 then
				GiveBodyItem( PlayerID, 530715, 1 )
			end
		else 
			GiveBodyItem( PlayerID , 202928 , 1 ) 
		end
	end
end
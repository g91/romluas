--Monster = CreateObjByFlag( BronID, Flag , rand((GetMoveFlagCount(Flag)-1)) , 1 )

function Lua_SandKing_deadlog()
	local RoomID = ReadRoleValue ( OwnerID(), EM_RoleValue_RoomID )
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	SandKingSurvive = 0
	DesignLog(OwnerID(),100645,"�F�Ф���..Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	--
	local RoomPlayer = SetSearchAllPlayer(RoomID)
	for i=1,RoomPlayer do
		local searchID = GetSearchResult()
		CancelBuff( searchID , 505339 )
	end
	--
	local SearchMonsterGroup = SearchRangeNPC( OwnerID(), 600 )
	for x=1, table.getn(SearchMonsterGroup) do
		if ReadRoleValue(SearchMonsterGroup[x], EM_RoleValue_OrgID) == 102907 or ReadRoleValue(SearchMonsterGroup[x], EM_RoleValue_OrgID) == 102906 then
			DelObj( SearchMonsterGroup[x])
		end
	end
end

function Lua_SkillAMonster_timer()			--���y�F�R���ۤv��function
	sleep( 460 )
	DelObj( OwnerID() )
end

function Lua_FN_Ai_SandKing_Unit()
	if SandKingSurvive == 0 then
		DelObj(OwnerID())
	else
		AddBuff( OwnerID() , 503060 ,0 ,-1 )				--�������U�F��
	end
end
-----------------------------------�F�Ф�AI�q�o��}�l-----------------------------------��
function Lua_Ai_SandKing()
	SetPlot( OwnerID() , "dead" , "Lua_SandKing_deadlog" , 0 ); --�]�w���`�@��
	if SandKingSurvive == null then
		SandKingSurvive = 0			--�ŧi���`�����ܼ�
	end
	SandKingSurvive = 1
	--
	local RoomID = ReadRoleValue ( OwnerID(), EM_RoleValue_RoomID )
	local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_MaxHP ) 	--�O������HP
	local CountHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )   	--�Ψӭp�����HP
	local DamageCount = 0							--�������˪��q
	local SummonHP = 4000000		--�l�ꪺ���e�A�p�G�Q�n���ܤ�����h�ֶˮ`�N�ۤp�ǡA��o��
--	local HealHP = ReadRoleValue(  OwnerID() , EM_RoleValue_MaxHP ) / 20		--���a���`��Boss�ɦ媺�q
	local HealCheck = FALSE
	local TempUnit				--�p�ǼȦs
	local MonsterID = 102906		--���ͪ��p��
	local MonsterGroup = {}			--�����ͥX�Ӫ��p�Ǫ��}�C
	local JoinFight = FALSE			--�P�w�O�_�i�J�԰�
	--�H�Y�y�F�OSkillA�A�F�Q�u�OSkillB�A�F���OSkillC�A�g�ɬOSkillD
	local SkillAtimer = 7			--�p�ɾ�
	local SkillBtimer = 0			--    ��
	local SkillCtimer = 0			--    ��
	local SkillDtimer = 0			--�p�ɾ�
	local SkillEtimer = 0
	local SkillACD = 7				--�N�o�ɶ�
	local SkillBCD = 30				--    ��
	local SkillCCD = 21				--    ��
	local SkillDCD = 600				--�N�o�ɶ�300
	local SkillECD = 36
	local SkillAID = 494642
	local SkillBID = 494643
	local SkillCID = 494644
	local SkillDID = 505331			--�o�ӬOAddBuff ��g���O�򥻪k�N
	local SkillEID = 506933	
	local SkillAMonsterID = 102907		--�Ψӷ�@SkillA���y�F�I�i���Ǫ�
	local SkillAGroup = {}			--�����ͥX�Ӫ��y�F
	local HatePlayer = {}
	local CheckPlayer = {}
	local TempCheck
	local AttackTarget

	while true do
		AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == TRUE ) then  	-- �ˬd�O�_���}�԰�
			if JoinFight == FALSE then
				HatePlayer = SearchRangePlayer(OwnerID(), 700 )
				JoinFight = TRUE
			end
			--�P�_���a����DEBUFF
			local HateCount = SetSearchAllPlayer(RoomID)
			for i=1,HateCount do
				local searchID = GetSearchResult()

				if ReadRoleValue( searchID , EM_RoleValue_IsDead) == 0 then --�D���`
					if CheckBuff( searchID , 505339 )  == FALSE then
						WriteRoleValue ( searchID , EM_RoleValue_Register10, OwnerID())
						AddBuff( searchID , 505339 ,0 ,-1 )					--�����I�k���F
					end
				elseif ReadRoleValue( searchID , EM_RoleValue_IsDead) == 1 then
					if ReadRoleValue ( searchID , EM_RoleValue_Register10) == OwnerID() then
--						local Heal = ReadRoleValue ( OwnerID(), EM_RoleValue_HP ) + HealHP	--�����ɦ�5%
--						WriteRoleValue ( OwnerID() , EM_RoleValue_HP, Heal)
						WriteRoleValue ( searchID , EM_RoleValue_Register10, 0)
						ScriptMessage( OwnerID() , -1 , 2 ,  "[SC_SANDKING_01]", 1 )
					end
				end
			end

			--�l��F�Ф������ޯ�
			CountHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
			if CountHP < NowHP then --��ܤw�g����
				DamageCount = DamageCount + ( NowHP - CountHP )
				if DamageCount > SummonHP then
					DamageCount = DamageCount - SummonHP
					local TargetPlayer = Lua_RandomPlayerFromHateList(OwnerID(),1) 	--���o����C���H�����aTargetPlayer
					TempUnit = CreateObjbyObj( MonsterID,TargetPlayer[1])	--�bTargetPlayer����гy�F�Ф���
					SetModeEx( TempUnit  , EM_SetModeType_Revive , TRUE )	--�]�w�i����
					SetAttack( TempUnit,TargetPlayer[1])			--�R�O�F�Ф�������TargetPlayer
					table.insert (MonsterGroup,TempUnit)
					ScriptMessage( OwnerID() , -1 , 2 ,  "[SC_SANDKING_02]", 1 )
				end
			end
			NowHP = CountHP
			
			if SkillAtimer >= SkillACD then					--���ˬd�ɶ��A�O�_�n�ϥ��H�Y�y�F�ޯ�
				local TargetPlayer = Lua_RandomPlayerFromHateList(OwnerID(),1)				--���o����C���H�����a��TargetPlayer
				--TempUnit = CreateObjbyObj( SkillAMonsterID,TargetPlayer[1]) 	--�y�X�y�F������
				TempUnit = Lua_DW_CreateObj( "obj" , SkillAMonsterID , TargetPlayer[1] , 0 , 1 )
				SetModeEx( TempUnit , EM_SetModeType_Mark, false )		--�аO
				SetModeEx( TempUnit , EM_SetModeType_HideName, false )	--�W��
				SetModeEx( TempUnit , EM_SetModeType_ShowRoleHead, false )	--�Y����
				SetModeEx( TempUnit , EM_SetModeType_Fight,false)			--���
				AddToPartition( TempUnit,RoomID )
				CastSpell( TempUnit , TempUnit , SkillAID )	--�I�i�k�N
				BeginPlot( TempUnit, "Lua_SkillAMonster_timer", 0 ) 		--�ɶ���R���y�F�ۤv
				table.insert (SkillAGroup,TempUnit)
				SkillAtimer = 0
			elseif SkillBtimer >= SkillBCD then					--���ˬd�ɶ��A�O�_�n�ϥΨF�Q�u�ޯ�
				local TargetPlayer = Lua_RandomPlayerFromHateList(OwnerID(),1)				--���o����C���H�����a��TargetPlayer
				CastSpellLV( OwnerID(), TargetPlayer[1], SkillBID , 1 )				--�I�i�k�N
				SkillBtimer = 0
			elseif SkillCtimer >= SkillCCD then					--���ˬd�ɶ��A�O�_�n�ϥΨF���ޯ�
				local TargetPlayer = Lua_RandomPlayerFromHateList(OwnerID(),3)				--���o����C���H��3���a��TargetPlayer
				for i= 1 ,table.getn(TargetPlayer) do
					SysCastSpellLV( OwnerID(), TargetPlayer[i], SkillCID , 1 )			--�I�i�k�N
				end
				ScriptMessage( OwnerID() , -1 , 2 ,  "[SC_SANDKING_03]", 1 )
				SkillCtimer = 0
			end

			if SkillDtimer >= SkillDCD then					--���ˬd�ɶ��A�O�_�g��
				AddBuff( OwnerID() , 505331 ,0 ,-1 )
				SkillDtimer = 0
				ScriptMessage( OwnerID() , -1 , 2 ,  "[SC_SANDKING_03]", 1 )
			end

			if SkillEtimer >= SkillECD then
				local TargetPlayer = Lua_RandomPlayerFromHateList(OwnerID(),6)				--���o����C���H��6���a��TargetPlayer
				for i= 1 ,table.getn(TargetPlayer) do
					AddBuff(TargetPlayer[i],506933,1,3)		--�I�i�k�N
				end
				SkillEtimer = 0
			end

		else --�p�G�����԰�����
			if JoinFight == TRUE then
				for i=1,table.getn(MonsterGroup)  do 				--�F���Ҧ��l�ꪺ�F�Ф���
					if CheckID(MonsterGroup[i]) == TRUE then
						DelObj( MonsterGroup[i] )
					end
				end
				for i=1,table.getn(SkillAGroup) do 				--�F���Ҧ��y�F
					if CheckID(SkillAGroup[i]) == TRUE then
						DelObj( SkillAGroup[i] )
					end
				end
				JoinFight = FALSE
			end
			--								--�⪱�a���W���I�k���Fdebuff����
			local RoomPlayer = SetSearchAllPlayer(RoomID)
			for i=1,RoomPlayer do
				local searchID = GetSearchResult()
				CancelBuff( searchID , 505339 )
			end
			--
			SkillAtimer = 7							--����k�s���k�s
			SkillBtimer = 0
			SkillCtimer = 0
			SkillDtimer = 0
			SkillEtimer = 0
			DamageCount = 0
			MonsterGroup = {}
			SkillAGroup = {}
			HatePlayer = {}
			NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_MaxHP ) 
		end
	--
	Sleep(10)
	SkillAtimer = SkillAtimer + 1
	SkillBtimer = SkillBtimer + 1
	SkillCtimer = SkillCtimer + 1
	SkillDtimer = SkillDtimer + 1
	SkillEtimer = SkillEtimer + 1
	end
end

---------------------------------------------------------------------
---------------------------------------------------------------------
---------------------------------------------------------------------
function Lua_SandKing_UnitDead()
	SetPlot(OwnerID(),"dead","Lua_SandKing_CreatPortal",0) 
end

function Lua_SandKing_CreatPortal()
	local RoomID = ReadRoleValue ( OwnerID(), EM_RoleValue_RoomID )
	local X = ReadRoleValue ( OwnerID(), EM_RoleValue_X )
	local Y = ReadRoleValue ( OwnerID(), EM_RoleValue_Y )
	local Z = ReadRoleValue ( OwnerID(), EM_RoleValue_Z )
	local Dir = ReadRoleValue ( OwnerID(), EM_RoleValue_Dir )
	local Unit = CreateObjByObj(115747, OwnerID() )
	SetModeEx( Unit , EM_SetModeType_Gravity, false )--���O
	SetModeEx( Unit , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Unit , EM_SetModeType_AlignToSurface, false )--�K�a
	SetModeEx( Unit , EM_SetModeType_Move, false )--����
	SetPos( Unit , X , Y+21 , Z , Dir )
	DelFromPartition(Unit)
	AddToPartition(Unit, RoomID)
	SetPlot(Unit ,"touch","Lua_SandKing_Portal",150) 
	BeginPlot(Unit,"Lua_SandKing_DelPortal",0)
end

function Lua_SandKing_Portal()
	local ZoneID = ReadRoleValue ( OwnerID(), EM_RoleValue_ZoneID )
	if ZoneID == 3 then
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register9, 3)
	else
		WriteRoleValue ( OwnerID() , EM_RoleValue_Register9, 18)
	end
	ChangeZone( OwnerID(), 121 , 0 , -572.3, -96.6, 88.3, 42.5)
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register10, 0)
end

function Lua_SandKing_DelPortal()
	Sleep(36000)
	DelObj(OwnerID())
end

function Lua_SandKing_PortalOut()
	SetPlot(OwnerID() ,"touch","Lua_SandKing_PortalOutEffect",150) 
end

function Lua_SandKing_PortalOutEffect()
	local ZoneID = ReadRoleValue ( OwnerID(), EM_RoleValue_Register9)
	if ZoneID == 3 then
		ChangeZone( OwnerID(), 3 , 0 , 17137.9, 15.0, 12751.3, 89.0)
	else
		ChangeZone( OwnerID(), 18 , 0 , 3014.7, 299.8, 42739.1, 178.7)
	end
end
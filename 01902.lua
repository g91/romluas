
--EM_RoleValue_PID 
--EM_RoleValue_Register1 ���
--EM_RoleValue_Register2 
--EM_RoleValue_Register3 
--EM_RoleValue_Register4 
--EM_RoleValue_Register5 ��
--EM_RoleValue_Register6 ��
--EM_RoleValue_Register7 ��
--EM_RoleValue_Register8 ��
--EM_RoleValue_Register9 

--4 ���F�x ���s  
--5 ���F�x �԰�
--6 ��h���s
--7 ��h�԰�
--8 ���l���s
--9 ���l�԰�
--10 ���l���`
--------------------------------------------------------------��h
function Cang_129_baron_e()

	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local sys = ReadRoleValue(OwnerID() , EM_RoleValue_Register1)
	local fight = 0		--1�N��i�J�԰�
	local CheckTime = 10
	local BossTarget
	local SkillShow
	local countskill = 0
	local skill = 0
	local Doorstart = 0
	local SkillDelay = { 2 , 2 , 3 }	-- �ޯੵ��ɶ�
		--
	local showskill = { 495683, 495671, 495028 }
		--�K�����, �x�Τ���, �x�k�f�P
	local SkillID = { 495650 , 495672 }	-- �ۦ�ID	
		--�C�����, �Q��� 
	local SkillLV = { 4 , 8 }	--�ޯ൥��
		--
	local SkillSay = {"[SC_103941_03]"}	 
	local CountSay = {"[SC_103941_01]"}
	local Saycount = 0
	local Door1, Door2, Door3, Door4
	local skillDot = 0
	while true do
		sleep(10)
----------�ˬd�ϰ줺���S�����a
		local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���{�b�ӰϤ����Ҧ����a
		local ThesePlayer = {}	
		local sway = {}
		for i=1,TempPlayer do
			ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
			if CheckID( ThesePlayer[i] ) == true and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_VOC ) ~= 0 and
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
			--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
				sway[table.getn(sway)+1] = ThesePlayer[i]	--��Jsway��
			end					
		end		
----------�Ӱϰ줺�S�����a�A���歫�m		
		if table.getn(sway) == 0 then
			if res == 0 then				
				SetDefIdleMotion( Door1 , ruFUSION_MIME_IDLE_STAND )
				SetModeEx( Door1  , EM_SetModeType_Obstruct, false )--����	
				SetDefIdleMotion( Door2 , ruFUSION_MIME_IDLE_STAND )
				SetModeEx( Door2  , EM_SetModeType_Obstruct, false )--����
				SetDefIdleMotion( Door3 , ruFUSION_MIME_IDLE_STAND )
				SetModeEx( Door3  , EM_SetModeType_Obstruct, false )--����
				SetDefIdleMotion( Door4 , ruFUSION_MIME_IDLE_STAND )
				SetModeEx( Door4  , EM_SetModeType_Obstruct, false )--����				
				WriteRoleValue( sys ,EM_RoleValue_Register1, 6)				
				res = 1
			end
		end			
----------�԰��}�l		
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) 	
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�
			countskill = countskill + 1
			skill = skill + 1	
			skillDot = skillDot + 1
			fight = 1		
----------�԰��}�l�A�ܤj�B����
			if Doorstart == 0 then	
				--�ܤj
				WriteRoleValue( sys ,EM_RoleValue_Register1, 7)	
				ScriptMessage( OwnerID() , -1 , 2 , CountSay[1], 1 )
				CastSpellLV( OwnerID(), OwnerID() , 495671 , 0 )
				--����
				Door1 = CreateObjByFlag( 104016, 780668, 4, 1)			
				SetModeEX( Door1  , EM_SetModeType_Gravity , false )--���O
				SetModeEx( Door1  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
				SetModeEx( Door1  , EM_SetModeType_Mark, false )--�аO
				SetModeEx( Door1  , EM_SetModeType_Move, false )--����
				SetModeEx( Door1  , EM_SetModeType_Searchenemy, false )--����
				SetModeEx( Door1  , EM_SetModeType_Fight , false )--�i�������
				SetModeEx( Door1  , EM_SetModeType_Strikback, false )--����
				AddToPartition( Door1 , RoomID )
				WriteRoleValue( OwnerID() ,EM_RoleValue_Register5, 	Door1)			
				SetDefIdleMotion( Door1 , ruFUSION_MIME_ACTIVATE_LOOP)
				SetModeEx( Door1 , EM_SetModeType_Obstruct, true )--����
				Door2 = CreateObjByFlag( 104016, 780668, 5, 1)			
				SetModeEX( Door2  , EM_SetModeType_Gravity , false )--���O
				SetModeEx( Door2  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
				SetModeEx( Door2  , EM_SetModeType_Mark, false )--�аO
				SetModeEx( Door2  , EM_SetModeType_Move, false )--����
				SetModeEx( Door2  , EM_SetModeType_Searchenemy, false )--����
				SetModeEx( Door2  , EM_SetModeType_Fight , false )--�i�������
				SetModeEx( Door2  , EM_SetModeType_Strikback, false )--����
				AddToPartition( Door2 , RoomID )
				WriteRoleValue( OwnerID() ,EM_RoleValue_Register6, 	Door2)			
				SetDefIdleMotion( Door2,ruFUSION_MIME_ACTIVATE_LOOP)
				SetModeEx( Door2 , EM_SetModeType_Obstruct, true )--����
				Door3 = CreateObjByFlag( 104016, 780668, 6, 1)			
				SetModeEX( Door3  , EM_SetModeType_Gravity , false )--���O
				SetModeEx( Door3  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
				SetModeEx( Door3  , EM_SetModeType_Mark, false )--�аO
				SetModeEx( Door3  , EM_SetModeType_Move, false )--����
				SetModeEx( Door3  , EM_SetModeType_Searchenemy, false )--����
				SetModeEx( Door3  , EM_SetModeType_Fight , false )--�i�������
				SetModeEx( Door3  , EM_SetModeType_Strikback, false )--����
				AddToPartition( Door3 , RoomID )
				WriteRoleValue( OwnerID() ,EM_RoleValue_Register7, 	Door3)			
				SetDefIdleMotion( Door3,ruFUSION_MIME_ACTIVATE_LOOP)
				SetModeEx( Door3 , EM_SetModeType_Obstruct, true )--����
				Door4 = CreateObjByFlag( 104016, 780668, 7, 1)			
				SetModeEX( Door4  , EM_SetModeType_Gravity , false )--���O
				SetModeEx( Door4  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
				SetModeEx( Door4  , EM_SetModeType_Mark, false )--�аO
				SetModeEx( Door4  , EM_SetModeType_Move, false )--����
				SetModeEx( Door4  , EM_SetModeType_Searchenemy, false )--����
				SetModeEx( Door4  , EM_SetModeType_Fight , false )--�i�������
				SetModeEx( Door4  , EM_SetModeType_Strikback, false )--����
				AddToPartition( Door4 , RoomID )
				WriteRoleValue( OwnerID() ,EM_RoleValue_Register8, 	Door4)			
				SetDefIdleMotion( Door4,ruFUSION_MIME_ACTIVATE_LOOP)
				SetModeEx( Door4 , EM_SetModeType_Obstruct, true )--����	
				Doorstart = 1
			end		
----------�¥��}
			if countskill >= 7 then
				local TempPlayer1 = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���{�b�ӰϤ����Ҧ����a
				local ThesePlayer1 = {}	
				local sway1 = {}
				for i=1,TempPlayer1 do
					ThesePlayer1[i] = GetSearchResult() -- ���Ȧs��
					if CheckID( ThesePlayer1[i] ) == true and 
					ReadRoleValue( ThesePlayer1[i] , EM_RoleValue_IsDead ) == 0 and 
					ReadRoleValue( ThesePlayer1[i] , EM_RoleValue_VOC ) ~= 0 and
					ReadRoleValue( ThesePlayer1[i] , EM_RoleValue_IsPlayer ) == 1 then
					--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
						sway1[table.getn(sway1)+1] = ThesePlayer1[i]	 
					end					
				end	
				--��sawy�p�̭����H���ɭԡA�H�K��@�ӰI�p�����a
				if table.getn(sway1) ~= 0 then
					local anyone = DW_Rand(table.getn(sway1))	--rand
					local MessageString
					local PlayerName = GetName( sway1[anyone] )
					MessageString = "[SC_103941_02][$SETVAR1="..PlayerName.."]" --�bstring���i�H�q�X���a���W�r
					ScriptMessage( OwnerID() , -1 , 2 ,  MessageString, 1 )
					while 	ReadRoleValue( OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
						sleep(3)
					end					
					--��t�k�N���Უ�ͤ@�Ӫk�}
					CastSpellLV( OwnerID(), OwnerID() , 495670 , 0 )
					local NowX = ReadRoleValue( sway1[anyone] , EM_RoleValue_X )
					local NowY = ReadRoleValue( sway1[anyone] , EM_RoleValue_Y )
					local NowZ = ReadRoleValue( sway1[anyone] , EM_RoleValue_Z )
					local NowDir = ReadRoleValue( sway1[anyone] , EM_RoleValue_Dir )			
					local SpellCaster = CreateObj( 103956 , NowX , NowY , NowZ , NowDir , 1 )
					SetModeEx( SpellCaster  , EM_SetModeType_HideName, false )--�W��
					SetModeEX( SpellCaster  , EM_SetModeType_Gravity , false )--���O
					SetModeEx( SpellCaster  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
					SetModeEx( SpellCaster  , EM_SetModeType_Mark, false )--�аO
					SetModeEx( SpellCaster  , EM_SetModeType_Move, false )--����
					SetModeEx( SpellCaster  , EM_SetModeType_NotShowHPMP, true )
					SetModeEx( SpellCaster  , EM_SetModeType_Searchenemy, false )--����
					SetModeEx( SpellCaster  , EM_SetModeType_Fight , false )--�i�������
					SetModeEx( SpellCaster  , EM_SetModeType_Strikback, false )--����	
					AddToPartition( SpellCaster , RoomID )	--�[�i�R�x	
					WriteRoleValue( SpellCaster , EM_RoleValue_PID, OwnerID() )
					BeginPlot( SpellCaster , "Cang_129_b_summomkill_e" , 0)
					countskill = 0
				end	
			end
----------���q�ޯ�I��
			if skillDot >= 15 then
				while 	ReadRoleValue( OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
					sleep(3)
				end		
				CastSpellLV( OwnerID() , OwnerID() , 495135 , 0 )		
				skillDot = 0
			end
			if skill >= 5 then
				local SkillRND = DW_Rand ( 100 ) 
				if SkillRND <= 100 and SkillRND > 75 then 
					SkillShow = 1	--
					BossTarget = OwnerID()					
				elseif SkillRND <= 75 and SkillRND > 50 then 
					SkillShow = 2	--
					BossTarget = AttackTarget						
				elseif SkillRND <= 50 and SkillRND > 25 then 
					SkillShow = 1	--
					BossTarget = OwnerID()										
				elseif SkillRND <= 25 and SkillRND > 0 then 
					SkillShow = 2	--
					BossTarget = AttackTarget				
				end	
				while 	ReadRoleValue( OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
					sleep(3)
				end
				if SkillShow == 1 then
					if Saycount == 0 then
						ScriptMessage( OwnerID() , -1 , 2 , SkillSay[SkillShow], 1 )
						Saycount = 1
					end	
				end	
				CastSpellLV( OwnerID() , BossTarget , SkillID[SkillShow] , SkillLV[SkillShow] )
				Sleep( SkillDelay[SkillShow] * CheckTime )	
				SkillShow = 0
				skill = 0
				Saycount = 0
			end	
		elseif (  AttackTarget == 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�	
			if fight == 1 then
				WriteRoleValue( sys ,EM_RoleValue_Register1, 6)
				SetDefIdleMotion( Door1 , ruFUSION_MIME_IDLE_STAND )
				SetModeEx( Door1  , EM_SetModeType_Obstruct, false )--����
				SetDefIdleMotion( Door2 , ruFUSION_MIME_IDLE_STAND )
				SetModeEx( Door2  , EM_SetModeType_Obstruct, false )--����
				SetDefIdleMotion( Door3 , ruFUSION_MIME_IDLE_STAND )
				SetModeEx( Door3  , EM_SetModeType_Obstruct, false )--����
				SetDefIdleMotion( Door4 , ruFUSION_MIME_IDLE_STAND )
				SetModeEx( Door4  , EM_SetModeType_Obstruct, false )--����				
				fight = 0				
			end
		end
	end
end

--------------------------------------------------------------��h�k�}
function Cang_129_b_summomkill_e()
	AddBuff( OwnerID() , 505675 , 1 , -1 )
	local Baron = ReadRoleValue( OwnerID() , EM_RoleValue_PID )	
	sleep(30)	
	SetPlot( OwnerID(), "range" , "Cang_129_b_s_range_e" ,30 )	
----------�p�G�����}�԰��άO�����`�A�R���ۤv	
	while 1 do
		sleep(10)
----------�j�M55�X�����LNPC, NPC�p�G�O�ۤv, �N�ɦ�
		local NPC = SearchRangeNPC ( OwnerID() , 40 )
		if table.getn( NPC )~= 0 then
			if NPC[0] == Baron then
				ScriptMessage( Baron , -1 , 2 , "[SC_103941_05]", 1 )
				--�����������A�o��ڬO�L�Ī��I
				SysCastSpellLV( Baron , Baron , 495134 , 0 )
				SysCastSpellLV( Baron , Baron , 495683 , 0 )
				sleep(30)
				DelObj( OwnerID() )
				break
			end
		end
		local AttackTarget = ReadRoleValue( Baron , EM_RoleValue_AttackTargetID )		
		if (  AttackTarget == 0 ) and ( CheckID( Baron ) == true ) then  -- �ˬd�O�_���}�԰�
			DelObj( OwnerID() )
		end
		if ReadRoleValue( Baron ,EM_RoleValue_IsDead ) == 1 and ( CheckID( Baron ) == false ) then  -- �ˬd�O�_���}�԰�
			DelObj( OwnerID() )		
		end
	end	
end
--��h���a�P�w
function Cang_129_b_s_range_e()
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) ~= 0 then
		--�p�G���a���k�}, �Wbuff, �M�ᵹ���Wbuff
		local Baron = ReadRoleValue( TargetID() , EM_RoleValue_PID )
		SetPlot( TargetID(), "range" , "" ,55 )
		--CastSpellLV( TargetID(), OwnerID(), 495028 , 0 )
		AddBuff( OwnerID() , 506079 , 0 , 5 )
		AddBuff( OwnerID() , 506088 , 0 , 5 )
		ScriptMessage( baron , -1 , 2 , "[SC_103941_04]", 1 )
		--�A�̪��ϧܳ��O�S���Ϊ��I	
		SysCastSpellLV( Baron , Baron , 495683 , 0 )
		DelObj( TargetID() )
	end	
end

--------------------------------------------------------------���F�x���`
function Cang_129_baron_dead_e()		
	--����
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_103941_06]", 1 )
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local Door1 = ReadRoleValue(OwnerID() , EM_RoleValue_Register5)	
	local Door2 = ReadRoleValue(OwnerID() , EM_RoleValue_Register6)
	local Door3 = ReadRoleValue(OwnerID() , EM_RoleValue_Register7)
	local Door4 = ReadRoleValue(OwnerID() , EM_RoleValue_Register8)	
	local corpse = LuaFunc_CreateObjByObj ( 103935, OwnerID() )
	local sys = ReadRoleValue(OwnerID() , EM_RoleValue_Register1)
	WriteRoleValue( sys ,EM_RoleValue_Register1, 8)	
	
	SetDefIdleMotion( Door1 , ruFUSION_MIME_IDLE_STAND )
	SetModeEx( Door1  , EM_SetModeType_Obstruct, false )--����
	SetDefIdleMotion( Door2 , ruFUSION_MIME_IDLE_STAND )
	SetModeEx( Door2  , EM_SetModeType_Obstruct, false )--����
	SetDefIdleMotion( Door3 , ruFUSION_MIME_IDLE_STAND )
	SetModeEx( Door3  , EM_SetModeType_Obstruct, false )--����
	SetDefIdleMotion( Door4 , ruFUSION_MIME_IDLE_STAND )
	SetModeEx( Door4  , EM_SetModeType_Obstruct, false )--����	
	
	SetModeEX( corpse  , EM_SetModeType_Gravity , false )--���O
	SetModeEx( corpse  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
	SetModeEx( corpse  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( corpse  , EM_SetModeType_Move, false )--����
	SetModeEx( corpse  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( corpse  , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( corpse  , EM_SetModeType_Strikback, false )--����	
	AddToPartition( corpse , RoomID )
	WriteRoleValue( sys ,EM_RoleValue_Register9, corpse)
	BeginPlot( corpse, "Cang_129_baron_corpse_e", 0)
	--SetPlot( corpse, "dead", "Cang_129_baron_corpse", 0) 
	--KillID( corpse, corpse )
	--�_�c
	local Box = CreateObjByFlag( 104051, 780670, 11, 1)	--�_�c
	SetModeEx( Box  , EM_SetModeType_HideName, false )--�W��
	SetModeEx( Box  , EM_SetModeType_ShowRoleHead, false )--���q�Y����	
	SetModeEx( Box  , EM_SetModeType_NotShowHPMP, true )--���					
	SetModeEx( Box   , EM_SetModeType_Move, false )--����
	SetModeEx( Box  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Box  , EM_SetModeType_Strikback, false )--����
	AddToPartition( Box , RoomID )	 
	DelObj( OwnerID() )	
end	

function Cang_129_baron_corpse_e()	
	SetDefIdleMotion( OwnerID() ,ruFUSION_MIME_DEATH_LOOP)	
	AddBuff( OwnerID(), 506760, 0, -1 )
	--return false
end 
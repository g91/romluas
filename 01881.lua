
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
--------------------------------------------------------------���F�x
function Cang_129_oh()

	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local sys = ReadRoleValue(OwnerID() , EM_RoleValue_Register1)
	local fight = 0		--1�N��i�J�԰�
	local CheckTime = 10
	local BossTarget
	local SkillShow
	local countskill = 0
	local skill = 0
	local Doorstart = 0
	local roseskill = 0
	local skill01 = 0
	local skill02 = 0
	local res = 0
	local SkillDelay = { 2 , 2 , 3 }	-- �ޯੵ��ɶ�
		--
	local SkillID = { 495744, 495030 } 
		--�����z�R, ����
	local showskill = { }	-- �ۦ�ID	
		--
	local SkillLV = { 4 , 7 }	--�ޯ൥��
		--
	local SkillSay = {"[SC_103934_03]"}	
	local Saycount = 0
	--�����z�R
	local CountSay = {"[SC_103934_01]"}	
	--�}��
	local Door1, Door2, Door3, Door4
	local any, any1, any2
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
				WriteRoleValue( sys ,EM_RoleValue_Register1, 4)				
				res = 1
			end
		end		
----------�԰��}�l	
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) 	
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�
			skill = skill +1
			roseskill = roseskill +1
			fight = 1
			skill01 = skill01 + 1
			skill02 = skill02 + 1
			if Doorstart == 0 then	
				--�ܤj
				WriteRoleValue( sys ,EM_RoleValue_Register1, 5)
				ScriptMessage( OwnerID() , -1 , 2 , CountSay[1], 1 )
				CastSpellLV( OwnerID(), OwnerID() , 495029 , 0 )			
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
			--������[$VAR1]			
			if roseskill >= 10 then
----------��@���H�����a
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
						sway1[table.getn(sway1)+1] = ThesePlayer1[i]	--��Jsway��
					end					
				end		
----------RAND�@�ӤH�X�ӥ�����		
				if table.getn(sway1) ~= 0 then
					local anyone = DW_Rand(table.getn(sway1))	--rand
					local MessageString
					local PlayerName = GetName( sway1[anyone] )
					MessageString = "[SC_103934_02][$SETVAR1="..PlayerName.."]" --�bstring���i�H�q�X���a���W�r
					ScriptMessage( OwnerID() , -1 , 2 ,  MessageString, 1 )
					while 	ReadRoleValue( OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
						sleep(3)
					end	
					--����
					CastSpellLV( OwnerID(), sway1[anyone], 495025 , 2 )
					roseskill = 0
				end	
			end
			--����
			if skill01 >= 30 then
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_103934_04]", 1 )
				while 	ReadRoleValue( OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
					sleep(3)
				end	
				CastSpellLV( OwnerID(), OwnerID() , 495465 , 2 )				
				local Use = DW_HateRemain(1)     --������H ��0�N�� ���ư��D�Z
				for i = 1, table.getn(Use) do				
					Addbuff( Use[i], 506785, 0, -1)				
				end
				sleep(20)
				while 	ReadRoleValue( OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
					sleep(3)
				end				
				CastSpellLV( OwnerID(), OwnerID() , 495026 , 2 )
				sleep(20)
				skill01 = 0
			end
			if skill02 >= 20 then
				local SkillRND = DW_Rand ( 2 )
				if SkillRND == 1 then		
					--�Ĥ@��rand
					local Use = DW_HateRemain(0)     			--������H ��0�N�� ���ư��D�Z
					local Use1 = {}		
					local Use2 = {}
					any = DW_Rand(table.getn(Use))		--rand Use
					Addbuff( Use[any], 506961, 0, 10)
					--�ĤG��rand
					for i = 1 , table.getn(Use) do				--use���X�ӤH���X��		
						if Use[i] ~= Use[any] then				--i������any1
							Use1[table.getn(Use1)+1] = Use[i]	--��Juse1
						end
					end
					if table.getn(Use1) ~= 0 then				--use1����0���ɭ�
						any1 = DW_Rand(table.getn(Use1))	--rand any2�X��
						if Use1[any1] ~= nil then				--������nil���ɭ԰���
							Addbuff( Use1[any1], 506961, 0, 10)
							sleep(10)
						end		
					--�ĤT��rand	
						for j = 1 , table.getn(Use1) do				--use1���X�ӤH���X��	
							if Use1[j] ~= Use1[any1] then			--i������any2
								Use2[table.getn(Use2)+1] = Use1[j]	--��Juse2
							end
						end	
						if table.getn(Use2) ~= 0 then				--use2����0���ɭ�	
							any2 = DW_Rand(table.getn(Use2))	--rand any3�X��	
							if Use2[any2] ~= nil then				--������nil���ɭ԰���
								Addbuff( Use2[any2], 506961, 0, 10)
								--CastSpellLV( OwnerID() , Use[any] , 495456 , 0 )
								--CastSpellLV( OwnerID() , Use1[any1] , 495456 , 0 )
								--CastSpellLV( OwnerID() , Use2[any2] , 495456 , 0 )
								sleep(10)
							end	
						end		
					end		
					local control = Lua_DW_CreateObj( "obj" , 103956 , OwnerID() , 0)	
					SetModeEx( control  , EM_SetModeType_NotShowHPMP, true )--���					
					SetModeEX( control  , EM_SetModeType_Gravity , false )--���O
					SetModeEx( control  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
					SetModeEx( control  , EM_SetModeType_Mark, false )--�аO
					SetModeEx( control  , EM_SetModeType_Move, false )--����
					SetModeEx( control  , EM_SetModeType_Searchenemy, false )--����
					SetModeEx( control  , EM_SetModeType_Fight , false )--�i�������
					SetModeEx( control  , EM_SetModeType_Strikback, false )--����
					AddToPartition( control , RoomID )	
					WriteRoleValue( control , EM_RoleValue_Livetime, 13 )		
					BeginPlot( control, "Cang_129_oh_buffskill_in" , 0 )
					skill02 = 0
				elseif SkillRND == 2 then
					--�Ĥ@��rand
					local Use = DW_HateRemain(0)				--������H ��0�N�� ���ư��D�Z
					local Use1 = {}		
					local Use2 = {}
					any = DW_Rand(table.getn(Use))		--rand Use
					Addbuff( Use[any], 506962, 0, 10)
					--SysCastSpellLV( OwnerID() , Use[any] , 495457 , 0 )
					--�ĤG��rand
					for i = 1 , table.getn(Use) do				--use���X�ӤH���X��		
						if Use[i] ~= Use[any] then				--i������any1
							Use1[table.getn(Use1)+1] = Use[i]	--��Juse1
						end
					end
					if table.getn(Use1) ~= 0 then				--use1����0���ɭ�
						any1 = DW_Rand(table.getn(Use1))	--rand any2�X��
						if Use1[any1] ~= nil then				--������nil���ɭ԰���
							Addbuff( Use1[any1], 506962, 0, 10)
							--SysCastSpellLV( OwnerID() , Use1[any1] , 495457 , 0 )
							sleep(10)
						end	
					--�ĤT��rand	
						for j = 1 , table.getn(Use1) do				--use1���X�ӤH���X��	
							if Use1[j] ~= Use1[any1] then			--i������any2
								Use2[table.getn(Use2)+1] = Use1[j]	--��Juse2
							end
						end	
						if table.getn(Use2) ~= 0 then				--use2����0���ɭ�	
							any2 = DW_Rand(table.getn(Use2))	--rand any3�X��	
							if Use2[any2] ~= nil then				--������nil���ɭ԰���
								Addbuff( Use2[any2], 506962, 0, 10)
								--CastSpellLV( OwnerID() , Use[any] , 495457 , 0 )
								--CastSpellLV( OwnerID() , Use1[any1] , 495457 , 0 )
								--CastSpellLV( OwnerID() , Use2[any2] , 495457 , 0 )
								sleep(10)
							end	
						end		
					end		
					local control = Lua_DW_CreateObj( "obj" , 103956 , OwnerID() , 0)
					SetModeEx( control  , EM_SetModeType_NotShowHPMP, true )--���
					SetModeEX( control  , EM_SetModeType_Gravity , false )--���O
					SetModeEx( control  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
					SetModeEx( control  , EM_SetModeType_Mark, false )--�аO
					SetModeEx( control  , EM_SetModeType_Move, false )--����
					SetModeEx( control  , EM_SetModeType_Searchenemy, false )--����
					SetModeEx( control  , EM_SetModeType_Fight , false )--�i�������
					SetModeEx( control  , EM_SetModeType_Strikback, false )--����
					AddToPartition( control , RoomID )		
					WriteRoleValue( control , EM_RoleValue_Livetime, 13 )
					BeginPlot( control, "Cang_129_oh_buffskill_out" , 0 )	
					skill02 = 0
				end							
			end
----------���q�ޯ�
			if skill >= 7 then
				local SkillRND = DW_Rand ( 100 ) 
				if SkillRND <= 100 and SkillRND > 65 then 
					SkillShow = 1	--
					BossTarget = OwnerID()					
				elseif SkillRND <= 65 and SkillRND > 0 then 
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
				Saycount =  0
			end
		elseif (  AttackTarget == 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�
			if fight == 1 then
				WriteRoleValue( sys ,EM_RoleValue_Register1, 4)
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

--------------------------------------------------------------���F�x�y��ޯ�
function Cang_129_oh_skill()
	BeginPlot( TargetID() , "Cang_129_oh_skill_do" , 0)
end

function Cang_129_oh_skill_do()

	while true do
		sleep(10)
		--���T�{���a�O���O���`�Ϊ̤��s�b
		if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead) == 1 or 
		ReadRoleValue( OwnerID() , EM_RoleValue_IsPlayer) == 0 then
			break
		end
		--�˹�a���W���S�����obuff
		if CheckBuff( OwnerID() , 506086 ) == false then
			break
		end
		--�p�G���a����q�j��άO���󺡦媺�ɭ�, �M��buff���
		if ReadRoleValue( OwnerID() , EM_RoleValue_HP) >= ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP ) then
			CancelBuff_NoEvent( OwnerID() , 506086 )
			break
		end
	end	
end

--------------------------------------------------------------���F�x���`
function Cang_129_oh_dead()	
	--����		
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_103934_05]", 1 )

	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local sys = ReadRoleValue(OwnerID() , EM_RoleValue_Register1)
	WriteRoleValue( sys ,EM_RoleValue_Register1, 6)
	
	local Door1 = ReadRoleValue(OwnerID() , EM_RoleValue_Register5)	
	local Door2 = ReadRoleValue(OwnerID() , EM_RoleValue_Register6)
	local Door3 = ReadRoleValue(OwnerID() , EM_RoleValue_Register7)
	local Door4 = ReadRoleValue(OwnerID() , EM_RoleValue_Register8)		
	SetDefIdleMotion( Door1 , ruFUSION_MIME_IDLE_STAND )
	SetModeEx( Door1  , EM_SetModeType_Obstruct, false )--����
	SetDefIdleMotion( Door2 , ruFUSION_MIME_IDLE_STAND )
	SetModeEx( Door2  , EM_SetModeType_Obstruct, false )--����
	SetDefIdleMotion( Door3 , ruFUSION_MIME_IDLE_STAND )
	SetModeEx( Door3  , EM_SetModeType_Obstruct, false )--����
	SetDefIdleMotion( Door4 , ruFUSION_MIME_IDLE_STAND )
	SetModeEx( Door4  , EM_SetModeType_Obstruct, false )--����	
	
	local corpse = LuaFunc_CreateObjByObj ( 103934, OwnerID() )
	SetModeEX( corpse  , EM_SetModeType_Gravity , false )--���O
	SetModeEx( corpse  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
	SetModeEx( corpse  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( corpse  , EM_SetModeType_Move, false )--����
	SetModeEx( corpse  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( corpse  , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( corpse  , EM_SetModeType_Strikback, false )--����	
	AddToPartition( corpse , RoomID )
	WriteRoleValue( sys ,EM_RoleValue_Register8, corpse)
	BeginPlot( corpse, "Cang_129_oh_corpse", 0)
	--SetPlot( corpse, "dead", "Cang_129_oh_corpse", 0) 
	--KillID( corpse, corpse )
	--�_�c
	local Box = CreateObjByFlag( 103957, 780670, 10, 1)	--�_�c
	SetModeEx( Box  , EM_SetModeType_HideName, false )--�W��
	SetModeEx( Box  , EM_SetModeType_ShowRoleHead, false )--���q�Y����	
	SetModeEx( Box  , EM_SetModeType_NotShowHPMP, true )--���					
	SetModeEx( Box   , EM_SetModeType_Move, false )--����
	SetModeEx( Box  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Box  , EM_SetModeType_Strikback, false )--����
	AddToPartition( Box , RoomID )	
	DelObj( OwnerID() )	
end	
--------------------------------------------------------------���F�x���`����
function Cang_129_oh_corpse()	
	SetDefIdleMotion( OwnerID() ,ruFUSION_MIME_DEATH_LOOP)	
	AddBuff( OwnerID(), 506760, 0, -1 )
end 

--------------------------------------------------------------�n�a��BUFF
function Cang_129_oh_buffskill_in()

	while true do 
		sleep(10)
		local buf = {}
		local player = SearchRangeplayer ( OwnerID() , 1000 )		--�j�M���h�֤H
		if table.getn( player )~= 0 then
			for i = 0, table.getn(player) do
				if CheckID( player[i] ) == true and 							--����
				ReadRoleValue( player[i] , EM_RoleValue_IsDead ) == 0 and 		--�S��
				ReadRoleValue( player[i] , EM_RoleValue_VOC ) ~= 0 and			--���OGM
				ReadRoleValue( player[i] , EM_RoleValue_IsPlayer ) == 1 and	--�O�ӤH
				CheckBuff( player[i] , 506961) == true then				--�ˬd���S��111111
					buf[table.getn(buf)+1] = player[i] 					--��J���X	
				end	
			end	
			--Say( OwnerID(), "buf="..table.getn(buf))
			if table.getn(buf) >= 3 then					--�p�G���X�z�����T�ӤH
				if GetDistance( Buf[1], Buf[2]) <= 25 and	--�ˬd�Z��
				GetDistance( Buf[2], Buf[3]) <= 25 and		
				GetDistance( Buf[1], Buf[3]) <= 25 then
					CancelBuff( Buf[1] , 506961 )
					CancelBuff( Buf[2] , 506961 )
					CancelBuff( Buf[3] , 506961 )
					DelObj( OwnerID())
					break
				end	
			end	
		end	
	end		
end			
--------------------------------------------------------------�n���}��BUFF			
function Cang_129_oh_buffskill_out()
	
	while true do 
		sleep(10)
		local buf = {}
		local player = SearchRangeplayer ( OwnerID() , 1000 )
		if table.getn( player )~= 0 then
			for i = 0, table.getn( player ) do
				if CheckID( player[i] ) == true and 
				ReadRoleValue( player[i] , EM_RoleValue_IsDead ) == 0 and 
				ReadRoleValue( player[i] , EM_RoleValue_VOC ) ~= 0 and
				ReadRoleValue( player[i] , EM_RoleValue_IsPlayer ) == 1 and
				CheckBuff( player[i] , 506962) == true then
					buf[table.getn(buf)+1] = player[i]
				end	
			end		
			--Say( OwnerID(), "buf="..table.getn(buf))
			if table.getn(buf) >= 3 then
				if GetDistance( Buf[1], Buf[2]) > 100 and
				GetDistance( Buf[2], Buf[3]) > 100 and
				GetDistance( Buf[1], Buf[3]) > 100 then
					CancelBuff( Buf[1] , 506962 )
					CancelBuff( Buf[2] , 506962 )
					CancelBuff( Buf[3] , 506962 )	
					DelObj( OwnerID())
					break
				end
			end	
		end	
	end		
end			
	
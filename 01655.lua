
function Lua_cang_banalloz_skill_M1() --�Ĥ@���q�ޯ�
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Opener = ReadRoleValue(OwnerID() , EM_RoleValue_PID )
	local Buff01 = 505081
	local Buff02 = 505082	
	local Buff03 = 505083
	local Fire = {}
	local NowX, NowY, NowZ, NowDir
	local countfire = 0
	local PPL = {}
	local countcharge = 0
	local count1 = 0
	local count2 = 0
	local count_fire = 0
	
	while true do
	sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�
			countcharge = countcharge + 1
			count1 = count1 + 1
			if CheckBuff (OwnerID() , Buff01 ) == true then
				if count1 == 7 then
					CastSpellLV( OwnerID(), AttackTarget, 494481, 1)
					count1 = 0
				end	
				--��\�i
				--������ ���u�ˮ`�L�k�Ө�
			elseif CheckBuff (OwnerID() , Buff02 ) == true then
				if count2 == 0 then
					AddBuff(OwnerID(), 505090, 1 , -1)
					local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���{�b�ӰϤ����Ҧ����a
					local ThesePlayer = {}
					local OT = {}
					for i=1,TempPlayer do
						ThesePlayer[i] = GetSearchResult() -- ���Ȧs��			
						if CheckID( ThesePlayer[i] ) == true and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 then--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
							if	ReadRoleValue( ThesePlayer[i] , EM_RoleValue_VOC ) ~= 1 and
								ReadRoleValue( ThesePlayer[i] , EM_RoleValue_VOC ) ~= 3 and
								ReadRoleValue( ThesePlayer[i] , EM_RoleValue_VOC ) ~= 6 and
								ReadRoleValue( ThesePlayer[i] , EM_RoleValue_VOC ) ~= 2 and
								ReadRoleValue( ThesePlayer[i] , EM_RoleValue_VOC ) ~= 7 then
								local voc = ReadRoleValue( ThesePlayer[i] , EM_RoleValue_VOC )
								OT[table.getn(OT)+1] = ThesePlayer[i]	
							end--��JUseful�̭�
						end					
					end
					for i = 1, table.getn(OT) do
						Addbuff(OT[i] , 505092, 0 , 15)
					end
					count2 = 1
				end
				--�ϼu
				--�W�[����
			elseif CheckBuff (OwnerID() , Buff03 ) == true then
				if countcharge >= 5 then
					local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���{�b�ӰϤ����Ҧ����a
					local ThesePlayer = {}
					local sway = {}
					for i=1,TempPlayer do
						ThesePlayer[i] = GetSearchResult() -- ���Ȧs��			
						if CheckID( ThesePlayer[i] ) == true and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_VOC ) ~= 0 and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
							if  ThesePlayer[i] ~= AttackTarget then
								sway[table.getn(sway)+1] = ThesePlayer[i]	
							end--��JUseful�̭�
						end					
					end	
					if table.getn(sway) ~= 0 then	
						local anyone = Rand(table.getn(sway))+1	--rand
						CastSpellLV( OwnerID(), sway[anyone], 494485, 1)
					elseif table.getn(sway) == 0 then
						CastSpellLV( OwnerID(), AttackTarget, 494485, 1)
					end
					countcharge = 0
				end
				if count_fire == 0 then
					BeginPlot(OwnerID(), "Lua_cang_banalloz_fire", 10)
					count_fire = 1
				end
				--�ļ�
				--�P������
				--�g�L�����W�]���� ������10��
			end
		elseif (  AttackTarget == 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�
			WriteRoleValue( Opener, EM_RoleValue_Register4, 1)			
		end	
	end
end

function Lua_cang_banalloz_skill_M3() --�ĤT���q�ޯ�
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Opener = ReadRoleValue(OwnerID() , EM_RoleValue_PID )
	local Castime = 0
	local Skillball
	local Mode1 = 504827
	local Mode2 = 504828
	local Mode3 = 504829
	local Tornado 
	local SkillID = {494652, 494653, 494654, 494655, 494656}
	local SkillLV = {0,3,0,0,3}
	local SkillDelay = {10,20,10,20,20}
	local SkillShow = 0
	local count = 0
	local count1 = 0
	local SkillRND = 0
	local BossTarget
	local count2 = 0
	
 	
	while true do
	sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�
			Castime = Castime + 1
			count = count + 1 
			Tornado = ReadRoleValue(OwnerID(), EM_RoleValue_Register2)
			if Castime >= 15 then
				Skillball = star_CreateObj_NoAdd(OwnerID() , 102881,0,200,0, RoomID , 180)
				SetModeEX( Skillball   , EM_SetModeType_Gravity , false )--���O
				SetModeEx( Skillball   , EM_SetModeType_Fight , false )--�i�������
				SetModeEx( Skillball   , EM_SetModeType_Strikback, false )--����
				SetModeEx( Skillball   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
				SetModeEx( Skillball   , EM_SetModeType_Mark, false )--�аO
				SetModeEx( Skillball   , EM_SetModeType_Move, false )--����
				SetModeEx( Skillball   , EM_SetModeType_Searchenemy, false )--����
				SetModeEx( Skillball   , EM_SetModeType_ShowRoleHead, false )--�Y����
				SetModeEx( Skillball   , EM_SetModeType_HideName, false )--�W��
				AddToPartition(Skillball , RoomID )				
				WriteRoleValue(Skillball, EM_RoleValue_Livetime,15)
				ScriptMessage(OwnerID() , -1 , 2 ,  "[SC_102721_7]", 1 )
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
					sleep(3)
				end				
				CastSpellLV(OwnerID(), OwnerID(), 494657, 1)
				CastSpellLV(Skillball, OwnerID(), 494320, 1)				
				BeginPlot( Tornado,"Lua_cang_banalloz_Tornado" ,0)
				sleep(50)
				Castime = 0
			end
			if CheckBuff (OwnerID() , Mode1 ) == true then 
				if count == 7 then
					CastSpellLV( OwnerID() , OwnerID() , SkillID[5] , SkillLV[5] )
					Sleep( SkillDelay[5])
					count = 0					
				end
			elseif CheckBuff (OwnerID() , Mode2 ) == true then	
				if count2 == 5 then 
					local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���{�b�ӰϤ����Ҧ����a
					local ThesePlayer = {}
					local sway = {}
					for i=1,TempPlayer do
						ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
						if CheckID( ThesePlayer[i] ) == true and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_VOC ) ~= 0 and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
							sway[table.getn(sway)+1] = ThesePlayer[i]	--��JUseful�̭� 
						end					
						if table.getn(sway) ~= 0 then
							anyone = Rand(table.getn(sway))+1
							CastSpellLV( OwnerID() , sway[anyone] , SkillID[1] , SkillLV[1] )
							Sleep( SkillDelay[1])
						end
					end
					count2 = 0
				end	
				if count == 7 then
					CastSpellLV( OwnerID() , OwnerID() , SkillID[2] , SkillLV[2] )
					Sleep( SkillDelay[2])								
					count = 0
				end							
			elseif CheckBuff (OwnerID() , Mode3 ) == true then	
				if count == 7 then
					SkillRND = Rand( 100 )+1	-- ���Ͷü�					
					if SkillRND <= 100 and SkillRND > 50 then
						CastSpellLV( OwnerID() , AttackTarget , SkillID[3] , SkillLV[3] )
						Sleep( SkillDelay[3])
					elseif SkillRND <= 50 and SkillRND > 0 then
						CastSpellLV( OwnerID() , OwnerID() , SkillID[4] , SkillLV[4] )
						Sleep( SkillDelay[4])
					end
					count = 0					
				end
			end	
		elseif (  AttackTarget == 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�
			WriteRoleValue( Opener, EM_RoleValue_Register4, 1)			
		end	
		count1 = 0
	end
end

function Lua_cang_banalloz_W1() --�C
	local count = 0
	local count1 = 0
	while true do
		sleep(10)	
		local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
		local BossTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  BossTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�
			count = count + 1
			count1 = count1 + 1
			if count == 5 then
				CastSpellLV(OwnerID(), OwnerID(), 494315, 1)
				Sleep(20)
				count = 0
			end
			--if count1 == 7 then 
			--	CastSpellLV(OwnerID(), AttackTarget, 494651, 1)
			--	count1 = 0
			--end
		elseif (  AttackTarget == 0 ) and ( CheckID( OwnerID() ) == true ) then
			local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���{�b�ӰϤ����Ҧ����a
			local ThesePlayer = {}
			local sway = {}
			for i=1,TempPlayer do
				ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
				if CheckID( ThesePlayer[i] ) == true and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_VOC ) ~= 0 and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
					sway[table.getn(sway)+1] = ThesePlayer[i]	--��JUseful�̭� 
				end					
			end
			if table.getn(sway) ~= 0 then
				anyone = Rand(table.getn(sway))+1
				SetAttack(OwnerID(), sway[anyone] )
			elseif table.getn(sway) == 0 then
				DelObj(OwnerID())
			end
		end	
	end	
end

function Lua_cang_banalloz_W2() --�l
	local count = 0
	while true do
		sleep(10)	
		local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
		local BossTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )	--��ؼЭ�
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )		
		if (  BossTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�
			count = count + 1
			if count == 5 then
				CastSpellLV(OwnerID(), OwnerID(), 494314, 1)
				Sleep(20)
				count = 0
			end				
		elseif (  AttackTarget == 0 ) and ( CheckID( OwnerID() ) == true ) then
			local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���{�b�ӰϤ����Ҧ����a
			local ThesePlayer = {}
			local sway = {}
			for i=1,TempPlayer do
				ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
				if CheckID( ThesePlayer[i] ) == true and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_VOC ) ~= 0 and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
					sway[table.getn(sway)+1] = ThesePlayer[i]	--��JUseful�̭� 
				end					
			end	
			if table.getn(sway) ~= 0 then
				anyone = Rand(table.getn(sway))+1
				SetAttack(OwnerID(), sway[anyone] )
			elseif table.getn(sway) == 0 then
				DelObj(OwnerID())
			end
		end	
	end	
end

function Lua_cang_banalloz_W3()	--��
	local count = 0
	while true do
		sleep(10)	
		local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
		local BossTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )	--��ؼЭ�
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )	
		if (  BossTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�
			count = count + 1
			if count == 5 then
				CastSpellLV(OwnerID(), OwnerID(), 494313, 1)
				Sleep(20)
				count = 0
			end	
		elseif (  AttackTarget == 0 ) and ( CheckID( OwnerID() ) == true ) then
			local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���{�b�ӰϤ����Ҧ����a
			local ThesePlayer = {}
			local sway = {}
			for i=1,TempPlayer do
				ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
				if CheckID( ThesePlayer[i] ) == true and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_VOC ) ~= 0 and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
					sway[table.getn(sway)+1] = ThesePlayer[i]	--��JUseful�̭� 
				end					
			end	
			if table.getn(sway) ~= 0 then
				anyone = Rand(table.getn(sway))+1
				SetAttack(OwnerID(), sway[anyone] )
			elseif table.getn(sway) == 0 then
				DelObj(OwnerID())
			end
		end	
	end	
end

function Lua_cang_banalloz_fire() --mode���K
	local countfire = 0
	local NowX, NowY, NowZ, NowDir
	local Fire = {}
	local RoomID = ReadRoleValue(OwnerID() ,EM_RoleValue_RoomID)
	while 1 do 
		sleep(5)
		countfire = countfire + 1
		NowX=ReadRoleValue(OwnerID() ,EM_RoleValue_X)
		NowY=ReadRoleValue(OwnerID() ,EM_RoleValue_Y)
		NowZ=ReadRoleValue(OwnerID() ,EM_RoleValue_Z)
		NowDir=ReadRoleValue(OwnerID() ,EM_RoleValue_Dir)
		Fire[countfire]=CreateObj(102737,NowX,NowY,NowZ,NowDir,1)--�C����h�@�Ӥ��y
		SetModeEx( Fire[countfire] , EM_SetModeType_Show, true)--�q�X
		SetModeEx( Fire[countfire] , EM_SetModeType_Mark, false)--�аO
		SetModeEx( Fire[countfire] , EM_SetModeType_Strikback, false)--����
		SetModeEx( Fire[countfire] , EM_SetModeType_Move, false)--����	
		SetModeEx( Fire[countfire] , EM_SetModeType_Fight, false)--�i���
		SetModeEx( Fire[countfire] , EM_SetModeType_SearchenemyIgnore, false)--���󤣷|�Q�j�M
		SetModeEx( Fire[countfire] , EM_SetModeType_HideName, false)		--�����Y�W�O�_��ܦW��
		SetModeEx( Fire[countfire] , EM_SetModeType_HideMinimap, false)	--����O�_�b�p�a�ϤW���
		SetModeEx( Fire[countfire] , EM_SetModeType_Searchenemy, false)	--���
		AddToPartition( Fire[countfire] , RoomID )
		AddBuff(Fire[countfire],504853,1,600)--------------��a���
		WriteRoleValue(Fire[countfire], EM_RoleValue_Livetime,5)	--�s�b�ɶ�livetime
		if countfire == 25 then
			return
		end	
	end
end	

function Lua_cang_banalloz_door_open()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Door1 = CreateObjByFlag( 102808 , 780485 , 7 , 1 )	
	SetModeEX( Door1  , EM_SetModeType_Gravity , false )--���O
	SetModeEx( Door1  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
	SetModeEx( Door1  , EM_SetModeType_Obstruct, true )--����
	SetModeEx( Door1  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Door1  , EM_SetModeType_Move, false )--����
	SetModeEx( Door1  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Door1   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Door1   , EM_SetModeType_Strikback, false )--����	
	AddToPartition( Door1 , RoomID )--�[�i�R�x
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register1, Door1)
	local Door2 = CreateObjByFlag( 102808 , 780485 , 8 , 1 )
	SetModeEX( Door2  , EM_SetModeType_Gravity , false )--���O
	SetModeEx( Door2  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
	SetModeEx( Door2  , EM_SetModeType_Obstruct, true )--����
	SetModeEx( Door2  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Door2  , EM_SetModeType_Move, false )--����
	SetModeEx( Door2  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Door2  , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Door2  , EM_SetModeType_Strikback, false )--����	
	AddToPartition( Door2 , RoomID )--�[�i�R�x	
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register2, Door2)
	SetDefIdleMotion( Door1,ruFUSION_MIME_ACTIVATE_LOOP)------�_��
	SetDefIdleMotion( Door2,ruFUSION_MIME_ACTIVATE_LOOP)------�_��
end

function Lua_cang_banalloz_door_close()
	local Door1 =ReadRoleValue(OwnerID() ,EM_RoleValue_Register1)
	local Door2 =ReadRoleValue(OwnerID() ,EM_RoleValue_Register2)
	DelObj(Door1)
	DelObj(Door2)
end	


function Lua_cang_banalloz_restart()	--���ͭp�ƾ�
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)--���y�W����	
	local Start	= 0
	local Dead = 0
	local CountDead = 0
	local loot
	local count_door = 0
	local opener = CreateObjByFlag( 102881, 780485, 4, 1)	--�۴�	
	SetModeEx( opener   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( opener   , EM_SetModeType_Strikback, false )--����
	SetModeEx( opener   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( opener   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( opener   , EM_SetModeType_Move, false )--����
	SetModeEx( opener   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( opener   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( opener   , EM_SetModeType_HideName, false )--�W��
	AddToPartition( opener , RoomID )	--�[�i�R�x	
	SetPlot( opener, "range" , "Lua_cang_banalloz_open" ,200 )	
	WriteRoleValue( opener ,EM_RoleValue_PID, OwnerID())
	
	local Door = CreateObjByFlag( 102925 , 780485 , 6 , 1 )
	SetModeEX( Door  , EM_SetModeType_Gravity , false )--���O
	SetModeEx( Door  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
	SetModeEx( Door  , EM_SetModeType_Obstruct, true )--����
	SetModeEx( Door  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Door  , EM_SetModeType_Move, false )--����
	SetModeEx( Door  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Door   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Door   , EM_SetModeType_Strikback, false )--����	
	AddToPartition( Door , RoomID )	--�[�i�R�x
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register3, Door)
	
	local Boss = CreateObjByFlag( 102704, 780485, 4, 1)	--�۴�	
	AddToPartition( Boss , RoomID )	--�[�i�R�x	
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register1, Boss )--�Ȧs�@��BOSS
	WriteRoleValue( Boss ,EM_RoleValue_PID, OwnerID() )--�Ȧs�@��BOSS	
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register2, 2)	

	while true do
		sleep(10)
		Start = ReadRoleValue( OwnerID() , EM_RoleValue_Register2 )
		Dead = ReadRoleValue( OwnerID() , EM_RoleValue_Register5 )
		if Start == 1 then
			ScriptMessage( Boss , -1 , 2 ,  "[SC_102721_6]", 1 )
			--local show = CreateObjByFlag( 102881, 780485, 4, 1)			
			--SetModeEX( show  , EM_SetModeType_Gravity , false )--���O
			--SetModeEx( show  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
			--SetModeEx( show  , EM_SetModeType_Obstruct, true )--����
			--SetModeEx( show  , EM_SetModeType_Mark, false )--�аO
			--SetModeEx( show  , EM_SetModeType_Move, false )--����
			--SetModeEx( show  , EM_SetModeType_Searchenemy, false )--����
			--SetModeEx( show  , EM_SetModeType_Fight , false )--�i�������
			--SetModeEx( show  , EM_SetModeType_Strikback, false )--����				
			--AddToPartition( show , RoomID )			
			local show1 = CreateObjByFlag( 102881, 780485, 9, 1)			
			SetModeEX( show1  , EM_SetModeType_Gravity , false )--���O
			SetModeEx( show1  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
			SetModeEx( show1  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
			SetModeEx( show1  , EM_SetModeType_Obstruct, true )--����
			SetModeEx( show1  , EM_SetModeType_Mark, false )--�аO
			SetModeEx( show1  , EM_SetModeType_Move, false )--����
			SetModeEx( show1  , EM_SetModeType_Searchenemy, false )--����
			SetModeEx( show1  , EM_SetModeType_Fight , false )--�i�������
			SetModeEx( show1  , EM_SetModeType_Strikback, false )--����				
			AddToPartition( show1 , RoomID )			
			--CastSpellLV(show, show, 494319 , 1 )
			CastSpellLV(show1, show1, 494319 , 1 )		
			if count_door == 0 then
				BeginPlot(Door , "Lua_cang_banalloz_door_open", 0)				
				count_door = 1
			end				
			local PPL = SetSearchAllPlayer(RoomID)					
			local ID = {}
			for i = 1 , PPL , 1 do ---�⪱�a��J�ж��� 
				ID[i] = GetSearchResult() -- ���Ȧs��
				if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) ~= 1 and GetDistance( ID[i] , Boss ) > 10 and GetDistance( ID[i] , Boss ) < 1000 
					and ReadRoleValue( ID[i], EM_RoleValue_VOC) ~= 0  and ReadRoleValue( ID[i] , EM_RoleValue_RoomID  ) == RoomID then
					SetPosByFlag( ID[i] , 780485 , 9 ) --�Ԩ�X�Ц�l
				end
			end		
			Sleep(30)			
			BeginPlot( OwnerID(), "Lua_cang_banalloz_time" , 0)
			BeginPlot( OwnerID(), "Lua_cang_banalloz" , 20)
			SetPlot( Boss,"dead", "Lua_cang_banalloz_Boss_dead" ,0 )			
			--DelObj(show)
			DelObj(show1)
			WriteRoleValue( OwnerID() ,EM_RoleValue_Register2, 2)	
		end
		if Dead == 1 then
			if CountDead == 0 then
				BeginPlot(Door , "Lua_cang_banalloz_door_close", 0)
				ScriptMessage( OwnerID() , -1 , 2 ,  "[SC_102721_9]", 1 )
				sleep(50)
				DelObj(Door)
				loot = CreateObjByFlag( 102944, 780485, 4, 1)	--�_�c
				AddToPartition( loot , RoomID )	--�԰��S�x 
				SetFightMode(loot, 0, 0, 0, 0)
				sleep(50)
				DelObj(OwnerID())
			end	
		end
	end
end

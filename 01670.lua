
function Lua_cang_naouls_pillarcheck()	--���ͬW�l
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	if ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID) == 122 then
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 1 )	
		return false
	end	
end

function Lua_cang_naouls_pillar()	--���ͬW�l
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local pillar = LuaFunc_CreateObjByObj ( 114331, OwnerID() )	--�۴�	
	
	AddToPartition( pillar , RoomID )	--�[�i�R�x
	SetModeEx( pillar , EM_SetModeType_Strikback, false) ---����
	SetModeEx( pillar , EM_SetModeType_Move, false) ---����	
	SetModeEx( pillar , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( pillar , EM_SetModeType_Searchenemy, false )--����
	WriteRoleValue( pillar ,EM_RoleValue_Livetime,30)	
	SetPlot( pillar, "touch" , "Lua_cang_naouls_touch" ,50 )
	BeginPlot( pillar, "Lua_cang_naouls_1_start", 1)
end	

function Lua_cang_naouls_1_start()	--�Q�I�|������o��
	local start
	local Buff1 = 505608 --�O�ƥ�
	while true do
		sleep(10)
		start = ReadRoleValue( OwnerID() ,EM_RoleValue_Register1)
		if start >= 4 then
			SetPlot( OwnerID(), "touch" , "" ,0 )
			AddBuff( OwnerID() , Buff1 , 0 , -1 )
			break
		end
	end
end	

function Lua_cang_naouls_touch()	--���Ilua
	local start
	local Buff1 = 505607--�O�ƥ�	
	if CheckBuff ( OwnerID() , Buff1 ) == false then
		start = ReadRoleValue( TargetID() ,EM_RoleValue_Register1)
		start = start + 1
		WriteRoleValue( TargetID() ,EM_RoleValue_Register1, start)
		AddBuff( OwnerID() , Buff1 , 0 , 10 )
	end	
end

function Lua_cang_naouls_search()	--search
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local pillars = {}
	local pillars2 = {}
	local pillars3 = {}
	local Buff1 = 505608
	local N1X, N2X, N3X, N4X, N5X, NowX
	local N1Y, N2Y, N3Y, N4Y, N5Y
	local N1Z, N2Z, N3Z, N4Z, N5Z, NowZ, NowY, NowDir	
	local count = 0
	local count1 = 0
	local Boss = 0
	local range = 0
	local point 
	local close = 0

	while true do
		sleep(10)
		close =  ReadRoleValue( OwnerID() , EM_RoleValue_Register9 )
		Boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
		--Say(OwnerID(), "c="..close)
		--Say(OwnerID(), "co="..count)
		--if close == 0 then
		if count == 0 then 
			pillars = {}
			pillars2 = {}
			pillars = SearchRangeNPC( OwnerID() , 300 )
			--Say(OwnerID(), "p="..table.getn(pillars))
			if table.getn(pillars) >= 4 then
				for i=0, table.getn(pillars) do 
					if CheckBuff (pillars[i] , Buff1 ) == true then
						pillars2[table.getn(pillars2)+1] = pillars[i]
					end					
				end
				--count1 = 1
			end	
		end
		--Say(OwnerID(), "p2="..table.getn(pillars2))
		if table.getn(pillars2) == 2 then
			count = 1
			N1X = ReadRoleValue( pillars2[1] , EM_RoleValue_X )
			N1Z = ReadRoleValue( pillars2[1] , EM_RoleValue_Z )
			N2X = ReadRoleValue( pillars2[2] , EM_RoleValue_X )
			N2Z = ReadRoleValue( pillars2[2] , EM_RoleValue_Z )
			N1Y = ReadRoleValue( pillars2[1] , EM_RoleValue_Z )
			N2Y = ReadRoleValue( pillars2[2] , EM_RoleValue_Z )
			NowDir = ReadRoleValue( pillars2[1] , EM_RoleValue_Dir )
			if N1X > N2X then
				N3X = N2X - N1X
				N4X = N3X/2 
				N5X = N2X - N4X				
				range = range - N3X
			elseif N2X > N1X then
				N3X = N1X - N2X
				N4X = N3X/2
				N5X = N1X - N4X	
				range = range - N3X	
			end	
			if N1Z > N2Z then
				N3Z = N1Z - N2Z 
				N4Z = N3Z/2 
				N5Z = N1Z - N4Z 
			elseif N2Z > N1Z then
				N3Z = N2Z - N1Z
				N4Z = N3Z/2
				N5Z = N2Z - N4Z
			end		
			if range <= 100 then
				if count == 1 then
					CastSpellLV( pillars2[1], pillars2[2], 494874, 1)
					--Say(OwnerID(), "Do")
					point = CreateObj( 103040 , N5X , 454 , N5Z , NowDir , 1 )
					SetModeEx( point , EM_SetModeType_Strikback, false) ---����
					SetModeEx( point , EM_SetModeType_Move, false) ---����	
					SetModeEx( point , EM_SetModeType_Fight, false) ---�i���
					SetModeEx( point , EM_SetModeType_Searchenemy, false )--����
					SetModeEx( point , EM_SetModeType_ShowRoleHead, false )--���q�Y����
					SetModeEx( point , EM_SetModeType_Mark, false )--�аO
					SetModeEX( point  , EM_SetModeType_Gravity , false )--���O
					AddToPartition( point , RoomID )	--�[�i�R�x
					BeginPlot( point, "Lua_cang_naouls_falldown", 1)
					WriteRoleValue( point ,EM_RoleValue_Livetime,10)
					WriteRoleValue( point ,EM_RoleValue_Register1, Boss)
					WriteRoleValue( point ,EM_RoleValue_Register4, pillars2[1])
					WriteRoleValue( point ,EM_RoleValue_Register5, pillars2[2])
					WriteRoleValue( point ,EM_RoleValue_Register2, OwnerID())	
					count = 2
				end	
				range = 0
				count = 0
				N1X = 0 
				N2X = 0 
				N3X = 0 
				N4X = 0 
				N5X = 0 
				N1Z = 0 
				N2Z = 0 
				N3Z = 0 
				N4Z = 0 
				N5Z = 0 
			elseif range > 100 then
				count = 0
				range = 0
				N1X = 0 
				N2X = 0 
				N3X = 0 
				N4X = 0 
				N5X = 0 
				N1Z = 0 
				N2Z = 0 
				N3Z = 0 
				N4Z = 0 
				N5Z = 0				
			end	
			if table.getn(pillars2) < 2 then
				DelObj( point )
				count = 0
			end
			if close == 1 then
				DelObj( point )
				--DelObj( pillars2[1] )
				--DelObj( pillars2[2] )
				pillars = {}
				pillars2 = {}			
				count = 0
				range = 0
				close = 0
				WriteRoleValue( OwnerID() ,EM_RoleValue_Register9, 0)				
				N1X = 0 
				N2X = 0 
				N3X = 0 
				N4X = 0 
				N5X = 0 
				N1Z = 0 
				N2Z = 0 
				N3Z = 0 
				N4Z = 0 
				N5Z = 0 
			end	
		end	
	end
end	
	
function Lua_cang_naouls_falldown()

	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
	local search = ReadRoleValue( OwnerID() , EM_RoleValue_Register2 )
	local count = 0
	local T1 = ReadRoleValue( OwnerID() , EM_RoleValue_Register4 )
	local T2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register5 )	

	while true do
		sleep(10)
		if CheckID( T1 ) == false or CheckID( T2 ) == false then
			DelObj(OwnerID())
		end
		if GetDistance( OwnerID(), Boss ) <= 45 then
			if CheckBuff ( Boss , 505609 ) == true then
				WriteRoleValue( search ,EM_RoleValue_Register9, 1)
				WriteRoleValue( Boss ,EM_RoleValue_Register9, 1)
				sleep(10)	
				DelObj(OwnerID())
			end	
		end	
	end
end
	
function Lua_cang_naouls_boss()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Reset = 0
	local search
	local close 
	local NowX, NowY, NowZ, NowDir, NowHP
	local HT
	local count = 0
	local count1 = 0
	local count2 = 0
	local countclose = 0
	local Door, Door1
	local SkillShow = 0
	local Skill = {494875,494876}
	local SkillDely = { 20, 20 }
	local SkillLv = {1,2}
	local BossTarget
	local Skillcount = 0
	local Skillcount1 = 0
	local TempPlayer
	local ThesePlayer = {}
	local sway = {}
	local SkillRND
	--local crazecount = 0
	local count3 = 0
	local count4 = 0
	local countbuff = 0
	local timer
	
	Door = CreateObjByFlag( 102925 , 780522 , 1 , 1 )
	AddToPartition( Door , RoomID )
	SetModeEX( Door  , EM_SetModeType_Gravity , false )--���O
	SetModeEx( Door  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
	SetModeEx( Door  , EM_SetModeType_Obstruct, true )--����
	SetModeEx( Door  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Door  , EM_SetModeType_Move, false )--����
	SetModeEx( Door  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Door  , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Door  , EM_SetModeType_Strikback, false )--����					
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register3, Door)
	SetPlot( OwnerID() , "dead" , "Lua_cang_naouls_Dead" , 10 )
	
	while true do
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )--��ؼЭ�
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�
			close = ReadRoleValue( OwnerID() , EM_RoleValue_Register9 )
			Reset = 1
			count2 = count2 + 1
			Skillcount = Skillcount + 1
			Skillcount1 = Skillcount1 + 1
			--crazecount = crazecount + 1
			count = 0
			--Say(OwnerID(), "c="..count2)
			if countclose == 0 then--����
				ScriptMessage( OwnerID() , -1 , 2 ,"[SC_102701_1]", 1 )
				AddBuff(OwnerID(), 505769, 0 , -1 )--���q�ޯ�
				Door1 = CreateObjByFlag( 102808 , 780522 , 2 , 1 )				
				SetModeEX( Door1  , EM_SetModeType_Gravity , false )--���O
				SetModeEx( Door1  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
				SetModeEx( Door1  , EM_SetModeType_Obstruct, true )--����
				SetModeEx( Door1  , EM_SetModeType_Mark, false )--�аO
				SetModeEx( Door1  , EM_SetModeType_Move, false )--����
				SetModeEx( Door1  , EM_SetModeType_Searchenemy, false )--����
				SetModeEx( Door1  , EM_SetModeType_Fight , false )--�i�������
				SetModeEx( Door1  , EM_SetModeType_Strikback, false )--����
				AddToPartition( Door1 , RoomID )--�[�i�R�x
				WriteRoleValue( OwnerID() ,EM_RoleValue_Register4, Door1)
				SetDefIdleMotion( Door1,ruFUSION_MIME_ACTIVATE_LOOP)------�_��
				search = CreateObjByFlag( 103040 , 780522 , 0 , 1 )	
				SetModeEx( search , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( search , EM_SetModeType_ShowRoleHead, false )--���q�Y����
				SetModeEx( search , EM_SetModeType_Mark, false )--�аO
				SetModeEx( search , EM_SetModeType_Strikback, false) ---����
				SetModeEx( search , EM_SetModeType_Move, false) ---����	
				SetModeEx( search , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( search , EM_SetModeType_Searchenemy, false )--����
				SetModeEX( search , EM_SetModeType_Gravity , false )--���O				
				AddToPartition( search , RoomID )	--�[�i�R�x
				WriteRoleValue( search ,EM_RoleValue_Register1, OwnerID())
				WriteRoleValue( OwnerID() ,EM_RoleValue_Register8, search)	
				BeginPlot( search, "Lua_cang_naouls_search", 1)			
				timer = CreateObjByFlag( 103040 , 780522 , 0 , 1 )	
				SetModeEx( timer , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( timer , EM_SetModeType_ShowRoleHead, false )--���q�Y����
				SetModeEx( timer , EM_SetModeType_Mark, false )--�аO
				SetModeEx( timer , EM_SetModeType_Strikback, false) ---����
				SetModeEx( timer , EM_SetModeType_Move, false) ---����	
				SetModeEx( timer , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( timer , EM_SetModeType_Searchenemy, false )--����
				SetModeEX( timer , EM_SetModeType_Gravity , false )--���O				
				AddToPartition( timer , RoomID )	--�[�i�R�x
				WriteRoleValue( timer ,EM_RoleValue_Register1, OwnerID())
				BeginPlot( timer, "Lua_cnag_naouls_timer", 1)	
				local PPL = SetSearchAllPlayer(RoomID)					
				local ID = {}
				for i = 1 , PPL , 1 do ---�⪱�a��J�ж��� 
					ID[i] = GetSearchResult() -- ���Ȧs��
					if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) ~= 1 and 
					GetDistance( ID[i] , OwnerID() ) > 100 and
					ReadRoleValue( ID[i], EM_RoleValue_VOC) ~= 0 and 
					ReadRoleValue( ID[i] , EM_RoleValue_RoomID  ) == RoomID then 
					SetPosByFlag( ID[i] , 780522 , 3 ) --�Ԩ�X�Ц�l
					end
				end	
				countclose = 1
			end			
			if close == 1 then	--�^��
				SetModeEx( OwnerID() , EM_SetModeType_Move, false )
				CancelBuff( OwnerID() , 505609 )--�ۭ�
				--AddBuff(OwnerID(), 505612, 1 , 10)--�^��
				sleep(10)	
				ScriptMessage( OwnerID() , -1 , 2 ,  "[SC_102701_6]", 1 )
				CastSpellLV( OwnerID(), OwnerID(), 494873, 0)
				SetModeEx( OwnerID() , EM_SetModeType_DisableAction, true )
				AddBuff( OwnerID() , 505612 , 0 , 20 )
				sleep(120)
				SetModeEx( OwnerID() , EM_SetModeType_DisableAction, false )				
				CastSpellLV( OwnerID(), OwnerID(), 494872, 1)
				sleep(40)
				SetModeEx( OwnerID() , EM_SetModeType_Move, true )
				CancelBuff( OwnerID() , 505612 )
				sleep(10)	
				sway = {}
				close = 0
				Skillcount = 0
				Skillcount1 = 0
				WriteRoleValue( OwnerID() ,EM_RoleValue_Register9, 0)
				AddBuff( OwnerID() , 505769 , 0 , -1 )--���q�ޯ�
			end		
			if CheckBuff( OwnerID(),505609 ) == false then--�ۭ�
				if CheckBuff( OwnerID(),505612 ) == false then--�^��
					AddBuff( OwnerID() , 505769 , 0 , -1 )--���q�ޯ�
				elseif CheckBuff( OwnerID(),505612 ) == true then--�^��
					CancelBuff( OwnerID() , 505769 )
					Skillcount = 0
					Skillcount1 = 0					
				end	
			elseif CheckBuff( OwnerID(),505609 ) == true then--�ۭ�	
				CancelBuff( OwnerID() , 505769 )
				count2 = 0
				Skillcount = 0
				Skillcount1 = 0					
			end
			if count2 >= 23 then
				if count3 == 0 then
					while ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
					sleep(3)
					end	
					Say(OwnerID(), "[SC_102701_7]")
					ScriptMessage( OwnerID() , -1 , 2 ,  "[SC_102701_7]", 1 )
					count3 = 1
				end	
			end	
			if count2 >= 30 then
				CancelBuff( OwnerID() , 505769 )--���q�ޯ�
				if count == 0 then
					TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) 
					--���{�b�ӰϤ����Ҧ����a
					sway = {}
					for i=1,TempPlayer do
						ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
						if CheckID( ThesePlayer[i] ) == true and 
						ReadRoleValue( ThesePlayer[i] , EM_RoleValue_VOC ) ~= 0 and 
						ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 then
						--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
							sway[table.getn(sway)+1] = ThesePlayer[i]	--��JUseful�̭� 
						end
					end	
					--Say(OwnerID(), "sway="..table.getn(sway))
					if countbuff == 0 then
						local anyone = Rand(table.getn(sway))+1
						--Say(OwnerID(), "sway"..sway[anyone])
						Addbuff( sway[anyone], 505614, 1 , 15)
						SysCastSpellLV( sway[anyone], OwnerID(), 494877, 1)	
						SetAttack(OwnerID(), sway[anyone] )	
						countbuff = 1
					end	
					while ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
						sleep(3)
					end	
					ScriptMessage( OwnerID() , -1 , 2 ,  "[SC_102701_4]", 1 )
					CastSpellLV( OwnerID(), OwnerID(), 494871, 1)					
					--Addbuff( OwnerID(), 505609, 1 , 10)--�ۭ�
					countbuff = 0
					count = 1
					count2 = 0
					Skillcount = 0
					Skillcount1 = 0
					count3 = 0
				end
			end		
			if CheckBuff( OwnerID(),505769 ) == true then--���q�ޯ�
				if Skillcount >= 5 then
					while ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
						sleep(3)
					end	
					ScriptMessage( OwnerID() , -1 , 2 ,  "[SC_102701_2]", 1 )	
					CastSpellLV( OwnerID(), AttackTarget, Skill[2], SkillLv[2])
					Sleep(SkillDely[2])
					Skillcount = 0
				elseif Skillcount1 >= 10 then
					while ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) ~= 0   do
					sleep(3)
					end
					ScriptMessage( OwnerID() , -1 , 2 ,  "[SC_102701_3]", 1 )
					CastSpellLV( OwnerID(), OwnerID(), Skill[1], SkillLv[1])
					Sleep(SkillDely[1])
					Skillcount1 = 0
				end		
			end	
		elseif (  AttackTarget == 0 ) and ( CheckID( OwnerID() ) == true ) then	--���}�԰�
			if Reset == 1 then
				crazecount = 0
				Skillcount = 0
				Skillcount1 = 0
				sleep(20)
				SetPosByFlag( OwnerID() , 780522 , 0 ) 
				Addbuff(OwnerID(), 505611, 1, -1)
				SetModeEx( OwnerID()  , EM_SetModeType_ShowRoleHead, false )
				SetModeEx( OwnerID()  , EM_SetModeType_Mark, false )
				local Boss = LuaFunc_CreateObjByObj ( 102701, OwnerID() )	--�۴�	
				AddToPartition( Boss , RoomID )	--�[�i�R�x
				BeginPlot( Boss, "Lua_cang_naouls_boss", 1)	
				sleep(50)
				DelObj(Door)
				DelObj(Door1)
				DelObj(search)
				DelObj(OwnerID())
			end	
		end
	end
end

function Lua_cang_naouls_Dead()
	local Door = ReadRoleValue( OwnerID() , EM_RoleValue_Register3 )
	local Door1 = ReadRoleValue( OwnerID() , EM_RoleValue_Register4 )
	local RoomID = ReadRoleValue( OwnerID(),EM_RoleValue_RoomID )
	DelObj(Door)
	DelObj(Door1)
	local Boss = LuaFunc_CreateObjByObj ( 103040, OwnerID() )--�۴�	
	SetModeEX( Boss  , EM_SetModeType_Gravity , false )--���O
	SetModeEx( Boss  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
	SetModeEx( Boss  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Boss  , EM_SetModeType_Move, false )--����
	SetModeEx( Boss  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Boss   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Boss   , EM_SetModeType_Strikback, false )--����	
	AddToPartition( Boss , RoomID )	
	ScriptMessage( Boss , -1 , 2 ,  "[SC_102701_5]", 1 )
	
	local PPL = SetSearchAllPlayer(RoomID)
	for i = 1 , PPL , 1 do 
		local ID = GetSearchResult()
		if ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0 and 
		ReadRoleValue( ID , EM_RoleValue_RoomID  ) == RoomID then 
			SetFlag( ID, 543619, 1 )
		end
	end		
	Sleep(50)
	DelObj(Boss)
end

function Lua_cnag_naouls_timer()
	
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
	local count = 0
	local crazecount = 0
	
	while true do
		sleep(10)
		crazecount = crazecount + 1
		if crazecount >= 600 then
			if count == 0 then
				Addbuff( Boss, 505616, 1 , -1)--�g��
				count = 1
			end	
		end	
	end	
end	

function Lua_cang_naouls_hate()

	local hate = {}
	hate = star_HateListSort(OwnerID())

	SetAttack(OwnerID(), hate[1] )	
-- 	Say(OwnerID(), Getname(hate[1]))

end



















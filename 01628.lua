-------���b�}�Ǩ��W----------------------------------------------------------
function Lua_apon_102683_Jailer()
	while 1 do
		sleep(10)
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID )---�D�k����GID
		local AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
		if CheckBuff(OwnerID() , 504676) == true then ---�i�J�����n�X������t
			sleep(10)
			ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_11]" , 1 )----�b�c�Ф��ǥX�@�}�s�z�_�F���n��
			local SK = star_CreateObj( OwnerID() , 102894 , 0 , 0 , 0 , roomid1 , 0)
			SetModeEx(SK , EM_SetModeType_Strikback , false )--����
			SetModeEx(SK , EM_SetModeType_Searchenemy , false )--����
			SetModeEx( SK , EM_SetModeType_Fight, false) ----�i�������
			SetModeEx( SK , EM_SetModeType_Mark, false) ----�аO
			SetModeEx( SK , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
			SetModeEx( SK , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
			SetModeEx( SK , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
			SetModeEx( SK , EM_SetModeType_Gravity, false) ----���O
			SetModeEx( SK , EM_SetModeType_ShowRoleHead, false) ----������Y����
			SetModeEx( SK , EM_SetModeType_AlignToSurface, false) ----�K����
			SetModeEx( SK , EM_SetModeType_Move, false) ----����
			Hide(OwnerID())
			AddBuff (SK , 505142 , 0 , 200)---�N�C�@�ӯS�Ĳy�W�@�Ӥ����n�X�����S��
			sleep(10)
			local BK = star_CreateObj( SK , 102918 , 0 , 0 , 0 , roomid1 , 0)
			WriteRoleValue( BK, EM_RoleValue_PID, Boss)
			BeginPlot(BK,"LuaS_Discowood_CheckPeace",0) ---���}�԰���|�۰ʮ��� 
			SetAttack( BK , AttackTarget )
			SetFightMode ( BK,0, 0, 0,0 )
			sleep(20)
			SetFightMode ( BK,1, 1, 1,1 )
			SetAttack( BK , AttackTarget )
			Delobj(SK)
			Delobj(OwnerID())
		end
	end
end

------------------------�P�_�D��¾�A��SP or MP �M��-----------------------------------------------------------------------------------------------------

function Lua_apon_Zone120_buff_0() ----�P�_�O�_��MP
	local Job = ReadRoleValue( TargetID() , EM_RoleValue_VOC )
	local Job_sub = ReadRoleValue( TargetID() , EM_RoleValue_VOC_SUB )
	
	if Job == 1 or Job_sub == 1 then
		AddBuff (TargetID() , 505145 , 0 , 90)--���ԤhSP
	end
	
	if Job == 2 or Job_sub == 2 then 
		AddBuff (TargetID() , 505146 , 0 , 90)--���C�LSP
	end
	
	if Job == 3 or Job_sub == 3 then 
		AddBuff (TargetID() , 505147 , 0 , 90)--���v���SP
	end
	
	if Job == 4 or Job == 5 or Job == 6 or Job == 7 or Job == 8	
	or Job_sub == 4 or Job_sub == 5 or Job_sub == 6 or Job_sub == 7 or Job_sub == 8 then
		AddBuff (TargetID() , 505144 , 0 , 90)--��MP
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------�z�z�D--------------------------------------------------------------------------------
function Lau_apon_102917_Bomb_1()
	while 1 do 
		sleep(10)
		if CheckBuff(OwnerID() , 505225) == true then
			sleep(5)
			CastSpellLV( OwnerID() , OwnerID() , 494553 ,1)	
			PlayMotionEX(OwnerID() , ruFUSION_ACTORSTATE_DYING , ruFUSION_ACTORSTATE_DEAD)
			sleep(10)
			Delobj( OwnerID() )
		end
	end
end


--------------------------�D�k������������----------------------------------------------------------
--------�n�A�W�[�ޯ�M�C�j 10 �� �A ��X�T���D
function Lua_apon_102918_1()
	SetPlot( OwnerID(),"dead","Lua_apon_102918_2",10 )
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local counter_p2_1 = 0
	local counter_p2_2 = 0
	local counter_p2_3 = 0
	local Rand_X
	local Rand_Z
	local SP = 0---���z�z�D���q
	local SP_all = {} ---�x�s�Ҧ����z�z�D
	local Check_SP_Num ---�T�{���W���h�ְ��z�z�D
	local PPLX = 0
	while 1 do 
		local Skill = {494594, 494596,494597 } ---�ޯ��A����ˮ`�B����AE�B�Ť����y�N
		local SkillLv = {0 , 0 , 0 , 0 ,}  ---�ޯ൥��
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if HateListCount( OwnerID() ) ~= 0 then
		--if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then
			counter_p2_1 = counter_p2_1 + 1 ---���q�ۦ�_1 and 2
			counter_p2_2 = counter_p2_2 + 1 ---���q�ۦ�_1 and 2
			counter_p2_3 = counter_p2_3 + 1 ----���q�ۦ�_3 
			
			if table.getn(SP_all) >= 1 then
				for i = 1 , table.getn(SP_all), 1 do ---���s�p����W���h�ֹڹҤ�
					if SP_all[i] ~= nil and CheckID(SP_all[i]) == false then
						table.remove ( SP_all , i)
					end	
				end
			end
			
			Check_SP_Num = table.getn(SP_all)
			
			if counter_p2_1 >= 5 and Check_SP_Num <= 10 then
				Rand_X = Rand(20)
				Rand_Z = Rand(20)
				local snake = star_CreateObj( OwnerID() , 102917 , Rand_X , 20 , Rand_Z , roomid1 , 0) ---��X�z�z�D
				BeginPlot(snake,"LuaS_Discowood_CheckPeace",0) ---�S���i�J�԰��h�|����
				SetPlot(snake , "range" ,"Lau_apon_102917_Bomb_1" , 40)
				table.insert( SP_all , snake )
				table.getn(SP_all)
				counter_p2_1 = 0
			end
					
			if counter_p2_2 >= 7 then
				Luck = Rand( 100 )--�����X�ۥ�
				if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then ---����ˮ`
					SkillIndex = 1
					Skill_lv_Index = 1
					BossTarget = AttackTarget
					--Say(OwnerID() , "Skill__1")
				elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 100) then ----AE �ˮ`	
					SkillIndex = 2
					Skill_lv_Index = 1
					BossTarget = OwnerID()	
					--Say(OwnerID() , "Skill__2")
				end		
				--ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
				--Yell( OwnerID() , SkillString[SkillIndex] , 5)
				CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[Skill_lv_Index] )					
				sleep(10)
				counter_p2_2 = 0
						
			elseif counter_p2_3 >= 9 then 
				Luck = Rand( 100 )--�����X�ۥ�
				if (Luck >= 0 and Luck < 25) or (Luck >= 70 and Luck < 99) then
					SkillIndex = 3
					Skill_lv_Index = 1
					BossTarget = HateTargetID()
				end	
				local Ball = star_CreateObj( BossTarget , 102924 , 0 , 150 , 0 , roomid1 , 0) ---�ͥX�@�ӯS�Ĳy
				-------------�S�Ĳy�M��-----------------------------------------------------------------------------------------------------------------
				SetModeEx(Ball , EM_SetModeType_Strikback , false )--����
				SetModeEx(Ball , EM_SetModeType_Searchenemy , false )--����
				SetModeEx( Ball , EM_SetModeType_Fight, false) ----�i�������
				SetModeEx( Ball , EM_SetModeType_Mark, false) ----�аO
				SetModeEx( Ball , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
				SetModeEx( Ball , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
				SetModeEx( Ball , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
				SetModeEx( Ball , EM_SetModeType_Gravity, false) ----���O
				SetModeEx( Ball , EM_SetModeType_ShowRoleHead, false) ----������Y����
				SetModeEx( Ball , EM_SetModeType_AlignToSurface, false) ----�K����
				SetModeEx( Ball , EM_SetModeType_Move, false) ----����
				WriteRoleValue( Ball , EM_RoleValue_IsWalk , 0 )
				WriteRoleValue(Ball, EM_RoleValue_Livetime,5)	
				------------------------------------------------------------------------------------------------------------------------------------------------
				CastSpellLV( Ball , BossTarget , Skill[SkillIndex] , SkillLv[Skill_lv_Index] )					
				sleep(10)
				counter_p2_3 = 0
			---------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
			end
		elseif HateListCount( OwnerID() ) == 0 then
			local ID = {}
			local ID_2 = {}
			local ID_2_all = 0
			
			if Check_life == 1 then
				local PPL = SetSearchAllPlayer(roomid1)
				if PPL==0 then-----------------------------�ˬd�̭��O�_ ���S���H
					sleep(30)
					Delobj(OwnerID())
				
				elseif PPL ~= 0 then  -----------------------------���H���O�i�঳gm�Ϊ̦��H
					for i = 1 , PPL , 1 do 
						ID[i] = GetSearchResult()
						if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) == 1 or  ------�h�ˬd�̭����H�O�_�O���H�Ϊ�gm
							ReadRoleValue( ID[i], EM_RoleValue_VOC) == 0 or
							GetDistance( OwnerID(), ID[i]) >=1300 then 
							PPLX=PPLX+1
						else
							table.insert( ID_2 , ID[i] ) 
						end
						Check_ID = table.getn(ID)	
					end
					
					if PPL<=PPLX then ---------���۵�  ����̭����O���H�Ϊ�gm  �ҥH���m
						sleep(30)
						Delobj(OwnerID())
						break
					elseif PPL > PPLX then ----�N����W�٦����H�A�~��԰�
						ID_2_all = table.getn(ID_2)
						for i = 1 , ID_2_all , 1 do
							SetAttack( OwnerID() , ID_2[i] )
							PPLX = 0
							PPL = 0
						end
					end
				end
			end	
		end
	end
end



function Lua_apon_102918_2() ----���������`�@��
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID )---�D�k����GID
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local X = ReadRoleValue(OwnerID() , EM_RoleValue_X )
	local Y = ReadRoleValue(OwnerID() , EM_RoleValue_Y )
	local Z = ReadRoleValue(OwnerID() , EM_RoleValue_Z )
	local Dir = ReadRoleValue(OwnerID() , EM_RoleValue_Dir )
	
	local SK = star_CreateObj( OwnerID() , 102919 , 0 , 0 , 0 , roomid1 , 0) ---�ͥX�@�ӯS�Ĳy
	
	-------------�S�Ĳy�M��-----------------------------------------------------------------------------------------------------------------
	SetModeEx(SK , EM_SetModeType_Strikback , false )--����
	SetModeEx(SK , EM_SetModeType_Searchenemy , false )--����
	SetModeEx( SK , EM_SetModeType_Fight, false) ----�i�������
	SetModeEx( SK , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( SK , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( SK , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( SK , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( SK , EM_SetModeType_Gravity, false) ----���O
	SetModeEx( SK , EM_SetModeType_ShowRoleHead, false) ----������Y����
	SetModeEx( SK , EM_SetModeType_AlignToSurface, false) ----�K����
	SetModeEx( SK , EM_SetModeType_Move, false) ----����
	WriteRoleValue( SK , EM_RoleValue_IsWalk , 0 )
	------------------------------------------------------------------------------------------------------------------------------------------------
	WriteRoleValue( SK , EM_RoleValue_PID , Boss )
	--SetPos( SK, X, (Y-40), Z , Dir )
	--CastSpell( SK , SK , 494555)----������t�z��
end

function Lua_apon_102918_3() ----���b�����ͥX���S�Ĳy�W
	local X = ReadRoleValue(OwnerID() , EM_RoleValue_X )
	local Y = ReadRoleValue(OwnerID() , EM_RoleValue_Y )
	local Z = ReadRoleValue(OwnerID() , EM_RoleValue_Z )
	local Dir = ReadRoleValue(OwnerID() , EM_RoleValue_Dir )
	local Dir_Rand = 90
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID )---�D�k����GID
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	SetPos( OwnerID(), X, (Y-51), Z , Dir )
	sleep(10)
	CastSpell( OwnerID() , OwnerID() , 494555)----������t�z��
	sleep(25)
	AddBuff (OwnerID() , 505143 , 0 , 60) ----��t�D�n�]�X�Ӯɪ��S��
	local Move_X = {X-100 , X , X+100 , X}
	local Move_Z = {Z , Z+100 , Z , Z-100}
	local Snake_table = {102865,102866,102867,102868} ---�|���������ͪ��D
	sleep(10) ----�[�W�@�ӰT���A�����a���D�D�n�X�ӤF
	for i = 1 , table.getn(Snake_table), 1 do
		local Snake_other = star_CreateObj( OwnerID() , Snake_table[i] , 0 , 51 , 0 , roomid1 , Dir_Rand*i) ---�ͥX�|���D
		SetModeEx(Snake_other , EM_SetModeType_Strikback , false )--����
		SetModeEx(Snake_other , EM_SetModeType_Searchenemy , false )--���� 
		MoveToFlagEnabled(Snake_other, false )
		WriteRoleValue( Snake_other , EM_RoleValue_IsWalk , 1 )
		WriteRoleValue( Snake_other , EM_RoleValue_PID , Boss )
		Move( Snake_other , Move_X[i] , Y , Move_Z[i] )
	end
	sleep(30)
	Delobj(OwnerID())
end

function Lua_apon_102918_A() ----�����p�DA 
	sleep(25)
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Obj = Role:new( Boss )
	SetPlot( OwnerID(),"dead","Lua_apon_102918_A_dead_1",10 )
	while 1 do
		if CheckID( Boss ) == true and ReadRoleValue( Boss , EM_RoleValue_OrgID ) == 102683 then
			if GetDistance( OwnerID(), Boss ) > 10 then
				Move( OwnerID() , Obj:X() ,  Obj:Y() ,  Obj:Z() ) 
			else
				break
			end
		end
		sleep(5)
	end
	CastSpellLV( OwnerID(),Boss ,494557,1)-----�|���D�U�O�M�Ϊ��ޯ�
	SetFightMode( OwnerID() , 0 , 0 , 0 , 0 )
	PlayMotionEX(OwnerID() , ruFUSION_ACTORSTATE_DYING , ruFUSION_ACTORSTATE_DEAD)
	sleep(15)
	Delobj( OwnerID() )
end

function Lua_apon_102918_A_dead_1() ----�����p�DA 
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
	local Mob_spell = star_CreateObj( OwnerID() , 102920 , 0 , 0 , 0 ,roomid1,0 ) ---�ͥX�@�ӵo�ޯ�Ϊ��S�Ĳy
	SetModeEx( Mob_spell , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( Mob_spell , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( Mob_spell , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( Mob_spell , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( Mob_spell , EM_SetModeType_NotShowHPMP, true) ----����ܦ��
	SetModeEx( Mob_spell , EM_SetModeType_ShowRoleHead, false) ----������Y����
	SetModeEx( Mob_spell , EM_SetModeType_Fight, false) ----�i�������
	Hide(Mob_spell)
	Show(Mob_spell,roomid1)
	SetFightMode ( Mob_spell,0,0,0,0 )
	WriteRoleValue( Mob_spell , EM_RoleValue_PID , TargetID() ) ----�N�������D�����a��GID �s�J�� PID��
	Delobj(OwnerID())
end

function Lua_apon_102918_A_dead_2() ---���b�����p�DA �� �I�k�y�W
	local OP_spell = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	sleep(5)
	CastSpellLV( OwnerID(),OP_spell ,494590,1) 
	sleep(10)
	Delobj(OwnerID())
end

function Lua_apon_102918_B() ----�����p�DB
	sleep(45)
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Obj = Role:new( Boss )
	SetPlot( OwnerID(),"dead","Lua_apon_102918_B_dead_1",10 )
	while 1 do
		if CheckID( Boss ) == true and ReadRoleValue( Boss , EM_RoleValue_OrgID ) == 102683 then
			if GetDistance( OwnerID(), Boss ) > 10 then
				Move( OwnerID() , Obj:X() ,  Obj:Y() ,  Obj:Z() ) 
			else
				break
			end
		end
		sleep(10)
	end
	CastSpellLV( OwnerID(),Boss ,494558,1)-----�|���D�U�O�M�Ϊ��ޯ�
	SetFightMode( OwnerID() , 0 , 0 , 0 , 0 )
	PlayMotionEX(OwnerID() , ruFUSION_ACTORSTATE_DYING , ruFUSION_ACTORSTATE_DEAD)
	sleep(15)
	Delobj( OwnerID() )
end

function Lua_apon_102918_B_dead_1() ----�����p�DB
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
	local Mob_spell = star_CreateObj( OwnerID() , 102921 , 0 , 0 , 0 ,roomid1,0 ) ---�ͥX�@�ӵo�ޯ�Ϊ��S�Ĳy
	SetModeEx( Mob_spell , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( Mob_spell , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( Mob_spell , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( Mob_spell , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( Mob_spell , EM_SetModeType_NotShowHPMP, true) ----����ܦ��
	SetModeEx( Mob_spell , EM_SetModeType_ShowRoleHead, false) ----������Y����
	SetModeEx( Mob_spell , EM_SetModeType_Fight, false) ----�i�������
	Hide(Mob_spell)
	Show(Mob_spell,roomid1)
	SetFightMode ( Mob_spell,0,0,0,0 )
	WriteRoleValue( Mob_spell , EM_RoleValue_PID , TargetID() ) ----�N�������D�����a��GID �s�J�� PID��
	Delobj(OwnerID())
end

function Lua_apon_102918_B_dead_2() ---���b�����p�DB �� �I�k�y�W
	local OP_spell = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	sleep(5)
	CastSpellLV( OwnerID(),OP_spell ,494591,1)
	sleep(10)
	Delobj(OwnerID())
end

function Lua_apon_102918_C() ----�����p�DC
	sleep(45)
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Obj = Role:new( Boss )
	SetPlot( OwnerID(),"dead","Lua_apon_102918_C_dead_1",10 )
	while 1 do
		if CheckID( Boss ) == true and ReadRoleValue( Boss , EM_RoleValue_OrgID ) == 102683 then
			if GetDistance( OwnerID(), Boss ) > 10 then
				Move( OwnerID() , Obj:X() ,  Obj:Y() ,  Obj:Z() ) 
			else
				break
			end
		end
		sleep(10)
	end
	CastSpellLV( OwnerID(),Boss ,494559,1)-----�|���D�U�O�M�Ϊ��ޯ�
	SetFightMode( OwnerID() , 0 , 0 , 0 , 0 )
	PlayMotionEX(OwnerID() , ruFUSION_ACTORSTATE_DYING , ruFUSION_ACTORSTATE_DEAD)
	sleep(15)
	Delobj( OwnerID() )
end

function Lua_apon_102918_C_dead_1() ----�����p�DC
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
	local Mob_spell = star_CreateObj( OwnerID() , 102922 , 0 , 0 , 0 ,roomid1,0 ) ---�ͥX�@�ӵo�ޯ�Ϊ��S�Ĳy
	SetModeEx( Mob_spell , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( Mob_spell , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( Mob_spell , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( Mob_spell , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( Mob_spell , EM_SetModeType_NotShowHPMP, true) ----����ܦ��
	SetModeEx( Mob_spell , EM_SetModeType_ShowRoleHead, false) ----������Y����
	SetModeEx( Mob_spell , EM_SetModeType_Fight, false) ----�i�������
	Hide(Mob_spell)
	Show(Mob_spell,roomid1)
	SetFightMode ( Mob_spell,0,0,0,0 )
	WriteRoleValue( Mob_spell , EM_RoleValue_PID , TargetID() ) ----�N�������D�����a��GID �s�J�� PID��
	Delobj(OwnerID())
end

function Lua_apon_102918_C_dead_2() ---���b�����p�DC �� �I�k�y�W
	local OP_spell = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	sleep(5)
	CastSpellLV( OwnerID(),OP_spell ,494592,1) 
	sleep(10)
	Delobj(OwnerID())
end


function Lua_apon_102918_D() ----�����p�DD 
	sleep(45)
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Obj = Role:new( Boss )
	SetPlot( OwnerID(),"dead","Lua_apon_102918_D_dead_1",10 )
	while 1 do
		if CheckID( Boss ) == true and ReadRoleValue( Boss , EM_RoleValue_OrgID ) == 102683 then
			if GetDistance( OwnerID(), Boss ) > 10 then
				Move( OwnerID() , Obj:X() ,  Obj:Y() ,  Obj:Z() ) 
			else
				break
			end
		end
		sleep(10)
	end
	CastSpellLV( OwnerID(),Boss ,494560,1) -----�|���D�U�O�M�Ϊ��ޯ�
	SetFightMode( OwnerID() , 0 , 0 , 0 , 0 )
	PlayMotionEX(OwnerID() , ruFUSION_ACTORSTATE_DYING , ruFUSION_ACTORSTATE_DEAD)
	sleep(15)
	Delobj( OwnerID() )
end

function Lua_apon_102918_D_dead_1() ----�����p�DD
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
	local Mob_spell = star_CreateObj( OwnerID() , 102923 , 0 , 0 , 0 ,roomid1,0 ) ---�ͥX�@�ӵo�ޯ�Ϊ��S�Ĳy
	SetModeEx( Mob_spell , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( Mob_spell , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( Mob_spell , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( Mob_spell , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( Mob_spell , EM_SetModeType_NotShowHPMP, true) ----����ܦ��
	SetModeEx( Mob_spell , EM_SetModeType_ShowRoleHead, false) ----������Y����
	SetModeEx( Mob_spell , EM_SetModeType_Fight, false) ----�i�������
	Hide(Mob_spell)
	Show(Mob_spell,roomid1)
	SetFightMode ( Mob_spell,0,0,0,0 )
	WriteRoleValue( Mob_spell , EM_RoleValue_PID , TargetID() ) ----�N�������D�����a��GID �s�J�� PID��
	Delobj(OwnerID())
end

function Lua_apon_102918_D_dead_2() ---���b�����p�DD �� �I�k�y�W
	local OP_spell = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	sleep(5)
	CastSpellLV( OwnerID(),OP_spell ,494593,1) 
	sleep(10)
	Delobj(OwnerID())
end


-----------------����Y����-----------------------------
function LuaS_run_eat_fish()
	local fish
	while	true	do
		fish	=	LuaFunc_SearchNPCbyOrgID( OwnerID() , 103535 , 200 , 1)	----����j�M"��"
		if	fish[0] ~= -1	then						----���N���L�h�Y��
			MoveToFlagEnabled(OwnerID(),false)
			DW_GetClose(OwnerID(),fish[0],40)
			AdjustFaceDir( OwnerID() ,fish[0], 0 )	
			CallPlot(fish[0],"LuaFunc_ResetObj",fish[0])
			sleep(30)
			MoveToFlagEnabled(OwnerID(),true)
		end
		sleep(10)
	end
end

function LuaS_gotoeat_grass()
	
end
-----------------�n���{�����u--------------------

function LuaS_shinez_bomb_start_check()
	if	CheckBuff( OwnerID() , 506813) == true	then							---�S���Q���w
		return false
	end	
	return true
end
function LuaS_shine_bomb_start()
	Beginplot(OwnerID(),"LuaS_shine_bomb",0)
end
function LuaS_shine_bomb()			---��m���u
	PlayMotion( OwnerID()  ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)	   --�ۤU

	local bomb = Lua_DW_CreateObj("obj",115018,OwnerID())   --�إX���u
	--say(bomb,ReadRoleValue( bomb , EM_RoleValue_CampID) ..".."..ReadRoleValue( bomb , EM_RoleValue_IsDead ))
	SetPlot(bomb,"dead","LuaS_bombdead",400)
	WriteRoleValue ( bomb , EM_RoleValue_Register +1,OwnerID() )	---���u����J��m�̸��
	CallPlot(bomb,"LuaS_bomb_check")				---�����u�����˹�a�O�_�s�b
	SetPlot(bomb,"dead","LuaS_bomb_dead",0)

	sleep(15)
	PlayMotion( OwnerID()  ,ruFUSION_ACTORSTATE_CROUCH_END)	   --���_��
	SetModeEx( bomb , EM_SetModeType_Gravity , false ) --no���O
	SetModeEx( bomb , EM_SetModeType_AlignToSurface , false ) --���K�a

end

function LuaS_bombdead()
	Beginplot(OwnerID(),"LuaS_shine_bomb_start_bomb",0)	
	return false
end

function LuaS_bomb_check()			---�ˬd���u����m�̦b���b
	local time = 0
	While	true	do
		time = time +1
		if	GetDistance( OwnerID() , ReadRoleValue( OwnerID(), EM_RoleValue_Register +1) ) < 200		and
			CheckBuff( ReadRoleValue( OwnerID(), EM_RoleValue_Register +1) , 506844)			and	
			ReadRoleValue( OwnerID(), EM_RoleValue_Register +2) ~= 1		then
			Beginplot(OwnerID(),"LuaS_shine_bomb_start_bomb",0)
		end
		if	time == 60	then
			Beginplot(OwnerID(),"LuaS_shine_bomb_start_bomb",0)
		end
		if	CheckID(ReadRoleValue( OwnerID(), EM_RoleValue_Register +1)) == false	then
			break
		end
		sleep(10)
	end
	delobj(OwnerID())
end

function LuaS_bomb_dead()
	ScriptMessage( ReadRoleValue( bomb[i], EM_RoleValue_Register +1) , ReadRoleValue( bomb[i], EM_RoleValue_Register +1) , 0 , "[SC_BOSS_XXX_2]"  ,  "0xFFFFFF00" ) 		-----�����̰ʡC
	ScriptMessage( ReadRoleValue( bomb[i], EM_RoleValue_Register +1), ReadRoleValue( bomb[i], EM_RoleValue_Register +1) , 1 , "[SC_BOSS_XXX_2]"  ,  "0xFFFFFF00" ) 
end

function LuaS_shine_bomb_start_click_check()		---�ˬd�d�򤺬O�_���ۤv�����u
	local yourbomb = 0
	local bomb = LuaFunc_SearchNPCbyOrgID( OwnerID(),115018 , 200 , 1)		---��d�򤺪����u
	for i = 0 , table.getn(bomb) do							---�ˬd�C�@���O���O�ۤv��
		if	OwnerID() == ReadRoleValue( bomb[i], EM_RoleValue_Register +1)	then
			yourbomb = bomb[i]						---�o�O�A�����u
		end
	end	
	if	yourbomb == 0	then							---�����ۤv�����uretrun true
		ScriptMessage( OwnerID()  , OwnerID()  , 0 , "[SC_BOSS_XXX_1]" ,  "0xFFFFFF00" ) 		-----�����̰ʡC
		ScriptMessage( OwnerID() , OwnerID()  , 1 , "[SC_BOSS_XXX_1]"  ,  "0xFFFFFF00" ) 		
		return false
	end	
	return true
end

function LuaS_shine_bomb_start_click()
	DelBodyItem(OwnerID(),207346,-1)
	AddBuff(OwnerID(),506844,1,5)	

--	Beginplot(OwnerID(),"LuaS_shine_bomb_click",0)
end

function LuaS_bombeffect()
	--say(TargetID(),ReadRoleValue( TargetID() , EM_RoleValue_CampID) ..".."..ReadRoleValue( TargetID() , EM_RoleValue_IsDead ))
	if ReadRoleValue( TargetID() , EM_RoleValue_CampID) ~= 6	and	ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 0	and	ReadRoleValue( TargetID() , EM_RoleValue_OrgID) ~= 115018	then
		--say(TargetID(),ReadRoleValue( TargetID() , EM_RoleValue_CampID) ..".."..ReadRoleValue( TargetID() , EM_RoleValue_IsDead ))
		return true
	end
	return false
end

function LuaS_shine_bomb_click()			---���z�ۤv�����u
	DelBodyItem(OwnerID(),207346,1)
	local bomb = LuaFunc_SearchNPCbyOrgID( OwnerID(),115018 , 200 , 1)			---��M�Ҧ����u
	for i = 0 , table.getn(bomb) do			
		if	OwnerID() == ReadRoleValue( bomb[i], EM_RoleValue_Register +1)	then	---�u�n�O�ۤv���C����z�@��
			Beginplot(bomb[i],"LuaS_shine_bomb_start_bomb",0)	
			sleep(10)		
		end
	end
end

function LuaS_shine_bomb_start_bomb()			----�z���ĪG�P�s���z��
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +2,1 )				---1�N���u���b���z
	local x = ReadRoleValue ( OwnerID() , EM_RoleValue_X)					---���u�U�I,���z���b�a���o��
	local y = ReadRoleValue ( OwnerID()  , EM_RoleValue_Y)
	local z = ReadRoleValue ( OwnerID()  , EM_RoleValue_Z)
	move(OwnerID(),x,y-30,z)
	--say(OwnerID(),"i thing i should bommm~~~~")
	local bomb2 = Lua_DW_CreateObj("obj",115553,OwnerID()) 
	local bomb3 = Lua_DW_CreateObj("obj",115553,OwnerID()) 
	CastSpell(OwnerID(),OwnerID(),495682)
	CallPlot(bomb2,"LuaS_another_bomb1",OwnerID())				
	CallPlot(bomb3,"LuaS_another_bomb2",OwnerID())
	sleep(30)
--		local Player = SearchRangePlayer ( OwnerID() , 50 )			---50�������a�w�t
--		for i = 0 , table.getn(Player) do
--			if	ReadRoleValue( Player[i], EM_RoleValue_IsDead) == 0	then 
--			AddBuff(Player[i],506813,1,5)	
--			end
--		end
--		local Monster = SearchRangeNPC ( OwnerID() , 50 )			---50�����Ǫ��B�S���`���w�t
--		for i = 0 , table.getn(Monster) do
--			if	ReadRoleValue(Monster[i],EM_RoleValue_CampID)==3	and	ReadRoleValue( Monster[i], EM_RoleValue_IsDead) == 0	then
--				AddBuff(Monster[i],506813,1,5)	
--			end
--		end
	local bomb = LuaFunc_SearchNPCbyOrgID( OwnerID(),115018 , 50 , 1)		---�j�M50������L���u,�ä��z�L
	for i = 0 , table.getn(bomb) do	
		sleep( 10 )
		--say(bomb[i],"i am here")
		if	OwnerID() ~= bomb[i]	and	ReadRoleValue( bomb[i], EM_RoleValue_Register +2) ~= 1	then		---���u���O�ۤv�B�å����z
			Beginplot(bomb[i],"LuaS_shine_bomb_start_bomb", 0)			---���z�L
			if	ReadRoleValue( bomb[i], EM_RoleValue_Register +1) ~= ReadRoleValue( OwnerID() , EM_RoleValue_Register +1)	then		
				ScriptMessage( ReadRoleValue( bomb[i], EM_RoleValue_Register +1) , ReadRoleValue( bomb[i], EM_RoleValue_Register +1) , 0 , "[SC_BOSS_XXX_2]"  ,  "0xFFFFFF00" ) 		-----�����̰ʡC
				ScriptMessage( ReadRoleValue( bomb[i], EM_RoleValue_Register +1), ReadRoleValue( bomb[i], EM_RoleValue_Register +1) , 1 , "[SC_BOSS_XXX_2]"  ,  "0xFFFFFF00" ) 
			end
		end
	end	
	delobj(OwnerID())
end

function 	LuaS_another_bomb1()
	Lua_ObjDontTouch( OwnerID())
	sleep(30)
	CastSpell(OwnerID(),OwnerID(),495701)
	sleep(15)

	delobj(OwnerID())
end

function 	LuaS_another_bomb2()
	Lua_ObjDontTouch( OwnerID())
	sleep(30)
	CastSpell(OwnerID(),OwnerID(),495679)
	sleep(15)

	delobj(OwnerID())
end
----------------�@�ɤ�-�Z���H��XXX-------------------------------------------------------------------------------
function LuaS_world_boss_XXX()
	--say(OwnerID(),ReadRoleValue( OwnerID() , EM_RoleValue_CampID) ) 
	SetPlot(OwnerID(),"dead","LuaS_104039_dead",0)
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +3,0 )
	CallPlot(OwnerID(),"LuaS_boss_XXX_CallParter",2)	----�l��׭^��	
					
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )----register+1�Ω�P�_BUFF�ƶq	

	CallPlot(OwnerID(), "LuaS_mudeki",60)			---�C30�����ۤv�W�L��BUFF,�̦h�W3��
	CallPlot(OwnerID(), "LuaS_no_mudeki")			---�Q���@���֤@�ӵL��BUFF
	CallPlot(OwnerID(), "LuaS_boss_XXX_roundattack")			---�C5~10��Τ@���j�ۧ���
	CallPlot(OwnerID(),"LuaS_boss_XXX_leavebattle")
	CallPlot(OwnerID(),"LuaS_boss_XXX_gettruebuff")
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +2,0 )----register+2�Ω�P�_�Z�����F�H�q�ƶq
	CallPlot(OwnerID(),"LuaS_CallShadow",104041,10,5,10,OwnerID())			---�l��Z�����F�H�q
end

--RIGISTER +1 �Ω󬵼u��
--RIGISTER +2 �Ω���F�H�q��
--RIGISTER +3 �Ω�l�H�̼�
--RIGISTER +4 �Ω�P�_�O�_�I��j�ۺj��
--RIGISTER +5 �Ω�P�_�O�_�I���z��
function LuaS_boss_XXX_leavebattle()
	while	true	do
		if	ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) == 0	then
			CancelBuff( OwnerID()  , 506814  )	
			WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,0 )----register+1�Ω�P�_BUFF�ƶq	
		end
		sleep(10)
	end
end

function LuaS_boss_XXX_gettruebuff()
	while	true	do
		if	CheckBuff(OwnerID() , 506814) == true	and	CheckBuff(OwnerID() , 507270) == false	then
			--say(OwnerID(),"i get buff")
			AddBuff(OwnerID(),507270,0,-1)		
	
		elseif	CheckBuff(OwnerID() , 506814) == false	and	CheckBuff(OwnerID() , 507270) == true	then
			--say(OwnerID(),"I lose buff")
			debugmsg(0,0,"I lose buff")
			CancelBuff( OwnerID()  , 507270  )
		end
		sleep(1)
	end
end

function LuaS_boss_XXX_CallParter(V1)
	while	true	do
		if	ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) == 0	and	ReadRoleValue(OwnerID() ,EM_RoleValue_Register +3) == 0	then
			local parter = Lua_Davis_BornByMultilateral(104040 , V1 , 50 )
			SetFollow( parter[1] , OwnerID() )
			WriteRoleValue ( parter[1] , EM_RoleValue_Register + 2 , OwnerID() )			
			SetFollow( parter[2] , parter[1] )
			WriteRoleValue ( parter[2] , EM_RoleValue_Register + 2 , Parter[1] )
			for i = 1, table.getn(parter) do
				--say(OwnerID(),i)
				--SetFollow( parter[i] , OwnerID() )
				CallPlot(parter[i],"LuaS_boss_XXX_parter",OwnerID())
				MoveToFlagEnabled(parter[i],false)
				WriteRoleValue ( OwnerID() , EM_RoleValue_Register + (4+i) , parter[i] )----
				--say(OwnerID(),ReadRoleValue( OwnerID(), EM_RoleValue_Register + (4+i) ))					
			end
			WriteRoleValue ( OwnerID() , EM_RoleValue_Register +3,V1 )----register+3�Ω�P�_�׭^�L�ƶq			
		end
		sleep(20)
	end
end


function LuaS_boss_XXX_roundattack()
	local Target					---
	local Pos 
	local Num 
	local x
	local y
	local z
	local x1
	local z1
	local y1
	local x2
	local z2
	local y2
	local NewDir
	while	true	do
	--	say(OwnerID(),"i want to kill "..ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) )
		while ReadRoleValue( OwnerID(),EM_RoleValue_Register +5) == 1	do
			sleep(10)
		end
		if	ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) ~= 0	then  --�ˬd�O�_���}�԰�
			WriteRoleValue ( OwnerID(),EM_RoleValue_Register +4,1)
			Pos = Rand(HateListCount( OwnerID() )  )
			Num = 0
			x = ReadRoleValue ( OwnerID() , EM_RoleValue_X)
			y = ReadRoleValue ( OwnerID() , EM_RoleValue_Y)
			z = ReadRoleValue ( OwnerID() , EM_RoleValue_Z)
			x1 = ReadRoleValue ( HateListInfo(OwnerID() , 0 , EM_HateListInfoType_GItemID )  , EM_RoleValue_X)
			y1 = ReadRoleValue ( HateListInfo(OwnerID() , 0 , EM_HateListInfoType_GItemID )  , EM_RoleValue_Y)
			z1 = ReadRoleValue ( HateListInfo(OwnerID() , 0 , EM_HateListInfoType_GItemID )  , EM_RoleValue_Z)
			if x > x1 then
				x2 = x-20
			elseif x < x1 then
				x2 = x+20
			else
				x2 = x
			end
			if z > z1 then
				z2 = z-20
			elseif z < z1 then
				z2 = z+20
			else
				z2=z
			end

			if y >= y1 then
				y2 = y+10
			else 
				y2 = y1+10
			end
	
			NewDir = ReadRoleValue(   HateListInfo(OwnerID() , 0 , EM_HateListInfoType_GItemID )   , EM_RoleValue_Dir )
		
			for i = 1 , HateListCount( OwnerID() ) , 1 do
				 Target = HateListInfo(OwnerID() , Pos , EM_HateListInfoType_GItemID )

				if ReadRoleValue( Target , EM_RoleValue_IsDead) == 0 and GetDistance( Target,OwnerID() ) < 400 and GetDistance( Target,OwnerID() ) > 50 then
					--say(OwnerID(),"come here , "..Target)
					SetPos( Target , x2 , y2 , z2 , NewDir )
					Num = Num + 1
				else
					Pos = Pos + 1
					if Pos >= HateListCount( OwnerID() ) then
						Pos = 0
					end
				end
				if Num > 5 then
					break
				end
			end
			if	Num > 0	then
				LuaS_BOSS_XXX_SAY(2)
			end
			CastSpell( OwnerID() , OwnerID() , 495749 )	
			sleep(40)
			WriteRoleValue ( OwnerID(),EM_RoleValue_Register +4,0)
		end	
		sleep(100+Rand(50))
	end
end
function LuaS_boss_XXX_parter(boss)
	WriteRoleValue ( OwnerID(),EM_RoleValue_Register +1,boss)
	SetPlot(OwnerID(),"dead","LuaS_boss_XXX_parter_dead",0)
	while	true	do
		if	ReadRoleValue( boss , EM_RoleValue_AttackTargetID ) ~= 0	then
			SetAttack( OwnerID() , LuaFunc_GetAnotherPartyPlayer( ReadRoleValue( boss , EM_RoleValue_AttackTargetID ) )     )
			sleep(200)
		end
		if	ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) ~= 0	then
			SetAttack( boss, ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )     )
			sleep(200)
		end
		if	Getdistance(OwnerID(),boss) > 400	then
			SetStopAttack( OwnerID()  )
			ClearHateList( OwnerID() , -1 )
			SetFollow( OwnerID() , ReadRoleValue(OwnerID() ,EM_RoleValue_Register +2) )
		end
		sleep(10)
	end
end

function LuaS_boss_XXX_parter_dead()
	WriteRoleValue ( ReadRoleValue(OwnerID() ,EM_RoleValue_Register +1) ,  EM_RoleValue_Register +3,	ReadRoleValue( ReadRoleValue(OwnerID() ,EM_RoleValue_Register +1)  , EM_RoleValue_Register +3)-1	)

end
function LuaS_CallShadow(Monster,Time,Num,TotalNum,boss)
	local	MonsterNum = 0
	local	MonsterList
	local	alive
	while	true	do
		while	ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) == 0	do
			sleep(10)
		end	
		sleep(Time*10)									----��
--		MonsterList	=	LuaFunc_SearchNPCbyOrgID( OwnerID() , Monster , 5000 , 1)			---�O��ƶq
--		MonsterNum = table.getn(MonsterList) - Lua_MonsterSurvive(MonsterList)
		if	ReadRoleValue(boss ,EM_RoleValue_Register +2) < (TotalNum-Num)	and	ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) ~= 0	then					----�����`��
			LuaS_BOSS_XXX_SAY(3)	
			 Lua_Davis_BornByMultilateral(Monster , Num , 70 )						-----�ͩ�

		end	
		MonsterList	=	LuaFunc_SearchNPCbyOrgID( OwnerID() , Monster , 5000 , 1)
		alive = -1	
		for i = 0 , table.getn(MonsterList) do	
			MoveToFlagEnabled(MonsterList[i],false)	
			if	ReadRoleValue(  MonsterList[i], EM_RoleValue_IsDead) == 0	then
				alive = alive +1
				--say(MonsterList[i], "i am live~")
			end
						-----�����u
			if	ReadRoleValue(MonsterList[i] ,EM_RoleValue_Register +1) ~= 1 	then 
				CallPlot(MonsterList[i] ,"LuaS_bring_bomb",i,OwnerID())	
				WriteRoleValue ( MonsterList[i] ,  EM_RoleValue_Register +2,boss)	
				SetPlot( MonsterList[i] , "Dead","LuaS_CallShadow_dead",100)
			end
		end	
		WriteRoleValue ( OwnerID(), EM_RoleValue_Register +2, alive)
		--say(OwnerID(),ReadRoleValue(OwnerID() ,EM_RoleValue_Register +2) )
	end
end

function LuaS_CallShadow_dead()
	WriteRoleValue ( ReadRoleValue(OwnerID() ,EM_RoleValue_Register +2) ,  EM_RoleValue_Register +2,	ReadRoleValue( ReadRoleValue(OwnerID() ,EM_RoleValue_Register +2)  , EM_RoleValue_Register +2)-1	)
	CallPlot(OwnerID(), "LuaS_CallShadow_dead_delobj")
	return true
end

function LuaS_CallShadow_dead_delobj()
	sleep(600)
	delobj(OwnerID())
end
function LuaS_no_mudeki()

	while	true	do
		if	CheckBuff( OwnerID() , 506813) == true	and	CheckBuff( OwnerID() , 506814) == true	then		
			CancelBuff( OwnerID()  , 506814  ) 			----�R���L��BUFF
			WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,ReadRoleValue( OwnerID(),EM_RoleValue_Register +1) - 1 )
			if	ReadRoleValue( OwnerID(),EM_RoleValue_Register +1) > 0 then
				--say(OwnerID(),"Buff Num = "..ReadRoleValue( OwnerID(),EM_RoleValue_Register +1) )				
				for i = 0 , ReadRoleValue( OwnerID(),EM_RoleValue_Register +1)-1 do
					--say(OwnerID(),"i = "..i)
					AddBuff(OwnerID(),506814,0,-1)				---���ۤv�W�L��BUFF				
				end
				
			end
			LuaS_BOSS_XXX_SAY(5+ ReadRoleValue( OwnerID(),EM_RoleValue_Register +1) )
		end
		CancelBuff( OwnerID()  , 506813  ) 			----�R���w�tBUFF
		sleep(1)
	end
end

function LuaS_mudeki(time)
	local	AddBuffNum
	while	true	do
		while	ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) == 0	do
			sleep(10)
		end	
		sleep(100)
		--say(OwnerID(),ReadRoleValue( OwnerID(),EM_RoleValue_Register +1) )
		if	ReadRoleValue( OwnerID(),EM_RoleValue_Register +1) < 6		and	ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) ~= 0	then
			PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_ATTACK_1H , ruFUSION_ACTORSTATE_NORMAL )
			AddBuffNum = 6 - ReadRoleValue( OwnerID(),EM_RoleValue_Register +1) 
			if	AddBuffNum > 3	then
				AddBuffNum = 3
			end
			LuaS_BOSS_XXX_SAY(4)	
			WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,ReadRoleValue( OwnerID(),EM_RoleValue_Register +1) + AddBuffNum )
		else
			while ReadRoleValue( OwnerID(),EM_RoleValue_Register +4) == 1	do
				sleep(10)
			end
			if ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) ~= 0	then
				WriteRoleValue ( OwnerID(),EM_RoleValue_Register +5,1)
				CastSpell(OwnerID(),OwnerID(),495750)
				LuaS_BOSS_XXX_SAY(1)
				CancelBuff( OwnerID()  , 506814  )		
				AddBuff(OwnerID(),506814,0,-1)
				AddBuff(OwnerID(),506814,0,-1)
				AddBuff(OwnerID(),506814,0,-1)
				WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,3)
				sleep(40)
				WriteRoleValue ( OwnerID(),EM_RoleValue_Register +5,0)
			end				
		end
		if  ReadRoleValue( OwnerID(),EM_RoleValue_Register +1) > 0 then
			CancelBuff( OwnerID()  , 506814  )
			for i = 0 , ReadRoleValue( OwnerID(),EM_RoleValue_Register +1)-1   do
				AddBuff(OwnerID(),506814,0,-1)				---���ۤv�W�L��BUFF	
			end
		end
		sleep(time*10)
	end
	--say(OwnerID(),"i dead")
end

function LuaS_bring_bomb(time,boss)
	SetFollow( OwnerID(), boss )
	--SetAttack( OwnerID() , LuaFunc_GetAnotherPartyPlayer( ReadRoleValue( boss , EM_RoleValue_AttackTargetID ) )     )

			local rnd =  Rand( HateListCount( boss )) 
			--say(OwnerID(),rnd)
			SetAttack( OwnerID() ,  HateListInfo(boss, rnd , EM_HateListInfoType_GItemID     ))
			--say(OwnerID(),HateListInfo(boss, rnd , EM_HateListInfoType_GItemID) )
			CallPlot(OwnerID(),"LuaS_CallShadow_delobj")				

	WriteRoleValue ( OwnerID() , EM_RoleValue_Register +1,1 )
	sleep(270+time*10)
	while	CheckBuff( OwnerID() , 506813) == true	do
		sleep(50)
	end
	local bomb2 = Lua_DW_CreateObj("obj",115553,OwnerID()) 
	CastSpell(OwnerID(),OwnerID(),495682)
	CallPlot(bomb2,"LuaS_another_bomb2")
	--say(OwnerID(),"i was bommm~~~~")
	sleep(30)

	DW_QietKillOne( OwnerID() , OwnerID() )

--	CastSpell(OwnerID(),OwnerID(),495679)
--	sleep(15)
--		local Player = SearchRangePlayer ( OwnerID() , 50 )			---50�������a�w�t
--		for i = 0 , table.getn(Player) do
--			if	ReadRoleValue( Player[i], EM_RoleValue_IsDead) == 0	then 
--			AddBuff(Player[i],506813,1,5)	
--			end
--		end
	local bomb = LuaFunc_SearchNPCbyOrgID( OwnerID(),115018 , 50 , 1)	---���z��L���u 
	for i = 0 , table.getn(bomb) do	
		sleep(10 )
		if	OwnerID() ~= bomb[i]	and	ReadRoleValue( bomb[i], EM_RoleValue_Register +2) ~= 1	then		
			Beginplot(bomb[i],"LuaS_shine_bomb_start_bomb",0)			
			if	ReadRoleValue( bomb[i], EM_RoleValue_Register +1) ~= ReadRoleValue( OwnerID(), EM_RoleValue_Register +1)	then
				ScriptMessage( ReadRoleValue( bomb[i], EM_RoleValue_Register +1) , ReadRoleValue( bomb[i], EM_RoleValue_Register +1) , 0 , "[SC_BOSS_XXX_2]"  ,  "0xFFFFFF00" ) 		-----�����̰ʡC
				ScriptMessage( ReadRoleValue( bomb[i], EM_RoleValue_Register +1), ReadRoleValue( bomb[i], EM_RoleValue_Register +1) , 1 , "[SC_BOSS_XXX_2]"  ,  "0xFFFFFF00" ) 
			end
		end
	end
	WriteRoleValue ( ReadRoleValue(OwnerID() ,EM_RoleValue_Register +2) ,  EM_RoleValue_Register +2,	ReadRoleValue( ReadRoleValue(OwnerID() ,EM_RoleValue_Register +2)  , EM_RoleValue_Register +2)-1	)	
	LuaFunc_DeadPlay()	
end
function LuaS_CallShadow_delobj()
	while  ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) ~= 0	do
		sleep(10)
	end
	delobj(OwnerID())
end
function LuaS_test11111()
	CastSpell(OwnerID(),OwnerID(),495701)	
end
function LuaS_BOSS_XXX_SAY(V1)
	local random = rand(2)
	if	V1 == 1	then
		if	random == 0	then
			DW_AreaMessage( OwnerID() , 1 , "[SC_BOSS_XXX_3]" , 0 )
			--DW_AreaMessage(OwnerID(),0,"[SC_BOSS_XXX_3]", C_Red)
			--ScriptMessage( OwnerID() , -1 , 1 , "[SC_BOSS_XXX_3]"   , 0 ) 
			--ScriptMessage( OwnerID() , -1 , 0 , "[SC_BOSS_XXX_3]"  , C_Red  )
		else
			DW_AreaMessage(OwnerID(),1,"[SC_BOSS_XXX_4]",0)
			--ScriptMessage( OwnerID() , -1 , 1 , "[SC_BOSS_XXX_4]"   , 0 ) 
			--ScriptMessage( OwnerID() , -1 , 0 , "[SC_BOSS_XXX_4]"  , C_Red  )
		end
	elseif	V1 == 2	then
		if	random == 0	then
			DW_AreaMessage(OwnerID(),1,"[SC_BOSS_XXX_5]",0)
			--ScriptMessage( OwnerID() , -1 , 1 , "[SC_BOSS_XXX_5]"   , 0 ) 
			--ScriptMessage( OwnerID() , -1 , 0 , "[SC_BOSS_XXX_5]"  , C_Red  )
		else
			DW_AreaMessage(OwnerID(),1,"[SC_BOSS_XXX_6]",0)
			--ScriptMessage( OwnerID() , -1 , 1 , "[SC_BOSS_XXX_6]"   , 0 ) 
			--ScriptMessage( OwnerID() , -1 , 0 , "[SC_BOSS_XXX_6]"  , C_Red  )
		end
	elseif	V1 == 3	then
			DW_AreaMessage(OwnerID(),1,"[SC_BOSS_XXX_7]",0)
			--ScriptMessage( OwnerID() , -1 , 1 , "[SC_BOSS_XXX_7]"   , 0 ) 
			--ScriptMessage( OwnerID() , -1 , 0 , "[SC_BOSS_XXX_7]"  , C_Red  )
	elseif	V1 == 4	then
			DW_AreaMessage(OwnerID(),1,"[SC_BOSS_XXX_8]",0)
			--ScriptMessage( OwnerID() , -1 , 1 , "[SC_BOSS_XXX_8]"   , 0 ) 
			--ScriptMessage( OwnerID() , -1 , 0 , "[SC_BOSS_XXX_8]"  , C_Red  )
	elseif	V1 == 5	then
		--if	random == 0	then
			DW_AreaMessage(OwnerID(),1,"[SC_BOSS_XXX_0_0]",0)
			--ScriptMessage( OwnerID() , -1 , 1 , "[SC_BOSS_XXX_0_0]"   , 0 ) 
			--ScriptMessage( OwnerID() , -1 , 0 , "[SC_BOSS_XXX_0_0]"  , C_Red  )
		--end

	elseif	V1 == 6	then
		--if	random == 0	then
			DW_AreaMessage(OwnerID(),1,"[SC_BOSS_XXX_0_1]",0)
			--ScriptMessage( OwnerID() , -1 , 1 , "[SC_BOSS_XXX_0_1]"   , 0 ) 
			--ScriptMessage( OwnerID() , -1 , 0 , "[SC_BOSS_XXX_0_1]"  , C_Red  )
		--end
	elseif	V1 == 7	then
		--if	random == 0	then
			DW_AreaMessage(OwnerID(),1,"[SC_BOSS_XXX_0_2]",0)
			--ScriptMessage( OwnerID() , -1 , 1 , "[SC_BOSS_XXX_0_2]"   , 0 ) 
			--ScriptMessage( OwnerID() , -1 , 0 , "[SC_BOSS_XXX_0_2]"  , C_Red  )
		--end
	elseif	V1 == 8	then
		--if	random == 0	then
			DW_AreaMessage(OwnerID(),1,"[SC_BOSS_XXX_0_3]",0)
			--ScriptMessage( OwnerID() , -1 , 1 , "[SC_BOSS_XXX_0_3]"   , 0 ) 
			--ScriptMessage( OwnerID() , -1 , 0 , "[SC_BOSS_XXX_0_3]"  , C_Red  )
		--end
	elseif	V1 == 9	then
		--if	random == 0	then
			DW_AreaMessage(OwnerID(),1,"[SC_BOSS_XXX_0_4]",0)
			--ScriptMessage( OwnerID() , -1 , 1 , "[SC_BOSS_XXX_0_4]"   , 0 ) 
			--ScriptMessage( OwnerID() , -1 , 0 , "[SC_BOSS_XXX_0_4]"  , C_Red  )
		--end
	elseif	V1 == 10	then
		--if	random == 0	then
			DW_AreaMessage(OwnerID(),1,"[SC_BOSS_XXX_0_5]",0)
			--ScriptMessage( OwnerID() , -1 , 1 , "[SC_BOSS_XXX_0_5]"   , 0 ) 
			--ScriptMessage( OwnerID() , -1 , 0 , "[SC_BOSS_XXX_0_5]"  , C_Red  )
		--end
	end
end

function LuaS_104039_dead()
----------------------------------------------------------------------------------
	local x = 0
	local Player = {}
	for i=0,HateListCount( OwnerID()),1 do
		Player[i+1] = HateListInfo(OwnerID(),i , EM_HateListInfoType_GItemID)
	end
	local Ball = {}
	for i=1,5,1 do
		if	table.getn(Player)==0	then
			break
		end
		Ball[i] = Lua_DW_CreateObj("obj",115529,Player[1])
		table.remove(Player,1)
	end
	for i=1,5,1 do
		if	table.getn(Player)==0	then
			break
		end
		x = DW_Rand(table.getn(Player))
		Ball[i+5] = Lua_DW_CreateObj("obj",115529,Player[x])
		table.remove(Player,x)
	end
	for i=1,table.getn(Ball),1 do
		SetPlot(Ball[i],"touch","LuaS_103580_7",45)
		WriteRoleValue(Ball[i],EM_RoleValue_LiveTime,15)
		AddBuff(Ball[i],505498,1,-1)
	end
	for i=4,7 do
		if	ReadRoleValue(OwnerID() , EM_RoleValue_Register +i  ) ~= 0	then
				delobj( ReadRoleValue(OwnerID() , EM_RoleValue_Register +i)  )
		end
	end

	return true
end
function Lua_bk_dw_ww_102463()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
	local st=OwnerID()
	local bwa={}
		for i=1 , 10 ,1 do
		bwa[i] = CreateObjByFlag(100469,780449,i,1)------------------------------------10�Ӧa��h���ͪ���
		SetModeEx( bwa[i] , EM_SetModeType_Show, false) ----�q�X
		SetModeEx( bwa[i] , EM_SetModeType_Mark, false) ----�аO
		SetModeEx( bwa[i] , EM_SetModeType_Strikback, false) ---����
		SetModeEx( bwa[i] , EM_SetModeType_Move, false) ---����	
		SetModeEx( bwa[i] , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( bwa[i] , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
		SetModeEx( bwa[i] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
		SetModeEx( bwa[i] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
		SetModeEx( bwa[i] , EM_SetModeType_Searchenemy, false)  ---���
		WriteRoleValue(bwa[i] , EM_RoleValue_Register6,i)--------------------------------------������m
		WriteRoleValue(bwa[i] , EM_RoleValue_Register5,st)--------------------------------------������m
		AddtoPartition(bwa[i] , RoomID )
		BeginPlot( bwa[i],"Lua_bk_master_102641",10)
		end
		local door = CreateObjByFlag(102463,780449,11,1)-----------------------�b�X��2�W����J���ת�
		SetModeEx( door , EM_SetModeType_Gravity, false) ---���O
		SetModeEx( door , EM_SetModeType_Mark, false)
		SetModeEx( door , EM_SetModeType_HideName, false)
		SetModeEx( door , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( door , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( door , EM_SetModeType_Obstruct, true)   -----���O
		SetModeEx( door , EM_SetModeType_Strikback, false) ---����
		SetModeEx( door , EM_SetModeType_Move, false) ---����	
		SetModeEx( door , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( door , EM_SetModeType_Searchenemy, false)
		SetModeEx( door , EM_SetModeType_Show, true)
		AddtoPartition( door , RoomID )
		SetPlot( door , "range" , "Lua_bk_dw_range_102463" , 30 )----�g�J�d��@��
		while 1 do
		sleep(10)
		local bwdd = ReadRoleValue (st,EM_RoleValue_Register1)------Ū�������Ǫ��ٴX��
		---	say(st,"xxxxxx="..bwdd)
			if bwdd==10 then 	
			ScriptMessage( OwnerID() , -1 , 2 , "[SC_102463_02]" , 1 )
			DelObj(door)
			break
			end
		end
end
function Lua_bk_master_102641()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
 local bwater = LuaFunc_CreateObjByObj ( 102641 , OwnerID() )----------------------------------------------�}���o�إߤH
	SetModeEx( bwater , EM_SetModeType_Gravity, true) ---���O
	SetModeEx( bwater , EM_SetModeType_Mark, true)
	SetModeEx( bwater , EM_SetModeType_HideName, true)
	SetModeEx( bwater , EM_SetModeType_ShowRoleHead, true)
	SetModeEx( bwater , EM_SetModeType_NotShowHPMP, true)
	SetModeEx( bwater , EM_SetModeType_Strikback, true) ---����
	SetModeEx( bwater , EM_SetModeType_Move, true) ---����	
	SetModeEx( bwater , EM_SetModeType_Fight, true) ---�i���
	SetModeEx( bwater , EM_SetModeType_SearchenemyIgnore, true) 
	SetModeEx( bwater , EM_SetModeType_Searchenemy, true)
	SetModeEx( bwater , EM_SetModeType_Show, true)
 WriteRoleValue( bwater ,EM_RoleValue_PID, OwnerID())	--�g�JPID
 AddToPartition(bwater , RoomID )
 BeginPlot( bwater,"Lua_bk_dw_ww_102641",10)
 SetPlot( bwater , "dead" , "Lua_bk_dw_ww_dd__102641" , 10 )-----------------------------------���T�@��
end
function Lua_bk_dw_ww_dd__102641()----------------------------------------------------���`�@�����]��������ai
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
	local bw = OwnerID()
	local bwa = ReadRoleValue (bw,EM_RoleValue_PID)-----------------�}�l����
	local st = ReadRoleValue (bwa,EM_RoleValue_Register5)-----------------�}�l����
	local bwdd=ReadRoleValue (st,EM_RoleValue_Register1)-----------------�g�{�b�Ǫ��ƶq
	bwdd=bwdd+1
	WriteRoleValue(st , EM_RoleValue_Register1,bwdd)
    Delobj(bwa) -------------�R���Ȧs����
end
function Lua_bk_dw_ww_102641()----------------------------------------------------���]��������ai
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
	local bw = OwnerID()
	local bwa = ReadRoleValue (bw,EM_RoleValue_PID)-----------------�}�l����
	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--Ū����q
	local s1=0
	local time1=0
	local Skill={493996,494000,493999}
	local skilllv={1400,1400,1000}
	local Luck = 0
	local ss = 0
	while 1 do 
		sleep(10)
		if HateListCount( bw ) ~= 0 then
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�
		local BossTarget=AttackTarget
			time1=time1+1
			local NowHP = ReadRoleValue(OwnerID() , EM_RoleValue_HP )
			local HPPercent = NowHP / MaxHP	--��q�ʤ���
			if HPPercent < 0.5 then-------------------------���q����3��p��
				if ss==0 then
				NowHP = ReadRoleValue(OwnerID() , EM_RoleValue_HP )-------------------------Ū���{�b����q
				WriteRoleValue(bwa, EM_RoleValue_Register7,NowHP)
				local Temp = Lua_Davis_BornByMultilateral( 102666 , 3 , 25 )	--�b�ۤv���W�X3��
				WriteRoleValue( Temp[1] ,EM_RoleValue_PID, bwa)	--�g�JPID
				WriteRoleValue(bwa, EM_RoleValue_Register1,Temp[1])	
				SetPlot( Temp[1] , "dead" , "Lua_bk_dd_sw_wr_102666" , 10 )
				AddBuff(Temp[1],504811,1,600)--------------���z�K��
				BeginPlot( Temp[1] , "Lua_bk_sw_102666",20)---------------------------------�I��k�N�@��
				SetAttack( Temp[1] , AttackTarget) -- �����e�i����
				
				WriteRoleValue( Temp[2] ,EM_RoleValue_PID, bwa)	--�g�JPID
				WriteRoleValue(bwa, EM_RoleValue_Register2,Temp[2])	
				SetPlot( Temp[2] , "dead" , "Lua_bk_dd_sw_wr_102666" , 10 )
				AddBuff(Temp[2],504810,1,600)--------------�k�N�K��
				BeginPlot( Temp[2] , "Lua_bk_sw_102666",20)---------------------------------�I��k�N�@��
				SetAttack( Temp[2] , AttackTarget) -- �����e�i����
				
				WriteRoleValue( Temp[3] ,EM_RoleValue_PID, bwa)	--�g�JPID
				WriteRoleValue(bwa, EM_RoleValue_Register3,Temp[3])	
				SetPlot( Temp[3] , "dead" , "Lua_bk_dd_sw_ri_102666" , 10 )-----------------------------------���T�@��
			    Luck=DW_Rand(100)
				if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
				AddBuff(Temp[3],504811,1,600)--------------���z�K��
				elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
				AddBuff(Temp[3],504810,1,600)--------------�k�N�K��
				end
				BeginPlot( Temp[3] , "Lua_bk_sw_ri_102666",30)---------------------------------�I��k�N�@��
				SetAttack( Temp[3] , AttackTarget) -- �����e�i����
			    sleep(5)
				Delobj(bw)
				ss=1
				end
				if ss==1 then 
				end
			end
			if time1>=5 then 
				Luck=DW_Rand(100)
					if (Luck >= 0 and Luck < 25) then
						SkillIndex = 2-------------------------------------------
						CastSpellLV( OwnerID() , OwnerID() , Skill[SkillIndex] , skilllv[SkillIndex] )
						sleep(20)
					elseif (Luck >= 75 and Luck < 101) then	
						SkillIndex = 1-------------------------------------------
						CastSpellLV( OwnerID() , OwnerID() , Skill[SkillIndex] , skilllv[SkillIndex] )
						sleep(20)
					elseif (Luck >= 50 and Luck < 75) or (Luck >= 25 and Luck < 50) then 
						SkillIndex = 3-------------------------------------------
						BossTarget=AttackTarget
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , skilllv[SkillIndex] )
						sleep(20)
					end
					
				time1=0
			end	
		elseif HateListCount( bw ) == 0 then----------------���}�԰� �Ҧ��ȳ��Ӧ^�k
		time1=0
		end
	end
end
function Lua_bk_dd_sw_ri_102666()----------------------------------------------------�p���������O���`�@��-----------���T��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	
	local bwa=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local sw=OwnerID()
	local t1=ReadRoleValue(bwa,EM_RoleValue_Register2)
	local t2=ReadRoleValue(bwa,EM_RoleValue_Register3)
	local Nowhp=ReadRoleValue(bwa,EM_RoleValue_Register7)
	local seat=ReadRoleValue(bwa,EM_RoleValue_Register6)
	local st=ReadRoleValue(bwa,EM_RoleValue_Register5)----------------------------------------�}�l��gid
	local kill=TargetID() 
	DelObj(t1)
	DelObj(t2)
	if Nowhp<=0 then 
		local bwn = LuaFunc_CreateObjByObj ( 102641 , sw )----------------------------------------------�}���o�إߤH
			SetModeEx( bwn  , EM_SetModeType_Gravity, true) ---���O
			SetModeEx( bwn  , EM_SetModeType_Mark, true)
			SetModeEx( bwn  , EM_SetModeType_HideName, true)
			SetModeEx( bwn  , EM_SetModeType_ShowRoleHead, true)
			SetModeEx( bwn  , EM_SetModeType_NotShowHPMP, true)
			SetModeEx( bwn  , EM_SetModeType_Strikback, true) ---����
			SetModeEx( bwn  , EM_SetModeType_Move, true) ---����	
			SetModeEx( bwn  , EM_SetModeType_Fight, true) ---�i���
			SetModeEx( bwn  , EM_SetModeType_SearchenemyIgnore, true) 
			SetModeEx( bwn  , EM_SetModeType_Searchenemy, true)
			SetModeEx( bwn  , EM_SetModeType_Show, true)
		WriteRoleValue( bwn ,EM_RoleValue_PID, bwa)	--�g�JPID
		WriteRoleValue(bwn, EM_RoleValue_HP,1)
		AddToPartition(bwn , RoomID )
		DelObj(sw)
		BeginPlot( bwn ,"Lua_bk_dw_ww1_102641",20)----��@����쨭�W�h-------------------�᭱�����@��
		WriteRoleValue(bwn , EM_RoleValue_Register5,st)--------------------------------------������m
		WriteRoleValue(bwn,EM_RoleValue_Register6,seat)
		SetPlot( bwn , "dead" , "Lua_bk_dw_ww_dd__102641" , 10 )-----------------------------------���T�@��
		KillID(kill , bwn )  ---����npc���O
	elseif Nowhp>0 then 
	local bwn = LuaFunc_CreateObjByObj ( 102641 , sw )----------------------------------------------�}���o�إߤH
	WriteRoleValue( bwn ,EM_RoleValue_PID, bwa)	--�g�JPID
	WriteRoleValue(bwn, EM_RoleValue_HP,Nowhp)
	AddToPartition(bwn , RoomID )
	DelObj(sw)
	BeginPlot( bwn ,"Lua_bk_dw_ww1_102641",20)----��@����쨭�W�h-------------------�᭱�����@��
	WriteRoleValue(bwn , EM_RoleValue_Register5,st)--------------------------------------������m
	WriteRoleValue(bwn,EM_RoleValue_Register6,seat)
	SetPlot( bwn , "dead" , "Lua_bk_dw_ww_dd__102641" , 10 )-----------------------------------���T�@��
	end
end
function Lua_bk_dd_sw_wr_102666()----------------------------------------------------�p���������O----------------------���~
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	
	local bwa=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local sw=OwnerID()
	local swb = Lua_DW_CreateObj("obj",102420,sw,0)
	SetModeEx( swb , EM_SetModeType_Show, true) ----�q�X
	SetModeEx( swb , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( swb , EM_SetModeType_Strikback, false) ---����
	SetModeEx( swb , EM_SetModeType_Move, false) ---����	
	SetModeEx( swb , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( swb , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( swb , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( swb , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( swb , EM_SetModeType_Searchenemy, false)  ---���
	AddToPartition(swb , RoomID )
	
	sysCastSpellLv(swb,swb,494386,0)
	BeginPlot( swb ,"Lua_bk_de_sw_wr_102666",30)----��@����쨭�W�h
	DelObj(sw)
end
function Lua_bk_de_sw_wr_102666()----------------------------------�R��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local swb = OwnerID()
	
	sleep(20)
	DelObj(swb)
end
function Lua_bk_sw_102666()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	
	local bwa=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local sw=OwnerID()
	local time1=0
	local Play_Chose={}
	local kp=0
	while 1 do 
	sleep(10)
		if HateListCount( sw ) ~= 0 then
			time1=time1+1
			if time1>=3 then
			Play_Chose=DW_HateRemain(0)-------------------------------Ū�������Ҧ��H		
			kp=DW_Rand(table.getn(Play_Chose))
			CastSpellLV( OwnerID() , Play_Chose[kp] , 493999 , 1000 )---------�H�����@��
			sleep(30)
			end
		elseif HateListCount( sw ) == 0 then----------------���}�԰� �Ҧ��ȳ��Ӧ^�k
			DelObj(sw)
		end
	end
end
function Lua_bk_sw_ri_102666()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	
	local bw=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local sw=OwnerID()
	local time1=0
	local Play_Chose={}
	local kp=0
	while 1 do 
	sleep(10)
		if HateListCount( sw ) ~= 0 then
			time1=time1+1
			if time1>=3 then
			Play_Chose=DW_HateRemain(0)-------------------------------Ū�������Ҧ��H		
			kp=DW_Rand(table.getn(Play_Chose))
			CastSpellLV( OwnerID() , Play_Chose[kp] , 493999 , 1000 )---------�H�����@��
			sleep(30)
			end
		elseif HateListCount( sw ) == 0 then----------------���}�԰� �Ҧ��ȳ��Ӧ^�k
			sleep(20)
			seat=ReadRoleValue(bw,EM_RoleValue_Register6)----------------------------------------Ū�����O�ĴX�Ӧ�m
			--WriteRoleValue(bw, EM_RoleValue_Register4,1)	-----------------------------------���T�����}�԰� �N��j�a�������F!!!
			local bwn = CreateObjByFlag(102641,780449,seat,1)------------------------------------10�Ӧa��h���ͪ���
			WriteRoleValue( bwn ,EM_RoleValue_PID, bw)	--�g�JPID
			BeginPlot( bwn,"Lua_bk_dw_ww_102641",10)
			AddToPartition(bwn , RoomID )
			SetPlot( bwn , "dead" , "Lua_bk_dw_ww_dd__102641" , 10 )-----------------------------------���T�@��
			sleep(20)
			DelObj(sw)
		end
	end
end
function Lua_bk_dw_ww1_102641()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
	local bw = OwnerID()
	local bwa=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local time1=0
	local Skill={493996,494000,493999}
	local skilllv={1400,1400,1000}
	local Luck= 0
	while 1 do 
	sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�
		local BossTarget=AttackTarget
		if HateListCount( bw ) ~= 0 then
		time1=time1+1
			if time1>=5 then 
				Luck=DW_Rand(100)
					if (Luck >= 0 and Luck < 25) then
						SkillIndex = 2-------------------------------------------
						CastSpellLV( OwnerID() , OwnerID() , Skill[SkillIndex] , skilllv[SkillIndex] )
						sleep(20)
					elseif (Luck >= 75 and Luck < 101) then	
						SkillIndex = 1-------------------------------------------
						CastSpellLV( OwnerID() , OwnerID() , Skill[SkillIndex] , skilllv[SkillIndex] )
						sleep(20)
					elseif (Luck >= 50 and Luck < 75) or (Luck >= 25 and Luck < 50) then 
						SkillIndex = 3-------------------------------------------
						BossTarget=AttackTarget
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , skilllv[SkillIndex] )
						sleep(20)
					end
					
				time1=0
			end	
		elseif HateListCount( bw ) == 0 then----------------���}�԰� �Ҧ��ȳ��Ӧ^�k
		sleep(20)
		local bwater = LuaFunc_CreateObjByObj ( 102641 , bwa )----------------------------------------------�}���o�إߤH
		SetModeEx( bwater , EM_SetModeType_Gravity, true) ---���O
		SetModeEx( bwater , EM_SetModeType_Mark, true)
		SetModeEx( bwater , EM_SetModeType_HideName, true)
		SetModeEx( bwater , EM_SetModeType_ShowRoleHead, true)
		SetModeEx( bwater , EM_SetModeType_NotShowHPMP, true)
		SetModeEx( bwater , EM_SetModeType_Strikback, true) ---����
		SetModeEx( bwater , EM_SetModeType_Move, true) ---����	
		SetModeEx( bwater , EM_SetModeType_Fight, true) ---�i���
		SetModeEx( bwater , EM_SetModeType_SearchenemyIgnore, true) 
		SetModeEx( bwater , EM_SetModeType_Searchenemy, true)
		SetModeEx( bwater , EM_SetModeType_Show, true)
		WriteRoleValue( bwater ,EM_RoleValue_PID, bwa)	--�g�JPID
		AddToPartition(bwater , RoomID )
		BeginPlot( bwater,"Lua_bk_dw_ww_102641",10)
		SetPlot( bwater , "dead" , "Lua_bk_dw_ww_dd__102641" , 10 )-----------------------------------���T�@��
		DelObj(bw)
		end	
	end
end



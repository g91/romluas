-----------EM_RoleValue_Register1   �s����ת�
--------------------------�ϥΣ��Ӫk�N�h�P�wŪ���h�[�W�L10���a���`�C�hŪ1��h�W�[���a����O
-----1��40��ϥ�5���O��@�U�쩳�ݭn�h�֪��q
------�ĤG���q�Ť��S�Ĳy�ϥΥ��u�������a�W���H�s���������������u������
function Lua_bk_spid_start_102706()-------------------�׺ݱ��
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local start = OwnerID()
	local afdoor = CreateObjByFlag(102914,780449,2,1)
	SetModeEx( afdoor , EM_SetModeType_Gravity, false) ---���O
	SetModeEx( afdoor , EM_SetModeType_Mark, false)
	SetModeEx( afdoor , EM_SetModeType_HideName, false)
	SetModeEx( afdoor , EM_SetModeType_ShowRoleHead, false)
	SetModeEx( afdoor , EM_SetModeType_NotShowHPMP, false)
	SetModeEx( afdoor , EM_SetModeType_Obstruct, true)   -----���O
	SetModeEx( afdoor , EM_SetModeType_Strikback, false) ---����
	SetModeEx( afdoor , EM_SetModeType_Move, false) ---����	
	SetModeEx( afdoor , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( afdoor , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( afdoor , EM_SetModeType_Searchenemy, false)
	SetModeEx( afdoor , EM_SetModeType_Show, true)
	AddToPartition( afdoor , RoomID )
	local boss = CreateObjByFlag(102706,780449,1,1)
	AddToPartition( boss , RoomID )
	WriteRoleValue( boss, EM_RoleValue_PID,start)
	BeginPlot( boss ,"Lua_bk_spid_102706",0)---------------------------------���@���Ҧ�
	SetPlot( boss , "dead" , "Lua_bk_spid_dead_102706" , 10 )
	local x=0
	while 1 do 
	sleep(10)
		local x=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
		if x==1 then
			local boss = CreateObjByFlag(102706,780449,1,1)
			AddToPartition( boss , RoomID )
			WriteRoleValue( boss, EM_RoleValue_PID,start)
			BeginPlot( boss ,"Lua_bk_spid_102706",0)---------------------------------���@���Ҧ�
			SetPlot( boss , "dead" , "Lua_bk_spid_dead_102706" , 10 )
			WriteRoleValue(start, EM_RoleValue_Register1,0)	
			x=0
			sleep(50)
		end
		if x==2 then 	
			local PPL = SetSearchAllPlayer(RoomID)
			for i = 1 , PPL , 1 do 
				local ID = GetSearchResult()
				CancelBuff(ID , 505037 )
			end	
			Delobj(afdoor)
			WriteRoleValue(start, EM_RoleValue_Register1,3)	
		end	
	end
end
function Lua_bk_spid_dead_102706()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local boss=OwnerID()
	local door=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	WriteRoleValue(start, EM_RoleValue_Register1,2)	
	DelObj(door)
end

function Lua_bk_mam1_102882()------------------�Ԥh-----���}�l���o�䤳���
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
local war=OwnerID()
local boss=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
local bt=ReadRoleValue(OwnerID(),EM_RoleValue_PID)------------------�Q�j���H
local time1=0
local power=0
local skill={494510,494511}-----------1.���鮣�� 2.�C���a��
local SkillIndex
local Play_Chose={}
local kp=0
local Luck=0
	AddBuff(war,505100,0,-1)
	while 1 do
	sleep(10)
		if ReadRoleValue( bt , EM_RoleValue_IsPlayer) == 1 and 
			CheckBuff( boss,505121) == true then ---------------------�T�w�j�Hbuff���s�b
			AddBuff(war,505038,0,-1)----------------�[�j�@��buff
			power=power+1
		elseif ReadRoleValue( bt , EM_RoleValue_IsPlayer) == 0 or 
				CheckBuff( boss,505121) == false then 
				CancelBuff(bt,505036)
				AddBuff(bt,505042,0,10)----------------�I�z
			   break
		end
	end
	SetModeEx( war , EM_SetModeType_Strikback, true) ---����
	SetModeEx( war , EM_SetModeType_Move, true) ---����	
	SetModeEx( war , EM_SetModeType_Fight, true) ---�i���
	SetModeEx(  war , EM_SetModeType_Searchenemy, true )--����
	SetAttack( OwnerID() , bt)
	sleep(50)
	while 1 do 
	sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�
		local BossTarget=AttackTarget
		if HateListCount( war ) ~= 0 then	---- �T�w�L�{�b�����H
			time1=time1+1-------------------------�ɶ�
			if time1>= 10 then ----------------�z�P����
			Luck=DW_Rand(100)
				if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
					SkillIndex = 2-------------------------------------------���饴���ˮ`
					Play_Chose=DW_HateRemain(0)
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then 
					end
					if kp~=0 then 
					CastSpellLV( OwnerID() , Play_Chose[kp] , 494511, 0 )
					sleep(20)
					end
				elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
					SkillIndex = 1-------------------------------------------���饴���ˮ`
					CastSpellLV( OwnerID() , OwnerID() , Skill[SkillIndex] , power )
				end
				
			end
		elseif HateListCount( war ) == 0 then
		sleep(20)
		DelObj(war)
		end
	end
end
function Lua_bk_mam2_102883()-------------------�C�L
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
local boss=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
local bt=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local sco=OwnerID()
local time1=0
local power=0
local Play_Chose={}
local m=0
local range=0
local htemp
local x
local kp
local Luck
	AddBuff(sco,505101,0,-1)
	while 1 do
	sleep(10)
		if ReadRoleValue( bt , EM_RoleValue_IsPlayer) == 1 and 
			CheckBuff( boss,505121) == true then ---------------------�T�w�j�Hbuff���s�b
			AddBuff(sco,505038,0,-1)----------------�[�j�@��buff
			power=power+1
		elseif ReadRoleValue( bt , EM_RoleValue_IsPlayer) == 0 or 
				CheckBuff( boss,505121) == false then 
				CancelBuff(bt,505036)
				AddBuff(bt,505042,0,10)----------------�I�z
			   break
		end
	end
	SetModeEx( sco , EM_SetModeType_Strikback, true) ---����
	SetModeEx( sco , EM_SetModeType_Move, true) ---����	
	SetModeEx( sco , EM_SetModeType_Fight, true) ---�i���
	SetModeEx( sco , EM_SetModeType_Searchenemy, true )--����
	SetAttack( OwnerID() , bt)
	sleep(50)
	while 1 do 
	sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�
		local BossTarget=AttackTarget
		if HateListCount( sco ) ~= 0 then	---- �T�w�L�{�b�����H
		time1=time1+1-------------------------�ɶ�
			if time1>= 10 then ----------------�z�P����
				Luck=DW_Rand(100)
				if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
					Play_Chose=DW_HateRemain(0)
					m=table.getn(Play_Chose)-----------����X
					if m==0 then 
						
					elseif m==1 then 
						CastSpellLV( sco , Play_Chose[1] , 494512 , 0 )
					elseif m>=2 then
						for i=1,m do
							sleep(5)
							---say(ownerid(),"m="..m)
							x=GetDistance(sco,Play_Chose[i])
							if range > x then
								
							elseif range < x then
								range=x
								htemp=Play_Chose[i]
							end
						end
						CastSpellLV( sco , htemp , 494512 , 0 )
					end
				elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
					Play_Chose=DW_HateRemain(0)
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then 
					end
					if kp~=0 then 
					CastSpellLV( OwnerID() , Play_Chose[kp] , 494513 , 0 )
					sleep(20)
					end
				end
				time1=0
			end
		elseif HateListCount( sco ) == 0 then
		sleep(20)
		DelObj(sco)
		end
	end
end
function Lua_bk_mam3_102884()-------------------�v��
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
local boss=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
local rog=OwnerID()
local bt=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local time1=0
local power=0
local skill={494510,494530}-----------1.����2.�@�r�X��
local SkillIndex
local Play_Chose={}
local kp
local Luck
	AddBuff(rog,505102,0,-1)
	while 1 do
	sleep(10)
		if ReadRoleValue( bt , EM_RoleValue_IsPlayer) == 1 and 
			CheckBuff( boss,505121) == true then ---------------------�T�w�j�Hbuff���s�b
			AddBuff(rog,505038,0,-1)----------------�[�j�@��buff
			power=power+1
		elseif ReadRoleValue( bt , EM_RoleValue_IsPlayer) == 0 or 
				CheckBuff( boss,505121) == false then 
				CancelBuff(bt,505036)
				AddBuff(bt,505042,0,10)----------------�I�z
			   break
		end
	end
	SetModeEx( rog , EM_SetModeType_Strikback, true) ---����
	SetModeEx( rog , EM_SetModeType_Move, true) ---����	
	SetModeEx( rog , EM_SetModeType_Fight, true) ---�i���
	SetModeEx(  rog , EM_SetModeType_Searchenemy, true )--����
	SetAttack( OwnerID() , bt)
	sleep(50)
	while 1 do 
	sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�
		local BossTarget=AttackTarget
		if HateListCount( rog ) ~= 0 then	---- �T�w�L�{�b�����H
		time1=time1+1-------------------------�ɶ�
			if time1>= 10 then ----------------�@�r�X��
				Luck=DW_Rand(100)
				if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
					SkillIndex = 2-------------------------------------------���饴���ˮ`
					BossTarget = AttackTarget
					CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , power )
					sleep(20)
				elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
					SkillIndex = 1 ----�X�Щ񳴨�
					Play_Chose=DW_HateRemain(0)
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then 
					end
					if kp~=0 then 
					CastSpellLV( OwnerID() , Play_Chose[kp] , 494544 , 0 )
					sleep(10)
					end
					local Temp=Lua_Davis_BornByMultilateral( 102910 , 10 , 50 )	----�X�{10�ӳ���
					SetModeEx( Temp[1] , EM_SetModeType_Mark, false) ----�аO
					SetModeEx( Temp[1] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
					SetModeEx( Temp[1] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
					SetModeEx( Temp[1] , EM_SetModeType_Strikback, false) ---����
					SetModeEx( Temp[1] , EM_SetModeType_Move, false) ---����	
					SetModeEx( Temp[1] , EM_SetModeType_Fight, false) ---�i���
					SetModeEx(  Temp[1] , EM_SetModeType_Searchenemy, false )--����
					SetModeEx( Temp[1] , EM_SetModeType_Show, false)
					WriteRoleValue(Temp[1], EM_RoleValue_Livetime,3)	---------------�s�b�ɶ�livetime
					BeginPlot( Temp[1] , "Lua_bk_rog_102884_1",0)---------------------------------�I��k�N�@��
					SetModeEx( Temp[2] , EM_SetModeType_Mark, false) ----�аO
					SetModeEx( Temp[2] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
					SetModeEx( Temp[2] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
					SetModeEx( Temp[2] , EM_SetModeType_Strikback, false) ---����
					SetModeEx( Temp[2] , EM_SetModeType_Move, false) ---����	
					SetModeEx( Temp[2] , EM_SetModeType_Fight, false) ---�i���
					SetModeEx(  Temp[2] , EM_SetModeType_Searchenemy, false )--����
					SetModeEx( Temp[2] , EM_SetModeType_Show, false)
					WriteRoleValue(Temp[2], EM_RoleValue_Livetime,3)	---------------�s�b�ɶ�livetime
					BeginPlot( Temp[2] , "Lua_bk_rog_102884_2",0)---------------------------------�I��k�N�@��
					SetModeEx( Temp[3] , EM_SetModeType_Mark, false) ----�аO
					SetModeEx( Temp[3] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
					SetModeEx( Temp[3] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
					SetModeEx( Temp[3] , EM_SetModeType_Strikback, false) ---����
					SetModeEx( Temp[3] , EM_SetModeType_Move, false) ---����	
					SetModeEx( Temp[3] , EM_SetModeType_Fight, false) ---�i���
					SetModeEx(  Temp[3] , EM_SetModeType_Searchenemy, false )--����
					SetModeEx( Temp[3] , EM_SetModeType_Show, false)
					WriteRoleValue(Temp[3], EM_RoleValue_Livetime,3)	---------------�s�b�ɶ�livetime
					BeginPlot( Temp[3] , "Lua_bk_rog_102884_1",0)---------------------------------�I��k�N�@��
					SetModeEx( Temp[4] , EM_SetModeType_Mark, false) ----�аO
					SetModeEx( Temp[4] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
					SetModeEx( Temp[4] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
					SetModeEx( Temp[4] , EM_SetModeType_Strikback, false) ---����
					SetModeEx( Temp[4] , EM_SetModeType_Move, false) ---����	
					SetModeEx( Temp[4] , EM_SetModeType_Fight, false) ---�i���
					SetModeEx(  Temp[4] , EM_SetModeType_Searchenemy, false )--����
					SetModeEx( Temp[4] , EM_SetModeType_Show, false)
					WriteRoleValue(Temp[4], EM_RoleValue_Livetime,3)	---------------�s�b�ɶ�livetime
					BeginPlot( Temp[4] , "Lua_bk_rog_102884_2",0)---------------------------------�I��k�N�@��
					SetModeEx( Temp[5] , EM_SetModeType_Mark, false) ----�аO
					SetModeEx( Temp[5] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
					SetModeEx( Temp[5] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
					SetModeEx( Temp[5] , EM_SetModeType_Strikback, false) ---����
					SetModeEx( Temp[5] , EM_SetModeType_Move, false) ---����	
					SetModeEx( Temp[5] , EM_SetModeType_Fight, false) ---�i���
					SetModeEx(  Temp[5] , EM_SetModeType_Searchenemy, false )--����
					SetModeEx( Temp[5] , EM_SetModeType_Show, false)
					WriteRoleValue(Temp[5], EM_RoleValue_Livetime,3)	---------------�s�b�ɶ�livetime
					BeginPlot( Temp[5] , "Lua_bk_rog_102884_1",0)---------------------------------�I��k�N�@��
					SetModeEx( Temp[6] , EM_SetModeType_Mark, false) ----�аO
					SetModeEx( Temp[6] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
					SetModeEx( Temp[6] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
					SetModeEx( Temp[6] , EM_SetModeType_Strikback, false) ---����
					SetModeEx( Temp[6] , EM_SetModeType_Move, false) ---����	
					SetModeEx( Temp[6] , EM_SetModeType_Fight, false) ---�i���
					SetModeEx(  Temp[6] , EM_SetModeType_Searchenemy, false )--����
					SetModeEx( Temp[6] , EM_SetModeType_Show, false)
					WriteRoleValue(Temp[6], EM_RoleValue_Livetime,3)	---------------�s�b�ɶ�livetime
					BeginPlot( Temp[6] , "Lua_bk_rog_102884_2",0)---------------------------------�I��k�N�@��
					SetModeEx( Temp[7] , EM_SetModeType_Mark, false) ----�аO
					SetModeEx( Temp[7] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
					SetModeEx( Temp[7] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
					SetModeEx( Temp[7] , EM_SetModeType_Strikback, false) ---����
					SetModeEx( Temp[7] , EM_SetModeType_Move, false) ---����	
					SetModeEx( Temp[7] , EM_SetModeType_Fight, false) ---�i���
					SetModeEx(  Temp[7] , EM_SetModeType_Searchenemy, false )--����
					SetModeEx( Temp[7] , EM_SetModeType_Show, false)
					WriteRoleValue(Temp[7], EM_RoleValue_Livetime,3)	---------------�s�b�ɶ�livetime
					BeginPlot( Temp[7] , "Lua_bk_rog_102884_1",0)---------------------------------�I��k�N�@��
					SetModeEx( Temp[8] , EM_SetModeType_Mark, false) ----�аO
					SetModeEx( Temp[8] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
					SetModeEx( Temp[8] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
					SetModeEx( Temp[8] , EM_SetModeType_Strikback, false) ---����
					SetModeEx( Temp[8] , EM_SetModeType_Move, false) ---����	
					SetModeEx( Temp[8] , EM_SetModeType_Fight, false) ---�i���
					SetModeEx(  Temp[8] , EM_SetModeType_Searchenemy, false )--����
					SetModeEx( Temp[8] , EM_SetModeType_Show, false)
					WriteRoleValue(Temp[8], EM_RoleValue_Livetime,3)	---------------�s�b�ɶ�livetime
					BeginPlot( Temp[8] , "Lua_bk_rog_102884_2",0)---------------------------------�I��k�N�@��
					SetModeEx( Temp[9] , EM_SetModeType_Mark, false) ----�аO
					SetModeEx( Temp[9] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
					SetModeEx( Temp[9] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
					SetModeEx( Temp[9] , EM_SetModeType_Strikback, false) ---����
					SetModeEx( Temp[9] , EM_SetModeType_Move, false) ---����	
					SetModeEx( Temp[9] , EM_SetModeType_Fight, false) ---�i���
					SetModeEx(  Temp[9] , EM_SetModeType_Searchenemy, false )--����
					SetModeEx( Temp[9] , EM_SetModeType_Show, false)
					WriteRoleValue(Temp[9], EM_RoleValue_Livetime,3)	---------------�s�b�ɶ�livetime
					BeginPlot( Temp[9] , "Lua_bk_rog_102884_1",0)---------------------------------�I��k�N�@��
					SetModeEx( Temp[10] , EM_SetModeType_Mark, false) ----�аO
					SetModeEx( Temp[10] , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
					SetModeEx( Temp[10] , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
					SetModeEx( Temp[10] , EM_SetModeType_Strikback, false) ---����
					SetModeEx( Temp[10] , EM_SetModeType_Move, false) ---����	
					SetModeEx( Temp[10] , EM_SetModeType_Fight, false) ---�i���
					SetModeEx(  Temp[10] , EM_SetModeType_Searchenemy, false )--����
					SetModeEx( Temp[10] , EM_SetModeType_Show, false)
					WriteRoleValue(Temp[10], EM_RoleValue_Livetime,3)	---------------�s�b�ɶ�livetime
					BeginPlot( Temp[10] , "Lua_bk_rog_102884_2",0)---------------------------------�I��k�N�@��
				end
				time1=0
			end
			
		elseif HateListCount( rog ) == 0 then
	
		sleep(20)
		DelObj(rog)
		end
	end
end
function Lua_bk_mam4_102885()-------------------�k�v
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
local boss=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
local mag=OwnerID()
local bt=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local time1=0
local time2=0
local power=0
local skill={494531,494532,494543}-----------1.�ǰe�N2.���3.�q?�N
local SkillIndex
local Luck
	AddBuff(mag,505103,0,-1)
	while 1 do
	sleep(10)
		if ReadRoleValue( bt , EM_RoleValue_IsPlayer) == 1 and 
			CheckBuff( boss,505121) == true then ---------------------�T�w�j�Hbuff���s�b
			AddBuff(mag,505038,0,-1)----------------�[�j�@��buff
			power=power+1
		elseif ReadRoleValue( bt , EM_RoleValue_IsPlayer) == 0 or 
				CheckBuff( boss,505121) == false then 
				CancelBuff(bt,505036)
				AddBuff(bt,505042,0,10)----------------�I�z
			   break
		end
	end
	SetModeEx( mag , EM_SetModeType_Strikback, true) ---����
	SetModeEx( mag , EM_SetModeType_Move, true) ---����	
	SetModeEx( mag , EM_SetModeType_Fight, true) ---�i���
	SetModeEx(  mag , EM_SetModeType_Searchenemy, true )--����
	SetAttack( OwnerID() , bt)
	sleep(50)
	while 1 do 
	sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�
		local BossTarget=AttackTarget
		if HateListCount( mag ) ~= 0 then	---- �T�w�L�{�b�����H
		time1=time1+1-------------------------�ɶ�
		time2=time2+1
			if time2>12 then 
				SkillIndex = 1 ----�q?�N
				CastSpellLV( OwnerID() , OwnerID() , Skill[SkillIndex] , 0 )
				time2=0
			end
			if time1>= 7 then
				Luck=DW_Rand(100)
				if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
					SkillIndex = 2 ---------------------���
					BossTarget = AttackTarget
					CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , power )
					sleep(20)
				elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
					SkillIndex = 3 ----�q?�N
					CastSpellLV( OwnerID() , OwnerID() , Skill[SkillIndex] , power )
				end
				time1=0
			end
		elseif HateListCount( mag ) == 0 then
		sleep(20)
		DelObj(mag)
		end
	end
end
function Lua_bk_mam5_102886()-------------------���q
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
local boss=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
local pri=OwnerID()
local bt=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local time1=0
local power=0
local skill={494533,494534}-----------1���ƶA�G2.�c�]�s�q
local SkillIndex
local Play_Chose={}
local kp=0
local Luck
	AddBuff(pri,505104,0,-1)
	while 1 do
	sleep(10)
		if ReadRoleValue( bt , EM_RoleValue_IsPlayer) == 1 and 
			CheckBuff( boss,505121) == true then ---------------------�T�w�j�Hbuff���s�b
			AddBuff(pri,505038,0,-1)----------------�[�j�@��buff
			power=power+1
		elseif ReadRoleValue( bt , EM_RoleValue_IsPlayer) == 0 or 
				CheckBuff( boss,505121) == false then 
				CancelBuff(bt,505036)
				AddBuff(bt,505042,0,10)----------------�I�z
			   break
		end
	end
	SetModeEx( pri , EM_SetModeType_Strikback, true) ---����
	SetModeEx( pri , EM_SetModeType_Move, true) ---����	
	SetModeEx( pri , EM_SetModeType_Fight, true) ---�i���
	SetModeEx(  pri , EM_SetModeType_Searchenemy, true )--����
	SetAttack( OwnerID() , bt)
	sleep(50)
	while 1 do 
	sleep(10)
	local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�
	local BossTarget=AttackTarget
		if HateListCount( pri ) ~= 0 then	---- �T�w�L�{�b�����H
		time1=time1+1-------------------------�ɶ�
			if time1>= 10 then
				Luck=DW_Rand(100)
				if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
					SkillIndex = 1 ---------------------���ƶA�G
					Play_Chose=DW_HateRemain(0)
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then 
					end
					if kp~=0 then 
					CastSpellLV( OwnerID() , Play_Chose[kp] , Skill[SkillIndex] , power )
					sleep(20)
					end
				elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
					SkillIndex = 2 ----.�c�]�s�q
					CastSpellLV( OwnerID() , OwnerID() , Skill[SkillIndex] , power )
				end
				time1=0
			end
		elseif HateListCount( pri ) == 0 then
		sleep(20)
		DelObj(pri)
		end
	end
end
function Lua_bk_mam6_102887()-------------------�M�h
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
local boss=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
local kni=OwnerID()
local bt=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local time1=0
local power=0
local skill={494535,494536}-----------1�ľW2.���르��
local SkillIndex
local Play_Chose={}
local kp=0
local Luck
	AddBuff(kni,505105,0,-1)
	while 1 do
	sleep(10)
		if ReadRoleValue( bt , EM_RoleValue_IsPlayer) == 1 and 
			CheckBuff( boss,505121) == true then ---------------------�T�w�j�Hbuff���s�b
			AddBuff(kni,505038,0,-1)----------------�[�j�@��buff
			power=power+1
		elseif ReadRoleValue( bt , EM_RoleValue_IsPlayer) == 0 or 
				CheckBuff( boss,505121) == false then 
				CancelBuff(bt,505036)
				AddBuff(bt,505042,0,10)----------------�I�z
			   break
		end
	end
	SetModeEx( kni , EM_SetModeType_Strikback, true) ---����
	SetModeEx( kni , EM_SetModeType_Move, true) ---����	
	SetModeEx( kni , EM_SetModeType_Fight, true) ---�i���
	SetModeEx(  kni , EM_SetModeType_Searchenemy, true )--����
	SetAttack( OwnerID() , bt)
	sleep(50)
	while 1 do 
	sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�
		local BossTarget=AttackTarget
		if HateListCount( kni ) ~= 0 then	---- �T�w�L�{�b�����H
		time1=time1+1-------------------------�ɶ�
			if time1>= 10 then
				Luck=DW_Rand(100)
				if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
					SkillIndex = 1 ---------------------�ľW
					Play_Chose=DW_HateRemain(1)----------�����h���D�Z
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then 
					end
					if kp~=0 then 
					CastSpellLV( OwnerID() , Play_Chose[kp] , Skill[SkillIndex] , power )
					sleep(20)
					end
				elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
					SkillIndex = 2 ----.���르��
					Play_Chose=DW_HateRemain(1)----------�����h���D�Z
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then 
					end
					if kp~=0 then 
					CastSpellLV( OwnerID() , Play_Chose[kp] , Skill[SkillIndex] , power )
					sleep(20)
					end
				end
				time1=0
			end
		elseif HateListCount( kni ) == 0 then
		sleep(20)
		DelObj(kni)
		end
	end
end
function Lua_bk_mam7_102888()------------------����--�۩ۼ�
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
local boss=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
local warden=OwnerID()
local bt=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local time1=0
local power=0
local skill={494537,494538}-----------1�l��۵M����2.�y��
local SkillIndex
local Play_Chose={}
local kp=0
local Luck
local petnu
local pet ----------�d���N�X
	AddBuff(warden,505106,0,-1)
	while 1 do
	sleep(10)
		if ReadRoleValue( bt , EM_RoleValue_IsPlayer) == 1 and 
			CheckBuff( boss,505121) == true then ---------------------�T�w�j�Hbuff���s�b
			AddBuff(warden,505038,0,-1)----------------�[�j�@��buff
			power=power+1
		elseif ReadRoleValue( bt , EM_RoleValue_IsPlayer) == 0 or 
				CheckBuff( boss,505121) == false then 
				CancelBuff(bt,505036)
				AddBuff(bt,505042,0,10)----------------�I�z
			   break
		end
	end
	SetModeEx( warden , EM_SetModeType_Strikback, true) ---����
	SetModeEx( warden , EM_SetModeType_Move, true) ---����	
	SetModeEx( warden , EM_SetModeType_Fight, true) ---�i���
	SetModeEx( warden , EM_SetModeType_Searchenemy, true )--����
	SetAttack( OwnerID() , bt)
	sleep(50)
	while 1 do 
	sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�
		local BossTarget=AttackTarget
		if HateListCount( warden ) ~= 0 then	---- �T�w�L�{�b�����H
		time1=time1+1-------------------------�ɶ�
			if time1>= 15 then
				Luck=DW_Rand(100)
				if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
					SkillIndex = 1 ---------------------�l��۵M����
					CastSpellLV( OwnerID() , OwnerID() , Skill[SkillIndex] , 0 )------�ϥΩ۳�N  
					petnu=DW_Rand(3)
					if petnu==1 then 
					local pet =LuaFunc_CreateObjByObj (  102911 , OwnerID() )------------�k��H,������,�]���C
					BeginPlot( pet ,"Lua_bk_fd_sm_102760",50)
					end
					if petnu==2 then 
					local pet =LuaFunc_CreateObjByObj (  102912 , OwnerID() )------------�k��H,�����C,�]����
					BeginPlot( pet ,"Lua_bk_fd_sm_102760",50)
					end
					if petnu==3 then 
					local pet =LuaFunc_CreateObjByObj (  102913 , OwnerID() )------------�۵M�����q�@�w�ɶ����z��
					BeginPlot( pet ,"Lua_bk_fd_sm_102760",50)
					end
				elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
					SkillIndex = 2 ----.�y��
					Play_Chose=DW_HateRemain(0)
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then 
					end
					if kp~=0 then 
					CastSpellLV( OwnerID() , Play_Chose[kp] , Skill[SkillIndex] , 0 )
					sleep(20)
					end
				end
				time1=0
			end
		elseif HateListCount( warden ) == 0 then
		sleep(20)
		DelObj(warden)
		end
	end
end
function Lua_bk_mam8_102889()------------------���x
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
local boss=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
local dru=OwnerID()
local bt=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local time1=0
local power=0
local skill={494539,494540}-----------1�F�Щ۳�2.�����R�q
local SkillIndex
local Play_Chose={}
local kp=0
local Luck
local x0
local y0
local z0 
local dir0

	AddBuff(dru,505107,0,-1)
	while 1 do
	sleep(10)
		if ReadRoleValue( bt , EM_RoleValue_IsPlayer) == 1 and 
			CheckBuff( boss,505121) == true then ---------------------�T�w�j�Hbuff���s�b
			AddBuff(dru,505038,0,-1)----------------�[�j�@��buff
			power=power+1
		elseif ReadRoleValue( bt , EM_RoleValue_IsPlayer) == 0 or 
				CheckBuff( boss,505121) == false then 
				CancelBuff(bt,505036)
				AddBuff(bt,505042,0,10)----------------�I�z
			   break
		end
	end
	SetModeEx( dru , EM_SetModeType_Strikback, true) ---����
	SetModeEx( dru , EM_SetModeType_Move, true) ---����	
	SetModeEx( dru , EM_SetModeType_Fight, true) ---�i���
	SetModeEx( dru , EM_SetModeType_Searchenemy, true )--����
	SetAttack( OwnerID() , bt)
	sleep(50)
	while 1 do 
	sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�
		local BossTarget=AttackTarget
		if HateListCount( dru ) ~= 0 then	---- �T�w�L�{�b�����H
		time1=time1+1-------------------------�ɶ�
			if time1>= 10 then
				Luck=DW_Rand(100)
				if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
					SkillIndex = 1 ---------------------�F�Щ۳�
					Play_Chose=DW_HateRemain(0)
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then 
					end
					if kp~=0 then 
					BossTarget = Play_Chose[kp]		
					-------------------------------------
					x0=ReadRoleValue(Play_Chose[kp],EM_RoleValue_X)
					y0=ReadRoleValue(Play_Chose[kp],EM_RoleValue_Y)
					z0=ReadRoleValue(Play_Chose[kp],EM_RoleValue_Z)
					dir0=ReadRoleValue(Play_Chose[kp],EM_RoleValue_Dir)
					local cst=CreateObj(102910,x0,y0,z0,dir0,1)------------------�Ҽ{�W�ӼаO
					SetModeEx( cst , EM_SetModeType_Gravity, false) ---���O
					SetModeEx( cst , EM_SetModeType_Mark, false)
					SetModeEx( cst , EM_SetModeType_HideName, false)
					SetModeEx( cst , EM_SetModeType_ShowRoleHead, false)
					SetModeEx( cst , EM_SetModeType_NotShowHPMP, false)
					SetModeEx( cst , EM_SetModeType_Obstruct, true)   -----���O
					SetModeEx( cst , EM_SetModeType_Strikback, false) ---����
					SetModeEx( cst , EM_SetModeType_Move, false) ---����	
					SetModeEx( cst , EM_SetModeType_Fight, false) ---�i���
					SetModeEx( cst , EM_SetModeType_SearchenemyIgnore, false) 
					SetModeEx( cst , EM_SetModeType_Searchenemy, false)
					SetModeEx( cst , EM_SetModeType_Show, true)
					AddToPartition(cst , RoomID )
					WriteRoleValue(cst, EM_RoleValue_Livetime,10)	---------------�s�b�ɶ�livetime
					CastSpellLV( cst , cst , 494539 , power )
					end
				elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 101) then	
					SkillIndex = 2 ----.�����R�q
					Play_Chose=DW_HateRemain(0)
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then 
					end
					if kp~=0 then 
					CastSpellLV( OwnerID() , Play_Chose[kp] , Skill[SkillIndex] , 0 )
					sleep(20)
					end
				end
				time1=0
			end
		elseif HateListCount( dru ) == 0 then
		sleep(20)
		DelObj(dru)
		end
	end
end
function Lua_bk_rog_102884_1()
	CastSpellLV( OwnerID() , OwnerID() , 494541 , 0 )-----------�·�����
end
function Lua_bk_rog_102884_2()
	CastSpellLV( OwnerID() , OwnerID() , 494587 , 0 )-----------�@�r����
end
function Lua_bk_pet_100000()
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
local pet=OwnerID()
local time1=0
	while 1 do 
	sleep(10)
	time1=time1+1
		if time1>=10 then 
		CastSpellLV( OwnerID() , OwnerID() , Skill[SkillIndex] , 0 )----------�I��ۼɪk�N
		DelObj(pet)
		end
	end
end
function Lua_bk_sw_102840()
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
local boss=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local hate={}
local time1=0
local time2=0
local kp 
local m
	while 1 do
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�
		local BossTarget=AttackTarget
		time1=time1+1
		if time1>= 15 then 
			hate=star_HateListSort(boss)------------Ū������
			m=table.getn(hate)
			if m==0 then
				sleep(20)
				DelObj(OwnerID())
			elseif m==1 then 
				SetAttack( OwnerID() , hate[1]) 
				AddBuff(hate[1],505218,0,15)
				sysCastSpellLV(hate[1] ,OwnerID() , 494589 , 0 )-------------�J��
			elseif m>=2 then 
				table.remove (hate, 1)
				kp=DW_Rand(table.getn(hate))
				SetAttack( OwnerID() , hate[kp]) 
				AddBuff(hate[kp],505218,0,15)
				sysCastSpellLV(hate[kp] ,OwnerID() , 494589 , 0 )-------------�J��
			end
			time1=0
		end
		
	end
end

function Lua_bk_sw_102841()-----------�k�N�K��
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
local boss=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local hate={}
local time1=0
local time2=0
local kp 
local m
	while 1 do 
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�
		local BossTarget=AttackTarget
		time1=time1+1
		if time1>= 15 then 
			hate=star_HateListSort(boss)------------Ū������
			m=table.getn(hate)
			if m==0 then
				sleep(20)
				DelObj(OwnerID())
			elseif m==1 then 
				SetAttack( OwnerID() , hate[1]) 
				AddBuff(hate[1],505218,0,15)
				sysCastSpellLV(hate[1] ,OwnerID() , 494589 , 0 )-------------�J��
			elseif m>=2 then 
				table.remove (hate, 1)
				kp=DW_Rand(table.getn(hate))
				SetAttack( OwnerID() , hate[kp]) 
				AddBuff(hate[kp],505218,0,15)
				sysCastSpellLV(hate[kp] ,OwnerID() , 494589 , 0 )-------------�J��
			end
			time1=0
		end
		if time2 >= 8 then 
			CastSpellLV( OwnerID() ,OwnerID() , 494549 , 0 )
			time2=0
		end
	end
end
function Lua_bk_sw_102842()-----------���z�K��
local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
local boss=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local hate={}
local time1=0
local time2=0
local kp 
local m
	while 1 do 
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�
		local BossTarget=AttackTarget
		time1=time1+1
		time2=time2+1
		if time1>= 15 then 
			hate=star_HateListSort(boss)------------Ū������
			m=table.getn(hate)
			if m==0 then
				sleep(20)
				DelObj(OwnerID())
			elseif m==1 then 
				SetAttack( OwnerID() , hate[1]) 
				AddBuff(hate[1],505218,0,15)
				sysCastSpellLV(hate[1] ,OwnerID() , 494589 , 0 )-------------�J��
			elseif m>=2 then 
				table.remove (hate, 1)
				kp=DW_Rand(table.getn(hate))
				SetAttack( OwnerID() , hate[kp]) 
				AddBuff(hate[kp],505218,0,15)
				sysCastSpellLV(hate[kp] ,OwnerID() , 494589 , 0 )-------------�J��
			end
			time1=0
		end
		if time2 >= 8 then 
			CastSpellLV( OwnerID() ,OwnerID() , 494549 , 0 )
			time2=0
		end
		
	end
end
function Lua_bk_swsm_dead00_102706()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
	local boss=ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	local bossMaxHP = ReadRoleValue(boss , EM_RoleValue_MaxHP)
	local bossHP=ReadRoleValue(boss,EM_RoleValue_HP)
	local x=0
	x=bosshp/bossMaxHP
	if  x>0.05 then 
	WriteRoleValue( boss, EM_RoleValue_HP,bossHP-bossMaxHP*0.05)
	elseif x<=0.05 then 
	KillID(TargetID() , boss)
	end
end
function Lua_bk_swsm_dead01_102706()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
	local boss=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local bossMaxHP = ReadRoleValue(boss , EM_RoleValue_MaxHP)
	local bossHP=ReadRoleValue(boss,EM_RoleValue_HP)
	local x=0
	x=bosshp/bossMaxHP
	if  x>0.05 then 
	WriteRoleValue( boss, EM_RoleValue_HP,bossHP-bossMaxHP*0.05)
	elseif x<=0.05 then 
	KillID(TargetID() , boss)
	end
	---WriteRoleValue( boss, EM_RoleValue_HP,bossHP-bossMaxHP*0.05)
end
function Lua_bk_lig_505044()---------------���������u�g���P�w
	if CheckBuff( TargetID(), 505037) == true then 
		CancelBuff(TargetID() , 505037 )
		return false
	else
		return true
	end
end 
function Lua_bk_swip_buff_102706() ----�P�_�O�_��MP
	local Job = ReadRoleValue( TargetID() , EM_RoleValue_VOC )
	local Job_sub = ReadRoleValue( TargetID() , EM_RoleValue_VOC_SUB )
	if Job == 1 or Job_sub == 1 then
		AddBuff (TargetID() , 505239 , 0 , 3)--���ԤhSP
	end
	
	if Job == 2 or Job_sub == 2 then 
		AddBuff (TargetID() , 505240 , 0 , 3)--���C�LSP
	end
	
	if Job == 3 or Job_sub == 3 then 
		AddBuff (TargetID() , 505241 , 0 , 3)--���v���SP
	end
	
	if Job == 4 or Job == 5 or Job == 6 or Job == 7 or Job == 8	
	or Job_sub == 4 or Job_sub == 5 or Job_sub == 6 or Job_sub == 7 or Job_sub == 8 then
		AddBuff (TargetID() , 505238 , 0 , 3)--��MP
	end
end
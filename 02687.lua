function Dy_z25_bossshow()
	SetDefIdleMotion(OwnerID(),ruFUSION_ACTORSTATE_idle03) 
	sleep(30)
end
-----------------------------
function Dy_z25_bossAIC() --���
	local fight --�԰��P�_
	local fight1 = 0 --�}�ԧP�_
	local rush = 0 --�g�ɰO��
	local roomid = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) --Ū�X����b���@�h
	local Door = CreateObjByFlag( 103044 , 781152 , 2 , 1 ) ---�s���n�� �� Boss��� 
	local Door3 = CreateObjByFlag( 103044 , 781152 , 4 , 1 ) ---�s���n�� �� Boss���	
	local Door2 --�e��
--�����e������
	SetModeEx( Door , EM_SetModeType_Show, true) ----�q�X
	SetModeEx( Door , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( Door , EM_SetModeType_Strikback, false) ---����
	SetModeEx( Door , EM_SetModeType_Move, false) ---����	
	SetModeEx( Door , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( Door , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
	SetModeEx( Door , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( Door , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( Door , EM_SetModeType_Searchenemy, false)  ---����
	SetModeEx( Door   , EM_SetModeType_Obstruct, true )--����
	AddToPartition( Door,roomid )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register4 , Door)--�N������GID�x�s�ܱ����Register4���A�H��K���R����
		SetModeEx( Door3 , EM_SetModeType_Show, true) ----�q�X
	SetModeEx( Door3 , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( Door3 , EM_SetModeType_Strikback, false) ---����
	SetModeEx( Door3 , EM_SetModeType_Move, false) ---����	
	SetModeEx( Door3 , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( Door3 , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
	SetModeEx( Door3 , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( Door3 , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( Door3 , EM_SetModeType_Searchenemy, false)  ---����
	SetModeEx( Door3   , EM_SetModeType_Obstruct, true )--����
	local buffid = {622692,622693,622694,622695,622696,622697,622716,622717,622736}  --�����԰��n�R����Buff
	AddToPartition( Door3,roomid )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register4 , Door3)
	WriteRoleValue( OwnerID(), EM_RoleValue_Register2, 0)
	local ZoneID = ReadRoleValue ( OwnerID() , EM_RoleValue_ZoneID )
	local BossID
	if ZoneID == 151 then
		BossID = 106890
	elseif ZoneID == 152 then
		BossID = 107589
	elseif ZoneID == 153 then
		BossID = 107605
	end
--����BOSS����
	local Boss = CreateObjByFlag( BossID , 781152 , 1 , 1 ) ---�ͥXBoss (BOSS�s��  ,�X�нs�� ��N���X�� �ͥX�X�ө�)
	SetModeEx( Boss , EM_SetModeType_Show, true) ----�q�X
	SetModeEx( Boss , EM_SetModeType_Mark, true) ----�аO
	SetModeEx( Boss , EM_SetModeType_Strikback, true) ---����
	SetModeEx( Boss , EM_SetModeType_Move, true) ---����	
	SetModeEx( Boss , EM_SetModeType_Fight, true) ---�i���
	SetModeEx( Boss , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
	SetModeEx( Boss , EM_SetModeType_HideName, true)  ---�����Y�W�O�_��ܦW��
	SetModeEx( Boss , EM_SetModeType_HideMinimap, true)  ---����O�_�b�p�a�ϤW���
	SetModeEx( Boss , EM_SetModeType_Searchenemy, true)  ---����
	SetModeEx( Boss   , EM_SetModeType_Obstruct, false )--����	
	SetPlot( Boss,"dead","Dy_Z25_dead",10 )----Boss ���`�@��
	--MoveToFlagEnabled( Boss, false ) --�������޼@��
	--WriteRoleValue(Boss,EM_RoleValue_IsWalk,0) --�]�w�]�B�ʧ@ --0���]�B 1������
	WriteRoleValue( Boss, EM_RoleValue_PID, OwnerID()) --�N����g�JBOSS��
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss) --�NBoss�g�J�������Register1
	AddToPartition( Boss,roomid )

	BeginPlot( Boss, "Dy_Z25BOSSAI", 10)
	
--�����԰��]�m
	--�԰��}�l����n�����Ʊ�
	while 1  do
		local MaxHP = ReadRoleValue( Boss , EM_RoleValue_MaxHP )
		local NowHP = ReadRoleValue( Boss , EM_RoleValue_HP )
		local HPPercent =( NowHP / MaxHP)*100
		sleep(10)
		fight = ReadRoleValue( OwnerID() , EM_RoleValue_Register2 )	 --Ū���g�J�����2�檺�Ʀr

		if fight == 1 then --�԰���
		--say (OwnerID() , "333")
			if fight1 == 0 then --�קK�C���j�魫�]�@���ͪ�
				ScriptMessage( Boss, -1 , 2 , "[SC_106890_open]" , 2 ) --�۸ܩ�o��~���|�@���]
				Door2 = CreateObjByFlag( 103044 , 781152 , 3 , 1 ) ---�s���n�� �� Boss�e��  
				SetModeEx( Door2 , EM_SetModeType_Show, true) ----�q�X
				SetModeEx( Door2 , EM_SetModeType_Mark, false) ----�аO
				SetModeEx( Door2 , EM_SetModeType_Strikback, false) ---����
				SetModeEx( Door2 , EM_SetModeType_Move, false) ---����	
				SetModeEx( Door2 , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( Door2 , EM_SetModeType_SearchenemyIgnore, true) ---���󤣷|�Q�j�M
				SetModeEx( Door2 , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
				SetModeEx( Door2 , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
				SetModeEx( Door2 , EM_SetModeType_Searchenemy, false)  ---����
				SetModeEx( Door2   , EM_SetModeType_Obstruct, true )--����
				AddToPartition(Door2,roomid )
				--BeginPlot( Boss, "Dy_Z25BOSSAI", 10)
				WriteRoleValue( OwnerID() , EM_RoleValue_Register3 , Door2)--�N������GID�x�s�ܱ����Register3���A�H��K���R����
				fight1 = 1
			end
			rush = rush+1 --�g�ɰO��
	
			--say (Boss, "rush = "..rush)
			
			--�����\�������G����

			
			if rush >= 480 then  --�ק�ɶ��g�ɥ�
				AddBuff(Boss , 623851 , 0 , -1) --�g��Buff �ݭn�ק�s��
				ScriptMessage( Boss, -1 , 2 , "[SC_106890_DRUG]" , 2 )
			end
					
		--���ή�
		elseif fight == 2 then
			ScriptMessage( Boss, -1 , 2 , "[SC_106890_BONES]" , 2 )
			
			local player = SetSearchAllPlayer(RoomID)      --Ū�����hzone�Ҧ����a�ƶq
			local playername                               --���ŧi�n���X��zone�᪺���a
			for i = 1 , player do                          --�X�Ӫ��a����X��for�j��A�P�_�Ҧ����a
				playername = GetSearchResult()             --���X��zone����o�����aGID
				for a =1 , #buffid do
					if checkbuff(playername,buffid[a]) == true then
						CancelBuff_NoEvent( playername,buffid[a] )
					end	
				end
			end
			sleep (30)
			Delobj(Door2) --�R�����e��
			Delobj(Boss) --�R����Boss
			sleep(50)
			
			--Boss����
			Boss = CreateObjByFlag( BossID , 781152 , 1 , 1 ) ---�ͥXBoss (BOSS�s��  ,�X�нs�� ��N���X�� �ͥX�X�ө�) 
			SetPlot( Boss,"dead","Dy_Z25_dead",10 )----Boss ���`�@��
			WriteRoleValue( Boss, EM_RoleValue_PID, OwnerID()) --�N����g�JBOSS��
			WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss) --�NBoss�g�J�������Register1
			AddToPartition(Boss,roomid )
			BeginPlot( Boss, "Dy_Z25BOSSAI", 10) ---Boss���԰�Function (  BOSS BOSS��LUA_AI  ��\�C10=1��)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register2, 0)	

			--WriteRoleValue( OwnerID(), EM_RoleValue_Register2, 0) 
			fight1 = 0
			weakp = 0
			rush = 0 --�g�ɰO���k�s
		--Boss���`��
		elseif fight == 3 then
		ScriptMessage( Boss, -1 , 2 , "[SC_106890_END]" , 2 )
		local player = SetSearchAllPlayer(RoomID)      --Ū�����hzone�Ҧ����a�ƶq
			local playername                               --���ŧi�n���X��zone�᪺���a
			for i = 1 , player do                          --�X�Ӫ��a����X��for�j��A�P�_�Ҧ����a
				playername = GetSearchResult()             --���X��zone����o�����aGID
				for a =1 , #buffid do
					if checkbuff(playername,buffid[a]) == true then
						CancelBuff_NoEvent( playername,buffid[a] )
					end	
				end
			end
			Delobj(Door)
			Delobj(Door3)
			Delobj(Door2)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register2, 0)
			break
		end
	end	
end
function Dy_Z25BOSSAI()
	local own = OwnerID()
	local time1 = 0 --�ۦ��O��
	local luck
	local skill = {850255 , 850254 ,850209 ,850210} ------------����ˮ` , ���ζˮ` , 30%~100%���r�G,0~30%���r�G
	local skill2 = {850209 ,850210,850616,850615,850211,850617} ------------����ˮ` , ���ζˮ` , 30%~100%���r�G,0~30%���r�G
	local skillspeak = {"[SC_106890_SKILL1]" , "[SC_106890_SKILL2]", "[SC_106890_SKILL3]"}
	local skillLV = { 0 , 0 ,0,0 }
	local chapter = 1 --���q�P�_
	local bosshate = {}
	local AttackTarget 
	local CH1 = ReadRoleValue( own , EM_RoleValue_PID ) 	--Ū�X�����GID
	local roomID = ReadRoleValue(own , EM_RoleValue_RoomID ) --Ū�XBoss�b���@�h
	local fight = 0 --�԰��}��
	local ZoneID = ReadRoleValue ( own , EM_RoleValue_ZoneID )
	local zoneup 
	if ZoneID == 151 then
		zoneup = 4
	elseif ZoneID == 152 then
		zoneup = 4
	elseif ZoneID == 153 then
		zoneup = 2
	end
	while 1 do
	sleep(10)
	local MaxHP = ReadRoleValue( own , EM_RoleValue_MaxHP )
	local NowHP = ReadRoleValue( own , EM_RoleValue_HP )
	local HPPercent =( NowHP / MaxHP)*100	
	
	--�Φ�q�P�_���q
	if HPPercent <= 30 then
		chapter = 2	
	end
	--Say(own,"chapterh = "..chapter)
	AttackTarget = ReadRoleValue( own , EM_RoleValue_AttackTargetID ) --Ū���b�������ؼ�
		if  AttackTarget ~= 0  and ( CheckID( own ) ) == true then	--�p�G�ؼФH��>0�A�ӥB�ۤv�s�b�ɡA�P�w�i�J�԰�
			fight = 1 --��ܥ��b�԰���
			WriteRoleValue( CH1, EM_RoleValue_Register2, 1) --�^�Ǳ�����w�g�b�԰����F
			--say (OwnerID() , "111")
			time1 = time1 +1
			--�X��
			if time1 %7 == 0 then 
				luck = Rand(100)+1
				while 	ReadRoleValue(own , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(2)
				end			
				if luck % 2 == 0 then --�I�����ˮ`
					ScriptMessage( own, -1 , 2 , skillspeak[1] , 2 )
					CastSpellLV( own , AttackTarget , skill[1] , skillLV[1] )
					--say(own,"skill = 1")
				elseif luck % 2 ==1 then --�I�񮰫��ˮ`
					ScriptMessage( own, -1 , 2 , skillspeak[2] , 2 )
					CastSpellLV( own , own , skill[2] , skillLV[2] )
					--say(own,"skill = 2")
				end
			elseif time1 % 20 == 0 then
				local player_00 = {} --����X����������a
				local player_01 = {} 
				--local choose_p
				local choose_P2
				local luck1
				local luck2 
				ScriptMessage( own, -1 , 2 , skillspeak[3] , 2 )
				player_01 = DW_HateRemain(0) --������H   ��0�N�� ���ư��D�Z
				luck2 = table.getn(player_01)
				for i = 1 ,luck2,1 do --���d
					--say(player_01[i],"hay"..i)
					if ReadRoleValue(player_01[i],EM_RoleValue_IsPlayer) == 1 then
						--say(player_01[i],"h8888"..i)
						table.insert( player_00, player_01[i] )
					end
				end
				--ReadRoleValue(EM_RoleValue_IsPlayer)  
				--choose_p = table.getn(player_00) --���XPlayer���ƶq
				--say (own , "choose_p = "..choose_p )
				--[[for i = 1 , choose_p , 1 do --�ˬd���a���W���S��Buff
					for a = 0 , 5 , 1 do
						if CheckBuff(player_00[i] , 622692+a ) == false then
							table.insert( player_01, player_00[i] ) --��iplayer_01���X��
							break
						end
					end
				end--]]
				choose_p2 = table.getn(player_00) --���X�S��Buff�����a�ƶq
				--say(own,"num"..choose_p2)				
				if chapter == 1 then --�Ĥ@���q
					if choose_p2 == 0 or choose_p2 >= zoneup then --�p�G�S��Buff���H�O0�A��ܤj�a����buff �H����4�ӤH�I��
						for i = 1 , zoneup , 1 do --��|�ӤH�I��
						luck1 = DW_Rand(table.getn(player_00))			--RAND�쪺�Ʀr	
							if ( player_00[luck1] ~= nil ) and ( ReadRoleValue( player_00[luck1] , EM_RoleValue_IsDead ) == 0 ) then						
								SysCastSpellLv(own,player_00[luck1],skill2[i],skillLV[3]) 
								--say(player_00[luck1],"hay = "..i)
								table.remove( player_00 , luck1 ) --�񧹫�R����table�̭������a���
								sleep(1)								
							end
						end
					elseif choose_p2 > 0 and  choose_p2 < zoneup then --�H�Ƥp��4��
						--say (own , "choose_p2 = "..choose_p2)
						for i = 1 , choose_p2 , 1 do --��choose_p2���X�ӤH�N��X�ӤH�I��
						--luck2 = Rand(table.getn(player_01))+1			--RAND�쪺�Ʀr	
							if ( player_00[i] ~= nil ) and ( ReadRoleValue( player_00[i] , EM_RoleValue_IsDead ) == 0 ) then						
								SysCastSpellLv(own,player_00[i],skill2[i],skillLV[3]) 
								--say(player_00[i],"hay = "..i)
								table.remove( player_00 , i ) --�񧹫�R����table�̭������a���
								sleep(1)								
							end
						end						
					end
				elseif chapter == 2 then --�ĤG���q 
					if choose_p2 == 0 or choose_p2 >= 6 then --�p�G�S��Buff���H�O0�A��ܤj�a����buff �H����4�ӤH�I��
						for i = 1 , 6 , 1 do --��|�ӤH�I��
						luck1 = DW_Rand(table.getn(player_00))			--RAND�쪺�Ʀr	
							if ( player_00[luck1] ~= nil ) and ( ReadRoleValue( player_00[luck1] , EM_RoleValue_IsDead ) == 0 ) then						
								SysCastSpellLv(own,player_00[luck1],skill2[i],skillLV[3])
								--say(player_00[luck1],"hay = "..i)								
								table.remove( player_00 , luck1 ) --�񧹫�R����table�̭������a���
								sleep(1)								
							end
						end
					elseif choose_p2 > 0 and  choose_p2 < 6 then --�H�Ƥp��4��
						--say (own , "choose_p2 = "..choose_p2)
						for i = 1 , choose_p2 , 1 do --��choose_p2���X�ӤH�N��X�ӤH�I��
						--luck2 = Rand(table.getn(player_01))+1			--RAND�쪺�Ʀr	
							if ( player_00[i] ~= nil ) and ( ReadRoleValue( player_00[i] , EM_RoleValue_IsDead ) == 0 ) then						
								SysCastSpellLv(own,player_00[i],skill2[i],skillLV[3]) 
								--say(player_00[i],"hay = "..i)	
								table.remove( player_00 , i ) --�񧹫�R����table�̭������a���
								sleep(1)								
							end
						end						
					end
				end
			end
		elseif fight == 1 and AttackTarget == 0 then
			WriteRoleValue( CH1 , EM_RoleValue_Register2, 2)
		end
	end
			
end
function Dy_Z25_dead()
local CH1 = ReadRoleValue( OwnerID() , EM_RoleValue_PID ) 
WriteRoleValue( CH1 , EM_RoleValue_Register2, 3)
end
--�����C2����|
function Dy_Z25_OWN2(BUFFID)
	local Pos = Lua_BuffPosSearch( OwnerID() , BUFFID )                      ---------------------��X���W���k�N�N��
	local PLV = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_Power )			 -------------------------���k�N������
	local T = BuffInfo( OwnerID(), Pos ,EM_BuffInfoType_Time) --Ū���Ѿl�ɶ�
	--say (OwnerID() , "T = "..T)
	if Checkbuff (OwnerID() ,BUFFID ) == true  then --�p�G�ۤv��Buff
		if T < 2 or T >= 20 then
		
		else
			CancelBuff_NoEvent(OwnerID() , BUFFID )
			Addbuff (OwnerID() , BUFFID , PLV+1 , T )
		end
	end
end

--�����ǬV��Buff
function Dy_Z25_BUFFAD()
local own = OwnerID()
local tar = TargetID()
	local buffA = 622692
	local buffD = 622695
	local PosA = Lua_BuffPosSearch( own , buffA )
	local PosD = Lua_BuffPosSearch( own , buffD )
	local TA = BuffInfo( own, PosA ,EM_BuffInfoType_Time)
	local TD = BuffInfo( own, PosD ,EM_BuffInfoType_Time)
	local otherbuff = { 622693 , 622694 , 622696 , 622697 }
	if ReadRoleValue(tar,EM_RoleValue_IsPlayer) == true then
	--say (OwnerID() , "BUFF1 ="..otherbuff[1])
		for i = 1 , 4 , 1 do --���ˬd�n���n���ͩR���q
			if Checkbuff (tar , otherbuff[i]) == true then --�p�GBCEF�s�b����
				CancelBuff_NoEvent(tar , otherbuff[i]) --�R����
				Addbuff (tar , 622717 , 0 , -1) --���P�ͩR���qBUFF
			elseif Checkbuff (tar , otherbuff[i]) == false then --�p�GBCEF���s�b����
				if Checkbuff(tar , buffA ) == false then--�p�GA���s�b
					if own ~= tar and Checkbuff(own,buffA)==true and Checkbuff(tar,buffD)==true then
						CancelBuff_NoEvent(own , buffA)
						CancelBuff_NoEvent(tar , buffD)
						return
					end
					if own ~= tar and Checkbuff(own,buffA)==true then
						Addbuff (tar, buffA , 0 , 20) --��B
					end
				elseif Checkbuff(tar , buffD ) == false  then --�p�GD���s�b
					if own ~= tar and Checkbuff(own,buffD)==true and Checkbuff(tar,buffA)==true then
						CancelBuff_NoEvent(own , buffD)
						CancelBuff_NoEvent(tar , buffA)
						return
					end
					if own ~= tar and Checkbuff(own,buffD)==true then
						Addbuff (tar, buffD , 0 , 20) --��B
					end
				end
			end
		end
	end	
end 
function Dy_Z25_BUFFBE()
	local buffB = 622693
	local buffE = 622696
	local own=OwnerID()
	local tar=TargetID()
	local otherbuff = { 622692 , 622694 , 622695 , 622697 }
	if ReadRoleValue(tar,EM_RoleValue_IsPlayer) == true then
		for i = 1 , 4 , 1 do
			if Checkbuff (tar , otherbuff[i]) == true then --�p�GACDF�s�b����
				CancelBuff_NoEvent(tar , otherbuff[i]) --�R����
				Addbuff (tar , 622717, 0 , -1) --���P�ͩR���qBUFF
			elseif Checkbuff (tar , otherbuff[i]) == false then --�p�GACDF���s�b����
				if Checkbuff(tar , buffB ) == false then--�p�GB���s�b
					if own ~= tar and Checkbuff(own,buffB)==true and Checkbuff(tar,buffE)==true then
						CancelBuff_NoEvent(own , buffB)
						CancelBuff_NoEvent(tar , buffE)
						return
					end
					if own ~= tar and Checkbuff(own,buffB)==true then
						Addbuff (tar, buffB , 0 , 20) --��B
					end
				elseif Checkbuff(tar, buffE ) == false  then --�p�GE���s�b
					if own ~= tar and Checkbuff(own,buffE)==true and Checkbuff(tar,buffB)==true then
						CancelBuff_NoEvent(own , buffE)
						CancelBuff_NoEvent(tar , buffB)
						return
					end
					if own ~= tar and Checkbuff(own,buffE)==true then
						Addbuff (tar, buffE , 0 , 20) --��E
					end
				end
			end
		end
	end	
end
function Dy_Z25_BUFFCF()
	local buffC = 622694
	local buffF = 622697
	local own=OwnerID()
	local tar=TargetID()
	local otherbuff = { 622692 , 622693 , 622695 , 622696 }
	if ReadRoleValue(tar,EM_RoleValue_IsPlayer) == true then
		for i = 1 , 4 , 1 do
			if Checkbuff (tar, otherbuff[i]) == true then --�p�GACDF�s�b����
				CancelBuff_NoEvent(tar, otherbuff[i]) --�R����
				Addbuff (tar, 622717, 0 , -1) --���P�ͩR���qBUFF
			elseif Checkbuff (tar , otherbuff[i]) == false then --�p�GACDF���s�b����	
				if Checkbuff(tar , buffC ) == false then--�p�GC���s�b
					if own ~= tar and Checkbuff(own,buffC)==true and Checkbuff(tar,buffF)==true then
						CancelBuff_NoEvent(own , buffC)
						CancelBuff_NoEvent(tar , buffF)
						return
					end
					if own ~= tar and Checkbuff(own,buffC)==true then
						Addbuff (tar, buffC , 0 , 20) --��C
					end	
				elseif Checkbuff(tar, buffF ) == false  then --�p�GF���s�b
					if own ~= tar and Checkbuff(own,buffF)==true and Checkbuff(tar,buffC)==true then
						CancelBuff_NoEvent(own , buffF)
						CancelBuff_NoEvent(tar , buffC)
						return
					end
					if own ~= tar and Checkbuff(own,buffF)==true then
						Addbuff (tar , buffF , 0 , 20) --��F
					end	
				end
			end
		end
	end	
end
function UN_z25boss2_BUFF(buffid)

	if checkbuff(TargetID(),buffid) == true then
		return false
	else
		return true
	end
end
--�X��780888   �G  1 = door2
--                 2 = boss
--                 3 = door1
--                 4 = �Z��
--                 5 = 
--�r�� SC_105374
function un_zone20_boss5_easy()     --���				
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Ctrl = OwnerID()					--���
	local PhaseChange = 60					--�����ɶ�
	local PhaseCount = 1					--�Ҧ��p��
	local CombatBegin=0						--�}�ԺX��
	local RoomID=ReadRoleValue(Ctrl,EM_RoleValue_RoomID)
	local Boss=CreateObjByFlag(105884,780888,2,1)
	local doorchick1
	local playcount = 0
	--local doorchick2
	local firelose ={}
	local Sktalk = {"[SC_105374_01]","[SC_105374_02]","[SC_105374_03]"}
	local endingtime = 0
	--Sktalk 1=�}��  2=���a����  3=������
	AddToPartition(Boss,RoomID)
	WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
	WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)
	--[[doorchick2 = CreateObjByFlag( 104519 , 780888 , 1 , 1 )
	SetModeEx(doorchick2,EM_SetModeType_Mark, false)
	SetModeEx(doorchick2,EM_SetModeType_HideName, false)
	SetModeEx(doorchick2,EM_SetModeType_NotShowHPMP, false)
	SetModeEx(doorchick2,EM_SetModeType_Strikback, false)
	SetModeEx(doorchick2,EM_SetModeType_Move, false)
	SetModeEx(doorchick2,EM_SetModeType_Fight, false)
	SetModeEx(doorchick2,EM_SetModeType_Searchenemy, false)
	SetModeEx(doorchick2,EM_SetModeType_Obstruct, true)
	AddToPartition( doorchick2, RoomID)
	SetDefIdleMotion(doorchick2,ruFUSION_MIME_ACTIVATE_END)
	WriteRoleValue(doorchick2,EM_RoleValue_register1,doorchick2)
	WriteRoleValue(boss,EM_RoleValue_register1,doorchick2)--]]
	doorchick1 = CreateObjByFlag( 105431 , 780888 , 3 , 1 )
	SetModeEx(doorchick1,EM_SetModeType_Mark, false)
	SetModeEx(doorchick1,EM_SetModeType_HideName, false)
	SetModeEx(doorchick1,EM_SetModeType_NotShowHPMP, false)
	SetModeEx(doorchick1,EM_SetModeType_Strikback, false)
	SetModeEx(doorchick1,EM_SetModeType_Move, false)
	SetModeEx(doorchick1,EM_SetModeType_Fight, false)
	SetModeEx(doorchick1,EM_SetModeType_Searchenemy, false)
	SetModeEx(doorchick1,EM_SetModeType_Obstruct, false)
	AddToPartition( doorchick1, RoomID)
	SetDefIdleMotion(doorchick1,ruFUSION_MIME_ACTIVATE_LOOP)
	WriteRoleValue(Ctrl,EM_RoleValue_register2,0)  --�C
	WriteRoleValue(Ctrl,EM_RoleValue_register3,0)  --����
	SetPlot( boss,"dead","un_zone20_boss5die_easy",0 )	
	while true do
		boss = ReadRoleValue(Ctrl,EM_RoleValue_PID)
		sleep(10)
		if hatelistcount(boss)~=0 then
			if CombatBegin==0 then
				playcount = SetSearchAllPlayer(RoomID)
				for i=1 , playcount do
				local NpcGID = GetSearchResult()
					addbuff(NpcGID,509206,0,-1)
				end
				CombatBegin=1										--�}���F
				BeginPlot(boss , "un_zone20_boss5AI1_easy" , 0)	
				Setplot(Boss,"dead","un_zone20_boss5die_easy",0)
				ScriptMessage( Boss, -1 , 2 , Sktalk[1] , "0xff6fb7ff" )
				SetDefIdleMotion(doorchick1,ruFUSION_MIME_ACTIVATE_END)
				SetModeEx(doorchick1,EM_SetModeType_Obstruct, true)
			end
		end

		boss = ReadRoleValue(Ctrl,EM_RoleValue_PID)
	--	if hatelistcount(boss)~=0 and CombatBegin==1 then         --�g�ɮɶ�
	--		endingtime = endingtime+1
	--		if endingtime >=360 then
	--			addbuff(boss,620042,0,-1)
	--		end
	--	end		
		if hatelistcount(boss)==0 and CombatBegin==1 then			--�}�ԫᤳ���S�H
			--say(ownerid(),"hat = 0")
			sleep(20)
			if hatelistcount(boss)==0 and CombatBegin==1 then
			if ReadRoleValue( boss , EM_RoleValue_IsDead)==0 then
				firelose = SearchRangeNPC ( Ctrl , 1000 )
				for i=0,table.getn(firelose) do
					--say(OwnerID(),"x = "..firelose[i])
						if ReadRoleValue( firelose[i] , EM_RoleValue_OrgID )==117789 or 
						ReadRoleValue( firelose[i] , EM_RoleValue_OrgID )==117788 then
							delobj(firelose[i])
						end
				end
				playcount = SetSearchAllPlayer(RoomID)
				for i=1 , playcount do
				local NpcGID = GetSearchResult()
				if CheckBuff(NpcGID,509206) ==true then
						cancelbuff(NpcGID,509206)
					end
					if CheckBuff(NpcGID,509201) ==true then
						cancelbuff(NpcGID,509201)
					end
					if CheckBuff(NpcGID,509202) ==true then
						cancelbuff(NpcGID,509202)
					end
					if CheckBuff(NpcGID,509198) ==true then
						cancelbuff(NpcGID,509198)
					end
					if CheckBuff(NpcGID,620465) ==true then
						cancelbuff(NpcGID,620465)
					end
					--addbuff(NpcGID,509206,0,-1)
				end
				DelObj(boss)
				--Delobj(doorchick1)
				SetDefIdleMotion(doorchick1,ruFUSION_MIME_ACTIVATE_BEGIN)
				SetModeEx(doorchick1,EM_SetModeType_Obstruct, false)
				ScriptMessage( ReadRoleValue(Ctrl,EM_RoleValue_PID), -1 , 2 , Sktalk[2] , "0xff6fb7ff" )
				local weap = ReadRoleValue(ctrl,EM_RoleValue_register2)
				if checkID(weap) == true then
					delobj(weap)
				end
				local weap1 = ReadRoleValue(ctrl,EM_RoleValue_register2)
				if checkID(weap1) == true then
					delobj(weap1)
				end
				sleep(50)
				Boss=CreateObjByFlag(105884,780888,2,1)
				RoomID=ReadRoleValue(Ctrl,EM_RoleValue_RoomID)
				AddToPartition(Boss,RoomID)                         --���mBOSS
				WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
				WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)
				--WriteRoleValue(boss,EM_RoleValue_register1,doorchick2)
				CombatBegin=0										--���m�԰�
				PhaseCount=1										--���m�p��
			elseif ReadRoleValue( boss , EM_RoleValue_IsDead)==1 then
				firelose = SearchRangeNPC ( Ctrl, 1000 )
				for i=0,table.getn(firelose) do

					if ReadRoleValue( firelose[i] , EM_RoleValue_OrgID )==104457 then
						delobj(firelose[i])
					end
				end
				playcount = SetSearchAllPlayer(RoomID)
				for i=1 , playcount do
				local NpcGID = GetSearchResult()
					if CheckBuff(NpcGID,509206) ==true then
						cancelbuff(NpcGID,509206)
					end
					--addbuff(NpcGID,509206,0,-1)
				end
				ScriptMessage( Boss, -1 , 2 , Sktalk[3] , "0xff6fb7ff" )
				--Delobj(doorchick2)
				--Delobj(doorchick1)
				SetDefIdleMotion(doorchick1,ruFUSION_MIME_ACTIVATE_BEGIN)
				SetModeEx(doorchick1,EM_SetModeType_Obstruct, false)
				sleep(50)
				break
			end
		end	
		end
	end
end
function un_zone20_boss5AI1_easy()  --BossAI���ﲯ�Ҷ��q****************************
	local Boss = OwnerID()
	local ctrl = ReadRoleValue(Boss,EM_RoleValue_PID)
	local RoomID=ReadRoleValue(Boss,EM_RoleValue_RoomID)
	local maxhp = ReadRoleValue(Boss,EM_RoleValue_MaxHP)
	local skilltime = 0
	local skill2time = 0
	local nowhp
	local hp1
	local hp2 = ReadRoleValue(Boss,EM_RoleValue_HP)
	local hp3 = (hp2 / maxhp) *100
	local sword = CreateObjByFlag( 117789 , 780888 , 4 , 1 )  --�ХX�C
	local farplayer = {}
	local Targ
	local rand
	local bossskill
	local player
	SetModeEx(sword,EM_SetModeType_Fight,false)	
	AddToPartition( sword, RoomID)
	WriteRoleValue(Ctrl,EM_RoleValue_register2,sword)
	addbuff(boss,509203,0,-1)
	addbuff(boss,502707,0,-1)
	sleep(20)
	while 1 do
	skilltime=skilltime+1
	--say(boss,"p1 = "..skilltime)
	sleep(10)
			NowHp = ReadRoleValue(Boss,EM_RoleValue_HP)
			Hp1 = (NowHp / maxhp) *100
			if hp3 - hp1 >4 then                              --5%�H����P2
				ScriptMessage( Boss, -1 , 2 , "[SC_105374_04]" , "0xff6fb7ff" )
				CastSpell( Boss, Boss, 497317 )  --��t�k�N
				sleep(35)
				   --�ͥt�@����+��script+�ǭ�(��+���+HP)+�R���ۤv 
				local x1= ReadRoleValue (Boss, EM_RoleValue_X)
				local y1= ReadRoleValue (Boss, EM_RoleValue_Y)
				local z1= ReadRoleValue (Boss, EM_RoleValue_Z)
				local armor = CreateObj ( 117788 , x1 , y1 , z1 , 0 , 1)
				AddToPartition(armor,RoomID)
				WriteRoleValue(Ctrl,EM_RoleValue_register3,armor)
				local player = SetSearchAllPlayer(RoomID) --�j�M�������a
				for i = 0 , player-1 ,1 do 
					local PID = GetSearchResult()
					if checkbuff(PID,509202) == true then
						CancelBuff( PID, 509202 )
						addbuff(PID,509198,0,30)
					end
				end
				
				bossskill = LuaFunc_CreateObjByObj ( 105885 , boss )	
				WriteRoleValue( bossskill , EM_RoleValue_HP ,  NowHP)
				AddToPartition(bossskill,RoomID)
				BeginPlot(bossskill , "un_zone20_boss5AI2_easy" , 0)	
				Setplot(bossskill,"dead","un_zone20_boss5die_easy",0)
				WriteRoleValue(bossskill,EM_RoleValue_PID,Ctrl)
				WriteRoleValue(Ctrl,EM_RoleValue_PID,bossskill)
				if checkid(sword) == true then
				   delobj(sword)
				end
				delobj(boss)
			end
			if skilltime % 7 ==0 then                         --7��@������
			while ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)~=0 do--�ˬd�٦��S���b�I�k
				sleep(2)
			end
				Targ=ReadRoleValue(boss,EM_RoleValue_AttackTargetID)
				rand = DW_rand(2)
				if rand == 1 then
					CastSpelllv( boss, Targ,497310,0 )
					sleep(10)
				else
					CastSpelllv( boss, Targ,497311,0 )
					sleep(10)
				end
				
				
			elseif	skilltime % 11 ==0 then                   --11��@���d��AOE
			while ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)~=0 do--�ˬd�٦��S���b�I�k
				sleep(2)
			end
			CastSpelllv( boss, boss,498148,0 )
			sleep(20)
			
			elseif	skilltime % 13 ==0 then                   --15��@�����̻��Z���A�p�G�̻��Z�����a��BOSS�Z��<150��AE
			while ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)~=0 do--�ˬd�٦��S���b�I�k
				sleep(2)
			end
				ScriptMessage( Boss, -1 , 2 , "[SC_105374_06]" , "0xff6fb7ff" )
				farplayer = KS_GetHateList( Boss, 2 )--�����( Type:1 �̤���; 2 �̶Z��; 3 ���a)
				if GetDistance( Boss, farplayer[1])>150 then
					CastSpell( Boss,farplayer[1], 498149 )
				else 
					CastSpell(Boss, Boss, 497314 )
				end	
				sleep(20)
				
			end	
	end	
end
function un_zone20_boss5AI2_easy()  --BossAI�S�ﲯ�Ҷ��q****************************
	local Boss = OwnerID()
	local ctrl = ReadRoleValue(Boss,EM_RoleValue_PID)
	local RoomID=ReadRoleValue(Boss,EM_RoleValue_RoomID)
	local maxhp = ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP)
	local skilltime = 0
	local skill2time = 0 
	local nowhp
	--local sword = CreateObjByFlag( 104519 , 780888 , 1 , 1 )  --�ХX�C
	local farplayer = {}
	local farplayer1= {}
	local farplayer2= {}
	local Targ
	local rand
	local bossskill
	local player
	local armor
	--SetModeEx(sword,EM_SetModeType_Fight,false)	
	--AddToPartition( sword, RoomID)
	addbuff(boss,509204,0,-1)
	addbuff(boss,502707,0,-1)
	sleep(20)
	while 1 do
	skilltime=skilltime+1
	--say(boss,"p2 = "..skilltime)
	sleep(10)
			if skilltime >= 29 then                              --5%�H����P2
				ScriptMessage( Boss, -1 , 2 , "[SC_105374_05]" , "0xff6fb7ff" )
				CastSpell( OwnerID(), OwnerID(), 497317 )  --��t�k�N
				sleep(35)
				   --�ͥt�@����+��script+�ǭ�(��+���+HP)+�R���ۤv 
				local player = SetSearchAllPlayer(RoomID) --�j�M�������a
				for i = 0 , player-1 ,1 do 
					local PID = GetSearchResult()
					if chECkbuff(PID,509201) == true then
						CancelBuff(PID,509201)
						addbuff(PID,509198,0,30)
					end
				end
				armor = ReadRoleValue(ctrl,EM_RoleValue_register3)
				NowHp = ReadRoleValue(Boss,EM_RoleValue_HP)
				bossskill = LuaFunc_CreateObjByObj ( 105897 , boss )
				WriteRoleValue( bossskill , EM_RoleValue_HP , NowHP)
				AddToPartition(bossskill,RoomID)
				BeginPlot(bossskill , "un_zone20_boss5AI1_easy" , 0)
				Setplot(bossskill,"dead","un_zone20_boss5die_easy",0)
				WriteRoleValue(bossskill,EM_RoleValue_PID,Ctrl)
				WriteRoleValue(Ctrl,EM_RoleValue_PID,bossskill)
				if checkid(armor) == true then
				   delobj(armor)
				end
				delobj(boss)

			end
			if skilltime % 7 ==0 then                         --7��@������
			while ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)~=0 do--�ˬd�٦��S���b�I�k
				sleep(2)
			end
				Targ=ReadRoleValue(boss,EM_RoleValue_AttackTargetID)
				rand = DW_rand(2)
				if rand == 1 then
					CastSpelllv( boss, Targ,497310,0 )
					sleep(10)
				else
					CastSpelllv( boss, Targ,497311,0 )
					sleep(10)
				end
				
				
			elseif	skilltime % 11 ==0 then                   --11��@���d��AOE
			while ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)~=0 do--�ˬd�٦��S���b�I�k
				sleep(2)
			end
			CastSpelllv( boss, boss,498148,0 )
			sleep(20)
			
			elseif	skilltime % 13 ==0 then                   --15��@�����̻��Z���A�p�G�̻��Z�����a��BOSS�Z��<150��AE
			while ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)~=0 do--�ˬd�٦��S���b�I�k
				sleep(2)
			end
				farplayer1 = KS_GetHateList( Boss, 3 )
				local Pnumber = table.getn(farplayer1)
				if Pnumber>=3 then
				local num = 3
				farplayer2 = Az_RND_Ary(1,Pnumber,num)				
				end
				if Pnumber<3 then
					for i = 1 ,  Pnumber do
						addbuff(farplayer1[i],620041,0,-1)
					end
				else
					for i = 1 ,  3 do
						addbuff(farplayer1[farplayer2[i]],620041,0,-1)
					end
				end
				ScriptMessage( Boss, -1 , 2 , "[SC_105374_06]" , "0xff6fb7ff" )
				farplayer = KS_GetHateList( Boss, 2 )--�����( Type:1 �̤���; 2 �̶Z��; 3 ���a)
				if GetDistance( Boss, farplayer[1])>150 then
					CastSpell( OwnerID(),farplayer[1], 498149 )
				else 
					CastSpell( OwnerID(), OwnerID(), 497314 )
				end	
				sleep(20)
				
			end	
	end	
end
function un_zone20_boss5die_easy()  --Boss���`�@��***********************
	local own = OWnerID()
	local ctrl = ReadRoleValue(own,EM_RoleValue_PID)
	local RoomID=ReadRoleValue(own,EM_RoleValue_RoomID)
	local bobo=CreateObjByFlag(105877,780888,2,1)-------�_�c  
	BeginPlot(OwnerID(), "ic_ha_de_139_05" , 0)
	SetModeEx( bobo , EM_SetModeType_Mark, true)			---�i�I��(�_)
	SetModeEx( bobo , EM_SetModeType_ShowRoleHead, true) 		---�Y����(�_)
	SetModeEx( bobo , EM_SetModeType_Obstruct, true) 			--����(�O)
	SetModeEx( bobo , EM_SetModeType_Strikback, false) ---����
	SetModeEx( bobo , EM_SetModeType_Move, false) ---����	
	SetModeEx( bobo , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( bobo , EM_SetModeType_SearchenemyIgnore, false) 	---�O�_�Q�j�M(�_)
	SetModeEx( bobo , EM_SetModeType_Searchenemy, false)			--����(�_)	
	SetModeEx( bobo , EM_SetModeType_NotShowHPMP, true) --
	AddToPartition(bobo,RoomID)
	local weap = ReadRoleValue(ctrl,EM_RoleValue_register2)
	if checkID(weap) == true then
		delobj(weap)
	end
	local weap1 = ReadRoleValue(ctrl,EM_RoleValue_register2)
	if checkID(weap1) == true then
		delobj(weap1)
	end
end
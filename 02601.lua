--flag781073  1=��1  2=Boss 3=��2(�e��)

function un_zone24_Boss3Ctrl() --Boss ����
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Ctrl = OwnerID()					--���
	local ZoneID = ReadRoleValue ( Ctrl , EM_RoleValue_ZoneID )
	local PhaseChange = 60					--�����ɶ�
	local PhaseCount = 1					--�Ҧ��p��
	local CombatBegin=0						--�}�ԺX��
	local RoomID=ReadRoleValue(Ctrl,EM_RoleValue_RoomID)
	local Boss
	if ZoneID == 149 then
		Boss=CreateObjByFlag(106596,781073,2,1)
	else
		Boss=CreateObjByFlag(107459,781073,2,1)
	end
	local doorchick1
	local doorchick2
	local firelose ={} --�԰������n�R�����F��
	local Sktalk = {"[SC_106596_01]","[SC_106596_02]","[SC_106596_03]","[SC_106596_05]"} --���
	local monster = {} --Ĳ��
	local bump1
	local bump2 = {}
	local crazytime = 0
	AddToPartition(Boss,RoomID)
	WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
	WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)
	doorchick2 = CreateObjByFlag( 106236 , 781073 , 1 , 1 )
	SetModeEx(doorchick2,EM_SetModeType_Mark, false)
	SetModeEx(doorchick2,EM_SetModeType_HideName, false)
	SetModeEx(doorchick2,EM_SetModeType_NotShowHPMP, false)
	SetModeEx(doorchick2,EM_SetModeType_Strikback, false)
	SetModeEx(doorchick2,EM_SetModeType_Move, false)
	SetModeEx(doorchick2,EM_SetModeType_Fight, false)
	SetModeEx(doorchick2,EM_SetModeType_Searchenemy, false)
	SetModeEx(doorchick2,EM_SetModeType_Obstruct, true)
	AddToPartition( doorchick2, RoomID)
	--SetDefIdleMotion(doorchick1,ruFUSION_MIME_ACTIVATE_LOOP)
	SetDefIdleMotion(doorchick2,ruFUSION_MIME_ACTIVATE_END)
	WriteRoleValue(doorchick2,EM_RoleValue_register1,doorchick2)
	WriteRoleValue(boss,EM_RoleValue_register1,doorchick2)
	SetModeEx(boss,EM_SetModeType_Move, false)
	SetPlot( boss,"dead","un_zone24_Boss3Dead",0 )
	
	while true do
		sleep(10)
		if hatelistcount(boss)~=0 then
			if CombatBegin==0 then
				CombatBegin=1										--�}���F
				BeginPlot(boss , "un_zone24_Boss3" , 0)	
				ScriptMessage( Boss, -1 , 2 , Sktalk[1] , 2 )
				--SetDefIdleMotion(doorchick1,ruFUSION_MIME_ACTIVATE_END)
					doorchick1 = CreateObjByFlag( 106236 , 781073 , 3 , 1 )
					SetModeEx(doorchick1,EM_SetModeType_Mark, false)
					SetModeEx(doorchick1,EM_SetModeType_HideName, false)
					SetModeEx(doorchick1,EM_SetModeType_NotShowHPMP, false)
					SetModeEx(doorchick1,EM_SetModeType_Strikback, false)
					SetModeEx(doorchick1,EM_SetModeType_Move, false)
					SetModeEx(doorchick1,EM_SetModeType_Fight, false)
					SetModeEx(doorchick1,EM_SetModeType_Searchenemy, false)
					SetModeEx(doorchick1,EM_SetModeType_Obstruct, true)
					AddToPartition( doorchick1, RoomID)
					if ZoneID == 149 then
						for i = 4 , 11 do --��Ĳ��
							monster[i] = CreateObjByFlag( 106598 , 781073 , i , 1 )
							SetModeEx(monster[i],EM_SetModeType_Move, false) --���ಾ��
							WriteRoleValue(monster[i],EM_RoleValue_register1,boss)
							SetPlot( monster[i],"dead","un_zone24_monsterDead",0 )
							AddToPartition( monster[i], RoomID)
							BeginPlot(monster[i] , "un_106598attack" , 0)
						end
					else	
						for i = 4 , 9 do --��Ĳ��
							monster[i] = CreateObjByFlag( 107460 , 781073 , i , 1 )
							SetModeEx(monster[i],EM_SetModeType_Move, false) --���ಾ��
							WriteRoleValue(monster[i],EM_RoleValue_register1,boss)
							SetPlot( monster[i],"dead","un_zone24_monsterDead",0 )
							AddToPartition( monster[i], RoomID)
							BeginPlot(monster[i] , "un_106598attack" , 0)
						end
					end
				--WriteRoleValue(boss,EM_RoleValue_register1,1)		--�q�Ҧ�1�}�l
			elseif CombatBegin==1 then --���W����X���u 
				crazytime = crazytime +1
				if crazytime == 60 then                             --�g��
					if ZoneID == 149 then
						addbuff(boss,623667,0,-1)
						ScriptMessage( Boss, -1 , 2 , Sktalk[4] , 2 )
					end	
				end
				bump2 = Az_RND_Ary(12,32,5) -- 3~23�H�����ӼƦr������
				for i = 1 , 5 do
					bump1 = CreateObjByFlag( 106599, 781073 , bump2[i] , 1 )
					SetModeEx(bump1,EM_SetModeType_Mark, false)
					SetModeEx(bump1,EM_SetModeType_HideName, false)
					SetModeEx(bump1,EM_SetModeType_NotShowHPMP, false)
					SetModeEx(bump1,EM_SetModeType_Strikback, false)
					SetModeEx(bump1,EM_SetModeType_Move, false)
					SetModeEx(bump1,EM_SetModeType_Fight, false)
					SetModeEx(bump1,EM_SetModeType_Searchenemy, false)
					AddToPartition(bump1,roomID )
				end
				sleep(50)
			end
		end

		if hatelistcount(boss)==0 and CombatBegin==1 then			--�}�ԫᤳ���S�H
			if ReadRoleValue( boss , EM_RoleValue_IsDead)==0 then
				firelose = SearchRangeNPC ( Ctrl , 1000 )
				for i=0,table.getn(firelose) do
					--say(OwnerID(),"x = "..firelose[i])
						if ReadRoleValue( firelose[i] , EM_RoleValue_OrgID )==106598 or 
						ReadRoleValue( firelose[i] , EM_RoleValue_OrgID )==107460 then
							delobj(firelose[i])
						end
				end
				DelObj(boss)
				--SetDefIdleMotion(doorchick1,ruFUSION_MIME_ACTIVATE_BEGIN)
				Delobj(doorchick1)
				ScriptMessage( Boss, -1 , 2 , Sktalk[2] , 2 )
				sleep(50)
				if ZoneID == 149 then
					Boss=CreateObjByFlag(106596,781073,2,1)
				else
					Boss=CreateObjByFlag(107459,781073,2,1)
				end
				RoomID=ReadRoleValue(Ctrl,EM_RoleValue_RoomID)
				AddToPartition(Boss,RoomID)                         --���mBOSS
				WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
				WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)
				WriteRoleValue(boss,EM_RoleValue_register1,doorchick2)
				SetModeEx(boss,EM_SetModeType_Move, false)
				SetPlot( boss,"dead","un_zone24_Boss3Dead",0 )
				CombatBegin=0										--���m�԰�
				PhaseCount=1										--���m�p��
				crazytime=0

			elseif ReadRoleValue( boss , EM_RoleValue_IsDead)==1 then
				firelose = SearchRangeNPC ( OwnerID() , 1000 )
				for i=0,table.getn(firelose) do
					--say(OwnerID(),"x = "..firelose[i])
						if ReadRoleValue( firelose[i] , EM_RoleValue_OrgID )==106598 or 
						ReadRoleValue( firelose[i] , EM_RoleValue_OrgID )==107460 then
							delobj(firelose[i])
						end
				end
				ScriptMessage( Boss, -1 , 2 , Sktalk[3] , 2 )
				--SetDefIdleMotion(doorchick2,ruFUSION_MIME_ACTIVATE_BEGIN)
				--SetDefIdleMotion(doorchick1,ruFUSION_MIME_ACTIVATE_BEGIN)
				Delobj(doorchick2)
				Delobj(doorchick1)
				sleep(50)
				break
			end
		end	
	end

end

function un_zone24_Boss3() --Boss AI
	local boss = OwnerID()
	local ZoneID = ReadRoleValue ( boss , EM_RoleValue_ZoneID )
	local Play_Chose2 = {} --all����C��
	local cutime = 14
	local targ = 0         --boss�D�쪺�ؼ�
	local tablerang = 0    --table�����ƥ�
	--local string1 = "[SC_106596_4][$SETVAR1="..GetName(targ).."]" 
	tablerang = table.getn(Play_Chose2)
	local ran 
	while 1 do
	sleep(10)
	--say(boss,"time = "..cutime)
	cutime = cutime+1
		if cutime>5  then
			if GetDistance( boss, targ)>80 then
				--say(boss,"too FAR")
				if ZoneID == 149 then
					sysCastSpelllv(boss,boss,499028,4)
				else
					sysCastSpelllv(boss,boss,499028,0)
				end		
			end
		end
	Play_Chose2 = DW_HateRemain(0)
	if Play_Chose2 == false then
		Play_Chose2 = {}
	end
	local playerscount = {}
	tablerang = table.getn(Play_Chose2)
	for i=1 , tablerang do --�ݦ��S���P�ɨ�ӥH�W���a�b�d��
		if GetDistance( boss, Play_Chose2[i])<80 then
			table.insert(playerscount, Play_Chose2[i])
		end
		if table.getn(playerscount) >1 then  --�d�򤺶W�L��ӤH
			if ZoneID == 149 then
					sysCastSpelllv(boss,boss,499028,4)
			else
					sysCastSpelllv(boss,boss,499028,0)
			end		
		end
	end
	GetDistance( OwnerID(), TargetID() )
	if cutime%15 ==0 then
	CancelBuff( boss, 507181 )--����������w
		if tablerang>=1 then
			ran = DW_rand(tablerang) 
			targ = Play_Chose2[ran] --�Q�D�쪺�H
			SysCastSpellLv( targ,boss, 495767, 0 )  --�J��boss
			--say(targ,"Nooooooo")
			ScriptMessage( Boss, -1 , 2 , "[SC_106596_04][$SETVAR1="..GetName(targ).."]" , 2 )
			cutime = 0
		end
	
	end
	end

end

function un_zone24_Boss3Dead() --Boss���`�@��
local door = ReadRoleValue(OwnerID(),EM_RoleValue_register1)
Delobj(door)
end
function un_zone24_monsterDead() --Ĳ�⦺�`�@��
	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_register1)
	sysCastSpellLv(Boss,Boss,499029,10) --�۱�5% (�ޯॼ�w)
	--say(boss,"ouch...")
end

function Lua_un_bump_146() --���i�z��
local own = OwnerID()
	addbuff(own,621890,1,-1)
	local lifetime = 0 
	local ZoneID = ReadRoleValue ( own , EM_RoleValue_ZoneID )
	while true do
	lifetime = lifetime+1
		sleep(10)
		if lifetime == 5 then 
			if ZoneID == 149 then
				CastSpellLv(own,own,499027,10)
			else
				CastSpellLv(own,own,499027,3)
			end
			--NPCDead(OwnerID(), OwnerID())
		elseif lifetime >=6 then
			delobj(own)
		end
	end	
end
function un_106598attack() --Ĳ�⪺����AI
local own = OwnerID()
local ZoneID = ReadRoleValue ( own , EM_RoleValue_ZoneID )
local boss = ReadRoleValue(own,EM_RoleValue_register1)
local bossHateListCount
local TargetPlayer ={}
	while 1 do
	sleep(50)
		bossHateListCount = HateListCount(boss)
		local maxhate=0;
		local tank=0;
		if bossHateListCount > 0 then
			for pos=0,bossHateListCount-1,1 do
				local id=HateListInfo(boss,pos,EM_HateListInfoType_GItemID);
				local point=HateListInfo(boss,pos,EM_HateListInfoType_HatePoint);
				if(point>maxhate)then
					tank=id;
				end
			end
			if ZoneID == 149 then
				sysCastSpellLv(own,tank,499030,0);
			else
				sysCastSpellLv(own,tank,497203,0);
			end			
		end
	end
end
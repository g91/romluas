--�ƭȦP���A�n�վ�ޯ�j�סA�Ъ���search �i�ޯ�]�w�M��j
--/////////////////////////////////////////
function lua_26in_boss2_main()--2���D�j��A�@������b�o�̡C
	local room=ReadRoleValue(OwnerID(), EM_RoleValue_RoomID);
	
	--����ǻ�
	local bancremz, morek, jill, comgas, kalaway, ironrose, dragon  =lua_26in_npcGUID();
	local Dteam={bancremz, morek, jill};
	local Fteam={dragon,  morek, jill};
	--���q1�G�s�իe�i���ƦZ�ж�
	--�����԰�
	for i, guid in pairs(Dteam) do 
		DW_UnFight(guid, true);
		SetStopAttack(guid);
		DisableQuest(guid, true);
	end
	sleep(20);
	--����
	local x,y,z,dir=DW_Location(781309, 2);
	local wait=Move(bancremz, x,y,z);
	local DteamPOS ={	[bancremz]=2;
				[morek]=3;
				[jill]=4;     };
	for i, guid in pairs(Dteam) do
		SetModeEx(guid, EM_SetModeType_Move, true);
		MoveToFlagEnabled(guid, false);
	end
	for sec=0, wait+100, 10 do
		if sec == math.floor(wait/1.25) then--�s���@��
			Lua_BroadCast_RoomStingTypeColor(room, "[SC_26IN_BOSS2_FOREPLAY_1]");           --�Ӧۺ��X���T��
		end
		if(sec==0)then Yell(bancremz,"[SC_26IN_BOSS2_GOINROOM_1]",3);end
		if(sec==30)then Yell(bancremz,"[SC_26IN_BOSS2_GOINROOM_2]",3);end
		if(sec==60)then Yell(morek,"[SC_26IN_BOSS2_GOINROOM_3]",3);end
		if(sec==90)then Yell(morek,"[SC_26IN_BOSS2_GOINROOM_4]",4);end
		if(sec==120)then Yell(jill,"[SC_26IN_BOSS2_GOINROOM_5]",4);end
		for i, guid in pairs(Dteam) do
			local x,y,z,dir=DW_Location(781309, DteamPOS[guid]);
			x,y,z,dir=DW_NewLocation(DW_Rand(360), 30, x,y,z,dir);
			Move(guid, x,y,z);
		end
		if(sec>wait)then
			local x,y,z,dir=DW_Location(781309,2);
			if(DW_GetDistance(bancremz,x,y,z)<30)then break;end
		end
		sleep(10);
	end
	--����
	local FRONTdoor=Global_BellatiaDuplication[room].door_before_boss2.GUID;
	SetModeEx(FRONTdoor,EM_SetModeType_Show,true);
	SetModeEx(FRONTdoor,EM_SetModeType_Obstruct,true);
	--���q2�G�ƱڥX�{
	--�����ƦZ
	local x,y,z,dir=DW_Location(781308, 1);
	local org={hard=102990;normal=107982;easy=108045;};
	local boss=CreateObj(org[Global_BellatiaDuplication.type], x,y,z,dir,1);
	CallPlot( boss,"lua_26in_boss2_AutoDisappear",0);
	DW_UnFight(boss, true);
	SetModeEx(boss, EM_SetModeType_Gravity, false);
	SetDefIdleMotion(boss, ruFUSION_MIME_RUN_FORWARD);
	AddToPartition(boss, room);
	LockHP(boss, DW_GetHPpercentVar(boss, 10), "lua_26in_boss2_HPtrigger");--���
	local x,y,z,dir         =DW_Location(781308, 1);
	MoveDirect(boss, x,y,z);
	Yell(boss, "[SC_26IN_BOSS2_FOREPLAY_2]", 4);                                                    --�ƦZ����
	--���ͺʭx��
	local soldANT           ={};
	for pos=2, 4, 1 do
		local x,y,z,dir=DW_Location(781308, pos);
		x,y,z,dir=DW_NewLocation(0,30, x,y,z,dir);
		local org={hard=102991;normal=107983;easy=108046;};
		local a=CreateObj(org[Global_BellatiaDuplication.type], x,y,z,dir, 1);
		DW_UnFight(a,true);
		AddToPartition(a, room);
		CallPlot( a,"lua_26in_boss2_AutoDisappear",0);
		soldANT[pos-1]=a;
	end
	--���ͧL��
	local pawnANT           ={};
	for pos=5, 19, 2 do--��b
		local x,y,z,dir=DW_Location(781308, pos);
		x,y,z,dir=DW_NewLocation(0,30, x,y,z,dir);
		local org={hard=107842;normal=107984;easy=108047;};
		local a=CreateObj(org[Global_BellatiaDuplication.type], x,y,z,dir, 1);
		DW_UnFight(a,true);
		AddToPartition(a, room);
		CallPlot( a,"lua_26in_boss2_AutoDisappear",0);
		pawnANT[pos-4]=a;
		if DW_Rand(100)>0 then--�����a��B��H
			LockHP(a, 1, "lua_26in_boss2_AntSoid");
			DebugMsg(0, room, "set soid");
		end
	end
	SetDefIdleMotion(boss, ruFUSION_MIME_IDLE_COMBAT_UNARMED);
	--�s�ճƾԳ]�w
	for i, guid in pairs(Dteam) do  
		StopMove(guid, true);
		local x,y,z,dir=DW_Location(soldANT[i]);--�U����@���ʭx��
		local dir       =DW_GetDir(x,y,z, guid);
		SetDir(guid, dir);
		SetDefIdleMotion(guid, ruFUSION_MIME_IDLE_COMBAT_UNARMED);
	end     
	
	--���s�ܨ�
	AddBuff(bancremz, 624289, 0, 5);
	SysCastSpellLv(bancremz, bancremz, 850810, 0);
	sleep(10);
	Lua_BroadCast_RoomStingTypeColor(room, "[SC_26IN_BOSS2_FOREPLAY_3]",2,C_YELLOW);
	
	sleep(20);
	SetModeEx(dragon, EM_SetModeType_Show, true)
	local x,y,z,dir=DW_Location(bancremz);
	SetPos(bancremz, 0,0,0,0);
	SetPos(dragon, x,y,z,dir);
	--�}��
	sleep(10);
	for i, guid in pairs(Fteam) do
		DW_UnFight(guid, false);
		SetAttack(guid, soldANT[i]);
	end
	DW_UnFight(boss, false);
	SetAttack(boss, dragon);
	for i,guid in pairs(soldANT) do
		SetAttack(guid, dragon)
		DW_UnFight(guid,false);
	end
	SysCastSpellLv(morek, soldANT[2], 499110,0);
	SysCastSpellLv(jill, soldANT[3], 499110,0);
	for i,guid in pairs(pawnANT) do
		SetAttack(guid, dragon);
		DW_UnFight(guid,false);
	end
	--�԰�
	--�ޯ�]�w�M��
	local fury		={id=624243;lv=0;sec=-1;course=false   };--�K�����g��
	local time_fury=480;if(Global_BellatiaDuplication.type~="hard")then time_fury=360;end
	if(Global_BellatiaDuplication.type=="easy")then fury.course=true;end--�Ϩg�ɥû����QĲ�o
	local sectorAtk		={id=850968;lv=0;         };--���Χ���(�ͤb��)
	local stronger		={id=624487;lv=0;sec=20   };--�Y�ʭx�ƪ��j��(�g�k���Z)
	local immunity		={id=624496;lv=0;sec=10   };--�K�̪k�N(624496)
	local woundAtk		={id=850970;lv=0;         };--���v������(��h�ɹ�)
	local _doublecost	={id=624492;lv=0;sec=10   };--���ƳN
	local charge		={id=850979;lv=0;         };--�ľW
	local queenbless	={id=624494;lv=0;sec=-1   };--�ä[�[��[��
	local queenkiss		={id=850973;lv=2;         };--�ɦ�%��(�ײ��𤧧k)
	local eatsoildier	={percent=5;              };--�]���ʭx�ƪ��^��%��
	local soldantcountdown	={percent=-2;              };--�ʭx�ƨC��l��%��
	
	--�԰��j��
	
	--�j����ܼ�
	local   Ant1st,Ant2nd,Ant3rd;
	
	--���A�O��
	local HPsill=DW_GetHPpercentVar(boss, 38);
	local BattlePhase= 1;
	local BossPhase= "none";
	local sAntPhase= {};
	for i, guid in pairs(soldANT) do
		sAntPhase[i]    ="none";
	end
	local pAntPhase= {};
	for __, guid in pairs(pAntPhase) do
		pAntPhase[__]   ="none";
	end
	
	--����Ȧs
	local HLmorek={};
	local HLjill={};
	
	--�O����
	local increase          =0;                          --���W��(�̤j�L��)
	local countDOWN={	RandAtk	=0;     --�����(�̤p���s)
				Immunity	=0;
				QueenKiss	=0;
				BigAE		=0;
				Send		=0;
	       			costDOUBLE	=0;
				Charge		=0;
							};
	local BossGCD=0;                          --�����(�̤p���s)
	local sAntGCD={};
	for i, guid in pairs(soldANT) do
		sAntGCD[i]=0;
	end
	local   pAntGCD ={};
	for __, guid in pairs(pAntGCD) do
		pAntGCD[__]=0;
	end     
	--����޲z
	local LivePlayer ={};  --�s�������a
	local SendPlayer ={};  --�Q���������a
	local Enermy={};  --�Ҧ��ĤH
	local shield=0;   --�@��
	
	--�ƨ禡(�԰��欰�A�ھڹ�H�Ϥ������P�禡)
	local function target_boss(effect)--�w��boss
		if(effect==nil)then
			DebugMsg(0, room, "lua_26in_boss2_main>>Func:target_boss error");
		--���Χ���
		elseif(effect=="sector attack")then
			CastSpellLv(boss, boss, sectorAtk.id, sectorAtk.lv);
		--�Y�x��
		elseif(effect=="eat ant")then
			local maxhp=ReadRoleValue(boss, EM_RoleValue_MaxHP);
			local HP_15perc=math.floor(maxhp*0.15);
			AddRoleValue(boss, EM_RoleValue_HP, HP_15perc);
			CastSpell(boss, boss, 850969);
			sleep(15);
			AddBuff(boss, stronger.id, stronger.lv, stronger.sec);
		--���ɨg��
		elseif(effect=="time's up")then
			
			
			sleep(5);
		--�Y���a
		elseif(effect=="eat player")then
			local maxhp=ReadRoleValue(boss, EM_RoleValue_MaxHP);
			local HP_20perc=math.floor(maxhp*0.2);
			AddRoleValue(boss, EM_RoleValue_HP, HP_20perc);
			CastSpell(boss, boss, 850969);
			sleep(15);
		elseif(effect=="queen begin cast AE")then
			CastSpell(boss, boss, 850978);
		end
	end
	local function target_allplayer(effect)--��Ҧ����a
		if(not effect)then
			DebugMsg(0, room, "target_allplayer>>effect is nil");
		elseif(effect=="Big AE")then
			SysCastSpellLv(boss, boss, 850971,0);
			for i, player in pairs(LivePlayer) do
				if(GetDistance(player,shield)<=79)then
					ScriptMessage(boss,player,2,"[$MUTE]".."[SC_26IN_BOSS2_AE_1]",C_LightGreen);
				else
					ScriptMessage(boss,player,2,"[$MUTE]".."[SC_26IN_BOSS2_AE_2]",C_LightGreen);
					SysCastSpellLv(boss,player,850974,0);--120%�ˮ`
				end
			end
		elseif(effect=="Big AE<40%")then
		SysCastSpellLv(boss, boss, 850971,0);
		for i, player in pairs(LivePlayer) do
			if(GetDistance(player,shield)<=79)then
				ScriptMessage(boss,player,2,"[$MUTE]".."[SC_26IN_BOSS2_AE_3]",C_LightGreen);
				SysCastSpellLv(boss, player, 850972, 0);
			else
				ScriptMessage(boss,player,2,"[$MUTE]".."[SC_26IN_BOSS2_AE_2]",C_LightGreen);
				SysCastSpellLv(boss,player,850974,0);--120%�ˮ`
			end
		end
		elseif(effect=="_double cost")then
			for i, player in pairs(LivePlayer) do
				AddBuff(player, _doublecost.id, _doublecost.lv, _doublecost.sec);
			end
		end
	end
	local function target_anyplayer(effect)--���H�����a
		--�H�����@�W���a
		if(#LivePlayer==0)then return false;end
		local n=DW_Rand(#LivePlayer);
		local player=LivePlayer[n];
		if(not effect)then
			DebugMsg(0, room, "target_anyplayer>>effect is nil");return false;
		elseif(effect=="send to boss")then
			local x,y,z,dir=DW_Location(boss);
			x,y,z,dir=DW_NewLocation(0,50, x,y,z,dir);
			SetPos(player, x,y,z,dir-180);
			AddBuff(player, 624499, 0, 5);
			table.insert(SendPlayer, player);
			return true;
		end
	end
	local function target_anyplayers()--�H����W���a
		if(#LivePlayer==0)then return false;end
		--�H���G�W���a
		local list={};
		for n=1, 2, 1 do
			local t=#LivePlayer;
			local __=DW_Rand(t);
			table.insert(list, __);
		end
		if #list ==0 then return false; end
		for i, player in pairs(list) do
			local x,y,z,dir=DW_Location(boss);
			x,y,z,dir=DW_NewLocation(0,50, x,y,z,dir);
			SetPos(player, x,y,z,dir-180);
			AddBuff(player, 624499, 0, 5);
			table(SendPlayer, player);
			return true;
		end
	end
	local function target_allEnermy(effect)--��Ҧ��ĤH
		if not effect then
			DebugMsg(0, room, "target_anyplayer>>effect is nil");
		elseif effect=="eat player bless" then
			for i, foe in pairs(Enermy) do
				AddBuff(foe, queenbless.id, queenbless.lv, queenbless.sec);
			end
		elseif effect=="queen kiss cast" then
			CastSpell(boss, boss, 850977);
		elseif effect=="queen kiss success" then
			for i, foe in pairs(Enermy) do
				SysCastSpellLv(boss, foe, queenkiss.id, queenkiss.lv);
			end
		end
	end
	--�ƨ禡(�B�~�欰)
	local function LivePlayer_reflash()--���s��z�s�����a
		local Num_fromGlobal=#Global_BellatiaDuplication[room].players;
		LivePlayer={};
		for i=1,Num_fromGlobal,1 do
			local player = Global_BellatiaDuplication[room].players[i].guid;
			if ReadRoleValue(player, EM_RoleValue_IsDead)==0 then
				if GetDistance(player, boss)<=600 then
					if(CheckRelation(boss,player,EM_CheckRelationType_Attackable))then
						table.insert(LivePlayer, player);
					end
				end
			end
		end
	end
	local function Allsurvive()--�ͭx(Fteam)���������s��
		for __, guid in pairs(Dteam) do
			if not CheckID(guid) then
				DebugMsg(0,room,"D team no."..__.." is gone");
				return false;
			end
			if ReadRoleValue(guid, EM_RoleValue_IsDead)==1 then
				DebugMsg(0,room,"D team no."..__.." is dead");
				return false;
			end
		end
		return true;
	end
	local function SaveHateList(guid)--�O������C��
		local list={};
		local n=HateListCount(guid);if n==0 then return {}; end
		for pos=0, n-1, 1 do
			local id=HateListInfo(guid, pos, EM_HateListInfoType_GItemID);
			local point=HateListInfo(guid, pos, EM_HateListInfoType_HatePoint);
			list[id]=point;
		end
		return list;
	end
	local function BuildHate(guid,list)--�إߤ���
		for id,__ in pairs(list)do  
			SysCastSpellLv(id,guid,495751,0);
		end
	end
	local function recoverHATE(guid, list)--�[�J�쥻������C��
		local HateM     ={};
		local n=HateListCount(guid);
		for pos=0, n-1, 1 do
			local id        =HateListInfo(guid, pos, EM_HateListInfoType_GItemID);
			if list[id] then
				DW_HateAdd(guid, id, list[id]);--�[�J�����
			end
		end
	end
	local function checkHATEtrans(guid,list)--�����w�g���\�ಾ
		local n=HateListCount(guid);
		for pos=0,n-1,1 do
			local id=HateListInfo(guid,pos,EM_HateListInfoType_GItemID);
			local point=HateListInfo(guid,pos,EM_HateListInfoType_HatePoint);
			if(list[id])then
				if(list[id]>point)then return false;end
			end
		end
		return true;
	end
	--��l���
	do
		--������w
		SysCastSpellLv(boss,dragon,496266,0);         SysCastSpellLv(dragon,boss,496266,0);        
		SysCastSpellLv(soldANT[2],morek,496266,0);SysCastSpellLv(morek,soldANT[2],496266,0);
		SysCastSpellLv(soldANT[3],jill,496266,0);       SysCastSpellLv(jill,soldANT[3],496266,0);
	end
	local function failreset()--���γB�z
		sleep(30);
		--����
		Lua_BellatiaDuplication_change_status(room,"fail");
		Lua_BellatiaDuplication_fail();
		DelObj(boss);
		
		--�}��
		SetModeEx(FRONTdoor,EM_SetModeType_Show,false);
		SetModeEx(FRONTdoor,EM_SetModeType_Obstruct,false);
		end
	
	while ReadRoleValue(boss, EM_RoleValue_Register)==0 do
		--RESET
		for i,guid in pairs(soldANT) do
			local pos=i+1;
			if not CheckID(guid) or ReadRoleValue(guid, EM_RoleValue_IsDead)==1 then
				local x,y,z,dir=DW_Location(781308, pos);
				local org={hard=102991;normal=107983;easy=108046;};
				local a=CreateObj(org[Global_BellatiaDuplication.type], x,y,z,dir, 1);
				AddToPartition(a, room);
				CallPlot( a,"lua_26in_boss2_AutoDisappear",0);
				soldANT[pos-1]=a;
				if(i==1)then
				SetAttack(a,dragon);
				elseif(i==2)then
				SysCastSpellLv(a,morek,496266,0);SysCastSpellLv(morek,a,496266,0);SetAttack(a,morek);
				elseif(i==3)then
				SysCastSpellLv(a,jill,496266,0);SysCastSpellLv(jill,a,496266,0);SetAttack(a,jill);
				end
			end
		end
		Ant1st  =soldANT[1]; --�����a
		Ant2nd  =soldANT[2]; --������J
		Ant3rd  =soldANT[3]; --���N��
		
		--KEEP
		--���ѱ���
		if(not Allsurvive())then
			DebugMsg(0,room,"one of npc die");
			Lua_BroadCast_RoomStingTypeColor(room,"[SC_26IN_BOSS2_FAIL_1]",2,C_LightGreen);
			failreset();return;
		end
		if(DW_GetHPpercent(dragon)<10)then
			DebugMsg(0,room,"dragon's hp is too low");
			for pos=0,HateListCount(dragon)-1,1 do
				local id=HateListInfo(dragon,pos,EM_HateListInfoType_GItemID);
				local dmg=HateListInfo(dragon,pos,EM_HateListInfoType_HitPoint);
				DebugMsg(0,room,"POS:"..pos..", id:"..id.." ,dmg:"..dmg);
			end
			Lua_BroadCast_RoomStingTypeColor(room,"[SC_26IN_BOSS2_FAIL_2]",2,C_LightGreen);
			failreset();return;
		end
		
		--�}�Ծ���
		increase        =increase+1;
		
		--�w�ɧ�s���a�W��
		
		Lua_BellatiaDuplication_update_players(room);
		
		
		--�������
		do
			--���s
			DW_HateAdd(boss,dragon,50000);DW_HateAdd(dragon,boss,50000);
			--����J
			if(CheckID(Ant2nd))and(ReadRoleValue(Ant2nd,EM_RoleValue_IsDead)==0)then
				DW_HateAdd(Ant2nd,morek,50000);DW_HateAdd(morek,Ant2nd,50000);
				if(not CheckBuff(Ant2nd,508172))then SysCastSpellLv(morek,Ant2nd,496266,0);end;
			end
			--�N��
			if(CheckID(Ant3rd))and(ReadRoleValue(Ant3rd,EM_RoleValue_IsDead)==0)then DW_HateAdd(Ant3rd,jill,50000);DW_HateAdd(jill,Ant3rd,50000);end
		end
		--��m����
		for __=1,1,1 do
			--�ʭx�Ʀ��F      out!(�O�ϳB�z)
			if(not CheckID(Ant2nd))or(ReadRoleValue(Ant2nd,EM_RoleValue_IsDead)==1)then break;end
			--�ʭx�Ʀ�q�ӧC  out!(�ˬd�A�Ѱ��ھԼҦ�)
			if(DW_GetHPpercent(Ant2nd)<=20)then
				if(HateListCount(morek)==0)then
					DW_UnFight(morek,false);
					CastSpell(morek,morek,497450);
				end
				break;
			end
			--�����٨S��W    out!(�O�ϳB�z)
			if(not CheckBuff(Ant2nd,508172))then break;end
			--�w�g��d��    out!(����)
			local x,y,z,dir=DW_Location(781310,1);local dis=DW_GetDistance(morek,x,y,z);
			if(dis>50)then
				if(HateListCount(morek)~=0)then
					HLmorek={};
					HLmorek=SaveHateList(morek);
					SetModeEx(morek,EM_SetModeType_Strikback,false);
					SetModeEx(morek,EM_SetModeType_Searchenemy,false);
					SetStopAttack(morek);
				end
				Move(morek,x,y,z);
				break;
			end
			--�ʭx�ƥ���W    out!
			local dis=DW_GetDistance(Ant2nd,x,y,z);
			if(dis>70)then break;end
			--�̫�P�_:�ʭx�Ƹ�W�ɡA���Ҿ԰�
			if(HateListCount(morek)==0)then
				DW_UnFight(morek,false);
				BuildHate(morek,HLmorek);
				break;
			end
			if(checkHATEtrans(morek,HLmorek)==false)then
				BuildHate(morek,HLmorek);
				recoverHATE(morek,HLmorek);
				break;
			end
		end
		for __=1,1,1 do
			--�ʭx�Ʀ��F      out!(�O�ϳB�z)
			if(not CheckID(Ant3rd))or(ReadRoleValue(Ant3rd,EM_RoleValue_IsDead)==1)then break;end
			--�ʭx�Ʀ�q�ӧC  out!(�ˬd�A�Ѱ��ھԼҦ�)
			if(DW_GetHPpercent(Ant3rd)<=20)then
				if(HateListCount(jill)==0)then
				DW_UnFight(jill,false);
				CastSpell(jill,jill,497450);
				end
				break;
			end
			--�����٨S��W    out!(�O�ϳB�z)
			if(not CheckBuff(Ant3rd,508172))then break;end
			--�w�g��d��    out!(����)
			local x,y,z,dir=DW_Location(781310,2);local dis=DW_GetDistance(jill,x,y,z);
			if(dis>50)then
				if(HateListCount(jill)~=0)then
					HLjill={};
				HLjill=SaveHateList(jill);
				SetModeEx(jill,EM_SetModeType_Strikback,false);
				SetModeEx(jill,EM_SetModeType_Searchenemy,false);
				SetStopAttack(jill);
				end
				Move(jill,x,y,z);
				break;
			end
			--�ʭx�ƥ���W    out!
			local dis=DW_GetDistance(Ant3rd,x,y,z);
			if(dis>70)then break;end
			--�̫�P�_:�ʭx�Ƹ�W�ɡA���Ҿ԰�
			if(HateListCount(jill)==0)then
				DW_UnFight(jill,false);
				BuildHate(jill,HLjill);
				break;
			end
			if(checkHATEtrans(jill,HLjill)==false)then
				BuildHate(jill,HLjill);
				recoverHATE(jill,HLjill);
				break;
			end
		end
		--�԰����q
		--�T��
		if DW_GetHPpercent(boss)<=40 and BattlePhase==1 then
			BattlePhase = 2;
			Lua_BroadCast_RoomStingTypeColor(room, "[SC_26IN_BOSS2_FOREPLAY_7]",2,C_LightGreen);                   --�i�J���q2;
			Lua_BellatiaDuplication_change_music(room,Global_BellatiaDuplication.music.boss2_hp_less_than_40_percent);
		end
		if ReadRoleValue(boss, EM_RoleValue_HP)<HPsill then
			Lua_BroadCast_RoomStingTypeColor(room, "[SC_26IN_BOSS2_WIKI_1]");
		end
		
		
		--�ƦZ�@�P�N�o
		if      not (BossGCD==0) then
			BossGCD =BossGCD-1;
		elseif  (BossGCD==0) then
			BossPhase="none";                               --���q���m
		end
		
		--�ʭx�Ʀ@�P�N�o(�T�����})
		for     __, GCD in pairs(sAntGCD) do                    --���q���m
			if      not (GCD==0) then
				sAntGCD[__]=GCD-1;
			elseif  (GCD==0) then
				sAntPhase[__]="none";                
			end
		end
		
		--�ޯ�N�o
		for     __, sec in pairs(countDOWN) do
			if not (sec==0) then
				countDOWN[__]=sec -1;
			end
		end
		--�g�ɾ���
		if(increase>=time_fury)and(fury.course==false)then
			AddBuff(boss, fury.id, fury.lv, fury.sec);
			Lua_BroadCast_RoomStingTypeColor(room,"[SC_26IN_BOSS2_FURY]",2,C_LightBlue);
			fury.course=true;--�榸Ĳ�o
		end
		
		--�������a�W��
		--�޿�G2���ж����j�A�Z��boss�@�w���d�򤺳���b�ж���
		--�b�ж����@�w�b�����A�ҥH�α����t�X�Z��
		LivePlayer_reflash();
		if #LivePlayer==0 then
			DebugMsg(0,room,"don't get any player");
			Lua_BroadCast_RoomStingTypeColor(room,"[SC_26IN_BOSS2_FAIL_3]",2,C_LightGreen);
			failreset();return;
		end
		
		--�����ĤH�W��
		--�޿�G�ĤH�u���ƦZ�B�ʭx�ƩM�L�ơA�U�۸˦btable��
		--�Ntable�`�M�_�ӴN�O�Ҧ��ĤH
		Enermy={boss;};
		for i, guid in pairs(soldANT) do
			if CheckID(guid) and ReadRoleValue(guid, EM_RoleValue_IsDead)==0 then
				table.insert(Enermy, guid);
			end
		end
		for __, guid in pairs(pawnANT) do
			if CheckID(guid) and ReadRoleValue(guid, EM_RoleValue_IsDead)==0 then
				table.insert(Enermy, guid);
			end
		end
		
		--�ʭx�Ʀ�q
		for i, guid in pairs(soldANT) do
			if DW_GetHPpercent(guid)<=20 then
				sAntPhase[i]="Sacrifice";--�̰��u���v
				sAntGCD[i]=10;
				SetModeEx(guid, EM_SetModeType_Strikback, false);
				SetModeEx(guid, EM_SetModeType_Searchenemy, false);
				SetStopAttack(guid);
				local x,y,z,dir=DW_Location(boss);
				x,y,z,dir=DW_Relative(guid,x,y,z,45);
				Move(guid,x,y,z);
			else
				local _t=ReadRoleValue(guid,EM_RoleValue_AttackTargetID);
				if(ReadRoleValue(_t,EM_RoleValue_IsPlayer)==0)then
					DW_AddHPpercent(guid,soldantcountdown.percent);
				end
			end
		end
		
		--�ޯ��
		
		--�ƦZ
		--���۰�
		--7�� �H������
		for __=1,1,1 do
			if not (BossPhase=="none" and BossGCD==0)       then break; end
			if(countDOWN.RandAtk~=0)then break; end
			DebugMsg(0, room, "RandAtk");
			BossPhase="RandAtk"; --�H������
			BossGCD=1;           --�@�P�N�o�G1
			countDOWN.RandAtk=7; --CD�G7
			
			if      DW_rand(100)>50         then
				--���Χ���
				target_boss("sector attack");
			else
				--���v������
				CastSpellLv(boss, dragon, woundAtk.id, woundAtk.lv);
				Lua_BroadCast_RoomStingTypeColor(room, "[SC_26IN_BOSS2_WOUNDATK]",2,C_LightGreen)
			end
		end
		--13�� �ʭx�ƧK�̪k�N(�µ�)
		for __=1,1,1 do
			if not (BossPhase=="none" and BossGCD==0)       then break; end
			if not (countDOWN.Immunity==0)                  then break; end
			DebugMsg(0, room, "Immunity");
			BossPhase          ="Immunity";--�K�̪k�N
			BossGCD            =1;         --�@�P�N�o�G1
			countDOWN.Immunity =13;        --CD�G13
			
			Lua_BroadCast_RoomStingTypeColor(room, "[SC_26IN_BOSS2_IMMUNITY]",2,C_LightGreen);
			if(Ant1st)then  AddBuff(Ant1st, immunity.id, Immunity.lv, Immunity.sec);end
			if(Ant2nd)then  AddBuff(Ant2nd, immunity.id, Immunity.lv, Immunity.sec);end
			if(Ant3rd)then  AddBuff(Ant3rd, immunity.id, Immunity.lv, Immunity.sec);end
		end
		--15�� �����^��(�ײ��𤧧k)
		for __=1,1,1 do
			if not (BossPhase=="none" and BossGCD==0)       then break; end
			if not (countDOWN.QueenKiss==0)                 then break; end
			DebugMsg(0, room, "QueenKiss Cast");
			BossPhase          ="QueenKiss Cast";--�ײ��𤧧k �I�k
			BossGCD            =3;               --�@�P�N�o�G3
			countDOWN.QueenKiss=15;              --CD�G15
			
			Lua_BroadCast_RoomStingTypeColor(room, "[SC_26IN_BOSS2_QUEENKISSCAST]",2,C_LightGreen);
			target_allEnermy("queen kiss cast");
		end
		--30�� �����j��(���Z���k)
		for __=1,1,1 do
			if not (BossPhase=="none" and BossGCD==0)       then break; end
			if not (countDOWN.BigAE==0)                     then break; end
			DebugMsg(0, room, "BigAE Cast");
			BossPhase       ="BigAE Cast";--���Z���k �I�k
			BossGCD         =8;           --�@�P�N�o�G8(�I�k5�� ���O�n���)
			countDOWN.BigAE =30;          --CD�G30
			
			target_boss("queen begin cast AE");
			local x,y,z,dir=DW_Location(dragon);
			shield=CreateObj(108113, x,y,z,dir, 1);
			SetModeEx(shield, EM_SetModeType_Mark, false);
			SetModeEx(shield, EM_SetModeType_ShowRoleHead, false);
			DW_UnFight(shield, true);
			AddToPartition(shield, room);
			WriteRoleValue(shield, EM_RoleValue_LiveTime, 6);
			CallPlot(shield, "lua_26in_boss2_AutoDisappear", 0);
		end
		--���۰�
		for __=1,1,1 do
			--��    ����
			if #SendPlayer~=0 then
				for __, player in pairs(SendPlayer) do
				if CheckBuff(player, 624499)==false then
					if GetDistance(player, boss)<=70 then
						CastSpell(boss, player, 850976);
						SysCastSpellLv(boss,player,850975,0);--120%�ˮ`
						if CastSpell(boss, player, 850969)==false then SysCastSpellLv(boss, player, 850969, 0); end
						--�Ҧ��Ʊ���oBuff
						for __, guid in pairs(Enermy) do
							AddBuff(guid, 624494, 0, -1);
						end
					end
					SendPlayer[__]=nil;
				end
				end
			end
			--��    �^�m
			for i=1, 3, 1 do
				--�޿�G���ʭx�ƪ����A�ܦ��^�m
				if sAntPhase[i]=="Sacrifice" then
			if GetDistance(soldANT[i], boss)<55 then
				CastSpell(boss, soldANT[i], 850976);
				KillID(boss, soldANT[i]);
				sAntPhase[i]="none";
				if CastSpell(boss, soldANT[i], 850969)==false then SysCastSpellLv(boss, soldANT[i], 850969, 0); end
				DW_AddHPpercent(boss, eatsoildier.percent);
				--�ۤv���j��
				AddBuff(boss, 624487, 1, 20);
			end
				end
			end
			
			--��    �ײ��𤧧k
			if(BossPhase=="QueenKiss Cast")then
				--�޿�G�I�k���\�|��Buff:624495
				--�S��Buff�A�I���k�S����A�N��Q���_�F;
				if CheckBuff(boss, 624495) then
				CancelBuff_NoEvent(boss, 624495);
				DebugMsg(0, room, "QueenKiss Success");
				BossPhase="QueenKiss Success" --�ײ��𤧧k ���\
				countDOWN.QueenKiss=15;       --CD�G15
				
				Lua_BroadCast_RoomStingTypeColor(room, "[SC_26IN_BOSS2_QUEENKISS]",2,C_LightGreen);
				target_allEnermy("queen kiss success");
				else
				--�S���I�k���\��buff
				if ReadRoleValue(boss, EM_RoleValue_SpellMagicID)~= 850977 then
					BossPhase="QueenKiss Broken"     --�ײ��𤧧k ����
					BossGCD=1;                       --�@�P�N�o���
					countDOWN.QueenKiss=15;          --CD�G15
					
					Lua_BroadCast_RoomStingTypeColor(room, "[SC_26IN_BOSS2_QUEENKISSFAIL]",2,C_LightGreen);
				end
				end
				break;
			end
			--��    ���Z���k
			if(BossPhase=="BigAE Cast")then
				--�޿�G���ޯ�I�񥲩w���\, �I�k���\�|��Buff:624495
				--�᭱�s��I�� �l��L��
				if CheckBuff(boss, 624495) then
					CancelBuff_NoEvent(boss, 624495);
					
					BossPhase       ="Summon Pawn"--�l��L��
					BossGCD         =3;           --�@�P�N�o�G3(�ץ�)
					countDOWN.BigAE=30;           --CD�G30
					if DW_GetHPpercent(boss)<=40 then
						target_allplayer("Big AE<40%")
					else
						target_allplayer("Big AE");
					end
				end
				for __, guid in pairs(LivePlayer) do
					if GetDistance(shield, guid)<=79 then
						AddBuff(guid, 624490, 0, 2);
					end
				end
				break;
			end
			--��    �l��L��
			if(BossPhase=="Summon Pawn")then
				--�޿�G�l��L�ƨëD�@�Ӱʧ@�A�O���bBigAE�᭱2��Ĳ�o
				--�º�ήɶ��P�_�I��
				if BossGCD<=1 then
				DebugMsg(0, room, "Summon Pawn");
				
				BossPhase ="none";--�M�����q
				BossGCD   =0;     --�@�P�N�o����
				
				local n=5;--�u��5��
				for i=1,15,1 do--15���L��
					local pos=i+4;
					local guid;if(pawnANT[i]==nil)then guid=0;else guid=pawnANT[i];end--CheckID(guid)�|�Ofalse
					if CheckID(guid)==false or ReadRoleValue(guid, EM_RoleValue_IsDead)==1 then
						local x,y,z,dir =DW_Location(781308, pos);
						x,y,z,dir=DW_NewLocation(0,30, x,y,z,dir);
						local org={hard=107842;normal=107984;easy=108047;};
						local a=CreateObj(org[Global_BellatiaDuplication.type], x,y,z,dir, 1);
						AddToPartition(a, room);
						CallPlot( a,"lua_26in_boss2_AutoDisappear",0);
						pawnANT[i]=a;
						SetAttack(a, dragon);
						LockHP(a, 1, "lua_26in_boss2_AntSoid");
						if n==0 then break; end
						n=n-1;
					end
				end
				end
				break;
			end
		end
		--�ʭx��(Ant1st)>>���@�۸H�I�١A���b�ҪO�W
		for i, guid in pairs(soldANT) do
			if sAntGCD[i]==0 and sAntPhase[i]=="none" then
				if guid == Ant1st then
				if(countDOWN.Send==0)and(BossPhase~="BigAE Cast")then
					local success_cast=true;
					if(Global_BellatiaDuplication.types~="hard")then
					--if(ReadRoleValue(Ant1st,EM_RoleValue_ZoneID)==154)then
						success_cast=target_anyplayer("send to boss");
					else
						success_cast=target_anyplayers();
					end
					if(success_cast)then
						sAntPhase[i]   ="Send"; --����
						sAntGCD[i]     =3;      --�@�P�N�o�G3
						countDOWN.Send =7;      --CD�G7
					end
					break;
				end
				if countDOWN.costDOUBLE ==0 then
					if(target_allplayer("_double cost"))then
						sAntPhase[i]          ="costDOUBLE"; --���ƳN
						sAntGCD[i]            =2;            --�@�P�N�o�G2
						countDOWN.costDOUBLE  =20;           --CD�G20
					end
					break;
				end
				if countDOWN.Charge ==0 then
					CastSpellLv(Ant1st, player, charge.id, charge.lv);
					sAntPhase[i]      ="Charge";  --���D����
					sAntGCD[i]        =4;         --�@�P�N�o�G4
					countDOWN.Charge  =13;        --CD�G13
					break;
				end
				end
			end
		end
		
		
		sleep(10);
	end
	--���q4�G���x�M��
	--����s����s(�p�߷|����)
	--����ͭx
	Lua_BroadCast_RoomStingTypeColor(room, "[SC_26IN_BOSS2_FOREPLAY_4]",2,"C_LightGreen");                                   --�ƦZ�T��
	local bancremz, morek, jill, comgas, kalaway, ironrose, dragon=lua_26in_npcGUID();
	local soldier=lua_26in_getsoldiersguid();
	local POS={
			{205, 50};
			{215, 40};
			{155, 50};
			{145, 40};
					};
	local x,y,z,dir=DW_Location(FRONTdoor);
	for i=1,4,1 do
		local x,y,z,dir         =DW_NewLocation(POS[i][1], POS[i][2], x,y,z,dir);
		AddToPartition(soldier[i].guid, room);
		SetPos(soldier[i].guid, x,y,z,dir);
	end
	local Ateam     ={comgas; kalaway; ironrose;    };
	local POS={
			{180, 20};
			{225, 25};
			{135, 25};      };
	for i, guid in pairs(Ateam) do
		local x,y,z,dir         =DW_NewLocation(POS[i][1], POS[i][2], x,y,z,dir);
		SetModeEx(guid, EM_SetModeType_Show, true);
		SetModeEx(guid, EM_SetModeType_Move, true);
		DW_UnFight(guid, false);
	end
	local ally                      ={	bancremz	=       bancremz;
					morek		=       morek;
					jill		=       jill;
					comgas	=       comgas;
					kalaway	=       kalaway;
					ironrose	=       ironrose;
					soldier1	=       soldier[1].guid;
					soldier2	=       soldier[2].guid;
					soldier3	=       soldier[3].guid;
					soldier4	=       soldier[4].guid;        };      
	--���x�]�w
	for __, guid in pairs(ally) do
		MoveToFlagEnabled(guid, false);
	end
	--���x����
	local x,y,z,dir =DW_Location(dragon);
	for i=1, 4, 1 do
		local x,y,z,dir =DW_NewLocation(90*i, 60, x,y,z,dir);
		Move(soldier[i].guid, x,y,z);
	end
	for i, guid in pairs(Ateam) do
		local x,y,z,dir =DW_NewLocation(120*i, 60, x,y,z,dir);
		Move(guid, x,y,z);
	end
	--���ͳ̫᪺�Ʊ�
	for i, guid in pairs(soldANT) do--3���ʭx��
		local pos=i+1;
		if CheckID(guid)==false or ReadRoleValue(guid, EM_RoleValue_IsDead)==1 then
			local x,y,z,dir =DW_Location(781308, pos);
			x,y,z,dir       =DW_NewLocation(0,30, x,y,z,dir);
			local org={hard=102991;normal=107983;easy=108046;};
			local a=CreateObj(org[Global_BellatiaDuplication.type], x,y,z,dir, 1);
			AddToPartition(a, room);
			CallPlot( a,"lua_26in_boss2_AutoDisappear",0);
			soldANT[i]=a;
			SetAttack(a, dragon);
		end
		LockHP(soldANT[i], 99999, "");
	end
	for i=1,15,1 do--15���L��
		local pos=i+4;
		local guid;if(pawnANT[i]==nil)then guid=0;else guid=pawnANT[i];end--CheckID(guid)�|�Ofalse
		if CheckID(guid)==false or ReadRoleValue(guid, EM_RoleValue_IsDead)==1 then
			local x,y,z,dir =DW_Location(781308, pos);
			x,y,z,dir       =DW_NewLocation(0,30, x,y,z,dir);
			local org={hard=107842;normal=107984;easy=108047;};
			local a=CreateObj(org[Global_BellatiaDuplication.type], x,y,z,dir, 1);
			AddToPartition(a, room);
			CallPlot( a,"lua_26in_boss2_AutoDisappear",0);
			pawnANT[i]=a;
			SetAttack(a, dragon);
		end
		LockHP(pawnANT[i], 99999, "");
	end
	--���ƦZ���`
	for percent=8, 0, -1 do
		if percent==6 then
			Yell(kalaway, "[SC_26IN_BOSS2_FOREPLAY_5]", 4);
		end
		if percent==8 then
			Yell(comgas, "[SC_26IN_BOSS2_FOREPLAY_6]", 4);
		end
		sleep(20);
		--�קK���a����
		Lua_BellatiaDuplication_update_players(room);
		LivePlayer_reflash();
		if #LivePlayer==0 then
			DebugMsg(0,room,"don't get any player");
			Lua_BroadCast_RoomStingTypeColor(room,"[SC_26IN_BOSS2_FAIL_3]",2,C_LightGreen);
			failreset();return;
		end
		
		if percent==0 then
			WriteRoleValue(boss, EM_RoleValue_HP, 1);
			LockHP(boss, -100, "");
		else
			DW_SetHPpercent(boss, percent+1);--�������ִN���A��
			LockHP(boss, DW_GetHPpercentVar(boss, percent), "");
		end
	end
	--���q5�G�԰��ᨫ��
	local function CheckBossDeath()--�T�{Boss�w��
		if(not CheckID(boss))then return true;end
		if(ReadRoleValue(boss, EM_RoleValue_IsDead)==1)then return true;end
		return false;
	end
	while(CheckBossDeath()==false)do
		Lua_BellatiaDuplication_update_players(room);
		LivePlayer_reflash();
		if #LivePlayer==0 then
			DebugMsg(0,room,"don't get any player");
			Lua_BroadCast_RoomStingTypeColor(room,"[SC_26IN_BOSS2_FAIL_3]",2,C_LightGreen);
			failreset();return;
		end
		sleep(10);
	end
	Lua_BroadCast_RoomStingTypeColor(room, "[SC_26IN_BOSS2_FOREPLAY_8]",2,C_LightGreen);
	--�Ʊڰk��
	for i, guid in pairs(soldANT) do
		AddBuff(guid, 624287, 0, -1);
		DW_UnFight(guid, true);
		SetStopAttack(guid);
		BeginPlot(guid, "DelSelf", 30);
		local x,y,z,dir=DW_Location(guid);
		local dir=DW_GetDir(x,y,z, dragon);
		x,y,z,dir=DW_NewLocation(0, 200, x,y,z,dir);
		MoveDirect(guid, x,y,z);
	end
	for i, guid in pairs(pawnANT) do
		AddBuff(guid, 624287, 0, -1);
		DW_UnFight(guid, true);
		SetStopAttack(guid);
		BeginPlot(guid, "DelSelf", 30);
		local x,y,z,dir=DW_Location(guid);
		local dir=DW_GetDir(x,y,z, dragon);
		x,y,z,dir=DW_NewLocation(0, 200, x,y,z,dir);
		MoveDirect(guid, x,y,z);
	end
	--���}���ת�
	SetModeEx(FRONTdoor,EM_SetModeType_Show,false);
	SetModeEx(FRONTdoor,EM_SetModeType_Obstruct,false);
	
	--����(�ۨ���)
	for __, guid in pairs(ally) do
		MoveToFlagEnabled(guid, false);
		DW_UnFight(guid, true);
		StopMove(guid, false);
	end
	
	local x,y,z,dir=DW_Location(dragon);
	SetPos(bancremz, x,y,z,dir);
	SysCastSpellLv(dragon, dragon, 850810, 0);
	sleep(30);
	SetPos(dragon, 0,0,0,0);
	SetModeEx(dragon, EM_SetModeType_Show, false);
	SetModeEx(bancremz, EM_SetModeType_Show, true);
	
	for sec=1, 5, 1 do
		if sec==3 then
			Lua_BroadCast_RoomStingTypeColor(room, "[SC_26IN_BOSS2_WIKI_2]");               --���X�H�L
		end
		local x,y,z,dir=DW_Location(781316,    1);
		Move(bancremz, x,y,z);
		local x,y,z,dir=DW_Location(781316,    2);
		Move(morek, x,y,z);
		local x,y,z,dir=DW_Location(781316,    3);
		Move(jill, x,y,z);
		local x,y,z,dir=DW_Location(781316,    4);
		Move(comgas, x,y,z);
		local x,y,z,dir=DW_Location(781316,    5);
		Move(kalaway, x,y,z);
		local x,y,z,dir=DW_Location(781316,    6);
		Move(ironrose, x,y,z);
		local x,y,z,dir=DW_Location(781316,    7);
		Move(soldier[1].guid, x,y,z);
		local x,y,z,dir=DW_Location(781316,    8);
		Move(soldier[2].guid, x,y,z);
		local x,y,z,dir=DW_Location(781316,    9);
		Move(soldier[3].guid, x,y,z);
		local x,y,z,dir=DW_Location(781316,    10);
		Move(soldier[4].guid, x,y,z);
		sleep(10);
	end
	Yell(comgas, "[SC_26IN_BOSS2_WIKI_3]", 4);--�d�������
	DisableQuest(bancremz, false);
	Lua_BellatiaDuplication_change_status(room, "success");
	--�� bancremz ������ܼ@��
	Global_26IN_Boss2AlreadyBEdefeat = Global_26IN_Boss2AlreadyBEdefeat or {};
	Global_26IN_Boss2AlreadyBEdefeat[room]=true;
	
	local x,y,z,dir=DW_Location(bancremz);
	for __, guid in pairs(ally) do
		local dir=DW_GetDir(x,y,z, guid);
		SetDir(guid, dir);
		SetDefIdleMotion(guid, ruFUSION_MIME_IDLE_STAND);
		SetModeEx(guid, EM_SetModeType_Mark, true);
	end
	local x,y,z,dir=DW_Location(morek);
	local dir=DW_GetDir(x,y,z, bancremz);
	SetDir(bancremz, dir);
	sleep(20);
	Yell(bancremz,"[SC_26IN_BOSS2_END]",3);
end
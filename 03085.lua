function lua_28in_Boss5_tokenrule(master)
--�l�ͪ��W�h
	while true do
		sleep(10);
		if(CheckID(master)==false)or(ReadRoleValue(master,EM_RoleValue_IsDead)==1)then
			DelObj(OwnerID());
			return;
		end
	end
end
function lua_28in_Boss5_broadcast(msg_type,msg,msg_color)
--�s���ܦP�@�h��
	local room=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	if(msg_type==nil)or(msg==nil)then
		DebugMsg(0,room,"parameter is nil");
		return false;
	end
	if(msg_color==nil)then
		msg_color=0;
	end
	if(msg_type==2)then
		msg="[$MUTE]"..msg;
	end
	local num=SetSearchAllPlayer(room);
	for i=1,num,1 do
		local player=GetSearchResult();
		ScriptMessage(player,player,msg_type,msg,msg_color);
	end
end
function lua_28in_Boss5_LuaEvent_BeginAttack()
--�i�J�԰�Ĳ�o
	local boss=OwnerID();
	local room=ReadRoleValue(boss, EM_RoleValue_RoomID);
	local x,y,z,dir=DW_Location(boss);
	local ctrl=CreateObj(110987,x,y,z,dir,1);
	SetModeEx(ctrl,EM_SetModeType_ShowRoleHead,false);
	SetModeEx(ctrl,EM_SetModeType_Show,false);
	SetModeEx(ctrl,EM_SetModeType_Mark,false);
	AddToPartition(ctrl,room);
	CallPlot(ctrl,"lua_28in_Boss5_tokenrule",boss);
	BeginPlot(ctrl,"lua_28in_Boss5_main",0);
	Cl_Resist_HackersFightBegin()	--���b�Ⱦ���_�԰��}�l_BICO
end
function lua_28in_Boss5_main()
--�����D�j��
	local ctrl=OwnerID();
	local boss=TargetID();
	local room=ReadRoleValue(boss,EM_RoleValue_RoomID);
	local zone=ReadRoleValue(boss,EM_RoleValue_ZoneID);
	--�}��
	local x,y,z,dir=DW_Location(781359,1)
	local gate=CreateObj(106249,x,y,z,dir,1);
	SetModeEx(gate,EM_SetModeType_ShowRoleHead,false);
	SetModeEx( gate , EM_SetModeType_Mark , false );	--���i�I��
	SetModeEx( gate , EM_SetModeType_HideName , true );	--����ܦW��
	SetModeEx( gate , EM_SetModeType_NotShowHPMP , true );	--����ܦ��
	SetModeEx( gate , EM_SetModeType_Strikback , false );	--���|����
	SetModeEx( gate , EM_SetModeType_Move , false );	--���|����
	SetModeEx( gate , EM_SetModeType_Fight , false );	--���i����
	SetModeEx( gate , EM_SetModeType_Searchenemy , false );	--���|����
	SetModeEx( gate , EM_SetModeType_Obstruct , true );	--�����׮ĪG
	AddToPartition(gate,room);
	CallPlot(gate,"lua_28in_Boss5_tokenrule",ctrl);
	--��Ƴ]�w
	local cycle_num=2;
	local bell={num=5;countdown=15;recover=20;};
	local randAtk={countdown=7;};
	local terminate={countdown=39;duration=10;}
	local TrippleBuff={624832;624833;624834;};
	local fury={trigger=360};
	if(zone==160)then fury.trigger=480; end
	--�����ܼ�
	Global_28in_Boss5=Global_28in_Boss5 or {};
	Global_28in_Boss5[room]={bell={};triple_trigger=false;soul_back=false;boss=boss;};
	--����5����
	local _dummyBellGUID = 107071;--�q�γz���y --140211 K.J. Aris
	local _dummyID = 0;
	Global_28in_Boss5[room]._dummyBell = {};--140211 K.J. Aris
	for i=1,bell.num,1 do
		local x,y,z,dir=DW_Location(781358,i);
		local b=CreateObj(103382,x,y,z,dir,1);
		SetModeEx(b,EM_SetModeType_Strikback,false);
		SetModeEx(b,EM_SetModeType_Searchenemy,false);
		AddToPartition(b,room);
		CallPlot(b,"lua_28in_Boss5_tokenrule",ctrl);
		LockHP(b,ReadRoleValue(b,EM_RoleValue_MaxHP),"lua_28in_Boss5_BellTrigger");
		Global_28in_Boss5[room].bell[i]={guid=b};

		--140211 K.J. Aris  added
		_dummyID = CreateObj(_dummyBellGUID,x,y,z,dir,1);
		CallPlot(_dummyID,"lua_28in_Boss5_tokenrule",b);
		SetModeEx(_dummyID,EM_SetModeType_Strikback,false);
		SetModeEx(_dummyID,EM_SetModeType_Searchenemy,false);
		SetModeEx(_dummyID,EM_SetModeType_ShowRoleHead,false);
		SetModeEx(_dummyID,EM_SetModeType_Show,true);
		SetModeEx(_dummyID,EM_SetModeType_Mark,false);
		AddToPartition(_dummyID,room);
		Global_28in_Boss5[room]._dummyBell[i]={guid=_dummyID};
		DebugMsg( 0 , 0 , "---DummyBell : ".._dummyID );
		--140211 K.J. Aris
	end
	--���A
	local condition_reset=false;
	local condition_terminate=false;
	local condition_triple=0;
	local condition_aeAtk=false;
	--�`��
	local cycle={};
	for i=1,cycle_num,1 do
		cycle[i]={phase="none";time=18;}
	end
	--�ɶ��ܼ�
	local time=0
	local GCD=0;
	local countdown={	randAtk=7;
				aeAtk=0;
				bell=0;
				terminate=39;
				stopdamage=40;
				};
	--GUID���
	local HateList={};
	local PlayerList={};
	local bosstarget=0;
	local Soul={};
	local resonance=DW_Rand(bell.num);
	local image=0;
	--�ƨ禡
	local function rand_pick_player(num,scribe)
		local rtable={};
		local result={};
		for i=1,#PlayerList,1 do
			if(scribe=="noTANK")and(#PlayerList>num)then
				if(PlayerList[i].guid~=bosstarget)then
					table.insert(rtable,PlayerList[i].guid);
				end
			else
				table.insert(rtable,PlayerList[i].guid);
			end
		end
		for i=1,num,1 do
			if(#rtable==0)then
				break;
			end
			local r=DW_Rand(#rtable);
			table.insert(result,table.remove(rtable,r));
		end
		return result;
	end
	lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS5_START]",0);--[107968]�I���@���A����X�{�F�ƭӯS���������I�����o�ǲ��ڪ����㦳����γ~......
	while true do
		sleep(10);
	--reset
		HateList={};
		PlayerList={};
	--keep
		--�ɶ��B�z
		time=time+1;
		for i=1,cycle_num,1 do
			cycle[i].time=cycle[i].time+1;
		end
		if(GCD>0)then GCD=GCD-1;end
		for cd_type,sec in pairs(countdown)do
			if(sec>0)then
				countdown[cd_type]=sec-1;
			end
		end
		--�W���z(�C���s)
		for pos=0,HateListCount(boss)-1,1 do
			local id=HateListInfo(boss,pos,EM_HateListInfoType_GItemID);
			if(ReadRoleValue(id,EM_RoleValue_IsPlayer)==1)then
				PlayerList[#PlayerList+1]={guid=id;};
			end
		end
		if(#PlayerList==0)then
			--����
			lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS5_FAIL]",0);--[107968]��󦨥\�u�ñ_�ިèS���S�O�������A�ϩ��q�����H�ӥ��Z�L......
			condition_reset=true;
			break;
		end
		bosstarget=ReadRoleValue(boss,EM_RoleValue_AttackTargetID);
	--cast
		--�Y��@�ήĪG
		if(time==fury.trigger)and(zone~=162)then
			--�g�ɮɶ���F
			lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS5_FURY]",0);--[107968]�P����_�ު��C��A�}�l���J�Y�غƨg���A�I
			AddBuff(boss,624344,0,-1);
		end
		if(countdown.terminate==0)then
			--�}�Ҥj���ĪG
			countdown.terminate=terminate.countdown;
			countdown.stopdamage=terminate.duration;
			condition_terminate=true;
			AddBuff(boss,624975,0,-1);
			lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS5_FATALSTART]",0);--[107968]���W�����}�@�P���ʵۡA�P�R�����i���_�V�Aŧ�ӡI
		end
		if(countdown.stopdamage==0)then
			--����j���ĪG
			countdown.stopdamage=100;
			condition_terminate=false;
			CancelBuff_NoEvent(boss,624975);
		end
		if(countdown.bell==0)then
			--���ܦ@�㪺��
			countdown.bell=bell.countdown;
			local rtable={1,2,3,4,5};
			table.remove(rtable,resonance);
			CancelBuff_NoEvent(Global_28in_Boss5[room].bell[resonance].guid,624644);
			CancelBuff_NoEvent(Global_28in_Boss5[room]._dummyBell[resonance].guid,624644);--140211 K.J. Aris
			resonance=rtable[DW_Rand(4)];
			AddBuff(Global_28in_Boss5[room].bell[resonance].guid,624644,0,-1);
			AddBuff(Global_28in_Boss5[room]._dummyBell[resonance].guid,624644,0,-1);--140211 K.J. Aris
			DebugMsg( 0 , 0 , " Effect Target : "..Global_28in_Boss5[room]._dummyBell[resonance].guid );
		end
		if(condition_aeAtk==true)and(countdown.aeAtk==0)then
			--AE
			SysCastSpellLv(boss,image,851269,0);
			WriteRoleValue(image,EM_RoleValue_LiveTime,2);
			condition_aeAtk=false;
		end
		--�`��1
		for onetrip=1,1,1 do
			if(cycle[1].time==0)then
				lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS5_BELLPROMPT]",0);--[107968]��X�������T�_�O�A�w�t���`��......
				break;
			end
			if(cycle[1].time==3)then
				--���W���a�إX�L�̪��F��A���]�A�Z�J�A���D�u�Ѥ@�H
				local rtable = nil;
				if ( #PlayerList >= 3 ) then--�j�󵥩�3�H�h�ƩZ
					rtable = rand_pick_player(2,"noTANK");
				else--2�H�H�U���ƩZ
					rtable = rand_pick_player(2,"casual");
				end

				for i=1,#rtable,1 do
					local x,y,z,dir=DW_Location(rtable[i]);
					local s=CreateObj(103381,x,y,z,dir,1);
					DW_UnFight(s,true);
					SetModeEx(s,EM_SetModeType_Mark,false);
					SetModeEx(s,EM_SetModeType_ShowRoleHead,false);
					SetModeEx(s,EM_SetModeType_HideName,true);
					MoveToFlagEnabled(s,false);
					AddBuff(s,624976,0,-1);
					if(CheckBuff(rtable[i],624972)==true)then AddBuff(s,624973,0,-1);end;
					AddToPartition(s,room);
					CallPlot(s,"lua_28in_Boss5_tokenrule",ctrl);
					SetFollow(s,boss);
					Soul[i]={guid=s;owner=rtable[i]};
					AddBuff(rtable[i],624977,0,-1);
					ScriptMessage(rtable[i],rtable[i],2,"[SC_28IN_BOSS5_SOULOUT]",0);--�Aı�o�Y�h�����A�@�������u�A�v�Q[107968]�l�޹L�h�I
					DebugMsg( 0 , 0 , "Soul : "..#Soul );
				end
				Global_28in_Boss5[room].soul_back=false;
				break;
			end
			if(cycle[1].time<8)and(cycle[1].time>3)then
				for i=#Soul,1,-1 do
					if(Global_28in_Boss5[room].soul_back==true)then
						--���Q�V�T
						StopMove(Soul[i].guid,true);
						CastSpell(Soul[i].guid,Soul[i].owner,851279);
						table.remove(Soul,i);
					elseif(GetDistance(Soul[i].guid,boss)<30)then
						--�Y�F��I��Boss
						DW_AddHPpercent(boss,bell.recover);--�^��
						DelObj(Soul[i].guid);
						CancelBuff_NoEvent(Soul[i].owner,624977);
						--KillID( boss , Soul[i].owner );--140210 K.J.Aris --�����ؼ�
						table.remove(Soul,i);
						lua_28in_Boss5_broadcast(0,"[SC_28IN_BOSS5_SOULABSORB]",C_Red);--[107968]�l���F�F���q�I
						
					end
				end
				break;
			end
			if(cycle[1].time==8)and(#Soul>0)then
				--�ɶ���A���z�F��
				DebugMsg( 0 , 0 , "----�ɶ���A���z�F�� : "..#Soul );
				for i=#Soul,1,-1 do
					SysCastSpellLv(Soul[i].guid,Soul[i].owner,851273,1);
					CastSpell(Soul[i].guid,Soul[i].guid,851274);
					StopMove(Soul[i].guid,true);
					--WriteRoleValue(Soul[i].guid,EM_RoleValue_LiveTime,2);
					SetStopAttack(Soul[i].guid);
					WriteRoleValue(Soul[i].guid,EM_RoleValue_LiveTime , 10 );
					--DelObj(Soul[i].guid);--140210 K.J. Aris
					KillID( boss , Soul[i].guid );
				end
				lua_28in_Boss5_broadcast(0,"[SC_28IN_BOSS5_SOULBOMB]",C_Red);--���骺�F��]����í�w�ӵo�ͯ�q�z���I
				Soul={};
				break;
			elseif(cycle[1].time==8)and(Soul~=nil)and(#Soul<=0)then
				Soul={};
				DebugMsg( 0 , 0 , "--�S���F��i�H��--140214--" );
				break;
			end
			if(cycle[1].time==11)then
				lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS5_FREEZEPROMPT]",0);--[107968]��X�������T�_�@�ظ޲����`��......
				break;
			end
			if(cycle[1].time==14)then
				--�Ҧ��H�WBuff
				condition_triple=DW_Rand(#TrippleBuff);
				Global_28in_Boss5[room].ban_buff=TrippleBuff[condition_triple]
				for i=1,#PlayerList,1 do
					AddBuff(PlayerList[i].guid,TrippleBuff[condition_triple],0,-1);
				end
				Global_28in_Boss5[room].triple_trigger=false;
				break;
			end
			if(cycle[1].time>=14)and(cycle[1].time<=17)then
				--���HĲ�ǴN�o��
				if(Global_28in_Boss5[room].triple_trigger==true)then
					lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS5_PUNISH]",0);--[107968]���쭵�i���P���A�o�X�j�j���i�I
					Global_28in_Boss5[room].triple_trigger=false;
					if(condition_triple==0)then
						DebugMsg(0,room,"condition_triple==0 !!")
					elseif(condition_triple==1)then
						for i=1,#PlayerList,1 do
							SysCastSpellLv(boss,PlayerList[i].guid,851275,0);
						end
					elseif(condition_triple==2)then
						for i=1,#PlayerList,1 do
							SysCastSpellLv(boss,PlayerList[i].guid,851276,0);
						end
					elseif(condition_triple==3)then
						for i=1,#PlayerList,1 do
							SysCastSpellLv(boss,PlayerList[i].guid,851277,0);
						end
					end
				end
				break;
			end
			if(cycle[1].time>17)and(cycle[1].time<=19)then
				for i=1,#PlayerList,1 do
					for j=1,#TrippleBuff,1 do
						CancelBuff_NoEvent(PlayerList[i].guid,TrippleBuff[j]);
					end
				end
				break;
			end
			if(cycle[1].time>=19)then
				cycle[1].time=0;
				break;
			end
		end
		--�`��2
		for onetrip=1,1,1 do
			if(GCD~=0)then
				break;
			end
			--�H���T��
			if(countdown.randAtk==0)then
				if(cycle[1].time>11)and(cycle[1].time<=17)then
					--�G��@
					local r=DW_Rand(100);
					if(r>50)then
						--�ۤv�ܱj
						CastSpell(boss,boss,851270);
						countdown.randAtk=randAtk.countdown;
					else
						--�j�ˮ`
						if(GetDistance(boss,bosstarget)<70)then
							CastSpellLv(boss,bosstarget,851271,0);
							countdown.randAtk=randAtk.countdown;
						end
					end
				else
					--�H���F��
					countdown.aeAtk=3;
					local r=rand_pick_player(1);
					if(#r==0)then DebugMsg(0,room,"player list is zero");break;end
					local x,y,z,dir=DW_Location(r[1]);
					image=CreateObj(103383,x,y,z,dir,1);
					SetModeEx(image,EM_SetModeType_Mark,false);
					SetModeEx(image,EM_SetModeType_Move,false);
					SetModeEx(image,EM_SetModeType_ShowRoleHead,false);
					SetModeEx(image,EM_SetModeType_HideName,true);
					WriteRoleValue(image,EM_RoleValue_LiveTime,4);
					AddBuff(image,624343,0,-1);
					AddToPartition(image,room);
					countdown.randAtk=randAtk.countdown;
					condition_aeAtk=true;
				end
				break;
			end
		end
		if(condition_terminate==true)then
			--�j���ĪG:�����ˮ`�A��b�̫�A�~���|�������a��v�T��L�P�_
			for i=#PlayerList,1,-1 do
				SysCastSpellLv(boss,PlayerList[i].guid,851272,0);
			end
		end
	end
	if(condition_reset==true)then
		for i=1,#Soul,1 do
			DelObj(Soul[i].guid);
		end
		for i=1,bell.num,1 do
			DelObj(Global_28in_Boss5[room].bell[i].guid);
			DelObj(Global_28in_Boss5[room]._dummyBell[i].guid);
		end
		DW_UnFight(boss,true);
		SetStopAttack(boss);
		sleep(50)
		DW_UnFight(boss,false);

	else
		lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS5_END]",0);--[107968]�ש�Q���˦b�a�A�|�P�y���ܱo�Q�����R�C
	end
	
	Global_28in_Boss5[room]=nil;
	DelObj(ctrl);
end
function lua_28in_Boss5_BellTrigger()
--bell���Ĳ�o�@��
	local bell=OwnerID();
	local Is_Resonance=CheckBuff(bell,624644);
	local room=ReadRoleValue(bell,EM_RoleValue_RoomID);
	if(Is_Resonance==false)then
		--�D�ʰʤ������|�_�@��
		local boss=Global_28in_Boss5[room].boss;
		SysCastSpellLv(boss,boss,851280,0);
		AddBuff(boss,624645,0,10);
		ScriptMessage(bell,TargetID(),0,"[SC_28IN_BOSS5_BELLRING]",C_Red);--��ù�����l���A�������A�ǥX��q���i�I
	else
		Global_28in_Boss5[room].soul_back=true;
	end
end
function lua_28in_Boss5_bufftrigger()
--buff����Ĳ�o�@��
	local player=OwnerID();
	local room=ReadRoleValue(player,EM_RoleValue_RoomID);
	if(Global_28in_Boss5[room]==nil)or(ReadRoleValue(player,EM_RoleValue_IsAttackMode)==0)then return;end
	Global_28in_Boss5[room].triple_trigger=true;
	AddBuff(player,Global_28in_Boss5[room].ban_buff,0,3);
end
function lua_28in_Boss5_getback()
--�F���k���t
	local Soul,player=OwnerID(),TargetID();
	CancelBuff_NoEvent(player,624977);
	ScriptMessage(Soul,player,0,"[SC_28IN_BOSS5_SOULBACK]",C_YELLOW);--�A�A���P��ۤv�O�u����v���I
	DelObj(Soul);
end
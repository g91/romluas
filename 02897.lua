function lua_26in_boss1_replace()--����A�N�@������ ���عp�i�� ���W����
	CloseSpeak(OwnerID());
	--���عp�i��
	local bancremz, morek, jill, comgas, kalaway, ironrose, dragon=lua_26in_npcGUID();
	BeginPlot(bancremz,"lua_26in_boss1_main",0);
	local room=ReadRoleValue(bancremz,EM_RoleValue_RoomID);
	Lua_BellatiaDuplication_change_status(room,"boss");
end
function lua_26in_boss1_main()--26�ƥ��@��
	local bancremz, morek, jill, comgas, kalaway, ironrose, dragon=lua_26in_npcGUID();
	local room=ReadRoleValue(bancremz,EM_RoleValue_RoomID);
	
	--�԰��Ϊ���
	local rofoonayva,saguwait,viki,runeball,invisibleball;
	
	--�}�Ҫ��ת�
	local FRONTdoor=Global_BellatiaDuplication[room].door_before_boss1.GUID;
	SetModeEx(FRONTdoor,EM_SetModeType_Show,false);
	SetModeEx(FRONTdoor,EM_SetModeType_Obstruct,false);
	
	--�ڪܮR�쫽
	--rofoonayva�A�����Ĥ������A�ҥH���i��������a�A�u�|����setattack���w���ؼ�
	local x,y,z,dir=DW_Location(781206,2);
	local org={hard=102989;normal=107979;easy=108042;};
	rofoonayva=CreateObj(org[Global_BellatiaDuplication.type],x,y,z,dir,1);
	SetModeEx(rofoonayva,EM_SetModeType_Mark,false);
	SetModeEx(rofoonayva,EM_SetModeType_Searchenemy,false);
	SetModeEx(rofoonayva,EM_SetModeType_Strikback,false);
	AddToPartition(rofoonayva,room);
	LockHP(rofoonayva,1,"");
	
	--�Į���S
	--saguwait�A���a�n�԰�����H
	local x,y,z,dir=DW_Location(781206,3);
	local org={hard=102987;normal=107978;easy=108041;};
	saguwait=CreateObj(org[Global_BellatiaDuplication.type],x,y,z,dir,1);
	DW_UnFight(saguwait,true);
	AddToPartition(saguwait,room);
	
	--���X
	--viki�A�I�����(�����ۦ�)������A���b�Ť��A���ӱ��U��
	local x,y,z,dir=DW_Location(781206,5);
	local org={hard=107762;normal=107980;easy=108043;}
	viki=CreateObj(org[Global_BellatiaDuplication.type],x,y+220,z,dir, 1);
	SetModeEx(viki,EM_SetModeType_Gravity,false);
	SetModeEx(viki,EM_SetModeType_Mark,false);
	SetModeEx(viki,EM_SetModeType_ShowRoleHead,false);
	SetModeEx(viki,EM_SetModeType_HideName,true);
	DW_UnFight(viki,true);--�D�԰�����
	AddToPartition(viki,room);
	
	--�Ť�y
	--runeball�A�w�ɩM invisibleball ���ͯ�q�s�u(�¯S��)�A�|�w�ɲ���
	local x,y,z,dir=DW_Location(781206,6);
	runeball=CreateObj(107770,x,y,z,dir,1);
	SetModeEx(runeball,EM_SetModeType_ShowRoleHead,false);
	SetModeEx(runeball,EM_SetModeType_HideName,true);
	SetModeEx(runeball,EM_SetModeType_Mark,false);
	DW_UnFight(runeball,true);--�D�԰�����
	MoveToFlagEnabled(runeball,false);
	AddToPartition(runeball,room);
	SetDefIdleMotion(runeball,ruFUSION_MIME_NONE);
	SetDir(runeball,180);
	AddBuff(runeball,624278,0,-1);--�S�� Buff
	
	--���Υؼ�
	--invisibleball�A���쪫��A�b�D�`������m�A�w�ɩM runeball���ͯ�q�s�u(�¯S��)(�쥻����������n�ϥΡA���O�J��x���A�ثe�O�ĥγ�²�檺�����ӨS���ϥΨ�o�Ӫ���)
	invisibleball=CreateObj(107771,x,y,z,dir,1);
	SetModeEx(invisibleball,EM_SetModeType_Mark,false);
	SetModeEx(invisibleball,EM_SetModeType_Gravity,false);
	SetModeEx(invisibleball,EM_SetModeType_ShowRoleHead,false);
	SetModeEx(invisibleball,EM_SetModeType_HideName,true);
	DW_UnFight(invisibleball,true);
	MoveToFlagEnabled(invisibleball,false);
	AddToPartition(invisibleball,room);
	
	--���sOrgID
	local org={hard=102987;normal=107978;easy=108041;};
	local DragonOrgID=org[Global_BellatiaDuplication.type];
	
	local need_cleared_at_reset={rofoonayva,saguwait,viki,runeball,invisibleball};
	local need_cleared_at_final={viki,runeball,invisibleball};
	--���ճ]�w(�R���������N�R��)
	for __,guid in pairs(need_cleared_at_reset)do
		CallPlot(guid,"lua_26in_boss1_tokenRULE",OwnerID());
	end
	
	--�Ĥ@���q�G��t(���عp�i���]�i�@���ж�)
	--�]�w���عp�i��
	DW_UnFight(bancremz,true);
	local passtime=0;
	local x,y,z,dir=DW_Location(781206,4);--���عp�i�����w�i���a�I
	--Phase
	Phase="ready";--ready,show,fight,reset,success
	while(Lua_BellatiaDuplication_check_status(room,"boss"))and(Phase=="ready")do
		sleep(10);
		passtime=passtime+1;
		--���s�x��
		if(passtime==1)then Yell(bancremz,"[SC_26IN_BOSS1_LEADSHOW]",4);end
		if(passtime==5)then Yell(bancremz,"[SC_26IN_BOSS1_GOINROOM_1]",4);end
		if(passtime==8)then Yell(bancremz,"[SC_26IN_BOSS1_GOINROOM_2]",4);end
		Move(bancremz,x,y,z);
		if(DW_GetDistance(bancremz,x,y,z)<40)then
			Phase="show";
		end
	end
	--�ĤG���q�G��t(���عp�i���w�g�M�ڪܮR�쫽���_�ӡA�Į���S�b���䤣�_��x��)
	--�ܨ���t
	Lua_BroadCast_RoomStingTypeColor(room, "[SC_26IN_BOSS1_A]");
	AddBuff(bancremz,624289,0,7);
	SysCastSpellLv(bancremz,bancremz,850810,0);
	sleep(30)
	SetModeEx(dragon,EM_SetModeType_Mark,false);
	SetModeEx(dragon,EM_SetModeType_Move,false);
	SetModeEx(dragon,EM_SetModeType_Searchenemy,false);
	SetModeEx(dragon,EM_SetModeType_Strikback,false);
	SetModeEx(dragon,EM_SetModeType_Fight,true);
	local x,y,z,dir=DW_Location(bancremz);
	SetPos(dragon,x,y,z,dir);
	SetPos(bancremz,0,0,0,0);
	StopMove(bancremz,true);
	
	--���عp�i�� �M �ڪܮR�쫽 ����
	
	SetAttack(dragon,rofoonayva);
	SetAttack(rofoonayva,dragon);
	SetModeEx(saguwait,EM_SetModeType_Strikback,true);
	SetModeEx(saguwait,EM_SetModeType_Fight,true);
	
	Lua_BroadCast_RoomStingTypeColor(room, "[SC_26IN_BOSS1_B]");
	passtime=0;
	
	local idle={};
	idle.string={"[SC_26IN_BOSS1_LINES_1]", "[SC_26IN_BOSS1_LINES_2]", "[SC_26IN_BOSS1_LINES_3]", "[SC_26IN_BOSS1_LINES_4]"};
	idle.motion={ruFUSION_ACTORSTATE_BUFF_SP01, ruFUSION_ACTORSTATE_CAST_SP01, ruFUSION_ACTORSTATE_CAST_INSTANT, ruFUSION_ACTORSTATE_EMOTE_IDLE1};
	idle.delay={85, 80, 75, 80};
	idle.rand=1;--�_�l����1;
	local list={2,3,4};
	local door_status="open";
	while(CheckID(saguwait)==true)and(HateListCount(saguwait)==0)and(Lua_BellatiaDuplication_check_status(room,"boss"))and(ReadRoleValue(saguwait,EM_RoleValue_IsDead)==0)do
		passtime=passtime+1;
		if(passtime==2)then Lua_BroadCast_RoomStingTypeColor(room,"[SC_26IN_BOSS1_C]");end
		--�Į���S�H����t
		sleep(5);
		PlayMotion(saguwait,idle.motion[idle.rand]);
		sleep(5);
		Yell(saguwait,idle.string[idle.rand],3);
		for _sec=0,idle.delay[idle.rand]-5,10 do
			sleep(10);
			if((CheckID(saguwait)==false)or(HateListCount(saguwait)>0)or(ReadRoleValue(saguwait,EM_RoleValue_IsDead)==1))and(door_status=="open")then
				door_status="close";
				--�԰��}�l �A����
				SetModeEx(FRONTdoor,EM_SetModeType_Show,true);
				SetModeEx(FRONTdoor,EM_SetModeType_Obstruct,true);
				break;
			end
		end
		if(door_status=="close")then break;end
		--�ե����V
		local x,y,z,dir=DW_Location(rofoonayva);
		local dir=DW_GetDir(x,y,z,saguwait);
		if(math.abs(dir-ReadRoleValue(saguwait,EM_RoleValue_Dir))>25)then
			SetDir(saguwait,dir);
		else	
			AdjustDir(saguwait, DW_Rand(140)-70 );
		end
		
		--�H���D��A�P�`����������
		idle.rand=table.remove(list,DW_Rand(#list));
		if(#list==0)then
			list={1,2,3,4};
		end
	end
	idle=nil;list=nil;--����
	
	--�԰��}�l �A����
	SetModeEx(FRONTdoor,EM_SetModeType_Show,true);
	SetModeEx(FRONTdoor,EM_SetModeType_Obstruct,true);
	
	
	--�԰��}�l
	Lua_BellatiaDuplication_update_players(room);
	for i=1,#Global_BellatiaDuplication[room].players,1 do
		local player=Global_BellatiaDuplication[room].players[i].guid;
		if(GetDistance(saguwait,FRONTdoor)>GetDistance(saguwait,player))then
			SysCastSpellLv(player,saguwait,499110,1);--�s�y����5000
		end
	end
	
	--�D�԰��j��
	
	
	--��Ƴ]�w
	
	--������
	local HateList={};
	local HateList_PurePlayer={};
	
	--�ɶ����(���B�ƭȬ��}�l�B�@�ɶ��A�N�o�ɶ��O�U�O�]�w)
	local GCD=2;
	local cd_summon=1;
	local cd_nuclear=31;
	local cd_fury=360;if(Global_BellatiaDuplication.type=="hard")then cd_fury=480;end
	local cd_heal=30;
	local cd_randatk=5;
	local cd_bomb=7;
	local cd_ray=0;
	
	local function CD_descend(value)
		--�D�ƭȸ�Ƥ��B�z
		if(type(value)~="number")then return value;end
		--����̧C�ܹs
		if(value>0)then
			return value-1;
		else	
			return 0;
		end
	end
	--�l�����̪��]�w
	local __={hard=107765;normal=107981;easy=108044;}
	--cd9 +��t6 = 15��X�@�i
	local summon={cd=9;course=false;passtime=-1;num=3;max=3;id=__[Global_BellatiaDuplication.type];};
	if(Global_BellatiaDuplication.type=="hard")then summon.max=5;summon.num=5;end
	summon.string1="[SC_26IN_BOSS1_SUMMON]";
	summon.string2="[SC_26IN_BOSS1_GATE]";
	summon.string3="[SC_26IN_BOSS1_TRANSPORT]";
	local guardians={};--�ΨӸ˻ݭn�M���ɪ�����id�O��
	--���઺�]�w
	local nuclear={cd=30;course=false;block=2;note=2}
	if(Global_BellatiaDuplication.type=="hard")then nuclear.block=4;nuclear.note=4;end
	nuclear.string1="[SC_26IN_BOSS1_CALL]"
	nuclear.string2="[SC_26IN_BOSS1_NUCLEAR_READY]"
	nuclear.string3="[SC_26IN_BOSS1_SHIELD_READY]"
	nuclear.string4="[SC_26IN_BOSS1_NUCLEAR_ATK]"
	nuclear.string5="[SC_26IN_BOSS1_SHIELD_FAIL]"
	--�g��(�ƥ��Y�ئ@�P����)
	local fury={id=624243;course=false;};
	fury.string1="[SC_26IN_BOSS1_FURY]";
	--�����@�̸ɦ媺����
	local __={hard=10;normal=7;easy=3};
	local heal={cd=30;lv=__[Global_BellatiaDuplication.type];};
	heal.string1="[SC_26IN_BOSS1_HEAL_SAY]"
	heal.string2="[SC_26IN_BOSS1_HEAL_DONE]"
	--�H����ۡG���S�P�L&��Z�
	local randatk={cd=5;};
	randatk.spell1=850791;randatk.spell1lv=0;
	randatk.spell2=850792;randatk.spell2lv=0;
	--�z�u��g
	local bomb={cd=7;number=2;spell=850794;lv=0;};
	if(Global_BellatiaDuplication.type=="hard")then bomb.number=4;end
	--��q����(�S��)
	local ray={cd=1};
	local MoveDis={[0]=5;11;16;22;27;32;37;42;47;52;110;};
	local Radius={[0]=50;105;152;210;257;305;353;401;448;496;1050};
	local Track={};--�N�|�q0�}�l�A�d�N!
	local circle_phase="ready";
	local count_angle=0;
	local next_loc={};
	local PlayerStatus={};
	local FreezeTime={};
	local AreaRecord={};
	local function JudgePlayerArea(player,runeball,RayDir)
		local x,y,z,dir=DW_Location(player);
		local bearing=DW_GetDir(x,y,z,runeball);
		local angle;
		local angle=bearing-RayDir;
		if(angle<0)then
			angle=angle+360;
		end
		if(angle>360)then
			angle=angle-360;
		end
		--DebugMsg(0,room,"bearing="..bearing..", RayDir="..RayDir..", angle="..angle);
		if(angle<=90)and(angle>=0)then
			return 1;
		elseif(angle<=360)and(angle>=270)then
			return 2;
		else
			return 3;
		end
	end
	local function RayHitPlayer(player)
		--PlayerStatus: Hitted,Freeze
		if(not PlayerStatus[player])then
			PlayerStatus[player]="Hitted";
		end
		if(PlayerStatus[player]=="Hitted")then
			--���a�Q�R��
			if(CheckBuff(player,624253))then
				--���Ϯg�誺���p�U
				local x,y,z,dir=DW_Location(player);
				local t=CreateObj(122714,x,y,z,dir,1);
				SetModeEx(t,EM_SetModeType_Mark,false);
				SetModeEx(t,EM_SetModeType_ShowRoleHead,false);
				WriteRoleValue(t,EM_RoleValue_LiveTime,1);
				AddToPartition(t,room);
				BeginPlot(t,"DelSelf",2);
				AttachObj(t, player, 1, "p_hit_point01", "p_hit_point01");
				SysCastSpellLv(t, rofoonayva, 850800, 0);
				CancelBuff_NoEvent(player,624253);
				AddBuff(player,624253,nuclear.note,4);
				AddBuff(rofoonayva,624254,0,-1);--�ե���
			else
				DebugMsg(player,room,"You're shoted, if don't get dmg, plz tell Ray Poleax. other data: atk relation>>"..tostring(CheckRelation(viki,player,EM_CheckRelationType_Attackable)));
				SysCastSpellLv(viki,player,850805,0);
			end
			PlayerStatus[player]="Freeze";
			FreezeTime[player]=4;
			AddBuff(player,624252,0,4);
		elseif(PlayerStatus[player]=="Freeze")then
			if(FreezeTime[player]==0)then
				PlayerStatus[player]=nil;
				FreezeTime[player]=nil;
			end
		end
	end
	
	passtime=0;
	while true do--���ѱ���bKeep���ˬd
		--���רүS��A�o�q�쥻�u�Osleep(10), ���D�P�w��ǡA�N��1���Ƶ����P�_
		if(circle_phase=="work")then
			local StandardDir=ReadRoleValue(runeball,EM_RoleValue_Dir);
			local duration=5;
			for tenth=duration,10,duration do
				local bearing_now=(StandardDir+count_angle-6+(6*tenth/duration))%360;
				local bearing_bef=(StandardDir+count_angle-6+(6*(tenth-duration)/duration))%360;
				for i=1,#Global_BellatiaDuplication[room].players,1 do
					local player=Global_BellatiaDuplication[room].players[i].guid;
					local x,y,z,dir=DW_Location(player);
					local bearing=DW_GetDir(x,y,z,runeball);
					local Pass=false;
					if(bearing<=bearing_now)and(bearing>=bearing_bef)then
						RayHitPlayer(player);
						Pass=true
					end
					local last_area=AreaRecord[player];
					local this_area=JudgePlayerArea(player,runeball,bearing_bef);
					AreaRecord[player]=this_area;
					--Yell(player,"Area:"..AreaRecord[player],3);
					if((last_area==1)and(this_area==2))or((last_area==2)and(this_area==1))then
						if(not Pass)and(GetDistance(player,viki)<700)then
							DebugMsg(player,room,"you just cross ray-line");
							RayHitPlayer(player);
							Pass=true;
						end
					end
				end
				sleep(duration);
			end
		else
			sleep(10);
		end
	--reset
		--���ըϥ� �j��_
		if(Lua_BellatiaDuplication_check_status(room,"boss")==false)then
			Phase="success";
			break;
		end
	--keep
		--�ɶ�����
		
		GCD=		CD_descend(GCD);
		cd_fury=	CD_descend(cd_fury);
		cd_summon=	CD_descend(cd_summon);
		cd_nuclear=	CD_descend(cd_nuclear);
		--cd_heal=	CD_descend(cd_heal);
		cd_randatk=	CD_descend(cd_randatk);
		cd_bomb=	CD_descend(cd_bomb);
		cd_ray=	CD_descend(cd_ray);
		for player,time in pairs(FreezeTime)do
			if(time==0)then
				FreezeTime[player]=nil;
				PlayerStatus[player]=nil;
			else
				FreezeTime[player]=CD_descend(time);
			end
		end
		
		--��s���
		passtime=passtime+1;
		--In Original version, update player data per sec.
		Lua_BellatiaDuplication_update_players(room);--�����@�����a�C��(from 26�ƥ�����)
		
		
		--�P�_��������
		--saguwait ���p�P�_=>���`�ή���
		if(CheckID(saguwait)==false)or(ReadRoleValue(saguwait,EM_RoleValue_IsDead)==1)then
			Phase="success";
			break;
		end
		-- ���a�ƶq �S�����a�N���}
		if(#Global_BellatiaDuplication[room].players==0)then
			DebugMsg(0,room,"Global_Player=0");
			Phase="reset";
			break;
		end
		--�����P�_
		local TarNum=HateListCount(saguwait);
		if(TarNum==0)then
			DebugMsg(0,room,"saguwait Hate List =0");
			Phase="reset";
			break;
		else
			--��s�Į���S���������
			HateList={};HateList_PurePlayer={};
			for pos=0,TarNum-1,1 do
				local e=HateListInfo(saguwait,pos,EM_HateListInfoType_GItemID);
				table.insert(HateList,e);
				if(ReadRoleValue(e,EM_RoleValue_IsPlayer)==1)then
					if(CheckRelation(saguwait,e,EM_CheckRelationType_Attackable))then
						table.insert(HateList_PurePlayer,e);
					end
				elseif(ReadRoleValue(e,EM_RoleValue_OrgID)==DragonOrgID)then
					--���s�����Ӧ�����
					SetHateListPoint(saguwait,pos,1);
				end
			end
			if(#HateList_PurePlayer==0)then
				DebugMsg(0,room,"No Player aggro Saguwait");
				Phase="reset";
				break;
			end
		end
		--���ըϥ�(�̫����ӧR��)
		for i=1,#Global_BellatiaDuplication[room].players,1 do	
			local player=Global_BellatiaDuplication[room].players[i].guid;
			if(ReadRoleValue(player,EM_RoleValue_IsDead)==0)and(CheckBuff(player,624495)==false)then
				for J=1,#HateList_PurePlayer,1 do
					if player==HateList_PurePlayer[j] then
						break;
					end
					if(j==#HateList_PurePlayer)then
						DebugMsg(player,room,"Hey! you aren't in saguwait's Hate List.Bit him!");
						AddBuff(player,624495,0,10);
					end
				end	
			end
		end		
		--�ڪܮR�쫽�����A(�קK�Q�J�ث�A���h�ؼ�)
		if(ReadRoleValue(rofoonayva,EM_RoleValue_AttackTargetID)==0)then
			SetAttack(dragon,rofoonayva);
			SetAttack(rofoonayva,dragon);
		end
		--�B�@�GTrack �O11�سt�פ��@�˪����Ϊ���A�H�ۦP�t�v(���׼W�[�v)¶��(�Hruneball������)�C
		--invisibleball �h�O�S�Ī������A�|attach��Track�̪�����(�w�]�O�̻���)(�ثe����������J��x���A�]���٨S����)
		if(circle_phase=="stop")then
			if(cd_ray==0)then
				circle_phase="ready";
				StopMove(runeball,true);
			else
				if(ReadRoleValue(runeball,EM_RoleValue_NpcOnMove)==0)then
					local x,y,z,dir=DW_Location(781206,6);
					x,y,z,dir=DW_NewLocation(DW_Rand(360),30,x,y,z,dir)
					Move(runeball,x,y,z);
				end
			end
		end
		if(circle_phase=="work")then
			if(count_angle==0)then
				--AttachObj(invisibleball,Track[1],1,"p_down","p_down");
			end
			if(count_angle==360)then
				--�ĤT���q
				--�S�ĵ���
				DetachObj(invisibleball);
				DelFromPartition(invisibleball);
				
				--�M��
				for i,guid in pairs(Track)do
					DelObj(Track[i]);
					Track[i]=nil;
				end
				count_angle=0;
				next_loc={};
				circle_phase="stop";
				cd_ray=ray.cd;
			else
				--�ĤG���q
				local x,y,z,dir=DW_Location(runeball);
				--�@��B�@�@��: �]�w
				for i=0,10,1 do
					SetPos(Track[i],next_loc[i][1],next_loc[i][2],next_loc[i][3],next_loc[i][4]);
					next_loc[i]={};
				end
				count_angle=count_angle+6;
				for i=0,10,1 do
					local x,y,z,dir=DW_PureNewLoc(count_angle,Radius[i],x,y,z,dir);
					next_loc[i]={x,y,z,dir};
					MoveDirect(Track[i],x,y,z);
				end
				AttachObj(invisibleball,Track[10],1,"p_down","p_down");
			end
		end
		if(circle_phase=="ready")then--�Ĥ@���q
			local x,y,z,dir=DW_Location(runeball);
			for i=0,10,1 do
				x,y,z,dir=DW_PureNewLoc(0,Radius[i],x,y,z,dir);
				local t=CreateObj(108120+i,x,y,z,dir,1);
				DW_UnFight(t,true);
				SetModeEx(t,EM_SetModeType_Gravity,false);
				SetModeEx(t,EM_SetModeType_ShowRoleHead,false);
				SetModeEx(t,EM_SetModeType_HideName,true);
				SetModeEx(t,EM_SetModeType_Mark,false);
				WriteRoleValue(t,EM_RoleValue_IsWalk,0);
				MoveToFlagEnabled(t,false);
				AddToPartition(t,room);
				ReCalculate(t);
				Track[i]=t;--�q0�}�l
				next_loc[i]={};--��l��
			end
			for i=0,10,1 do
				local x,y,z,dir=DW_PureNewLoc(count_angle,Radius[i],x,y,z,dir);
				next_loc[i]={x,y,z,dir};
				MoveDirect(Track[i],x,y,z);
			end
			circle_phase="work";
			--�S��
			AddToPartition(invisibleball,room);
			SysCastSpellLv(runeball,Track[10],850799,1);
			
			
			--���a�w��(�շ�)
			local StandardDir=ReadRoleValue(runeball,EM_RoleValue_Dir);
			for i=1,#Global_BellatiaDuplication[room].players,1 do
				local player=Global_BellatiaDuplication[room].players[i].guid;
				AreaRecord[player]=JudgePlayerArea(player,runeball,StandardDir);
				--Yell(player,"Area:"..AreaRecord[player],3);
			end
		end
		
	--cast
		--�ʧ@�G���i�s��Ĳ�o
		for __=1,1,1 do
			if(GCD>0)then break;end
			if(cd_summon==0)then
				--�l��y�{
				cd_summon=summon.cd;
				summon.course=true;
				DebugMsg(0,room,"summon.course begin");
				summon.passtime=-1;
				break;
			end
			if(cd_nuclear==0)then
				--����(�P�R���ۡA�s��y�{)
				cd_nuclear=nuclear.cd;
				nuclear.course=true;
				DebugMsg(0,room,"nuclear.course begin");
				nuclear.passtime=-1;
				break;
			end
			if(cd_heal==0)and(not fury.course)then
				--�t�ξɥ�(�ɦ�)
				cd_heal=heal.cd;
				heal.course=true;
				heal.passtime=-1;
				break;
			end
			if(cd_randatk==0)then
				local tar=ReadRoleValue(saguwait,EM_RoleValue_AttackTargetID);
				if(GetDistance(saguwait,tar)>60)then break;end
				--������
				local r=DW_Rand(2);
				if(r==1)then
					if(CastSpellLv(saguwait,tar,randatk.spell1,randatk.spell1lv)==true)then
						cd_randatk=randatk.cd;
					end
				else
					if(CastSpellLv(saguwait,tar,randatk.spell2,randatk.spell2lv)==true)then
						cd_randatk=randatk.cd;
					end
				end
				break;
			end
			if(cd_bomb==0)then
				--�z�u��g
				if(#HateList_PurePlayer==0)then break;end
				CastSpellLv(saguwait,saguwait,bomb.spell,bomb.lv);
				cd_bomb=bomb.cd;
				break;
			end
		end
		--�ĪG�G�L�ɶ��t�A�O�D�Y�ɤ���
		--�w�ɨg��
		if(cd_fury<=0)and(Global_BellatiaDuplication.type~="easy")then
			if(not CheckBuff(saguwait,fury.id))then
				AddBuff(saguwait,fury.id,0,-1);
				Lua_BroadCast_RoomStingTypeColor(room,fury.string1,2,C_LightBlue);
				fury.course=true;--�i����L�t��
			end
		end
		--�ǰe�q�D�A�l��p��
		if(summon.course)then
			--summon.course��keep phase
			--�ե��M��
			for i=#guardians,1,-1 do
				if(not CheckID(guardians[i]))or(ReadRoleValue(guardians[i],EM_RoleValue_IsDead)==1)then
					table.remove(guardians,i);
				end
			end
			--�קK�L�ײ���(�ݼƶq�k�X�~��)
			if((#guardians+summon.num)<=summon.max)then
				summon.passtime=summon.passtime+1;
			else
				summon.course=false;
				cd_summon=2;--����;
			end
			if(summon.passtime==0)then Yell(saguwait,summon.string1,4);end
			if(summon.passtime==3)then
				Lua_BroadCast_RoomStingTypeColor(room,summon.string3);
				local r=DW_Rand(#HateList_PurePlayer);
				local player=HateList_PurePlayer[r];
				local x,y,z,dir=DW_Location(player);
				local gate=CreateObj(107766,x,y,z,dir,1);
				SetModeEx(gate,EM_SetModeType_Mark,false);
				SetModeEx(gate,EM_SetModeType_ShowRoleHead,false);
				SetModeEx(gate,EM_SetModeType_HideName,true);
				SetModeEx(gate,EM_SetModeType_Gravity,false);
				DW_UnFight(gate,true);
				AddToPartition(gate,room);
				CallPlot(gate,"lua_26in_boss1_tokenRULE",saguwait);
				summon.gate=gate;--�Ȧs
			end
			if(summon.passtime==6)then
				local x,y,z,dir=DW_Location(summon.gate);
				for i=1,summon.num,1 do
					local x,y,z,dir=DW_NewLocation(53*i,30,x,y,z,dir);
					local g=CreateObj(summon.id,x,y,z,dir,1);
					SetModeEx(g,EM_SetModeType_Strikback,false);
					AddBuff(g,502707,0,-1);
					AddToPartition(g,room);
					table.insert(guardians,g);
					SetPlot(g,"dead","lua_26in_boss1_tokendead",0);
					if(#HateList_PurePlayer>0)then
						local r=DW_Rand(#HateList_PurePlayer);
						SetAttack(g,HateList_PurePlayer[r]);
					end
					CallPlot(g,"lua_26in_boss1_tokenRULE",saguwait);
				end
				DelObj(summon.gate);summon.gate=nil;
				cd_summon=summon.cd;
				summon.course=false;
				DebugMsg(0,room,"summon.course is finish");
				Lua_BroadCast_RoomStingTypeColor(room,nuclear.string3,2,C_YELLOW);
				Lua_BroadCast_RoomStingTypeColor(room,nuclear.string3,0,C_YELLOW);
			end
		end
		--�I�i����
		if(nuclear.course)then
			nuclear.passtime=nuclear.passtime+1;
			if(nuclear.passtime==0)then 
				Yell(saguwait,nuclear.string1,4);
				AddBuff(dragon,624495,0,6);--���s�쥻���ޯ�b��Buff�@�Τ��A�����|�I��
			end
			if(nuclear.passtime==2)then Lua_BroadCast_RoomStingTypeColor(room,nuclear.string2);end
			if(nuclear.passtime>=0)and(nuclear.passtime<6)then
				--�B�z�Ϯg�誺�ĪG
				local buffpos=Lua_BuffPosSearch(rofoonayva,624254);
				local bufflv=BuffInfo(rofoonayva,buffpos,EM_BuffInfoType_Power);
				DebugMsg(0,room,"bufflv="..bufflv);
				if(bufflv>=nuclear.block)then
					DebugMsg(0,room,"success stun!");
					CancelBuff_NoEvent(rofoonayva,624254);
					AddBuff(rofoonayva,624283,0,5);
					CastSpell(rofoonayva,rofoonayva,850801);
					Lua_BroadCast_RoomStingTypeColor(room, "[SC_26IN_BOSS1_STUNBOSS]");
				end
				--���s�I�k
				if(not CheckBuff(dragon,624248))then
					if(CastSpell(dragon,dragon,850796)==true)then
						DebugMsg(0,room,"dragon cast");
					else
						if(ReadRoleValue(dragon,EM_RoleValue_SpellMagicID)~=850796)then
							Lua_BroadCast_RoomStingTypeColor(room,nuclear.string5);
						end
						DebugMsg(0,room,"dragon fail");
					end
					--CastSpell(rofoonayva,rofoonayva,850801);--���ե�
				end
			end
			if(nuclear.passtime==7)then
				Lua_BroadCast_RoomStingTypeColor(room,nuclear.string4);
				local x,y,z,dir=DW_Location(781206,5);--viki���U��
				local ShieldUp=CheckBuff(dragon,624248);
				for i=1,#Global_BellatiaDuplication[room].players,1 do
					local player=Global_BellatiaDuplication[room].players[i].guid;
					if(DW_GetDistance(player,x,y,z)<700)then
						if(GetDistance(player,dragon)>=90)then
							SysCastSpellLv(viki,player,850803,200);
						elseif(not ShieldUp)then
							SysCastSpellLv(viki,player,850803,200);
						else
							DebugMsg(player,room,"you are in shield protect");
						end
					else
						DebugMsg(player,room,"you too far, nuclear can't hit you");
					end
				end
				nuclear.course=false;
				DebugMsg(0,room,"nuclear.course is finish");
			end
		end
		if(heal.course)and(not fury.course)then
			heal.passtime=heal.passtime+1;
			if(heal.passtime==0)then
				AddBuff(saguwait,624250,heal.lv,-1)
				CastSpell(saguwait,rofoonayva,850802);--�۰ʱ�850797�A�۰ʱ�850798
				WriteRoleValue(saguwait,EM_RoleValue_AttackTargetID,rofoonayva);
				Yell(saguwait,heal.string1,4);
			end
			if(heal.passtime>1)then
				if(CheckBuff(saguwait,624250)==false)then
					DebugMsg(0,room,"success break heal casting");
					MagicInterrupt(saguwait);
					heal.course=false;
				elseif(ReadRoleValue(saguwait,EM_RoleValue_SpellMagicID)~=850797)then
					--�ަb�A�I�k����=�����v��
					CancelBuff_NoEvent(saguwait,624250);
					Lua_BroadCast_RoomStingTypeColor(room,heal.string2);
					heal.course=false;
				end
			end
		end
	end
	--�P�_
	if(Phase=="reset")then
		--����
		for i,guid in pairs(need_cleared_at_reset)do	
			DelObj(guid);
		end
		for i,guid in pairs(Track)do
			DelObj(guid);
		end
		for i,guid in pairs(guardians)do
			DelObj(guid);
		end
		Lua_BellatiaDuplication_fail();
		Lua_BellatiaDuplication_change_status(room,"standby");--�O�_�ݭn�O�d�H�����A��í�w��A��
		return;
	end
	--�̫ᶥ�q�G��t(���X�����A���s�Q�����v�T)
	
	--�B�z���عp�i��
	LockHP(rofoonayva,-10,"");
	if(CheckID(rofoonayva))and(ReadRoleValue(rofoonayva,EM_RoleValue_IsDead)==0)then
		sleep(20);
		KillID(dragon,rofoonayva);
		Lua_BroadCast_RoomStingTypeColor(room, "[SC_26IN_BOSS1_FINALSTRIKE]", 0, 0);
	end
	
	--�M�����R������
	for __,guid in pairs(need_cleared_at_final)do
		DelObj(guid);
	end
	for __,guid in pairs(Track)do
		DelObj(guid);
	end
	for i,guid in pairs(guardians)do
		DelObj(guid);
	end
	
	--���عp�i���ܦ^�H��
	SysCastSpellLv(dragon,dragon,850810,1);
	sleep(30);
	local x,y,z,dir=DW_Location(dragon);
	SetPos(bancremz,x,y,z,dir);
	SetPos(dragon,0,0,0,0);
	StopMove(dragon,false);

	--�����I������
	Lua_BellatiaDuplication_change_music(room,Global_BellatiaDuplication.music.boss1_success);
	
	--���X�x���G�u�i���A �ڪܮR�쫽�Q�o�˲@�L�Ĳv�����O
	Lua_BroadCast_RoomStingTypeColor(room,"[SC_26IN_BOSS1_D]");
	
	--���s���U�@���x�s�I�e�i
	local x,y,z,dir=DW_Location(781206,10);
	Move(bancremz,x,y,z);
	
	sleep(30);
	
	--���X������}
	local GateAfterBoss1=Global_BellatiaDuplication[room].door_after_boss1.GUID
	Lua_BroadCast_RoomStingTypeColor(room, "[SC_26IN_BOSS1_E]");
	local x,y,z,dir=DW_Location(781206, 11);
	local a=CreateObj(122713, x,y,z,dir, 1);
	WriteRoleValue(a,EM_RoleValue_LiveTime,4);
	SetModeEx(a, EM_SetModeType_Mark, false);
	SetModeEx(a, EM_SetModeType_ShowRoleHead, false);
	AddToPartition(a, room);
	sleep(10);
	PlayMotionEX(GateAfterBoss1, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP);
	SetDefIdleMotion(GateAfterBoss1,ruFUSION_MIME_ACTIVATE_LOOP);
	SysCastSpellLv(a, a, 494640, 0);
	SysCastSpellLv(a, a, 850860, 0);
	SetModeEx(GateAfterBoss1, EM_SetModeType_Obstruct, false);
	--�J�f���ת��]�}��
	SetModeEx(FRONTdoor, EM_SetModeType_Obstruct, false);
	SetModeEx(FRONTdoor, EM_SetModeType_Show, false);
	sleep(30);
	
	--���s��z��t
	StopMove(bancremz,false);
	WriteRoleValue(bancremz, EM_RoleValue_IsWalk, 1);
	SysCastSpellLv(bancremz, bancremz, 493517,0);
	AddBuff(bancremz, 620841, 0, -1);
	sleep(20);
	Yell(bancremz, "[SC_BANCREMZ_AFTERBOSS1_1]", 4);
	local x,y,z,dir=DW_Location(781206,10);
	Move(bancremz,x,y,z);
	sleep(30);
	Yell(bancremz, "[SC_BANCREMZ_AFTERBOSS1_2]", 4);
	sleep(10);
	AddBuff(bancremz, 620801, 0, 6);	
	
	--�����]�w
	WriteRoleValue(bancremz, EM_RoleValue_IsWalk, 0);
	DW_UnFight(bancremz,false);
	Lua_BellatiaDuplication_change_status(room,"success");
end
function lua_26in_boss1_tokenRULE(creater)--�۰��ˬd�A�M��R�����y�{�A�̫�N�|����
	local room=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	while(Lua_BellatiaDuplication_check_status(room,"boss"))do
		sleep(10);
	end
	DelObj(OwnerID());--���Fscript�N�|���A���ξ��
end
function lua_26in_boss1_tokendead()--�p�Ǧ��`�@���A���ͤϮg��
	local token=OwnerID();
	local room=ReadRoleValue(token,EM_RoleValue_RoomID);
	local x,y,z,dir=DW_Location(token);
	
	local shield=CreateObj(107786,x,y,z,dir,1);
	SetModeEx(shield,EM_SetModeType_ShowRoleHead, false);
	SetModeEx(shield,EM_SetModeType_HideName, true);
	SetModeEx(shield,EM_SetModeType_Fight, false);
	
	WriteRoleValue(shield,EM_RoleValue_LiveTime,12);
	local note=2;
	if(Global_BellatiaDuplication.type=="hard")then note=4;end
	AddBuff(shield,624253,note,-1);--�S��(�Ϊ��~��)
	
	AddToPartition(shield,room);
	SetPlot(shield,"touch","lua_26in_boss1_touch",55);
	SetCursorType(shield,eCursor_Pickup);
	
	SetModeEx(token,EM_SetModeType_Mark,false);
end
function lua_26in_boss1_touch()--�Ϯg��Ĳ�I�@��
	local player,shield=OwnerID(),TargetID();
	if(CheckBuff(player,624253))then
		ScriptMessage(player, player, 1, "[SC_26IN_BOSS1_PICKUP_REPEAT]", 0);
		return false;
	end
	
	SetPlot(shield,"touch","",0);
	BeginCastBarEvent(player,shield,"[SC_26IN_BOSS1_PICKUP]",10,ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END,0,"Lua_26in_boss1_castbarend");
end
function Lua_26in_boss1_castbarend(player,result)--���\�B���Ϯg��
	local shield=TargetID();
	if(result>0)then
		--���\
		ScriptMessage(player, player, 2, "[SC_26IN_BOSS1_PICKUP_DONE]", 0);
		local note=2;
		if(Global_BellatiaDuplication.type=="hard")then note=4;end
		AddBuff(player, 624253, note, -1);
		DelObj(shield);
	else
		--����
		SetPlot(shield,"touch","lua_26in_boss1_touch",55);
		SetCursorType(shield,eCursor_Pickup);
	end
	EndCastBar(player,result);
end
function lua_26in_boss1_bombpuss()--�Ѽ@������ӬI�i
	local room=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local num=#Global_BellatiaDuplication[room].players;
	
	local rtable={};
	for i=1,num,1 do
		if(ReadRoleValue(Global_BellatiaDuplication[room].players[i].guid,EM_RoleValue_IsDead)==0)then
			table.insert(rtable,i);
		end
	end
	local bomb_num;
	if(Global_BellatiaDuplication.type=="hard")then
		bomb_num=4;
	else
		bomb_num=2;
	end
	for i=1,100,1 do
		bomb_num=bomb_num-1;
		local r=table.remove(rtable,DW_Rand(#rtable));
		local player=Global_BellatiaDuplication[room].players[r].guid;
		if(GetDistance(OwnerID(),player)<500)then
			PushMagicShootTarget(player);
		else
			bomb_num=bomb_num+1;
		end
		if(bomb_num==0)then return;end
		if(#rtable<=0)then return;end
	end
end
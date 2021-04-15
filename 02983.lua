function lua_26in_foreboss4_GoPosition()--NPC���s�N��
	local	bancremz, 
		morek, 
		jill, 
		comgas, 
		kalaway, 
		ironrose, 
		dragon;
		
		bancremz, morek, jill, comgas, kalaway, ironrose, dragon=lua_26in_npcGUID();
		
	local	room	=ReadRoleValue(OwnerID(), EM_RoleValue_RoomID);
	
	--�]�w���s�x�s�I
	Lua_BellatiaDuplication_change_save_point(room, 6);--�M���B���������q
	
	SysCastSpellLv(dragon, dragon, 850810, 0);
	local x,y,z,dir=DW_Location(781282, 5);
	sleep(35);
	
	SetPos(bancremz, x,y,z,dir);
	SetPos(dragon, 0,0,0,0);
	SetDefIdleMotion(dragon,ruFUSION_MIME_IDLE_STAND);
	
	local x,y,z,dir		=DW_Location(781315, 1);
	Move(bancremz, x,y,z);
	local x,y,z,dir		=DW_Location(781315, 2);
	Move(morek, x,y,z);
	local x,y,z,dir		=DW_Location(781315, 3);
	Move(jill, x,y,z);
	local x,y,z,dir		=DW_Location(781315, 4);
	Move(comgas, x,y,z);
	local x,y,z,dir		=DW_Location(781315, 5);
	Move(kalaway, x,y,z);
	local x,y,z,dir		=DW_Location(781315, 6);
	Move(ironrose, x,y,z);
	
	local	soldier		=lua_26in_getsoldiersguid();
	for i, _soldier in pairs(soldier) do
		if not lua_26in_partitionCHECK(_soldier.guid) then
			AddToPartition(_soldier.guid, room);
			local x,y,z,dir=DW_Location(781297, 6+i-1);
			SetPos(_soldier.guid,x,y,z,dir);
		end
		LockHP(_soldier.guid,1,"");
	end
	for i=1, 4, 1 do
		local x,y,z,dir		=DW_Location(781315, 7+i-1);
		Move(soldier[i].guid, x,y,z);
	end
	DisableQuest(bancremz, false);--�}���;
	Lua_BellatiaDuplication_change_status(room, "standby");
end
function GM_26in_foreboss4_stop()--GM���O�A����|���e��t�A�R��������
	local room	=ReadRoleValue(OwnerID(), EM_RoleValue_RoomID);
	if	Global_26in_foreboss4_Ctrl	then
		if Global_26in_foreboss4_Ctrl[room]	then
			if	ReadRoleValue(Global_26in_foreboss4_Ctrl[room], EM_RoleValue_IsPlayer)==1 then	return;		end
			DelObj(Global_26in_foreboss4_Ctrl[room]);
		end
	end
	if	Global_26in_DramaNPCrefl	then Global_26in_DramaNPCrefl[room]=nil; end
end
function GM_26in_foreboss4_recover()--GM���O�A�^�_���}�ڹҪ����A
	local	bancremz, 
		morek, 
		jill, 
		comgas, 
		kalaway, 
		ironrose, 
		dragon;
		
		bancremz, morek, jill, comgas, kalaway, ironrose, dragon=lua_26in_npcGUID();
		
	local	room	=ReadRoleValue(OwnerID(), EM_RoleValue_RoomID);
	
	
	
	Lua_BellatiaDuplication_change_save_point(room, 6);--�M���B���������q
	--��zGUID
	local ally={	bancremz, morek, jill, comgas, kalaway, ironrose, dragon};
	local	soldier		=lua_26in_getsoldiersguid();
	for i, _soldier in pairs(soldier) do
		LockHP(_soldier.guid,1,"");
		table.insert(ally, _soldier.guid);
	end	
	--�]�w
	for i, who in pairs(ally) do
		MoveToFlagEnabled(who, false);
	end
	local	pos	={6, 7, 8, 9};
	for i, __ in pairs(soldier) do
		MoveToFlagEnabled(__.guid, false);
		if not lua_26in_partitionCHECK(__.guid) then AddToPartition(__.guid ,room);	end
		local x,y,z,dir 	=DW_Location(781297, pos[#pos]);
		SetPos(__.guid, x,y,z,dir);
		table.remove(pos, #pos);
	end
	local	x,y,z,dir	=DW_Location(781282, 5);
	SetPos(bancremz, x,y,z,dir);
	local	x,y,z,dir	=DW_Location(781297, 1);
	SetPos(morek, x,y,z,dir);
	local	x,y,z,dir	=DW_Location(781297, 2);
	SetPos(jill, x,y,z,dir);
	local	x,y,z,dir	=DW_Location(781297, 3);
	SetPos(comgas, x,y,z,dir);
	local	x,y,z,dir	=DW_Location(781297, 4);
	SetPos(kalaway, x,y,z,dir);
	local	x,y,z,dir	=DW_Location(781297, 5);
	SetPos(ironrose, x,y,z,dir);
	SetPos(dragon, 0,0,0,0);

	--���m(�M���W�@������)
	if Global_26in_foreboss4_Ctrl then
		if Global_26in_foreboss4_Ctrl[room] then
			DelObj(Global_26in_foreboss4_Ctrl[room]);
		end
	end
	--���ʦ�m
	lua_26in_foreboss4_GoPosition();
	
end
function GM_26in_foreboss4a_recover()--���m���}�K�ǫ᪺���A
	local	room	=ReadRoleValue(OwnerID(), EM_RoleValue_RoomID);
	local	bancremz,
		morek, 
		jill, 
		comgas, 
		kalaway, 
		ironrose, 
		dragon;
		
		bancremz, morek, jill, comgas, kalaway, ironrose, dragon	=lua_26in_npcGUID();
	local	soldier		=lua_26in_getsoldiersguid();
	for i,_soldier in pairs(soldier)do
		LockHP(_soldier.guid,1,"");
	end
	local	ally			={	bancremz	=	bancremz;
						morek		=	morek;
						jill		=	jill;
						comgas		=	comgas;
						kalaway		=	kalaway;
						ironrose	=	ironrose;
						soldier1	=	soldier[1].guid;
						soldier2	=	soldier[2].guid;
						soldier3	=	soldier[3].guid;
						soldier4	=	soldier[4].guid;	};
	SetPos(dragon, 0,0,0,0);
	--���A
	for who, guid in pairs(ally) do
		DW_UnFight(guid, false);
		SetModeEx(guid, EM_SetModeType_Show, true);
		SetModeEx(guid, EM_SetModeType_Move, true);
		SetModeEx(guid, EM_SetModeType_Mark, true);
	end
	--��m
	local x,y,z,dir		=DW_Location(781312, 71);
	SetPos(bancremz, x,y,z,dir);
	local x,y,z,dir		=DW_Location(781312, 72);
	SetPos(morek, x,y,z,dir);
	local x,y,z,dir		=DW_Location(781312, 73);
	SetPos(jill, x,y,z,dir);
	local x,y,z,dir		=DW_Location(781312, 74);
	SetPos(comgas, x,y,z,dir);
	local x,y,z,dir		=DW_Location(781312, 75);
	SetPos(kalaway, x,y,z,dir);
	local x,y,z,dir		=DW_Location(781312, 76);
	SetPos(ironrose, x,y,z,dir);
	local x,y,z,dir		=DW_Location(781312, 71);
	for i=1, 4, 1 do
		local x,y,z,dir		=DW_NewLocation(-130-(i*20), 50, x,y,z,dir);
		SetPos(soldier[i].guid, x,y,z,dir);
		AddToPartition(soldier[i].guid, room);
	end
	--�ܼ�
	Global_26in_DramaNPCrefl	=Global_26in_DramaNPCrefl or {};
	Global_26in_DramaNPCrefl[room]	=nil;
	
	--�y�{
	local x,y,z,dir		=DW_Location(OwnerID());
	local ctrl		=CreateObj(110987, x,y,z,dir, 1);
	SetModeEx(ctrl,EM_SetModeType_Show,false);
	SetModeEx(ctrl,EM_SetModeType_Mark,false);
	SetModeEx(ctrl,EM_SetModeType_ShowRoleHead,false);
	AddToPartition(ctrl, room);
	Global_26in_foreboss4_Ctrl = Global_26in_foreboss4_Ctrl or {};
	Global_26in_foreboss4_Ctrl[room]=ctrl;
	BeginPlot(ctrl, "lua_26in_foreboss4_machine", 0);
	Lua_BellatiaDuplication_change_status(room, "standby");
end
function lua_26in_foreboss4_changeEXE()
	local player, bancremz		=OwnerID(),TargetID();
	local room			=ReadRoleValue(player, EM_RoleValue_RoomID);
	Lua_BellatiaDuplication_change_status(room, "advance");
	DisableQuest(bancremz, true);
	CloseSpeak(player);
	local x,y,z,dir		=DW_Location(player);
	local ctrl		=CreateObj(110987, x,y,z,dir, 1);
	SetModeEx(ctrl,EM_SetModeType_Show,false);
	SetModeEx(ctrl,EM_SetModeType_Mark,false);
	SetModeEx(ctrl,EM_SetModeType_ShowRoleHead,false);
	AddToPartition(ctrl, room);
	BeginPlot(ctrl, "lua_26in_foreboss4", 0);
end
function lua_26in_foreboss4()--�|���e��t
	local	ctrl	=OwnerID();
	local	room	=ReadRoleValue(ctrl, EM_RoleValue_RoomID);
	Lua_BellatiaDuplication_change_music(room,Global_BellatiaDuplication.music.departure_from_secret_room);
	--�O�J�����ܼ�(���q��)
	Global_26in_foreboss4_Ctrl = Global_26in_foreboss4_Ctrl or {};
	Global_26in_foreboss4_Ctrl[room]=ctrl;
	--��l���ܼ�(��NPC)
	local	bancremz, 
		morek, 
		jill, 
		comgas, 
		kalaway, 
		ironrose, 
		dragon;
		
		bancremz, morek, jill, comgas, kalaway, ironrose, dragon=lua_26in_npcGUID();
		
	local	room	=ReadRoleValue(OwnerID(), EM_RoleValue_RoomID);
	
	local soldier		=lua_26in_getsoldiersguid();
	local	ally			={	morek		=	morek;
						jill		=	jill;
						comgas		=	comgas;
						kalaway		=	kalaway;
						ironrose	=	ironrose;
						soldier1	=	soldier[1].guid;
						soldier2	=	soldier[2].guid;
						soldier3	=	soldier[3].guid;
						soldier4	=	soldier[4].guid;	};
	for i, _soldier in pairs(soldier) do
		table.insert(ally, _soldier.guid);
		LockHP(_soldier.guid,1,"");
	end
	
	--�ƨ禡
	local function SETallOFmode(option, Bool)--setmodeex >>�Ҧ��ͤ�Τ@�]�w
		for i, who in pairs(ally) do
			SetModeEx(who, option, Bool);
		end
	end
	local function follow(who, guid, x,y,z,dir)--�}�θ��H
		local	angle,
			dis;
		if	who	==nil		then
			DebugMsg(0, room, "subFunc:follow >>who is nil");
		elseif	who	=="morek"	then
			angle	=135;	dis	=50;
		elseif	who	=="jill"	then
			angle	=180;	dis	=50;
		elseif	who	=="comgas"	then
			angle	=220;	dis	=50;
		elseif	who	=="kalaway"	then
			angle	=160;	dis	=60;
		elseif	who	=="ironrose"	then
			angle	=200;	dis	=60;
			
		elseif	who	=="soldier1"	then
			angle	=170;	dis	=70;
		elseif	who	=="soldier2"	then
			angle	=190;	dis	=70;
		elseif	who	=="soldier3"	then
			angle	=165;	dis	=80;
		elseif	who	=="soldier4"	then
			angle	=195;	dis	=80;
		else
			return 0;
		end
		if angle and dis then
			x,y,z,dir = DW_NewLocation(angle, dis, x,y,z,dir);
			local sec=Move(guid, x,y,z);
			return sec;
		end
	end
	local function AllyFOLOOW(x,y,z,dir)--�Ҧ��ͤ�դO���H
		local max=0;
		for p1, p2 in pairs(ally) do
			local __=follow(p1, p2, x,y,z,dir);
			if	__ > max then
				max = __;
			end
		end
		return max;
	end
	local function AllyFaceTObancremz()--���F���s���~�A�Ҧ��H���V���s
		local x,y,z,dir=DW_Location(bancremz);
		for i, GUID in pairs(ally) do
			if GUID~=bancremz then
				local bearing=DW_GetDir(x,y,z, GUID);
				SetDir(GUID, bearing);
			end
		end
	end
	--�����ܼơG�ϥ��s����ܷ|������X�K�ǽШD�𮧪�����
	Global_26in_foreboss4_a = Global_26in_foreboss4_a or {};
	Global_26in_foreboss4_a[room] = Global_26in_foreboss4_a[room] or true;
	--�K�ǥ~�������}�l����A����̬ۦP(�O���b�����ܼ�>>Global_26in_foreboss4_Ctrl)
	BeginPlot(ctrl, "lua_26in_foreboss4_machine", 0);
	
	
	AllyFaceTObancremz();
	sleep(20);
	Yell(bancremz, "[SC_26IN_FOREBOSS4_I]", 3);
	
	--����Ĥ@���I
	local x,y,z,dir		=DW_Location(781324, 1);
	local __=AllyFOLOOW(x,y,z,dir);
	local time=Move( bancremz, x,y,z);
	Global_BellatiaDuplication:debug("point1 time="..time);
	sleep(time);
	
	--��V
	local x,y,z,dir		=DW_Location(781324, 2);
	x,y,z,dir		=DW_NewLocation(180, 83, x,y,z,dir);
	local __=AllyFOLOOW(x,y,z,dir);
	local time=Move( bancremz, x,y,z);
	sleep(time+20);
	
	--�����2���I
	local x,y,z,dir		=DW_Location(781324, 2);
	local __=AllyFOLOOW(x,y,z,dir);
	local time=Move( bancremz, x,y,z);
	Global_BellatiaDuplication:debug("point1 time="..time);
	sleep(time);
	
	--�}����t
	local door	=Global_BellatiaDuplication[room].door_secret_exit.GUID
	CastSpell(bancremz, door, 850804);
	sleep(30);
	PlayMotionEX(door, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN, ruFUSION_ACTORSTATE_ACTIVATE_LOOP);
	sleep(10);
	SetModeEx(door,EM_SetModeType_Obstruct,false);
	
	--���ĤT�I�e�i
	local x,y,z,dir		=DW_Location(781324, 3);
	local __=AllyFOLOOW(x,y,z,dir);
	local time=Move( bancremz, x,y,z);
	if __>time then time=__; end
	sleep(20);
	
	--�h�W����t
	StopMove(bancremz, true);
	sleep(5);
	AddBuff(bancremz, 620841, 0, 30);
	sleep(20)
	WriteRoleValue(bancremz, EM_RoleValue_IsWalk, 1);
	ReCalculate(bancremz);
	sleep(10);
	
	--�C�C���L�h
	local x,y,z,dir		=DW_Location(781312, 71);
	Move(bancremz, x,y,z);
	Yell(bancremz,"[SC_26IN_FOREBOSS4_Z]",3);--�ڱo���U......�ڪ����p�A�̥����F��
	--�Ҧ��H�N��
	
	local x,y,z,dir		=DW_Location(781312, 72);
	Move(morek, x,y,z);
	local x,y,z,dir		=DW_Location(781312, 73);
	Move(jill, x,y,z);
	local x,y,z,dir		=DW_Location(781312, 74);
	Move(comgas, x,y,z);
	local x,y,z,dir		=DW_Location(781312, 75);
	Move(kalaway, x,y,z);
	local x,y,z,dir		=DW_Location(781312, 76);
	Move(ironrose, x,y,z);
	local x,y,z,dir		=DW_Location(781312, 71);
	for i=1, 4, 1 do
		local x,y,z,dir		=DW_NewLocation(-130-(i*20), 50, x,y,z,dir);
		Move(soldier[i].guid, x,y,z);
	end	
	
	sleep(30);
	
	Lua_BroadCast_RoomStingTypeColor(room, "[SC_26IN_FOREBOSS4_1]");	--�Ĥ@�y�s��
	DisableQuest(bancremz, false);
	Lua_BellatiaDuplication_change_save_point(room,7);
	Lua_BellatiaDuplication_change_status(room, "standby");
	
end
function lua_26in_foreboss4_changeEXE_a()--�X�K�Ǥ��᪺��ܰ���
	local player, bancremz		=OwnerID(), TargetID();
	local room			=ReadRoleValue(player, EM_RoleValue_RoomID);
	Lua_BellatiaDuplication_change_status(room, "advance");
	DisableQuest(bancremz, true);
	CloseSpeak(player);
	--�إ߼@���w��(��l��)
	Global_26in_DramaNPCrefl		=Global_26in_DramaNPCrefl or {};
	Global_26in_DramaNPCrefl[room]		=true;
	Lua_BellatiaDuplication_change_music(room,Global_BellatiaDuplication.music.advance4_say_goodbye_with_pangkorrams);
end
function lua_26in_foreboss4_machine()--�|���e�԰�����(�K�Ǥ��N�}�l����)
	local ctrl	=OwnerID();
	local room	=ReadRoleValue(ctrl, EM_RoleValue_RoomID);
	
	--���c�Aindex �O�s�� var�Otable 
	local machine	={};
	local HideBox	={};
	--��t�����]�w
	local	nextMACHIINE		=1;
	local	DramaRole		={};--�t�XMachine
	local	DramaString		={};--�t�XMachine & DramaDuration
	local	DramaDuration		={};--�t�XMachine & DramaDuration
	local	DramaPass		={};--�t�XMachine & DramaDuration
	local	progress		=1;--nextMACHIINE �i��ɭ��m
	--�s���]�w
	local	BroadCast		={[2]=true}; --�_�Y
	for	sn=3, 9, 1 do--Max��r��ưt�X
		BroadCast[sn]=false;
	end
	local	BroadString		={	"none";
						"[SC_26IN_FOREBOSS4_2]";	
						"[SC_26IN_FOREBOSS4_3]";	
						"[SC_26IN_FOREBOSS4_4]";	
						"[SC_26IN_FOREBOSS4_5]";	
						"[SC_26IN_FOREBOSS4_6]";	
						"[SC_26IN_FOREBOSS4_7]";	
						"[SC_26IN_FOREBOSS4_8]";	
						"[SC_26IN_FOREBOSS4_9]";	
										};
	local	C_Fire			="0xFFC60000";--���������A�r���C��S��
	local	BroadColor		={
						0;
						0;
						C_LightBlue;
						C_LightBlue;
						C_Fire;
						0;
						C_Fire;
						C_LightBlue;
						C_Fire;
										}
	--�p���ܼ�
	local	time		=0;--��Drama�}�l�B�@�~�}�l�p��
	local	duration	=0;--�����ܼơA�ܹs����A�ѥ����ܼ�DramaDuration��J
	local	BCcircle	=0;--�����ܼơA�ܹs����A�Ѽs��������J
	
	
	local function createmachine(pos)--�гy�p�ǡA�^��guid
		local x,y,z,dir	=DW_Location(781326, pos);
		local org={hard=103363;normal=108032;easy=108097;};
		local m=CreateObj(org[Global_BellatiaDuplication.type], x,y,z,dir, 1);
		SetModeEx(m, EM_SetModeType_Searchenemy, false);
		AddToPartition(m, room);
		BeginPlot(m, "lua_26in_foreboss4_machineSPY", 0);
		return m;
	end
	
	--spot �� index �ĴX���p��
	--�A���U�@�h�Aindex �O�X�l�s�� �A  var �O�������ơA��F��x����N���s�}�l�I�k
	local spot={		[1]={	[1]=2;	[2]=0;	[3]=4;						};
				[2]={	[4]=3;	[5]=1;	[6]=5;	[7]=2;					};
				[3]={	[8]=3;	[9]=1;	[10]=5;	[11]=2;	[12]=4;				};
				[4]={	[13]=3;	[14]=1;	[15]=5;	[16]=2;	[17]=4;	[18]=0;			};
				[5]={	[19]=3;	[20]=1;	[21]=5;	[22]=2;	[23]=4;	[24]=0;	[25]=6;		};
				[6]={	[26]=3;	[27]=1;	[28]=5;	[29]=2;	[30]=4;	[31]=0;	[32]=6;	[33]=3;	};
									};
	--��l��(�����i�׬�����)
	--i �O�p�Ǿ������s��
	for	i, __ in pairs(spot) do
		machine[i]={	guid=createmachine(i);
				state="alive";
								};
		--HideBox�u����token��guid
		HideBox[i]={};
		for flag, __ in pairs(spot[i]) do
			local x,y,z,dir=DW_Location(781325, flag);
			HideBox[i][flag]	=CreateObj(107862, x,y,z,dir, 1);
			SetModeEx(HideBox[i][flag], EM_SetModeType_Show, false);
			SetModeEx(HideBox[i][flag], EM_SetModeType_Mark, false);
			DW_UnFight(HideBox[i][flag], true);
			AddToPartition(HideBox[i][flag], room);
			BeginPlot(HideBox[i][flag], "lua_26in_foreboss4_machineSPY", 0);
		end
		
		--��DramaRole ��Machine ���X(�@�ί���)
		if	i==1		then
			DramaRole[i]	={	[1]	="comgas";		
						[2]	="ironrose";	
						[3]	="comgas",	
						[4]	="ironrose";	
						[5]	="ironrose";	
						["final"]="ironrose";	};
			DramaString[i]	={	[1]	="[SC_26IN_FOREBOSS4_A]";
						[2]	="[SC_26IN_FOREBOSS4_B]";
						[3]	="[SC_26IN_FOREBOSS4_C]";
						[4]	="[SC_26IN_FOREBOSS4_D]";
						[5]	="[SC_26IN_FOREBOSS4_E]";
						["final"]="[SC_26IN_FOREBOSS4_H]";	};
			DramaDuration[i]={	[1]	=10;		
						[2]	=50;		
						[3]	=30;		
						[4]	=20;		
						[5]	=30;		
						["final"]=20;	};
			DramaPass[i]={		[1]	=true;		
						[2]	=false;		
						[3]	=false;		
						[4]	=false;		
						[5]	=false;		
						["final"]=false;	};
		elseif	i==#spot-3	then
			DramaRole[i]	={	[1]	="kalaway";	
						[2]	="comgas";	};
			DramaString[i]	={	[1]	="[SC_26IN_FOREBOSS4_F]";
						[2]	="[SC_26IN_FOREBOSS4_G]";	};
			DramaDuration[i]={	[1]	=20;		
						[2]	=30;		};
			DramaPass[i]={		[1]	=false;		
						[2]	=false;		};
		end
	end
	

	--��������s��(���D�ҡA��������)
	local	bancremz, morek, jill, comgas, kalaway, ironrose, dragon	=lua_26in_npcGUID();
	local	soldier			=lua_26in_getsoldiersguid();
	for i, _soldier in pairs(soldier) do
		LockHP(_soldier.guid,1,"");
	end
	local	ally			={	morek		=	morek;
						jill		=	jill;
						comgas		=	comgas;
						kalaway		=	kalaway;
						ironrose	=	ironrose;
						soldier1	=	soldier[1].guid;
						soldier2	=	soldier[2].guid;
						soldier3	=	soldier[3].guid;
						soldier4	=	soldier[4].guid;	};

	local function allyATTACK(MACHINEnumber)--�Ҧ��H�ĤW�h��
		DebugMsg(0, room, "all peaple attack!!");
		for who, guid in pairs(ally) do
			SetAttack(guid, machine[MACHINEnumber].guid);
		end
	end
	local function STANDBY(who, guid, x,y,z,dir)--�b�Y�Ӧ�m�e�N��
		local angle, dis	=0, 0;
		if not who	then
			DebugMsg(0, room, "Func:STANDBY >> who is nil!")
			return false;
		elseif	who	=="bancremz" or who	=="dragon"	then
			return true;--�S�����s�������A�����^�w�g��F
		elseif	who	=="morek"	then
			angle	=-150;
			dis	=30;
		elseif	who	=="jill"	then
			angle	=150;
			dis	=30;
		elseif	who	=="comgas"	then
			angle	=90;
			dis	=5;
		elseif	who	=="kalaway"	then
			angle	=190;
			dis	=60;
		elseif	who	=="ironrose"	then
			angle	=180;
			dis	=45
		elseif	who	=="soldier1"	then
			angle	=-160;
			dis	=40;
		elseif	who	=="soldier2"	then
			angle	=-160;
			dis	=60;
		elseif	who	=="soldier3"	then
			angle	=160;
			dis	=40
		elseif	who	=="soldier4"	then
			angle	=160;
			dis	=60;
		end
		local x,y,z,dir	=DW_NewLocation(angle, dis, x,y,z,dir);
		if	DW_GetDistance(guid, x,y,z)	<20	then
			SetDir(guid, dir);
			return true;
		else
			Move(guid, x,y,z)
			return false;
		end
	end
	local function allyPOSITION(flag, num)--�Ҧ��H�N�Y�X�Ц�m
		local x,y,z,dir	=DW_Location(flag, num);
		local alreadyONposition 	= 0;
		local a				= 0;
		for who, guid in pairs(ally) do
			a			= a+1;
			if STANDBY(who, guid, x,y,z,dir) then
				alreadyONposition = alreadyONposition+1;
			end
		end
		if	alreadyONposition	== a	then
			return true;
		end
	end
	local function allysharetarget()--�@�ɤ���ؼ�
		local list	={};
		local a=0;--�H��
		for __, guid in pairs(ally) do
			a = a+1;
			local n		=HateListCount(guid);
			for pos=0, n-1, 1 do
				local enermy	=HateListInfo(guid, pos, EM_HateListInfoType_GItemID);
				if not list[enermy] then list[enermy]=1; else list[enermy]=list[enermy]+1; end
			end
		end
		for enermy, num in pairs(list) do
			if num<a then
				for __, guid in pairs(ally) do
					SysCastSpellLv(enermy, guid, 495751, 0);
				end
			end
		end
	end
	local function check(option)--�ˬd�ﶵ
		if not option then
			DebugMsg(0, room, "Func:check>>option is nil");
		--�O�_�����}�԰�
		elseif(option=="all ally isn't in combat")then
			for who, guid in pairs (ally) do
				if HateListCount(guid)~=0 then
					return false;
				end
			end
			return true;
		--NPC�O�_���s��
		elseif(option=="all ally is alive")then
			for who, guid in pairs (ally) do
				if(not CheckID(guid))then
					Global_BellatiaDuplication:debug(who.."CheckID doesn't pass");
					return false;
				end
				if ReadRoleValue(guid, EM_RoleValue_IsDead)==1 then
					Global_BellatiaDuplication:debug(who.."is Dead");
					return false;
				end
			end
			return true;
		--���a�O�_����
		elseif(option=="all player is dead")then
			local num=#Global_BellatiaDuplication[room].players;
			for i=1, num, 1 do
				
				local player=Global_BellatiaDuplication[room].players[i].guid;
				if(ReadRoleValue(player,EM_RoleValue_IsDead)==0)then return false;end
			end
			Global_BellatiaDuplication:debug("players all dead");
			return true;
		end
	end
	local function IsBackFormalProcess()--���F��t�S�O�P�_1�M2 
		if	machine[1].state=="combat"	or
			machine[1].state=="fault"	or
			machine[1].state=="combat"	or
			machine[1].state=="fault"	then
			if	type(progress)=="number"	and
				progress>=4			then
				return false;
			else
				return true;
			end
		end
		return false;
	end
	local function FormalProcess()--���`�P�_�y�{, �^�ǭȪ�ܬO�_�i�H���U�@���q
		if(check("all ally isn't in combat"))then
			if(machine[nextMACHIINE].state=="alive")then
				allyPOSITION(781327, nextMACHIINE);--�Ҧ��H����w�I
				return false;
			elseif(machine[nextMACHIINE].state=="combat")then
				allyATTACK(nextMACHIINE);
				return false;
			else
				if allyPOSITION(781327, nextMACHIINE) then--�Ҧ��H����w�I
					nextMACHIINE	=nextMACHIINE+1;
					return true;
				else
					return false;
				end
			end
		else
			allysharetarget();--�@�ɤ���ؼ�
		end
		return false;
	end
	local	ShowPhase=true;
	while(true)do
		--RESET phase
		
		
		--KEEP	phase
		if(Global_26in_DramaNPCrefl)and(Global_26in_DramaNPCrefl[room])then
			time = time+1;
			--duration �O����A�Ш���l����
			if(duration>10)then
				duration = duration-10;
			else
				duration = 0;
			end
			--�s���`��(�����t��)
			if(BCcircle>10)then
				BCcircle = BCcircle-10;
			else
				BCcircle = 0;
			end
			--�s����e����
			for phase=2, 9, 1 do
				if(BroadCast[phase] and BCcircle==0)then
					if(phase>2)then
						if(machine[2].state=="alive")then break; end
					end
					if phase > 3 then
						if(not DramaRole)then break; end
						if(not DramaPass or not DramaPass[#spot-3])or(not DramaPass[#spot-3][#DramaRole])then break; end
					end
					DebugMsg(0, room, "phase="..phase);
					Lua_BroadCast_RoomStingTypeColor(room, BroadString[phase], 2, BroadColor[phase]	);
					BCcircle = 40;
					BroadCast[phase] = false;           --�����o�@�y
					BroadCast[phase+1] = true;          --�}�ҤU�@�y
					break;
				end
			end
		end
		
		
		
		sleep(10);
		--��s���a���
		--In original version, update per 20sec.
		Lua_BellatiaDuplication_update_players(room);
		
		--i �O�p�Ǿ������s��
		for i=1, #spot, 1 do
			if	CheckID(machine[i].guid) and ReadRoleValue(machine[i].guid, EM_RoleValue_IsDead)==0	then
				if	CheckBuff(machine[i].guid, 624291)	then
						--i �O�p�Ǿ������s��
						for	flag, sec in pairs(spot[i]) do
							if sec>=7	then
								spot[i][flag]		=0;
								local x,y,z,dir		=DW_Location(781325, flag);
								CastSpellPos(HideBox[i][flag], x,y,z, 496169, 0);
							else
								spot[i][flag]		=sec+1;
							end
						end
				else
						if	HateListCount(machine[i].guid)==0	then
							AddBuff(machine[i].guid,624291,0,-1);
							AddBuff(machine[i].guid,624284,0,-1);
							SetDefIdleMotion(machine[i].guid, ruFUSION_MIME_BUFF_LOOP);
							machine[i].state	="alive"
						else
							machine[i].state	="combat"
							SetDefIdleMotion(machine[i].guid, ruFUSION_MIME_IDLE_STAND);
						end
				end
			else
				machine[i].state="fault";
			end
		end
		--
		if(not check("all ally is alive"))then
			--���a����;
			DebugMsg(0, room, "reset!");
		end
		if check("all player is dead") then
			--���a����;
			DebugMsg(0, room, "reset!");
		end
		
		--NPC����A�����ܫ�~�}�l
		if Global_26in_DramaNPCrefl and Global_26in_DramaNPCrefl[room]				then
			--
			if	ShowPhase	then
				if	IsBackFormalProcess() then
					--���a�w�g�}��
					progress	="final";
					ShowPhase	=false;
				else
					--��t
					if	duration==0	then
						Yell(ally[DramaRole[nextMACHIINE][progress]],	DramaString[nextMACHIINE][progress], 3);
						DramaPass[nextMACHIINE][progress]=true;
						duration		=DramaDuration[1][progress];
						if	progress==1 then
							WriteRoleValue(comgas, EM_RoleValue_IsWalk, 0);
							ReCalculate(comgas);
							local x,y,z,dir=DW_Location(781325,3);
							Move(comgas, x,y,z);
							SetModeEx(comgas, EM_SetModeType_ShowRoleHead, false);
							DW_SetHPpercent(comgas, 50);
						elseif	progress==2 then
							local x,y,z,dir=DW_Location(781325,3);
							for who, guid in pairs(ally) do
								local dir = DW_GetDir(guid, x,y,z);
								if who~="comgas" then SetDir(guid, dir); end
							end
						elseif	progress==3 then
							local x,y,z,dir=DW_Location(781312,74);
							Move(comgas, x,y,z);
						elseif	progress==4 then
							CastSpell(ironrose, machine[1].guid, 497865);
							local x,y,z,dir=DW_Location(781312, 76);
							local dir=DW_GetDir(kalaway, x,y,z);
							SetDir(kalaway, dir);
						elseif	progress==5 then
							DebugMsg(0, room, "progress=5");
							allyATTACK(1);
							ShowPhase	=false;--��t����
							nextMACHIINE	=nextMACHIINE+1;
							progress	=0;--���F�t�X�U����+1.....
						end
						progress		=progress+1;
					end
				end
			else
				--���X��t���q������
				if	progress=="fianl"	then
					if	duration==0	then
						if	machine[2].state=="combat" then allyATTACK(1) end
						if	machine[1].state=="combat" then allyATTACK(1) end
						Yell(ally[DramaRole[1][progress]],	DramaString[1][progress], 3);
						DramaPass[nextMACHIINE][progress]=true;
						duration		=DramaDuration[1][progress];
						progress		=1;
					end					
				--���`���q
				else
					if nextMACHIINE>#spot then
						break;
					end
					if FormalProcess()	then
						progress	=1;
					end
					--�u�ѥx��
					if	duration==0 and DramaRole[nextMACHIINE]	and DramaRole[nextMACHIINE][progress]	then
						DebugMsg(0,room, "nextMACHIINE="..nextMACHIINE);
						DebugMsg(0,room, "progress="..progress);
						Yell(ally[DramaRole[nextMACHIINE][progress]],	DramaString[nextMACHIINE][progress], 3);
						DramaPass[nextMACHIINE][progress]=true;
						duration=DramaDuration[nextMACHIINE][progress];
						if(type(progress)=="string")then progress = 0;end
						progress		=progress+1;
					end
				end
			end
		end
	end
	BeginPlot(bancremz, "lua_26in_foreboss4_handover", 0);
	DelObj(ctrl);
end
function lua_26in_foreboss4_machineSPY()--�l�ͪ��W�h�A�гy�̤��b�N����
	local token	=OwnerID();
	local room	=ReadRoleValue(token, EM_RoleValue_RoomID);
	while true do
		if(Lua_BellatiaDuplication_check_status(room,"boss"))then break;end
		if(Lua_BellatiaDuplication_check_status(room,"success"))then break;end
		sleep(20);
	end
	DelObj(token);
end
function lua_26in_foreboss4_handover()--�汵�ʧ@
	local	bancremz, morek, jill, comgas, kalaway, ironrose, dragon	=lua_26in_npcGUID();
	local	room	=ReadRoleValue(bancremz, EM_RoleValue_RoomID);
	local	soldier	=lua_26in_getsoldiersguid();
	
	--��m
	local x,y,z,dir		=DW_Location(781312, 82);
	Move(morek, x,y,z);
	local x,y,z,dir		=DW_Location(781312, 83);
	Move(jill, x,y,z);
	local x,y,z,dir		=DW_Location(781312, 84);
	Move(comgas, x,y,z);
	local x,y,z,dir		=DW_Location(781312, 85);
	Move(kalaway, x,y,z);
	local x,y,z,dir		=DW_Location(781312, 86);
	Move(ironrose, x,y,z);
	local x,y,z,dir		=DW_Location(781312, 81);
	for i=1, 4, 1 do
		local x,y,z,dir		=DW_NewLocation(-130-(i*20), 50, x,y,z,dir);
		Move(soldier[i].guid, x,y,z);
	end
	local d=CreateObj(122723, x,y,z,dir, 1);
	DW_UnFight(d, true);
	SetModeEx(d, EM_SetModeType_Mark, false);
	SetModeEx(d, EM_SetModeType_ShowRoleHead, false);
	SetModeEx(d, EM_SetModeType_HideName, true);
	AddToPartition(d, room);
	WriteRoleValue(d, EM_RoleValue_LiveTime, 4);
	CastSpell(d, d, 850810);
	
	--�]�w
	SetModeEx(bancremz, EM_SetModeType_Mark, true);
	DW_UnFight(bancremz, false);
	sleep(35);
	
	SetPos(bancremz, x,y,z,dir);
	
	Lua_BellatiaDuplication_change_status(room, "success");
	for i=1, 4, 1 do
		DelObj(soldier[i].guid);
	end
	Yell(bancremz,"[SC_26IN_FOREBOSS4_Y]",3);--�o�@��ש���{�A�ڤw�g�ǳƧ���A��A�]�ǳƧ����ɧi�D��
end
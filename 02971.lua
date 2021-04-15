--781321 �X��  Boss-1 door1-2 door2-3�B4-18 �˸m
--107836 �̮��u��
--122725 �������˸m
--107837 �u�@������
--107838 ������
function un_zone27Boss5_ctrl()  --���
local ctrl = OwnerID()
local ZoneID = ReadRoleValue ( ctrl , EM_RoleValue_ZoneID )
local RoomID = ReadRoleValue( ctrl , EM_RoleValue_RoomID )
local BossNPC = {107836,108166,108169} --Boss1.2.3.Door
local ctrmonster = {122725,122725,122725} 				--�������˸m
local timer	= 0											--�˸m������10���ͪ��p�ɱ�
local door1 											--�e��(�԰��}��)
local door2 											--��� (�԰������}��)
local zone 												--�P�_�ӥέ���zone��table�Ѽ�
local apparatus = {}									--�˸m*2
local CombatBegin = 0 									--�}�ԺX��
local crazytime = 0 									--�g�ɮɶ�
local _goCrazyTime = 480;	--140114 K.J. Aris
if ZoneID == 157 then  zone =1;_goCrazyTime = 480; elseif ZoneID == 158 then zone =2;_goCrazyTime = 360; elseif ZoneID == 159 then zone =3;_goCrazyTime = 999999; end --�P�_zone
local Boss = CreateObjByFlag(BossNPC[zone],781321,1,1)
SetModeEx(Boss,EM_SetModeType_Obstruct, false)
Setplot(Boss,"dead","YOYO_Zone27D_Boss3_Start",0)    --�ᦺ�`�@����BOSS
AddToPartition(Boss,RoomID)                          	--�}���ХXBoss
local Sktalk = {"[SC_ZONE27BOSS5_01]","[SC_ZONE27BOSS5_02]","[SC_ZONE27BOSS5_03]","[SC_ZONE27BOSS5_05]"} --�}�ԡB���a���ΡBBoss���`���
local x,y,z,dir=DW_Location(781321,3);--�}�h�ХX���
door2=CreateObj(106251,x,y,z,dir,1);
un_zone27boss5_create(door2,3)
AddToPartition(door2,RoomID)
	while 1 do
		sleep(20)
		if hatelistcount(boss)~=0 then                              --�}��
			if CombatBegin==0 then
				CombatBegin=1										--�}���F
				ScriptMessage( Boss, -1 , 2 , Sktalk[1] , 2 )
				apparatus[1],apparatus[2] = un_zone27boss5_apparatus(ctrmonster[zone],RoomID,Boss)  --���͸˸m��function
				AddBuff(Boss,624573,0,-1)  --��boss����90%��BUFF
				Callplot(Boss , "un_zone27Boss5_fight" , 0)	
				x,y,z,dir=DW_Location(781321,2);--�ھںX�l��m
				door1=CreateObj(106251,x,y,z,dir,1);
				un_zone27boss5_create(door1,3)
				AddToPartition(door1,RoomID)
			end	
			if checkID(apparatus[1])== false and checkID(apparatus[2])== false then
				--say(ctrl,"timerrrr = "..timer)
				timer = timer+1
			end
			if timer>=10 then
				ScriptMessage( Boss, -1 , 2 , Sktalk[4] , 2 )
				apparatus[1],apparatus[2] = un_zone27boss5_apparatus(ctrmonster[zone],RoomID,Boss)  --���͸˸m��function
				AddBuff(Boss,624573,0,-1)  --��boss����90%��BUFF
				timer =0
			end
			if CombatBegin == 1 then
				crazytime = crazytime +1
				if crazytime >= _goCrazyTime then
					Addbuff(Boss,624632,0,-1)
					crazytime = 0
				end
			end
		end	

		if hatelistcount(Boss)==0 and CombatBegin==1 then			--�}�ԫᤳ���S�H���m�԰�
			if ReadRoleValue( Boss , EM_RoleValue_IsDead)==0 then
				sleep(10)
				ScriptMessage( Boss, -1 , 2 , Sktalk[2] , 2 )
				local mon1 = ReadRoleValue(apparatus[1],EM_RoleValue_register2)
				local mon2 = ReadRoleValue(apparatus[2],EM_RoleValue_register2)
				Delobj(mon1)
				Delobj(mon2)
				Delobj(Boss)  --�R��Boss
				Delobj(door1) --�R���e��
				Delobj(apparatus[1])
				Delobj(apparatus[2])
				sleep(20)
				Boss = CreateObjByFlag(BossNPC[zone],781321,1,1)
				--un_zone27boss5_create(Boss,2)
				--apparatus[1],apparatus[2] = un_zone27boss5_apparatus(ctrmonster[zone],RoomID,Boss)  --���͸˸m��function
				Setplot(Boss,"dead","YOYO_Zone27D_Boss3_Start",0)    --�ᦺ�`�@����BOSS
				AddToPartition(Boss,RoomID) 
				CombatBegin=0										--���m�԰�
				crazytime = 0
			elseif ReadRoleValue( boss , EM_RoleValue_IsDead)==1 then --Boss���`
				local mon1 = ReadRoleValue(apparatus[1],EM_RoleValue_register2)
				local mon2 = ReadRoleValue(apparatus[2],EM_RoleValue_register2)
				ScriptMessage( Boss, -1 , 2 , Sktalk[3] , 2 )
				Delobj(mon1)
				Delobj(mon2)
				--Delobj(Boss)  --�R��Boss
				Delobj(door1) --�R���e��
				Delobj(door2) --�R���e��
				Delobj(apparatus[1])
				Delobj(apparatus[2])
				sleep(50)
				break
			end
		end	
	end
end


function un_zone27Boss5_die() --Boss���`AI
Callplot(OwnerID() , "YOYO_Zone27D_Boss3_Start" , 0)	--����U�@��Boss
end

function un_zone27Boss5_fight() --Boss�԰�AI
local Boss = OwnerID()
local timer = 0
local Targ     --boss��e�ؼ�
local Sktalk = {"[SC_ZONE27BOSS5_04]","[SC_ZONE27BOSS5_05]"}
	while 1 do
	sleep(10)
	timer = timer +1 
		if timer %13 == 0 then  --25�j��
			while ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)~=0 do--�ˬd�٦��S���b�I�k
				sleep(2)
			end	
			ScriptMessage( Boss, -1 , 2 , Sktalk[1] , 2 )
			CastSpelllv( Boss, Boss,851033 ,0 ) --�ݦ����	
			--say(Boss,"skill = "..2)
		end
		
		if timer %5 == 0 then  --5�p��
			while ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)~=0 do--�ˬd�٦��S���b�I�k
				sleep(2)
			end	
			--ScriptMessage( Boss, -1 , 2 , Sktalk[2] , 2 )
			Targ=ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID)--BOSS������ؼ�
			CastSpelllv( Boss, Targ,851028 ,0 ) --���S����
			--say(Boss,"skill = "..1)
		end
	end
end

function un_zone27boss5_create(X,y) 		   --���ͪ���ɱa�J���ѼơAX�O�a�J��NPC�AY�O�Q�̷Ӫ�����
	SetModeEx(x,EM_SetModeType_SearchenemyIgnore,false) ---���󤣷|�Q�j�M
		if y == 3 then
			a = false
			SetModeEx(x,EM_SetModeType_Obstruct,true) ---����
		else
			a = true
		end
	SetModeEx(x,EM_SetModeType_HideName,a)  ---�����Y�W�O�_��ܦW��
	SetModeEx(x,EM_SetModeType_HideMinimap,a)  ---����O�_�b�p�a�ϤW���
	SetModeEx(x,EM_SetModeType_Show,true)  ---���
	---------------------------------------------------------------------�H�W���@��
	local z --�P�_�ѼƬO�h�֮ɬ�true or false
		if y == 1 then
			z = true
		elseif y == 2 then
			z = false
		end
	SetModeEx(x,EM_SetModeType_Mark,z) ----�аO
	SetModeEx(x,EM_SetModeType_Strikback,z) ---����
	SetModeEx(x,EM_SetModeType_Move,z) ---����	
	SetModeEx(x,EM_SetModeType_Fight,z) ---�i���
	SetModeEx(x,EM_SetModeType_Searchenemy,z)  ---���	
end
--================================================================================================================�H�U���˸m�H�Τ�������script
function un_zone27boss5_apparatus(ctrmonster,RoomID,Boss)   --�u�@�˸m����
	local table2 = {}
	table2 = Az_RND_Ary(4,18,2)	--���X���1-30�����ƼƦr
	local apparatus_1 = CreateObjByFlag(ctrmonster,781321,table2[1],1) --�b��Ӥ����ƪ��X�в��͸˸m
	local apparatus_2 = CreateObjByFlag(ctrmonster,781321,table2[2],1)
	
	un_zone27boss5_create(apparatus_1,2)
	un_zone27boss5_create(apparatus_2,2)
	AddToPartition(apparatus_1,RoomID)
	AddToPartition(apparatus_2,RoomID)
	WriteRoleValue(apparatus_1,EM_RoleValue_PID,Boss)  --�NBoss�g�J�˸m��PID
	WriteRoleValue(apparatus_2,EM_RoleValue_PID,Boss)
	WriteRoleValue(apparatus_1,EM_RoleValue_register1,apparatus_2) --��Ӹ˸m��reg1�����x�s
	WriteRoleValue(apparatus_2,EM_RoleValue_register1,apparatus_1)
	BeginPlot(apparatus_1 , "un_zone27boss5_apparatus_2" , 0)
	BeginPlot(apparatus_2 , "un_zone27boss5_apparatus_2" , 0)
	return apparatus_1,apparatus_2
end
function un_zone27boss5_apparatus_2()  --�˸m���ͤ�����+�P�_�O�_�i�I��
	local ctrl = OwnerID()
	SetPlot( ctrl,"touch","un_zone27boss5_apparatus_4",30 )
	local ZoneID = ReadRoleValue ( ctrl , EM_RoleValue_ZoneID )
	local RoomID = ReadRoleValue( ctrl , EM_RoleValue_RoomID )
	local ust --�t�@�Ӹ˸m
	local zone 	--�P�_�ӥέ���zone��table�Ѽ�
	local NPC = {107837,108167,108168} --������
	if ZoneID == 157 then  zone =1 elseif ZoneID == 158 then zone =2 else zone =3 end --�P�_zone
	local monster1 
	--monster1 = Lua_CreateObjToRandownPos(ctrl,NPC[zone],1,50,true) --���ͤ���
	local x,y,z,dir=DW_Location(ctrl)--�ھڪ����m
	monster1=CreateObj(NPC[zone],x,y,z,dir,1);
	AddToPartition(monster1,RoomID)
	un_zone27boss5_create(monster1,1)
	SetModeEx(monster1,EM_SetModeType_Obstruct,false)
	WriteRoleValue(ctrl,EM_RoleValue_register2,monster1) --reg2�g�J������
	local timer = 0 --�P�_�����O�_���`���ɶ�
	local monster2 --�t�@��������
	while 1 do
		sleep(10)
		--**************�������S�������P�_
		ust = ReadRoleValue(ctrl,EM_RoleValue_register1)
		monster2 = ReadRoleValue(ust,EM_RoleValue_register2) --�t�@��������
		--say(monster2,"hihi")
		--say(ust,"hihihihi")
		if CheckID(monster1) == false or ReadRoleValue(monster1,EM_RoleValue_IsDead)==1 then
			if CheckID(monster2) == false or ReadRoleValue(monster2,EM_RoleValue_IsDead)==1 then
				
				SetModeEx(ctrl,EM_SetModeType_Mark,true) --�����������ҥH�Ѷ}���˸m�i�H�Q�I��
			else
				timer = timer +1
				--say(ctrl,"time = "..timer)
			end
		end
		if timer >=10 then  --5���S�����Ⱖ�������A�ҥH����
			timer =0
			x,y,z,dir=DW_Location(ctrl)--�ھڪ����m
			monster1=CreateObj(NPC[zone],x,y,z,dir,1);
			AddToPartition(monster1,RoomID)
			un_zone27boss5_create(monster1,1)
			WriteRoleValue(ctrl,EM_RoleValue_register2,monster1) --reg2�g�J������
		end
		--**************
	end
end

--==================================================================�˸m�I���H�����Boss��BUFF

function un_zone27boss5_apparatus_4() 
	BeginCastBarEvent( OwnerID(), TargetID(), "[SC_UNWARM_11]", 10, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "un_zone27boss5_apparatus_5" )
end
function un_zone27boss5_apparatus_5(Obj,CheckResult)  --�I�����檺�Ʊ�
	local tar = TargetID()
	local Boss = ReadRoleValue(tar,EM_RoleValue_PID)  --Boss
	local apparatus = ReadRoleValue(tar,EM_RoleValue_register1) --�t�@�Ӹ˸m
	if CheckID(Boss) == true and (CheckID(apparatus) == false or ReadRoleValue( apparatus , EM_RoleValue_IsDead)==1) then  --Boss���۩άO�t�@�Ӹ˸m���F�ή����N����
		CancelBuff(Boss, 624573 ) 
	end
	Delobj(tar)
	EndCastBar( OwnerID(), CheckResult ) 
end
--===================================================================

function un_851031() --���E����
local own = OwnerID()
local tar = TargetID()
	if own == tar then
		return false
	else
		return true
	end
end
--////////////////////////////////////////////////////////////
--��Boss���\�h����������P�_�A�]���j�q���Υ����ܼơA����������@�̡A�ȥ����˵��Ҧ��������ܼ�Global_27in_1stBoss
--�ޯ�h�����ˬd����Ĳ�o��script�A�˵��ۦ��ɰȥ��n�S�O�`�N
--////////////////////////////////////////////////////////////
function AI_703101_lua_27in_boss1_BeginAttack()--begin fight plot
	local boss=OwnerID();
	local room=ReadRoleValue(boss,EM_RoleValue_RoomID);
	local x,y,z,dir=DW_Location(boss);
	local ctrl=CreateObj(110987,x,y,z,dir,1);
	SetModeEx(ctrl,EM_SetModeType_Show,false);
	SetModeEx(ctrl,EM_SetModeType_Mark,false);
	SetModeEx(ctrl,EM_SetModeType_ShowRoleHead,false);
	AddToPartition(ctrl,room);
	CallPlot(ctrl,"lua_27in_boss1_tokenRULE",boss);
	BeginPlot(ctrl,"AI_703101_lua_27in_boss1_main",0);
end

function AI_703101_lua_27in_boss1_main()--main loop
	local ctrl=OwnerID();
	local boss=TargetID();
	local room=ReadRoleValue(boss,EM_RoleValue_RoomID);
	local zone=ReadRoleValue(boss,EM_RoleValue_ZoneID);
	--�����l��
	Global_27in_1stBoss=Global_27in_1stBoss or {};
	Global_27in_1stBoss[room]={};
	--�ɶ��ܼ�
	local GCD=0;
	local increase=0;
	local countDOWN={
				summon_treasureBox = 30;--5 , 5 , 25
				summon_greed = 30;
				summon_resentment=480;
				summon_hatred=12;
				choose_prisoner=20;
				ranATK=7;
				fury=481;
					};
	--�ޯ�]�w�M��
	local cage_num=1;
	if(zone==157)then cage_num=1;end
	
	
	
	--����M��(�����ܼ�)
	Global_27in_1stBoss[room].boss={
					guid=boss;
					status="normal";
					buff=0;
					phase=1;
								};--initial global
	Global_27in_1stBoss[room].greed_ghost={};--initial global
	Global_27in_1stBoss[room].resentment={};--initial global
	Global_27in_1stBoss[room].PlayerInHateList={};--initial global
	--cage�Mprisoner�O����table, index�O�������s
	Global_27in_1stBoss[room].cage={};--initial global
	Global_27in_1stBoss[room].prisoner={};--initial global
	

	--�㹳�X�l
	local emptyFLAG={};
	Global_27in_1stBoss[room].flag={}--initial global
	if(#emptyFLAG==0)then
		for flag_spot=1,GetMoveflagCount(781345)-1,1 do
			Global_27in_1stBoss[room].flag[flag_spot]={
									sn=flag_spot;
									status="empty";		};
			table.insert(emptyFLAG,flag_spot);
		end
	end
	
	--�_��
	Global_27in_1stBoss[room].treasure={}--initial global
	for i=1,6,1 do
		Global_27in_1stBoss[room].treasure[i]={
							status="none";--none,box,buff,countdown,trap,del
							guid=0;--guid;
							changer=0;--record GUID of final mover
							note="none";
									};
		if(#emptyFLAG==0)then
			--���m�X�l���A
			for flag_spot=1,GetMoveflagCount(781345)-1,1 do
				Global_27in_1stBoss[room].flag[flag_spot]={
										sn=flag_spot;
										status="empty";		};
				table.insert(emptyFLAG,flag_spot);
			end
		end
		--�_�ê즸�إ�
		local r=DW_Rand(#emptyFLAG);
		local sn=table.remove(emptyFLAG,r);
		Global_27in_1stBoss[room].flag[sn].status="occupy";
		local x,y,z,dir=DW_Location(781345,sn);
		local b=CreateObj(108154,x,y,z,dir,1);
		AddToPartition(b,room);
		SetPlot(b,"touch","lua_27in_boss1_box_touchplot",40);
		SetCursorType(b,eCursor_FurnitureRorare);
		CallPlot(b,"lua_27in_boss1_tokenRULE",ctrl);
		PlayMotionEX(b,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP);
		SetDefIdleMotion(b,ruFUSION_MIME_ACTIVATE_LOOP);
		
		Global_27in_1stBoss[room].treasure[i].guid=b;
		Global_27in_1stBoss[room].treasure[i].status="box";
		Global_27in_1stBoss[room].treasure[i].changer=ctrl;
		Global_27in_1stBoss[room].treasure[i].note="first create";
		Global_27in_1stBoss[room].treasure[i].safe=true;
		Global_27in_1stBoss[room].treasure[i].countdown=0;
		DebugMsg(0,room,"No. "..i.." status -> box by create from ctrl");
		WriteRoleValue(b,EM_RoleValue_PID,i);
	end
	local effective_treasure_num=#Global_27in_1stBoss[room].treasure;
	--��L�ίS��
	local cooperation_value=0;
	local function broadcast_room(msg_type,msg,msg_color)--�i���Ҧ��bPlayer List�������a(�}�Ǥ��b��)
		if(msg_type==nil)or(msg==nil)then
			DebugMsg(0,room,"msg setting error");
			return false;
		end
		if(msg_type==2)then
			msg="[$MUTE]"..msg;
		end
		if(msg_color==nil)then
			msg_color=0;
		end
		for i=#Global_27in_1stBoss[room].PlayerInHateList,1,-1 do
			ScriptMessage(ctrl,Global_27in_1stBoss[room].PlayerInHateList[i].guid,msg_type,msg,msg_color);
		end
	end
	--����
	local x,y,z,dir=DW_Location(781346,4);
	local door=CreateObj(106249,x,y,z,dir,1);
	SetModeEx(door,EM_SetModeType_Obstruct,true);
	SetModeEx(door,EM_SetModeType_Show,true);
	SetModeEx(door,EM_SetModeType_Mark,false);
	SetModeEx(door,EM_SetModeType_ShowRoleHead,false);
	DW_UnFight(door,true);
	AddToPartition(door,room);
	CallPlot(door,"lua_27in_boss1_tokenRULE",ctrl);
	
	ScriptMessage(boss,0,2,"[$MUTE]".."[SC_27IN_BOSS1_START]",0);--�o�ѵL�Ʈ��s�F��c���������Ǫ��`�N��A�A�u�L�̡v���N���A���}�l���ʳo�d�G���L�����j......
	
	local Sign_reset=false;
	while(true)do
		--���ݧP�_(����B�@)
		for i=1,cage_num,1 do
			if(Global_27in_1stBoss[room].prisoner[i]~=nil)and(Global_27in_1stBoss[room].prisoner[i].release==true)then
				CancelBuff_NoEvent(Global_27in_1stBoss[room].prisoner[i].guid,624820);
				SysCastSpellLv(Global_27in_1stBoss[room].prisoner[i].guid,boss,499110,0);
			end
		end
		sleep(10);
	--reset
		--���a���
		for i=1,#Global_27in_1stBoss[room].PlayerInHateList,1 do
			Global_27in_1stBoss[room].PlayerInHateList[i].legal=false;
		end
		--���a���ļ�=���뤤���a�H��-�}��
		local effective_player=0;
		--�_�æ��ļ�
		effective_treasure_num=0;
	--keep
		--�ɶ��ܼ�
		increase=increase+1;
		if(GCD>0)then
			GCD=GCD-1;
		end
		for i,sec in pairs(countDOWN)do
			if(sec>0)then
				countDOWN[i]=sec-1;
			end
		end
		--Boss���q(��q��40% ����)
		if(CheckID(boss)==false)or(ReadRoleValue(boss,EM_RoleValue_IsDead)==1)then
			--���\����boss
			broadcast_room(2,"[SC_27IN_BOSS1_END]",C_LightBlue);--�u�ڭ̡v......�ש���o�Ѳ�A�u�O�i���F���ǰ]�_�ڡI
			break;
		end
		if(Global_27in_1stBoss[room].boss.phase==1)and(DW_GetHPpercent(boss)<=40)then
			Global_27in_1stBoss[room].boss.phase=2;
			broadcast_room(0,"[SC_27IN_BOSS1_PHASE2]",C_RED);--�A��������u�L�̡v���S���F......
		end
		if(countDOWN.fury==1)then
			AddBuff(boss,624632,0,-1);
		end
		--���a���
		local Hate1st_point=0;
		local Hate1st_pos=0;
		local Hate1st_ID=0;
		local Hate1st_sort=0;
		local n=HateListCount(boss);
		for pos=n-1,0,-1 do
			local id=HateListInfo(boss,pos,EM_HateListInfoType_GItemID);
			local hatepoint=HateListInfo(boss,pos,EM_HateListInfoType_HatePoint);

			if(ReadRoleValue(id,EM_RoleValue_IsPlayer)==1)then
				effective_player=effective_player+1;
				local max=#Global_27in_1stBoss[room].PlayerInHateList;
				local _pass=false;
				for i=1,max,1 do
					if(Global_27in_1stBoss[room].PlayerInHateList[i].guid==id)then
						--�q�L�{��
						Global_27in_1stBoss[room].PlayerInHateList[i].legal=true;
						Global_27in_1stBoss[room].PlayerInHateList[i].hate_point=hatepoint;
						_pass=i;
						break;
					end
				end
				if(_pass==false)then
					--����ؼФ��btable���A�s�W���a���
					_pass=max+1;
					Global_27in_1stBoss[room].PlayerInHateList[_pass]={guid=id;overload=0;legal=true;hate_point=hatepoint;buff=0};
					--DebugMsg(0,room,"player:"..id.." add to list.");
				end
				--�}�c����ǻ�
				local _isprisoner=false;
				for i=1,cage_num,1 do
					if(Global_27in_1stBoss[room].prisoner[i]~=nil)and(id==Global_27in_1stBoss[room].prisoner[i].guid)then
						if(Global_27in_1stBoss[room].prisoner[i].release==true)then
							--�Q����
							ScriptMessage(boss,id,0,"[SC_27IN_BOSS1_RELEASE]",C_YELLOW);--�A���\�q�cŢ���k�F�X�ӡI
							CancelBuff_NoEvent(id,624820);
							SetHateListPoint(boss,pos,(Global_27in_1stBoss[room].prisoner[i].hate_point)+hatepoint);
							Global_27in_1stBoss[room].PlayerInHateList[_pass].hate_point=HateListInfo(boss,pos,EM_HateListInfoType_HatePoint);
							--�}�Ǹ�ƲM��
							Global_27in_1stBoss[room].prisoner[i]={};
							break;
						else
							--������A�����b�C��
							_isprisoner=true;
							SetHateListPoint(boss,pos,0);
							effective_player=effective_player-1;--��h�}�ǤH��
							--DebugMsg(0,room,"player:"..Global_27in_1stBoss[room].PlayerInHateList[_pass].guid.." in prisoner.");
							table.remove(Global_27in_1stBoss[room].PlayerInHateList,_pass);
							break;
						end
						
					end
				end
				if(_isprisoner==false)then
					if(hatepoint>Hate1st_point)then
						Hate1st_point=hatepoint;
						Hate1st_pos=pos;
						Hate1st_ID=id;
						Hate1st_sort=_pass;
					end
				end
			end
		end
		if(true)then
			--�簣���X�k�����a���
			for i=#Global_27in_1stBoss[room].PlayerInHateList,1,-1 do
				if(Global_27in_1stBoss[room].PlayerInHateList[i].legal==false)or(CheckBuff(Global_27in_1stBoss[room].PlayerInHateList[i].guid,624820)==true)then
					DebugMsg(0,room,"player:"..Global_27in_1stBoss[room].PlayerInHateList[i].guid.." is out.");
					table.remove(Global_27in_1stBoss[room].PlayerInHateList,i);
				end
			end
		end
		--���Ī��a�Ƥ���(����)
		if(effective_player==0)then
			DebugMsg(0,room,"effective player is not enough!");
			Sign_reset=true
			break;
		end
		--��߯f�g
		if(Global_27in_1stBoss[room].boss.buff==3)and(increase%3)then
			if(CheckBuff(boss,624825)==true)then
				SysCastSpellLv(boss,boss,851177,0);
			else
				Global_27in_1stBoss[room].boss.buff=0;
			end
		end
		--��i�cŢ
		local _choose=false;
		if(countDOWN.choose_prisoner==0)then
			countDOWN.choose_prisoner=20;
			_choose=true;
			broadcast_room(2,"[SC_27IN_BOSS1_TORMENT]",C_LightBlue);--�u�ڭ̡v�ӧ�i�o�ǥi�����å�p��H
		end
		--�ƨ�ƦC����
		local copy_player_sort={};
		for pos=#Global_27in_1stBoss[room].PlayerInHateList,1,-1 do
			copy_player_sort[pos]=pos;
		end
		if(cage_num>#copy_player_sort)then
			--�ƩZ����
			table.remove(copy_player_sort,Hate1st_sort);
		end
		for i=1,cage_num,1 do
			for __=1,1,1 do
				--�cŢ���A
				local reborn=false;
				if(Global_27in_1stBoss[room].cage[i]==nil)then
					if(_choose==true)then reborn=true;else break;end
				elseif(CheckID(Global_27in_1stBoss[room].cage[i].guid)==false)or(ReadRoleValue(Global_27in_1stBoss[room].cage[i].guid,EM_RoleValue_IsDead)==1)then
					--�R���cŢ
					--�w������(����ߧY���ܪ��A)
					Global_27in_1stBoss[room].prisoner[i].release=true;
					DelObj(Global_27in_1stBoss[room].cage[i].guid);
					Global_27in_1stBoss[room].cage[i]=nil;
					
					if(_choose==true)then reborn=true;else break;end
				end
				if(reborn==true)then
					--���ͨcŢ
					local x,y,z,dir=DW_Location(781346,i);
					local _cage=CreateObj(108149,x,y+40,z,dir,1);
					SetModeEx(_cage,EM_SetModeType_Obstruct,true);
					SetModeEx(_cage,EM_SetModeType_Gravity,false);
					SetModeEx(_cage,EM_SetModeType_Strikback,false);
					SetModeEx(_cage,EM_SetModeType_Searchenemy,false);
					AddToPartition(_cage,room);
					CallPlot(_cage,"lua_27in_boss1_tokenRULE",boss);
					Global_27in_1stBoss[room].cage[i]={guid=_cage};
				end
				--�}�Ǫ��A
				local who=Global_27in_1stBoss[room].cage[i].prisoner;
				if(who==nil)or(CheckID(who)==false)or(ReadRoleValue(who,EM_RoleValue_IsDead)==1)then
					--����}
					local r=DW_Rand(#copy_player_sort);r=table.remove(copy_player_sort,r);
					local _prisoner=rawget(Global_27in_1stBoss[room].PlayerInHateList[r],"guid");
					Global_27in_1stBoss[room].cage[i].prisoner=_prisoner;
					Global_27in_1stBoss[room].prisoner[i]={};
					Global_27in_1stBoss[room].prisoner[i].guid=_prisoner;
					Global_27in_1stBoss[room].prisoner[i].hate_point=rawget(Global_27in_1stBoss[room].PlayerInHateList[r],"hate_point");
					AddBuff(_prisoner,624820,0,-1);
					local x,y,z,dir=DW_Location(Global_27in_1stBoss[room].cage[i].guid);
					SetPos(_prisoner,x,y+4,z,dir);
					
					for time=1,Global_27in_1stBoss[room].PlayerInHateList[r].buff,1 do
						for _treasure=1,#Global_27in_1stBoss[room].treasure,1 do
							if(Global_27in_1stBoss[room].treasure[_treasure].guid==_prisoner)then
								Global_27in_1stBoss[room].treasure[_treasure].guid=0;
								Global_27in_1stBoss[room].treasure[_treasure].status="countdown";
								Global_27in_1stBoss[room].treasure[_treasure].changer=Global_27in_1stBoss[room].cage[i].guid;
								Global_27in_1stBoss[room].treasure[_treasure].note="become prisoner";
								Global_27in_1stBoss[room].treasure[_treasure].countdown=5;--5����
								DebugMsg(_prisoner,room,"No. ".._treasure.." status -> countdown by become_prisoner from cage");
								break;
							end
						end
					end
					CancelBuff_NoEvent(_prisoner,624780);
					
					if(#copy_player_sort==0)then
						DebugMsg(0,room,"�H�Ƥ����h���P����")
						Sign_reset=true;
						break;
					end
				end
				--�ˮ`
				if(increase%3==0)then
					SysCastSpellLv(Global_27in_1stBoss[room].cage[i].guid,Global_27in_1stBoss[room].cage[i].prisoner,851175,0);
				end
			end
			if(Sign_reset==true)then break;end
		end
		if(Sign_reset==true)then break;end
		--�_��
		local useless=0;
		if(countDOWN.summon_treasureBox == 0)then
			for i=1,#Global_27in_1stBoss[room].treasure,1 do
				if(Global_27in_1stBoss[room].treasure[i].status=="countdown")and(Global_27in_1stBoss[room].treasure[i].countdown==0)then
					if(#emptyFLAG==0)then
						--���m�X�l���A
						for flag_spot=1,GetMoveflagCount(781345)-1,1 do
							Global_27in_1stBoss[room].flag[flag_spot]={
													sn=flag_spot;
													status="empty";		};
							table.insert(emptyFLAG,flag_spot);
						end
					end
					--�_�í���
					local r=DW_Rand(#emptyFLAG);
					local sn=table.remove(emptyFLAG,r);
					Global_27in_1stBoss[room].flag[sn].status="occupy";
					local x,y,z,dir=DW_Location(781345,sn);
					local b=CreateObj(108154,x,y,z,dir,1);
					AddToPartition(b,room);
					SetPlot(b,"touch","lua_27in_boss1_box_touchplot",40);
					SetCursorType(b,eCursor_FurnitureRorare);
					CallPlot(b,"lua_27in_boss1_tokenRULE",ctrl);
					PlayMotionEX(b,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP);
					SetDefIdleMotion(b,ruFUSION_MIME_ACTIVATE_LOOP);
					
					Global_27in_1stBoss[room].treasure[i].guid=b;
					Global_27in_1stBoss[room].treasure[i].status="box";
					Global_27in_1stBoss[room].treasure[i].changer=ctrl;
					Global_27in_1stBoss[room].treasure[i].note="regrow";
					Global_27in_1stBoss[room].treasure[i].safe=true;
					Global_27in_1stBoss[room].treasure[i].countdown=0;
					DebugMsg(0,room,"No. "..i.." status -> box by reset from ctrl");
					WriteRoleValue(b,EM_RoleValue_PID,i);
				elseif(Global_27in_1stBoss[room].treasure[i].status=="countdown")then
					local _cd=Global_27in_1stBoss[room].treasure[i].countdown;
					Global_27in_1stBoss[room].treasure[i].countdown=_cd-1;
				end
				if(Global_27in_1stBoss[room].treasure[i].status=="buff")or(Global_27in_1stBoss[room].treasure[i].status=="box")then
					effective_treasure_num=effective_treasure_num+1;
				end
				if(Global_27in_1stBoss[room].treasure[i].status=="del")then
					useless=useless+1;
				end
			end
			countDOWN.summon_greed = 5;--generate after 5 sec 
		end
		--�_�í��;���
		if useless==6 then
			for i=1,6,1 do
				Global_27in_1stBoss[room].treasure[i].status="countdown";
				Global_27in_1stBoss[room].treasure[i].countdown=0;
			end
		end
		--�g���ۼv (greed_ghost)
		local d=effective_treasure_num-#Global_27in_1stBoss[room].greed_ghost;
		if(d>0)and(countDOWN.summon_greed==0)then
			for i=1,d,1 do
				local x,y,z,dir=DW_Location(boss);
				local g=CreateObj(108151,x,y,z,dir,1);
				AddToPartition(g,room);
				CallPlot(g,"lua_27in_boss1_tokenRULE",ctrl);
				Global_27in_1stBoss[room].greed_ghost[#Global_27in_1stBoss[room].greed_ghost+1]={guid=g};
			end
			countDOWN.summon_greed = 30;
			countDOWN.summon_treasureBox = 25;--another cycle
			broadcast_room(2,"[SC_27IN_BOSS1_GREED]",C_LightBlue);--�ڪ��]�_�I�ڪ��I�ڪ��I......�u�ڭ̡v���]�_�I
		end
		for i=#Global_27in_1stBoss[room].greed_ghost,1,-1 do
			for __=1,1,1 do--���P�_
			if(CheckID(Global_27in_1stBoss[room].greed_ghost[i].guid)==false)or(ReadRoleValue(Global_27in_1stBoss[room].greed_ghost[i].guid,EM_RoleValue_IsDead)==1)then
				table.remove(Global_27in_1stBoss[room].greed_ghost,i);
				break;
			end
			if(Global_27in_1stBoss[room].greed_ghost[i].target~=nil)then
				local who=Global_27in_1stBoss[room].greed_ghost[i].target;
				if(CheckID(who)==true)and(ReadRoleValue(who,EM_RoleValue_IsDead)==0)and(CheckBuff(who,624820)==false)and(CheckBuff(who,624780)==true)then
					--�ؼФ��b
					break;
				else
					local _n=Global_27in_1stBoss[room].greed_ghost[i].pegging;
					Global_27in_1stBoss[room].greed_ghost[i].pegging=nil;
					Global_27in_1stBoss[room].treasure[_n].safe=true;
					Global_27in_1stBoss[room].greed_ghost[i].target=nil;
				end
			end
			--���a�u��(buff���A)
			for j=1,6,1 do
				if(Global_27in_1stBoss[room].treasure[j].status=="buff")and(Global_27in_1stBoss[room].treasure[j].safe==true)then
					SetAttack(Global_27in_1stBoss[room].greed_ghost[i].guid,Global_27in_1stBoss[room].treasure[j].guid);
					rawset(Global_27in_1stBoss[room].greed_ghost[i],"target",Global_27in_1stBoss[room].treasure[j].guid);
					Global_27in_1stBoss[room].treasure[j].safe=false;
					Global_27in_1stBoss[room].greed_ghost[i].pegging=j;
					break;
				end
			end
			if(Global_27in_1stBoss[room].greed_ghost[i].target~=nil)then break;end
			--�����_�c
			for j=1,6,1 do
				if(Global_27in_1stBoss[room].treasure[j].status=="box")and(Global_27in_1stBoss[room].treasure[j].safe==true)then
					SetAttack(Global_27in_1stBoss[room].greed_ghost[i].guid,Global_27in_1stBoss[room].treasure[j].guid);
					rawset(Global_27in_1stBoss[room].greed_ghost[i],"target",Global_27in_1stBoss[room].treasure[j].guid);
					Global_27in_1stBoss[room].treasure[j].safe=false;
					Global_27in_1stBoss[room].greed_ghost[i].pegging=j;
					break;
				end
			end
			
			if(Global_27in_1stBoss[room].greed_ghost[i].target==nil)then
				--�S���ؼХi����
				DelObj(Global_27in_1stBoss[room].greed_ghost[i].guid);
				table.remove(Global_27in_1stBoss[room].greed_ghost,i);
			else
				--����l��
				SetAttack(Global_27in_1stBoss[room].greed_ghost[i].guid,Global_27in_1stBoss[room].greed_ghost[i].target);
			end
			end
		end
		--�������(�w�t�p��)
		if(#Global_27in_1stBoss[room].resentment<=6)and(countDOWN.summon_resentment==0)then
			broadcast_room(2,"[SC_27IN_BOSS1_RESENTMENT]",C_LightBlue);--���L�I���L�[�J�u�ڭ̡v......
			for resentment_num=1,12,1 do
				local x,y,z,dir=DW_Location(boss);
				local _resentment=CreateObj(108152,x,y,z,dir,1);
				--���A�]�w
				AddToPartition(_resentment,room);
				CallPlot(_resentment,"lua_27in_boss1_tokenRULE",ctrl);
				LockHP(_resentment,1,"lua_27boss1_resentment_lockHP");
				Global_27in_1stBoss[room].resentment[#Global_27in_1stBoss[room].resentment+1]={guid=_resentment;target=0;};
			end
			countDOWN.summon_resentment=20;
		end
		local max_i=#Global_27in_1stBoss[room].resentment;
		for i=#Global_27in_1stBoss[room].resentment,1,-1 do
			for __=1,1,1 do
				if(CheckID(Global_27in_1stBoss[room].resentment[i].guid)==false)or(ReadRoleValue(Global_27in_1stBoss[room].resentment[i].guid,EM_RoleValue_IsDead)==1)then
					--������馺�`
					table.remove(Global_27in_1stBoss[room].resentment,i);
					--DebugMsg(0,room,"resentment "..i.." is gone.")
					break;
				end
				local who=Global_27in_1stBoss[room].resentment[i].target;
				if(CheckID(who)==false)or(ReadRoleValue(who,EM_RoleValue_IsDead)==1)or(CheckBuff(who,624820)==true)then
					--�ؼЮ���
					Global_27in_1stBoss[room].resentment[i].target=nil;
					local _pass=false;
					for k=1,max_i,1 do
						for j=1,#Global_27in_1stBoss[room].PlayerInHateList,1 do
							if(Global_27in_1stBoss[room].PlayerInHateList[j].overload<=k)then
								local _k=Global_27in_1stBoss[room].PlayerInHateList[j].overload
								Global_27in_1stBoss[room].PlayerInHateList[j].overload=_k+1;
								Global_27in_1stBoss[room].resentment[i].target=rawget(Global_27in_1stBoss[room].PlayerInHateList[j],"guid");
								SetAttack(Global_27in_1stBoss[room].resentment[i].guid,Global_27in_1stBoss[room].resentment[i].target);
								_pass=true;
								break;
							end
						end
						if(_pass==true)then break;end
					end
				end
				if(Global_27in_1stBoss[room].resentment[i].target==nil)then
					DebugMsg(0,room,"resentment "..i.." can't get target.")
					--�L�k���o�X�k�ؼ�
					DelObj(Global_27in_1stBoss[room].resentment[i].guid);
					table.remove(Global_27in_1stBoss[room].resentment,i);
					break;
				else
					--����l��
					SetAttack(Global_27in_1stBoss[room].resentment[i].guid,Global_27in_1stBoss[room].resentment[i].target);
				end
			end
		end
	--cast
		for once=1,1,1 do
			if(GCD~=0)then break;end
			--���^�]�_(�ľW)
			local _charge=false;
			for _player=1,#Global_27in_1stBoss[room].PlayerInHateList,1 do
				if(Global_27in_1stBoss[room].PlayerInHateList[_player].buff>=2)then
					ScriptMessage(boss,Global_27in_1stBoss[room].PlayerInHateList[_player].guid,2,"[$MUTE]".."[SC_27IN_BOSS1_CHARGE]",C_LightBlue);--��X�ӡI
					CastSpell(boss,Global_27in_1stBoss[room].PlayerInHateList[_player].guid,851178);
					GCD=3;
					_charge=true;
					break;
				end
			end
			if(_charge==true)then break;end
			--�s���N(hatred)
			if(Global_27in_1stBoss[room].boss.phase==2)and(countDOWN.summon_hatred==0)then
				countDOWN.summon_hatred=12;
				GCD=3;
				CastSpell(boss,boss,851189);
				broadcast_room(2,"[SC_27IN_BOSS1_HATRED]",C_LightBlue);--�������...�u�ڭ̡v�I������u�ڭ̡v�n�Q�x�b�o�̡I
				break;
			end
			--�H���ۦ�
			if(countDOWN.ranATK==0)then
				countDOWN.ranATK=7;
				local r=DW_Rand(1000)+cooperation_value;
				if(r>500)then
					cooperation_value=cooperation_value-150
					--�κj�H����3~6�ӤH�AP2�|���[����4��C
					CastSpellLv(boss,boss,851179,1);
					GCD=3;
				else
					cooperation_value=cooperation_value+150
					--���s�M�Ӥ@��A�b�|75����A�I�k�T��A�i�Իݭn�{���AP2���[Dot8��C
					CastSpellLv(boss,boss,851190,1);
					GCD=5;
				end
			end
		end
	end
	DelObj(door);
	DebugMsg(0,room,"�j�鵲��");
	--�O�_�Աѭ��m
	if(Sign_reset==true)then
		DebugMsg(0,room,"���m");
		--�_��
		for i=1,#Global_27in_1stBoss[room].treasure,1 do
			if(Global_27in_1stBoss[room].treasure[i].status=="box")then
				DelObj(Global_27in_1stBoss[room].treasure[i].guid);
			end
		end
		--�g���ۼv
		for i=1,#Global_27in_1stBoss[room].greed_ghost,1 do
			if(Global_27in_1stBoss[room].greed_ghost[i].guid~=nil)then
				DelObj(Global_27in_1stBoss[room].greed_ghost[i].guid);
			end
		end
		--�������
		for i=1,#Global_27in_1stBoss[room].resentment,1 do
			if(Global_27in_1stBoss[room].resentment[i].guid~=nil)then
				DelObj(Global_27in_1stBoss[room].resentment[i].guid);
			end
		end
		--�}��
		for i=1,cage_num,1 do
			if(Global_27in_1stBoss[room].cage[i]==nil)then
				break;
			elseif(CheckID(Global_27in_1stBoss[room].prisoner[i].guid)==true)and(ReadRoleValue(Global_27in_1stBoss[room].prisoner[i].guid,EM_RoleValue_IsDead)==0)then
				--�ԱѮɦb�}�c�̪��@�߱���
				ScriptMessage(boss,Global_27in_1stBoss[room].prisoner[i].guid,1,"[SC_27IN_BOSS1_EXECUTE]",0);--�u�L�̡v���h�F��i�A������A��O���`���{��A���Y�W...
				SysCastSpellLv(Global_27in_1stBoss[room].cage[i].guid,Global_27in_1stBoss[room].prisoner[i].guid,851176,0);
				WriteRoleValue(Global_27in_1stBoss[room].cage[i].guid,EM_RoleValue_LiveTime,1);
			end
		end
		--���}�԰�
		DW_UnFight(boss,true);
		SetStopAttack(boss);
		sleep(50);
		DW_UnFight(boss,false);
	end
	--�������������q����
	DelObj(ctrl);
end
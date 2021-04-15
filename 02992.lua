function lua_27in_BOSS7_InCombat()--7���i�J�԰�
	local boss=OwnerID();
	local room=ReadRoleValue(boss,EM_RoleValue_RoomID);
	
	local x,y,z,dir=DW_Location(boss);
	local Ctrl=CreateObj(110987,x,y,z,dir,1);
	SetModeEx(Ctrl,EM_SetModeType_ShowRoleHead,false);
	SetModeEx(Ctrl,EM_SetModeType_Show,false);
	SetModeEx(Ctrl,EM_SetModeType_Mark,false);
	DW_UnFight(Ctrl,true);
	AddToPartition(Ctrl,room);
	BeginPlot(Ctrl,"lua_27in_BOSS7_Ctrl",0);
end
function lua_27in_BOSS7_Ctrl()--7��������
	local Ctrl=OwnerID();
	local boss=TargetID();
	local room=ReadRoleValue(boss,EM_RoleValue_RoomID);
	local zone=ReadRoleValue(boss,EM_RoleValue_ZoneID);
	
	--���ת�
	local Gate={};
	for pos=1, 1, 1 do
		local x,y,z,dir=DW_Location(781331,pos);
		local d=CreateObj(106249, x,y,z,dir,1);
		SetModeEx(d,EM_SetModeType_ShowRoleHead,false);
		SetModeEx(d,EM_SetModeType_Mark,false);
		SetModeEx(d,EM_SetModeType_Obstruct,true);
		SetModeEx(d,EM_SetModeType_Show,true);
		SetModeEx(d,EM_SetModeType_Strikback,false);
		SetModeEx(d,EM_SetModeType_Move,false);
		SetModeEx(d,EM_SetModeType_Searchenemy,false);
		SetModeEx(d,EM_SetModeType_Fight,false);
		AddToPartition(d,room);
		CallPlot(d,"lua_27in_BOSS7_tokenRULE",boss);
		Gate[pos]=d;
	end
	
	--�_�c�Ǹ��
	local box={};
	local usualbox={};
	local dyingbox={};
	--������(���y)
	local ball={};
	
	--�ɶ����
	-----------------
	--�֭p��
	local time=0;
	--�����
	local countDOWN	={
				ranATK=9;	--�H���I��G�F���z�uor���F��q
				weaked=21;	--���F�G�N
				soulBOMB=0;	--�F���z�u�z��
				fury=361;	--�g�ɾ���
							};
	if(zone==157)then countDOWN.fury=481;end
	--�����
	local GCD=0;
	local StringCD=2;--�r�궡�j

	--���a���
	local PlayerList={};
	local HateList={};
	local totalplayer=0;

	--�r����
	local string_call=2;
	local fury_course=false;if(zone==159)then fury_course=true;end

	--�ƨ禡
	local function broad_cast(msg_type,msg,msg_color)--�b���a�C��̪��H���|����T��
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
		for player,_table in pairs(PlayerList)do
			ScriptMessage(player,player,msg_type,msg,msg_color);
		end
	end
	local function room_broadcast(msg_type,msg,msg_color)--�b�P�@�h���H���|����T��
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
		local n=SetSearchAllNPC(room);
		for i=1,n,1 do
			local player=GetSearchResult();
			ScriptMessage(player,player,msg_type,msg,msg_color);
		end
	end
	local function boss_become_stronger(box_table,i)--�j��boss
		CancelBuff_NoEvent(box_table[i].guid,624622);--�������F��S��
		--boss stronger
		DW_AddHPpercent(boss,5);
		local BUFFid={624636,624637,624638};
		AddBuff(boss,BUFFid[box_table[i].BUFFtype],box_table[i].BUFFlv,-1);
		--effect	
		local x,y,z,dir=DW_Location(box_table[i].guid);
		local __=CreateObj(107873,x,y,z,dir,1);
		DW_UnFight(__,true);
		SetModeEx(__,EM_SetModeType_Mark,false);
		SetModeEx(__,EM_SetModeType_ShowRoleHead,false);
		SetModeEx(__,EM_SetModeType_HideName, true)
		WriteRoleValue(__,EM_RoleValue_LiveTime,2);
		AddToPartition(__,room);
		SysCastSpellLv(__,boss,851056,0);--�F��o�g�S��
		--�r�����
		if(StringCD==0)then
			StringCD=3;
			local r=DW_Rand(100);
			if(r>50)then
				broad_cast(2,"[SC_27IN_BOSS7_BAD1]",C_LightBlue);--��w���n���G�o�ˬO�S�Ϊ��A�A�o�������F��ۦ�촲�C
			else
				broad_cast(2,"[SC_27IN_BOSS7_BAD2]",C_LightBlue);--��w���n���G�Y���ֲz�F�įS�o��o���F��A���u�|�V�ӶV�j�j
			end
		end
		
	end
	local function rand_pick(num)--�H���D��num�W���a
		local playertable={};--index�̧�value���aGUID
		local n=num;if(n<totalplayer)then n=totalplayer;end
		for id,__ in pairs(PlayerList)do
			table.insert(playertable,id);
		end
		if(n>num)then
			for round=1,n-3,1 do
				local r=DW_Rand(#playertable);
				table.remove(playertable,r);
			end
		end
		return playertable;
	end
	
	room_broadcast(2,"[SC_27IN_BOSS7_START1]",0);--��A����o���H�y�j��ɡA�@�Өk�ʪ��n���q�����W�Ǩ�......
	
	sleep( 30 );
	--�԰��j��
	while true do
	--RESET
		HateList={};
		PlayerList={};

		_HateListGuidInOrder = {};
		
	--KEEP
		sleep(10);
		
		--�ɶ����
		time=time+1;
		
		if(GCD>0)then GCD=GCD-1;end
		if(StringCD>0)then StringCD=StringCD-1;end
		for __,cd in pairs(countDOWN)do
			if(cd>0)then
				countDOWN[__]=cd-1;
			end
		end
		
		--�������a���
		local n=HateListCount(boss);
		totalplayer=0;
		for pos=0,n-1,1 do
			local id=HateListInfo(boss,pos,EM_HateListInfoType_GItemID);
			local point=HateListInfo(boss,pos,EM_HateListInfoType_HatePoint);
			--HateList(�Ҧ�����ؼ�)
			HateList[id]={
					pos=pos;
					point=point;
							};
			
			table.insert( _HateListGuidInOrder , id );
			--PlayerList(�ȭ����a)
			if ReadRoleValue(id,EM_RoleValue_IsPlayer)==1 then
				PlayerList[id]={
						pos=pos;
						point=point;
								};
				totalplayer=totalplayer+1;
			end
		end
		if(totalplayer<=0)then break;end
				
		--�r�����
		if(StringCD==0)then
			if(string_call==2)then
				broad_cast(0,"[SC_27IN_BOSS7_START2]",C_LightBlue);--�k�ʪ��n���G�x�H�ֲz�F�įS��򦨤F�o�ӼҼˡH�ݨӡA�w�g�L�F�ܤ[���ɶ���......
				StringCD=3;string_call=3;
			elseif(string_call==3)then
				broad_cast(0,"[SC_27IN_BOSS7_START3]",C_LightBlue);--�k�ʪ��n���G�D�Ԫ̡̭A�ܰ�������A�̡C�ڬO�շҪ��]�p�̡A�Һ���ĥ����w�C
				StringCD=3;string_call=4;
			elseif(string_call==4)then
				broad_cast(0,"[SC_27IN_BOSS7_START4]",C_LightBlue);--��w���n���G�O��ߡA�ڦ��w���h�A�o�n�����۩�s���ڭ쥻�N�Ѫ��Ť�
				StringCD=3;string_call=5;
			elseif(string_call==5)then
				broad_cast(0,"[SC_27IN_BOSS7_START5]",C_LightBlue);--��w���n���G�o���շҳ̪�ëD�p���A�O�o�ǥ��Ѫ̪��F��y���F���ܡH
				StringCD=4;string_call=6;
			elseif(string_call==6)then
				broad_cast(0,"[SC_27IN_BOSS7_START6]",C_LightBlue);--���I���N�N���N���]�L���A�ݬݧA�O�_����歱�ﱵ�U�Ӫ��շҡH
				StringCD=4;string_call=7;
			elseif(string_call==7)then
				broad_cast(0,"[SC_27IN_BOSS7_START7]",C_LightBlue);--�o�u�O�Ĥ@�����C�Q�n�ڪ��]�_�ܡH����A�o�����Ҧ����շҤ~��C
				StringCD=3;string_call=8;
			end
		end
		
		--�l��p��(per 20 sec)
		if(time%20==0)and((#usualbox+#dyingbox)<1)then
			local pos=2;
			for i=1,2,1 do
				local x,y,z,dir=DW_Location(781331,pos+i);--�q�X�l�i��l��(�q���~�]�i��)
				local b=CreateObj(107872,x,y,z,dir,1);
				AddToPartition(b,room);
				CallPlot(b,"lua_27in_BOSS7_tokenRULE",Ctrl);
				--Data record
				local boxDATA={
						guid=b;
						BUFFtype=DW_Rand(3);
						BUFFlv=0;
						};
				box[b]=boxDATA;table.insert(usualbox,boxDATA);
				--set
				AddBuff(b,624622,0,-1);--������ˮ`
				--boss, shield open
				if(CheckBuff(boss,624627)==false)then AddBuff(boss,624627,0,-1);end--�Ϯg��
				for player,__ in pairs(PlayerList) do
					SysCastSpellLv(player,b,499110,0);
				end
			end
			--�r��
			if(StringCD==0)then
				if(string_call==8)then
					broad_cast(2,"[SC_27IN_BOSS7_CALL1]",C_LightBlue);--��w���n���G�o�Ǥp�������S�o���¡A�F������I���ٯണ�ѥֲz�F�įS�O�@
					StringCD=3;string_call=9;
				elseif(string_call==9)then
					broad_cast(2,"[SC_27IN_BOSS7_CALL2]",C_LightBlue);--��w���n���G�ݨӳo���F��u���b�ֲz�F�įS���W�A�ڳ]�p���������G�����D�o
					StringCD=3;string_call=10;
				elseif(string_call==10)then
					broad_cast(2,"[SC_27IN_BOSS7_CALL3]",C_LightBlue);--��w���n���G�S���Q�����������Ө����A�A�ۤv�d���a�I
					StringCD=3;string_call=11;
				else
					broad_cast(2,"[SC_27IN_BOSS7_CALL4]",C_LightBlue);--�Q���F���۪������V�A����
					StringCD=3;string_call=11;
				end
			end
		end
		--scan usualbox
		for i=#usualbox,1,-1 do
			local b=usualbox[i].guid;
			if(ReadRoleValue(b,EM_RoleValue_IsDead)==1)then
				DW_AddHPpercent(boss,6); -- �_�c������ BOSS HP +6%
				boss_become_stronger(usualbox,i);
				table.remove(usualbox,i);
			elseif(DW_GetHPpercent(b)<10)then--�c�lHP�C��10%�i����z����
				if(StringCD==0)then
					broad_cast(2,"[SC_27IN_BOSS7_COUNTDOWN]",C_LightBlue);--��w���n���G�`�N�I���F����A�ܱo��í�w�A�O�a�񥦡I
					StringCD=3;
				end
				AddBuff(b,624626,0,-1);--��ܧY�N�z����BUFF

				if not usualbox[i].has_attack_target then

					--lock random hate target;
					local _randTarget = DW_Rand( #_HateListGuidInOrder );
					_randTarget = _HateListGuidInOrder[ _randTarget ];
					SetFollow( b , _randTarget );
					usualbox[i].has_attack_target = true

				end

				local boxDATA={
						guid=b;
						time=11;--�u���bdyingbox���Ϊ��ݩ�
						BUFFtype=usualbox[i].BUFFtype;
						BUFFlv=usualbox[i].BUFFlv;
						_lockOnTarget = _randTarget;
						has_attack_target = usualbox[i].has_attack_target
						}
				table.insert(dyingbox,boxDATA);table.remove(usualbox,i);
			end
		end
		--scan dyingbox
		for i=#dyingbox,1,-1 do
			local b=dyingbox[i].guid;
			if(ReadRoleValue(b,EM_RoleValue_IsDead)==1)then
				DW_AddHPpercent(boss,6); -- �_�c������ BOSS HP +6%
				boss_become_stronger(dyingbox,i);
				table.remove(dyingbox,i);
			else
				--check buff remain time
				local t=dyingbox[i].time;
				if(t<=1)then
					DW_UnFight(b,true);
					SetModeEx(b,EM_SetModeType_Move,false);
					WriteRoleValue(b,EM_RoleValue_LiveTime,2);
					SysCastSpellLv(b,b,851055,0);--�z��
					DW_AddHPpercent(boss,-3); -- �_�c�z����BOSS HP -3%
					table.remove(dyingbox,i);
					SetStopAttack(b);
					PlayMotionEX(b,ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD);
					--�r��
					if(StringCD==0)then
						StringCD=3;
						broad_cast(2,"[SC_27IN_BOSS7_GOOD]",C_LightBlue);--��w���n���G�ܦn�I�S���F��촲�F�I
					end
				else
					if ( dyingbox[i]._lockOnTarget == nil ) then 
						local _randTarget = DW_Rand( #_HateListGuidInOrder );
						_randTarget = _HateListGuidInOrder[ _randTarget ];
						dyingbox[i]._lockOnTarget = _randTarget;
					end

					if not CheckID( dyingbox[i]._lockOnTarget ) then	--redirect to another target if the primary target is gone	131002 K.J. Aris
						local _randTarget = DW_Rand( #_HateListGuidInOrder );
						_randTarget = _HateListGuidInOrder[ _randTarget ];
						dyingbox[i]._lockOnTarget = _randTarget;
					end
					SetFollow( b , dyingbox[i]._lockOnTarget );
					dyingbox[i].time=t-1;
				end
			end
		end
		--scan box
		local timeTOaddbuff=false;
		if(time%3==0)then timeTOaddbuff=true; end
		for b,__ in pairs(box)do
			if(not CheckID(b))or(ReadRoleValue(b,EM_RoleValue_IsDead)==1)then
				box[b]=nil;
			else
				if(timeTOaddbuff)then--3��1��
					local BUFFid={624623,624624,624625};
					AddBuff(b,BUFFid[box[b].BUFFtype],0,-1);
					box[b].BUFFlv=box[b].BUFFlv+1;
				end
			end
		end
		if((#usualbox+#dyingbox)==0)then
			CancelBuff_NoEvent(boss,624627);--�Ϯg��
		end
	--CAST
		--�g�ɾ���
		if(countDOWN.fury==0)and(fury_course==false)then
			AddBuff(boss,624632,0,-1);
			room_broadcast(2,"[SC_27IN_BOSS7_FURY]",C_LightBlue);--��w���n���G�A���G��o���F������S�o�F......
		end
		--�H���P�_�����ۦ�
		for i=1,1,1 do
			if(GCD~=0)then break;end
			if(countDOWN.ranATK~=0)then break;end
			local r=DW_Rand(100);
			if(r>50)then
				--���F��q
				local e=DW_Rand(totalplayer);
				local s=0;
				for player,__ in pairs(PlayerList)do
					s=s+1;
					if(s==e)then
						CastSpellLv(boss,player,851059,0);--���F��q
						GCD=1;countDOWN.ranATK=9;
						break;
					end
				end
			else
				--�F���z�u
				local TEMPplayer={};
				TEMPplayer=rand_pick(3);
				--�ѤU��TEMPplayer���׼ƶq���O�Q�襤�����a
				for __,id in pairs(TEMPplayer)do
					local x,y,z,dir=DW_Location(id);
					local b=CreateObj(107876,x,y,z,dir,1);
					DW_UnFight(b,true);
					SetModeEx(b,EM_SetModeType_Mark,false);
					SetModeEx(b,EM_SetModeType_ShowRoleHead,false);
					WriteRoleValue(b,EM_RoleValue_LiveTime,5);
					AddToPartition(b,room);
					CallPlot(b,"lua_27in_BOSS7_tokenRULE",boss);
					table.insert(ball,b);
				end
				countDOWN.soulBOMB=3;
				GCD=1;countDOWN.ranATK=9;
			end
		end
		if(#ball~=0)and(countDOWN.soulBOMB==0)then
			--�F���z�u���z
			for i,bomb in pairs(ball)do
				SysCastSpellLv(bomb,bomb,851057,1);
				WriteRoleValue(bomb,EM_RoleValue_LiveTime,2);
			end
			ball={};
		end
		--���F�G�N
		for __=1,1,1 do
			if(GCD~=0)then break;end
			if(countDOWN.weaked~=0)then break;end
			GCD=1;countDOWN.weaked=21;
			local TEMPplayer={};
			TEMPplayer=rand_pick(4);
			for __,id in pairs(TEMPplayer)do
				SysCastSpellLv(boss,id,851058,1);
			end
		end
	end
	
	--�Ѱ����ת�
	for pos=1,1,1 do
		DelObj(Gate[pos]);
	end

	--�M��624642���F��qBUFF
	local _RangePlayerTable = SearchRangePlayer( Ctrl , 2000 );
	for _key , _value in pairs( _RangePlayerTable ) do
		CancelBuff_NoEvent( _value , 624642 );--�T�O�M��
	end

	--�T�{���`�άO���}�԰�
	DW_UnFight(boss,true);
	SetStopAttack(boss);
	sleep(50);	
	if CheckID(boss)==false or ReadRoleValue(boss,EM_RoleValue_IsDead)==1 then
		--���\����boss�T��
		room_broadcast(2,"[SC_27IN_BOSS7_END]",C_LightBlue);--��w���n���G�����I�ܳǥX���D�ԡC���A������o�Ѯ�նܡH�ڪ��շҥi���u���o�@���Ӥw�I
		DelObj(Ctrl);
		return;
	end
	
	DW_UnFight(boss,false);
	--���ΰT��
	room_broadcast(2,"[SC_27IN_BOSS7_FAIL]",C_LightBlue);--��w���n���G�S���H�D�ԥ��ѡC�ڳ]�U���շүu���o��x���ܡH
	DelObj(Ctrl);
end
function lua_27in_BOSS7_tokenRULE(Ctrl)--�l�ͪ��W�h�A�H�D�ʦs��
	local token = OwnerID();
	if not Ctrl then
		return false;
	end
	while CheckID(Ctrl) and ReadRoleValue(Ctrl,EM_RoleValue_IsDead)==0 do	
		sleep(20);
	end
	DelObj(token);
end

--[[

�i�J�԰�
���ͤ���
�b�����W����
���}�԰�
�M������


--initial
�Ҧ��p�Ǹ��
���`�p�Ǹ��
�x���p�Ǹ��
�榡�Gindex>>guid�A table>>�ؼСA����C������

�֭p�ɶ�
�ۦ�cd>>���
boss��gcd>>0


���a���
	--reset
	--keep
	�������a���
	�l��p��
		�p�Ǽƶq�[
		�����p�Ǵ�����a�ĪG��buff
		�}�Ϯg��
		�T��@�M�w�p�ǮĪG
		�O���p�Ǹ��
	���˥��`�p��
		�p�Ǧ��`
			^^^f1
			�[boss����
			�ಾ��O���
			����S��
			f�M�Ÿ��(�p�Ǽƶq��
			^^^
		�p�Ǧ�q�Ӥ�
			�����˼ƭp��buff
			��w�Ĥ@����ؼ�
			�����x���p��

	�����x���p��
		�ˬd�p�Ǧs��
			�ˬd��e�ؼ�
			^^^f1
			�[boss����
			�ಾ��O���
			����S��
			f2�M�Ÿ��(�p�Ǽƶq��
			^^^
		�ˬd�˼�buff
			�ˬdbuff�ѤU�ɶ�
				--���z
				�����˼�buff
				sys�z��
				��Boss����
				f2�M�Ÿ��(�p�Ǽƶq��
	���˩Ҧ��p��
		�W�[�p��buff
	�p�Ǽƶq>0
		���Ϯg��
	
	--cast
	ae�ˮ`
	
	�إX���y
	ae�ˮ`
	
	�[buff






--]]
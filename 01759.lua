--[[
���q�����ޯ�C��
	
�����K�l		�i�J�԰���3��	6��	0	�ؼг�H		���骫�z�ˮ`�C
���F��		�i�J�԰���17��	4��	0	������Ҧ��ؼ�	�O��������H�����ӹ�H�����F�񨭪�BUFF�A�@��BUFF�����N�H����ܦA�ɤW�A����5�H�N���ƤWBUFF�C
�l�깲�q		�i�J�԰�	17��	0	�ۤv			����3�����ɹ��q�ӧ���������e�ؼСC
�l����(�L�W		�i�J�԰�	0	0	�ؼг�H		�Y���a����@�ɤ��A���|�缾�a�ľW�����

�������ᦳ55%���v���ͥX�ɫ㪺�U�w��(107183)				
���͵��ݮɶ���8�p�ɡC(�t�έ��ͳW�h�|�۰ʥ[��30%�ɶ�)				

���F�񨭪�BUFF�S��	
	�֦��̤���I�k��������C
	"BUFF�����ɡA����p�G�����a(���W���঳���F��)�A�h�NBUFF�ǬV�����W���a�C
	BUFF�����ɡA�p�G�S���ǬV��H�A�h���ͭ��ɹ��q�ӧ����֦��̡C"
						
	
	���W�Ҧ����ɹ��q�`�Ƥ��|�W�L30���A��30������A�N���|�A���͡C
--]]
--[[
�x�������ޯ�C��
	
	�����K�l		�i�J�԰���3��	6��	0	�ؼг�H		���骫�z�ˮ`�C
	���F��		�i�J�԰���17��	4��	0	������Ҧ��ؼ�	�O��������H�����ӹ�H�����F�񨭪�BUFF�A�@��BUFF�����N�H����ܦA�ɤW�A����5�H�N���ƤWBUFF�C
	�l�깲�q		�i�J�԰�	17��	0	�ۤv			����3���g�����q�ӧ���������e�ؼСC
	�l����(�L�W		�i�J�԰�	0	0	�ؼг�H		�Y���a����@�ɤ��A���|�缾�a�ľW�����
	�g����«		������q�C��97%	���C�l��3%	2(������ʧ@)		�H����1�H(�u��6��)	�s��{�q�A�Ĥ@��R���̨���maxhp20%���ˮ`�A�M��u�������30�X�������a���W�y��maxhp40%�A���Ʀ����̦������A�y��maxhp640%�ˮ`�ɰ���


�g�����q							
	���F���O		�i�J�԰�	4��	0	�ؼг�H		�b�ؼШ��W�|�[�@�h�u�����ܡv�A�C�|�@�h�ͩR�W��-2%

--]]

--�ڶ�������AI�y�{�G
--�ڶ������C�����}�԰��A���@�q���ݪ��ɶ��A�Ҧ����m�ʧ@�b�o�Ӷ��q�i��
--�i�J�԰���A���a�����ڶ��������Z���|����ֿn�A�F��W���Ȥ���A�ڶ������|�����@�W���a�ӭ��m�ֿn���Z���C
--�C5��|�P�_�@���C�Ҧ������a����5�H�����F�񨭪��A�A����5�H���A�|���ͤp��
--�U�@�����P�_�|�M�����A�A�æb���a���񲣥ͤp��
--�x�������ڶ��������g����«�A�HBoss����q�Ӱ��I�i�з�
--�ڶ��������D�n�ޯ�A���ޯ঳������ת�����
--�T�w�ɶ��|�l�깲�q
function Lua_Rebuild_103580()--Boss��AI�A���@���b�X�ͮɳ]�w
	--�ܼƫŧi:
		
	--�򥻶�
	local ResetHateData=false;
	local Boss=OwnerID();
	local RoomID=ReadRoleValue(Boss, EM_RoleValue_RoomID);
	local Target=0;	
	local IsOutCombat=0;
	local PlayerCumulativeDistance=0;
	local Enemy_Number=0;
	local Player_Number=0;
	local c_Time=0;
	local MaxHP=ReadRoleValue(Boss, EM_RoleValue_MaxHP);
	local HP_Boss=MaxHP;
	local MaxCheat_Distance=1000;
	--�ѼƳ]�w  (�t���ť@�ɤ��O��)
	local Scale;
	if ReadRoleValue(Boss, EM_RoleValue_OrgID)==107183 then
		Scale="Hard";
		Lua_DW_WBGUIDRecord(1);
	else
		Scale="Easy";
		SetPlot(Boss,"dead","LuaS_103580_6",0);
	end
	local Spell={Discipline=495368, MainAtk=495372};
	local Buff={MakeToken=506371, SpeedUp=506375}
	--�j��
	local PowerLv_Discipline=100;
	local PowerLv_MainAtk;
	if Scale == "Hard" then
		PowerLv_MainAtk = 20;
	else
		PowerLv_MainAtk = 6;
	end
	--���F�񨭬���
	local spirit ={ totalplayer=0, execution_time=0, duration=5, remain=15, buff=506371, range=50 };
	--�g����«
	local PowAtkTriRate=math.floor(MaxHP*0.03);
	local LastRecordingHP=MaxHP;
	local PowAtkSpell=499644;
	--�����K�l
	local MainAtk={CD=6, Delay=3, LastExeTime=-3 };
	--�l��p��
	local TokenOrg;
	if Scale=="Hard" then
		TokenOrg = 107184;
	else
		TokenOrg = 103582;
	end
	local _loc = function ( Obj )--�ƨ禡�G���y��
		local x,y,z,dir;
		x = ReadRoleValue(Obj, EM_RoleValue_X);
		y = ReadRoleValue(Obj, EM_RoleValue_Y);
		z = ReadRoleValue(Obj, EM_RoleValue_Z);
		dir = ReadRoleValue(Obj, EM_RoleValue_Dir);
		return x, y, z, dir;
	end
	local _relative = function ( x,y,z,dir,Angle,Dis)--�ƨ禡�G�ھڮy�Ш��۹�y��
		local Pos = {};
		local Pi_Value;
		Pi_Value = (math.pi/180)*(Dir+Angle)
		Pos.x = x +(Dis*math.cos(Pi_Value))
		Pos.z = z -(Dis*math.sin(Pi_Value))
		Pos.y = GetHeight(Pos.x, y, Pos.z);
		return Pos.x, Pos.y, Pos.z, Dir;
	end
	local Token={};
	local summon={limit=30, total=0, CD=5, LastExeTime=0, angle=360/3, num=3};
	local x,y,z,dir=_loc(Boss);
	
	--���ͩ��_��
	SetFlag(Boss, 544801, 1);
	--�j��:�������᪫�󭫸m�A���_�i��:�ڶ��������`
	while true do
		sleep(10)
		--Boss�����ƾ�z
		Enemy_Number=HateListCount(Boss);
		Player_Number=0;
		local playerlist={};
		for Pos=0, Enemy_Number-1, 1 do
			local GUID=HateListInfo(Boss, Pos, EM_HateListInfoType_GItemID);
			if ( ReadRoleValue(GUID, EM_RoleValue_IsPlayer) == 1 ) then
				--���a��ƾ�z&��s
				Player_Number=Player_Number+1;
				table.insert(playerlist, GUID);
			end
		end
		
		--�@�ɤ����a����ˬd
		if(Scale=="Hard")then
			Lua_DW_WBLvCheck_Table(playerlist);
		end
		if Player_Number==0 then
			--���}�԰����s�i��]�w
			if IsOutCombat==1 then
				--�����j��
				break;
			end
		else
			--�԰�������Ƨ�s
			Target=ReadRoleValue(Boss, EM_RoleValue_AttackTargetID);
			local DifDistance=GetDistance(Boss, Target);
			local d=DifDistance-60;if(d<0)then d=0;end
			PlayerCumulativeDistance=PlayerCumulativeDistance+d;
			IsOutCombat=1;
			HP_Boss=ReadRoleValue(Boss, EM_RoleValue_HP);
			c_Time=c_Time+1;
			ResetHateData=false;
			
			--���s�p��l�ͪ����ƶq
			if summon.total >= summon.limit then
				for pos=summon.total, 1, -1 do
					local _Token = Token[pos];
					local IsGone = false;
					if _Token == nil then
						IsGone = true;
					end
					if IsGone==false then
						if CheckID( _Token ) == false then
							IsGone = true;
						end
					end
					if IsGone==false then
						--�ư��}�`�M��
						if ReadRoleValue(_Token, EM_RoleValue_IsDead) == 1 then
							IsGone = true;
						end
					end
					if IsGone == true then
						--��s�ƶq
						table.remove(Token, pos);
						summon.total=summon.total - 1;
					end
				end
			end

			--���F��
			if(c_Time-spirit.execution_time>spirit.duration)then
				spirit.execution_time=c_Time;
				local inflected={};
				local clear={};
				local overload={};
				local newinflected={};
				for playersort=1,#playerlist,1 do
					--�N���a�@�����G
					if(CheckBuff(playerlist[playersort],spirit.buff)==true)then
						table.insert(inflected,playerlist[playersort]);
						CancelBuff_NoEvent(playerlist[playersort],spirit.buff);
					else
						table.insert(clear,playerlist[playersort]);
					end
				end
				for i=#inflected,1,-1 do
					if(#clear==0)then
						break;
					end
					local dis_of_between={};
					--�C�ӳQ�P�V�����a

					for j=#clear,1,-1 do
						local dis=GetDistance(clear[j],inflected[i]);
						--�C�X�Ҧ����P�V���a�P���P�V�̪��Z��
						if(#dis_of_between==0)then table.insert(dis_of_between,{dis=dis;marked=j;guid=clear[j];});else
							local getposition=false;
							for k=1,#dis_of_between,1 do
								if(dis<dis_of_between[k].dis)then
									table.insert(dis_of_between,k,{dis=dis;marked=j;guid=clear[j];})
									getposition=true;
									break;
								end
							end
							if(getposition==false)then
								table.insert(dis_of_between,{dis=dis;marked=j;guid=clear[j];})
							end
						end
					end
					--�C�X�Ҧ��H����
					if(dis_of_between[1].dis<=spirit.range)then
						--�Y�Z������ �h�P�V
						table.insert(newinflected,table.remove(clear,dis_of_between[1].marked));
						table.insert(clear,table.remove(inflected,i));
						AddBuff(dis_of_between[1].guid,spirit.buff,0,spirit.remain);
					else
						--�Y�����h�k���W��
						table.insert(overload,table.remove(inflected,i));
					end
				end
				--�Y(�w)�L���Q�P�V�����a
				if(#clear==0)then
					for i=#inflected,1,-1 do
						--���ಾ�ܶW��
						table.insert(overload,table.remove(inflected,i));
					end
				end
				--�W�����ƶq�Ƭ��p��
				for j=#overload,1,-1 do
					if summon.total < summon.limit then
						x,y,z,dir = _loc(overload[j]);
						x,y,z,dir = _relative(x,y,z,dir, 0, 20+Rand(20) );
						local _Token = CreateObj(TokenOrg, x,y,z,dir, 1);
						AddToPartition(_Token, RoomID);
						SetAttack(_Token, overload[j]);
						BeginPlot(_Token, "Lua_Rebuild_TokenRule", 0);
						table.insert(Token, _Token);
						summon.total = summon.total + 1;
					end
					table.insert(clear,table.remove(overload,j));
				end
				--�T�{�֦���buff�ƬO�_�p��5
				if(#newinflected<5)then
					local w=(5-#newinflected);
					for i=1,w,1 do
						if(#clear==0)then
							--�L�H�i�P�V ���ͤp��
							local r=playerlist[DW_Rand(#playerlist)];
							if summon.total < summon.limit then
								x,y,z,dir = _loc(r);
								x,y,z,dir = _relative(x,y,z,dir, 0, 20+Rand(20) );
								local _Token = CreateObj(TokenOrg, x,y,z,dir, 1);
								AddToPartition(_Token, RoomID);
								SetAttack(_Token, r);
								BeginPlot(_Token, "Lua_Rebuild_TokenRule", 0);
								table.insert(Token, _Token);
								summon.total = summon.total + 1;
							end
						else
							--�H���P�V
							local r=table.remove(clear,DW_Rand(#clear));
							AddBuff(r,spirit.buff,0,spirit.remain);
						end
					end
				end
			end
			--���ͤp��
			if ( (c_Time-summon.LastExeTime) >= summon.CD ) and  ( summon.total < summon.limit) then
				summon.LastExeTime = c_Time;
				for Number=1, summon.num, 1 do
					if (summon.total < summon.limit) then
						x,y,z,dir = _loc(Boss);
						x,y,z,dir = _relative(x,y,z,dir, summon.angle * Number, 20+Rand(20) );
						local _Token = CreateObj(TokenOrg, x,y,z,dir, 1);
						AddToPartition(_Token, RoomID);
						SetAttack(_Token, Target);
						BeginPlot(_Token, "Lua_Rebuild_TokenRule", 0);
						table.insert(Token, _Token);
						summon.total = summon.total + 1;
					end
				end
			end
			--�g�٨��������a
			if PlayerCumulativeDistance > MaxCheat_Distance then
				AddBuff(Boss, Buff.SpeedUp, 0, 3);
				ScriptMessage( Target, Target, 0, "[SC_103580_2]", C_Yellow );
				ScriptMessage( Target, Target, 2, "[SC_103580_2]", C_Yellow );
				sleep(20);
				SysCastSpellLv(Boss, Target, Spell.Discipline, PowerLv_Discipline);
				sleep(5);
				KillID(Boss, Target);
				c_Time=c_Time+1;
				ResetHateData=true;
				if ( ReadRoleValue(Target, EM_RoleValue_IsDead) == 1 ) then
					--�ؼЦ��`�~���m
					PlayerCumulativeDistance=0;
				end
			end
			
			--�g����«
			Enemy_Number=HateListCount(Boss);
			Player_Number=0;
			playerlist={};
			for Pos=0, Enemy_Number-1, 1 do
				local GUID=HateListInfo(Boss, Pos, EM_HateListInfoType_GItemID);
				if ReadRoleValue(GUID, EM_RoleValue_IsPlayer)==1 then
					--��z���a���
					Player_Number=Player_Number+1;
					table.insert(playerlist, GUID);
				end
				
			end
			--�@�ɤ����a����ˬd
			if(Scale=="Hard")then
				Lua_DW_WBLvCheck_Table(playerlist);
			end
			
			if(Scale=="Hard")and(LastRecordingHP-PowAtkTriRate>=HP_Boss)then
				--�C��boss���ͩR��֩T�w���......
				local IsSpellOut = false;
				IsSpellOut = CastSpellLV(Boss, playerlist[DW_Rand(Player_Number)], PowAtkSpell, 1);
				if ( IsSpellOut == true ) then
					--���\�I�k��A�~��O��
					LastRecordingHP=HP_Boss;
					for i,_player in pairs( playerlist ) do
						ScriptMessage( _player, _player, 1, "[SC_103580_5]", C_Yellow );
						ScriptMessage( _player, _player, 0, "[SC_103580_5]", C_Yellow );
					end
					sleep(20);
					c_Time = c_Time + 2;
					ResetHateData=true;
				end
			end
			
			--�����K�l, �D�n�����ޯ�(���O�ޡA��Tank�������O)
			if ResetHateData then
				--�����Ʀ��ܹL
				--��s�ؼ�
				Target = ReadRoleValue(Boss, EM_RoleValue_AttackTargetID);
				if ( Target == nil ) then
					AllowForNext = false;
				end
			end
			local	too_far, 	--�P�ؼжZ���O�_�L��
				PunishMode,	--�O�_���b�g�ټҦ�
				time_up;	--�O�_�w�i�I��H
				too_far = GetDistance(Boss, Target)>55;
				PunishMode = PlayerCumulativeDistance >= MaxCheat_Distance;
				time_up = c_Time - MainAtk.LastExeTime >= MainAtk.CD
			if  not too_far and not PunishMode and time_up then
				local IsSpellOut = CastSpellLV(Boss, Target, Spell.MainAtk, PowerLv_MainAtk);
				if ( IsSpellOut == true ) then
					sleep(MainAtk.Delay * 10 );
					c_Time = c_Time + MainAtk.Delay;
					MainAtk.LastExeTime=c_Time;
					ResetHateData=true;
				end
			end
		end
	end
	--���󭫸m
	BeginPlot(Boss, "Lua_Rebuild_ResetObj", 0);
end
function Lua_Rebuild_ResetObj()--�N���󲾥XPartition�A���s���J
	local Who=OwnerID();
	local RoomID=ReadRoleValue(Who, EM_RoleValue_RoomID);
	DelFromPartition(Who);
	sleep(100);
	AddToPartition(Who, RoomID);
end
function Lua_Rebuild_TokenRule()--�l�ͪ��B�z�W�h:���}�԰��B�������Φ��` ���|�y���l�ͪ�����
	local Token, Boss = OwnerID(), TargetID();
	--���ͩ��_��
	SetFlag(Token, 544801, 1);
	while true do
		sleep(20);
		--Boss�����Φ��`
		if Boss == nil then
			break;
		end
		if CheckID(Boss) == false then
			break;
		end
		if ReadRoleValue(Boss, EM_RoleValue_IsDead) == 1 then
			break;
		end
		--���}�԰�
		if HateListCount(Token)==0 then
			break;
		end
		if ReadRoleValue( Token, EM_RoleValue_AttackTargetID) == 0 then
			break;
		end
	end
	--�l�ͪ�����
	DelObj(Token);
end

--���q���������`�@��
	
function LuaS_103580_6()
	local x = 0
	local Player = {}
	for i=0,HateListCount( OwnerID()),1 do
		Player[i+1] = HateListInfo(OwnerID(),i , EM_HateListInfoType_GItemID)
	end
	local Ball = {}
	for i=1,5,1 do
		if	table.getn(Player)==0	then
			break
		end
		Ball[i] = Lua_DW_CreateObj("obj",115529,Player[1])
		table.remove(Player,1)
	end
	for i=1,5,1 do
		if	table.getn(Player)==0	then
			break
		end
		x = DW_Rand(table.getn(Player))
		Ball[i+5] = Lua_DW_CreateObj("obj",115529,Player[x])
		table.remove(Player,x)
	end
	for i=1,table.getn(Ball),1 do
		SetPlot(Ball[i],"touch","LuaS_103580_7",45)
		WriteRoleValue(Ball[i],EM_RoleValue_LiveTime,15)
		AddBuff(Ball[i],505498,1,-1)
	end
	return true
end

--�����]�]
	
function LuaS_103580_7()
	SetPlot(TargetID(),"touch","",0)
	GiveBodyItem(OwnerID(),206593,1)
	DelObj(TargetID())
end
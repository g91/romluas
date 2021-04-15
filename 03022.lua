function Z28_fish()
	AddBuff(OwnerID(),624901,0,-1)
end

function Z28_ghost()
	AddBuff(OwnerID(),624937,0,-1)
end

function Z28_wind()
	--AddBuff(OwnerID(),624963,0,-1)
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_MUSIC_2012NE_23]","Z28_wind_1",0)
	--setplot(OwnerID(),"range","Z28_wind_1",50)
end

function Z28_wind_1()
	AddBuff(OwnerID(),620001,0,1)
	SetPos(OwnerID(),-454,144,22444,131)	
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_105200_12]",0)
end

function Z28_kid()
	AddBuff(OwnerID(),624055,0,-1)
end


function Lua_Z28_Q_1()	--��U�h�ġA�p��t
	if CheckCompleteQuest(OwnerID(),426605)==false then
		SetPlot(OwnerID(),"range","Lua_Z28_Q_1_1",80)	
	else
		return
	end
end

function Lua_Z28_Q_1_1()
	local player = OwnerID()
	local npc = TargetID()
	if ReadRoleValue(npc,EM_RoleValue_Register2)==0 then
		WriteRoleValue(npc,EM_RoleValue_Register2,1)
		AdjustFaceDir(npc,player, 0 )
		sleep(10)
		Say(npc,"[SC_426605_0]")
		PlayMotionEX( npc,ruFUSION_ACTORSTATE_EMOTE_WAVE,ruFUSION_ACTORSTATE_EMOTE_WAVE)
		sleep(20)	
		WriteRoleValue(npc,EM_RoleValue_Register2,0)
	elseif CheckAcceptQuest(player,426605)==true then
		return	
	else
		return
	end	
end

function Lua_Z28_Q_1_2()--��BUFF�P�w��������
	local npc = OwnerID()
	local buff_pos
	local buff_lv 
	local Tplayer={};
	while true do 
		Tplayer = SearchRangePlayer(npc,250) --���o��e250�d�򤺩Ҧ����a���C��
		for sec=1,2,1 do
			sleep(10);
			for i=#Tplayer-1,0,-1 do
				if(CheckID(Tplayer[i])==false)then --�P�_�C�����a�O�_�T��s�b
					table.remove(Tplayer,i);
				else
					buff_pos=Lua_BuffPosSearch( Tplayer[i], 624959 ) --�䪱�a���W�P�_BUFF����l
			 		buff_lv =BuffInfo( Tplayer[i] , buff_pos, EM_BuffInfoType_Power ) --�T�{BUFF�h��
					if 	( CheckAcceptQuest( Tplayer[i], 426605 )==true or --��u����
						CheckAcceptQuest( Tplayer[i], 426744 )==true or --�e�U����
						CheckAcceptQuest( Tplayer[i], 426745 )==true ) and --��������
						(buff_pos~=-1) then --�ˬdBUFF�O�_�s�b
						--for powerLV=0,buff_lv do
							--Say( Tplayer[i], powerLV )
						--	DW_QietKillOne( Tplayer[i],108196 )
						--end
						CancelBuff_NoEvent(Tplayer[i],624959 );
					end
				end
			end
		end
	end
end
function Lua_Z28_Q_1_mob_death()	--�Ǫ�������BUFF
	local NPC=OwnerID() --���`���ؼС]�Ǫ��^
	local player = TargetID()
	local buffA
	local checkbuffA 
	local playerlist= {}
	local Ctrl=ReadRoleValue( NPC, EM_RoleValue_Register1 ) --Ū��������ۨ�Register1��m���������s��
	local Count=ReadRoleValue( Ctrl, EM_RoleValue_Register1 ) --Ū�������󤤱���Register1��m�����W�Ǫ��ƶq
	Count=Count-1 --��g���W�Ǫ��ƶq
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, Count )--�N��g�᪺���W�Ǫ��ƶq�s�^��������Register1��m
	playerlist= DW_HateSequence(0)
	for i=1,#playerlist do
		if DW_CheckQuestAccept("or",Playerlist[i],426605,426744,426745)==true	then
			--Say(Playerlist[i],"Hey!")
			DW_QietKillOne(Playerlist[i],108196)		--���������@����(0�h����OwnerID() ��1�h����TargetID())
		end

		--buffA=Lua_BuffPosSearch( playerlist[i] ,624959)				--�䪱�a���W�P�_BUFF����l
	 	--checkbuffA = BuffInfo( playerlist[i] , buffA , EM_BuffInfoType_Power )	--�T�{BUFF�h��
		--if (CheckAcceptQuest(playerlist[i],426605)==true  or CheckAcceptQuest(playerlist[i],426744)==true or CheckAcceptQuest(playerlist[i],426745)==true ) then
		--	AddBuff(playerlist[i],624959,0,3)	
		--end
	end		
end

function Lua_Z28_Q_2()		--�Q�����G�ϥ��A���X�Х�
	local player=OwnerID()
	if CheckAcceptQuest(player,426606)==true then
		SetFlag(player,548414,1)
	end
	LoadQuestOption(player)
end

function Lua_Z28_Q_3()		--�������t
	local ShowFlag = 780950		
	local Npc= OwnerID()
	local player  = TargetID()
	local spider = Lua_DW_CreateObj( "obj",123058,Npc ,1 , 1)
	DW_Move("flag",spider ,ShowFlag,1)
	sleep(10)
	DelObj(spider )
end

function Lua_Z28_Q_4_1()		--�I�۸O�P�_
	local player = OwnerID()
	local Npc = TargetID()
	local TPid = ReadRoleValue(Npc ,EM_RoleValue_PID)
	local Tmp = {}
	Tmp[1]= 548415
	Tmp[2]= 548416
	Tmp[3]= 548417
	if CheckAcceptQuest(player,426608)==true and CheckFlag(player,Tmp[TPid])==false then
		return true
	elseif CheckAcceptQuest(player,426608)==true and CheckFlag(player,tmp[TPid])==true then
		ScriptMessage(player,player,1,"[SC_426608_1]",0)
		return false
	else
		ScriptMessage(player,player,1,"[SYS_GAMEMSGEVENT_422]",0)
	end	
end

function Lua_Z28_Q_4_2()		--�I�۸O���X��
	local player = OwnerID()
	local Npc = TargetID()
	local TPid = ReadRoleValue(Npc ,EM_RoleValue_PID)
	local Tmp = {}
	Tmp[1]= 548415
	Tmp[2]= 548416
	Tmp[3]= 548417
	SetFlag(player,tmp[TPid],1)
	return true
end

function Lua_Z28_Q_5_1()	--���d������A�d��@��
	SetPlot(OwnerID(),"range","Lua_Z28_Q_5_2",80)	
end

function Lua_Z28_Q_5_2()
	local player = OwnerID()
	local npc = TargetID()
	if CheckAcceptQuest(player,426611)==true and CheckFlag(player,548418)==false then
		ScriptMessage(player,player,1,"[SC_426611_1]",0)		
		SetFlag(player,548418,1)
	else
		return
	end	
end

function Lua_Z28_Q_6_1()		--���������Ҥ��R�ˬd
	local player = OwnerID()
	local Npc = TargetID()
	local TPid = ReadRoleValue(Npc ,EM_RoleValue_PID)
	local Tmp = {548419,548420,548421}
	
	if (CheckAcceptQuest(player,426613)==true or CheckAcceptQuest(player,426748)==true or CheckAcceptQuest(player,426749)==true )
	and CheckFlag(player,tmp[TPid])==false then
		return true
	elseif (CheckAcceptQuest(player,426613)==true or CheckAcceptQuest(player,426748)==true or CheckAcceptQuest(player,426749)==true ) 
	and CheckFlag(player,tmp[TPid])==true then
		ScriptMessage(player,player,1,"[SC_426608_1]",0)
		return false
	else
		ScriptMessage(player,player,1,"[SYS_GAMEMSGEVENT_422]",0)
	end	
end

function Lua_Z28_Q_6_2()		--�I���������Ҥ��R�ˬd���X��
	local player = OwnerID()
	local Npc = TargetID()
	local TPid = ReadRoleValue(Npc ,EM_RoleValue_PID)
	local Tmp = {548419,548420,548421}
	SetFlag(player,tmp[TPid],1)
	return true
end

function Lua_Z28_Q_7_1()		--�Ǵ��������ҡB��
	local Str = "["..GetUseItemGUID(OwnerID()).."]"		
	ClearBorder( OwnerID());			--��l�ƥ۸O����

	if ReadRoleValue(OwnerID(),EM_ROLEVALUE_LV)>= 84 and CheckCompleteQuest(OwnerID(),426610)==false then
		AddBorderPage( OwnerID(), GetQuestDetail( 426610, 1 ) )
		ShowBorder( OwnerID(),426610, str,"ScriptBorder_Texture_Paper" )
	elseif CheckCompleteQuest(OwnerID(),426610)==true and CheckAcceptQuest(OwnerID(),426746)==false then
		AddBorderPage( OwnerID(), GetQuestDetail( 426746, 1 ) )
		ShowBorder( OwnerID(),426746, str,"ScriptBorder_Texture_Paper" )	
	elseif CheckCompleteQuest(OwnerID(),426610)==true and CheckAcceptQuest(OwnerID(),426746)==true then
		AddBorderPage( OwnerID(), GetQuestDetail( 426747, 1 ) )
		ShowBorder( OwnerID(),426747, str,"ScriptBorder_Texture_Paper" )
	else
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_LV_NOT_ENOUGH]",0)
	end
end


function Z28_mess_0()
	local player = OwnerID()
	local npc = TargetID()
	LoadQuestOption(player)
	if CheckCompleteQuest(player,426609)==true and 
	   CheckCompleteQuest(player,426610)==false then
		AddSpeakOption(player,npc,"[SC_122443_0]","Z28_mess_1",0)
--	elseif CheckCompleteQuest(player,426609)==true and 
--	ReadRoleValue(npc,EM_RoleValue_Register9)==0 then
--		AddSpeakOption(player,npc,"[SC_122443_1]","Z28_mess_2",0)
	else
		return
	end
	
end

function Z28_mess_1()	--���������Ǥ��Ҥ���
	GiveBodyItem(OwnerID(),243062,1)
	CloseSpeak(OwnerID())
end

function Z28_mess_2()	--�D�Ա�������
	local player = OwnerID()
	local npc = TargetID()
	
end
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


function Lua_Z28_Q_1()	--協助退敵，小表演
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

function Lua_Z28_Q_1_2()--用BUFF判定完成次數
	local npc = OwnerID()
	local buff_pos
	local buff_lv 
	local Tplayer={};
	while true do 
		Tplayer = SearchRangePlayer(npc,250) --取得當前250範圍內所有玩家的列表
		for sec=1,2,1 do
			sleep(10);
			for i=#Tplayer-1,0,-1 do
				if(CheckID(Tplayer[i])==false)then --判斷列表內玩家是否確實存在
					table.remove(Tplayer,i);
				else
					buff_pos=Lua_BuffPosSearch( Tplayer[i], 624959 ) --找玩家身上判斷BUFF的位子
			 		buff_lv =BuffInfo( Tplayer[i] , buff_pos, EM_BuffInfoType_Power ) --確認BUFF層數
					if 	( CheckAcceptQuest( Tplayer[i], 426605 )==true or --支線任務
						CheckAcceptQuest( Tplayer[i], 426744 )==true or --委託任務
						CheckAcceptQuest( Tplayer[i], 426745 )==true ) and --公眾任務
						(buff_pos~=-1) then --檢查BUFF是否存在
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
function Lua_Z28_Q_1_mob_death()	--怪物死掉給BUFF
	local NPC=OwnerID() --死亡的目標（怪物）
	local player = TargetID()
	local buffA
	local checkbuffA 
	local playerlist= {}
	local Ctrl=ReadRoleValue( NPC, EM_RoleValue_Register1 ) --讀取紀錄於自身Register1位置的中控器編號
	local Count=ReadRoleValue( Ctrl, EM_RoleValue_Register1 ) --讀取紀錄於中控器Register1位置的場上怪物數量
	Count=Count-1 --改寫場上怪物數量
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, Count )--將改寫後的場上怪物數量存回中控器的Register1位置
	playerlist= DW_HateSequence(0)
	for i=1,#playerlist do
		if DW_CheckQuestAccept("or",Playerlist[i],426605,426744,426745)==true	then
			--Say(Playerlist[i],"Hey!")
			DW_QietKillOne(Playerlist[i],108196)		--偷偷殺掉一隻怪(0則視為OwnerID() 填1則視為TargetID())
		end

		--buffA=Lua_BuffPosSearch( playerlist[i] ,624959)				--找玩家身上判斷BUFF的位子
	 	--checkbuffA = BuffInfo( playerlist[i] , buffA , EM_BuffInfoType_Power )	--確認BUFF層數
		--if (CheckAcceptQuest(playerlist[i],426605)==true  or CheckAcceptQuest(playerlist[i],426744)==true or CheckAcceptQuest(playerlist[i],426745)==true ) then
		--	AddBuff(playerlist[i],624959,0,3)	
		--end
	end		
end

function Lua_Z28_Q_2()		--被關的果彷布，給旗標用
	local player=OwnerID()
	if CheckAcceptQuest(player,426606)==true then
		SetFlag(player,548414,1)
	end
	LoadQuestOption(player)
end

function Lua_Z28_Q_3()		--完成後表演
	local ShowFlag = 780950		
	local Npc= OwnerID()
	local player  = TargetID()
	local spider = Lua_DW_CreateObj( "obj",123058,Npc ,1 , 1)
	DW_Move("flag",spider ,ShowFlag,1)
	sleep(10)
	DelObj(spider )
end

function Lua_Z28_Q_4_1()		--點石碑判斷
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

function Lua_Z28_Q_4_2()		--點石碑給旗標
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

function Lua_Z28_Q_5_1()	--探查莫維芬，範圍劇情
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

function Lua_Z28_Q_6_1()		--莫維芬環境分析檢查
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

function Lua_Z28_Q_6_2()		--點莫維芬環境分析檢查給旗標
	local player = OwnerID()
	local Npc = TargetID()
	local TPid = ReadRoleValue(Npc ,EM_RoleValue_PID)
	local Tmp = {548419,548420,548421}
	SetFlag(player,tmp[TPid],1)
	return true
end

function Lua_Z28_Q_7_1()		--勒斯梅斯之證、心
	local Str = "["..GetUseItemGUID(OwnerID()).."]"		
	ClearBorder( OwnerID());			--初始化石碑介面

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

function Z28_mess_1()	--給梅斯梅勒之證之證
	GiveBodyItem(OwnerID(),243062,1)
	CloseSpeak(OwnerID())
end

function Z28_mess_2()	--挑戰梅斯梅勒
	local player = OwnerID()
	local npc = TargetID()
	
end
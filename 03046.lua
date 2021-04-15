function Z27_gem_ADS_speak_alan()
	local player = OwnerID()
	local npc = TargetID()
	local norg = ReadRoleValue(npc,EM_RoleValue_OrgID)
	if CheckCompleteQuest(player,426472)==false then
		if CheckAcceptQuest(player,426470)==true and CountBodyItem(player,242988)<1 then
			AddSpeakOption(player,npc,"[SC_MOREITEM][$SETVAR1=".."[".."242988".."]".."]","Z27_gem_ADS_said(1)",0)
			LoadQuestOption(player)
		elseif CheckCompleteQuest(player,426471)==true and CheckAcceptQuest(player,426472)==true  then
			LoadQuestOption(player)
			AddSpeakOption(player,npc,"[SC_426467_00]","Z27_gem_ADS_said(2)",0)
		end 


	else
		LoadQuestOption(player)
		AddSpeakOption(player,npc,"[SC_426467_00]","Z27_gem_ADS_said(2)",0)
	end
	LoadQuestOption(player)
end

function Z27_gem_ADS_said(Num)
	if Num == 1 then	--拿籠子
		GiveBodyItem(OwnerID(),242988,10)
		CloseSpeak( OwnerID() )	
	elseif Num == 2 then	--傳送到遠古夢境
		ChangeZone( OwnerID(), 356, -1, 4715,9,1149, 56 )
	end
end

function Z27_gem_ADS_speak_guys()
	local player = OwnerID()
	local npc = TargetID()
	local norg = ReadRoleValue(npc,EM_RoleValue_OrgID)
	LoadQuestOption(player)
	if CheckAcceptQuest(player,426467)==true and norg==122904 and checkflag(player,548368)==false then		--「一人」密佛格對話
		AddSpeakOption(player,npc,"[SC_426467_0]","Z27_gem_ADS_speak_guys_ask(1)",0)
	elseif CheckAcceptQuest(player,426467)==true and norg==122905 and checkflag(player,548378)==false then	--「獨眼」卡內 ，548378任務旗標
		AddSpeakOption(player,npc,"[SC_426467_0]","Z27_gem_ADS_speak_guys_ask(2)",0)
	elseif CheckAcceptQuest(player,426467)==true and norg==122906  and checkflag(player,548370)==false then	--「鐵馬」杰安特
		AddSpeakOption(player,npc,"[SC_426467_0]","Z27_gem_ADS_speak_guys_ask(3)",0)
	else
		LoadQuestOption(player)
	end
end

function Z27_gem_ADS_speak_guys_ask(Num)
	local player = OwnerID()
	local npc = TargetID()
	local RoomID = ReadRoleValue(Npc ,EM_RoleValue_RoomID)
	if Num == 1 then
		SetFlag(player,548368,1)
		SetSpeakDetail(player,"[SC_426467_1]")
	elseif Num == 2 then
		SetFlag(player,548378,1)
		CloseSpeak(player)
	elseif Num == 3 then
		CloseSpeak( OwnerID() )
			if ReadRoleValue( TargetID(),EM_RoleValue_Register1 ) ==0 then
			WriteRoleValue( TargetID(),EM_RoleValue_Register1,1 )
			CallPlot(TargetID(),"lua_426467_1",OwnerID())
			end
	end
end

--對話後攻擊
function lua_426467_1( player )
	local x,y,z,dir = DW_Location( OwnerID() )
	local Obj = CreateObj( 108148,x,y,z,dir,1 )
		SetRoleCampID( Obj,3 )
		WriteRoleValue( Obj,EM_RoleValue_PID,OwnerID())
		SetPlot( Obj,"dead","lua_426467_DD",0 )
		hide( OwnerID())
		AddToPartition( Obj,0)
		NpcSay(obj,"[SC_426467_2]")
		SetAttack( Obj,player )
end
--死亡觸發
function lua_426467_DD()
	local PlayerTeam = HateListCount( OwnerID() )
	WriteRoleValue( OwnerID(),EM_RoleValue_Register1,1)
	local tmpID={}
		for i = 1 , PlayerTeam, 1 do
			local ID = HateListInfo( OwnerID() ,i-1 , EM_HateListInfoType_GItemID );
			table.insert(tmpID,ID)
		end 
	if ReadRoleValue( OwnerID(),EM_RoleValue_Register1)==1 then
		SetFightMode( OwnerID(),0,0,0,0 )
		CallPlot( OwnerID(),"lua_426467_2",tmpID)
	end
	return false
end
--結束表演
function lua_426467_2(tmpID)
	local Obj = ReadRoleValue( OwnerID(),EM_RoleValue_PID)
	WriteRoleValue( OwnerID(),EM_RoleValue_Register1,2)
	DebugMsg(0,0,"end="..Obj)
	Sleep(30)
	NpcSay( OwnerID() ,"[SC_426467_3]")	--快住手！我認輸了！
	Sleep(20)
	NpcSay( OwnerID() ,"[SC_426467_4]")	--我昨晚跟史塔克海盜團的雪莉相好去了！你到底想幹嘛！？
	Sleep(20)
		for i=1,#tmpID do
			if CheckAcceptQuest(tmpID[i],426467) and CheckFlag( tmpID[i], 548370 )==false then
				Sleep(10)
				SetFlag( tmpID[i],548370,1 )
			end
		end
	NpcSay( OwnerID() ,"[SC_426467_5]")	--難不成你是莎莉派來的！？呃...我發誓！是雪莉主動勾引我的！
	Sleep(20)
	NpcSay( OwnerID() ,"[SC_426467_6]")	--可惡，我自己去跟莎莉解釋好了！
	WriteRoleValue( Obj,EM_RoleValue_Register1,0 )
	Show ( Obj,0)
	Sleep(5)
	DelObj( OwnerID() )
end
--離開戰鬥
function lua_426467_3( )
	if ReadRoleValue( OwnerID(),EM_RoleValue_Register1)==0 then
		local Obj = ReadRoleValue( OwnerID(),EM_RoleValue_PID)
		local x,y,z,dir = DW_Location( Obj )
		local time = Move( Obj,x,y,z )
			Sleep( time*10 )
			WriteRoleValue( Obj,EM_RoleValue_Register1,0 )
			Show ( Obj,0)
			DelObj( OwnerID() )
	end
end

function LuaQ_426469_crystal()		--惡名昭彰的偷兒，點水晶後事件
	local player = OwnerID() 
	AddBuff(player,620001,0,3)
	 ScriptMessage( player, player, 0,"[SC_EASTER_2012NE_14]", 0 )
	sleep(30)
	setpos(player,-9391,32,3912,121)
	return true
end



function LuaQ_426470_UseCheck()   --抓貓鼬的籠子使用判斷
	local player = OwnerID()
	local Npc = TargetID()
	local TOrg = ReadRoleValue(Npc ,EM_RoleValue_OrgID)
	local THP = ReadRoleValue(Npc ,EM_RoleValue_HP)
	local TMaxHP = ReadRoleValue(Npc ,EM_RoleValue_MaxHP)
	local TDeath = ReadRoleValue(Npc ,EM_RoleValue_IsDead)
	local TargetCheck = 0
	local hpcount = 0
	local TargetMonster = {}
		TargetMonster[107907]=242989;
		TargetMonster[107908]=242989;
		TargetMonster[107909]=242989;

		if CheckAcceptQuest(player ,426470)== true and (TOrg==107907 or TOrg==107908 or TOrg==107909)  then
			TargetCheck = TargetCheck +1
		end
		if TDeath == 1 then
			ScriptMessage( player, player, 0,"[SC_422202_4]", 0 )
			return false
		elseif   (THP/TMaxHP) <= 0.4   then
			hpcount  = hpcount +1 
		end
		if TargetCheck==1 and hpcount==1 then
			return true
		elseif TargetCheck~=1 then
	 		   ScriptMessage( player, player, 0,"[SYS_GAMEMSGEVENT_422]", 0 )
			return false
		elseif hpcount~=1 then
		 	   ScriptMessage( player, player, 0,"[SC_424317_02]", 0 )
			return false
		end
end

function LuaQ_426470_Used()
	local player = OwnerID()
	local Npc = TargetID()
	local TOrg = ReadRoleValue(Npc,EM_RoleValue_OrgID)
	UseItemDestroy()
	if TOrg == 107907 or TOrg == 107908 or TOrg == 107909  then
		GiveBodyItem(player ,242989,1)
	 	ScriptMessage( player , player , 2,"[SC_424317_03]", 0 )
		CallPlot( Npc, "LuaFunc_ResetObj",Npc )
	end

end

function LuaQ_426471_alan_speak()
	local player = OwnerID()
	local npc = TargetID()
	local norg = ReadRoleValue(npc,EM_RoleValue_OrgID)
		if CheckAcceptQuest(player,426471)==true and CountBodyItem(player,242988)<1 then
			if ReadRoleValue(npc,EM_RoleValue_Register1)==0 then
				AddSpeakOption(player,npc,"[SC_424371_GO]","LuaQ_426471_alan_show",0)
			else
				SetSpeakDetail(player,"[SC_424528_3]")
			end
		end 
		LoadQuestOption(player)
end

function LuaQ_426471_alan_show()
	local player = OwnerID()
	local npc = TargetID()
	local Tplayer = SearchRangePlayer(npc,200)
	WriteRoleValue(npc,EM_RoleValue_Register1,1)
		for i=0,#Tplayer do
			if CheckAcceptQuest(Tplayer[i],426471)==true then
				AddBuff(Tplayer[i],624816,0,300)	
			end
		end
	CallPlot(npc,"LuaQ_426471_alan_show_start",npc,Tplayer)
	CloseSpeak(player)
end

function LuaQ_426471_alan_show_start(npc,Tplayer)
	local ShowFlag = 780950	
	local x,y,z,dir = DW_Location( npc )
	local alan = CreateObj( 122918,x,y,z,dir,1 )	
	local bone = Lua_CreateObjByDir( alan , 107910 , 120 , 0)
	SetRoleCampID( bone,2 )
	AddToPartition( alan,0)
	AddToPartition( bone,0)
		ScriptMessage(alan, 0, 2,"[SC_426471_0]", 0 )
		PlayMotion(alan,ruFUSION_ACTORSTATE_EMOTE_POINT)
		Sleep(30)
		ScriptMessage(alan, 0, 2,"[SC_426471_1]", 0 )
		PlayMotionEX( alan, ruFUSION_ACTORSTATE_EMOTE_STRETCH,ruFUSION_ACTORSTATE_EMOTE_STRETCH)
		Sleep(30)
		ScriptMessage(alan, 0, 2,"[SC_426471_2]", 0 )
		PlayMotion(alan,ruFUSION_ACTORSTATE_CROUCH_BEGIN)
		Sleep(30)
		PlayMotion(alan,ruFUSION_ACTORSTATE_CROUCH_END)
		ScriptMessage(alan, 0, 2,"[SC_426471_3]", 0 )
		DW_Move("flag",bone ,ShowFlag,1)
		Sleep(20)
		DW_Move("flag",bone ,ShowFlag,2)
		Sleep(20)
		ScriptMessage(alan, 0, 2,"[SC_426471_4]", 0 )
		PlayMotion(bone,ruFUSION_ACTORSTATE_ATTACK_UNARMED)
		Sleep(30)
		ScriptMessage(alan, 0, 2,"[SC_426471_5]", 0 )
		DW_Move("flag",alan ,ShowFlag,3)	
		Sleep(10)
		DelObj(alan)
		DelObj(bone)
		for i=0,#Tplayer do
			SetFlag(Tplayer[i],548372,1)
			CancelBuff(Tplayer[i],624816)
		end		
		WriteRoleValue(npc,EM_RoleValue_Register1,0)
end

function LuaQ_426471_accpect()	
	local ShowFlag = 780950		
	local Npc= OwnerID()
	local player  = TargetID()
	local alan = Lua_DW_CreateObj( "obj",122918,Npc ,1 , 1)
	AddBuff(player,624816,0,2)
	DW_Move("flag",alan ,ShowFlag,0)	--移動到旗標0
	sleep(10)
	DelObj(alan )
end

function LuaQ_Z27_426475_ask()
	local player = OwnerID()
	local npc = TargetID()
	if CheckAcceptQuest(player,426475)==true and CheckFlag(player,548393)==false then
		AddSpeakOption(player,npc,"[SC_426475_0]","LuaQ_Z27_426475_getflag",0)
	elseif CheckFlag(player,548393)==true then
		AddSpeakOption(player,npc,"[SC_426475_2]","LuaQ_Z27_426475_checkitem",0)
	end	
	LoadQuestOption(player)
end

function LuaQ_Z27_426475_getflag()
	local player = OwnerID()
	SetSpeakDetail(player,"[SC_426475_1]")
	SetFlag(player,548393,1)	
end

function LuaQ_Z27_426475_checkitem()
	local player = OwnerID()
	local npc = TargetID()
	if CountBodyItem(player,242991)>=10 and CountBodyItem(player,242992)>=1 then
		SetSpeakDetail(player,"[SC_426475_3]")
		AddSpeakOption(player,npc,"[SC_426475_4]","LuaQ_Z27_426475_show_0",0)
	else
	 	ScriptMessage( player, player, 3,"[SYS_GAMEMSGEVENT_422]", 0 )
		CloseSpeak(player)				
	end
end

function LuaQ_Z27_426475_show_0()
	local player = OwnerID()
	local npc = TargetID()
	if ReadRoleValue(npc,EM_RoleValue_Register1)==0 then
		DelBodyItem(player,242991,10)
		DelBodyItem(player,242992,1)
		WriteRoleValue(npc,EM_RoleValue_Register1,1)
		CloseSpeak(player)
		CallPlot(npc,"LuaQ_Z27_426475_show_begin",npc)		
	else
		CloseSpeak(player)
	end
end

function LuaQ_Z27_426475_show_begin(npc)
	local Tplayer=SearchRangePlayer(npc,150)
	NpcSay(npc,"[SC_426475_A]")
	Sleep(15)
	NpcSay(npc,"[SC_426475_B]")
	Sleep(20)		
	NpcSay(npc,"[SC_426475_C]")
	Sleep(20)
	NpcSay(npc,"[SC_426475_D]")
	Sleep(20)
	NpcSay(npc,"[SC_426475_E]")
	Sleep(25)
	NpcSay(npc,"[SC_426475_F]")
	Sleep(20)
	NpcSay(npc,"[SC_426475_G]")
	Sleep(20)
	NpcSay(npc,"[SC_426475_H]")
	Sleep(20)
	NpcSay(npc,"[SC_426475_I]")
	Sleep(25)
	NpcSay(npc,"[SC_426475_J]")
	Sleep(25)
	NpcSay(npc,"[SC_426475_K]")
	Sleep(20)
	NpcSay(npc,"[SC_426475_L]")
	Sleep(30)
	NpcSay(npc,"[SC_426475_M]")
	Sleep(10)
	for i=0,#Tplayer do
		if CheckAcceptQuest(Tplayer[i],426475)==true and 
		CheckFlag(Tplayer[i],548393)==true and 
		CheckFlag(Tplayer[i],548377)==false then
			SetFlag(Tplayer[i],548377,1)
			SetFlag(Tplayer[i],548393,0)
		end
	end
	WriteRoleValue(npc,EM_RoleValue_Register1,0)
end
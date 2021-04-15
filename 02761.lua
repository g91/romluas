--任務423550，伊崔妮的主線對話劇情，head
function lua_Z24N120962_Speak()
	AdjustFaceDir(TargetID(),OwnerID(),0)
--	PlayMotion( TargetID(), 112) 
	if CheckFlag( OwnerID(),544840 ) then
		LoadQuestOption( OwnerID() );
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_Z24N120962_1]" , "lua_Z24N120962_S3" , 0 );
	elseif CheckAcceptQuest( OwnerID(),423550 ) then
		SetSpeakDetail(OwnerID(),"[SC_Z24N120962_2]");
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_Z24N120962_3]" , "lua_Z24N120962_S1" , 0 );
	else
		LoadQuestOption( OwnerID() );
	end
end
function lua_Z24N120962_S1()
	SetSpeakDetail(OwnerID(),"[SC_Z24N120962_4]");
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_Z24N120962_5]" , "lua_Z24N120962_S2" , 0 );
end
function lua_Z24N120962_S2()
	SetFlag( OwnerID(),544840,1 );
	SetSpeakDetail(OwnerID(),"[SC_Z24N120962_6]");
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_Z24N120962_1]" , "lua_Z24N120962_S3" , 0 );
end
function lua_Z24N120962_S3()
	SetSpeakDetail(OwnerID(),"[SC_Z24N120962_2]");
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_Z24N120962_3]" , "lua_Z24N120962_S1" , 0 );
end
--任務423550，伊崔妮的對話劇情，end
--任務423550，阿德米蕾的主線對話劇情，head
function lua_Z24N120973_Speak()
	LoadQuestOption( OwnerID() );
	AdjustFaceDir(TargetID(),OwnerID(),0);
	if CheckFlag( OwnerID(),546712 ) then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_Z24N120962_1]" , "lua_Z24N120973_S1" , 0 );	
	elseif CheckAcceptQuest( OwnerID(),423550 ) then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_Z24N120973_1]" , "lua_Z24N120973_S1" , 0 );
	end
end
function lua_Z24N120973_S1()
	SetSpeakDetail(OwnerID(),"[SC_Z24N120973_2]");
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_Z24N120973_3]" , "lua_Z24N120973_S2" , 0 );
end
function lua_Z24N120973_S2()
	SetFlag( OwnerID(),546712,1 );
	SetSpeakDetail(OwnerID(),"[SC_Z24N120973_4]");
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_Z24N120962_1]" , "lua_Z24N120973_S1" , 0 );
end
--任務423550，阿德米蕾的主線對話劇情 end
--掛在121037阿蘭納．迪凱特的初始範圍劇情。
function lua_Z24N121037_range()
	SetPlot( OwnerID(),"range","LuaS_z24q423551_Jump",50 )
	--npc121037阿蘭納．迪凱特觸發的跳板函式。
	function LuaS_z24q423551_Jump()
		local O_ID= OwnerID();
		local T_ID = TargetID();
		if CheckAcceptQuest( O_ID,423551 ) and 
		CheckFlag( O_ID,546714 )==false and
		ReadRoleValue( T_ID,EM_RoleValue_Register1 )==0 then
			CallPlot( T_ID,"LuaS_z24q423551_rangeStart",0)
		end
	end
end
--任務423551劇情表演
function LuaS_z24q423551_rangeStart()
	local O_ID = OwnerID()				--掛在NPC身上的演戲劇情
	local QuestID = 423551			--任務編號
	local FinishFlagID = 546714			--完成任務獲得的旗標
	local CheckBuffID = 507178			--檢查是否正在演戲的BUFF
	local CheckRange = 150			--演戲的檢查範圍
	local ActorArray = {}				--(新版修改)演員陣列表
	local x,y,z,dir 
	local PlayMusicID="music/dungeon/Pesche/ancient_wars_07_MKS_warriors_arise!.mp3"
	WriteRoleValue( O_ID,EM_RoleValue_Register1,1 )
	local AcArray=SearchRangeNPC(O_ID,100);
		for i = 0,table.getn( AcArray ),1 do
			if ReadRoleValue( AcArray[i],EM_RoleValue_OrgID)==120980 then		--賽西蒙德
				ActorArray[1] =LuaFunc_CreateObjByObj ( 118892 , AcArray[i] ) 
				SetModeEx( ActorArray[1],EM_SetModeType_Mark,false )
				AddToPartition(ActorArray[1],0)
			elseif ReadRoleValue( AcArray[i],EM_RoleValue_OrgID)==121037 then		--阿蘭納．迪凱特
				ActorArray[2] =LuaFunc_CreateObjByObj ( 120963 , AcArray[i] ) 
				SetModeEx( ActorArray[2],EM_SetModeType_Mark,false )
				AddToPartition(ActorArray[2],0)
			elseif ReadRoleValue( AcArray[i],EM_RoleValue_OrgID)==121039 then		--阿德米蕾
				 x,y,z,dir = DW_Location( AcArray[i] )
				ActorArray[3] = CreateObjByFlag( 121038, 780871 , 2 , 1 )
				SetModeEx( ActorArray[3],EM_SetModeType_Mark,false )
				moveToFlagEnabled( ActorArray[3], false );
			end
		end
	--範圍看戲用的檢查函式
	CallPlot( OwnerID(), "Ag_QuestwithMusic", QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray,PlayMusicID  )
		Sleep(20)
		--PlayMotion(ActorArray[2],ruFUSION_ACTORSTATE_EMOTE_SPEAK)	--生氣、指
		Say(ActorArray[2],"[SC_Z24Q423551_1]" )
		Sleep(30)
		Say(ActorArray[1],"[SC_Z24Q423551_2]" )
		Sleep(10)
		AddToPartition( ActorArray[3],0 )
		moveDirect( ActorArray[3], x , y , z )
		Sleep(30)
		Say(ActorArray[3],"[SC_Z24Q423551_3]" )
		Sleep(20)
		Say(ActorArray[3],"[SC_Z24Q423551_4]" )
		Sleep(30)
		Say(ActorArray[1],"[SC_Z24Q423551_5]" )
		Sleep(30)
		Say(ActorArray[1],"[SC_Z24Q423551_6]" )
		Sleep(20)
		--PlayMotion(ActorArray[2],ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		Say(ActorArray[3],"[SC_Z24Q423551_7]" )
		Sleep(30)
		Say(ActorArray[1],"[SC_Z24Q423551_8]" )
		Sleep(30)
		Say(ActorArray[1],"[SC_Z24Q423551_9]" )
		Sleep(40)
		Say(ActorArray[2],"[SC_Z24Q423551_10]" )
		Sleep(30)
		Say(ActorArray[1],"[SC_Z24Q423551_11]" )
		Sleep(30)
		Say(ActorArray[1],"[SC_Z24Q423551_12]" )
		Sleep(30)
		--PlayMotion(ActorArray[2],ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		Say(ActorArray[1],"[SC_Z24Q423551_13]" )
		Sleep(30)
		WriteRoleValue( O_ID,EM_RoleValue_Register1,0 )
		Ag_QuestwithMusicEnd( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray )--戲演完了 給予旗標\物品
end
function lua_Z24VARreset()
	Var_AGMusicList = {}
end
--對話選項
function lua_Q120980_szScript()
	local x=2
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),425119) and CheckFlag( OwnerID(),546715 )==false then
		AddSpeakOption( OwnerID(),TargetID(),"[SC_Z24Q425119_1]","lua_Q120980_ASK("..x..")",0)
	end
end
function lua_Q120980_ASK(x)
	local y =0
	DebugMsg(0,0,"x="..x)
	SetSpeakDetail( OwnerID(),"[SC_Z24Q425119_"..x.."]")
	if x>=12 then 
		SetFlag( OwnerID(),546715,1 ) 
	else
		x=x+1
		y=x+1
		AddSpeakOption( OwnerID(),TargetID(),"[SC_Z24Q425119_"..x.."]","lua_Q120980_ASK("..y..")",0)
	end
end
--任務：425139 恢復意識
--對話選項：120976伊崔妮．吉昂特
function lua_Z24Q120976_szScript()
	local x=1
	LoadQuestOption(OwnerID())
	AdjustFaceDir(TargetID(),OwnerID(),0);
	if CheckAcceptQuest(OwnerID(),425139) and CheckFlag( OwnerID(),546716 )==false then
		AddSpeakOption( OwnerID(),TargetID(),"[SC_422981_95]","lua_Z24Q120976_ASK("..x..")",0)
	end
end
function lua_Z24Q120976_ASK(x)
	local y =0
	SetSpeakDetail( OwnerID(),"[SC_Z24Q425139_"..x.."]")
	if x>=7 then 
		SetFlag( OwnerID(),546716,1 ) 
		return
	else
		x=x+1
		y=x+1
		AddSpeakOption( OwnerID(),TargetID(),"[SC_Z24Q425139_"..x.."]","lua_Z24Q120976_ASK("..y..")",0)
		return
	end
end
--任務，放魚簍
function lua_z24Q425695_1()
	if CountBodyItem( OwnerID(),242033)>0 then
		return true
	end
	return false
end
--任務，放魚簍，結束殺一隻怪
function lua_z24Q425695_end()
	DelBodyItem( OwnerID(),242033,1)
	DW_QietKillOne(OwnerID(),107061)
	return 1
end
--使用物品：火種
function lua_z24Item241612_A()
	local player =OwnerID()
	local npc_t = SearchRangeNPC(player,50);
		for i=0,#npc_t,1 do
			if ReadRoleValue( npc_t[i],EM_RoleValue_OrgID )==102379 or
			ReadRoleValue( npc_t[i],EM_RoleValue_OrgID )==102378 then
				--CallPlot(npc_t[i],"lua_z24Item241612_B",player)
				return true
			end
		end
	ScriptMessage(player,player,3,"[SC_Z24I241612_1]",0)
	return false
end
function lua_z24Item241612_B(  )
	CallPlot( OwnerID(),"lua_z24Item241612_C",0)
end
function lua_z24Item241612_C(  )
	local player =OwnerID()
	local npc_t = SearchRangeNPC(player,50);
		for i=0,#npc_t,1 do
			if ReadRoleValue( npc_t[i],EM_RoleValue_OrgID )==102379 or
			ReadRoleValue( npc_t[i],EM_RoleValue_OrgID )==102378 then
				local x,y,z,dir = DW_Location( npc_t[i] )
				local flame = CreateObj(121129,x,y,z,dir,1)	--火焰
				AddToPartition(flame,0)
				Sleep(50)
				DW_QietKillOne( player,107065 )
				DelObj(flame)
				CallPlot( npc_t[i],"LuaFunc_ResetObj",npc_t[i])	--重生
				return 
			end
		end
	return 
end
--使用物品，425530謎團重重。
function LuaS_425530_A()
	if	Lua_ExGetZone( OwnerID()) == 24	then
		local tips = Lua_DW_CreateObj("obj" , 112399, OwnerID(),0)
		Lua_ObjDontTouch(tips)
		SetModeEx( tips , EM_SetModeType_Gravity , false ) 
		AddToPartition(tips,0)
		AddBuff(tips,502924,1,-1)
		if CheckAcceptQuest( OwnerID(),425531) == true then
			BeginPlot(tips,"LuaS_425530_B",0)
			BeginPlot(tips,"LuaS_425530_C",0)
		elseif CheckAcceptQuest( OwnerID(),425530) == true then
			BeginPlot(tips,"LuaS_425530_D",0)
			BeginPlot(tips,"LuaS_425530_E",0)
		else
			ScriptMessage(  OwnerID(),OwnerID(),3,"[SC_ITEM242036_1]",0)
		end
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_DAN_111700_37]", 0 ) --你無法在此區域使用該物品
		return false
	end
end
function LuaS_425530_B()
--	LuaFunc_MoveToFlag( OwnerID() , 780088 , 4 ,0 )
	local flag = 780871
	local FlagX = GetMoveFlagValue( flag , 3 , EM_RoleValue_X )
	local FlagY = GetMoveFlagValue( flag , 3 , EM_RoleValue_Y )
	local FlagZ = GetMoveFlagValue( flag , 3 , EM_RoleValue_Z )
	MoveDirect( OwnerID(), FlagX , FlagY , FlagZ )
	sleep(15)
	if	ReadRoleValue(OwnerID(),EM_RoleValue_X)/10 == FlagX/10		and
		ReadRoleValue(OwnerID(),EM_RoleValue_Z)/10 == FlagZ/10		then
		ScriptMessage( TargetID(), TargetID(), 2, "[SC_420931_2]", 0 ) --追蹤器指向這裡……
		ScriptMessage( TargetID(), TargetID(), 0, "[SC_420931_2]", 0 ) --追蹤器指向這裡……
	end
end

function LuaS_425530_C()
	sleep(20)
	DelObj(OwnerID())	
end
function LuaS_425530_D()
--	LuaFunc_MoveToFlag( OwnerID() , 780088 , 4 ,0 )
	local flag = 780871
	local FlagX = GetMoveFlagValue( flag , 4 , EM_RoleValue_X )
	local FlagY = GetMoveFlagValue( flag , 4 , EM_RoleValue_Y )
	local FlagZ = GetMoveFlagValue( flag , 4 , EM_RoleValue_Z )
	MoveDirect( OwnerID(), FlagX , FlagY , FlagZ )
	sleep(15)
	if	ReadRoleValue(OwnerID(),EM_RoleValue_X)/10 == FlagX/10		and
		ReadRoleValue(OwnerID(),EM_RoleValue_Z)/10 == FlagZ/10		then
		ScriptMessage( TargetID(), TargetID(), 2, "[SC_420931_2]", 0 ) --追蹤器指向這裡……
		ScriptMessage( TargetID(), TargetID(), 0, "[SC_420931_2]", 0 ) --追蹤器指向這裡……
	end
end

function LuaS_425530_E()
	sleep(20)
	DelObj(OwnerID())	
end

--與夏121085夏倫．馬洛對話
function lua_Z24Q425531_1()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),425531) and CheckFlag(OwnerID(),547045)==false then
		SetFlag(OwnerID(),547045,1)
	end
end

--任務表演
function lua_Z24Q425532_1()
	if ReadRoleValue( OwnerID(),EM_RoleValue_Register1)==0 then
		WriteRoleValue( OwnerID(),EM_RoleValue_Register1,1)
		NpcSay( OwnerID(),"[SC_Q425532_1]")
		CallPlot(OwnerID(),"lua_Z24Q425532_2",TargetID())
	end
end
--召喚屍人
function lua_Z24Q425532_2(player)
	local x,y,z,dir = DW_Location( OwnerID())
	local obj = CreateObj( 107478,x,y,z,dir,1 )
		WriteRoleValue( obj,EM_RoleValue_PID,OwnerID())
		SetPlot( obj,"dead","lua_Z24Q425532_4",0)
		CastSpell( OwnerID(),OwnerID(),850457)
		Sleep(20)
		Hide(OwnerID())
		AddToPartition( obj,0 )
		Sleep(5)
		SetAttack( obj,player)
end
--離開戰鬥
function lua_Z24Q425532_3()
	local ma= ReadRoleValue( OwnerID(),EM_RoleValue_PID)
	WriteRoleValue( ma,EM_RoleValue_Register1,0)
	Show( ma,0)
	DelObj( OwnerID())
end
--死亡
function lua_Z24Q425532_4()
	local ma= ReadRoleValue( OwnerID(),EM_RoleValue_PID)
	WriteRoleValue( ma,EM_RoleValue_Register1,0)
	Show( ma,0)
end
function szLuaScript_123242()
--	local red = AddyQuestNpc:new( OwnerID())
	SetPlot( OwnerID(), "range", "rangeLua_123242", 100 )
	SetIdleMotion(OwnerID(),ruFUSION_MIME_ATTACK_1H_SP)
	AddBuff(OwnerID(),625421,0,-1)
	function rangeLua_123242()
		if szLuaScript_QuestTalk( 426834,548793 ) then
			CallPlot( TargetID(),"drama_426834_1",OwnerID())
		end
	end
end
function drama_426834_1(player)
	local testObj = 116858	--測試蛋
	local tmpObj = SearchRangeNPC( OwnerID(),50 )
	local tmpNum = 0
		CallPlot(testObj,"lua_agtestodead",0)
		for i=0,#tmpObj,1 do
			if ReadRoleValue( tmpObj[i],EM_RoleValue_OrgID )==testObj then
				tmpNum = tmpNum + 1
			end
		end
		if tmpNum>=1 then
			ScriptMessage( player,player,3,"[SC_424528_3]",0)	--表演正在進行中，請稍候…
		else
			local x,y,z,dir = DW_Location( TargetID() )
			local obj = CreateObj( testObj,x,y,z,dir,1 )
				SetModeEx( obj, EM_SetModeType_Show, false )
				SetModeEx( obj, EM_SetModeType_Mark, false )
				AddToPartition( obj, 0 )
				CallPlot( obj,"readyToQuest_426834_2",obj )
		end
end
----播表演
function readyToQuest_426834_2(O_ID)
	local QuestID = 426834			--任務編號
	local FinishFlagID = 548793			--完成任務獲得的旗標
	local CheckBuffID = 621881			--檢查是否正在演戲的BUFF
	local CheckRange = 150			--演戲的檢查範圍
	local ActorArray = {}				--(新版修改)演員陣列表
	local RoomID= ReadRoleValue(O_ID,EM_RoleValue_RoomID)
		ActorArray[1] =CreateObjByFlag( 123239, 780867, 1, 1 )	--表演用賽西蒙德
		ActorArray[2] =CreateObjByFlag( 123240, 780867, 2, 1 )	--表演用紅衣女子
		ActorArray[3] =CreateObjByFlag( 123241, 780867, 3, 1 )	--表演用威爾
			for i=1,3 do
				SetModeEx(  ActorArray[i]  , EM_SetModeType_ShowRoleHead, true )	
				moveToFlagEnabled( ActorArray[i], false )
				SetModeEx( ActorArray[i],EM_SetModeType_Mark,false) 
			end
			PlayMotion(ActorArray[1],ruFUSION_ACTORSTATE_SLEEP_LOOP)
			SetIdleMotion(ActorArray[2],ruFUSION_MIME_ATTACK_1H_SP)
			WriteRoleValue( ActorArray[3],EM_RoleValue_IsWalk , 0 )	--跑起來
			AddToPartition(ActorArray[1],RoomID)
			AddToPartition(ActorArray[2],RoomID)
			AddToPartition(ActorArray[3],RoomID)
			AddBuff(ActorArray[2],625421,0,-1)
			LuaFunc_MoveToFlag( ActorArray[3], 780867, 4, 0 )


	CallPlot( O_ID,"Ag_QuestS1",QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray )	--表演開始
	--範圍看戲用的檢查函式
			LuaFunc_MoveToFlag( ActorArray[3],780867,4,0 )
			Sleep(10)
			AdjustFaceDir( ActorArray[3],ActorArray[1],0)
			Say(ActorArray[1],"[SC_426834_1]" )	--怎麼了，小朋友，剛剛的氣焰不是很高嗎？
			Sleep(30)
			Say(ActorArray[2],"[SC_426834_2]" )	--你這個…變態傢伙……把…東西…還給……我……
			Sleep(30)
			Say(ActorArray[2],"[SC_426834_3]" )	--那……是…我的………希望………
			Sleep(30)
			--PlayMotion( ActorArray[2],ruFUSION_ACTORSTATE_CRAFTING_END)
			Say(ActorArray[1],"[SC_426834_4]" )	--嗯？還在相信這個東西能幫你實現願望嗎？
			Sleep(10)
			PlayMotion( ActorArray[1],ruFUSION_ACTORSTATE_EMOTE_LAUGH)
			Sleep(10)
			Say(ActorArray[1],"[SC_426834_5]" )	--真是可愛阿。
			Sleep(30)
			Say(ActorArray[2],"[SC_426834_6]" )	--願望…是…真的……
			Sleep(20)	
			Say(ActorArray[1],"[SC_426834_7]" )	--噢…，可悲的小傢伙，妳已無需繼續執著。
			Sleep(20)
			Say(ActorArray[1],"[SC_426834_8]" )	--特別是想借願望改變已經發生的錯誤
			Sleep(20)
			Say(ActorArray[1],"[SC_426834_9]" )	--那是個更加愚蠢和幼稚的行為與想法。
			Sleep(30)
			Say(ActorArray[2],"[SC_426834_10]" )	--你…怎麼會…知道……我的事……
			Sleep(30)
			Say(ActorArray[3],"[SC_426834_11]" )	--
			Sleep(20)
			Say(ActorArray[3],"[SC_426834_12]" )	--
			Sleep(30)
			Say(ActorArray[1],"[SC_426834_13]" )	--哈哈哈哈，笑死我了。
			Sleep(20)
			Say(ActorArray[1],"[SC_426834_14]" )	--我能做什麼，想做什麼，你憑什麼覺得可以阻止我？
			Sleep(30)
			Say(ActorArray[1],"[SC_426834_15]" )	--過不久，除了這個女人，
			Sleep(20)
			CastSpell( ActorArray[1], ActorArray[2],851614)
			Sleep(20)
			Say(ActorArray[2],"[SC_426834_16]" );	--
			Sleep(5)
			PlayMotion(ActorArray[2],ruFUSION_ACTORSTATE_DEAD);
			Sleep(20)
			Say(ActorArray[1],"[SC_426834_17]" );	--
			Sleep(30)
			
		Ag_QuestEnd1( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray, O_ID )
end
function lua_agtestodead()
	for i=0,60 do
		Sleep(10)
	end
	DelObj(OwnerID())
end
function lua_scmdsleepidle()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_SLEEP_LOOP)
end
function lua_reddazed()
	SetIdleMotion(OwnerID(),ruFUSION_MIME_ATTACK_1H_SP)
end
--碰撞迷霧
function luaCollision_110578()
	SetPlot( OwnerID(),"collision","luaCollision_426837",40 ) 
	function luaCollision_426837()
		if CheckAcceptQuest(OwnerID(),426883) or CheckCompleteQuest(OwnerID(),426883) then
			return
		else
			AddBuff( OwnerID(),620001,0,2 )
			SetPosByFlag( OwnerID(), 780867, 5 )
		end
	end
end
--任務：頹勢
function szLuaScript_123246()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest( OwnerID(),426839 ) and CheckFlag(OwnerID(),548795)==false then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426839_1]","talkQuest_426839_1",0)
	end
end
function talkQuest_426839_1()
	SetSpeakDetail( OwnerID(),"[SC_426839_2]")
	AddSpeakOption( OwnerID(),OwnerID(),"[SC_426839_3]","talkQuest_426839_2",0)
end
function talkQuest_426839_2()
	SetSpeakDetail( OwnerID(),"[SC_426839_4]")
	if CheckAcceptQuest( OwnerID(),426839 ) and CheckFlag(OwnerID(),548795)==false then
		SetFlag(OwnerID(),548795,1)
	end
end

--------------物品：打開未知的xx
function CheckUseScript_426880( Option )
	local PlayerID = OwnerID()		
	local DropingContent = 0
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space2( PlayerID , NeedSpace  )
	local ClickObj = GetUseItemGUID(OwnerID())
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
	local PackageID = {	243150,
			243151,
			243152}
	local Item1 = { 	727141,
			727142,
			727143
				}
	for i = 1, 3 do
		if ClickObj  == PackageID[i] then
			DropingContent = Item1[i]
		end
	end

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , ClickObj ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , DropingContent , 1 )
	end
end

--任務：誰盜了好酒
--開桶扣蛇
function szScript_OnClickObj_426969()
	if CountBodyItem(OwnerID(),243148)>0 then 
		return true
	else
		return false
	end
end
function OnClickObjEnd_426969()
	if DelBodyItem(OwnerID(),243148,1) then
		DW_QietKillOne( OwnerID(), 108652 )
	end
	return 1
end

--開酒跑出蛇
function OnClickObjEnd_426925()
	local objtable = {}
 	objtable = Lua_CreateObjToRandownPos( TargetID(), 108239, 3, 50, true )
		for i = 1, 3 do
			WriteRoleValue( objtable[i], EM_RoleValue_PID,TargetID() )
			SetAttack( objtable[i], OwnerID())
		end
		GiveBodyItem( OwnerID(),243154,1 )
		return 1
end

--任務：426928 最後的對談
function szLuaScript_426928()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),426928) and CheckFlag(OwnerID(),548844)==false then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426928_01]","szLuaScript_426928_01",0);
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426928_02]","szLuaScript_426928_01",0);
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426928_03]","szLuaScript_426928_01",0);
	end
end
function szLuaScript_426928_01()
	SetSpeakDetail( OwnerID(),"[SC_426928_04]")
	SetFlag(OwnerID(),548844,1)
end 

--物品：243156牧草
--function CheckUseScript_243156()
--	local numofobj =0
--	local objtable = {} 
--		objtable = SearchRangeNPC( OwnerID(),50)
--		for i= 0,#objtable,1 do
--			local searchitem = ReadRoleValue( objtable[i],EM_RoleValue_OrgID)
--			if searchitem == 123446 then
--				return true
--			end
--		end
--		ScriptMessage( OwnerID(),OwnerID(),2,"[SC_426953_1]",0)
--		return false
--end

--任務：逐貓祭典故
function SrvScript_243157()
	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), "[SC_243157_1]" );
	ShowBorder( OwnerID(), 0, "[243157]", "ScriptBorder_Texture_Paper" );
	SetFlag(OwnerID(),548848,1);
end

-- 123451 囚貓籠
function szLuaInitScript_123451()
	local x,y,z,dir=DW_Location(OwnerID());
	local Obj = CreateObj(123458,x,y,z,dir,1);
		SetModeEx( Obj  , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( Obj  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( Obj  , EM_SetModeType_Mark, false )--標記
		SetModeEx( Obj  , EM_SetModeType_Move, false )--移動
		SetModeEx( Obj  , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( Obj  , EM_SetModeType_HideName, true )--名稱
		SetModeEx( Obj  , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( Obj  , EM_SetModeType_Fight , false )--可砍殺攻擊
		AddToPartition(Obj,0);
		WriteRoleValue( OwnerID() , EM_RoleValue_PID , Obj );
		CallPlot( Obj,"lua_CatObj_123458",Obj)
end
function lua_CatObj_123458( Obj)
	while true do
		local mi = Rand(100)
		if mi>47 and mi< 51 then 
			Say( Obj,"[SAY_420488_0]");
		end
		Sleep(20)
	end
end
 --任務：426956
function scOnClickObjEnd_426956()
	local obj =ReadRoleValue( TargetID(),EM_RoleValue_PID)
	DW_QietKillOne(OwnerID(),108656)
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_426956_1]",0)
	CastSpell(TargetID(),TargetID(),851317)
	DelObj(obj)
	WriteRoleValue( TargetID(),EM_RoleValue_PID,0)
	BeginPlot( TargetID(), "scOnClickObjEnd_426956_1", 10 )
	return 1
end
function scOnClickObjEnd_426956_1()
	CallPlot( OwnerID(), "LuaFunc_ResetObj",OwnerID())
end

--範圍劇情 任務 快馬急鞭
function szInitScript_123244()
	SetPlot( OwnerID(), "range", "rangeLua_123244", 80 )
	function rangeLua_123244()
		if szLuaScript_QuestTalk( 426835,548794 ) then
			SetFlag(OwnerID(),548794,1)
		end
	end
end
--對話劇情 任務 快馬急鞭
function szLuaScript_123244()
	LoadQuestOption(OwnerID())
		if szLuaScript_QuestTalk( 426835,548794 ) then
			SetFlag(OwnerID(),548794,1)
		end
end
--任務：召集盟友
function szLuaScript_123250()
	LoadQuestOption(OwnerID())
	if szLuaScript_QuestTalk( 426876,548796 ) then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426876_1]","quest426876_1",0);
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426876_2]","quest426876_2",0);
	end
end
function quest426876_1()
	CloseSpeak(OwnerID());
	AdjustfaceDir( OwnerID(),TargetID(),0 );
	Say( OwnerID(), "[SC_426876_3]" );
	SetFlag( OwnerID(),548796 ,1 )
end
function quest426876_2()
	CloseSpeak(OwnerID())
	AdjustfaceDir( OwnerID(),TargetID(),0 );
	Say( TargetID(), "[SC_426876_4]" );
end

function movetest_108287()
	SetIdleMotion(OwnerID(),ruFUSION_MIME_RUN_FORWARD)
end

--426878 範圍劇情
function szLuaScript_108406()
	SetPlot( OwnerID(), "range", "rangeLua_108406", 100 );
	function rangeLua_108406()
		if szLuaScript_QuestTalk( 426878,548797 ) then
			SetPlot( TargetID(), "range", "", 0 );
			CallPlot( TargetID(),"drama_108406_1",OwnerID());
		end
	end
end
--↓
function drama_108406_1()
	--生出怪物
	local tmpObj = SearchRangePlayer( OwnerID(),250);
	local tmpPlayer = {};
	local x,y,z,dir = DW_Location( OwnerID() );
	local mns = CreateObj( 108406,x,y,z,dir,1 );
		SetFightMode ( mns, 0, 0, 0, 0 );
		AddToPartition( mns,0 );
	
		for i=0,#tmpObj do
			if CheckAcceptQuest( tmpObj[i],426878) and CheckFlag(tmpObj[i],548797 )==false then
				ScriptMessage( tmpObj[i],tmpObj[i],3,"[SC_108406_S1]",0);
				AddBuff( tmpObj[i],624323,0,4 );	--預設4秒
				table.insert (tmpPlayer ,tmpObj[i]);
			end
		end
		
		CastSpell( OwnerID(), mns, 850641 )
		SetFightMode( mns, 1, 1, 1, 1);
		SetAttack( mns, tmpPlayer[1]);
		
		local dis ;
		local hateN ;
		local know =0 ;
		
		for i=0,360 do
			dis = CheckDistance(mns,OwnerID(),250)
			hateN = HateListCount( mns );
				
				if dis==false then
					DelObj( mns);
					SetPlot( OwnerID(), "range", "rangeLua_108406", 100 );
					return
				end
				
				 if hateN==0 then
				 	know = know +1
				 	if know ==6 then
				 		DelObj( mns);
						SetPlot( OwnerID(), "range", "rangeLua_108406", 100 );
						return
				 	end
				 end
				
				if ReadRoleValue( mns , EM_RoleValue_IsDead ) == 1 then
					for i=1,#tmpPlayer do
						if CheckAcceptQuest( tmpPlayer[i],426878) and 
						CheckFlag(tmpPlayer[i],548797 )==false and 
						CheckID( tmpPlayer[i] ) then
								SetFlag( tmpPlayer[i],548797,1 )
						end
					end
					SetPlot( OwnerID(), "range", "rangeLua_108406", 100 );
					return
				end
				Sleep(10)
		end
		DelObj( mns);
		SetPlot( OwnerID(), "range", "rangeLua_108406", 100 );
end

function LuaonDead_108659()
	DW_QietKillOne( TargetID(), 106672 )
end


function LuaQ_427002_UseCheck()   --一身是寶物品SCRIPT，委託與公眾
	local player = OwnerID()
	local Npc = TargetID()
	local TOrg = ReadRoleValue(Npc ,EM_RoleValue_OrgID)
	local THP = ReadRoleValue(Npc ,EM_RoleValue_HP)
	local TMaxHP = ReadRoleValue(Npc ,EM_RoleValue_MaxHP)
	local TDeath = ReadRoleValue(Npc ,EM_RoleValue_IsDead)
	local TargetCheck = 0
	local hpcount = 0
		if (CheckAcceptQuest(player ,427002)== true or  CheckAcceptQuest(player ,427013)== true) and TOrg==108239  then
			TargetCheck = TargetCheck +1
		end
		if TDeath == 1 then
			ScriptMessage( player, player, 0,"[SYS_GAMEMSGEVENT_422]", 0 )
			return false
		elseif   (THP/TMaxHP) <= 0.3   then
			hpcount  = hpcount +1 
		end
		if TargetCheck==1 and hpcount==1 then
			return true
		elseif TargetCheck~=1 then
	 		   ScriptMessage( player, player, 0,"[SYS_GAMEMSGEVENT_422]", 0 )
			return false
		elseif hpcount~=1 then
		 	   ScriptMessage( player, player, 0,"[SYS_GAMEMSGEVENT_422]", 0 )
			return false
		end
end

function LuaQ_427002_Used()
	local player = OwnerID()
	local Npc = TargetID()
	local TOrg = ReadRoleValue(Npc,EM_RoleValue_OrgID)
	UseItemDestroy()
	if TOrg == 108239  then
		GiveBodyItem(player ,243148,1)
	 	ScriptMessage( player , player , 2,"[SC_424317_03]", 0 )
		CallPlot( Npc, "LuaFunc_ResetObj",Npc )
	end

end
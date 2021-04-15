--點擊遠古法師對話
function lua_Z24N121202_SZ()	
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID(),425643 ) and CheckFlag( OwnerID(),546899 )==false then
		AddSpeakOption( OwnerID(), TargetID(), GetString("SC_Z24Q425643_PUT"), "lua_Z24Q425643_0", 0 )	--暫用字串
	end
end
function lua_Z24Q425643_0()
	CloseSpeak( OwnerID() )
	local tmpNPC = SearchRangeNPC( TargetID(), 50 )	--search NPC周圍找中控(106794)
	local objnum =0					--記錄物件數量
		for i = 0,#tmpNPC-1 do
			if ReadRoleValue( tmpNPC[i], EM_RoleValue_OrgID ) == 106794 then
				objnum = objnum +1
			end
		end
		if objnum >0 then
			ScriptMessage( OwnerID(), OwnerID(), 3, "[SC_424528_3]", C_SYSTEM );
		else
			if DelBodyItem( OwnerID(),241327,1 ) and DelBodyItem( OwnerID(),242027,1 ) then
				CallPlot( TargetID(),"lua_Z24Q425643_0_1",0 )
			elseif CheckFlag( OwnerID(),546898 ) then
				CallPlot( TargetID(),"lua_Z24Q425643_0_1",0 )
			else
				ScriptMessage( OwnerID(),OwnerID(),1,"[SC_Z24Q425567_01]",0)
			end

		end
end
function lua_Z24Q425643_0_1()
	local obj = 0						--回傳的中控器ID
	local tx,ty,tz,tdir 
		tx=ReadRoleValue( TargetID(),EM_RoleValue_X);
		ty=ReadRoleValue( TargetID(),EM_RoleValue_Y);
		tz=ReadRoleValue( TargetID(),EM_RoleValue_Z);
		tdir=ReadRoleValue(TargetID(),EM_RoleValue_Dir);
		obj = CreateObj( 106794, tx, ty, tz, tdir,1 )
			SetFightMode ( obj, 0, 0, 0,0 ) 
			SetModeEx( obj, EM_SetModeType_Show, false )
			SetModeEx( obj, EM_SetModeType_Mark, false )
			AddToPartition( obj, 0 )
			CallPlot( obj, "lua_Z24Q425643_1",obj )
end
--點擊遠古法師對話
function lua_Z24Q425643_1( Ctrl )
	local QuestID = 425643			--任務編號
	local FinishFlagID = 546899			--完成任務獲得的旗標
	local CheckBuffID = 622310			--檢查是否正在演戲的BUFF
	local CheckRange = 300				--演戲的檢查範圍
--	local PlayMusicID="music/dungeon/the_gates_of_hell.mp3"
	local LightBall ={}
	local CanList ={}
	local tmpPlayerList ={}
	local PlayerList ={}
	local ActArray ={}
	local Actor1
	local Actor2
	local Actor3
	local O_ID					--賽西蒙德
	local count=1
	local tmpArray=SearchRangeNPC(Ctrl,300);
		--先搜尋所有位置，要創一份新資料在這些位置上
		for i = 0,#tmpArray,1 do
			if ReadRoleValue( tmpArray[i],EM_RoleValue_OrgID)==121671 then		--罐
				local x,y,z,dir = DW_Location( tmpArray[i] )
				local Can = CreateObj ( 121677,x,y,z,dir,1)
					SetModeEx( Can,EM_SetModeType_Mark, false )
					AddToPartition( Can,0 )
					table.insert( CanList,Can )
				table.insert( ActArray,Can )
			elseif ReadRoleValue( tmpArray[i],EM_RoleValue_OrgID)==121670 then		--光球
				local x,y,z,dir = DW_Location( tmpArray[i] )
				local Ball = CreateObj ( 121676,x,y,z,dir,1)
					SetModeEx( Ball,EM_SetModeType_Mark, false )
					SetModeEx( Ball,EM_SetModeType_Gravity,false )	--重力
					moveToFlagEnabled( Ball, false )
					AddToPartition( Ball,0 )
					AddBuff( Ball,621795,0,-1 )	--火光特效
					AddBuff( Ball,509609,50,-1)	--跑速
					table.insert( LightBall,Ball )
				table.insert( ActArray,Ball )
			elseif ReadRoleValue( tmpArray[i],EM_RoleValue_OrgID) == 121675 then		--底光
				Actor3 = tmpArray[i]
			elseif ReadRoleValue( tmpArray[i],EM_RoleValue_OrgID)==121200 then		--卡德摩斯
				Actor2 = tmpArray[i]
				SetDefIdleMotion( Actor2,ruFUSION_MIME_FLY_LOOP )
			elseif ReadRoleValue( tmpArray[i],EM_RoleValue_OrgID)==121674 then		--卡拉維
				local x,y,z,dir = DW_Location( tmpArray[i] )
				Actor1 = CreateObj( 121641, x,y,z,dir,1 )
					SetModeEx( Actor1,EM_SetModeType_Mark,false )	--標記
					SetModeEx( Actor1,EM_SetModeType_Gravity,false )	--重力
					moveToFlagEnabled( Actor1, false )
				table.insert( ActArray,Actor1 )
			elseif ReadRoleValue( tmpArray[i],EM_RoleValue_OrgID)==121197 then		--賽西蒙德
				local x,y,z,dir = DW_Location( tmpArray[i] )
				O_ID = CreateObj ( 121639,x,y+50,z,dir,1 )
					SetModeEx( O_ID,EM_SetModeType_Mark, false )
					SetModeEx( O_ID,EM_SetModeType_Gravity,false )	--重力
					moveToFlagEnabled( O_ID, false )
					AddToPartition( O_ID,0 )
				table.insert( ActArray,O_ID )
			end
		end
			local  Kargath = CreateObjByFlag( 121643, 781245 , 0 , 1 )	--121643 康葛斯
				SetModeEx( Kargath,EM_SetModeType_Mark,false )
				MoveToFlagEnabled( Kargath,false )
				WriteRoleValue( Kargath, EM_RoleValue_IsWalk, 0 )
				AddToPartition( Kargath,0 )
				table.insert( ActArray,Kargath )
			local  IronRose = CreateObjByFlag( 121644, 781245 , 2 , 1 )	--121644 鐵薔薇
				SetModeEx(IronRose,EM_SetModeType_Mark,false)
				MoveToFlagEnabled( IronRose,false )
				AddToPartition( IronRose,0 )
				WriteRoleValue( IronRose, EM_RoleValue_IsWalk, 0 )
				table.insert( ActArray,IronRose )
			local  Jessie = CreateObjByFlag( 121645, 781245 , 1 , 1 )	--121645 傑斯
				SetModeEx(Jessie,EM_SetModeType_Mark,false)
				MoveToFlagEnabled( Jessie,false )
				WriteRoleValue( Jessie, EM_RoleValue_IsWalk, 0 )
				AddToPartition( Jessie,0 )
				table.insert( ActArray,Jessie )
		CallPlot( Ctrl,"lua_Z24Q425643_12",Kargath,IronRose,Jessie)
			
		--設定玩家
		tmpPlayerList =SearchRangePlayer( Ctrl,300 )
		for i=0,#tmpPlayerList-1 do
			if CheckAcceptQuest( tmpPlayerList[i],425643 ) and CheckFlag( tmpPlayerList[i],FinishFlagID )==false then
				SetFlag( tmpPlayerList[i],546898,1 )
				SetPosByFlag( tmpPlayerList[i], 780871 ,5 )
				table.insert( PlayerList,tmpPlayerList[i] )
			end
		end

		CallPlot( Ctrl,"Ag_QuestS1",QuestID, FinishFlagID, CheckBuffID, CheckRange, ActArray )	--表演開始
		Sleep(20)
			AddToPartition( Actor1,0 )
			CallPlot( O_ID,"lua_Z24Q425643_Say",O_ID,"[SC_Z24Q425643_1]",PlayerList)
		Sleep(30)
			AdjustFaceDir(Actor1,O_ID,0)
			SetDefIdleMotion( Actor1,ruFUSION_MIME_DEAD_WATER)
			PlayMotion(Actor1,ruFUSION_ACTORSTATE_REVIVING)
			CastSpell( O_ID,Actor1,850501 )
		Sleep(10)
			AddBuff( Actor1,506559,0,-1)
			AddBuff( Actor3,623844,1,60 )
		Sleep(30)
			PlayMotion( O_ID,ruFUSION_ACTORSTATE_EMOTE_LAUGH)
		Sleep(20)
			CallPlot( O_ID,"lua_Z24Q425643_Say",O_ID,"[SC_Z24Q425643_3]",PlayerList)
		Sleep(10)
			CallPlot(Actor1,"lua_AGUP2U",Actor1)
			PlayMotion ( O_ID,ruFUSION_ACTORSTATE_BUFF_INSTANT)
		Sleep(10)	
			PlayMotion ( O_ID,ruFUSION_ACTORSTATE_BUFF_BEGIN)
		local x,y,z,dir = DW_Location( O_ID )
		local ball = CreateObj( 121672, x,y+30,z,dir,1 )
			SetModeEx( ball,EM_SetModeType_Gravity,false )	--重力
			AddToPartition( ball,0 )
		Sleep(30)
			CallPlot( O_ID,"lua_Z24Q425643_Say",O_ID,"[SC_Z24Q425643_4]",PlayerList)
			AddBuff(CanList[1],623841,0,-1)
		Sleep(20)
			SysCastSpellLv( CanList[1],ball,850502,1)
		Sleep(5)
			DelObj(CanList[1])
			CallPlot( O_ID,"lua_Z24Q425643_Say",O_ID,"[SC_Z24Q425643_5]",PlayerList)
			AddBuff(CanList[2],623841,0,-1)
		Sleep(20)
			SysCastSpellLv( CanList[2],ball,850502,1)
		Sleep(5)
			DelObj(CanList[2])
			CallPlot( O_ID,"lua_Z24Q425643_Say",O_ID,"[SC_Z24Q425643_6]",PlayerList)
			AddBuff(CanList[3],623841,0,-1)
		Sleep(20)
			SysCastSpellLv( CanList[3],ball,850502,1)
		Sleep(5)
			DelObj(CanList[3])
			CallPlot( O_ID,"lua_Z24Q425643_Say",O_ID,"[SC_Z24Q425643_7]",PlayerList)
			AddBuff(CanList[4],623841,0,-1)
		Sleep(20)
			SysCastSpellLv( CanList[4],ball,850502,1)
		Sleep(5)
			DelObj(CanList[4])
			CallPlot( O_ID,"lua_Z24Q425643_Say",O_ID,"[SC_Z24Q425643_8]",PlayerList)
			AddBuff(CanList[5],623841,0,-1)
		Sleep(20)
			SysCastSpellLv( CanList[5],ball,850502,1)
		Sleep(5)
			DelObj(CanList[5])
			CallPlot( O_ID,"lua_Z24Q425643_Say",O_ID,"[SC_Z24Q425643_9]",PlayerList)
			AddBuff(CanList[6],623841,0,-1)
		Sleep(20)
			SysCastSpellLv( CanList[6],ball,850502,1)
		Sleep(5)
			DelObj(CanList[6])
			CallPlot( O_ID,"lua_Z24Q425643_Say",O_ID,"[SC_Z24Q425643_10]",PlayerList)
			AddBuff(CanList[7],623841,0,-1)
		Sleep(20)
			SysCastSpellLv( CanList[7],ball,850502,1)
		Sleep(5)
			DelObj(CanList[7])
		Sleep(10)
			PlayMotion( O_ID,ruFUSION_ACTORSTATE_BUFF_END )
		Sleep(15)
			NPCSay( IronRose,"[SC_423279_5]")
			PlayMotion( O_ID,ruFUSION_ACTORSTATE_CRAFTING_LOOP )
			Yell( Actor1,"[SC_Z24Q425643_11]",2 )
			CastSpell( Actor1,ball,850503 )
			AddBuff( ball,506625,1,-1)
		Sleep(10)
			CallPlot( O_ID,"lua_Z24Q425643_Say1",Actor2,"[SC_Z24Q425643_15]",PlayerList)
		Sleep(30)
			Yell( Actor1,"[SC_Z24Q425643_11]",2 )
			CallPlot( O_ID,"lua_Z24Q425643_Say",O_ID,"[SC_Z24Q425643_16]",PlayerList)
		Sleep(30)
			Yell( Actor1,"[SC_Z24Q425643_11]",2 )
			CallPlot( O_ID,"lua_Z24Q425643_Say",O_ID,"[SC_Z24Q425643_17]",PlayerList)
		Sleep(30)
			CallPlot( O_ID,"lua_Z24Q425643_Say1",Actor2,"[SC_Z24Q425643_18]",PlayerList)
		Sleep(30)
			CallPlot( O_ID,"lua_Z24Q425643_Say",O_ID,"[SC_Z24Q425643_19]",PlayerList)
		Sleep(30)
			CallPlot( O_ID,"lua_Z24Q425643_Say1",Actor2,"[SC_Z24Q425643_20]",PlayerList)
		Sleep(30)
			local mtime = Move( ball,x,y,z )
			Sleep(mtime*10)
			DelObj( ball )
		Sleep(10)	
			CallPlot(Actor2, "lua_AGCreatIceBall1",0)		--call冰彈
			local x,y,z,dir = DW_Location( O_ID )
			local SCMD = CreateObj( 121198,x,y,z,dir,1)
				SetModeEx( SCMD,EM_SetModeType_Gravity,false )	--重力
				SetModeEx(SCMD,EM_SetModeType_Mark,false)
		Sleep(50)
			DelObj(O_ID)
		Sleep(20)
			local sec=1
			for i=1,#LightBall do
				sec = move( LightBall[i],x,y-10,z )
			end
			Sleep(sec*3)
		Sleep( 20 )
			AddBuff( Actor3,623843,1,15)
		Sleep( 5 )
			AddToPartition( SCMD,0 )
			table.insert( ActArray,SCMD )
		Sleep(20)
			PlayMotion( SCMD,ruFUSION_ACTORSTATE_EMOTE_LAUGH)
			CallPlot( SCMD,"lua_Z24Q425643_Say",Actor2,"[SC_Z24Q425643_21]",PlayerList)
		Sleep(20)
			--發氣功
		Sleep(20)
		--ruFUSION_ACTORSTATE_CRAFTING_LOOP
		PlayMotion( O_ID,ruFUSION_ACTORSTATE_CRAFTING_END )
		CancelBuff( Actor3,623844 )
		--Ag_QuestwithMusicEnd( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActArray ) --戲演完了 給予旗標\物品
		Sleep(10)
		for i=1,#PlayerList do
			if CheckAcceptQuest( PlayerList[i],425643 )  then
				AddBuff( PlayerList[i],620001,0,4)
			end
		end
		Sleep(20)
		Ag_QuestEnd1( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActArray, Ctrl )
		for i=1,#PlayerList do
			if CheckAcceptQuest( PlayerList[i],425643 )  then
				SetPos( PlayerList[i],4968,186.2,-9565.1,180 )
			end
		end
end

function lua_AGUP2U( Actor1 )
	local x,y,z,dir = DW_Location( Actor1 )
	for i=1,10,1 do
		y=y+5
		move (Actor1,x,y,z)
		Sleep(3)
	end
end
function lua_AGCreatIceBall1()
	local num=0
	local tnpc={}
	tnpc = SearchRangeNPC(OwnerID(),500)
	for i=0,#tnpc,1 do
		if ReadRoleValue(tnpc[i], EM_RoleValue_OrgID )==121639 then
			CastSpell( OwnerID(),tnpc[i],850504)
		end
	end
end
function lua_AGCreatIceBallaround()
	local tnpc={}
	if ReadRoleValue( TargetID(),EM_RoleValue_OrgID)~= 121639 then
		return
	end
	tnpc = SearchRangeNPC(TargetID(),100)
	for i=0,#tnpc,1 do
		if ReadRoleValue(tnpc[i], EM_RoleValue_OrgID )==121673 then
			SysCastSpellLv( TargetID(),tnpc[i],850504,1)
		end
	end
	--Hide( TargetID() )
end
function lua_Z24Q425643_Say( Npc,NpcStr,PlayerList )
	for i=1,#PlayerList do
		if CheckAcceptQuest( PlayerList[i],425643 ) and CheckFlag( PlayerList[i],546899 )==false then
			ScriptMessage( Npc,PlayerList[i],3,NpcStr,"0xffbd00bd" )	--"0xff808080" 灰
		end
	end
end
function lua_Z24Q425643_Say1( Npc,NpcStr,PlayerList )
	for i=1,#PlayerList do
		if CheckAcceptQuest( PlayerList[i],425643 ) and CheckFlag( PlayerList[i],546899 )==false then
			ScriptMessage( Npc,PlayerList[i],3,NpcStr,"0xff808080" )
		end
	end
end
function lua_Z24Q425643_12(Kargath,IronRose,Jessie)
	LuaFunc_MoveToFlag( Kargath, 781245 , 3 ,0 )
	LuaFunc_MoveToFlag( IronRose, 781245 , 5 ,0 )
	LuaFunc_MoveToFlag( Jessie, 781245 , 4 ,0 )
end


--對話劇情：緊急防禦。
function lua_Z24Q425638_szScript()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption( Player);
	if CheckAcceptQuest( Player,425638 )== true	and
	CheckFlag( Player, 547356 )==false		then
		AddSpeakOption( Player,NPC,"[SC_425638_0]","lua_Z24Q425638_InitNPC",0 );
	end
end
--起始
function lua_Z24Q425638_InitNPC()
	local Player = OwnerID()
	local Ashley = TargetID()
	local RNpc = SearchRangeNPC( Ashley,200 )
	--穎克兒
	if ReadRoleValue( Ashley,EM_RoleValue_Register1 )== 1 then
		ScriptMessage( Player,Player,3,"[SC_424528_3]",0)		--表演正在進行中，請稍候…
	else
		WriteRoleValue( Ashley,EM_RoleValue_Register1,1 )
		CallPlot( Ashley,"lua_Z24Q425638_Start",Ashley )
	end
	CloseSpeak( Player )
end
--表演迴圈開始
function lua_Z24Q425638_Start( Ashley )
	local PlayerList = SearchRangePlayer( Ashley,200 );
	local kagami = {}
	local mostList = {}
	local Player = {}
	local Quest = 425638;
	local amount = 0;
	local FlagID = 547356 ;	--成功旗標id
	local catFlag= 781248 ;	--貓旗id
	local time = 0;
	local num = 0;

		CallPlot( Ashley,"LuaS_Discowood_Combat_1H",0)	--Ashley播戰鬥動作
		Sleep(20)
		--記錄玩家列表進Player
		for i=0,#PlayerList-1 do
			if CheckAcceptQuest( PlayerList[i],Quest ) and	--有任務
			   CheckFlag( PlayerList[i],FlagID )==false then	--沒旗標
				table.insert ( Player,PlayerList[i] )
			end
		end
		--建兩個鏡子
		for i=20,21 do
			local mont1 = CreateObjByFlag( 105488 , catFlag , i , 1 ); 		--105488 裂縫之鏡
					SetModeEx( mont1  , EM_SetModeType_ShowRoleHead, false )--頭像框
					SetModeEx( mont1  , EM_SetModeType_HideName, true )--名稱
					SetModeEx( mont1  , EM_SetModeType_Searchenemy, false )--索敵
					SetModeEx( mont1  , EM_SetModeType_Move, false )--移動
					SetModeEx( mont1  , EM_SetModeType_Strikback, false )--反擊
					SetModeEx( mont1  , EM_SetModeType_Gravity, false )--重力
					SetModeEx( mont1  , EM_SetModeType_Fight , false )--可砍殺
					SetModeEx( mont1  , EM_SetModeType_Mark , false )
				AddToPartition( mont1,0 )
			--	AddBuff( mont1,505655,0,-1 )
				kagami[ mont1 ] = true
		end
		--判定用迴圈開始
		while true do
			num = 0
			--不停算怪的數量
			for i,v in pairs( mostList ) do
				if 	ReadRoleValue( i,EM_RoleValue_IsDead )==1 or --0為活，1為死
					CheckID( i ) ==false then			 --還在
					mostList[i]=nil
				else
					num = num + 1
				end
			end
			--出怪判定
			if num==0 and amount == 0 then	--第一次
				--判定出怪
				if time > 2 then
					--閃訊息
					for i=1,#Player do
						ScriptMessage(Player[i],Player[i],3,"[SC_425638_1]",0)
					end
					--出怪
					for i=20,21 do
 						local tmpmos = AgProUse_01( catFlag,i,107101,1,50 )	--107101第一波怪物
							mostList[tmpmos]=true
							AddToPartition( tmpmos,0 )
							SetAttack( tmpmos,Player[1] )
					end
					DebugMsg(0,0,"-Quest425548,Monster-"..amount )
					amount = amount+1;
				end
			elseif num==0 and amount == 1 then	--第二次
					--閃訊息
					for i=1,#Player do
						ScriptMessage(Player[i],Player[i],3,"[SC_425638_1]",0)
					end
					--出怪
					for i=20,21 do
 						local tmpmos = AgProUse_01( catFlag,i,107102,1,50 )	--107101第一波怪物
							mostList[tmpmos]=true
							AddToPartition( tmpmos,0 )
							SetAttack( tmpmos,Player[1] )
					end
					DebugMsg(0,0,"-Quest425548,Monster-"..amount )
					amount = amount+1;
			elseif num==0 and amount == 2 then	--第三次
					--閃訊息
					for i=1,#Player do
						ScriptMessage(Player[i],Player[i],3,"[SC_425638_1]",0)
					end
					--出怪
 					local tmpmos = AgProUse_01( catFlag,22,107103,1,50 )	--107101第3波怪物
						mostList[tmpmos]=true
						AddToPartition( tmpmos,0 )
						SetAttack( tmpmos,Player[1] )
					amount = amount+1;
			elseif num==0 and amount == 3 then	--成功
					--call成功
					for i,v in pairs( kagami ) do
						DelObj(i)
					end
					--for i=1,#Player do
						--ScriptMessage(Player[i],Player[i],3,"TEST-Success",0)
					--	SetFlag( Player[i],546886,1 )
					--	Player[i]=nil		
					--end
					WriteRoleValue( Ashley,EM_RoleValue_Register1,0 )
					PlayMotion(Ashley,ruFUSION_ACTORSTATE_NORMAL)
					return
			end
			num = 0
			--判斷玩家存在
			for i=1,#Player do
				DebugMsg(0,0,"--"..i)
					if CheckID( Player[i] ) ==true then			 --還在
						if ReadRoleValue( Player[i],EM_RoleValue_IsDead )==1 or --0為活，1為死
				   		   CheckFlag( Player[i],FlagID ) == true or			 --有旗標
						   CheckDistance( Player[i],Ashley,200) ==false or		--距離太遠
						   CheckAcceptQuest( Player[i],Quest ) == false then --沒任務
							table.remove( Player,i )
						else
							num = num + 1
						end
					end
			end
			if num == 0 then
				--call失敗表演
				for i,v in pairs( mostList ) do
					DelObj(i)
				end
				for i,v in pairs( kagami ) do
					DelObj(i)
				end
				WriteRoleValue( Ashley,EM_RoleValue_Register1,0 )
				--ScriptMessage
				--DebugMsg(0,0,"-Quest425548,NOPLAYER,FALSE-")
				return
			end
		Sleep(10)
		time = time +1

	end
end


--任務：425642
--重旗：547345
--字串SC_423006_Q1
--SC_423006_Q2
--SC_423006_F0
--SC_423006_F1
--SC_423006_A
--SC_423006_B
function Lua_Z24N121192_SZ()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 425642 ) == true and CheckFlag( OwnerID() , 547345 ) == false then
		AddSpeakOption(  OwnerID(), TargetID(),"[SC_423006_Q1]" ,  "Lua_Z24N121192_1",  0 );  --我要怎麼幫忙？
	end
end

function Lua_Z24N121192_1()
	CloseSpeak( OwnerID() )
	local Buff = { 623884,623885,623886 }
	Tell( OwnerID() ,TargetID() , "[SC_423006_Q2]" ) --只要照小的說的去做就好囉～
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , TargetID())
	AddBuff( OwnerID() , Buff[DW_Rand(3)] , 0 , 15 )
end

function LuaM_Z24Q425642_MSG()
	local BuffID = { 623884,623885,623886 }
	local String
	local StringA
	local StringB
	local Buff = 0
	local Target = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	if ReadRoleValue( Target , EM_RoleValue_OrgID ) ~= 121192 then
		Target = TargetID()
	end
	local StringC = {"SC_425642_DELAY_0" , "SC_425642_DELAY_1"}

	for pry , obj in pairs(BuffID) do
		if CheckBuff( OwnerID() , Obj ) == true then
			Buff = pry
			break
		end
	end
	
	if Buff == 0 then
		return
	end
	
	local BuffPos = Lua_BuffPosSearch(OwnerID() , BuffID[Buff] )
	local Time = BuffInfo( OwnerID()  , BuffPos , EM_BuffInfoType_Time )
	String = "["..BuffID[Buff].."]"
	if Time == 14 then
		StringA = "[SC_425642_RECORD][$SETVAR1="..String.."]"
		ScriptMessage( OwnerID() , OwnerID() , 0 , StringA , "0xFFFFFFFF" )
	end
	if Time == 13 then
		StringB = "[SC_423006_B][$SETVAR1="..String.."]"
		ScriptMessage( OwnerID() , OwnerID() , 2 , StringB , 0 )
	end
	if Time == 5 then
		Tell( OwnerID() ,Target , "["..StringC[DW_Rand(2)].."]" )
	end
end

function LuaM_Z24Q425642_Failed()
	local BuffID = { 623884,623885,623886 }
	local Success = 506145
	for pry , obj in pairs(BuffID) do
		CancelBuff_NoEvent( OwnerID() , obj )
	end
	CancelBuff_NoEvent( OwnerID() , Success )
	local Target = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	if ReadRoleValue( Target , EM_RoleValue_OrgID ) ~= 114513 then
		Target = TargetID()
	end
	Tell( OwnerID() ,Target , "[SC_423006_F2]" )	--哎哎～看樣子要重來了～
end

function Lua_Z24Q425642_OBJ()
	SetPlot( OwnerID() , "Touch" , "Lua_Z24Q425642_OBJ2" , 25 )
end

function Lua_Z24Q425642_OBJ2()
	if CheckAcceptQuest( OwnerID() , 425642 ) == true then
		local BuffID = { 623884,623885,623886 }
		local Buff = 0

		for pry , obj in pairs(BuffID) do
			if CheckBuff( OwnerID() , Obj ) == true then
				Buff = pry
				break
			end
		end
		
		if Buff == 0 then
			return
		end	
		BeginPlot( TargetID() , "Lua_Z24Q425642_OBJ3" , 0 )
	end
end

function Lua_Z24Q425642_OBJ3()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	local Thing = {[121196] = 242078 , [121194] = 242079 , [121195] = 242080  }
	GiveBodyItem( TargetID() , Thing[OrgID] , 1 )
	Hide( OwnerID() )
	sleep( 50 )
	Show( OwnerID() , RoomID )
end

function Lua_Z24N121193_0()		--記錄器
	SetPlot( OwnerID() , "Touch" , "Lua_Z24N121193_1" , 30 )
end
function Lua_Z24N121193_1()
	local BuffID = { 623884,623885,623886 }
	local ObjID = { 242078,242079,242080 }
	local Success = 506145
	local Buff = 0
	local KeyItem = 547345
	local Count = 0
		
	for pry , obj in pairs(BuffID) do
		if CheckBuff( OwnerID() , Obj ) == true then
			Buff = pry
			break
		end
	end
	if Buff ~= 0 then 
		DebugMsg(0,0,"="..Buff)
		Count = CountBodyItem( OwnerID() , ObjID[Buff] )
		--不管玩家拿什麼過來，全部回收！
		for pry , obj in pairs(ObjID) do
			local Num = CountBodyItem( OwnerID() , Obj )
				if Num > 0 then
					DelBodyItem( OwnerID() , obj , Num )
				end
		end
	end
	--如果身上沒有需要的物品時的判斷
	if Count < 1 then
		Tell(OwnerID() ,TargetID() , "[SC_425642_WRONG]" ) --資料比對不符！
		return
	end				
	--如果身上有需要的物品時的判斷
	if  Count > 0 then
		AddBuff( OwnerID() , Success , 0 , -1 )
		local BuffPos = Lua_BuffPosSearch(OwnerID() , Success )	
		local LV = BuffInfo( OwnerID()  , BuffPos , EM_BuffInfoType_Power  ) + 1
--		Tell(OwnerID() ,TargetID() , "["..String[LV].."]" )
		if LV >= 5 then --判斷是否已經成功
			for pry , obj in pairs(BuffID) do
				CancelBuff_NoEvent( OwnerID() , obj )
			end
			CancelBuff_NoEvent( OwnerID() , Success )
			if CheckAcceptQuest( OwnerID() , 425642 ) == true then
				SetFlag( OwnerID() , KeyItem , 1 )
			end
		else
			CancelBuff_NoEvent( OwnerID() , BuffID[Buff] )
		 	local Num = DW_Rand(3) --避免取得和前一次相同的物品
		 	if Num == Buff then
		 		Num = Num + 1
		 	end
		 	if Num > 3 then
		 		Num = 1
		 	end
			AddBuff( OwnerID() , BuffID[Num] , 0 , 15 )
		end
	end
end
function LuaQ_424465_CHECK()						--確認地點
	local player = OwnerID()
	local npc = TargetID()
	local npctable = searchrangenpc(player,100)
	local Znum = 0
	for i=0,table.getn(npctable),1 do
		local house = readrolevalue(npctable[i],EM_RoleValue_OrgID)
		if house == 118958 then
			Znum = Znum+1
		end
	end
		if  ZNum~=0 then
			return true
		else
		ScriptMessage(player, player , 2 ,"[SC_424465_SEARCH]" , 2 )
		return false
		end
end

function LuaQ_424465_MISSION_CHECK()					--確認條件
	local player = OwnerID()
	local npc = TargetID()
	local RoomID = ReadRoleValue(player,EM_RoleValue_RoomID)
	if CheckAcceptQuest(player,424465) == true and 
	 --CheckCompleteQuest(player,424465) == false and
	 checkflag(player,545520)== false then
	local flag = LuaFunc_CreateObjByObj ( 118941 , player) 
	local ctrl = LuaFunc_CreateObjByObj ( 118941 , player) 
	SetModeEx(flag,EM_SetModeType_Mark,true)
	SetModeEx(flag,EM_SetModeType_fight,true)
	SetModeEx(flag,EM_SetModeType_ShowRoleHead,true)
	SetModeEx(ctrl,EM_SetModeType_Mark,false)
	SetModeEx(ctrl,EM_SetModeType_Show,false)
	AddToPartition(flag,RoomID)
	AddToPartition(ctrl,RoomID)
	CancelBuff(player,620871)
	callplot(ctrl,"LuaQ_424465_MISSION_START",player,flag) 
	end
end

function LuaQ_424465_MISSION_START(player,flag)				--產生怪物
	local ctrl = OwnerID()
	local RoomID = ReadRoleValue(flag,EM_RoleValue_RoomID)
	local shaman = Lua_CreateObjByDir( player , 105901 , 120 , 0)
	local OldX,OldY,OldZ,OldDir = Lua_GetPostion(shaman);
	local dis = 40
	local Cal1 = math.rad(OldDir)
	local Cal2 = Cal1+math.pi*2*(4/10);
	local Cal3 = Cal1+math.pi*2*(6/10);
	local warrior1 = CreateObj( 105902, OldX-dis*math.cos(Cal2),OldY ,OldZ +dis*math.sin(Cal2),OldDir , 1 )
--	local warrior2 = CreateObj( 105902, OldX- dis*math.cos(Cal3),OldY ,OldZ +dis*math.sin(Cal3),OldDir , 1 )
	WriteRoleValue( shaman, EM_RoleValue_Register1, flag )			--怪物記住旗子
	WriteRoleValue( warrior1, EM_RoleValue_Register1, flag )
--	WriteRoleValue( warrior2, EM_RoleValue_Register1, flag )
	AddToPartition(shaman,RoomID)
	AddToPartition(warrior1,RoomID)
--	AddToPartition(warrior2,RoomID)
	local monster = {
		[1] = shaman,
		[2] = warrior1,
--		[3] = warrior2
			}
	for i=1,2 do
		Yell(monster[i],"[SC_RAGEMANE_03]",2)
		SetAttack(monster[i],flag)
		CallPlot(monster[i] ,"LuaQ_424465_MISSION_FIGHT",monster[i],player,ctrl)
	end
	CallPlot(ctrl,"LuaQ_424465_MISSION_FINSH",flag)
end

function LuaQ_424465_MISSION_FIGHT(monster,player,ctrl)			--怪物在10秒內沒有進入戰鬥就會與旗子消失
	local flag = ReadRoleValue(monster,EM_RoleValue_Register1)
	sysCastSpellLv (flag ,monster, 496930 , 1 )  
	SetAttack(monster,flag)
	while 1 do
		Sleep(80)
		sysCastSpellLv (flag ,monster, 496930 , 1 )  
		SetAttack(monster,flag)
		if checkid(monster)~=0 or checkid(monster)~=nil then
			if HateListCount( monster ) == 0  then
			CallPlot(ctrl,"LuaQ_424465_MISSION_FLAG",flag,player,ctrl)
			DelObj(monster)
			end
		end

	end
end

function LuaQ_424465_MISSION_FLAG(flag,player,ctrl)
		ScriptMessage( player, player , 1 ,"[SAY_420635_1]" , 2 )
		ScriptMessage( player, player , 2 ,"[SAY_420635_1]" , 2 )
		delobj(flag)
		delobj(ctrl)
		sleep(20)
end

function LuaQ_424465_MISSION_FINSH(flag)					--讓中控確認範圍200內玩家是否有殺死三隻怪物
	local ctrl = OwnerID()
	local playernum = SearchRangePlayer(flag,200)
	while true do
		for i=0,table.getn(playernum) do
			local buffA=Lua_BuffPosSearch( playernum[i] ,620871)				--找玩家身上判斷BUFF的位子
			local checkbuffA = BuffInfo( playernum[i] , buffA , EM_BuffInfoType_Power )		--確認BUFF層數
			--say(playernum[i],buffA)
			--say(playernum[i],checkbuffA)
			if checkbuffA >=1  then
				SetFlag(playernum[i],545520,1)
				CancelBuff(playernum[i],620871)
				delobj(flag)
				delobj(ctrl)
			end			
		end
	Sleep(30)
	end
end

function LuaQ_424465_MISSION_MONSTER()					--怪物死亡劇情
	local flag = ReadRoleValue(ownerID(),EM_RoleValue_Register1)	
	local monsterlist= {}
	monsterlist = DW_HateRemain( 0 )
	for i=1,table.getn(monsterlist) do
		if CheckAcceptQuest(monsterlist[i],424465) == true then
			AddBuff(monsterlist[i],620871,0,-1)
		end
	end
	Lua_ZonePE_3th_GetScore(1)
end

function LuaQ_dr424465_MISSION_COMP()					--完成任務後cancelbuff
	local player = targetID()
	local Npc = OwnerID() 
	CancelBuff(player,620871)
--	SetFlag(player,545555,1)
	DelBodyItem(player,545558,1)
	Lua_ZonePE_3th_GetScore(350)
end

-------------------------------------------------------------------------------------------------------------------------------
function LuaQ_Medicine_01()--觸碰劇情							--作藥水
	SetCursorType( OwnerID() , 13)
	SetPlot( OwnerID(),"touch","LuaQ_Medicine_02",30 )

end

function LuaQ_Medicine_02()
	local player = OwnerID() 	-- 玩家
	local npc = TargetID()  	-- NPC

	DW_CancelTypeBuff(68,player)
	
	--判斷有沒有任務
	--判斷有沒有物品
	--判斷有的沒的
	if 	countbodyitem(player,240564)>0 then
		WriteRoleValue(npc,EM_RoleValue_Register9,9)
		DelBodyItem( player, 240564, 1 )						--使用後扣1
		ScriptMessage( player, player, 1,"[SC_MIXMEDICINE_02]", 0 )
		CallPlot(npc,"LuaQ_Medicine_04",npc)
		if 	BeginCastBarEvent( player, npc,"[SC_MIXMEDICINE_01]", 80, 148, 150, 0, "LuaQ_edicine_03" ) ~= 1 then
				ScriptMessage( player, player, 0,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
				ScriptMessage( player, player, 2,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
		end
	else 
		ScriptMessage( player, player, 0,"[SYS_GAMEMSGEVENT_422]", 0 )			--使用條件不符
		return
	end
end

function LuaQ_edicine_03(ObjID, CheckStatus)
	local player = OwnerID() 	-- 玩家
	local NPC = TargetID()  	-- NPC
	EndCastBar( player, CheckStatus )
	WriteRoleValue(NPC,EM_RoleValue_Register9,0)
		Sleep(10)
	local num=ReadRoleValue(NPC,EM_RoleValue_Register10)
		if( CheckStatus ~= 0 ) then
			if num <= 20 then
				--ScriptMessage( player, player, 1,"[SC_COOKING_02]", 0 );
				GiveBodyItem(player,240603,1)
			else
				--ScriptMessage( player, player, 1,"[SC_COOKING_04]", 0 );
				GiveBodyItem(player,240604,1)
			end
		else
			-- 失敗
			EndCastBar( player, CheckStatus )
		end
	WriteRoleValue(NPC,EM_RoleValue_Register10,0)
end

function LuaQ_Medicine_04(npc)
	for i=1,40,1 do
		local x=ReadRoleValue(npc,EM_RoleValue_Register9)
			if x==0 then
				return
			end
		Sleep(1)
		local y=i%10
			if y==0 then
				WriteRoleValue(npc,EM_RoleValue_Register10,i)
			end
		--Say(T_ID,y..","..i)
	end
	return			
end
-------------------------------------------------------------------------------------------------------------------------------
function LuaQ_424439STONE_01()--觸碰劇情							--檢驗石碑
	SetCursorType( OwnerID() , 13)
	SetPlot( OwnerID(),"touch","LuaQ_424439STONE_02",50 )
end

function LuaQ_424439STONE_02()
	local player = OwnerID() 	-- 玩家
	local npc = TargetID()  		-- NPC

	DW_CancelTypeBuff(68,player)
	
	--判斷有沒有任務
	--判斷有沒有物品
	--判斷有的沒的
	if 	countbodyitem(player,240554)>0 then
		WriteRoleValue(npc,EM_RoleValue_Register9,9)
		--SetModeEx(npc,EM_SetModeType_Mark,false)
		--ScriptMessage( player, player, 1,"[SC_MIXMEDICINE_02]", 0 )
		if 	BeginCastBarEvent( player, npc,"[SC_CHECKSTONE_01]", 30, 148, 150, 0, "LuaQ_424439STONE_03" ) ~= 1 then
				ScriptMessage( player, player, 0,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
				ScriptMessage( player, player, 2,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
		end
	else 
		ScriptMessage( player, player, 0,"[SYS_GAMEMSGEVENT_422]", 0 )			--使用條件不符
		return
	end
end

function LuaQ_424439STONE_03(ObjID, CheckStatus)
	local player = OwnerID() 	-- 玩家
	local NPC = TargetID()  	-- NPC
	local StoneRand = Rand(4)+1
	local stoneitem = {
			[1] = 240555,
			[2] = 240605,
			[3] = 240605,
			[4] = 240555
				}
		Sleep(10)
	if( CheckStatus ~= 0 ) then

		if( CheckStatus > 0 ) then
			DelBodyItem( player, 240554, 1 )	
			GiveBodyItem(player,stoneitem[StoneRand],1)	
			WriteRoleValue(NPC,EM_RoleValue_Register9,0)
			EndCastBar( player, CheckStatus )
		else
			EndCastBar( player, CheckStatus )
		end

	end
	--SetModeEx(npc,EM_SetModeType_Mark,true)
end
-----------------------------------------------------------------------------------------------------------------------------------------
function LuaQ_dr424433_01()	--自然的補獵者
	local O_ID=OwnerID()	--玩家
	local T_ID=TargetID()	--NPC
	if 	ReadRoleValue(T_ID,EM_RoleValue_OrgID)==105972 and
		(ReadRoleValue(T_ID,EM_RoleValue_HP)/ReadRoleValue(T_ID,EM_RoleValue_MaxHP))>0.5  then
		ScriptMessage(O_ID,O_ID,1,"[SC_424317_02]",0)					--這隻生物，生命力還太過強盛無法捕捉！
		return false
		elseif 	ReadRoleValue(T_ID,EM_RoleValue_OrgID)==105972 and
			(ReadRoleValue(T_ID,EM_RoleValue_HP)/ReadRoleValue(T_ID,EM_RoleValue_MaxHP))<=0.5 then
			return true
		elseif 	ReadRoleValue(T_ID,EM_RoleValue_OrgID)==105972 and
			ReadRoleValue(T_ID,EM_RoleValue_IsDead)==true then
			return false
		else 
			ScriptMessage(O_ID,O_ID,1,"[SYS_GAMEMSGEVENT_422]",0)			 --使用條件不符！
			return false
	end
end

function LuaQ_dr424433_02()
	local O_ID=OwnerID()	--玩家
	local T_ID=TargetID()	--NPC
	if CheckAcceptQuest(O_ID,424433)==true and 
		ReadRoleValue(T_ID,EM_RoleValue_OrgID)==105972 then
		GiveBodyItem(O_ID,240553,1)
		ScriptMessage(O_ID,O_ID,1,"[SC_424317_03]",0)				--這隻生物，經過幾番掙扎還是被你捕抓到了！
		CallPlot( T_ID, "LuaFunc_ResetObj",T_ID )
	end
end

-------------------------------------------------------------------------------------------------------------------------------
function LuaQ_MEDICINEBOOM_01()	--藥劑彈確認對象
	local O_ID=OwnerID()		--玩家
	local T_ID=TargetID()		--NPC
	local X = 0
	local Y = 0	
	if 	(CheckAcceptQuest(O_ID,424429) == true or 
	   	CheckAcceptQuest(O_ID,424430) == true) then
--		ReadRoleValue(T_ID,EM_RoleValue_OrgID)==105908  then
		X = X+1
	end
	if 	CheckDistance( O_ID, T_ID, 120 ) == true then
		Y = Y+1
	end
	if	 X~=0 and Y~=0 then
		return true
	elseif 	X == 0  then
		ScriptMessage(O_ID,O_ID,0,"[SYS_GAMEMSGEVENT_422]",0)			 --使用條件不符！
		ScriptMessage(O_ID,O_ID,2,"[SYS_GAMEMSGEVENT_422]",0)			 --使用條件不符！
		return false
	elseif 	Y == 0 then
		ScriptMessage(O_ID,O_ID,0,"[SC_204425_5]",0)					 --距離過遠！
		ScriptMessage(O_ID,O_ID,2,"[SC_204425_5]",0)					 --距離過遠！
		return false	
	end
end

function LuaQ_MEDICINEBOOM_02()	--藥劑彈		--使用後的法術
	local O_ID=OwnerID()	--玩家
	local T_ID=TargetID()	--NPC
	--say(O_ID,"i will kill you")
	--CastSpell(O_ID,T_ID,498301)
	DelBodyItem(O_ID,240549,1)
	--callplot(O_ID,"LuaQ_MEDICINEBOOM_03",O_ID)
end

function LuaQ_MEDICINEBOOM_03(O_ID)	--藥劑彈
	DelBodyItem(O_ID,240549,1)
end

function LuaQ_620872_Targetcheck()
	local TID = TargetID()
	local TOrg = ReadRoleValue(TID,EM_RoleValue_OrgID)
	if TOrg == 105908 then
		return true
	end
end
-------------------------------------------------------------------------------------------------------------------------------

function LuaQ_424458_BOX()--觸碰劇情				--解救村民
	SetCursorType( OwnerID() , 13)
	SetPlot( OwnerID(),"touch","LuaQ_424458_CHECK",30 )

end

function LuaQ_424458_CHECK()
	local player = OwnerID() 	-- 玩家
	local npc = TargetID()  		-- NPC

	DW_CancelTypeBuff(68,player)
	
	--判斷有沒有任務
	--判斷有沒有物品
	--判斷有的沒的
	if 	CheckAcceptQuest(player,424458) == true and
		countbodyitem(player,240563)>0 then
		WriteRoleValue(npc,EM_RoleValue_Register9,9)
		CallPlot(npc,"LuaQ_424458_RESET",npc)
		--ScriptMessage( player, player, 1,"[SC_MIXMEDICINE_02]", 0 )
		if 	BeginCastBarEvent( player, npc,"[SC_424458_UNLOCK]", 30, 148, 150, 0, "LuaQ_424458_KEYITEM" ) ~= 1 then
				ScriptMessage( player, player, 0,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
				ScriptMessage( player, player, 2,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
		end
	else 
		ScriptMessage( player, player, 0,"[SYS_GAMEMSGEVENT_422]", 0 )			--使用條件不符
		return
	end
end

function LuaQ_424458_KEYITEM(ObjID, CheckStatus)
	local player = OwnerID() 	-- 玩家
	local NPC = TargetID()  	-- NPC
		Sleep(10)
	WriteRoleValue(NPC,EM_RoleValue_Register9,0)
	local num=ReadRoleValue(NPC,EM_RoleValue_Register10)
		if( CheckStatus ~= 0 ) then
			if num <= 20 then
				--ScriptMessage( player, player, 1,"[SC_COOKING_02]", 0 );
				--GiveBodyItem(player,240603,1)
				EndCastBar( player, CheckStatus )
			else
				--ScriptMessage( player, player, 1,"[SC_COOKING_04]", 0 );
				DW_QietKillOne(0,106104)
				DelBodyItem( player, 240563, 1 )				--使用後扣1
				CallPlot(npc,"LuaQ_424458_SHOW",npc,player)
				EndCastBar( player, CheckStatus )
			end
		else
			-- 失敗
			EndCastBar( player, CheckStatus )
		end
	WriteRoleValue(NPC,EM_RoleValue_Register10,0)
end

function LuaQ_424458_RESET(npc)
	for i=1,30,1 do
		local x=ReadRoleValue(npc,EM_RoleValue_Register9)
			if x==0 then
				return
			end
		Sleep(1)
		local y=i%10
			if y==0 then
				WriteRoleValue(npc,EM_RoleValue_Register10,i)
			end
		--Say(T_ID,y..","..i)
	end
	return		
end

function LuaQ_424458_SHOW(npc,player)
	local Aman = ReadRoleValue (npc,EM_RoleValue_Register2)
	CallPlot(npc,"LuaQ_424458_HIDEBOX",npc,Aman)
	CallPlot(Aman,"LuaQ_424458_SHOW2",Aman)
	Hide(npc)
	Hide(Aman)
end

function LuaQ_424458_SHOW2(Aman)
	local RoomID = ReadRoleValue(Aman,EM_RoleValue_RoomID)
	local Bman = CreateObj_ByObjPoint(Aman,119247,"p_down") 
	SetModeEx(Bman,EM_SetModeType_Gravity,true)
	AddToPartition(Bman,RoomID)
	Sleep(10)
	npcsay(Bman,"[EM_421042_2]")
	Sleep(10)
	move(Bman,-23451.0,108.1,35386.9)
	Sleep(30)
	DelObj(Bman)
end

function LuaQ_424458_HIDEBOX(npc,Aman)
	sleep(200)
	Show(npc,0)
	Show(Aman,0)
end


function LuaQ_424458_BOX_BORN()				--籠子初始劇情
	local NPC=OwnerID()
	BeginPlot(NPC,"LuaQ_424458_BOX",0)
	local RoomID = ReadRoleValue(NPC,EM_RoleValue_RoomID)
	local Aman = LuaFunc_CreateObjByObj ( 119247 , NPC) 
	SetModeEx(NPC,EM_SetModeType_Obstruct,true)
	WriteRoleValue(NPC,EM_RoleValue_Register2,Aman)
	WriteRoleValue(Aman,EM_RoleValue_Register2,NPC)
	AddToPartition(Aman,RoomID)
end
-------------------------------------------------------------------------------------------------------------------------------

function LuaQ_424437_frogleg()
	local Str = "["..GetUseItemGUID(OwnerID()).."]"		
	ClearBorder( OwnerID());			--初始化石碑介面
	AddBorderPage( OwnerID(), GetQuestDetail( 424437 , 1 ) )
	if ReadRoleValue(OwnerID(),EM_ROLEVALUE_LV)>= 67 then
		ShowBorder( OwnerID(),424437, str,"ScriptBorder_Texture_Paper" )
	else
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_LV_NOT_ENOUGH]",0)
	end
end
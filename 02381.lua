--424327 深入戰場
--Use register 6、7 and 8
--此一function掛在npc 118337身上
function LuaS_424327_CenterContral()
	local own=OwnerID()
	local Npc
	local x,y,z,dir = DW_Location( own )
		Npc=CreateObj( 118305,x,y,z,dir,1 );
		WriteRoleValue( own,EM_RoleValue_Register6,Npc );	--用中控位置6存npc編號
		AddToPartition( Npc , 0 );
	CallPlot( own,"Lua_424327_ProShadow",own );		--產生幽影
	SetPlot( Npc,"Range","Lua_424327_SayHelp",120 );	--範圍劇情
	Beginplot( own,"LuaS_118337_ForScript",0 )
end
--作用：靠近時說話
function Lua_424327_SayHelp()
	if CheckAcceptQuest(OwnerID(),424327)==true then
		NpcSay(TargetID(),"[SC_424327_1]")
	end
	return
end
--產生幽影118680
function Lua_424327_ProShadow(Center)
	local RoomID = ReadRoleValue( Center , EM_RoleValue_RoomID );
	local Loc={};
	local Mon={}
		local x,y,z,dir = DW_Location( Center )
		Mon[1]=CreateObj(118680,x,y,z+30,90,1);
			WriteRoleValue(Center,EM_RoleValue_Register7,Mon[1]);--用中控位置7存Monster1
		Mon[2]=CreateObj(118680,x,y,z-30,270,1);
			WriteRoleValue(Center,EM_RoleValue_Register8,Mon[2]);--用中控位置8存Monster2
				SetModeEx( Mon[1],EM_SetModeType_Mark,false )
				SetModeEx( Mon[2],EM_SetModeType_Mark,false )
				SetFightMode( Mon[1],0,0,0,0 )
				SetFightMode( Mon[2],0,0,0,0 )
			WriteRoleValue(Mon[1],EM_RoleValue_Register5,Center);--用怪物位置5來存中控編號
			WriteRoleValue(Mon[2],EM_RoleValue_Register5,Center);--用怪物位置5來存中控編號
			AddToPartition( Mon[1] , RoomID );
			AddToPartition( Mon[2] , RoomID );
			PlayMotion(Mon[1],81)
			PlayMotion(Mon[2],81)
		return
end
--每秒判定自己被打了沒，掛在NPC118680的初始劇情上
--此段於2013/02/23，修掉此段，目前沒有任何功能。
function LuaS_Shadow_Snpc_InitScript()
	return
end
--中控回圈
function LuaS_118337_ForScript()
	local amount=0;
	local Player=0;
	local Obj=OwnerID();

	while true do
		local tmpPlayer =SearchRangePlayer( Obj,100 )
		for i=0,#tmpPlayer,1 do
			if CheckAcceptQuest( tmpPlayer[i],424327 ) and 
				CheckFlag( tmpPlayer[i],545163 )==false and
				ReadRoleValue( Obj,EM_RoleValue_Register1 )==0 then
				CallPlot( Obj,"Lua_424327_StartAttack",Obj,tmpPlayer[i] )	--任務被啟動
				return
			end
		end
		Sleep(20)
	end
end
--任務初始，設定產生怪物
function Lua_424327_StartAttack( Center,Player )
	WriteRoleValue( Center,EM_RoleValue_Register1,1 )		--R1值，用來鎖定劇情
	local Mon1=ReadRoleValue(Center,EM_RoleValue_Register7);	--怪物1編號
	local Mon2=ReadRoleValue(Center,EM_RoleValue_Register8);	--怪物2編號
	local Mos={};
	local x,y,z,dir = DW_Location( Mon1 )
		Mos[1] = CreateObj( 105824,x,y,z,dir,1  )
			WriteRoleValue(Mos[1],EM_RoleValue_Register5,Center);
			DelObj(Mon1)
			AddToPartition( Mos[1],0 )
		x,y,z,dir = DW_Location( Mon2 )
		Mos[2]=CreateObj( 105824,x,y,z,dir,1  )
			WriteRoleValue(Mos[2],EM_RoleValue_Register5,Center);
			DelObj(Mon2)
			AddToPartition( Mos[2],0 )
			Sleep(5)
			NpcSay( Mos[1],"[SC_101222_YU_07]" )
			CallPlot( Center,"Lua_424327_JudgeSituation",Center,Mos[1],Mos[2],Player )	--呼叫戰鬥，中控開始判定。
			SetAttack( Mos[1],Player )
			SetAttack( Mos[2],Player )
			Sleep(10)
			SetAttack( Mos[1],Player )
			SetAttack( Mos[2],Player )
		return
end
--呼叫戰鬥，中控開始判定。
function Lua_424327_JudgeSituation( Center,Mos1,Mos2,Player )
	local HateListAll={};
	local x = 0 ;
		for i=0,360,1 do
			--判斷玩家
			if 	CheckDistance( Player,Center,200 )==false or
				CheckAcceptQuest( Player,424327 )==false or
				CheckFlag( Player,545163 )==true or
				CheckID(Player)==false then
					--重置
					CallPlot(Center,"Lua_424327_Reset",Center,Mos1,Mos2);
				return
			end
			--判斷怪物1
			if ReadRoleValue( Mos1 , EM_RoleValue_IsDead ) == 1 then
				NPCDead( Mos2,Player )	--殺死2
				CallPlot( Center,"Lua_424327_Success_Show",Center,Mos2 )		--成功表演
				return
			end 
			--判斷怪物2
			if ReadRoleValue( Mos2 , EM_RoleValue_IsDead ) == 1 then
				NPCDead( Mos1,Player )	--殺死1
				CallPlot( Center,"Lua_424327_Success_Show",Center,Mos1 )		--成功表演
				return
			end 
			Sleep(10)	
		end
				--重置
				CallPlot(Center,"Lua_424327_Reset",Center,Mos1,Mos2);
				return
end
--抓仇恨列表，2013/02/23，修掉此段，目前沒有任何功能。
function Lua_424327_HateListAll(Center)
	return
end
--105824 戰場幽影初始值掛死亡劇情，2013/02/23，修掉此段，目前沒有任何功能。
--當無仇恨並且距離太遠，刪除自己
--自殺，數值-1
function LuaS_105801_ReSituation()
	return
end
--105824 戰場幽影接死亡劇情
--被殺，數值-3
function LuaS_105801_ReSituation_01()
	return
end
--完成後表演
function Lua_424327_Success_Show(Center,Mon)
		local Npc=ReadRoleValue(Center,EM_RoleValue_Register6);
			NpcSay(Npc,"[SC_424327_2]")
			Sleep(20)
			DelObj(Mon)
			NpcSay(Npc,"[SC_424327_1]");
			LuaFunc_MoveToFlag(Npc,780871,1,0)
			Sleep(10);
			DelObj(Npc);
		--給旗標
		local tmpPlayer = SearchRangePlayer( Center,250 )
		local x=0
			for i=0,#tmpPlayer-1 do
				if CheckAcceptQuest( tmpPlayer[i],424327)==true and
					CheckFlag( tmpPlayer[i],545163 )==false then
						SetFlag( tmpPlayer[i],545163,1 );
				end
			end
		WriteRoleValue( Center,EM_RoleValue_Register1,0 )
		CallPlot( Center, "LuaFunc_ResetObj", Center );
end
--失敗重置
function Lua_424327_Reset( Center,Mos1,Mos2 )
	local Npc=ReadRoleValue(Center,EM_RoleValue_Register6);
		if CheckID(Mos1) then
			DelObj(Mos1)
		end
		if CheckID(Mos2) then
			DelObj(Mos2)
		end
		DelObj(Npc)
		Sleep(1)
		WriteRoleValue( Center,EM_RoleValue_Register1,0 )
		CallPlot( Center, "LuaFunc_ResetObj", Center );
end
function Lua_424327_neverdead()
	return false
end
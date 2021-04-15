--781107 旗標
function un_zone30_BossCtrl()
local ctrl = OwnerID()
local RoomID = ReadRoleValue(ctrl,EM_RoleValue_RoomID)
local Boss = CreateObjByFlag(106665,781107,1,1)
AddToPartition( Boss, RoomID)
WriteRoleValue(Boss,EM_RoleValue_register1,1)
local CombatBegin = 0
local Sktalk = {"[SC_106665_01]","[SC_106665_02]","[SC_106665_03]"} --開場，玩家滅團，Boss死亡
local paifunction = {"un_zone212_pai1","un_zone212_pai1_2","un_zone212_pai2","un_zone212_pai2"}
local door1
local reg
WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)
WriteRoleValue(Ctrl,EM_RoleValue_register1,1)
local pai = {}
	while 1 do
	reg = ReadRoleValue(Ctrl,EM_RoleValue_register1)
	sleep(20)
		if reg == 0 then
			for i=1,4 do
				DelObj(pai[i])
			end
			Delobj(door1)
			ScriptMessage( Boss, -1 , 2 , Sktalk[3] , 2 )
			--say(Boss,"bye1")
			sleep(20)
			local mob9898=ReadRoleValue(Boss,EM_RoleValue_Register4)
			while true do
				mob9898=ReadRoleValue(Boss,EM_RoleValue_Register4)
				if hatelistcount(Boss)~=0 	then
					StopMove(Boss,false)
				elseif hatelistcount(Boss)==0 	then
					MoveToFlagEnabled(Boss, false)
					if ReadRoleValue( Boss , EM_RoleValue_IsDead)==0	then
						if mob9898==0 then
						MoveToFlagEnabled(Boss, false)
						WriteRoleValue( Boss,EM_RoleValue_IsWalk,0)
						Hide(Boss)
						Show(Boss,RoomID)
						DW_MoveToFlag( Boss , 781107 ,7,0)
						WriteRoleValue(Boss,EM_RoleValue_Register4,mob9898+1)
						sleep(10)
						local bobo=CreateObjByFlag(106744,781107,1,1)-------寶箱  
						SetModeEx( bobo , EM_SetModeType_Mark, true)			---可點選(否)
						SetModeEx( bobo , EM_SetModeType_ShowRoleHead, true) 		---頭像框(否)
						SetModeEx( bobo , EM_SetModeType_Obstruct, true) 			--阻擋(是)
						SetModeEx( bobo , EM_SetModeType_Strikback, false) ---反擊
						SetModeEx( bobo , EM_SetModeType_Move, false) ---移動	
						SetModeEx( bobo , EM_SetModeType_Fight, false) ---可砍殺
						SetModeEx( bobo , EM_SetModeType_SearchenemyIgnore, false) 	---是否被搜尋(否)
						SetModeEx( bobo , EM_SetModeType_Searchenemy, false)			--索敵(否)	
						SetModeEx( bobo , EM_SetModeType_NotShowHPMP, true) --
						AddToPartition(bobo,RoomID)
						elseif mob9898==1 then
							DelObj(boss)
							local bobo=CreateObjByFlag(106744,781107,1,1)-------寶箱  
						SetModeEx( bobo , EM_SetModeType_Mark, true)			---可點選(否)
						SetModeEx( bobo , EM_SetModeType_ShowRoleHead, true) 		---頭像框(否)
						SetModeEx( bobo , EM_SetModeType_Obstruct, true) 			--阻擋(是)
						SetModeEx( bobo , EM_SetModeType_Strikback, false) ---反擊
						SetModeEx( bobo , EM_SetModeType_Move, false) ---移動	
						SetModeEx( bobo , EM_SetModeType_Fight, false) ---可砍殺
						SetModeEx( bobo , EM_SetModeType_SearchenemyIgnore, false) 	---是否被搜尋(否)
						SetModeEx( bobo , EM_SetModeType_Searchenemy, false)			--索敵(否)	
						SetModeEx( bobo , EM_SetModeType_NotShowHPMP, true) --
						AddToPartition(bobo,RoomID)
						return
						end
					end
				end	
				sleep(10)
			end
		end
		if reg == 1 then
			if hatelistcount(boss)~=0 then
				if CombatBegin == 0 then
				CombatBegin = 1
				ScriptMessage( Boss, -1 , 2 , Sktalk[1] , 2 )
				BeginPlot(boss , "un_zone30_Boss" , 0)
				door1 = CreateObjByFlag( 106236 , 781107 , 2 , 1 )
				SetModeEx(door1,EM_SetModeType_Mark, false)
				SetModeEx(door1,EM_SetModeType_HideName, false)
				SetModeEx(door1,EM_SetModeType_NotShowHPMP, false)
				SetModeEx(door1,EM_SetModeType_Strikback, false)
				SetModeEx(door1,EM_SetModeType_Move, false)
				SetModeEx(door1,EM_SetModeType_Fight, false)
				SetModeEx(door1,EM_SetModeType_Searchenemy, false)
				SetModeEx(door1,EM_SetModeType_Obstruct, true)
				AddToPartition( door1, RoomID)
					for i= 1 , 4 do
						if i ==1 or i == 2 then
							pai[i] = CreateObjByFlag( 106675 , 781107 , i+2 , 1 ) --3~6
						else
							pai[i] = CreateObjByFlag( 106729 , 781107 , i+2 , 1 )
						end	
							SetModeEx(pai[i],EM_SetModeType_Fight,false)
							SetModeEx(pai[i],EM_SetModeType_Searchenemy,false)
							SetModeEx(pai[i],EM_SetModeType_Move,false)
							AddToPartition( pai[i], RoomID)
							WriteRoleValue(pai[i],EM_RoleValue_PID,Boss)
							BeginPlot(pai[i] , paifunction[i] , 0)
					end
				end
			end
			if hatelistcount(boss)==0 and CombatBegin==1 and ReadRoleValue(Ctrl,EM_RoleValue_register1) == 1 then
				if ReadRoleValue( boss , EM_RoleValue_IsDead)==0 then
					DelObj(boss)
					for i=1,4 do
						DelObj(pai[i])
					end
					Delobj(door1)
					ScriptMessage( Boss, -1 , 2 , Sktalk[2] , 2 )
					sleep(50)
					Boss=CreateObjByFlag(106665,781107,1,1)
					RoomID=ReadRoleValue(Ctrl,EM_RoleValue_RoomID)
					AddToPartition(Boss,RoomID)                         --重置BOSS
					WriteRoleValue(Boss,EM_RoleValue_register1,1)
					WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
					WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)
					CombatBegin=0										--重置戰鬥
				--[[elseif ReadRoleValue( boss , EM_RoleValue_IsDead)==1 then   --Boss死亡
					ScriptMessage( Boss, -1 , 2 , Sktalk[3] , 2 )
					Delobj(door1)
					for i=1,4 do
						DelObj(pai[i])
					end
					sleep(50)
					break--]]
				end
			end	
		end
	end
end

function un_zone30_Boss()
	local Boss = OwnerID()
	local phase = ReadRoleValue(Boss,EM_RoleValue_register1)  --階段
	local ttime = 0
	local reg

	WriteRoleValue(Boss,EM_RoleValue_register2,1)
	LockHP( Boss ,220 , "un_zone212_bossrun" )
	while 1 do
	phase = ReadRoleValue(Boss,EM_RoleValue_register1)
	reg = ReadRoleValue(Boss,EM_RoleValue_register2)
	sleep(10)
	
		if reg == 1 then
			if phase == 1 then
				ttime = ttime + 1
				if ttime % 15 == 0 then --放招 唱法4秒
					CastSpelllv( Boss,  Boss, 499251,7 )
				end
				if ttime >= 24 then --轉成一直全場AOE模式
					ScriptMessage( Boss, -1 , 2 ,"[SC_106665_04]" , 2 ) --放絕招說話
					WriteRoleValue(Boss,EM_RoleValue_register1,0)
					ttime = 0
				end
			else  --一直全場AOE
				
				sysCastSpellLv(Boss,Boss,499252,0)
			end
		end
	end
end
function un_zone212_bossrun()  -- 走旗標
	local ctrl = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	SetStopAttack(OwnerID() )
	SetModeEx(OwnerID(),EM_SetModeType_Fight,false)	
	SetModeEx(OwnerID(),EM_SetModeType_Searchenemy,false)	
	
	WriteRoleValue(Ctrl,EM_RoleValue_register1,0)
	WriteRoleValue(OwnerID(),EM_RoleValue_register2,0)

end

function un_zone212_pai1()
	SetPlot( OwnerID(),"touch","un_zone212_pai1_1",30 )--觸碰劇情
	AddBuff( OwnerID(), 622099, 0, -1 ) --物品發光
	WriteRoleValue(OwnerID(),EM_RoleValue_register1,0)
end
function un_zone212_pai1_1()
	sysCastSpellLv(OwnerID(),OwnerID(),499253,0)
	SetPlot( TargetID(),"touch","",30 )
	cancelbuff(TargetID(),622099)
	sleep(200)
	beginplot(TargetID(),"un_zone212_pai1",0)
end
function un_zone212_pai1_2()
	SetPlot( OwnerID(),"touch","un_zone212_pai1_1_2",30 )--觸碰劇情
	AddBuff( OwnerID(), 622099, 0, -1 ) --物品發光
	WriteRoleValue(OwnerID(),EM_RoleValue_register1,0)
end
function un_zone212_pai1_1_2()
	sysCastSpellLv(OwnerID(),OwnerID(),499253,0)
	SetPlot( TargetID(),"touch","",30 )
	cancelbuff(TargetID(),622099)
	sleep(200)
	beginplot(TargetID(),"un_zone212_pai1_2",0)
end
--------------------------------------------------------------------------------
function un_zone212_pai2()
	SetPlot( OwnerID(),"touch","un_zone212_pai2_1",30 )--觸碰劇情
	AddBuff( OwnerID(), 622100, 0, -1 ) --物品發光
	WriteRoleValue(OwnerID(),EM_RoleValue_register1,0)
end
function un_zone212_pai2_1()
	local Boss = ReadRoleValue(TargetID(),EM_RoleValue_PID)
	WriteRoleValue(Boss,EM_RoleValue_register1,1)
	SetPlot( TargetID(),"touch","",30 )
	cancelbuff(TargetID(),622100)
	sleep(200)
	beginplot(TargetID(),"un_zone212_pai2",0)
end
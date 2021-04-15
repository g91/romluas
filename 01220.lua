

function LuaS_101586_0()
	local OldOne = ReadRoleValue(OwnerID() , EM_RoleValue_PID)
	local ObjID
	if	CheckID(OldOne)	then
		if	ReadRoleValue(OwnerID() , EM_RoleValue_RoomID) == ReadRoleValue( OldOne , EM_RoleValue_RoomID) then --如果同一層那就是舊的PID，每觸發一次換一隻新的
			DelObj(OldOne)
		end
	end
	if	ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID) == 113	then	--種出來的NPC隨ZONEID變化
		ObjID = Lua_DW_CreateObj( "flag" , 101586 , 780014 , 4 , 0 ) --35
	else
		ObjID = Lua_DW_CreateObj( "flag" , 101882 , 780014 , 4 , 0 ) --50
	end
	NPCAttackFlag(ObjID) --將戰鬥關掉
	SetRoleCamp( ObjID  , "Visitor" );
	AddToPartition( ObjID ,ReadRoleValue(OwnerID() , EM_RoleValue_RoomID ) )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , ObjID ) --把新的樣板銅釘寫入蘑菇人的PID
	SetPlot(OwnerID() , "range" , "LuaS_101586_1" , 100)
end


function LuaS_101586_1()
	SetPlot(TargetID() , "range" , "" , 0) -- 避免重複觸發
	BeginPlot( TargetID() , "LuaS_101586_2" , 0 ) --開始挑戰流程
end

function LuaS_101586_2()
	local Boss
	Ver_Zone113_IceDrawf[ReadRoleValue(OwnerID() , EM_RoleValue_RoomID )] = 0  --初始化全域變數

	local Door2 = Lua_DW_CreateObj( "flag" , 112224 , 780014 , 3  , 0) --切斷退路
	--產生阻擋
	SetModeEx( Door2 , EM_SetModeType_Obstruct , true ) 
	SetModeEx( Door2 , EM_SetModeType_Mark , false ) 
	AddToPartition( Door2,ReadRoleValue(OwnerID() , EM_RoleValue_RoomID ) ) --Addtopartition 才會產生作用
	local Four = {} --依照區域資訊決定出場戰將
	if	ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID) == 113	then
		Four = {101664 , 101665 , 101666 , 101667 }--35級
	else
		Four = {101886 , 101887 , 101888 , 101889 }--50級
	end
	local ObjID = ReadRoleValue(OwnerID() , EM_RoleValue_PID ) --找出樣板銅釘的ID
	ScriptMessage(ObjID , -1 , 2 , "[SC_101586_1]" , 0 )
	sleep(20)
	ScriptMessage(ObjID , -1 , 2 , "[SC_101586_2]" , 0 )
	sleep(10)
	--Round one
	local Rand = DW_Rand(table.getn(Four)) --四選一
	local Obj1 = Lua_DW_CreateObj( "flag" , Four[Rand] , 780014 , 1 , 1 , 1 )
	SetPlot(Obj1 , "dead" , "LuaS_101586_3" , 0 ) --死了之後改變全域變數狀態
	local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
	local ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- 接暫存值
		SetAttack( Obj1 , ThesePlayer[i] ) -- 全部送進仇恨
	end
	WriteRoleValue(Obj1 , EM_RoleValue_PID , 2) --調整叫人範圍
	BeginPlot(Obj1,"Lua_DW_CallHelper" , 0) --叫人
	table.remove(Four,Rand)
	sleep(200)
	while true do
		sleep(30)
		--是否進入下一階段
		if	Ver_Zone113_IceDrawf[ReadRoleValue(OwnerID() , EM_RoleValue_RoomID )] == 1	then
			break
		end
		--離開戰鬥後處置
		if	ReadRoleValue(Obj1,EM_RoleValue_IsAttackMode)~=1	then
			DelObj(Obj1)
			DelObj(Door2)
			BeginPlot( OwnerID() , "LuaS_101586_0" , 1 )
			return
		end
	end
	sleep(20)
	ScriptMessage(ObjID , -1 , 2 , "[SC_101586_3]" , 0 )
	sleep(10)
	--Round two
	local Rand = DW_Rand(table.getn(Four))
	local Obj2 = Lua_DW_CreateObj( "flag" , Four[Rand] , 780014 , 1 , 1 , 1 )
	SetPlot(Obj2 , "dead" , "LuaS_101586_3" , 0 )
	TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
	ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- 接暫存值
		SetAttack( Obj2 , ThesePlayer[i] ) -- 全部送進仇恨
	end
	WriteRoleValue(Obj2 , EM_RoleValue_PID , 2) --調整叫人範圍
	BeginPlot(Obj2,"Lua_DW_CallHelper" , 0) --叫人
	table.remove( Four , Rand )
	sleep(200)
	while true do
		sleep(30)
		--是否進入下一階段
		if	Ver_Zone113_IceDrawf[ReadRoleValue(OwnerID() , EM_RoleValue_RoomID )] == 2	then
			break
		end
		--離開戰鬥後處置
		if	ReadRoleValue(Obj2 ,EM_RoleValue_IsAttackMode)~=1	then
			DelObj(Obj2)
			DelObj(Door2)
			BeginPlot( OwnerID() , "LuaS_101586_0" , 1 )
			return
		end
	end


	--Round Three
	ScriptMessage(ObjID , -1 , 2 , "[SC_101586_4]" , 0 )
	DelObj( ObjID )
	sleep(50)
	if	ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID) == 113	then--依照區域資訊決定出場戰將
		Boss = Lua_DW_CreateObj( "flag" , 101586 , 780014 , 1 , 1 , 1 ) --35
	else
		Boss = Lua_DW_CreateObj( "flag" , 101882 , 780014 , 1 , 1 , 1 )--50
	end
	SetPlot(Boss , "dead" , "LuaS_101586_3" , 0 )
	TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
	ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- 接暫存值
		SetAttack( Boss , ThesePlayer[i] ) -- 全部送進仇恨
	end
	sleep(200)
	local Help1 = 1 -- 助陣1
	local Help2 = 1 -- 助陣2
	local Sec = 0 --計時
	local HardLv = 0
	while true do
		sleep(10)
		Sec = Sec + 1
		--是否進入下一階段
		if	Ver_Zone113_IceDrawf[ReadRoleValue(OwnerID() , EM_RoleValue_RoomID )] == 3	then
			break
		end

		if	ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID) == 114	then --進階版 呼叫援軍
			if	table.getn(Four) == 2	and
				Sec >= 10		then
				ScriptMessage(OwnerID() , -1 , 2 , "[SC_101586_6]" , 0 )
				local Rand = DW_Rand(table.getn(Four))
				Help1 = Lua_DW_CreateObj( "flag" , Four[Rand] , 780014 , 1 , 1 , 1 )
				TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
				ThesePlayer = {}
				for i=1,TempPlayer do
					ThesePlayer[i] = GetSearchResult() -- 接暫存值
					SetAttack( Help1 , ThesePlayer[i] ) -- 全部送進仇恨
				end
				table.remove( Four , Rand )
				BeginPlot(Help1,"LuaS_101586_7" , 0)
				BeginPlot(Help1,"LuaS_Discowood_CheckPeace",0)
				Sec = 0
			end
			if	table.getn(Four) == 1	and
				Help2 == 1		and
				Sec >= 30		then
				ScriptMessage(OwnerID() , -1 , 2 , "[SC_101586_7]" , 0 )
				Help2 = Lua_DW_CreateObj( "flag" , Four[1] , 780014 , 1 , 1 , 1 )
				TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
				ThesePlayer = {}
				for i=1,TempPlayer do
					ThesePlayer[i] = GetSearchResult() -- 接暫存值
					SetAttack( Help2 , ThesePlayer[i] ) -- 全部送進仇恨
				end
				table.remove( Four , Rand )
				BeginPlot(Help2,"LuaS_101586_7" , 0)
				BeginPlot(Help2,"LuaS_Discowood_CheckPeace",0)
				Sec = 0
			end

			--援軍11111
			if	Help1 ~= 1	and
				Help1 ~= nil	then
				if	Sec >= 15	and --叫出後15秒
					CheckBuff(Help1,503405)	and --盾尚在
					ReadRoleValue(Help1,EM_RoleValue_Register6) == 1	then--施法完畢
					CancelBuff(Help1,503405)--除盾開殺
					HardLv = HardLv + 1--難度增加
					Sec = 0--秒數歸零
				end
				if	ReadRoleValue(Help1,EM_RoleValue_Register6) == 0	and --沒有施法完成
					ReadRoleValue(Help1,EM_RoleValue_IsDead) == 0	and -- 還活著
					not	CheckBuff(Help1,503405)			and
					CheckID(Help1)					and
					Sec > 5						then
					NPCDead( Help1 , Help1 )
					ScriptMessage(OwnerID() , -1 , 2 , "[SC_101586_8]" , 0 ) --矮人將軍被儀式的魔力反噬而亡
				end
			end
			--援軍2222
			if	Help2 ~= 1	and
				Help2 ~= nil	then
				if	Sec >= 15	and--叫出後15秒
					CheckBuff(Help2,503405)	and--盾尚在
					ReadRoleValue(Help2,EM_RoleValue_Register6) == 1	then --施法完畢
					CancelBuff(Help2,503405) --除盾開殺
					HardLv = HardLv + 2  --難度增加
					Sec = 0 --秒數歸零
				end
				if	ReadRoleValue(Help2,EM_RoleValue_Register6) == 0	and--沒有施法完成
					ReadRoleValue(Help2,EM_RoleValue_IsDead) == 0	and -- 還活著
					not	CheckBuff(Help2,503405)			and
					CheckID(Help2)					and
					Sec > 5						then
					NPCDead( Help2 , Help2 )
					ScriptMessage(OwnerID() , -1 , 2 , "[SC_101586_8]" , 0 ) --矮人將軍被儀式的魔力反噬而亡
				end
			end

			-- 難度加強的調整

			if	HardLv == 3	then
				if	ReadRoleValue(Help1,EM_RoleValue_IsDead)==0	and
					CheckID(Help1)					then
					if	CheckID(Help1)	then
						AddBuff(Help1,503411,10,2)
					end
					if	CheckID(Boss)	then
						AddBuff(Boss,503411,10,2)
					end
					if	CheckID(Help2)	then
						AddBuff(Help2,503411,10,2)
					end
				end
				if	ReadRoleValue(Help2,EM_RoleValue_IsDead)==0	and
					CheckID(Help2)					then
					TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
					ThesePlayer = {}
					for i=1,TempPlayer do
						ThesePlayer[i] = GetSearchResult() -- 接暫存值
						AddBuff(ThesePlayer[i],503412,10,2)
					end
				end
			else
				if	HardLv == 1	then
					if	ReadRoleValue(Help1,EM_RoleValue_IsDead)==0		and
						CheckID(Help1)						then
						if	CheckID(Help1)	then
							AddBuff(Help1,503411,10,2)
						end
						if	CheckID(Boss)	then
							AddBuff(Boss,503411,10,2)
						end
						if	CheckID(Help2)	then
							AddBuff(Help2,503411,10,2)
						end
					end
				end

				if	HardLv == 2	then
					if	ReadRoleValue(Help2,EM_RoleValue_IsDead)==0		and
						CheckID(Help2)						then
						TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
						ThesePlayer = {}
						for i=1,TempPlayer do
							ThesePlayer[i] = GetSearchResult() -- 接暫存值
							AddBuff(ThesePlayer[i],503412,10,2)
						end
					end
				end
			end


		end
		--離開戰鬥後處置
		if	ReadRoleValue(Boss ,EM_RoleValue_IsAttackMode)~=1	then
			if 	CheckID(Help1)	then --如果已產生要處理掉
				DelObj(Help1)
			end
			if 	CheckID(Help2)	then --如果已產生要處理掉
				DelObj(Help2)
			end
			DelObj(Boss)
			DelObj(Door2)
			BeginPlot( OwnerID() , "LuaS_101586_0" , 1 )
			return
		end
	end

	while	CheckID(Help1)	or   --如果援軍有出現就等援軍死光再開門
		CheckID(Help2)	do
		sleep(10)
	end
	--死光了才進入開門階段
	Ver_Zone113_IceDrawf[ReadRoleValue(OwnerID() , EM_RoleValue_RoomID )] = Ver_Zone113_IceDrawf[ReadRoleValue(OwnerID() , EM_RoleValue_RoomID )] + 2
	--送獎品了
	if	HardLv < 3	and
		HardLv ~= 0	then
		local Box1 = Lua_DW_CreateObj("flag",102014,780014,5)
		NPCAttackFlag(Box1)
		SetPlot(Box1,"touch","Lua_DW_Chest",45)
		ScriptMessage(Box1 , -1 , 0 , "111111" , 0 ) 
	end
	if	HardLv == 3	then
		local Box1 = Lua_DW_CreateObj("flag",102014,780014,5)
		local Box2 = Lua_DW_CreateObj("flag",102015,780014,6)
		NPCAttackFlag(Box1)
		NPCAttackFlag(Box2)
		SetPlot(Box1,"touch","Lua_DW_Chest",45)
		SetPlot(Box2,"touch","Lua_DW_Chest",45)
	end
	DelObj(Door2)
end

function LuaS_101586_3()
	Ver_Zone113_IceDrawf[ReadRoleValue(OwnerID() , EM_RoleValue_RoomID )] = Ver_Zone113_IceDrawf[ReadRoleValue(OwnerID() , EM_RoleValue_RoomID )] + 1  -- 判斷計數加一
	if	ReadRoleValue( OwnerID() , EM_RoleValue_OrgID ) == 101586	then  --銅釘死的時候有特殊表演
		ScriptMessage(OwnerID() , -1 , 2 , "[SC_101586_5]" , 0 )
	end
	return true
end

function LuaS_101586_4()
	Ver_Zone113_IceDrawf[ReadRoleValue(OwnerID() , EM_RoleValue_RoomID )] = 0  --初始化全域變數
	if	ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID ) == 114	then -- 門的特別判斷  50級有觸碰劇情
		BeginPlot(OwnerID(),"LuaS_101586_5",0)
	end
end


function LuaS_101586_5()
	while true do
		sleep(20)
		if	Ver_Zone113_IceDrawf[ReadRoleValue(OwnerID() , EM_RoleValue_RoomID )] == 5	then
			Hide(OwnerID())
			break
		end
	end
end

function LuaS_101586_6()
	WriteRoleValue(OwnerID(),EM_RoleValue_Register6,1)
end

function LuaS_101586_7()
	CastSpell(OwnerID(),OwnerID(),493185)
	AddBuff(OwnerID(),503405,500,20)
end
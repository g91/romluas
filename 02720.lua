--z24佈置=======================================
--=======================================
--充滿自然之力的土壤
-------------------------------------------------------------------
function LuaPG_Z24_Forest_Earth()
	local Earth = OwnerID()
	CastSpell(Earth, Earth, 850388)
end


--=======================================
--正常、瘋狂怪物兩組互換
-------------------------------------------------------------------
function LuaPG_Z24_Crazy_Change()	--6隻主動，6隻被動，7隻隨機
	local Center = OwnerID()
	local x,y,z,dir=DW_Location(Center)
	local RoomID = ReadRoleValue(Center, EM_RoleValue_RoomID)
	local AnimalNum = ReadRoleValue(Center, EM_RoleValue_Register3)
	local CenPID = ReadRoleValue(Center, EM_RoleValue_PID)
	local AnimalNum = Rand(2)+1
	local MonsterAnimal
	local MonsterList = {}
	MonsterList[1]={107084, 107135}
	MonsterList[2]={107085, 107136}
--	Say(Center, "AYA")
	
	Sleep(900)	
	if CenPID == 1		then
		MonsterAnimal = CreateObj(MonsterList[1][AnimalNum], X, Y, Z , Dir, 1 )	--生成怪物
		WriteRoleValue(MonsterAnimal , EM_RoleValue_IsWalk , 1 )
		AddToPartition(MonsterAnimal, RoomID)
	elseif CenPID == 2	then
		MonsterAnimal = CreateObj( MonsterList[2][AnimalNum], X, Y, Z , Dir, 1 )
		WriteRoleValue(MonsterAnimal , EM_RoleValue_IsWalk , 0 )
		AddToPartition(MonsterAnimal, RoomID)
	end
	
	BeginPlot(MonsterAnimal, "LuaPG_Z24_Crazy_MoveMove", 0)
	WriteRoleValue(Center,EM_RoleValue_Register3,1)				--將中控記值，用來扣除判斷是否重製
	WriteRoleValue(MonsterAnimal,EM_RoleValue_Register2,Center)			--將中控紀錄在怪物上
end

function LuaPG_Z24_Crazy_MoveMove()
	local MonsterAnimal = OwnerID()
	local x,y,z,dir = DW_Location(MonsterAnimal)
	while 1 do
		sleep(50)
		if HateListCount(MonsterAnimal)==0	then		----檢查有沒有在攻擊
			Move(MonsterAnimal ,x+Rand(50) ,y,z+Rand(50))
		end
	end
end


--=======================================
--城堡中下雪了
-------------------------------------------------------------------
function LuaPG_Z24_SnowBegin()	--下雪
	local Snow = OwnerID()
	local PlayerList = {}
--	DebugMsg(0,0,"test")
	CastSpell(Snow, Snow, 850387)
	while 1 do
--		DebugMsg(0,0,"test")
		PlayerList = SearchRangePlayer ( Snow , 100 )
		if #PlayerList~=0	then
			for i=0,#PlayerList do
--				SAY(PlayerList[i],"00")
				AddBuff(PlayerList[i],623751,0,60)
			end
		end
		Sleep(300)
	end	
end

function LuaPG_Z24_SnowBegin_02()	--冰種
	local Snow = OwnerID()
	CastSpell(Snow, Snow, 497196)
end

--=======================================
--425558 森林中的瘋狂魅影
---------------------------------------------------------------------------
--瘋狂之形出生機制
function LuaPG_TheyareComing()	--範圍
	DebugMsg(0,0,"LuaPG_TheyareComing")
	local Center = OwnerID()
	local x,y,z,dir=DW_Location(Center)
	local Num03 = ReadRoleValue(Center, EM_RoleValue_Register3)
	if Num03 == 0	then
		DebugMsg(0,0,"--4")
		DebugMsg(0,0,"X="..x.."Y="..y.."Z="..z.."DIR="..dir)
		SetPlot(Center,"Range","LuaPG_TheyareComing_02",80)
--		Say(Center,"00")
	end
end

function LuaPG_TheyareComing_02()
	DebugMsg(0,0,"LuaPG_TheyareComing_02")
	local Player = OwnerID()
	local Center = TargetID()
	local Num03 = ReadRoleValue(Center, EM_RoleValue_Register3)
	if Num03 == 0	then
		CallPlot(Center,"LuaPG_TheyareComing_03",Player,Center)
	end
end

function LuaPG_TheyareComing_03(Player,Center)	--中控
	DebugMsg(0,0,"LuaPG_TheyareComing_03")
--	Say(OwnerID(),"11")
	local Num03 = ReadRoleValue(Center, EM_RoleValue_Register3)
	local Monster = 107079
	local x,y,z,dir=DW_Location(Center)
	local Ball
	local CreateMon
	Sleep(20)
	if Num03==0	then
		ScriptMessage( Player, Player, 1,"[SC_Z24Q425558_01]", 0 )
		Sleep(20)
		Ball = CreateObj(119875, x, y, z , dir, 1 )						--生成隱形球做特效用
		SetModeEx(Ball, EM_SetModeType_Mark,FALSE)
		SetModeEx(Ball, EM_SetModeType_Move,FALSE)
		AddToPartition(Ball, 0)
--		SAY(Ball, "Here")
		CastSpell(Ball, Ball, 850419)
		Sleep(50)
		CreateMon = DW_CreateObjEX("obj", Monster, Ball)					--生成
		WriteRoleValue(Center, EM_RoleValue_Register3, 1)					--值紀錄在中控
		WriteRoleValue(CreateMon, EM_RoleValue_Register2, Center)				--把中控寫在怪物上
		WriteRoleValue(CreateMon , EM_RoleValue_IsWalk , 1 )
		DelObj(Ball)
		CallPlot(Center,"LuaPG_VanishfromEye",Center,CreateMon,Num03,Player)
	end
--	Say(Center, Num03)
end

function LuaPG_DeleteorNot()	--怪物的產生劇情
	DebugMsg(0,0,"LuaPG_DeleteorNot")
	local CreateMon = OwnerID()
	local Center = ReadRoleValue(CreateMon, EM_RoleValue_Register2)
	local Num03 = ReadRoleValue(Center, EM_RoleValue_Register3)
	BeginPlot( CreateMon, "LuaPG_107079_HangingAround", 2)
	while 1 do
		sleep(600)
		if HateListCount(CreateMon)==0	then		----檢查仇很列表，沒有人的話
--			Say(CreateMon, "0101")
			Num03 = Num03-1
			WriteRoleValue(Center,EM_RoleValue_Register3,Num03)
			CallPlot( Center, "LuaPG_DeleteorNot_02", Center)
			DelObj(CreateMon)				----刪掉自己			
			break
		end
	end
end

function LuaPG_DeleteorNot_02(Center)
	DebugMsg(0,0,"LuaPG_DeleteorNot_02")
	Sleep(300)
	DebugMsg(0,0,"--1")
	CallPlot(Center,"LuaFunc_ResetObj",Center)	--中控重置
end

function LuaPG_107079_HangingAround()
	DebugMsg(0,0,"LuaPG_107079_HangingAround")
	local CreateMon = OwnerID()
	local x,y,z,dir = DW_Location(CreateMon)
	while 1 do
		sleep(50)
		if HateListCount(CreateMon)==0	then		----檢查有沒有在攻擊
			WriteRoleValue(CreateMon , EM_RoleValue_IsWalk , 1)  
			Move(CreateMon ,x+Rand(50) ,y,z+Rand(50))
		end
	end
end

function LuaPG_VanishfromEye(Center,CreateMon,Num03,Player)
	DebugMsg(0,0,"LuaPG_VanishfromEye")
	while 1 do
		Num03 = ReadRoleValue(Center, EM_RoleValue_Register3)
		if Num03==0	then
			Sleep(300)
--			Say(Center, Num03)
			DebugMsg(0,0,"--2")
			CallPlot(Center,"LuaFunc_ResetObj",Center)	--中控重置
			break
		end
		Sleep(50)
	end
end

function LuaPG_WhenTheyDie()
	DebugMsg(0,0,"LuaPG_WhenTheyDie")
	local CreateMon = OwnerID()
	local Center = ReadRoleValue(CreateMon, EM_RoleValue_Register2)
	local Num03 = ReadRoleValue(Center, EM_RoleValue_Register3)
	if Num03 >0	then
		Num03 = Num03-1					--死亡的時候中控會減值
		WriteRoleValue(Center,EM_RoleValue_Register3,Num03)
	end
end



--=======================================
--森林的怪物們
-------------------------------------------------------------------
function LuaPG_MoriNoNakaNi()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_BUFF_SP01)
end

function LuaPG_MoriNoNakaNi_02()
	CastSpell(OwnerID(), OwnerID(), 850426)
end


--=======================================
--24到25的過渡劇情
-------------------------------------------------------------------
function LuaPG_CantnotPassto25()	--範圍
	local NPC = OwnerID()
	SetPlot(NPC,"Range","LuaPG_CantnotPassto25_02",80)
end

function LuaPG_CantnotPassto25_02()
	Yell(TargetID(), "[SC_CANTNOTPASSTO25]",3)
end

function LuaPG_CantnotPassto25_03()	--範圍
	local NPC = OwnerID()
	LuaS_Discowood_Combat_1H()
	SetPlot(NPC,"Range","LuaPG_CantnotPassto25_02",80)
end

function lua_peggy_01()
local x=2
local y=1
	while x<=4 do
		while y<=9 do
			say(ownerID(),x.."x"..y.."="..x*y)
			sleep(10)
			y=y+1
		end
		x=x+1
		y=1
	end
end
----------------------------------

function lua_peggy_02()
	local peiTable={}
	peiTable={1,2,3,4,5}
		for i=1,5 do
			local x=rand(5)+1
			say(ownerID(), peitable[x])
			sleep(10)
		end

end
----------------------------------
function lua_peggy_03()
	SetSpeakDetail( OwnerID(), GetString("SD_110000_1") )
end

----------------------------------
function lua_PG_Q1()
	local Man = OwnerID()
	local CenterX =ReadRoleValue(Man, EM_ROLEVALUE_X)
	local CenterY =ReadRoleValue(Man, EM_ROLEVALUE_Y)
	local CenterZ =ReadRoleValue(Man, EM_ROLEVALUE_Z)
	local FireList = {}
	local X = {}
	local Z = {}
	local RoomID=ReadRoleValue(Man, EM_RoleValue_RoomID)
	local Manz = 0
	local Manx = 0

	for i = 1,10 do
		X[i] = CenterX - 50 * math.cos(math.pi*2*(i/10))
		Z[i] = CenterZ + 50 * math.sin(math.pi*2*(i/10))
		FireList[i] = CreateObj( 100292, X[i], CenterY, Z[i], 0, 1 )
		WriteRoleValue(FireList[i]  ,EM_RoleValue_IsWalk , 0 ) 
		AddToPartition( FireList[i], RoomID )	
	end

	while true do
		Sleep(40)		
		Manx = RandRange(1,70)-35
		Manz = RandRange(1,70)-35
		Move(Man, CenterX+Manx, CenterY, CenterZ+Manz)
		for i = 1,10 do
			Move(FireList[i], X[i]+Manx, CenterY, Z[i]+Manz)		
		end
	end
end

----------------------------------
function LuaPG_test()--Ĳ�I�@��
	SetCursorType( OwnerID() , 13)
	SetPlot( OwnerID(),"touch","LuaPG_test_01",40 )
end

function LuaPG_test_03()
	ScriptMessage( Player, Player, 1,"[SC_424932_02]", "0xffbf0b2b" )
end
function LuaPG_425549_SimplyFlying()
	local Box = OwnerID()
	local RoomID = ReadRoleValue(Box, EM_RoleValue_RoomID)
	local X = ReadRoleValue( Box, EM_RoleValue_X )
	local Y = ReadRoleValue( Box, EM_RoleValue_Y )
	local Z = ReadRoleValue( Box, EM_RoleValue_Z )
	local Dir = ReadRoleValue( Box, EM_RoleValue_Dir )
	local Monster = LuaFunc_SearchNPCbyOrgID( Box, 107081, 200, 0 )
	local Gill = CreateObj( 121145, X, Y, Z , Dir, 1 )
	AddToPartition( Gill, RoomID)
	ks_ActSetMode( Gill )
	SetModeEx( Gill, EM_SetModeType_Gravity , false )
	SetModeEx( Gill, EM_SetModeType_Searchenemy,false)
	SetDefIdleMotion( Gill, ruFUSION_MIME_JUMP_LOOP)
	Sleep(30)
	WriteRoleValue( Gill, EM_RoleValue_IsWalk , 0)
	SetDefIdleMotion( Gill, ruFUSION_MIME_RUN_FORWARD)
	SetModeEx( Gill, EM_SetModeType_Searchenemy,true)
	SetAttack(Gill, Monster)
	Say(Gill,"00")
	while true do
		if  ReadRoleValue( Monster, EM_RoleValue_IsDead ) == 1	then
			SetModeEx( Gill, EM_SetModeType_Move, false )
			SetDefIdleMotion( Gill, ruFUSION_MIME_IDLE_STAND)
			break
		end
		Sleep(10)
	end
end

function LuaPG_FindIt()
	local Player = OwnerID()
	local NPC = TargetID()
	local OrgID = ReadRoleValue( NPC, EM_RoleValue_OrgID)
	local X = ReadRoleValue( NPC, EM_RoleValue_X )
	local Y = ReadRoleValue( NPC, EM_RoleValue_Y )
	local Z = ReadRoleValue( NPC, EM_RoleValue_Z ) 
	SearchRangeNPC(Player, 300)
	if OrgID == 106828 or OrgID == 107242	then
		Say(Player, "X"..X..",Y"..Y..",Z"..Z)
	end
	Say(Player, "X")
end

function LuaPG_SayTest()
	AddBuff( OwnerID(),509030,0,-1)
end

function LuaPG_SayTest_02()
	AddBuff( OwnerID(),506983,0,-1)
end

function LuaPG_XX()
	SAY(OwnerID(),"[SC_425550_01]")
end

function LuaPG_Practice_1112()
for i=1,2 do
	Say(OwnerID(), "[SC_SNOWMAN_GROUP01_"..i.."]")
end
end

function LuaPG_Homework_121130()
	local Player = OwnerID()
	local x,y,z,dir=DW_Location(Player)
	local RoomID = ReadRoleValue(Player, EM_RoleValue_RoomID)
	local Center =CreateObj(121065, x,y,z,dir,RoomID )				--�ХX����
	AddToPartition(Center, 0)				
	CallPlot(Center,"LuaPG_Homework_121130_01",Player,Center,x,y,z,dir,RoomID)	--�N���q��b�����]
end

function LuaPG_Homework_121130_01(Player,Center,x,y,z,dir,RoomID)
	local Box = 110987
	local BoxList = {}
	local MonoList = {116703,116704,116707,116708,116709,116710,116712,116703,116704,116707}	--�H���M��(10�H)
	local SitList = {}
	local SitPerson = {}
	local RandNum
	for i = 1,10 do									--�����ͥX�e�誺�c�l�M�W�誺�H��
		RandNum = Rand(#MonoList)+1
		SitList[i] = table.remove(MonoList,RandNum)				--���s��A�קK�������
		BoxList[i] = CreateObj(Box, x+50*i*math.cos(dir*(math.pi/180)),y,z-50*i*math.sin(dir*(math.pi/180)),dir,1 )	--�����ͥX�e�誺�c�l
		SitPerson[i] = CreateObj(SitList[i], (x-2)+50*i*math.cos(dir*(math.pi/180)),y+10,z-50*i*math.sin(dir*(math.pi/180)),dir,1 )	--�����ͥX�c�l�W�誺�H��
		SetModeEx( SitPerson[i], EM_SetModeType_Gravity , false )		--���O����
		AddToPartition(SitPerson[i], 0)
		AddToPartition(BoxList[i], 0)
		PlayMotionEX( SitPerson[i], ruFUSION_ACTORSTATE_SIT_CHAIR_BEGIN,ruFUSION_ACTORSTATE_SIT_CHAIR_LOOP)
	end
	CallPlot(Center,"LuaPG_Homework_121130_02",Player,Center,SitPerson,BoxList)	--�����n�H�ɱ����a����m
end

function LuaPG_Homework_121130_02(Player,Center,SitPerson,BoxList)
	while 1 do
		if CheckDistance( Player, Center, 600)==false	then			--�p�G���a���b�Z�����F�A�N����
			for i=1,10 do
				DelObj(SitPerson[i])
				DelObj(BoxList[i])
			end
			DelObj(Center)
		end
		Sleep(50)
	end
end
	
function LuaPG_Sleepgetup()
	local New_Kub= OwnerID()
	ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_Z25Q426128_2]", "0xff75befb" )
	ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_Z25Q426128_2]", "0xff75befb" )
	SLEEP(50)
end

function LuaPG_426255_TRYTRY()
	local Floor = OwnerID()
	Sleep(50)
	PlayMotion(Floor, ruFUSION_ACTORSTATE_ATTACK_1H_SP)
end


function LuaPG_Egg_Center()	--�������ͼ@��
	local Center = OwnerID()
	local Egg = {}
	local EggNum = 0			--�J���ƶq�p��
	local New_EggNum			--�s���J��
	local Monster				--��^��
	local WalkFlag = 781337 
	for i = 1,4 do
		Egg[i] = CreateObjByFlag(105355 , WalkFlag, i, 1)	--��4���J
		AddToPartition(Egg[i], 0)
		--�ݳJ���S���n�]�w����
		WriteRoleValue(Egg[i], EM_RoleValue_Register1, Center)		--�⤤�����s���g�i�h�J���Ĥ@�ӼȦs��
		EggNum = EggNum+1	--1���J�N�[1
		WriteRoleValue(Center, EM_RoleValue_Register2, EggNum)		--��J���ƶq�g�i�h��������2�ӼȦs��
		Say(Center, EggNum)
	end


	while 1 do
		New_EggNum= ReadRoleValue(Center, EM_RoleValue_Register2)	--�j��@���ˬd�J����
		Say(Center, "New_EggNum = "..New_EggNum)		
		if New_EggNum==0	then	--�p�G�J���S�F
			Monster = CreateObjByFlag(105355 , WalkFlag, 5, 1)	--��4���J
			AddToPartition(Monster, 0)
			WriteRoleValue(Monster, EM_RoleValue_Register1, Center)	--�⤤�����s���g�i�h��^�Ǫ��Ĥ@�ӼȦs��
			break
		end
		Sleep(10)
	end
end

function LuaPG_Egg_Die()	--�J�����`�@��
	SetModeEX (  OwnerID(), EM_SetModeType_Show , false );
end

function LuaPG_OldBringNew_test()
	local PlayerID = OwnerID()
	
	if DW_CheckQuestAccept("or",PlayerID,427028) == false	then
		Say(PlayerID,"00")
		return false
	end
	return true
end
function LuaPG_AC2_TEST_SP()
	local Player = OwnerID()
	local NPC = TargetID()
	if countbodyitem(Player,243091)>0 then
		LoadQuestOption(Player)
	else
		closespeak(Player)
		DisableQuest( Ctrl, true )
	end
end
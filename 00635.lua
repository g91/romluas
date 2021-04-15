function SAYXYZ()
	local Obj = Role:new( OwnerID() )
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	Say(OwnerID(),"X="..BaseX.." Y="..BaseY.." Z="..BaseZ.." Dir="..BaseDir)
end
function DavisSetRoleCamp(ID)
	SetRoleCampID(OwnerID() , ID)
end
function DavisGetRoleCamp(TargetID)
	local Camp = GetRoleCampID(TargetID)
	Say(OwnerID(),Camp)
end

function Lua_usetimes()
	local item = {550898, 550901, 550394, 550855, 550845, 550848, 550849, 550858, 550861, 550511, 550524, 550490, 550500, 550903, 550519, 550902, 550503, 550904, 550905, 550528, 550561, 550574, 550534, 550541, 550549, 550546, 550904, 550567}
	for i =1,table.getn(item) do
		GiveBodyitem(OwnerID(),item[i],1)
		Sleep(5)
	end
end

function Lua_usetimes_reset()
	KS_ScriptMessage( "[SC_SINTER_SKILL_4_2]" )--����
end

function DavisTesting()
	local needstr = {3, 3, 4, 5, 5, 6, 7, 8 ,9 ,11 ,12 ,14 ,16 , 18 ,21 ,24 ,28 ,32 ,37 ,43 , 49 ,56 ,65 ,75 ,86 ,99 ,114 ,131 ,150 ,173 ,199 ,228 ,263 ,302 ,347 ,400 ,459 ,528 ,608 ,699 ,804 , 924 , 1063 , 1222 , 1405 , 1616 , 1859 , 2138 , 2458 ,2827 } --�ݨD�I��
	local uppoint = 1 --�W�[�I��
	local STR = ReadRoleValue( OwnerID() , EM_RoleValue_STR )
		Say(OwnerID(), STR )
	if STR >= 50 then
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_06]"   )  --��F�j�ƪ��̤j���סA�L�k�A�I���I
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --�^��W�@�h
	else
		Say(OwnerID(), STR )
		Say(OwnerID(), STR+1 )
		Say(OwnerID(), needstr[STR+1] )
		local needpoint
		needpoint = needstr[STR+1]
		Say(OwnerID(), "[SC_OLDBRINGNEW_CHAGE01][$SETVAR1="..needpoint.."]")
	--	SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_CHAGE01][$SETVAR1="..needpoint.."]"   )  
		--�A�{�b�I��1�I[SC_OLDBRINGNEW_KEY01]�ݭn[$VAR1]�I�о��I�ơA�T�w�n�I���ܡH
	--	AddSp(OwnerID(), TargetID(), "[SC_LOSTTREASURE_08]" , "LuaS_111367_ADDSTR2", 0 ) --�T�w
	--	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --�^��W�@�h
	end
end

function DavisTesting2()	--�}�C��������
	local floor={}
	local X = {1,2,3,4,5,6,7,8,9,10}
	local Y={}
	local Z = ""
	for i=1, table.getn(X) do
		floor[i] = X[Y]
		Y[i]=rand(table.getn(X))+1
		local Yi=Y[i]
		Say(OwnerID(),"Select = "..X[Yi])
		table.remove(X,Yi)
		if table.getn(X) > 0 then
			local Z = ""
			for i=1, table.getn(X) do
				Z = Z..X[i].." "
			end
			Say(OwnerID(),"Remaining= "..Z)
		else
			Say(OwnerID(),"No More Remaining")
		end
	end
end

function DavisTesting456()
	for j=1 ,1000 do
		local Obj = Role:new( OwnerID() )
		local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
		local dis = 100	--���H�򦨪��b�|
		local BaseX = Obj :X()
		local BaseY = Obj :Y()
		local BaseZ = Obj :Z()
		local BaseDir = Obj:Dir()
		local MonsterGroup = {}
		MonsterGroup[0] =CreateObj( 101561, BaseX,BaseY,BaseZ,BaseDir, 1 )
		MonsterGroup[1] =CreateObj( 101561, BaseX+dis*math.cos(math.pi/8),BaseY,BaseZ+dis*math.sin(math.pi/8),BaseDir, 1 )
		MonsterGroup[2] =CreateObj( 101561, BaseX+dis*math.cos(math.pi/8),BaseY,BaseZ-dis*math.sin(math.pi/8),BaseDir, 1 )
		MonsterGroup[3] =CreateObj( 101561, BaseX-dis*math.cos(math.pi/8),BaseY,BaseZ+dis*math.sin(math.pi/8),BaseDir, 1 )
		MonsterGroup[4] =CreateObj( 101561, BaseX-dis*math.cos(math.pi/8),BaseY,BaseZ-dis*math.sin(math.pi/8),BaseDir, 1 )
		MonsterGroup[5] =CreateObj( 101561, BaseX+dis*math.cos(math.pi/4),BaseY,BaseZ+dis*math.sin(math.pi/4),BaseDir, 1 )
		MonsterGroup[6] =CreateObj( 101561, BaseX+dis*math.cos(math.pi/4),BaseY,BaseZ-dis*math.sin(math.pi/4),BaseDir, 1 )
		MonsterGroup[7] =CreateObj( 101561, BaseX-dis*math.cos(math.pi/4),BaseY,BaseZ+dis*math.sin(math.pi/4),BaseDir, 1 )
		MonsterGroup[8] =CreateObj( 101561, BaseX-dis*math.cos(math.pi/4),BaseY,BaseZ-dis*math.sin(math.pi/4),BaseDir, 1 )
		MonsterGroup[9] =CreateObj( 101561, BaseX+dis*math.cos(math.pi*3/8),BaseY,BaseZ+dis*math.sin(math.pi*3/8),BaseDir, 1 )
		MonsterGroup[10] =CreateObj( 101561, BaseX+dis*math.cos(math.pi*3/8),BaseY,BaseZ-dis*math.sin(math.pi*3/8),BaseDir, 1 )
		MonsterGroup[11] =CreateObj( 101561, BaseX-dis*math.cos(math.pi*3/8),BaseY,BaseZ+dis*math.sin(math.pi*3/8),BaseDir, 1 )
		MonsterGroup[12] =CreateObj( 101561, BaseX-dis*math.cos(math.pi*3/8),BaseY,BaseZ-dis*math.sin(math.pi*3/8),BaseDir, 1 )
		MonsterGroup[13] =CreateObj( 101561, BaseX+dis,BaseY,BaseZ,BaseDir, 1 )
		MonsterGroup[14] =CreateObj( 101561, BaseX,BaseY,BaseZ-dis,BaseDir, 1 )
		MonsterGroup[15] =CreateObj( 101561, BaseX-dis,BaseY,BaseZ,BaseDir, 1 )
		MonsterGroup[16] =CreateObj( 101561, BaseX,BaseY,BaseZ+dis,BaseDir, 1 )
		for i = 0, table.getn(MonsterGroup) do
			AddToPartition(MonsterGroup[i],0)
			SetRandMove( MonsterGroup[i] , 30 ,  20 , 30 )
		end
		Sleep(50)
		for i = 0, table.getn(MonsterGroup) do
			DelObj( MonsterGroup[i])
		end
	end
end

function DavisTesting8()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Firework = {}
	Firework[0] = CreateObj( 101330, 4417, -20, 4179, 20, 1)
	Firework[1] = CreateObj( 101330, 4483, -20, 4313, 20, 1)
	Firework[2] = CreateObj( 101330, 4452, -20, 4240, 20, 1)
	Firework[3] = CreateObj( 101330, 4427, -20, 4203, 20, 1)
	Firework[4] = CreateObj( 101330, 4466, -20, 4271, 20, 1)
	ScriptMessage( OwnerID(),  -1, 2, "First Winner is "..GetName( OwnerID() ) , 0 )
	ChangeZone( OwnerID(), 350 , RoomID , 4707 , -25, 4107, 10)
--	AddBuff(OwnerID(),502690,0,-1)
	SetPlot( TargetID() , "Collision" , "DavisTesting9" , 50 )
	for i = 0, table.getn(Firework) do
		SetModeEx( Firework[i], EM_SetModeType_Fight , false )--�i�������
		SetModeEx( Firework[i], EM_SetModeType_Strikback, false )--����
		SetModeEx( Firework[i], EM_SetModeType_Mark, false )--�аO
		SetModeEx( Firework[i], EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( Firework[i], EM_SetModeType_Obstruct, false )--����
		SetModeEx( Firework[i], EM_SetModeType_Gravity, false )--���O
		SetModeEx( Firework[i], EM_SetModeType_Move, false )--����
		SetModeEx( Firework[i], EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( Firework[i], EM_SetModeType_Searchenemy, false )--����
		SetModeEx( Firework[i], EM_SetModeType_Show, true )--���
		AddToPartition( Firework[i] ,  RoomID  )
		CastSpell(Firework[i],Firework[i],492036)
		BeginPlot(Firework[i],"Lua_race_DelOwner", 0 )
	end

end
function DavisTesting9()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Firework = {}
	Firework[0] = CreateObj( 101330, 4417, -20, 4179, 20, 1)
	Firework[1] = CreateObj( 101330, 4483, -20, 4313, 20, 1)
	Firework[2] = CreateObj( 101330, 4452, -20, 4240, 20, 1)
	Firework[3] = CreateObj( 101330, 4427, -20, 4203, 20, 1)
	Firework[4] = CreateObj( 101330, 4466, -20, 4271, 20, 1)
	ScriptMessage( OwnerID(),  -1, 2, "Second Winner is "..GetName( OwnerID() ) , 0 )
	ChangeZone( OwnerID(), 350 , RoomID , 4691 , -25, 4076, 10)
--	AddBuff(OwnerID(),502690,0,-1)
	SetPlot( TargetID() , "Collision" , "DavisTesting10" , 50 )
	for i = 0, table.getn(Firework) do
		SetModeEx( Firework[i], EM_SetModeType_Fight , false )--�i�������
		SetModeEx( Firework[i], EM_SetModeType_Strikback, false )--����
		SetModeEx( Firework[i], EM_SetModeType_Mark, false )--�аO
		SetModeEx( Firework[i], EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( Firework[i], EM_SetModeType_Obstruct, false )--����
		SetModeEx( Firework[i], EM_SetModeType_Gravity, false )--���O
		SetModeEx( Firework[i], EM_SetModeType_Move, false )--����
		SetModeEx( Firework[i], EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( Firework[i], EM_SetModeType_Searchenemy, false )--����
		SetModeEx( Firework[i], EM_SetModeType_Show, true )--���
		AddToPartition( Firework[i] ,  RoomID  )
		CastSpell(Firework[i],Firework[i],492036)
		BeginPlot(Firework[i],"Lua_race_DelOwner", 0 )
	end

end
function BuffAddSkill(BuffID)
	AddBuff(OwnerID()  , BuffID, 0 , -1)
end

function BuffCancelSkill(BuffID)
	CancelBuff( OwnerID()  , BuffID )
end

function DavisTouch()
	
	TempObj = { 102057,102058,102059,102060 ,102077,102078,102079,102080,102088,102089,102090,102091,102098,102099,102100,102101 ,102062,102081,102061,102102}
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) --���o�Ҧbroom
	local T1Obj
	local T1Count = SetSearchRangeInfo( OwnerID() , 1000 )
	for i = 1 , T1Count , 1 do
		local T1ID = GetSearchResult()
		T1Obj = Role:New( T1ID )	
		if T1Obj:RoomID() == RoomID and T1ID ~= OwnerID() then
			local FlagOrgID = T1Obj:OrgID()
			for i = 1 , table.getn(TempObj) do
				if (FlagOrgID == TempObj[i]) then
					DelObj(T1ID)
				end
			end
		end
	end
end
function Lua_DavisCreateWall(DisAdd)	--�b����DisAdd�j�p���϶��]�̤j800�^
	local OldX = ReadRoleValue(  OwnerID() , EM_RoleValue_X )
	local OldY = ReadRoleValue(  OwnerID() , EM_RoleValue_Y )
	local OldZ = ReadRoleValue(  OwnerID() , EM_RoleValue_Z )
	local OldDir = ReadRoleValue(  OwnerID() , EM_RoleValue_Dir )
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local Cal = (math.pi/180)*(OldDir) 
	local hindrance = {}
	local CC = 1
	local Olddis = 10
	local dis
	local NewX
	local NewY
	local NewZ
	local NewDir
--�e
	dis = Olddis
	hindrance[CC] = CreateObj( 112122, OldX- dis*math.cos(Cal),OldY ,OldZ +dis*math.sin(Cal),OldDir , 1 )
	CC = CC + 1
--��
	dis = dis  + (DisAdd/2)
	NewX = OldX- dis*math.cos(Cal)
	NewY = OldY
	NewZ = OldZ +dis*math.sin(Cal)
	dis = (DisAdd/2)
	hindrance[CC] = CreateObj( 112122, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir+90 , 1 )
	CC = CC + 1
	hindrance[CC] = CreateObj( 112122, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir+90 , 1 )
	CC = CC + 1
--��
	dis = dis  + (DisAdd/2) + Olddis
	hindrance[CC] = CreateObj( 112122, OldX- dis*math.cos(Cal),OldY ,OldZ +dis*math.sin(Cal),OldDir , 1 )
	CC = CC + 1


	for i=1,table.getn(hindrance) do
		local hindranceOrgID = ReadRoleValue( hindrance[i] , EM_RoleValue_OrgID)
		SetModeEx( hindrance[i], EM_SetModeType_Fight, false )--�i�������
		SetModeEx(  hindrance[i], EM_SetModeType_Strikback, false )--����
		SetModeEx(  hindrance[i], EM_SetModeType_Mark, false )--�аO
		SetModeEx(  hindrance[i], EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx(  hindrance[i], EM_SetModeType_Obstruct, true )--����
		SetModeEx(  hindrance[i], EM_SetModeType_Drag , true )--���O
		SetModeEx(  hindrance[i], EM_SetModeType_Gravity, false )--���O
		SetModeEx(  hindrance[i], EM_SetModeType_Move, false )--����
		SetModeEx(  hindrance[i], EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx(  hindrance[i], EM_SetModeType_Searchenemy, false )--����
		AddToPartition( hindrance[i] ,  RoomID  )
		NewX = ReadRoleValue(  hindrance[i] , EM_RoleValue_X )
		NewY = ReadRoleValue(  hindrance[i] , EM_RoleValue_Y )
		NewZ = ReadRoleValue(  hindrance[i] , EM_RoleValue_Z )
		NewDir = ReadRoleValue(  hindrance[i] , EM_RoleValue_Dir )
		Yell(hindrance[i],"i	=	"..i.."	NewX	=	"..NewX.."	NewY	=	"..NewY.."	NewZ	=	"..NewZ.."	NewDir	=	"..NewDir,5)
	end
end
function DavisTestDel()
	local TTT = {100292,103513};
	Lua_DavisDelObj(TTT);
end
function Lua_DavisDelObj( DBID )	--�R���ϰ줺 ����ID�� DBID ������
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) --���o�Ҧbroom
	local A = 0;
	if type (DBID) == "table" then
		--DebugMsg( 0, RoomID ,"Table DBID will be Delete!!")
		local Count = SetSearchAllNPC(RoomID) -- �j���ϰ줺���Ҧ�NPC �A�^�ǭȬ���ƶq
		--local DelCount = {};

		if Count ~= 0 then
			for i = 1 , Count , 1 do
				--DebugMsg( 0, RoomID ,"i  = "..i)
				local ID = GetSearchResult() -- �^�ǰ��� SetSearchAllNPC ��ҷj�M�쪺�Ҧ�����
				--DebugMsg( 0, RoomID ,"ID = "..ID)
				if (ReadRoleValue(ID ,EM_RoleValue_IsNPC) > 0 and CheckID(ID)==true )then --IsNPC = �O���Onpc
					local OID = ReadRoleValue( ID , EM_RoleValue_OrgID );
					for k,v in pairs(DBID) do
						--if DelCount[j] == nil then DelCount[j] = 0 end
						if OID == v then-- ���P�� ReadRoleValue( ID() , EM_RoleValue_OrgID )	Org = ��Ʈw����ID
							--Say(ID,"I will be Delete!");
							--DebugMsg( 0, RoomID ,"ID = "..ID.." DBID = "..DBID[j]);
							DelObj(ID);
							--DelCount[j] = DelCount[j] + 1;
							A = A + 1;
							break;
						end
					end
				end
			end	
		end
	else
		local Count = SetSearchAllNPC(RoomID); -- �j���ϰ줺���Ҧ�NPC �A�^�ǭȬ���ƶq
		if Count ~= 0 then
			for i = 1 , Count , 1 do
				local ID = GetSearchResult(); -- �^�ǰ��� SetSearchAllNPC ��ҷj�M�쪺�Ҧ�����
				if ReadRoleValue(ID ,EM_RoleValue_IsNPC) > 0 then --IsNPC = �O���Onpc
					if ReadRoleValue(ID ,EM_RoleValue_OrgID) == DBID  then
						DelObj(ID);
						A = A + 1;
					end
				end
			end	
		end
		--DebugMsg( 0, RoomID ,"Total '"..DBID.."' Remove is "..A);
	end
end
function Lua_DavisTesting1()
	Lua_MadeByRectangle(100052 , 10 , 100 , 5 , 6)
end
function Lua_DavisAdd()
	SetRoleCampID( OwnerID(), 8 );	--�]�w�X�l�}��
	for i = 1, 5 do
		Say(OwnerID(),"buffing")
		CastSpell(OwnerID(),OwnerID(),493856)
		Sleep(150)
	end
end

function Lua_Davis_TestLLLL()
	local ObjTable = Lua_CreateObjToRandownPos(OwnerID(),100292,10,150,true)
	Sleep(20)
	for k,v in pairs(ObjTable) do
		DelObj(v);
	end
end
function LuaDavisTestingXX(MonsterID)
	local CampID = GetRoleCampID(OwnerID())
	--Say(OwnerID(),"CampID = "..CampID)
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local OldPos = LuaFun_TeamFollow(20,3)
	local MonsterGroup = {}
	local DeadNumber = 1
	local DeadList = {}
	local State = "go"
	for i = 1, table.getn(OldPos) do
		MonsterGroup[i] = CreateObj ( MonsterID , OldPos[i][1]  , OldPos[i][2] , OldPos[i][3] , OldPos[i][4] , 1)
		SetRoleCampID(MonsterGroup[i] , CampID)
		MoveToFlagEnabled(MonsterGroup[i],false)
		AddToPartition(MonsterGroup[i] , RoomID )
		--Say(MonsterGroup[i],"CampID = "..CampID)
	end
	While 1 do
		local NewPos = LuaFun_TeamFollow(20,3)
		if State == "Stop" then
			break
		else
			for i = 1 ,table.getn(NewPos) do
				local DeadSetp = 0
				if ReadRoleValue( MonsterGroup[i] , EM_RoleValue_IsDead ) == 1 then
					for j = 1 , table.getn(DeadList) do
						if MonsterGroup[i] == DeadList[j] then
							DeadSetp = 1
							break
						end
					end
					if DeadSetp == 0 then
						DeadList[DeadNumber] = MonsterGroup[i]
						DeadNumber = DeadNumber + 1
						--DebugMsg( 0, RoomID ,MonsterID.." already dead "..(DeadNumber-1))
					end
				end
				if (DeadNumber-1) == table.getn(NewPos) then
					DebugMsg( 0, RoomID ,MonsterID.." AllDead")
					State = "Stop"
					break
				end
				--Say(MonsterGroup[i],"Movetoto".."X = "..NewPos[i][1].."Y = "..NewPos[i][2].."Z = "..NewPos[i][3])
				if (NewPos[i][1]-OldPos[i][1])^2 + (NewPos[i][3]-OldPos[i][3])^2 >= 200^2 then
					SetPos(MonsterGroup[i],NewPos[i][1]  , NewPos[i][2] , NewPos[i][3] , NewPos[i][4])
				elseif (NewPos[i][1]-OldPos[i][1])^2 + (NewPos[i][3]-OldPos[i][3])^2 >= 50^2 then
					WriteRoleValue( MonsterGroup[i] , EM_RoleValue_IsWalk , 0 )
					Move(MonsterGroup[i],NewPos[i][1]  , NewPos[i][2] , NewPos[i][3])
				else
					WriteRoleValue( MonsterGroup[i] , EM_RoleValue_IsWalk , 1 )
					Move(MonsterGroup[i],NewPos[i][1]  , NewPos[i][2] , NewPos[i][3])
				end
			end
		end
		OldPos = NewPos
		Sleep(20)
	end
	DelObj(OwnerID())
	--LuaFunc_ResetObj(OwnerID())
end
function DavisTestKILLTEAM()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local OldX = ReadRoleValueFloat(  OwnerID() , EM_RoleValue_X )
	local OldY = ReadRoleValueFloat(  OwnerID() , EM_RoleValue_Y )
	local OldZ = ReadRoleValueFloat(  OwnerID() , EM_RoleValue_Z )
	local BornObj = {}
	BornObj[1] = CreateObjByFlag( 102647, 780288, 0, 1 );
	BornObj[2] = CreateObjByFlag( 102647, 780192, 0, 1 );
	for i = 1 ,2 do
		SetModeEx( BornObj[i], EM_SetModeType_Fight, false )--�i�������
		SetModeEx(  BornObj[i], EM_SetModeType_Strikback, false )--����
		SetModeEx(  BornObj[i], EM_SetModeType_Mark, false )--�аO
		SetModeEx(  BornObj[i], EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx(  BornObj[i], EM_SetModeType_Obstruct, false )--����
		SetModeEx(  BornObj[i], EM_SetModeType_Drag , false )--���O
		SetModeEx(  BornObj[i], EM_SetModeType_Gravity, false )--���O
		SetModeEx(  BornObj[i], EM_SetModeType_Move, true )--����
		SetModeEx(  BornObj[i], EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx(  BornObj[i], EM_SetModeType_Searchenemy, false )--����
		SetModeEx(  BornObj[i], EM_SetModeType_Show, false )--���
		AddToPartition( BornObj[i] ,  RoomID  )
		WriteRoleValue( BornObj[i] , EM_RoleValue_IsWalk , 0 )
	end
	BeginPlot(BornObj[1],"LuaGuildSW_Born1Script",0)
	BeginPlot(BornObj[2],"LuaGuildSW_Born2Script",0)
	return BornObj
end
function LuaDavisTTT()
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		GameObjInfo_int ( BuffID , "Effect" )
		local Effect = GameObjInfo_int ( BuffID , "Effect" )
		Say(OwnerID(),"Effect = "..Effect)
		if math.fmod(Effect,2) == 1 then
			Say(OwnerID(),"nofire")
		end
	end
end
function LuaDavisTestMove()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local BornObj = CreateObjByFlag( 102398, 780288, 0, 1 );
	SetModeEx( BornObj, EM_SetModeType_Fight, false )--�i�������
	SetModeEx(  BornObj, EM_SetModeType_Strikback, false )--����
	SetModeEx(  BornObj, EM_SetModeType_Mark, false )--�аO
	SetModeEx(  BornObj, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx(  BornObj, EM_SetModeType_Obstruct, false )--����
	SetModeEx(  BornObj, EM_SetModeType_Drag , false )--���O
	SetModeEx(  BornObj, EM_SetModeType_Gravity, false )--���O
	SetModeEx(  BornObj, EM_SetModeType_Move, true )--����
	SetModeEx(  BornObj, EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx(  BornObj, EM_SetModeType_Searchenemy, false )--����
	SetModeEx(  BornObj, EM_SetModeType_Show, true )--���
	--WriteRoleValue( BornObj , EM_RoleValue_IsWalk , 0 )
	AddToPartition( BornObj ,  RoomID  )
	MoveToFlagEnabled( BornObj , false )
	Say(BornObj,"!!")
	BeginPlot(BornObj,"LuaDavisTestMove1",0)
	--BeginPlot(BornObj,"LuaDavisTestMove3",0)
	BeginPlot(BornObj,"LuaS_102523_test",0)
	--local TempObj = {102652,102653,102654,102655,102656,102657,102647,113115 }
	--local Obj
	--local CountTempObj = SetSearchAllNPC(RoomID) -- �j���ϰ줺���Ҧ�NPC �A�^�ǭȬ���ƶq
	--if CountTempObj ~= 0 then
	--	for i = 1 , CountTempObj , 1 do
	--		local ID = GetSearchResult() -- �^�ǰ��� SetSearchAllNPC ��ҷj�M�쪺�Ҧ�����
	--		Obj = Role:New( ID ) -- ���P�� ReadRoleValue( ID() , EM_RoleValue_OrgID )	Org = ��Ʈw����ID
	--		if Obj:IsNPC() == true then --IsNPC = �O���Onpc
	--			for j = 1, table.getn(TempObj) do
	--				if ReadRoleValue(ID ,EM_RoleValue_OrgID) == TempObj[j]  then
	--					DelObj(ID)
	--			end	end
	--		end
	--	end	
	--end
end
function LuaDavisTestMove1()
	local FlagCount = GetMoveFlagCount ( 780288 ) - 1
	for i = 0 , FlagCount do
		DW_MoveToFlag(OwnerID() , 780288, i, 1)
	end
	Sleep(50)
	BeginPlot(OwnerID(),"LuaDavisTestMove2",0)
end
function LuaDavisTestMove2()
	local FlagCount = GetMoveFlagCount ( 780288 ) - 1
	While FlagCount >= 0 do
		DW_MoveToFlag(OwnerID() , 780288, FlagCount, 1)
		FlagCount = FlagCount -1
	end
	Sleep(50)
	BeginPlot(OwnerID(),"LuaDavisTestMove1",0)
end
function LuaDavisTestMove3()
	local MonsterID = 102657
	Sleep(10)
	local CampID = ReadRoleValue( OwnerID(), EM_RoleValue_PID )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID)
	local OldPos = LuaFun_TeamFollow(20,3)	--���o�@���}�C���⪺��l
	local MonsterGroup = {}
	local DeadNumber = 1
	local DeadList = {}
	local State = "go"
	local Owner = OwnerID()
--	MoveSetpFinish[RoomID][Owner] = 0
	--�b�@���}�C���⪺��l�إX�p�L
	for i = 1, table.getn(OldPos) do
		MonsterGroup[i] = CreateObj ( MonsterID , OldPos[i][1]  , OldPos[i][2] , OldPos[i][3] , OldPos[i][4] , 1)
		SetRoleCampID(MonsterGroup[i] , CampID)
		MoveToFlagEnabled(MonsterGroup[i] , false)
		--WriteRoleValue( MonsterGroup[i] , EM_RoleValue_IsWalk , 0 )
		AddToPartition(MonsterGroup[i] , RoomID )
		AddBuff(MonsterGroup[i] ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
		--�[�J�¡B�զ��`�@��
		if MonsterID == 102656 then
			SetPlot(MonsterGroup[i],"dead","Lua_Guild_SoldierDeadWhite",0)
		elseif MonsterID == 102657 then
			SetPlot(MonsterGroup[i],"dead","Lua_Guild_SoldierDeadBlack",0)
		end
	end
--	WhiteSoldierSetp[RoomID] = {}
--	BlackSoldierSetp[RoomID] = {}
--	WhiteSoldierSetp[RoomID][Owner] = "Nomal"
--	BlackSoldierSetp[RoomID][Owner] = "Nomal"
	--local PosIn = {}
	local AttTarget
	While 1 do
		local NewPos = LuaFun_TeamFollow(30,3)

		if State == "Stop" then
			break
		else
			local MoveSetp = 0
			local SSSSS = ""
			for i = 1 ,table.getn(MonsterGroup) do
				if HateListCount( MonsterGroup[i] ) == 0 then
					--�԰����q���a�Y��
					--DebugMsg( 0, RoomID ,MonsterGroup[i].." is in Attack")
					SSSSS = "Nomal"
				else
					--DebugMsg( 0, RoomID ,MonsterGroup[i].." is in Nomal")
					SSSSS = "Attack"
					AttTarget = ReadRoleValue( MonsterGroup[i], EM_RoleValue_AttackTargetID)
					SetModeEx(  OwnerID(), EM_SetModeType_Move, false )--����
					break
				end
			end
			if SSSSS == "Nomal" then
				--DebugMsg( 0, RoomID ,OwnerID().." Nomal")
				for i = 1 ,table.getn(MonsterGroup) do
					local DeadSetp = 0
					--�ˬd���F�X��...
					if MonsterGroup[i] ~= nil then
						if ReadRoleValue( MonsterGroup[i] , EM_RoleValue_IsDead ) == 1 or CheckID(MonsterGroup[i]) == false then
							for j = 1 , table.getn(DeadList) do
								if MonsterGroup[i] == DeadList[j] then
									DeadSetp = 1
									break
								end
							end
							if DeadSetp == 0 then
								DeadList[DeadNumber] = MonsterGroup[i]
								DeadNumber = DeadNumber + 1
								--DebugMsg( 0, RoomID ,MonsterID.." already dead "..(DeadNumber-1))
								table.remove(MonsterGroup,i)
							end
						end
					end
					if (DeadNumber-1) == table.getn(NewPos) then
						--DebugMsg( 0, RoomID ,MonsterID.." AllDead")
						State = "Stop"
						break
					end
				end
				for i = 1 ,table.getn(MonsterGroup) do
					--���`���ơסץ������H����...�����N�������F..�S���ۤF..�N���A�]������..�����~���ˬd

					--�ˬd���ت��a�h��..�̾ڶZ�����ܶ]�B�B����

					--	PosIn[i] = CreateObj(113072 , NewPos[i][1]  , NewPos[i][2] , NewPos[i][3] , NewPos[i][4],1)
					--	SetModeEx( PosIn[i], EM_SetModeType_Fight, false )--�i�������
					--	SetModeEx(  PosIn[i], EM_SetModeType_Strikback, false )--����
					--	SetModeEx(  PosIn[i], EM_SetModeType_Mark, false )--�аO
					--	SetModeEx(  PosIn[i], EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
					--	SetModeEx(  PosIn[i], EM_SetModeType_Obstruct, false )--����
					--	SetModeEx(  PosIn[i], EM_SetModeType_Drag , false )--���O
					--	SetModeEx(  PosIn[i], EM_SetModeType_Gravity, false )--���O
					--	SetModeEx(  PosIn[i], EM_SetModeType_Move, false )--����
					--	SetModeEx(  PosIn[i], EM_SetModeType_ShowRoleHead, false )--�Y����
					--	SetModeEx(  PosIn[i], EM_SetModeType_Searchenemy, false )--����
					--	SetModeEx(  PosIn[i], EM_SetModeType_Show, true )--���
					--	AddToPartition(PosIn[i] , RoomID )
					--���o�{�b��m
					local NowPos = {}
					NowPos[i] = {}
					NowPos[i][1] =  ReadRoleValue( MonsterGroup[i] , EM_RoleValue_X )
					NowPos[i][2] =  ReadRoleValue( MonsterGroup[i] , EM_RoleValue_Y )
					NowPos[i][3] =  ReadRoleValue( MonsterGroup[i] , EM_RoleValue_Z )
					if MonsterGroup[i] ~= nil and CheckID(MonsterGroup[i] ) == true then
						--DebugMsg( 0, RoomID ,OwnerID().." is GOGOGO")
						if (NewPos[i][1]-NowPos[i][1])^2 + (NewPos[i][3]-NowPos[i][3])^2 >= 600^2 then
							SetPos(MonsterGroup[i],NewPos[i][1]  , NewPos[i][2] , NewPos[i][3] , NewPos[i][4])
							DebugMsg( 0, RoomID ,MonsterID.." SetPos ")
							Say(MonsterGroup[i],OwnerID().."FLY".." dis = "..math.sqrt((NewPos[i][1]-NowPos[i][1])^2 + (NewPos[i][3]-NowPos[i][3])^2))
						elseif (NewPos[i][1]-NowPos[i][1])^2 + (NewPos[i][3]-NowPos[i][3])^2 >= 80^2 then
							WriteRoleValue( MonsterGroup[i] , EM_RoleValue_IsWalk , 0 )
							MoveDirect(MonsterGroup[i],NewPos[i][1]  , NewPos[i][2] , NewPos[i][3])
							--Say(MonsterGroup[i],OwnerID().."RUN".." dis = "..math.sqrt( (NewPos[i][1]-NowPos[i][1])^2 + (NewPos[i][3]-NowPos[i][3])^2))
						elseif (NewPos[i][1]-NowPos[i][1])^2 + (NewPos[i][3]-NowPos[i][3])^2 >= 10^2 then
							WriteRoleValue( MonsterGroup[i] , EM_RoleValue_IsWalk , 1 )
							MoveDirect(MonsterGroup[i],NewPos[i][1]  , NewPos[i][2] , NewPos[i][3])
							--Say(MonsterGroup[i],OwnerID().."WALK".." dis = "..math.sqrt( (NewPos[i][1]-NowPos[i][1])^2 + (NewPos[i][3]-NowPos[i][3])^2))
						else
							--Say(MonsterGroup[i],OwnerID().."STOP".." dis = "..math.sqrt( (NewPos[i][1]-NowPos[i][1])^2 + (NewPos[i][3]-NowPos[i][3])^2))
							MoveSetp = MoveSetp +1
						end
						--DebugMsg( 0, RoomID ,OwnerID().." is FINISH")
					end
					--end
					if MoveSetp >= (table.getn(MonsterGroup) - DeadNumber ) then
						SetModeEx(  OwnerID(), EM_SetModeType_Move, true )--����
					end
				end
			else
				--DebugMsg( 0, RoomID ,OwnerID().." Attack")
				if AttTarget ~= 0 then
					for i = 1 ,table.getn(MonsterGroup) do
						SetAttack(MonsterGroup[i],AttTarget)
						--DebugMsg( 0, RoomID ,"Attack "..AttTarget)
					end
				end
			end
		end
		OldPos = NewPos
		Sleep(20)
	--	for i = 1, table.getn(PosIn) do
	--		DelObj(PosIn[i])
	--	end
	end
	--	for i = 1, table.getn(PosIn) do
	--		DelObj(PosIn[i])
	--	end
	--�����F�A�S���n�~����H�A��ۤv��F
	DelObj(OwnerID())
	--LuaFunc_ResetObj(OwnerID())
end
function Lua_DavisTime()
	local month = GetSystime(3)+1
	local day = GetSystime(4)
	local hour = GetSystime(1)
	local min = GetSystime(2)
	Say(OwnerID(),month.."/"..day.." "..hour..":"..min)
end
function SendBBB()
	AddBuff(OwnerID(),505015,0,-1)
	ClockOpen( OwnerID() , EM_ClockCheckValue_10  , 300 , 300 , 0  ,"Lua_thanksgiving_OutGame"  , "Lua_thanksgiving_ending" );--�ɶ��H���
end
function GuildWarSettingTest()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	if GuildWarSetting == nil then
		GuildWarSetting = {}
	end
	GuildWarSetting[RoomID]= {}
	GuildWarSetting[RoomID]["building"]= {}
	GuildWarSetting[RoomID]["vehicle"]= {}
	GuildWarSetting[RoomID]["Kill"]= {}
	GuildWarSetting[RoomID]["building"][1]	= 1	--�i�ؿv���j�ؿv�ɶ�
	GuildWarSetting[RoomID]["building"][2]	= 1	--�i�ؿv���j�һݯ෽
	GuildWarSetting[RoomID]["building"][3]	= 1	--�i�ؿv���j�һݾ��Z
	GuildWarSetting[RoomID]["vehicle"][1]	= 1	--�i����j�ؿv�ɶ�	
	GuildWarSetting[RoomID]["vehicle"][2]	= 1	--�i����j�һݯ෽	
	GuildWarSetting[RoomID]["vehicle"][3]	= 1	--�i����j�һݾ��Z	
	GuildWarSetting[RoomID]["Kill"][1]	= 1	--�i���H�j��o���Z�ƶq
end
function LuaQ_Dav_TT()
	BeginPlot(OwnerID(),"LuaQ_Dav_Q2Complete",0)
end
function LuaQ_Dav_Q2Complete()
	SetFlag( OwnerID()  , 543549 , 0 )
	SetFlag( OwnerID()  , 543550 , 0 )
	SetFlag( OwnerID()  , 543551 , 0 )
	SetFlag( OwnerID()  , 543552 , 0 )
	SetFlag( OwnerID()  , 543553 , 0 )
	SetFlag( OwnerID()  , 543554 , 0 )
	SetFlag( OwnerID()  , 543555 , 0 )
	SetFlag( OwnerID()  , 543556 , 1 )
end
function DavisGetItem(ItemID)
	for i = 1 ,20 do
		GiveBodyItem(OwnerID(),ItemID,1)
	end
end
function Lua_davisGuildFull()	--�W�[���|�귽
	AddGuildResource( OwnerID() , 10000000 , 100000 , 100000 , 100000 ,100000 ,100000 ,100000 ,"" )
end

function Lua_SeeCamp()
	local	OwnerCamp	= GetRoleCampID( OwnerID() );
	local	TargetICamp	= GetRoleCampID( TargetID() );
	Say(OwnerID(),"OwnerCamp= "..OwnerCamp.."TargetICamp= "..TargetICamp)
	Say(OwnerID(),"EM_GuildWar_Energy = "..EM_GuildWar_Energy)
					AddGuildWarValue( OwnerID() , EM_GuildWar_Energy , 1 )
					local GGEnergy = GetGuildWarValue(OwnerID(),EM_GuildWar_Energy)
				--	Say(OwnerID(),"GGEnergy"..GGEnergy)
end
function Lua_CheckBuff()	--�ˬd���W���Mbuff
	Say(OwnerID(),"@@@")
	SetBattleGroundObjGUIDForceFlag(OwnerID(),223091)	--�I��I�X
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count-1 do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		Say(OwnerID(),"Buff "..i.." ID = "..BuffID)
		CancelBuff_NoEvent( OwnerID()  , BuffID )
	end
end
function DavisTempTest(R)
local X = 1
local Y = R - X
	for i =1,R*2-1 do
		Say(OwnerID(),string.rep(" ", Y)..string.rep("f", X)..string.rep(" ", Y).." "..string.rep(" ", Y)..string.rep("f", X)..string.rep(" ", Y).." "..string.rep(" ", Y)..string.rep("f", X)..string.rep(" ", Y))
		if i<R then
			X=X+2
			Y = ((2*R+1) - X)/2-1
		else
			X=X-2
			Y = ((2*R+1) - X)/2-1
		end
	end
end
function DavisTempTest2(R)
	Say(OwnerID(),"This is "..R.."*"..R)
	Say(OwnerID(),"-------------Start--------------")
	for j=1,R do
		local Z = ""
		for i=1,R do
			Z=Z.."M"
		end
		Say(OwnerID(),Z)
	end
	Say(OwnerID(),"--------------End--------------")
end
function DavisTempTest3(R)
	local TableXX = {2,2,-2,2,2,-6,0,0}
	local Y,X,W
	Y=R+6
	X=R
	for i=1,table.getn(TableXX) do
		W=(Y-X)/2
		--Say(OwnerID(),"Y = "..Y.." X = "..X.." W = "..W)
		local Z = ""
		for j=1,Y do
		--	Say(OwnerID(),j)
			if j<=W or j>Y-W then
				Z = Z.." "
			else
				Z = Z.."f"
			end
		end
		Say(OwnerID(),Z)
		X = X + TableXX[i]
	end
end
function davisTest4(R)
local X = "f"
local Y=" "
local M = R*2-1
local N = R
local Z=""
for i=1,R do
Z = ""
	for j=1,M do
		if j<N or j>(M-N+1) then
			Z = Z..X
		else
			Z = Z..Y
		end
	end
		Say(OwnerID(),Z)

	N = N-1
end
end
------------�R��TitleID�ٸ�---------------
function Lua_DelTitle(TitleID)	
	if TitleID >= 530000 and TitleID < 540000 then
		DelBodyItem(OwnerID(),TitleID,1)
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "Input Error That's Not TitleID" , "0xffff3232" );
	end
end
function Lua_Davis_MoveCorss()  
	AdjustFaceDir(OwnerID(), TargetID() , 0 ) --���V
	local OldX = ReadRoleValue( TargetID() , EM_RoleValue_X )	--��
	local OldY = ReadRoleValue( TargetID() , EM_RoleValue_Y )		--��
	local OldZ = ReadRoleValue( TargetID() , EM_RoleValue_Z )		--��
	local OldDir = ReadRoleValue( TargetID() , EM_RoleValue_Dir )	--��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID)--���a
	local PlayerDir = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )--���a
	local dis = 100
	local Ca =  PlayerDir - OldDir
	if Ca < 0 then 
		Ca = Ca + 360
	end
	local Cal = (math.pi/180)*(OldDir)
	if Ca < 90 or Ca > 270 then
		SetPos(OwnerID(), OldX+ dis*math.cos(Cal),OldY+5 ,OldZ -dis*math.sin(Cal),OldDir)
	else
		SetPos(OwnerID(), OldX- dis*math.cos(Cal),OldY+5 ,OldZ +dis*math.sin(Cal),OldDir+180)
	end
end
function BuffAddSkillT()
CastSpell( OwnerID() , OwnerID() , 497724)
end

function Lua_DavisTestRock()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local X1 = ReadRoleValue ( OwnerID(), EM_RoleValue_X)
	local Y1 = ReadRoleValue ( OwnerID(), EM_RoleValue_Y)
	local Z1 = ReadRoleValue ( OwnerID(), EM_RoleValue_Z)   ---------�o�̬O���XAttackplayer�̭������ӤH���y��
	local ball = CreateObj( 105651 , X1, Y1+100 , Z1 , 0 , 1 )  ------------
	AddToPartition ( ball,RoomID ) ----����[�J����,�Ҧ椽��
	BeginPlot(ball,"Lua_DavisTestRock1",0)	
end
function Lua_DavisTestRock1()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	sleep(10)
	MoveToFlagEnabled(OwnerID(), false) ---�t�Τ��ت����|����
	WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
--	Hide(OwnerID())
--	Show(OwnerID(),RoomID)
	LuaFunc_MoveToFlagandWait(OwnerID() , 780937 , 0,0)
	LuaFunc_MoveToFlagandWait(OwnerID() , 780937 , 1,0)
	killid ( OwnerID() , OwnerID() )
end
function Lua_DavisTesRRR()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---�ŧi�o�Ӧa��~�O�ڲ{�bŪ�쪺�a��
	local X1 = ReadRoleValue ( OwnerID(), EM_RoleValue_X)
	local Y1 = ReadRoleValue ( OwnerID(), EM_RoleValue_Y)
	local Z1 = ReadRoleValue ( OwnerID(), EM_RoleValue_Z)   ---------�o�̬O���XAttackplayer�̭������ӤH���y��
	local ball = CreateObj( 100103 , X1, Y1 , Z1 , 0 , 1 )  ------------
	SetModeEx( ball , EM_SetModeType_Strikback, true) ---����(�_)
	SetModeEx( ball , EM_SetModeType_Mark, true)			---�i�I��(�O)
	SetModeEx( ball , EM_SetModeType_ShowRoleHead, true) 		---�Y����(�O)
	SetModeEx( ball , EM_SetModeType_Fight, true) ---�i���(�O)
	AddToPartition ( ball,RoomID ) ----����[�J����,�Ҧ椽��
	BeginPlot(ball,"Lua_DavisTesRRR1",0)	
end
function Lua_DavisTesRRR1()
	local X = ReadRoleValue ( OwnerID(), EM_RoleValue_X)
	local Y = ReadRoleValue ( OwnerID(), EM_RoleValue_Y)
	local Z = ReadRoleValue ( OwnerID(), EM_RoleValue_Z)   ---------�o�̬O���XAttackplayer�̭������ӤH���y��
	while 1 do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�
			Sleep(10)
		else
			lua_DavisRandMove(OwnerID(),X,Y,Z,50,1)
			Sleep(30)
		end
		
	end
end


function Lua_Davis_MMKILL()
	local MonsterA = CreateObjByFlag( 118365 , 780940 , 0 , 1 );
	local MonsterB = CreateObjByFlag( 118366  , 780941 , 0 , 1 );
	SetModeEx( MonsterA, EM_SetModeType_Fight, true )--�i�������
	SetModeEx( MonsterA, EM_SetModeType_Strikback, true )--����
	SetModeEx( MonsterA, EM_SetModeType_Searchenemy, true )--����
	SetModeEx( MonsterB, EM_SetModeType_Fight, true )--�i�������
	SetModeEx( MonsterB, EM_SetModeType_Strikback, true )--����
	SetModeEx( MonsterB, EM_SetModeType_Searchenemy, true )--����
	AddToPartition(MonsterA,0)
	AddToPartition(MonsterB,0)
	SetRoleCampID(MonsterA,8)
	SetRoleCampID(MonsterB,9)
	SetAttack(MonsterA,MonsterB)
end
function LuaDavisTestLockHP()
	LockHP( OwnerID() , 100 , "LuaDavisTestLOCKSAY" )
end
function LuaDavisTestLOCKSAY()
	AddBuff(OwnerID(),509980,7776,-1)
	AddBuff(OwnerID(),509979,4666,-1)
end

function Lua_DialogTest()
	if CheckBuff( OwnerID() , 501570) == false then
		DialogCreate( OwnerID() , EM_LuaDialogType_Select  , "Testing1");
		DialogSelectStr( OwnerID() , GetString("SO_YES") );
		DialogSelectStr( OwnerID() , GetString("SO_NO") );
		AddBuff(OwnerID() , 501570,0,-1);
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0);	
			--��ưe�X�����D
		end
		local SelectID = EX_GetDialogResoult( OwnerID(), 30 , 75 , OwnerID() );
		if SelectID == 0  then
			Say(OwnerID(),"yes1");
		elseif SelectID == 1  then
			Say(OwnerID(),"No1");
		else
			Say(OwnerID(),"Error1");
		end
		CancelBuff( OwnerID(), 501570 );
	end

end
function Lua_DiFDATest1()
local CC = Lua_Table_NumberofGet(30,9)
for i,v in ipairs(CC) do
	Say(OwnerID()," i = "..i.." v = "..v)
end
end
function Lua_DiFDATest2()
	local bookdbid =100292
	Say(OwnerID(),"[SC_BOOKCASTVAR][$SETVAR1=".."["..bookdbid.."]".."]")
end
function Lua_DiFDATest3(String)
 	local SS={};

end

function Lua_DavisSay()
	local SS = {1,2,3}
	local XX = {4,5,6}
	table.insert(SS,XX)
	for i,v in ipairs(SS) do
		if type(v)=="table" then
			for j,k in ipairs(v) do
				Say(OwnerID(),"j = "..j.." k = "..k)
			end
		else
			Say(OwnerID(),"i = "..i.." v = "..v)
		end
	end
	local X=0
	while 1 do
		if X%13==0 then
			Say(OwnerID(),"X "..X)
			break;
		end
		X= X +1
		sleep(10)
	end
end
--[[
davis_Role = Role:new(0)--�~��Role
function davis_Role:new( RoleID )
	Ret = {}
	Ret.RoleID = RoleID;
	setmetatable( Ret , self )
	self.__index = self;
	return Ret;
end
function davis_Role:SAYXYZ()
	local BaseX = self:X()
	local BaseY = self :Y()
	local BaseZ = self :Z()
	local BaseDir = self :Dir()
	return Say(self.RoleID,"X="..BaseX.." Y="..BaseY.." Z="..BaseZ.." Dir="..BaseDir)
end
function Lua_davis_main()
	local Davis= davis_Role:new( OwnerID() )
	Davis:SAYXYZ();
end
]]--
function lua_DavisTestPush()
	local Ta = LuaFunc_SearchNPCbyOrgID( OwnerID() , 106300 , 200 , 1);
	for i=0,table.getn(Ta)-1 do
		Say(Ta[i],"attack ME");
		PushMagicTarget( Ta[i] )
	end
end
function Lua_Spell_FireWar()
	local X= {};
	X[1]=1
	X[10]=10
	X[20]=20
	for i,v in pairs(X) do
		--table.remove(X,10)
		Say(OwnerID(),"@remove i="..i.." v="..v)
		X[10]=nil;
		Say(OwnerID(),"$remove i="..i.." v="..v)
		break
	end
	for i,v in pairs(X) do
		Say(OwnerID(),"i="..i.." v="..v)
	end
end
function Lua_SpellMagic()
	While 1 do
		local AttT = ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID)
		Say(OwnerID(),"Att = "..AttT)
		if AttT>0 then
			sysCastSpellLv( OwnerID() ,AttT , 498184, 0);
			Say(OwnerID(),"Spell  Att = "..AttT)
		end
		Sleep(60)
	end
end
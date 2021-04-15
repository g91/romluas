
-----------------------------------------------����������-----------------------------------------------------------------
function Lua_Zone14_PE03_WtFail( )--�f���z��,���������B�e����,Step:�����ثe���ؼ�
	DebugMsg(0,0,"Zone14_PE03_WtFail Start..")
	Debuglog( 2,"Lua_Zone14_PE03_WtFail Start.." )
	local Oid = OwnerID()--���I
	local FlagID = 780885
	local FriendArray = Zone14_PE03_WagonTrain.Friend
	kg_Z14PE03_DelWagonTrain( 0 )
	local FirstMember = 0--�Ĥ@���F��
	local DeadCount = 0--�������`�p��
	local Step=0; local Goal=2;	local DisTable={}; local tempTable={};local MemberStep={}
	
	local MemberCount = table.getn(FriendArray)
	if MemberCount>0 then
		Say(FriendArray[1],"[SC_PE_ZONE14_03_TALK17]")
		for i in pairs(FriendArray) do--�������k�]
			SetModeEx( FriendArray[i] , EM_SetModeType_Strikback, FALSE) ---����
			SetModeEx( FriendArray[i] , EM_SetModeType_Searchenemy, FALSE)	--����
			Hide(FriendArray[i])
			ClearHateList( FriendArray[i] , -1 )
			SetStopAttack( FriendArray[i] )
			Show( FriendArray[i],0 )
			if CheckBuff(FriendArray[i], 509261)~=true then
				AddBuff( FriendArray[i], 509261, 0, -1 )--�M��30%
			end
			DisTable={}
			for j=2,GetMoveFlagCount( FlagID )-1 do--�q�X��2�}�l�O���Z��
				DisTable[j]={ [1]=j , [2]=kg_GetDis(FriendArray[i],FlagID,j) }
			end
			for j=2,table.getn(DisTable) do
				for k=j+1, table.getn(DisTable) do
					if DisTable[k][2]<DisTable[j][2] then
						tempTable=DisTable[j]
						DisTable[j] = DisTable[k]
						DisTable[k] = tempTable
					end
				end
			end
			MemberStep[FriendArray[i]]=DisTable[2][1]--�U�ۧ�X�̪񪺺X�нs��
		end
		
		while 1 do
			DeadCount=0
			for i in pairs(FriendArray) do
				if ReadRoleValue(FriendArray[i],EM_RoleValue_Register7)==1 then--�p�ⶤ�����`���ƶq
					DeadCount = DeadCount+1
				end
			end
			if DeadCount >= MemberCount then break end
			for i in pairs(FriendArray) do
				Step = MemberStep[FriendArray[i]]
				if Step>=Goal then
					if Step>Goal and kg_GetDis(FriendArray[i],FlagID, Step )<=50 then
						Step=Step-1
						MemberStep[FriendArray[i]]=Step
					elseif Step==Goal and kg_GetDis(FriendArray[i],FlagID, Step )<=50 then
						FirstMember = FriendArray[i]
						break
					else
						KS_Move(FriendArray[i],30,FlagID, Step )
					end
				end
			end
			if FirstMember>0 then
				for i in pairs(FriendArray) do
					if FriendArray[i]~= FirstMember then
						DelObj(FriendArray[i])
					end
				end
				break
			end
			Sleep(10)
		end
	end
	if DeadCount < MemberCount then
		while 1 do
			if kg_GetDis(FirstMember,780933,1)<=30 or ReadRoleValue(FirstMember,EM_RoleValue_Register7)==1 or CheckID(FirstMember)~=true then
				break
			else
				KS_Move(FirstMember,0,780933,1)
			end
			Sleep(10)
		end
		if kg_GetDis(FirstMember,780933,1)<=30 and ReadRoleValue(FirstMember,EM_RoleValue_Register7)==0 and CheckID(FirstMember)==true then
			BeginPlot( FirstMember ,"Lua_Zone14_PE03_FailShow", 0 )
		end
	end
end

function Lua_Zone14_PE03_FailShow(  )
	local FirstMember = OwnerID()
	local QuestNPC = Zone14_PE03_QuestNPC
	Hide(FirstMember)
	SetModeEx( FirstMember , EM_SetModeType_Fight, false)--���i���
	Show(FirstMember,0)
	CancelBuff(FirstMember,509261)
	Sleep(5)
	AdjustFaceDir( FirstMember,QuestNPC,0 )
	Sleep(10)
	Say(FirstMember,"[SC_PE_ZONE14_03_TALK18]")
	Sleep(10)
	AdjustFaceDir(QuestNPC,FirstMember,0)
	Sleep(10)
	Say(QuestNPC,"[SC_PE_ZONE14_03_TALK19]")
	Sleep(20)
	Say(FirstMember,"[SC_PE_ZONE14_03_TALK20]")
	Sleep(20)
	DelObj(FirstMember)
	FaceFlag( QuestNPC, 780885 , 3 )
	AdjustDir( QuestNPC,0 )
end

function Lua_Zone14_PE03_WTCtrlInit()--������������l��  ������:117676 ��:105481 �f��:105441 ���H�ؼ�: 117201
	DebugMsg(0,0,"Pe1403 WagonTrainInit Start")
	Debuglog(2,"Pe1403 WagonTrainInit Start")
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local FlagID =Zone14_PE03_FlagID
	local FlagStartPoint = 1--�X�o�I
	local IsWalk = 0
	local Ctrl = kg_GetPosRX( {FlagID,FlagStartPoint } ,117676 )
	kg_InvisibleObjInit( Ctrl )
	AddToPartition(Ctrl,RoomID)
	if Zone14_PE03_WagonTrain.FollowTarget~=nil and CheckID( Zone14_PE03_WagonTrain.FollowTarget )==true then
		DebugMsg(0,0,"Delete WagonTrain...")
		Debuglog(2,"Delete WagonTrain...")
		kg_Z14PE03_DelWagonTrain()
	end
	local FollowTarget = kg_GetRangePos(FlagID,115053,50,0,-3,FlagStartPoint)
	MoveToFlagEnabled( FollowTarget, false )
	Lua_Zone14_PE03_Born( FollowTarget )
	kg_MoveCtrl(FollowTarget)
	SetModeEx( FollowTarget , EM_SetModeType_Show, false)--�O�_ø�s�X�ҫ�
	WriteRoleValue( FollowTarget,EM_RoleValue_IsWalk, 1 )
	AddToPartition(FollowTarget,RoomID)
	--
	local Horse = kg_GetRangePos(FlagID,105481,20,0,-3,FlagStartPoint)
	MoveToFlagEnabled( Horse, false )
	Lua_Zone14_PE03_Born( Horse )
	kg_MoveCtrl( Horse )
	SetModeEx( Horse, EM_SetModeType_HideName, true)
	WriteRoleValue( Horse,EM_RoleValue_PassengerAttackable,1 )--���ȥi�H�Q��
	WriteRoleValue( Horse,EM_RoleValue_IsWalk, IsWalk )
	AddToPartition( Horse,RoomID )
	--
	local Goods = kg_GetRangePos(FlagID,105441,0,0,-3,FlagStartPoint)
	MoveToFlagEnabled( Goods, false )
	Lua_Zone14_PE03_Born( Goods )
	kg_MoveTarget( Goods )
	--WriteRoleValue( Goods , EM_RoleValue_Register9 , 0 )--��f�����I��,�O��ثe�n�h���X��
	WriteRoleValue(Goods,EM_RoleValue_Register10,Horse)--��f���o��{�a�A�i�H�������]�w��
	AddToPartition(Goods,RoomID)
	SetPlot(Goods,"dead","Lua_Zone14_PE03_Dead04_01",0)
	--
	local FlagX = GetMoveFlagValue( FlagID , FlagStartPoint , EM_RoleValue_X )
	local FlagY = GetMoveFlagValue( FlagID , FlagStartPoint , EM_RoleValue_Y )
	local FlagZ = GetMoveFlagValue( FlagID , FlagStartPoint , EM_RoleValue_Z )
	local CurrentDir = ReadRoleValue( FollowTarget , EM_RoleValue_Dir )--��e��V
	local TransTeamPosition = Lua_Zone14_PE03_FormationPosition( FlagX , FlagY , FlagZ, 35, CurrentDir )--�|���}���]�w��
	local FriendID = Zone14_PE03_Var["Friend"]
	local FriendArray = {}
	for i =1,4 do
		--local Friend = kg_GetRangePos(FlagID,FriendID[i],50,Angle,-3,FlagStartPoint)
		FriendArray[i] = CreateObj( FriendID[i] , TransTeamPosition["X"][i], TransTeamPosition["Y"][i] , TransTeamPosition["Z"][i] , CurrentDir , 1 )
		MoveToFlagEnabled( FriendArray[i], false )
		Lua_Zone14_PE03_Born( FriendArray[i] )
		SetModeEx( FriendArray[i] , EM_SetModeType_Revive, false )	--�i����
		WriteRoleValue( FriendArray[i],EM_RoleValue_IsWalk, IsWalk )
		AddToPartition(FriendArray[i],RoomID)
	end
	
	AddBuff( FollowTarget, 509257, 260, -1 )--�[�t15%
	AddBuff( Horse, 509257, 20, -1 )--�[�t45%
	AddBuff(Goods,508887,0,-1)--���^��
	AddBuff( Goods, 507514, 0, -1 )--�K�̪v��
	AddBuff( Goods, 509257, 30, -1 )--�[�t30%
	AddBuff(Goods,509259,10,-1)--�f���w����!
	AttachObj( Goods , Horse , 0 ,"p_down","p_top" )
	
	Zone14_PE03_WagonTrain.Ctrl=Ctrl
	 Zone14_PE03_WagonTrain.FollowTarget=FollowTarget
	 Zone14_PE03_WagonTrain.Horse =Horse
	 Zone14_PE03_WagonTrain.Goods=Goods
	 Zone14_PE03_WagonTrain.Friend=FriendArray
	 
	 CallPlot(Ctrl,"Lua_Zone14_PE03_WagonTrainMove",FollowTarget,Horse,Goods)
	 Debuglog(2,"Pe1403 WagonTrainInit End")
end

function Lua_Zone14_PE03_WagonTrainMove( FollowTarget,Horse,Goods )--497374
	DebugMsg(0,0,"WagonTrain Start Moving...")
	Debuglog(2,"WagonTrain Start Moving...")
	Sleep(10)
	local FriendArray = Zone14_PE03_WagonTrain.Friend
	for i in pairs(FriendArray) do
		WriteRoleValue(FriendArray[i],EM_RoleValue_PID,140303 )
		AddBuff( FriendArray[i], 509261, 0, -1 )--�M��30%
	end
	local TransCarX , TransCarY , TransCarZ
	local CurrentDir = ReadRoleValue( FollowTarget , EM_RoleValue_Dir )--��e��V
	local TransTeamPosition = {}--�|���}���]�w��
	local PreviousDir = CurrentDir--�ª���V
	local DeltaDir = 0	--������V
	local Range = 35 --�}��d��
	local CurrentTeamNum = 4
	local InBattle =false
	local FlagID = Zone14_PE03_FlagID
	local CheckDis = 120--�����Z��
	local Step = 2
	local Goal =  GetMoveFlagCount( FlagID )-1
	DebugMsg(0,0,"Goal="..Goal)
	local timer =0
	local TalkOnce = 0--��i�J�԰���������
	local TalkGroup = {}
	while 1 do
		if timer%2==0 then
			SysCastSpellLv(Horse,Horse,497374,0)--�����abuff,�ΨӧP�w���a�O�_���b�O�@����
			--SysCastSpellLv( Goods,Goods,497377,0 )--�s�J
		end
		if InBattle == false   then
			if CheckBuff( Goods ,509259 )~=true and table.getn(Zone14_PE03_WagonTrain.Friend)~=0 then--��f���Q��,buff���� , ��w�g�S��������,�f���N���|���U��
				InBattle = true
				StopMove( Horse, true )
				StopMove( FollowTarget, true )
				DetachObj(Goods)
				SetPos(Goods,kg_GetPosRX(Horse,nil,25,0,180,-3))
				SysCastSpellLv( Goods,Goods,497377,0 )--�s�J
				TalkGroup={}
				for i in pairs(FriendArray) do
					StopMove( FriendArray[i], true )
					CancelBuff( FriendArray[i], 509304 )--�Ѱ��M��
				end
			end
		end
		if InBattle == false then
			for i in pairs(FriendArray) do
				if ReadRoleValue(FriendArray[i],EM_RoleValue_Register7)==0  and KS_InCombat(FriendArray[i]) == true then--�����`�B�i�J�԰�
					InBattle = true
					StopMove( Horse, true )
					StopMove( FollowTarget, true )
					CancelBuff(Goods,509259)
					DetachObj(Goods)
					SetPos(Goods,kg_GetPosRX(Horse,nil,25,0,180,-3))
					local EnemyTarget = ReadRoleValue(FriendArray[i],EM_RoleValue_AttackTargetID)
					SysCastSpellLv( Goods , EnemyTarget, 496946, 0 )--���Ǫ��]���f��������
					SysCastSpellLv( Goods,Goods,497377,0 )--�s�J
					TalkGroup={}
					for j in pairs(FriendArray) do
						CancelBuff( FriendArray[j], 509304 )--�Ѱ��M��
						SysCastSpellLv( EnemyTarget , FriendArray[j], 497448, 0 )--�s�Ҧ���������P�@�ؼХ�
					end
					break
				end
			end
		end
		
		if InBattle == true then
			if TalkOnce==0 then
				TalkOnce=1
				TalkGroup={}
				for i in pairs(FriendArray) do
					if ReadRoleValue(FriendArray[i], EM_RoleValue_Register7)==0 then
						table.insert(TalkGroup,FriendArray[i])
					end
				end
				Lua_Zone14_PE03_FriendTalk( TalkGroup )
			end
			if timer%3==0 then AddBuff(Goods,509259,0,-1) end
			local Count = 0--�p��S�i�J�԰�������
			local BattleCount = 0
			FriendArray = Zone14_PE03_WagonTrain.Friend
			for i in pairs(FriendArray) do
				if ReadRoleValue(FriendArray[i],EM_RoleValue_Register7)==0 and KS_InCombat(FriendArray[i]) ~= true then
					Count = Count+1
				elseif ReadRoleValue(FriendArray[i],EM_RoleValue_Register7)==0  and KS_InCombat(FriendArray[i]) == true then
					BattleCount = BattleCount+1
					for j in pairs(FriendArray) do
						SysCastSpellLv( ReadRoleValue(FriendArray[i],EM_RoleValue_AttackTargetID) , FriendArray[j], 497448, 0 )--�s�Ҧ���������P�@�ؼХ�
					end
				end
			end
			--DebugMsg(0,0,"TeamCount = "..Count)
			if Count ==table.getn(Zone14_PE03_WagonTrain.Friend) and Count>0 and KS_CheckBuffLV(Goods,509259)>=2 then
				DebugMsg(0,0,"Leave Battle1..")
				Debuglog(2,"WagonTrain Leave Battle1")
				AttachObj( Goods , Horse , 0 ,"p_down","p_top" )
				for i in pairs(FriendArray) do
					if ReadRoleValue(FriendArray[i],EM_RoleValue_Register7)==0 and KS_InCombat(FriendArray[i]) ~= true then
						AddBuff( FriendArray[i], 509304, 0, -1 )--�M��30%
					end
				end
				InBattle = false
				TalkOnce=0
			elseif BattleCount==0 and KS_CheckBuffLV(Goods,509259)>=2 then--�_�I�̦��`�A�����a��Ǫ��ѨM
				DebugMsg(0,0,"Leave Battle2..")
				Debuglog(2,"WagonTrain Leave Battle2")
				AttachObj( Goods , Horse , 0 ,"p_down","p_top" )
				InBattle = false
				Say(Horse,"[SC_PE_ZONE14_03_TALK16]")--�R�R���I�I
				TalkOnce=0
			end
		elseif InBattle == false and CheckBuff(Horse,508560)==false and CheckBuff(Goods,509222)==false then--�����P�f�����S���q�����A
			TransCarX = ReadRoleValue( FollowTarget , EM_RoleValue_X )
			TransCarY = ReadRoleValue( FollowTarget , EM_RoleValue_Y )
			TransCarZ = ReadRoleValue( FollowTarget , EM_RoleValue_Z )
			CurrentDir = ReadRoleValue( FollowTarget , EM_RoleValue_Dir )--��e��V
		
			if Step<=Goal then
				if kg_GetDis(FollowTarget,FlagID,Step)<=100 and Step<Goal  then
					Step = Step+1
					--WriteRoleValue(Goods,EM_RoleValue_Register9,Step)
				elseif kg_GetDis(FollowTarget,FlagID,Step)<=30 and Step==Goal then
					SysCastSpellLv(Horse,Horse,497375,0)--�����a������buff
					Sleep(10)
					if Zone14_PE03_FinishLine==0 then
						kg_Z14PE03_DelWagonTrain()
					else
						BeginPlot(Zone14_PE03_FinishLine,"Lua_Zone14_PE03_WTCtrlInit",0)
					end
					DebugMsg(0,0,"Pe1403 WagonTrainMove End")
					Debuglog(2,"Pe1403 WagonTrainMove End")
					break
				else
					if kg_GetDis(FollowTarget,FlagID,Step)<=750 and Step==5 then--�ѨM�a��bug��
						DetachObj(Goods)
						SetPos( Goods,kg_GetPosRX(Horse,nil,25,0,180) )
						AttachObj( Goods , Horse , 0 ,"p_down","p_top" )
					end
					KS_Move(FollowTarget,0,FlagID,Step)
				end
			end
		
			DeltaDir = math.abs( PreviousDir - CurrentDir )
			--DebugMsg(0,0,"DeltaDir="..DeltaDir)
			if DeltaDir > 90 and DeltaDir < 270 then	-- �ܤư}����m
				local tmp = 0
				if FriendArray[1] ~= nil and FriendArray[4] ~= nil then
					tmp = FriendArray[1]
					FriendArray[1] = FriendArray[4]
					FriendArray[4] = tmp
				end
				if FriendArray[2] ~= nil and FriendArray[3] ~= nil then
					tmp = FriendArray[2]
					FriendArray[2] = FriendArray[3]
					FriendArray[3] = tmp
				end
			end
			PreviousDir = CurrentDir
			TransTeamPosition = Lua_Zone14_PE03_FormationPosition( TransCarX , TransCarY , TransCarZ, Range, CurrentDir )
			local DeltaX = ( TransCarX - ReadRoleValue( Horse , EM_RoleValue_X ) )^2
			local DeltaZ = ( TransCarZ - ReadRoleValue( Horse , EM_RoleValue_Z ) )^2
			--DebugMsg(0,0,"CheckHorse Dis="..math.floor( (DeltaX+DeltaZ)^0.5) )
			if math.floor( (DeltaX+DeltaZ)^0.5) > CheckDis then
				CancelBuff(Horse,509257)
				AddBuff( Horse, 509257, 200, -1 )
				CancelBuff(Goods,509257)
				AddBuff( Goods, 509257, 230, -1 )--�[�t30%
				--Say(Horse,"Speed up..")
			else
				CancelBuff(Horse,509257)
				AddBuff( Horse, 509257, 20, -1 )
				CancelBuff(Goods,509257)
				AddBuff( Goods, 509257, 30, -1 )--�[�t30%
			end
			MoveDirect( Horse , TransCarX , TransCarY , TransCarZ )--KS_Move(Horse,0,FollowTarget)
		
			for i in pairs(FriendArray) do
				DeltaX = ( TransTeamPosition["X"][i] - ReadRoleValue( FriendArray[i] , EM_RoleValue_X ) )^2
				DeltaZ = ( TransTeamPosition["Z"][i] - ReadRoleValue( FriendArray[i] , EM_RoleValue_Z ) )^2
				--Say( FriendArray[i], "Dis = "..math.floor( (DeltaX+DeltaZ)^0.5) )
				if math.floor( (DeltaX+DeltaZ)^0.5) > CheckDis then	--�O�_�����w��
					AddBuff( FriendArray[i], 509258, 60, 3 )--�M���[�t15%
					--Say(FriendArray[i],"Speed up..")
				else
					CancelBuff(FriendArray[i],509258)
				end
				MoveDirect( FriendArray[i] , TransTeamPosition["X"][i] , TransTeamPosition["Y"][i] , TransTeamPosition["Z"][i] )
			end
		end
		
		Sleep(10)
		timer = timer+1
	end
end

function Lua_Zone14_PE03_FriendTalk( TalkGroup )
	local Dialogue = { 	"[SC_PE_ZONE14_03_TALK01]",--���굴�藍�|�����A�̪��I�I
				"[SC_PE_ZONE14_03_TALK02]",--�i�c�I�O�Q�o�x�I�I
				"[SC_PE_ZONE14_03_TALK03]",--�Ӧ����Ǫ���...�I
				"[SC_PE_ZONE14_03_TALK04]",--�u�}�I�I�u�}�I�I
				"[SC_PE_ZONE14_03_TALK05]",--�p�G�S���A�̪���......�I
				"[SC_PE_ZONE14_03_TALK06]",--�N�O�A�̱����ƪ����I�I
				"[SC_PE_ZONE14_03_TALK07]",--......�ڦn��...
				"[SC_PE_ZONE14_03_TALK08]",--�n�i�Ȧn�i�Ȧn�i��...����k����k����k...
				"[SC_PE_ZONE14_03_TALK09]",--��...��...�z�ڰڰڡI�I�I
				"[SC_PE_ZONE14_03_TALK10]" }--�u�n��A�̳������A�ڴN��^�a�F...
	local TalkGroupCount = table.getn(TalkGroup)
	if TalkGroupCount ==1 then
		Say(TalkGroup[1],Dialogue[kg_Rand(10)])
	elseif TalkGroupCount==2 then
		local randTalk = kg_Rand(10)
		Say(TalkGroup[1],Dialogue[randTalk])
		randTalk = randTalk+kg_Rand(9)
		if randTalk>10 then randTalk=randTalk-10 end
		Say(TalkGroup[2],Dialogue[randTalk])
	elseif TalkGroupCount > 2 then
		local randMember = kg_Rand(TalkGroupCount)
		local randTalk = kg_Rand(10)
		Say(TalkGroup[randMember],Dialogue[randTalk])
		randTalk = randTalk+kg_Rand(9)
		if randTalk>10 then randTalk=randTalk-10 end
		randMember = randMember + 1
		if randMember>TalkGroupCount then randMember=1 end
		Say(TalkGroup[randMember],Dialogue[randTalk])
	end
end

function Lua_Zone14_PE03_FormationPosition( X , Y , Z , Range , Dir )--�|���}���]�w��
	local Position = {}
	Position["X"] = {}
	Position["Y"] = {}
	Position["Z"] = {}

	Position["X"][1] = X-Range*math.sin(Dir*math.pi/180+15 )	-- �k�e--1
	Position["Y"][1] = Y
	Position["Z"][1] = Z-Range*math.cos(Dir*math.pi/180+15)

	Position["X"][2] = X+Range*math.sin(Dir*math.pi/180-15)	-- ���e--2
	Position["Y"][2] = Y
	Position["Z"][2] = Z+Range*math.cos(Dir*math.pi/180-15)

	Position["X"][3] = X-Range*math.sin(Dir*math.pi/180-15)	-- �k��--3
	Position["Y"][3] = Y
	Position["Z"][3] = Z-Range*math.cos(Dir*math.pi/180-15)

	Position["X"][4] = X+Range*math.sin(Dir*math.pi/180+15)	-- ����--4
	Position["Y"][4] = Y
	Position["Z"][4] = Z+Range*math.cos(Dir*math.pi/180+15)

	return Position;
end
----------------------------------------------Debug�\��----------------------------------------------------------------------------------------------
function kg_Z14PE03_GetQuestKey( Player , KeyCount )--���a,�ƶq
	Player = Player or OwnerID()
	KeyCount = KeyCount or 20
	ks_QuestKill( Player, 105432, KeyCount )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
	--Say( Player, "I got "..KeyCount.." QuestKey!" )
end

function kg_Z14PE03_CarriageReach( Carriage )--�����w�F����I
	Carriage = Carriage or OwnerID()
	SysCastSpellLv(Carriage,Carriage,497375,0)--�@�e�����N��15G
end

function kg_Z14PE03_DelWagonTrain( AllDelete )--�R������
	AllDelete = AllDelete or 1
	DelObj( Zone14_PE03_WagonTrain.FollowTarget )
	DelObj( Zone14_PE03_WagonTrain.Goods )
	local FriendArray = Zone14_PE03_WagonTrain.Friend
	if AllDelete == 1 then
		DelObj( Zone14_PE03_WagonTrain.Horse )
		for i in pairs(FriendArray) do
			DelObj(FriendArray[i])
		end
	else
		BeginPlot( Zone14_PE03_WagonTrain.Horse,"kg_Z14PE03_HorseRunAway", 1 )
	end
	Zone14_PE03_WagonTrain.FollowTarget=0
	Zone14_PE03_WagonTrain.Goods=0
	Zone14_PE03_WagonTrain.Horse = 0
	Zone14_PE03_WagonTrain.Friend={}
	DelObj(Zone14_PE03_WagonTrain.Ctrl)
end

function kg_Z14PE03_HorseRunAway()--�p�հk�]
	local Horse = OwnerID()
	Say(Horse,"[SC_PE_ZONE14_03_TALK16]")--�R�R���I�I
	local x,y,z,_ = kg_GetPosRX( Horse,nil,130,0,kg_Rand(360) )
	while 1 do
		MoveDirect( Horse, x,y,z )
		if kg_GetDis(Horse,x,y,z)<=30 then
			break
		end
		Sleep(10)
	end
	DelObj( Horse )
end

function kg_Z14PE03_PrintWagonTrain()--�L�X����
	DebugMsg(0,0,"FollowTarget = "..Zone14_PE03_WagonTrain.FollowTarget)
	Say(Zone14_PE03_WagonTrain.FollowTarget,Zone14_PE03_WagonTrain.FollowTarget)
	DebugMsg(0,0,"Horse = "..Zone14_PE03_WagonTrain.Horse)
	Say(Zone14_PE03_WagonTrain.Horse,Zone14_PE03_WagonTrain.Horse)
	DebugMsg(0,0,"Goods = "..Zone14_PE03_WagonTrain.Goods)
	Say(Zone14_PE03_WagonTrain.Goods,Zone14_PE03_WagonTrain.Goods)
	local FriendArray = Zone14_PE03_WagonTrain.Friend
	for i in pairs(FriendArray) do
		DebugMsg(0,0,"Friend_"..i.." = "..FriendArray[i])
		Say(FriendArray[i],FriendArray[i])
	end
end
----------------------------------------------��L----------------------------------------------------------------------------------------------
function Lua_Zone14_PE03_ClearPlayerBuff( Player )--�M�����a�b1403���M��buff
	local Buff = { 509250,509242,509190 }
	kg_ClearBuff( Player,Buff )
	if CheckBuff(Player,509196)==true then
		Lua_Z14PE03_Skill08_DelHorse( Player )
	end
	WriteRoleValue( Player,EM_RoleValue_Register9,0 )
	WriteRoleValue( Player,EM_RoleValue_Register10,0 )
end

function LuaPE_Zone14_PE03_GetBuff( Player )--���ȼҪO:���o���a(Player)����o��PE��BUFF
	Player = Player or TargetID()--���a
	Lua_Zone14_PE03_ClearPlayerBuff( Player )
	CancelBuff(Player,509188)
	LuaPE_KS_GetBuff( Player )
	if CheckBuff(Player,509181)==true then
		AddBuff(Player,509188,14,-1)
	end
end

function Lua_Zone14_PE03_QuestComplete()--�������Ȱ���
	local Player = TargetID()
	Lua_Zone14_PE03_ClearPlayerBuff( Player )
	CancelBuff(Player,509188)
	if LuaPE_KS_CleanBuff( Player ) == true then
		local BuffID = 509177
		local Buff = ReadRoleValue( Player, EM_LuaValueFlag_PEBuffKeep2 )
		if CheckBuff( Player, Buff ) == true and Buff ~= BuffID then
			CancelBuff( Player, Buff )
			WriteRoleValue( Player, EM_LuaValueFlag_PECount, 1 )
			DebugMsg(0,0,"14PE03 QuestFin Count = "..ReadRoleValue( Player, EM_LuaValueFlag_PECount ))
			return
		end
		
		local PECount = ReadRoleValue( Player, EM_LuaValueFlag_PECount )		
		local Lv = KS_CheckBuffLV( Player, BuffID )
		DebugMsg(0,0,"Old PECount = "..PECount.."; BuffLV = "..Lv)
		if Lv > 0 or ( Lv == 0 and PECount > 5 ) then--�ثe�i�檺PE���ȧ�������
			if Lv == 0 and PECount > 5 then
				WriteRoleValue( Player, EM_LuaValueFlag_PECount, 1 )
			end
			AddBuff( Player, BuffID, 0, -1 )
			WriteRoleValue( Player, EM_LuaValueFlag_PEBuffKeep2, BuffID )--�ثe�i�檺PE�Ҫ��a�����y���A
			DebugMsg(0,0,"New PECount = "..ReadRoleValue( Player, EM_LuaValueFlag_PECount ))
		end

	end
end
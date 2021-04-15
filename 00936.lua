--------------------------------------------- ��h N �h Buff ( N = 0 �O� 1 �h�AN = 1 �O� 2 �h�A�M AddBuff �W�h�ۦP ) ------------------------------
-- obj : �n��h Buff ������
-- BuffID : �n��h�� Buff
-- Lv : �n��h�� Lv ( 0 �O��h 1 , 1 �O��h 2 ......�H�U�����A�o�O���F�� AddBuff ���W�h�P�B )
-- Time : Buff �ɶ��A�� 0 �� -1 ���ܡA�|�즹 Buff �ثe���Ѿl�ɶ�
-- Event : ���S��Buff ���ܭn���nĲ�oBuff �������ƥ�A0 �O�|�A-1�O���|�A�i����

function  Lua_SubtractBuff( Obj , BuffID , Lv , Time , Event ) 
	if Event == nil or Type( Event ) ~= "number" or Event >= 0 then
		Event = 0
	end
	local BuffPos = Lua_BuffPosSearch(Obj , BuffID )
	if BuffPos >= 0 then
		local OrgLv = BuffInfo( Obj  , BuffPos , EM_BuffInfoType_Power ) +1
		Lv = Lv + 1
		if OrgLv - Lv <= 0 then
			if Event == 0 then
				if CancelBuff( Obj , BuffID ) then
					return true
				end
			else
				if CancelBuff_NoEvent( Obj , BuffID ) then
					return true
				end
			end
		else
			if Time <= 0 or Type(Time) ~= "number" then
				Time = BuffInfo( Obj  , BuffPos , EM_BuffInfoType_Time )
			end
			if AddBuff(Obj  , BuffID , -1-Lv , Time ) then
				return true
			end
		end
	end
	return false
end
------------------------------------------------
--dis ,disX �b�|
--type 0����e1��e
function Lua_Davis_BornByMultilateral( MonsterID , X , dis ,ObjID)	--�bObjID�P���MonsterID �� X ����
	if ObjID ==nil then
		ObjID = OwnerID();
	end
	local RoomID = ReadRoleValue(ObjID , EM_RoleValue_RoomID)
	local Obj = Role:new( ObjID )
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj :Dir()
	local MonsterGroup = {}
	for i = 1 , X do
		MonsterGroup[ i ] =CreateObj( MonsterID, BaseX-dis*math.cos(math.pi*2*(i/X)),BaseY,BaseZ+dis*math.sin(math.pi*2*(i/X)),BaseDir, 1 )
	end
	for i = 1, table.getn(MonsterGroup) do
		AddToPartition(MonsterGroup[i],RoomID )
	end
	return MonsterGroup
end
function Lua_Davis_BornByMultilateral2( MonsterID ,MonsterID2, X , disX ,type ,ObjID)	--�bObjID�P���MonsterID�MMonsterID2 �� X ����
	if ObjID ==nil then
		ObjID = OwnerID();
	end
	local RoomID = ReadRoleValue(ObjID , EM_RoleValue_RoomID)
	local Obj = Role:new( ObjID )
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj :Dir()
	local MonsterGroup = {}
	local dis = disX
	local N
	if math.fmod (X , 2) == 1 then
		if type == 1 then
			dis = rand(disX/2)+(disX/2)
		end
		N = math.floor(X/2)+1
		MonsterGroup[ N ] = CreateObj( MonsterID, BaseX-dis*math.cos(math.pi*2*(N/X)),BaseY,BaseZ+dis*math.sin(math.pi*2*(N/X)),BaseDir, 1 )
	else
		N = math.floor(X/2)
	end
	for i = 1 , math.floor(X/2) do
		if type == 1 then
			dis = rand(disX/2)+(disX/2)
		end
		if math.fmod (i , 2) == 1 then
		MonsterGroup[ i ] = CreateObj( MonsterID, BaseX-dis*math.cos(math.pi*2*(i/X)),BaseY,BaseZ+dis*math.sin(math.pi*2*(i/X)),BaseDir, 1 )
		MonsterGroup[ i+N ] = CreateObj( MonsterID2, BaseX-dis*math.cos(math.pi*2*((X-(i-1))/X)),BaseY,BaseZ+dis*math.sin(math.pi*2*((X-(i-1))/X)),BaseDir, 1 )
		else
		MonsterGroup[ i +N] = CreateObj( MonsterID, BaseX-dis*math.cos(math.pi*2*((X-(i-1))/X)),BaseY,BaseZ+dis*math.sin(math.pi*2*((X-(i-1))/X)),BaseDir, 1 )
		MonsterGroup[ i ] = CreateObj( MonsterID2, BaseX-dis*math.cos(math.pi*2*(i/X)),BaseY,BaseZ+dis*math.sin(math.pi*2*(i/X)),BaseDir, 1 )
		end
	end
	for i = 1, table.getn(MonsterGroup) do
		AddToPartition(MonsterGroup[i],RoomID )
		--Say(MonsterGroup[i],"i="..i)
	end
	return MonsterGroup
end
function Lua_Davis_BornByMultilateralGroup( BaseX,BaseY,BaseZ,BaseDir,MonsterGroupID, dis  )	--�bX,Y,Z,Dir�����disX���b�|��MonsterGroupID()�}�C �� �@�Ӷ�� �Ҧ����󭱦VDir(��AddToPartition)	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID);
	local RoomID = ReadRoleValue( OwnerID(),  EM_RoleValue_RoomID );
	local MonsterGroup = {};
	for i = 1 , table.getn(MonsterGroupID) do
		MonsterGroup[ i ] =CreateObj( MonsterGroupID[i], BaseX-dis*math.cos(math.pi*2*(i/table.getn(MonsterGroupID))),BaseY,BaseZ+dis*math.sin(math.pi*2*(i/table.getn(MonsterGroupID))),BaseDir, 1 );
		AddToPartition(MonsterGroup[i],RoomID );
	end
	return MonsterGroup;
end
function Lua_ObjAreaCheck(ObjID , MapID ) --�ˬd����O�_�b�S�w���a�ϰϰ줺
	local X = ReadRoleValue( ObjID , EM_RoleValue_X )
	local Y = ReadRoleValue( ObjID ,EM_RoleValue_Y )
	local Z = ReadRoleValue( ObjID , EM_RoleValue_Z )
	if CheckMapID(  X ,Y ,Z , MapID ) == true then
		return true
	else
		return false
	end
end


function Lua_DW_LeaderSet(Obj)
	SetModeEx(  Obj  , EM_SetModeType_Mark, false) 
	SetModeEx(  Obj  , EM_SetModeType_HideName, true) 
	SetModeEx(  Obj  , EM_SetModeType_ShowRoleHead, false) 
	SetModeEx(  Obj  , EM_SetModeType_Show, false) 
end

function Lua_ExGetZone( ObjID ) --��o����Ҧb ZoneID �é������y
	local Zone = ReadRoleValue( ObjID , EM_RoleValue_ZoneID )
	Zone = Zone - math.floor( Zone/1000 ) * 1000
	return Zone
end







-----------------------------���ʦܩM�ؼЪ����w�Z���ᰱ�U��------------------------
function DW_GetClose(Obj,Target,Range,Way)
------------------------------------------------------------------------------------
--Obj		�Q�n����ʪ�����
--Target	�@���ؼЪ�����
--Range		�Ʊ�ObJ���U�ɩMTarget���Z��
--Way		����M0 �O�ĥθ��|����  1�O�ĥΪ��u����
	local X,Y,Z,LX,LZ,NX,NZ,X1,Y1,Z1
--�e�T�ӰѼƤ���|���ɭP����
--�]�����@��nil�Nreturn false
	if	Obj == nil	or
		Target == nil	or
		Range == nil	then
		return false
	end
	LX = 0
	LZ = 0

	X1 = 0
	Y1 = 0
	Z1 = 0
	while	true	do
--�p�G����P�ؼХ��@�����]return false
		if	CheckID(Obj)==false	or
			CheckID(Target)==false	then
			return false
		end

		X = ReadRoleValue(Target,EM_RoleValue_X)
		Y = ReadRoleValue(Target,EM_RoleValue_Y)
		Z = ReadRoleValue(Target,EM_RoleValue_Z)
		
		NX = ReadRoleValue(Obj,EM_RoleValue_X)
		NZ = ReadRoleValue(Obj,EM_RoleValue_Z)
--�Z���p��w�]�~return true
		if	(X-NX)^2+(Z-NZ)^2>Range^2	then
--DeBugMSG(0,0,"[X-NX]="..((X-NX)^2).."[Z-NZ]="..((Z-NZ)^2).."[Range]="..(Range^2))
--�٨S����S�ݦb��a�o�b���ɭ�
			if	(LX == NX	and	LZ == NZ)	or
				(X ~= X1	or	Y ~= Y1	or	Z ~= Z1)	then
				if	Way == nil	or
					Way == 0	then
					WriteRoleValue(Obj,EM_RoleValue_Register2,X)
					WriteRoleValue(Obj,EM_RoleValue_Register3,Y)
					WriteRoleValue(Obj,EM_RoleValue_Register4,Z)
					if	(X ~= X1	or	Y ~= Y1	or	Z ~= Z1)	then
						StopMove(Obj,true)
						Move(Obj,X,Y,Z)
						sleep(20)
					else
						Move(Obj,X,Y,Z)
					end
				else
					if	(X ~= X1	or	Y ~= Y1	or	Z ~= Z1)	then
						StopMove(Obj,true)
						MoveDirect(Obj,X,Y,Z)
						sleep(20)
					else
						MoveDirect(Obj,X,Y,Z)
					end
				end
			end
		else
--DeBugMSG(0,0,"NX="..NX.."##NZ="..NZ)
			StopMove(Obj,true)
			return true
		end
		LX = NX
		LZ = NZ
		X1 = X
		Y1 = Y
		Z1 = Z
		sleep(5)
	end
end






--------------------------�o�e�T�������w�ϰ쪺���a------------------
--Sender ��o�e�T����
--Kind �T���������G���������r�άO�T����������r
--color �r���C�r
--MapID�i�H����
--�YMapID����Hfunction����̪��ҦbMapID����
function DW_AreaMessage(Sender,Kind,String,Color,MapID)
	if	Sender == nil	or
		Kind == nil	or
		String == nil	or
		Color == nil	then
		return false
	end
--�j�M�Ҧ������a
--��缾�a��mapid
	local HowManyPlayer = SetSearchAllPlayer(0)
	local Player = {}
	for i = 1,HowManyPlayer,1 do
		Player[i] = GetSearchResult()
		if	MapID == nil	then
			if CheckMapID( ReadRoleValue(Player[i],EM_RoleValue_X) ,ReadRoleValue(Player[i],EM_RoleValue_Y) ,ReadRoleValue(Player[i],EM_RoleValue_Z) , FindMapID( ReadRoleValue(OwnerID(),EM_RoleValue_X) , ReadRoleValue(OwnerID(),EM_RoleValue_Y) , ReadRoleValue(OwnerID(),EM_RoleValue_Z) ) )	then
				ScriptMessage( Sender, Player[i], Kind ,String,Color )
			end
		else
			if CheckMapID( ReadRoleValue(Player[i],EM_RoleValue_X) ,ReadRoleValue(Player[i],EM_RoleValue_Y) ,ReadRoleValue(Player[i],EM_RoleValue_Z) , MapID )	then
				ScriptMessage( Sender, Player[i], Kind ,String,Color )
			end
		end
	end
end




----------------------------------�ˬd�I�]�Ѱ��Ŧ�(�Ȧs���]�����O�b�Ū�)----------------------------------
--Role	�Q�ˬd���ؼ�
--Num	�ˬd�I�]���Ŷ��O�_��Num��
function DW_CheckBackpage(Role,Num)
	if	Role == nil	then
		return false
	end
	if	Num == nil	then
		Num = 1
	end
	if	type(Num)~="number"	then
		return false
	end
	if	EmptyPacketCount( Role ) >= Num		and
		QueuePacketCount( Role )==0		then
		return true
	else
		return false
	end
end
----------------------------------�Ǧ^guid�Px.y.z���Z��----------------------------------
function Lua_GetDisByXYZ(GUID,X,Y,Z)
	local OX=ReadRoleValue(GUID,EM_RoleValue_X)
	local OY=ReadRoleValue(GUID,EM_RoleValue_Y)
	local OZ=ReadRoleValue(GUID,EM_RoleValue_Z)
	local Dis = ((X-OX)^2+(Y-OY)^2+(Z-OZ)^2)^0.5
	return Dis
end
----------------------------------�^��ObjID��MagicID...�N�o��----------------------------------

function Davis_CheckUse(ObjID,MagicID)  -- �^��ObjID��MagicID...Item�N�o�ȡA�p�GMagicID�S���N�o���O�h�^��false�A�^��0�N��o�Ӫk�N�i�H�ΤF
	local Class = GameObjInfo_Int( MagicID,"ColdownClass") -- ��o�Ӫk�N���N�o�D���O
	local Type  = GameObjInfo_Int( MagicID,"ColdownType") -- ��o�Ӫk�N���N�o�����O
	if	Class  == 0	then
		return false
	elseif Class  == 1 then
		return ReadRoleValue(ObjID , EM_RoleValue_Coldown_Job + Type  ) 
	elseif Class  == 2 then
		return ReadRoleValue(ObjID , EM_RoleValue_Coldown_EQ + Type  ) 
	elseif Class  == 3 then
		return ReadRoleValue(ObjID , EM_RoleValue_Coldown_Item + Type  ) 
	end
end
----------��ۤv�I�񵥯�MagicLv��MagicID�k�N---------------
function Lua_CastSpellOO(MagicID,MagicLv)
	CastSpellLV( OwnerID() , OwnerID() , MagicID, MagicLv )
end
----------��ؼЬI�񵥯�MagicLv��MagicID�k�N---------------
function Lua_CastSpellOT(MagicID,MagicLv)
	CastSpellLV( OwnerID() , TargetID() , MagicID, MagicLv )
end
 --�H��e�ؼЬ����I�p����T���ΰ}�C����mDis�Z��,X�h�ơ]�T���βĤ@�h1���ĤG�h2���ĤT�h3���H�������^-----
function LuaFun_TeamFollow(Dis,X)
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local Obj = Role:new( OwnerID() )
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj :Dir()
	local CheckX = BaseX
	local CheckY = BaseY
	local CheckZ = BaseZ
	local NewX = BaseX
	local NewY = BaseY
	local NewZ = BaseZ
	local MoveDis = Dis
	local NewPos = {}
	local Cal = 0
	local Pos = {}
	local NM = 1
	if X < 1 then
		X = 1
	end
	for i = 1, X do
		if math.fmod(i,2) == 1 then	--���
			Cal = (math.pi/180)*(BaseDir)
			MoveDis = (i-1)*Dis/2*(3^0.5)
			Pos["X"] = BaseX-(MoveDis*math.cos(Cal))
			Pos["Z"] = BaseZ+ (MoveDis*math.sin(Cal))
			Pos["Y"] = GetHeight( Pos["X"] , BaseY , Pos["Z"] );
			NewPos[NM] = { Pos["X"]  , Pos["Y"] , Pos["Z"] , BaseDir }
			NM = NM + 1 
			CheckX = Pos["X"]
			CheckY = Pos["Y"]
			CheckZ = Pos["Z"]
			if i/2>1 then
				for j=1 , (i-1)/2 do
					MoveDis = j*Dis
					Cal = (math.pi/180)*(BaseDir+90)	--��
					Pos["X"] = CheckX-(MoveDis*math.cos(Cal))
					Pos["Z"] = CheckZ+ (MoveDis*math.sin(Cal))
					Pos["Y"] = GetHeight( Pos["X"] , CheckY , Pos["Z"] );
					NewPos[NM] = { Pos["X"]  , Pos["Y"] , Pos["Z"] , BaseDir }
					NM = NM + 1 
					Cal = (math.pi/180)*(BaseDir-90)	--�k
					Pos["X"] = CheckX-(MoveDis*math.cos(Cal))
					Pos["Z"] = CheckZ+ (MoveDis*math.sin(Cal))
					Pos["Y"] = GetHeight( Pos["X"] , CheckY , Pos["Z"] );
					NewPos[NM] = { Pos["X"]  , Pos["Y"] , Pos["Z"] , BaseDir }
					NM = NM + 1 	
				end		
			end
		elseif math.fmod(i,2) == 0 then	--����
			MoveDis = Dis
			Cal = (math.pi/180)*(BaseDir+30)
			Pos["X"] = CheckX-(MoveDis*math.cos(Cal))
			Pos["Z"] = CheckZ+ (MoveDis*math.sin(Cal))
			Pos["Y"] = GetHeight( Pos["X"] , CheckY , Pos["Z"] );
			NewPos[NM] = { Pos["X"]  , Pos["Y"] , Pos["Z"] , BaseDir }
			NM = NM + 1 
			if i/2>1 then
				NewX = Pos["X"]
				NewY = Pos["Y"]
				NewZ = Pos["Z"]
				for j=1 , (i/2-1) do
					MoveDis = Dis
					Cal = (math.pi/180)*(BaseDir+90)	--��
					Pos["X"] = NewX-(MoveDis*math.cos(Cal))
					Pos["Z"] = NewZ+ (MoveDis*math.sin(Cal))
					Pos["Y"] = GetHeight( Pos["X"] , NewY , Pos["Z"] );
					NewPos[NM] = { Pos["X"]  , Pos["Y"] , Pos["Z"] , BaseDir }
					NM = NM + 1 
					NewX = Pos["X"]
					NewY = Pos["Y"]
					NewZ = Pos["Z"]
				end
			end
			Cal = (math.pi/180)*(BaseDir-30)
			Pos["X"] = CheckX-(MoveDis*math.cos(Cal))
			Pos["Z"] = CheckZ+ (MoveDis*math.sin(Cal))
			Pos["Y"] = GetHeight( Pos["X"] , CheckY , Pos["Z"] );
			NewPos[NM] = { Pos["X"]  , Pos["Y"] , Pos["Z"] , BaseDir }
			NM = NM + 1 
			if i/2>1 then
				NewX = Pos["X"]
				NewY = Pos["Y"]
				NewZ = Pos["Z"]
				for j=1 , (i/2-1) do
					MoveDis = Dis
					Cal = (math.pi/180)*(BaseDir-90)	--�k
					Pos["X"] = NewX-(MoveDis*math.cos(Cal))
					Pos["Z"] = NewZ+ (MoveDis*math.sin(Cal))
					Pos["Y"] = GetHeight( Pos["X"] , NewY , Pos["Z"] );
					NewPos[NM] = { Pos["X"]  , Pos["Y"] , Pos["Z"] , BaseDir }
					NM = NM + 1 
					NewX = Pos["X"]
					NewY = Pos["Y"]
					NewZ = Pos["Z"]
				end
			end
			------�p��s���Ѧ��I
			Cal = (math.pi/180)*(BaseDir)	
			MoveDis = (i-1)*Dis/2*(3^0.5)
			Pos["X"] = CheckX- (MoveDis*math.cos(Cal))
			Pos["Z"] = CheckZ+ (MoveDis*math.sin(Cal))
			Pos["Y"] = GetHeight( Pos["X"] , CheckY , Pos["Z"] );
			CheckX = Pos["X"]
			CheckY = Pos["Y"]
			CheckZ = Pos["Z"]
		end
	end
	return NewPos
end
function Lua_CloseTranDoor( close, Boss )--�}���z����
	local door = OwnerID()
	if close == true then
		for i=1, 2 do
			Sleep(10)
			if Boss ~= nil and CheckID(Boss) == true and 
			KS_InCombat( Boss ) == not close then
				return
			end
		end
	else
		Sleep(20)
	end
	
	if close == true then		
		SetModeEx(  door  , EM_SetModeType_Show, true )
		SetModeEx(  door  , EM_SetModeType_Obstruct, true )
	else
		SetModeEx(  door  , EM_SetModeType_Show, false )
		SetModeEx(  door  , EM_SetModeType_Obstruct, false )
	end
end
--�s�W����b�H����mamount�ƶq,Range�b�|,Partitio�O�_Addto(true,false)
function Lua_CreateObjToRandownPos(GUID,OrgID,amount,Range,Partition)
	local OldX = ReadRoleValue(GUID,EM_RoleValue_X);
	local OldY= ReadRoleValue(GUID,EM_RoleValue_Y);
	local OldZ = ReadRoleValue(GUID,EM_RoleValue_Z);
	local RoomID = ReadRoleValue(GUID,EM_RoleValue_RoomID);
	local ObjTable = {};
	while #ObjTable < amount do
		--Say(GUID,"## = "..#ObjTable);
		local RanNum = math.random(360);
		--Say(GUID,"$$ = "..RanNum);
		local X = OldX -Rand(Range)*math.cos(math.pi/180*RanNum);
		local Z = OldZ +Rand(Range)*math.sin(math.pi/180*RanNum);
		local Y = GetHeight( X , OldY , Z );
		if CheckLine( GUID , X,Y,Z ) then
			--Say(GUID,"ADD"..#ObjTable+1);
			ObjTable[#ObjTable+1] = CreateObj(OrgID,X,Y,Z,0,1);
		--else
			--Say(GUID,"false");
		end
	end
	if Partition == true then
		for k,v in pairs(ObjTable) do
			AddToPartition(v,RoomID);
		end
	end
	return ObjTable;
end
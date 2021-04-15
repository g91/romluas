--------------------------------------------------------------------------�q�����ؼЪ����ͤ����X�@�ӤH(���]�t�ۤv,���D�u���ۤv�@��)
function LuaFunc_GetAnotherPartyPlayer(AttackTarget)
	local Player = LuaFunc_PartyData(AttackTarget)
	local PartyPlayerID = 0
	for i = 1 , 1000 , 1 do
		local rnd =  Rand( table.getn(Player)-1 ) + 1
		if Player[rnd] ~= AttackTarget then
			PartyPlayerID = Player[rnd]
			break
		end
	end
	if PartyPlayerID == 0 then
		PartyPlayerID = AttackTarget
	end
	return PartyPlayerID
end
----------------------------------------------------�ˬd�S�wID��BUFF��m-----------------------------------------------
function Lua_BuffPosSearch( Obj , BuffID )
--Obj : �n�ˬd������
--BuffID : �n�ˬd��BUFF
--�^�ǭȬ���m�A-1�N��䤣��
	local Pos
	local Count = BuffCount( Obj );
	for i = 0 , Count-1 , 1 do
		if BuffInfo( Obj , i , EM_BuffInfoType_BuffID ) == BuffID then
			Pos = i
			return Pos
		end
	end
	Pos = -1
	return Pos
end
--------------------------------------------------------------------------�q�����ؼЪ����ͤ����XN�ӤH(���]�t�ۤv,���D�u���ۤv�@��)
function LuaFunc_GetAnotherPartyNPlayer(AttackTarget,HowMuch)
	local Player = LuaFunc_PartyData(AttackTarget)
	local PartyPlayerID = {}
	local Number = 1
	for i = 0 , table.getn(Player) do
--	Say(OwnerID(),Player[i])
	end
	if Player[0] == 1 then
		PartyPlayerID[Number] = AttackTarget
	elseif Player[0] <= HowMuch then
		local rnd =  Rand( Player[0] ) + 1
--		Say(OwnerID(),"rnd = "..rnd)
		for i= 0 , Player[0] , 1 do
			local AA = rnd + i
			if AA > Player[0] then
				AA = 1
			end
			if( Player[AA]  == nil ) then
--				Say(OwnerID(), "ERROR RND=" .. i  );
			end
			PartyPlayerID[Number] = Player[AA]
			Number = Number + 1
		end
	else
		local rnd =  Rand( Player[0] ) + 1
--		Say(OwnerID(),"rnd = "..rnd)
		for i= 0 , Player[0] , 1 do
			local AA = rnd + i
			if AA > Player[0] then
				AA = 1
			end
			if( Player[AA]  == nil ) then
--				Say(OwnerID(), "ERROR RND=" .. i  );
			end
			if Player[AA] ~= AttackTarget and ReadRoleValue( Player[AA] , EM_RoleValue_IsDead ) == 0 then

				PartyPlayerID[Number] = Player[AA]
				Number = Number + 1
--				Say(OwnerID(),Player[rnd+i])
			end
			if Number > HowMuch then
				break
			end
		end
	end
	return PartyPlayerID
end

----------------------------------------------------------------------------------�����ܨ��M��
function Lua_NoRide()
local BuffType = 0
local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		BuffType = GameObjInfo_int ( BuffID , "AssistType" )
		if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
			BuffType = GameObjInfo_int ( BuffID , "AssistType" )
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SC_NORIDE"),0)
			return false
		end
		if GameObjInfo_int ( BuffID , "AssistType" ) == 120 then
			BuffType = GameObjInfo_int ( BuffID , "AssistType" )
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SC_NORIDE"),0)
			return false
		end
		if GameObjInfo_int ( BuffID , "AssistType" ) == 187 then ----2012.06.13 �f���s�W�u�K�ܨ��L�k�ϥήy�M
			BuffType = GameObjInfo_int ( BuffID , "AssistType" )
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SC_NORIDE"),0)
			return false
		end
	end
	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) 
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 )
	local CheckResult = "No"
	local ZonePassList = {	100, 401,402,410,430,431,440,442,443,444,446,450,190,192,
				930,931,932,933,934,935,936,937,938,939,940,941,942,943,
				944,945,946,947,948,949,950,951,952,953,954,955,956,957	} --��S�Ҫ��ϰ�A�s���q1�}�l�A�Ӷ��ǽs��
	if table.getn(ZonePassList) > 0 then
		for i = 1 , table.getn(ZonePassList)  , 1 do
			if Zone == ZonePassList[i] then
				CheckResult = "Yes"
				break
			end
		end
	end
	if Zone < 100 then
		CheckResult = "Yes"
	end
	if CheckResult == "Yes" then
		return true
	else
		ScriptMessage( OwnerID(),OwnerID(),1,GetString("SC_NORIDE_2"),0)
		return false
	end	
end
--------------
function Lua_MonsterSurvive(MonsterGroup)	--�^�ǩǪ����`�ƶq
	local NewDead = 0

	for i = 1 , table.getn(MonsterGroup), 1 do
		if ReadRoleValue ( MonsterGroup[i] , EM_RoleValue_IsDead ) == 1 then
			NewDead = NewDead + 1
		end
	end
	return NewDead
end

----------------
function EX_GetDialogResoult(  GItemID , Time , Range,Target  ) --�q�Ψ��oDIALOG�P�_( ���o������ID�B�s�b����ơB�Z������B�Z������ѦҪ��ؼ� )
	local Ret;
	for i = 0 , Time*10, 1 do
		Sleep( 1 );
		Ret = DialogGetResult( GItemID );
		if GetDistance( GItemID , Target ) < Range and CheckID( Target ) == true then
			if ( Ret ~= -2 ) and ( Ret ~= -1 ) then
				return Ret;
			elseif Ret==-1 then
				return 100;
			end
		else
			return 100
		end
	end
	return 100
end
-------------------
function Lua_ObjDontTouch( Obj ,IfVaule) --���l��X�Ӫ����󤣷|�Q�I��
	if	IfVaule==nil	then
		IfVaule =true
	end
	if	IfVaule==true	then
		SetModeEx(  Obj  , EM_SetModeType_Mark, false) 
		SetModeEx(  Obj  , EM_SetModeType_HideName, true) 
		SetModeEx(  Obj  , EM_SetModeType_ShowRoleHead, false) 
		SetModeEx(  Obj  , EM_SetModeType_NotShowHPMP, false )	
	else
		SetModeEx(  Obj  , EM_SetModeType_Mark, true) 
		SetModeEx(  Obj  , EM_SetModeType_HideName, false) 
		SetModeEx(  Obj  , EM_SetModeType_ShowRoleHead, true) 
		SetModeEx(  Obj  , EM_SetModeType_NotShowHPMP, true )	
	end
	return obj
end
--�̻ݨD�i��ܾ԰����}�ξ԰�����
--����w�]�O����
function DW_UnFight(Obj,IfVaule)
	if	Obj == nil	then
		return
	end
	if	IfVaule==nil	or	IfVaule==true	then
		SetModeEx(  Obj  , EM_SetModeType_Fight, false) 
		SetModeEx(  Obj  , EM_SetModeType_Strikback, false) 
		SetModeEx(  Obj  , EM_SetModeType_Searchenemy, false )
	else
		SetModeEx(  Obj  , EM_SetModeType_Fight, true) 
		SetModeEx(  Obj  , EM_SetModeType_Strikback, true) 
		SetModeEx(  Obj  , EM_SetModeType_Searchenemy, true )
	end
end
-----------------------
function Lua_CancelAllBuff( Obj ) --�M�Ū��󨭤W�Ҧ� BUFF�A�u�൹�Ǫ���
	local BuffCount = BuffCount(Obj );
	if BuffCount > 0 then
		for i = 1 , BuffCount do
			local BuffID = BuffInfo( Obj , BuffCount-i , EM_BuffInfoType_BuffID)
			CancelBuff_NoEvent( Obj  , BuffID )
			--DebugMsg( 0, RoomID ,"BuffID..."..BuffID);
		end
	end
end
-----------------------
function Lua_CancelAnotherBuff( Role , BuffTable ) --�M�Ū��󨭤W���F�C�|�X�Ӫ� ID �H�~���Ҧ� BUFF�A�u�൹�Ǫ���
	if BuffCount(Role) > 0 then
		for i = 0 , BuffCount(Role) , 1 do
			local BuffID = BuffInfo( Role, i-1 , EM_BuffInfoType_BuffID)
			if  Type(BuffTable) == "number" then
				if BuffID ~= BuffTable then
					CancelBuff_NoEvent( Role , BuffID )
				end
			elseif Type(BuffTable) == "table" then
				local Check = "Cancel"
				for pry , obj in pairs(BuffTable ) do
					if BuffID == obj then
						Check = "Keep"
						break
					end
				end
				if Check == "Cancel" then
					CancelBuff_NoEvent( Role, BuffID )
				end
			else
				CancelBuff_NoEvent( Role , BuffID )
			end
		end
	end
end
-------------------- �b�ؼЫe���@�w�Z�������ͤ@�Ӫ���A�p�G���I�L�k���ͪ��~�A�h�b�ؼЦ�m���͡]���|addToPartition�^---------------
function Lua_CreateObjByDir( Obj , ObjID , Dis , face) --�ѦҪ���A���ͪ�����id�A�Z�� �A���V �G 0 ���ܬO���V�ѦҪ���A180 ���ܬO�I�V�ѦҪ���

	local Org = Role:new( Obj  )
	local Pos = {}
	local Dir = Org:Dir()
	local  NewRole
	local Cal
	if face == nil or Type( face) ~= "number" then
		face = 0
	end
	Cal = (math.pi/180)*(Dir ) 
	Pos["X"] = Org:X() +(Dis*math.cos(Cal))
	Pos["Z"] = Org:Z() - (Dis*math.sin(Cal))
	Pos["Y"] = GetHeight( Pos["X"] , Org:Y() , Pos["Z"] );
	for i = 1 , 9 , 1 do
		if CheckLine( Obj , Pos["X"] , Pos["Y"] , Pos["Z"] ) == false then
			Pos["X"] = Org:X() +(Dis*math.cos(Cal))*(10-i)/10
			Pos["Z"] = Org:Z() -(Dis*math.sin(Cal))*(10-i)/10
			Pos["Y"] = GetHeight( Pos["X"] ,  Org:Y() , Pos["Z"] )
		else
			break
		end
	end
	if Dis >= 0 then
		Dir = Dir +180-face
	else
		Dir = Dir + face
	end
	if Dir > 360 then
		Dir = Dir - 360
	end
	if Dir < 0 then
		Dir = Dir + 360
	end
	NewRole = CreateObj ( ObjID , Pos["X"]  , Pos["Y"] , Pos["Z"] , Dir , 1)
	return NewRole
end
----------�����Ƨ�-------------------------�]�o�|�N������Ҧ����Ȧs��@�� Table �̭��A�ÿ�X�o�� Table ���A�A pry �_�l�O 1 �A���e�O������m�^
function Lua_HateListPos( Num ) --Num �O�n�ƧǪ��ƶq�A�ƶq�U�֮��Ӫ��귽�U�֡A -1 ����������C�����ҷ|�i��ƧǡA�w�]�� -1
	if Num == nil or Num == 0 or Num > HateListCount( OwnerID() ) then
		Num = -1
	end
	local OrgTable = {}
	local ReturnTable = {}
	for i = 1 , HateListCount( OwnerID() ) , 1 do
		OrgTable[i] = HateListInfo(OwnerID() ,i-1 , EM_HateListInfoType_HatePoint ) 
		if Num == -1 then
			ReturnTable[i] = -1
		end
	end
	if Num~=-1 then
		for i = 1 , Num , 1 do
			ReturnTable[i] = -1
		end
	end
	for i = 1 , table.getn(ReturnTable) , 1 do
		local Value = -1
		local pry = -1
		for j = 1 , table.getn(OrgTable) , 1 do
			if OrgTable[j] > Value then
				Value = OrgTable[j] 
				pry = j
			end
		end
		OrgTable[pry] = -1
		ReturnTable[i] = pry - 1
	end
	--ReturnTable�����Ȭ� -1 ���ܡA�N��䤣��X�A����m
	return ReturnTable
end

------------------------------(��ΡA�Х�DW_HateSequence�N��)�h������C�� �ƦW�e�X �B�D���a������ �Ǧ^�ѤU���M��-------------------------
--Num  �A���Q�n����e�X�W����  ���Q��e1�W�N��1  ���Q��e��W�N��2
--�ϥέ���G�u��Ѫ��a����
--�^�������G�}�C
--�^�Ǥ��e�G���Ǫ�����C�������aID
--XX�۰ʥh���G�D���a������(11/7/1 davislin �������\��)
function DW_HateRemain(Num)
	local AllList = {}
	local AllListHate = {}
	local TempList = 0
	local TempValue = 0
--�v�@�ˬd�Ҧ�������m
	local TotalHate=HateListCount(OwnerID())
	if TotalHate==0 then
		return false
	end
	for i=0,TotalHate-1,1 do
		TempList = HateListInfo(OwnerID(),i,EM_HateListInfoType_GItemID)
--�P�_�O�_�����a
--�Y�O���a�[�J�t�@�Ӱ}�C��
--�P�ɰO����ID�������
	--	if	ReadRoleValue(TempList,EM_RoleValue_IsPlayer)==1 then
			AllList[table.getn(AllList)+1] = TempList
			AllListHate[table.getn(AllListHate)+1] = HateListInfo(OwnerID(),i,EM_HateListInfoType_HatePoint)
	--	end
	end
	if	Num == 0		then
		return AllList
	end
--��������ƦW�e�X�����a
	for j=1,Num,1 do
		TempList = 0
		TempValue = 0
		for i = 1,table.getn(AllListHate),1 do
			if	AllListHate[i] > TempList	then
				TempValue = i
				TempList = AllListHate[i]
			end
		end
		table.remove(AllList,TempValue)
		table.remove(AllListHate,TempValue)
	end
--�^�ǳѤU�����a�W��
	return AllList
end
function DW_HateSequence(Num)--�PDW_HateRemain,���e�аѷӤ��A���P���B�b��^�ǧΦ��û���Table( ��Y {} )
	local AllList = {}
	local AllListHate = {}
	local TempList = 0
	local TempValue = 0
--�v�@�ˬd�Ҧ�������m
	local TotalHate=HateListCount(OwnerID())
	if TotalHate==0 then
		return {}
	end
	for i=0,TotalHate-1,1 do
		TempList = HateListInfo(OwnerID(),i,EM_HateListInfoType_GItemID)
--�P�_�O�_�����a
--�Y�O���a�[�J�t�@�Ӱ}�C��
--�P�ɰO����ID�������
	--	if	ReadRoleValue(TempList,EM_RoleValue_IsPlayer)==1 then
			AllList[table.getn(AllList)+1] = TempList
			AllListHate[table.getn(AllListHate)+1] = HateListInfo(OwnerID(),i,EM_HateListInfoType_HatePoint)
	--	end
	end
	if	Num == 0		then
		return AllList
	end
--��������ƦW�e�X�����a
	for j=1,Num,1 do
		TempList = 0
		TempValue = 0
		for i = 1,table.getn(AllListHate),1 do
			if	AllListHate[i] > TempList	then
				TempValue = i
				TempList = AllListHate[i]
			end
		end
		table.remove(AllList,TempValue)
		table.remove(AllListHate,TempValue)
	end
--�^�ǳѤU�����a�W��
	return AllList
end
------------------------------����C��B�z�[�j�� �N���w����M�� �Ǧ^-------------------------
--Num  �A���Q�n����e�X�W����  ���Q��e1�W�N��1  ���Q��e��W�N��2
--�^�������G�}�C
--�^�Ǥ��e�G��󤳫�C����ID
function DW_HateRemainEX(Obj,Type,Num,OnlyPlayer)

--�d�ҡGDW_HateRemainEX(OwnerID(),"Include",2,true)
--�^��OwnerID()������C��e���

--Obj		��֪�����C��
--Type		��"Include"=>�줳��e�X  ��"Exclude"=>�ư�����e�X
--Num		�n��X�өαư��X��
--OnlyPlayer	�O�_�u�쪱�a�H(���L��)
	if	Obj ==nil	or
		Type==nil	or
		Num==nil	then
		return {}
	end
	
	local AllList = {}
	local AllListHate = {}
	local TempList = 0
	local TempValue = 0
--�v�@�ˬd�Ҧ�������m
	if	OnlyPlayer ~= false	then
		for i=0,HateListCount(Obj)-1,1 do
			TempList = HateListInfo(Obj,i,EM_HateListInfoType_GItemID)
		--	if	ReadRoleValue(TempList,EM_RoleValue_IsPlayer)==1	then--�P�_�O�_�����a
				AllList[table.getn(AllList)+1] = TempList--�Y�O���a�[�J�t�@�Ӱ}�C��
				AllListHate[table.getn(AllListHate)+1] = HateListInfo(Obj,i,EM_HateListInfoType_HatePoint)--�P�ɰO����ID�������
		--	end
		end
	else
		for i=0,HateListCount(Obj)-1,1 do
			table.insert(AllList,HateListInfo(Obj,i,EM_HateListInfoType_GItemID))--�[�J�t�@�Ӱ}�C��
			table.getn(AllListHate, HateListInfo(Obj,i,EM_HateListInfoType_HatePoint) )--�P�ɰO����ID�������
		end
	end
	if	Num == 0		then
		return AllList
	end



	local SPList = {}
	for j=1,Num,1 do
		TempList = 0
		TempValue = 0
		for i = 1,table.getn(AllListHate),1 do
			if	AllListHate[i] > TempList	then
				TempValue = i
				TempList = AllListHate[i]
			end
		end
		table.insert(SPList,AllList[TempValue])--�O�U����ƦW�e�X��
		table.remove(AllList,TempValue)--��������ƦW�e�X��
		table.remove(AllListHate,TempValue)
	end
	if	Type ~= "Include"	then
		return AllList--�^�ǳѤU���W��
	else
		return SPList--�^�ǳѤU���W��
	end


end
--------------------���ʦܫ��w�X�l----------------------------------

function DW_MoveToFlag( ObjID , FlagObjID , FlagID,Range , Enable  )
--ObjID ���沾�ʪ���H
--FlagObjID �X�l����Ʈw�s��
--FlagID �X�l�s��
--Range �üƨM�w���ʨ�w�I���d��
--Enable  0�A������movotoflag   1�A����movetoflag
	if	Enable ~= nil	then
		if	Enable == 1	then
			MoveToFlagEnabled( ObjID , false )
		end
	else
		MoveToFlagEnabled( ObjID , false )
	end
 	local X , Y , Z
	X = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_X )
	Y = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_Y )
	Z = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_Z )
	if	Range~=nil	then
		X = X + Rand( Range) * 2 - Range + 1
		Z = Z + Rand( Range) * 2 - Range + 1
	end

	return DW_WaitMoveTo( ObjID , X , Y  , Z )
end

function DW_WaitMoveTo( ObjID , X , Y, Z)
	--544800�X�Ц��}����  �i�J�԰����X
	local Obj = Role:new( ObjID )
	local LastX = 0
	local LastZ = 0
	local NowX,NowZ
	local DW = 0
	if X == 0 and Z == 0 then
		DeBugLog( 6 , ObjID.." Will Move To 0 , Y , 0 ")
	end
	local Time = Obj:Move(  X , Y ,Z  )
	if	Time ==nil	then
		Time = 1200
	else
		Time = (Time +600*5)/10
	end
	local Count = 0
	while 1 do
		for i = 0 , 60 , 1 do
			NowX = Obj:X()
			NowZ = Obj:Z()
			if	CheckFlag(ObjID,544800)==true	then  --�X�Ц��}����  �i�J�԰����X
				if	HateListCount(ObjID)~= 0		then
					return true
				end
			end
			if Abs( NowX - X ) < 10 and Abs( NowZ - Z ) < 10 then
				return true
			end

			if	(LastX == NowX 	and LastZ == NowZ) and
				ReadRoleValue(ObjID,EM_RoleValue_IsAttackMode)==0	then
				DW = DW + 1
				Obj:Move(  X , Y ,Z  )
			else
				DW = 0
			end

			if	DW >100	then
				return true
			end

			LastX = NowX
			LastZ = NowZ
			Sleep( 10 )
			Count = Count + 1
			if	Count > Time	then
				DeBugLog( 6 , ObjID.." Long Time to Move ! ")
				SetPos(ObjID ,X,Y,Z,Obj:Dir())
				return true
			end
		end
	end
	return false
end

--------------�P�_�M���w�X�l�O�_�b�Z������------------------
--ObjID   �P�_������
--FlagID �X�l�s��
--FlagNum �ĴX�ںX�l
--Range �n�P�_���Z��
function DW_CheckDis(ObjID,FlagID,FlagNum,Range)
	local FX,FZ,PX,PZ,Dis,x,z
	FX = GetMoveFlagValue(FlagID,FlagNum,EM_RoleValue_X)
	FZ = GetMoveFlagValue(FlagID,FlagNum,EM_RoleValue_Z)
	PX = ReadRoleValue(ObjID,EM_RoleValue_X)
	PZ = ReadRoleValue(ObjID,EM_RoleValue_Z)
	x = (FX-PX)^2
	z = (FZ-PZ)^2
	Dis = math.floor((x+z)^0.5)
	if	Dis > Range	then
		return false
	else
		return true
	end
end


----�P�_�O�_���w���a��ID��-----

function DW_CheckMap(ObjID,MapID)
	if	ObjID == nil	then
		return false
	end
	local X = ReadRoleValue(ObjID,EM_RoleValue_X)
	local Y = ReadRoleValue(ObjID,EM_RoleValue_Y)
	local Z = ReadRoleValue(ObjID,EM_RoleValue_Z)
	if	CheckMapID(  X ,Y ,Z , MapID )	then
		return true
	else
		return false
	end
end


--���oobj �Ҧb��mapid
function DW_GetMapID(Obj)
	local x = ReadRoleValue(Obj,EM_RoleValue_X)
	local y = ReadRoleValue(Obj,EM_RoleValue_Y)
	local z = ReadRoleValue(Obj,EM_RoleValue_Z)
	return FindMapID( x , y , z )
end
-------------------------------------------------------------------------�b����m�����OrgID����إߤ@�ӹ�߯x��Wnm�ݬ�1.3.5....Lnm�ݬ������,Wdis����V���Z,Ldis���e�ᶡ�Z
function Lua_MadeByRectangle(OrgID , Wdis , Ldis , Wnm , Lnm)
		local OldX = ReadRoleValueFloat(  OwnerID() , EM_RoleValue_X )
		local OldY = ReadRoleValueFloat(  OwnerID() , EM_RoleValue_Y )
		local OldZ = ReadRoleValueFloat(  OwnerID() , EM_RoleValue_Z )
		local OldDir = ReadRoleValueFloat(  OwnerID() , EM_RoleValue_Dir )
		local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
		local Cal = (math.pi/180)*(OldDir) 
		local hindrance = {}
		local CC = 1
		local dis = 0
		local NewX
		local NewY
		local NewZ
		local NewDir
		local WnmX = (Wnm-1)/2
		DebugMsg( 0, RoomID ,"WnmX = "..WnmX)
		for i = 1 , Lnm do
			dis = dis + Ldis
			DebugMsg( 0, RoomID ,"dis = "..dis.." i = "..i)
			hindrance[CC] = CreateObj( OrgID, OldX- dis*math.cos(Cal),OldY ,OldZ +dis*math.sin(Cal),OldDir , 1 )
			local NewX = OldX- dis*math.cos(Cal)
			local NewY = OldY
			local NewZ = OldZ +dis*math.sin(Cal)
			CC = CC + 1
			DebugMsg( 0, RoomID ,"CC = "..CC)
			local WdisX = 0
			for j = 1, WnmX do
				WdisX = WdisX + Wdis
				DebugMsg( 0, RoomID ,"Wdis = "..Wdis.." j = "..j)
				hindrance[CC] = CreateObj( OrgID, NewX+WdisX*math.sin(Cal) ,NewY ,NewZ +WdisX*math.cos(Cal),OldDir , 1 )
				CC = CC + 1
				DebugMsg( 0, RoomID ,"CC = "..CC)
				hindrance[CC] = CreateObj( OrgID, NewX-WdisX*math.sin(Cal) ,NewY ,NewZ -WdisX*math.cos(Cal),OldDir , 1 )
				CC = CC + 1
				DebugMsg( 0, RoomID ,"CC = "..CC)
			end
		end

		for i=1,table.getn(hindrance) do
			AddToPartition( hindrance[i] ,  RoomID  )
			--Yell(hindrance[i] ,"hindrance = "..hindrance[i].." i = "..i,5)
		end
		return hindrance
end
-------------------------------------------------------------------------�b����m�����OrgID"�}�C"�إߤ@�ӹ�߯x��Wnm�ݬ�1.3.5....Lnm�ݬ������,Wdis����V���Z,Ldis���e�ᶡ�Z
function Lua_MadeByRectangleX(OrgID , Wdis , Ldis , Wnm , Lnm)
		local OldX = ReadRoleValueFloat(  OwnerID() , EM_RoleValue_X )
		local OldY = ReadRoleValueFloat(  OwnerID() , EM_RoleValue_Y )
		local OldZ = ReadRoleValueFloat(  OwnerID() , EM_RoleValue_Z )
		local OldDir = ReadRoleValueFloat(  OwnerID() , EM_RoleValue_Dir )
		local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
		local Cal = (math.pi/180)*(OldDir) 
		local hindrance = {}
		local CC = 1
		local dis = 0
		local NewX
		local NewY
		local NewZ
		local NewDir
		local WnmX = (Wnm-1)/2
		--DebugMsg( 0, RoomID ,"WnmX = "..WnmX)
		for i = 1 , Lnm do
			dis = dis + Ldis
			--DebugMsg( 0, RoomID ,"dis = "..dis.." i = "..i)
			--DebugMsg( 0, RoomID ,"CC = "..CC)
			--DebugMsg( 0, RoomID ,"OrgID = "..OrgID[CC])
			hindrance[CC] = CreateObj( OrgID[CC], OldX- dis*math.cos(Cal),OldY ,OldZ +dis*math.sin(Cal),OldDir , 1 )
			local NewX = OldX- dis*math.cos(Cal)
			local NewY = OldY
			local NewZ = OldZ +dis*math.sin(Cal)
			CC = CC + 1
			local WdisX = 0
			for j = 1, WnmX do
				WdisX = WdisX + Wdis
				--DebugMsg( 0, RoomID ,"Wdis = "..Wdis.." j = "..j)
				hindrance[CC] = CreateObj( OrgID[CC], NewX+WdisX*math.sin(Cal) ,NewY ,NewZ +WdisX*math.cos(Cal),OldDir , 1 )
				--DebugMsg( 0, RoomID ,"OrgID = "..OrgID[CC])
				CC = CC + 1
				--DebugMsg( 0, RoomID ,"CC = "..CC)
				hindrance[CC] = CreateObj( OrgID[CC], NewX-WdisX*math.sin(Cal) ,NewY ,NewZ -WdisX*math.cos(Cal),OldDir , 1 )
				--DebugMsg( 0, RoomID ,"OrgID = "..OrgID[CC])
				CC = CC + 1
				--DebugMsg( 0, RoomID ,"CC = "..CC)
			end
		end

		for i=1,table.getn(hindrance) do
			AddToPartition( hindrance[i] ,  RoomID  )
			--Yell(hindrance[i] ,"hindrance = "..hindrance[i].." i = "..i,5)
		end
		return hindrance
end
-------------------------------------------------------------------------�bXYZ�����OrgID����إߤ@�ӹ�߯x��Wnm�ݬ�1.3.5....Lnm�ݬ������,Wdis����V���Z,Ldis���e�ᶡ�Z
function Lua_MadeRectangleByXYZ(OrgID , OldX , OldY , OldZ , OldDir , Wdis , Ldis , Wnm , Lnm)
		local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
		local Cal = (math.pi/180)*(OldDir) 
		local hindrance = {}
		local CC = 1
		local dis = 0
		local NewX
		local NewY
		local NewZ
		local NewDir
		local WnmX = (Wnm-1)/2
		DebugMsg( 0, RoomID ,"WnmX = "..WnmX)
		for i = 1 , Lnm do
			dis = dis + Ldis
			DebugMsg( 0, RoomID ,"dis = "..dis.." i = "..i)
			hindrance[CC] = CreateObj( OrgID, OldX- dis*math.cos(Cal),OldY ,OldZ +dis*math.sin(Cal),OldDir , 1 )
			local NewX = OldX- dis*math.cos(Cal)
			local NewY = OldY
			local NewZ = OldZ +dis*math.sin(Cal)
			CC = CC + 1
			DebugMsg( 0, RoomID ,"CC = "..CC)
			local WdisX = 0
			for j = 1, WnmX do
				WdisX = WdisX + Wdis
				DebugMsg( 0, RoomID ,"Wdis = "..Wdis.." j = "..j)
				hindrance[CC] = CreateObj( OrgID, NewX+WdisX*math.sin(Cal) ,NewY ,NewZ +WdisX*math.cos(Cal),OldDir , 1 )
				CC = CC + 1
				DebugMsg( 0, RoomID ,"CC = "..CC)
				hindrance[CC] = CreateObj( OrgID, NewX-WdisX*math.sin(Cal) ,NewY ,NewZ -WdisX*math.cos(Cal),OldDir , 1 )
				CC = CC + 1
				DebugMsg( 0, RoomID ,"CC = "..CC)
			end
		end

		for i=1,table.getn(hindrance) do
			AddToPartition( hindrance[i] ,  RoomID  )
			--Yell(hindrance[i] ,"hindrance = "..hindrance[i].." i = "..i,5)
		end
		return hindrance
end
--------------------�۸O����²����------------------

function DW_Border(QuestID) --��J���Ƚs���Y�i �ثe�����u�i���I�����~���o���Ȩϥ�
	local Obj = OwnerID()
	local QuestLv = GameObjInfo_Int( QuestID ,"iCheck_LowerLV") 
	if	ReadRoleValue(Obj,EM_RoleValue_Lv)<QuestLv	then
		ScriptMessage( Obj, Obj, 1, "[SYS_QUEST_01]"..QuestLv, 0 )
		return false
	end
	if	CheckCompleteQuest(Obj,QuestID)==true	then
		local QuestType = GameObjInfo_Int( QuestID ,"iQuestGroup") 
		if	QuestType == 0 	then
			ScriptMessage( Obj, Obj, 1, "[SYS_QUEST_02]", 0 )
			return false
		end
	end
	if	CheckAcceptQuest(Obj,QuestID)==true	then
		ScriptMessage( Obj, Obj, 1, "[SYS_QUEST_03]", 0 )
		return false
	end
--���X����W��
	local str = "["..GetUseItemGUID(Obj).."]"
--��l�ƥ۸O����
	ClearBorder( Obj)	
--�۸O���e
	AddBorderPage( Obj, GetQuestDetail(QuestID,1))
--�۸O���D
	ShowBorder( Obj, QuestID,str,"ScriptBorder_Texture_Paper" )
end


---------------------------�ɶ��B�� �쩳�L�F�h�[�H-----------------------------------------

function DW_TimeCount(later,early)
	local Result = {}
	for i=1,4,1 do
		if	later[i] ~= nil		and
			early[i] ~= nil		then
			Result[i] = later[i]-early[i]
		else
			break
		end
	end
	if	Result[1] ~= nil	then
		if	Result[1]<0	then
			Result[2] = Result[2] -1
			Result[1] = Result[1] +60
		end
	end

	if	Result[2] ~= nil	then
		if	Result[2]<0	then
			Result[3] = Result[3] -1
			Result[2] = Result[2] +24
		end
	end

	if	Result[3] ~= nil	then
		if	Result[3]<0	then
			Result[4] = Result[4] -1
			Result[3] = Result[3] +30
		end
	end

	if	Result[4] ~= nil	then
		if	Result[4]<0	then
			Result[4] = Result[4] +12
		end
	end

	return Result
end
-------�����Ĥ��P�_�ϰ�
function Lua_NoPVPUSE()
	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) 
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 )
	local CheckResult = "No"
	local Pass = {401}
	if Zone < 400 then
		CheckResult = "Yes"
	end
	for i=1,table.getn(Pass) do
		if Zone == Pass[i] then
			CheckResult = "No"
		end
	end
	if CheckResult == "Yes" then
		return true
	else
		ScriptMessage( OwnerID(),OwnerID(),1,"[SC_DAN_111700_37]",0)
		return false
	end	
end
function Lua_MoveLine( Obj , Dis ) --�ѦҪ���A�V�e���ʨ�Dis�Z������m
	local RoomID = ReadRoleValue(  OwnerID() , EM_RoleValue_RoomID)
	local Org = Role:new( Obj  )
	local Pos = {}
	local Dir = Org:Dir()
	local  NewRole
	local Cal
	Cal = (math.pi/180)*(Dir ) 
	Pos["X"] = Org:X() +(Dis*math.cos(Cal))
	Pos["Z"] = Org:Z() - (Dis*math.sin(Cal))
	Pos["Y"] = GetHeight( Pos["X"] , Org:Y() , Pos["Z"] );
	for i = 1 , 9 , 1 do
		if CheckLine( OwnerID() , Pos["X"] , Pos["Y"] , Pos["Z"] ) == false then
			Pos["X"] = Org:X() +(Dis*math.cos(Cal))*(10-i)/10
			Pos["Z"] = Org:Z() -(Dis*math.sin(Cal))*(10-i)/10
			Pos["Y"] = GetHeight( Pos["X"] ,  Org:Y() , Pos["Z"] )
		else
			break
		end
	end
--	DebugMsg( 0, RoomID ,"Move to X = "..Pos["X"].." Y = "..Pos["Y"].." Z = "..Pos["Z"])
	Move( Obj , Pos["X"]  , Pos["Y"] , Pos["Z"] )
end
-------------------------�ˬd�O�_�w�g���ä[�]
function Lua_CheckFlagByFlag(FlagID)
	if CheckFlag( OwnerID() , FlagID ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_ALREADYHAVEBAG]" , "0xffff0000" );
		return FALSE
	end
	SetFlag( OwnerID() , FlagID ,1)
	return TRUE
end
------����Target�a�AValue�I
function Lua_AddHonor( GUID , Value)
	AddRoleValue( GUID , EM_RoleValue_Honor , Value )
	ScriptMessage( GUID , GUID , 0 , "[SC_GUILD_WARRIOR_15][$SETVAR1="..Value.."]" , 0 )
end
function Lua_GetFormHate(HateList,Num)--Num���X�ƶq
	if Num > #HateList then
		Num = #HateList;
	end
	local RR = Lua_Table_GetRdIndex(#HateList,Num);
	local NewHateList = {}
	for i,v in ipairs(RR) do
		table.insert(NewHateList,HateList[v])
	end
	return NewHateList;
end
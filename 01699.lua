------------------------------�q����C����o�H�����a(TargetPlayer)------------------------------
function Lua_RandomPlayerFromHateList(BossID,HowMuch,AntiTank) --HowMuch��J�h�ִN�O���h�֭Ӫ��a�AAntiTank��TRUE�N�O�n�ƩZ
	local Hate = KS_GetHateList( BossID, 1 )
	local TargetPlayer = {}			--���a�}�C
	local RPX = 0
	--
	if AntiTank == "TRUE" then
		table.remove(Hate,1)	
	end
	--
	local HateCount = table.getn(Hate)
	--
	RPX = DW_Rand(HateCount)
	if HowMuch < HateCount then
		for i=1,HowMuch do
			RPX = RPX + ( HateCount - 1 )
			if RPX <= HateCount then
				TargetPlayer[i] = Hate[RPX]
			else
				RPX = RPX - HateCount
				TargetPlayer[i] = Hate[RPX]
			end
		end
		return TargetPlayer
	else
		return Hate
	end
end

------------------------------------��µ������~------------------------------------
function LuaI_JustGive(id)
	GiveBodyItem(OwnerID(), id, 1)
end

------------------------------------�������ϥΪ��~AddBuff------------------------------------
function FN_addbuff(IDtype,BuffID,MagicLv,EffectTime,iMotionID) --IDtype��0�N�OOwner  ��1�N�OTarget
	PlayMotion ( OwnerID(),iMotionID)
	if IDtype == 0 then
		AddBuff( OwnerID() ,BuffID,MagicLv ,EffectTime)
	elseif IDtype == 1 then
		AddBuff( TargetID() ,BuffID,MagicLv ,EffectTime)
	end		
end

------------------------------------�έp�S�wBuff����------------------------------------
function FN_CountBuffLevel(TempID,BuffID)
	local Count = BuffCount(TempID)
	local TempBuff
	local BuffLV

	if CheckBuff(TempID,BuffID) == TRUE then
		for i = 0,Count do
			TempBuff = BuffInfo ( TempID , i , EM_BuffInfoType_BuffID )
			if TempBuff == BuffID then
				BuffLV = BuffInfo ( TempID , i , EM_BuffInfoType_Power )
				return BuffLV
			end
		end
	else
		return -1
	end
end
------------------------------------ChangeZoneByFlag------------------------------------
function FN_ChangeZoneByFlag(ObjID , FlagID ,NUM)
	local ZoneID = ReadRoleValue( ObjID, EM_RoleValue_ZoneID )
	local RoomID = ReadRoleValue( ObjID, EM_RoleValue_RoomID )
	local X = GetMoveFlagValue( FlagID,NUM, EM_RoleValue_X )
	local Y = GetMoveFlagValue( FlagID,NUM, EM_RoleValue_Y )
	local Z = GetMoveFlagValue( FlagID,NUM, EM_RoleValue_Z )
	local Dir = GetMoveFlagValue( FlagID,NUM, EM_RoleValue_Dir )

	ChangeZone( ObjID, ZoneID, RoomID, X, Y, Z, Dir )
end
------------------------------------�]�w���ͦs�ɶ�------------------------------------
function FN_SetLifeTime(TempID,Time)
	BeginPlot(TempID,"FN_SetLifeTime_effect",Time)
end

function FN_SetLifeTime_effect()
	DelObj(OwnerID())
end
------------------------------------�줳����Z��Boss�̻���X�Ӫ��a------------------------------------
function FN_BossComparePlayerDistance(BossID,WhatType,HowMuch)
	--BossID ��֪������
	--WhatType ��1��̪��Z���A��2��̵u�Z��
	--HowMuch ��X��
	local HateList = KS_GetHateList(BossID)
	local DistanceList = {}
	local DisCheck = 0
	
	if HowMuch < table.getn(HateList) then
		for i=1,table.getn(HateList) do
			local TempDis1 = GetDistance( BossID, HateList[i] )
			if table.getn(DistanceList) == 0 then
				table.insert(DistanceList,HateList[i])
			else
				for j=1,table.getn(DistanceList) do
					local TempDis2 = GetDistance( BossID, DistanceList[j] )
					if TempDis1 > TempDis2 then
						table.insert(DistanceList,j,HateList[i])
					end
				end
			end
		end
		return DistanceList
	else
		return HateList
	end
end
------���S�wID�O�_�b���w��TABLE��------
function FN_InTableCheck(id,table)
	local check = FALSE
	if #table == 1 then
		if table[1] == id then
			check = TRUE
		end
	else
		for i = 1, #table do
			if table[i] == id then
				check = TRUE
				break
			end
		end	
	end

	return check
end
------�ǰe------
function FN_teleport()
--	local X = ReadRoleValue(OwnerID(),EM_RoleValue_X)
--	local Y = ReadRoleValue(OwnerID(),EM_RoleValue_Y)
--	local Z = ReadRoleValue(OwnerID(),EM_RoleValue_Z)
	setpos( OwnerID() , kg_GetRangePos( OwnerID() , nil , 100 , 0 , -3  ) )
end

function FN_goflag1()
	SetPosByFlag(OwnerID(),780288,0)
end
function FN_goflag2()
	SetPosByFlag(OwnerID(),780192,0)
end
-----�վ�ޯ�CD�ɶ�-----
function Lua_CDtime_set(ObjID,MagicID,Time)	--�վ�ObjID���ޯ�MagicID���N�o�ɶ��ATime�p�G��0�άO�j��0�A�|������ޯ઺CD�]��Time�F�p�G�]�t�ƫh�O���ޯ�CD���Time
	local RoomID = ReadRoleValue( ObjID , EM_RoleValue_RoomID)
	local Class = GameObjInfo_Int( MagicID ,"ColdownClass")  -- ��o�Ӫk�N���I�k�N�o��� - ����
	local Type = GameObjInfo_Int( MagicID ,"ColdownType")  -- ��o�Ӫk�N���I�k�N�o��즸���� - �N�o����
	--local CD = GameObjInfo_Int( MagicID ,"ColdownTime") -- ��o�Ӫk�N���I�k�N�o��즸���� - �N�o�ɶ�
	local CD = ReadRoleValue( ObjID ,EM_RoleValue_Coldown_Job + Type) -- ��o�Ӫk�N��U���N�o�ɶ�
	
	if Time >= 0 then
		WriteRoleValue( ObjID , EM_RoleValue_Coldown_Job + Type , Time )
		DebugMsg( ObjID , RoomID , "MagicID "..MagicID.." CoolDown set to "..Time)
	else
		WriteRoleValue( ObjID , EM_RoleValue_Coldown_Job + Type , CD + Time )
		DebugMsg( ObjID , RoomID , "MagicID "..MagicID.." CoolDown decrease "..Time.. " to "..(CD + Time))
	end
end
------------------------------------�i������_------------------------------------
function Check_CanBeKill()
	local PlayerID = OwnerID()
	local ObjID = TargetID()
	local RoomID = ReadRoleValue( PlayerID , EM_RoleValue_RoomID)
	local AttackCheck = CheckRelation(PlayerID,ObjID,EM_CheckRelationType_Attackable)	--�i�_����
	local EnemyCheck = CheckRelation(PlayerID,ObjID,EM_CheckRelationType_Enemy)		--�O�_���ĤH

--	if AttackCheck == true then DebugMsg( PlayerID, RoomID, "AttackCheck=True") else DebugMsg( PlayerID, RoomID, "AttackCheck=False") end
--	if EnemyCheck == true then DebugMsg( PlayerID, RoomID, "EnemyCheck=True") else DebugMsg( PlayerID, RoomID, "EnemyCheck=False") end

	--if AttackCheck == TRUE and EnemyCheck == TRUE then
	if AttackCheck == TRUE then
		return TRUE
	else
		return FALSE
	end
end
------------------------------------�T�{MemberID�O���O��RoleID�P��------------------------------------
function Check_InParty(RoleID,MemberID)
	local PlayerID 
	local ObjID
	if RoleID == nil then
		PlayerID = OwnerID()
	else
		PlayerID = RoleID
	end
	if ObjID == nil then
		ObjID = TargetID()
	else
		ObjID = MemberID
	end
	--
	if PlayerID == ObjID then
		return TRUE
	end
	--
	local PartyNum = GetPartyID( PlayerID, -1)
	for i=1,PartyNum do
		if ObjID == GetPartyID( PlayerID, i) then
			return TRUE
		end
	end
	--
	return FALSE
end
-----��g�q�ʤ���-----
function Lua_PercentHP(ObjID)
	local NowHp = ReadRoleValue(ObjID, EM_RoleValue_HP)
	local MaxHp = ReadRoleValue(ObjID, EM_RoleValue_MaxHP)
	local PercentHP = (NowHp/MaxHp)*100

	return PercentHP
end

-----test-----
function FN_campIDtest()
	local Player = OwnerID()
	local campID = ReadRoleValue(Player,EM_RoleValue_CampID)
	Say(Player, "campID="..campID)
end

function FN_SetPosByAngle(ObjX,ObjY,ObjZ,Angle,Dis)
	local radian = (math.pi/180)*( Angle )
	ObjX = ObjX + (math.cos(radian)*Dis)
	ObjY = ObjY - (math.sin(radian)*Dis)
	ObjZ = ObjZ - (math.sin(radian)*Dis)

	return ObjX,ObjY,ObjZ
end

function FN_Q1()
	local ObjID = OwnerID()
	local ObjX = ReadRoleValue(ObjID, EM_RoleValue_X)
	local ObjY = ReadRoleValue(ObjID, EM_RoleValue_Y)

	local ObjZ = ReadRoleValue(ObjID, EM_RoleValue_Z)
	local RoomID = ReadRoleValue(ObjID,EM_RoleValue_RoomID)
	local ObjTable = {}
	local Angle = 36
	local iX,iY,iZ
	local X = 11
	local Y = 1

	for i=1,10 do
		iX,iY,iZ = FN_SetPosByAngle(ObjX,ObjY,ObjZ,Angle*i,50)

		ObjTable[i] = CreateObj( 100292, iX, iY, iZ, 0, 1 )
		
		SetModeEx(ObjTable[i], EM_SetModeType_Gravity, FALSE )
		SetModeEx(ObjTable[i], EM_SetModeType_AlignToSurface, FALSE )
		MoveToFlagEnabled( ObjTable[i], FALSE )
		WriteRoleValue(ObjTable[i], EM_RoleValue_IsWalk, 0 )
		AddToPartition(ObjTable[i],RoomID)
	end

	while TRUE do
		Sleep(5)
		ObjX = ReadRoleValue(ObjID, EM_RoleValue_X)
		ObjY = ReadRoleValue(ObjID, EM_RoleValue_Y)
		ObjZ = ReadRoleValue(ObjID, EM_RoleValue_Z)
		for i=1,10 do
			iX,iY,iZ = FN_SetPosByAngle(ObjX,ObjY,ObjZ,Angle*i,50)
			if (i-Y) <= 0 then
				X = 10+(i-Y)
			else
				X = i-Y
			end
--			Say(ObjID, "("..X..")".."move to "..i)
--			iX = ReadRoleValue(ObjTable[X], EM_RoleValue_X)
--			iY = ReadRoleValue(ObjTable[X], EM_RoleValue_Y)
--			iZ = ReadRoleValue(ObjTable[X], EM_RoleValue_Z)
			MoveDirect( ObjTable[X], iX, iY, iZ )
		end
		Y = Y+1
		if Y==11 then
			Y=1
		end
	end
end

function FN_BoardTest()
	local Player = OwnerID()

--	Billboard_Add ( Player , EM_BillboardSortType_Guildwarrior , 50 )
	OpenClientMenu( Player , EM_ClientMenuType_BillBoard+4)
--	SendMail ("Reficul", "test", "testNote")
--	SendMailEx( "MailNPC" , "Guildtest" , "Hi" , "I love u" , 208678 , 1 , 10000 )

	--Say(Player, EM_BillboardSortType_AncientDreamSpace)
end

function SiegeTouch()
	SetPlot( OwnerID(), "range", "SiegeTouchFunc", 50 )
end

function SiegeTouchFunc()
	Say( OwnerID(), "OwnerID" )
	Say( TargetID(), "TargetID" )
end

function GameObjInfoTEST()
	local ObjStringA = GameObjInfo_Str( 111284, "Name" )
	local ObjStringB = GameObjInfo_Str( 111284, "ImageID" )
	local ObjStringB = GameObjInfo_Str( 111284, "szLuaScript" )

	Say( OwnerID(), ObjStringA )
	Say( OwnerID(), ObjStringB )
	Say( OwnerID(), ObjStringC )
end

function GameObjInfoTEST2(x)
	Say( OwnerID(), "2" )
	Say( OwnerID(), x )
end
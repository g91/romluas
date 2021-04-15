function Lua_Hao_Set_Magic_Wardrobe(Choise)

	local Player = OwnerID()
	if Choise ~= 0 and Choise ~= 1 then 
		DebugMsg( Player , 0 , "Entry error" )
		return false
	end
	
	local Page= {	EM_AccountFlag_MW_Space_Switch_1 ,
			EM_AccountFlag_MW_Space_Switch_2 ,
			EM_AccountFlag_MW_Space_Switch_3 ,
			EM_AccountFlag_MW_Space_Switch_4 , 
			EM_AccountFlag_MW_Space_Switch_5 ,
			EM_AccountFlag_MW_Space_Switch_6 ,
			EM_AccountFlag_MW_Space_Switch_7 ,
			EM_AccountFlag_MW_Space_Switch_8	}			
			
	local Set= {	EM_AccountFlag_MW_Set_Switch_1 , 
			EM_AccountFlag_MW_Set_Switch_2 ,
			EM_AccountFlag_MW_Set_Switch_3 ,
			EM_AccountFlag_MW_Set_Switch_4 ,
			EM_AccountFlag_MW_Set_Switch_5	}

	local Select = { Page , Set }

	for i = 1 , table.getn(Select) , 1 do
		for j = 1 , table.getn(Select[i]) , 1 do
		--	DebugMsg( Player , 0 , Select[i][j] )
			WriteAccountFlagValue( Player , Select[i][j] , 1 , Choise )
		--	DelBodyItem( Player , Select[i][j] , 1 )
		end
	end
end

function Lua_Event_Return_Log(Value)

	local Player = OwnerID()
	local Lv = ReadRoleValue( Player , EM_RoleValue_LV )		-- ���o���a����
	local SubLv = ReadRoleValue( Player , EM_RoleValue_LV_SUB )	-- ���o���a��¾����
	local String = "Lv = "..Lv.." SubLv = "..SubLv.." "
--	local Month = string.format("%02d", GetSystime(3)+1 )
--	local Day = string.format("%02d", GetSystime(4) )
--	local Hour = string.format("%02d", GetSystime(1) )
--	local Min = string.format("%02d", GetSystime(2) )	
	
	if Value == nil then
		DebugMsg( Player , 0 , " Entry error" )
		return false
	else
		if Type(Value) == "table" then
			for i = 1 , table.getn(Value) , 1 do
				if Type(Value[i]) ~= "number" and Type(Value[i]) ~= "string" then
					DebugMsg( Player , 0 , i.." Entry error" )
					return
				end
				if i > 1 then
					String = String..Value[i]
				end
			end
			Value = Value[1]
		end
		DesignLog( Player , Value , String )
	end
end

function Lua_Hao_ReturnKeyitem(Value)

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	if CheckFlag( Player , Value )  == true then
		DebugMsg( Player , Room , "True" )
	else
		DebugMsg( Player , Room , "False" )
	end
end


function Lua_Del_QuestDetail(Value)	-- �R�����Ƚs��

	local Player = OwnerID()
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local QuestID = 420025
	
	if Value ~= nil then
		DeleteQuest( Player , Value )
		DebugMsg( Player , RoomID , "You have already deleted Quest "..Value )
	else
		While true do
			if QuestID <= 429999 then
				if CheckAcceptQuest( Player , QuestID ) == true then
					DeleteQuest( Player , QuestID )
					DebugMsg( Player , RoomID , "You have already deleted Quest "..QuestID )				
					break
				end
				if QuestID % 100 == 0 then
					DebugMsg( Player , RoomID , QuestID )
					sleep(1)
				end
			end
			QuestID = QuestID + 1
		end
	end
end

function Lua_Hao_Test_Check_SetPlot_Touch()

	if Lua_Hao_Check_SetPlot_Touch(OwnerID()) == true then
		Say( OwnerID() , "Casting" )
	else
		Say( OwnerID() , "Nothing" )
	end
end

function Lua_Hao_Check_SetPlot_Touch( ObjID )	-- �d�ߥؼЬO�_��Ĳ�I�@�����I�k��

	if ObjID == nil then
		ObjID = OwnerID()
	end
	
	if CheckCastBarStatus( ObjID ) == -1 then
		return false
	else
		return true
	end
end
-- 2013.09.24 Ĳ�I�@���i�椤���ϡA�ɭPĲ�I�@���d���|���m�����p�A�ҥH�ݭn�����ʧR���C
function Hao_SetPlot_Touch_Reset( ObjID )	-- �����ؼШ��WĲ�I�@�����I�k�����A

	if ObjID == nil then
		ObjID = OwnerID()
	end
	
	local CheckStatus = CheckCastBar( ObjID )

	if CheckStatus == 0 then	-- �j��0�����\�����B0���i�椤�B�p��0�����_
		EndCastBar( ObjID , CheckStatus )
	end
end
--
function Lua_FE_Reset(ObjID)	-- Festival&Event -- �M�����ʤ��|�v�T��Buff

	if ObjID == nil then
		ObjID = OwnerID()
	end

	local BuffID = {
			502030	-- 2012.10.25 �̲ױ�ū
					}

	for i = 1 , #BuffID , 1 do
		if CheckBuff( ObjID , BuffID[i] ) == true then
			CancelBuff( ObjID , BuffID[i] )
		end
	end
end

function Hao_Cancel_Buff()	-- �R�����W�Ҧ�Buff

	local Player = OwnerID()
	local BodyBuff
	local CountBuff = BuffCount( Player )	-- Ū�����W��Buff�ƶq
	for i = CountBuff-1 , 0 , -1 do
		BodyBuff = BuffInfo( Player , i , EM_BuffInfoType_BuffID )	-- Ū����Buff��ID
		CancelBuff_NoEvent( Player, BodyBuff )
		DebugMsg( Player , 0 , BodyBuff )
	end
end

function Hao_Give_All_Recipes()	-- �������a�ܤ�����������Ͳ��t��

	local Player = OwnerID()
	local Field = {}
	
	for GUID = 540000 , 540005 , -1 do
	 	Field[1] = GameObjInfo_Int( GUID , "Type" )
	 	Field[2] = GameObjInfo_Int( GUID , "OutputLanguage" )
	 	Field[3] = GameObjInfo_Int( GUID , "Translate" )
	 	DebugMsg( Player , 0 , " 1 ="..Field[1].." 2 = "..Field[2].." 3 = "..Field[3] )
		if Field[1] == 5 and Field[2] == -1 and Field[3] == 1 then
			SetFlag( Player , GUID , 1 )
		end
		if GUID%1000 == 0 then
			Sleep(1)
		end
	end
end

function Hao_Get_Server_Level_Cap()	-- Ū���Ӧ��A���]�w�����ŤW��

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local LV_Cap = ReadRoleValue( Player , EM_RoleValue_MaxLv )	-- Ū���Ӧ��A���]�w�����ŤW��
	DebugMsg( Player , Room , "Server Player Level Cap = "..Lv_Cap )
end

function Hao_Search_Player(Room)
-- ���ܵ�������ܸ� Zone �e50��Room�����a�M��A�C���̦h�P����� 255 �Ӫ��a�A�W�L���Ʀr�A�ХH���w Room ���覡�i��C
--/gm pcall Hao_Search_Player(
--/gm pcall Hao_Search_Player(Room

	local Player = OwnerID()
	local Total = 0		-- �Ӱϰ쪱�a�`�ƶq
	if Room == nil then	-- ���N�J���w Room �ɡA�@����50��Room
		Room = 50
	end

	for i = 0 , Room , 1 do
		local Count
		local Choise = 0
	--	local localRoom = ReadRoleValue( Player , EM_RoleValue_RoomID )		
		if Room == 50 then	-- �S�����w�j�M�S�w Room ��
			Count = SetSearchAllPlayer(i)
		else	-- �����w�j�M�S�w Room ��
			Count = SetSearchAllPlayer(Room)
			Choise = 1
			if Count == 0 then
				ScriptMessage( Player , Player , 0 , "Room : "..Room.." Nobody here" , C_SYSTEM )
				break
			end
		end
	--	DebugMsg( Player , 0 , "Room : "..i.." Count : "..Count )
		if Count ~= 0 then
			for Number = 1 , Count , 1 do
				if ReadRoleValue( Player , EM_RoleValue_Register+1 ) == 1 then
				else
					Total = Total + 1
					local Guid = GetSearchResult()
					local Name = GetName( Guid )
					if Choise == 1 then
						ScriptMessage( Player , Player , 0 , "Room : "..Room.." No."..string.format( "%03d", Total ).." Name : "..Name , C_SYSTEM )
					else
						ScriptMessage( Player , Player , 0 , "Room : "..i.." No."..string.format( "%03d", Total ).." Name : "..Name , C_SYSTEM )
					end
				--	DebugMsg( Player , localRoom , "Room : "..i.." No."..string.format( "%03d", Number ).." Name : "..Name )
				--	if Total%200 == 0 then	-- ���ܵ�������ܪ����a�W��C�W�L200�H�ɡA�|���� 15 ��
				--	end
				end
			end
			if Choise == 1 then
				break
			end
		end
	end
end

function Hao_Recall_Npc(ObjID)	-- �إߪ���ɡA�Ӫ��󪺵��Ť��|�H��Ʈw�]�w���H�����Ŧ��ܰ�

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Pos = {}
	Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"] = Lua_Hao_Return_Coordinate(Player) -- �����a��e�y��
	local Level = GameObjInfo_Int( ObjID , "Level" )	-- Ū����Ʈw���]�w�����šA���]�t�H���϶�����
	local Npc = CreateObj( ObjID , Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"] , 1 )	-- �إ� Npc
	WriteRoleValue( Npc , EM_RoleValue_LV , Level )	-- �]�w��ƪ����� Level
	SetModeEx( Npc , EM_SetModeType_Show , true )	-- ���
	SetModeEx( Npc , EM_SetModeType_Drag , true )		-- ����
	SetModeEx( Npc , EM_SetModeType_Searchenemy , true )	-- ����
	SetModeEx( Npc , EM_SetModeType_Mark , true )		-- �аO
	SetModeEx( Npc , EM_SetModeType_Revive , true )	-- ����
	SetModeEx( Npc , EM_SetModeType_Strikback , true )	-- ����
	SetModeEx( Npc , EM_SetModeType_Fight , true )		-- ���
	SetModeEx( Npc , EM_SetModeType_Gravity , true )	-- ���O
	SetModeEx( Npc , EM_SetModeType_Move , true )	-- ����
	SetModeEx( Npc , EM_SetModeType_ShowRoleHead , true )	-- �Y����
	AddToPartition( Npc , Room )
	return Npc
end

function Dis_Between_Objs(Range)	-- ���d�򤺪��Ҧ�����A���X�PObj�����Z��

	local ObjID = OwnerID()
	local Count = SetSearchRangeInfo( ObjID , Range )	-- ���X�d�򤺩Ҧ�����(�t�ۤv)
	local ID , Distance 
	for i = 1 , Count , 1 do
		ID = GetSearchResult()	-- �^�ǽd�򤺩Ҧ����� GitemID
		Distance = GetDistance( ObjID , ID )
		if ID ~= ObjID then
			Yell( ID , Distance , 5 )		
		--	Say( ID , Distance )
		end
	end
end

function Hao_Check_MaxLevel()	-- ���̷ӰѦҪ���AŪ�X Server ���]�w����
	
	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local MaxRoleLevel = GetIniValueSetting("MaxRoleLevel")
	DebugMsg( Player , Room , MaxRoleLevel )
end
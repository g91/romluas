function Hao_Recall_Zone_Npc( Switch , Monsters )	-- �s��۩�

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local X , Y , Z , Dir = Lua_Hao_Return_Coordinate(Player)	-- ���y��
	local Cal = (math.pi/180)*(Dir)
	local Npc = {}

	if Type(Monsters) ~= "table" then
		DebugMsg( Player , Room , "Not table" )
		return false
	end

	local Total = #Monsters
	DebugMsg( Player , Room , "Totally Monsters : "..Total )

	local Array = 1
	while true do
		local Matrix
		Matrix = Array^2
		if Matrix >= Total then
--			DebugMsg( Player , 0 , "Array = "..Array.." * "..Array )
			break
		end
		Array = Array + 1
	end

	if Switch == 0 then	-- ���ͩǪ�
		local Distance = 150	-- �Ǫ��������Z
		for Count = 1 , #Monsters , 1 do
			local Point = 10	-- ��@�Ӷ�W���X�өǪ�
			local Round = math.ceil( Count/Point )	-- �Ǫ��@�򦨴X�ӦP�߶�
			local Level = GameObjInfo_Int( Monsters[Count] , "Level" )	-- Ū����Ʈw���]�w�����šA���]�t�H���϶�����
			Npc[Count] = CreateObj( Monsters[Count] , X-Distance*Round*math.cos(math.pi*2*(Count/Point)) , Y , Z+Distance*Round*math.sin(math.pi*2*(Count/Point)) , Dir , 1 )
			WriteRoleValue( Npc[Count] , EM_RoleValue_LV , Level )	-- �]�w��ƪ����� Level
			SetModeEx( Npc[Count] , EM_SetModeType_Show , true )	-- ���
			SetModeEx( Npc[Count] , EM_SetModeType_Drag , true )		-- ����
			SetModeEx( Npc[Count] , EM_SetModeType_Searchenemy , false )	-- ����
			SetModeEx( Npc[Count] , EM_SetModeType_Mark , true )		-- �аO
			SetModeEx( Npc[Count] , EM_SetModeType_Revive , false )	-- ����
			SetModeEx( Npc[Count] , EM_SetModeType_Strikback , true )	-- ����
			SetModeEx( Npc[Count] , EM_SetModeType_Fight , true )		-- ���
			SetModeEx( Npc[Count] , EM_SetModeType_Gravity , true )	-- ���O
			SetModeEx( Npc[Count] , EM_SetModeType_Move , true )	-- ����
			SetModeEx( Npc[Count] , EM_SetModeType_ShowRoleHead , true )	-- �Y����
			CallPlot( Npc[Count] , "Hao_Recall_Zone_Npc_Counter" , Npc[Count] )	-- �p�ƾ�
			SetPlot( Npc[Count] , "dead" , "Hao_Recall_Zone_Npc_Dead" , 0 )			
			AddToPartition( Npc[Count] , Room )
		end
	elseif Switch == 1 then	-- �R���Ǫ�
		local SearchNpc = SetSearchAllNPC( Room )
		for i = 1 , SearchNpc , 1 do
			local Result = GetSearchResult()
			local OrgID = ReadRoleValue( Result , EM_RoleValue_OrgID )
			for j = 1 , #Monsters , 1 do
				if OrgID == Monsters[j] then
					DelObj(Result)
					break
				end
			end
		end
	elseif Switch == 2 then
		local Distance = 150	-- �Ǫ��������Z
		for Line = 0 , Array-1 , 1 do	-- ����
			for Row = 0 , Array-1 , 1 do	-- ���
				if #Monsters > 0 then
					local CreateID = table.remove( Monsters , #Monsters )
				--	local NewX = X + ( Distance*Line*math.cos(Cal) )	-- ����
					local NewX = X + Distance*Line	-- ����
					local NewZ = Z - Distance*Row	-- ���
					local Level = GameObjInfo_Int( CreateID , "Level" )	-- Ū����Ʈw���]�w�����šA���]�t�H���϶�����
					local Npc = CreateObj( CreateID , NewX , Y , NewZ , Dir , 1 )
					WriteRoleValue( Npc , EM_RoleValue_LV , Level )	-- �]�w��ƪ����� Level
					SetModeEx( Npc , EM_SetModeType_Show , true )	-- ���
					SetModeEx( Npc , EM_SetModeType_Drag , true )		-- ����
					SetModeEx( Npc , EM_SetModeType_Searchenemy , false )	-- ����
					SetModeEx( Npc , EM_SetModeType_Mark , true )		-- �аO
					SetModeEx( Npc , EM_SetModeType_Revive , false )	-- ����
					SetModeEx( Npc , EM_SetModeType_Strikback , true )	-- ����
					SetModeEx( Npc , EM_SetModeType_Fight , true )		-- ���
					SetModeEx( Npc , EM_SetModeType_Gravity , true )	-- ���O
					SetModeEx( Npc , EM_SetModeType_Move , true )	-- ����
					SetModeEx( Npc , EM_SetModeType_ShowRoleHead , true )	-- �Y����
					CallPlot( Npc , "Hao_Recall_Zone_Npc_Counter" , Npc )	-- �p�ƾ�
					SetPlot( Npc , "dead" , "Hao_Recall_Zone_Npc_Dead" , 0 )					
					AddToPartition( Npc , Room )
				else
					break
				end
			end
		end
	end
end

function Hao_Recall_Zone_Npc_Dead()

	local Monster = OwnerID()
	local Player = TargetID()
	local CountBuff = BuffCount( Monster )	-- �M���Ǫ����W��Dot�A�קK����ʪ�����	
	local OrgID = ReadRoleValue( Monster , EM_RoleValue_OrgID )	-- ��ƮwID
	local Time = ReadRoleValue( Monster , EM_RoleValue_PID )	-- �����Ǫ���O���ɶ�
	local HP = ReadRoleValue( Player , EM_RoleValue_HP )	-- ��eHP
	local MaxHP = ReadRoleValue( Player , EM_RoleValue_MaxHP )	-- �̤jHP
	local MaxMP = ReadRoleValue( Player , EM_RoleValue_MaxMP )	-- �̤jMP
	local MaxSP = ReadRoleValue( Player , EM_RoleValue_MaxSP )	-- �̤jSP
	ScriptMessage( Monster , 0 , 0 ,  "["..OrgID.."]".." , Your HP : "..HP.." , Killing time : "..String.format( "%.1f" , Time / 10 ) , C_SYSTEM )
	for Pos = CountBuff-1 , 0 , -1 do
		local BodyBuff = BuffInfo( Monster , Pos , EM_BuffInfoType_BuffID )	-- Ū����Buff��ID
		CancelBuff_NoEvent( Monster , BodyBuff )
	end
	ClearHateList( Monster , -1 )	-- �M�Ť���C��	
	WriteRoleValue( Player , EM_RoleValue_HP , MaxHP )	-- ��_���aHP
	WriteRoleValue( Player , EM_RoleValue_MP , MaxMP )	-- ��_���aMP
	WriteRoleValue( Player , EM_RoleValue_SP , MaxSP )	-- ��_���aSP
	CallPlot( Monster , "Hao_Recall_Zone_Npc_Dead_2" , Monster )	-- ���mNpc���
	return false
end

function Hao_Recall_Zone_Npc_Dead_2(ObjID)

	local MaxHP = ReadRoleValue( ObjID , EM_RoleValue_MaxHP )	-- �̤jHP
	local Room = ReadRoleValue( ObjID , EM_RoleValue_RoomID )
	DelFromPartition(ObjID)
	Sleep(50)
	ReSetNPCInfo(ObjID)	-- ���]NPC���
	ReCalculate(ObjID)	-- ���]NPC���ʸ�T
	SetStopAttack(ObjID)	-- ��������	
	WriteRoleValue( ObjID , EM_RoleValue_HP , MaxHP )	-- �ɺ�ObjID����q
	CallPlot( ObjID , "Hao_Recall_Zone_Npc_Counter" , ObjID )
	AddToPartition( ObjID , Room )	-- ���s�[�J���ΰ�
end

function Hao_Recall_Zone_Npc_Counter(Monster)

	local OrgID = ReadRoleValue( Monster , EM_RoleValue_OrgID )	-- ��ƮwID
	local Time = 0
	local List

	while true do
	--	List = HateListCount(Monster)	-- ���o����M��
		if ReadRoleValue( Monster , EM_RoleValue_IsAttackMode ) ~= 0 then
	--	if List ~= 0 then	-- ��Monster������C�����W��ɫh
			Time = Time + 1
		else	-- Monster���}�԰��᪺���m
			Time = 0
		end
		WriteRoleValue( Monster , EM_RoleValue_PID , Time )
		sleep(1)
	end
end

function Hao_Recall_Zone_26_Npc( Switch )	-- �s��۩�

	local Monsters = {
				107692 , 107693 , 107694 , 107695 , 107739 , 107740 , 107741 , 107742 , 107744 , 107745 ,
				107748 , 107736 , 107751 , 107696 , 107697 , 107704 , 107705 , 107743 , 107750 , 107706 ,
				107707 , 107708 , 107700 , 107701 , 107702 , 107703 , 107769 , 107772 , 107773 , 107709 , 
				107710 , 107711 , 107712 , 107713 , 107714 , 107715 , 107716 , 107717 , 107718 , 107719 ,
				107733 , 107735 , 107720 , 107721 , 107722 , 107732 , 107794 , 107724 , 107725 , 107726 ,
				107727 , 107728 , 107729 , 107730 , 107731 , 107746 , 107747 , 107785 , 107749 , 107825
			}
	Hao_Recall_Zone_Npc( Switch , Monsters )
end

function Hao_Recall_Zone_27_Npc( Switch )	-- �s��۩�

	local Monsters = {
				103377 , 107895 , 107896 , 107974 , 107975 , 107899 , 107900 , 107901 , 107902 , 107723 ,
				107904 , 107905 , 107976 , 108142 , 107917 , 107918 , 107919 , 108147 , 108171 , 108172 ,
				108173 , 108174 , 107891 , 107892 , 107894 , 107897 , 107907 , 107908 , 107909 , 107910 ,
				107973 , 107911 , 107912 , 107915 , 107916 , 107925 , 107926 , 107927 , 107893 , 107921 ,
				107922 , 107924 , 107923 , 107928 , 107929 , 107930 , 107931 , 107932 , 107933 , 108106 ,
				108107 , 108108 , 108109 , 108110 , 108111 , 108146 , 108135 , 108136
			}
	Hao_Recall_Zone_Npc( Switch , Monsters )
end

function Hao_Recall_Zone_28_Npc( Switch )	-- �s��۩�

	local Monsters = {
				106877 ,
				106878 ,
				107182 ,
				107345 ,
				107408 ,
				107447 ,
				107906 ,
				107936 ,
				107937 ,
				107938 ,
				107939 ,
				107940 ,
				107941 ,
				107942 ,
				107943 ,
				107944 ,
				107945 ,
				107946 ,
				107947 ,
				107948 ,
				107949 ,
				107950 ,
				107951 ,
				107952 ,
				107953 ,
				107954 ,
				107955 ,
				107956 ,
				107969 ,
				107970 ,
				107971 ,
				107972 ,
				108118 ,
				108183 ,
				108184 ,
				108185 ,
				108186 ,
				108187 ,
				108188 ,
				108189 ,
				108190 ,
				108191 ,
				108194 ,
				108195 ,
				108196 ,
				108197 ,
				108199 ,
				108200 ,
				108201 ,
				108202 ,
				108204 ,
				108205 ,
				108206 ,
				108207 ,
				108229 ,
				108230 ,
			}
	Hao_Recall_Zone_Npc( Switch , Monsters )
end
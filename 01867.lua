function Lua_Hao_Test_Skill_001()

--	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	--���P�� ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )		Org = ��Ʈw����ID
--	local Obj = Role:new( OwnerID() )  -- ���o���a X.Y.Z.Dir��
--	local BaseX = Obj :X()
--	local BaseY = Obj :Y()
--	local BaseZ = Obj :Z()
--	local BaseDir = Obj:Dir()

--	local MyX = ReadRoleValue( OwnerID() , EM_RoleValue_X )
--	local MyY = ReadRoleValue( OwnerID() , EM_RoleValue_Y )
--	local MyZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z )
--	local MyDir = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )
--	
--	local YourX = ReadRoleValue( TargetID() , EM_RoleValue_X )
--	local YourY = ReadRoleValue( TargetID() , EM_RoleValue_Y )
--	local YourZ = ReadRoleValue( TargetID() , EM_RoleValue_Z )
--	local YourDir = ReadRoleValue( TargetID() , EM_RoleValue_Dir )

--	local X = 0

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) --���o�Ҧbroom
	local Count = SetSearchAllPlayer(RoomID) -- �j���ϰ줺���Ҧ�NPC �A�^�ǭȬ���ƶq
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult() -- �^�ǰ��� SetSearchAllNPC ��ҷj�M�쪺�Ҧ�����

			local IDX = ReadRoleValue( ID , EM_RoleValue_X )
			local IDY = ReadRoleValue( ID , EM_RoleValue_Y )
			local IDZ = ReadRoleValue( ID , EM_RoleValue_Z )
			local IDDir = ReadRoleValue( ID , EM_RoleValue_Dir )

		--	X = X + 1
		--	Say( ID , "X="..X )
			Say( ID , "My X="..IDX  )
			Say( ID , "My Y="..IDY  )
			Say( ID , "My Z="..IDZ  )
			Say( ID , "My Dir="..IDDir )
		end
	end

--	Say( OwnerID() , "My X="..MyX  )
--	Say( OwnerID() , "My Y="..MyY  )
--	Say( OwnerID() , "My Z="..MyZ  )
--	Say( OwnerID() , "My Dir="..MyDir )

--	Say( TargetID() , "Your X="..YourX )
--	Say( TargetID() , "Your Y="..YourY )
--	Say( TargetID() , "Your Z="..YourZ )
--	Say( TargetID() , "Your Dir="..YourDir )

--	SetPos( RoleID, X, Y , Z , Dir )	�N����ǰe�ܧ��Ц�m
end

function Lua_Hao_RelationSystem_000(Choose)	-- ���Y�t�� - �ҩd���~�ƥ��ˬd

	local I_have_H = Check_Relation( OwnerID() , EM_RelationType_Husband )	-- ���o�����V�Ҫ���T
	local I_have_W = Check_Relation( OwnerID() , EM_RelationType_Wife )		-- ���o�����d�l����T
	local U_have_H = Check_Relation( TargetID() , EM_RelationType_Husband )	-- ���o�ؼФV�Ҫ���T
	local U_have_W = Check_Relation( TargetID() , EM_RelationType_Wife )		-- ���o�ؼЩd�l����T
	local GetLv = GetRelationLv( OwnerID() , TargetID() )				-- ���o���Y�t�ε���

	if ( Choose == "Type1" ) then		-- ���Y�t�ε���1 ~ 5	�����~1 ~ 5�Ŭҥi��
		Say( OwnerID() , Choose )
		if GetLv > 5 then
			return false
		elseif GetLv <= 5 then
			return true
		end
	elseif ( Choose == "Type2" ) then	-- ���Y�t�ε���6 ~ 10	�����~6 ~ 10�Ŭҥi��
		Say( OwnerID() , Choose )
		if GetLv < 6 then
			return false
		elseif GetLv >= 6 then
			return true
		end
--	elseif ( Choose == "Type3" ) then	-- ���Y�t�ε���9 ~ 10	�����~1 ~ 10�Ŭҥi��
--		Say( OwnerID() , Choose )
--		if GetLv >= 10 then
--			return false
--		elseif GetLv < 10 then
--			return true
--		end
	end

	if ( I_have_H == true and U_have_W == true ) or ( I_have_W == true and U_have_H == true ) then
		if GetLv == nil then
			Say( OwnerID() , "Nil" )
			return false
		elseif GetLv >= 10.0 then
			Say( OwnerID() , "Lv 10" )
			return false
		end
	elseif ( I_have_H == false and U_have_W == false ) or ( I_have_W == false and U_have_H == false ) then
		Say( OwnerID() , "haven't relation between their" )
		return false
	end
	
end

function Lua_Hao_RelationSystem_001()	-- ���Y�t�� - �ҩd���~�ϥΫᵲ�G

--	Say( OwnerID() , "1" )
--	Say( TargetID() , "2" )

	local Exp = { 300 , 900 , 2700 , 8100 , 24300 , 72900 , 218700 , 656100 , 1968300 , 5904900 }
	local GetLv = GetRelationLv( OwnerID() , TargetID() )							-- ���o���Y�t�ε���
--	Say( OwnerID() , "GetLv ="..GetLv )
	local Step = 0
	local Level
	if math.floor(GetLv)~=0	then
		Level = Exp[math.floor(GetLv)+1]								-- �����Ű϶����ɯũһݸg���
	else
		Level = Exp[math.floor(GetLv)]									-- �����Ű϶����ɯũһݸg���
	end
	
	if Level == nil then
		Level = 0
	end
--	Say( OwnerID() , "Level ="..Level )
	local NowLv = ( GetLv - math.floor(GetLv) ) * Level							-- �{�����Ťw���g���
--	Say( OwnerID() , "NowLv ="..NowLv )
	local Value = 5000											-- ���~�W�[���g���
	local I_have_H = Check_Relation( OwnerID() , EM_RelationType_Husband )				-- ���o�����V�Ҫ���T
	local I_have_W = Check_Relation( OwnerID() , EM_RelationType_Wife )					-- ���o�����d�l����T
	local U_have_H = Check_Relation( TargetID() , EM_RelationType_Husband )				-- ���o�ؼФV�Ҫ���T
	local U_have_W = Check_Relation( TargetID() , EM_RelationType_Wife )					-- ���o�ؼЩd�l����T

	if I_have_H == true and U_have_W == true then
		Step = 1
	elseif I_have_W == true and U_have_H == true then
		Step = 2
	end

	if ( I_have_H == true and U_have_W == true ) or ( I_have_W == true and U_have_H == true ) then

		if ( NowLv + Value ) <= Level then
		-- �p�G�{�����Ťw���g��� + ���~�W�[���g��� <= �����Ű϶��ݨD���ɯŸg��Ȯ�
			local AddValue = Value / Level				
			local NewLv = GetLv + AddValue	
		--	Say( OwnerID() , "NewGetLv ="..GetLv )					
		--	Say( OwnerID() , "I.AddValue ="..AddValue )
		--	Say( OwnerID() , "I.NewLv ="..NewLv )
			if NewLv <= 10.0 then

				if Step == 1 then
				--	Say( OwnerID() , "Step =".."1" )
				--	Say( OwnerID() , NewLv )
					SetRelation( OwnerID() , TargetID() , EM_RelationType_Wife , NewLv , EM_RelationType_Husband , NewLv )
				-- SetRelation( OwnerID() , TargetID() , �ؼ� , �� , ���� , �� )
				elseif Step == 2 then
				--	Say( OwnerID() , "Step =".."2" )
				--	Say( OwnerID() , NewLv )
					SetRelation( OwnerID() , TargetID() , EM_RelationType_Husband , NewLv , EM_RelationType_Wife , NewLv )
				end
			elseif NewLv > 10.0 then

				if Step == 1 then
				--	Say( OwnerID() , "Step =".."3" )
				--	Say( OwnerID() , NewLv )
					SetRelation( OwnerID() , TargetID() , EM_RelationType_Wife , 10.0 , EM_RelationType_Husband , 10.0 )
				elseif Step == 2 then
				--	Say( OwnerID() , "Step =".."4" )
				--	Say( OwnerID() , NewLv )
					SetRelation( OwnerID() , TargetID() , EM_RelationType_Husband , 10.0 , EM_RelationType_Wife , 10.0 )
				end
			end
		else	--�W�L����
	  		local Count = ( ( NowLv + Value ) )							
			-- �{�����Ťw�����g��� �[�W ���~�W�[���g��� (��̬ۥ[�᪺�`�g���)
			local Rank = math.floor(GetLv)
			-- �{�b�����Y�t�ε���
			local LevelRank = Level
			if LevelRank == 0 then
				LevelRank = Exp[1]
			end
			-- �U�@���ɯũһݪ��`�g���
		--	Say( OwnerID() , "Count ="..Count )	
		--	Say( OwnerID() , "LevelRank ="..LevelRank )	

			while true do		
				if Count >= LevelRank then
					Count = Count - LevelRank
				--	Say( OwnerID() , "NewCount =" .. Count  )
					Rank = Rank + 1
				--	Say( OwnerID() , "NewRank ="..Rank )	
					if Rank >= 10 then
						Rank = 10
						Count = 0
						break
					end
					LevelRank = Exp[Rank+1]
				--	Say( OwnerID(OO) , "NewRank ="..Rank )
				--	Say( OwnOerID() , "NewLevelRank ="..LevelRank )
				elseif Count < LevelRank then
					break
				end
			end

--			local NextLv = ( ( NowLv + Value ) - Level ) / Exp[math.floor(GetLv)+1]
--			Say( OwnerID() , "II.NextLv ="..NextLv )
--			local NewLv = math.floor(GetLv) + NextLv + 1
--			local NewLv2 = GetLv + NextLv 

			local NextLv = Count / LevelRank
			-- �p��᪺�`�g���  / �U�@���ɯũһݪ��`�g���
		--	Say( OwnerID() , "II.NextLv ="..NextLv )
			local NewLv = Rank + NextLv
		--	Say( OwnerID() , "NewGetLv ="..GetLv )	
			-- �������� + �p��᪺%��g���
		--	local NewLv2 = GetLv + NextLv 
		--	Say( OwnerID() , "II.NewLv ="..NewLv )
		--	Say( OwnerID() , "II.NewLv2 ="..NewLv2 )
			if NewLv <= 10.0 then

				if Step == 1 then
				--	Say( OwnerID() , "Step =".."5" )
				--	Say( OwnerID() , NewLv )
					SetRelation( OwnerID() , TargetID() , EM_RelationType_Wife , NewLv , EM_RelationType_Husband , NewLv )
				elseif Step == 2 then
				--	Say( OwnerID() , "Step =".."6" )
				--	Say( OwnerID() , NewLv )
					SetRelation( OwnerID() , TargetID() , EM_RelationType_Husband , NewLv , EM_RelationType_Wife , NewLv )
				end
			elseif NewLv > 10.0 then

				if Step == 1 then
				--	Say( OwnerID() , "Step =".."7" )
				--	Say( OwnerID() , NewLv )
					SetRelation( OwnerID() , TargetID() , EM_RelationType_Wife , 10.0 , EM_RelationType_Husband , 10.0 )
				elseif Step == 2 then
				--	Say( OwnerID() , "Step =".."8" )
				--	Say( OwnerID() , NewLv )
					SetRelation( OwnerID() , TargetID() , EM_RelationType_Husband , 10.0 , EM_RelationType_Wife , 10.0 )
				end
			end
		end
	else
		Say( OwnerID() , "haven't relation" )		-- ��e��̨S���ҩd���Y�C
	end
end

function Lua_Hao_Test_Report_Value()

	local Player = OwnerID()
	local Value = {}	
	local String

	Value["STR"] = EM_RoleValue_FinStr
	Value["STA"] = EM_RoleValue_FinSta
	Value["INT"] = EM_RoleValue_FinInt
	Value["MND"] = EM_RoleValue_FinMnd
	Value["AGI"] = EM_RoleValue_FinAgi
	
	for Var , List in pairs(Value) do
		String = ReadRoleValue( Player , Value[Var] )
		DebugMsg( Player , 0 , Var.."="..String )
	end
end


function Lua_Hao_Test_Report_Value_2()

	local Player = OwnerID()
	local Value = {}	
	local Title = {}
	Value[1] = ReadRoleValue( Player , EM_RoleValue_FinStr )
	Value[2] = ReadRoleValue( Player , EM_RoleValue_FinAgi )
	Value[3] = ReadRoleValue( Player , EM_RoleValue_FinSta )
	Value[4] = ReadRoleValue( Player , EM_RoleValue_FinInt )
	Value[5] = ReadRoleValue( Player , EM_RoleValue_FinMnd )
	
	Title[1] = "STR"
	Title[2] = "AGI"
	Title[3] = "STA"
	Title[4] = "INT"
	Title[5] = "MND"

	for i = 1 , #Value , 1 do
		DebugMsg( Player , 0 , Title[i].."="..Value[i] )
	end
end

function Lua_Hao_Test_Set_Weapon_Tier(ID)	-- 

	if ID == nil then
		ID = 0
	end

	local Player = OwnerID()
	local Level = { 0 , 2 , 5 , 9 , 12 , 15 }	-- �ոˡB��ˡB�ŸˡB���ˡB��ˡB����
	local Tier	-- ���h
	local LimitLv = GameObjInfo_Int( ID , "LimitLv" )	-- �Ӹ˳ƪ�����
	local Rare = GameObjInfo_Int( ID , "Rare" )	-- �}����
	local WeaponLV = ( ( ( LimitLv + ( Level[Rare+1]*1.5 )) - 1 ) / 20 ) + 1	-- ���h
	--( ( ( �˳Ʒ�e���ŭ��� + ( �}�����B�~�[��Lv * 1.5 ) ) -1 ) / 20 ) + 1
	DebugMsg( Player , 0 , "LimitLv = "..LimitLv.." Rare = "..Level[Rare+1].." WeaponLV = "..WeaponLV )
	Tier = GetItemInfo( Player , EM_ItemPacketType_EQ , 15 , EM_ItemValueType_PowerQuality )
	DebugMsg( Player , 0 , "Tier = "..Tier )
-- 4���Z�����ɯūe��10�A�ɬ�5���ᬰ11�A�ɬ�20���ᬰ26	
	SetItemInfo( Player , EM_ItemPacketType_EQ , 15 , EM_ItemValueType_PowerQuality , 21 )
	Tier = GetItemInfo( Player , EM_ItemPacketType_EQ , 0 , EM_ItemValueType_PowerQuality )
	DebugMsg( Player , 0 , "New Tier = "..Tier )
end
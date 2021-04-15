function LuaS_RecipeItemUpgrade(X)	--�t�ΩI�s���@���ž��v
	local Proba = { 		15000,
				13125,
				11250,
				9375,
				7501,
				5626,
				3751,
				1876,
				100 }
	return Proba[X+1]
end

function SysRecipeItemUPgrade(BasicRare)	--2011.06.28 �^�ǤɯŪ�����

	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	-- �ɶ������v
	local Probability = { 	[0] = 15000 ,		-- �}����0 -> 1 �����
				[1] = 13125 ,		-- �}����1 -> 2 ������
				[2] = 11250 ,		-- �}����2 -> 3 ���൵
				[3] = 9375 ,		-- �}����3 -> 4 �����
				[4] = 7501 ,		-- �}����4 -> 5 �����
				[5] = 5626 ,		-- �}����5 -> 6
				[6] = 3751 ,		-- �}����6 -> 7
				[7] = 1876 ,		-- �}����7 -> 8
				[8] = 100 ,		-- �}����8 -> 9
				[9] = 0		}	-- �}����9

	-- �W�[�@�����v
	local BuffList = {	{ 508456 , 10 } ,		-- 10% �@�ѥͲ����B��¦�ľ� �شӱM��
				{ 508457 , 25 } , 		-- 25% �@�ѥͲ����B�i���ľ� �شӱM��
				{ 622944 , 100 } ,		-- 100% �@�ѥͲ����B�ľ� 2012.05.21 ���t�ӻݨD�s�W
				{ 508458 , 100 } ,		-- 100% �C�ѥͲ����B�ľ�
				{ 508459 , 100 } ,		-- 100% �T�Q�ѥͲ����B�ľ�
				{ 508460 , 25 } ,		-- 25% �ٸ� - 1%�Ѥ��A99%�V�O(530076) �˳ƮɱM��
				{ 508461 , Lua_Hao_Return_Buff_Lv( OwnerID() , 508461 ) } ,	-- �ۭq(���ե�)
				{ 508463 , 10 } ,			-- 10% ���Ӧ��ơB�|���ϥ�
				{ 508464 , 20 } ,		}	-- 20% ���Ӧ��ơB�|���ϥ�
			
	local Reward , Rare = 0 , 0				-- �W�[���v�B���@���}����
	local Destiny_1 , Destiny_2 , Percent , BuffLv , Key	-- ���@1�������v�B���@2�������v�B�`���v�B�k�N����(���Ӧ���)�B�O�_���\
--	DebugMsg( OwnerID() , 0 , "BasicRare = "..BasicRare )
	for i = 1 , table.getn(BuffList) , 1 do
		if CheckBuff( OwnerID() , BuffList[i][1] ) == true then
			Reward = BuffList[i][2]
			if BuffList[i][1] == 508463 or BuffList[i][1] == 508464 then	-- ���Ӧ��ƥ�
				BuffLv = Lua_Hao_Return_Buff_Lv( OwnerID() , BuffList[i][1] )
				CancelBuff( OwnerID() , BuffList[i][1] )
				if BuffLv ~= 0 then
					AddBuff( OwnerID() , BuffList[i][1] , BuffLv-1 , 3600 )
				end
				break
			end
		end
	end
--	DebugMsg( OwnerID() , 0 , "Reward = "..Reward )
	for i = 0 , table.getn(Probability) , 1 do
		if BasicRare == i then
			Percent = math.random(100000)
			Destiny_1 = Probability[i]*( 1+Reward/100 )
			Key = math.floor( (Destiny_1 / Percent) / 0.01 )
		--	DebugMsg( OwnerID() , 0 , "Probability = "..Probability[i] )
			if Key >= 100 then
				DebugMsg( OwnerID() , Room , "Rare 1 = "..Destiny_1.." / "..Percent )
		--		DebugMsg( OwnerID() , Room , "Chance = "..Destiny_1.." / "..Percent.." , Increased Rare" )
		--	else
			end
		--	math.floor(Destiny_1 / Percent / 0.01 )
			if Destiny_1 >= Percent then
				Rare = Rare + 1
				Percent = math.random(100000)
				Destiny_2 = Probability[i+1]*( 1+Reward/100 )
				Key = math.floor( ( Destiny_2 / Percent ) / 0.01 )
			--	DebugMsg( OwnerID() , 0 , "Probability = "..Probability[i+1] )
			--	if Key >= 100 then
					DebugMsg( OwnerID() , Room , "Rare 2 = "..Destiny_2.." / "..Percent )
			--		DebugMsg( OwnerID() , Room , "Chance = "..Destiny_2.." / "..Percent.." , Increased Rare again" )
			--	else
			--	end
				if Destiny_2 >= Percent then
					Rare = Rare + 1
				end
			end
		end
	end
	if Rare >= 1 then
		DebugMsg( OwnerID() , Room , "Increased Rare "..Rare )
	end
--	DebugMsg( OwnerID() , 0 , "Rare = "..Rare )
	return Rare
end

function Lua_Hao_Test_Recipe_Buff(Lv)

	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Buff = { 508461 , 508462 } -- �W�[�s�@���~�}���׾��v�B�W�[�s�@���~�ɪ��t��(�T�w0.5��)

	for i = 1 , table.getn(Buff) , 1 do
		CancelBuff( OwnerID() , Buff[i] )
		if Lv > 0 then
			AddBuff( OwnerID() , Buff[i] , Lv-1 , 3600 )
		else
			DebugMsg( OwnerID() , Room , "Entry error" )
		end
	end
end

function Lua_Hao_Test_Recipe_Give(ObjID)	-- ��J���~ID��A�����Ͳ��t�誺�s�@����

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Recipe
	-- ���~�G200000 ~ 209999�B240001 ~ 249999�@�Z���G210001 ~ 219999�@����G220001 ~ 239999
	if ( ObjID >= 200000 and ObjID <= 209999 ) or ( ObjID >= 240001 and ObjID <= 249999 ) or ( ObjID >= 210001 and ObjID <= 219999 ) or ( ObjID >= 220001 and ObjID <= 239999 ) then
		for i = 550001 , 559999 , 1 do
			Recipe = GameObjInfo_Int( i ,"Item1_Normal" )
			if Recipe == ObjID then
				ObjID = i
				DebugMsg( Player , Room , "Recipe = "..i )
				break
			end
		end
	else
		DebugMsg( Player , Room , "Entry error" )
		return false
	end

	local Source = 	{	{ GameObjInfo_Int( ObjID ,"Source1" ) , GameObjInfo_Int( ObjID ,"SourceCount1"  )	 } , 
				{ GameObjInfo_Int( ObjID ,"Source2" ) , GameObjInfo_Int( ObjID ,"SourceCount2"  )	 } , 
				{ GameObjInfo_Int( ObjID ,"Source3" ) , GameObjInfo_Int( ObjID ,"SourceCount3"  )	 } , 
				{ GameObjInfo_Int( ObjID ,"Source4" ) , GameObjInfo_Int( ObjID ,"SourceCount4"  )	 } , 
				{ GameObjInfo_Int( ObjID ,"Source5" ) , GameObjInfo_Int( ObjID ,"SourceCount5"  )	 } , 
				{ GameObjInfo_Int( ObjID ,"Source6" ) , GameObjInfo_Int( ObjID ,"SourceCount6"  )	 } , 
				{ GameObjInfo_Int( ObjID ,"Source7" ) , GameObjInfo_Int( ObjID ,"SourceCount7"  )	 } , 
				{ GameObjInfo_Int( ObjID ,"Source8" ) , GameObjInfo_Int( ObjID ,"SourceCount8"  )	 } 	}
	local MaxHeap , GiveCount

	for i = 1 , table.getn( Source ) , 1 do
		if Source[i] ~= 0 then
			MaxHeap = GameObjInfo_Int( Source[i][1] ,"MaxHeap" )	-- �쪫�~�����|�q
			GiveCount = Source[i][2]
			for j = 1 , GiveCount , 1 do
				DebugMsg( Player , 0 , "MaxHeap = "..MaxHeap )
				if MaxHeap < 2 then
					for k = 1 , 10 , 1 do
						GiveBodyItem( Player , Source[i][1] , MaxHeap )
						if K%5 == 0 then
							Sleep(1)
						end
					end
				else
					GiveBodyItem( Player , Source[i][1] , MaxHeap )
				end
			end
			sleep(1)
		end
	end
end
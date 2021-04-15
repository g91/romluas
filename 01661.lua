-----------------------------------   �q�t Plus��   ------------------------------------
--------------------------------------------------------------------------------------
function Lua_204198() -- LV43 �q�t ���s�޺ؤl
	ScriptMessage( TargetID(), OwnerID(), 2, "Plant Lv 43 [204198] Plus [SYS_GAMEMSGEVENT_163]", C_SYSTEM ) -- Plus �ϥΤ�
	GiveBodyItem( OwnerID() , 724996 , 100 )
end

function Lua_204199() -- LV49 �q�t ���s���ؤl
	ScriptMessage( TargetID(), OwnerID(), 2, "Plant Lv 49 [204199] Plus [SYS_GAMEMSGEVENT_163]", C_SYSTEM ) -- Plus �ϥΤ�
	GiveBodyItem( OwnerID() , 724997 , 100 ) 
end

function Lua_204200() -- LV55 �q�t �a�ߩ��ؤl
	ScriptMessage( TargetID(), OwnerID(), 2, "Plant Lv 55 [204200] Plus [SYS_GAMEMSGEVENT_163]", C_SYSTEM ) -- Plus �ϥΤ�
	GiveBodyItem( OwnerID() , 724998 , 100 ) 
end
-----------------------------------   ��t Plus��   ------------------------------------
--------------------------------------------------------------------------------------
function Lua_204188() -- LV43 ��t �����ؤl
	ScriptMessage( TargetID(), OwnerID(), 2, "Plant Lv 43 [204188] Plus [SYS_GAMEMSGEVENT_163]", C_SYSTEM ) -- Plus �ϥΤ�
	GiveBodyItem( OwnerID() , 724970 , 100 ) 
end

function Lua_204189() -- LV49 ��t �a����ؤl
	ScriptMessage( TargetID(), OwnerID(), 2, "Plant Lv 49 [204189] Plus [SYS_GAMEMSGEVENT_163]", C_SYSTEM ) -- Plus �ϥΤ�
	GiveBodyItem( OwnerID() , 724971 , 100 )
end

function Lua_204190() -- LV55 ��t �q�Ѿ��ؤl
	ScriptMessage( TargetID(), OwnerID(), 2, "Plant Lv 55 [204190] Plus [SYS_GAMEMSGEVENT_163]", C_SYSTEM ) -- Plus �ϥΤ�
	GiveBodyItem( OwnerID() , 724972 , 100 )
end
-----------------------------------   ��t Plus��   ------------------------------------
--------------------------------------------------------------------------------------
function Lua_204001() -- LV43 ��t ���V�X�ؤl
	ScriptMessage( TargetID(), OwnerID(), 2, "Plant Lv 43 [204001] Plus [SYS_GAMEMSGEVENT_163]", C_SYSTEM ) -- Plus �ϥΤ�
	GiveBodyItem( OwnerID() , 724973 , 100 )
end

function Lua_204002() -- LV49 ��t �Ѱ��кؤl
	ScriptMessage( TargetID(), OwnerID(), 2, "Plant Lv 49 [204002] Plus [SYS_GAMEMSGEVENT_163]", C_SYSTEM ) -- Plus �ϥΤ�
	GiveBodyItem( OwnerID() , 724974 , 100 )
end

function Lua_204003() -- LV55 ��t �ѨϦкؤl
	ScriptMessage( TargetID(), OwnerID(), 2, "Plant Lv 55 [204003] Plus [SYS_GAMEMSGEVENT_163]", C_SYSTEM ) -- Plus �ϥΤ�
	GiveBodyItem( OwnerID() , 724975 , 100 )
end
--------------------------------------------------------------------------------------
function Lua_Hao_Planting_3_0( ID )	-- �������~

	local Item = {	{ 208595 , 208596 , 208594 , 61 } ,		-- LV61 �q�t ����ؤl�B��t ���ؤl�B��t �P�кؤl
			{ 208599 , 208597 , 208598 , 67 } ,		-- LV67 �q�t ���a�ؤl�B��t �OŢ�ؤl�B��t �F�C�ؤl
			{ 208616 , 208601 , 208600 , 73 } ,		-- LV73 �q�t ��w�ؤl�B��t �����ؤl�B��t �ʭ��ؤl
			{ 208617 , 208619 , 208618 , 79 } ,		-- LV79 �q�t ����ؤl�B��t �^���ؤl�B��t �V���ؤl
			{ 242771 , 242774 , 242777 , 85 } ,		-- LV85 �q�t ��]�Ѱ󳾺ؤl�B��t �����Ѱ󳾺ؤl�B��t ����Ѱ󳾺ؤl
			{ 242772 , 242775 , 242778 , 91 },		-- LV91 �q�t �}���{�����ؤl�B��t �����{�����ؤl�B��t �ۥ��{������
			{ 242773 , 242776 , 242779 , 97 }		-- LV97 �q�t ���֪���ؤl�B��t �R�N����ؤl�B��t �Ʊ����ؤl
			}	

	local Drop = {	{ 725877 , 725878 , 725879 } ,		-- LV61
			{ 725880 , 725881 , 725882 } ,		-- LV67
			{ 725883 , 725884 , 725885 } ,		-- LV73
			{ 725886 , 725887 , 725888 } ,		-- LV79
			{ 727057 , 727069 , 727081 } ,		-- LV85
			{ 727061 , 727073 , 727085 } ,		-- LV91
			{ 727065 , 727077 , 727089 } 		-- LV97
			}

	for i = 1 , table.getn(Item) , 1 do
		for j = 1 , table.getn(Item[i]) , 1 do
			if Item[i][j] == ID then
				ScriptMessage( OwnerID() , OwnerID() , 2 , "Planting level "..Item[i][4].." : ".."["..Item[i][j].."]" , C_SYSTEM )	-- 
			--	DebugMsg( OwnerID() , 0 , "i = "..i.." j = "..j )
				GiveBodyItem( OwnerID() , Drop[i][j] , 1 )
				return false
			end
			if i == 4 and j == 3 and Item[i][j] ~= ID then
				ScriptMessage( OwnerID() , OwnerID() , 2 , "Enter error" , C_SYSTEM )	-- 
			end
		end
	end
end

function Lua_Hao_Planting_3() -- ���ձ�����

	Lua_Hao_Planting_3_Select( 0 )
end

function Lua_Hao_Planting_3_Select( X , Mode , ItemID , Count ) -- ���ձ�����

	local Item = {	{ 204191 , 204181 , 203994 , 1 } ,		-- LV1 �q�t �������ؤl�B��t ���úؤl�B��t ������ؤl
			{ 204192 , 204182 , 203995 , 7 } ,		-- LV7 �q�t �������ؤl�B��t �ݤ�ؤl�B��t �ݯ�ؤl
			{ 204193 , 204183 , 203996 , 13 } ,		-- LV13 �q�t �յ����ؤl�B��t �����ؤl�B��t �����I�ؤl
			{ 204194 , 204184 , 203997 , 19 } ,		-- LV19 �q�t �񵲴��ؤl�B��t �w�ֺؤl�B��t ���T�ؤl
			{ 204195 , 204185 , 203998 , 25 } ,		-- LV25 �q�t �ŵ����ؤl�B��t �٨��ؤl�B��t �b����ؤl
			{ 204196 , 204186 , 203999 , 31 } ,		-- LV31 �q�t �g�s�޺ؤl�B��t �]����ؤl�B��t ���Z���ؤl
			{ 204197 , 204187 , 204000 , 37 } ,		-- LV37 �q�t �a�s�޺ؤl�B��t ���K�Һؤl�B��t �]�����ؤl
			{ 204198 , 204188 , 204001 , 43 } ,		-- LV43 �q�t ���s�޺ؤl�B��t �����ؤl�B��t ���V�X�ؤl
			{ 204199 , 204189 , 204002 , 49 } ,		-- LV49 �q�t ���s���ؤl�B��t �a����ؤl�B��t �Ѱ��кؤl
			{ 204200 , 204190 , 204003 , 55 } ,		-- LV55 �q�t �a�ߩ��ؤl�B��t �q�Ѿ��ؤl�B��t �ѨϦкؤl
			{ 208595 , 208596 , 208594 , 61 } ,		-- LV61 �q�t ����ؤl�B��t ���ؤl�B��t �P�кؤl
			{ 208599 , 208597 , 208598 , 67 } ,		-- LV67 �q�t ���a�ؤl�B��t �OŢ�ؤl�B��t �F�C�ؤl
			{ 208616 , 208601 , 208600 , 73 } ,		-- LV73 �q�t ��w�ؤl�B��t �����ؤl�B��t �ʭ��ؤl
			{ 208617 , 208619 , 208618 , 79 } ,		-- LV79 �q�t ����ؤl�B��t �^���ؤl�B��t �V���ؤl
			{ 242771 , 242774 , 242777 , 85 } ,		-- LV85 �q�t ��]�Ѱ󳾺ؤl�B��t �����Ѱ󳾺ؤl�B��t ����Ѱ󳾺ؤl
			{ 242772 , 242775 , 242778 , 91 },		-- LV91 �q�t �}���{�����ؤl�B��t �����{�����ؤl�B��t �ۥ��{������
			{ 242773 , 242776 , 242779 , 97 }		-- LV97 �q�t ���֪���ؤl�B��t �R�N����ؤl�B��t �Ʊ����ؤl
			}	

	local Drop = {}	-- ���� C.B.A.S.Plus 5�ت�

	if Mode == nil then
		Mode = -1
	end

	if Mode == 1 then
		-- C ��
		Drop = {	{ 724338 , 724272 , 724300 } ,		-- LV  1
				{ 724342 , 724276 , 724304 } ,		-- LV  7
				{ 724346 , 724280 , 724308 } ,		-- LV13
				{ 724350 , 724284 , 724312 } ,		-- LV19
				{ 724354 , 724288 , 724316 } ,		-- LV25
				{ 724358 , 724292 , 724320 } ,		-- LV31
				{ 724362 , 724296 , 724334 } ,		-- LV37
				{ 724950 , 724962 , 724984 } ,		-- LV43
				{ 724954 , 724966 , 724988 } ,		-- LV49
				{ 724958 , 724980 , 724992 } ,		-- LV55
				{ 725829 , 725833 , 725837 } ,		-- LV61
				{ 725841 , 725845 , 725849 } ,		-- LV67
				{ 725853 , 725857 , 725861 } ,		-- LV73
				{ 725865 , 725869 , 725873 } ,		-- LV79
				{ 727057 , 727069 , 727081 } ,		-- LV85
				{ 727061 , 727073 , 727085 } ,		-- LV91
				{ 727065 , 727077 , 727089 } 		-- LV97
			}



	elseif Mode == 2 then
		-- B ��
		Drop = {	{ 724339 , 724273 , 724301 } ,		-- LV  1
				{ 724343 , 724277 , 724305 } ,		-- LV  7
				{ 724347 , 724281 , 724309 } ,		-- LV13
				{ 724351 , 724285 , 724313 } ,		-- LV19
				{ 724355 , 724289 , 724317 } ,		-- LV25
				{ 724359 , 724293 , 724321 } ,		-- LV31
				{ 724363 , 724297 , 724335 } ,		-- LV37
				{ 724951 , 724963 , 724985 } ,		-- LV43
				{ 724955 , 724967 , 724989 } ,		-- LV49
				{ 724959 , 724981 , 724993 } ,		-- LV55
				{ 725830 , 725834 , 725838 } ,		-- LV61
				{ 725842 , 725846 , 725850 } ,		-- LV67
				{ 725854 , 725858 , 725862 } ,		-- LV73
				{ 725866 , 725870 , 725874 } , 		-- LV79
				{ 727058 , 727070 , 727082 } ,		-- LV85
				{ 727062 , 727074 , 727086 } ,		-- LV91
				{ 727066 , 727078 , 727090 } 		-- LV97
			}
	elseif Mode == 3 then
		-- A ��
		Drop = {	{ 724340 , 724274 , 724302 } ,		-- LV  1
				{ 724344 , 724278 , 724306 } ,		-- LV  7
				{ 724348 , 724282 , 724310 } ,		-- LV13
				{ 724352 , 724286 , 724314 } ,		-- LV19
				{ 724356 , 724290 , 724318 } ,		-- LV25
				{ 724360 , 724294 , 724322 } ,		-- LV31
				{ 724364 , 724298 , 724336 } ,		-- LV37
				{ 724952 , 724964 , 724986 } ,		-- LV43
				{ 724956 , 724968 , 724990 } ,		-- LV49
				{ 724960 , 724982 , 724994 } ,		-- LV55
				{ 725831 , 725835 , 725839 } ,		-- LV61
				{ 725843 , 725847 , 725851 } ,		-- LV67
				{ 725855 , 725859 , 725863 } ,		-- LV73
				{ 725867 , 725871 , 725875 } ,		-- LV79
				{ 727059 , 727071 , 727083 } ,		-- LV85
				{ 727063 , 727075 , 727087 } ,		-- LV91
				{ 727067 , 727079 , 727091 } 		-- LV97
			}
	elseif Mode == 4 then
		-- S ��
		Drop = {	{ 724341 , 724275 , 724303 } ,		-- LV  1
				{ 724345 , 724279 , 724307 } ,		-- LV  7
				{ 724349 , 724283 , 724311 } ,		-- LV13
				{ 724353 , 724287 , 724315 } ,		-- LV19
				{ 724357 , 724291 , 724319 } ,		-- LV25
				{ 724361 , 724295 , 724323 } ,		-- LV31
				{ 724365 , 724299 , 724337 } ,		-- LV37
				{ 724953 , 724965 , 724987 } ,		-- LV43
				{ 724957 , 724969 , 724991 } ,		-- LV49
				{ 724961 , 724983 , 724995 } ,		-- LV55
				{ 725832 , 725836 , 725840 } ,		-- LV61
				{ 725844 , 725848 , 725852 } ,		-- LV67
				{ 725856 , 725860 , 725864 } ,		-- LV73
				{ 725868 , 725872 , 725876 } ,		-- LV79
				{ 727060 , 727072 , 727084 } ,		-- LV85
				{ 727064 , 727076 , 727088 } ,		-- LV91
				{ 727068 , 727080 , 727092 } 		-- LV97
			}
	elseif Mode == 5 then
		-- Plus ��
		Drop = {	{ 724339 , 724273 , 724301 } ,		-- LV  1
				{ 724343 , 724277 , 724305 } ,		-- LV  7
				{ 724347 , 724281 , 724309 } ,		-- LV13
				{ 724351 , 724285 , 724313 } ,		-- LV19
				{ 724355 , 724289 , 724317 } ,		-- LV25
				{ 724359 , 724293 , 724321 } ,		-- LV31
				{ 724363 , 724297 , 724335 } ,		-- LV37
				{ 724951 , 724963 , 724985 } ,		-- LV43
				{ 724955 , 724967 , 724989 } ,		-- LV49
				{ 724959 , 724981 , 724993 } ,		-- LV55
				{ 725830 , 725834 , 725838 } ,		-- LV61
				{ 725842 , 725846 , 725850 } ,		-- LV67
				{ 725854 , 725858 , 725862 } ,		-- LV73
				{ 725866 , 725870 , 725874 } , 		-- LV79
				{ 727137 , 727131 , 727134 } ,		-- LV85
				{ 727129 , 727132 , 727135 } ,		-- LV91
				{ 727130 , 727133 , 727136 } 		-- LV97
			}
	end

	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_WINDOW_OPENED]" , 0 )	--�����w�g���}�F
		return 0
	end

	local Time = 0 
	local Key , DialogStatus , Correct
	local inputstring = ""
	local outputstring = ""

	AddBuff( OwnerID() , 501570 , 0 , -1 )
	if X == 0 then
		DialogCreate( OwnerID() , EM_LuaDialogType_Input , "Choice Mode 1 ~ 5" )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "Please enter Mode : 1 = C" , 0 )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "Please enter Mode : 2 = B" , 0 )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "Please enter Mode : 3 = A" , 0 )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "Please enter Mode : 4 = S" , 0 )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "Please enter Mode : 5 = Plus" , 0 )
	elseif X == 1 then
		DialogCreate( OwnerID() , EM_LuaDialogType_Input , "Choice ItemID" )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "Please enter Seed ID" , 0 )
	elseif X == 2 then
		DialogCreate( OwnerID() , EM_LuaDialogType_Input , "Choice Amount 1 ~ 1000" )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "Please enter the Drop amount " , 0 )
	end
	DialogSelectStr( OwnerID() , "Accept" )
	DialogSelectStr( OwnerID() , "Cancel" )

	if ( DialogSendOpen( OwnerID() ) == false )  then  --���ϥο��~�A�^�ǿ��~�T��
		ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 ) 
		DialogClose( OwnerID() )
		CancelBuff( OwnerID() , 501570 )
		return
	end

	while true do
		sleep(1)
		Time = Time+1
	--	DebugMsg( OwnerID() , 0 , "Time = "..Time )
	 	if Time >= 300  then  -- 30��L�ʧ@�A������ܵ���
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BUFFNPC_07]" , 0 ) -- ���m�W�L30��,�۰����������C
			DialogClose( OwnerID() )
			CancelBuff( OwnerID() , 501570 )
			break
		end

		DialogStatus = DialogGetResult( OwnerID() )  --�ˬd�ϥΪ̿��������

		if DialogStatus ~= nil then
		--	DebugMsg( OwnerID() , 0 , "DialogStatus ="..DialogStatus )
		end

		if DialogStatus == 1 then
			DebugMsg( OwnerID() , 0 , "Mission failed" )
			DialogClose( OwnerID() )
			CancelBuff( OwnerID() , 501570 )
			return false
		end

		if DialogStatus ~= -2 and DialogStatus ~= -1 then -- ��l�ơB���_
			inputstring = DialogGetInputResult( OwnerID() )
			outputstring = "["..inputstring.."]"
			if DialogStatus == 0 then  -- ����J�r��
				if Type(inputstring) ~= "string" or inputstring == "" then
					Tell( OwnerID() , OwnerID() , "Nullity String Code." )
					Key = 1
				else
					-- Tell( OwnerID() , TargetID() , inputstring.." = "..outputstring )
					X = X + 1
					if X == 1 then
						Mode = tonumber(inputstring)
						if Mode <= 0 or Mode >= 6 then
							ScriptMessage( OwnerID() , OwnerID() , 0 , "Entry error" , 0 ) -- ��J���~
							CancelBuff( OwnerID() , 501570 )
							DialogClose( OwnerID() )
							return false
						end
					 	ScriptMessage( OwnerID() , OwnerID() , 0 , Mode , 0 ) -- ��ܪ��~�W��
					elseif X == 2 then
						ItemID = tonumber(inputstring)
						if ( ItemID >= 200000 and ItemID <= 209999 ) or ( ItemID >= 240001 and ItemID <= 249999 ) then
							ScriptMessage( OwnerID() , OwnerID() , 0 , outputstring , 0 ) -- ��ܪ��~�W��
						end
						for i = 1 , table.getn(Item) , 1 do
							for j = 1 , table.getn(Item[i]) , 1 do
								if ItemID == Item[i][j] then
									Correct = 1
									break
								end
							end
						end
						if Correct ~= 1 then
							ScriptMessage( OwnerID() , OwnerID() , 0 , "Entry error" , 0 ) -- ��J���~
							CancelBuff( OwnerID() , 501570 )
							DialogClose( OwnerID() )
							return false
						end
					elseif X == 3 then
						Count = tonumber(inputstring)
						if ( Count <= 0 or Count >= 1000 ) then
					 		ScriptMessage( OwnerID() , OwnerID() , 0 , "Entry error" , 0 ) -- ��J���~
					 		CancelBuff( OwnerID(), 501570 )
					 		DialogClose( OwnerID() )
							return false
						end
					 	ScriptMessage( OwnerID() , OwnerID() , 0 , Count , 0 ) -- ��ܪ��~�W��
					--	Tell( OwnerID() , OwnerID() ,  "Count = "..Count )
					end

					if X < 3 then
						CancelBuff( OwnerID() , 501570 )
						DialogClose( OwnerID() )
						if Key ~= 1 then
							return Lua_Hao_Planting_3_Select(  X , Mode , ItemID , Count )
						end
					elseif X == 3 then
						for i = 1 , table.getn(Item) , 1 do
							for j = 1 , table.getn(Item[i]) , 1 do
								if ItemID == Item[i][j] then
									ScriptMessage( OwnerID() , OwnerID() , 2 , "Planting level "..Item[i][4].." : ".."["..Item[i][j].."]" , C_SYSTEM )	-- 
									for k = 1 , Count , 1 do
										CallPlot( OwnerID() , "Lua_Hao_Planting_Bonus" , Item[i][4] , 1 )
									--	Lua_Hao_Planting_Bonus(Item[i][4])
										GiveBodyItem( OwnerID() , Drop[i][j] , 1 )
										Sleep(5)
									end
									CancelBuff( OwnerID(), 501570 )
									DialogClose( OwnerID() )
									return false
								end
							end
						end
					else
						Key = 1
					end
				end
			end
		elseif DialogStatus== -1 then
			Key = 1
		end
		if Key == 1 then
	 		CancelBuff( OwnerID() , 501570 )
			DialogClose( OwnerID() )
			return false
		end
	end
end

function Lua_Hao_Planting_Bonus( SeedLv , Mode )

	local Series = { 1 , 7 , 13 , 19 , 25 , 31 , 37 , 43 , 49 , 55 , 61 , 67 , 73 , 79, 85, 91, 97 }		-- �ż�
	local Com_r = { 1.131793 , 1.073028 , 1.131793 }				-- ���� Common_ratio
	local Item = { 208651 , 208652 , 208655 }					-- ���y���~
	local Count = { 1 , 1 , 1 }								-- ���~�ƶq
	-- 1�Ѱ�¦�Ͳ����B�ľ��B1�Ѷi���Ͳ����B�ľ��B1�Ѱ�¦�Ͳ��t���ľ�
--	local Probability = { 5 , 2.5 , 5 }	-- ���� 79 �źؤl�ɡA�������v�� 5% . 2.5% . 5%
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local PlantLv = ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Plant )
	local Percent
--	DebugMsg( OwnerID() , Room , " OwnerID = "..OwnerID() )
	for i = 1 , table.getn( Item ) , 1 do
		if SeedLv == 1 then
			Percent = 1000
		else
			for j = 1 , table.getn(Series) , 1 do
				if SeedLv == Series[j] then
				--	DebugMsg( OwnerID() , Room , "SeedLv = "..SeedLv.." Com_r = "..Com_r[i].." j = "..j )
				--	Percent = math.floor( (SeedLv*(Com_r[i]^(j-1))/SeedLv) / 0.001 )  / 1000
					Percent = math.floor( (Com_r[i]^(j-1)) / 0.001 )
				end
			end
		end
		local Random = Rand(100001)
		local Key = Percent / 1000
		if Mode ~= 1 then
			DebugMsg( OwnerID() , Room , "["..Item[i].."]".." = "..Percent.." / "..Random )
		--	DebugMsg( OwnerID() , Room , Percent.." / "..Random )
		--	DebugMsg( OwnerID() , Room , "You have "..Key.."% ".."chance to receive "..Count[i].." ["..Item[i].."].".." ("..Percent.."/"..Random..")"  )
		end
		if Percent >= Random then
		--	DebugMsg( OwnerID() , Room , "You obtained "..Item[i].."." )
			GiveBodyItem( OwnerID() , Item[i] , 1 )
		end
	end
end
-- �H�U�� Npc �_�l�@�� --
function Hao_DE_4th_Npc_121802_Create()	-- 4�P�~ Npc -���p�D�l��(121802) �_�l�@��

	local Npc = OwnerID()
	local Zone = ReadRoleValue( Npc , EM_RoleValue_ZoneID )
	local Room = ReadRoleValue( Npc , EM_RoleValue_RoomID )
	local Box = {}
	Box["ID"] = 121911	-- ��������
	local Pos = {}
	
	if Zone == 2 then
		Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"] = 3108.4 , 44.9 , 50.0 , 146.4
	else
		Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"] = Lua_Hao_Return_Coordinate(Npc) -- ��Npc��e�y��
	end

	AddBuff( Npc , 503217 , 0 , -1 )	-- �I�񬡰ʥμлx
	if DE_4th_121802_StarBall == nil then	-- �ŧi���ʱM�ݪ������ܼ�
		DE_4th_121802_StarBall = {}
	end

	Box["Obj"] = CreateObj( Box["ID"] , Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"] , 1 )
	WriteRoleValue( Npc , EM_RoleValue_PID , Box["Obj"])	-- �N��������g�J Npc�A�� Npc �O�o��������
	Hao_Germany_4th_Obj_Status( Box["Obj"] , Room , false , false , false , false , false )	-- ��ܥͦ����A
	DE_4th_121802_StarBall[Room] = {}	-- �ŧi�� Room �������ܼ�
	DE_4th_121802_StarBall[Room][0] = Box["Obj"]	-- �ŧi���ʱM�ݪ������ܼ� [Room][0] ����������
	CallPlot( Box["Obj"] , "Hao_DE_4th_Npc_Mounted_Buff" , 80 )	-- �T���M��
	CallPlot( Box["Obj"] , "Hao_DE_4th_Npc_121802_Create_Obj" , Box["Obj"] , Room )	-- �}�l�ͦ����󪺼@��

	local NpcList = {}
	NpcList[1] = { 121799 , 3 }	-- ���P�Ųy�B���������`�q
	NpcList[2] = { 121800 , 2 }	-- ����P�Ųy�B���������`�q
	NpcList[3] = { 121801 , 4 }	-- �Ŧ�P�Ųy�B���������`�q
	NpcList[4] = { 121443 , 9 }	-- ���ʥ۪O�B���������`�q�A�۪O�T�w�q��9�A�̤j�q�� 18 �A�G�]���i���\��10
	NpcList[5] = { 121865 , 3 }	-- ���y�B��������̤j�q
	NpcList[6] = { 121866 , 0 }	-- ���e�e�g�Y�y�B�����y���ܤ���A�P���y�@�ɪ���̤j�q
	NpcList[7] = { 121867 , 0 }	-- �������g�Y�y�B�����y���ܤ���A�P���y�@�ɪ���̤j�q
	NpcList[8] = { 107622 , 5 }	-- �Q�~�B���������`�q
	NpcList[9] = { 121911 , 1 }	-- �w��4�P�~�y�P�Ū��Q��������B���������`�q�B��������L�k�j�M
	
	while true do
		Sleep(600)
		local SearchNpc = SetSearchRangeInfo( Npc , 500 )	-- ���X�d�򤺩Ҧ�����(�t�ۤv)
	--	local SearchNpc = SetSearchAllNPC( Room )	-- �j�M������Npc����
		local Count = {}
		Count["Total"] = 0	-- �`�q
		Count["StarBall"] = 0	-- �P�Ųy
		Count["Bird"] = 0	-- �Q�~
		Count["Balloon"] = 0	-- ���y
		Count["Slate"] = 0	-- �۪O
		-- 2013.11.18 �s�W�A�ʱ��P�Ųy�z�q�����D
		Count["Maximum"] = 0	-- �̤j��
		--
		local SearchList = {}
		for i = 1 , SearchNpc , 1 do	-- �N����v�@�^��
			local Result = GetSearchResult()	-- �^�Ǫ���
			table.insert( SearchList , Result )			
			local OrgID = ReadRoleValue( Result , EM_RoleValue_OrgID )	-- �^�Ǫ���OrgID
			for j = 1 , #NpcList , 1 do
				if Count[j] == nil then
					Count[j] = 0
				end
				if OrgID == NpcList[j][1] then
					Count[j] = Count[j] + 1	-- �Ψӭp��U�����e�`�q
					break
				end
			end
		end
		for j = 1 , #NpcList , 1 do	-- �p���`�q��A�o�X�`�@���X�ت���C��зǭ�
			if Count[j] == 0 then
				if j < 4 then	-- ��P�_�����~���P�Ųy�ɡA�Y�Ӳy���s�b�A�h...
					Count["StarBall"] = Count["StarBall"] + 1
				elseif j >= 5 and j <= 7 then	-- �Y�U�����y�����s�b�A�h...
					Count["Balloon"] = Count["Balloon"] + 1	-- ���y
				elseif j == 8 then	-- �Y�Q�~�����s�b�A�h...
					Count["Bird"] = Count["Bird"] + 1	-- �Q�~
				end
			end
			if Count[j] < NpcList[j][2] then	-- ���ت���֩�ΦC�������`�q�ɫh+1�A���P�_���e�e�g�Y�y�P�������g�Y�y(�]��0)
				if j == 4 then
					DesignLog( Npc , 1218024 , "2013 DE 4th Slate = "..Count[j] )
				end
				Count["Total"] = Count["Total"] + 1
				if j == 4 then
					Count["Slate"] = Count["Slate"] + 1
				end
			end
			-- 2013.11.18 �s�W�A�ʱ��P�Ųy�z�q�����D
			if j < 4 then	-- ��P�Ųy���ƶq�j��C�������`�q�ɫh+1�A�u�P�_�P�Ųy
				if Count[j] > NpcList[j][2] then
					Count["Maximum"] = Count["Maximum"] + 1
				end
			end					
			--
		end
		Box["CheckObj"] = ReadRoleValue( Npc , EM_RoleValue_PID )	-- Ū���O����Npc������������
		if Count["StarBall"] == 3 or Count["Balloon"] == 3 or Count["Bird"] == 1 or Count["Slate"] == 1 or Count["Total"] > 3 or CheckID(Box["CheckObj"]) == false or Count["Maximum"] > 0 then
		-- ��T�جP�Ųy�������B�T�ظ��y�������B�Q�~�������B�۪O�֩�i���\�ȡB�C��������4��(���t���e�e�P�������g�Y�y)�֩���������`�q�B���Ϊ��󤣦b�䤤�@�ر���F���ɫh���m
		-- 2013.11.18 �s�W�P�Ųy�W�L�зǭȮɭ��m�A�ʱ��P�Ųy�z�q�����D
			DesignLog( Npc , 1218023 , "2013 DE 4th Event Reset".." , Total = "..Count["Total"].." , StarBall = "..Count["StarBall"].." , Bird = "..Count["Bird"].." ,  Balloon = "..Count["Balloon"].." , Slate = "..Count["Slate"] )
		--	��l���A�� Total = �� , StarBall = 0 , Bird = 0 , Balloon = 2 , Slate = 0
			for i = 1 , #SearchList , 1 do	-- �N����v�@�^��
				local OrgID = ReadRoleValue( SearchList[i] , EM_RoleValue_OrgID )	-- �^�Ǫ���OrgID
				for j = 1 , #NpcList , 1 do
					if OrgID == NpcList[j][1] then	-- �N������ƧR��
						DelObj(SearchList[i])
						break
					end
				end
			end
			Sleep(10)
		--	DesignLog( Npc , 1218023 , "2013 DE 4th Event Reset" )
			Box["Obj"] = CreateObj( Box["ID"] , Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"] , 1 )
			WriteRoleValue( Npc , EM_RoleValue_PID , Box["Obj"])	-- �N��������g�J Npc�A�� Npc �O�o��������			
			Hao_Germany_4th_Obj_Status( Box["Obj"] , Room , false , false , false , false , false )	-- ��ܥͦ����A
			DE_4th_121802_StarBall[Room] = {}	-- �ŧi�� Room �������ܼ�
			DE_4th_121802_StarBall[Room][0] = Box["Obj"]	-- �ŧi���ʱM�ݪ������ܼ� [Room][0] ����������
			CallPlot( Box["Obj"] , "Hao_DE_4th_Npc_Mounted_Buff" , 80 )	-- �T���M��
			CallPlot( Box["Obj"] , "Hao_DE_4th_Npc_121802_Create_Obj" , Box["Obj"] , Room )	-- �}�l�ͦ����󪺼@��
		end
	end
end

function Hao_Del_Single_Obj(NpcID)	-- �R���Ӱϰ���wID���Ҧ�����  1 ��

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local SearchNpc = SetSearchAllNPC( Room )	-- �j�M������Npc����
	local Count = 0
	
	for i = 1 , SearchNpc , 1 do	-- �N����v�@�^��
		local Result = GetSearchResult()	-- �^�Ǫ���
		local OrgID = ReadRoleValue( Result , EM_RoleValue_OrgID )	-- �^�Ǫ���OrgID
		if OrgID == NpcID then
			if Count == 0 then
				DelObj(Result)
			end
			Count = Count + 1
		end
	end
	DebugMsg( Player , Room , NpcID.." = "..Count-1 )	-- ���wNpc�Ѿl���ƶq
end
		
function Hao_DE_4th_Npc_Mounted_Buff(Range)	-- �P�_�T���M��

	local Box = OwnerID()
	local Room = ReadRoleValue( Box , EM_RoleValue_RoomID )	-- �^�ǰϰ�
	local Buff = 624013	--�T���M��
	
	while true do
		local Count = SetSearchRangeInfo( Box , Range*2 )	-- ���X�d�򤺩Ҧ�����(�t�ۤv)
		for i = 1 , Count , 1 do
			local ObjID = GetSearchResult()	-- �^�ǽd�򤺩Ҧ����� GUID
			if ReadRoleValue( ObjID , EM_RoleValue_IsPlayer ) == 1 then	-- �p�G�O���a�~�B�z			
				local Distance = GetDistance( Box , ObjID )	-- ���o�Ӫ���P�ѦҪ��󪺶Z��
				if Distance <= Range  then
					if DW_CancelMount( ObjID ) == true then	-- ���M���������a�U��(�]�t�Ʈy)
						ScriptMessage( ObjID , ObjID , 1 , "[SC_THANKS_2011_12]" , C_SYSTEM )	-- ���ʶi�椤�A���B�L�k�M�����M�I
						ScriptMessage( ObjID , ObjID , 0 , "[SC_THANKS_2011_12]" , C_SYSTEM )
					end
					if CheckBuff( ObjID , Buff ) == false then
						AddBuff( ObjID , Buff , 0 , 5 )
					--	DebugMsg( ObjID , Room , "Distance = "..Distance )
					else
						local Pos = Lua_BuffPosSearch( ObjID , Buff )
						local Time = BuffInfo( ObjID , Pos , EM_BuffInfoType_Time )
						if Time <= 1 then
							AddBuff( ObjID , Buff , 0 , 5 )
						end
					end
				elseif Distance <= Range*2 then
					if CheckBuff( ObjID , Buff ) == true then
						CancelBuff_NoEvent( ObjID , Buff )
					end
				end
			end
		end
		Sleep(10)
	end
end

-- ���󲣥ͼ@�� --
function Hao_DE_4th_Npc_121802_Create_Obj(ObjID , Room )

	local Polygon = 18	-- �X��ΡA�ݬ�����
	local Distance = 75	-- �b�|�Z���A���|��*2
	local SlateID = 121443	-- ���xID(��Υ۪O)
--	local SlateID = 121807	-- ���xID(��Φa�j)
	local Slate = {}		-- ���x
	local Height = { 5 , 15 , 25 , 35 , 45 , 55 , 65 , 75 , 85 }	-- �b���w���׫إ߶�Υ��x�A�`�ƻݬ� Polygon /2
	local Pos = {}
	Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"] = Lua_Hao_Return_Coordinate(ObjID) -- ��Npc��e�y��
	Pos["Obj_X"] , Pos["Obj_Y"] , Pos["Obj_Z"] = {} , {} , {}
	
	for i = 1 , #Height , 1 do	-- �b���w���׫إ߶�Υ��x
		local Point = { i , i+(Polygon/2) }		-- �N��HN�䫬�覡����C Table ���ƶq�A�N�M�w�C�h���צ��X�ӥ��x	
		DE_4th_121802_StarBall[Room][i] = {}	-- (�N�C���I�� x.y.z �N�J�����ܼƤ��A�A����s�ɡA�i�Ҽ{�Ψ�L����O��A���ݥ����ܼ�)
		for j = 1 , Polygon , 1 do	-- �إߪ����x�O�H�X��ΡB�Φh�j����ƦC(�A����s�ɡA�i�Ҽ{�u�ŧi�@�� x . y . z �y�СA�A�q y �ܤơA���ݦh�Ӱj�鰵�B��)
			Pos["Obj_X"][j] = Pos["X"]-Distance*math.cos(math.pi*2*(j/Polygon))
			Pos["Obj_Y"][j] = Pos["Y"]+Height[i]
			Pos["Obj_Z"][j] = Pos["Z"]+Distance*math.sin(math.pi*2*(j/Polygon))
			DE_4th_121802_StarBall[Room][i][j] = { Pos["Obj_X"][j] , Pos["Obj_Y"][j] , Pos["Obj_Z"][j] }
		end
	--	for k = 1 , #Point , 1 do	-- �إ߬P��	�ⰼ�Ҧ��b��
		for k = 1 , #Point , 2 do	-- �إ߬P��	�氼���b��
			Slate[k] = CreateObj( SlateID , Pos["Obj_X"][Point[k]] , Pos["Obj_Y"][Point[k]] , Pos["Obj_Z"][Point[k]] , Pos["Dir"] , 1 )
			ReCalculate( Slate[k] )	-- ���s�p�⥭�x���
			Hao_Germany_4th_Obj_Status( Slate[k] , Room , true )	-- ��ܥͦ����A
			CallPlot( Slate[k] , "Hao_DE_4th_Npc_121802_Slate_Rround" , Slate[k] , Point[k] , Room , i , Polygon , ObjID )
		end
	end
	Callplot( ObjID , "Hao_DE_4th_Npc_121802_Board_Up" , ObjID , Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"] , Room )
	-- �I�s���x���_���W���ʡCNpc�BNpc�� x.y.z.dir�BRoom
	Hao_Germany_4th_Create_SkyBall()	-- ����P�Ųy��l�@��
end

function Hao_DE_4th_Npc_121802_Slate_Rround( Slate , Point , Room , Height , Polygon , Npc )	-- �I�s���x���_�����¶
 -- ���x�B�إߦ�m�Broom�B���סB�X��ΡB�N�JNpc
	while true do
		if Point > Polygon then
			Point = 1
		end
		local Pos = {}	-- Ū�������ܼƤ��O���� X , Y , Z
		Pos["X"] = DE_4th_121802_StarBall[Room][Height][Point][1]
		Pos["Y"] = DE_4th_121802_StarBall[Room][Height][Point][2]
		Pos["Z"] = DE_4th_121802_StarBall[Room][Height][Point][3]
		MoveDirect( Slate , Pos["X"] , Pos["Y"] , Pos["Z"] )
		Point = Point+1
		sleep(30)
	end
end

function Hao_DE_4th_Npc_121802_Board_Up( ObjID , X , Y , Z , Dir , Room )	-- ����w���ץͦ����x�A�I�s���x���ʦܫ��w���׫����

	local BoardID = 121443	-- ��Υ۪O
--	local BoardID = 121807	-- ��Φa�j	
	local BirdID = 107622		-- �Q�~
	local BalloonID = 121865 	-- ���y	
--	local Height = { 100 , 0 }	-- �b���w���׫إ߶�Υ��x Height[1]���_�l�I�BHeight[2]����������I(�ѤW���U����)
	local Height = { 0 , 85 }	-- �b���w���׫إ߶�Υ��x Height[1]���_�l�I�BHeight[2]����������I(�ѤU���W����)
	local Bird_Height = { 50 , 55 , 60 , 65 , 70 , 75 }	-- ���ͯQ�~������
	local Balloon_Height = { 25 , 35 , 45 , 55 , 65 , 75 }	-- ���͸��y������
	local Polygon ={ 5 , 3 , 6 }	-- �Q�~�B���y�B���ꥭ�x�ƶq
	local Distance = { 35 , 70 , 35 }	-- �Q�~��b�|���B���y��b�|���B���饭�x�b�|��
	local Buff = 622107	-- ��t�k�N�A�C�W�[����1�A��w1%�t��
	local Speed = 79	-- ���x���ʴ�w���t�סA�H Buff �վ�
	local Pos = {}
	Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Others_Y"] = {} , {} , {} , {}

	for Site = 1 , #Distance , 1 do
		Pos["X"][Site] , Pos["Y"][Site] , Pos["Z"][Site] , Pos["Others_Y"][Site] = {} , {} , {} , {}
		for Count = 1 , Polygon[Site] , 1 do	-- �Φh�䫬�N���
			Pos["X"][Site][Count] = X-Distance[Site]*math.cos(math.pi*2*(Count/Polygon[Site]))
			Pos["Z"][Site][Count] = Z+Distance[Site]*math.sin(math.pi*2*(Count/Polygon[Site]))
			Pos["Y"][Site][Count] = Y + Height[1]			-- ���Ͷꫬ���x���_�l����
			if Site == 1 then	-- ���ͯQ�~
				Pos["Others_Y"][Site][Count] = Y + Bird_Height[Count]	-- ���ͯQ�~������
				local Bird = CreateObj( BirdID , Pos["X"][Site][Count] , Pos["Others_Y"][Site][Count] , Pos["Z"][Site][Count] , Dir , 1 )	-- ���ͯQ�~
				Hao_Germany_4th_Obj_Status( Bird , Room , false , true , false , true )	-- ��ܥͦ����A(����BRoom�B���סB�Y���ءB����B�аO)
			elseif Site == 2 then	-- ���͸��y
				Pos["Others_Y"][Site][Count] = Y + Balloon_Height[Count]	-- ���͸��y������
				local Balloon = CreateObj( BalloonID , Pos["X"][Site][Count] , Pos["Others_Y"][Site][Count] , Pos["Z"][Site][Count] , Dir , 1 )	-- ���͸��y
				Hao_Germany_4th_Obj_Status( Balloon , Room , false , true , false , true  )	-- ��ܥͦ����A(����BRoom�B���סB�Y�ۮءB����B�аO)
			end
		end
	end

	while true do
		for Site = 3 , #Distance , 1 do
			for Count = 1 , Polygon[Site] , 1 do	-- �Φh�䫬�N���
				local Board = CreateObj( BoardID , Pos["X"][Site][Count] , Pos["Y"][Site][Count] , Pos["Z"][Site][Count] , Dir , 1 )	-- ���󦨫~
				AddBuff( Board , Buff , Speed , -1 )
				ReCalculate( Board )	-- ���s�p�⥭�x�t��
				Hao_Germany_4th_Obj_Status( Board , Room , true )	-- ��ܥͦ����A
				MoveDirect( Board , Pos["X"][Site][Count] , Y+Height[2] , Pos["Z"][Site][Count] )
				Callplot( Board , "Hao_DE_4th_Npc_121802_Board_Disappear" , Board , ObjID , Y+Height[2] )	-- ���x�BNpc�B��������ɰ���
				Sleep(30)
			end
		end
	end
end

function Hao_DE_4th_Npc_121802_Board_Disappear( Board , ObjID , Height )	-- ���w���x���ɦܫ��w���׮���

	local Sec = 0
	while Sec < 60 do	-- �w������A���ͥ��x��W�L60��A���x�|�R���ۤv�A�קK����]������]�L�k��F���w���צ��z�q�����D
		local Y = ReadRoleValue( Board , EM_RoleValue_Y )
		local Distance = Math.abs(Y-Height)
		if Distance <5 then	-- �Z���W�L 5 �H���N�R�����x
			break
		end
		Sleep(10)
		Sec = Sec + 1
	end
	DelObj(Board)
end
------------------------------ �H�U�� Npc ��ܼ@�� --------------------------
function Hao_DE_4th_Npc_121802()	-- 4�P�~ Npc -���p�D�l��(121802) ��ܼ@��

	local Player = OwnerID()
	local Npc = TargetID()
	local CheckDis = CheckBuff( Player , 621751 )	-- �T�{���a�O�_�b Npc ����ܽd��
	local Key = { 547508 , 547509 }	-- ���ȶi�椤�B���Ȥw����

	if CheckDis== false then
 		AddBuff( Player , 621751 , 0 , -1 ) -- �����Z��
		CallPlot( Player , "Hao_Check_Distance" , Npc , 50 )  ----�NNpc�a�J���a���O�����B�W�L�h�ֶZ���Y��������
	end

	AdjustFaceDir( Npc , Player , 0 )	-- ���V
	PlayMotion( Npc , 106 )		-- �I�Y

	if CheckFlag( Player , Key[1] ) == true then	-- ���ȶi�椤�P Npc ��ܮ�...
		SetSpeakDetail( Player , "[SC_DE_4TH_SKY_BALL_04]" ) -- �w���W�C�[�o�A���ݧA���Ӧn���Z�I
	else	-- �����W�Τw������y
		if CheckFlag( Player , Key[2] ) == false then	-- �����W
			SetSpeakDetail( Player , "[SC_DE_4TH_SKY_BALL_01]" )	-- �A�n�A�ڬO[121802]�A������ѥ[�P�Ū��Q�ܡH
			AddSpeakOption( Player , Npc , "[SC_DE_4TH_SKY_BALL_02]" , "Hao_DE_4th_Npc_121802_1", 0 )	-- �n���A�ڦ�����C
		else	-- �w������y
			SetSpeakDetail( Player , "[SC_DE_4TH_SKY_BALL_05]"  )	-- ���o�N�S���ɶܡH
			AddSpeakOption( Player , Npc , "[SC_DE_4TH_SKY_BALL_07]" , "Hao_DE_4th_Npc_121802_3" , 0 )	-- �ڷQ�A���@���C			
		end
	end
end
	
function Hao_Check_Distance( Npc , Range )	-- ��ܶW�L�Z���A������ܼ@��

	local Player = OwnerID()
	while true do
		if GetDistance( Player , Npc )  >= Range then
			CloseSpeak( Player )
			AdjustFaceDir( Npc , Player , 0 ) -- ���V
			break
		end
		Sleep(5)
	end
	CancelBuff_NoEvent( Player , 621751 )
end

function Hao_DE_4th_Npc_121802_1()	-- ��ܧڦ������A���檺�@���C

	local Player = OwnerID()
	CloseSpeak( Player )
	SetSpeakDetail( Player , "[SC_DE_4TH_SKY_BALL_03]" ) -- �P�Ū��Q�A�@�ؾ��v�y�[���C��...
	AddSpeakOption( Player , Player , "[SC_111796_0]" , "Hao_DE_4th_Npc_121802_2", 0 )	-- �ڷǳƦn�F
	AddSpeakOption( Player , Player , "[SO_BACK]" , "Hao_DE_4th_Npc_121802 " , 0 )-- �^��W�@��
end

function Hao_DE_4th_Npc_121802_2()	-- ��ܰѥ[�C����A���檺�@���C

	local Player = OwnerID()
	local Npc = TargetID()
	CloseSpeak( Player )
	local Key = 547508	-- ���ȶi�椤
	local Buff = 624006	-- �N���ʮɶ���Buff
	local Time = 180	-- ��������Ҫ�����ɶ�
	
	DW_CancelTypeBuff( 68 , Player )	-- ���M���������a�U��(�]�t�Ʈy)
	SetFlag( Player , Key , 1 )
	AddBuff( Player , Buff , 0 , Time )	-- ���ʮɶ�
--	AddBuff( Player , 508175 , 0 , 2 )	-- �ѥ[�S��
	AdjustFaceDir( Npc , Player , 0 )	-- ���V
	PlayMotion( Npc , 106 )		-- �I�Y
	PlayMotion( Player , 103 )	-- ���u
	ScriptMessage( Player , Player , 1 , "[SC_DE_4TH_SKY_BALL_08]" , C_SYSTEM )	-- ���ݧA����{�A�����u����������a�I
	ScriptMessage( Player , Player , 0 , "[SC_DE_4TH_SKY_BALL_08]" , C_SYSTEM )	-- ���ݧA����{�A�����u����������a�I
	DesignLog( Player , 121802 , "2013 DE 4th Sky Ball Start" )	--��ܰѥ[�C�����H��
end

function Hao_DE_4th_Npc_121802_3()	-- ��ܦA���@����A���檺���m�@���C

	local Player = OwnerID()
	SetSpeakDetail( Player , "[SC_DE_4TH_SKY_BALL_09]"  )	-- �s�@�P�Ųy�ݭn�j�q���]�O�A�ثe�]�O���ӷ����O�q[202903]������ӨӡA�H�۰ѥ[�H�Ƴv���W�[�A�ڭ̮w�s��[202903]�V�ӶV�֤F�A�p�G�A�Q�A���@���A�Х��٧U1��[202903]�n�ܡH
	AddSpeakOption( Player , Player , "[SC_422579_1]" , "Hao_DE_4th_Npc_121802_4" , 0 )	-- ���@�N
	AddSpeakOption( Player , Player , "[SO_BACK]" , "Hao_DE_4th_Npc_121802" , 0 )	-- �^��W�@��
end

function Hao_DE_4th_Npc_121802_4()	-- �e�W�A���檺���m�@���C

	local Player = OwnerID()
	local Npc = TargetID()
	local Key = { 547508 , 547509 }	-- ���ȶi�椤�B���Ȥw����
	local Item = 202903		-- �ǰe�̲Ť�
	local Ticket = CountBodyItem( Player , Item )	-- �p�⪱�a���W���h�֭Ӷǰe�̲Ť�
	local Buff = 624006	-- �N���ʮɶ���Buff
	local Time = 180	-- ��������Ҫ�����ɶ�

	CloseSpeak( Player )
	if Ticket >= 1 then
		DW_CancelTypeBuff( 68 , Player )	-- ���M���������a�U��(�]�t�Ʈy)
		DelBodyItem( Player , Item , 1 )
		SetFlag( Player , Key[1] , 1 )
		SetFlag( Player , Key[2] , 0 )
		AddBuff( Player , Buff , 0 , Time )	-- 180�����������
	--	AddBuff( Player , 508175 , 0 , 2 )	-- �ѥ[�S��		
		AdjustFaceDir( Npc , Player , 0 )	-- ���V
		PlayMotion( Npc , 112 )		-- ����
		PlayMotion( Player , 103 )	-- ���u
		ScriptMessage( Player , Player , 1 ,  "[SC_DE_4TH_SKY_BALL_10]" , C_SYSTEM )	-- �A�A�׾֦��F��������ҡC
		ScriptMessage( Player , Player , 0 , "[SC_DE_4TH_SKY_BALL_08]" , C_SYSTEM )	-- ���ݧA����{�A�����u����������a�I
		DesignLog( Player , 1218021 , "2013 DE 4th Sky Ball Reset" )	--��ܤ�I 1 �Ӷǰe�̲Ť媺���m�H��		
	else
		PlayMotion( Npc , 107 )	-- �n�Y
		ScriptMessage( Player , Player , 1 , "[SC_112502_NO]" , C_SYSTEM )	-- �A���������~�ƶq������I		
	end
end

function Hao_DE_4th_Star_Ball_Reward()	-- �C���ɶ������ɡA���檺�@��

	local Player = OwnerID()
	local Key = { 547508 , 547509 }	-- ���ȶi�椤�B���Ȥw����
	local Buff = 624003		-- �P�иH��(�N�����)
	local Score = Lua_Hao_Return_Buff_Lv( Player , Buff ) + 1	-- �ֿn����
	local Range = { 0 , 50 , 100 , 150 , 99999 }	-- ���ư϶��P���y

	for i = 1 , table.getn(Range) , 1 do
		local String
		local Gift = {}
		Gift[1] = {}
		Gift[2] = { { 209561 , 1 } , { 241114 , 3 } }	-- �w�y�C�����*1�B��o���v�a*3
		Gift[3] = { { 209561 , 1 } , { 241114 , 3 } , { 241128 , 1  } }	-- �w�y�C�����*1�B��o���v�a*3�B�����Ŷꨩ§�](�p)*1
		Gift[4] = { { 209561 , 1 } , { 241114 , 3 } , { 241127 , 1  } }	-- �w�y�C�����*1�B��o���v�a*3�B�����Ŷꨩ§�](��)*1
		Gift[5] = { { 209561 , 1 } , { 241114 , 3 } , { 241126 , 1  } }	-- �w�y�C�����*1�B��o���v�a*3�B�����Ŷꨩ§�](�j)*1
		if Score <= Range[i] then
			if i > 1 then
				for j = 1 , #Gift[i] , 1 do
					GiveBodyItem( Player , Gift[i][j][1] , Gift[i][j][2] )
				end
				String = "[SC_DE_4TH_SKY_BALL_11][$SETVAR1="..Score.."]"
				PlayMotion( Player , 115 )	-- �w�I
			else
				String = "[SC_DE_4TH_SKY_BALL_12]"
				PlayMotion( Player , 105 )	-- ���_
			end
			SetFlag( Player , Key[1] , 0 )			
			SetFlag( Player , Key[2] , 1 )
			CancelBuff_NoEvent( Player , Buff )
			ScriptMessage( Player , Player , 2 , String , C_SYSTEM )
			ScriptMessage( Player , Player , 0 , String , C_SYSTEM )
			DesignLog( Player , 1218022 , "2013 DE 4th Sky Ball Score = "..Score )	-- ���a���������ʪ����ƻP����
			break
		end
	end
end
-- �H�U���P�Ųy��l�@�� --
function Hao_Germany_4th_Create_SkyBall()

	local ObjID = OwnerID()
	local Room = ReadRoleValue( ObjID , EM_RoleValue_RoomID )
	local SkyBall
	local Height = { 25 , 40 , 55 , 70 , 85 , 100 , 115 }	-- �b���w���׫إ߬P�Ųy
	local Removing = 50			-- �P�Ųy�ͦ������ѦҪ��󪺶Z��
	local Pos = {}
	Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"] = Lua_Hao_Return_Coordinate(ObjID) -- ��Npc��e�y��	
	local BallList = {}		-- �C�h�P�Ųy�ͦ����ƶq�P�ͦ�ID
	BallList[1] = { 121801 , 1 , 4 , 20 , 10 }	-- �P�ŲyID�A���h�ƪ�����ƶq�B���ʤ覡�B���ʶZ���B���ͮɶ�(1/10��)
	BallList[2] = { 121801 , 1 , 4 , 20 , 10 }	-- ���P�Ųy(121799)*3�B����P�Ųy(121800)*2�B�Ŧ�P�Ųy (121801)*4
	BallList[3] = { 121799 , 1 , 3 , 30 , 30 }	-- 
	BallList[4] = { 121800 , 1 , 3 , 40 , 50 }	-- 
	BallList[5] = { 121801 , 2 , 4 , 20 , 10 }	--
	BallList[6] = { 121799 , 2 , 3 , 30 , 30 }	-- 
	BallList[7] = { 121800 , 1 , 3 , 40 , 25 }	--
	
	for i = 1 , #BallList , 1 do
		for k = 1 , BallList[i][2] , 1 do
			local Distance =  math.random( -Removing , Removing )	-- �P�Ųy�ͦ������ѦҪ��󪺶Z��
			Pos["Obj_Dir"] = math.random( 0 , 359 )	-- ���ʤ�V
			local Cal = (math.pi/180)*Pos["Obj_Dir"]
			Pos["Obj_X"] = Pos["X"] +( Distance*math.cos(Cal) )
			Pos["Obj_Y"] = Pos["Y"] +Height[i]
			Pos["Obj_Z"] = Pos["Z"] - ( Distance*math.sin(Cal) )
			SkyBall = CreateObj( BallList[i][1] , Pos["Obj_X"] , Pos["Obj_Y"] , Pos["Obj_Z"] , Pos["Obj_Dir"] , 1 )
			Hao_Germany_4th_Obj_Status( SkyBall , Room , false )	-- ��ܥͦ����A
			WriteRoleValue( SkyBall , EM_RoleValue_PID , Height[i] )	-- �N�w�]���׼g�J�P�Ųy��
			WriteRoleValue( SkyBall , EM_RoleValue_Register+2 , BallList[i][3] )	-- �N���ʤ覡�g�J�P�Ųy��
			WriteRoleValue( SkyBall , EM_RoleValue_Register+3 , BallList[i][4] )	-- �N���ʶZ���g�J�P�Ųy��
			WriteRoleValue( SkyBall , EM_RoleValue_Register+4 , BallList[i][5] )	-- �N���ͮɶ��g�J�P�Ųy��
			WriteRoleValue( SkyBall , EM_RoleValue_Register+5 , Removing )	-- �N�P�Ųy�ͦ������ѦҪ��󪺶Z���g�J�P�Ųy��
			CallPlot( SkyBall , "Hao_Obj_Mobile" , SkyBall , BallList[i][3] , BallList[i][4] , 1 )
			-- �P�Ųy���ѦҪ��󪺶Z���[�W�üƲ��ʪ��̤j�Z���A���n�W�L�����¶���x���Z���C
		end
	end
end
-- �P�Ųy���󲣥ͼ@��(���_�I��k�N)
function Hao_Germany_4th_StarBall_Casting()

	local StarBall = OwnerID()
	local OrgID = ReadRoleValue( StarBall , EM_RoleValue_OrgID )
	local Magic = {}
	Magic[121799] = 850605	-- ���P�Ųy
	Magic[121800] = 850606	-- ����P�Ųy
	Magic[121801] = 850604	-- �Ŧ�P�Ųy
	while true do
		SysCastSpellLv( StarBall , StarBall , Magic[OrgID] , 0 )
		sleep(1)
	end
end
-- �򥻪k�N�����ˬd Lua �ˬd���a�O�_���N��ѥ[���ʪ� Buff
function Hao_Germany_4th_StarBall_Check()

	local Player = TargetID()
	local StarBall = OwnerID()
	local Key = 547509	-- �P�Ū��Q���Ȥw����
	local Quest = { 425985 , 425998 }	-- �̨Ϊ����ȡB��޳������
	local Buff = 624037	-- ����������
	local Statue = 0

	if CheckBuff( Player , Buff ) == true or CheckFlag( Player , Key ) == true then	-- �d�߸ӦW���a�O�_���������ʪ�Buff�B�P�Ū��Q���Ȥw����
		Statue = 1
	end

	if Statue == 0 then
		for ID = 1 , #Quest , 1 do	-- �̨ΩΨ�޳�����ȶi�椤
			if CheckQuest( Player , Quest[ID] , 0 ) == true then
				Statue = 1
				break
			end
		end
	end

	if ReadRoleValue( Player , EM_RoleValue_IsDead ) == 1 then	-- �d�߸ӦW���a�O�_���`
		return false
	end

	if CheckBuff( Player , 624006 ) == false then	-- �d�߸ӦW���a�O�_�����WBuff
		if Statue ~= 1 then
			ScriptMessage( Player , Player , 2 , "[SC_DE_4TH_SKY_BALL_06]" , C_RED )	-- �����P�Ųy�e�A�Х���M���o[624006]�C
		end
	--	DebugMsg( Player , 0 , "You must be obtained Buff 624006 first , You can entry /gm ? pcall buffaddskill(624006 to get it" )
		return false
	end
	
	if ReadRoleValue( StarBall , EM_RoleValue_Register+1 ) == 1 then	-- �d�ߦ��P�Ųy�O�_�w�I�k�L
	--	DebugMsg( Player , 0 , "Casting already" )
		return false
	end
	
	DW_CancelTypeBuff( 68 , Player )	-- ���M���������a�U��(�]�t�Ʈy)
end
-- �򥻪k�N��������@���A�ΨӧP�_���a�IĲ�����C�⪺�P�Ųy�A�ño��h�֤�
function Hao_Germany_4th_StarBall_Score(Score)
	-- �ŬP�Ųy�� 1 ���B��P�Ųy�� 5 ���B���P�Ųy�� 20���A���]�w�g��򥻪k�N��������@��
	local Player = TargetID()
	local StarBall = OwnerID()
	local Effect = { 622109 , 622148 }	-- �Ĥ�(��)�B�Ĥ�(��)
	
	AddBuff( StarBall , Effect[2] , 0 , 1 )
	AddBuff( Player , 624003 , Score-1 , -1 )	-- �������a����
	WriteRoleValue( StarBall , EM_RoleValue_Register+1 , 1 )	-- �ӬP�Ųy�w�g�I��L�k�N
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Height = ReadRoleValue( StarBall , EM_RoleValue_PID )	-- Ū���P�Ųy����������
	local ID = ReadRoleValue( StarBall , EM_RoleValue_OrgID )	-- Ū���P�Ųy��OrgID
	local Mobile = ReadRoleValue( StarBall , EM_RoleValue_Register+2 )	-- Ū���w�]�����ʤ覡
	local Dis = ReadRoleValue( StarBall , EM_RoleValue_Register+3 )		-- Ū���w�]�����ʶZ��
	local ReviveTime = ReadRoleValue( StarBall , EM_RoleValue_Register+4 )	-- Ū���w�]�����ͮɶ�	
	local Removing =  ReadRoleValue( StarBall , EM_RoleValue_Register+5 )	-- Ū���P�Ųy�ͦ������ѦҪ��󪺶Z��
	local Distance =math.random( -Removing , Removing )			-- �P�Ųy�ͦ������ѦҪ��󪺶Z��
	local Npc = DE_4th_121802_StarBall[Room][0]	-- ���P�Ųy�O�_�����I��Npc
	local Pos = {}
	Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"] = Lua_Hao_Return_Coordinate(Npc) -- ��Npc��e�y��
	Pos["Obj_Dir"] = math.random( 0 , 359 )	-- ���ʤ�V

	local Cal = (math.pi/180)*Pos["Obj_Dir"]
	Pos["Obj_X"] = Pos["X"] +( Distance*math.cos(Cal) )
	Pos["Obj_Y"] = Pos["Y"] +Height
	Pos["Obj_Z"] = Pos["Z"] - ( Distance*math.sin(Cal) )

	local Obj = CreateObj( ID , Pos["Obj_X"] , Pos["Obj_Y"] , Pos["Obj_Z"] , Pos["Obj_Dir"] , 1 )
	WriteRoleValue( Obj , EM_RoleValue_PID , Height )
	WriteRoleValue( Obj , EM_RoleValue_Register+2 , Mobile )	-- �N���ʤ覡�g�J�P�Ųy��
	WriteRoleValue( Obj , EM_RoleValue_Register+3 , Dis )		-- �N���ʶZ���g�J�P�Ųy��
	WriteRoleValue( Obj , EM_RoleValue_Register+4 , ReviveTime )	-- �N���ͮɶ��g�J�P�Ųy��
	WriteRoleValue( Obj , EM_RoleValue_Register+5 , Removing )	-- �N�P�Ųy�ͦ������ѦҪ��󪺶Z���g�J�P�Ųy��
	CallPlot( Obj , "Hao_Germany_4th_StarBall_Back" , Obj , Mobile , ReviveTime , Dis , StarBall , Room )
	-- �s�P�Ųy�B���ʤ覡�B���ͮɶ��B�¬P�Ųy�B���y�B
end

function Hao_Germany_4th_StarBall_Back( Obj , Mobile , ReviveTime , Dis , StarBall , Room )
	-- �s�P�Ųy�B���ʤ覡�B���ͮɶ��B�¬P�Ųy�B���y
	DelObj(StarBall)
	Sleep(ReviveTime)
	Hao_Germany_4th_Obj_Status( Obj , Room , false )	-- ��ܥͦ����A
	CallPlot( Obj , "Hao_Obj_Mobile" , Obj , Mobile , Dis , 1 )	-- �N�J�ؼСB���ʤ覡�B���ʶZ���B�O�_Loop
end
-- �H�U���@�Ψ禡 -- 
-- ���ݲ��ʦܩw�I��A�~�����L�@��
function Hao_WaitMoveTo( ObjID , X , Y , Z )

	MoveDirect( ObjID , X , Y , Z )
	while true do
		local Pos = {}
		Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"]= Lua_Hao_Return_Coordinate(ObjID) -- ���y��e�y��
	--	DebugMsg( 0 , 0 , Pos["X"].." , "..Pos["Y"].." , "..Pos["Z"] )
		if Math.abs(X - Pos["X"]) < 5 and Math.abs(Y - Pos["Y"]) < 5 and Math.abs(Z- Pos["Z"]) < 5 then
			break
		end
		sleep(5)
	end
end
-- �b�򥻪k�N�����ˬdlua���W��Lua�A�i�H�����I�k�̻P�Q�I�k�̪����׮t�Z
function Hao_Obj_To_Obj_Height(Height)

	local Caster = OwnerID()
	local Target = TargetID()
	local OrgID = ReadRoleValue( Target , EM_RoleValue_OrgID )
	local Pos = {}
	Pos["Caster_Y"] = ReadRoleValueFloat( Caster , EM_RoleValue_Y )	
	Pos["Target_Y"] = ReadRoleValueFloat( Target , EM_RoleValue_Y )
--	DebugMsg( 0 , 0 , "Dis = "..Math.abs( Pos["Caster_Y"] - Pos["Target_Y"]) )
	if Math.abs( Pos["Caster_Y"] - Pos["Target_Y"] ) > Height then
		return false
	end
end

-- ��a�إߤ@�Ӫ���A�ñq��e���V����
function Hao_Obj_Mobile(ObjID,Mobile,Distance,Loop)	-- ����B���ʤ覡�B�Z���B�O�_�|�Ӧ^
-- Mobile = 1 �ɡA���W�U���ʡB2 �ɬ��e�Ჾ�ʡB3�ɬ��H�@���I���_�l�I�A�W�U���k�üƲ��ʡB4�ɬ��H�@���I���_�l�I�A���k�üƲ��ʡC
-- Distance �i�� - �ȡA�|���Ϥ�V���ʡBLoop �� 1 �ɡA�|���Ʃ���A�i����C

--	local Zone = ReadRoleValue( ObjID , EM_RoleValue_ZoneID )
	local Pos = {}
	Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"] = Lua_Hao_Return_Coordinate(ObjID)	-- ��ObjID��e�y��
	local Cal = (math.pi/180)*Pos["Dir"]
	if Loop == nil then
		Loop = 0
	end

	if Mobile == 1 then	-- �W(Loop�ɬ��W�U)
		Pos["NewX"] = Pos["X"]
		Pos["NewZ"] = Pos["Z"]
		Pos["NewY"] = Pos["Y"] + Distance
		Pos["Surface"] = GetHeight( Pos["NewX"] , Pos["Y"] , Pos["NewZ"] )
		if Pos["NewY"] <= Pos["Surface"] then
			Pos["NewY"] = Pos["Surface"]
		end		
	elseif Mobile == 2 then	-- �e(Loop�ɬ��e��)
		Pos["NewX"] = Pos["X"] +( Distance*math.cos(Cal) )
		Pos["NewZ"] = Pos["Z"] - ( Distance*math.sin(Cal) )
		Pos["NewY"] = Pos["Y"]
		Pos["Surface"] = GetHeight( Pos["NewX"] , Pos["Y"] , Pos["NewZ"] )
		if Pos["NewY"] <= Pos["Surface"] then
			Pos["NewY"] = Pos["Surface"]
		end
	end
	
	while true do
		local Statue = ReadRoleValue( ObjID , EM_RoleValue_IsAttackMode )           --�P�_�O�_�i�J�԰� 1=�O 0=�_
		if Mobile == 3 then	-- �H�@���I���_�l�I�A�W�U���k�üƲ��ʡC
			Pos["Dir"] = math.random( 1 , 360 )
			local Cal = (math.pi/180)*Pos["Dir"]
			Pos["NewX"] = Pos["X"] +( Distance*math.cos(Cal) )
			Pos["NewZ"] = Pos["Z"] - ( Distance*math.sin(Cal) )
			Pos["NewY"] = Pos["Y"] + math.random( -Distance , Distance )
			Pos["Surface"] = GetHeight( Pos["NewX"] , Pos["NewY"] , Pos["NewZ"] )
			if Pos["NewY"] <= Pos["Surface"] then
				Pos["NewY"] = Pos["Surface"]
			end
		elseif Mobile == 4 then	-- �H�@���I���_�l�I�A���k�üƲ��ʡC
			Pos["Dir"] = math.random( 1 , 360 )
			local Cal = (math.pi/180)*Pos["Dir"]
			Pos["NewX"] = Pos["X"] +( Distance*math.cos(Cal) )
			Pos["NewZ"] = Pos["Z"] - ( Distance*math.sin(Cal) )
			Pos["NewY"] = Pos["Y"]
		end
		if Statue == 0 then
			Hao_WaitMoveTo( ObjID , Pos["NewX"] , Pos["NewY"] , Pos["NewZ"] )
			sleep(1)
			if Loop == 0 then
				break
			elseif Loop == 1 and Mobile < 3 then
				Hao_WaitMoveTo( ObjID , Pos["X"] , Pos["Y"] , Pos["Z"] )
			end
		--	DebugMsg( 0 , 0 , "Running" )
		end
	--	if Zone ~= 2 then
		--	Say( ObjID , "Running" )
		--	DebugMsg( 0 , 0 , "X = "..Pos["NewX"].." , Y = "..Pos["NewY"].." , Z = "..Pos["NewZ"] )
	--	end
		Sleep(1)
	end
end

-- �M�w��ܪ��A
function Hao_Germany_4th_Obj_Status( Obj , Room , Obstruct , RoleHead , Fight , Mark , ObjShow )
-- ����B�ҦbRoom�B���ת��A�B�Y���ءB�O�_�i����B�аO�B�O�_�����B���

	if Obstruct == nil then
		Obstruct = false
	end
	if RoleHead == nil then
		RoleHead = false
	end
	if Fight == nil then
		Fight = false
	end
	if Mark == nil then
		Mark = false
	end
	if ObjShow == nil then
		ObjShow = true
	end

	WriteRoleValue( Obj , EM_RoleValue_IsWalk , 1 )			-- ����
	SetModeEx( Obj , EM_SetModeType_Obstruct , Obstruct )		-- ����
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead , RoleHead )	-- �Y����
	SetModeEx( Obj , EM_SetModeType_Fight , Fight )		--�i�������
	SetModeEx( Obj , EM_SetModeType_Mark , Mark )		-- �аO
	SetModeEx( Obj , EM_SetModeType_Show , ObjShow )		-- ���
	SetModeEx( Obj , EM_SetModeType_Strikback , false )		-- ����
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore , false )	-- �Q�j�M
	SetModeEx( Obj , EM_SetModeType_Searchenemy , false )	-- ����
	SetModeEx( Obj , EM_SetModeType_NotShowHPMP , true )	-- ����ܦ��
	SetModeEx( Obj , EM_SetModeType_HideName , true )		-- ����ܦW��
	SetModeEx( Obj , EM_SetModeType_Gravity , false )		-- ���O
	MoveToFlagEnabled( Obj , false )				-- �������޼@��
	AddToPartition( Obj , Room )
end

function Hao_Check_Cancel_Buff_Distance( Npc , Range , Buff , Msg , Range2 , Msg2 )	-- �W�L�Z���Y�R�� Buff
	-- �����I��npc�B�ˬd�d��b�|�B�R��Buff�B���ܰT���r��B�ˬd�d��b�|2�B���ܰT���r��2�C
	local Player = OwnerID()
	if Npc == nil or Range == nil or Buff == nil then
		return
	end
	
	while true do
		local Distance = GetDistance( Player , Npc )
		if Range2 ~= nil then
			if CheckBuff( Player , Buff ) == true then		
				if Distance >= Range2 then
					if Msg2 ~= nil then
						if Type(Msg2) == "string" then
							ScriptMessage( Player , Player , 2 , Msg2 , C_SYSTEM )	-- ���ܪ��aMsg2
							ScriptMessage( Player , Player , 0 , Msg2 , C_SYSTEM )
						end
					end
				end
			end
		end
		Sleep(5)
		if Distance >= Range then
			if CheckBuff( Player , Buff ) == true then
				CancelBuff_NoEvent( Player , Buff )
				if Msg ~= nil then
					if Type(Msg) == "string" then
						ScriptMessage( Player , Player , 1 , Msg , C_SYSTEM )	-- ���ܪ��aMsg1(Buff�w����)
						ScriptMessage( Player , Player , 0 , Msg , C_SYSTEM )
					end
				end
			end
			break
		end
		Sleep(5)
	end
end

function Hao_DE_4th_Npc_121802_ClearNpc()	-- �R���Ҧ����ʬ��� Npc

	local Npc = {}
	Npc[1] = 121798	-- ����P�Ųy
	Npc[2] = 121799	-- ���P�Ųy
	Npc[3] = 121800	-- ����P�Ųy
	Npc[4] = 121801	-- �Ŧ�P�Ųy	
	Npc[5] = 121443	-- ���ʥ۪O	
	Npc[6] = 121807	-- ���ʦa�j
	Npc[7] = 121911	-- �w��4�P�~�y�P�Ū��Q��������
	Npc[8] = 121865	-- ���y
	Npc[9] = 107622	-- �Q�~
	Npc[10] = 121937	-- ����P�Ųy(Client�㹳�ϥ�)
	Npc[11] = 121938	-- �k�O��`��

	for i = 1 , #Npc , 1 do
		Lua_Hao_NPCofAll_Clear(Npc[i])
		sleep(1)
	end
end

function Hao_DE_4th_Npc_121802_Quest_Reset()	-- ���m���ʬ�������

	local Player = OwnerID()
	local Key = { 547508 , 547509 }	-- ���ȶi�椤�B���Ȥw����
	
	for i = 1 , #Key , 1 do
		SetFlag( Player , Key[i] , 0 )
	end
end

function Hao_DE_4th_Npc_121802_Set_Score(Score)	-- �]�m����

	local Player = OwnerID()
	local Buff = 624003		-- �P�иH��(�N�����)
	
	if Score == 0 then
		CancelBuff_NoEvent( Player , Buff )
	else
		AddBuff( Player , Buff , Score-1 , -1 )
	end
end

function Hao_DE_4th_Npc_121802_Set_Ticket(Sec)	-- �]�m���ʪ������

	local Player = OwnerID()
	local Buff = 624006
	AddBuff( Player , Buff , 0 , Sec )
end
------------------------------------------------�H�U�����������ϥΡA�B�s��n�����禡------------------------------------------------
-- �H�U���۪O���ʼ@�� -- 
function Hao_Germany_4th_Slate_Cast_Check(Choise)	-- �������I�k���ˬd	�����������B1��������

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Npc = DE_4th_121802_StarBall[Room][0]	-- Ū��Npc
	local Offside = GetDistance( Player , Npc )	-- Npc�P�۪O���Z��
	local Distance = 20	-- �۪O�󪱮a�e��h�ֶZ���إ�
	local Height = 5	-- �۪O�󪱮a�e��h�ְ��׫إ�
	local X , Y , Z , Dir = Lua_Hao_Return_Coordinate(Player)	-- �����a��e���y��
	local Cal = (math.pi/180)*(Dir)
	local Pos = {}	-- �۪O�إߪ���m
		Pos["X"] = X +( Distance*math.cos(Cal) )	-- �إߥ۪O�� X
		Pos["Z"] = Z - ( Distance*math.sin(Cal) )	-- �إߥ۪O�� Z
		Pos["Y"] = Y + Height			-- �إߥ۪O�� Y
		Pos["Surface"] = Y - GetHeight( X , Y , Z )	-- ���a�Z���a���Z��

	if Choise == 0 and Pos["Surface"] >= 175 then	-- �Z���a��175�H�U�~�i�H�ϥ�
		DebugMsg( Player , Room , "Surface = "..Pos["Surface"].." You can't use this skill that surface >= 175" )
		return false
	elseif Choise == 1 and Pos["Surface"] < 20 then	-- �Z���a��20�H�W�~�i�H�ϥ�
		DebugMsg( Player , Room , "Surface = "..Pos["Surface"].." You can't use this skill that surface < 20" )
		return false
	elseif Offside >= 200 then
		DebugMsg( Player , Room , "Offside = "..Offside.." You're out of range!" )
		return false		
	end
	return true
end

function Hao_Germany_4th_Slate(Choise)	-- �w��|�g�~�y���� Choise = 0 �ɡA���W���ʡA

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Slate = 121443	-- �۪O����
	local Distance = 20	-- �۪O�󪱮a�e��h�ֶZ���إ�
	local Height = 5	-- �۪O�󪱮a�e��h�ְ��׫إ�
	local X , Y , Z , Dir = Lua_Hao_Return_Coordinate(Player)	-- �����a��e���y��
	local Cal = (math.pi/180)*(Dir)
	local Pos = {}	-- �۪O�إߪ���m
		Pos["X"] = X +( Distance*math.cos(Cal) )	-- �إߥ۪O�� X
		Pos["Z"] = Z - ( Distance*math.sin(Cal) )	-- �إߥ۪O�� Z
		Pos["Y"] = Y + Height			-- �إߥ۪O�� Y
		Pos["Surface"] = Y - GetHeight( X , Y , Z )	-- ���a�Z���a���Z��

	local ObjID = CreateObj( Slate , Pos["X"] , Pos["Y"] , Pos["Z"] , Dir , 1 )	-- �إߥ۪O
	Hao_Germany_4th_Obj_Status( ObjID , Room , true )
	CallPlot( ObjID , "Hao_Germany_4th_Slate_Direct_1" , ObjID , Player , Room , Choise )
	-- �ǤJ�۪O�B���a�B�h�ơB��ܥ۪O�V�W�Ω���e���V����
end

function Hao_Germany_4th_Slate_Direct_1( ObjID , Player , Room , Choise )	-- ���۪O���沾�ʪ��@��
	-- �۪O�B���a�B�h�ơB��ܥ۪O�V�W�Ω���e���V����
	local Pos = {}
	local Removing	-- �۪O���ʪ��Z��
	local X , Y , Z , Dir = Lua_Hao_Return_Coordinate(ObjID)	-- �������e���y��
	local Cal = (math.pi/180)*(Dir)

	if Choise == 0 then 	-- ���۪O���W����
		Removing = 35	-- �۪O���ʪ��Z��
		Pos["X"] = X
		Pos["Y"] = Y + Removing
		Pos["Z"] = Z
		Sleep(30)	-- ���a���d�T���~����첾
		CallPlot( ObjID , "Hao_Germany_4th_Slate_Direct_2" , ObjID , Player , Room )	-- �P�_���a�O�_�Z���۪O�ӻ�		
		while true do	-- �۪O���W�ɡA���ʪ��I
			Hao_WaitMoveTo( ObjID , Pos["X"] , Pos["Y"] , Pos["Z"] )
			Hao_WaitMoveTo( ObjID , X , Y , Z )
		end
	elseif Choise == 1 then	-- ���۪O����e���V����
		Removing = 125	-- �۪O���ʪ��Z��
		Pos["X"] = X +( Removing*math.cos(Cal) )
		Pos["Y"] = Y
		Pos["Z"] = Z - ( Removing*math.sin(Cal) )
		Sleep(30)	-- ���a���d�T���~����첾
		CallPlot( ObjID , "Hao_Germany_4th_Slate_Direct_2" , ObjID , Player , Room )	-- �P�_���a�O�_�Z���۪O�ӻ�
		Hao_WaitMoveTo( ObjID , Pos["X"] , Pos["Y"] , Pos["Z"] )				-- �I�s���󲾰ʦܫ��w�I
	end
end

function Hao_Germany_4th_Slate_Direct_2( ObjID , Player , Room )	-- �۪O���d�T���A���檺�@��

	local Count = 0
	local Npc = DE_4th_121802_StarBall[Room][0]
	
	while true do
		local Distance = GetDistance( ObjID , Player )	-- ���a�P�۪O���Z��
		local Offside = GetDistance( ObjID , Npc )	-- Npc�P�۪O���Z��
		local Pos = {}
		Pos["ObjID_Y"] = ReadRoleValueFloat( Player , EM_RoleValue_Y )	-- ���۪O��e���y��
		Pos["Player_Y"] = ReadRoleValueFloat( Player , EM_RoleValue_Y )	-- �����a��e���y��
		Pos["Y"] = Pos["Player_Y"] - Pos["ObjID_Y"]
	--	DebugMsg( Player , Room , "Offside = "..Offside )
		if Pos["Y"] <= -4 or Pos["Y"] >= 15 or Distance >= 12 or Count >= 100 or Offside >= 175 then	-- ���a�C��۪O�B����۪O�B�P�۪O�Z���L���B�۳�ɶ� >= 10 ��᳣�|�R���۪O
			DebugMsg( Player , Room , "Del Obj" )
			DelObj( ObjID )
		elseif Offside >= 150 then
			DebugMsg( Player , Room , "Warning You're out of range!" )		
		end
		Sleep(1)
		Count = Count + 1
	end
end

function Hao_Germany_4th_20130129_2( Slate , Mobile , Distance )	-- ���w���x���_���e��B���k����
	-- ���x�����B���ʤ覡�B�Z��
	local Pos = {}
	Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"] = Lua_Hao_Return_Coordinate(Slate) -- ��Npc��e�y��
	local Cal = (math.pi/180)*Pos["Dir"]
	Pos["NewX"] = {}
	Pos["NewZ"] = {}
	if Mobile == 0 then	-- �e��첾
		Pos["NewX"][1] = Pos["X"] +( Distance*math.cos(Cal) )
		Pos["NewX"][2] = Pos["X"] +( -Distance*math.cos(Cal) )
		 Pos["NewZ"][1]= Pos["Z"] - ( Distance*math.sin(Cal) )
		 Pos["NewZ"][2]= Pos["Z"] - ( -Distance*math.sin(Cal) )
	elseif Mobile == 1 then	-- ���k�첾
		Pos["NewX"][1] = Pos["X"] -( Distance*math.cos(Cal) )
		Pos["NewX"][2] = Pos["X"] -( -Distance*math.cos(Cal) )
		 Pos["NewZ"][1]= Pos["Z"] + ( Distance*math.sin(Cal) )
		 Pos["NewZ"][2]= Pos["Z"] + ( -Distance*math.sin(Cal) )	
	end
	
	while true do
		Hao_WaitMoveTo( Slate , Pos["NewX"][1] , Pos["Y"] , Pos["NewZ"][1] )
		Sleep(1)
		Hao_WaitMoveTo( Slate , Pos["NewX"][2] , Pos["Y"] , Pos["NewZ"][2] )
	end
end

-- ����P�Ųy
function Hao_Germany_4th_StarBall_Plot( SkyBall , ObjID , BallID )
	-- �y����B���ê���

	local BallList = {}
	BallList[1] = 121799 	-- ��y
	BallList[2] = 121800	-- ���y
	BallList[3] = 121801  	-- �Ųy	

	local Select = math.random(4)		-- �e��B�W�U�B��VLoop�B�ꫬ��¶����
	local Distance =math.random( 15 , 75 )	-- ���ʪ��Z��
	local Height = math.random( 15 , 50 )	-- ���ʪ�����(�e��B��VLoop�B�����¶�S�����C�t)
	local Dir = math.random( 0 , 359 )	-- ���ʤ�V
	local Pos = {}
		Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"] = {} , {} , {} , {}
		Pos["X"][0] , Pos["Y"][0] , Pos["Z"][0] , Pos["Dir"][0] = Lua_Hao_Return_Coordinate(SkyBall) -- ���y��e�y��
	local Cal = (math.pi/180)*(Dir)

	if Select == 1 then	-- �e��
		Pos["X"][1] = Pos["X"][0] +( Distance*math.cos(Cal) )
		Pos["Z"][1] = Pos["Z"][0] - ( Distance*math.sin(Cal) )
		Pos["Y"][1] = Pos["Y"][0]
	elseif Select == 2 then	-- �W�U
		Pos["X"][1] = Pos["X"][0]
		Pos["Z"][1] = Pos["Z"][0]
		Pos["Y"][1] = Pos["Y"][0] + Height
	elseif Select == 4 then	-- �ꫬ��¶
		for Count = 1 , 18 , 1 do	-- �Φh�䫬�N���
			Pos["X"][Count] = Pos["X"][0]-Distance*math.cos(math.pi*2*(Count/18))
			Pos["Y"][Count] = Pos["Y"][0]
			Pos["Z"][Count] = Pos["Z"][0]+Distance*math.sin(math.pi*2*(Count/18))
		end
	end

	while true do
		if Select == 3 then	-- �C���q���I�ܤ@�H���I�A�M��A�ǰe�^���I��A�ܤ@�H���I�`��
			Dir = math.random( 0 , 359 )	-- ���ʤ�V
			Cal = (math.pi/180)*(Dir)		
			Pos["X"][1] = Pos["X"][0] +( Distance*math.cos(Cal) )
			Pos["Z"][1] = Pos["Z"][0] - ( Distance*math.sin(Cal) )
			Pos["Y"][1] = Pos["Y"][0] + Height
		end
		for i = 1 , #Pos["X"] , 1 do
			Hao_WaitMoveTo( SkyBall , Pos["X"][i] , Pos["Y"][i] , Pos["Z"][i] )
		end
		sleep(1)
		if Select == 3 then
			SetPos( SkyBall , Pos["X"][0] , Pos["Y"][0] , Pos["Z"][0] , Pos["Dir"][0] )
		elseif Select <= 3 then  
			Hao_WaitMoveTo( SkyBall , Pos["X"][0] , Pos["Y"][0] , Pos["Z"][0] )
		end
		sleep(1)
	end
end

-- SC_WEAVE_TAILOR_01 �����ʦr��

-- 2012 ��´�`���� �]�k���_�v ��l���������� magical tailor
function lua_mika_weave_ctrl1()
	local OID = OwnerID()
	local ZoneID = ReadRoleValue( OID , EM_RoleValue_ZoneID ) --Ū�����ê��������Zone
	local NPC = LuaFunc_SearchNPCbyOrgID( OID , 120888 , 100 , 0 ) --�H���ê��󬰤��ߡA�V�P��N�X�j�M�S�wIDNPC

	AddBuff(  OID,  503217, 1, -1) 
	while true do
		sleep(600)  -- �@�����]�@��
		local Hour = GetSystime(1) --���o�{�b�ɶ��G��
		local Min = GetSystime(2) --���o�{�b�ɶ��G��
		local RR = ReadRoleValue(OID, EM_RoleValue_Register2 )  -- ���եγ��W�}��
	--	Say(OID, "now time is "..Hour..":"..min )

		if ZoneID < 1000 then --(���y1�G2�B���y2�G1002�B���y3�G2002�A�YZoneID�j��1000�h�����y)
			---- �s���ɶ� 
			if  RR == 100  then  
			--	Say(OID, "100" )
				-- ���ʶ}�l, ���W��npc���� , ���ͬ��ʪ�t�� npc
				WriteRoleValue( OID , EM_RoleValue_PID , 0 ) --��NPC��PID�ȼg��"0"�A�����}����W
				WriteRoleValue( OID , EM_RoleValue_Register2 , 0 ) -- �NNPC R2 ��^ 0
				local R1 = ReadRoleValue(OID, EM_RoleValue_Register) -- npc R1 �Ω�P�_�������w���W�H��
			--	say(OID, "PlayerNum ="..R1 )
				if R1 > 0 then
					if R1 <= 5 then
						NPCSAY(OID, "[SC_WEAVE_TAILOR_09]")  
					elseif R1 >= 6 and R1 <= 10 then
						NPCSAY(OID, "[SC_WEAVE_TAILOR_10]")  			
					end					
					BeginPlot(OID,"lua_mika_weave_start",0)  -- �ͬ��ʬ�������
				else
					NPCSAY(OID, "[SC_WEAVE_TAILOR_08]")
				end
			---- ���W�ɬq
			elseif RR == 99 then  
			--	Say(OID, "99" )
				NPCSAY(OID, "test - event will begin , please join me !" )
				if ReadRoleValue(OID, EM_RoleValue_PID )  ~= 1 then
					WriteRoleValue( OID , EM_RoleValue_PID , 1 ) --��NPC��PID�ȼg��"1"�A���NPC�}����W
					WriteRoleValue( OID , EM_RoleValue_Register , 0 ) --��NPC��R���k�s
				end
			elseif ( Hour == 7 ) or ( Hour == 15 ) or ( Hour == 19 ) or ( Hour == 22 )  then 
				if min == 10 then
					RunningMsgEx( OID , 2 , 3 , "[SC_WEAVE_TAILOR_01]" ) 
				elseif  min == 20 then  
					NPCSAY(OID, "[SC_WEAVE_TAILOR_27]" )
					if ReadRoleValue(OID, EM_RoleValue_PID )  ~= 1 then
						WriteRoleValue( OID , EM_RoleValue_PID , 1 ) --��NPC��PID�ȼg��"1"�A���NPC�}����W
						WriteRoleValue( OID , EM_RoleValue_Register , 0 ) --��NPC��R���k�s
					end
				elseif  min == 25 or min == 28 then  
					NPCSAY(OID, "[SC_WEAVE_TAILOR_28]" )
					-- �A�L�X�����N�n�}�l�F�A���N�@���_�I�̽в{�b�ӧ�ڳ��W�a�I
				elseif min == 30 then
					-- ���ʶ}�l, ���W��npc���� , ���ͬ��ʪ�t�� npc
					WriteRoleValue( OID , EM_RoleValue_PID , 0 ) --��NPC��PID�ȼg��"0"�A�����}����W
					WriteRoleValue( OID , EM_RoleValue_Register2 , 0 ) -- �NNPC R2 ��^ 0
					local R1 = ReadRoleValue(OID, EM_RoleValue_Register) -- npc R1 �Ω�P�_�������w���W�H��
				--	say(OID, "PlayerNum ="..R1 )
					if R1 > 0 then
						if R1 <= 5 then
							NPCSAY(OID, "[SC_WEAVE_TAILOR_09]")  
						elseif R1 >= 6 and R1 <= 10 then
							NPCSAY(OID, "[SC_WEAVE_TAILOR_10]")  			
						end					
						BeginPlot(OID,"lua_mika_weave_start",0)  -- �ͬ��ʬ�������
					else
						NPCSAY(OID, "[SC_WEAVE_TAILOR_08]")
					end
				end

			elseif  (( Hour >= 8 ) and  ( Hour <=23 )) then 
				if  min == 20 then  
					NPCSAY(OID, "[SC_WEAVE_TAILOR_27]" )
					if ReadRoleValue(OID, EM_RoleValue_PID )  ~= 1 then
						WriteRoleValue( OID , EM_RoleValue_PID , 1 ) --��NPC��PID�ȼg��"1"�A���NPC�}����W
						WriteRoleValue( OID , EM_RoleValue_Register , 0 ) --��NPC��R���k�s
					end
				elseif  min == 25 or min == 28 then  
					NPCSAY(OID, "[SC_WEAVE_TAILOR_28]" )
					-- �A�L�X�����N�n�}�l�F�A���N�@���_�I�̽в{�b�ӧ�ڳ��W�a�I
				elseif min == 30 then
					-- ���ʶ}�l, ���W��npc���� , ���ͬ��ʪ�t�� npc
					WriteRoleValue( OID , EM_RoleValue_PID , 0 ) --��NPC��PID�ȼg��"0"�A�����}����W
					WriteRoleValue( OID , EM_RoleValue_Register2 , 0 ) -- �NNPC R2 ��^ 0
					local R1 = ReadRoleValue(OID, EM_RoleValue_Register) -- npc R1 �Ω�P�_�������w���W�H��
				--	say(OID, "PlayerNum ="..R1 )
					if R1 > 0 then
						if R1 <= 5 then
							NPCSAY(OID, "[SC_WEAVE_TAILOR_09]")  
						elseif R1 >= 6 and R1 <= 10 then
							NPCSAY(OID, "[SC_WEAVE_TAILOR_10]")  			
						end					
						BeginPlot(OID,"lua_mika_weave_start",0)  -- �ͬ��ʬ�������
					else
						NPCSAY(OID, "[SC_WEAVE_TAILOR_08]")
					end
				end
			end
		end
	end
end

-- ���ͬ��� ����npc  �������a����buff ����
function lua_mika_weave_start()
	local OID = OwnerID()  -- ����NPC
	local R1 = ReadRoleValue(OID, EM_RoleValue_Register) -- npc R1 �Ω�P�_�������w���W�H��
	local range = 160 -- ���ʥb�|�d��
	local npcrange = 300 -- �R���P��Ǫ���range
	
	-- �R���P��T�P��
	local npc = SearchRangeNPC(OID, npcrange )
	for i = 0 , table.getn(npc)-1  do 	-- �j�M�d�򤺪��a
		local Orgid = ReadRoleValue(NPC[i], EM_RoleValue_OrgID )
		if Orgid == 100212 or  Orgid == 100211 then
			SetModeEx( npc[i], EM_SetModeType_Show, false )--���
			SetModeEx( npc[i], EM_SetModeType_Mark, false )--�аO
			SetModeEx( npc[i], EM_SetModeType_Searchenemy, false )--����
			SetModeEx( npc[i], EM_SetModeType_Fight , false )--�i�������
			Beginplot(npc[i], "lua_mika_weave_npcshow" , 0 )
		end
	end

	-- �����ʪ��a����buff ��
	local Player = SearchRangePlayer( OID , range ) --�j�M�P��160���a
	for i = 0 , table.getn(Player)-1  do 	-- �j�M�d�򤺪��a
	--	say(Player[i], "player-"..i)
		if CheckBuff(Player[i], 623044) == true then  -- �]�O���u ���W�ҩ�buff
			Setflag(Player[i], 546863, 1 )  -- ����Ѱѥ[key 
			AddBuff(Player[i], 623041, 0, 190 )  -- ���ʧޯ�buff
			CancelBuff(Player[i], 623044 )  -- �R�����W�ҩ� buff
			Beginplot(Player[i], "lua_mika_weave_rangecheck" , 0 )
		end
	end

	-- �����]�k�} ��t��
	local magicroll = CreateObjByFlag(120887 , 781158, 0 ,1) --�ϥκX�l����npc 
	SetModeEx( magicroll, EM_SetModeType_Show, true )--���
	SetModeEx( magicroll, EM_SetModeType_Mark, false )--�аO
	SetModeEx( magicroll, EM_SetModeType_Strikback, false )--����
	SetModeEx( magicroll, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( magicroll, EM_SetModeType_Obstruct, false )--����
	SetModeEx( magicroll, EM_SetModeType_Move, false )--����
	SetModeEx( magicroll, EM_SetModeType_Searchenemy, false )--����
	SetModeEx( magicroll, EM_SetModeType_HideName, false )--�W��
	SetModeEx( magicroll, EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( magicroll, EM_SetModeType_Fight , false )--�i�������
	SetModeEx( magicroll, EM_SetModeType_Drag , false )--���O
	AddToPartition( magicroll, 0 )	--�����󲣥�
--	say(magicroll, "magicroll born")

	-- ���ͥͲy�������ê��� BOX
	local Box = CreateObjByFlag(121058 , 781158, 0 ,1) --�ϥκX�l����npc 
	SetModeEx( Box, EM_SetModeType_Mark, false )--�аO  ------------false
	SetModeEx( Box, EM_SetModeType_Show, false )--��� ------------false
	SetModeEx( Box, EM_SetModeType_Strikback, false )--����
	SetModeEx( Box, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Box, EM_SetModeType_Obstruct, false )--����
	SetModeEx( Box, EM_SetModeType_Move, false )--����
	SetModeEx( Box, EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Box, EM_SetModeType_HideName, false )--�W��
	SetModeEx( Box, EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Box, EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Box, EM_SetModeType_Drag , false )--���O
	AddToPartition( Box, 0 )	--�����󲣥�
--	Say(Box , "hidebox born.")
--	Callplot( Box, "lua_mika_weave_ctrl2", R1  ) -- �N�ثe���a���W�H�ƥN�J���禡

	SetModeEx( OID , EM_SetModeType_Show , False ) --���
	SetModeEx( OID, EM_SetModeType_Mark, False )--�аO

	-- ���ͬ��ʥΪ�tnpc
	local Tailor = CreateObjByFlag(120889 , 781158, 0 ,1) --�ϥκX�l����npc 
	SetModeEx( Tailor, EM_SetModeType_Mark, true )--�аO
	SetModeEx( Tailor, EM_SetModeType_Show, true )--���
	SetModeEx( Tailor, EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( Tailor, EM_SetModeType_HideName, true )--�W��
	SetModeEx( Tailor, EM_SetModeType_Strikback, false )--����
	SetModeEx( Tailor, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Tailor, EM_SetModeType_Obstruct, false )--����
	SetModeEx( Tailor, EM_SetModeType_Move, false )--����
	SetModeEx( Tailor, EM_SetModeType_Searchenemy, false )--����

	SetModeEx( Tailor, EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Tailor, EM_SetModeType_Drag , false )--���O
	AddToPartition( Tailor, 0 )	--�����󲣥�
	Callplot( Box, "lua_mika_weave_ctrl2", R1 , Tailor  ) -- �N�ثe���a���W�H�ƥN�J���禡
	BeginPlot(Tailor,"lua_mika_weave_actor",0)  -- ��tNPC �����@��

end

function lua_mika_weave_npcshow()
	local OID = OwnerID()
	sleep(1800)   --3����
--	say(OID, "SHOW" )
	SetModeEx( OID, EM_SetModeType_Show, true )--���
	SetModeEx( OID, EM_SetModeType_Mark, true )--�аO
	SetModeEx( OID, EM_SetModeType_Searchenemy, true )--����
	SetModeEx( OID, EM_SetModeType_Fight , true )--�i�������
end


-- ���ʶ}�l�ɦb���a���W����
function lua_mika_weave_rangecheck()
	local OID = OwnerID()
	local timer = 0
	while true do 
		sleep(10)
		timer = timer +1
		if timer == 181 then 
			break
		else
			local NPC = LuaFunc_SearchNPCbyOrgID( OID , 120889 , 350 , 0 ) --�H���󬰤��ߡA�V�P��N�X�j�M�S�wIDNPC
			local dis = GetDistance(OID, NPC ) 
			if dis >= 180 then
				ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_24]" , 0 )   --�A���}�F���ʰϰ�A�w���h���ʸ��C
				ScriptMessage( OID , OID , 0 , "[SC_WEAVE_TAILOR_24]" , 0 )   --�A���}�F���ʰϰ�A�w���h���ʸ��C
				CancelBuff(OID , 623041 )  -- Del ���ʧޯ�buff
				CancelBuff(OID , 623045 )  -- Del ���ʤ���buff
				break
			elseif dis >= 166 then
				ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_23]" , 0 )   --�`�N�I�A�Y�N���}���ʰϰ�A�Y���}���ʰϰ�N�|���h���ʸ��I
				ScriptMessage( OID , OID , 0 , "[SC_WEAVE_TAILOR_23]" , 0 )   
			end
		end
	end
end

----------------------------------------  ���ʤ������ê���]���@���ҪO
function lua_mika_weave_ctrl2(R1 , Tailor)
	local FlagObjID = 781174 --�X�m����s�� 
	local FlagNum = GetMoveFlagCount( FlagObjID ) --�X�m�ƶq
	local ObjNum =  R1*3   -- ���a�ƶq��*3
	local resetTime =  6
	local Range = 5 --�üƽd��

	lua_mika_weave_ballctrl( FlagObjID, FlagNum, ObjNum, resetTime, Range , Tailor ) 
end

-- ���ʤ������ê���@���ҪO�禡
function lua_mika_weave_ballctrl( FlagObjID, FlagNum, ObjNum, resetTime, Range , Tailor )
	--FlagObjID �X�m����s��
	--FlagNum �X�m�ƶq	
	--ObjNum �شӪ���ƶq	
	--resetTime ���s�ɶ�(��)
	--Range �ͩǽd��
	local ctrl = OwnerID() --��������
	local RoomID = ReadRoleValue( ctrl, EM_RoleValue_RoomID ) --�ϰ�s��
	if lua_mika_weave_Global == nil then
		lua_mika_weave_Global = {}
	end
	lua_mika_weave_Global["create"] = {}
	lua_mika_weave_Global["flag"] = {}
	local create = lua_mika_weave_Global["create"]
	local flag = lua_mika_weave_Global["flag"]
	local num
	local random
	local objID
	local count = 0
	local x
	local y
	local z

	if ObjNum > FlagNum then
		ObjNum  = FlagNum 
	end
		
	--debugmsg( 0, 0, "counter = "..counter )
	for i=0, FlagNum do
		flag[i] = 0 
	end
	
	while true do
		--count = ReadRoleValue( ctrl, EM_RoleValue_Register1 )
--		DebugMsg(0,0,"Sheep Count = "..count )
		--DebugMsg(0,0,"#create = "..#create )
		if #create < ObjNum then
			for i=#create, ObjNum-1 do
				Sleep(1)
				random  = math.random(#flag);
				--DebugMsg(0,0,"Temp random = "..random )
				for i,v in ipairs(flag) do
					if ((v < flag[random] or create[random]~=nil ) and create[i]==nil )then
						random = i;
						--DebugMsg(0,0,"random Change to "..random )
					end
				end
				flag[random] = flag[random] + 1 --�X�L�@���O��
--				random = RandRange(0, 29)  
--				if  create[random ] > 1 then
--					while true do
--						sleep(1)
--						random = ks_CreateObjSearch( create, FlagNum, 0 )
--						if random ~= nil then break	 end
--						random = RandRange(0, 29)  
--						if  create[ random ] > 1 then break end
--					end
--				end
				--DebugMsg(0,0,"Real random = "..random )
				if random ~= nil then 
					x = GetMoveFlagValue( FlagObjID, random-1 , EM_RoleValue_X ) 
					y = GetMoveFlagValue( FlagObjID, random-1 , EM_RoleValue_Y ) 
					z = GetMoveFlagValue( FlagObjID, random-1 , EM_RoleValue_Z ) 	
						
					-- �M�w�n���ͪ���id
					local RR = math.random(100)
					local rate = {32, 32, 32 , 4 }
					local Objlist = { 103013, 103014, 103015, 106548  }
						 if RR > (100 - rate[1] ) then   -- 69 -  100
							objID = Objlist[1]
						elseif RR > (100 - rate[1] - rate[2] ) then   -- 36 -  68
							objID = Objlist[2]
						elseif RR > (100 - rate[1] - rate[2] - rate[3] ) then  --  5 - 35
							objID = Objlist[3]
						else
							objID = Objlist[4]
						end

				--	say(OwnerID(), "objID ="..objID )
					create[random] = CreateObj( objID, x, y, z, rand(360), 1 )
					SetModeEx( create[random], EM_SetModeType_Mark, true )--�аO
					SetModeEx( create[random], EM_SetModeType_Show, true )--���
					SetModeEx( create[random], EM_SetModeType_Move, true )--����
					SetModeEx( create[random], EM_SetModeType_ShowRoleHead, true )--�Y����
					SetModeEx( create[random], EM_SetModeType_HideName, true )--�W��
					SetModeEx( create[random], EM_SetModeType_Strikback, true )--����
					SetModeEx( create[random], EM_SetModeType_SearchenemyIgnore, true )--�Q�j�M
					SetModeEx( create[random], EM_SetModeType_Obstruct, false )--����
					SetModeEx( create[random], EM_SetModeType_Searchenemy, true )--����
					SetModeEx( create[random], EM_SetModeType_Fight , false )--�i�������
					SetModeEx( create[random], EM_SetModeType_Drag , false )--���O
					MoveToFlagEnabled( create[random], false ); 
					WriteRoleValue( create[random]  ,EM_RoleValue_IsWalk , 1  )--�ζ]��
					--WriteRoleValue( create[random], EM_RoleValue_Register1, ctrl )
					WriteRoleValue( create[random], EM_RoleValue_Register1, random )
					local bufflv = rand(2)
					AddBuff( create[random], 623205, bufflv, -1 )  -- speed up  ( 0 ~ 2 )
					ReCalculate( create[random] ) 
					AddToPartition( create[random], RoomID )

					--say(create[random], "ID = "..objid.." , flagid = "..random )

					CallPlot( create[random], "lua_mika_weave_ballmove", Tailor )  --  �y�����󲾰ʼ@��
					--AddRoleValue( ctrl, EM_RoleValue_Register1, 1 )
					Sleep(1)					
				end
				--count = ReadRoleValue( ctrl, EM_RoleValue_Register1 )
			end
		end
			
--		for i=1, resetTime do
--			local ResetFlag = ReadRoleValue( ctrl, EM_RoleValue_Register2 )
--			if ResetFlag ~= 0 then
--				DebugMsg(0,0,"ResetFlag ="..ResetFlag)
--				create[ResetFlag] = 0
--				WriteRoleValue( ctrl, EM_RoleValue_Register2, 0 )
--			end
		--DebugMsg(0,0,"Begin Sleep")
		sleep(resetTime*10)
		--DebugMsg(0,0,"End Sleep")
--		end
	end
end


function lua_mika_weave_ballreset( Obj )--Delete (�O�_�R��); Obj (��H)
	Obj = Obj or OwnerID()
--	local ctrl = ReadRoleValue( Obj, EM_RoleValue_Register1 )
	local random = ReadRoleValue( Obj, EM_RoleValue_Register1 )
--	AddRoleValue( ctrl, EM_RoleValue_Register1, -1 )--count-1
--	WriteRoleValue( ctrl, EM_RoleValue_Register2, Flag )--FlagClear
--	DebugMsg(0,0,"Flag "..Flag.."; Ctrl = "..Ctrl )
	local create = lua_mika_weave_Global["create"]
	local flag = lua_mika_weave_Global["flag"]
	create[random] = nil
	Sleep(1)
	DelObj( Obj )
end

------------------------------------------------- 

function lua_mika_weave_ballmove(Tailor)
	local OID = OwnerID()
	local flag = 781158 -- balls flag
	local timer = 0
	local orgid = ReadRoleValue(OID, EM_RoleValue_OrgID )
	local ballid = {103013, 103014, 103015, 106548}
	local range = 200
	local scorebuff = 622433  -- ���������q
--	local Tailor = LuaFunc_SearchNPCbyOrgID( OID , 120889 , range , 0 ) --�H���󬰤��ߡA�V�P��N�X�j�M�S�wIDNPC
	local X , Y , Z = ReadRoleValue( Tailor , EM_RoleValue_X ) , ReadRoleValue( Tailor , EM_RoleValue_Y ) , ReadRoleValue( Tailor , EM_RoleValue_Z )
	local dis , Colormode

	MoveDirect( OID , X , Y , Z )
	while true do 
		dis = GetDistance( OID , Tailor ) 
	--	say(OID, "DIS ="..dis )
		if dis < 1 then
	--		say(OID, "DIS OK")
			Colormode = ReadRoleValue(Tailor, EM_RoleValue_PID )  -- colormode = PID ,  1 = �� , 2 = �� ,  3 = ��
			if Colormode == 1 then
				if ( orgid == ballid[2] ) or  ( orgid == ballid[3] ) then 
					Playmotion(Tailor, 18 )
					CastSpell(OID, Tailor, 850342 ) -- �����S��
					Addbuff(Tailor, 622432, 0, 15 )  -- ��tailor �Q������buff 10 sec
				elseif orgid == ballid[4] then
					CastSpell(OID, Tailor, 850342 ) -- �����S��
					Addbuff(Tailor, 622432, 1, 20 )  -- ��tailor �Q������buff 10 sec
					Playmotion(Tailor, 18 )
				end
			elseif Colormode == 2 then
				if ( orgid == ballid[1] ) or  ( orgid == ballid[3] ) then 
					CastSpell(OID, Tailor, 850342 ) -- �����S��
					Addbuff(Tailor, 622432, 0, 15 )  -- ��tailor �Q������buff 10 sec
					Playmotion(Tailor, 18 )
				elseif orgid == ballid[4] then
					CastSpell(OID, Tailor, 850342 ) -- �����S��
					Addbuff(Tailor, 622432, 1, 20 )  -- ��tailor �Q������buff 10 sec
					Playmotion(Tailor, 18 )
				end
			elseif Colormode == 3 then
				if ( orgid == ballid[1] ) or  ( orgid == ballid[2] ) then 
					CastSpell(OID, Tailor, 850342 ) -- �����S��
					Addbuff(Tailor, 622432, 0, 15 )  -- ��tailor �Q������buff 10 sec
					Playmotion(Tailor, 18 )
				elseif orgid == ballid[4] then
					CastSpell(OID, Tailor, 850342 ) -- �����S��
					Addbuff(Tailor, 622432, 1, 20 )  -- ��tailor �Q������buff 10 sec
					Playmotion(Tailor, 18 )
				end
			end
			lua_mika_weave_ballreset( OID )   -- ���m���y��m�çR��
		end
		sleep(1)
	end

end

-- 120889 ���ʥΪ�tnpc .  ���P������
---- EM_RoleValue_PID   -- colormode = PID ,  1 = �� , 2 = �� ,  3 = ��

function lua_mika_weave_actor()
	local OID = OwnerID()  -- actor 
	local timer = 0
	local R1 = RandRange(  31 , 35 )  --  ���C��+ �H�H���ɶ�
	local R2 = 18  -- NPC�I�k
	local buffid = 622432  -- npc�s��Q��������
	local buffid2 = 622433  -- ���������q
	local speak = { "[SC_WEAVE_TAILOR_02]" , "[SC_WEAVE_TAILOR_03]" , "[SC_WEAVE_TAILOR_04]" }
	local range = 160 -- ���ʥb�|�d��

	-- �����]�k���n �w�]�O�H����
	local shieldlist = {121055, 121056, 121057}
	local bornrandom = Rand(2)+1 -- 1 ~ 3 
	WriteRoleValue(OID, EM_RoleValue_PID , bornrandom )  -- Colormode 
	local Colormode = ReadRoleValue(OID,EM_RoleValue_PID )
--	Say(OID, "Colormode ="..Colormode )
	local shield = CreateObjByFlag( shieldlist[bornrandom] , 781158, 0 ,1) --�ϥκX�l����npc 
	SetModeEx( shield, EM_SetModeType_Obstruct, false )--���� ----- ����i��n��true
	SetModeEx( shield, EM_SetModeType_Show, true )--���
	SetModeEx( shield, EM_SetModeType_Mark, false )--�аO
	SetModeEx( shield, EM_SetModeType_Strikback, false )--����
	SetModeEx( shield, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( shield, EM_SetModeType_Drag , false )--���O 
	SetModeEx( shield, EM_SetModeType_Move, false )--����
	SetModeEx( shield, EM_SetModeType_Searchenemy, false )--����
	SetModeEx( shield, EM_SetModeType_HideName, false )--�W��
	SetModeEx( shield, EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( shield, EM_SetModeType_Fight , false )--�i�������
	AddToPartition( shield, 0 )	--�����󲣥�
--	say(shield, "shield born")


	while true do
		sleep(10)
		timer = timer + 1
	--	say(OID, timer )
		local npcscore = FN_CountBuffLevel(OID, buffid2 )  -- NPC���W���������q
		local Colormode = ReadRoleValue(OID, EM_RoleValue_PID )  -- colormode = PID ,  1 = �� , 2 = �� ,  3 = ��

		if timer == 180 then  -- ��������
			NPCSAY(OID, "[SC_WEAVE_TAILOR_07]" )  -- ��������o��a�A���W�A�F�I

			-- ����
			local Player = SearchRangePlayer( OID , range ) --�j�M�P��160���a
			for i = 0 , table.getn(Player)-1 do 	-- �j�M�d�򤺦�����skill�����a, ���N����
				if CheckBuff(Player[i], 623041) == true then
					 ------- �����a�ӤH���ƪ����y ------
					if CheckBuff(Player[i], 623045 ) == false then
						local socre = 0
						ScriptMessage( Player[i] , Player[i] , 1 , "[SC_WEAVE_TAILOR_29][$SETVAR1="..socre.."]" , C_SYSTEM )  --   ���ʵ����A�A��[623045]��[$VAR1]���C
						ScriptMessage( Player[i] , Player[i] , 0 , "[SC_WEAVE_TAILOR_29][$SETVAR1="..socre.."]"  , C_SYSTEM  )
					else
						local playerscore = FN_CountBuffLevel(Player[i], 623045 )  -- ���a����
						local realsccore = playerscore + 1
						ScriptMessage( Player[i] , Player[i] , 1 , "[SC_WEAVE_TAILOR_29][$SETVAR1="..realsccore.."]" , C_SYSTEM )  --   ���ʵ����A�A��[623045]��[$VAR1]���C
						ScriptMessage( Player[i] , Player[i] , 0 , "[SC_WEAVE_TAILOR_29][$SETVAR1="..realsccore.."]"  , C_SYSTEM  )
					--	Say(Player[i], "playerscore ="..playerscore )  -- ���a�`��
						if realsccore >= 71 then 
							GiveBodyItem(Player[i], 241646, 1 )  
						elseif realsccore >= 51 and realsccore <= 70 then 
							GiveBodyItem(Player[i], 241645, 5 )  
						elseif realsccore >= 31 and realsccore <= 50 then
							GiveBodyItem(Player[i], 241645, 3 )  
						elseif realsccore >= 11 and realsccore <= 30 then 
							GiveBodyItem(Player[i], 241645, 1 )  
						end
					end
					 ------- �����anpc���ƪ����y  -------
					if CheckBuff(OID, buffid2 )  == false  then
						GiveBodyItem(Player[i], 241480, 1 )  
					else
						local npcscore = FN_CountBuffLevel(OID, buffid2 )  -- NPC���W���������q
					--	Say(OID, "npcscore = "..npcscore )
						if npcscore >= 41 then 
							GiveBodyItem(Player[i], 241480, 5 )  
						elseif npcscore >= 11 and npcscore <= 40 then  
							GiveBodyItem(Player[i], 241480, 3 )  
						elseif npcscore <= 10 then   -- 30�H�U
							GiveBodyItem(Player[i], 241480, 1 )  
						end
					end

					CancelBuff(Player[i], 623045 )  -- �R ���ʤ���buff
					CancelBuff(Player[i], 623041 )  -- �R ���ʧޯ�buff

					Setflag(Player[i],546864, 1 ) -- ��Ѥw�����L�]�k���_�v
	
					---------------  �������Լ� --------------------
					Lua_Festival_07_All(Player[i])    -- 2013 ����Լ��禡 
					-----------------------------------------------------

				end
			end

			-- �R�����ʬ�������
			local npc = SearchRangeNPC(OID, range )
			for i = 0 , table.getn(npc)-1 do 	-- �j�M�d�򤺪��a
				local Orgid = ReadRoleValue(NPC[i], EM_RoleValue_OrgID )
				local objlist = {120887,121058, 121055, 121056, 121057, 103013, 103014, 103015, 106548 }
				if Orgid == objlist[1] or Orgid == objlist[2] or Orgid == objlist[3] or Orgid == objlist[4] or Orgid == objlist[5] or Orgid == objlist[6] or Orgid == objlist[7] or Orgid == objlist[8] or Orgid == objlist[9]  then
					Delobj(npc[i] )
				end
			end

			-- ������npc �q�X�� 
			local NPC2 = LuaFunc_SearchNPCbyOrgID( OID , 120888, range , 0)      --  ����NPC
			SetModeEx( NPC2 , EM_SetModeType_Show , True ) --���
			SetModeEx( NPC2, EM_SetModeType_Mark, True )--�аO
		--	Say(OID, "SHOW")
			sleep(10)
			DelObj(OID)  -- �R����t��NPC
			break
		end

		if timer == 161 then
			NPCSAY(OID, "[SC_WEAVE_TAILOR_06]" )  
		end

		if timer%5 == 0 then
			local purpleball = Lua_Hao_NPC_Range_Search( OID ,106548 , 100 )  -- range ������ƶq 
			if purpleball > 0 then
				NPCSAY(OID, "[SC_WEAVE_TAILOR_25]" )  -- npc �s���a�X�����y
			end
		end

		if timer%R2 == 0 then  -- npc�I�k �C���I�k�|�^���@�Ǥ���  �����q���M��NPC���W�l��BUFFLV
			local damagelv = FN_CountBuffLevel(OID, buffid )  -- NPC���W�l��Buff lv (10��)  
			CastSpell(OID, OID, 850340 )  -- NPC�I�k��t, �����E��

			if damagelv >= 4 then  -- 5 �h
				NPCSAY(OID, "[SC_WEAVE_TAILOR_04]" ) 
			elseif damagelv <= 3 and damagelv >= 1 then  -- 2. 3  4�h
				NPCSAY(OID, "[SC_WEAVE_TAILOR_03]" ) 
				AddBuff(OID, buffid2, 2 , 180 )   --  
			elseif damagelv <= 0  then
				NPCSAY(OID, "[SC_WEAVE_TAILOR_02]" ) 
				AddBuff(OID, buffid2, 4 , 180 )   
			end
		end

		if timer%R1 == 0 then -- ���C��ɶ�
			local damagelv = FN_CountBuffLevel(OID, buffid )  -- NPC���W�l��Buff lv (10��)  
			local Colormode = ReadRoleValue(OID, EM_RoleValue_PID )  -- colormode = PID ,  1 = �� , 2 = �� ,  3 = ��
			local CR = Rand(100)+1

			NPCSAY(OID, "[SC_WEAVE_TAILOR_05]")  -- �n�F�A�Ӧ����䥦�ؤ����a
			-- �ܴ����@�n�C��
			if Colormode == 1 then -- ��
				local Shield = Lua_Hao_NPC_Closest_Search( OID , 121055  , range )-- �HOwner�����߰��S��j�M�A�^�ǳ̱��񪺪���
				if CR > 65 then
					WriteRoleValue(OID, EM_RoleValue_PID , 3 )  --��
					local Colormode = ReadRoleValue(OID, EM_RoleValue_PID )
					ChangeObjID( Shield, 121057 );	-- �m������ID �Ŧ��]�k�n
				--	Say(OID, "change to BLUE ,"..Colormode)

					-- �����a�}�U����buff
					local Player = SearchRangePlayer( OID , 160 ) --�j�M�P��160���a
					for i = 0 , table.getn(Player)-1  do 	-- �j�M�d�򤺪��a
						if CheckBuff(Player[i], 623041) == true  then  -- ���ʧޯ�buff
							CastSpell(OID, Player[i], 850367 )    -- blue 
						end
					end

				else
					WriteRoleValue(OID, EM_RoleValue_PID , 2 )  --��
					local Colormode = ReadRoleValue(OID, EM_RoleValue_PID )
					ChangeObjID( Shield, 121056 );	-- �m������ID �����]�k�n
				--	Say(OID, "change to YELLOW"..Colormode )

					-- �����a�}�U����buff
					local Player = SearchRangePlayer( OID , 160 ) --�j�M�P��160���a
					for i = 0 , table.getn(Player)-1  do 	-- �j�M�d�򤺪��a
						if CheckBuff(Player[i], 623041) == true  then  -- ���ʧޯ�buff
							CastSpell(OID, Player[i], 850366 )    -- yellow
						end
					end

				end
			elseif Colormode == 2 then -- ��
				local Shield = Lua_Hao_NPC_Closest_Search( OID , 121056  , range )-- �HOwner�����߰��S��j�M�A�^�ǳ̱��񪺪���
				if CR > 70 then
					WriteRoleValue(OID, EM_RoleValue_PID , 3 )  --��
					local Colormode = ReadRoleValue(OID, EM_RoleValue_PID )
					ChangeObjID( Shield, 121057 );	-- �m������ID �Ŧ��]�k�n
				--	Say(OID, "change to BLUE ,"..Colormode)

					-- �����a�}�U����buff
					local Player = SearchRangePlayer( OID , 160 ) --�j�M�P��160���a
					for i = 0 , table.getn(Player)-1  do 	-- �j�M�d�򤺪��a
						if CheckBuff(Player[i], 623041) == true  then  -- ���ʧޯ�buff
							CastSpell(OID, Player[i], 850367 )    -- blue 
						end
					end
				else
					WriteRoleValue(OID, EM_RoleValue_PID , 1 )
					local Colormode = ReadRoleValue(OID, EM_RoleValue_PID )
					ChangeObjID( Shield, 121055 );	-- �m������ID �����]�k�n
				--	Say(OID, "change to RED "..Colormode)

					-- �����a�}�U����buff
					local Player = SearchRangePlayer( OID , 160 ) --�j�M�P��160���a
					for i = 0 , table.getn(Player)-1  do 	-- �j�M�d�򤺪��a
						if CheckBuff(Player[i], 623041) == true then  -- ���ʧޯ�buff
							CastSpell(OID, Player[i], 850365 )    -- RED
						end
					end
				end
			elseif Colormode == 3 then -- ��
				if CR > 60 then
					WriteRoleValue(OID, EM_RoleValue_PID , 1 )
					local Colormode = ReadRoleValue(OID, EM_RoleValue_PID )
					ChangeObjID( Shield, 121055 );	-- �m������ID �����]�k�n
				--	Say(OID, "change to RED "..Colormode)

					-- �����a�}�U����buff
					local Player = SearchRangePlayer( OID , 160 ) --�j�M�P��160���a
					for i = 0 , table.getn(Player)-1  do 	-- �j�M�d�򤺪��a
						if CheckBuff(Player[i], 623041) == true  then  -- ���ʧޯ�buff
							CastSpell(OID, Player[i], 850365 )    -- RED
						end
					end
				else
					-- �ܴ����@�n�C��
					WriteRoleValue(OID, EM_RoleValue_PID , 2 )  --��
					local Colormode = ReadRoleValue(OID, EM_RoleValue_PID )
					ChangeObjID( Shield, 121056 );	-- �m������ID �����]�k�n
				--	Say(OID, "change to YELLOW"..Colormode )

					-- �����a�}�U����buff
					local Player = SearchRangePlayer( OID , 160 ) --�j�M�P��160���a
					for i = 0 , table.getn(Player)-1  do 	-- �j�M�d�򤺪��a
						if CheckBuff(Player[i], 623041) == true  then  -- ���ʧޯ�buff
							CastSpell(OID, Player[i], 850366 )    -- Yellow
						end
					end
				end
			end
		end
	end

end

function lua_mika_weave_flagtest()
	local OID  = OwnerID()
	local FlagObjID = 781174 --�X�m����s�� 
	local FlagNum = GetMoveFlagCount( FlagObjID ) --�X�m�ƶq
	say(OID, "NUM = "..FlagNum)
end
function lua_mika_weave_flagTEST2()
	local ctrl = OwnerID() --��������
	local RoomID = ReadRoleValue( ctrl, EM_RoleValue_RoomID ) --�ϰ�s��
	local FlagObjID = 781174 --�X�m����s�� 
	local FlagNum = GetMoveFlagCount( FlagObjID ) --�X�m�ƶq
	local create;
	for i=0, FlagNum-1 do
		x = GetMoveFlagValue( FlagObjID, i , EM_RoleValue_X ) 
		y = GetMoveFlagValue( FlagObjID, i , EM_RoleValue_Y ) 
		z = GetMoveFlagValue( FlagObjID, i , EM_RoleValue_Z ) 	
		create = CreateObj( 103015, x, y, z, rand(360), 1 )
		SetModeEx( create, EM_SetModeType_Mark, true )--�аO
		SetModeEx( create, EM_SetModeType_Show, true )--���
		SetModeEx( create, EM_SetModeType_Move, true )--����
		SetModeEx( create, EM_SetModeType_ShowRoleHead, true )--�Y����
		SetModeEx( create, EM_SetModeType_HideName, true )--�W��
		SetModeEx( create, EM_SetModeType_Strikback, true )--����
		SetModeEx( create, EM_SetModeType_SearchenemyIgnore, true )--�Q�j�M
		SetModeEx( create, EM_SetModeType_Obstruct, false )--����
		SetModeEx( create, EM_SetModeType_Searchenemy, true )--����
		SetModeEx( create, EM_SetModeType_Fight , false )--�i�������
		SetModeEx( create, EM_SetModeType_Drag , false )--���O
		MoveToFlagEnabled( create, false ); 
		WriteRoleValue( create  ,EM_RoleValue_IsWalk , 1  )--�ζ]��
		--WriteRoleValue( create[random], EM_RoleValue_Register1, ctrl )
		AddToPartition( create, RoomID )
	end
end
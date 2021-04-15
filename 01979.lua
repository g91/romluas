--���|�г�-10. �T�ӤF -- ��
-- [���q�禡�\��p���ð� �i�� ���H ]

--���O��

-- zone354 ���ϱM�Ψ禡 
function Lua_Zone354_Create( FlagObjID, FlagNum, Obj, ObjNum, resetTime, Range )
	--FlagObjID �X�m����s��
	--FlagNum �X�m�ƶq	
	--Obj �شӪ���s��
	--ObjNum �شӪ���ƶq
	--counterObj ��������s��	
	--resetTime ���s�ɶ�(��)
	--Range �ͩǽd��
	local ctrl = OwnerID() --��������
	local RoomID = ReadRoleValue( ctrl, EM_RoleValue_RoomID ) --�ϰ�s��
	Zone354_GlobalSheep = {}
	local create = Zone354_GlobalSheep
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
		create[i] = 0 
	end
		
	while true do
		count = ReadRoleValue( ctrl, EM_RoleValue_Register1 )
--		DebugMsg(0,0,"Sheep Count = "..count )
		
		if count < ObjNum then
			for i=count, ObjNum-1 do
				Sleep(1)				
				random = rand(FlagNum)
				if  create[random ] > 1 then
					while true do
						sleep(1)
						random = ks_CreateObjSearch( create, FlagNum, 0 )
						if random ~= nil then break	 end
						random = rand(FlagNum)
						if  create[ random ] > 1 then break end
					end
				end

				if random ~= nil then 
					x = GetMoveFlagValue( FlagObjID, random , EM_RoleValue_X ) 
					y = GetMoveFlagValue( FlagObjID, random , EM_RoleValue_Y ) 
					z = GetMoveFlagValue( FlagObjID, random , EM_RoleValue_Z ) 	
						
					create[random] = CreateObj( Obj, x+math.random(-Range,Range), y, z+math.random(-Range,Range), rand(360), 1 )
					
					SetModeEx( create[random], EM_SetModeType_Fight, false )
					SetModeEx( create[random], EM_SetModeType_Searchenemy, false )
					WriteRoleValue( create[random], EM_RoleValue_Register1, ctrl )
					WriteRoleValue( create[random], EM_RoleValue_Register2, random )
					AddToPartition( create[random], RoomID )
					
					CallPlot( create[random], "Lua_Zone354_SheepMove", 0 )  -- 
					
					AddRoleValue( ctrl, EM_RoleValue_Register1, 1 )
					Sleep(1)					
				end
				count = ReadRoleValue( ctrl, EM_RoleValue_Register1 )
			end
		end
			
		for i=1, resetTime*2 do
			local ResetFlag = ReadRoleValue( ctrl, EM_RoleValue_Register2 )
			if ResetFlag ~= 0 then
		--		DebugMsg(0,0,"ResetFlag "..ResetFlag)
				create[ResetFlag] = 0
				WriteRoleValue( ctrl, EM_RoleValue_Register2, 0 )
			end
			sleep(5)
		end
	end
end





-- �ϥX�ͫ����@��
--- �T > �� >  �H������

function Lua_Zone354_SheepMove()--�ϲ���
	local Sheep = OwnerID()

	AddBuff(Sheep, 506292, 2, -1 )  --�ϥX�ͱ�buff , ��q ����3
	local life =  FN_CountBuffLevel(Sheep, 506292 )  
--	Say( Sheep, "life is "..life )

	local timer = 0
--	Say( Sheep, "timer ="..timer )
	sleep(30)
	MoveToFlagEnabled( sheep, false )

	while true do
		sleep(10)
		timer = timer +1	
	--	DebugMsg( 0 , 0 , "sheep timer = "..timer )		

		if timer%6 == 0 then   -- �C5��]�@��
		--	DebugMsg( 0 , 0 , "sheep timer % = 5")

			local count1 = Lua_Hao_NPC_Range_Search( Sheep ,105024 , 150 )  -- range ������ƶq (�T) 
			local count2 = Lua_Hao_NPC_Range_Search( Sheep , 117052, 50 )  -- range ������ƶq ( ��)

	--		DebugMsg( 0 , 0 , "wolf count is "..count1 )
	--		DebugMsg( 0 , 0 , "grass count is "..count2 )

			if count1 > 0  then -- ���T
				local Wolf = Lua_Hao_NPC_Closest_Search( Sheep , 105024  , 150 ) -- �HOwner�����߰��S��j�M�A�^�ǳ̱��񪺪���
				local wolfdead =  ReadRoleValue( wolf, EM_RoleValue_Register3 )  -- �T�w��  r3 = 1 �T���F , r3 = 0 �T����

				if wolfdead == 0 and CheckBuff( Sheep, 507702) == false then  -- �p�G�S����buff
					sleep(20)
					AdjustFaceDir(Sheep, wolf, 0 ) --���V
				--	Say( Sheep, "there is a wolf !")
					CastSpell( Sheep, Sheep,492444 )  -- ����ĸ�
					sleep(5)
					Addbuff( Sheep, 507702, 0 , 10 )  -- ������Buff 
				end

			elseif count2 > 0 then  --����
				local grassbuff = CheckBuff(Sheep, 507700 ) -- �ϬO�_���}��buff

				if CheckBuff( Sheep ,  507702 ) == false  and grassbuff == false  then  -- �S ����BUFF + �S ����BUFF

					local Grass = Lua_Hao_NPC_Closest_Search( Sheep , 117052  , 50 )-- �HOwner�����߰��S��j�M�A�^�ǳ̱��񪺪���
					local dis2 = GetDistance(Sheep, Grass )  -- �� �M ��쪺�󪺶Z��

				--	Say( Sheep, "Find food !")   --�o�{�����ɻ���
				--	Say( Grass , "I am the closest  one " )
					AdjustFaceDir(Sheep, Grass, 0 ) --���V
					sleep(15)
					PlayMotion( Sheep, 120 )  -- ����idle�ʧ@ �Y�F��
					sleep(5)
					AddBuff(Sheep, 507700, 0 , -1 )
					ks_CreateObj_reset( true, Grass )-- �i���������󦹦�m�w�M��
				else
			--		Say( Sheep, " I don't want eat now ..." )
				end

			--	Say(Sheep, "check grass end" )
			else
				--	Say( Sheep, " do nothing.." )
			end

		elseif timer%23 == 0 then  --�CX��]�@��
	--		DebugMsg( 0 , 0 , "sheep timer % = 23")

			local X = ReadRoleValue( Sheep, EM_RoleValue_X )
			local Y = ReadRoleValue( Sheep, EM_RoleValue_Y )
			local Z = ReadRoleValue( Sheep, EM_RoleValue_Z )
			local D = ReadRoleValue( Sheep, EM_RoleValue_Dir )

			local Range = 20 +  rand(6) --�üƲ��ʽd��

			if D > 170 then
				local dir = D-rand(20)
		--		Say(Sheep, "sheep dir  1 = "..dir )
				AdjustDir( sheep, dir )
			else 
				local dir = D+rand(20)
		--		Say(Sheep, "sheep dir  2 = "..dir )
				AdjustDir( sheep, dir )
			end

	--		say(Sheep, "sheep move range = "..range )
			sleep(30) 
			MoveDirect( Sheep, X+math.random(-Range,Range), Y, Z+math.random(-Range,Range) )

		end
	end
end


-- zone354�M�� ���ͦ�m�M��
-- [���禡�\��p���ð� �i�� ���H]
function Lua_Zone354_Reset( Obj )--Delete (�O�_�R��); Obj (��H)
	Obj = Obj or OwnerID()
	local ctrl = ReadRoleValue( Obj, EM_RoleValue_Register1 )
	local Flag = ReadRoleValue( Obj, EM_RoleValue_Register2 )
	AddRoleValue( ctrl, EM_RoleValue_Register1, -1 )--count-1
	WriteRoleValue( ctrl, EM_RoleValue_Register2, Flag )--FlagClear
--	DebugMsg(0,0,"Flag "..Flag.."; Ctrl = "..Ctrl )
	Sleep(5)
	DelObj( Obj )
end
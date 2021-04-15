--���|�г�10 �T�ӤF  -�T�@��


--�T�X�ͲĤ@�q�@�� (�Ѥ������P�_���p���X ) 
function lua_mika_wolfcome_wolf_born1()
	local npcid = 105024
	local flagid = 780824
	local wolf = CreateObjByFlag( npcid , flagid , 0  , 1 )
	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )

	WriteRoleValue(OwnerID(),  EM_RoleValue_Register2 , 1 )   -- r1  = �T���ͷ� ����A�]�U�� 
	local check = ReadRoleValue(OwnerID(), EM_RoleValue_Register2 )   -- �T�X�Ͷ}��  0 = �i�H�ͯT 1 ����  ����script ����run
--	DebugMsg( 0 , 0 , "CHECK 1  = "..check )	

	SetFightMode( wolf , 0 , 1 , 0 , 0 )
	WriteRoleValue( wolf ,EM_RoleValue_IsWalk , 0 ) --�R�O�Ө���ζ]��
--	MoveToFlagEnabled( wolf, false )
	AddToPartition( wolf , RoomID )

--	say(wolf, "Born")
	local W =  ReadRoleValue( wolf, EM_RoleValue_IsWalk )
--	say(OwnerID(), W )

	for i = 1 , 3, 1 do 
--		say(wolf, "run"..i )

		-- �Ѥl��XYZ
		local X = GetMoveFlagValue( flagid, i, EM_RoleValue_X )
		local Y = GetMoveFlagValue( flagid, i, EM_RoleValue_Y)
		local Z = GetMoveFlagValue( flagid, i, EM_RoleValue_Z )

		-- ��NPC����i�I�~�e�i�U�@���I
		if i == 3 then
			CastSpell(wolf,  wolf, 496585 )  -- �T�z�smotion
			Beginplot(wolf, "lua_mika_wolfcome_wolf_born3" , 10 )
			sleep(30)
		end
		DW_MoveToFlag( wolf , 780824, i, 20, 1 )

	end

	--�T�]��w�I�� �}�l����ϰʧ@
	CallPlot( wolf, "Lua_Zone354_WolfMove", 0 )
--	Say( wolf, "wolf run ok" ) 

	WriteRoleValue(OwnerID(),  EM_RoleValue_Register2 , 0 )   -- r1  = �T�i�H�]�o
	local check = ReadRoleValue(OwnerID(), EM_RoleValue_Register2 )   -- �T�X�Ͷ}��  0 = �i�H�ͯT 1 ����  ����script ����run
--	DebugMsg( 0 , 0 , "CHECK 2 = "..check )	

end

-------------------------------------
--�T  �����󲣥ͼ@��
function lua_mika_wolfcome_wolf_born2()

	-- �T�X�ͮɵ����P�_�O�T��buff
	AddBuff(OwnerID(), 507701 , 4 , -1 ) 
--	WriteRoleValue( OwnerID(), EM_RoleValue_Register3 , 5 )--�ͩR��
	local bufflv = FN_CountBuffLevel(OwnerID(), 507701 )  
--	Say( OwnerID(), bufflv )

end

-------------------------------------
function lua_mika_wolfcome_wolf_born3()
	PlaySound( OwnerID() , "sound/sound_new/train/wolf.mp3", false )--���񭵮�
end


-------------------------------------
function Lua_Zone354_WolfMove()--�T����
	local Wolf = OwnerID()
	local SheepTable = Zone354_GlobalSheep

	while true do
		Sleep(50)
--		say(wolf, "check" )

		local sheep = Lua_Hao_NPC_Closest_Search( wolf , 105023  , 180 )-- �HOwner�����߰��S��j�M�A�^�ǳ̱��񪺪���

		if sheep == 0 then -- �p�G�S��
		--	Say(wolf, "search sheep.")
			local X = ReadRoleValue( wolf, EM_RoleValue_X )
			local Y = ReadRoleValue( wolf, EM_RoleValue_Y )
			local Z = ReadRoleValue( wolf, EM_RoleValue_Z )
			local Range = 35 --�üƲ��ʽd��
			MoveDirect( wolf, X+math.random(-Range,Range), Y, Z+math.random(-Range,Range) )
		
		else
		--	Say(wolf, "find sheep !!")

			local dis = GetDistance(wolf, sheep )
			AdjustFaceDir(Wolf, sheep, 0 ) --���V
			local wolfdead =  ReadRoleValue( Wolf, EM_RoleValue_Register3 )  -- �T�w��  r3 = 1 �T���F , r3 = 0 �T����
			if  wolfdead == 0 and dis < 50 then 
				CastSpell( Wolf, Sheep, 490579 )  -- �T �Y ��	
			else
		--		say(wolf, "dis = "..dis )
		--		KS_Move( Wolf, dis-20, Sheep ) --��H(RoleID)���ʨ���w��m
				KS_Move( Wolf, 20, Sheep ) --��H(RoleID)���ʨ���w��m

			end

		--	Say(wolf, "bite ok")
		end
	end
end


--�T �r��,  490579 ���浲�G
function Lua_Zone354_WolfSheep() --�r��
--	Say(OwnerID(), "OwnerID") -- �T
--	Say(TargetID(), "TargetID")   -- ��

	-- �Ϧ�q
	local BuffType = 0
	local Count = BuffCount ( TargetID())
	local SetA = -1

--	Say(OwnerID(),  "bite the sheep ")
	PlayMotion( OwnerID(), 37 )  -- �T ���� ���� �ʧ@
	Playmotion(TargetID(), 18 ) -- ����ʧ@ ���� (18 or 19 )

	for i = 0 , Count do
		local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID )
		if BuffID == 506292 then
			local BuffLv = BuffInfo ( TargetID() , i , EM_BuffInfoType_Power )
			SetA = BuffLv

			if BuffLv > 0 then  -- �� > 1

		--		Say(TargetID(), "life -1 " )
				CancelBuff(TargetID(), 506292 )
				AddBuff(TargetID(), 506292, SetA-1 , -1 )
				local life =  FN_CountBuffLevel(TargetID(), 506292 )  
		--		Say(TargetID(), "life is "..life )

			else
				CancelBuff(TargetID(),BuffID)
		--		Say(TargetID(), "I will die" ) 
				Beginplot(TargetID(), "lua_mika_wolfcome_sheepdie", 10 )  -- ���񦺤`�s��ʧ@, ��3��
			end
			break
		end
	end
end

-- �Ϧ��`�@��
Function lua_mika_wolfcome_sheepdie()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	sleep(30)
	Lua_Zone354_Reset( OwnerID() )--���ͦ�m�M��
end
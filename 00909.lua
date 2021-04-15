function Lua_Ai_ArFex()
	SetPlot( OwnerID() , "dead" , "Lua_100794_deadlog_1" , 0 )
	local HP75 = "false"
	local HP50 = "false"
	local HP25 = "false"
	local MaxHP = ReadRoleValue(  OwnerID() , EM_RoleValue_MaxHP )
	local CheckTime = 10		-- �@���ˬd�@��
	local ObjFlag = 780192		--�w�I�ͩǪ��X�lID
	local MagicFlag = 780191		--�w�I�I�k���X�lID
	local MonsterID = 101293		--���ͪ��p��
	local N = 0			--�v���c�p�ɾ�
	local M = 0			--�g�ɭp�ɾ�
	local O = 0			--AE�p�ɾ�
--	local R = 0
	local XX = 0
	local Coldown = 150		--�v���ccoldown
	local MagicID = 491987		--�v���c
	local MonsterGroup = {}		--�l���Ǫ����}�C
	local SecondMagicID2 = 491989	--�g��
	local SecondMagicID3 = 492232	--�z���ۭ�
	local SecondMagicID4 =491905	--��������
	local SecondMagicLV = 1
	local Coldown2 = 200		--�g��coldown
	local ExtentMagic = 491903		--AE�k�NID
	local MagicColdown = 300		--AE�k�Ncoldown
	local Door = {}
	local DoorStatus = "Open"
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�
			if DoorStatus == "Open" then
					Door[1]=CreateObj( 112052, 4281, 96, 5706, 357, 1 )
					WriteRoleValue( OwnerID() , EM_RoleValue_Register , Door[1] )
				for i=1, table.getn(Door) do
					SetModeEx( Door[i]   , EM_SetModeType_Fight , false )--�i�������
					SetModeEx( Door[i]   , EM_SetModeType_Strikback, false )--����
					SetModeEx( Door[i]   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
					SetModeEx( Door[i]   , EM_SetModeType_Obstruct, true )--����
					SetModeEx( Door[i]   , EM_SetModeType_Mark, false )--�аO
					SetModeEx( Door[i]   , EM_SetModeType_Move, false )--����
					SetModeEx( Door[i]   , EM_SetModeType_Searchenemy, false )--����
					SetModeEx( Door[i]   , EM_SetModeType_ShowRoleHead, false )--�Y����
					SetModeEx( Door[i]   , EM_SetModeType_HideName, false )--�W��
					SetModeEx( Door[i]   , EM_SetModeType_Gravity, false )--���O
					AddToPartition( Door[i] , RoomID )
				end
				DoorStatus = "Close"
			end
			local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )
			local HPPercent = NowHP / MaxHP
			-- �� 3/4 
			if ( HPPercent <= 0.75 )  then
				if ( HP75 == "false" ) then
--					Say( OwnerID() , "NowHP = 75%")
					local Obj = Role:new( OwnerID())
					local BaseX = Obj :X()
	 				local BaseY = Obj :Y()
	 				local BaseZ = Obj :Z()
					local BaseDir = Obj:Dir()
					local BaseRoom = Obj:RoomID()
					Say(OwnerID(),GetString("SC_FRFEX_4"))	--�X�ӧa�I
--					Castspell(OwnerID() , OwnerID() , SecondMagicID4 )				--��������
--					sleep(10)
--					SetFightMode (  OwnerID()  , 0, 0, 0, 0 )
--					SetPosByFlag(OwnerID(),MagicFlag,0)						--�ǰe��x�W�I�k
--					sleep(10)
					MonsterGroup = CreateMonsterByFlagBatch( MonsterID, 4, ObjFlag, 0, 1, BaseRoom )	--���ͤp�L
					local NewTarget = LuaFunc_GetAnotherPartyPlayer(AttackTarget)		--�q���ͤ����X�@��
					Say(OwnerID(),"[SC_FRFEX_0][$SETVAR1="..GetName( NewTarget ).."]")	--���ڧ���
					SetMonsterAttack( MonsterGroup, NewTarget )					--�s�p�L���ؼ�
--					Castspell(OwnerID() , OwnerID() , SecondMagicID4 )				--��������
--					SetPos(OwnerID(),BaseX,BaseY,BaseZ,BaseDir)					--�^����
--					SetFightMode (  OwnerID()  , 1, 1, 1, 1 )		
--					SetAttack( OwnerID() , AttackTarget )
					HP75 = "Called"								--�l���L���O��
--					Say( OwnerID() , "HP75 = Called")
				elseif ( HP75 == "Called" ) then
					HP75 = "Finsh"								--�p�L���`�O��
--					Say( OwnerID() , "HP75 = Finsh")
					N = 15
				elseif ( HP75 == "Finsh" ) then
--					Say( OwnerID() , N)
					if N >= (Coldown / CheckTime) then
						Say(OwnerID(),"[SC_FRFEX_1]")	--�������I���ڧA���O�q�I
						sleep(20)
						CastSpell( OwnerID(), OwnerID(), MagicID )				--��Ӷ��ͨϥμv���c
						Say(OwnerID(),"[SC_NISOAN_3]")		--�q�q���ڰ��U�ӡI
						N = 0
					end
				end 
			end
			-- �� 2/4 
			if ( HPPercent <= 0.50 ) then				
				if ( HP50 == "false" ) then
--					Say( OwnerID() , "NowHP = 50%")
					local Obj = Role:new( OwnerID())
--					local BaseX = Obj :X()
--	 				local BaseY = Obj :Y()
--	 				local BaseZ = Obj :Z()
--					local BaseDir = Obj:Dir()
					local BaseRoom = Obj:RoomID()
					Say(OwnerID(),"[SC_FRFEX_4]")	--�X�ӧa�I
--					Castspell(OwnerID() , OwnerID() , SecondMagicID4 )				--��������
--					SetFightMode (  OwnerID()  , 0, 0, 0, 0 )
--					SetPosByFlag(OwnerID(),MagicFlag,0)						--�ǰe��x�W�I�k
					MonsterGroup = CreateMonsterByFlagBatch( MonsterID, 8, ObjFlag, 0, 2, BaseRoom )	--���ͤp�L
					local NewTarget = LuaFunc_GetAnotherPartyPlayer(AttackTarget)		--�q���ͤ����X�@��
					SetMonsterAttack( MonsterGroup, NewTarget )					--�s�p�L���ؼ�
--					Castspell(OwnerID() , OwnerID() , SecondMagicID4 )				--��������
--					SetPos(OwnerID(),BaseX,BaseY,BaseZ,BaseDir)					--�^����
--					SetFightMode (  OwnerID()  , 1, 1, 1, 1 )		
--					SetAttack( OwnerID() , AttackTarget )
					HP50 = "Called"								--�l���L���O��
--					Say( OwnerID() , "HP50 = Called")
				elseif ( HP50 == "Called" ) then
					HP50 = "Finsh"								--�p�L���`�O��
--					Say( OwnerID() , "HP50 = Finsh")
					M = 20
				elseif ( HP50 == "Finsh" ) then
--					if R >= 20 then
--						local NewTarget = LuaFunc_GetAnotherPartyPlayer(AttackTarget)		--�q���ͤ����X�@��
--						CastSpell(OwnerID() , NewTarget , 492225)	--�ļ�
--						R = 0
--					end
					if XX >= 10 then
						CastSpellLV( OwnerID(), OwnerID(), SecondMagicID3 , SecondMagicLV )	--�z���ۭ�
						sleep(20)
						XX = 0
					end
					if M >= (Coldown2 / CheckTime) then
--						Say( OwnerID() , M)
						Say(OwnerID(),"[SC_FRFEX_2]")	--���k���I�ں��w�I���ڧA���O�q�I
						CastSpell( OwnerID(), OwnerID(), SecondMagicID2 )			--�g��
						Say(OwnerID(),"[SC_NISOAN_2]")	--�����`�Ӫ��󨳳t�a�I
						M = 0								--���s�p��
					end
				end 
			end
			-- �� 1/4 
			if ( HPPercent <= 0.25 ) then
				if ( HP25 == "false" ) then
--					Say( OwnerID() , "NowHP = 25%")
					local Obj = Role:new( OwnerID())
---					local BaseX = Obj :X()
--	 				local BaseY = Obj :Y()
--	 				local BaseZ = Obj :Z()
--					local BaseDir = Obj:Dir()
					local BaseRoom = Obj:RoomID()
					Say(OwnerID(),"[SC_FRFEX_4]")	--�X�ӧa�I
--					Castspell(OwnerID() , OwnerID() , SecondMagicID4 )				--��������
--					SetPosByFlag(OwnerID(),MagicFlag,0)						--�ǰe��x�W�I�k
					MonsterGroup = CreateMonsterByFlagBatch( MonsterID, 12, ObjFlag, 0, 3, BaseRoom )	--���ͤp�L
					local NewTarget = LuaFunc_GetAnotherPartyPlayer(AttackTarget)		--�q���ͤ����X�@��
					SetMonsterAttack( MonsterGroup, NewTarget )					--�s�p�L���ؼ�
--					Castspell(OwnerID() , OwnerID() , SecondMagicID4 )				--��������
--					SetPos(OwnerID(),BaseX,BaseY,BaseZ,BaseDir)					--�^����
--					SetFightMode (  OwnerID()  , 1, 1, 1, 1 )		
--					SetAttack( OwnerID() , AttackTarget )
					HP25 = "Called"								--�l���L���O��
--					Say( OwnerID() , "HP25 = Called")
				elseif ( HP25 == "Called" ) then
					HP25 = "Finsh"								--�p�L���`�O��
--					Say( OwnerID() , "HP25 = Finsh")
					O = 60
				elseif ( HP25 == "Finsh" ) then
--					Say( OwnerID() , O)
					if O >= (MagicColdown / CheckTime) then
						Say(OwnerID(),"[SC_FRFEX_3]")	--����Ǵ��I���ڧA���O�q�I
						sleep(20)
						Castspell(OwnerID() , OwnerID() , ExtentMagic )			--�I��AE�k�N
						O= 0
					end
				end 
			end
		N = N + 1
		M = M + 1
		O = O + 1
--		R = R + 1
		XX = XX +1
		else
			HP75 = "false"		-- �D�԰��A�k�s�O��
			HP50 = "false"	
			HP25 = "false"	
			for i = 1 , table.getn(MonsterGroup) do		--�R���۳��
				if CheckID(MonsterGroup[i]) == true then
					DelObj(MonsterGroup[i])
				end
			end
			if DoorStatus == "Close" then
				for i=1, table.getn(Door) do
					Delobj(Door[i])
				end
				DoorStatus = "Open"
			end
		end

	Sleep( CheckTime )
	end
end
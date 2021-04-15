-- �����l�� BOSS3 ���p�� DOR_TEST  ** �s �� �r �p **

----------------------------------------------------��l�M��
--local g_Msg = {}  --�x���M��

local g_Magic = {} 	-- �k�N���X�M��
--�t�G
g_Magic.DARKCURSE = {}
g_Magic.DARKCURSE.CD = 10
g_Magic.DARKCURSE.DmgID = 491601 --�ˮ`�A�L�ʧ@���o

--�Y���t�G
g_Magic.DARKEND = {}
g_Magic.DARKEND.DmgID = 491476 --�ˮ`�A����

-- �B��
g_Magic.ICEBLADE = {}
g_Magic.ICEBLADE.CD = 7
g_Magic.ICEBLADE.ActID = 491281 --�ʧ@
g_Magic.ICEBLADE.DmgID = 491602 --���ζˮ`
g_Magic.ICEBLADE.CG1ID = 491617 --���ۯS��
g_Magic.ICEBLADE.CG2ID = 491624 --�z���y�X��S��
g_Magic.ICEBLADE.Range = 70 --�I��Z��

--�H���ᵲ
g_Magic.ICEEND = {}
g_Magic.ICEEND.DmgID = 491473 --�ᵲ

-- ���}
g_Magic.FIREBLADE = {}
g_Magic.FIREBLADE.CD = 15
g_Magic.FIREBLADE.ActID = 491281 --�ʧ@(�P�B���@��)
g_Magic.FIREBLADE.DmgID = 491603 --�ˮ`
g_Magic.FIREBLADE.CG1ID = 491622 --���ۯS��
g_Magic.FIREBLADE.CG2ID = 491604 --�z���y�X��S��
g_Magic.FIREBLADE.Delay = 15 --���۩���
g_Magic.FIREBLADE.Range = 100 --�I��Z��
g_Magic.FIREBLADE.Width = 45
g_Magic.FIREBLADE.Length = 200
g_Magic.FIREBLADE.Height = 100

--�P���U��
g_Magic.FIREEND = {}
g_Magic.FIREEND.DmgID = 491319 --�ˮ`

--�B��
g_Magic.ICESPEAR = {}
g_Magic.ICESPEAR.PreID = 491605 --�a���wĵ�S��
g_Magic.ICESPEAR.CG1ID = 491479 --��X�S��
g_Magic.ICESPEAR.DmgID = 491478 --�ˮ`

--�٦a
g_Magic.EARTHSTRIKE = {}
g_Magic.EARTHSTRIKE.CD = 8
g_Magic.EARTHSTRIKE.ActID = 491852
g_Magic.EARTHSTRIKE.CG1ID = 491855 -- �E��p�ˮ`�S��
g_Magic.EARTHSTRIKE.CG2ID = 491856 --�X��j�ˮ`�S��
g_Magic.EARTHSTRIKE.Dmg1ID = 491853 --�E��p�ˮ`
g_Magic.EARTHSTRIKE.Dmg2ID = 491854 --�X��j�ˮ`+����

--�p��
g_Magic.THUNDERSTRIKE = {}
g_Magic.THUNDERSTRIKE.CD = 16
g_Magic.THUNDERSTRIKE.ActID = 491637
g_Magic.THUNDERSTRIKE.Dmg1ID = 491638 --�E��p�ˮ`
g_Magic.THUNDERSTRIKE.Dmg2ID = 491649 --�X��j�ˮ`
g_Magic.THUNDERSTRIKE.CG1ID = 491650 --���p�S��
g_Magic.THUNDERSTRIKE.SafeRange = 100

local g_BuffID = {} --�򥻪k��
g_BuffID.DARK = {}
g_BuffID.DARK[178] = 502008 -- �x���ƥ�
g_BuffID.DARK[179] = 503259
g_BuffID.DARK[180] = 503259
g_BuffID.DARK[940] = 503259

g_BuffID.FIRE = {}
g_BuffID.FIRE[178] = 501986 -- �x���ƥ�
g_BuffID.FIRE[179] = 503226
g_BuffID.FIRE[180] = 503226
g_BuffID.FIRE[940] = 503226

g_BuffID.ICE = {}
g_BuffID.ICE[178] = 501984 -- �x���ƥ�
g_BuffID.ICE[179] = 503227
g_BuffID.ICE[180] = 503227
g_BuffID.ICE[940] = 503227

g_BuffID.FRZ = 501988

local g_Phase = {} -- ���q�ഫflag �p��BOSS�P������
local g_HateList = {} 	-- �����
local g_Control = {} 	-- ������

local g_Door = {}
g_Door.FrontDoor = {} 	-- �e��
g_Door.FrontDoor.NpcID = 106250 	-- ����ID
g_Door.FrontDoor.Pos = { X = 2452, Y = 149, Z = 3736, Dir = 19 } 	-- �y��

g_Door.RearDoor = {} 	-- ���
g_Door.RearDoor.NpcID = 106250 	-- ����ID
g_Door.RearDoor.Pos = { X = 1949, Y = 157, Z = 4413, Dir = 61 } 	-- �y��

local g_Boss = {} 	-- ��
g_Boss.NpcID = {} 	-- ��ID
g_Boss.NpcID[940] = 106175 
g_Boss.NpcID[178] = 106175 	-- �x���ƥ�
g_Boss.NpcID[179] = 106283 	-- ���q�ƥ�
g_Boss.NpcID[180] = 106284 	-- ²��ƥ�

----------------------------------------------------�`�Υ\��----------------------------------------------------

local function CompDis( A, B )	-- �������A�Ѫ�ܻ��̧ǱƧǡA���Ѧ��s���� Script �P�_�Z����

	if A.Dis < B.Dis then
		return true 
	end
end

local function CompHatePoint( A, B )	-- ��Ӥ����I�ơA�Ѱ��ܧC�̧ǱƧǡA���Ѧ��s���� Script �P�_�����

	if A.HatePoint > B.HatePoint then
		return true 
	end
end

local function GetHateList( ObjID, Haters )	-- ���ѦҪ��󪺤����A��z Guid�B�Z���B�����I�ƫ�^�� Table�A���Ѧ��s���� Script �P�_��T��

	local HateList = {} 
	for i = 0, Haters-1 do	-- ����������ؼ�
		local Targets = {} 
		local Player = HateListInfo( ObjID, i, EM_HateListInfoType_GItemID ) 
		if ReadRoleValue( Player, EM_RoleValue_Voc ) ~= 0 then	-- �DGM
			Targets.Guid = Player 
			Targets.Dis = GetDistance( ObjID, Player ) 
			Targets.HatePoint = HateListInfo( ObjID, i, EM_HateListInfoType_HatePoint ) 
		--	DebugMsg( 0, Room, Getname( Targets.Guid )..", Dis = "..Targets.Dis..", HatePoint = "..Targets.HatePoint ) 
			table.insert( HateList, Targets ) 
		end
	end
	return HateList 
end


----------------------------------------------------NPC ����function----------------------------------------------------

function Z34_BOSS3_Control_Init()	-- �������󲣥ͼ@��
	DebugMsg( 0, 0, "Z34_BOSS3_Control_Init")
	local Control = OwnerID()
	local Zone = ReadRoleValue( Control, EM_RoleValue_ZoneID ) 
	local Room = ReadRoleValue( Control, EM_RoleValue_RoomID ) 
	g_Control[Room] = Control
	
	if g_Boss[Room] and CheckID( g_Boss[Room] ) then	-- ���b�A�R���¤�
		DelObj( g_Boss[Room])  
	end

	local ControlPos = Vector_GetRolePos(Control) 
	local ControlDir = ReadRoleValue( Control, EM_RoleValue_Dir ) 
	local VecDir = Vector_DirToVector( ControlDir + 90 + 180 ) 
	local BossPos = ControlPos + VecDir * 10 	-- ����󤤱������ 10 ����m
	local Boss = CreateObj( g_Boss.NpcID[Zone], BossPos.X, BossPos.Y, BossPos.Z, ControlDir, 1 ) 
	g_Boss[Room] = Boss

	SetModeEx( Boss  , EM_SetModeType_Strikback, true)  ---����
	SetModeEx( Boss  , EM_SetModeType_Searchenemy,true)   -- ����
	SetModeEx( Boss  , EM_SetModeType_Fight, false)  --���
	AddToPartition( Boss, Room ) 

	if Zone ~= 940 then	-- �קK����հϴ��ծɳ����A�P�ϼ@�����_
		Cl_Resist_HackersBossNum( Boss ) 	-- ���b�Ⱦ��� ���󪫥󲣥�
	end

	-- �إ߫e��
	if g_Door.FrontDoor[Room] and CheckID( g_Door.FrontDoor[Room] ) then	-- ���b
		DelObj( g_Door.FrontDoor[Room] ) 
	end
	local FrontDoor = CreateObj( g_Door.FrontDoor.NpcID, g_Door.FrontDoor.Pos.X, g_Door.FrontDoor.Pos.Y, g_Door.FrontDoor.Pos.Z, g_Door.FrontDoor.Pos.Dir, 1 ) 
	SetModeEx( FrontDoor, EM_SetModeType_Gravity, false ) 	-- ���O
	SetModeEx( FrontDoor, EM_SetModeType_Searchenemy, false ) 	-- ����
	SetModeEx( FrontDoor, EM_SetModeType_Strikback, false ) 	-- ����
	SetModeEx( FrontDoor, EM_SetModeType_Fight, false ) 	-- ���
	SetModeEx( FrontDoor, EM_SetModeType_Move, false ) 	-- ����
	SetModeEx( FrontDoor, EM_SetModeType_HideName, true ) 	-- �W��
	SetModeEx( FrontDoor, EM_SetModeType_Mark, false ) 	-- �аO
	
	SetModeEx( FrontDoor, EM_SetModeType_Obstruct, false ) 	-- ����
	SetModeEx( FrontDoor, EM_SetModeType_Show, false ) 	-- ���
	AddToPartition( FrontDoor, Room ) 
	g_Door.FrontDoor[Room] = FrontDoor 

	-- �إ߫��
	if g_Door.RearDoor[Room] and CheckID( g_Door.RearDoor[Room] ) then	-- ���b
		DelObj( g_Door.RearDoor[Room] ) 
	end
	local RearDoor = CreateObj( g_Door.RearDoor.NpcID, g_Door.RearDoor.Pos.X, g_Door.RearDoor.Pos.Y, g_Door.RearDoor.Pos.Z, g_Door.RearDoor.Pos.Dir, 1 ) 
	SetModeEx( RearDoor, EM_SetModeType_Gravity, false ) 	-- ���O
	SetModeEx( RearDoor, EM_SetModeType_Searchenemy, false ) 	-- ����
	SetModeEx( RearDoor, EM_SetModeType_Strikback, false ) 	-- ����
	SetModeEx( RearDoor, EM_SetModeType_Fight, false ) 	-- ���
	SetModeEx( RearDoor, EM_SetModeType_Move, false ) 	-- ����
	SetModeEx( RearDoor, EM_SetModeType_HideName, true ) 	-- �W��
	SetModeEx( RearDoor, EM_SetModeType_Mark, false ) 	-- �аO
	
	SetModeEx( RearDoor, EM_SetModeType_Obstruct, true ) 	-- ����
	SetModeEx( RearDoor, EM_SetModeType_Show, true ) 	-- ���
	AddToPartition( RearDoor, Room ) 
	g_Door.RearDoor[Room] = RearDoor 
	
end

function Z34_BOSS3_Engage()	-- BOSS�԰��}�l
	DebugMsg( 0, 0, "Z34_BOSS3_Engage")
	local Boss = OwnerID()
	local Zone = ReadRoleValue( Boss, EM_RoleValue_ZoneID ) 
	local Room = ReadRoleValue( Boss, EM_RoleValue_RoomID )
	
	g_Phase[Room] = 1 --���q�X�� "�԰�"
	
	if Zone ~= 940 then
		Cl_Resist_HackersFightBegin() --���b��
	end
	
	SetModeEx( g_Door.FrontDoor[Room], EM_SetModeType_Obstruct, true ) 	-- ���e��
	SetModeEx( g_Door.FrontDoor[Room], EM_SetModeType_Show, true ) 	
	
	SetModeEx( Boss  , EM_SetModeType_Fight, true)---�i���
	CallPlot( g_Control[Room], "Z34_BOSS3_Control_BattleLoop", g_Control[Room], g_Boss[Room], Zone, Room )  --�I�s�������}�l�԰��D�j��
end 

function Z34_BOSS3_EndBattle()	-- BOSS���
	DebugMsg( 0, 0, "Z34_BOSS3_EndBattle")
	local Boss = OwnerID()
	local Room = ReadRoleValue( Boss, EM_RoleValue_RoomID )
	DebugMsg( 0, 0, "**g_Phase="..g_Phase[Room])
	

	if ReadRoleValue( Boss, EM_RoleValue_IsDead ) == 0 then --zzzz ���S���~���m
		g_Phase[Room] = 2 --���q�X�� "���"
		SetModeEx( Boss  , EM_SetModeType_Strikback, false)  ---����
		SetModeEx( Boss  , EM_SetModeType_Searchenemy, false)   -- ����
		SetModeEx( Boss  , EM_SetModeType_Fight, false)---���
		
		
		SetModeEx( g_Door.FrontDoor[Room], EM_SetModeType_Obstruct, false ) -- �}�e��
		SetModeEx( g_Door.FrontDoor[Room], EM_SetModeType_Show, false ) 	
	end 	
end

function Z34_BOSS3_Dead()	-- BOSS���`
	DebugMsg( 0, 0, "Z34_BOSS3_Dead")
	local Boss = OwnerID()
	local Room = ReadRoleValue( Boss, EM_RoleValue_RoomID )
	local Zone = ReadRoleValue( Boss, EM_RoleValue_ZoneID )
	
	g_Phase[Room] = 3 --���q�X�� "���`"
	
	if Zone ~= 940 then	-- �קK����հϴ��ծɳ����A�P�ϼ@�����_
		Cl_Resist_HackersBossDead( Boss );	-- ���b�Ⱦ��� ���󪫥󦺤`
	end
	
	SetModeEx( g_Door.FrontDoor[Room], EM_SetModeType_Obstruct, false ) -- �}�e���
	SetModeEx( g_Door.FrontDoor[Room], EM_SetModeType_Show, false ) 	
	SetModeEx( g_Door.RearDoor[Room], EM_SetModeType_Obstruct, false ) 
	SetModeEx( g_Door.RearDoor[Room], EM_SetModeType_Show, false ) 	
end


----------------------------------------------------�������԰��D�j��----------------------------------------------------


function Z34_BOSS3_Control_BattleLoop(Control, Boss, Zone, Room)	

	DebugMsg( 0, 0, "Z34_BOSS3_Control_BattleLoop")
	
	local Counter = {} 	-- �p�ƾ��A�Ω�έp�԰��ɶ�
	local DARKCURSE = 1
	local ICEBLADE = 2
	local FIREBLADE = 3
	local EARTHSTRIKE = 4
	local THUNDERSTRIKE = 5
	
	local nowHP = 0 --�p��BOSS��q
	local maxHP = 0
	local HP = 0
	
	Counter[DARKCURSE] = 0
	Counter[ICEBLADE] = 0
	Counter[FIREBLADE] = 0
	Counter[EARTHSTRIKE] = 0
	Counter[THUNDERSTRIKE] = 0
	
	SysCastSpellLv( Boss, Boss, g_Magic.DARKCURSE.DmgID,1) --�}���t�G
	
	while g_Phase[Room] ~= 0 do --�԰��D�j��
	
		nowHP = ReadRoleValue( Boss, EM_RoleValue_HP )
		maxHP = ReadRoleValue( Boss, EM_RoleValue_MaxHP )
		HP = nowHP/maxHP
	
		for i = 1, #Counter do --�p�ɾ�
			Counter[i] = Counter[i] + 1
		end
		
		if g_Phase[Room] == 1 then --�԰���
			
			--*************************************************************************************************�԰��ۦ�
			
			---------------------------------------------------------------------------------------------�t�G
			if Counter[DARKCURSE] >= g_Magic.DARKCURSE.CD and HateListCount(Boss) > 0 then
			
				
				SysCastSpellLv( Boss, Boss, g_Magic.DARKCURSE.DmgID,1) --�t�G
				sleep(30)
				Counter[DARKCURSE] = 0
			---------------------------------------------------------------------------------------------�t�G
			
			---------------------------------------------------------------------------------------------�B��
			elseif Counter[ICEBLADE] >= g_Magic.ICEBLADE.CD and HateListCount(Boss) > 0 then
				
				local HateList = GetHateList( Boss, HateListCount(Boss) ) 
				table.sort( HateList, CompHatePoint ) 	-- �N����������a�̷Ӥ���Ѱ��ܧC�Ƨ�
				
				local Target = nil
				if GetDistance( Boss, HateList[1].Guid ) <= g_Magic.ICEBLADE.Range then
					Target = HateList[1].Guid 
					
					StopMove(Boss, false) 
					SetModeEx( Boss, EM_SetModeType_Move, false )     -- �Ĩį��n
					
					
					SysCastSpellLv( Boss, Target, g_Magic.ICEBLADE.CG1ID,1) --���ۯS��
					Castspell( Boss, Boss, g_Magic.ICEBLADE.ActID) --����
					sleep(8)
					local Obj = Hao_CreateSpellObj( Boss ) --�S�ĳz���y
					local ObjPos = Vector_GetRolePos( Boss )
					AddBuff ( Obj, 505453, 1, -1 ) --��j�N
	
					SysCastSpellLv( Obj, Obj, g_Magic.ICEBLADE.CG2ID,1) --�X�ۯS��
					
					SetModeEx( Boss, EM_SetModeType_Move, true )      -- �Ĩį��n
					sleep(3)
					SysCastSpellLv( Boss, Obj, g_Magic.ICEBLADE.DmgID,1) --�ˮ`
					sleep(5)
					SysCastSpellLv( Boss, Obj, g_Magic.ICEBLADE.DmgID,1) --�ˮ`
					sleep(5)
					SysCastSpellLv( Boss, Obj, g_Magic.ICEBLADE.DmgID,1) --�ˮ`
					sleep(5)
					SysCastSpellLv( Boss, Obj, g_Magic.ICEBLADE.DmgID,1) --�ˮ`
					sleep(5)
					SysCastSpellLv( Boss, Obj, g_Magic.ICEBLADE.DmgID,1) --�ˮ`
					Counter[ICEBLADE] = 0
					
				-----------------------------------------------------------------------------------------�B���l�[�B��
				
				if HP < 0.6 then
					
					local HateList = GetHateList( Boss, HateListCount(Boss) ) 

					if #HateList > 1 then --�p�G���h�H�h�ƩZ
						table.sort( HateList, CompHatePoint ) 	-- �N����������a�̷Ӥ���Ѱ��ܧC�Ƨ�
						
						local target = math.random(2,#HateList) --�Z�H�~�ؼ�
						CallPlot( Boss, "Z34_BOSS3_ICESPEAR_LOCK", HateList[target].Guid)

					elseif #HateList == 1 then
						CallPlot( Boss, "Z34_BOSS3_ICESPEAR_LOCK", HateList[1].Guid) --��H�D�Ԫ������ߤ@�ؼ�
					end
					
				end
				
				-----------------------------------------------------------------------------------------�B���l�[�B��

				else
					DebugMsg( 0, Room, "�B�� OutofRange")
					Counter[ICEBLADE] = 3	
				end
			---------------------------------------------------------------------------------------------�B��
			
			---------------------------------------------------------------------------------------------���}
			elseif Counter[FIREBLADE] >= g_Magic.FIREBLADE.CD and HateListCount(Boss) > 0 then
				
				StopMove(Boss, false) 
				SetModeEx( Boss, EM_SetModeType_Move, false )     -- �Ĩį��n
				
				SysCastSpellLv( Boss, Boss, g_Magic.FIREBLADE.CG1ID,1) --���ۯS��
				sleep(10)
				Castspell( Boss, Boss, g_Magic.FIREBLADE.ActID) --����
				sleep(8)
				local Obj = Hao_CreateSpellObj( Boss)
				local Objdir = readrolevalue(Obj, em_rolevalue_dir)
				local Obj2dir = Objdir+90
				if Obj2dir > 360 then
					Obj2dir = Obj2dir -360
				end
				local Obj2 = Hao_CreateSpellObj( Obj, Obj2dir) --�S�ĳz���y
				
				SysCastSpellLv( Obj, Obj, g_Magic.FIREBLADE.CG2ID,1) --�X�ۯS��
				SysCastSpellLv( Obj2, Obj2, g_Magic.FIREBLADE.CG2ID,1) --�X�ۯS��
				
				sleep(5)
				local ObjPos = Vector_GetRolePos( Obj ) 
				
				local EndPos = {}
				for i = 1,4 do
					local VecDir = Vector_DirToVector( ObjDir+90*i ) 	-- ������V�q�A�p��ROM�����׮ɡA�n���� 90 �ר��~�|�ܬ����T�V�q�C
					EndPos[i] = ObjPos + VecDir * g_Magic.FIREBLADE.Length --���� 
				end
				SetModeEx( Boss, EM_SetModeType_Move, true )      -- �Ĩį��n
				
				
				local HateList = GetHateList( Boss, HateListCount(Boss) ) 
				
				for t = 1,4 do
					for i = 1,4 do
					
						for p = 1, #HateList do
							local Target = HateList[p].Guid
							local TargetPos = Vector_GetRolePos( Target ) 
							--�ˬd�ؼЬO�_�b���w���B�e�����u�d�򤺡A�_�^��Nil�B�O���ܦ^�ǥؼлP�_�I���Z�� ( �_�I�y�СB���I�y�СB�e�סB���סB�ؼЮy��)
							local Status = Vector_CheckShootObj( ObjPos, EndPos[i], g_Magic.FIREBLADE.Width, g_Magic.FIREBLADE.Height, TargetPos ) 
							if Status then
								SysCastSpellLv( Boss, Target, g_Magic.FIREBLADE.DmgID,1) --�ˮ`
							end
						end
						
						
					end
				sleep(6)
				end
				
			Counter[FIREBLADE] = 0
			---------------------------------------------------------------------------------------------���}

			---------------------------------------------------------------------------------------------�äb+�٦a
			elseif Counter[EARTHSTRIKE] >= g_Magic.EARTHSTRIKE.CD and HateListCount(Boss) > 0 and HP < 0.6 then
				StopMove(Boss, false) 
				SetModeEx( Boss, EM_SetModeType_Move, false )     -- �Ĩį��n
				local Obj = Hao_CreateSpellObj( Boss)
				AddBuff ( Obj, 505453, 1, -1 ) --��j�N

				Castspell( Boss, Boss, g_Magic.EARTHSTRIKE.ActID) --�X��ʧ@
				sleep(15)
				SysCastSpellLv( Obj, Obj, g_Magic.EARTHSTRIKE.CG1ID,1) --�E��S��
				sleep(2)
				SysCastSpellLv( Boss, Obj, g_Magic.EARTHSTRIKE.Dmg1ID,1) --�E��p�ˮ`
				sleep(2)
				SysCastSpellLv( Boss, Obj, g_Magic.EARTHSTRIKE.Dmg1ID,1) --�E��p�ˮ`
				sleep(2)
				SysCastSpellLv( Boss, Obj, g_Magic.EARTHSTRIKE.Dmg1ID,1) --�E��p�ˮ`
				sleep(2)
				SysCastSpellLv( Boss, Obj, g_Magic.EARTHSTRIKE.Dmg1ID,1) --�E��p�ˮ`
				sleep(2)
				SysCastSpellLv( Boss, Obj, g_Magic.EARTHSTRIKE.Dmg1ID,1) --�E��p�ˮ`
				sleep(10)
				SysCastSpellLv( Obj, Obj, g_Magic.EARTHSTRIKE.CG2ID,1) --�X��S��
				sleep(4)
				SysCastSpellLv( Boss, Obj, g_Magic.EARTHSTRIKE.Dmg2ID,1) --�X��ˮ`+����
				
				sleep(10)
				SetModeEx( Boss, EM_SetModeType_Move, true )      -- �Ĩį��n
				
				Counter[EARTHSTRIKE] = 0
			---------------------------------------------------------------------------------------------�äb+�٦a
			
			---------------------------------------------------------------------------------------------�p��
			elseif Counter[THUNDERSTRIKE] >= g_Magic.THUNDERSTRIKE.CD and HateListCount(Boss) > 0 and HP < 0.8 then

				StopMove(Boss, false) 
				SetModeEx( Boss, EM_SetModeType_Move, false )     -- �Ĩį��n
				
				Castspell( Boss, Boss, g_Magic.THUNDERSTRIKE.ActID) --�X��ʧ@
				sleep(5)
				SysCastSpellLv( Boss, Boss, g_Magic.THUNDERSTRIKE.Dmg1ID,1) --�E��p�ˮ`
				sleep(5)
				SysCastSpellLv( Boss, Boss, g_Magic.THUNDERSTRIKE.Dmg1ID,1) --�E��p�ˮ`
				sleep(5)
				SysCastSpellLv( Boss, Boss, g_Magic.THUNDERSTRIKE.Dmg1ID,1) --�E��p�ˮ`
				sleep(5)
				SysCastSpellLv( Boss, Boss, g_Magic.THUNDERSTRIKE.Dmg1ID,1) --�E��p�ˮ`
				sleep(5)
				SysCastSpellLv( Boss, Boss, g_Magic.THUNDERSTRIKE.Dmg1ID,1) --�E��p�ˮ`
				sleep(5)
				SysCastSpellLv( Boss, Boss, g_Magic.THUNDERSTRIKE.Dmg1ID,1) --�E��p�ˮ`
				sleep(8)
				SysCastSpellLv( Boss, Boss, g_Magic.THUNDERSTRIKE.Dmg2ID,1) --�X��j�ˮ`
				
				sleep(10)
				SetModeEx( Boss, EM_SetModeType_Move, true )      -- �Ĩį��n
				
				Counter[THUNDERSTRIKE] = 0
			---------------------------------------------------------------------------------------------�p��


			end
			--*************************************************************************************************�԰��ۦ�
			
			
				
		elseif g_Phase[Room] == 2 then --���
		
			DebugMsg( 0, 0, "Phase_2")
			sleep(10) --�º��ı�ĪG
			DelObj( g_Boss[Room])
			sleep(10) --�º��ı�ĪG
			local ControlPos = Vector_GetRolePos(Control) 
			local ControlDir = ReadRoleValue( Control, EM_RoleValue_Dir )
			local VecDir = Vector_DirToVector( ControlDir + 90 + 180 ) 
			local BossPos = ControlPos + VecDir * 10 	-- ����󤤱������ 10 ����m

			Boss = CreateObj( g_Boss.NpcID[Zone], BossPos.X, BossPos.Y, BossPos.Z, ControlDir, 1 ) 
			g_Boss[Room] = Boss
			
			SetModeEx( Boss  , EM_SetModeType_Strikback, true)  ---����
			SetModeEx( Boss  , EM_SetModeType_Searchenemy,false)   -- ����
			SetModeEx( Boss  , EM_SetModeType_Fight, false)  ---���
			AddToPartition( Boss, Room ) 
			-- if Zone ~= 940 then	-- �קK����հϴ��ծɳ����A�P�ϼ@�����_
				-- Cl_Resist_HackersBossNum( Boss ) 	-- ���b�Ⱦ��� ���󪫥󲣥�
			-- end
			g_Phase[Room] = 10

		elseif g_Phase[Room] == 3 then --���`
		
			DebugMsg( 0, 0, "Phase_3")
			g_Phase[Room] = 0
			
		elseif g_Phase[Room] == 10 then --���m�w���ɶ�
		
			DebugMsg( 0, 0, "Phase_10")
			sleep(40) --�|��w���ɶ� ���n�ߨ�i�J����
			SetModeEx( Boss  , EM_SetModeType_Searchenemy,true)   -- ����
			g_Phase[Room] = 0
			
		end
		sleep(10)
	end
end

----------------------------------------------------�U���B�~PLUS FUNCTINO----------------------------------------------------
--�t�GDOT�t�C
function Z34_BOSS3_502008_CHECK() --�t�GDOT �ˬd
	
	local Player = TargetID()
	local Zone = ReadRoleValue( Player, EM_RoleValue_ZoneID ) 	
	if CheckBuff( Player , g_BuffID.DARK[Zone]) or CheckBuff( Player , g_BuffID.ICE[Zone]) or CheckBuff( Player , g_BuffID.FIRE[Zone]) or CheckBuff( Player , g_BuffID.FRZ) then --���t�B���ᵲ���W
		return false
	else
		AddBuff (Player, g_BuffID.DARK[Zone], 1, -1 )
		return false
	end
end

function Z34_BOSS3_502009_DARKEND() --502008�t�G�ɶ���AĲ�o491475�a502009����LUA�y���Y���t�G�ˮ`

	local Player = OwnerID()
	local Room = ReadRoleValue( Player, EM_RoleValue_RoomID ) 
	local Boss = g_Boss[Room]
	
	SysCastSpellLv( Boss, Player, g_Magic.DARKEND.DmgID,1) --�Y���t�G�ˮ`(����)
end

--�H�BDOT�t�C
function Z34_BOSS3_501984_CHECK() --�H�BDOT �ˬd

	local Player = TargetID()
	local Zone = ReadRoleValue( Player, EM_RoleValue_ZoneID ) 	

	if CheckBuff( Player , g_BuffID.ICE[Zone]) or CheckBuff( Player , g_BuffID.FRZ ) then --���B���ᵲ�����W
		return false
	elseif CheckBuff( Player , g_BuffID.FIRE[Zone]) then --������B
		CancelBuff( Player, g_BuffID.FIRE[Zone] )
		AddBuff (Player, g_BuffID.ICE[Zone], 1, -1 )
		return false
	elseif CheckBuff( Player , g_BuffID.DARK[Zone]) then --���t��B
		CancelBuff( Player, g_BuffID.DARK[Zone] )
		AddBuff ( Player, g_BuffID.ICE[Zone], 1, -1 )
		return false
	else
		AddBuff ( Player, g_BuffID.ICE[Zone], 1, -1 )
		return false
	end
end

function Z34_BOSS3_502074_ICEEND() --501984�H���ɶ���AĲ�o491468�a502074����LUA�y���P���U�ɶˮ`

	local Player = OwnerID()
	local Room = ReadRoleValue( Player, EM_RoleValue_RoomID )  
	local Boss = g_Boss[Room]
	
	SysCastSpellLv( Boss, Player, g_Magic.ICEEND.DmgID,1) --�H���ᵲ�B������
end

--�P��DOT�t�C
function Z34_BOSS3_501986_CHECK() --�P��DOT �ˬd

	local Player = TargetID()
	local Zone = ReadRoleValue( Player, EM_RoleValue_ZoneID ) 	
	if CheckBuff( Player , g_BuffID.FIRE[Zone]) or CheckBuff( Player , g_BuffID.FRZ) then --�������ᵲ�����W
		return false
	elseif CheckBuff( Player , g_BuffID.ICE[Zone]) then --���B���
		CancelBuff( Player, g_BuffID.ICE[Zone] )
		AddBuff ( Player, g_BuffID.FIRE[Zone], 1, -1 )
		return false
	elseif CheckBuff( Player , g_BuffID.DARK[Zone]) then --���t���
		CancelBuff( Player, g_BuffID.DARK[Zone] )
		AddBuff ( Player, g_BuffID.FIRE[Zone], 1, -1 )
		return false
	else
		AddBuff ( Player, g_BuffID.FIRE[Zone], 1, -1 )
		return false
	end
end

function Z34_BOSS3_501989_FIREEND() --501986�P���ɶ���AĲ�o491467�a501989����LUA�y���P���U�ɶˮ`

	local Player = OwnerID()
	local Room = ReadRoleValue( Player, EM_RoleValue_RoomID )  
	local Boss = g_Boss[Room]
	
	SysCastSpellLv( Boss, Player, g_Magic.FIREEND.DmgID,1) --�P���U�ɶˮ`
end

--�B��
function Z34_BOSS3_ICESPEAR_LOCK(Target) --�B�������w���ͳz���y

	local Boss = OwnerID()
	for i = 1,20 do
		local TargetPos = Vector_GetRolePos( Target ) 
		local TargetDir = readrolevalue(Target, em_rolevalue_dir)
		local Objdir = TargetDir+rand(360)
		local VecDir = Vector_DirToVector( Objdir )
		
		local ICEPos = TargetPos + VecDir * (rand(60)+10)
		local Obj = Hao_CreateSpellObjbyPos( ICEPos ) --�S�ĳz���y
		AddBuff ( Obj, 621745, 1, -1 ) --��j�N
		CallPlot( Obj, "Z34_BOSS3_ICESPEAR", Boss)  --�z���y����B��
	sleep(2)
	end
end

function Z34_BOSS3_ICESPEAR(Boss) --�B��z���y��wĵ�P�ˮ`
	local Obj = OwnerID() --�z���y
	SetDir( Obj, rand(360) )
	SysCastSpellLv( Obj, Obj, g_Magic.ICESPEAR.PreID,1) --�wĵ�S��
	sleep(12)
	SysCastSpellLv( Obj, Obj, g_Magic.ICESPEAR.CG1ID,1) --��X�S��
	sleep(2)
	SysCastSpellLv( Boss, Obj, g_Magic.ICESPEAR.DmgID,1) --�ˮ`
end

--�٦a
function Z34_BOSS3_502031_CHECK() --�B�����|�^��
	if CheckBuff( TargetID() , 501988) then
		return false
	end
end

--�p��
function Z34_BOSS3_502069_CHECK() --�p�ޥu�����{�A���P��w��
	local Player = TargetID()
	local Boss = OwnerID()
	
	if GetDistance( Boss, Player ) <= g_Magic.THUNDERSTRIKE.SafeRange then
		return false
	end
	
end

function Z34_BOSS3_502070_CHECK() --�p�ޥu�����{�A���P��w�� �j�ˮ`�� �h�S��
	local Player = TargetID()
	local Boss = OwnerID()
	
	if GetDistance( Boss, Player ) <= g_Magic.THUNDERSTRIKE.SafeRange then
		return false
	else
	SysCastSpellLv( Boss, Player, g_Magic.THUNDERSTRIKE.CG1ID,1) --���p�S��	g_Magic.THUNDERSTRIKE.CG1ID = 802645
	end
	
end

----------------------------------------------------���ե�----------------------------------------------------
function GGdemodemo()
	local Boss = OwnerID()
	local Room = ReadRoleValue( Boss, EM_RoleValue_RoomID )  
	g_Boss[Room] = Boss
	
	while true do 
		DebugMsg( 0, 0, "-----------------------") 
		StopMove(Boss, false) 
		SetModeEx( Boss, EM_SetModeType_Move, false )     -- �Ĩį��n
		
		SysCastSpellLv( Boss, Boss, g_Magic.FIREBLADE.CG1ID,1) --���ۯS��
		sleep(10)
		Castspell( Boss, Boss, g_Magic.FIREBLADE.ActID) --����
		sleep(8)
		local Obj = Hao_CreateSpellObj( Boss)
		local Objdir = readrolevalue(Obj, em_rolevalue_dir)
		local Obj2dir = Objdir+90
		if Obj2dir > 360 then
			Obj2dir = Obj2dir -360
		end
		local Obj2 = Hao_CreateSpellObj( Obj, Obj2dir) --�S�ĳz���y
		
		SysCastSpellLv( Obj, Obj, g_Magic.FIREBLADE.CG2ID,1) --�X�ۯS��
		SysCastSpellLv( Obj2, Obj2, g_Magic.FIREBLADE.CG2ID,1) --�X�ۯS��
		
		sleep(5)
		local ObjPos = Vector_GetRolePos( Obj ) 
		
		local EndPos = {}
		for i = 1,4 do
			local VecDir = Vector_DirToVector( ObjDir+90*i ) 	-- ������V�q�A�p��ROM�����׮ɡA�n���� 90 �ר��~�|�ܬ����T�V�q�C
			EndPos[i] = ObjPos + VecDir * g_Magic.FIREBLADE.Length --���� 
		end
		SetModeEx( Boss, EM_SetModeType_Move, true )      -- �Ĩį��n
		
		
		local HateList = GetHateList( Boss, HateListCount(Boss) ) 
		
		for t = 1,4 do
			for i = 1,4 do
			
				
					local Target = 11665413
					local TargetPos = Vector_GetRolePos( Target ) 
					--�ˬd�ؼЬO�_�b���w���B�e�����u�d�򤺡A�_�^��Nil�B�O���ܦ^�ǥؼлP�_�I���Z�� ( �_�I�y�СB���I�y�СB�e�סB���סB�ؼЮy��)
					local Status = Vector_CheckShootObj( ObjPos, EndPos[i], g_Magic.FIREBLADE.Width, g_Magic.FIREBLADE.Height, TargetPos ) 
					if Status then
						SysCastSpellLv( Boss, Target, g_Magic.FIREBLADE.DmgID,1) --�ˮ`
					end
			end
		sleep(6)
		end
		
		
		sleep(20)
	end
end



--106266
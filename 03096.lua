----	�X�лP����	----
--781365	�X��
--106952	�}�H������
--108329	������


--108276	Raid_���׺�
--108277	Raid_���
--108290	Raid_�Ʋ�
--106791	�S�ĳz���y_�Y��boss�ۦP����

--103386	N_���׺�_�S�ĳz���y
--103387	N_���׺�
--103388	N_���
--103389	N_�Ʋ�

--103390	EZ_���׺�_�S�ĳz���y
--103391	EZ_���׺�
--103392	EZ_���
--103393	EZ_�Ʋ�

--106876	��(��s��)
	--0	Boss�X���I
	--1	����X���I
	--2	�Ʋ��X���I
	--3	����X���I
	--4	�e���X���I

----	�򥻪k�N�P�k�N���X	----

local Z29_bico_Boss1_Fight_Click = {}
local Z29_bico_Boss1_Bloodtaste_Table = {}

function bico_Z29_Boss1_Ctrl()
local Ctrl = OwnerID()
local BossNPC = { 108276,103387,103391 }	--Raid,N,EZ
local Mob_BloodNPC = { 108277,103388,103392 }	--Raid,N,EZ
local Mob_CrazyNPC = { 108290,103389,103393}	--Raid,N,EZ
local ViolentTime = { 480, 360 }
local ZoneID = ReadRoleValue( Ctrl, EM_RoleValue_ZoneID )
local RoomID = ReadRoleValue( Ctrl, EM_RoleValue_RoomID )
local zone
	if ZoneID == 163 then		--hard
		zone =1
	elseif ZoneID == 164 then	--normal
		zone = 2
	elseif ZoneID == 165 then	--easy
		zone = 3
	elseif ZoneID == 938 then	--���հ�
		zone =1	
	end
local Time
	if ZoneID == 163 then		--hard	8�����g��
		Time =1
	elseif ZoneID == 164 then	--normal   6�����g��
		Time = 2
	elseif ZoneID == 938 then	--���հ�
		Time =1
	end
local ViolentTiming = 0
local Door_Front
local Door_Front_Click = 0	--�e���}��, �}=0, ��=1
Z29_bico_Boss1_Fight_Click[RoomID] = 0		--�԰��}��, �D�԰�=0, �԰�=1
Z29_bico_Boss1_Bloodtaste_Table[RoomID] = {}

--��l���A--
	local x, y, z, dir = DW_Location( 781365, 0 )			--�ھںX�l��m���� [Boss]
	local Boss = CreateObj( BossNPC[zone], x, y, z, dir, 1 )
--	SetModeEx( Boss, EM_SetModeType_Move, false)		--����(���i)	--���ե�
	AddToPartition( Boss, RoomID )					
	
	local  x, y, z, dir = DW_Location( 781365, 1 )			--�ھںX�l��m���� [���]
	local Mob_Blood = CreateObj( Mob_BloodNPC[zone], x, y, z, dir, 1 )
	AddToPartition( Mob_Blood, RoomID )	
	WriteRoleValue( Boss, EM_RoleValue_Register1, Mob_Blood )
	WriteRoleValue( Mob_Blood, EM_RoleValue_PID, Boss )	
	AddBuff(Mob_Blood,625092,0,-1)
	
	local  x, y, z, dir = DW_Location( 781365, 2 )			--�ھںX�l��m���� [�Ʋ�]
	local Mob_Crazy = CreateObj( Mob_CrazyNPC[zone], x, y, z, dir, 1 )
	AddToPartition( Mob_Crazy, RoomID )
	WriteRoleValue( Boss, EM_RoleValue_Register2, Mob_Crazy )	
	WriteRoleValue( Mob_Crazy, EM_RoleValue_PID, Boss )
	WriteRoleValue( Mob_Crazy, EM_RoleValue_Register1, Mob_Blood )
	AddBuff(Mob_Crazy,625092,0,-1)	
	AddBuff(Mob_Crazy,625093,0,-1)		
	
	local  x, y, z, dir = DW_Location( 781365, 3 )			--�ھںX�l��m [���ͫ��]
	local Door_Back = CreateObj( 106876, x, y, z, dir, 1 )
	SetModeEx( Door_Back, EM_SetModeType_Mark, false)		--�аO(���i)
	SetModeEx( Door_Back, EM_SetModeType_HideName, false)	--�W�r(����)
	SetModeEx( Door_Back, EM_SetModeType_NotShowHPMP, false)	--���(���q)
	SetModeEx( Door_Back, EM_SetModeType_Strikback, false)	--����(���i)
	SetModeEx( Door_Back, EM_SetModeType_Move, false)		--����(���i)
	SetModeEx( Door_Back, EM_SetModeType_Fight, false)		--���(���i)
	SetModeEx( Door_Back, EM_SetModeType_Searchenemy, false)	--����(���i)
	SetModeEx( Door_Back, EM_SetModeType_Obstruct, true)		--����(�i)
	AddToPartition( Door_Back, RoomID )
	
	local gg=DW_Ran(36);
	for i=1 ,2,1 do	
		local R = DW_Ran(8)
		local x,y,z,dir = DW_Location(Ctrl)	
		local Nx,Ny,Nz,Ndir = DW_NewLocation(gg()*10,DW_Rand(6)*15,x,y,z,dir)
		local stone = CreateObj( 106952, Nx, Ny, Nz, Ndir, 1 )
			SetModeEx( stone, EM_SetModeType_Fight, false )
			SetModeEx( stone, EM_SetModeType_Move, false )
			SetModeEx( stone, EM_SetModeType_NotShowHPMP, false )
			SetModeEx( stone, EM_SetModeType_Strikback, false)	--����(���i)
			SetModeEx( stone, EM_SetModeType_Move, false)		--����(���i)
			SetModeEx( stone, EM_SetModeType_Fight, false)		--���(���i)
			SetModeEx( stone, EM_SetModeType_Searchenemy, false)	--����(���i)
	--		SetModeEx( stone, EM_SetModeType_Obstruct, false)		--����(�i)
			SetModeEX( stone, EM_SetModeType_Gravity, true)	--���O
			SetPlot(stone,"collision","bico_Z29_106952_collision",0)
		AddToPartition( stone, RoomID )
	end

--�`��AI��--
	while 1 do
		sleep(10)

		--Boss���`--
		if (ReadRoleValue( Boss, EM_RoleValue_IsDead ) == 1 )then--and  ReadRoleValue( Mob_Blood, EM_RoleValue_IsDead ) == 1 and ReadRoleValue( Mob_Crazy, EM_RoleValue_IsDead ) == 1) or ( CheckID( Boss ) == false ) then 
			DebugMsg( 0 , 0 , "Boss is dead !!" );
			ScriptMessage( Boss, -1, 2, "[SC_108276_03]", 0 )	--BOSS���`�r��
			DelObj( Mob_Blood );
			DelObj( Mob_Crazy );
			Lua_DavisDelObj( 106952 );--�M���}�H������
			DelObj( Door_Back )	--�}�ҫ��
			DelObj( Door_Front )	--�}�ҫe��	
			Z29_bico_Boss1_Fight_Click[RoomID] = nil
			Z29_bico_Boss1_Bloodtaste_Table[RoomID] = nil
			Lua_DavisDelObj( 106952 ) 
			break
		end	


		--Boss�����D0, ��ܶ}��--
		if HateListCount( Boss ) ~= 0 then						--Boss��������H(�԰��}�l)d
			--�}��--
			if Z29_bico_Boss1_Fight_Click[RoomID] == 0 then							--��l�԰��}���p�G��0
				BeginPlot( Boss, "bico_Z29_Boss1_Ai", 0 )				--����BossAiScript
				BeginPlot( Mob_Blood, "bico_Z29_Boss1_Blood_Ai", 0 )		--������AiScript
				BeginPlot( Mob_Crazy, "bico_Z29_Boss1_Crazy_Ai", 0 )		--����Ʋ�AiScript
									
				if Door_Front_Click == 0 then					--�e���}���p�G��0
					local  x, y, z, dir = DW_Location( 781365, 4 )		--�ھںX�l��m [���ͫe��]
					Door_Front = CreateObj( 106876, x, y, z, dir, 1 )
					SetModeEx( Door_Front, EM_SetModeType_Mark, false )			--�аO(���i)
					SetModeEx( Door_Front, EM_SetModeType_HideName, false )		--�W�r(����)
					SetModeEx( Door_Front, EM_SetModeType_NotShowHPMP, false )	--���(���q)
					SetModeEx( Door_Front, EM_SetModeType_Strikback, false )		--����(���i)
					SetModeEx( Door_Front, EM_SetModeType_Move, false )			--����(���i)
					SetModeEx( Door_Front, EM_SetModeType_Fight, false )			--���(���i)
					SetModeEx( Door_Front, EM_SetModeType_Searchenemy, false )		--����(���i)
					SetModeEx( Door_Front, EM_SetModeType_Obstruct, true )		--����(�i)
					AddToPartition( Door_Front, RoomID )	
					Door_Front_Click = 1						--�e���}���i�J�԰���, �]�w��1
				end

				Z29_bico_Boss1_Fight_Click[RoomID] = 1								--�԰��}��ON
			end

			--�g�ɾ���
			ViolentTiming = ViolentTiming + 1
			if ViolentTiming == ViolentTime[Time] then
				ScriptMessage( Boss, -1, 2, "[SC_108276_04]", 0 )	--�g�ɦr��
				AddBuff(Boss, 625097,0,-1)
			end
		end
		--Boss�����0, 1: ����; 2: Boss���`--
		if HateListCount( Boss ) == 0 then						--Boss������L�H(����)
			--����--
			if ReadRoleValue( Boss, EM_RoleValue_IsDead ) == 0 and CheckID( Boss ) == true then		--Boss�S�����`�����p�U
				if Door_Front_Click == 1 then
					DebugMsg( 0 , 0 , "Players are dead !!" );
					ScriptMessage( Boss, -1, 2, "[SC_108276_02]", 0 )	--���Φr��
	--				DelObj(Door_Back)	--�R����� (���դ�K��)	
					Lua_DavisDelObj( 106952 );--�M���}�H������
					DelObj(Door_Front)	--�R���e��	
					Door_Front_Click = 0	--���s�e���}�����A��0
				end
				if Z29_bico_Boss1_Fight_Click[RoomID] == 1 then
					DelObj( Boss )
					DelObj( Mob_Blood )
					DelObj( Mob_Crazy )
					Lua_DavisDelObj( 106952 ) 
					local x, y, z, dir = DW_Location( 781365, 0 )			--�ھںX�l��m���� [Boss]
					Boss = CreateObj( BossNPC[zone], x, y, z, dir, 1 )
	--				SetModeEx( Boss, EM_SetModeType_Move, false)			--����(���i)	--���ե�
					AddToPartition( Boss, RoomID )	
					local  x, y, z, dir = DW_Location( 781365, 1 )			--�ھںX�l��m���� [���]
					Mob_Blood = CreateObj( Mob_BloodNPC[zone], x, y, z, dir, 1 )
					AddToPartition( Mob_Blood, RoomID )	
					WriteRoleValue( Boss, EM_RoleValue_Register1, Mob_Blood )
					WriteRoleValue( Mob_Blood, EM_RoleValue_PID, Boss )	
					AddBuff(Mob_Blood,625092,0,-1)		
					local  x, y, z, dir = DW_Location( 781365, 2 )			--�ھںX�l��m���� [�Ʋ�]
					Mob_Crazy = CreateObj( Mob_CrazyNPC[zone], x, y, z, dir, 1 )
					AddToPartition( Mob_Crazy, RoomID )
					WriteRoleValue( Boss, EM_RoleValue_Register2, Mob_Crazy )	
					WriteRoleValue( Mob_Crazy, EM_RoleValue_PID, Boss )
					WriteRoleValue( Mob_Crazy, EM_RoleValue_Register1, Mob_Blood )	
					AddBuff(Mob_Crazy,625092,0,-1)	
					AddBuff(Mob_Crazy,625093,0,-1)	
		
					local gg=DW_Ran(36);
					for i=1 ,2,1 do	
						local R = DW_Ran(8)
						local x,y,z,dir = DW_Location(Ctrl)	
						local Nx,Ny,Nz,Ndir = DW_NewLocation(gg()*10,DW_Rand(6)*15,x,y,z,dir)
						local stone = CreateObj( 106952, Nx, Ny, Nz, Ndir, 1 )
							SetModeEx( stone, EM_SetModeType_Fight, false )
							SetModeEx( stone, EM_SetModeType_Move, false )
							SetModeEx( stone, EM_SetModeType_NotShowHPMP, false )
							SetModeEx( stone, EM_SetModeType_Strikback, false)	--����(���i)
							SetModeEx( stone, EM_SetModeType_Move, false)		--����(���i)
							SetModeEx( stone, EM_SetModeType_Fight, false)		--���(���i)
							SetModeEx( stone, EM_SetModeType_Searchenemy, false)	--����(���i)
						--	SetModeEx( stone, EM_SetModeType_Obstruct, false)		--����(�i)
							SetModeEX( stone, EM_SetModeType_Gravity, true)	--���O
							SetPlot(stone,"collision","bico_Z29_106952_collision",0)
						AddToPartition( stone, RoomID )
					end				
				Z29_bico_Boss1_Fight_Click[RoomID] = 0	
				Z29_bico_Boss1_Bloodtaste_Table[RoomID] = {}	
				end
			end
			--[[
			--Boss���`--�h��e���h
			if (ReadRoleValue( Boss, EM_RoleValue_IsDead ) == 1 and  ReadRoleValue( Mob_Blood, EM_RoleValue_IsDead ) == 1 and ReadRoleValue( Mob_Crazy, EM_RoleValue_IsDead ) == 1) or ( CheckID( Boss ) == false ) then 
				DebugMsg( 0 , 0 , "Boss is dead !!" );
				ScriptMessage( Boss, -1, 2, "[SC_108276_03]", 0 )	--BOSS���`�r��
				Lua_DavisDelObj( 106952 );--�M���}�H������
				DelObj( Door_Back )	--�}�ҫ��
				DelObj( Door_Front )	--�}�ҫe��	
				Z29_bico_Boss1_Fight_Click[RoomID] = nil
				Z29_bico_Boss1_Bloodtaste_Table[RoomID] = nil
				Lua_DavisDelObj( 106952 ) 
				break
			end	
			]]--		
		end
	end
end

function bico_Z29_Boss1_Ai()
	local Boss = OwnerID()
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID )
	local SkillTime = 0		--�ޯ�p�ɾ�
	local BossFightTime = 0		--�g�ɭp�ɾ�
	local SkillTable = {	851348,
				851349;	};
	local Hate_table = KS_GetHateList( Boss, 1 )
	local Mob_Blood = ReadRoleValue( Boss, EM_RoleValue_Register1 )
	local Mob_Crazy = ReadRoleValue( Boss, EM_RoleValue_Register2 )
	local TarGID
	local WolfNum = 2
	ScriptMessage( Boss, -1, 2, "[SC_108276_01]", 0 )	--�}���r��
	DebugMsg( 0 , 0 , "Let's Party !!" );
	while 1 do
		sleep(10)
		if Z29_bico_Boss1_Fight_Click[RoomID] == 1 then
				SkillTime = SkillTime + 1
	---------------�T����Y
				if SkillTime % 9 == 0 then			--�T����Y
					while ReadRoleValue( Boss, EM_RoleValue_SpellMagicID ) ~= 0 do --�ˬd�٦��S���b�I�k
					sleep(2)
					end
					Hate_table = KS_GetHateList( Boss, 1 )
					RandPlayer = Rand( #Hate_table )
					TarGID = HateListInfo( Boss, RandPlayer, EM_HateListInfoType_GItemID )	--������H���ؼ�
					ScriptMessage( Boss, -1, 2, "[SC_108276_06]".."|cffff0000" ..GetName(TarGID).. "|r" , 0 )	--[�T����Y]���ؼЬ�
					sleep(30)
					CastSpellLV( Boss, TarGID, SkillTable[1], 0 )	
				end
	----------------�H�a��
				if SkillTime % 11 == 0 then			--�H�a��
					while ReadRoleValue( Boss, EM_RoleValue_SpellMagicID ) ~= 0 do --�ˬd�٦��S���b�I�k
					sleep(2)
					end
					CastSpellLV( Boss, Boss, SkillTable[2], 0 )
					local x, y, z, dir = DW_Location( Boss )
					local Stone = CreateObj( 106952, x, y, z, dir, 1 )
					SetModeEx( Stone, EM_SetModeType_Fight, false )
					SetModeEx( Stone, EM_SetModeType_Move, false )
					SetModeEx( Stone, EM_SetModeType_NotShowHPMP, false )
					SetModeEx( Stone, EM_SetModeType_Strikback, false)	--����(���i)
					SetModeEx( Stone, EM_SetModeType_Move, false)		--����(���i)
					SetModeEx( Stone, EM_SetModeType_Fight, false)		--���(���i)
					SetModeEx( Stone, EM_SetModeType_Searchenemy, false)	--����(���i)
			--		SetModeEx( Stone, EM_SetModeType_Obstruct, false)		--����(�i)
					SetModeEX( Stone, EM_SetModeType_Gravity, true)	--���O
					AddToPartition( Stone, RoomID )
					
				end
	----------------���Z��ʾ���(�T���F�ä[�|�[)
				local Blood_Boss_Dis = CheckDistance( Mob_Blood, Boss, 100 )	--����Z��Boss100�X���A����Boss�@�h���Z���
				local Crazy_Blood_Dis = CheckDistance( Mob_Crazy, Boss, 100)	--�Ʋ��Z��Boss100�X���A����Boss�@�h���Z���
				if ReadRoleValue( Mob_Blood, EM_RoleValue_IsDead ) == 1 and ReadRoleValue( Mob_Crazy, EM_RoleValue_IsDead ) == 0 then
					WolfNum = 1
				end
				if ReadRoleValue( Mob_Blood, EM_RoleValue_IsDead ) == 0 and ReadRoleValue( Mob_Crazy, EM_RoleValue_IsDead ) == 1 then
					WolfNum = 1
				end
				if ReadRoleValue( Mob_Blood, EM_RoleValue_IsDead ) == 1 and ReadRoleValue( Mob_Crazy, EM_RoleValue_IsDead ) == 1 then
					WolfNum = 0
				end
				if WolfNum == 2 then
					if Blood_Boss_Dis == True and Crazy_Blood_Dis == true then
						AddBuff( Boss, 625083, 1, -1 )
					elseif Blood_Boss_Dis == True and Crazy_Blood_Dis == FALSE then
						AddBuff( Boss, 625083, 0, -1 )
					elseif Blood_Boss_Dis == FALSE and Crazy_Blood_Dis == true then		
						AddBuff( Boss, 625083, 0, -1 )
					elseif Blood_Boss_Dis == FALSE and Crazy_Blood_Dis == FALSE then
						CancelBuff( Boss, 625083 )
					end		
				end
				if WolfNum == 1 then
					if Blood_Boss_Dis == True and Crazy_Blood_Dis == FALSE then
						AddBuff( Boss, 625083, 1, -1 )
					elseif Blood_Boss_Dis == FALSE and Crazy_Blood_Dis == true then		
						AddBuff( Boss, 625083, 1, -1 )
					elseif Blood_Boss_Dis == FALSE and Crazy_Blood_Dis == FALSE then
						AddBuff( Boss, 625083, 0, -1 )
					end
				end
				if WolfNum == 0 then
					AddBuff( Boss, 625083, 1, -1 )
				end

				local _hpUnder5Percent = ReadRoleValue( Boss , EM_RoleValue_HP )/ReadRoleValue( Boss , EM_RoleValue_MaxHP ) < 0.05;
				local _summonBlood= CheckDistance( Mob_Blood, Boss, 300 ) or _hpUnder5Percent;--����W�LBoss300�X�A�ΧC��5%�� �ۦ^����
				local _summonCrazy = CheckDistance( Mob_Crazy, Boss, 300) or _hpUnder5Percent;--�Ʋ��W�LBoss300�X�A�ΧC��5%�� �ۦ^����

				if ( _summonBlood ) then
					local x,y,z,dir = DW_Location( Boss );
					Move( Mob_Blood , x,y,z );	
				end

				if ( _summonCrazy ) then
					local x,y,z,dir = DW_Location( Boss );
					Move( Mob_Crazy , x,y,z );
				end

		else
			DebugMsg( 0 , 0 , "Loop break !!" );
			break;
		end
	end
	DebugMsg( 0 , 0 , "Out of loop !!" );
end

function bico_Z29_Boss1_Blood_Ai()
	local Bloodwolf = OwnerID()
	local SkillTable = { 851350, 851351 }	--�}��ʼ��r, �����z�s
	local SkillTime = 0
	local Boss = ReadRoleValue( Bloodwolf, EM_RoleValue_PID )
	local Blood_Boss_Dis = CheckDistance( Bloodwolf, Boss, 100 )
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	while 1 do
		sleep(10)
		if Z29_bico_Boss1_Fight_Click[RoomID] == 1 then
			SkillTime = SkillTime + 1
			local Hate_table = KS_GetHateList( Bloodwolf, 1 )
	---------------�}��ʼ��r���I��
			if SkillTime % 7 == 0 then	--�I��}��ʼ��r
				while ReadRoleValue( Boss, EM_RoleValue_SpellMagicID ) ~= 0 do --�ˬd�٦��S���b�I�k
				sleep(2)
				end
				Hate_table = KS_GetHateList( Bloodwolf, 1 )
				if #Hate_table ==1 then
					CastSpell( Bloodwolf, Hate_table[1], 851350)	
				else
					if #Hate_table > 1 then
						local r = DW_Rand(#Hate_table)
						CastSpell( Bloodwolf, Hate_table[r], 851350)				
					end
				end	
			end 
	----------------�����z�s���I��
			if SkillTime % 13 == 0 then	--�I�����z�s
				while ReadRoleValue( Boss, EM_RoleValue_SpellMagicID ) ~= 0 do --�ˬd�٦��S���b�I�k
				sleep(2)
				end
				local Hate_table = KS_GetHateList( Bloodwolf, 1 )
				local r = DW_Rand(#Hate_table)
				CastSpellLV( Bloodwolf,Hate_table[r] , 851351, 0 )	
			end
		end
	end
end

function bico_Z29_Boss1_Crazy_Ai()
	local Crazywolf = OwnerID()
	local Bloodwolf = ReadRoleValue( Crazywolf, EM_RoleValue_Register1 )
	local SkillTime = 0
	local Boss = ReadRoleValue( Crazywolf, EM_RoleValue_PID )
	local DisTable = { 100, 150 }
	local Crazy_Boss_Dis = CheckDistance( Crazywolf, Boss, DisTable[1] )
	local Crazy_Blood_Dis = CheckDistance( Crazywolf, Bloodwolf, DisTable[2] )
	local BuffLv = FN_CountBuffLevel( Boss, 625083 )
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )

	while 1 do
	sleep(10)
	-----------------��{�����ؼЧP�_
		if #Z29_bico_Boss1_Bloodtaste_Table[RoomID] ~= 0 then
			if CheckBuff( Crazywolf,508172 ) == false then
				AddBuff(Crazywolf,508172,0,-1)		--�W�j��ؼЪ�buff
				SetAttack( Crazywolf, Z29_bico_Boss1_Bloodtaste_Table[RoomID][1] )
				ScriptMessage( Boss, -1, 2, "[SC_108276_05]".."|cffff0000" ..GetName(Z29_bico_Boss1_Bloodtaste_Table[RoomID][1]).. "|r" , 0 )	--�Ʋ����ؼ��ର
			end
			if CheckBuff(Z29_bico_Boss1_Bloodtaste_Table[RoomID][1], 625091) == false then--��ؼФ���{�F �h�t�M�ؼ�
				table.remove(Z29_bico_Boss1_Bloodtaste_Table[RoomID], 1)
				CancelBuff(Crazywolf,508172)--���~~���~~���n�A���ۤF~~
			end
		else
			if CheckBuff(Crazywolf,508172) == true then
				CancelBuff(Crazywolf,508172)
			end
		end
	----------------�����z�s���I��
		SkillTime = SkillTime + 1
		if SkillTime % 13 == 0 then	--�I�����z�s
			while ReadRoleValue( Boss, EM_RoleValue_SpellMagicID ) ~= 0 do --�ˬd�٦��S���b�I�k
				sleep(2)
			end
			if CheckBuff( Crazywolf, 508172 ) == true then
				CastSpellLV( Crazywolf,Z29_bico_Boss1_Bloodtaste_Table[RoomID][1] , 851351, 0 )
			else
				local Hate_table = KS_GetHateList( Boss, 1 )
				local r = DW_Rand(#Hate_table)
				CastSpellLV( Crazywolf,Hate_table[r] , 851351, 0 )			
			end
		end
	-----------------���T�@�����	
		Crazy_Blood_Dis = CheckDistance( Crazywolf, Bloodwolf, DisTable[2] )	--�P����Z��200�A�I�����T�@��
		if Crazy_Blood_Dis == True  then
			AddBuff( Crazywolf, 625087, 0, -1 )
			AddBuff( Bloodwolf, 625087, 0, -1 )
		else
			if  Crazy_Blood_Dis == FALSE then
				CancelBuff( Crazywolf, 625087 )
				CancelBuff( Bloodwolf, 625087 )
			end
		end
	----------------------------------
	end
end


function bico_Z29_625081_Syscast()	--�q���a�t�άI��w�t
	SysCastSpellLv(TargetID(),TargetID(),851354,0)
end


function bico_Z29_625081_CancelBuff_625088()	--�ˬd�ؼЬO�_���Ʋ��A�����ƨg�r��
	CancelBuff( TargetID() , 625088 )
end

function bico_Z29_625086_Friendunder2()	--�ˬd�P�䶤�ͤp��2�A�ۤv�I����
	
	local ZoneID = ReadRoleValue( OwnerID(), EM_RoleValue_ZoneID )
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local boss_faketable = {106791,103386,103390}
	local zone = 1;
		if ZoneID == 163 then		--hard
			zone =1
		elseif ZoneID == 164 then	--normal
			zone = 2
		elseif ZoneID == 165 then	--easy
			zone = 3
		elseif ZoneID == 938 then	--���հ�
			zone =1	
		end
	local x,y,z,dir=DW_Location(TargetID())
	local boss_fake = CreateObj( boss_faketable[zone], x, y, z, dir, 1 )	--108276�z���S�Ĳy
	SetModeEx( boss_fake, EM_SetModeType_Mark, false)		--�аO(���i)
	SetModeEx( boss_fake, EM_SetModeType_HideName, false)	--�W�r(����)
	SetModeEx( boss_fake, EM_SetModeType_NotShowHPMP, false)	--���(���q)
	SetModeEx( boss_fake, EM_SetModeType_Strikback, false)		--����(���i)
	SetModeEx( boss_fake, EM_SetModeType_Move, false)		--����(���i)
	SetModeEx( boss_fake, EM_SetModeType_Fight, false)		--���(���i)
	SetModeEx( boss_fake, EM_SetModeType_Searchenemy, false)	--����(���i)
	AddToPartition( boss_fake, RoomID )
	WriteRoleValue( boss_fake, EM_RoleValue_LiveTime, 3)	--�s�b3��
	local Player_Table = SearchRangePlayer( boss_fake , 50 )
	SysCastSpellLv(boss_fake,boss_fake,851355,0)
	--CastSpell( boss_fake,boss_fake,851355 );
	if #Player_Table < 3 then
		for i = 0, 1, 1 do			
			AddBuff( Player_Table[i] , 625086, 0, 4 )
		end		
	end	
end

function bico_Z29_106952_collision()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	if Z29_bico_Boss1_Fight_Click[RoomID] == 1 then
		if CheckBuff( OwnerID(), 625091) == false then
			AddBuff(OwnerID(), 625091,0,-1);
			table.insert(Z29_bico_Boss1_Bloodtaste_Table[RoomID], OwnerID())
		end
	end
	AddBuff(OwnerID(), 625091,0,-1);
end

function bico_Z29_106952_attackCancelBuff()
	if CheckBuff(TargetID(),625091) == true then
	CancelBuff( TargetID(),625091)
	end
end



function bico_Z29_106952_PleaseBeGoodOK()--�}�H���鲣�ͼ@��
	local stone = OwnerID();
	SetModeEx( stone, EM_SetModeType_Fight, false )
	SetModeEx( stone, EM_SetModeType_Move, false )
	SetModeEx( stone, EM_SetModeType_NotShowHPMP, false )
	SetModeEx( stone, EM_SetModeType_Strikback, false)	--����(���i)
	SetModeEx( stone, EM_SetModeType_Move, false)		--����(���i)
	SetModeEx( stone, EM_SetModeType_Fight, false)		--���(���i)
	SetModeEx( stone, EM_SetModeType_Searchenemy, false)	--����(���i)
--	SetModeEx( stone, EM_SetModeType_Obstruct, false)		--����(�i)
	SetModeEX( stone, EM_SetModeType_Gravity, true)	--���O
	SetPlot(stone,"collision","bico_Z29_106952_collision",0)
end
-----------��������P�X��-----------

--����������	107853
--Boss����	107852	Raid
--		107853	Normal
--		107854	Easy
--�S�ĳz���y	107854
--��		102642 (�ȥN)
--�X�нs��	781323
	--Boss	0
	--���	1
	--�e��	2

-----------�����k�N���X�P�򥻪k�N-----------

--7��d�����	851012
--7���Χ���	851013
--9����Y����	851014
--13���u�ľW	851015
--���D����	

--13��Boss�w��	624560
--�^��Buff	624566

local Z27_bico_Boss4_BossHeadache_Click = {}
local Z27_bico_Boss4_HP = {}
local Z27_bico_Boss4_Jump_Click ={}
local Z27_bico_boss4_TarTab = {}


function lua_bico_157_boss4_Ctrl()	--��������Script

-----------�ŧi��-----------
	local Ctrl = OwnerID()
	local BossNPC = { 107852, 108163, 108164 }
	local ZoneID = ReadRoleValue( Ctrl, EM_RoleValue_ZoneID )
	local RoomID = ReadRoleValue( Ctrl, EM_RoleValue_RoomID )
	local zone
	if ZoneID == 157 then  zone =1 
		elseif ZoneID == 158 then zone =2 
		elseif ZoneID == 159 then zone =3 
		elseif ZoneID == 938 then zone = 1
	end
	local Boss = CreateObjByFlag( BossNPC[zone] , 781323 , 0 , 1 )		--Boss, �X��0
	local Door_Back = CreateObjByFlag( 102642 , 781323 , 1 , 1 )	--���, �X��1
	local Door_Front = CreateObjByFlag( 102642 , 781323 , 2 , 1 )	--�e��, �X��2
	local Fight_Click = 0		--�԰��}��, �D�԰�=0, �԰�=1
	local Door_Front_Click = 0	--�e���}��, �}=0, ��=1
	local BossHP = ReadRoleValue( Boss, EM_RoleValue_HP )
	Z27_bico_Boss4_HP[ RoomID ] = BossHP			--Boss4������UHP��q (�����ܼ�)
	Z27_bico_Boss4_BossHeadache_Click[ RoomID ] = 0			--Boss�w�t�}�� (�����ܼ�)

	
	--��l���A--
	AddToPartition( Boss, RoomID )	--����Boss
	Door_Back = CreateObjByFlag( 102642 , 781323 , 1 , 1 )
	SetModeEx( Door_Back, EM_SetModeType_Mark, false)		--�аO(���i)
	SetModeEx( Door_Back, EM_SetModeType_HideName, false)	--�W�r(����)
	SetModeEx( Door_Back, EM_SetModeType_NotShowHPMP, false)	--���(���q)
	SetModeEx( Door_Back, EM_SetModeType_Strikback, false)	--����(���i)
	SetModeEx( Door_Back, EM_SetModeType_Move, false)		--����(���i)
	SetModeEx( Door_Back, EM_SetModeType_Fight, false)		--���(���i)
	SetModeEx( Door_Back, EM_SetModeType_Searchenemy, false)	--����(���i)
	SetModeEx( Door_Back, EM_SetModeType_Obstruct, true)		--����(�i)
	AddToPartition( Door_Back, RoomID )	--���ͫ��
	

	
-----------AI�s�g��-----------
while 1 do	
sleep(10)
	--Boss�����D0, ��ܶ}��--
	if HateListCount( Boss ) ~= 0 then		--Boss��������H(�԰��}�l)
		--�}��--
		if Fight_Click == 0 then			--��l�԰��}���p�G��0
			BeginPlot( Boss , "lua_bico_157_boss4_Ai" , 0 )		--����BossAiScript
			ScriptMessage( Boss, -1, 2, "[SC_107852_01]", 0 )	--�ȶ��ڻD�쭹�������D�I					
			if Door_Front_Click == 0 then	--�e���}���p�G��0
				Door_Front = CreateObjByFlag( 102642 , 781323 , 2 , 1 )
				SetModeEx( Door_Front, EM_SetModeType_Mark, false )			--�аO(���i)
				SetModeEx( Door_Front, EM_SetModeType_HideName, false )		--�W�r(����)
				SetModeEx( Door_Front, EM_SetModeType_NotShowHPMP, false )	--���(���q)
				SetModeEx( Door_Front, EM_SetModeType_Strikback, false )		--����(���i)
				SetModeEx( Door_Front, EM_SetModeType_Move, false )			--����(���i)
				SetModeEx( Door_Front, EM_SetModeType_Fight, false )			--���(���i)
				SetModeEx( Door_Front, EM_SetModeType_Searchenemy, false )		--����(���i)
				SetModeEx( Door_Front, EM_SetModeType_Obstruct, true )		--����(�i)
				AddToPartition( Door_Front, RoomID )	
			Door_Front_Click = 1	--�e���}���i�J�԰���, �]�w��1
			end
		Fight_Click = 1	--�԰��}��ON
		end
	end
	--Boss�����0, 1: ����; 2: Boss���`--
	if HateListCount( Boss ) == 0 then					--Boss������L�H(����)
		--����--
		if ReadRoleValue( Boss, EM_RoleValue_IsDead ) == 0 then	--Boss�S�����`�����p�U
			if Door_Front_Click == 1 then
				DelObj( Door_Front )	--�R���e��
		--		DelObj( Door_Back )	--�R����� (���դ�K��)		
			Door_Front_Click = 0		--���s�e���}�����A��0
			end
			if Fight_Click == 1 then
				ScriptMessage( Boss, -1, 2, "[SC_107852_02]", 0 )	--�o���������D�@�I���������I
				DelObj( Boss )
				Z27_bico_Boss4_BossHeadache_Click[ RoomID ] = nil
				Z27_bico_Boss4_HP[ RoomID ] = nil
				Boss = CreateObjByFlag( BossNPC[zone] , 781323 , 0 , 1 )	--Boss, �X��0
				AddToPartition(Boss,RoomID)
				BossHP = ReadRoleValue( Boss, EM_RoleValue_HP )
				Z27_bico_Boss4_HP[ RoomID ] = BossHP			--Boss4������UHP��q (�����ܼ�)
				Z27_bico_Boss4_BossHeadache_Click[ RoomID ] = 0			--Boss�w�t�}�� (�����ܼ�)	
			Fight_Click = 0			
			end
		end
		--Boss���`--
		if ReadRoleValue( Boss, EM_RoleValue_IsDead ) == 1 then
			DelObj( Door_Back )	--�}�ҫ��
			DelObj( Door_Front )	--�}�ҫe��	
			DelObj( Ctrl )
			Z27_bico_Boss4_HP[ RoomID ] = nil	
			Z27_bico_Boss4_BossHeadache_Click[ RoomID ] = nil
			Z27_bico_Boss4_Jump_Click[ RoomID ] = nil
			Z27_bico_boss4_TarTab[ RoomID ] = nil			
		end			
	end
end
end

function lua_bico_157_boss4_Ai()	--Boss��Script
-----------�ŧi��-----------
	local Boss = OwnerID()
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID )
	local SkillTime = 0		--�ޯ�p�ɾ�
	local BossFightTime = 0		--�g�ɭp�ɾ�
	local SoulBall = 107854
	local Skill_Ae_1 = 851012	--�C7��d��ˮ`
	local Skill_Ae_2 = 851013	--�C7��e�记�ζˮ`
	local Skill_Stone = 851014	--�C9����Y����
	local Skill_Stone_DMG = 851016	--�C9����Y���۶ˮ`
	local Skill_Run = 851015	--�C13��I�񪺽ľW�ޯ�
	local Skill_Jump_Up = 851017	--�I����D����_���_
	local Skill_Jump_Down = 851018	--�I����D����_���U
	local Jump_TarTable = {}
	local RevHP = 624566		--�^��Buff
	local Jump_Shadow = 624561	--�¼vidol�S��
	local Hate_table = KS_GetHateList( Boss, 1 )
	local RandPlayer = Rand( #Hate_table )
	local TarGID = HateListInfo( Boss, RandPlayer, EM_HateListInfoType_GItemID )
	local MaxHP = ReadRoleValue( Boss, EM_RoleValue_MAxHP )
	local NowHP = ReadRoleValue( Boss, EM_RoleValue_HP )	--Boss��U��HP
	local Ten_HP = MaxHP*0.015
	local RandSkill = DW_rand( 2 )
	AddBuff( Boss, 624586, 0, 480 )
	AddBuff( Boss, 502707, 0, -1 )
	
	Z27_bico_Boss4_Jump_Click[ RoomID ] = 0	
	
-----------AI�s�g��-----------
while 1 do
sleep(10)
	----Boss��U����q�Y�O�����������q�N�����^��Buff----
	if Z27_bico_Boss4_BossHeadache_Click[ RoomID ] == 0 then	--Boss�w�t�}�������ɰ���o��
		AddBuff( Boss, 624587, 0, -1 )	--��ܥΪ���O���A
		NowHP = ReadRoleValue( Boss, EM_RoleValue_HP )	--Boss��U��HP
		local HPClick = NowHP + Ten_HP
		if HPClick > Z27_bico_Boss4_HP[ RoomID ] and CheckBuff( Boss, RevHP ) == true then
			WriteRoleValue( Boss, EM_RoleValue_HP, Z27_bico_Boss4_HP[ RoomID ] )
			CancelBuff( Boss, RevHP )	--Boss�����^��Buff				
		elseif CheckBuff( Boss, RevHP ) == false and HPClick < Z27_bico_Boss4_HP[ RoomID ]  then
				AddBuff( Boss, RevHP, 0, -1 )	--Boss���^��Buff
		end
----�ޯ�I��ɾ��I----
	SkillTime = SkillTime + 1
		----���D����----		
		if Z27_bico_Boss4_Jump_Click[ RoomID ] == 1 then	
			while ReadRoleValue( Boss, EM_RoleValue_SpellMagicID ) ~= 0 do --�ˬd�٦��S���b�I�k
				sleep(2)
			end
			SetModeEx( Boss , EM_SetModeType_Obstruct, false)
			SetModeEx( Boss , EM_SetModeType_Move, false)	---����
			SetModeEx( Boss , EM_SetModeType_Fight, false)	---�i���
			SetModeEx( Boss , EM_SetModeType_Mark, false)
			ScriptMessage( Boss, -1, 2, "[SC_107852_07]", 0 )	--���_�ӡI���_�ӡI
			CastSpell( Boss, Boss, Skill_Jump_Up )
			sleep(20)	
	   		----�ؼпz��G���H�P���a----	
		  		Hate_table = KS_GetHateList( Boss, 1 )
				for i = 1, #Hate_table do			--�⬡�۪����a���ؼЦC��
					if ReadRoleValue( Hate_table[i], EM_RoleValue_IsDead ) == 0 or ReadRoleValue( Hate_table[i], EM_RoleValue_IsPlayer ) == 1 then		--�p�GRand�쪺�ؼФw���Ϊ̫D���a
						table.insert( Jump_TarTable, Hate_table[i] )
					end
				end
			-------------------------------	
				if #Jump_TarTable ~= 0 then	
					if #Jump_TarTable > 1 then		
						RandPlayer = Rand( #Jump_TarTable )
						TarGID = HateListInfo( Boss, RandPlayer, EM_HateListInfoType_GItemID )	--Boss������H�������۪��a				
							local skilltarget = Lua_DW_CreateObj( "obj", 107855, TarGID, 0 )
							SetModeEx( skilltarget , EM_SetModeType_Mark, false)
							SetModeEx( skilltarget , EM_SetModeType_HideName, false)
							SetModeEx( skilltarget , EM_SetModeType_ShowRoleHead, false)
							SetModeEx( skilltarget , EM_SetModeType_NotShowHPMP, false)
							SetModeEx( skilltarget , EM_SetModeType_Obstruct, false)   -----����
							SetModeEx( skilltarget , EM_SetModeType_Strikback, false) ---����
							SetModeEx( skilltarget , EM_SetModeType_Move, false) ---����	
							SetModeEx( skilltarget , EM_SetModeType_Fight, false) ---�i���
							SetModeEx( skilltarget , EM_SetModeType_SearchenemyIgnore, false) 
							SetModeEx( skilltarget , EM_SetModeType_Searchenemy, false)
							SetModeEx( skilltarget , EM_SetModeType_Show, true)	
							AddToPartition( skilltarget , RoomID )
							WriteRoleValue( skilltarget, EM_RoleValue_Livetime, 4 )
							AddBuff( skilltarget, 624561, 1, -1 )-------�W���a�S�Ī�buff
							local x, y, z, dir = DW_Location( skilltarget )
							SetPos( Boss, x, y, z, 20 )
							sleep(10)
							CastSpell( Boss, Boss, Skill_Jump_Down )
							SetModeEx( Boss , EM_SetModeType_Move, true) ---����
							SetModeEx( Boss , EM_SetModeType_Fight, true) ---�i���
							SetModeEx( Boss , EM_SetModeType_Mark, true)	
							Jump_TarTable = {}
					else
							local skilltarget = Lua_DW_CreateObj( "obj", 107855, Jump_TarTable[1], 0 )
							SetModeEx( skilltarget , EM_SetModeType_Mark, false)
							SetModeEx( skilltarget , EM_SetModeType_HideName, false)
							SetModeEx( skilltarget , EM_SetModeType_ShowRoleHead, false)
							SetModeEx( skilltarget , EM_SetModeType_NotShowHPMP, false)
							SetModeEx( skilltarget , EM_SetModeType_Obstruct, false)   -----����
							SetModeEx( skilltarget , EM_SetModeType_Strikback, false) ---����
							SetModeEx( skilltarget , EM_SetModeType_Move, false) ---����	
							SetModeEx( skilltarget , EM_SetModeType_Fight, false) ---�i���
							SetModeEx( skilltarget , EM_SetModeType_SearchenemyIgnore, false) 
							SetModeEx( skilltarget , EM_SetModeType_Searchenemy, false)
							SetModeEx( skilltarget , EM_SetModeType_Show, true)	
							AddToPartition( skilltarget , RoomID )
							WriteRoleValue( skilltarget, EM_RoleValue_Livetime, 3 )
							AddBuff( skilltarget, 624561, 1, -1 )-------�W���a�S�Ī�buff
							sleep(10)
							local x, y, z, dir = DW_Location( skilltarget )
							SetPos( Boss, x, y, z, 20 )
							CastSpell( Boss, Boss, Skill_Jump_Down )
							SetModeEx( Boss , EM_SetModeType_Move, true) ---����
							SetModeEx( Boss , EM_SetModeType_Fight, true) ---�i���
							SetModeEx( Boss , EM_SetModeType_Mark, true)	
							Jump_TarTable = {}
					end
				end
			Z27_bico_Boss4_Jump_Click[ RoomID ] = 0
--			SkillTime = 0
		end						
	--�C7��I��d��ˮ`�Ϊ̫e�记��--
		if SkillTime % 7 == 0 then
			RandSkill = DW_rand( 2 )
			if RandSkill == 1 then
				while ReadRoleValue( Boss, EM_RoleValue_SpellMagicID ) ~= 0 do --�ˬd�٦��S���b�I�k
				sleep(2)
				end
				CastSpellLV( Boss, Boss, Skill_Ae_1, 0 )
			end
			if RandSkill == 2 then
				while ReadRoleValue( Boss, EM_RoleValue_SpellMagicID ) ~= 0 do --�ˬd�٦��S���b�I�k
				sleep(2)
				end
				CastSpellLV( Boss, Boss, Skill_Ae_2, 0 )
			end
		end
	--�C10����Y����--
		if SkillTime % 10 == 0 then
			while ReadRoleValue( Boss, EM_RoleValue_SpellMagicID ) ~= 0 do --�ˬd�٦��S���b�I�k
			sleep(2)
			end
			Hate_table = KS_GetHateList( Boss, 1 )
			if #Hate_table ~= 0 then
				if #Hate_table > 1 then	--������j��@�ӤH����
					ScriptMessage( Boss, -1, 2, "[SC_107852_05]".."|cffff0000" ..GetName(Hate_table[2]).. "|r" , 0 )	--���۷|�{�H�A���Y
					CastSpellLV( Boss, Hate_table[2], Skill_Stone, 0 )	--���Y�ĤG���몺���a
				else	--������p�G�u���@�ӤH����
					ScriptMessage( Boss, -1, 2, "[SC_107852_05]".."|cffff0000" ..GetName(Hate_table[1]).. "|r" , 0 )	--���۷|�{�H�A���Y
					CastSpellLV( Boss, Hate_table[1], Skill_Stone, 0 )	--���Y�Ĥ@���몺���a
				end
			end
		end
	--�C17��I��ľW--
		if SkillTime % 17 == 0 then	
			while ReadRoleValue( Boss, EM_RoleValue_SpellMagicID ) ~= 0 do --�ˬd�٦��S���b�I�k
			sleep(2)
			end			
		----���H���ؼ�----	
			Hate_table = KS_GetHateList( Boss, 1 )
			RandPlayer = Rand( #Hate_table )
			TarGID = HateListInfo( Boss, RandPlayer, EM_HateListInfoType_GItemID )	--������H���ؼ�
			Z27_bico_boss4_TarTab[ RoomID ] = {}
			table.insert(Z27_bico_boss4_TarTab[ RoomID ], TarGID)	
			ScriptMessage( Boss, -1, 2, "[SC_107852_06]".."|cffff0000" ..GetName(TarGID).. "|r" , 0 )	--�ڭn�Y�A���סI�ܧA����I					
			CastSpellLV( Boss, TarGID, Skill_Run, 0 )
			lua_bico_157_boss4_Wind()
		end	
		end
end
end

function lua_bico_157_SaveBossHP()
	local Boss = OwnerID()
	local RevHP = 624566		--�^��Buff
	local HP = ReadRoleValue( Boss, EM_RoleValue_HP )
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	Z27_bico_Boss4_Jump_Click[ RoomID ] = 1
	Z27_bico_Boss4_HP[ RoomID ] = HP
	SetModeEx( Boss, EM_SetModeType_Move, true )
	Z27_bico_Boss4_BossHeadache_Click[ RoomID ] = 0		--����Boss�w�t�}��
end

function lua_bico_157_boss4_DEAD()
	Cl_Resist_HackersBossDead()	--���b
	ScriptMessage( OwnerID(), -1, 2, "[SC_107852_03]", 0 )	--�o��ִN�����F�K�K
end

function lua_bico_157_boss4_480sFight()	--�g�ɭp�ɾ�
	ScriptMessage( OwnerID(), -1, 2, "[SC_107852_04]", 0 )	--�����R���F�O�q�I���I���I���I
end

function lua_bico_157_boss4_Skill1()	--�E�O����Ĳ�o
	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )
	AddBuff(OwnerID(), 624559,0 ,10 )
	CancelBuff( OwnerID(), 624566 )
	CancelBuff( OwnerID(), 624587 )	--�R����O���A
	Z27_bico_Boss4_BossHeadache_Click[ RoomID ] = 1		--Boss�w�t�}���}��
end

function lua_bico_157_boss4_Wind()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local Bx, By, Bz, Bdir = DW_Location( OwnerID() )
	local Distance = GetDistance( OwnerID(), Z27_bico_boss4_TarTab[ RoomID ][1] )
	local x, y, z, dir = DW_Location( Z27_bico_boss4_TarTab[ RoomID ][1] )
	local sec = Move( OwnerID(), x, y, z )
	sleep(sec)
	for Dis = 50, Distance-50, 50 do
		local Wx, Wy, Wz = DW_Relative( Z27_bico_boss4_TarTab[ RoomID ][1], Bx, By, Bz, Dis )		--���o����P�Y�Ӯy�ж����I(xyz)=>3D, Dis �O��s�y���� Tx, Ty, Tz���Z��
		local Wind = CreateObj( 107854, Wx, Wy, Wz, 0, 1 )
		SetModeEx( Wind , EM_SetModeType_Mark, false)
		SetModeEx( Wind , EM_SetModeType_HideName, false)
		SetModeEx( Wind , EM_SetModeType_ShowRoleHead, false)
		SetModeEx( Wind , EM_SetModeType_NotShowHPMP, false)
		SetModeEx( Wind , EM_SetModeType_Obstruct, false)   -----����
		SetModeEx( Wind , EM_SetModeType_Strikback, false) ---����
		SetModeEx( Wind , EM_SetModeType_Move, true) ---����	
		SetModeEx( Wind , EM_SetModeType_Fight, false) ---�i���
		SetModeEx( Wind , EM_SetModeType_SearchenemyIgnore, false) 
		SetModeEx( Wind , EM_SetModeType_Searchenemy, false)
		SetModeEx( Wind , EM_SetModeType_Show, true)
		AddToPartition( Wind , RoomID )
		CallPlot( wind, "lua_bico_157_boss4_WindAI" , 10 )
		SetRandMove( Wind, 200, 10, 50 )
		AddBuff( Wind, 624564, 0, -1 )
		WriteRoleValue( Wind, EM_RoleValue_Livetime, 12 )
		sleep(5)	
	end
	Z27_bico_boss4_TarTab[ RoomID ] = {}
end

function lua_bico_157_boss4_WindAI()
	while true do 
	sleep(10)
		DW_MoveRandPath( OwnerID() , 100 ,nil, OwnerID() )	
	end
end
--DW_Relative(GUID,Tx,Ty,Tz,Dis)
function Lua_na_plants_born()
	local X = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20}  
	local Y = 0
	local Y1 = {}
	BeginPlot( OwnerID(), "Lua_na_plants_treasureborn" , 0 )
	for i = 1 , 20 do   -- ����20��
		Y = Rand(table.getn(X))+1
		Y1[i] = X[Y]
		table.remove(X,Y)
		local plants = {}
		local Crand = rand(2)	--�H���X��
		if Crand ==1 then
			plants[i] = CreateObjByFlag(117220 , 780840, Y1[i] ,1) --�ϥκX�l���ͥP�H�x npc �X�l�s�� �ƶq 
		else 
			plants[i] = CreateObjByFlag(117221 , 780840, Y1[i] ,1) --�ϥκX�l���ͥP�H�x npc �X�l�s�� �ƶq 
		end
		SetModeEx( plants[i]  , EM_SetModeType_Strikback, true )--����
		SetModeEx( plants[i]  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( plants[i] , EM_SetModeType_Obstruct, false )--����
		SetModeEx( plants[i] , EM_SetModeType_Mark, true )--�аO
		SetModeEx( plants[i] , EM_SetModeType_Move, true )--����
		SetModeEx( plants[i] , EM_SetModeType_Searchenemy, true )--����
		SetModeEx( plants[i] , EM_SetModeType_HideName, true )--�W��
		SetModeEx( plants[i] , EM_SetModeType_ShowRoleHead, true )--�Y����
		SetModeEx( plants[i] , EM_SetModeType_Fight , true )--�i�������
		SetModeEx( plants[i] , EM_SetModeType_Drag , false )--���O
		SetModeEx( plants[i] , EM_SetModeType_Show, true )--���
		AddToPartition( plants[i] , 0 )	--���ͥP�H�x
		sleep(5)
	end
	BeginPlot( OwnerID(), "Lua_na_plants_count" , 0 )
end


function Lua_na_plants_count()	-- �ˬd�S�w�P�H�xnpc�s�����ƶq
	local Flower =nil
	--Sleep( 100)
	while true do
		sleep(30)
		local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local Count = SetSearchAllNPC( RoomID )
		local Obj
		local NPC = { 117220,117221, 105125, 105126 }
		local C =0
		if  Count ~= 0 then
			for i=1 , Count , 1 do
			local ID = GetSearchResult()
			Obj=Role:New(ID)
				if Obj:IsNPC() == true then
				local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--�T�{�Ҧ�NPC���s��
					for j = 1 , table.getn( NPC ) , 1 do
						if Name == NPC[j] then  --�Y���}�C������
						--WriteRoleValue( ID , EM_RoleValue_PID , 0 )
						C = C+1
						end
					end
				end
			end
		Say ( OwnerID(), "C="..C )
		end	
		if  C == 0 then -- �Y���W�w�g�S���P�H�x
			if Flower ==nil then
			--	Say ( OwnerID(), "1")
				Flower = Lua_na_cactusboss_born(OwnerID())
				WriteRoleValue(OwnerID(),EM_RoleValue_Register10,Flower)
			--	Say ( OwnerID(), Flower)
			--	Say ( OwnerID(), "2")
				BeginPlot( Flower, "Lua_na_hidemarks",0 ) --�L�O���ü@��
			end
		end
	end
end


--�P�H�x�D��
function Lua_na_plants_Q()  --10
	while true do
--		WriteRoleValue(OwnerID() , EM_RoleValue_Register+1,  0 )     --�M��NPC���D��
		local ran = rand(6)+1
		if ran <= 2 then
			sleep (50)
		elseif ran > 2 and ran <=4 then
			sleep (80)
		else 	
			sleep (100)
		end

		local RANDOM = rand(3)	
		if RANDOM == 0 then  
			sleep(10)
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+3,  1 )     --���D��
			local E = ReadRoleValue( OwnerID(), EM_RoleValue_Register+3)	
		--	PlayMotion( OwnerID(), 83) 
			NpcSay(OwnerID(),"[SC_CACTUS_ITEM_01]" ) -- �]��...��...�^
		elseif RANDOM == 1 then 
			sleep(10)
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+3,  2 )     --���D��
			local E = ReadRoleValue( OwnerID(), EM_RoleValue_Register+3)	
		--	PlayMotion( OwnerID(), 83) 
			NpcSay(OwnerID(),"[SC_CACTUS_ITEM_02]" ) --�]��...��...�^
		elseif RANDOM == 2 then 
			sleep(10)
			WriteRoleValue(OwnerID() , EM_RoleValue_Register+3,  3 )     --���D��
			local E = ReadRoleValue( OwnerID(), EM_RoleValue_Register+3)	
		--	PlayMotion( OwnerID(), 83) 
			NpcSay(OwnerID(),"[SC_CACTUS_ITEM_03]" ) -- �]�T...��...�^
		end
		sleep(20)
	end
end


function Lua_na_DELplants()--�M���Ҧ��P�H�x
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = { 117220 , 117221, 105125, 105126  }

	if  Count ~= 0 then
		for i=1 , Count , 1 do
			local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--�T�{�Ҧ�NPC���s��
				for j = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[j] then  --�Y���}�C������
						DelObj( ID)
					end
				end
			end
		end
	end
end





--debug��



--���~�g�J��
function Lua_na_plants_check1() --�ˬd�ؼЬO�_���P�H�x
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )

	if CheckDistance( OwnerID(), TargetID(), 100 ) == true then
		if ( CheckID( TargetID() ) == true ) and  ( (OrgID == 117220) or ( OrgID == 117221) ) then  --��H�O��2��npc
			WriteRoleValue( OwnerID(), EM_RoleValue_Register+8, 1 ) --�b���~���W�g�J��1
			local Z = ReadRoleValue( OwnerID(), EM_RoleValue_Register+8 )
			return true
		elseif ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 or   TargetID() == OwnerID() then --�I�k��H�O���a�άO���a�ۤv
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_1]" , C_SYSTEM )	--�ؼФ����T�C
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_1]"  , C_SYSTEM )	--�ؼФ����T�C
			return false
		elseif ( CheckID( TargetID() ) == false ) then  --�S����H
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421192_1]" , C_SYSTEM )	--�A�S���ؼ�
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_421192_1]"  , C_SYSTEM )	--�A�S���ؼ�
			return false
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204638_2]" , C_SYSTEM )	--�ؼжZ���L��
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204638_2]"  , C_SYSTEM )	--�ؼжZ���L��
		return false
	end
end



function Lua_na_plants_check2() --�ˬd�ؼЬO�_���P�H�x
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )

	if CheckDistance( OwnerID(), TargetID(), 100 ) == true then
		if ( CheckID( TargetID() ) == true ) and  ( (OrgID == 117220) or ( OrgID == 117221) ) then  --��H�O��2��npc
			WriteRoleValue( OwnerID(), EM_RoleValue_Register+8, 2 ) --�b���~���W�g�J��1
			local Z = ReadRoleValue( OwnerID(), EM_RoleValue_Register+8 )
			return true
		elseif ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 or   TargetID() == OwnerID() then --�I�k��H�O���a�άO���a�ۤv
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_1]" , C_SYSTEM )	--�ؼФ����T�C
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_1]"  , C_SYSTEM )	--�ؼФ����T�C
			return false
		elseif ( CheckID( TargetID() ) == false ) then  --�S����H
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421192_1]" , C_SYSTEM )	--�A�S���ؼ�
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_421192_1]"  , C_SYSTEM )	--�A�S���ؼ�
			return false
		end
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204638_2]" , C_SYSTEM )	--�ؼжZ���L��
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204638_2]"  , C_SYSTEM )	--�ؼжZ���L��
		return false
	end
end


function Lua_na_plants_check3() --�ˬd�ؼЬO�_���P�H�x
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )

	if CheckDistance( OwnerID(), TargetID(), 100 ) == true then
		if ( CheckID( TargetID() ) == true ) and  ( (OrgID == 117220) or ( OrgID == 117221) ) then  --��H�O��2��npc
			WriteRoleValue( OwnerID(), EM_RoleValue_Register+8, 3 ) --�b���~���W�g�J��1
			local Z = ReadRoleValue( OwnerID(), EM_RoleValue_Register+8 )
			return true
		elseif ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 or   TargetID() == OwnerID() then --�I�k��H�O���a�άO���a�ۤv
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_1]" , C_SYSTEM )	--�ؼФ����T�C
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_1]"  , C_SYSTEM )	--�ؼФ����T�C
			return false
		elseif ( CheckID( TargetID() ) == false ) then  --�S����H
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421192_1]" , C_SYSTEM )	--�A�S���ؼ�
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_421192_1]"  , C_SYSTEM )	--�A�S���ؼ�
			return false
		end
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204638_2]" , C_SYSTEM )	--�ؼжZ���L��
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204638_2]"  , C_SYSTEM )	--�ؼжZ���L��
		return false
	end
end




--�ˬd�D�ػP���׬O�_�ۦP�A�ϥΫ�
function Lua_na_plants_meet2() --�ϥΪ��~����@��
	local Q = ReadRoleValue ( TargetID() , EM_RoleValue_Register+3 )
	local A = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+8 )

	if Q == A then
		Tell ( OwnerID() , TargetID(), "[SC_PLANTS_SPEAK01]" ) --�Ӭ����F��n�Y�n�Y�I
--		BeginPlot( OwnerID(), "Lua_na_plants_count", 0)
		PlayMotion( TargetID(), 119) --Cast��t
		DelObj( TargetID())
	else
		Tell(OwnerID() ,  TargetID(), "[SC_PLANTS_SPEAK02]") --�A�~�M���ڳo�تF��I�ڥͮ�F�I�I�I
		BeginPlot( OwnerID(), "Lua_na_plants_X", 0)
		PlayMotion( TargetID(), 83) --Cast��t
		DelObj( TargetID())
	end
end

function Lua_na_plants_vege2()
	local Q = ReadRoleValue ( TargetID() , EM_RoleValue_Register+3 )
	local A = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+8 )
	if Q == A then
		Tell ( OwnerID() , TargetID(), "[SC_PLANTS_SPEAK01]" ) --�Ӭ����F��n�Y�n�Y�I
--		BeginPlot( OwnerID(), "Lua_na_plants_count", 0)
		PlayMotion( TargetID(), 119) --Cast��t
		DelObj( TargetID())
	else
		Tell ( OwnerID() , TargetID(), "[SC_PLANTS_SPEAK02]" ) --�A�~�M���ڳo�تF��I�ڥͮ�F�I�I�I
		BeginPlot( OwnerID(), "Lua_na_plants_X", 0)
		PlayMotion( TargetID(), 83) --Cast��t
		DelObj( TargetID())
	end
end


function Lua_na_plants_grass2()
	local Q = ReadRoleValue ( TargetID() , EM_RoleValue_Register+3 )
	local A = ReadRoleValue ( OwnerID() , EM_RoleValue_Register+8 )
	if Q == A then
		Tell ( OwnerID() , TargetID(), "[SC_PLANTS_SPEAK01]" ) --�Ӭ����F��n�Y�n�Y�I
--		BeginPlot( OwnerID(), "Lua_na_plants_count", 0)
		PlayMotion( TargetID(), 119) --Cast��t
		DelObj( TargetID())
	else
		Tell ( OwnerID() , TargetID(), "[SC_PLANTS_SPEAK02]" ) --�A�~�M���ڳo�تF��I�ڥͮ�F�I�I�I
		BeginPlot( OwnerID(), "Lua_na_plants_X", 0)
		PlayMotion( TargetID(), 83) --Cast��t
		DelObj( TargetID())
	end
end





function Lua_na_plants_X()  --��P�H�x�ϥο��~�����~�A�X�{�Ⱖ�P�H�x
	local Obj = Role:new(OwnerID())
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local plant2 = {}
	plant2[0] = CreateObj( 105125 , BaseX-rand(50), BaseY, BaseZ, BaseDir, 1 ) --�X�{����	SetModeEx( Flower, EM_SetModeType_Strikback, true )--����
	plant2[1] = CreateObj( 105126 , BaseX+rand(50), BaseY, BaseZ, BaseDir, 1 ) --�X�{�j�N�G�G�P�H�x
	AddToPartition( plant2[0], 0 )
	AddToPartition( plant2[1], 0 )
--	Say( OwnerID(), "born" )
end



function Lua_na_cactusboss_born(Player) --�j�N�Ԫ�P�H�x�X�{�@��
	local RoomID = ReadRoleValue(Player,EM_RoleValue_RoomID)
	local Flower = CreateObjByflag( 105127, 780840 , 0 , 1 ) --�b���w�s�����X�l�W���;Ԫ�P�H�x(NPC�s��,�X�l�s��,�X�l�s�X,�ƶq)
	SetModeEx( Flower, EM_SetModeType_Strikback, true )--����
	SetModeEx( Flower, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Flower, EM_SetModeType_Obstruct, false )--����
	SetModeEx( Flower, EM_SetModeType_Mark, true )--�аO
	SetModeEx( Flower, EM_SetModeType_Move, true )--����
	SetModeEx( Flower, EM_SetModeType_Searchenemy, true )--����
	SetModeEx( Flower, EM_SetModeType_HideName, true )--�W��
	SetModeEx( Flower, EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( Flower, EM_SetModeType_Fight , true )--�i������� 
	SetModeEx( Flower, EM_SetModeType_Drag , false )--���O
	SetModeEx( Flower, EM_SetModeType_Show, true )--���
	AddToPartition( Flower , RoomID ) 
	return Flower

end



--�Ԫ�P�H�x�L�ļ@��
function Lua_na_cactusboss_born_1() --�j�N�Ԫ�P�H�x�X�{�@���A�@������L��
	say( OwnerID(), "[SC_plants_BOSS01]") --�j�Ԫ�P�H�x��ܡG�o���S�O�ַQ�ӬD�ԧڰڡI
--	PlayMotion( OwnerID(), 83)
	Addbuff(OwnerID(), 508060,0, -1) 
	BeginPlot( OwnerID(), "Lua_na_cactusboss_attack",0)
end

function Lua_na_cactusboss_attack() --�Ԫ�P�H�x�԰��@��
	while true do
	local attack = ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode )           --�P�_�O�_�i�J�԰� 1= �O 0= �_
	local random= Rand(15)
	local NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP)
	local HPPercent = NowHP / MaxHP
	local X = (HPPercent*100)
--	Say( OwnerID(), "HP = "..X.."%!!" )
		if attack == 1 then --�i�J�԰�
			if  X > 50 then  --��q����50%
				local ran1 = rand(3)
				PlayMotion( OwnerID(), 31 )
				sleep(20)
			--	CastSpell( OwnerID(), OwnerID(), 496236)
				sleep(50)
				if ran1== 0 then 
					Tell ( OwnerID() , TargetID(), "[SC_CACTUS_BOSS02]" ) -- �Q�D�ԧڡH�A�]�Ӥѯu�F�a�I
				end
			elseif X <=50 and X >=30 then
				local ran2 = rand(3)
				if random <5 then --5/15
					if ran2== 0 then 
					Tell ( OwnerID() , TargetID(), "[SC_CACTUS_BOSS03]" )  -- 
					end
					PlayMotion( OwnerID(), 31 )
					sleep(20)
			--		CastSpell( OwnerID(), OwnerID(), 496237)
					sleep(50)
				else	
					if ran2== 1  then 
					Tell ( OwnerID() , TargetID(), "[SC_CACTUS_BOSS04]" )  -- �����I�q�q�ܦ����H�a�I
					end
					PlayMotion( OwnerID(), 31 )
					sleep(20)
			--		CastSpell( OwnerID(), OwnerID(), 496236)
					sleep(50)
				end
			elseif X < 30 then --���H����q�C��30%
				local ran3 = rand(3)
				if random <=2 then -- 2/15
					Tell ( OwnerID() , TargetID(), "[SC_CACTUS_BOSS05]" )  --�Q���ѧ��٦��O�I
					PlayMotion( OwnerID(), 60)
			--		CastSpell( OwnerID(), OwnerID(), 496086)�@--�^�_

				else
					if ran3== 1  then 
					Tell ( OwnerID() , TargetID(), "[SC_CACTUS_BOSS04]" )  -- �����I�q�q�ܦ����H�a�I
					end
					PlayMotion( OwnerID(), 31 )
					sleep(20)
			--		CastSpell( OwnerID(), OwnerID(), 496236)
					sleep(50)
				end
			end
		end
	sleep(100)
	end
end



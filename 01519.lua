
--�۳�{�q�y 

function Lua_cang_Em_GGmen1()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local SpellCaster = LuaFunc_CreateObjByObj ( 102473, TargetID() )
	SetModeEx( SpellCaster   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( SpellCaster   , EM_SetModeType_Strikback, false )--����
	SetModeEx( SpellCaster   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( SpellCaster   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( SpellCaster   , EM_SetModeType_Move, false )--����
	SetModeEx( SpellCaster   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( SpellCaster   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( SpellCaster   , EM_SetModeType_HideName, false )--�W��
	DelFromPartition( SpellCaster )
	AddToPartition( SpellCaster ,    RoomID )	--�[�i�R�x
	AddBuff( SpellCaster ,504203,1 ,-1 )
	BeginPlot(SpellCaster,"Lua_cang_Em_GGmen2", 0)
	return true
end

function  Lua_cang_Em_GGmen2()
	sleep(120)
	Delobj(OwnerID())
end

function Lua_cang_EMI_GGmen4()

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Temp = Lua_Davis_BornByMultilateral( 102578 , 3 , 50 )	--�b�ۤv���W�X�p�����H
	--local Temp1, Temp2, Temp3
	--Temp1 = CreateObjByFlag( 102578, 780423, 0, 1) 
	--AddToPartition( Temp1 , RoomID )	
	--sleep(10)
	--Temp2 = CreateObjByFlag( 102579, 780423, 1, 1)
	--AddToPartition( Temp2 , RoomID )	
	--sleep(10)
	--Temp3 = CreateObjByFlag( 102590, 780423, 2, 1)
	--AddToPartition( Temp3 , RoomID )	
	--sleep(10)
	WriteRoleValue( Temp[1] ,EM_RoleValue_PID, OwnerID())	--�g�JPID
	WriteRoleValue( Temp[2] ,EM_RoleValue_PID, OwnerID())	--�g�JPID
	WriteRoleValue( Temp[3] ,EM_RoleValue_PID, OwnerID())	--�g�JPID
	
	while true do
	sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if AttackTarget == 0 and CheckID( OwnerID() ) == true then  -- �ˬd�O�_���}�԰�	
			CastSpellLV(Temp[1], OwnerID(), 493819 ,1)
			CastSpellLV(Temp[2], OwnerID(), 493819 ,1)
			CastSpellLV(Temp[3], OwnerID(), 493819 ,1)
			Sleep(50)
		elseif AttackTarget ~= 0 then 
			SetAttack( Temp[1], AttackTarget)	
			SetAttack( Temp[2], AttackTarget)	
			SetAttack( Temp[3], AttackTarget)	
			break
		end
	end
end

--------------------

function Lua_cang_EMI_GGmen3()

	while true do
	sleep(10)
		local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
		local SkillB = 0
		local SkillC = 0
		
		while true do
		sleep(10)

			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )	--��ؼЭ�
			if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�

				SkillB = SkillB + 1		
				
				if SkillC == 0 then
					local Temp = Lua_Davis_BornByMultilateral( 102479 , 3 , 10 )	--�b�ۤv���W�X�p�����H
					BeginPlot(Temp[1],"Lua_cang_EMI_GGmen3_1",0)
					BeginPlot(Temp[2],"Lua_cang_EMI_GGmen3_1",0)
					BeginPlot(Temp[3],"Lua_cang_EMI_GGmen3_1",0)
					SkillC = 1 
				end
				if SkillB >= 60 then
					local Temp = Lua_Davis_BornByMultilateral( 102479 , 3 , 10 )	--�b�ۤv���W�X�p�����H
					BeginPlot(Temp[1],"Lua_cang_EMI_GGmen3_1",0)
					BeginPlot(Temp[2],"Lua_cang_EMI_GGmen3_1",0)
					BeginPlot(Temp[3],"Lua_cang_EMI_GGmen3_1",0)
					sleep(10)					
					SkillB = 0
				end
			else
				break	
			end	
		end	
	end
end

--------------------------------------------------------------
function Lua_cang_EMI_GGmen3_1()

	local Count1 = 0
	local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���{�b�ӰϤ����Ҧ����a
	local ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
		SetAttack( OwnerID() , ThesePlayer[i] ) --�e�X�����ؼ�
	end	
	while 1 do
		Sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )	--��ؼЭ�
		if (  AttackTarget == 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�	
			DelObj(OwnerID())
		end 
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�	
			if Count1 == 0 then
				Addbuff( OwnerID(), 504204, 1 , -1)	--��ۤvbuff
				Count1 = 1
			end	
		end	
	end
end

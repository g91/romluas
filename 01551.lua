
function Lua_cang_WD_AI6()

	local SkillA = 0

	while true do
	Sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�
			SkillA = SkillA + 1
			
			local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���{�b�ӰϤ����Ҧ����a
			local ThesePlayer = {}
			for i=1,TempPlayer do
				ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
			end
			local anyone = Rand(table.getn(ThesePlayer))+1	--rand 
			if SkillA >= 10 then 
			
				CastSpellLV( OwnerID() , ThesePlayer[anyone] , 494173 , 1 )
				sleep(30)
				local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
				local worm = {}
				for i= 1, 3, 1 do
					worm[i] = LuaFunc_CreateObjByObj ( 102667, ThesePlayer[anyone] )
					AddToPartition( worm[i] ,    RoomID )	--�[�i�R�x
					BeginPlot( worm[i] , "Lua_cang_WD_AI6_1",0 )
					SysCastSpellLV( ThesePlayer[anyone], worm[i], 494176, 1)	--rand�X�Ӫ��H����J��
					SetAttack( worm[i] , ThesePlayer[anyone] ) --�e�X�����ؼ�
				end
				SkillA = 0
			end
		else
		end	
	end
end

function Lua_cang_WD_AI6_1()

	while true do
	Sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		sleep(10)
		if (  AttackTarget == 0 ) and ( CheckID( OwnerID() ) == true ) then  -- �ˬd�O�_���}�԰�
			Delobj(OwnerID())
		end
	end
end	


--�e�f�ˬd�Z��
function Lua_cang_WD_AI4()

	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)	--��ROOMID
	local PPL = SetSearchAllPlayer(RoomID)

	for i = 1 , PPL , 1 do --�h�j�M
		ID[i] = GetSearchResult() -- ���Ȧs��
		if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) ~= 1 and GetDistance( ID[i] , OwnerID() ) > 0 and GetDistance( ID[i] , OwnerID() ) < 75
			and ReadRoleValue( ID[i], EM_RoleValue_VOC) ~= 0 and ReadRoleValue( ID[i] , EM_RoleValue_RoomID  ) == RoomID then
			if ID[i] ~= OwnerID() and Checkbuff(ID[i], 504684) == false then
				AddBuff( ID[i] ,504684,1 ,-1 )	-- +BUFF
			end	
		end	
	end
end	



function Lua_cang_WD_AI5()

	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Temp = LuaFunc_CreateObjByObj ( 102718, OwnerID() )	--�۴�
	SetModeEx( Temp   , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Temp   , EM_SetModeType_Strikback, false )--����
	SetModeEx( Temp   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Temp   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Temp   , EM_SetModeType_Move, false )--����
	SetModeEx( Temp   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Temp   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Temp   , EM_SetModeType_HideName, false )--�W��
	DelFromPartition( Temp )
	AddToPartition( Temp ,    RoomID )	--�[�i�R�x
	AddBuff( Temp ,504812,1 ,-1 )
	BeginPlot(Temp,"Lua_cang_WD_AI5_1",0)

end

function Lua_cang_WD_AI5_1()
	sleep(120)
	Delobj(OwnerID())
end

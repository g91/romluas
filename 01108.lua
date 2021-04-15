function Discowood_Colddowns(Sec)
	local BasicCD = 5
	local TargetCastingSpell = ReadRoleValue(TargetID() , EM_RoleValue_SpellMagicID ) --��ؼХ��b�I���k�N
	local TargetCastingSpell_ColdownType
	local TargetRoleValue_CastingSpell_Coldown

	if TargetCastingSpell ~= 0 then -- �p�G���b�I�k

		TargetCastingSpell_ColdownType  = GameObjInfo_Int( TargetCastingSpell ,"ColdownType") -- ��o�Ӫk�N���N�o���O
--		Say(OwnerID()  ,  TargetCastingSpell_ColdownType )
		TargetRoleValue_CastingSpell_Coldown = GameObjInfo_Int( TargetCastingSpell ,"ColdownTime") --��o�Ӫk�N���N�o�ɶ�
--		Say(OwnerID() , TargetRoleValue_CastingSpell_Coldown )
		
		if Sec ~= nil then
			if TargetCastingSpell_ColdownType == 0 then
				WriteRoleValue(TargetID() , EM_RoleValue_Coldown_All , Sec )
			else
				WriteRoleValue(TargetID() , EM_RoleValue_Coldown_Job + TargetCastingSpell_ColdownType , TargetRoleValue_CastingSpell_Coldown)
				--Say(OwnerID()  , ReadRoleValue( TargetID() , EM_RoleValue_Coldown_Job + TargetCastingSpell_ColdownType ) )
			end
		else
			if TargetCastingSpell_ColdownType == 0 then
				WriteRoleValue(TargetID() , EM_RoleValue_Coldown_All ,  BasicCD  )
				--Say(OwnerID()  ,  ReadRoleValue(TargetID() , EM_RoleValue_Coldown_All   )  )
			else
				WriteRoleValue(TargetID() , EM_RoleValue_Coldown_Job + TargetCastingSpell_ColdownType , TargetRoleValue_CastingSpell_Coldown ) --�N�N�o�ɶ��g�J�ؼХ��b�񪺪k�N���N�o
				--Say(OwnerID()  , ReadRoleValue( OwnerID() , EM_RoleValue_Coldown_Job + TargetCastingSpell_ColdownType ) )
			end
		end
	end
end

function DW_CheckUse(ObjID,MagicID)  -- �^��ObjID��MagicID�N�o�ȡA�p�GMagicID�S���N�o���O�h�^��0�A�^��0�N��o�Ӫk�N�i�H�ΤF
	local Class = GameObjInfo_Int(MagicID,"ColdownClass")-- ��o�Ӫk�N�������N�o���O
	local Type  = GameObjInfo_Int( MagicID,"ColdownType") -- ��o�Ӫk�N���������N�o���O
	return ReadRoleValue(ObjID , EM_RoleValue_Coldown_Job + Type  ) 
end

function DW_SetColdown(ObjID,MagicID,CD)  -- �NMagicID���k�N�N�o�]�w��CD
	local Class = GameObjInfo_Int(MagicID,"ColdownClass")-- ��o�Ӫk�N�������N�o���O
	local Type  = GameObjInfo_Int( MagicID,"ColdownType") -- ��o�Ӫk�N���������N�o���O
	WriteRoleValue(ObjID , EM_RoleValue_Coldown_Job + Type ,  CD) 
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_DEGRADE_MINING() --���q��
	local NPC = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
		if(ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Mining ) == 100) then
			SetFlag( OwnerID(), 540371 ,0 );--�R���ǩ_��歫�n���~
		elseif(ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Mining ) == 80) then
			SetFlag( OwnerID(), 540358 ,0 );--�R���j�v��歫�n���~
		elseif (ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Mining ) == 60) then
			SetFlag( OwnerID(), 540349, 0);--�R���M���歫�n���~
--			DelBodyItem( OwnerID() , 530043 , 1 )
--			GiveBodyItem( OwnerID() , 530009 , 1 )
		elseif (ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Mining ) == 40) then
			SetFlag( OwnerID(), 540340, 0 );--�R���u�K��歫�n���~
--			DelBodyItem( OwnerID() , 530009 , 1 )
--			GiveBodyItem( OwnerID() , 530000 , 1 )
		end

	SetSpeakDetail( OwnerID(),GetString( "ST_DEGRADE_OK" ));--/*�n���A�A�{�b�����w�U���@���F�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK"), "LuaS_"..NPC.."_0", 0 ); --/*��^�W�@��

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_DEGRADE_LUMBERING() --����
	local NPC = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
		if(ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Lumbering ) == 100) then
			SetFlag( OwnerID(), 540370 ,0 );--�R���ǩ_��歫�n���~
		elseif(ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Lumbering ) == 80) then
			SetFlag( OwnerID(), 540359 ,0 );--�R���j�v��歫�n���~
		elseif (ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Lumbering ) == 60) then
			SetFlag( OwnerID(), 540350, 0);--�R���M���歫�n���~
--			DelBodyItem( OwnerID() , 530044 , 1 )
--			GiveBodyItem( OwnerID() , 530010 , 1 )
		elseif (ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Lumbering ) == 40) then
			SetFlag( OwnerID(), 540341, 0 );--�R���u�K��歫�n���~
--			DelBodyItem( OwnerID() , 530010 , 1 )
--			GiveBodyItem( OwnerID() , 530001, 1 )
		end

	SetSpeakDetail( OwnerID(),GetString( "ST_DEGRADE_OK" )  );--/*OK�A�A�{�b�����w�U���@���F�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK"), "LuaS_"..NPC.."_0", 0 ); --/*��^�W�@��

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_DEGRADE_HERBLISM() --���ĥ�
	local NPC = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)

		if(ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Herblism ) == 100) then
			SetFlag( OwnerID(), 540372 ,0 );--�R���ǩ_��歫�n���~
		elseif(ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Herblism ) == 80) then
			SetFlag( OwnerID(), 540360 ,0 );--�R���j�v��歫�n���~
		elseif (ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Herblism  ) == 60) then
			SetFlag( OwnerID(), 540351, 0);--�R���M���歫�n���~
--			DelBodyItem( OwnerID() , 530045 , 1 )
--			GiveBodyItem( OwnerID() , 530011 , 1 )
		elseif (ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Herblism ) == 40) then
			SetFlag( OwnerID(), 540342, 0 );--�R���u�K��歫�n���~
--			DelBodyItem( OwnerID() , 530011 , 1 )
--			GiveBodyItem( OwnerID() , 530002 , 1 )
		end

	SetSpeakDetail( OwnerID(),GetString( "ST_DEGRADE_OK" )  );--/*OK�A�A�{�b�����w�U���@���F�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK"), "LuaS_"..NPC.."_0", 0 ); --/*��^�W�@��

end

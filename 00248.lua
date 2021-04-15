--------------------------------------------------------------------------------------------------------------------------
function LuaS_DEGRADE_MINING() --挖礦用
	local NPC = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
		if(ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Mining ) == 100) then
			SetFlag( OwnerID(), 540371 ,0 );--刪除傳奇資格重要物品
		elseif(ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Mining ) == 80) then
			SetFlag( OwnerID(), 540358 ,0 );--刪除大師資格重要物品
		elseif (ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Mining ) == 60) then
			SetFlag( OwnerID(), 540349, 0);--刪除專精資格重要物品
--			DelBodyItem( OwnerID() , 530043 , 1 )
--			GiveBodyItem( OwnerID() , 530009 , 1 )
		elseif (ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Mining ) == 40) then
			SetFlag( OwnerID(), 540340, 0 );--刪除工匠資格重要物品
--			DelBodyItem( OwnerID() , 530009 , 1 )
--			GiveBodyItem( OwnerID() , 530000 , 1 )
		end

	SetSpeakDetail( OwnerID(),GetString( "ST_DEGRADE_OK" ));--/*好的，你現在的資格已下降一階了。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK"), "LuaS_"..NPC.."_0", 0 ); --/*返回上一頁

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_DEGRADE_LUMBERING() --伐木用
	local NPC = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
		if(ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Lumbering ) == 100) then
			SetFlag( OwnerID(), 540370 ,0 );--刪除傳奇資格重要物品
		elseif(ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Lumbering ) == 80) then
			SetFlag( OwnerID(), 540359 ,0 );--刪除大師資格重要物品
		elseif (ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Lumbering ) == 60) then
			SetFlag( OwnerID(), 540350, 0);--刪除專精資格重要物品
--			DelBodyItem( OwnerID() , 530044 , 1 )
--			GiveBodyItem( OwnerID() , 530010 , 1 )
		elseif (ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Lumbering ) == 40) then
			SetFlag( OwnerID(), 540341, 0 );--刪除工匠資格重要物品
--			DelBodyItem( OwnerID() , 530010 , 1 )
--			GiveBodyItem( OwnerID() , 530001, 1 )
		end

	SetSpeakDetail( OwnerID(),GetString( "ST_DEGRADE_OK" )  );--/*OK，你現在的資格已下降一階了。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK"), "LuaS_"..NPC.."_0", 0 ); --/*返回上一頁

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_DEGRADE_HERBLISM() --採藥用
	local NPC = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)

		if(ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Herblism ) == 100) then
			SetFlag( OwnerID(), 540372 ,0 );--刪除傳奇資格重要物品
		elseif(ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Herblism ) == 80) then
			SetFlag( OwnerID(), 540360 ,0 );--刪除大師資格重要物品
		elseif (ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Herblism  ) == 60) then
			SetFlag( OwnerID(), 540351, 0);--刪除專精資格重要物品
--			DelBodyItem( OwnerID() , 530045 , 1 )
--			GiveBodyItem( OwnerID() , 530011 , 1 )
		elseif (ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Herblism ) == 40) then
			SetFlag( OwnerID(), 540342, 0 );--刪除工匠資格重要物品
--			DelBodyItem( OwnerID() , 530011 , 1 )
--			GiveBodyItem( OwnerID() , 530002 , 1 )
		end

	SetSpeakDetail( OwnerID(),GetString( "ST_DEGRADE_OK" )  );--/*OK，你現在的資格已下降一階了。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK"), "LuaS_"..NPC.."_0", 0 ); --/*返回上一頁

end

--------------------------------------------------------------------------------------------------------------------------
function LuaS_DEGRADE_ALCHEMY() --煉金用
	local NPC = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
		if(ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Alchemy ) == 100) then
			SetFlag( OwnerID(),540375,0 );--刪除傳奇資格重要物品
		elseif(ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Alchemy ) == 80) then
			SetFlag( OwnerID(), 540366 ,0 );--刪除大師資格重要物品
		elseif (ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Alchemy  ) == 60) then
			SetFlag( OwnerID(), 540357, 0);--刪除專精資格重要物品
--			DelBodyItem( OwnerID() , 530051 , 1 )
--			GiveBodyItem( OwnerID() , 530017 , 1 )
		elseif (ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Alchemy ) == 40) then
			SetFlag( OwnerID(), 540348, 0 );--刪除工匠資格重要物品
--			DelBodyItem( OwnerID() , 530017 , 1 )
--			GiveBodyItem( OwnerID() , 530008 , 1 )
		end

	SetSpeakDetail( OwnerID(),GetString( "ST_DEGRADE_OK" )  );--/*好的，你現在的資格已下降一階了。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK"), "LuaS_"..NPC.."_0", 0 ); --/*返回上一頁

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_DEGRADE_COOK() --烹飪用
	local NPC = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
		if(ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Cook ) == 100) then
			SetFlag( OwnerID(), 540373 ,0 );--刪除傳奇資格重要物品
		elseif(ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Cook ) == 80) then
			SetFlag( OwnerID(), 540365 ,0 );--刪除大師資格重要物品
		elseif (ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Cook  ) == 60) then
			SetFlag( OwnerID(), 540356, 0);--刪除專精資格重要物品
--			DelBodyItem( OwnerID() , 530050 , 1 )
--			GiveBodyItem( OwnerID() , 530016 , 1 )
		elseif (ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Cook ) == 40) then
			SetFlag( OwnerID(), 540347, 0 );--刪除工匠資格重要物品
--			DelBodyItem( OwnerID() , 530016 , 1 )
--			GiveBodyItem( OwnerID() , 530007 , 1 )
		end

	SetSpeakDetail( OwnerID(),GetString( "ST_DEGRADE_OK" )  );--/*好的，你現在的資格已下降一階了。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK"), "LuaS_"..NPC.."_0", 0 ); --/*返回上一頁

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_DEGRADE_MAKEARMOR() --製甲用
	local NPC = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
		if(ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_MakeArmor ) == 100) then
			SetFlag( OwnerID(), 544329 ,0 );--刪除傳奇資格重要物品
		elseif(ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_MakeArmor ) == 80) then
			SetFlag( OwnerID(), 540363 ,0 );--刪除大師資格重要物品
		elseif (ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_MakeArmor  ) == 60) then
			SetFlag( OwnerID(), 540354, 0);--刪除專精資格重要物品
--			DelBodyItem( OwnerID() , 530047 , 1 )
--			GiveBodyItem( OwnerID() , 530013 , 1 )
		elseif (ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_MakeArmor ) == 40) then
			SetFlag( OwnerID(), 540345, 0 );--刪除工匠資格重要物品
--			DelBodyItem( OwnerID() , 530013 , 1 )
--			GiveBodyItem( OwnerID() , 530004 , 1 )
		end

	SetSpeakDetail( OwnerID(),GetString( "ST_DEGRADE_OK" )  );--/*OK，你現在的資格已下降一階了。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK"), "LuaS_"..NPC.."_0", 0 ); --/*返回上一頁

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_DEGRADE_BLACKSMITH() --打鐵用
	local NPC = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
		if(ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_BlackSmith ) == 100) then
			DelBodyItem( OwnerID(), 540369 ,1 );--刪除傳奇資格重要物品
		elseif(ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_BlackSmith ) == 80) then
			DelBodyItem( OwnerID(), 540361 ,1 );--刪除大師資格重要物品
		elseif (ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_BlackSmith ) == 60) then
			DelBodyItem( OwnerID(), 540352, 1);--刪除專精資格重要物品
--			DelBodyItem( OwnerID() , 530046, 1 )
--			GiveBodyItem( OwnerID() , 530012 , 1 )
		elseif (ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_BlackSmith ) == 40) then
			DelBodyItem( OwnerID(), 540343, 1 );--刪除工匠資格重要物品
--			DelBodyItem( OwnerID() , 530012 , 1 )
--			GiveBodyItem( OwnerID() , 530003 , 1 )
		end

	SetSpeakDetail( OwnerID(),GetString( "ST_DEGRADE_OK" )  );--/*你現在的資格已下降一階了。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK"), "LuaS_"..NPC.."_0", 0 ); --/*返回上一頁

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_DEGRADE_CARPENTER() --木工用
	local NPC = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
		if(ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Carpenter ) == 100) then
			SetFlag( OwnerID(), 540368 ,0 );--刪除傳奇資格重要物品
		elseif(ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Carpenter ) == 80) then
			SetFlag( OwnerID(), 540362 ,0 );--刪除大師資格重要物品
		elseif (ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Carpenter  ) == 60) then
			SetFlag( OwnerID(), 540353, 0);--刪除專精資格重要物品
--			DelBodyItem( OwnerID() , 530048 , 1 )
--			GiveBodyItem( OwnerID() , 530014 , 1 )
		elseif (ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Carpenter ) == 40) then
			SetFlag( OwnerID(), 540344, 0 );--刪除工匠資格重要物品
--			DelBodyItem( OwnerID() , 530014 , 1 )
--			GiveBodyItem( OwnerID() , 530005 , 1 )
		end

	SetSpeakDetail( OwnerID(),GetString( "ST_DEGRADE_OK" )  );--/*OK，你現在的資格已下降一階了。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK"), "LuaS_"..NPC.."_0", 0 ); --/*返回上一頁

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_DEGRADE_TAILOR() --裁縫用
	local NPC = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
		if(ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Tailor ) == 100) then
			SetFlag( OwnerID(), 540374 ,0 );--刪除傳奇資格重要物品
		elseif(ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Tailor ) == 80) then
			SetFlag( OwnerID(), 540364 ,0 );--刪除大師資格重要物品
		elseif (ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Tailor  ) == 60) then
			SetFlag( OwnerID(), 540355, 0);--刪除專精資格重要物品
--			DelBodyItem( OwnerID() , 530049 , 1 )
--			GiveBodyItem( OwnerID() , 530015 , 1 )
		elseif (ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Tailor ) == 40) then
			SetFlag( OwnerID(), 540346, 0 );--刪除工匠資格重要物品
--			DelBodyItem( OwnerID() , 530015 , 1 )
--			GiveBodyItem( OwnerID() , 530006 , 1 )
		end

	SetSpeakDetail( OwnerID(),GetString( "ST_DEGRADE_OK" )  );--/*好的，你現在的資格已下降一階了。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK"), "LuaS_"..NPC.."_0", 0 ); --/*返回上一頁
end
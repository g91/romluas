function Lua_hao_PlantLimitlv1()

	local SkillLV = ReadRoleValue(OwnerID(), EM_SkillValueType_Plant )
	local lvA = 0
	local lvB = 20			--/*���B�]�w�ϥγ̰�����
--	local lvC = 40			--/*���B�]�w�ϥΤ��i�C�󵥯�

	if ( SkillLV <= lvB and SkillLV > lvA ) then					--/*�P�_����
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("Good Well") , 0 )	--/*�A���\�ϥΤF�]�k��@���~
			ScriptMessage( OwnerID(), OwnerID(), 1, GetString("Good Well") , 0 )	--/*�A���\�ϥΤF�]�k��@���~
	else
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("Ur plantLv can't use this item") , 0 )	--/*�A���شӵ��Ŧ��G�L�k�ϥΦ����~
			ScriptMessage( OwnerID(), OwnerID(), 1, GetString("Ur plantLv can't use this item") , 0 )	--/*�A���شӵ��Ŧ��G�L�k�ϥΦ����~
	end
	
end

function Lua_Hao_Plant_SeasonIII_Test()

	Say( OwnerID() , "IamOwner" )
	Say( TargetID() , "IamTarget" )
	
	local Random = Rand(100)+1

	if Random <= 100 then
		Say( OwnerID() , "1" )
		Say( TargetID() , "2" )
		GiveBodyItem( OwnerID() , 209373 , 1 )
	end
end
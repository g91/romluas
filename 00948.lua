function BuffAddSkillT_YU()

	local Before_MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )

	Say(OwnerID(),"Before_MaxHP = "..Before_MaxHP)
	sleep(20)

	--AddBuff(OwnerID()  , 506161, 0 , -1)
	AddBuff(OwnerID()  , 505251, 0 , -1)
	sleep(20)
	local NOW_MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )

	Say(OwnerID(),"NOW_MaxHP = "..NOW_MaxHP)
end

function LuaI_test_YU_01()   --����C��̻������a
	local DIS = 0
	local OB = 0
	local X = 0

	while true do
	sleep(10)
		local HateC = HateListCount( OwnerID() )
		local HC0 = HateListInfo(OwnerID() , X , EM_HateListInfoType_GItemID )
		SAY( HC0 , 3 )

		If X < HateC then

			if GetDistance( OwnerID(), HC0 ) > DIS then
				X = X+1
				DIS = GetDistance( OwnerID(), HC0)
				OB = HC0
				SAY( OwnerID(), 1 )
				SAY( OB, 2 )
			end
		end

	end


end

function LuaI_test_YU_02() 


	local Monster = LuaFunc_SearchNPCbyOrgID(OwnerID(), 113042, 300 , 1)       --�P�_�P�򪺬Y���Ǫ����x�}��m 

	for i=0 , table.getn(Monster ) do	
		if Monster[i] ~= -1 then


			Delobj(Monster[i])

		end
	end

end

function LuaI_test_YU_03() 


	local Monster = LuaFunc_SearchNPCbyOrgID(OwnerID(), 112068, 200 , 1)       --�P�_�P�򪺬Y���Ǫ����x�}��m 

	local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 
	for i = 0,table.getn(Monster) do

		Show(Monster[i] ,  RoomID  )

		Say( Monster[i] , i.."    88  "  )

		Delobj(Monster[i])
	end
end

function LuaYu_testfloor_go01()

	Lua_MadeByRectangle(113042 , 29 , 29 , 3 , 3 )  --Wnm�ݬ�1.3.5....Lnm�ݬ������,Wdis����V���Z,Ldis���e�ᶡ�Z (�����w�}�C���e)

end

function LuaYu_test_buff()--���ۤv��BUFF

	AddBuff( OwnerID() , 506164 , 0, -1 )--�v���ĪG�U��95%
end

function LuaYu_test_100up()--��j100%
	SetModelScale( OwnerID() , 2 ) 
end

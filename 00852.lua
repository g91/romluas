function LuaI_coboStr_00()                                                                                                 --�w�f���~�v�@��

                SetPlot( OwnerID(),"range","LuaI_coboStr_01",200 )                                         --�d��Ĳ�o

end

function LuaI_coboStr_01()

	SetPlot( TargetID(),"range","",0 )                                                                     --���@�Ӫŭ�function�A�����A��Ĳ�o�d��@�����i��C                                                                 
	BeginPlot( TargetID() , "LuaI_coboStr_02" , 0 )                                                   --�R�O���w����I�s Script
end





function LuaI_coboStr_02()



	local CoStrID = LuaFunc_SearchNPCbyOrgID(OwnerID(), 100913, 200 , 1)       --�P�_�P�򪺬Y���Ǫ����x�}��m �w�f�O�h

	local CoDrID = LuaFunc_SearchNPCbyOrgID(OwnerID(), 100914, 200 , 1)       --�P�_�P�򪺬Y���Ǫ����x�}��m �w�f����

	local CoMagicID = LuaFunc_SearchNPCbyOrgID(OwnerID(), 100636, 200 , 1)       --�P�_�P�򪺬Y���Ǫ����x�}��m �w�f�k�v

                SetAttack( CoStrID[0], TargetID() )
                SetAttack( CoStrID[1], TargetID() )
                SetAttack( CoMagicID[0], TargetID() )


	local HP1 = 0                                                                                                          --�ŧi HP �o�Ӽƭ�
	local HP2 = 0                                                                                                          --�ŧi HP �o�Ӽƭ�
	local strMaxHP = ReadRoleValue( CoStrID[0], EM_RoleValue_MaxHP )              --�ŧi�Ǫ����̤jHP
	local NowHP = strMaxHP * 0.7                                                                                 --�ŧi helfHP ����̤jHP���@�b

		HP1 = ReadRoleValue( CoStrID[0], EM_RoleValue_HP )                    -- �ˬd����ثeHP���ݶq
		HP2 = ReadRoleValue( CoStrID[1], EM_RoleValue_HP )                    -- �ˬd����ثeHP���ݶq


	while true do
		sleep(10)

		if HP1 < NowHP   or    HP2 < NowHP     then                                                                              -- �YHP�C��h�֦�q

                               CastSpell( CoDrID[0]  , CoStrID[0] , 490654)                                                              --�I��k�N(�I�k��,��Hid,�k�Nid) 
                               CastSpell( CoDrID[2]  , CoStrID[1] , 490654)                                                              --�I��k�N(�I�k��,��Hid,�k�Nid) 


			break
		end	
	end
end
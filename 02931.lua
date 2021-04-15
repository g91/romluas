function Na_Give_NoSpace(ID) --�����ٸ��άO�X�СA�}��§�]�����ˬd�I�]�Ŷ�
	local Owner = OwnerID()
	GiveBodyItem( Owner , ID , 1 )
end

function Na_Open_Box( PackageID, Option, Drop ) --�ˬd�I�]�Ŷ����}�]�禡�APackageID =§�]�s���AOption��Check/Use �ADrop = ���_��
	local PlayerID = OwnerID()
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , 1  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , Drop , 1 )	
	end
end


--�����t��
function Na_skill_formula_test()
	local Owner = OwnerID()
	local Num1 = 548988  --�t��_�l�s��
	local Num2 = 549096 --�t��̲׽s��

	for i = Num1 , Num2 do
		GiveBodyItem( Owner , i , 1 )
		sleep(5)
	end

end

-- for test armor
function Lua_armor_Test(group)
	local Owner = OwnerID()
	local A = {	231258  ,231259  ,231260  ,231261  ,231262  ,231263  ,231264  ,231265  ,
231266  ,231267  ,231268  ,231269  ,231270  ,231271  ,231272  ,231273  ,
231274  ,231275  ,231276  ,231277  ,231278  ,231279  ,231280  ,231281  ,
231282  ,231283  ,231284  ,231285  ,231286  ,231287  ,231288  ,231289  ,
231290  ,231291  ,231292  }
	for i = 1 , #A do
		Givebodyitem( Owner , A[i] , 1 )
	end
	DebugMsg( Owner , 0 , "Group = "..#A.. " give OK!" )
end

--�R���d�򤺯S�w�s��������
function Na_Del_NPC(ObjID)
	local Owner = OwnerID()
	local NPC = SearchRangeNPC( Owner, 300)
	if #NPC ~= 0 then
		for i = 0 , #NPC do
			if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID ) == ObjID then
				SetModeEx( NPC[i] , EM_SetModeType_Save , false )
				DelObj( NPC[i] )
				Say( Owner , "Del")
			end
		end
	else
		Say( Owner , "No NPC! ")
	end
end

function NA_ChangeZone()
	ChangeZone( OwnerID(), 1, 0, -3600 , 220 , -8675 , 0)
end


function NA_NPC_ID_SHOW() --��NPC�s��
	local Owner = OwnerID()
	local NPC = SearchRangeNPC( Owner, 20)
	if #NPC ~= 0 then
		for i = 0 , #NPC do
			Say ( NPC[i] , ReadRoleValue( NPC[i] , EM_RoleValue_OrgID) )
			Say ( Owner  , ReadRoleValue( NPC[i] , EM_RoleValue_OrgID) )
		end
	else
		Say( Owner , "No NPC! ")
	end
end

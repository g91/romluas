-- Z21 Quest  �Q�ΤѼ�
--���~ - �˽�����Ţ�l(240580) �@��

--���~ - �˽�����Ţ�l(240580)  �ϥ��ˬd
function lua_Q424626_item_check()
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local MaxHP = ReadRoleValue( TargetID() , EM_RoleValue_MaxHP )	--Ū����q
	local NowHP = ReadRoleValue(  TargetID() , EM_RoleValue_HP )
	local HPPercent = NowHP / MaxHP	--��q�ʤ���
	local Obj = OwnerID()
	if 	CheckAcceptQuest(Obj,424626) == true or
		CheckAcceptQuest(Obj,424627) == true or
		CheckAcceptQuest(Obj,424642) == true then  -- ����������
		if ( CheckID( TargetID() ) == false ) then  --�S����H
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_424142_1]" , 0 ) --�ϥΥؼп��~�I
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_424142_1]" , 0 ) 
			return false
		elseif ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --�I�k��H�O���a
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_424142_1]" , 0 ) --�ϥΥؼп��~�I
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_424142_1]" , 0 ) 
			return false
		else  
			if OrgID == 106078  then   -- ��H���T
				if  ReadRoleValue( TargetID(), EM_RoleValue_IsDead ) == 1 then   -- �p�G�ؼФw������
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_493625_2]" , 0 )	--�ؼФw���`
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_493625_2]"  , 0 )
					return false

				else
					if  HPPercent > 0.5  then  -- �ؼЦ�q �h��50 %
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_424626_1]" , 0 ) --�����٫��F���A�q�A���x�����k�}
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_424626_1]"  , 0 )	
						return false
					else	
						  -- ���\
						return true
					end
				end

			else
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_424142_1]" , 0 )  --�ϥΥؼп��~�I
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_424142_1]" , 0 )
				return false
			end

		end
	else
		ScriptMessage( OwnerID(),  OwnerID(), 1, "[SC_424626_2]" , 0 )  -- �S��������
		ScriptMessage( OwnerID(),  OwnerID(), 0, "[SC_424626_2]" , 0 )  
		return false
	end

end


--���~ - �˽�����Ţ�l(240580)  �ϥήĪG
function lua_Q424626_item_use()
	local Monster = TargetID()

	DW_QietKillOne(OwnerID(), 106118  )
	CallPlot( Monster,"LuaFunc_ResetObj", Monster)
end

----------------------------------------------------------------------------------
-- Z21 Quest  �ӤH���p ( 424564 ) /  ���@���p (424565  , 424638)

-- �Шϥ�OBJEDIT �إ� 119245,  �æb��l�@�����W  lua_Q424564_01

-- ���ê���119245 �]�w�d��@��
function lua_Q424564_01()
	SetPlot( OwnerID() , "range" , "lua_Q424564_02" , 120 )
end

-- ���ê���119245 �d��Ĳ�o�@�����e
function lua_Q424564_02()
	local Obj = OwnerID()
	if CheckCompleteQuest(Obj,424412)	then
		local RandResult = DW_Rand(100)
		if 	RandResult>50	then
			SetPlot( TargetID() , "range" , "" , 0 )  -- �����d��@��
			local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
			local monster = DW_CreateObjEX("obj",106079,TargetID(),1,70)
			SetFightMode( monster , 1 , 1 , 1 , 1 )  -- ����, ����, �k�], ���
			AddToPartition( monster , RoomID )
			WriteRoleValue( monster , EM_RoleValue_Register,  TargetID() )
			local Box = TargetID();
			SetAttack(monster,Obj);
			CallPlot( monster, "lua_Q424564_03", Box )  -- ���y�ۤv�O�_�b�԰���
			Setplot( monster, "dead", "lua_Q424564_05", 0 )  -- ���`�@��
		end
	end
end

-- �ɦ�X�w���ʵ���(106079 �X�ͫᱽ�y�ۤv�O�_�԰���
function lua_Q424564_03(Box)
	sleep(300)
	while true do
		Sleep(30)	-- �C3���ˬd�@��
		if HateListCount(OwnerID())==0  then  --�ˬd�O�_���}�԰�
			lua_Q424564_04(Box);
		end
	end
end

-- �Ǫ����}�԰��� Ĳ�o�@��
function lua_Q424564_04(Box)
	SetPlot( box, "range" , "lua_Q424564_02" , 120 )
	Delobj(OwnerID())  --  �R����
end

-- �Ǫ����`�� Ĳ�o�@��
function lua_Q424564_05()
	local Box = ReadRoleValue( OwnerID(), EM_RoleValue_Register )
	CallPlot(Box,"LuaFunc_ResetObj",Box); 
	return true;
end
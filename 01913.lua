--�ѱa�s�������եΫ��O 

function Lua_mika_teachpoint_show1()
	local status1 = ReadRoleValue( OwnerID() ,EM_RoleValue_STR )
	local status2 = 	ReadRoleValue( OwnerID() ,EM_RoleValue_AGI  )  
	local status3 = 	ReadRoleValue( OwnerID() ,EM_RoleValue_STA )
	local status4 = 	ReadRoleValue( OwnerID() ,EM_RoleValue_INT )
	local status5 = 	ReadRoleValue( OwnerID() ,EM_RoleValue_MND )
	Say(OwnerID(), status1 )
	Say(OwnerID(), status2 )
	Say(OwnerID(), status3 )
	Say(OwnerID(), status4 )
	Say(OwnerID(), status5 )
end

function Lua_mika_teachpoint_show2()
	local time1 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem15 )  --�ѱa�s�t�� �I���O�q����
	local time2 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem16 )  --�ѱa�s�t�� �I���ӱ�����
	local time3 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem17 )  --�ѱa�s�t�� �I���@�O����
	local time4 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem18 )  --�ѱa�s�t�� �I�����z����
	local time5 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem19 )  --�ѱa�s�t�� �I���믫����
	Say(OwnerID(), time1 )
	Say(OwnerID(), time2 )
	Say(OwnerID(), time3 )
	Say(OwnerID(), time4 )
	Say(OwnerID(), time5 )
end

-- ��10000�I�a�A�I��
function GiveMedalCount()	
	ScriptMessage( OwnerID(), OwnerID(), 1, "You Get 10000 Honor Point" , C_DEFAULT )
	AddRoleValue( OwnerID() , EM_RoleValue_MedalCount , 10000 )
	local teachpoint =  ReadRoleValue ( OwnerID() , EM_RoleValue_MedalCount  )
	Say(OwnerID(), teachpoint )
end

---�k�s
function Lua_mika_teachpoint_zero() --�a�A�I��
	WriteRoleValue( OwnerID() , EM_RoleValue_MedalCount , 0 )
	local teachpoint =  ReadRoleValue ( OwnerID() , EM_RoleValue_MedalCount  )
	Say(OwnerID(), teachpoint )
end

function Lua_mika_teachpoint_zeroall()   --5����O��
	WriteRoleValue( OwnerID() ,EM_RoleValue_STR , 0 )
	WriteRoleValue( OwnerID() ,EM_RoleValue_AGI , 0 )  
	WriteRoleValue( OwnerID() ,EM_RoleValue_STA , 0 )
	WriteRoleValue( OwnerID() ,EM_RoleValue_INT, 0 )
	WriteRoleValue( OwnerID() ,EM_RoleValue_MND , 0 )
	Say(OwnerID(), "status all clear !! " )
end

function Lua_mika_teachpoint_zerotime()
	WriteRoleValue( OwnerID() ,EM_LuaValueFlag_UseItem15 , 0 )
	WriteRoleValue( OwnerID() ,EM_LuaValueFlag_UseItem16 , 0 )
	WriteRoleValue( OwnerID() ,EM_LuaValueFlag_UseItem17 , 0 )
	WriteRoleValue( OwnerID() ,EM_LuaValueFlag_UseItem18 , 0 )
	WriteRoleValue( OwnerID() ,EM_LuaValueFlag_UseItem19 , 0 )
	local time1 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem15 )  --�ѱa�s�t�� �I���O�q����
	local time2 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem16 )  --�ѱa�s�t�� �I���ӱ�����
	local time3 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem17 )  --�ѱa�s�t�� �I���@�O����
	local time4 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem18 )  --�ѱa�s�t�� �I�����z����
	local time5 = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem19 )  --�ѱa�s�t�� �I���믫����
	Say(OwnerID(), time1 )
	Say(OwnerID(), time2 )
	Say(OwnerID(), time3 )
	Say(OwnerID(), time4 )
	Say(OwnerID(), time5 )
end
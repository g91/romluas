-- ���b���ȼҪ��M��
function Mika_KeyitemOnoff(flagid, status)   
-- flagid  =  keyitem id 
-- status  =  0 �� �����X��, status = 1 �}�ҺX��  
	local player = TargetID()
	Setflag(player, flagid, status )
end

--- �d��: @Mika_KeyitemOnoff(546192, 1)   

--------------------------------------------------------------------------------------------

-- �i���b���~�ϥ�serverscript, id �i��J���_��s�� , ��: Mika_GiveTreasureID(726983)
-- �����i��o���_���H���@�ت��~ 
function Mika_GiveTreasureID(id)
	local player = OwnerID()
	if Check_Bag_Space( player , 1 ) == false then  -- �]���O���_��, �u���Ů�1��
		return false
	else
		GiveBodyItem(player, id, 1)
	end

end

-- ��o�Ķ��t���������n���~ (�q �� ��)
function Mika_GatherSkill_Keyget()
	local player = OwnerID()
	local gatherskill_keytable =
			{
			540269, 540340, 540349,540358, 540371, 
			540270, 540341, 540350,540359, 540370,
			540333, 540342, 540351, 540360, 540372
			}

	for i = 1, #gatherskill_keytable do
		if CheckFlag(player, gatherskill_keytable[i] ) == false then
			SetFlag(player, gatherskill_keytable[i], 1 )
		end
	end
end



--�`�y�@�βM��register �Ppid�禡
function lua_EventValue_Clear(ID)
	if ID == nil then
		ID = OwnerID()
	end
	WriteRoleValue(ID, EM_RoleValue_Register, 0 )
	for i = 1, 10 do
		WriteRoleValue(ID, EM_RoleValue_Register..i, 0 )
	end

	WriteRoleValue(ID, EM_RoleValue_PID, 0 )
	Debugmsg(ID, 0, "Clear Event Value 1")
end

function lua_EventValue_Check()
	local OID = OwnerID()
	local PID = ReadRoleValue(OID, EM_RoleValue_PID)
	local R0 = ReadRoleValue(OID, EM_RoleValue_Register)
	local R1 = ReadRoleValue(OID, EM_RoleValue_Register1)
	local R2 = ReadRoleValue(OID, EM_RoleValue_Register2)
	local R3 = ReadRoleValue(OID, EM_RoleValue_Register3)
	local R4 = ReadRoleValue(OID, EM_RoleValue_Register4)
	local R5 = ReadRoleValue(OID, EM_RoleValue_Register5)
	local R6 = ReadRoleValue(OID, EM_RoleValue_Register6)
	local R7 = ReadRoleValue(OID, EM_RoleValue_Register7)
	local R8 = ReadRoleValue(OID, EM_RoleValue_Register8)
	local R9 = ReadRoleValue(OID, EM_RoleValue_Register9)
	local R10 = ReadRoleValue(OID, EM_RoleValue_Register10)
	Debugmsg(OID, 0, "PID ="..PID.." , R0 = "..R0.." , R1 = "..R1.." , R2 = "..R2.." , R3 = "..R3.." , R4 = "..R4.." , R5 = "..R5.." , R6 = "..R6.." , R7 = "..R7.." , R8 = "..R8.." , R9 = "..R9.." , R10 = "..R10 )
end

------------------------------------------------------------------------
function lua_EventValue_test01(value)
	local OID = OwnerID()
	WriteRoleValue(OID, EM_RoleValue_Register1, value )
	local value = ReadRoleValue(OID, EM_RoleValue_Register1)
	Debugmsg(OID, 0, "Event Value 1 ="..value)
end

function lua_EventValue_test02()
	local OID = OwnerID()

	local value = ReadRoleValue(OID, EM_RoleValue_Register1)
	Debugmsg(OID, 0, "Event Value 1 ="..value)
end
--===============================================================================================================================--
function LuaI_PQControlCenter_TEST() --���q�������script
	local NumSet = { 3 , 3 , 3 } --�C�@�Ӷ��q�ҭn��F���Ʀr�A�t�ȥN���F�o�ӼƦr�^�쭫�m���q�A���ȥN���F�o�ӼƦr�i�J�U�@���q�A0 �N���p��
	local TimeSet = { 10 , 10 , 10 , 10 } --��쬰��A�t�ȥN���F�o�ӼƦr�^�쭫�m���q�A���ȥN���F�o�ӼƦr�i�J�U�@���q�A�̫�@�쬰���m�һݪ��ɶ��A0 �N������

--	local CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) --���ѺX�СA��@�� Zone �֦���ӥH�W���q������ɭԻݭn�[���ѺX�СA�Ӥ��}��̪������ܼ�
--	LuaPQ_CreatePQStage(NumSet,TimeSet,CheckFlag) --�۰ʨ̾ڤW������T���ͥ����ܼƪ��禡

	LuaPQ_CreatePQStage(NumSet,TimeSet) --�]�i�H���[CheckFlag�A���[�����p�|�۰ʨ� RoomID �@�����ѺX��

	LuaI_PQ_AllBeControledByOne()   --�}�l�^��A���涥�q����u�@
end
--===============================================================================================================================--
--���󱱨��script�A�b����W�� PID �N�M�w�b���X�Ӷ��q��ܡA��軡 23 �N�|������b�� 2 �H�β� 3 ���q��ܡA103�h�O�� 1 3 �H�έ��m���q�|�X�{�A�ϥΪ������ĳ�N���R����ߧY�������İ_�A�o�˪��a�~���|�ݨ�X�{�S���������p�C

function LuaI_PQ_ObjectMob_TEST1() 
	LuaI_PQ_ObjectInitial() --��l�ơA���汱���̤��P���q����ܩΤ���ܪ��ʧ@
--	LuaI_PQ_ObjectInitial_RH() --�t�@�ت�l�ơA�ϥΦ��禡�|���L�H�����禡������ܪ��ʧ@
	SetPlot( OwnerID() , "dead" , "LuaI_PQ_ObjectDead_TEST1" , 0 ) --�]�w����@���A�����b�^��e�]�w�A�o�N�M�w����Φ�ؤ覡�ӧ��ܭp�ƾ����Ʀr�A�o��O��������ɧ��ܼƦr�A�Ӳέp�����X�Ӫ���
end
function LuaI_PQ_ObjectDead_TEST1()
	local Stage = LuaPQ_GetStage() --���o�{�b�����q
	if Stage == 1 then --�P�w�o�Ӷ��q�O���O�ӧ��ܭp�ƾ��Ʀr
		LuaPQ_ChangeNum(1) --���ܳo�Ӷ��q���p�ƾ��Ʀr�A���ȥN����i�A�t�ȥN��˰h
		ScriptMessage( OwnerID() , -1 , 2 , "Now Number is"..LuaPQ_GetNum() , 0 ) --�o�e�T��
	end
	return true
end
--==================================================================================================================================--
function LuaI_PQ_ObjectMob_TEST2()
	LuaI_PQ_ObjectInitial() --��l�ơA���汱���̤��P���q����ܪ��ʧ@�A�o�Ө禡�ä�������ܪ��B�z
	SetPlot( OwnerID() , "dead" , "LuaI_PQ_ObjectDead_TEST2" , 0 )
end
function LuaI_PQ_ObjectDead_TEST2()
	local Stage = LuaPQ_GetStage()
	if Stage == 2 then
		LuaPQ_ChangeNum(1)
		ScriptMessage( OwnerID() , -1 , 2 , "Now Number is"..LuaPQ_GetNum() , 0 )
		ScriptMessage( OwnerID() , -1 , 2 , "We have Only "..LuaPQ_GetTime().." seconds" , 0 )
	end
	return true
end

function LuaI_PQ_ObjectMob_TEST3()
	LuaI_PQ_ObjectInitial()
	SetPlot( OwnerID() , "dead" , "LuaI_PQ_ObjectDead_TEST3" , 0 )
end
function LuaI_PQ_ObjectDead_TEST3()
	local Stage = LuaPQ_GetStage()
	if Stage == 3 then
		LuaPQ_ChangeNum(1)
		ScriptMessage( OwnerID() , -1 , 2 , "Now Number is"..LuaPQ_GetNum() , 0 )
		ScriptMessage( OwnerID() , -1 , 2 , "We have Only "..LuaPQ_GetTime().." seconds" , 0 )
	end
	return true
end


function LauI_PQ_MSG_TEST()
	local Stage = 0
	local OrgNum = 0
	local Num = 0
	local OrgTime = 0
	local Time = 0
	local Str = ""
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	while 1 do
		Stage = LuaPQ_GetStage()
		Yell( OwnerID() , "Now Stage is "..Stage , 5 )
		if Stage ~= 0 then
			OrgNum = math.abs(LuaPQ_GetOrgNum())
			Num = LuaPQ_GetNum()
			OrgTime = math.abs(LuaPQ_GetOrgTime())
			Time = LuaPQ_GetTime()
			Yell( OwnerID() , "Need "..OrgNum.." corpers , Now We Have "..Num.." . " , 5 )
			if OrgTime ~= 0 then
				Yell( OwnerID() , "We have "..OrgTime.." seconds for working , Now We leave "..Time.." seconds . " , 5 )
			end
			Str = ""

			if table.getn(ZonePQ_ValueGroup_Drama[Room]["Mob"][Stage])  > 0 then
				for pry , obj in pairs(ZonePQ_ValueGroup_Drama[Room]["Mob"][Stage])  do  
					Str = Str..pry.." ="..obj.."= "
				end
				Yell( OwnerID() , "Mobs : "..Str , 5 )
			end
		else
			OrgTime = math.abs(LuaPQ_GetOrgTime())
			Time = LuaPQ_GetTime()
			if OrgTime ~= 0 then
				Yell( OwnerID() , "We have "..OrgTime.." seconds for rest , Now We leave "..Time.." seconds . " , 5 )
			end
		end
		sleep( 30 )
	end
end

function LuaI_PQ_TEST_GOGO()
	local OrgNum = math.abs(LuaPQ_GetOrgNum())
	local Stage = LuaPQ_GetStage() 
	local CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	if Stage ~= 0 then
		if OrgNum > 0 then
			LuaPQ_ChangeNum(OrgNum)
		else
			ZonePQ_ValueGroup_Drama[CheckFlag]["Time"][Stage] = 0
		end
	else
		ZonePQ_ValueGroup_Drama[CheckFlag]["Time"][Stage] = 0
	end
end

function LuaI_PQ_TEST_GOGO_LIMIT()
	local OrgNum = math.abs(LuaPQ_GetOrgNum())
	local Stage = LuaPQ_GetStage() 
	local CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	if Stage ~= 0 then
		if OrgNum > 0 then
			LuaPQ_ChangeNum(OrgNum)
		end
		ZonePQ_ValueGroup_Drama[CheckFlag]["Time"][Stage] = 0
	else
		ZonePQ_ValueGroup_Drama[CheckFlag]["Time"][Stage] = 0
	end
end

function LuaI_PQ_TEST_SHOWALL()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Str = ""
	local Sg = LuaPQ_GetStage()

	for pry , obj in pairs(ZonePQ_ValueGroup_Drama[Room]["Mob"])  do
		Str = "Stage = "..pry.." Mob : "
		for pry2 , obj2 in pairs(ZonePQ_ValueGroup_Drama[Room]["Mob"][pry])  do  
			Str = Str..pry2.." ="..obj2.."= "
		end
		Yell( OwnerID() , Str , 5 )
	end

	Str = " Time : "
	for pry2 , obj2 in pairs(ZonePQ_ValueGroup_Drama[Room]["CheckTime"])  do  
		Str = Str..pry2.." ="..obj2.."= "
	end
	Yell( OwnerID() , Str , 5 )

	local Time = LuaPQ_GetTime()
	local OrgTime = math.abs(LuaPQ_GetOrgTime())
	Yell( OwnerID() , "Stage "..Sg.." ,Time is "..Time.."/"..OrgTime , 5 )

	Str = " Number : "
	for pry2 , obj2 in pairs(ZonePQ_ValueGroup_Drama[Room]["CheckNum"])  do  
		Str = Str..pry2.." ="..obj2.."= "
	end
	Yell( OwnerID() , Str , 5 )

	local Num = LuaPQ_GetNum()
	local OrgNum = math.abs(LuaPQ_GetOrgNum())
	Yell( OwnerID() , "Stage "..Sg.." , Number is "..Num.."/"..OrgNum , 5 )
end

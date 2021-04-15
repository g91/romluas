--�x�W�C�i���H�`����
--��J
function Lua_121445_Speak() --��J����ܼ@��
	local Owner = OwnerID()
	local Target = TargetID()
	if CheckFlag( Owner, 547533 ) == true or CheckFlag( Owner, 547534 ) == true then
		LoadQuestOption( Owner )
	else
		SetSpeakDetail( Owner , "[SC_121445_01]") --���|�a�I�I�I���ѴX���F�H�G�F�G�F�I�o�U���� ���藍�|��L�ڪ��K�K
		AddSpeakOption( Owner, Owner , "[SC_121445_02]" , "Lua_121445_Speak1" , 0 ) --�o�ͤ���ơH
	end
end


function Lua_121445_Speak1() --��J����ܼ@��
	local Owner = OwnerID()
	CloseSpeak( Owner)
	SetFlag( Owner, 547534, 1 ) --�֦��������Ȫ����
end



function Lua_121447_Quest()
	SetPlot( OwnerID() , "touch" , "Lua_121447_Speak" , 0 )
end


function Lua_121447_Speak() --�d�h����ܼ@��
	local Owner = OwnerID()
	if CheckQuest( Owner, 426539 , 0 ) == true then
		SetSpeakDetail( Owner , "[SC_121447_02]" )
		AddSpeakOption( Owner , Owner , "[SC_121447_04]" , "Lua_121447_Speak1" , 0 )
	else
		SetSpeakDetail( Owner , "[SC_121447_01]" )	--�����k�H�A�N���i�H�����w���k�Ķˤ����L�I���ڪ��j�H��A�ڤ@�w�|�Τߨ��@�ڳ��w���H�C
	end
end


function Lua_121447_Speak1()
	local Owner = OwnerID()
	SetSpeakDetail( Owner , "[SC_121447_03]" )
	AddSpeakOption( Owner , Owner , "[SC_121447_05]" , "Lua_121447_Quest1" , 0 )
end


function Lua_121447_Quest1() --��10�ӥ����ťN���I�����ȹD��
	local Owner = OwnerID() --���a
	local Target = TargetID() --�d�h
	local status = ReadRoleValue(  Target, EM_RoleValue_Register2)
--	if Status == 0 then
	--	SetPlot( Target , "touch" , " " , 0 )
	--	WriteRoleValue( Owner , EM_RoleValue_Register2 , 1 )	
		if CountBodyItem( Owner , 242375 ) == 0 then
			if CountBodyItem( Owner , 203038 ) >= 10 then --���W��10�ӥ����ťN��
				SetSpeakDetail( Owner , "[SC_121447_06]")
				GiveBodyItem( Owner, 242375 , 1 ) --�����\�@���� 
				DelBodyItem( Owner, 203038, 10 ) --�R��10�ӥ����ťN��
				ScriptMessage( Owner, Owner, 3, "[SC_121447_07]" , 0 )
				BeginPlot( Target , "Lua_na_121447_move", 0 )
			else
				CloseSpeak( Owner)
				ScriptMessage( Owner, Owner, 1, "[SC_BUY_TOKEN]", 0 )
			end
		else
	--		WriteRoleValue( Owner , EM_RoleValue_Register2 , 0 )
			CloseSpeak( Owner)
			ScriptMessage( Owner, Owner , 1 , "[SC_Z23Q425436_2]" , 0 )   --�A�w�g�֦��ۦP���F��F�C
		end
--	else
--		ScriptMessage( Owner, Owner, 2 , "Cardo is busy" , 0 )	
--	end
end



function Lua_426539_complete()
	local Owner = OwnerID()
	local Target = TargetID()
	SetFlag( Target , 547534 , 0 ) -- ��������426539���P�_�X�СA����
	SetFlag( Target , 547533 , 1 ) -- �C��X��
end


function Lua_na_121449() --���ê����l�@��
	local Owner = OwnerID()
	local Room = ReadRoleValue( Owner , EM_RoleValue_RoomID)
	local obj
	while true do
		local Count = 0
		local AllNPC = SetSearchAllNPC( Room)
		for i = 0 , AllNPC, 1 do
			local ID = GetSearchResult()
			Obj=Role:New(ID)
			if ReadRoleValue( ID , EM_RoleValue_OrgID ) == 121447 then
				Count = Count +1 
				break
			end
		end
		if Count == 0 then
			Lua_na_121447_Born(Room)
		end
--		DebugMsg( 0, 0, Count) --�d�h���ƶq
		Sleep(300)
	end
end

function Lua_na_121447_Born(Room)  --�d�h�X�ͼ@��
	local Owner = OwnerID()
	local Cardo = 121447
	local R = DW_Rand(10)
	local x,y,z,dir=DW_Location(781339,R);--�ھںX�l��m
	local Obj=CreateObj(121447,x,y,z,dir,1);
	WriteRoleValue( Obj , EM_RoleValue_Register1, 0)
	WriteRoleValue( Owner , EM_RoleValue_Register1 , Obj )
	WriteRoleValue( Obj , EM_RoleValue_Register1 , Owner )
	WriteRoleValue( Obj , EM_RoleValue_PID , R )
	AddToPartition(Obj,Room)
end


function Lua_na_121447_move() --�d�h�����A����m
	local Owner = OwnerID() --�d�h
	local Pid = ReadRoleValue( Owner , EM_RoleValue_PID) --�o���O�b���Ӧ�m���ͪ��d�h�A�קK�A��RAND��P�˪���m
	local Room = ReadRoleValue( Owner , EM_RoleValue_RoomID)
	while true do
		local R = DW_Rand(10)
		if Pid ~= R then
			local x,y,z,dir=DW_Location(781339,R);--�ھںX�l��m
			local Obj=CreateObj(121447,x,y,z,dir,1);
			WriteRoleValue( Obj , EM_RoleValue_PID , R )
			AddToPartition(Obj,Room)
			DelObj( Owner)
			break
		end
	end
end
			



--���ի��O
function Lua_2013_tw_valentine_test() --�ˬd�d�h���ƶq
	local Owner = OwnerID()
	local Room = ReadRoleValue( Owner , EM_RoleValue_RoomID)
	local obj
	local Count = 0
	local AllNPC = SetSearchAllNPC( Room)
	for i = 0 , AllNPC, 1 do
		local ID = GetSearchResult()
		Obj=Role:New(ID)
		if ReadRoleValue( ID , EM_RoleValue_OrgID ) == 121447 then
			Count = Count +1 
		end
	end
	DebugMsg( Owner, 0, "we have "..Count.." Cardo") --�d�h���ƶq

end


function Lua_2013_tw_valentine_reset() --���m�X��
	local Owner = OwnerID()
	SetFlag( Owner , 547533 , 0 )  --�C��X��
	SetFlag( Owner , 547534 , 0 ) --�i�����ȧP�_��
	SetFlag( Owner , 542579 , 0 ) --�L�鯬�֨C��X��
end
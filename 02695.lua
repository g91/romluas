function Lua_weaveitem_check1() --���l
	local Owner = OwnerID()  --���a
	local Target = TargetID() --´����
	local Ans = ReadRoleValue( Target , EM_RoleValue_Register2)
	local Player = ReadRoleValue( Target , EM_RoleValue_Register8) -- Ū��´�������W�����a�s��
 	local Count = BuffCount (Player) -- Ū�����a���W���Ҧ��k�N�ƶq

	if Checkbuff (Player, 622971) == true  then  --�p�G���a���W��´�����X�ʪ̩M��U´�������p��BUFF
		for i = 0 , Count do
			local BuffID = BuffInfo ( Player , i , EM_BuffInfoType_BuffID )	--Ū�����a���W���k�NID
			if BuffID == 623052 then
				if Ans == 1 then --�p�G���׬O�m�u
					ScriptMessage( Owner , Owner , 0 , "[SC_2012LOOM_ANS01]" ,  C_SYSTEM) --´�������Q�B��A���Q´�X�@�ƺ}�G�����ơC
				--	ScriptMessage( Owner , Owner , 2 , "[SC_2012LOOM_ANS01]" ,  C_SYSTEM) --´�������Q�B��A���Q´�X�@�ƺ}�G�����ơC
					AddBuff( Target, 622965 ,  0, 60) --����´�������B�@
					AddBuff( Player , 623052 , 0, -1 ) --�W�[����
					AddBuff( Player , 622971 , 0 , 30 ) --´�����X�ʪ�
					WriteRoleValue( Target , EM_RoleValue_Register2 , 0 )
					CancelBuff( Target , 622962)
					CancelBuff( Target , 622963)
					CancelBuff( Target , 622964)
				else
					WriteRoleValue( Target , EM_RoleValue_Register1 , 3 )					
					WriteRoleValue( Target , EM_RoleValue_Register2 , 0 )
				--	ScriptMessage( Owner , Owner , 0 , "[SC_2012LOOM_ANS02]" , 0) --���U���~�������~�A����´�a�F�C
					ScriptMessage( Owner , Owner , 1 , "[SC_2012LOOM_ANS02]" , 0) --���U���~�������~�A����´�a�F�C
					CancelBuff( Target , 622965) --´��������
					CancelBuff( Target , 622966)
					CancelBuff( Player , 622971) --���a�������
				end
			end
		end
	end
end



function Lua_weaveitem_check2() --�m�u
	local Owner = OwnerID()  --���a
	local Target = TargetID() --´����
	local Ans = ReadRoleValue( Target , EM_RoleValue_Register2)
	local Player = ReadRoleValue( Target , EM_RoleValue_Register8) -- Ū��´�������W�����a�s��
 	local Count = BuffCount (Player) -- Ū�����a���W���Ҧ��k�N�ƶq

	if Checkbuff (Player, 622971) == true and CheckBuff( Player , 623052) == true then  --�p�G���a���W��´�����X�ʪ̩M��U´�������p��BUFF
		for i = 0 , Count do
			local BuffID = BuffInfo ( Player , i , EM_BuffInfoType_BuffID )	--Ū�����a���W���k�NID
			if BuffID == 623052 then
				if Ans == 2 then --�p�G���׬O�m�u
					ScriptMessage( Owner , Owner , 0 , "[SC_2012LOOM_ANS01]" ,  C_SYSTEM) --´�������Q�B��A���Q´�X�@�ƺ}�G�����ơC
			--		ScriptMessage( Owner , Owner , 2 , "[SC_2012LOOM_ANS01]" ,  C_SYSTEM) --´�������Q�B��A���Q´�X�@�ƺ}�G�����ơC
					AddBuff( Target, 622965 , 0, 60) --����´�������B�@
					AddBuff( Player , 623052 , 0, -1 ) --�W�[����
					AddBuff( Player , 622971 , 0 , 30 ) --´�����X�ʪ�
					WriteRoleValue( Target , EM_RoleValue_Register2 , 0 )
					CancelBuff( Target , 622962)
					CancelBuff( Target , 622963)
					CancelBuff( Target , 622964)
				else
					WriteRoleValue( Target , EM_RoleValue_Register1 , 3 )
					WriteRoleValue( Target , EM_RoleValue_Register2 , 0 )
			--		ScriptMessage( Owner , Owner , 0 , "[SC_2012LOOM_ANS02]" , 0) --���U���~�������~�A����´�a�F�C
					ScriptMessage( Owner , Owner , 1 , "[SC_2012LOOM_ANS02]" , 0) --���U���~�������~�A����´�a�F�C
					CancelBuff( Target , 622965) --´��������
					CancelBuff( Target , 622966)
					CancelBuff( Player , 622971) --���a�������
				end
			end
		end
	end
end



function Lua_weaveitem_check3() --�ŤM
	local Owner = OwnerID()  --���a
	local Target = TargetID() --´����
	local Ans = ReadRoleValue( Target , EM_RoleValue_Register2)  --�ˬd´�������W������
	local Player = ReadRoleValue( Target , EM_RoleValue_Register8) -- Ū��´�������W�����a�s��
 	local Count = BuffCount (Player) -- Ū�����a���W���Ҧ��k�N�ƶq

	if Checkbuff (Player, 622971) == true and CheckBuff( Player , 623052) == true then  --�p�G���a���W��´�����X�ʪ̩M��U´�������p��BUFF
		for i = 0 , Count do
			local BuffID = BuffInfo ( Player , i , EM_BuffInfoType_BuffID )	--Ū�����a���W���k�NID
			if BuffID == 623052 then
				if Ans == 3 then --�p�G���׬O�m�u
					ScriptMessage( Owner , Owner , 0 , "[SC_2012LOOM_ANS01]" ,  C_SYSTEM) --´�������Q�B��A���Q´�X�@�ƺ}�G�����ơC
			--		ScriptMessage( Owner , Owner , 2 , "[SC_2012LOOM_ANS01]" ,  C_SYSTEM) --´�������Q�B��A���Q´�X�@�ƺ}�G�����ơC
					AddBuff( Target, 622965 , 0 , 30) --����´�������B�@
					AddBuff( Player , 623052 , 0, -1 ) --�W�[����
					AddBuff( Player , 622971 , 0 , 30 ) --´�����X�ʪ�
					WriteRoleValue( Target , EM_RoleValue_Register2 , 0 )
					CancelBuff( Target , 622962)
					CancelBuff( Target , 622963)
					CancelBuff( Target , 622964)
				else
					WriteRoleValue( Target , EM_RoleValue_Register1 , 3 )
					WriteRoleValue( Target , EM_RoleValue_Register2 , 0 )
				--	ScriptMessage( Owner , Owner , 0 , "[SC_2012LOOM_ANS02]" , 0) --���U���~�������~�A����´�a�F�C
					ScriptMessage( Owner , Owner , 1 , "[SC_2012LOOM_ANS02]" , 0) --���U���~�������~�A����´�a�F�C
					CancelBuff( Target , 622965) --´��������
					CancelBuff(Target , 622966)
					CancelBuff( Player , 622971) --���a�������
				end
			end
		end
	end
end




--´�������B�@BUFF�A��������Ĳ�o�k�N
function Lua_na_loom_end()
	local Owner = OwnerID() --´����
	local Player = ReadRoleValue( Owner , EM_RoleValue_Register8) -- Ū��´�������W�����a�s��
	local Room = ReadRoleValue( Owner , EM_RoleValue_RoomID )
	local ColorBuff = { 622962 , 622963, 622964 }
	ScriptMessage( Owner , Owner , 0 , "[SC_2012LOOM_END]" , 0) --´��������B�@�C
	ScriptMessage( Owner , Owner , 1 , "[SC_2012LOOM_END]" , 0) --´��������B�@�C
	for i = 1 , table.getn(ColorBuff) do
		CancelBuff( Owner , ColorBuff[i])
	end
	PlayMotion( Owner, 147 )
	Lua_na_loom_Delallmark()
	Beginplot( Player, "Lua_na_weave_Score", 0 )
	CancelBuff(Owner , 622966)
	sleep(30)
	WriteRoleValue( Owner , EM_RoleValue_Register1 , 0 )
end		



function Lua_na_weave_Score() -- ������ơA���b���a���W��BUFFĲ�o
	local Owner = OwnerID() --���a
 	local Count = BuffCount (Owner) -- Ū�����a���W���Ҧ��k�N�ƶq
	for i = 0 , Count do
		local BuffID = BuffInfo ( Owner , i , EM_BuffInfoType_BuffID )	--Ū�����a���W���k�NID
		if BuffID == 623052 then
			local BuffLv = BuffInfo ( Owner, i , EM_BuffInfoType_Power )
			if BuffLv == 0 then
				SetFlag( Owner , 546685 , 1 )	
			elseif BuffLv <= 3 then
				SetFlag( Owner , 546867, 1 )
			elseif BuffLv <= 10 then
				SetFlag( Owner , 546868, 1 )
			elseif BuffLv <= 15  then
				SetFlag( Owner , 546869, 1 )
			elseif BuffLv <= 19 then
				SetFlag( Owner , 546870, 1 )
			elseif BuffLv  == 20 then
				SetFlag( Owner , 546729, 1 )
			end
			ScriptMessage( Owner , Owner , 0 , "[SC_2012LOOM_SPEAK10]" , 0) --�֦V��̿���[121044]�^����U�����G�a�I
			ScriptMessage( Owner , Owner , 2 , "[SC_2012LOOM_SPEAK10]" , 0) --
			CancelBuff( Owner , 623052)
		end
	end		
end




function Lua_na_loom_Delallmark()  --���ʵ����R���Ҧ��L�O
	local Count = SearchRangeNPC ( OwnerID() , 300 )
	local Obj
	local NPC = {121041 , 121042 , 121043, 121051}
	for i=0 , table.getn(Count) do
		local OrgID = ReadRoleValue ( Count[i] , EM_RoleValue_OrgID)
		for j = 1 , table.getn( NPC ) , 1 do
			if OrgID == NPC[j] then  --�Y���}�C������
			DelObj( Count[i] )
			end
		end
	end
end
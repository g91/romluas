function LuaS_422094_Accept()	-- �C�y�˪L���\��
	Hide( OwnerID() )
	Sleep( 150 )
	Show( OwnerID() , 0 )

	return true
end

function LuaS_422109_Accept()	--����\������

	DisableQuest( OwnerID() , true )

	PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_LOOP )

	local Obj = Role:new( OwnerID() ) 
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local BaseRoom = Obj:RoomID()

	local Skeleton = CreateObj( 112542 , BaseX+10 , BaseY, BaseZ-15 , BaseDir+180 , 1 )	-- ���ͬ\��
	AddToPartition( Skeleton , BaseRoom )

	Sleep( 20 )

	local NiKo = LuaFunc_CreateObjByObj ( 112541 , Skeleton )	-- ���i�D������

	Sleep( 20 )

	PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_LOOP , ruFUSION_ACTORSTATE_CRAFTING_END )

	Sleep( 20 )
	if Skeleton ~= nil then
		if CheckID( Skeleton ) == true then DelObj( Skeleton ) end
	end
	if NiKo ~= nil then
		if CheckID( NiKo ) == true then DelObj( NiKo ) end
	end

	SetFlag( TargetID() , 542479 , 1 )	-- ���s��y����

	DisableQuest( OwnerID() , false )
	LuaFunc_ResetObj( OwnerID() )

	return true
end

function LuaS_204177_CHECK()
	local Target = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	if CheckAcceptQuest( OwnerID() , 422098 ) == false or CheckCompleteQuest( OwnerID() , 422098 ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204177_1]", 0 )	-- �o�ӮɭԤ��ݭn�ϥ�[204177]�C
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204177_1]" , C_DEFAULT )
		return false
	elseif CountBodyItem( OwnerID() , 204166 ) >= 10 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204177_2]" , 0 )	-- �A�w�g���o�������ƶq��[204166]�C
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204177_2]" , C_DEFAULT )
		return false
	elseif Target ~= 101739 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204177_3]" , 0 )	-- �A�����w��[101739]�~��ϥΡC
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204177_3]" , C_DEFAULT )
		return false
	else
		return true
	end
end

function LuaS_204177_USE()
	BeginPlot( TargetID() , "LuaS_204177_Reset" , 0 )
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204177_4]" , 0 )	-- �A���\�a�l�m��[204166]�I
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204177_4]" , C_SYSTEM )
	UseItemDestroy()	-- �l�m�~
	GiveBodyItem( OwnerID() , 204166 , 1 )		-- �v�y�i��
end

function LuaS_204177_Reset()
	LuaFunc_ResetObj( OwnerID() )
end

function LuaS_204178_CHECK()	-- �z�����~
	if CheckAcceptQuest( OwnerID() , 422100 ) == false or CheckCompleteQuest( OwnerID() , 422100 ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204178_1]", 0 )	-- �o�ӮɭԤ��ݭn�ϥ�[204178]�C
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204178_1]" , C_DEFAULT )
		return false
	else
		local YoSen = LuaFunc_SearchNPCbyOrgID( OwnerID() , 112660 , 50 )
		if YoSen ~= -1 then
			return true
		else
			return false
		end
	end
end

function LuaS_204178_DO()

	local YoSen = LuaFunc_SearchNPCbyOrgID( OwnerID() , 112548 , 50 )
	if YoSen == -1 then
		local Obj = Role:new( OwnerID() ) 
		local BaseX = Obj :X()
	 	local BaseY = Obj :Y()
	 	local BaseZ = Obj :Z()
		local BaseDir = Obj:Dir()
		local BaseRoom = Obj:RoomID()

		local YoSen = CreateObj( 112548 , BaseX+10 , BaseY, BaseZ-15 , BaseDir+180 , 1 )	-- ���ͧC�y�˪L����
		AddToPartition( YoSen , BaseRoom )
		BeginPlot( YoSen , "LuaS_112660_YosenLifeTime" , 0 )

		SetFlag( OwnerID() , 542499 , 1 )	-- �o�{�C�y�˪L����
	end

end

function LuaS_204179_CHECK()	-- ����ù�L
	if CheckAcceptQuest( OwnerID() , 422100 ) == false or CheckCompleteQuest( OwnerID() , 422100 ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204179_1]", 0 )	-- �o�ӮɭԤ��ݭn�ϥ�[204179]�C
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204179_1]" , C_DEFAULT )
		return false
	else
		return true
	end
end

function LuaS_204179_DO()
	local YoSen = LuaFunc_SearchNPCbyOrgID( OwnerID() , 112660 , 500 )
	--Say(OwnerID(), YoSen )
	if YoSen == -1 then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204179_2]", 0 )	-- �o����@�I���몺�𮧳��S���I
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204179_2]" , C_SYSTEM )
	else
		local Distance = GetDistance( OwnerID() , YoSen )
		if Distance <= 50 then
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204179_6]", 0 )	-- ù�L��ܳo�����õۧ���I
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204179_6]" , C_SYSTEM )
		elseif Distance <= 100 then
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204179_5]", 0 )	-- ù�L�P����o����ֿn�F�۷�h���몺�𮧡I
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204179_5]" , C_SYSTEM )
		elseif Distance <= 300 then
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204179_4]", 0 )	-- ù�L�P����o���񦳳\�h���몺�𮧡I
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204179_4]" , C_SYSTEM )
		elseif Distance <= 500 then
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204179_3]", 0 )	-- ù�L�P����o���񦳤@�ǧ��몺�𮧡I
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204179_3]" , C_SYSTEM )
		end
	end
end

function LuaI_112660_Range()
	SetPlot( OwnerID() , "Range", "LuaS_112660_Range", 50 )
end

function LuaS_112660_Range()
	local YoSen = LuaFunc_SearchNPCbyOrgID( OwnerID() , 112548 , 100 )
	--Say(OwnerID(), YoSen )
	if YoSen == -1 then
		if CheckCompleteQuest( OwnerID() , 422100 ) == true or CheckCompleteQuest( OwnerID() , 422101 ) == false or CheckCompleteQuest( OwnerID() , 422102 ) == false then
			local Obj = Role:new( OwnerID() ) 
			local BaseX = Obj :X()
	 		local BaseY = Obj :Y()
	 		local BaseZ = Obj :Z()
			local BaseDir = Obj:Dir()
			local BaseRoom = Obj:RoomID()

			local YoSen = CreateObj( 112548 , BaseX+10 , BaseY, BaseZ-15 , BaseDir+180 , 1 )	-- ���ͧC�y�˪L����
			AddToPartition( YoSen , BaseRoom )
			BeginPlot( YoSen , "LuaS_112660_YosenLifeTime" , 0 )
		end
	end
end

function LuaS_112660_YosenLifeTime()
	Sleep( 300 )
	if CheckID( OwnerID() ) == true then 
		DelObj( OwnerID()) 
	end
end

function LuaS_204175_CHECK()
	local X = ReadRoleValue( OwnerID() , EM_RoleValue_X )
	local Z = ReadRoleValue( OwnerID() , EM_RoleValue_Z )

	if CheckFlag( OwnerID() , 542493 ) == true then	-- ���N������
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204175_1]", 0 )	-- �{�b���ݭn�ϥ�[204175]�I
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204175_1]" , C_DEFAULT )
		return false
	end

	if X < 19650 or X > 19800 then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204175_1]", 0 )	-- �{�b���ݭn�ϥ�[204175]�I
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204175_1]" , C_DEFAULT )
		return false
	end
	if Z < 22790 or Z > 22950 then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204175_1]", 0 )	-- �{�b���ݭn�ϥ�[204175]�I
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204175_1]" , C_DEFAULT )
		return false
	end

	return true
end

function LuaS_204175_DO()
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204175_2]", 0 )	-- �A�ϥ�[204175]�A�ܨ�����[112541]�I
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204175_2]" , C_SYSTEM )
	AddBuff( OwnerID() , 503142 , 0 , -1 )
	return true
end

function LuaS_204175_CHECKRange()
	local X = ReadRoleValue( OwnerID() , EM_RoleValue_X )
	local Z = ReadRoleValue( OwnerID() , EM_RoleValue_Z )

	if X < 19650 or X > 19800 then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204175_3]", 0 )	-- [204175]���ĪG�����A�A��_����ˡI
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204175_3]" , C_SYSTEM )
		CancelBuff( OwnerID() , 503142 )
	end

	if Z < 22790 or Z > 22950 then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204175_3]", 0 )	-- [204175]���ĪG�����A�A��_����ˡI
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204175_3]" , C_SYSTEM )
		CancelBuff( OwnerID() , 503142 )
	end
end

function LuaS_112543()
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	if CheckBuff( OwnerID() , 503142 ) == true and CheckFlag( OwnerID() , 542493 ) == false and CheckCompleteQuest( OwnerID() , 422104 ) == false  then
		AddSpeakOption( OwnerID() , TargetID() , "[SC_112543_1]" , "LuaS_112543_Talk1" , 0 )	-- �W�[�@�ӿﶵ�G�ڦ^�ӤF�A[112543]�C
	end
end

function LuaS_112543_Talk1()
	SetSpeakDetail( OwnerID() , "[SC_112543_2]" )	-- ��A�ڤ@���b�o�䵥�A�A�ڦ���u�ڭ̪����w......
	AddSpeakOption( OwnerID() , TargetID() , "[SC_112543_3]" , "LuaS_112543_Talk2" , 0 )	-- �W�[�@�ӿﶵ�G...���U�ӧ��ٻݭn�h�@�ӫܻ����a��...
end

function LuaS_112543_Talk2()
	SetSpeakDetail( OwnerID() , "[SC_112543_4]" )	-- ������~��^�ӤS�n���}�H......�ڪ��D�F�A�ڷ|�b�o���~�򵥵ۧA�^�Ӫ��I
	AddSpeakOption( OwnerID() , TargetID() , "[SC_112543_5]" , "LuaS_112543_Talk3" , 0 )	-- �W�[�@�ӿﶵ�G�c�A�p���n...
end

function LuaS_112543_Talk3()
	CloseSpeak( OwnerID() )	--������ܵ���
	SetFlag( OwnerID() , 542493 , 1 ) 	-- ���N������
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204175_3]", 0 )	-- [204175]���ĪG�����A�A��_����ˡI
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204175_3]" , C_SYSTEM )
	CancelBuff( OwnerID() , 503142 )
end
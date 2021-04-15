function LuaS_117643_1()
	if CheckAcceptQuest( OwnerID() , 423815 ) == true and CheckFlag( OwnerID() , 544762 ) == false then
		SetSpeakDetail(OwnerID(), "[SC_423815_Q2]")	-- [playername]�A�N�ЧA�Ȯ��v�R�ڪ������U��F�A���԰��`��������
		AddSpeakOption(  OwnerID(), TargetID(),"[SC_423815_Q1]" ,  "LuaS_117643_2",  0 );	-- ���@�N������϶˱w�I
	end
	LoadQuestOption( OwnerID() )
end

function LuaS_117643_2()
	CloseSpeak( OwnerID() )
	local Buff = {508762,508763,508764,508765,508766}
--	WriteRoleValue( OwnerID() , EM_RoleValue_Register , TargetID())
	AddBuff( OwnerID() , Buff[5] , 0 , 15 ) 
end

function LuaM_423815_MSG2(String)
	local StringA
	local StringB
	local RanInt = RandRange(1,2)
	if RanInt == 1 then
		StringA = "[SC_423815_A][$SETVAR1="..String.."]"	-- [117461]�j�ۡG�Ю�[$VAR1]���ڡI
		ScriptMessage( OwnerID() , OwnerID() , 0 , StringA , "0xffff0000" )
		ScriptMessage( OwnerID() , OwnerID() , 1 , StringA , "0xffff0000" )
	else
		StringB = "[SC_423815_B][$SETVAR1="..String.."]"	-- [$VAR1]�A�֡I
		ScriptMessage( OwnerID() , OwnerID() , 0 , StringB , "0xffff0000" )
		ScriptMessage( OwnerID() , OwnerID() , 1 , StringB , "0xffff0000" )
	end
end

function LuaM_423815_MSG()
	local BuffID = {508762,508763,508764,508765,508766}	-- �Ҧ���buff�]���Ȩϥ���������^
	local String
	local Buff = 0
--	local Target = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
--	if ReadRoleValue( Target , EM_RoleValue_OrgID ) ~= 117643 then
--		Target = TargetID()
--	end
	local StringC = {"SC_423815_F0" , "SC_423815_F1"}	-- ���U�A�A�ʧ@�֤@�I�A�کȯu���Ӥ��ΤF�C �@�w�̪��ͩR���b�@�I�@�w�y���A�S�ɶ��M�i�F�I

	for pry , obj in pairs(BuffID) do
		if CheckBuff( OwnerID() , Obj ) == true then
			Buff = pry
			break
		end
	end
	
	if Buff == 0 then
		return
	end
	
	local BuffPos = Lua_BuffPosSearch(OwnerID() , BuffID[Buff] )
	local Time = BuffInfo( OwnerID()  , BuffPos , EM_BuffInfoType_Time )
	String = "["..BuffID[Buff].."]"

	if Time == 5 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "["..StringC[DW_Rand(2)].."]" , "0xffff0000" )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "["..StringC[DW_Rand(2)].."]" , "0xffff0000" )
	end
	if time == 13 then
		CallPlot(OwnerID(),"LuaM_423815_MSG2",String)
	end
end
function LuaM_423815_Failed()
	local BuffID = {508762,508763,508764,508765,508766}
	local Success = 508767
	for pry , obj in pairs(BuffID) do
		CancelBuff_NoEvent( OwnerID() , obj )
	end
	CancelBuff_NoEvent( OwnerID() , Success )
--	local Target = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
--	if ReadRoleValue( Target , EM_RoleValue_OrgID ) ~= 117643 then
--		Target = TargetID()
--	end
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423815_F2]" , "0xffff0000" ) -- �V�F�A�w�̪����p�w�g����U�ӤF�K�I�I
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423815_F2]" , "0xffff0000" )
	sleep(20)
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423815_F3]" , "0xffff0000" ) -- �s���a����
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423815_F3]" , "0xffff0000" )
end

function LuaI_423815_OBJ()
	AddBuff( OwnerID() , 502546 , 0 , -1 )
	SetPlot( OwnerID() , "Touch" , "LuaI_423815_OBJ2" , 30 )
end

function LuaI_423815_OBJ2()
	if CheckAcceptQuest( OwnerID() , 423815 ) == true then
		local BuffID = {508762,508763,508764,508765,508766}
		local Buff = 0

		for pry , obj in pairs(BuffID) do
			if CheckBuff( OwnerID() , Obj ) == true then
				Buff = pry
				break
			end
		end
		
		if Buff == 0 then
			return
		end	
		BeginPlot( TargetID() , "LuaI_423815_OBJ3" , 0 )
	end
end

function LuaI_423815_OBJ3()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	local Thing = {[117454] = 209091 , [117455] = 209092 , [117456] = 209093 , [117457] = 209094 , [117458] = 209095 }
	GiveBodyItem( TargetID() , Thing[OrgID] , 1 )
	Hide( OwnerID() )
	sleep( 50 )
	Show( OwnerID() , RoomID )
end

function LuaI_117461_0()
	SetPlot( OwnerID() , "Touch" , "LuaI_117461_1" , 30 )
end

function LuaI_117461_1()
	local BuffID = {508762,508763,508764,508765,508766}
	local ObjID = {209091,209092,209093,209094,209095}
	local Success = 508767
	local Buff = 0
	local KeyItem = 544762
	local Count = 0
		
	for pry , obj in pairs(BuffID) do
		if CheckBuff( OwnerID() , Obj ) == true then
			Buff = pry
			break
		end
	end
	if Buff ~= 0 then 
		Count = CountBodyItem( OwnerID() , ObjID[Buff] )	
		--���ު��a������L�ӡA�����^���I
		for pry , obj in pairs(ObjID) do
				local Num = CountBodyItem( OwnerID() , Obj )
				if Num > 0 then
					DelBodyItem( OwnerID() , obj , Num )
				end
		end
	end
	--�p�G���W�S���ݭn�����~�ɪ��P�_
	if Count < 1 then
		Tell(OwnerID() ,TargetID() , "[SC_423815_Q3]" )	-- ����A���O�o�ӡI���U�A���@�I�A�{�b�i�O�H�Rô��@�u����n���Y�r�I
		return
	end				
	--�p�G���W���ݭn�����~�ɪ��P�_
	if  Count > 0 then
		AddBuff( OwnerID() , Success , 0 , -1 )
		local String = {"SC_423815_C2" , "SC_423815_C3" , "SC_423815_C4" , "SC_423815_C5" , "SC_423815_C6" , "SC_423815_C7" , "SC_423815_C8" , "SC_423815_C9" , "SC_423815_C0" , "SC_423815_C1"}
		-- �C�@�^�X�����ʧ@�᪺���ܤ��e
		local BuffPos = Lua_BuffPosSearch(OwnerID() , Success )	
		local LV = BuffInfo( OwnerID()  , BuffPos , EM_BuffInfoType_Power  ) + 1
--		Tell(OwnerID() ,TargetID() , "["..String[LV].."]" )         -- �����NPC�Ӷi�{�קﻡ�ܤ��e
		if  Buff == 1 then
			Tell(OwnerID() ,TargetID() , "["..String[RandRange( 1 , 2 ) ].."]" )
		elseif Buff == 2 then
			Tell(OwnerID() ,TargetID() , "["..String[RandRange( 3 , 4 ) ].."]" )
		elseif Buff == 3 then
			Tell(OwnerID() ,TargetID() , "["..String[RandRange( 5 , 6 ) ].."]" )
		elseif Buff == 4 then
			Tell(OwnerID() ,TargetID() , "["..String[RandRange( 7 , 8 ) ].."]" )
		elseif Buff == 5 then
			Tell(OwnerID() ,TargetID() , "["..String[RandRange( 9 , 10 ) ].."]" )
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "Error!! Can't get right Item(Buff) ID!" , 0 )
		end
		if LV == 1 then	-- �P�_�O�_���ĤG��
			CancelBuff_NoEvent( OwnerID() , BuffID[Buff] )
			AddBuff( OwnerID() , BuffID[1] , 0 , 15 )
		elseif LV >= 10 then	--�P�_�O�_�w�g���\
			for pry , obj in pairs(BuffID) do
				CancelBuff_NoEvent( OwnerID() , obj )
			end
			CancelBuff_NoEvent( OwnerID() , Success )
			if CheckAcceptQuest( OwnerID() , 423815 ) == true then
				SetFlag( OwnerID() , KeyItem , 1 )
				Sleep(10)
				Tell(OwnerID() ,TargetID() , "[SC_423815_Q4]" )
				Sleep(20)
				Tell(OwnerID() ,TargetID() , "[SC_423815_Q5]" )
			end
		else
			CancelBuff_NoEvent( OwnerID() , BuffID[Buff] )
		 	local Num = DW_Rand(5) --�קK���o�M�e�@���ۦP�����~
		 	if Num == Buff then
		 		Num = Num + 1
		 	end
		 	if Num > 5 then
		 		Num = 1
		 	end
			AddBuff( OwnerID() , BuffID[Num] , 0 , 15 )
		end
	end
end
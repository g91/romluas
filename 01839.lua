--423267 �Ψ쪺�t��NPC�A���b115411����	--�X�l780622--1 780621--10
function LuaS_115411_0()
	local Itry = CreateObjByFlag( 115412, 780622, 1 , 1 )	 				
	AddToPartition(  Itry, 0 )
	DisableQuest(Itry, true )							--�������
	MoveToFlagEnabled(Itry, false )						--��������
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+7, Itry)			--�NItry�g�i������

	local WAA = CreateObjByFlag( 115413, 780621,18 , 1 )	 	
	AddToPartition(  WAA, 0 )
	DisableQuest(WAA, true )							--�������
	MoveToFlagEnabled(WAA, false )						--��������
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+8, WAA)			--�NWAA�g�i������

--	local NIGHT = CreateObjByFlag( 115420, 780622,2 , 1 )	 	
--	AddToPartition(  NIGHT, 0 )
--	--DisableQuest(NIGHT, true )							--�������
--	MoveToFlagEnabled(NIGHT, false )						--��������
--	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+4, NIGHT)			--�NNIGHT�g�i������
	
--	local STAR = CreateObjByFlag( 115422, 780622,3 , 1 )	 	
--	AddToPartition(  STAR, 0 )
--	--DisableQuest(STAR, true )							--�������
--	MoveToFlagEnabled(STAR, false )						--��������
--	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+5, STAR)			--�NSTAR�g�i������

	local Itry= CreateObjByFlag( 115384, 780622,4 , 1 )	 	
	AddToPartition(  Itry, 0 )
	DisableQuest(Itry, true )							--�������
	MoveToFlagEnabled(Itry, false )						--��������
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+3, Itry)			--�NItry�g�i������
	
end

function LuaS_423267_0()	--��P
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest(OwnerID(),423267) == true	then  
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423267_0]","LuaS_423267_0_1",0)		--�A�̦b�˯Ǧh�ָM������`�J���o�{�ܡH
	end

end


function LuaS_423267_0_1()
	SetSpeakDetail(OwnerID(),"[SC_423267_1]")							--������M�����Ʊ��A�d���|�J�ӻ����A��ť�C
	SetFlag(OwnerID(), 544004, 1)
end



function LuaS_423267_1()	--�]��
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest(OwnerID(),423267) == true	then    
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423267_0]","LuaS_423267_1_1",0)		--�A��
	end
end

function LuaS_423267_1_1()
	SetSpeakDetail(OwnerID(),"[SC_423267_2]")						--ù�Y�D�Ǻ��b�o���稦�a���ѫ�A
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423267_3]","LuaS_423267_1_2",0)		--�L�h���O�]���Ϫ̪����٥O�y�����~�M���A��R���ȥi�H�ޱ�����H
End


function LuaS_423267_1_2()
	SetSpeakDetail(OwnerID(),"[SC_423267_4]")						--�Q�T�~�e�A�M�����٨S��ť���L�ޱ�����o����
	SetFlag(OwnerID(), 544005, 1)
end


function LuaS_423267_2()	--����115411
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest(OwnerID(), 423266) == true	then  
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423266_2]","LuaS_423266_1",0)	--���U�H	
	end

	if	CheckAcceptQuest(OwnerID(),423267) == true then
		if 	CheckFlag(OwnerID(),544004) == true and CheckFlag(OwnerID(),544005) == true	and	CheckFlag(OwnerID(),544006) == false	then
			if	(ReadRoleValue( TargetID() , EM_RoleValue_Register+9 )  == 0)	 then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423267_5]","LuaS_423267_2_3",0)	--��
			else
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423267_5]","LuaS_423267_2_2",0)	--��
			end
		end
	end
end

function LuaS_423267_2_2()
	SetSpeakDetail(OwnerID(),"[SC_423267_6]")		--�ҥH�A��R���ȷ����i��O�ޱ�����
End

function LuaS_423267_2_3()
	WriteRoleValue( TargetID() , EM_RoleValue_Register+9 , 2 )		--TargetID�O����
	closespeak(OwnerID())
	BeginPlot(TargetID()  , "LuaS_423267_2_5" , 0 )

end

function LuaS_423267_2_5()
	AddBuff( TargetID()  , 506743, 1 , 90 )	
	Yell(OwnerID(), "[SC_423267_7]" , 3 )			--��X�o�Ǳ����A�˯Ǧh�ָM�����öH
	
	local STAR = Lua_DW_CreateObj("flag",115416, 780622,8 )			--<��P�X�{>
	MoveToFlagEnabled(STAR, false )
	WriteRoleValue(STAR, EM_RoleValue_IsWalk, 1)

	local NIGHT = Lua_DW_CreateObj("flag",115415, 780622,7 )			--<�]���X�{>		
	MoveToFlagEnabled(NIGHT, false )	
	WriteRoleValue(NIGHT, EM_RoleValue_IsWalk, 1 )

	Yell(NIGHT , "[SC_423267_8]" , 3 )			--�o��ƥ����ڨӳB�z�C
	Sleep(20)

	local Itry=ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 ) 
	Yell(Itry, "[SC_423267_9]" , 3 )			--���U�A�ݤU�]�{���ڭ̥i�H���^�L�h���A���ݤU���d
	Sleep(20)

	Yell(OwnerID(), "[SC_423267_10]" , 3 )			--��Z�g�A�O��ߡA�o���ڤ��|�T�M��ơC
	Sleep(20)
	Yell(OwnerID(), "[SC_423267_11]" , 3 )			--�]���K�d���D�������A�ک��էA�Q
	Sleep(20)

	Yell(NIGHT , "[SC_423267_12]" , 3 )			--���d�M��~�Ӥ�����M
	Sleep(30)
	Yell(NIGHT , "[SC_423267_13]" , 3 )			--���Q�ѨM���ơA
	Sleep(20)

	Yell(NIGHT , "[SC_423267_14]" , 3 )			--�b���A�ڥH�����ԡD�Ǻ�
	Sleep(20)

	Yell(OwnerID(), "[SC_423267_15]" , 3 )			--�����ԡD�Ǻ��K�A�����W�A
	Sleep(20)
	BeginPlot(STAR , "LuaS_423267_2_4", 0 )
	LuaFunc_MoveToFlag(NIGHT , 780622,5,0)
	DelObj(NIGHT )
	if 	CheckFlag(TargetID(),544006) == false	then
		SetFlag(TargetID(), 544006, 1)
	end
	if	CheckBuff(TargetID () , 506742) == true then
		CancelBuff_NoEvent(TargetID() , 506742)
	end
	WriteRoleValue(OwnerID () , EM_RoleValue_Register+9, 0 )
End

function LuaS_423267_2_4()
	LuaFunc_MoveToFlag(OwnerID(), 780622,6,0)
	DelObj(OwnerID())
end









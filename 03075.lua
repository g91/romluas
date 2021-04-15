function Lua_2013Moon_123028() --��J����ܼ@��
	local Owner = OwnerID() --���a
	local Target = TargetID() --NPC
	if CheckFlag( Owner , 547537 ) == false and CheckFlag( Owner , 547535 ) == false then  --���a��饼�������ȡA�]�S����������
		SetSpeakDetail( Owner , "[SC_123028_01]") --�ѯ��K���V�o�K���K�A�M��U�����ƪ���ҡK�K
		AddSpeakOption( Owner, Owner , "[SC_121445_02]" , "Lua_123028_GiveFlag" , 0 ) --�o�ͤ���ơH	
	elseif CheckFlag( Owner , 547537 ) == true then
		SetSpeakDetail( Owner , "[SC_123028_02]") --���F[243016]�A�o�O���ӷ|���\�a�I���L�K�����Ӧb���ӨB�J�[�J�o�ǧ��Ƨr�K�K�H	
	else
		LoadQuestOption( Owner )		
	end

end


function Lua_123028_GiveFlag() -- �������ȺX��
	local Owner = OwnerID()
	local Target = TargetID()
	SetFlag( Owner , 547535 , 1 )
	LoadQuestOption( Owner )	
end


function Lua_123028_NextFlag() --�������Ȥ��ᵹ���U�@�ӥ��Ȫ��i���X��
	local Target = TargetID()
	SetFlag( Target , 547536 , 1 ) --�d�h�i�����ȺX��
end


function Lua_123029_speak() --���Ȫ���ܼ@��
	local Owner = OwnerID()
	if CountBodyItem( Owner , 243015 ) == 0 and CheckAcceptQuest( Owner , 426570 ) == true then --���a���W�����ȡA���O�S�����޿} 
		SetSpeakDetail( Owner , "[SC_123029_SPEAK]" )
		GiveBodyItem( Owner , 243015 , 1 ) 	
	else
		LoadQuestOption(Owner)
	end
end


function Lua_426570_complete()
	local Target = TargetID()
	Setflag( Target , 547536 , 0 ) -- �R����ܥ��Ȫ��X��
end


function Lua_426604_complete()
	local Target = TargetID()
	Setflag( Target , 547535 , 0 ) -- �R����ܥ��Ȫ��X��
	Setflag( Target , 547537 , 1 ) --�C��X��
end


function Lua_na_123030_action()
	local Owner = OwnerID()  --�d�h
	PlayMotionEX(Owner , ruFUSION_ACTORSTATE_CRAFTING_BEGIN,  ruFUSION_ACTORSTATE_CRAFTING_LOOP )
	sleep(40)
	PlayMotion(Owner , ruFUSION_ACTORSTATE_CRAFTING_END )
end	 


function Lua_na_123028_action()
	local Owner = OwnerID()  --��J
	while true do 
		PlayMotionEX(Owner , ruFUSION_ACTORSTATE_CRAFTING_BEGIN,  ruFUSION_ACTORSTATE_CRAFTING_LOOP )
		sleep(40)
		PlayMotion(Owner , ruFUSION_ACTORSTATE_CRAFTING_END )
		sleep(100)
	end
end	 


function Lua_na_123030_Speak()
	local Owner = OwnerID()  --�d�h
	local NPC = SearchRangeNPC( Owner , 50 ) 
	local Reia
	local ReiaSpeak = { "SC_123029_SPEAK1" , "SC_123029_SPEAK2" , "SC_123029_SPEAK3" , "SC_123029_SPEAK4"	}

	local CardoSpeak = {	"SC_123030_SPEAK1" , "SC_123030_SPEAK2" ,"SC_123030_SPEAK3" , "SC_123030_SPEAK4"	}
	for i = 0 , #NPC do
		if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID ) == 123029 then
			Reia = NPC[i]
			break
		end
	end
	local R = DW_RAND(10)
	if R <5 then
		PlayMotion(Owner , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		NPCSay( Owner , "[" ..CardoSpeak[R].."]" )
		sleep(30)
		PlayMotion( Reia, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	
		NPCSay( Reia , "[" ..ReiaSpeak[R].."]" )
		sleep(10)
	else
		Lua_na_123030_action()
	end
end	 





--[123029]�n�n�A�ڥi�H�Y�@�ǿ}�G��?
--��M����I[123030]�A�A�w�g�Y�Ӧh�}�F�I
--�o�Ө��D�n����I[123029]�n�n�A�p�b���s���}�G�ܡH
--�O�r�I���L[123030]�A�o�O�n�����j�a�Y���A�ҥH�ڤ��|���\�A�b�Y�}���I
--[123029]�n�n�A�A�ٻݭn����O�H
--���ڦh�ĨǨ��䵵��M���⪺��a�I
--�o�O[123029]�n�n�n����A�ڦ����W�n�n�����ܡH
--��M���ڡI[123030]�O���u�q���p�����I
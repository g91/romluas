function LuaS_110597_0()

		if CheckFlag( OwnerID(), 540361 )==true  then
			SetSpeakDetail( OwnerID(), GetString ( "SD_110597_4" )   );--�y�㨺��......�A�n�A�o�򰶤j���K�K�@�N�ӧڳo���A�ڹ�b�P��......�c......�������P�H

		elseif ReadRoleValue( OwnerID() ,  EM_RoleValue_Skill_BlackSmith ) == 60 then
			SetSpeakDetail( OwnerID(), GetString ( "SD_110597_3" )   );--��B��O�~�H�աI���A�o�˼F�`���K�K���|�ӧ�کO�H�p�G�A�O�n��ǻ������K�j�v�������A�]���ӥh���`�ۭn���ڡI

		elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_BlackSmith ) >= 20 then
			SetSpeakDetail( OwnerID(), GetString ( "SD_110597_0" )   );--�����I�A���{�׫ܤ����F��I���h��Z��R���������Ԯ���;ǲߤF�a�H�L�����٦b���U��Ϩ��̡A�L�|���F���ڦh�Ӧh�F�I

		elseif ( CheckFlag( OwnerID(), 540268 ) == true ) then	--�p�G�|���K		
			LoadQuestOption( OwnerID() );
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LEARNING_SAY") , "LuaS_LEARNING_SAY", 0 );--#�ڭn���ǲ߷s���s�y�κ���H
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#����O�ͬ��ޯ�H
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_ASK_LIVINGSKILL") , "LuaS_110597_2", 0 );--#�٦����̥i�H�Ǩ��L�ͬ��ޯ�H

		elseif ( CheckFlag( OwnerID(), 540268 ) ~= true ) then	--�p�G���|���K
			LoadQuestOption( OwnerID() );				
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_110597_1") , "LuaS_110597_1", 0 );--#�ڷQ�ǲߥ��K�C
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#����O�ͬ��ޯ�H
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_ASK_LIVINGSKILL") , "LuaS_110597_2", 0 );--#�٦����̥i�H�Ǩ��L�ͬ��ޯ�H
		else
			SetSpeakDetail( OwnerID(), GetString ( "SD_SCRIPT_DEBUG" )   )
		end

		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_FORMULA_STORE") , "Lua_110597_RecipeList_Touch", 0 );--#�ڷQ�ݬݧA�檺�t��C�@--��b�̥~�h�����|���H�]��ݬݯవ����F��
end


-------------------------------------------------------------------------------------------------------------------------

function LuaS_110597_1()

   	SetSpeakDetail( OwnerID(), GetString ( "SD_110597_1" )   );--���K�ݰ_�ӫܨ��W�A���O�p�G�ޥ��o�y�A����H���i�H���P�ӥ����C
								   --�ǲߨ�t���A�u�n�b���K�������A���}�t�ΦC�����u�ͬ��ޯ�v�A��ܡu���K�v�C�N�i�H�s�y���P���K�s����F�A�A���R��²�檺�t��ոլݧa�H
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_IKNOW") , "LuaS_110597_3", 0 );--
		
end

-------------------------------------------------------------------------------------------------------------------------

function LuaS_110597_2()

   	SetSpeakDetail( OwnerID(), GetString ( "SD_110597_2" )   ); --���H��L���u�@�ޯ�ڡH��W���̨����X�f���񨺸̦���K�g�i�Ф�u�A��W�������F�˪L���X�f���̫h�O�Ҫ��v���״��A�L�]�|�ФH�Ҫ�......�ڡI��F�I���]���䦳�@�ӨȯS�E�纸�ͭסA�I���i�H�Ǩ�@�ӥs�����ѳN���޳N�A�n�����@�n���F���٭즨����٬O��ˡA�A�˦ۥh�ݥL�i��|����M���C
								
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_BACK") , "LuaS_110597_0", 0 );--#��^�W�@��
		
end
-------------------------------------------------------------------------------------------------------------------------
function LuaS_110597_3()

   	CloseSpeak( OwnerID())	
	Beginplot( OwnerID() ,"LuaFunc_BLACKSMITH_Dialog", 0 )

		
end
-------------------------------------------------------------------------------------------------------------------------
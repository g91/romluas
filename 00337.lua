function LuaS_110469_0()

		if ( CheckFlag( OwnerID() , 540358) == true )  and CheckCompleteQuest(OwnerID() , 420674 ) == true then --�ˬd���j�v��檺��
			SetSpeakDetail( OwnerID(), GetString ( "SD_110469_4" )   );--#�S�Q�칳�A�o�򰶤j�����q�v�|�ӳo�̡I���|���|�I

		elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Mining ) == 60 ) and CheckCompleteQuest(OwnerID() , 420674 ) == true then  --����60���ܭn���a�h���`�ۭn��
			SetSpeakDetail( OwnerID(), GetString ( "SD_110469_3" )   );--#�޳ޡ�A�����N�w�g���򰪤F�A����٨ӧ�ڰڡH�A���ӥh��ǻ������j�v�̾ǲߡA���`�ۭn�릳�ܦh�ħL�A���̤���e���o��L�̪������C

		elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Mining ) >= 20 ) and CheckCompleteQuest(OwnerID() , 420674 ) == true then --����20�H�W���ܭn���a�h�Z��R��
			SetSpeakDetail( OwnerID(), GetString ( "SD_110469_0" )   );--#�A�h�L�Z��R�����F�ܡH�q�u�ɮv�ڸ��S�N�b���̡A�ڰO�o�O�b���U�F�ϧa�H�q�L���اA�~��Ǩ��h�s�F��C

		elseif ( CheckFlag( OwnerID(), 540269 ) == true ) then --�p�G�|���q(�ѩ�W��������A�ޯ൥��20�ᤣ�|���)
			LoadQuestOption( OwnerID() );
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_GATHER_SAY") , "LuaS_GATHER_SAY", 0 );--#�ڭn�p��~��ֳt�a���Ķ��ؼСH
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_AFTER_GATHER_MINE") , "LuaS_AFTER_GATHER_MINE", 0 );--#�Чi�D��������媺�Ʊ��C
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#����O�ͬ��ޯ�H
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_ASK_LIVINGSKILL") , "LuaS_110469_2", 0 );--#�٦����̥i�H�Ǩ��L�ͬ��ޯ�H
			
		elseif  ( CheckFlag( OwnerID(), 540269 ) ~= true ) then --�p�G���|���q
			LoadQuestOption( OwnerID() );
			if CheckAcceptQuest( OwnerID() , 420674 ) == false then
				AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_110469_1") , "LuaS_110469_1", 0 );--#�ڷQ�ǲ߫��q�C
			end
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#����O�ͬ��ޯ�H
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_ASK_LIVINGSKILL") , "LuaS_110469_2", 0 );--#�٦����̥i�H�Ǩ��L�ͬ��ޯ�H
		else
			SetSpeakDetail( OwnerID(), GetString ( "SD_SCRIPT_DEBUG" )   )
		end
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_FORMULA_STORE") , "Lua_110469_RecipeList_Touch", 0 );--#�ڷQ�ݬݧA�檺�t��C�@--��b�̥~�h�����|���H�]��ݬݯవ����F��
end

-------------------------------------------------------------------------------------------------------------------------

function LuaS_110469_1()
		
   	SetSpeakDetail( OwnerID(), GetString ( "SD_110469_1" )   );--�n�I���o���H�������o��n�֡I�]���Ѥ����D�w�g�~�]�X�ӤF�^

								   --���n�H�����q�O���娭��Ϊ��I���M�o�u�@�ܲʭ��S���K���L�A�ѫ��q�ұo���q�ۡA�g�L�����A�i�H�Ψӻs�y�j�h�ƪ��K�s�Z���B����H�Ψ�L����A�o�O�@���D�`��Ϊ��ޯ�C

								   --�Ӥ�k�ܳ�¡A�u�n�I���A�ҧ�쪺�q��N�i�H���q�F�C

								   --�{�b�N�h�o���q�u������a�I���A���B�I
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_IKNOW") , "LuaS_110469_3", 0 );--
		
end
-------------------------------------------------------------------------------------------------------------------------
function LuaS_110469_2()

   	SetSpeakDetail( OwnerID(), GetString ( "SD_110469_2" )   ); --#�}���E���o�̪��ܡA�ګ᭱���򪺤�V�L�h�A�����ҥ�w�Фj�a���A�Ӷ}���E�������R�R���|�i�D�A���ǯ��ĥi�H�Ķ��A����٦��Aù�����@�Ǳлs�y���~���A�ܩ󹳤Z��R�����o�˪��j���A�Ҧ��u�@�ޯ઺�ɮv���|���A�ڪ��D���N�o�ǤF�C
								
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_BACK") , "LuaS_110469_0", 0 );--#��^�W�@��
		
end

-------------------------------------------------------------------------------------------------------------------------
function LuaS_110469_3()

   	CloseSpeak( OwnerID())	
	Beginplot( OwnerID() ,"LuaFunc_MINING_Dialog", 0 )

		
end

-------------------------------------------------------------------------------------------------------------------------
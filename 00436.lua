function LuaS_110599_0()
                                
 		if CheckFlag( OwnerID() , 540366 )==true then
			SetSpeakDetail( OwnerID(), GetString ( "SD_110599_4" )   );--�������I�A���O����.......����......�Ҫ��N�j�v�ܡH�A�|����Y�Ҧ������ܡH

		elseif ReadRoleValue( OwnerID() ,  EM_RoleValue_Skill_Alchemy ) == 60 then
			SetSpeakDetail( OwnerID(), GetString ( "SD_110599_3" )   );--�s����p�j�]�S��k�ЧA�F��F�ڡH�u�O�V�|�A�ڤ]�����D�֥i�H�ЧA��`�J���Ҫ��N�C��γ\��̤���......��F�A�٬O�h���`�ۭn��a�I���`�ۭn�먺�̦��G���Ҫ��j�v���u���C

		elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Alchemy ) >= 20 then
			SetSpeakDetail( OwnerID(), GetString ( "SD_110599_0" )   );--�A����O�w�g�W�X�کү�ЧA���F�A�Z��R�����U�F�Ϫ�����p�j�|���F���ڦh��h�A�A���ӥh��o�ǲߡC

		elseif ( CheckFlag( OwnerID(), 540338 ) == true ) then --�p�G�|�Ҫ�
			LoadQuestOption( OwnerID() );
                                               	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LEARNING_SAY") , "LuaS_LEARNING_SAY", 0 );--#�ڭn���ǲ߷s���s�y�κ���H
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#����O�ͬ��ޯ�H
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_ASK_LIVINGSKILL") , "LuaS_110599_2", 0 );--#�٦����̥i�H�Ǩ��L�ͬ��ޯ�H

		elseif ( CheckFlag( OwnerID(), 540338 ) ~= true ) then	--�p�G���|�Ҫ�
			LoadQuestOption( OwnerID() );
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_110599_1") , "LuaS_110599_1", 0 );--#�ڷQ�ǲ߷Ҫ��C
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#����O�ͬ��ޯ�H
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_ASK_LIVINGSKILL") , "LuaS_110599_2", 0 );--#�٦����̥i�H�Ǩ��L�ͬ��ޯ�H
		else
			SetSpeakDetail( OwnerID(), GetString ( "SD_SCRIPT_DEBUG" )   )
		end
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_FORMULA_STORE") , "Lua_110599_RecipeList_Touch", 0 );--#�ڷQ�ݬݧA�檺�t��C--�����|���H�]��ݬݯవ����F��				


end

-------------------------------------------------------------------------------------------------------------------------

function LuaS_110599_1()

   	SetSpeakDetail( OwnerID(), GetString ( "SD_110599_1" )   );--�n���Ĥ��i�H�a�ӳ\�h��K���S���O�A�L�צb����ɭԡA�Ĥ��`�O�Q�ݭn�ӥB���w�諸�C
								   --��A�ǲߨ�Ҫ��t���A�u�n�b�Ҫ��������A���}�t�ΦC�����u�ͬ��ޯ�v��ܡu�Ҫ��v�C�N�i�H�s�y�o���Ĥ��F�C
								   --�Q�n�t�誺�ڥi�H�e...�������A�O�u��v�A�@�ǡC�I���a�H��W�}�F�A�u�O��...
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_IKNOW") , "LuaS_110599_3", 0 );--
		
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function LuaS_110599_2()

   	SetSpeakDetail( OwnerID(), GetString ( "SD_110599_2" )     ); --��L���u�@�ޯ�H�A���Q��ھǷҪ��ܡH���㤣�L�o�̦��Ъ����h�A�N�O�K�K�E��ù�R�|�Х��K�A�٦��n��X�f���񪺩g�i�|�Ф�u�A��L���X�ӱбĶ������b�}���E���A�A���Ӫ��D�a�H��A��F�I�ȯS�E�纸�ͭצb���]����Ф��ѳN�A��ĳ�A�@�w�n�h�ݬݡC

	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_BACK") , "LuaS_110599_0", 0 );--#��^�W�@��
		
end

-------------------------------------------------------------------------------------------------------------------------
function LuaS_110599_3()

   	CloseSpeak( OwnerID())	
	Beginplot( OwnerID() ,"LuaFunc_ALCHEMY_Dialog", 0 )

		
end

-------------------------------------------------------------------------------------------------------------------------
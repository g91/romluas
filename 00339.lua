function LuaS_110471_0()

		if CheckFlag( OwnerID(), 540360 )==true and CheckCompleteQuest(OwnerID() , 420672 ) == true then
			SetSpeakDetail( OwnerID(), GetString ( "SD_110471_4" )   );--�����@�ӱ��ĤH�A�������A�O�ڪ��a���C

		elseif ReadRoleValue( OwnerID() ,  EM_RoleValue_Skill_Herblism ) == 60 and CheckCompleteQuest(OwnerID() , 420672 ) == true then
			SetSpeakDetail( OwnerID(), GetString ( "SD_110471_3" )   );--�ڡI�A�w�g�Ǩ�o��h���ѤF�ڡI�ݨӥu���ǻ������j�v��оɧA�F�A���L�ڤ]�����D�j�v�O�֡A�U�R�G�Ѯv���A���G���`�ۭn�릳�o�Ǥj�v�̪������A��ı�o�A�ȥ��h�ݬݡC

		elseif ReadRoleValue( OwnerID() ,  EM_RoleValue_Skill_Herblism ) >= 20 and CheckCompleteQuest(OwnerID() , 420672 ) == true then
			SetSpeakDetail( OwnerID(), GetString ( "SD_110471_0" )   );--�A�w�g��ڼF�`�F�O�I�{�b�ڷQ�u���Z��R�������R��Ѯv�i�H���U�A�F�A�A���Ӫ��D�o�a�H�o���b���U�F�ϱоɨӦۦU�a�����ĤH�O�I

		elseif ( CheckFlag( OwnerID(), 540333 ) == true ) then --�p�G�|����
			LoadQuestOption( OwnerID() );		
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_GATHER_SAY") , "LuaS_GATHER_SAY", 0 );--#�ڭn�p��~��ֳt�a���Ķ��ؼСH
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_AFTER_GATHER_HERB") , "LuaS_AFTER_GATHER_HERB", 0 );--#�Чi�D�����󴣷Ҫ��Ʊ��C
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#����O�ͬ��ޯ�H
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_ASK_LIVINGSKILL") , "LuaS_110471_2", 0 );--#�٦����̥i�H�Ǩ��L�ͬ��ޯ�H

		elseif ( CheckFlag( OwnerID(), 540333 ) ~= true ) then --�p�G���|����
			LoadQuestOption( OwnerID() );
			if CheckAcceptQuest( OwnerID() , 420672 ) == false then
				AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_110471_1") , "LuaS_110471_1", 0 );--#�ڷQ�ǲ߱��ġC
			end
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#����O�ͬ��ޯ�H
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_ASK_LIVINGSKILL") , "LuaS_110471_2", 0 );--#�٦����̥i�H�Ǩ��L�ͬ��ޯ�H
		else
			SetSpeakDetail( OwnerID(), GetString ( "SD_SCRIPT_DEBUG" )   )
		end
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_FORMULA_STORE") , "Lua_110471_RecipeList_Touch", 0 );--#�ڷQ�ݬݧA�檺�t��C�@--��b�̥~�h�����|���H�]��ݬݯవ����F��
end

-------------------------------------------------------------------------------------------------------------------------

function LuaS_110471_1()

	SetSpeakDetail( OwnerID(), GetString ( "SD_110471_1" )   );

	--�ڷQ�A���F��������ܡA�L�׬O�����B���I�άO�Ҫ����Ĥ��A���ĵ���O���i�ίʪ��F��C

	--�Ķ�����k��²��A�u�n�I���A��쪺���İ�N��F�C

	--���Ħ��ɻP�a�W����L�����I���A�`�`�|�Q�����A�A�����C�j�����Ӥߦa�[��C

	--�o�Ǧ��Ϊ����ġA���O�j�۵M�礩�ڭ̪������A�b�Ķ����ɭԭn�h�۷P�����߳�C
	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_IKNOW") , "LuaS_110471_3", 0 );--
end
-------------------------------------------------------------------------------------------------------------------------
function LuaS_110471_2()

   	SetSpeakDetail( OwnerID(), GetString ( "SD_110471_2" )   ); --��L�ͬ��ޯ�H�Ҧ��u�@�ޯ઺��|���b�Z��R�������A���̥i�H�Ǩ�Ҧ��u�@�ޯ�A�ڡI��p�A�A���ӬO�n�ݳo�䪺�Ѯv�a�H�ڥi�H�ЧA���ġA�մ�`����w��ЧA���A����䪺�q�|���䪺�~�ͦѯR�|�ФH���q�A��......��p�A�ڰO�où�����|�лs�y���H�A���ڤ@�ɷQ���_�ӥL�̪��W�r�C
								
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_BACK") , "LuaS_110471_0", 0 );--#��^�W�@��
		
end
-------------------------------------------------------------------------------------------------------------------------

function LuaS_110471_3()

   	CloseSpeak( OwnerID())	
	Beginplot( OwnerID() ,"LuaFunc_HERBLISM_Dialog", 0 )
		
end
-------------------------------------------------------------------------------------------------------------------------
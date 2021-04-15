function LuaS_110470_0()
		if CheckFlag( OwnerID(), 540359 )==true and CheckCompleteQuest(OwnerID() , 420673 ) == true then --�ˬd���j�v��檺��
			SetSpeakDetail( OwnerID(), GetString ( "SD_110470_4" )   );--���j�����̡I�����ڬ��A�m�W�@���q��

		elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Lumbering ) == 60 and CheckCompleteQuest(OwnerID() , 420673 ) == true then --����60���ܭn���a�h���`�ۭn��
			SetSpeakDetail( OwnerID(), GetString ( "SD_110470_3" )   );--���I�A���ޯ໡���w�w�g�i�H�h�M�ǻ������j�v�ǲߤF�I�ڪ��D���`�ۭn��i�H�o��L�̪������A�A�i�H�h����ݬݡC

		elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Lumbering ) >= 20 and CheckCompleteQuest(OwnerID() , 420673 ) == true then --����20�H�W���ܭn���a�h�Z��R��
			SetSpeakDetail( OwnerID(), GetString ( "SD_110470_0" )   );--�A�O�^�ӧ�ھǰۺq���ܡH�������ڡH�n�l�D��쪺���ѡH���A���ӥh�Z��R�����䬥��Ѯv�A���O�ӧ�ڡF�ڰO�o�L�b���U�F�ϧa�H�Ķ������u�@�ޯ�ɮv���E���b���̩O�I

		elseif ( CheckFlag( OwnerID(), 540270 ) == true ) then --�p�G�|���
			LoadQuestOption( OwnerID() );
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_GATHER_SAY") , "LuaS_GATHER_SAY", 0 );--#�ڭn�p��~��ֳt�a���Ķ��ؼСH
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_AFTER_GATHER_WOOD") , "LuaS_AFTER_GATHER_WOOD", 0 );--#�Чi�D������d�s���Ʊ�
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#����O�ͬ��ޯ�H
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_ASK_LIVINGSKILL") , "LuaS_110470_2", 0 );--#�٦����̥i�H�Ǩ��L�ͬ��ޯ�H

		elseif ( CheckFlag( OwnerID(), 540270 ) ~= true ) then --�p�G���|���
			LoadQuestOption( OwnerID() );
			if CheckAcceptQuest( OwnerID() , 420673 ) == false then
				AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_110470_1") , "LuaS_110470_1", 0 );--#�ڷQ�ǲߥ��C
			end
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#����O�ͬ��ޯ�H
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_ASK_LIVINGSKILL") , "LuaS_110470_2", 0 );--#�٦����̥i�H�Ǩ��L�ͬ��ޯ�H
		else
			SetSpeakDetail( OwnerID(), GetString ( "SD_SCRIPT_DEBUG" )   )
		end
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_FORMULA_STORE") , "Lua_110470_RecipeList_Touch", 0 );--#�ڷQ�ݬݧA�檺�t��C�@--��b�̥~�h�����|���H�]��ݬݯవ����F��
end

-------------------------------------------------------------------------------------------------------------------------

function LuaS_110470_1()

	SetSpeakDetail( OwnerID(), GetString ( "SD_110470_1" )   );

		--�A�Q�ǥ��H�A���Q�s�ۺq�@�_�ǶܡH�ۺq�~�O�ڪ��M������

		--�����H�u�Q���ǥ��ڡH

		--�n�a�A���u���O�ܴΪ��ޯ��I

		--���ұo�쪺���Y�A�g�L�d�s��A�i�H�Ψӻs�y�j�h�ƪ���s�Z���B����H�Ψ�L����C

		--�u�n�I���A�ҧ�쪺���O�N�i�H���F�C

		--�A�{�b�N�X�o�a�A�ڭ̥��u�N�O�����N����������K
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_IKNOW") , "LuaS_110470_3", 0 );--#

end

-------------------------------------------------------------------------------------------------------------------------
function LuaS_110470_2()

   	SetSpeakDetail( OwnerID(), GetString ( "SD_110470_2" )   ); --#��L�ɮv�H����s�q�|���䪺�~�ͤj�����Ы��q�A�}���E���̪��R�R���f�f�O�б���......�����A�R�R���n���~����ڤj......��F�Aù�����X�ӱлs�y���A�ܩ�Z��R�����A�Ҧ��u�@�ޯ઺�ɮv���̤@�w�����C
								
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_BACK") , "LuaS_110470_0", 0 );--#��^�W�@��
		
end
-------------------------------------------------------------------------------------------------------------------------
function LuaS_110470_3()

               CloseSpeak( OwnerID())
	Beginplot( OwnerID() ,"LuaFunc_LUMBERING_Dialog", 0 )

		
end
-------------------------------------------------------------------------------------------------------------------------
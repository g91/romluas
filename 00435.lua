function LuaS_110598_0()

 		if CheckFlag( OwnerID(), 540362 )==true  then
			SetSpeakDetail( OwnerID(), GetString ( "SD_110598_4" )   );--�A���O���Ӧ��W���j��K�ܡH�i�H�ЧA�b�ڪ��S�M�W��ñ�W�ܡH
		elseif ReadRoleValue( OwnerID() ,  EM_RoleValue_Skill_Carpenter  ) == 60 then
			SetSpeakDetail( OwnerID(), GetString ( "SD_110598_3" )   );--�z�I�A�w�g�O�ӫܥX�⪺��u�F�I�A�ٷQ��i�@�B���ܡA�ݨӥu���ǻ�������u�j�v������U�A�F�A���L�n���j�v��......�ڰO�o���e�h���`�ۭn�릳ť���L�A�γ\�A���ӥh���̬ݬݡH
		elseif ReadRoleValue( OwnerID() ,EM_RoleValue_Skill_Carpenter  ) >= 20 then
			SetSpeakDetail( OwnerID(), GetString ( "SD_110598_0" )   );--�ڳo�̯�ЧA���N�o���o�I�p�G�A�Q�ǧ�h�A�ګ�ĳ�A�h��Z��R�������U��ϧ�N�����ͷ|����n�C

		elseif ( CheckFlag( OwnerID(), 540334 ) == true ) then	--�p�G�|��u	
			LoadQuestOption( OwnerID() );
                                               	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LEARNING_SAY") , "LuaS_LEARNING_SAY", 0 );--#�ڭn���ǲ߷s���s�y�κ���H
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#����O�ͬ��ޯ�H
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_ASK_LIVINGSKILL") , "LuaS_110598_2", 0 );--#�٦����̥i�H�Ǩ��L�ͬ��ޯ�H

		elseif ( CheckFlag( OwnerID(), 540334 ) ~= true ) then	--�p�G���|��u
			LoadQuestOption( OwnerID() );			
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_110598_1") , "LuaS_110598_1", 0 );--#�ڷQ�ǲߤ�u�C
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#����O�ͬ��ޯ�H
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_ASK_LIVINGSKILL") , "LuaS_110598_2", 0 );--#�٦����̥i�H�Ǩ��L�ͬ��ޯ�H

		else
			SetSpeakDetail( OwnerID(), GetString ( "SD_SCRIPT_DEBUG" )   )
		end
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_FORMULA_STORE") , "Lua_110598_RecipeList_Touch", 0 );--#�ڷQ�ݬݧA�檺�t��C--�����|���H�]��ݬݯవ����F��	

end

-------------------------------------------------------------------------------------------------------------------------

function LuaS_110598_1()

   	SetSpeakDetail( OwnerID(), GetString ( "SD_110598_1" )   );--��u�O�@�ػݭn�@�߻P�Ӥߪ��u�@�A�A�i�H�ǥѤ�u�s�y�\�h���{�Ϊk�t���Z���C
								   --�ǲߨ�t���A�u�n�b��u�������A���}�t�ΦC�����u�ͬ��ޯ�v��ܡu��u�v�C�N�i�H�s�y��s�Z���Ψ�L���~�F�C
								   --�p�G�ݭn��¦����u�t�誺�ܡA�ڳo��ˬO���@�ǡA����ܦX�z��I
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_IKNOW") , "LuaS_110598_3", 0 );--
		
end
-------------------------------------------------------------------------------------------------------------------------
function LuaS_110598_2()

   	SetSpeakDetail( OwnerID(), GetString ( "SD_110598_2" )     ); --�A�����D���̾Ǥu�@�ޯ�ڡH�ڴN�i�H�ЧA��u�F�ڡI�����w���ܡA�K�K�E���䪺ù�R�]�i�H�ЧA���K�A�A���M�N�h�����X�f���̪����״��ǷҪ��A�٬O�A�Q�ǱĶ��H���A���Ӧ^�}���E���ݬݡA�Ķ��Ѯv���b���̡F�����A�A���|�O�n�򨺭ӨȯS�E�纸�ͭ׾Ǥ��ѳN�a�H�̪�ܦh�H���G�ܷP����A�L���|�b���]����ФH�O�I

	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_BACK") , "LuaS_110598_0", 0 );--#��^�W�@��
		
end

-------------------------------------------------------------------------------------------------------------------------
function LuaS_110598_3()

                CloseSpeak( OwnerID())	
	Beginplot( OwnerID() ,"LuaFunc_CARPENTER_Dialog", 0 )

		
end

-------------------------------------------------------------------------------------------------------------------------
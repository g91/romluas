function LuaFunc_LivinSkill_Dialog(String)
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_

		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , String);
		DialogSelectStr( OwnerID() , GetString("SO_YES") );
		DialogSelectStr( OwnerID() , GetString("SO_NO") );
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
			--��ưe�X�����D
			return 0
		end
		
		local SelectID = Hsiang_GetDialogResoult( OwnerID() );
		CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF

		if SelectID == 0  then

			CastSpell( OwnerID() , OwnerID() , 491010 )
			sleep(5)
			return 1
		elseif SelectID == 1  then

			return 0
		else 

			return 0
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end
function LuaS_ChangeParalledID_0() 
	
	--LoadQuestOption( OwnerID() );
	SetSpeakDetail( OwnerID(), GetString ( "ST_CHANGEPARALLED_MSG" )   )
	--�o�ӥ@�ɤW����Ť�O�q���v�T�A���ɶ����y�ʦb�Y�Ǧa�貣�ͤF���[�A���Ǧ]���Ӥ������@�ɧڭ̺٬����y�A
	--�o�Ǥ��y�P�ڭ̪��@�ɴN�p�P�@�ӹ���b���P���u�U���ͪ����P�v�l�A�o�]�O�ڭ̰g�~�����ұ��Q���������@�C

	--�{�b�ڭ̰g�~�����o�{�Y�ǯS�w�a�I�i�H���H�e�����P�����y�A�L�h���ǤH�b�o�ӥ@�ɧ䤣��ۤv����V�A�N�O
	--�]���L�u�����ӥh���a����O�b��L�����y�W�A�A�O�_�]�g���ۤv����V�H�p�G�O���ܡA�A�γ\�i�H�e����L
	--�����y�ݬݡA�ӧڭ̰g�~�����N�|���U�A�i��o�q�ȵ{�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_CHANGEPARALLED") , "LuaS_ChangeParalledID_1", 0 ) --/*�ڭn�e����L���y
end

function LuaS_ChangeParalledID_1() 
	CloseSpeak( OwnerID() )
	Beginplot( OwnerID() ,"LuaFunc_ChangeParalledID", 0 )
end

function LuaFunc_ChangeParalledID()
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_

		DialogCreate( OwnerID() , EM_LuaDialogType_Select , GetString("CHANGE_PARALLED_DIALOG") );
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		local ParalledID 		= 0
		local BaseZoneID      	= 1
		while( 1 ) do --�ʺA�إߤ��y���
			if( CheckZone( ParalledID * 1000 + BaseZoneID) == false ) then
				break;
			end

			DialogSelectStr( OwnerID() , "<" .. (ParalledID+1) .. ">"  );
			ParalledID = ParalledID + 1;
		end	
		
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)
			--��ưe�X�����D
			return;
		end

		local SelectID = Hsiang_GetDialogResoult( OwnerID() );
			DialogClose( OwnerID() )
			CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF		
		if SelectID >= 0  and SelectID <= ParalledID then --��ܪ��Ǧ^�ȻP���y�N���ۦP

			CastSpell( OwnerID() , OwnerID() , 491008 )
			sleep(5)
			CastSpell( OwnerID(), OwnerID(), 490102 );
			sleep(5)
			OpenClientMenu( OwnerID() , EM_ClientMenuType_Loading)
			CancelBuff( OwnerID(), 500902 );
			SetParalledID( OwnerID() , SelectID )
			sleep(5)
			ScriptMessage( OwnerID(), OwnerID(), 1, GetString("CHANGE_PARALLED_MESSAGE"), "0xFFFFF266" )

		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end

end
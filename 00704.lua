function LuaI_110167() 
	local Obj = OwnerID()
	LoadQuestOption( OwnerID() )
	--���ȡG424962 ��̤����[�J
	if	CheckAcceptQuest(Obj,424962)==true	and
		CheckAcceptQuest(Obj,424963)==false	and 
		CheckCompleteQuest(Obj,424963)==false	then
		AddSpeakOption(Obj,Obj,"[SC_424962_A]","LuaS_424962_TalkPlotSP", 0 )
	end

	-- �C�i���ʰl�[
	--local hour = GetSystime(1)
	-- CheckBuff( OwnerID() ,501666 ) == true 
	--if ( hour >= 18 and hour < 20 ) and ( CheckBuff( OwnerID() , 501666 ) == true or CheckFlag( OwnerID() , 541327 ) == true ) then	-- �_�I��|�K�y�]�q
	--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111307_12") , "LuaS_110167_6", 0 )	-- ��������-�@�e�K�y�]�q
	--elseif ( CountBodyItem( OwnerID() , 202696 ) >= 1 ) and ( CheckBuff( OwnerID() , 501666 ) == true or CheckFlag( OwnerID() , 541327 ) == true ) then	-- �_�I��|�K�y�]�q
	--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111307_12") , "LuaS_110167_6", 0 )	-- ��������-�@�e�K�y�]�q
	--end

	if CheckFlag( OwnerID()  , 540820 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110167_3") , "LuaS_110167_3", 0 )	-- ��¾�᪺�`�N�ƶ��I
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110167_4") , "LuaS_110167_4", 0 )	-- �ڦp��^��}���E���H
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_GET_NEWBIE_TRAN") , "LuaS_Get_Newbie", 0 );
	end
  	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110167_1") , "LuaS_110167_1", 0 );--/��¾����
  	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110167_2") , "LuaS_110167_2", 0 );--/�ͬ��ޯश��
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_CHANGEJOB]" , "LuaS_ChangeJob_Intro", 0 )

end

function LuaS_110167_1() 
	SetSpeakDetail( OwnerID(), GetString("ST_110167_1") )
	--/�g�L�o�q�ɶ������m����A�Q���A��ثe¾�~���S�ʦ��F�@�w�{�ת��A�ѤF�a�H
	--/���᪺�_�I�ͲP�A�N���{��h���M�I�A��M�A����~��`�J��s�A�Ҿ֦���¾�~�C�Ϊ̡A�A�]�i�H�յ۾ǲߨ�L��¾�~�A���¾�~�f�t�o�y���ܡA���ɥi�H�o�X�N�Q���쪺�¤O�C
	--/���L�A�Q�n�ǲߨ�L¾�~���ޯ઺�ܡA�������F���¾�~�ɮv���n�D�A�ثe�ڨ���N���M�h�B�Ԥh�B�s��B�C�L�B�k�v�B���q������¾�~�ɮv�C
	--/�p�G�A��Y��¾�~�����쪺�ܡA�N�h��L�̽ͽͧa�I
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACKTALK") , "LuaI_110167", 0 ); --/�ڷQ�^���誺���
end

function LuaS_110167_2() 
	SetSpeakDetail( OwnerID(), GetString("ST_110167_2") )
	--/�ڭ̫_�I�̡A�j�������ɭԬO�Z���B�˳ƻP�ɵ��~�����Ӫ̡A���P�ɤ]�i�H�O���u�q���Ͳ��̡C
	--/�z�L�ͬ��ޯ઺�ǲߡA�ڭ̥i�H�ˤ�s�y�o�ǪZ���B�˳ƻP�ɵ��~�A�άO�Ķ���s�y�o�ǲ��~����ơC
	--/�ѧڭ̿ˤ�s�y�����~�A�q�`�|��@�볥�~�_�I�ұo�A�㦳��h���Ť�Ŷ��A�o�ǲŤ�Ŷ��^�O�J�Ť大��A�K��o��Ť�ұa�Ӫ��O�q�C
	--/�ӥB�Y�O�޳N�P�B�𳣹F��F���I���ܡA�ٷ|���X��~�Ū����~�A���ȲŤ�Ŷ���h�A��l�¤O�]��@�몺���~�j�j�C
	--/�Z��R���������U�ϡA���X�F�U�إͬ��ޯ઺�M�a�̡A�ڷQ�L�̳��|�ַܼN���ѥL�̪����ѡC��ĳ�A�i�H�����ըC�إͬ��ޯ�A��X�A�̳��w�����ئA�`�J�h��s�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACKTALK") , "LuaI_110167", 0 ); --/�ڷQ�^���誺���
end

function LuaS_110167_3() 
	SetSpeakDetail( OwnerID(), GetString("ST_110167_3") )
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACKTALK") , "LuaI_110167", 0 ); --/�ڷQ�^���誺���
end

function LuaS_110167_4() 
	SetSpeakDetail( OwnerID(), GetString("ST_110167_4") )
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACKTALK") , "LuaI_110167", 0 ); --/�ڷQ�^���誺���
end

function LuaS_Get_Newbie()
	SetSpeakDetail( OwnerID(), GetString("SC_GET_NEWBIE_TRAN_1") )
	if CheckFlag( OwnerID() , 540190 ) == false and ReadRoleValue( OwnerID() , EM_RoleValue_Race ) == 0 then
		SetFlag(OwnerID(),540190,1)
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_JOBGIVETRANSPORT][$SETVAR1=[491891]]" , C_SYSTEM )
	end
	if CheckFlag( OwnerID() , 540191 ) == false then
		SetFlag(OwnerID(),540191,1)
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_JOBGIVETRANSPORT][$SETVAR1=[491913]]" , C_SYSTEM )
	end
	if CheckFlag( OwnerID() , 540192 ) == false and ReadRoleValue( OwnerID() , EM_RoleValue_Race ) == 1 then
		SetFlag(OwnerID(),540192,1)
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_JOBGIVETRANSPORT][$SETVAR1=[493899]]" , C_SYSTEM )
	end

	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACKTALK") , "LuaI_110167", 0 ); --/�ڷQ�^���誺���	
end
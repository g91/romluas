function LuaSpeak_110600()

	LoadQuestOption( OwnerID() );  -- ����

	if CheckFlag( OwnerID() , 540002 )==false then
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_110600_4") , "LuaS_110600_4", 0 );--#�ڷQ�ǲߤ��ѳN
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_110600_1") , "LuaS_110600_1", 0 );--#�ڭn�p��ϥΡu���ѳN�v�H
--		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_110600_2") , "LuaS_110600_2", 0 );--#�ڷQ���D��h����u�E�o�v���Ʊ��C
		--AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_110600_3") , "LuaFunc_110600_STORE", 0 );--#���ʶR�@�ǰ�¦���E�o�_�ۡC
	else
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_110600_1") , "LuaS_110600_1", 0 );--#�ڭn�p��ϥΡu���ѳN�v�H
--		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_110600_2") , "LuaS_110600_2", 0 );--#�ڷQ���D��h����u�E�o�v���Ʊ��C
		--AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_110600_3") , "LuaFunc_110600_STORE", 0 );--#���ʶR�@�ǰ�¦���E�o�_�ۡC
	end

end

-------------------------------------------------------------------------------------------------------------------------

function LuaS_110600_1()

   	SetSpeakDetail( OwnerID(), GetString ( "SD_110600_1" )   );--�p�G�A�w�g�Ǩ���ѳN�F�A�A�i�H�b�ޯत���u�@��ޯ�v�������o���k�N�C�ϥΤ��ѳN��A�A�I���Q���Ѫ��Z���B�˳ƩΪ��~�W�A�N��N�Ӫ�����ѡC

                                                                   --���~���ѫ�A�����v�i�H�o��Ӫ��~���c�����ơA�Y���Ѫ��O�Z���θ˳ơA�٦��i��|��E�o�Ϊ��_�ۡA���Ͳ��Ϊ��Ť�O�L�k�Q���ѥX�Ӫ��C

                                                                   --�u���㦳�F�ʪ��F��~��Q���ѡA�ҥH���ө��ҽ檺�ӫ~�B���ȩҵ����S���~�������L�k�Q���ѡC


	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_BACK") , "LuaSpeak_110600", 0 );--#��^�W�@��
		
end

-------------------------------------------------------------------------------------------------------------------------

function LuaS_110600_2()

   	SetSpeakDetail( OwnerID(), GetString ( "SD_110600_2" )   );--���ѥX�Ӫ��_�ۡA�g�ѥk���I��ϥΫ�A�A�I�b�Z���θ˳ƤW�N��i��E�o�A�Y�E�o���\�A�N�ണ���Z���θ˳ƪ��¤O�@���C

								   --�ثe�̦h�i�H���������¤O�A���u���e�T�����í�w�A�Y�ϨS���E�o���\�A�]���|�����󪺭t���v�T�C���E�o���\�W�L�T����A�A�U�Ӫ��E�o�N�i������Z���θ˳ƪ��¤O���C�A�Ʀܳ��a�����p�A�|���Z���θ˳Ʈ����I�ҥH�����ԷV��ơC


	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_BACK") , "LuaSpeak_110600", 0 );--#��^�W�@��
		
end

-------------------------------------------------------------------------------------------------------------------------

function LuaFunc_110600_STORE()

	openshop();
	CloseSpeak( OwnerID() );

end

-------------------------------------------------------------------------------------------------------------------------

function LuaS_110600_4()

   	SetSpeakDetail( OwnerID(), GetString ( "SD_110600_4" )   );--
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_IKNOW") , "LuaS_110600_5", 0 );--
		
end

-------------------------------------------------------------------------------------------------------------------------
function LuaS_110600_5()

   	CloseSpeak( OwnerID())	
	Beginplot( OwnerID() ,"LuaFunc_DISSOLUTION_Dialog", 0 )
		
end

-------------------------------------------------------------------------------------------------------------------------
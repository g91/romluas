function LuaI_110541() 
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110541_1") , "LuaS_110541_1", 0 ); --/���U��Ϥ���
end

function LuaS_110541_1() 
	SetSpeakDetail( OwnerID(), GetString("ST_110541_1") )
	--/�A�{�b�Ө쪺�o�Ӱϰ�s�����U��ϡA���F�ڭ̶����n���K�E���~�A�ٻE���F�@�Ǥ�u�ΡB�s�ҫΡB�Ҫ����B�]�k�ө������C
	--/���K�E�G�����K����i�H�q�ƥ��K���u�@�A��s�y�@���K�s���Z���C�]���M�����Юv�A���ѥ��K�ޯ઺�ǲ߻P�ɶ��C
	--/��u�ΡG����u����i�H�q�Ƥ�u���u�@�A��s�y�@�Ǥ�s���Z���C�]���M�����Юv�A���Ѥ�u�ޯ઺�ǲ߻P�ɶ��C
	--/�s�ҫΡG���s�Ҿ���i�H�q�ƻs�Ҫ��u�@�A��s�y�Z�ҡB��ҡB�֥ҵ�����C�]���M�����Юv�A���ѻs�ҧޯ઺�ǲ߻P�ɶ��C
	--/�Ҫ����G���Ҫ�����i�H�q�ƷҪ����u�@�A��s�y�Ҫ����Ĥ��C�]���M�����Юv�A���ѷҪ��ޯ઺�ǲ߻P�ɶ��C
	--/�]�k�ө��G�c��@���]�k�ӫ~�A�H�Τ@�ǰ�¦���Ť�C
	--/�t�~�A�Z��R����ĵ�ƶ����`���P�y�M���]�b�o���U��Ϥ��A�y�M�����y�M�i�H����C�Y�A�Q�����@�ǩe�U���Ȫ��ܡA���ȧi�ܪO�N�bĵ�ƶ������f�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACKTALK") , "LuaI_110541", 0 ); --/�ڷQ�^���誺���
end

function LuaS_dindin_leave() 
	CloseSpeak( OwnerID() ); 
end

function LuaI_110542() 
	LoadQuestOption( OwnerID() );
  	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110542_1") , "LuaS_110542_1", 0 );--/���U�F�Ϥ���
end

function LuaS_110542_1() 
	SetSpeakDetail( OwnerID(), GetString("ST_110542_1") )
	--/���U�F�ϦP�ˬO�۷�㦳���O���ϰ��I�o�ϰ줺�����_�ΡB�i���ΡB�Ķ��λP���f���C
	--/���_�ΡG�����_����i�H�q�Ƶ��_���u�@�A��s�y�@�ǥ���B�k�T������C�]���M�����Юv�A���ѵ��_�ޯ઺�ǲ߻P�ɶ��C
	--/�i���ΡG���i������i�H�q�Ʋi�����u�@�A��s�y�@�ǭ����B���I���ɵ��~�C�]���M�����Юv�A���Ѳi���ޯ઺�ǲ߻P�ɶ��C
	--/�Ķ��ΡG���M�����Юv�A���ѫ��q�B���B���ĵ��ޯ઺�ǲ߻P�ɶ��A�åB�c��@�ǱĶ��~������t��C
	--/���f���G�c��@�Ǥu�@�Ϊ��s��B�ӧ��P�u��C
	--/�ڥN���U�F�ϩҦ������a�w��A�A�Ʊ�A��`���{�ڭ̳o�̡I
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACKTALK") , "LuaI_110542", 0 ); --/�ڷQ�^���誺���
end

function LuaI_110540() 
	LoadQuestOption( OwnerID() );
  	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110540_1") , "LuaS_110540_1", 0 );--/�Z���Τ���
end

function LuaS_110540_1() 
	SetSpeakDetail( OwnerID(), GetString("ST_110540_1") )
	--/���o�ӮɥN�A�_�I�̨ϥΪ��Z������y��Ѧۤv�ˤ�ű�y�A�άO�q�@�ɦU�a�h�o�{�è��o�A�V�ӶV�֤H�V�ڭ̪Z�����ʶR�F�C
	--/�ҥH�{�b�ڭ̪Z���Ωҳc�檺�Z���A�O�H���ѹ���һݪ���Z�����D�A�@��ӻ��˦��P��O���������q�C
	--/���L�A�p�G�A���Y�W�٨S�����⪺�Z�����ܡA�ˬO�i�H�ݬݦ��S���A�ݭn���C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACKTALK") , "LuaI_110540", 0 ); --/�ڷQ�^���誺���
end

function LuaI_110021() 
	LoadQuestOption( OwnerID() );
  	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110021_1") , "LuaS_110021_1", 0 );--/����Τ���
end

function LuaS_110021_1() 
	SetSpeakDetail( OwnerID(), GetString("ST_110021_1")   );
	--/�ڭ̨���Ϊ��w��P�Z���������A�j�h�ƪ��ӫ~�O���ѵ�����ϥΡA�˦��P��O����@��C
	--/���L�A�p�G�A���W���˳��٦���ʪ��������ܡA��M�]�w��A��ڭ��ʶR�A�O�ҦP�˰�T�@�ΡI
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACKTALK") , "LuaI_110021", 0 ); --/�ڷQ�^���誺���
end

function LuaI_110023() 
	LoadQuestOption( OwnerID() );
--  	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_WHATHOME") , "LuaS_110023_1", 0 );--/����O�ЫΡH
end

function LuaS_110023_1() 
	SetSpeakDetail( OwnerID(), GetString("SO_HOMEINTRO") )	--�ЫάO���C�H���i�H�ӽ��ʶR���@�Өp�H�Ŷ��K
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACKTALK") , "LuaI_110023", 0 ); --/�ڷQ�^���誺���
end

function LuaI_110049() 
	LoadQuestOption( OwnerID() )
  	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110049_1") , "LuaS_110049_1", 0 );--/����Ҥ���
end

function LuaS_110049_1() 
	SetSpeakDetail( OwnerID(), GetString("ST_110049_1") )
	--/����ҬO���ѫ_�I�̪��~��y���a��C
	--/�p�G�A�b�Ȧ檺�L�{���o�즳���Ȫ��Z���B�˳ơB�Ť�Ψ�L���~�A�A�i�H����ڭ̥���Ҩӳc��F�P�˦a�A�p�G�A�ݭn�o�ǪF��A�]�i�ӧڭ̥���ҴM��C
	--/�o�䪺�ӫ~���O�ѫ_�I�̴��Ѫ��A���M�����O�һ���@�w�K�y�A���O�����c�h�A�p�G�h�ӳ}�}���ܡA�٬O�`�`�|��쪫�G�������F����
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACKTALK") , "LuaI_110049", 0 ); --/�ڷQ�^���誺���
end
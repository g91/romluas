--530061--�ͺA��s������
--530062--�����p�i���ߦn��
--530063--�����p�i�������v

function LuaS_110342()

	LoadQuestOption( OwnerID() )
	if ( CheckFlag( OwnerID()  , 540865 ) == false ) and ( ReadRoleValue(  OwnerID() , EM_RoleValue_SEX ) == 1 ) then --�ˬd�O�_���Y�ΡG�u�ͺA��s�������v
		AddSpeakOption( OwnerID() , TargetID() , GetString("SO_110342_1") , "LuaS_110342_Ask" , 0 )	--�W�[�@�ӿﶵ�A�ͺA��s���ۦ�����
	end

	if (CheckAcceptQuest(OwnerID(),420371)==true )and(CountBodyItem( OwnerID(), 202748 )<1)then
		AddSpeakOption(OwnerID(),TargetID(),GetString("SC_420371_0"),"LuaS_421371_1",0)
	end

end

function LuaS_110342_Ask()

	SetSpeakDetail( OwnerID() , GetString("ST_110342_1") )
	--�w��Ө쫢���p�i���ͺA��s���A�p�G�A��ͺA�����쪺�ܡA�i�H�[�J�ڭ̤@�_�@�P��s�C�ӥB�A��s���ä��j���@�w�n�d�b���a�u�@�A�άO�@�w�n���X��s���i�A�����O�ħ��@��סA���ˡH������[�J�ڭ̶ܡH
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_110342_2") , "LuaS_110342_Join" , 0 )	--�W�[�@�ӿﶵ�A�[�J�ͺA��s��

end

function LuaS_110342_Join()

	ScriptMessage( OwnerID() , OwnerID() , 2 , GetString("SO_110342_3") , C_SYSTEM )	--�e�������T���G���o�Y�ΡG�u�ͺA��s�������v
	ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SO_110342_3") , 0 )		--�t�ΰT���G���o�Y�ΡG�u�ͺA��s�������v
	GiveBodyItem ( OwnerID() , 530061 , 1 )	-- �Y�ΡG�u�ͺA��s�������v
	Say( TargetID() , GetString("ST_110342_2") )	-- �P�§A�[�J�����p�i���ͺA��s���I
	SetFlag( OwnerID()  , 540865 , 1 )
	CloseSpeak( OwnerID() );	--������ܵ���

end

function LuaS_421371_1()

	GiveBodyItem( OwnerID(), 202748, 1 )
	CloseSpeak( OwnerID() )	
end
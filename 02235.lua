function LuaS_117291()
	if CheckBuff(OwnerID(), 508708) == false then
		SetFlag(OwnerID(), 544748, 1)
	end

	LoadQuestOption( OwnerID() )	-- ���J���ȼҪO

	local homenumber = Read_Role_HomeNumber( OwnerID() )

	if ( CountBodyItem( OwnerID() , 201291 ) >= 1 ) then
		AddSpeakOption( OwnerID() , TargetID() , GetString("SO_HOMEFT_GIVE") , "LuaS_HomeFT_Give" , 0 )	-- �W�[�@�ӿﶵ�G�ڦ��a��I����A�ڷQ�I���I
	end

	if ( homenumber == -1 ) then
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_BUYHOME") ,      "LuaS_117291_HomeBUY",     0 );	--�W�[�@�ӿﶵ�A�ڭn�ӽФ@���Ы�
	else
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_ENTERHOME") , "LuaS_117291_HomeEnter",     0 )	--�W�[�@�ӿﶵ�A�ڭn�i�J�ڪ��Ы�
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_VISITHOME") , "LuaS_117291_HomeVISIT",    0 )		--�W�[�@�ӿﶵ�A�ڭn���[�X�ݧO�H���Ы�
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SC_FURNITUESHOP") , "LuaS_ComShop_1",    0 ) 		--�W�[�@�ӿﶵ�A�ڭn�ʶR�򥻮a��
	end
	if LuaFunc_CountJobNumber() > 1 then
		AddSpeakOption( OwnerID(), TargetID(), "[SO_110581_1]" , "LuaS_110581_1",0 );	--�W�[�@�ӿﶵ�A�ڷQ�ഫ�D��¾
	end
	--AddSpeakOption( OwnerID(), TargetID(),  GetString("SC_ACCOUNTBAG") , "LuaS_AccountBag",    0 )		--�W�[�@�ӿﶵ�A�ڭn���^�ЫΪ����~
	AddSpeakOption( OwnerID(), TargetID(),  GetString("SC_HOUSEBANK") , "LuaS_117291_HomeBANK",    0 ) 		--�W�[�@�ӿﶵ�A�ڭn�}�һȦ�
	AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_WHATHOME") , "LuaS_117291_HomeINTRO", 0 )		--�W�[�@�ӿﶵ�A�ЫάO����H

end
function LuaS_117291_HomeBUY()
	CloseSpeak( OwnerID() );	--������ܵ���
	BeginPlot( TargetID() , "LuaS_117291_HomeBUY_Dialog" , 0 )
end

function LuaS_117291_HomeBANK()
	CloseSpeak( OwnerID() );	--������ܵ���
	Sys_Bank_Open()
end

function LuaS_117291_HomeEnter()
	CloseSpeak( OwnerID() );	--������ܵ���
	Sys_HouseVisit_MyHouse_Open()	
end

function LuaS_117291_HomeBUY_Dialog()

	if ( CountBodyItem( TargetID() , 201383 ) < 1 ) then
		Tell( TargetID() , OwnerID() , "[SO_GIVEHOMETALKMAID5_117291]" )	-- �ӡA�o�Ӹm���c�i�H��20�˪F��A�O���A���C�A�n�O�o�⥦�\���ЫΤ���I
		GiveBodyItem ( TargetID() , 201383 , 1 )	-- 20��m���c
	end

	Tell( TargetID() , OwnerID() , GetString("SO_GIVEHOMEMAID_117291") )	-- �M��K�K���ڤ@�U��A�R�i�o�g�@�Ǹ�Ƥ~��K
	local Ret = BuildHouse( TargetID() , 575523 );
	SetFlag( TargetID()  , 542670, 1 )  --���X��
	if( Ret == false ) then
		Tell( TargetID() , OwnerID() , GetString("SO_NOBUILDHOME_117291") )	-- ���ӡK�n�����@�I�p�p�����D�A�n���٨S��k���A�����ӽСK�A�i�H�����A�ӧ�R�i�@���ܡH[$PLAYERNAME]�A�藍�_�K
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SO_NOBUILDHOME") , 0 )		-- "�L�k�ӽЩЫΡI�I
	end
	PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_BEGIN );
	Sleep( 15 )
	Tell( TargetID() , OwnerID() , GetString("SO_GIVEHOMETALKMAID1") )	-- ��K�n��o�ǡA�٦��o�ǡK
	Sleep( 15 )
	Tell( TargetID() , OwnerID() , GetString("SO_GIVEHOMETALKMAID2") )	-- �ڡI�٦��o�Ӥ]�n��K
	Sleep( 15 )
	Tell( TargetID() , OwnerID() , GetString("SO_GIVEHOMETALKMAID3") )	-- �C�㤣�|�a�A�٦��o�ӡK
	Sleep( 15 )
	Tell( TargetID() , OwnerID() , GetString("SO_GIVEHOMETALKMAID4") )	-- �I��ש�񪺮t���h�F�K
	PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_END );


	local homenumber = Read_Role_HomeNumber( TargetID() )
	if ( homenumber ~= -1 ) then
		local homenumber_text = string.format( "%06d", homenumber  );
		local Str = "[SO_GIVEHOMEOKMAID_117291][$SETVAR1="..homenumber_text .."]"
		Tell( TargetID() , OwnerID() , Str )	-- �R�i���A�˦n�ЫΪ��ӽФ����o�I���P���X�O[$VAR1]�A�n�O�M����I�o��[$PLAYERNAME]�]��j�a�@�˦��ۤv���Фl�F�O�I
	else
		Tell( TargetID() , OwnerID() , GetString("SO_NOBUILDHOME_117291") )	-- ���ӡK�n�����@�I�p�p�����D�A�n���٨S��k���A�����ӽСK�A�i�H�����A�ӧ�R�i�@���ܡH[$PLAYERNAME]�A�藍�_�K
		Tell( TargetID() , OwnerID() , GetString("SO_NOBUILDHOME") )	-- "�L�k�ӽЩЫΡI�I
	end
	Sleep( 5 )

end

function LuaS_117291_HomeVISIT()
	CloseSpeak( OwnerID() );	--������ܵ���
	local Obj = Role:new( OwnerID() );
	local Ret = SaveReturnPos( OwnerID() , Obj:ZoneID() , Obj:X() , Obj:Y() , Obj:Z() , Obj:Dir() );
	if( Ret == false ) then
		--Tell( OwnerID() , TargetID() , "���B����]�w�^���I" );
		return;
	end
	OpenVisitHouse( false );
end

function LuaS_117291_HomeINTRO()
	SetSpeakDetail( OwnerID(), GetString("SO_HOMEINTRO") )	--�ЫάO���C�H���i�H�ӽЪ��@�Өp�H�Ŷ��C\n\n�b�o�ӪŶ��̫ΥD�i�H�ۥѵo���зN���\\�]�U�خa��A�ӥB���ǵ}�����a���ٷ|���ΥD�a�Ӧ��q���ĪG�C\n\n�ҥH�A�֦��@���ЫΡA�b�o�ӥ@�ɬO�D�`���n�ӥB���n���@��ơC\n\n�C�@���Ыγ����@�Ӥ����ƪ��u���P���X�v�A�Y�O�A�Q���[�O�H���ЫΡA�u�n��ڹ�ܡA��ܡu�ڭn���[�X�ݧO�H���ЫΡv�A�����J�Q���[�ЫΪ����P���X�Y�i�C\n\n���L�n�`�N���O�A�Y�O�A���[���ЫΫΥD���]�w�u���T�K�X�v�A�A�ٻݭn��J���T�����T�K�X�~���i�J�C
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_BACK") , "LuaS_117291", 0 );	--�^�W�@��
end
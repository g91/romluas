function LuaS_110752()

	LoadQuestOption( OwnerID() )	-- ���J���ȼҪO

	local homenumber = Read_Role_HomeNumber( OwnerID() )

	if ( homenumber == -1 ) then
		--ScriptMessage( OwnerID(), OwnerID(), 0, "�@�A�S���ЫΡI�I" , 0 )
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_BUYHOME") ,      "LuaS_110752_HomeBUY",     0 );	--�W�[�@�ӿﶵ�A�ڭn�ӽФ@���Ы�
	else
		--ScriptMessage( OwnerID(), OwnerID(), 0, "�@�A���ЫΡA���P���X�O"..homenumber , 0 )
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_ENTERHOME") ,      "LuaS_110752_HomeEnter",     0 );	--�W�[�@�ӿﶵ�A�ڭn�i�J�ڪ��Ы�
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SC_FURNITUESHOP") , "LuaS_ComShop_1",    0 ) 		--�W�[�@�ӿﶵ�A�ڭn�ʶR�򥻮a��
	end
	if LuaFunc_CountJobNumber() > 1 then
		AddSpeakOption( OwnerID(), TargetID(), "[SO_110581_1]" , "LuaS_110581_1",0 );	--�W�[�@�ӿﶵ�A�ڷQ�ഫ�D��¾
	end
	--AddSpeakOption( OwnerID(), TargetID(),  GetString("SC_ACCOUNTBAG") , "LuaS_AccountBag",    0 )		--�W�[�@�ӿﶵ�A�ڭn���^�ЫΪ����~
	AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_VISITHOME") ,  "LuaS_110752_HomeVISIT",    0 );	--�W�[�@�ӿﶵ�A�ڭn���[�O�H���Ы�
	AddSpeakOption( OwnerID(), TargetID(),  GetString("SC_HOUSEBANK") , "LuaS_110773_HomeBANK",    0 ) 		--�W�[�@�ӿﶵ�A�ڭn�}�һȦ�
	AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_WHATHOME"),              "LuaS_110752_HomeINTRO", 0 );	--�W�[�@�ӿﶵ�A�ЫάO����H
end



function LuaS_110752_HomeBUY()
	CloseSpeak( OwnerID() );	--������ܵ���
	BeginPlot(TargetID() , "LuaS_110752_HomeBUY_Dialog" , 0 )
end

function LuaS_110752_HomeEnter()
	CloseSpeak( OwnerID() );	--������ܵ���
	Sys_HouseVisit_MyHouse_Open()	
end

function LuaS_AccountBag()
	CloseSpeak( OwnerID() );	--������ܵ���
	OpenAccountBag()
end

function Read_Role_Money( RoleID )
	local money  = ReadRoleValue( RoleID, EM_RoleValue_Money )
	return money
end

function Role_MoneyChange( RoleID , MoneyChange )
	local money  = Read_Role_Money( RoleID )
	money = money + MoneyChange
	WriteRoleValue( RoleID , EM_RoleValue_Money , money )
end

function Read_Role_HomeNumber( RoleID )
	return ReadRoleValue( RoleID , EM_RoleValue_HouseDBID )
end

function LuaS_110752_HomeBUY_Dialog()



	if true then--( CountBodyItem( TargetID() , 201383 ) < 1 ) then
		Tell( TargetID() , OwnerID() , GetString("SO_GIVEHOMETALK5") )	-- �o�O�ӽЩЫΧY�i�֦���20��m���c�A�Ц��U�A�n�O�o�N���\���ЫΤ���I
		GiveBodyItem ( TargetID() , 201383 , 1 )	-- 20��m���c
	end
	Tell ( TargetID() , OwnerID() , GetString("SO_GIVEHOME") );	-- �n���A�ڰ��W���A��z�ӽСA�еy����
	local Ret = BuildHouse( TargetID() , 575523 );

	if( Ret == false ) then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SO_NOBUILDHOME") , 0 )		-- "�L�k�ӽЩЫΡI�I
	end

	PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_BEGIN );
	Sleep( 60 )
	PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_END );

	local homenumber = Read_Role_HomeNumber( TargetID() )
	if ( homenumber ~= -1 ) then
		local homenumber_text = string.format( "%06d", homenumber  );
		local String ="[SO_GIVEHOMEOK][$SETVAR1="..homenumber_text.."]"
		Tell( TargetID() , OwnerID() ,String )		-- �ӽФw�g�����A�A���ЫΪ��P���X�O
	else
		Tell( TargetID() , OwnerID() , GetString("SO_NOBUILDHOME") )	-- "�L�k�ӽЩЫΡI�I
	end

	Sleep( 5 )
end

function LuaS_110752_HomeVISIT()
	-- ScriptMessage( OwnerID(), TargetID(), 0, "�ڭn���[�X�ݧO�H���ЫΡI", 0 )
	CloseSpeak( OwnerID() );	--������ܵ���
	local Obj = Role:new( OwnerID() );
	local Ret = SaveReturnPos( OwnerID() , Obj:ZoneID() , Obj:X() , Obj:Y() , Obj:Z() , Obj:Dir() );
	if( Ret == false ) then
		Tell( OwnerID() , TargetID() , "���B����]�w�^���I" );
		return;
	end
	OpenVisitHouse( false );
end

function LuaS_110752_HomeINTRO()
	SetSpeakDetail( OwnerID(), GetString("SO_HOMEINTRO") )	--�ЫάO���C�H���i�H�ӽ��ʶR���@�Өp�H�Ŷ��C\n\n�b�o�ӪŶ��̫ΥD�i�H�ۥѵo���зN���\\�]�U�خa��A�ӥB���ǵ}�����a���ٷ|���ΥD�a�Ӧ��q���ĪG�C\n\n�ҥH�A�֦��@���ЫΡA�b�o�ӥ@�ɬO�D�`���n�ӥB���n���@��ơC\n\n�C�@���Ыγ����@�Ӥ����ƪ��u���P���X�v�A�Y�O�A�Q���[�O�H���ЫΡA�u�n��ڹ�ܡA��ܡu�ڭn���[�X�ݧO�H���ЫΡv�A�����J�Q���[�ЫΪ����P���X�Y�i�C\n\n���L�n�`�N���O�A�Y�O�A���[���ЫΫΥD���]�w�u���T�K�X�v�A�A�ٻݭn��J���T�����T�K�X�~���i�J�C
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_BACK") , "LuaS_110752", 0 );	--�^�W�@��
end

function LuaFunc_FurnitureShop()
   	SetShop( OwnerID() ,600112, "Test_Shop_Close" );
end
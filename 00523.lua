function LuaS_110773()
	-- �Y�n�ק惡�B�ЫΤp�ѨϪ��\��A�·гs702235���@�ýT�{�ק�A�P�¡I
	LoadQuestOption( OwnerID() )	-- ���J���ȼҪO

	local homenumber = Read_Role_HomeNumber( OwnerID() )

	if ( CountBodyItem( OwnerID() , 201291 ) >= 1 ) then
		AddSpeakOption( OwnerID() , TargetID() , GetString("SO_HOMEFT_GIVE") , "LuaS_HomeFT_Give" , 0 )	-- �W�[�@�ӿﶵ�G�ڦ��a��I����A�ڷQ�I���I
	end

	if ( homenumber == -1 ) then
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_BUYHOME") ,      "LuaS_110773_HomeBUY",     0 );	--�W�[�@�ӿﶵ�A�ڭn�ӽФ@���Ы�
	else
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_ENTERHOME") , "LuaS_110773_HomeEnter",     0 )	--�W�[�@�ӿﶵ�A�ڭn�i�J�ڪ��Ы�
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_VISITHOME") , "LuaS_110773_HomeVISIT",    0 )		--�W�[�@�ӿﶵ�A�ڭn���[�X�ݧO�H���Ы�
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SC_FURNITUESHOP") , "LuaS_ComShop_1",    0 ) 		--�W�[�@�ӿﶵ�A�ڭn�ʶR�򥻮a��
	end
	if LuaFunc_CountJobNumber() > 1 then
		AddSpeakOption( OwnerID(), TargetID(), "[SO_110581_1]" , "LuaS_110581_1",0 );	--�W�[�@�ӿﶵ�A�ڷQ�ഫ�D��¾
	end
	--AddSpeakOption( OwnerID(), TargetID(),  GetString("SC_ACCOUNTBAG") , "LuaS_AccountBag",    0 )		--�W�[�@�ӿﶵ�A�ڭn���^�ЫΪ����~
	AddSpeakOption( OwnerID(), TargetID(),  GetString("SC_HOUSEBANK") , "LuaS_110773_HomeBANK",    0 ) 		--�W�[�@�ӿﶵ�A�ڭn�}�һȦ�
	AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_WHATHOME") , "LuaS_110773_HomeINTRO", 0 )		--�W�[�@�ӿﶵ�A�ЫάO����H

end
function LuaS_110773_HomeBUY()
	CloseSpeak( OwnerID() );	--������ܵ���
	BeginPlot( TargetID() , "LuaS_110773_HomeBUY_Dialog" , 0 )
end

function LuaS_110773_HomeBANK()
	CloseSpeak( OwnerID() );	--������ܵ���
	Sys_Bank_Open()
end

function LuaS_110773_HomeEnter()
	CloseSpeak( OwnerID() );	--������ܵ���
	Sys_HouseVisit_MyHouse_Open()	
end

function LuaS_110773_HomeBUY_Dialog()

	if true then--( CountBodyItem( TargetID() , 201383 ) < 1 ) then
		Tell( TargetID() , OwnerID() , GetString("SO_GIVEHOMETALKMAID5") )	-- �o�O�ӽЩЫΧY�i�֦���20��m���c�A�Ц��U�A�D�H�n�O�o�N���\���ЫΤ���I
		GiveBodyItem ( TargetID() , 201383 , 1 )	-- 20��m���c
	end

	Tell( TargetID() , OwnerID() , GetString("SO_GIVEHOMEMAID") )	-- �n���A�ڰ��W���A��z�ӽСA�D�H�еy����
	local Ret = BuildHouse( TargetID() , 575523 );
	SetFlag( TargetID()  , 542670, 1 )  --���X��
	if( Ret == false ) then
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
		local Str = "[SO_GIVEHOMEOKMAID][$SETVAR1="..homenumber_text .."]"
		Tell( TargetID() , OwnerID() , Str )	-- �ӽФw�g�����A�D�H�A���ЫΪ��P���X�O
	else
		Tell( TargetID() , OwnerID() , GetString("SO_NOBUILDHOME") )	-- "�L�k�ӽЩЫΡI�I
	end
	Sleep( 5 )

end

function LuaS_110773_HomeVISIT()
	CloseSpeak( OwnerID() );	--������ܵ���
	local Obj = Role:new( OwnerID() );
	local Ret = SaveReturnPos( OwnerID() , Obj:ZoneID() , Obj:X() , Obj:Y() , Obj:Z() , Obj:Dir() );
	if( Ret == false ) then
		--Tell( OwnerID() , TargetID() , "���B����]�w�^���I" );
		return;
	end
	OpenVisitHouse( false );
end

function LuaS_110773_HomeINTRO()
	SetSpeakDetail( OwnerID(), GetString("SO_HOMEINTRO") )	--�ЫάO���C�H���i�H�ӽЪ��@�Өp�H�Ŷ��C\n\n�b�o�ӪŶ��̫ΥD�i�H�ۥѵo���зN���\\�]�U�خa��A�ӥB���ǵ}�����a���ٷ|���ΥD�a�Ӧ��q���ĪG�C\n\n�ҥH�A�֦��@���ЫΡA�b�o�ӥ@�ɬO�D�`���n�ӥB���n���@��ơC\n\n�C�@���Ыγ����@�Ӥ����ƪ��u���P���X�v�A�Y�O�A�Q���[�O�H���ЫΡA�u�n��ڹ�ܡA��ܡu�ڭn���[�X�ݧO�H���ЫΡv�A�����J�Q���[�ЫΪ����P���X�Y�i�C\n\n���L�n�`�N���O�A�Y�O�A���[���ЫΫΥD���]�w�u���T�K�X�v�A�A�ٻݭn��J���T�����T�K�X�~���i�J�C
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_BACK") , "LuaS_110773", 0 );	--�^�W�@��
end

function LuaS_HomeFT_Give()
	CloseSpeak( OwnerID() )			-- ������ܵ���
	delBodyItem (OwnerID() , 201291 , 1 )
	local FT1 = ""
	local FT2 = ""

	local RND = Rand( 99 ) + 1	-- ���� 1~100 ���ü�
	    if ( RND > 0 and RND <= 30 ) then
		GiveBodyItem ( OwnerID() , 201295 , 1 )	-- �����@²�K���( ���v 30/100 )
		FT1 = GetString("SO_DRAWFT01")
	elseif ( RND > 30 and RND <= 55 ) then
		GiveBodyItem ( OwnerID() , 201296 , 1 )	-- ����@²�K���( ���v 25/100 )
		FT1 = GetString("SO_DRAWFT02")
	elseif ( RND > 55 and RND <= 75 ) then
		GiveBodyItem ( OwnerID() , 201297 , 1 )	-- �|���@²�K�a��( ���v 20/100 )
		FT1 = GetString("SO_DRAWFT03")
	elseif ( RND > 75 and RND <= 85 ) then
		GiveBodyItem ( OwnerID() , 201298 , 1 )	-- �T���@²�K���d( ���v 10/100 )
		FT1 = GetString("SO_DRAWFT04")
	elseif ( RND > 85 and RND <= 95 ) then
		GiveBodyItem ( OwnerID() , 201299 , 1 )	-- �G���@²�K���( ���v 10/100 )
		FT1 = GetString("SO_DRAWFT05")
	elseif ( RND > 95 and RND <= 100 ) then
		GiveBodyItem ( OwnerID() , 201300 , 1 )	-- �@���@²�K�_�c( ���v 5/100 )
		FT1 = GetString("SO_DRAWFT06")
	end
	local RND2 = Rand( 99 ) + 1	-- ���� 1~100 ���ü�
	    if ( RND2 > 0 and RND2 <= 30 ) then
		GiveBodyItem ( OwnerID() , 201295 , 1 )	-- �����@²�K���( ���v 30/100 )
		FT2 = GetString("SO_DRAWFT01")
	elseif ( RND2 > 30 and RND2 <= 55 ) then
		GiveBodyItem ( OwnerID() , 201296 , 1 )	-- ����@²�K���( ���v 25/100 )
		FT2 = GetString("SO_DRAWFT02")
	elseif ( RND2 > 55 and RND2 <= 75 ) then
		GiveBodyItem ( OwnerID() , 201297 , 1 )	-- �|���@²�K�a��( ���v 20/100 )
		FT2 = GetString("SO_DRAWFT03")
	elseif ( RND2 > 75 and RND2 <= 85 ) then
		GiveBodyItem ( OwnerID() , 201298 , 1 )	-- �T���@²�K���d( ���v 10/100 )
		FT2 = GetString("SO_DRAWFT04")
	elseif ( RND2 > 85 and RND2 <= 95 ) then
		GiveBodyItem ( OwnerID() , 201299 , 1 )	-- �G���@²�K���( ���v 10/100 )
		FT2 = GetString("SO_DRAWFT05")
	elseif ( RND2 > 95 and RND2 <= 100 ) then
		GiveBodyItem ( OwnerID() , 201300 , 1 )	-- �@���@²�K�_�c( ���v 5/100 )
		FT2 = GetString("SO_DRAWFT06")
	end
		local Str = "[SO_HOMEFT_STR1][$SETVAR1="..FT1.."][$SETVAR2="..FT2.."]"
		Tell( OwnerID() , TargetID() , Str)
end

function LuaFunc_CountJobNumber()
	local JCount = 0

	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Warrior ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Ranger ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Rogue ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Wizard ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Priest ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Knight ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_RuneDancer ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Druid ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_HARPSYN ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_PSYRON ) > 0 then
		JCount = JCount + 1
	end
	return JCount 
end

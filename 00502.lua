function LuaI_East_EnterHomeA()
	--SetPlot( OwnerID() , "collision" , "LuaS_East_EnterHomeA" , 0 )
end

function LuaS_East_EnterHomeA()	-- �Z��R�����U�F�϶ǥΪ��i�Ы�A
	local homenumber = Read_Role_HomeNumber( OwnerID() )
	-- ScriptMessage( OwnerID(), OwnerID(), 0, "�@�A���ЫΡA���P���X�O"..homenumber , 0 )
	if  ( homenumber == -1 ) then		-- �S���ЫΡA�S����

	else
		local Obj = Role:new( OwnerID() )
		local Ret = SaveReturnPos( OwnerID() , Obj:ZoneID() , 5020 , 53+1 , 285 , 135 )
		if( Ret == false ) then
			Tell( OwnerID() , TargetID() , "���B����]�w�^���I" )
			return
		end
		OpenVisitHouse( true )
	end
end

function LuaI_East_EnterHomeB()
	--SetPlot( OwnerID() , "collision" , "LuaS_Guild_House_EnterTouch" , 65 )
end

function LuaS_East_EnterHomeB()	-- �Z��R�����U�F�϶ǥΪ��i�Ы�B
	local homenumber = Read_Role_HomeNumber( OwnerID() )
	-- ScriptMessage( OwnerID(), OwnerID(), 0, "�@�A���ЫΡA���P���X�O"..homenumber , 0 )
	if  ( homenumber == -1 ) then		-- �S���ЫΡA�S����

	else
		local Obj = Role:new( OwnerID() )
		local Ret = SaveReturnPos( OwnerID() , Obj:ZoneID() , 4960 , 53+1 , 380 , 135 )
		if( Ret == false ) then
			Tell( OwnerID() , TargetID() , "���B����]�w�^���I" )
			return
		end
		OpenVisitHouse( true )
	end
end

function LuaI_West_EnterHomeA()
	--SetPlot( OwnerID() , "collision" , "LuaS_Guild_House_EnterTouch" , 65 )
end

function LuaS_West_EnterHomeA()	-- �Z��R�����U�F�϶ǥΪ��i�Ы�A
	local homenumber = Read_Role_HomeNumber( OwnerID() )
	-- ScriptMessage( OwnerID(), OwnerID(), 0, "�@�A���ЫΡA���P���X�O"..homenumber , 0 )
	if  ( homenumber == -1 ) then		-- �S���ЫΡA�S����

	else
		local Obj = Role:new( OwnerID() )
		local Ret = SaveReturnPos( OwnerID() , Obj:ZoneID() , 2525 , 53+1 , -1495 , 315 )
		if( Ret == false ) then
			Tell( OwnerID() , TargetID() , "���B����]�w�^���I" )
			return
		end
		OpenVisitHouse( true )
	end
end

function LuaI_West_EnterHomeB()
	--SetPlot(OwnerID(),"collision" , "LuaS_Guild_House_EnterTouch" , 65 �^
end

function LuaS_West_EnterHomeB()	-- �Z��R�����U�F�϶ǥΪ��i�Ы�B
	local homenumber = Read_Role_HomeNumber( OwnerID() )
	-- ScriptMessage( OwnerID(), OwnerID(), 0, "�@�A���ЫΡA���P���X�O"..homenumber , 0 )
	if  ( homenumber == -1 ) then		-- �S���ЫΡA�S����

	else
		local Obj = Role:new( OwnerID() )
		local Ret = SaveReturnPos( OwnerID() , Obj:ZoneID() , 2460 , 53+1 , -1395 , 315 )
		if( Ret == false ) then
			Tell( OwnerID() , TargetID() , "���B����]�w�^���I" )
			return
		end
		OpenVisitHouse( true )
	end
end

function LuaS_HomeFT()
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	if ( CountBodyItem( OwnerID() , 201291 ) >= 1 ) then
		AddSpeakOption( OwnerID() , TargetID() , GetString("SO_HOMEFT_GIVE") , "LuaS_HomeFT_Draw" , 0 )	-- �W�[�@�ӿﶵ�G�ڦ��a��I����A�ڷQ�I���I
	end
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_OPENSHOP") , "LuaS_HomeFT_OpenShop" , 0 )	-- �W�[�@�ӿﶵ�G�}�Ұө�
end
function LuaS_HomeFT_OpenShop()	-- �a��ӤH�@��}�ө�
	CloseSpeak( OwnerID() )		-- ������ܵ���
	OpenShop()			-- ���}�ө�
end
function LuaS_HomeFT_Draw()	-- �a��ӤH�@��}�ө�
	CloseSpeak( OwnerID() )			-- ������ܵ���
	delBodyItem (OwnerID() , 201291 , 1 )
	local FT1 = ""
	local FT2 = ""
	local String = ""

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
	String = "[SO_HOMEFT_STR1][$SETVAR1="..FT1.."][$SETVAR2="..FT2.."]"
		Tell( OwnerID() , TargetID() , String)
end

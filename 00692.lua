function LuaI_BOSSPASS_1()--�i�ê��g���l�@��
	SetPlot( OwnerID() , "Range" , "BOSSPASSSWORD_A" , 50 )
	CastSpell( OwnerID(),OwnerID(), 574409)  -- �X�ͫ����ۤv�W�S���]�k
end

function LuaI_BOSSPASS_2()
	SetPlot( OwnerID() , "Range" , "BOSSPASSSWORD_B" , 200 )
end

function LuaI_BOSSPASS_3()
	SetPlot( OwnerID() , "Range" , "BOSSPASSSWORD_C" , 200 )
end

function BOSSPASSSWORD_A()
	if CheckFlag( OwnerID()  , 541121 ) == false then --/*�ˬd�O�_���L�u�g��
		if CountBodyItem( OwnerID() , 202006 ) > 0 then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_BOSSPASSSWORD_1"), 0 ); --/*���ݱ������@�P�����ʵۡA�o����@�w�����ݻs�~�C
		end
	end
end
function BOSSPASSSWORD_B()
	if CheckFlag( OwnerID()  , 541121 ) == false then --/*�ˬd�O�_���L�u�g��
		if CountBodyItem( OwnerID() , 202006 ) > 0 then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_BOSSPASSSWORD_2"), 0 ); --/*���ݱ������o�X�@�諸����n�A�ݨӪ��ݻs�~���A�����F�C
		end
	end
end
function BOSSPASSSWORD_C()
	if CheckFlag( OwnerID()  , 541121 ) == false then --/*�ˬd�O�_���L�u�g��
		if CountBodyItem( OwnerID() , 202006 ) > 0 then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_BOSSPASSSWORD_3"), 0 ); --/*���ݱ��������L��Ÿ�ݵۡA���ӬO�w�g�����컷�誺���ݡC
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaI_BOSSPASS1_1()--�i�ê��g��2��l�@��
	SetPlot( OwnerID() , "Range" , "BOSSPASSSWORD1_A" , 50 )
	CastSpell( OwnerID(),OwnerID(), 574409)  -- �X�ͫ����ۤv�W�S���]�k
end

function LuaI_BOSSPASS1_2()
	SetPlot( OwnerID() , "Range" , "BOSSPASSSWORD1_B" , 200 )
end

function LuaI_BOSSPASS1_3()
	SetPlot( OwnerID() , "Range" , "BOSSPASSSWORD1_C" , 200 )
end

function BOSSPASSSWORD1_A()
	if CheckFlag( OwnerID()  , 541122 ) == false then --/*�ˬd�O�_���L���g��
		if CountBodyItem( OwnerID() , 202006 ) > 0 then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_BOSSPASSSWORD_1"), 0 ); --/*���ݱ������@�P�����ʵۡA�o����@�w�����ݻs�~�C
		end
	end
end
function BOSSPASSSWORD1_B()
	if CheckFlag( OwnerID()  , 541122 ) == false then --/*�ˬd�O�_���L���g��
		if CountBodyItem( OwnerID() , 202006 ) > 0 then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_BOSSPASSSWORD_2"), 0 ); --/*���ݱ������o�X�@�諸����n�A�ݨӪ��ݻs�~���A�����F�C
		end
	end
end
function BOSSPASSSWORD1_C()
	if CheckFlag( OwnerID()  , 541122 ) == false then --/*�ˬd�O�_���L���g��
		if CountBodyItem( OwnerID() , 202006 ) > 0 then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_BOSSPASSSWORD_3"), 0 ); --/*���ݱ��������L��Ÿ�ݵۡA���ӬO�w�g�����컷�誺���ݡC
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaI_BOSSPASS2_1()--�i�ê��g��3��l�@��
	SetPlot( OwnerID() , "Range" , "BOSSPASSSWORD2_A" , 50 )
	CastSpell( OwnerID(),OwnerID(), 574409)  -- �X�ͫ����ۤv�W�S���]�k
end

function LuaI_BOSSPASS2_2()
	SetPlot( OwnerID() , "Range" , "BOSSPASSSWORD2_B" , 200 )
end

function LuaI_BOSSPASS2_3()
	SetPlot( OwnerID() , "Range" , "BOSSPASSSWORD2_C" , 200 )
end

function BOSSPASSSWORD2_A()
	if CheckFlag( OwnerID()  , 541123 ) == false then --/*�ˬd�O�_���L���g��
		if CountBodyItem( OwnerID() , 202006 ) > 0 then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_BOSSPASSSWORD_1"), 0 ); --/*���ݱ������@�P�����ʵۡA�o����@�w�����ݻs�~�C
		end
	end
end
function BOSSPASSSWORD2_B()
	if CheckFlag( OwnerID()  , 541123 ) == false then --/*�ˬd�O�_���L���g��
		if CountBodyItem( OwnerID() , 202006 ) > 0 then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_BOSSPASSSWORD_2"), 0 ); --/*���ݱ������o�X�@�諸����n�A�ݨӪ��ݻs�~���A�����F�C
		end
	end
end
function BOSSPASSSWORD2_C()
	if CheckFlag( OwnerID()  , 541123 ) == false then --/*�ˬd�O�_���L���g��
		if CountBodyItem( OwnerID() , 202006 ) > 0 then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_BOSSPASSSWORD_3"), 0 ); --/*���ݱ��������L��Ÿ�ݵۡA���ӬO�w�g�����컷�誺���ݡC
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function BOSSPASSGOD()
	local ClickObj = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	if ( ClickObj == 111029 ) then
		SetFlag( OwnerID()  , 541121 , 1 )
		return true
	elseif ( ClickObj == 111076 ) then
		SetFlag( OwnerID()  , 541122 , 1 )
		return true
	elseif ( ClickObj == 111077 ) then
		SetFlag( OwnerID()  , 541123 , 1 )
		return true
	end
end

----------------�뺸�S�D�ͨغ�
function LuaS_111532_0()
LoadQuestOption( OwnerID() )
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_DIALOG1") , "LuaS_111490_1", 0 ) --�ڷQ�F�ѫn�ʸ`���Ѩ�
local BuffType = 0
local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
			BuffType = GameObjInfo_int ( BuffID , "AssistType" )
			break
		end
	end
	if BuffType == 58 then		--/*���ܨ��X�{��ܿﶵ
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111532_1", 0 ) --�����}�A�N�o�J�I
	end
end
function LuaS_111532_1()
	if CheckFlag( OwnerID()  , 542135 ) == false then --/*�ˬd�O�_���L
		SetFlag( OwnerID()  , 542135 , 1 )	--/*���L���X��
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*���}�G
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--�~���ڤF�I���ꪺ�u�����A�o�ӿ}�G���A�I
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--�A���Ѥw�g���L�}�G�F�I���ѦA�ӧa�I
	end
end
----------------�뺸�S�D�ͮ���
function LuaS_111533_0()
LoadQuestOption( OwnerID() )
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_DIALOG1") , "LuaS_111490_1", 0 ) --�ڷQ�F�ѫn�ʸ`���Ѩ�
local BuffType = 0
local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
			BuffType = GameObjInfo_int ( BuffID , "AssistType" )
			break
		end
	end
	if BuffType == 58 then		--/*���ܨ��X�{��ܿﶵ
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111533_1", 0 ) --�����}�A�N�o�J�I
	end
end
function LuaS_111533_1()
	if CheckFlag( OwnerID()  , 542136 ) == false then --/*�ˬd�O�_���L
		SetFlag( OwnerID()  , 542136 , 1 )	--/*���L���X��
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*���}�G
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--�~���ڤF�I���ꪺ�u�����A�o�ӿ}�G���A�I
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--�A���Ѥw�g���L�}�G�F�I���ѦA�ӧa�I
	end
end
----------------�뺸�S�D�����Q
function LuaS_111534_0()
LoadQuestOption( OwnerID() )
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_DIALOG1") , "LuaS_111490_1", 0 ) --�ڷQ�F�ѫn�ʸ`���Ѩ�
local BuffType = 0
local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
			BuffType = GameObjInfo_int ( BuffID , "AssistType" )
			break
		end
	end
	if BuffType == 58 then		--/*���ܨ��X�{��ܿﶵ
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111534_1", 0 ) --�����}�A�N�o�J�I
	end
end
function LuaS_111534_1()
	if CheckFlag( OwnerID()  , 542137 ) == false then --/*�ˬd�O�_���L
		SetFlag( OwnerID()  , 542137 , 1 )	--/*���L���X��
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*���}�G
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--�~���ڤF�I���ꪺ�u�����A�o�ӿ}�G���A�I
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--�A���Ѥw�g���L�}�G�F�I���ѦA�ӧa�I
	end
end
----------------�뺸�S�D�򴶪L
function LuaS_111535_0()
LoadQuestOption( OwnerID() )
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_DIALOG1") , "LuaS_111490_1", 0 ) --�ڷQ�F�ѫn�ʸ`���Ѩ�
local BuffType = 0
local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
			BuffType = GameObjInfo_int ( BuffID , "AssistType" )
			break
		end
	end
	if BuffType == 58 then		--/*���ܨ��X�{��ܿﶵ
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111535_1", 0 ) --�����}�A�N�o�J�I
	end
end
function LuaS_111535_1()
	if CheckFlag( OwnerID()  , 542138 ) == false then --/*�ˬd�O�_���L
		SetFlag( OwnerID()  , 542138 , 1 )	--/*���L���X��
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*���}�G
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--�~���ڤF�I���ꪺ�u�����A�o�ӿ}�G���A�I
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--�A���Ѥw�g���L�}�G�F�I���ѦA�ӧa�I
	end
end
----------------�뺸�S�D��S
function LuaS_111536_0()
LoadQuestOption( OwnerID() )
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_DIALOG1") , "LuaS_111490_1", 0 ) --�ڷQ�F�ѫn�ʸ`���Ѩ�
local BuffType = 0
local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
			BuffType = GameObjInfo_int ( BuffID , "AssistType" )
			break
		end
	end
	if BuffType == 58 then		--/*���ܨ��X�{��ܿﶵ
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111536_1", 0 ) --�����}�A�N�o�J�I
	end
end
function LuaS_111536_1()
	if CheckFlag( OwnerID()  , 542139 ) == false then --/*�ˬd�O�_���L
		SetFlag( OwnerID()  , 542139 , 1 )	--/*���L���X��
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*���}�G
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--�~���ڤF�I���ꪺ�u�����A�o�ӿ}�G���A�I
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--�A���Ѥw�g���L�}�G�F�I���ѦA�ӧa�I
	end
end
----------------�뺸�S�D��
function LuaS_111537_0()
LoadQuestOption( OwnerID() )
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_DIALOG1") , "LuaS_111490_1", 0 ) --�ڷQ�F�ѫn�ʸ`���Ѩ�
local BuffType = 0
local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
			BuffType = GameObjInfo_int ( BuffID , "AssistType" )
			break
		end
	end
	if BuffType == 58 then		--/*���ܨ��X�{��ܿﶵ
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111537_1", 0 ) --�����}�A�N�o�J�I
	end
end
function LuaS_111537_1()
	if CheckFlag( OwnerID()  , 542140 ) == false then --/*�ˬd�O�_���L
		SetFlag( OwnerID()  , 542140 , 1 )	--/*���L���X��
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*���}�G
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--�~���ڤF�I���ꪺ�u�����A�o�ӿ}�G���A�I
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--�A���Ѥw�g���L�}�G�F�I���ѦA�ӧa�I
	end
end
----------------�뺸�S�D��
function LuaS_111538_0()
LoadQuestOption( OwnerID() )
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_DIALOG1") , "LuaS_111490_1", 0 ) --�ڷQ�F�ѫn�ʸ`���Ѩ�
local BuffType = 0
local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
			BuffType = GameObjInfo_int ( BuffID , "AssistType" )
			break
		end
	end
	if BuffType == 58 then		--/*���ܨ��X�{��ܿﶵ
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111538_1", 0 ) --�����}�A�N�o�J�I
	end
end
function LuaS_111538_1()
	if CheckFlag( OwnerID()  , 542141 ) == false then --/*�ˬd�O�_���L
		SetFlag( OwnerID()  , 542141 , 1 )	--/*���L���X��
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*���}�G
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--�~���ڤF�I���ꪺ�u�����A�o�ӿ}�G���A�I
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--�A���Ѥw�g���L�}�G�F�I���ѦA�ӧa�I
	end
end
----------------�뺸�S�D���i
function LuaS_111539_0()
LoadQuestOption( OwnerID() )
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_DIALOG1") , "LuaS_111490_1", 0 ) --�ڷQ�F�ѫn�ʸ`���Ѩ�
local BuffType = 0
local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if GameObjInfo_int ( BuffID , "AssistType" ) == 58 then
			BuffType = GameObjInfo_int ( BuffID , "AssistType" )
			break
		end
	end
	if BuffType == 58 then		--/*���ܨ��X�{��ܿﶵ
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111539_1", 0 ) --�����}�A�N�o�J�I
	end
end
function LuaS_111539_1()
	if CheckFlag( OwnerID()  , 542142 ) == false then --/*�ˬd�O�_���L
		SetFlag( OwnerID()  , 542142 , 1 )	--/*���L���X��
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*���}�G
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--�~���ڤF�I���ꪺ�u�����A�o�ӿ}�G���A�I
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--�A���Ѥw�g���L�}�G�F�I���ѦA�ӧa�I
	end
end
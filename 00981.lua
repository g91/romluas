----------------�뺸�S�D�ԧB
function LuaS_111540_0()
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
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111540_1", 0 ) --�����}�A�N�o�J�I
	end
end
function LuaS_111540_1()
	if CheckFlag( OwnerID()  , 542143 ) == false then --/*�ˬd�O�_���L
		SetFlag( OwnerID()  , 542143 , 1 )	--/*���L���X��
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*���}�G
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--�~���ڤF�I���ꪺ�u�����A�o�ӿ}�G���A�I
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--�A���Ѥw�g���L�}�G�F�I���ѦA�ӧa�I
	end
end
----------------�뺸�S�D�������S
function LuaS_111541_0()
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
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111541_1", 0 ) --�����}�A�N�o�J�I
	end
end
function LuaS_111541_1()
	if CheckFlag( OwnerID()  , 542144 ) == false then --/*�ˬd�O�_���L
		SetFlag( OwnerID()  , 542144 , 1 )	--/*���L���X��
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*���}�G
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--�~���ڤF�I���ꪺ�u�����A�o�ӿ}�G���A�I
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--�A���Ѥw�g���L�}�G�F�I���ѦA�ӧa�I
	end
end
----------------�뺸�S�D���n
function LuaS_111542_0()
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
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111542_1", 0 ) --�����}�A�N�o�J�I
	end
end
function LuaS_111542_1()
	if CheckFlag( OwnerID()  , 542145 ) == false then --/*�ˬd�O�_���L
		SetFlag( OwnerID()  , 542145 , 1 )	--/*���L���X��
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*���}�G
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--�~���ڤF�I���ꪺ�u�����A�o�ӿ}�G���A�I
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--�A���Ѥw�g���L�}�G�F�I���ѦA�ӧa�I
	end
end
----------------�뺸�S�D�Ԫ�
function LuaS_111543_0()
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
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111543_1", 0 ) --�����}�A�N�o�J�I
	end
end
function LuaS_111543_1()
	if CheckFlag( OwnerID()  , 542146 ) == false then --/*�ˬd�O�_���L
		SetFlag( OwnerID()  , 542146 , 1 )	--/*���L���X��
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*���}�G
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--�~���ڤF�I���ꪺ�u�����A�o�ӿ}�G���A�I
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--�A���Ѥw�g���L�}�G�F�I���ѦA�ӧa�I
	end
end
----------------�뺸�S�D�ҭ۴�
function LuaS_111544_0()
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
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111544_1", 0 ) --�����}�A�N�o�J�I
	end
end
function LuaS_111544_1()
	if CheckFlag( OwnerID()  , 542147 ) == false then --/*�ˬd�O�_���L
		SetFlag( OwnerID()  , 542147 , 1 )	--/*���L���X��
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*���}�G
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--�~���ڤF�I���ꪺ�u�����A�o�ӿ}�G���A�I
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--�A���Ѥw�g���L�}�G�F�I���ѦA�ӧa�I
	end
end
----------------�뺸�S�D���
function LuaS_111525_0()
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
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111525_1", 0 ) --�����}�A�N�o�J�I
	end
end
function LuaS_111525_1()
	if CheckFlag( OwnerID()  , 542128 ) == false then --/*�ˬd�O�_���L
		SetFlag( OwnerID()  , 542128 , 1 )	--/*���L���X��
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*���}�G
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--�~���ڤF�I���ꪺ�u�����A�o�ӿ}�G���A�I
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--�A���Ѥw�g���L�}�G�F�I���ѦA�ӧa�I
	end
end
----------------�뺸�S�D�ͧQ
function LuaS_111526_0()
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
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111526_1", 0 ) --�����}�A�N�o�J�I
	end
end
function LuaS_111526_1()
	if CheckFlag( OwnerID()  , 542129 ) == false then --/*�ˬd�O�_���L
		SetFlag( OwnerID()  , 542129 , 1 )	--/*���L���X��
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*���}�G
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--�~���ڤF�I���ꪺ�u�����A�o�ӿ}�G���A�I
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--�A���Ѥw�g���L�}�G�F�I���ѦA�ӧa�I
	end
end
----------------�뺸�S�D�ͬ���
function LuaS_111527_0()
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
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111527_1", 0 ) --�����}�A�N�o�J�I
	end
end
function LuaS_111527_1()
	if CheckFlag( OwnerID()  , 542130 ) == false then --/*�ˬd�O�_���L
		SetFlag( OwnerID()  , 542130 , 1 )	--/*���L���X��
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*���}�G
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--�~���ڤF�I���ꪺ�u�����A�o�ӿ}�G���A�I
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--�A���Ѥw�g���L�}�G�F�I���ѦA�ӧa�I
	end
end
----------------�뺸�S�D�ͺ���
function LuaS_111528_0()
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
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111528_1", 0 ) --�����}�A�N�o�J�I
	end
end
function LuaS_111528_1()
	if CheckFlag( OwnerID()  , 542131 ) == false then --/*�ˬd�O�_���L
		SetFlag( OwnerID()  , 542131 , 1 )	--/*���L���X��
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*���}�G
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--�~���ڤF�I���ꪺ�u�����A�o�ӿ}�G���A�I
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--�A���Ѥw�g���L�}�G�F�I���ѦA�ӧa�I
	end
end
----------------�뺸�S�D�ͺ���
function LuaS_111529_0()
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
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111529_1", 0 ) --�����}�A�N�o�J�I
	end
end
function LuaS_111529_1()
	if CheckFlag( OwnerID()  , 542132 ) == false then --/*�ˬd�O�_���L
		SetFlag( OwnerID()  , 542132 , 1 )	--/*���L���X��
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*���}�G
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--�~���ڤF�I���ꪺ�u�����A�o�ӿ}�G���A�I
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--�A���Ѥw�g���L�}�G�F�I���ѦA�ӧa�I
	end
end
----------------�뺸�S�D�ͫn
function LuaS_111530_0()
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
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111530_1", 0 ) --�����}�A�N�o�J�I
	end
end
function LuaS_111530_1()
	if CheckFlag( OwnerID()  , 542133 ) == false then --/*�ˬd�O�_���L
		SetFlag( OwnerID()  , 542133 , 1 )	--/*���L���X��
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*���}�G
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--�~���ڤF�I���ꪺ�u�����A�o�ӿ}�G���A�I
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--�A���Ѥw�g���L�}�G�F�I���ѦA�ӧa�I
	end
end
----------------�뺸�S�D�֥��}
function LuaS_111531_0()
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
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_TRICK_OR_TREAT") , "LuaS_111531_1", 0 ) --�����}�A�N�o�J�I
	end
end
function LuaS_111531_1()
	if CheckFlag( OwnerID()  , 542134 ) == false then --/*�ˬd�O�_���L
		SetFlag( OwnerID()  , 542134 , 1 )	--/*���L���X��
		GiveBodyItem( OwnerID() , 203078 , 1 )	--/*���}�G
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_DIALOG")   )--�~���ڤF�I���ꪺ�u�����A�o�ӿ}�G���A�I
	else
		SetSpeakDetail( OwnerID(), GetString("SC_TRICK_OR_TREAT_TOMORROW")   )--�A���Ѥw�g���L�}�G�F�I���ѦA�ӧa�I
	end
end

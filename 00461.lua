
function LuaS_110302_0()

	if CheckCompleteQuest( OwnerID() , 420324 ) == true and checkflag( OwnerID() , 540793 ) == false then
		SetSpeakDetail( OwnerID() , GetString("ST_110302_0") );
		AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110302_0")  , "LuaS_110302_1",0 );		--�W�[�@�ӿﶵ
		AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110302_1")  ,  "LuaS_110302_Exit", 0 );		--�W�[�@�ӿﶵ
	else
		LoadQuestOption( OwnerID() );  --���J���ȼҪO
	end

end

function LuaS_110302_1()

	SetSpeakDetail( OwnerID() , GetString("ST_110302_1") );
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110302_2")  , "LuaS_110302_2",0 );		--�W�[�@�ӿﶵ
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110302_3")  ,  "LuaS_110302_Exit", 0 );		--�W�[�@�ӿﶵ

end

function LuaS_110302_2()

	SetSpeakDetail( OwnerID() , GetString("ST_110302_2") );
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110302_4")  , "LuaS_110302_3",0 );		--�W�[�@�ӿﶵ
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110302_3")  ,  "LuaS_110302_Exit", 0 );		--�W�[�@�ӿﶵ

end

function LuaS_110302_3()

	SetSpeakDetail( OwnerID() , GetString("ST_110302_3") );
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110302_5")  , "LuaS_110302_4",0 );		--�W�[�@�ӿﶵ
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110302_3")  ,  "LuaS_110302_Exit", 0 );		--�W�[�@�ӿﶵ

end

function LuaS_110302_4()

	SetSpeakDetail( OwnerID() , GetString("ST_110302_4") );
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110302_6")  , "LuaS_110302_5",0 );		--�W�[�@�ӿﶵ
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110302_3")  ,  "LuaS_110302_Exit", 0 );		--�W�[�@�ӿﶵ

end

function LuaS_110302_5()

	CloseSpeak( OwnerID() );	--������ܵ���
--	DelBodyItem ( OwnerID() , 200906 , 1 )		-- �R���������߶���
	SetFlag( OwnerID()  , 540793 , 1 )		-- �i���Ǭ��R���n���B

end

function LuaS_110302_Exit()
	CloseSpeak( OwnerID() );	--������ܵ���
end
function LuaS_110004_0() --�U�i
	SetSpeakDetail( OwnerID(), GetString("ST_110004_0") )
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_BACK") , "LuaS_GetWarrior_0", 0 );--#��^�W�@��

	if ( CheckFlag( OwnerID() , 540826 ) == true ) then	-- ���ȡG�F�Ѩ�L¾�~
		SetFlag( OwnerID() , 540831 , 1 )	-- ���n���~�G�Ĥ@����Ԥh����
		local AllTalk = AllJobMasterTalk()
		if ( AllTalk == true ) then
			SetFlag( OwnerID() , 540830 , 1 )	-- ���n���~�G�Ĥ@����Ҧ����ɭ����L��
		end
	end
end
function LuaS_110008_0() --�v�N
	SetSpeakDetail( OwnerID(), GetString("ST_110008_0") )
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_BACK") , "LuaS_GetRanger_0", 0 );--#��^�W�@��

	if ( CheckFlag( OwnerID() , 540826 ) == true ) then	-- ���ȡG�F�Ѩ�L¾�~
		SetFlag( OwnerID() , 540832 , 1 )	-- ���n���~�G�Ĥ@����C�L����
		local AllTalk = AllJobMasterTalk()
		if ( AllTalk == true ) then
			SetFlag( OwnerID() , 540830 , 1 )	-- ���n���~�G�Ĥ@����Ҧ����ɭ����L��
		end
	end
end
function LuaS_110307_0() --���
	SetSpeakDetail( OwnerID(), GetString("ST_110307_0") )
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_BACK") , "LuaS_GETROGUE_0", 0 );--#��^�W�@��

	if ( CheckFlag( OwnerID() , 540826 ) == true ) then	-- ���ȡG�F�Ѩ�L¾�~
		SetFlag( OwnerID() , 540833 , 1 )	-- ���n���~�G�Ĥ@����v��̻���
		local AllTalk = AllJobMasterTalk()
		if ( AllTalk == true ) then
			SetFlag( OwnerID() , 540830 , 1 )	-- ���n���~�G�Ĥ@����Ҧ����ɭ����L��
		end
	end
end
function LuaS_110309_0() --�d����
	SetSpeakDetail( OwnerID(), GetString("ST_110309_0") )
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_BACK") , "LuaS_GetMage_0", 0 );--#��^�W�@��

	if ( CheckFlag( OwnerID() , 540826 ) == true ) then	-- ���ȡG�F�Ѩ�L¾�~
		SetFlag( OwnerID() , 540834 , 1 )	-- ���n���~�G�Ĥ@����k�v����
		local AllTalk = AllJobMasterTalk()
		if ( AllTalk == true ) then
			SetFlag( OwnerID() , 540830 , 1 )	-- ���n���~�G�Ĥ@����Ҧ����ɭ����L��
		end
	end
end
function LuaS_110312_0() --�R�H��
	SetSpeakDetail( OwnerID(), GetString("ST_110312_0") )
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_BACK") , "LuaS_GetPriest_0", 0 );--#��^�W�@��

	if ( CheckFlag( OwnerID() , 540826 ) == true ) then	-- ���ȡG�F�Ѩ�L¾�~
		SetFlag( OwnerID() , 540835 , 1 )	-- ���n���~�G�Ĥ@���򲽥q����
		local AllTalk = AllJobMasterTalk()
		if ( AllTalk == true ) then
			SetFlag( OwnerID() , 540830 , 1 )	-- ���n���~�G�Ĥ@����Ҧ����ɭ����L��
		end
	end
end
function LuaS_110318_0() --������
	SetSpeakDetail( OwnerID(), GetString("ST_110318_0") )
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_BACK") , "LuaS_GetKnight_0", 0 );--#��^�W�@��

	if ( CheckFlag( OwnerID() , 540826 ) == true ) then	-- ���ȡG�F�Ѩ�L¾�~
		SetFlag( OwnerID() , 540836 , 1 )	-- ���n���~�G�Ĥ@�����M�h����
		local AllTalk = AllJobMasterTalk()
		if ( AllTalk == true ) then
			SetFlag( OwnerID() , 540830 , 1 )	-- ���n���~�G�Ĥ@����Ҧ����ɭ����L��
		end
	end
end

function LuaS_113388_0() --�̬�������
	SetSpeakDetail( OwnerID(), "[ST_113388_0]" )
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_GetDruid_0", 0 );--#��^�W�@��
end

function LuaS_113389_0() --���S�ûe��
	SetSpeakDetail( OwnerID(), "[ST_113389_0]" )
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_GetWarden_0", 0 );--#��^�W�@��
end
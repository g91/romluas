------------------------------------------------------------------------------------------------------------
function LuaS_110586()	-- ���|�Х�

	--SetSpeakDetail( OwnerID() , "��p�A��\�\\��b�������|���}����աC" ); 
	local State = GuildState( OwnerID() )			-- 0 �S�����| 1 �s�p���| 2 �@�뤽�|
	local Member = GuildMemberCount( OwnerID() )	-- ���o���|�H��

	if ( State == 0 ) then
		LoadQuestOption( OwnerID() )		--���J����
		AddSpeakOption( OwnerID(), TargetID(), GetString("GUILD_NEWGUILD"), "Sys_CreateGuild_Open", 0 );	--�Хߤ��|
	elseif ( State == 1 ) then
		if ( Member < 5 ) then
			SetSpeakDetail( OwnerID(), GetString("GUILD_NEWGUILDNOREADY") )
		else
			SetSpeakDetail( OwnerID(), GetString("GUILD_NEWGUILDGETREADY") )
			AddSpeakOption( OwnerID(), TargetID(), GetString("GUILD_NEWGUILDREADY"), "LuaS_110586_NEWSUCCESS", 0 );		--�s�p����
		end
	elseif ( State == 2 ) then
		SetSpeakDetail( OwnerID(),  GetString("GUILD_NEWGUILDSORRY") )
	end
		AddSpeakOption( OwnerID(), TargetID(), GetString("GUILD_NEWGUILDINTRO"), "LuaS_110586_NEWGUILDINTRO", 0 );	--�Хߤ��|
end
------------------------------------------------------------------------------------------------------------
function LuaS_110586_NEWGUILDINTRO()
	SetSpeakDetail( OwnerID(),  GetString("GUILD_NEWGUILDINTROTXT") )
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_BACK") , "LuaS_110586", 0 );	--�^�W�@��
end
------------------------------------------------------------------------------------------------------------
function LuaS_110586_NEWGUILD()

	--SetSpeakDetail( OwnerID(), "�o�O�Хߤ��|" );					--����
	--AddSpeakOption( OwnerID(), TargetID(), "��^", "LuaS_110586", 0 );		--��^
	--AddSpeakOption( OwnerID(), TargetID(), "���}���", "LuaS_GUILD_EXIT", 0 );	--���}���

end
------------------------------------------------------------------------------------------------------------
function LuaS_110586_NEWSUCCESS()

	CloseSpeak( OwnerID() )			-- ������ܵ���
	Sys_GuilReady()

	--SetSpeakDetail( OwnerID(), "�o�O�s�p����" );					--����
	--AddSpeakOption( OwnerID(), TargetID(), "��^", "LuaS_110586", 0 );		--��^
	--AddSpeakOption( OwnerID(), TargetID(), "���}���", "LuaS_GUILD_EXIT", 0 );	--���}���

end
------------------------------------------------------------------------------------------------------------
function LuaS_110587()	-- ���|�෽

	local State = GuildState( OwnerID() )			-- 0 �S�����| 1 �s�p���| 2 �@�뤽�|

	if ( State > 0 ) then
		LoadQuestOption( OwnerID() );	--���J����
		AddSpeakOption( OwnerID(), TargetID(), GetString("SO_GUILDCONTRIBUTION") , "Sys_GuildContribution_Open", 0 );	--�^�m�Ť����
	else
		SetSpeakDetail( OwnerID() , GetString("GUILD_CONTRIBUTIONSORRY") )
	end

end
------------------------------------------------------------------------------------------------------------
function LuaS_110587_CONTRIBUTION()

	--SetSpeakDetail( OwnerID(), "�o�O�^�m�Ť����" );					--����
	--AddSpeakOption( OwnerID(), TargetID(), "��^", "LuaS_110587", 0 );			--��^
	--AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110068_3") , "LuaS_110068_3",0 );	--�ڤF�Ѧp�󲾰ʤF

end
------------------------------------------------------------------------------------------------------------
function LuaS_110588()	-- ���|�\�� 

	LoadQuestOption( OwnerID() );	--���J����
	--SetSpeakDetail( OwnerID() , GetString("SO_GUILDSORRY") ); 	-- ��p�A��\�\\��b�������|���}����աC
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_GUILDSHOP") , "Sys_GuildShop_Open",0 );		--�}�үd���O
	--AddSpeakOption( OwnerID(), TargetID(), "�}�үd���O" , "LuaS_110588_ADDBOARD",0 );	--�}�үd���O
	--AddSpeakOption( OwnerID(), TargetID(), "�X�R�춥" , "LuaS_110588_ADDCLASS",0 );	--�X�R�춥
	--AddSpeakOption( OwnerID(), TargetID(), "�X�R�򥻤H��" , "LuaS_110588_ADDLIMIT",0 );	--�X�R�򥻤H��

end
------------------------------------------------------------------------------------------------------------
function LuaS_110588_ADDBOARD()

	SetSpeakDetail( OwnerID(), "�o�O�}�үd���O" );						--����
	AddSpeakOption( OwnerID(), TargetID(), "��^", "LuaS_110588", 0 );			--��^

end
------------------------------------------------------------------------------------------------------------
function LuaS_110588_ADDCLASS()

	SetSpeakDetail( OwnerID(), "�o�O�X�R�춥" );						--����
	AddSpeakOption( OwnerID(), TargetID(), "��^", "LuaS_110588", 0 );			--��^

end
------------------------------------------------------------------------------------------------------------
function LuaS_110588_ADDLIMIT()

	SetSpeakDetail( OwnerID(), "�o�O�X�R�򥻤H��" );					--����
	AddSpeakOption( OwnerID(), TargetID(), "��^", "LuaS_110588", 0 );			--��^

end
------------------------------------------------------------------------------------------------------------
function LuaS_110589()	-- ���|�Ԫ��v�� 

	--LoadQuestOption( OwnerID() );	--���J����
	SetSpeakDetail( OwnerID() , GetString("SO_GUILDSORRY") ); 
	--LoadQuestOption( OwnerID() );	--���J����
	--AddSpeakOption( OwnerID(), TargetID(), "�ڭn�v��" , "LuaS_110589_AUCTION", 0 );		--�ڭn�v��

end
------------------------------------------------------------------------------------------------------------
function LuaS_110589_AUCTION()	-- ���|�Ԫ��v�� 

	SetSpeakDetail( OwnerID(), "�o�O�v��" );						--����
	AddSpeakOption( OwnerID(), TargetID(), "��^", "LuaS_110589", 0 );			--��^

end
------------------------------------------------------------------------------------------------------------
function LuaS_110590()

	LoadQuestOption( OwnerID() );	--���J����
	--SetSpeakDetail( OwnerID(),GetString("ST_110068_1") );  --	�оǤ���1
	--AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110068_2") , "LuaS_110068_0",0 );	--��^
	--AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110068_3") , "LuaS_110068_3",0 );	--�ڤF�Ѧp�󲾰ʤF

end
------------------------------------------------------------------------------------------------------------
--function LuaS_GUILD_EXIT()
--	CloseSpeak( OwnerID() );	--������ܵ���
--end
------------------------------------------------------------------------------------------------------------
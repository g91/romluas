EM_GuildResult_OK			= 0	--	//���\
EM_GuildResult_HasGuildErr	= 1 	--	//�w�����|
EM_GuildResult_NoGuildErr	= 2 	--	//�S�����|
EM_GuildResult_DataErr		= 3	--	//��Ʀ����D
EM_GuildResult_InterfaceErr	= 4	--	//�������٦b�}�Ҥ�
EM_GuildResult_LeaderErr	= 5	--	//���O�|��
--�}�ҫإߤ��|
function Sys_CreateGuild_Auto()
	SetPlot( OwnerID() , "Touch" , "Sys_CreateGuild_Open" , 50 );
end

function Sys_GuildResult(  Ret )

	if( Ret == EM_GuildResult_OK ) then 

	elseif( Ret == EM_GuildResult_HasGuildErr	) then
		ScriptMessage( OwnerID(), OwnerID(), 2 ,GetString("MSG_GUILD_01"),1)
	elseif( Ret == EM_GuildResult_NoGuildErr	) then
		ScriptMessage( OwnerID(), OwnerID(), 2 ,GetString("MSG_GUILD_02"),1)
	elseif( Ret == EM_GuildResult_DataErr) then
		ScriptMessage( OwnerID(), OwnerID(), 2 ,GetString("MSG_GUILD_03"),1)
	elseif( Ret == EM_GuildResult_InterfaceErr) then
		ScriptMessage( OwnerID(), OwnerID(), 2 ,GetString("MSG_GUILD_04"),1)
	elseif( Ret == EM_GuildResult_LeaderErr) then
		ScriptMessage( OwnerID(), OwnerID(), 2 ,GetString("MSG_GUILD_05"),1)
	end

end

function Sys_CreateGuild_Open()

	local Ret = OpenCreateNewGuild();
	Sys_GuildResult( Ret )
end

--�}�Ҥ��|�^�m
function Sys_GuildContribution_Auto()
	SetPlot( OwnerID() , "Touch" , "Sys_GuildContribution_Open" , 50 );
end

function Sys_GuildContribution_Open()
	
	local Ret = OpenGuildContribution();
	Sys_GuildResult( Ret )
end

--�]�w���|Ready
function Sys_GuilReady_Auto()
	SetPlot( OwnerID() , "Touch" , "Sys_GuilReady" , 50 );
end

function Sys_GuilReady()
	local MemberCount = GuildMemberCount( OwnerID()  );
	
	if( MemberCount == 0 ) then
		Say(  OwnerID() , "�S�����|"  );
	elseif( MemberCount  >= 5 ) then
		local Ret = SetGuildReady( OwnerID() )
		Sys_GuildResult( Ret )
	else	
		Say(  OwnerID() , "���|�H�Ƥ���"  );
	end
end
--�}�Ҥ��|�ө�
function Sys_GuildShop_Auto()
	SetPlot( OwnerID() , "Touch" , "Sys_GuildShop_Open" , 50 );
end

function Sys_GuildShop_Open()
	local Ret = OpenGuildShop();
	Sys_GuildResult( Ret );
end
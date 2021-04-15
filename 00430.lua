EM_GuildResult_OK			= 0	--	//成功
EM_GuildResult_HasGuildErr	= 1 	--	//已有公會
EM_GuildResult_NoGuildErr	= 2 	--	//沒有公會
EM_GuildResult_DataErr		= 3	--	//資料有問題
EM_GuildResult_InterfaceErr	= 4	--	//有介面還在開啟中
EM_GuildResult_LeaderErr	= 5	--	//不是會長
--開啟建立公會
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

--開啟公會貢獻
function Sys_GuildContribution_Auto()
	SetPlot( OwnerID() , "Touch" , "Sys_GuildContribution_Open" , 50 );
end

function Sys_GuildContribution_Open()
	
	local Ret = OpenGuildContribution();
	Sys_GuildResult( Ret )
end

--設定公會Ready
function Sys_GuilReady_Auto()
	SetPlot( OwnerID() , "Touch" , "Sys_GuilReady" , 50 );
end

function Sys_GuilReady()
	local MemberCount = GuildMemberCount( OwnerID()  );
	
	if( MemberCount == 0 ) then
		Say(  OwnerID() , "沒有公會"  );
	elseif( MemberCount  >= 5 ) then
		local Ret = SetGuildReady( OwnerID() )
		Sys_GuildResult( Ret )
	else	
		Say(  OwnerID() , "公會人數不足"  );
	end
end
--開啟公會商店
function Sys_GuildShop_Auto()
	SetPlot( OwnerID() , "Touch" , "Sys_GuildShop_Open" , 50 );
end

function Sys_GuildShop_Open()
	local Ret = OpenGuildShop();
	Sys_GuildResult( Ret );
end
------------------------------------------------------------------------------------------------------------
function LuaS_110586()	-- 公會創立

	--SetSpeakDetail( OwnerID() , "抱歉，此\功\能在此版本尚未開放測試。" ); 
	local State = GuildState( OwnerID() )			-- 0 沒有公會 1 連署公會 2 一般公會
	local Member = GuildMemberCount( OwnerID() )	-- 取得公會人數

	if ( State == 0 ) then
		LoadQuestOption( OwnerID() )		--載入任務
		AddSpeakOption( OwnerID(), TargetID(), GetString("GUILD_NEWGUILD"), "Sys_CreateGuild_Open", 0 );	--創立公會
	elseif ( State == 1 ) then
		if ( Member < 5 ) then
			SetSpeakDetail( OwnerID(), GetString("GUILD_NEWGUILDNOREADY") )
		else
			SetSpeakDetail( OwnerID(), GetString("GUILD_NEWGUILDGETREADY") )
			AddSpeakOption( OwnerID(), TargetID(), GetString("GUILD_NEWGUILDREADY"), "LuaS_110586_NEWSUCCESS", 0 );		--連署完成
		end
	elseif ( State == 2 ) then
		SetSpeakDetail( OwnerID(),  GetString("GUILD_NEWGUILDSORRY") )
	end
		AddSpeakOption( OwnerID(), TargetID(), GetString("GUILD_NEWGUILDINTRO"), "LuaS_110586_NEWGUILDINTRO", 0 );	--創立公會
end
------------------------------------------------------------------------------------------------------------
function LuaS_110586_NEWGUILDINTRO()
	SetSpeakDetail( OwnerID(),  GetString("GUILD_NEWGUILDINTROTXT") )
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_BACK") , "LuaS_110586", 0 );	--回上一頁
end
------------------------------------------------------------------------------------------------------------
function LuaS_110586_NEWGUILD()

	--SetSpeakDetail( OwnerID(), "這是創立公會" );					--內文
	--AddSpeakOption( OwnerID(), TargetID(), "返回", "LuaS_110586", 0 );		--返回
	--AddSpeakOption( OwnerID(), TargetID(), "離開對話", "LuaS_GUILD_EXIT", 0 );	--離開對話

end
------------------------------------------------------------------------------------------------------------
function LuaS_110586_NEWSUCCESS()

	CloseSpeak( OwnerID() )			-- 關閉對話視窗
	Sys_GuilReady()

	--SetSpeakDetail( OwnerID(), "這是連署完成" );					--內文
	--AddSpeakOption( OwnerID(), TargetID(), "返回", "LuaS_110586", 0 );		--返回
	--AddSpeakOption( OwnerID(), TargetID(), "離開對話", "LuaS_GUILD_EXIT", 0 );	--離開對話

end
------------------------------------------------------------------------------------------------------------
function LuaS_110587()	-- 公會能源

	local State = GuildState( OwnerID() )			-- 0 沒有公會 1 連署公會 2 一般公會

	if ( State > 0 ) then
		LoadQuestOption( OwnerID() );	--載入任務
		AddSpeakOption( OwnerID(), TargetID(), GetString("SO_GUILDCONTRIBUTION") , "Sys_GuildContribution_Open", 0 );	--貢獻符文水晶
	else
		SetSpeakDetail( OwnerID() , GetString("GUILD_CONTRIBUTIONSORRY") )
	end

end
------------------------------------------------------------------------------------------------------------
function LuaS_110587_CONTRIBUTION()

	--SetSpeakDetail( OwnerID(), "這是貢獻符文水晶" );					--內文
	--AddSpeakOption( OwnerID(), TargetID(), "返回", "LuaS_110587", 0 );			--返回
	--AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110068_3") , "LuaS_110068_3",0 );	--我了解如何移動了

end
------------------------------------------------------------------------------------------------------------
function LuaS_110588()	-- 公會功能 

	LoadQuestOption( OwnerID() );	--載入任務
	--SetSpeakDetail( OwnerID() , GetString("SO_GUILDSORRY") ); 	-- 抱歉，此\功\能在此版本尚未開放測試。
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_GUILDSHOP") , "Sys_GuildShop_Open",0 );		--開啟留言板
	--AddSpeakOption( OwnerID(), TargetID(), "開啟留言板" , "LuaS_110588_ADDBOARD",0 );	--開啟留言板
	--AddSpeakOption( OwnerID(), TargetID(), "擴充位階" , "LuaS_110588_ADDCLASS",0 );	--擴充位階
	--AddSpeakOption( OwnerID(), TargetID(), "擴充基本人數" , "LuaS_110588_ADDLIMIT",0 );	--擴充基本人數

end
------------------------------------------------------------------------------------------------------------
function LuaS_110588_ADDBOARD()

	SetSpeakDetail( OwnerID(), "這是開啟留言板" );						--內文
	AddSpeakOption( OwnerID(), TargetID(), "返回", "LuaS_110588", 0 );			--返回

end
------------------------------------------------------------------------------------------------------------
function LuaS_110588_ADDCLASS()

	SetSpeakDetail( OwnerID(), "這是擴充位階" );						--內文
	AddSpeakOption( OwnerID(), TargetID(), "返回", "LuaS_110588", 0 );			--返回

end
------------------------------------------------------------------------------------------------------------
function LuaS_110588_ADDLIMIT()

	SetSpeakDetail( OwnerID(), "這是擴充基本人數" );					--內文
	AddSpeakOption( OwnerID(), TargetID(), "返回", "LuaS_110588", 0 );			--返回

end
------------------------------------------------------------------------------------------------------------
function LuaS_110589()	-- 公會戰爭競標 

	--LoadQuestOption( OwnerID() );	--載入任務
	SetSpeakDetail( OwnerID() , GetString("SO_GUILDSORRY") ); 
	--LoadQuestOption( OwnerID() );	--載入任務
	--AddSpeakOption( OwnerID(), TargetID(), "我要競標" , "LuaS_110589_AUCTION", 0 );		--我要競標

end
------------------------------------------------------------------------------------------------------------
function LuaS_110589_AUCTION()	-- 公會戰爭競標 

	SetSpeakDetail( OwnerID(), "這是競標" );						--內文
	AddSpeakOption( OwnerID(), TargetID(), "返回", "LuaS_110589", 0 );			--返回

end
------------------------------------------------------------------------------------------------------------
function LuaS_110590()

	LoadQuestOption( OwnerID() );	--載入任務
	--SetSpeakDetail( OwnerID(),GetString("ST_110068_1") );  --	教學內文1
	--AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110068_2") , "LuaS_110068_0",0 );	--返回
	--AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110068_3") , "LuaS_110068_3",0 );	--我了解如何移動了

end
------------------------------------------------------------------------------------------------------------
--function LuaS_GUILD_EXIT()
--	CloseSpeak( OwnerID() );	--關閉對話視窗
--end
------------------------------------------------------------------------------------------------------------
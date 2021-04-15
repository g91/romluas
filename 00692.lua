function LuaI_BOSSPASS_1()--可疑的土堆初始劇情
	SetPlot( OwnerID() , "Range" , "BOSSPASSSWORD_A" , 50 )
	CastSpell( OwnerID(),OwnerID(), 574409)  -- 出生後幫自己上特效魔法
end

function LuaI_BOSSPASS_2()
	SetPlot( OwnerID() , "Range" , "BOSSPASSSWORD_B" , 200 )
end

function LuaI_BOSSPASS_3()
	SetPlot( OwnerID() , "Range" , "BOSSPASSSWORD_C" , 200 )
end

function BOSSPASSSWORD_A()
	if CheckFlag( OwnerID()  , 541121 ) == false then --/*檢查是否挖過真土堆
		if CountBodyItem( OwnerID() , 202006 ) > 0 then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_BOSSPASSSWORD_1"), 0 ); --/*金屬探測器劇烈的振動著，這附近一定有金屬製品。
		end
	end
end
function BOSSPASSSWORD_B()
	if CheckFlag( OwnerID()  , 541121 ) == false then --/*檢查是否挖過真土堆
		if CountBodyItem( OwnerID() , 202006 ) > 0 then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_BOSSPASSSWORD_2"), 0 ); --/*金屬探測器發出共鳴的嗡嗡聲，看來金屬製品離你不遠了。
		end
	end
end
function BOSSPASSSWORD_C()
	if CheckFlag( OwnerID()  , 541121 ) == false then --/*檢查是否挖過真土堆
		if CountBodyItem( OwnerID() , 202006 ) > 0 then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_BOSSPASSSWORD_3"), 0 ); --/*金屬探測器輕微的顫抖著，應該是已經偵測到遠方的金屬。
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaI_BOSSPASS1_1()--可疑的土堆2初始劇情
	SetPlot( OwnerID() , "Range" , "BOSSPASSSWORD1_A" , 50 )
	CastSpell( OwnerID(),OwnerID(), 574409)  -- 出生後幫自己上特效魔法
end

function LuaI_BOSSPASS1_2()
	SetPlot( OwnerID() , "Range" , "BOSSPASSSWORD1_B" , 200 )
end

function LuaI_BOSSPASS1_3()
	SetPlot( OwnerID() , "Range" , "BOSSPASSSWORD1_C" , 200 )
end

function BOSSPASSSWORD1_A()
	if CheckFlag( OwnerID()  , 541122 ) == false then --/*檢查是否挖過此土堆
		if CountBodyItem( OwnerID() , 202006 ) > 0 then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_BOSSPASSSWORD_1"), 0 ); --/*金屬探測器劇烈的振動著，這附近一定有金屬製品。
		end
	end
end
function BOSSPASSSWORD1_B()
	if CheckFlag( OwnerID()  , 541122 ) == false then --/*檢查是否挖過此土堆
		if CountBodyItem( OwnerID() , 202006 ) > 0 then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_BOSSPASSSWORD_2"), 0 ); --/*金屬探測器發出共鳴的嗡嗡聲，看來金屬製品離你不遠了。
		end
	end
end
function BOSSPASSSWORD1_C()
	if CheckFlag( OwnerID()  , 541122 ) == false then --/*檢查是否挖過此土堆
		if CountBodyItem( OwnerID() , 202006 ) > 0 then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_BOSSPASSSWORD_3"), 0 ); --/*金屬探測器輕微的顫抖著，應該是已經偵測到遠方的金屬。
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaI_BOSSPASS2_1()--可疑的土堆3初始劇情
	SetPlot( OwnerID() , "Range" , "BOSSPASSSWORD2_A" , 50 )
	CastSpell( OwnerID(),OwnerID(), 574409)  -- 出生後幫自己上特效魔法
end

function LuaI_BOSSPASS2_2()
	SetPlot( OwnerID() , "Range" , "BOSSPASSSWORD2_B" , 200 )
end

function LuaI_BOSSPASS2_3()
	SetPlot( OwnerID() , "Range" , "BOSSPASSSWORD2_C" , 200 )
end

function BOSSPASSSWORD2_A()
	if CheckFlag( OwnerID()  , 541123 ) == false then --/*檢查是否挖過此土堆
		if CountBodyItem( OwnerID() , 202006 ) > 0 then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_BOSSPASSSWORD_1"), 0 ); --/*金屬探測器劇烈的振動著，這附近一定有金屬製品。
		end
	end
end
function BOSSPASSSWORD2_B()
	if CheckFlag( OwnerID()  , 541123 ) == false then --/*檢查是否挖過此土堆
		if CountBodyItem( OwnerID() , 202006 ) > 0 then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_BOSSPASSSWORD_2"), 0 ); --/*金屬探測器發出共鳴的嗡嗡聲，看來金屬製品離你不遠了。
		end
	end
end
function BOSSPASSSWORD2_C()
	if CheckFlag( OwnerID()  , 541123 ) == false then --/*檢查是否挖過此土堆
		if CountBodyItem( OwnerID() , 202006 ) > 0 then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_BOSSPASSSWORD_3"), 0 ); --/*金屬探測器輕微的顫抖著，應該是已經偵測到遠方的金屬。
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

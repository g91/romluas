function LuaS_110770()	-- 交易所推廣員歐謝爾
	LoadQuestOption( OwnerID() )
  	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_OPENAC") , "LuaS_110770_OpenAC" , 0 )	-- 開啟交易所
  	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110049_1") , "LuaS_110770_Intro" , 0 )		-- 交易所介紹
end

function LuaS_110770_Intro() 
	SetSpeakDetail( OwnerID(), GetString( "ST_110049_1" ) )
	--/交易所是提供冒險者物品交流的地方。\n\n如果你在旅行的過程中得到有價值的武器、裝備、符文或其他物品，你可以拿到我們交易所來販賣；同樣地，如果你需要這些東西，也可來我們交易所尋找。\n\n/這邊的商品都是由冒險者提供的，雖然不敢保證價格一定便宜，但是種類繁多，如果多來逛逛的話，還是常常會找到物廉價美的東西喔～
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACKTALK") , "LuaS_110770", 0 ); --/我想回到剛剛的對話
end

function LuaS_110770_OpenAC()
	CloseSpeak( OwnerID() )	-- 關閉對話視窗
	OpenAC()		-- 開啟交易所
end


function LuaS_110771()	-- 羅格鎮信箱
	LoadQuestOption( OwnerID() )
  	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_OPENMAIL") , "LuaS_110771_OpenMail" , 0 )	-- 開啟信箱
end

function LuaS_110771_OpenMail()
	CloseSpeak( OwnerID() )	-- 關閉對話視窗
	OpenMail()		-- 開啟信箱
end

function LuaS_110078()

	LoadQuestOption( OwnerID() )

	if ( CheckFlag( OwnerID() , 540804 ) == false ) then

		local job = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )	-- 如果不報到，一開始就來解的話
	
		    if ( job == 0 ) then
			-- return "管理者"
		elseif  ( job == 1 ) then
			SetFlag( OwnerID() , 540811 , 1 )	-- 新手職業選戰士
		elseif  ( job == 2 ) then
			SetFlag( OwnerID() , 540812 , 1 )	-- 新手職業選遊俠
		elseif  ( job == 3 ) then
			SetFlag( OwnerID() , 540813 , 1 )	-- 新手職業選盜賊
		elseif  ( job == 4 ) then
			SetFlag( OwnerID() , 540814 , 1 )	-- 新手職業選法師
		elseif  ( job == 5 ) then
			SetFlag( OwnerID() , 540815 , 1 )	-- 新手職業選祭司
		elseif  ( job == 6 ) then
			SetFlag( OwnerID() , 540816 , 1 )	-- 新手職業選騎士
		elseif  ( job == 7 ) then
			SetFlag( OwnerID() , 540817 , 1 )	-- 新手職業選言靈使
		elseif  ( job == 8 ) then
			SetFlag( OwnerID() , 540818 , 1 )	-- 新手職業選德魯伊
		end

		SetFlag( OwnerID() , 540804 , 1 )	-- 新手職業已選
	end
end
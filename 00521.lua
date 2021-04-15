function LuaS_110004_0() --沃可
	SetSpeakDetail( OwnerID(), GetString("ST_110004_0") )
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_BACK") , "LuaS_GetWarrior_0", 0 );--#返回上一頁

	if ( CheckFlag( OwnerID() , 540826 ) == true ) then	-- 任務：了解其他職業
		SetFlag( OwnerID() , 540831 , 1 )	-- 重要物品：第一次跟戰士說話
		local AllTalk = AllJobMasterTalk()
		if ( AllTalk == true ) then
			SetFlag( OwnerID() , 540830 , 1 )	-- 重要物品：第一次跟所有指導員說過話
		end
	end
end
function LuaS_110008_0() --影杰
	SetSpeakDetail( OwnerID(), GetString("ST_110008_0") )
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_BACK") , "LuaS_GetRanger_0", 0 );--#返回上一頁

	if ( CheckFlag( OwnerID() , 540826 ) == true ) then	-- 任務：了解其他職業
		SetFlag( OwnerID() , 540832 , 1 )	-- 重要物品：第一次跟遊俠說話
		local AllTalk = AllJobMasterTalk()
		if ( AllTalk == true ) then
			SetFlag( OwnerID() , 540830 , 1 )	-- 重要物品：第一次跟所有指導員說過話
		end
	end
end
function LuaS_110307_0() --艾森
	SetSpeakDetail( OwnerID(), GetString("ST_110307_0") )
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_BACK") , "LuaS_GETROGUE_0", 0 );--#返回上一頁

	if ( CheckFlag( OwnerID() , 540826 ) == true ) then	-- 任務：了解其他職業
		SetFlag( OwnerID() , 540833 , 1 )	-- 重要物品：第一次跟影行者說話
		local AllTalk = AllJobMasterTalk()
		if ( AllTalk == true ) then
			SetFlag( OwnerID() , 540830 , 1 )	-- 重要物品：第一次跟所有指導員說過話
		end
	end
end
function LuaS_110309_0() --卡莎蕾
	SetSpeakDetail( OwnerID(), GetString("ST_110309_0") )
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_BACK") , "LuaS_GetMage_0", 0 );--#返回上一頁

	if ( CheckFlag( OwnerID() , 540826 ) == true ) then	-- 任務：了解其他職業
		SetFlag( OwnerID() , 540834 , 1 )	-- 重要物品：第一次跟法師說話
		local AllTalk = AllJobMasterTalk()
		if ( AllTalk == true ) then
			SetFlag( OwnerID() , 540830 , 1 )	-- 重要物品：第一次跟所有指導員說過話
		end
	end
end
function LuaS_110312_0() --娜妲紗
	SetSpeakDetail( OwnerID(), GetString("ST_110312_0") )
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_BACK") , "LuaS_GetPriest_0", 0 );--#返回上一頁

	if ( CheckFlag( OwnerID() , 540826 ) == true ) then	-- 任務：了解其他職業
		SetFlag( OwnerID() , 540835 , 1 )	-- 重要物品：第一次跟祭司說話
		local AllTalk = AllJobMasterTalk()
		if ( AllTalk == true ) then
			SetFlag( OwnerID() , 540830 , 1 )	-- 重要物品：第一次跟所有指導員說過話
		end
	end
end
function LuaS_110318_0() --帕斯汀
	SetSpeakDetail( OwnerID(), GetString("ST_110318_0") )
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_BACK") , "LuaS_GetKnight_0", 0 );--#返回上一頁

	if ( CheckFlag( OwnerID() , 540826 ) == true ) then	-- 任務：了解其他職業
		SetFlag( OwnerID() , 540836 , 1 )	-- 重要物品：第一次跟騎士說話
		local AllTalk = AllJobMasterTalk()
		if ( AllTalk == true ) then
			SetFlag( OwnerID() , 540830 , 1 )	-- 重要物品：第一次跟所有指導員說過話
		end
	end
end

function LuaS_113388_0() --厄洛美蒂雅
	SetSpeakDetail( OwnerID(), "[ST_113388_0]" )
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_GetDruid_0", 0 );--#返回上一頁
end

function LuaS_113389_0() --阿特笛蜜絲
	SetSpeakDetail( OwnerID(), "[ST_113389_0]" )
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_GetWarden_0", 0 );--#返回上一頁
end
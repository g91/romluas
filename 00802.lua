---------------------------------- 莎嘉 ----------------------------------------

function LuaI_110073()
	
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_CRAFTING_BEGIN,ruFUSION_ACTORSTATE_CRAFTING_LOOP) --一直工作
	BeginPlot( TargetID() , "LuaSS_110073_0" , 0 )
	sleep(30)
end

function LuaSS_110073_0()
	while 1 do
	Npcsay(OwnerID(),GetString("SC_110073_0")) --唉呀，忙死了！忙死了！ 
	Sleep(2000)
	end
end

---------------------------------- 莉娜 ----------------------------------------

function LuaI_110068()
	BeginPlot( TargetID() , "LuaSS_110068_0" , 0 )
end

function LuaSS_110068_0()
	while 1 do
	Npcsay(OwnerID(),GetString("SC_110068_0")) --我該怎麼讓傑爾瞭解我的心意呢？...
	Sleep(1830)
	end
end

---------------------------------- 古汀 ----------------------------------------
function LuaI_110077()
	BeginPlot( TargetID() , "LuaSS_110077_0" , 0 )
end

function LuaSS_110077_0()
	while 1 do
	Npcsay(OwnerID(),GetString("SC_110077_0")) --想當年我一把劍可以砍殺千萬個敵人，現在….唉唷唷～我的腰好痛～～
	Sleep(2900)
	end
end

---------------------------------- 波特 ----------------------------------------
function LuaI_110490()
	BeginPlot( TargetID() , "LuaSS_110490_0" , 0 )
end

function LuaSS_110490_0()
	while 1 do
	Npcsay(OwnerID(),GetString("SC_110490_0")) --
	Sleep(1730)
	end
end

---------------------------------- 諾斯卡 ----------------------------------------

function LuaI_110076()
	BeginPlot( TargetID() , "LuaSS_110076_0" , 0 )
end

function LuaSS_110076_0()
	while 1 do
	Npcsay(OwnerID(),GetString("SC_110076_0")) --有沒有送送信、照顧貓的工作呢？
	Sleep(3430)
	end
end

---------------------------------- 伍德 ----------------------------------------

function LuaI_110470()
	BeginPlot( TargetID() , "LuaSS_110470_0" , 0 )
	BeginPlot( OwnerID() , "LuaYU_PlayMusic_2" , 0 )
end

function LuaSS_110470_0()
	while 1 do
	Npcsay(OwnerID(),GetString("SC_110470_0")) --我是一個快樂的伐木人～嘿嘿呦～嘿嘿呦～(唱)  太陽下山回家吃晚餐～咚咚咚～咚咚咚～(唱)
	Sleep(1800)
	end
end

---------------------------------- 喬治 ----------------------------------------

function LuaI_110078()
	
	SetPlot( OwnerID() , "range" , "LuaI_110078_1" , 150 )
end

function LuaI_110078_1()
	if (CheckCompleteQuest( TargetID(), 420083 )==true )then
	BeginPlot( TargetID() , "LuaS_110078_0" , 0 )
	end
end

function LuaS_110078_0()
	local herID = GetName( TargetID() )
	local String_2 = "[SC_110078_0][$SETVAR1="..herID.."]"
	Sleep(20)
	Npcsay(OwnerID(),String_2) 
	Sleep(400)
end

---------------------------------- 席德 ----------------------------------------
function LuaI_110497()
	BeginPlot( TargetID() , "LuaSS_110497_0" , 0 )
end

function LuaSS_110497_0()
	while 1 do
	Npcsay(OwnerID(),GetString("SC_110497_0")) --想要保持健壯的好身材，就是要每天在陽光底下，工作工作工作。
	Sleep(59800)
	end
end

----------------------------------  小女孩 ----------------------------------------

function LuaI_110009()
	BeginPlot( TargetID() , "LuaSS_110009_0" , 0 )
end

function LuaSS_110009_0()
	while 1 do	
	Npcsay(OwnerID(),GetString("SC_110009_0")) --來追我呀～來追我呀～來追我呀～
	Sleep(3600)
	end
end

----------------------------------  哈伯特(狗) ----------------------------------------

function LuaI_110269()
--	if ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) > 999 then
--		return 
--	else
--		while 1 do
--			if GetSystime( 2 ) == 0 then
--				if( GetServerDataLanguage() == "enus" or GetServerDataLanguage() == "de"  or GetServerDataLanguage() == "eneu" ) then 
--				local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
--				local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
--					if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
--						RunningMsg( OwnerID() , 2 , "[SC_OFFICIAL_NOTICE_001]" ) 	
--					end
--				end
--			end
--			sleep(310)
--		end
--	end
	BeginPlot( TargetID() , "LuaSS_110269_0" , 0 )
end

function LuaSS_110269_0()
	while 1 do
	Npcsay(OwnerID(),GetString("SC_110269_0")) --汪！汪！
	Sleep(3600)
	end
end

----------------------------------  村民(賣肉的) ----------------------------------------

function LuaI_110011()
	BeginPlot( TargetID() , "LuaSS_110011_0" , 0 )
end

function LuaSS_110011_0()
	while 1 do
	Npcsay(OwnerID(),GetString("SC_110011_0")) --新鮮的肉，鮮嫩多汁美味可口的肉，快來買唷～
	Sleep(4200)
	end
end

----------------------------------  村民(賣麵包的) ----------------------------------------
function LuaI_110012()
	BeginPlot( TargetID() , "LuaSS_110012_0" , 0 )
end

function LuaSS_110012_0()
	while 1 do
	Npcsay(OwnerID(),GetString("SC_110012_0")) --剛出爐，熱騰騰香噴噴的麵包，各種口味都有喔～
	Sleep(4390)
	end
end


----------------------------------  伍茲----------------------------------------
function LuaI_111352()
	BeginPlot( TargetID() , "LuaIS_111352_0" , 0 )
	BeginPlot( OwnerID() , "LuaYU_PlayMusic_2" , 0 )

end

function LuaIS_111352_0()
	while 1 do
	Npcsay(OwnerID(),GetString("SC_111352_5")) --我是一個快樂的吟唱詩人～嘿嘿呦～嘿嘿呦～(唱)太陽下山回家吃晚餐～咚咚咚～咚咚咚～(唱)
	Sleep(3600)
	end
end
----------------------------------  米拉亞----------------------------------------
function LuaI_110053()
	BeginPlot( TargetID() , "LuaIS_110053_0" , 0 )
end

function LuaIS_110053_0()
	while 1 do
	Npcsay(OwnerID(),GetString("SC_110053_0")) --
	Sleep(6580)
	end
end
